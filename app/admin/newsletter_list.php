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

class Newsletter_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;

        $this->sListClass   = "oxnewsletter";
        $this->sDefSort     = "oxnewsletter.oxtitle";

        // create navigation
        $this->aEditNavigation = array();
        $oNavItem->name     = "HTML";
        $oNavItem->location = "newsletter_main";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "TEXT";
        $oNavItem->location = "newsletter_plain";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Vorschau";
        $oNavItem->location = "newsletter_preview";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Selektion";
        $oNavItem->location = "newsletter_selection";
        $this->aEditNavigation[] = $oNavItem;
        
        $this->iDefEdit = 0;
        
        parent::Init();

    }

    function render()
    {   global $myConfig;

        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "newsletter_main";

        return "newsletter_list.tpl";
    }
}

?>