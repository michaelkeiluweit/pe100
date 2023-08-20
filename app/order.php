<?php
// // oxid eSales � NFQ GmbH 2003
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

class Order extends oxUBase
{
    var $oBasket        = null;

    function init()
    {   global $myConfig;
        global $mySession;

        // recalc basket cause of payment stuff
        $this->oBasket = $mySession->getVar( "basket");
        $this->oBasket->blCalcNeeded = true;
        $mySession->setVar( "basket", $this->oBasket);

        parent::init();
        
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $this->oTopOffer = @current( $oArtList->aList);
    }

    function render()
    {   global $myConfig;
        global $mySession;

        parent::render();

        $sPaymentid     = $myConfig->getParameter( "paymentid");
        $mySession->setVar( "paymentid", $sPaymentid);
        $aDynvalue      = $myConfig->getParameter( "dynvalue");
        $mySession->setVar( "dynvalue", $aDynvalue);

        $oPayment = &oxNew( "oxpayment", "core");
        $oPayment->Load( $sPaymentid);
        $this->aViewData["payment"] =  $oPayment;
        
        $this->oBasket = $mySession->getVar( "basket");
        // load products from basket
        $this->oBasket->oProductList = array();
        if( isset( $this->oBasket->iCntProducts) && $this->oBasket->iCntProducts)
        {   reset( $this->oBasket->aBasketContents);
            while (list($key, $oContent) = each( $this->oBasket->aBasketContents))
            {
                $oProd = &oxNew( "oxarticle", "core");
                $oProd->Load( $oContent->sProduct);
                $oContent->oProduct = $oProd;
                
                $oContent->selectlist   = $oContent->oProduct->GetSelectLists();
                if( $oContent->selectlist && !$oContent->aSelList)
                {	// set default values
                	$oContent->aSelList = array();
                	while (list($conkey, $iSel) = each( $oContent->selectlist))
                		$oContent->aSelList[$conkey] = 0;
                }
                
                // set selected
                if( $oContent->selectlist && $oContent->aSelList)
                {   reset( $oContent->aSelList);
                	while (list($conkey, $iSel) = each( $oContent->aSelList))
                	{   $oContent->chosen_selectlist[$conkey]->name  = $oContent->selectlist[$conkey]['name'];
                		$oContent->chosen_selectlist[$conkey]->value = $oContent->selectlist[$conkey][$iSel]->name;
                	}
                }
                
                $this->oBasket->aBasketContents[$key] = $oContent;
                $this->oBasket->oProductList[$oContent->sProduct] = $oProd;
            }
        }
        $this->aViewData['toparticle'] = $this->oTopOffer;
        $this->aViewData["basket"]  = $this->oBasket;
        
        return "order.tpl";
    }
    
