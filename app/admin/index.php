<?php

// MK
require_once __DIR__ .'/../_compatible_layer_patch.php';

// // oxid eSales � NFQ GmbH 2003
//
// Diese Software ist urheberrechtlich geschuetzt - sie ist
// KEINE Freeware.
//
// Die unerlaubte Verwendung dieser Software ohne gueltigen 
// Lizenzschluessel ist ein ein Verstoss gegen die Lizenz-
// bedingungen und wird straf- bzw. auch zivilrechtlich verfolgt.
//
// http://www.nfq-esales.de

if (!function_exists('getShopBasePath'))
{	function getShopBasePath()
	{	global $HTTP_SERVER_VARS;
        	
		// try path translated
		if( isset( $HTTP_SERVER_VARS['PATH_TRANSLATED']))
			$sFilepath = $HTTP_SERVER_VARS['PATH_TRANSLATED'];
		else 
			$sFilepath = $HTTP_SERVER_VARS['SCRIPT_FILENAME'];
		
		$sFilepath = strtolower( $sFilepath);
		
		$sFilepath = str_replace( "admin\\\\index.php", "", $sFilepath);
		$sFilepath = str_replace( "admin/index.php", "", $sFilepath);   	
		$sFilepath = str_replace( "index.php", "", $sFilepath);   	
		
		return $sFilepath;
	}
}

// MK
chdir(__DIR__);

require_once( "../oxconfig.php");
$myConfig->blAdmin = true;
require_once( "../index.php");

?>
