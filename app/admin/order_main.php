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

class Order_main extends oxAdminView
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
            $oOrder = &oxNew( "oxorder", "core");
            $oOrder->Load( $soxId);
            
            $this->aViewData["edit"] =  $oOrder;
            
        }

        return "order_main.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxorder__oxshopid'] = $sShopID;

        $oOrder = &oxNew( "oxorder", "core");
        if( $soxId != "-1")
            $oOrder->Load( $soxId);
        else
            $aParams['oxorder__oxid'] = null;
        $aParams = $oOrder->ConvertNameArray2Idx( $aParams);
        $oOrder->Assign( $aParams);
        $oOrder->Save();

        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oOrder->oxorder__oxid->value);
    }
}

?>
