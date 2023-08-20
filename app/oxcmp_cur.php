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

class oxcmp_cur extends oxView
{
    var $aCurrencies    = null;
    var $oActCur        = null;
    
    function init()
    {   global $myConfig;
        global $mySession;

        $iCur = $myConfig->getParameter("cur");
        if( isset( $iCur))
        {   // set new currency
            $myConfig->setParameter("currency", $iCur);
            // recalc basket
            $oBasket = $mySession->getVar( "basket");
            $oBasket->blCalcNeeded = true;
            $mySession->setVar( "basket", $oBasket);

        }

        $iActCur = $myConfig->getShopCurrency();
        $this->aCurrencies  = $myConfig->GetCurrencyArray( $iActCur);
        $this->oActCur      = $this->aCurrencies[$iActCur];

        $sClass = $myConfig->getParameter( "cl");
        $sFnc   = $myConfig->getParameter( "fnc");
        if( $sFnc == "tobasket")	
        	$sFnc = "";
        $sCatnid= $myConfig->getParameter( "cnid");
        $sArtnid= $myConfig->getParameter( "anid");
        $sURL   = $mySession->url( "index.php?cl=$sClass&fnc=$sFnc&cnid=$sCatnid&anid=$sArtnid");

        $sTpl   = $myConfig->getParameter( "tpl");
        if( $sTpl)
            $sURL .= "&tpl=$sTpl";

        while(list($key, $val)=each($this->aCurrencies))
        {   $val->link                  = $sURL."&cur=".$val->id;
            $this->aCurrencies[$key]    = $val;
        }
        
        parent::init();
    }
    
    function render()
    {
        parent::render();
        
        $this->oParent->aViewData['currency']    = $this->oActCur;
        
        return $this->aCurrencies;
    }

}

?>
