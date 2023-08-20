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

class oxcmp_utils extends oxView
{

	function getarticle()
	{	global $myConfig;
		
		$sID  = $myConfig->getParameter( "oxid");
		if( $sID)
		{	$oProduct = &oxNew( "oxarticle", "core");
        	$oProduct->Load( $sID);
		}
		else 
		{
	        $oArtList = &oxNew( "oxarticlelist", "core");
    	    $oArtList->LoadAktionArticles( "OXAFFILIATE");
    	    if( isset( $oArtList->aList))
    	    	$oProduct = current( $oArtList->aList);
			else 
				die( "OXID__Problem : no valid oxid !");
		}

    	$aExport = array();	
    	
    	$aClass_vars = get_object_vars( $oProduct);
    	// add all database fields
    	while (list($name, $value) = each($aClass_vars))
    	{	if( strstr( $name, "oxarticles"))
    		{	$sName = str_replace( "oxarticles__", "", $name);
    			$aExport[$sName] = $oProduct->$name->value;
    		}
    	}
    	
        $aExport['vatPercent'] 	= $oProduct->vatPercent;
        $aExport['netPrice'] 	= $oProduct->netPrice;
        $aExport['brutPrice'] 	= $oProduct->brutPrice;
        $aExport['vat'] 		= $oProduct->vat;
        $aExport['fprice'] 		= $oProduct->fprice;
        $aExport['ftprice'] 	= $oProduct->ftprice;
        
        $aExport['oxdetaillink'] 		= $oProduct->oxdetaillink;
        $aExport['oxmoredetaillink'] 	= $oProduct->oxmoredetaillink;
        $aExport['tobasketlink'] 		= $oProduct->tobasketlink;
        
        $aExport['thumbnaillink']		= $myConfig->getDynImageDir() ."/". $aExport['oxthumb'];
        
    	$sText = serialize( $aExport);
    	echo( $sText);

    	// stop shop here
		return "stop";
	}
	
	function getserial()
	{	global $myConfig;
	
		echo( str_rot13( $myConfig->sSerialNr));
	}
}

?>
