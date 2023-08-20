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

class oxDiscount extends oxBase
{
    function oxDiscount()
    {   
        $this->sClassName  = "oxdiscount";
        $this->Init( array( "oxdiscount"));
        
        parent::oxBase();
    }
}

?>