    function execute()
    {   global $myConfig;
        global $mySession;

        // get basket contents
        $this->oBasket  = $mySession->getVar( "basket");
        if( isset( $this->oBasket->iCntProducts) && $this->oBasket->iCntProducts)
        {   
        	// -----------------------------------------
        	// gather information about order
        	// -----------------------------------------
        	reset( $this->oBasket->aBasketContents);
            while (list($key, $oContent) = each( $this->oBasket->aBasketContents))
            {
                $oProd = &oxNew( "oxarticle", "core");
                $oProd->Load( $oContent->sProduct);
                $oContent->oProduct = $oProd;
                
                $oContent->selectlist   = $oContent->oProduct->GetSelectLists();
                if( $oContent->selectlist && !$oContent->aSelList)
                {	// set default values
                	$oContent->aSelList = array();
                	while (list($conkey, $iSel) = each( $oContent->selectlist))
                		$oContent->aSelList[$conkey] = 0;
                }
                // set selected
                if( $oContent->selectlist && $oContent->aSelList)
                {   while (list($conkey, $iSel) = each( $oContent->aSelList))
                	{   $oContent->chosen_selectlist[$conkey]->name  = $oContent->selectlist[$conkey]['name'];
                		$oContent->chosen_selectlist[$conkey]->value = $oContent->selectlist[$conkey][$iSel]->name;
                	}
                }
                
                $this->oBasket->aBasketContents[$key] = $oContent;
                $this->oBasket->oProductList[$oContent->sProduct] = $oProd;
            }
            
			// user information
			$sUserID 	= $mySession->getVar("usr");
			$oUser 		= &oxNew( "oxuser", "core");
	        $oUser->Load( $sUserID);
                      
	        // payment information
	        $sPaymentid     = $myConfig->getParameter( "paymentid");
	        $aDynvalue      = $myConfig->getParameter( "dynvalue");
	        $oPayment = &oxNew( "oxpayment", "core");
	        $oPayment->Load( $sPaymentid);
	        $oPayment->aDynValues = AssignValuesFromText( $oPayment->oxpayments__oxvaldesc->value);
	        while (list($key, $oVal) = each( $oPayment->aDynValues))
	        {	$oVal->value = $aDynvalue[$oVal->name];
	        	$oPayment->aDynValues[$key] = $oVal;
	        	$aDynVal[$oVal->name] = $oVal->value;
	        }
	        $sDynValues = "";
	        if( isset( $aDynVal))
	        	$sDynValues = AssignValuesToText( $aDynVal);
	        // Store this payment information, we might allow users later to
	        // reactivate already give payment informations
	        $oUserpayment = &oxNew( "oxbase", "core");
        	$oUserpayment->Init( array( "oxuserpayments"));
        	$oUserpayment->oxuserpayments__oxuserid->value		= $sUserID;
        	$oUserpayment->oxuserpayments__oxpaymentsid->value	= $sPaymentid;
        	$oUserpayment->oxuserpayments__oxvalue->value		= $sDynValues;
        	$oUserpayment->Save();
	        
			// delivery information
			$oDelAdress 	= null;
	        $soxAddressId   = $myConfig->getParameter( "deladrid");
	        
			if( isset( $soxAddressId) && $soxAddressId)
			{	$oDelAdress = &oxNew( "oxbase", "core");
				$oDelAdress->Init( array( "oxaddress"));
				$oDelAdress->Load( $soxAddressId);
			}
        	// -----------------------------------------
        	// information about order is complete here
        	// -----------------------------------------
			
			// Store the order into database
            // MK
			//$this->SaveOrder( &$this->oBasket, &$oUser, &$oDelAdress, $oPayment, $sDynValues);
			$this->SaveOrder( $this->oBasket, $oUser, $oDelAdress, $oPayment, $sDynValues);

        	return "thankyou";
        	//return "order";
        }		 
    }
    
