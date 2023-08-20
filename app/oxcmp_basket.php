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


require_once( "oxview.php");

/*
Basket in the session :
[basket]
{
    [aBasketContents] => Array
        (
            []
                (
                    [sProduct] => productID
                    [dAmount] => 2
                    [dtotalprice] => 49.79996
                    [ftotalprice] => 49,80
                    [aSelList]  => array
                )

        )

    [iCntProducts] => 1
    [dCntItems] => 2
    [dproductsprice] => 49.79996
    [fproductsprice] => 49,80
    [dprice] => 49.79996
    [fprice] => 49,80
    [dVAT] => 6.86896
    [fVAT] => 6,87
    [ddeliverycost] => delivery cost
    [fdeliverycost] => formated delivery cost
    
    [blCalcNeeded] => false

    // after basket is loaded we have additional ( but this is not take thorugh session )
    [oProductList] => Array
        (
            [productID]  = $oArticle Objects
        )
    [aDiscounts] => Array
    
    [sOrderID]	=> order id after ordered
    
    [dAddPaymentSum]    => if additional stuff cause of payment method
    [fAddPaymentSum]

)

*/

class oxcmp_basket extends oxView
{
    var $oBasket    = null;

    function init()
    {   global $myConfig;
        global $mySession;
        
        parent::init();
        
        $this->oBasket = $mySession->getVar( "basket");
        if( !isset( $this->oBasket) || !$this->oBasket)
        {   $this->oBasket->aBasketContents  	= array();
            $this->oBasket->iCntProducts     	= 0;
            $this->oBasket->dCntItems        	= 0;
            $this->oBasket->dprice           	= 0;
            $this->oBasket->fprice           	= 0;
            $this->oBasket->ddeliverycost		= 0;
            $this->oBasket->fdeliverycost		= 0;
            $this->oBasket->blCalcNeeded		= true;
            $mySession->setVar( "basket", $this->oBasket);
        }
        
    }
    
    function render()
    {   global $mySession;
    	
    	$this->oBasket = $mySession->getVar( "basket");
    	
    	if( isset( $this->oBasket) && $this->oBasket->blCalcNeeded)
    		$this->CalculateBasket();

        parent::render();

        return $this->oBasket;
    }
    
    function findBasketEntry( $said, $aSel)
    {
        reset ($this->oBasket->aBasketContents);
        while (list($key, $oContent) = each($this->oBasket->aBasketContents))
        {   if( !$aSel && $oContent->sProduct == $said)
        		return $key;
        	elseif( $oContent->sProduct == $said && $oContent->aSelList == $aSel)
                return $key;
        }

        return -1;
    }
    
    function tobasket()
    {   global $myConfig;
        global $mySession;

        $dOldAmount = 0;
    
        $sProductID = $myConfig->getParameter( "aid");
        $dAmount    = $myConfig->getParameter( "am");
        $aSel       = $myConfig->getParameter( "sel");
        if( !isset( $aSel))
            $aSel = 0;
    
        $key = $this->findBasketEntry( $sProductID, $aSel);
        
        if( $key != -1)
        {   $oOldContent = $this->oBasket->aBasketContents[$key];
            $dOldAmount  = $oOldContent->dAmount;
        }
        
        $oContent->sProduct     = $sProductID;
        $oContent->dAmount      = $dOldAmount + $dAmount;
        $oContent->aSelList     = $aSel;

        if( $key != -1)
            $this->oBasket->aBasketContents[$key] = $oContent;
        else
            $this->oBasket->aBasketContents[] = $oContent;
        
        $this->oBasket->blCalcNeeded = true;
        
        $mySession->setVar( "basket", $this->oBasket);
    }

