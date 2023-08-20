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

class oxcmp_shop extends oxView
{
    var $oActShop = null;

    function init()
    {   global $myConfig;

        $this->oActShop = &oxNew( "oxshop", "core");
        $this->oActShop->Load( $myConfig->getShopId());
        
        $myConfig->SetSerial( $this->oActShop->oxshops__oxserial->value);
        
        parent::init();
    }
    
    function render()
    {
        parent::render();
        
        return $this->oActShop;
    }

}

?>
