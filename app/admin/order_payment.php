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

class Order_payment extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oOrder = &oxNew( "oxorder", "core");
            $oOrder->Load( $soxId);
            
	        $oPayment = &oxNew( "oxpayment", "core");
	        $oPayment->Load( $oOrder->oxorder__oxpaymentid->value);
            $oOrder->Payment = $oPayment->oxpayments__oxdesc->value;
            $oOrder->aDynValues = AssignValuesFromText( $oOrder->oxorder__oxpaymentval->value);
            
            $this->aViewData["edit"] =  $oOrder;
        }

        return "order_payment.tpl";
    }
    
    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aDynvalues = $myConfig->getParameter( "dynvalue");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxorder__oxshopid'] = $sShopID;

        $oOrder = &oxNew( "oxorder", "core");
        $oOrder->Load( $soxId);
		$oOrder->oxorder__oxpaymentval->value = AssignValuesToText( $aDynvalues);
        $oOrder->Save();
    }
    

}

?>