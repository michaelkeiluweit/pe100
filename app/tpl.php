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

class Tpl extends oxUBase
{
    function render()
    {   global $myConfig;
    
        parent::render();
        
        $sTplName = $myConfig->getParameter("tpl");
        
        return $sTplName;
    }
}

?>
