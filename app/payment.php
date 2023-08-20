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

class Payment extends oxUBase
{
    var $oBasket        = null;
    var $sNewAdressID   = null;
    
    function init()
    {   global $myConfig;
        global $mySession;

        parent::init();
        
        $soxAddressId = $myConfig->getParameter( "oxaddressid");
        if( $soxAddressId)
            $myConfig->setParameter( "deladdrid", $soxAddressId);
        
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $this->oTopOffer = @current( $oArtList->aList);
    }

    function render()
    {   global $myConfig;
        global $mySession;

        parent::render();

        $sBoni      = $this->oActUser->oxuser__oxboni->value;
        $aGroups    = $this->oActUser->oGroups->aList;
        
        $oList = &oxNew( "oxlist", "core");
        $oList->Init( "oxpayment");
        $sSelect  = "select oxpayments.* from oxpayments ";
        $sSelect .= "left join oxobject2group on oxobject2group.oxobjectid = oxpayments.oxid ";
        $sSelect .= "where oxpayments.oxactiv = 1 and oxpayments.oxshopid = '".$myConfig->getShopId()."' ";
        $sSelect .= "and oxpayments.oxfromboni <= $sBoni and oxobject2group.oxgroupsid in (";
        $blSep = false;
        if( isset( $aGroups))
        {	foreach( $aGroups as $oGroup)
	        {   if( $blSep)
	                $sSelect .= ",";
	            $sSelect .= "'".$oGroup->oxgroups__oxid->value."'";
	            $blSep = true;
	        }
        }
        $sSelect .= ")";
        $oList->selectstring( $sSelect);

        // dynamic values
        while (list($key, $oPayment) = each($oList->aList))
        {   $oPayment->aDynValues = AssignValuesFromText( $oPayment->oxpayments__oxvaldesc->value);
            $oList->aList[$key] = $oPayment;
        }
        $this->aViewData["payments"] = $oList->aList;

        $this->oBasket = $mySession->getVar( "basket");
        $this->aViewData['toparticle'] = $this->oTopOffer;
        $this->aViewData["basket"]  = $this->oBasket;
        
        return "payment.tpl";
    }
    
}

?>
