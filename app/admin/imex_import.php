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
require( "inc/auth.inc.php");
require_once( "discount_main.php");

class Imex_import extends oxAdminView
{
    function render()
    {   global $myConfig;
    	global $HTTP_SERVER_VARS;

        parent::render();
        
        $sFilepath = $myConfig->getParameter( "filepath");
        if( !isset( $sFilepath))
        {	$sFilepath = getShopBasePath();
			$sFilepath.= "import/oxexport.csv";
        }
		
        $this->aViewData["filepath"] =  $sFilepath;
        
        return "imex_import.tpl";
    }

}

?>
