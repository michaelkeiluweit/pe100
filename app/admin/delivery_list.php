<?php
// // oxid eSales � NFQ GmbH 2003
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

class Delivery_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;

        $this->sListClass   = "oxdelivery";
        $this->sDefSort     = "oxdelivery.oxtitle";
        $this->sListType    = "oxdeliverylist";

        // create navigation
        $this->aEditNavigation = array();

        $oNavItem->name     = "Stamm";
        $oNavItem->location = "delivery_main";
        $this->aEditNavigation[] = $oNavItem;
        
		$this->iDefEdit = 0;

        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "delivery_main";
        
        return "delivery_list.tpl";
    }
}

?>
