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

class User_extend extends oxAdminView
{
    function render()
    {   global $myConfig;
    
        parent::render();
        
        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oUser = &oxNew( "oxuser", "core");
            $oUser->Load( $soxId);
			$this->aViewData["edit"] =  $oUser;
        }
        
        return "user_extend.tpl";
    }
    
    function save()
    {   global $myConfig;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        $oUser = &oxNew( "oxuser", "core");
        if( $soxId != "-1")
            $oUser->Load( $soxId);
        else
            $aParams['oxuser__oxid'] = null;
            
        // checkbox handling
        $aParams['oxuser__oxactiv'] = $oUser->oxuser__oxactiv->value;
        if( !isset( $aParams['oxuser__oxdboptin']))
            $aParams['oxuser__oxdboptin'] = 0;

        $aParams = $oUser->ConvertNameArray2Idx( $aParams);
        $oUser->Assign( $aParams);
        $oUser->Save();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oUser->oxuser__oxid->value);
    }
    
}

?>
