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

class MallCategory_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;
        
        $this->sListClass   = "oxcategory";
        $this->sDefSort     = "oxcategories.oxorder";

        // create navigation
        $this->aEditNavigation = array();

        $oNavItem->name     = "Stamm";
        $oNavItem->location = "mallcategory_main";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Bilder";
        $oNavItem->location = "mallcategory_pictures";
        $this->aEditNavigation[] = $oNavItem;
        
		$this->iDefEdit = 0;
        
        $mySession->setVar( "actshop", "oxbaseshop");

        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "mallcategory_main";

        return "mallcategory_list.tpl";
    }
    
    function BuildWhere()
    {   global $myConfig;
        $aWhere = array();

        $aWhere  = $myConfig->getParameter( "where");
        if( isset( $aWhere) && $aWhere)
        {   while (list($name, $value) = each($aWhere))
                if( $value)
                    $this->aWhere[$name] = "%".$value."%";
        }

        $this->aWhere['oxcategories.oxtype']    = 1;
        
        return $this->aWhere;
    }

}

?>
