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


require( $myConfig->sCoreDir . "/phpmailer/class.phpmailer.php");
require( $myConfig->sCoreDir . "/phpmailer/class.smtp.php");

class oxEmail extends phpmailer 
{
	
	function oxEmail()
	{
	}
	
	function SetSMTP( $oShop)
	{	global $myConfig;
	
		$this->Host     = $oShop->oxshops__oxsmtp->value;
		$this->Mailer   = "smtp";
		if( $oShop->oxshops__oxsmtpuser->value)
		{	$this->SMTPAuth = true;
			$this->Username = $oShop->oxshops__oxsmtpuser->value;
			$this->Password = $oShop->oxshops__oxsmtppwd->value;
		}
		if( $myConfig->iDebug == 6)
			$this->SMTPDebug = true;
			
		$this->PluginDir = getShopBasePath() . "core/phpmailer/";
	}
	
	function AddUserInfoOrderEMail( $oOrder)
	{
		return $oOrder;
	}
	
	function AddUserRegisterEMail( $oUser)
	{
		return $oUser;
	}
	
	function AddForgotPWDEMail( $oShop)
	{
		return $oShop;
	}
	
	function AddNewsletterDBOptInMail( $oUser)
	{
		return $oUser;
	}
	
	// Replace the default error_handler
    function error_handler($msg) 
    {
        echo( "eMail Subsystem Error : $msg <br>");
    }
	
	function SendOrderEMail( $oOrder)
	{	global $myConfig;
		global $mySession;
	
		// add user defined stuff if there is any
		$oOrder = $this->AddUserInfoOrderEMail( $oOrder);

		// mailer stuff
		$this->From     = $oOrder->oShop->oxshops__oxorderemail->value;
		$this->FromName = $oOrder->oShop->oxshops__oxname->value;
		$this->SetSMTP( $oOrder->oShop);
		
		$this->WordWrap = 75;

		// create messages
		$smarty = getSmarty();
		$smarty->assign( "order", $oOrder);
		$smarty->assign( "shop" , $oOrder->oShop );
		$smarty->assign( "user" , $oOrder->oUser );
		$smarty->assign( "currency" , $oOrder->oCurrency );
		$smarty->assign( "basket"   , $oOrder->oBasket );
		$smarty->assign( "payment"  , $oOrder->oPayment );
		
		$this->Body 	= $smarty->fetch( "email_order_html.tpl");
		$this->AltBody 	= $smarty->fetch( "email_order_plain.tpl");
		$this->Subject 	= $oOrder->oShop->oxshops__oxordersubject->value;
		
		$sFullName = $oOrder->oUser->oxuser__oxfname->value . " " . $oOrder->oUser->oxuser__oxlname->value;
		
		$this->AddAddress( $oOrder->oUser->oxuser__oxusername->value, $sFullName);
		$this->AddBCC(  $oOrder->oShop->oxshops__oxorderemail->value, "Bestellung");
		$this->AddReplyTo( $oOrder->oShop->oxshops__oxorderemail->value, $oOrder->oShop->oxshops__oxname->value);

		if( $this->Send())
		{	// add user history
	        $oRemark    = &oxNew( "oxremark", "core");
	        $oRemark->oxremark__oxtext->value 		= $this->AltBody;
        	$oRemark->oxremark__oxparentid->value 	= $oOrder->oUser->sOXID;
        	$oRemark->oxremark__oxtype->value		= "o";
	        $sShopID = $mySession->getVar( "actshop");
    	    $oRemark->oxremark__oxshopid->value = $sShopID;
        	$oRemark->Save();
		}
		
		// cleanup
		$this->ClearAddresses();
	}
	
	function SendRegisterEMail( $oUser, $oView)
	{	global $myConfig;
	
		// add user defined stuff if there is any
		$oUser = $this->AddUserRegisterEMail( $oUser);

		// shop info
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $myConfig->getShopId());
        $oShop = $oView->AddGlobalParams( $oShop);

		// mailer stuff
		$this->From     = $oShop->oxshops__oxorderemail->value;
		$this->FromName = $oShop->oxshops__oxname->value;
		$this->Host     = $oShop->oxshops__oxsmtp->value;
		$this->SetSMTP( $oShop);
		$this->WordWrap = 75;
		
		// create messages
		$smarty = getSmarty();
		$smarty->assign( "shop" , $oShop );
		$smarty->assign( "user" , $oUser );
		
