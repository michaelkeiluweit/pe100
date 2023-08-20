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

class Help extends oxUBase
{
    function init()
    {   global $mySession;

        parent::init();
    }

    function render()
    {   global $myConfig;
    
        $sDefaultHelpURL = $myConfig->sShopURL . "help/default.inc.tpl";
        $sHelpPage       = $myConfig->getParameter("page");
        
        if( isset( $sHelpPage) && $sHelpPage)
            $sHelpURL  = $myConfig->sShopURL . "help/" . $sHelpPage.".inc.tpl";
        else
            $sHelpURL  = $sDefaultHelpURL;

        $sHelpText = @implode ('', @file( $sHelpURL));
        if( !$sHelpText)
            $sHelpText = @implode ('', @file( $sHelpURL));
            
        $this->aViewData["helptext"] = $sHelpText;
        
        // topoffer
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $oTopOffer = @current( $oArtList->aList);
        if( isset( $oTopOffer))
            $this->aViewData['toparticle'] = $oTopOffer;

        parent::render();
        
        return "help.tpl";
    }
}

?>
