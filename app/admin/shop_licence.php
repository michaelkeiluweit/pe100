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

class Shop_licence extends oxAdminView
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
            $oShop = &oxNew( "oxshop", "core");
            $oShop->Load( $soxId);
            $this->aViewData["edit"] =  $oShop;
        }
        
        return "shop_licence.tpl";
    }

    function save()
    {   global $myConfig;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        $oShop = &oxNew( "oxshops", "core");
        $oShop->Load( $soxId);

        // checkbox handling
        $aParams['oxshops__oxactiv'] = $oShop->oxshops__oxactiv->value;

        $aParams = $oShop->ConvertNameArray2Idx( $aParams);
        $oShop->Assign( $aParams);
        $oShop->Save();
    }

}

?>
