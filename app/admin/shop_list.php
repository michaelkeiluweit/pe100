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

class Shop_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;

        $this->sListClass   = "oxshop";
        $this->sDefSort     = "oxshops.oxname";

        // create navigation
        $this->aEditNavigation = array();
        /*$oNavItem->name     = "&Uuml;bersicht";
        $oNavItem->location = "shop_overview";
        $this->aEditNavigation[] = $oNavItem;*/

        $oNavItem->name     = "Stamm";
        $oNavItem->location = "shop_main";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Erweitert";
        $oNavItem->location = "shop_extend";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Lizenz";
        $oNavItem->location = "shop_licence";
        $this->aEditNavigation[] = $oNavItem;

        $this->iDefEdit = 0;

        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "shop_main";

        return "shop_list.tpl";
    }

    function BuildWhere()
    {   // we override this to add our shop if we are not malladmin
        global $mySession;

        $this->aWhere = parent::BuildWhere();

        $blIsMallAdmin = $mySession->getVar( "malladmin");
        if( !$blIsMallAdmin)
        {   // we only allow to see our shop
            $sShopID = $mySession->getVar( "actshop");
            $this->aWhere['oxshops.oxid'] = "$sShopID";
        }

        return $this->aWhere;
    }

    function DeleteEntry()
    {   global $myConfig;

        // try to remove directories
        $soxId  = $myConfig->getParameter( "oxid");
        $sTarget= $myConfig->sShopDir . "/out/" . $soxId;
        DeleteDir( $sTarget);
        rmdir( $sTarget);

        parent::DeleteEntry();
    }

}

?>
