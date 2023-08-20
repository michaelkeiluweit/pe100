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

class User extends oxUBase
{
    var $oBasket        = null;
    var $sNewAdressID   = null;
    
    function init()
    {   global $myConfig;
        global $mySession;

        parent::init();
        
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $this->oTopOffer = @current( $oArtList->aList);
    }

    function render()
    {   global $myConfig;
        global $mySession;

        parent::render();
        
        $this->oBasket = $mySession->getVar( "basket");
        $this->aViewData['toparticle'] = $this->oTopOffer;
        $this->aViewData["basket"]  = $this->oBasket;
        
		if( $this->sNewAdressID)
			$soxAddressId = $this->sNewAdressID;
		else
            $soxAddressId    = $myConfig->getParameter( "oxaddressid");

		if( !$soxAddressId && $this->oActUser)
		{	reset( $this->oActUser->oAddresses->aList);
            $oCurAdress   = current($this->oActUser->oAddresses->aList);
            if( isset( $oCurAdress))
                $soxAddressId = $oCurAdress->oxaddress__oxid->value;
        }

       	if( $this->oActUser && $soxAddressId)
        {   // generate selected
        	$val->oxaddress__oxid->value 		= -2;
        	$val->oxaddress__oxfname->value		= "-";
        	$val->oxaddress__oxlname->value		= "-";
        	$val->oxaddress__oxcity->value		= "-";
        	$this->oActUser->oAddresses->aList[] = $val;
           	while (list($key, $val) = each($this->oActUser->oAddresses->aList))
           	{	if( $val->oxaddress__oxid->value == $soxAddressId)
               	{   $val->selected = 1;
                   	$this->oActUser->oAddresses->aList[$key] = $val;
                   	break;
               	}
           	}
        }			

    	if( $soxAddressId != "-1" && isset( $soxAddressId))
		{	$oAdress = &oxNew( "oxbase", "core");
    		$oAdress->Init( array( "oxaddress"));
			$oAdress->Load( $soxAddressId);
			
			$this->aViewData["delivadr"] =  $oAdress;
		}

        return "user.tpl";
    }
    
}

?>
