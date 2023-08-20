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


require_once( "ubase.php");

class Mallstart extends oxUBase
{
    var $oCategoryTree = null;

    function init()
    {   global $mySession;

        $mySession->setVar( "actshop", "oxbaseshop");
        $mySession->setVar( "mallcat", 1);
        
        parent::init();
    }

    function render()
    {   global $myConfig;
    
        parent::render();
        
        // load shops in active category
        $sActCat    = $myConfig->getParameter("cnid");
        $oShoplist = &oxNew( "oxlist", "core");
        $oShoplist->Init( "oxbase");
        $oShoplist->oLstoTpl->Init( array( "oxshops", "oxobject2category"));
        $sSelect  = "select * from oxshops left join oxobject2category on oxshops.oxid=oxobject2category.oxobjectid ";
        $sSelect .= "where oxobject2category.oxcatnid = '$sActCat' ";
        $oShoplist->selectString( $sSelect);
        
        $this->aViewData['shopList'] = $oShoplist->aList;
        
        return "mallstart.tpl";
    }
    
    function chshp()
    {   global $mySession;
        global $myConfig;
    
        $sActShop = $myConfig->getParameter("shp");
        $mySession->setVar( "actshop", $sActShop);
        
        return "start";
    }
}

?>
