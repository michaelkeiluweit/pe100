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


require_once( $myConfig->sCoreDir . "oxi18n.php");

class oxSelectlist extends oxI18n
{
    function oxSelectlist()
    {   
        $this->sClassName  = "oxselectlist";
        $this->Init( array( "oxselectlist"));
        
        parent::oxI18n();
    }
}

?>
