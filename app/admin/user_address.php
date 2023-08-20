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
require_once( "oxadminview.php");

class User_address extends oxAdminView
{
	var $blDelete = false;
	
    function render()
    {   global $myConfig;
    
        parent::render();

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oUser = &oxNew( "oxuser", "core");
            $oUser->Load( $soxId);
            
			// load adress
			$soxAddressId    = $myConfig->getParameter( "oxaddressid");
            $oCurAdress      = current($oUser->oAddresses->aList);
			if( (!$soxAddressId || $this->blDelete) && isset( $oCurAdress))
				$soxAddressId = $oCurAdress->oxaddress__oxid->value;
        	
            if( $soxAddressId != "-1" && isset( $soxAddressId))
			{	$oAdress = &oxNew( "oxbase", "core");
        		$oAdress->Init( array( "oxaddress"));
				$oAdress->Load( $soxAddressId);
				$this->aViewData["edit"] =  $oAdress;
			}
			if( !$soxAddressId)
				$soxAddressId = "-1";
			$this->aViewData["oxaddressid"]	= $soxAddressId;

           	// generate selected
           	while (list($key, $val) = each($oUser->oAddresses->aList))
           	{	if( $val->oxaddress__oxid->value == $soxAddressId)
               	{   $val->selected = 1;
                   	$oUser->oAddresses->aList[$key] = $val;
                   	break;
               	}
           	}
				
			$this->aViewData["edituser"] =  $oUser;
		}
		        
        return "user_address.tpl";
    }

    function save()
    {   global $myConfig;
    
        $aParams    	= $myConfig->getParameter( "editval");
		
		$oAdress = &oxNew( "oxbase", "core");
        $oAdress->Init( array( "oxaddress"));
				
        if( $aParams['oxaddress__oxid'] == "-1")
            $aParams['oxaddress__oxid'] = null;
        $aParams = $oAdress->ConvertNameArray2Idx( $aParams);
        $oAdress->Assign( $aParams);
        $oAdress->Save();
    }
	
	function DelAddress()
	{	global $myConfig;
	
        $aParams    	= $myConfig->getParameter( "editval");
		
		$oAdress = &oxNew( "oxbase", "core");
        $oAdress->Init( array( "oxaddress"));
        
        if( $aParams['oxaddress__oxid'] != "-1")
        {
			$oAdress->Load( $aParams['oxaddress__oxid']);
			$oAdress->delete();
			$this->blDelete = true;
		}
	}
	
}

?>
