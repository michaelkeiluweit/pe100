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

class Usergroup_main extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();
    
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
            $oGroup = &oxNew( "oxusergroup", "core");
            $oGroup->Load( $soxId);
            $this->aViewData["edit"] =  $oGroup;

            // all members
            $oMembers = $oGroup->GetMembers();
            $this->aViewData["members"] = $oMembers;

            // all users
            $oUsers = &oxNew( "oxlist", "core");
            $oUsers->Init( "oxbase");
            $oUsers->oLstoTpl->Init( array( "oxuser"));
            $sSelect =  "select * from oxuser order by oxuser.oxlname";
            $oUsers->selectString( $sSelect);

            // remove already added users
            foreach( $oMembers->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->oxuser__oxid->value;
                reset( $oUsers->aList);
                while (list($key, $val) = each($oUsers->aList))
                {   if( $val->oxuser__oxid->value == $sSearchKey)
                    {   // already in, so lets remove it
                        unset( $oUsers->aList[$key]);
                        break;
                    }
                }
            }

            $this->aViewData["users"] = $oUsers;

        }

        return "usergroup_main.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxgroups__oxactiv']))
            $aParams['oxgroups__oxactiv'] = 0;

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxgroups__oxshopid'] = $sShopID;

        $oGroup = &oxNew( "oxusergroup", "core");
        if( $soxId != "-1")
            $oGroup->Load( $soxId);
        else
            $aParams['oxgroups__oxid'] = null;
        $aParams = $oGroup->ConvertNameArray2Idx( $aParams);
        $oGroup->Assign( $aParams);
        $oGroup->Save();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oGroup->oxgroups__oxid->value);
    }

    function removeuser()
    {   global $myConfig;

        $aRemoveUsers  = $myConfig->getParameter( "members");
        $soxId          = $myConfig->getParameter( "oxid");

        if( isset( $aRemoveUsers) && $aRemoveUsers)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2group"));
            $sSelect =  "select * from oxobject2group ";
            $sSelect .= "where oxobject2group.oxgroupsid='$soxId' and ";
            $blSep = false;
            foreach($aRemoveUsers as $sRemuser)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2group.oxobjectid = '$sRemuser'";
                $blSep = true;
            }
            $sSelect .= ")";
            $oGroups->selectString( $sSelect);
            foreach($oGroups->aList as $sRemgroup)
                $sRemgroup->delete();
        }
    }

    function adduser()
    {   global $myConfig;

        $aAddUsers  = $myConfig->getParameter( "allusers");
        $soxId       = $myConfig->getParameter( "oxid");

        if( isset( $aAddUsers) && $aAddUsers)
        {   foreach($aAddUsers as $sAdduser)
            {   $oNewGroup = &oxNew( "oxbase", "core");
                $oNewGroup->Init( array( "oxobject2group"));
                $oNewGroup->oxobject2group__oxobjectid->value = $sAdduser;
                $oNewGroup->oxobject2group__oxgroupsid->value = $soxId;
                $oNewGroup->Save();
            }
        }
    }


}

?>
