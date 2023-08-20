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

class Details extends oxUBase
{
    var $oProduct   = null;

    function init()
    {   global $myConfig;

        parent::init();

        $soxnid = $myConfig->getParameter("anid");

        $this->oProduct = &oxNew( "oxarticle", "core");
        $this->oProduct->NLoad( $soxnid);
    }

    function render()
    {   global $myConfig;
        global $mySession;
        
        $this->aViewData["product"]         = $this->oProduct;
        if( $myConfig->IsReview())
            $this->aViewData["reviews"]         = $this->oProduct->GetReviews();
        if( $myConfig->IsAddSales())
        {   $this->aViewData["crossselllist"]   = $this->oProduct->GetCrossSelling();
            $this->aViewData["similarlist"]     = $this->oProduct->GetSimilarProducts();
            $this->aViewData["customerwho"]     = $this->oProduct->GetCustomerAlsoBoughtThisProducts();
        }
        if( $myConfig->IsVarianten())
            $this->aViewData["variants"]        = $this->oProduct->GetVariants();

        $this->aViewData["selectlist"]      = $this->oProduct->GetSelectLists();

        parent::render();
        
        $sTemplate = "details.tpl";
        if( $this->oProduct->oxarticles__oxtemplate->value)
        	$sTemplate = $this->oProduct->oxarticles__oxtemplate->value;
        
        return $sTemplate;
    }
    
}

?>
