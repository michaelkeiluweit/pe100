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

class Category_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;

        $this->sListClass   = "oxcategory";
        $this->sDefSort     = "oxcategories.oxorder";
        $this->sListType    = "oxcategorylist";

        // create navigation
        $this->aEditNavigation = array();
        /*$oNavItem->name     = "&Uuml;bersicht";
        $oNavItem->location = "category_overview";
        $this->aEditNavigation[] = $oNavItem;*/

        $oNavItem->name     = "Stamm";
        $oNavItem->location = "category_main";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Bilder";
        $oNavItem->location = "category_pictures";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Sortierung";
        $oNavItem->location = "category_order";
        $this->aEditNavigation[] = $oNavItem;
        
        $this->iDefEdit = 0;

        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "category_main";
        
        // parent categorie tree
        $oCatTree = &oxNew( "oxCategoryList", "core");
        $oCatTree->select();
        // add Root as fake category
        // rebuild list as we need the root entry at the first position
        $aNewList = array();
        $oRoot->oxcategories__oxnid->value  = null;
        $oRoot->oxcategories__oxtitle->value= "Alle anzeigen";
        $aNewList[] = $oRoot;
        $oRoot->oxcategories__oxnid->value  = "oxrootid";
        $oRoot->oxcategories__oxtitle->value= "-- root cat. --";
        $aNewList[] = $oRoot;
        while (list($key, $val) = each($oCatTree->aList))
            $aNewList[] = $val;
        $oCatTree->aList = $aNewList;
        $aWhere  = $myConfig->getParameter( "where");
        if( isset( $aWhere) && $aWhere)
        {   while (list($key, $val) = each($oCatTree->aList))
            {   if( $val->oxcategories__oxnid->value == $aWhere['oxcategories.oxparentid'])
                {   $val->selected = 1;
                    $oCatTree->aList[$key] = $val;
                }
            }
        }
        $this->aViewData["cattree"] =  $oCatTree;


        return "category_list.tpl";
    }
}

?>
