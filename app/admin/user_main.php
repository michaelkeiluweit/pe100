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

class User_main extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        // all usergroups
        $oGroups = &oxNew( "oxlist", "core");
        $oGroups->Init( "oxbase");
        $oGroups->oLstoTpl->Init( array( "oxgroups"));
        $sSelect =  "select * from oxgroups";
        $oGroups->selectString( $sSelect);

        // User rights
        $aUserRights = array();
        $oShopRight->name   = "Benutzer";
        $oShopRight->id     = "user";
        $aUserRights[] = $oShopRight;
        $oShopRight->name   = "Mall Admin";
        $oShopRight->id     = "malladmin";
        $aUserRights[] = $oShopRight;
        $oShops = &oxNew( "oxshops", "core");
        foreach( $oShops->oAllShops->aList as $oShop)
        {   $oShopRight->name   = "Admin ( ".$oShop->oxshops__oxname->value." )";
            $oShopRight->id     = $oShop->oxshops__oxid->value;
            $aUserRights[]      = $oShopRight;
        }

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
            $oUser = &oxNew( "oxuser", "core");
            $oUser->Load( $soxId);
            $this->aViewData["edit"] =  $oUser;

            // remove already added groups
            foreach( $oUser->oGroups->aList as $sInGroup)
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

            // generate selected right
            while (list($key, $val) = each($aUserRights))
            {   if( $val->id == $oUser->oxuser__oxrights->value)
                {   $val->selected = 1;
                    $aUserRights[$key] = $val;
                    break;
                }
            }
        }

        $this->aViewData["allgroups"] =  $oGroups;
        $this->aViewData["rights"] =  $aUserRights;

        return "user_main.tpl";
    }

    function save()
    {   global $myConfig;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxuser__oxactiv']))
            $aParams['oxuser__oxactiv'] = 0;

        $oUser = &oxNew( "oxuser", "core");
        if( $soxId != "-1")
            $oUser->Load( $soxId);
        else
            $aParams['oxuser__oxid'] = null;
        $aParams = $oUser->ConvertNameArray2Idx( $aParams);
        $oUser->Assign( $aParams);
        $oUser->Save();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oUser->oxuser__oxid->value);
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