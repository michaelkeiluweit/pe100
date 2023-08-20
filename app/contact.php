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

class Contact extends oxUBase
{
    function render()
    {   global $myConfig;
    
        parent::render();

        // topoffer
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $oTopOffer = @current( $oArtList->aList);
        if( isset( $oTopOffer))
            $this->aViewData['toparticle'] = $oTopOffer;
            
        $this->aViewData['c_subject'] = $myConfig->getParameter("c_subject");
        $this->aViewData['c_message'] = $myConfig->getParameter("c_message");
            
        return "contact.tpl";
    }
    
    function send()
    {   global $myConfig;
    
        $aParams    = $myConfig->getParameter("editval");
        $sSubject   = $myConfig->getParameter("c_subject");
        
        if( !$aParams['oxuser__oxfname'] || !$aParams['oxuser__oxlname'] || !$aParams['oxuser__oxusername'] || !$sSubject)
        {   $this->aViewData['error'] = 1;
            return;
        }
             
        $sMessage  = "Message from ".$aParams['oxuser__oxsal']." ".$aParams['oxuser__oxfname']." ".$aParams['oxuser__oxlname']."(".$aParams['oxuser__oxusername'].")\n\n";
        $sMessage .= $myConfig->getParameter("c_message");
        
        $oxEMail = &oxNew( "oxemail", "core");

        if( $oxEMail->SendContactMail( $aParams['oxuser__oxusername'], $sSubject, $sMessage))
            $this->aViewData['success'] = 1;
    }

}

?>
