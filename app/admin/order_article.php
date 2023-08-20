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

class Order_article extends oxAdminView
{

    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oOrder = &oxNew( "oxorder", "core");
            $oOrder->Load( $soxId);
            
            // calculate
            $dNetSum 	= 0;
            $dBrutSum	= 0;
        	$oCur = $myConfig->getActShopCurrencyObject();
            
            while (list($key, $oOrderArt) = each( $oOrder->oArticles->aList))
            {	$dNetSum 	+= $oOrderArt->oxorderarticles__oxnetprice->value * $oOrderArt->oxorderarticles__oxamount->value;
            	$dBrutSum	+= $oOrderArt->oxorderarticles__oxbrutprice->value* $oOrderArt->oxorderarticles__oxamount->value;
            	$oOrderArt->fnetprice 		= FormatCurrency( $oOrderArt->oxorderarticles__oxnetprice->value, $oCur);
            	$oOrderArt->fbrutprice 		= FormatCurrency( $oOrderArt->oxorderarticles__oxbrutprice->value, $oCur);
            	$oOrderArt->ftotbrutprice	= FormatCurrency( $oOrderArt->oxorderarticles__oxbrutprice->value * $oOrderArt->oxorderarticles__oxamount->value, $oCur);
            	$oOrder->oArticles->aList[$key] = $oOrderArt;
            }
            $oOrder->totalnetsum 	= FormatCurrency( $dNetSum, $oCur);
            $oOrder->totalbrutsum 	= FormatCurrency( $dBrutSum, $oCur);
            
            
            $this->aViewData["edit"] =  $oOrder;
        }

        return "order_article.tpl";
    }

}

?>
