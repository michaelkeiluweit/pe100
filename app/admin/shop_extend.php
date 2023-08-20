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

class Shop_extend extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");
        
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oShop = &oxNew( "oxshop", "core");
            $oShop->Load( $soxId);
            $this->aViewData["edit"] =  $oShop;
            
            // category choose list
            $oCatTree = &oxNew( "oxCategoryList", "core");
            $oCatTree->select();
            // add Root as fake category
            $oRoot->oxcategories__oxnid->value  = "oxrootid";
            $oRoot->oxcategories__oxtitle->value= "-- keine ausgewählt --";
            // rebuild list as we need the root entry at the first position
            $aNewList = array();
            $aNewList[] = $oRoot;
            while (list($key, $val) = each($oCatTree->aList))
            {   if( $val->oxcategories__oxnid->value == $oShop->oxshops__oxdefcat->value)
                    $val->selected = 1;
                $aNewList[] = $val;
            }
            $oCatTree->aList = $aNewList;
            $this->aViewData["cattree"]     =  $oCatTree;
        }
        
        return "shop_extend.tpl";
    }
    
    function save()
    {   global $myConfig;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $soxId);
        
        $aParams = $oShop->ConvertNameArray2Idx( $aParams);
        $oShop->Assign( $aParams);
        $oShop->Save();
    }
}

?>