    function SaveOrder( $oBasket, $oUser, $oDelAdress, $oPayment, $sDynValues)
    {	global $myConfig;
    	global $mySession;
    
		// create and save order
        $oOrder = &oxNew( "oxorder", "core");
        
        $oOrder->oxorder__oxuserid->value = $oUser->sOXID;
        // bill address
        $oOrder->oxorder__oxbillcompany->value 	= $oUser->oxuser__oxcompany->value;
		$oOrder->oxorder__oxbillfname->value 	= $oUser->oxuser__oxfname->value;
		$oOrder->oxorder__oxbilllname->value 	= $oUser->oxuser__oxlname->value;
		$oOrder->oxorder__oxbillstreet->value 	= $oUser->oxuser__oxstreet->value;
		$oOrder->oxorder__oxbilladdinfo->value 	= $oUser->oxuser__oxaddinfo->value;
		$oOrder->oxorder__oxbillcity->value 	= $oUser->oxuser__oxcity->value;
		$oOrder->oxorder__oxbillcountry->value 	= $oUser->oxuser__oxcountry->value;
		$oOrder->oxorder__oxbillzip->value 		= $oUser->oxuser__oxzip->value;
		$oOrder->oxorder__oxbillfon->value 		= $oUser->oxuser__oxfon->value;
		$oOrder->oxorder__oxbillfax->value 		= $oUser->oxuser__oxfax->value;
		$oOrder->oxorder__oxbillsal->value 		= $oUser->oxuser__oxsal->value;
		// delivery address
		if( $oDelAdress)
		{	// set delivery address
	        $oOrder->oxorder__oxdelcompany->value 	= $oDelAdress->oxaddress__oxcompany->value;
			$oOrder->oxorder__oxdelfname->value 	= $oDelAdress->oxaddress__oxfname->value;
			$oOrder->oxorder__oxdellname->value 	= $oDelAdress->oxaddress__oxlname->value;
			$oOrder->oxorder__oxdelstreet->value 	= $oDelAdress->oxaddress__oxstreet->value;
			$oOrder->oxorder__oxdeladdinfo->value 	= $oDelAdress->oxaddress__oxaddinfo->value;
			$oOrder->oxorder__oxdelcity->value 		= $oDelAdress->oxaddress__oxcity->value;
			$oOrder->oxorder__oxdelcountry->value 	= $oDelAdress->oxaddress__oxcountry->value;
			$oOrder->oxorder__oxdelzip->value 		= $oDelAdress->oxaddress__oxzip->value;
			$oOrder->oxorder__oxdelfon->value 		= $oDelAdress->oxaddress__oxfon->value;
			$oOrder->oxorder__oxdelfax->value 		= $oDelAdress->oxaddress__oxfax->value;
			$oOrder->oxorder__oxdelsal->value 		= $oDelAdress->oxaddress__oxsal->value;
		}
        // payment information
        $oOrder->oxorder__oxpaymentid->value	= $oPayment->oxpayments__oxid->value;
        $oOrder->oxorder__oxpaymentval->value	= $sDynValues;
        // delivery costs
        $oOrder->oxorder__oxdelcost->value		= $oBasket->ddeliverycost;
        // payment costs
        $oOrder->oxorder__oxpaycost->value		= $oBasket->dAddPaymentSum;
        
		// set ordernr.
        $oOrders = &oxNew( "oxlist", "core");
		$oOrders->Init( "oxbase");
        $oOrders->oLstoTpl->Init( array( "oxorder"));        
        $iLastOrderNr = $oOrders->GetMax( null, "oxordernr");
        $oOrder->oxorder__oxordernr->value = $this->GetNextOrderNr( $iLastOrderNr);
        
        $oOrder->Save();
        
        // store orderid
        $oBasket->sOrderID = $oOrder->sOXID;
        $mySession->setVar( "basket", $oBasket);
        
        $oOrder->articlelist = array();
        
        // add all the products we have on basket to the order
        foreach( $this->oBasket->aBasketContents as $oContent)
        {
        	
        	// selectlist ?
        	$sSelList = "";
        	
        	if( $oContent->aSelList)
        	{	// chosen selectionlists
                $oContent->selectlist   = $oContent->oProduct->GetSelectLists();
                // set selected
                if( $oContent->selectlist)
                {   $blSep = false;
                	while (list($conkey, $iSel) = each( $oContent->aSelList))
                	{   if( $blSep)
                			$sSelList .= ", ";
                		$sSelList .= $oContent->selectlist[$conkey]['name'] ." : ". $oContent->selectlist[$conkey][$iSel]->name;
                		$blSep = true;
                	}
                }
        	}
        	
	        $oOrderArticle = &oxNew( "oxbase", "core");
        	$oOrderArticle->Init( array( "oxorderarticles"));
        	$oOrderArticle->oxorderarticles__oxorderid->value 	= $oOrder->sOXID;
        	$oOrderArticle->oxorderarticles__oxartid->value		= $oContent->sProduct;
        	$oOrderArticle->oxorderarticles__oxamount->value	= $oContent->dAmount;
        	$oOrderArticle->oxorderarticles__oxartnum->value	= $oContent->oProduct->oxarticles__oxartnum->value;
        	$oOrderArticle->oxorderarticles__oxtitle->value		= $oContent->oProduct->oxarticles__oxtitle->value;
        	$oOrderArticle->oxorderarticles__oxshortdesc->value	= $oContent->oProduct->oxarticles__oxshortdesc->value;
        	$oOrderArticle->oxorderarticles__oxselvariant->value= $sSelList;
        	$oOrderArticle->oxorderarticles__oxnetprice->value	= $oContent->oProduct->netPrice;
        	$oOrderArticle->oxorderarticles__oxbrutprice->value	= $oContent->oProduct->price;
        	$oOrderArticle->oxorderarticles__oxvat->value		= $oContent->oProduct->vatPercent;
        	$oOrderArticle->Save();
        	// add information for eMail
        	$oOrderArticle->oProduct	= $oContent->oProduct;
        	$oOrder->articlelist[] 		= $oOrderArticle;
        	
        	// decrement stock if there is any
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $oContent->sProduct);
            if( $oArticle->oxarticles__oxstock->value > 0)
            {
            	$oArticle->oxarticles__oxstock->value = max( 0, $oArticle->oxarticles__oxstock->value - $oContent->dAmount);
            	$oArticle->Save();
            }
        }
        
        // user info
        $oOrder->oUser = $oUser;
        // shop info
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $myConfig->getShopId());
		$oOrder->oShop = $this->AddGlobalParams( $oShop);
		// currency
        $aCurrencies  		= $myConfig->GetCurrencyArray( $myConfig->getShopCurrency());
        $oOrder->oCurrency  = $aCurrencies[$myConfig->getShopCurrency()];
        // full basket for amounts etc.
        $oOrder->oBasket 	= $this->oBasket;
        // full payment information
        $oOrder->oPayment	= $oPayment;
        
        $oxEMail = &oxNew( "oxemail", "core");
        $oxEMail->SendOrderEMail( $oOrder);
    }

	function GetNextOrderNr( $sOldNr)
	{
		return $sOldNr + 1;
	}                                  
    
}

?>
