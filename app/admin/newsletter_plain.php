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

class Newsletter_plain extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();
        
        $soxId = $myConfig->getParameter( "oxid");
        // check if we right now saved a new entry
        $sSavedID = $myConfig->getParameter( "saved_oxid");
        if( ($soxId == "-1" || !isset( $soxId)) && isset( $sSavedID) )
        {   $soxId = $sSavedID;
            $myConfig->delParameter( "saved_oxid");
            $this->aViewData["oxid"] =  $soxId;
            // for reloading upper frame
            $this->aViewData["updatelist"] =  "1";
        }

        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oNewsletter = &oxNew( "oxnewsletter", "core");
            $oNewsletter->Load( $soxId);
            $this->aViewData["edit"] =  $oNewsletter;
        }

        return "newsletter_plain.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxnewsletter__oxshopid'] = $sShopID;

        $oNewsletter = &oxNew( "oxnewsletter", "core");
        if( $soxId != "-1")
            $oNewsletter->Load( $soxId);
        else
            $aParams['oxnewsletter__oxid'] = null;
        $aParams = $oNewsletter->ConvertNameArray2Idx( $aParams);
        $oNewsletter->Assign( $aParams);
        $oNewsletter->Save();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oNewsletter->oxnewsletter__oxid->value);
    }
}

?>
