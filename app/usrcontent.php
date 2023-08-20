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


require_once( "oxconfig.php");
require_once( "oxview.php");

class Usrcontent extends oxView
{
    function render()
    {   global $myConfig;
    
        parent::render();
        
		$sUseTpl = $myConfig->getParameter("tpl");
		if( $sUseTpl)
			$myConfig->setParameter("tpl", $sUseTpl);
			
        parent::render();
        
        return $sUseTpl;
    }
}

?>