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

define( "ERROR_PWDDONTMATCH", -1);
define( "ERROR_NOVALIDLOGIN", -2);
define( "ERROR_NOTALLFIELDS", -3);
define( "ERROR_ADRESSMISSING", -4);
define( "ERROR_NOVALIDEMAIL", -5);

class oxcmp_user extends oxView
{
    var $oUser 	 		= null;
    var $iError 		= 0;
    var $blIsNewUser 	= false;
    
    function init()
    {   global $myConfig;
    
        $this->iError = $myConfig->getParameter( "usr_err");
        $myConfig->setParameter( "usr_err", 0);
        
        parent::init();
    }
    
    function render()
    {   global $myConfig;
        global $mySession;
        global $_COOKIE;

        // load user
        $this->SetUser();

        // set user to all views
        $this->oParent->oActUser = $this->oUser;
        
        parent::render();
        
        // dyn_group feature
        // if you specify a groupid in URL
        // the user will automatically be added to this group
        // later
        $sDynGoup = $myConfig->getParameter( "dgr");
        if( isset( $sDynGoup) && $sDynGoup)
            $mySession->setVar( "dgr", $sDynGoup);
            
        $this->oParent->aViewData['usr_error'] = $this->iError;
        
        $aInvAdress  = $myConfig->getParameter( "invadr");
        $this->oParent->aViewData['invadr'] = $aInvAdress;
        $sUser       = $myConfig->getParameter( "lgn_usr");
        $this->oParent->aViewData['lgn_usr'] = $sUser;
        $sPassword   = $myConfig->getParameter( "lgn_pwd");
        $this->oParent->aViewData['lgn_pwd'] = $sPassword;
        $sPassword2  = $myConfig->getParameter( "lgn_pwd2");
        $this->oParent->aViewData['lgn_pwd2'] = $sPassword2;

        return $this->oUser;
    }
    
    function SetUser()
    {   global $mySession;
        global $myConfig;
    
        // we use session and not config->getParameter cause of security issues
        $sUserID = $mySession->getVar("usr");
        if( !isset( $sUserID) || !$sUserID)
        {   // try to load cookie
            if( isset($_COOKIE['usr']))
            {   $sUserID = $_COOKIE['usr'];
                if( isset( $sUserID) && $sUserID)
                    $mySession->setVar( "usr", $sUserID);
            }
        }
        if( isset( $sUserID) && $sUserID)
        {   $this->oUser = &oxNew( "oxuser", "core");
            $this->oUser->Load( $sUserID);
            $myConfig->oUser = $this->oUser;
            
            // add group information
            if( isset( $this->oUser->oGroups->aList))
            {   foreach( $this->oUser->oGroups->aList as $oOneGroup)
                {	$sVal = $oOneGroup->oxgroups__oxtitle->value;
                	$this->oUser->groups->$sVal = 1;
                }
            }
        }
    }

    function Login()
    {   global $myConfig;
        global $mySession;
        
        $sUser      = $myConfig->getParameter( "lgn_usr");
        $sPassword  = $myConfig->getParameter( "lgn_pwd");
        $sCookie    = $myConfig->getParameter( "lgn_cook");
        
        $this->iError = 0;
        
        // login user
        $oUser = $mySession->login( $sUser, $sPassword);
        if( $oUser)
        {   $this->oUser = &$oUser;
            // store userid in session so that we dont have to pass this parameter always
            $mySession->setVar( "usr", $this->oUser->sOXID);
            $this->AddDynGroup();
            
            if( $sCookie)
            {   // set cookie
                setcookie ("usr", $this->oUser->sOXID,time()+31536000);
            }
            
            // recalc basket
            $oBasket = $mySession->getVar( "basket");
            $oBasket->blCalcNeeded = true;
            $mySession->setVar( "basket", $oBasket);
        }
        else
        {   $this->iError = ERROR_NOVALIDLOGIN;
            $myConfig->setParameter( "usr_err", $this->iError);
            return "user";
        }
    }
    
    function login_noredirect()
    {
    	$this->Login();
    }
    
