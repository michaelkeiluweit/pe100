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

class moreDetails extends oxUBase
{
    var $oProduct   = null;

    function init()
    {   global $myConfig;

        parent::init();

        $soxnid = $myConfig->getParameter("anid");

        $this->oProduct = &oxNew( "oxarticle", "core");
        $this->oProduct->NLoad( $soxnid);
    }

    function render()
    {   global $myConfig;
        global $mySession;
        
        $this->aViewData["product"] =  $this->oProduct;

        parent::render();
        
        return "moredetails.tpl";
    }
    
}

?>
