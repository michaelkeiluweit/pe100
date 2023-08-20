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

class Thankyou extends oxUBase
{
	var $oBasket        = null;
    
    function init()
    {   global $myConfig;
        global $mySession;

		// get basket we might need some information from it here
    	$this->oBasket  = $mySession->getVar( "basket");
        
        // and now delete it from the session
        $mySession->deleteVar( "basket");
                
        parent::init();
        
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $this->oTopOffer = @current( $oArtList->aList);
    }
    
    function render()
    {   global $mySession;
        
        parent::render();

        $this->aViewData['toparticle'] = $this->oTopOffer;
        $this->aViewData["basket"]  = $this->oBasket;
        
        // load order
        $oOrder = &oxNew( "oxorder", "core");
        $oOrder->Load( $this->oBasket->sOrderID);
        
        $this->aViewData["order"]  = $oOrder;
            
        return "thankyou.tpl";
    }
}

?>
