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

class Shop_overview extends oxAdminView
{
    function render()
    {   global $myConfig;
        global $blIsMallAdmin;
        global $mySession;

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oShop = &oxNew( "oxshop", "core");
            $oShop->Load( $soxId);
            $this->aViewData["edit"] =  $oShop;
            $mySession->setVar( "actshop", $soxId);
        }

        parent::render();
        
        $blIsMallAdmin = $mySession->getVar( "malladmin");
        $this->aViewData["malladmin"] = $blIsMallAdmin;

        return "shop_overview.tpl";
    }

}

?>