    function logout()
    {   global $mySession;
        global $_COOKIE;
        
        $mySession->deleteVar( "usr");
        $mySession->deleteVar( "dgr");
        // delete cookie
        setcookie ("usr", "", time() - 3600);
        $_COOKIE['usr'] = null;

        // recalc basket
        $oBasket = $mySession->getVar( "basket");
        $oBasket->blCalcNeeded = true;
        $mySession->setVar( "basket", $oBasket);
    }
    
    function AddDynGroup()
    {   global $mySession;
    
        if( !$this->oUser)
            return;
            
        // dyngroup
        $sDynGoup = $mySession->getVar( "dgr");
        if( isset( $sDynGoup) && $sDynGoup && !$this->oUser->InGroup( $sDynGoup))
        {   // add user to this group
            $oNewGroup = &oxNew( "oxbase", "core");
            $oNewGroup->Init( array( "oxobject2group"));
            $oNewGroup->oxobject2group__oxobjectid->value = $this->oUser->sOXID;
            $oNewGroup->oxobject2group__oxgroupsid->value = $sDynGoup;
            $oNewGroup->Save();
            $mySession->deleteVar( "dgr");
        }
    }
    
    function changeuser()
    {   global $myConfig;
    
        // load user
        if( !$this->oUser)
            $this->SetUser();

        // store invoice adress
        $aInvAdress = $myConfig->getParameter( "invadr");
        $aInvAdress = $this->oUser->ConvertNameArray2Idx( $aInvAdress);
        $this->oUser->Assign( $aInvAdress);
        if( $this->blIsNewUser)
        {	// bonitaet
        	$this->oUser->oxuser__oxboni->value   = $this->GetBoni( $this->oUser);
    	    // add customer nr.
    	    if( $this->oUser->oxuser__oxcustnr->value == "")
    	        $this->oUser->oxuser__oxcustnr->value = $this->GetNextCustomerNr();
        }
        $this->oUser->Save();
        
        // store delivery adress
        $aDelAdress = $myConfig->getParameter( "deladr");
        
        if( $aDelAdress['oxaddress__oxfname'] || $aDelAdress['oxaddress__oxlname'])
        {				 
        	$sAdressID  = $myConfig->getParameter( "oxaddressid");
	        $aDelAdress['oxaddress__oxid'] = $sAdressID;
	        if( $aDelAdress['oxaddress__oxid'] == "-1")
	            $aDelAdress['oxaddress__oxid'] = null;
			$oAdress = &oxNew( "oxbase", "core");
	        $oAdress->Init( array( "oxaddress"));
	        $aDelAdress = $oAdress->ConvertNameArray2Idx( $aDelAdress);
	        $oAdress->Assign( $aDelAdress);
	        $oAdress->oxaddress__oxuserid->value = $this->oUser->sOXID;
	        $oAdress->Save();
	        // tell this to parent
	        $this->oParent->sNewAdressID = $oAdress->sOXID;
	        // set delivery adress for ordering later
	        $myConfig->setParameter( "deladrid", $oAdress->sOXID);
        }
        else 
        	$myConfig->setParameter( "deladrid", null);
    }
    
