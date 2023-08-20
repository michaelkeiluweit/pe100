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

class Info extends oxUBase
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
            
        // delivery
        $oDelList = &oxNew( "oxdeliverylist", "core");
        $oDelList->select();
        $this->aViewData['deliverylist'] = $oDelList->aList;

        $sTplName = $myConfig->getParameter("tpl");

        return $sTplName;
    }
}

?>