		$this->Body 	= $smarty->fetch( "email_register_html.tpl");
		$this->AltBody 	= $smarty->fetch( "email_register_plain.tpl");
		$this->Subject 	= $oShop->oxshops__oxregistersubject->value;
		
		$sFullName = $oUser->oxuser__oxfname->value . " " . $oUser->oxuser__oxlname->value;
		
		$this->AddAddress( $oUser->oxuser__oxusername->value, $sFullName);
		$this->AddReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->value);
		
		$this->Send();
	}

	function SendForgotPWDEMail( $sEmailAdress, $oView)
	{	global $myConfig;
	
		// shop info
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $myConfig->getShopId());
        $oShop = $oView->AddGlobalParams( $oShop);

		// add user defined stuff if there is any
		$oShop = $this->AddForgotPWDEMail( $oShop);

		// mailer stuff
		$this->From     = $oShop->oxshops__oxorderemail->value;
		$this->FromName = $oShop->oxshops__oxname->value;
		$this->Host     = $oShop->oxshops__oxsmtp->value;
		$this->SetSMTP( $oShop);
		$this->WordWrap = 75;
		
		// user
	    $oUserList = &oxNew( "oxlist", "core");
        $oUserList->Init( "oxuser");

        $sSelect =  "select * from oxuser where oxuser.oxactiv = 1 and oxuser.oxusername = '$sEmailAdress' ";
        if( $oUserList->selectString( $sSelect));
        {   $oUser = @current( $oUserList->aList);
            if( $oUser)
            {	// create messages
        		$smarty = getSmarty();
        		$smarty->assign( "shop" , $oShop );
        		$smarty->assign( "user" , $oUser );
        		
        		$this->Body 	= $smarty->fetch( "email_forgotpwd_html.tpl");
        		$this->AltBody 	= $smarty->fetch( "email_forgotpwd_plain.tpl");
        		$this->Subject 	= $oShop->oxshops__oxforgotpwdsubject->value;

        		$sFullName = $oUser->oxuser__oxfname->value . " " . $oUser->oxuser__oxlname->value;
        		
        		$this->AddAddress( $sEmailAdress, $sFullName);
        		$this->AddReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->value);
        		
        		$this->Send();
        	}
    	}
	}

	function SendContactMail( $sEmailAdress, $sSubject, $sMessage)
	{	global $myConfig;
	
		// shop info
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $myConfig->getShopId());

		// mailer stuff
		$this->From     = $oShop->oxshops__oxorderemail->value;
		$this->FromName = $oShop->oxshops__oxname->value;
		$this->Host     = $oShop->oxshops__oxsmtp->value;
		$this->SetSMTP( $oShop);
		$this->WordWrap = 75;
		
		$this->Body 	= $sMessage;
		$this->Subject 	= $sSubject;

        $this->AddAddress( $oShop->oxshops__oxinfoemail->value, "");
        $this->AddReplyTo( $sEmailAdress, "");
        		
        return $this->Send();
	}

	function SendNewsletterDBOptInMail( $oUser, $oView)
	{	global $myConfig;
	
		// add user defined stuff if there is any
		$oUser = $this->AddNewsletterDBOptInMail( $oUser);

		// shop info
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $myConfig->getShopId());
        $oShop = $oView->AddGlobalParams( $oShop);

		// mailer stuff
		$this->From     = $oShop->oxshops__oxorderemail->value;
		$this->FromName = $oShop->oxshops__oxname->value;
		$this->Host     = $oShop->oxshops__oxsmtp->value;
		$this->SetSMTP( $oShop);
		$this->WordWrap = 75;
		
		// create messages
		$smarty = getSmarty();
		$smarty->assign( "shop" , $oShop );
		$smarty->assign( "user" , $oUser );
		
		$this->Body 	= $smarty->fetch( "email_newsletteroptin_plain.tpl");
		$this->Subject 	= "Newsletter ".$oShop->oxshops__oxname->value;
		
		$sFullName = $oUser->oxuser__oxfname->value . " " . $oUser->oxuser__oxlname->value;
		
		$this->AddAddress( $oUser->oxuser__oxusername->value, $sFullName);
		$this->AddReplyTo( $oShop->oxshops__oxinfoemail->value, $oShop->oxshops__oxname->value);
		
		return $this->Send();
	}
}

?>
