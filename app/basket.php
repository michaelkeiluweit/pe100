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

class Basket extends oxUBase
{
    var $oBasket    = null;
    var $oTopOffer  = null;

    function init()
    {   global $myConfig;
        global $mySession;

        parent::init();
        
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $this->oTopOffer = @current( $oArtList->aList);
    }

    function render()
    {   global $myConfig;
        global $mySession;

        parent::render();

        $this->oBasket = $mySession->getVar( "basket");
        
        $this->aViewData['toparticle'] = $this->oTopOffer;
        
        $oSimilarProduct = null;
        
        $this->oBasket->oProductList = array();

        if( isset( $this->oBasket->iCntProducts) && $this->oBasket->iCntProducts)
        {
            reset( $this->oBasket->aBasketContents);
            while (list($key, $oContent) = each( $this->oBasket->aBasketContents))
            {   // load basket items
                $oProd = &oxNew( "oxarticle", "core");
                $oProd->Load( $oContent->sProduct);
                
                $oContent->oProduct     = $oProd;
                $oContent->selectlist   = $oContent->oProduct->GetSelectLists();
                // set selected
                if( $oContent->selectlist && $oContent->aSelList)
                {   while (list($conkey, $oSel) = each( $oContent->aSelList))
                        $oContent->selectlist[$conkey][$oSel]->selected = 1;
                }

                $this->oBasket->aBasketContents[$key] = $oContent;
                $this->oBasket->oProductList[$oContent->sProduct] = $oProd;
                if( !$oSimilarProduct)
                    $oSimilarProduct = &$oProd;
            }
            if( $oSimilarProduct && $myConfig->IsAddSales())
                $this->aViewData["similarlist"] = $oSimilarProduct->GetSimilarProducts();
        }
        
        //print_r( $this->oBasket);
        
        $this->aViewData["basket"]  = $this->oBasket;

        return "basket.tpl";
    }
    
}

?>
