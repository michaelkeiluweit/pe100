<?php
// // oxid eSales © NFQ GmbH 2003
//
// Diese Software ist urheberrechtlich geschuetzt - sie ist
// KEINE Freeware.
//
// Die unerlaubte Verwendung dieser Software ohne gueltigen 
// Lizenzschluessel ist ein ein Verstoss gegen die Lizenz-
// bedingungen und wird straf- bzw. auch zivilrechtlich verfolgt.
//
// http://www.nfq-esales.de

require_once( "../oxconfig.php");
$myConfig->blAdmin = true;
require( "inc/auth.inc.php");
require_once( "oxadminview.php");

class Newsletter_selection extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        // all newslettergroups
        $oGroups = &oxNew( "oxlist", "core");
        $oGroups->Init( "oxbase");
        $oGroups->oLstoTpl->Init( array( "oxgroups"));
        $sSelect =  "select * from oxgroups";
        $oGroups->selectString( $sSelect);


        $soxId = $myConfig->getParameter( "oxid");
        // check if we right now saved a new entry
        $sSavedID = $myConfig->getParameter( "saved_oxid");
        if( ($soxId == "-1" || !isset( $soxId)) && isset( $sSavedID) )
        {   $soxId = $sSavedID;
            $myConfig->delParameter( "saved_oxid");
            $this->aViewData["oxid"] =  $soxId;
            // for reloading upper frame
            $this->aViewData["updatelist"] =  "1";
        }

        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oNewsletter = &oxNew( "oxnewsletter", "core");
            $oNewsletter->Load( $soxId);
            $this->aViewData["edit"] =  $oNewsletter;

            // remove already added groups
            foreach( $oNewsletter->oGroups->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->oxgroups__oxid->value;
                reset( $oGroups->aList);
                while (list($key, $val) = each($oGroups->aList))
                {   if( $val->oxgroups__oxid->value == $sSearchKey)
                    {   // already in, so lets remove it
                        unset( $oGroups->aList[$key]);
                        break;
                    }
                }
            }
            
            // get nr. of users in these groups
	        // we do not use lists here as we dont need this overhead right now
    	    $oDB = GetDB();
        	$sSelect =  "select oxuser.oxusername from oxuser left join oxobject2group on oxobject2group.OXOBJECTID = oxuser.oxid where oxobject2group.oxgroupsid in ( ";
        	$blSep = false;
            foreach( $oNewsletter->oGroups->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->oxgroups__oxid->value;
            	if( $blSep)
            		$sSelect .= ",";
        		$sSelect .= "'$sSearchKey'";
        		$blSep = true;
            }
        	$sSelect .= ") and oxuser.oxactiv = 1 and oxuser.oxdboptin = 1 group by oxuser.oxid";
        	$rs = $oDB->Execute( $sSelect);
			$iCnt = 0;
	        if ($rs != false && $rs->RecordCount() > 0)
	        {   while (!$rs->EOF)
	            {   $iCnt++;
	                $rs->MoveNext();
	            }
	        }
        	$this->aViewData["user"] =  $iCnt;
        }

        $this->aViewData["allgroups"] =  $oGroups;

        return "newsletter_selection.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxnewsletter__oxshopid'] = $sShopID;

        $oNewsletter = &oxNew( "oxnewsletter", "core");
        if( $soxId != "-1")
            $oNewsletter->Load( $soxId);
        else
            $aParams['oxnewsletter__oxid'] = null;
        $aParams = $oNewsletter->ConvertNameArray2Idx( $aParams);
        $oNewsletter->Assign( $aParams);
        $oNewsletter->Save();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oNewsletter->oxnewsletter__oxid->value);
    }

    function removegroup()
    {   global $myConfig;

        $aRemoveGroups  = $myConfig->getParameter( "groups");
        $soxId          = $myConfig->getParameter( "oxid");

        if( isset( $aRemoveGroups) && $aRemoveGroups)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2group"));
            $sSelect =  "select * from oxobject2group ";
            $sSelect .= "where oxobject2group.oxobjectid='$soxId' and ";
            $blSep = false;
            foreach($aRemoveGroups as $sRemgroup)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2group.OXGROUPSID = '$sRemgroup'";
                $blSep = true;
            }
            $sSelect .= ")";
            $oGroups->selectString( $sSelect);
            foreach($oGroups->aList as $sRemgroup)
                $sRemgroup->delete();
        }
    }

    function addgroup()
    {   global $myConfig;

        $aAddGroups  = $myConfig->getParameter( "allgroups");
        $soxId       = $myConfig->getParameter( "oxid");

        if( isset( $aAddGroups) && $aAddGroups)
        {   foreach($aAddGroups as $sAddgroup)
            {   $oNewGroup = &oxNew( "oxbase", "core");
                $oNewGroup->Init( array( "oxobject2group"));
                $oNewGroup->oxobject2group__oxobjectid->value   = $soxId;
                $oNewGroup->oxobject2group__oxgroupsid->value = $sAddgroup;
                $oNewGroup->Save();
            }
        }
    }

}

?>
