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

class Review extends oxUBase
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
        $this->aViewData["reviews"]         = $this->oProduct->GetReviews();
        $this->aViewData["crossselllist"]   = $this->oProduct->GetCrossSelling();
        $this->aViewData["similarlist"]     = $this->oProduct->GetSimilarProducts();
        
        parent::render();
        
        return "review.tpl";
    }
    
    function savereview()
    {   global $myConfig;
        global $mySession;
    
        $sReviewText    = $myConfig->getParameter("rvw_txt");
        $soxnid         = $myConfig->getParameter("anid");
        $sUserID        = $mySession->getVar("usr");
        
        $oReview = &oxNew( "oxreview", "core");
        $oReview->oxreviews__oxparentid->value  = $soxnid;
        $oReview->oxreviews__oxtext->value      = $sReviewText;
        $oReview->oxreviews__oxshopid->value    = $myConfig->getShopId();
        $oReview->oxreviews__oxuserid->value    = $sUserID;
        $oReview->save();
        
        return "details";
    }
    
}

?>
