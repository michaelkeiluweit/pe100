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

class Start extends oxUBase
{
    var $aStartArticleList  = null;
    var $aTopAngeboteList   = null;
    var $aNewestArticles    = null;
    
    function init()
    {   global $mySession;
        global $myConfig;

        $oActShop = &oxNew( "oxshop", "core");
        $oActShop->Load( $myConfig->getShopId());

        // set remote cat
        $myConfig->setParameter("cdefnid", $oActShop->oxshops__oxdefcat->value);

        parent::init();
    }
    
    function render()
    {   global $myConfig;
	
        parent::render();

        // start list
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXSTART");
        $this->aStartArticleList = $oArtList->aList;
        $this->aViewData['articlelist'] = $this->aStartArticleList;

        // topoffer
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $this->aTopAngeboteList = $oArtList->aList;
        if( isset( $this->aTopAngeboteList))
            $oTopOffer = current( $this->aTopAngeboteList);
        if( isset( $oTopOffer))
            $this->aViewData['toparticle'] = $oTopOffer;

		if( $myConfig->IsAddSales())
        {	// newest articles
	        $oArtList = &oxNew( "oxarticlelist", "core");
	        $oArtList->LoadNewestArticles();
	        $this->aNewestArticles = $oArtList->aList;
	        $this->aViewData['aNewestArticles'] = $this->aNewestArticles;
	
	        // top 5 articles
	        $oArtList = &oxNew( "oxarticlelist", "core");
	        $oArtList->LoadTop5Articles();
	        $this->aViewData['aTop5Articles'] = $oArtList->aList;
		}
		
        // top articles ( big one )
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXFIRSTSTART");
        $this->aViewData['firstarticle'] = @current( $oArtList->aList);

        // bargain - right side
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXBARGAIN");
        $this->aViewData['articlebargain'] = @current( $oArtList->aList);

        return "start.tpl";
    }
}

?>
