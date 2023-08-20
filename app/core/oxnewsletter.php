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


require_once( $myConfig->sCoreDir . "oxbase.php");

$gloNewsletter = null;

// ------------------------------------------------------------------
// oxid smarty custom handler
function ox_get_template( $tpl_name, &$tpl_source, &$smarty_obj)
{	global $gloNewsletter;

	$tpl_source = $gloNewsletter->$tpl_name->value;

	return true;
}

function ox_get_timestamp($tpl_name, &$tpl_timestamp, &$smarty_obj)
{
	$tpl_timestamp = time();
	
	return true;
}

function ox_get_secure($tpl_name, &$smarty_obj)
{
    // assume all templates are secure
    return true;
}

function ox_get_trusted($tpl_name, &$smarty_obj)
{
    // not used for templates
}
// ------------------------------------------------------------------


class oxNewsletter extends oxBase
{
	var $oSmarty 	= null;
	var $sHTMLText	= null;
	var $sPlainText	= null;
	var $sShopID	= null;
	var $oShop		= null;
	var $sLanguage	= null;
    var $oGroups    = null;
    var $oUser		= null;

	
    function oxNewsletter()
    {      
        $this->sClassName  = "oxnewsletter";
        $this->Init( array( "oxnewsletter"));
        
        $this->oSmarty = getSmarty();
		$this->oSmarty->register_resource("ox", array(  "ox_get_template",
                                       					"ox_get_timestamp",
                                       					"ox_get_secure",
                                       					"ox_get_trusted"));
        parent::oxBase();
    }
    
    function Assign( $dbRecord)
    {
        parent::Assign( $dbRecord);

        // usergroups
        $this->oGroups = &oxNew( "oxlist", "core");
        $this->oGroups->Init( "oxbase");
        $this->oGroups->oLstoTpl->Init( array( "oxobject2group", "oxgroups"));
        $sSelect =  "select * from oxobject2group left join oxgroups on oxobject2group.oxgroupsid=oxgroups.oxid ";
        $sSelect .= "where oxobject2group.oxobjectid='$this->sOXID'";
        $this->oGroups->selectString( $sSelect);
    }
    
    function delete( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;
            
        parent::delete( $sOXID);

        $oDB = GetDB();
        
        $sDelete = "delete from oxobject2group where oxobject2group.oxobjectid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);

        return $rs->EOF;
    }
    
    function Prepare( $oView)
    {	global $myConfig;
    
		// shop info
		$blAdmin = $myConfig->blAdmin;
		$myConfig->blAdmin = false;
		
		// add shop
	    $oShop = &oxNew( "oxshop", "core");
	    $this->sShopID = $myConfig->getShopId();
	    $oShop->Load( $this->sShopID);
		$oShop = $oView->AddGlobalParams( $oShop);
		$this->oSmarty->assign( "myshop", $oShop);  
		
	    $this->oShop = $oShop;
		
		// add currency
        $aCurrencies  = $myConfig->GetCurrencyArray( $myConfig->getShopCurrency());
        $oCurrency    = $aCurrencies[$myConfig->getShopCurrency()];
		$this->oSmarty->assign( "mycurrency", $oCurrency);  
		
		$this->sLanguage    = $myConfig->getParameter( "language");

	 	$myConfig->blAdmin = $blAdmin;
    }
    
    function Create( $sUserid)
    {	global $gloNewsletter;
    
        $oUser = &oxNew( "oxuser", "core");
		$oUser->Load( $sUserid);
		$this->oUser = $oUser;
		
		$this->oSmarty->assign( "myuser", $oUser);
		
		// add newsletter products
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXNEWSLETTER");
        $this->oSmarty->assign( "articlelist", $oArtList->aList);
        $iCnt = 0;
        if( isset( $oArtList->aList))
        {	foreach( $oArtList->aList as $oArt)
	        {	$sName = "article".$iCnt;
	        	$this->oSmarty->assign( $sName, $oArt);
	        	$iCnt++;
	        }
        }
        		
		// add products which fit to the last order of this user
        $oArtList = &oxNew( "oxarticlelist", "core");
        $sSelect  = "select oxarticles.* from oxorder left join oxorderarticles on oxorderarticles.oxorderid = oxorder.oxid ";
        $sSelect .= "left join oxarticles on oxorderarticles.oxartid = oxarticles.oxid ";
        $sSelect .= "where ".GetActivSnippet( "oxarticles")." and oxarticles.oxshopid = '".$this->sShopID."' ";
        $sSelect .= "and oxarticles.oxlang = ".$this->sLanguage;
        $sSelect .= " and oxorder.oxuserid = '$sUserid' order by oxorder.oxorderdate desc";

        $oArtList->selectString( $sSelect);
        
        $oOneArt = null;
        
        if( isset( $oArtList->aList))
        	$oOneArt = @current( $oArtList->aList);
        	
        if( isset( $oOneArt) && $oOneArt)
        	$aSimList = $oOneArt->GetSimilarProducts();	
        if( isset( $aSimList))
        {	$this->oSmarty->assign( "simlist", $aSimList);
	        $iCnt = 0;
	        foreach( $aSimList as $oArt)
	        {	$sName = "simarticle".$iCnt;
	        	$this->oSmarty->assign( $sName, $oArt);
	        	$iCnt++;
	        }
        }
        		
        // set for smarty
		$gloNewsletter = $this;
		$this->sHTMLText  = $this->oSmarty->fetch("ox:oxnewsletter__oxtemplate");
		$this->sPlainText = $this->oSmarty->fetch("ox:oxnewsletter__oxplaintemplate");
    }
    
    function Send()
    {
        $oxEMail = &oxNew( "oxemail", "core");
    	
		$oxEMail->From     = $this->oShop->oxshops__oxorderemail->value;
		$oxEMail->FromName = $this->oShop->oxshops__oxname->value;
		$oxEMail->Host     = $this->oShop->oxshops__oxsmtp->value;
		$oxEMail->Mailer   = "smtp";
		$oxEMail->WordWrap = 75;
		
		$oxEMail->Body 		= $this->sHTMLText;
		$oxEMail->AltBody 	= $this->sPlainText;
		$oxEMail->Subject 	= $this->oxnewsletter__oxtitle->value;
		
		$sFullName = $this->oUser->oxuser__oxfname->value . " " . $this->oUser->oxuser__oxlname->value;
		$oxEMail->AddAddress( $this->oUser->oxuser__oxusername->value, $sFullName);
		$oxEMail->AddReplyTo( $this->oShop->oxshops__oxorderemail->value, $this->oShop->oxshops__oxname->value);

		return $oxEMail->Send();
    }
}

?>