    function changebasket()
    {   global $myConfig;
        global $mySession;

        $dOldAmount = 0;
        
        $sProductID = $myConfig->getParameter( "aid");
        $dAmount    = $myConfig->getParameter( "am");
        $dAmount    = str_replace( ",", ".", $dAmount);
        $aSel       = $myConfig->getParameter( "sel");
        if( !isset( $aSel))
            $aSel = 0;
            
        $bindex    = $myConfig->getParameter( "bindex");
        if( isset( $bindex))
            $key = $bindex;
        else
            $key = $this->findBasketEntry( $sProductID, $aSel);

        if( !$dAmount)
        {   // remove this from basket
            unset( $this->oBasket->aBasketContents[$key]);
        }
        else
        {
            $oContent->sProduct     = $sProductID;
            $oContent->dAmount      = $dAmount;
            $oContent->aSelList     = $aSel;
            $this->oBasket->aBasketContents[$key] = $oContent;
        }
        
        $this->oBasket->blCalcNeeded = true;
        
        $mySession->setVar( "basket", $this->oBasket);
    }
    
    function calculateDeliveryCosts( $oBasket, &$aProductList)
    {	global $mySession;
    	global $myConfig;
    
    	$oBasket->ddeliverycost	= 0;
    	
    	// don't calculate if not logged in
    	if( (!isset( $myConfig->oUser) || !$myConfig->oUser) && !$myConfig->blCalculateDelCostIfNotLoggedIn)
    		return $oBasket;
    	
    	$dTotalSize		= 0;
    	$dTotalWeight	= 0;
    	$oProduct		= null;
    	
    	$sDeliveryCountry = "";
		$soxAddressId   = $myConfig->getParameter( "deladrid");
		$sUserID 		= $mySession->getVar( "usr");
		if( isset( $soxAddressId) && $soxAddressId)
		{	$oDelAdress = &oxNew( "oxbase", "core");
			$oDelAdress->Init( array( "oxaddress"));
			$oDelAdress->Load( $soxAddressId);
			$sDeliveryCountry = $oDelAdress->oxaddress__oxcountry->value;
		}
		elseif( $sUserID)
        {   // user
            if( $myConfig->oUser)
                $oUser = &$myConfig->oUser;
            else
            {   $oUser = &oxNew( "oxuser", "core");
                $oUser->Load( $sUserID);
                // cache this
                $myConfig->oUser = &$oUser;
            }
            $sDeliveryCountry = $oUser->oxuser__oxcountry->value;
        }
        
    	// retrieve delivery costs from products
    	foreach( $oBasket->aBasketContents as $oContent)
    	{	$oProduct = $aProductList[$oContent->sProduct];
    		
    		$dPrice 	= $oContent->dAmount * $oProduct->brutPrice;
    		$dAmount	= $oContent->dAmount;
    		$dSize		= ( $oProduct->oxarticles__oxlength->value * $oProduct->oxarticles__oxwidth->value * $oProduct->oxarticles__oxheight->value) * $dAmount;
    		$dWeight	= $oProduct->oxarticles__oxweight->value * $dAmount;
    		
    		$dTotalSize		+= $dSize;
    		$dTotalWeight	+= $dWeight;
    		
    		$oList = $oProduct->LoadDeliveryList( $sDeliveryCountry, $dAmount, $dPrice, $dSize, $dWeight);
    		if( isset( $oList))
    		{	$aDelCache = array();
                foreach( $oList->aList as $oDeliveryCost)
    			{    if( $myConfig->iDebug == 5)
    					echo( "DelCost[".$oProduct->oxarticles__oxtitle->value."] : ".$oDeliveryCost->oxdelivery__oxtitle->value."<br>");
    			     $oBasket->ddeliverycost += $oDeliveryCost->oxdelivery__oxaddsum->value * $dAmount;	
    			}
    		}
    	}
    	
    	// now let's see if there are overall delivery costs
    	if( $oProduct)
    	{	
    		$oList = $oProduct->LoadDeliveryList( $sDeliveryCountry, $oBasket->dCntItems, $oBasket->dprice, $dTotalSize, $dTotalWeight, true);
    		if( isset( $oList))
    		{	foreach( $oList->aList as $oDeliveryCost)
    			{	if( $myConfig->iDebug == 5)
    					echo( "DelCost[Basket] : ".$oDeliveryCost->oxdelivery__oxtitle->value."<br>");
    				$oBasket->ddeliverycost += $oDeliveryCost->oxdelivery__oxaddsum->value;	
    			}
    		}
    	}
    	
    	$oCur = $myConfig->getActShopCurrencyObject();
    	if( $oBasket->ddeliverycost)
    		$oBasket->ddeliverycost = $oBasket->ddeliverycost * $oCur->rate;
    	
    	return $oBasket;
    }
    
    
    function CalculateBasket()
    {   global $myConfig;
        global $mySession;
        
        $oBasket = $mySession->getVar( "basket");
     
    	if( $oBasket && (count( $oBasket->aBasketContents) || $oBasket->iCntProducts))
        {   $this->oBasket = $oBasket;
        
            // currency conversion, sum etc.
            $oCur = $myConfig->getActShopCurrencyObject();
            $this->oBasket->dprice      = 0;
            $this->oBasket->dCntItems   = 0;
            $this->oBasket->dVAT        = 0;
            $aProdList = array();
            
            $aDiscounts = null;
            
            while (list($key, $oContent) = each($this->oBasket->aBasketContents))
            {   $oProduct = &oxNew( "oxarticle", "core");
                $oProduct->Load( $oContent->sProduct);
                $aProdList[$oProduct->sOXID] = $oProduct;

                if( !$aDiscounts)
                {   $oDiscList = $oProduct->getDiscountList( false);
                    $aDiscounts = $oDiscList->aList;
                }
                

                $oContent->dtotalprice  = $oProduct->price * $oContent->dAmount;
                $oContent->ftotalprice  = FormatCurrency( $oContent->dtotalprice, $oCur);
                // total basket sum
                $this->oBasket->dprice      += $oContent->dtotalprice;
                // total basket items
                $this->oBasket->dCntItems   += $oContent->dAmount;
                // total basket VAT
                $this->oBasket->dVAT        += $oProduct->vat * $oContent->dAmount;

                $this->oBasket->aBasketContents[$key] = $oContent;
            }
            
            $this->oBasket->aDiscounts = array();

            // basket calculation is finished
            // now we check if we can apply other discounts
            if( $aDiscounts)
            {   foreach (array_keys( $aDiscounts) as $Disckey)
                {   $oDiscount = & $aDiscounts[$Disckey];

                    // we have to check if these are to apply or not
                    $iAmount    = 0;
                    $iPrice     = 0;
                    //echo( "checking ".$oDiscount->oxdiscount__oxtitle->value."<br>");
                    reset ($this->oBasket->aBasketContents);
                    while (list($key, $oContent) = each($this->oBasket->aBasketContents))
                    {   $oProduct = & $aProdList[$oContent->sProduct];

                    	if( ($oDiscount->oxdiscount__oxcatnid->value && $oProduct->InCategory( $oDiscount->oxdiscount__oxcatnid->value)) ||
                            !$oDiscount->oxdiscount__oxcatnid->value)
                        {   $iAmount += $oContent->dAmount;
                            $iPrice  += $oProduct->brutPrice * $oContent->dAmount;	// in base currency
                        }
                    }
                    //echo( "price : $iPrice  <br>");
                    if( ($oDiscount->oxdiscount__oxamount->value && $iAmount < $oDiscount->oxdiscount__oxamount->value)
                     || ($oDiscount->oxdiscount__oxprice->value && $iPrice < $oDiscount->oxdiscount__oxprice->value))
                    {   // does not fit, delete this
                        unset( $aDiscounts[$Disckey]);
                    }
                }
                
                // apply discounts
                if( count( $aDiscounts))
                {   $this->oBasket->dprice      = 0;
                    $this->oBasket->dCntItems   = 0;
                    $this->oBasket->dVAT        = 0;
                    
                    foreach (array_keys( $aDiscounts) as $Disckey)
                    {   $oDiscount = & $aDiscounts[$Disckey];
                        //echo( "applying ".$oDiscount->oxdiscount__oxtitle->value."<br>");
                        foreach (array_keys( $aProdList) as $key)
                        {   $oProduct = & $aProdList[$key];
                            //echo( "testing : ".$oProduct->oxarticles__oxtitle->value."<br>");
                            if( ($oDiscount->oxdiscount__oxcatnid->value && $oProduct->InCategory( $oDiscount->oxdiscount__oxcatnid->value)) ||
                                !$oDiscount->oxdiscount__oxcatnid->value)
                            {   // set discount
                                //echo( "aus ".$oProduct->netPrice."(".$oProduct->price.") wird ");
                                if( $oDiscount->oxdiscount__oxaddsumtype->value == "abs")
                                    $oProduct->netPrice = $oProduct->netPrice - $oDiscount->oxdiscount__oxaddsum->value;
                                elseif( $oDiscount->oxdiscount__oxaddsumtype->value == "%")
                                    $oProduct->netPrice = $oProduct->netPrice - (($oDiscount->oxdiscount__oxaddsum->value/100) * $oProduct->netPrice);

                                //echo( $oProduct->netPrice." <br>");

                                $oProduct->price    = $oProduct->netPrice * ( 1 + ((1/100)*$oProduct->vatPercent));
                                $oProduct->vat      = $oProduct->price - $oProduct->netPrice;
                                $oCur = $myConfig->getActShopCurrencyObject();
                                $oProduct->fprice   = FormatCurrency( $oProduct->price, $oCur);
                                
                                $this->oBasket->aDiscounts[$oDiscount->oxdiscount__oxid->value] = $oDiscount->oxdiscount__oxtitle->value;
                            }
                        }
                    }

                    reset ($this->oBasket->aBasketContents);
                    while (list($key, $oContent) = each($this->oBasket->aBasketContents))
                    {   $oProduct = & $aProdList[$oContent->sProduct];
                        $oContent->dtotalprice  = $oProduct->price * $oCur->rate * $oContent->dAmount;
                        $oContent->ftotalprice  = FormatCurrency( $oContent->dtotalprice, $oCur);
                        // total basket sum
                        $this->oBasket->dprice      += $oContent->dtotalprice;
                        // total basket items
                        $this->oBasket->dCntItems   += $oContent->dAmount;
                        // total basket VAT
                        $this->oBasket->dVAT        += $oProduct->vat * $oContent->dAmount;
                        $this->oBasket->aBasketContents[$key] = $oContent;
                    }
                }
            }
			// delivery cost
            $this->oBasket = $this->calculateDeliveryCosts( $this->oBasket, $aProdList);
            $this->oBasket->fdeliverycost = FormatCurrency( $this->oBasket->ddeliverycost, $oCur);
            
            // payment
            $sPaymentid     = $myConfig->getParameter( "paymentid");
            $dAddPaymentSum = 0;

            if( isset( $sPaymentid) && $sPaymentid)
            {   $oPayment = &oxNew( "oxpayment", "core");
                $oPayment->Load( $sPaymentid);
                
                $dAddPaymentSum = $oPayment->oxpayments__oxaddsum->value;
            }
            
            $this->oBasket->dAddPaymentSum = $dAddPaymentSum;
            $this->oBasket->fAddPaymentSum = FormatCurrency( $dAddPaymentSum, $oCur);

            $this->oBasket->dproductsprice	= $this->oBasket->dprice;
            $this->oBasket->fproductsprice	= FormatCurrency( $this->oBasket->dproductsprice, $oCur);
            
            $this->oBasket->dprice  = $this->oBasket->dprice + $this->oBasket->ddeliverycost + $dAddPaymentSum;
            $this->oBasket->fprice  = FormatCurrency( $this->oBasket->dprice, $oCur);
            $this->oBasket->fVAT    = FormatCurrency( $this->oBasket->dVAT, $oCur);
            $this->oBasket->iCntProducts    = count($this->oBasket->aBasketContents);
            
            $this->oBasket->blCalcNeeded = false;

            $mySession->setVar( "basket", $this->oBasket);

            // set productlist and cached basket
            $this->oBasket->oProductList = $aProdList;
            $myConfig->oBasket = &$this->oBasket;
            
        }
    }

}

?>
