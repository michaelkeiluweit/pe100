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

class Payment_main extends oxAdminView
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
            $oPayment = &oxNew( "oxpayment", "core");
            $oPayment->Load( $soxId);
            $this->aViewData["edit"] =  $oPayment;

            // remove already added groups
            foreach( $oPayment->oGroups->aList as $sInGroup)
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
        }

        $this->aViewData["allgroups"] =  $oGroups;

        return "payment_main.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxpayments__oxactiv']))
            $aParams['oxpayments__oxactiv'] = 0;

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxpayments__oxshopid'] = $sShopID;

        $oPayment = &oxNew( "oxpayment", "core");
        if( $soxId != "-1")
            $oPayment->Load( $soxId);
        else
            $aParams['oxpayment__oxid'] = null;
        $aParams = $oPayment->ConvertNameArray2Idx( $aParams);
        $oPayment->Assign( $aParams);
        $oPayment->Save();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oPayment->oxpayments__oxid->value);
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
