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
require_once( "discount_main.php");

class vat_main extends Discount_main
{
    function render()
    {   global $myConfig;

        parent::render();

        return "vat_main.tpl";
    }
    
    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxdiscount__oxshopid'] = $sShopID;

        $oAttr = &oxNew( "oxdiscount", "core");
        if( $soxId != "-1")
            $oAttr->Load( $soxId);
        else
            $aParams['oxdiscount__oxid'] = null;
        // checkbox handling
        if( !isset( $aParams['oxdiscount__oxactiv']))
            $aParams['oxdiscount__oxactiv'] = 0;

        // VAT    
        $aParams['oxdiscount__oxtype'] = "v";
        
        $aParams = $oAttr->ConvertNameArray2Idx( $aParams);
        $oAttr->Assign( $aParams);
        $oAttr = parent::ProcessFiles( $oAttr);
        $oAttr->Save();

        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oAttr->oxdiscount__oxid->value);
    }
}

?>
