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

class oxDelivery extends oxBase
{
    function oxDelivery()
    {   
        $this->sClassName  = "oxdelivery";
        $this->Init( array( "oxdelivery"));
        
        parent::oxBase();
    }
}

?>
