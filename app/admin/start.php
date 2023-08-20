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


require_once( "../oxconfig.php");
$myConfig->blAdmin = true;
require_once( "oxadminview.php");

class Start extends oxAdminView
{
    function render()
    {   
        parent::render();
        
        return "start.tpl";
    }
    
}

?>