    function createuser()
    {   global $myConfig;
    	
        $sUser       = $myConfig->getParameter( "lgn_usr");
        $sPassword   = $myConfig->getParameter( "lgn_pwd");
        $sPassword2  = $myConfig->getParameter( "lgn_pwd2");
        $aInvAdress  = $myConfig->getParameter( "invadr");
        
        if( $sPassword != $sPassword2)
        {   $this->iError = ERROR_PWDDONTMATCH;
            $myConfig->setParameter( "usr_err", $this->iError);
            return "user";
        }

        if( !$sUser || !$sPassword || !$sPassword2)
        {   $this->iError = ERROR_NOTALLFIELDS;
            $myConfig->setParameter( "usr_err", $this->iError);
            return "user";
        }

        if( !$aInvAdress['oxuser__oxfname'] || !$aInvAdress['oxuser__oxlname'])
        {   $this->iError = ERROR_ADRESSMISSING;
            $myConfig->setParameter( "usr_err", $this->iError);
            return "user";
        }
        
        // check eMail Address
        if( $myConfig->iValidateEMail)
        {   require_once( $myConfig->sCoreDir . "emailvalidation/email_validation.php");
            $validator=new email_validation_class;
            if( $myConfig->iValidateEMail == 2) // full check
            {   
                if(!function_exists("GetMXRR"))
            	{	$_NAMESERVERS = $myConfig->aNameServers;
            		require_once($myConfig->sCoreDir."emailvalidation/getmxrr.php");
            	}
            	else
            	{
            		$_NAMESERVERS = $myConfig->aNameServers;
            		if(count($_NAMESERVERS)==0)
            			Unset($_NAMESERVERS);
            		require_once($myConfig->sCoreDir."emailvalidation/rrcompat.php");
            		$validator->getmxrr="_getmxrr";
            	}

                $validator->timeout=5;
                $validator->exclude_address="";
                // set if you have troubles with validating email adresses
                $validator->debug=0;
                $validator->html_debug=0;
                if( $validator->ValidateEmailBox( $sUser) <= 0)
                {   $this->iError = ERROR_NOVALIDEMAIL;
                    $myConfig->setParameter( "usr_err", $this->iError);
                    return "user";
                }
            }
            elseif( $myConfig->iValidateEMail == 1) // syntax check only
            {   if( !$validator->ValidateEmailAddress( $sUser))
                {   $this->iError = ERROR_NOVALIDEMAIL;
                    $myConfig->setParameter( "usr_err", $this->iError);
                    return "user";
                }
            }
        }

        $this->oUser = &oxNew( "oxuser", "core");
        $this->oUser->oxuser__oxusername->value = $sUser;
        $this->oUser->oxuser__oxpassword->value = $sPassword;
        $this->oUser->oxuser__oxactiv->value    = 1;
        $this->oUser->oxuser__oxrights->value   = "user";
        if( $this->oUser->insert())   // if username does exist already it won't save as this is unique
        {   $this->Login();
            if( $this->iError)
            {   $myConfig->setParameter( "usr_err", $this->iError);
                return "user";
            }
            // new registered
            $this->blIsNewUser = true;
            // add group's
            $oNewGroup = &oxNew( "oxbase", "core");
            $oNewGroup->Init( array( "oxobject2group"));
            $oNewGroup->oxobject2group__oxobjectid->value = $this->oUser->sOXID;
            $oNewGroup->oxobject2group__oxgroupsid->value = "oxidnewcustomer";
            $oNewGroup->Save();
            // foreigner ?
            $aInvAdress = $myConfig->getParameter( "invadr");
            $sCountry = strtolower( $aInvAdress['oxuser__oxcountry']);
            if( !in_array( $sCountry, $myConfig->aHomeCountry))
            {   // yes, foreigner
                $oNewGroup = &oxNew( "oxbase", "core");
                $oNewGroup->Init( array( "oxobject2group"));
                $oNewGroup->oxobject2group__oxobjectid->value = $this->oUser->sOXID;
                $oNewGroup->oxobject2group__oxgroupsid->value = "oxidforeigncustomer";
                $oNewGroup->Save();
            }
        }
        
        $this->changeuser();
        
        if( $this->blIsNewUser)
        {	// send register eMail
	        $oxEMail = &oxNew( "oxemail", "core");
    	    $oxEMail->SendRegisterEMail( $this->oUser, $this);
        }
    }

    function GetBoni( $oUser)
    {   // overload this, infoscore etc.
    
        return 1000;
    }
    
    function GetNextCustomerNr()
    {
        $oUsers = &oxNew( "oxlist", "core");
		$oUsers->Init( "oxbase");
        $oUsers->oLstoTpl->Init( array( "oxuser"));        
        $iLastCustomerNr = $oUsers->GetMax( null, "oxcustnr");
        
        $iCustNr = $iLastCustomerNr + 1;
        
        return $iCustNr;
    }
    
    function forgotpassword()
    {   global $myConfig;

        $seMail = $myConfig->getParameter( "lgn_usr");
        $oxEMail = &oxNew( "oxemail", "core");
	    $oxEMail->SendForgotPWDEMail( $seMail, $this);

        if( !isset( $seMail) ||!$seMail)
            $seMail = " - ";
	
	    $this->oParent->aViewData['sendForgotMail']     = $seMail;
    }
    
}

?>
