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

class Order_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;

        $this->sListClass   = "oxorder";
        $this->sDefSort     = "oxorder.oxorderdate";
        $this->sListType    = "oxlist";
        $this->blDesc		= true;

        // create navigation
        $this->aEditNavigation = array();
        $oNavItem->name     = "&Uuml;bersicht";
        $oNavItem->location = "order_overview";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Stamm";
        $oNavItem->location = "order_main";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Zahlung";
        $oNavItem->location = "order_payment";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Artikel";
        $oNavItem->location = "order_article";
        $this->aEditNavigation[] = $oNavItem;

        $this->iDefEdit = 0;

        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "order_overview";

        return "order_list.tpl";
    }
}

?>
