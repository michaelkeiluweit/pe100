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

class Search extends oxUBase
{
    var $aArticleList   = null;
    var $iActPage       = 0;
    var $iAllArtCnt     = 0;

    function init()
    {   global $myConfig;

        parent::init();
        
        $this->iActPage = $myConfig->getParameter("pgNr");
        if( !isset( $this->iActPage))
            $this->iActPage = 0;
            
        $sSearchStr = $myConfig->getParameter("sSearchParam");
        
        $oArtList = &oxNew( "oxarticlelist", "core");
        // load only articles which we show on screen
        $oArtList->iSQLRecords  = $myConfig->iNrofSearchArticles;
        $oArtList->iSQLStart    = $myConfig->iNrofSearchArticles * $this->iActPage;
        
        $sWhere = $this->GetWhere( $sSearchStr);

        // load the articles
        $sSelect  =  "select * from oxarticles where";
        $sSelect .=  GetActivSnippet( "oxarticles");
        $sSelect .= " and oxarticles.oxlang = ".$oArtList->sLanguage." and oxarticles.oxparentid is null ";
        $sSelect .= $sWhere;
        
        $oArtList->selectString( $sSelect);
        
        $sSelect =  "select count(oxid) from oxarticles where";
        $sSelect .=  GetActivSnippet( "oxarticles");
        $sSelect .= " and oxarticles.oxlang = ".$oArtList->sLanguage." and oxarticles.oxparentid is null ";
        $sSelect .= $sWhere;
        $this->iAllArtCnt = $oArtList->GetSelectStringCount( $sSelect);
        
        $this->aArticleList = $oArtList->aList;
    }

    function render()
    {   global $myConfig;
        global $mySession;
        
        $sSearchStr = $myConfig->getParameter("sSearchParam");
    
        $this->aViewData['articlelist']  = $this->aArticleList;
        $this->aViewData['sSearchParam'] = $sSearchStr;
        
        // generate the page navigation
        $pageNavigation->iArtCnt    = $this->iAllArtCnt;
        $pageNavigation->NrOfPages  = (int)( $this->iAllArtCnt/$myConfig->iNrofSearchArticles + 0.5);
        $pageNavigation->actPage    = $this->iActPage + 1;
        $sActCat = $myConfig->getParameter("cnid");
        if( $this->iActPage > 0)
            $pageNavigation->previousPage = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=".($this->iActPage-1)."&cnid=$sActCat&sSearchParam=$sSearchStr");
        else
            $pageNavigation->previousPage = null;
            
        if( $this->iActPage < $pageNavigation->NrOfPages-1)
            $pageNavigation->nextPage = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=".($this->iActPage+1)."&cnid=$sActCat&sSearchParam=$sSearchStr");
        else
            $pageNavigation->nextPage = null;

        if( $pageNavigation->NrOfPages > 1)
        {   $iStart = $pageNavigation->actPage;
        	if( $iStart + $myConfig->iNrofSearchPages > $pageNavigation->NrOfPages + 1)
        		$iStart = max( $pageNavigation->NrOfPages - $myConfig->iNrofSearchPages - 1, 1);
        	for ($i=$iStart; $i < min( $pageNavigation->NrOfPages + 1, $pageNavigation->actPage + $myConfig->iNrofSearchPages); $i++)
                $pageNavigation->changePage[$i] = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=".($i-1)."&cnid=$sActCat&sSearchParam=$sSearchStr");
        }
		if( $pageNavigation->actPage + $myConfig->iNrofSearchPages < $pageNavigation->NrOfPages + 1)
			$this->aViewData['morepages'] = 1;
			
        $this->aViewData['pageNavigation'] = $pageNavigation;
        
        parent::render();
        
        return "search.tpl";
    }
    
    function GetWhere( $sSearchString)
    {   // overload this function to change search behaviour
    
        $sSearch  = "and ( oxarticles.OXTITLE like '%$sSearchString%' ";
        $sSearch .= "or oxarticles.OXSHORTDESC  like '%$sSearchString%' ";
        $sSearch .= "or oxarticles.oxsearchkeys  like '%$sSearchString%') ";
    
        return $sSearch;
    }
    
}

?>
