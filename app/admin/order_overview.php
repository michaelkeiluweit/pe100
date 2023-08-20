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

class Order_overview extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oOrder = &oxNew( "oxorder", "core");
            $oOrder->Load( $soxId);
            $this->aViewData["edit"] =  $oOrder;
        }
        
        // orders today
        $timeout = time();
        $iDay   = date("d", $timeout);
        $iMonth = date("m", $timeout);
        $iYear  = date("Y", $timeout);

        $oLists = &oxNew( "oxlist", "core");
        $oLists->Init( "oxbase");
        $oLists->oLstoTpl->Init( array( "oxorder", "oxorderarticles"));
        $sSelect =  "select * from oxorder left join oxorderarticles on oxorder.oxid=oxorderarticles.oxorderid ";
        $sSelect .= "where dayofmonth(oxorder.oxorderdate) = $iDay and month(oxorder.oxorderdate) = $iMonth and year(oxorder.oxorderdate) = $iYear";
        $oLists->selectString( $sSelect);
        $iCnt = 0;
        $dSum = 0;
        foreach( $oLists->aList as $oOrder)
        {   $iCnt++;
            $dSum += $oOrder->oxorderarticles__oxbrutprice->value * $oOrder->oxorderarticles__oxamount->value;
        }

        $oCur = $myConfig->getActShopCurrencyObject();
        $this->aViewData["ordersum"] = FormatCurrency( $dSum, $oCur);
        $this->aViewData["ordercnt"] = $iCnt;

        // ALL orders
        $oLists = &oxNew( "oxlist", "core");
        $oLists->Init( "oxbase");
        $oLists->oLstoTpl->Init( array( "oxorder", "oxorderarticles"));
        $sSelect =  "select * from oxorder left join oxorderarticles on oxorder.oxid=oxorderarticles.oxorderid ";
        $oLists->selectString( $sSelect);
        $iCnt = 0;
        $dSum = 0;
        foreach( $oLists->aList as $oOrder)
        {   $iCnt++;
            $dSum += $oOrder->oxorderarticles__oxbrutprice->value * $oOrder->oxorderarticles__oxamount->value;
        }

        $oCur = $myConfig->getActShopCurrencyObject();
        $this->aViewData["ordertotalsum"] = FormatCurrency( $dSum, $oCur);
        $this->aViewData["ordertotalcnt"] = $iCnt;

        return "order_overview.tpl";
    }
    
    function exportlex()
    {
    	$oImex = &oxNew( "oximex", "core");
    	$oImex->Init( "lexware");
    	$oImex->exportLexwareOrders();
    }
    
    function createPDF()
    {   global $myConfig;
    
        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oOrder = &oxNew( "oxorder", "core");
            $oOrder->Load( $soxId);
            
            $sFilename = $oOrder->oxorder__oxordernr->value."_".$oOrder->oxorder__oxbilllname->value.".pdf";
            $oOrder->GenPDF( $sFilename);
            exit();
        }

    }
    

}

?>
