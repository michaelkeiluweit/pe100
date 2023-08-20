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

class User_payment extends oxAdminView
{
    var $blDelete = false;

    function render()
    {   global $myConfig;

        parent::render();

        // all paymenttypes
        $oPaymentTypes = &oxNew( "oxlist", "core");
        $oPaymentTypes->Init( "oxbase");
        $oPaymentTypes->oLstoTpl->Init( array( "oxpayments"));
        $sSelect =  "select * from oxpayments";
        $oPaymentTypes->selectString( $sSelect);

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oUser = &oxNew( "oxuser", "core");
            $oUser->Load( $soxId);

            // load payment
            $soxPaymentId = $myConfig->getParameter( "oxpaymentid");
            if( (!$soxPaymentId || $this->blDelete) && isset( $oUser->oPayments->aList[0]))
                $soxPaymentId = $oUser->oPayments->aList[0]->oxuserpayments__oxid->value;
            if( $soxPaymentId != "-1" && isset( $soxPaymentId))
            {   $oUserPayment = &oxNew( "oxbase", "core");
                $oUserPayment->Init( array( "oxuserpayments"));
                $oUserPayment->Load( $soxPaymentId);
                $sTemplate = $oUserPayment->oxuserpayments__oxvalue->value;
                // generate selected paymenttype
                while (list($key, $val) = each($oPaymentTypes->aList))
                {   if( $val->oxpayments__oxid->value == $oUserPayment->oxuserpayments__oxpaymentsid->value)
                    {   $val->selected = 1;
                        $oPaymentTypes->aList[$key] = $val;
                        // if there are no values assigned we set default from paymenttype
                        if( !$sTemplate)
                            $sTemplate = $val->oxpayments__oxvaldesc->value;
                        break;
                    }
                }
                $oUserPayment->aDynValues = AssignValuesFromText( $sTemplate);
                $this->aViewData["edit"] =  $oUserPayment;

            }
            if( !$soxPaymentId)
                $soxPaymentId = "-1";
            $this->aViewData["oxpaymentid"]    = $soxPaymentId;

            $this->aViewData["paymenttypes"]    = $oPaymentTypes->aList;

            // generate selected
            reset($oUser->oPayments->aList);
            while (list($key, $val) = each($oUser->oPayments->aList))
            {    if( $val->oxuserpayments__oxid->value == $soxPaymentId)
               {   $val->selected = 1;
                   $oUser->oPayments->aList[$key] = $val;
                   break;
               }
            }

            $this->aViewData["edituser"] =  $oUser;
        }

        return "user_payment.tpl";
    }

    function save()
    {   global $myConfig;

        $aParams    = $myConfig->getParameter( "editval");
        $aDynvalues = $myConfig->getParameter( "dynvalue");

        if( isset($aDynvalues))
        {   // store the dynvalues
            $aParams['oxuserpayments__oxvalue'] = AssignValuesToText( $aDynvalues);
        }

        $oAdress = &oxNew( "oxbase", "core");
        $oAdress->Init( array( "oxuserpayments"));

        if( $aParams['oxuserpayments__oxid'] == "-1")
            $aParams['oxuserpayments__oxid'] = null;
        $aParams = $oAdress->ConvertNameArray2Idx( $aParams);
        $oAdress->Assign( $aParams);
        $oAdress->Save();
    }

    function DelPayment()
    {    global $myConfig;

        $aParams        = $myConfig->getParameter( "editval");

        $oAdress = &oxNew( "oxbase", "core");
        $oAdress->Init( array( "oxuserpayments"));

        if( $aParams['oxuserpayments__oxid'] != "-1")
        {
            $oAdress->Load( $aParams['oxuserpayments__oxid']);
            $oAdress->delete();
            $this->blDelete = true;
        }
    }

}

?>