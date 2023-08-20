<?php
// oxid eSales © NFQ GmbH 2003
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

class alist extends oxUBase
{
    var $aArticleList       = null;
    var $iActPage           = 0;
    var $iAllArtCnt         = 0;
    var $aTopAngeboteList   = null;

    function init()
    {   global $myConfig;

        parent::init();
        
        $sActCat        = $myConfig->getParameter("cnid");
        $this->iActPage = $myConfig->getParameter("pgNr");
        if( !isset( $this->iActPage))
            $this->iActPage = 0;
        
        $oArtList = &oxNew( "oxarticlelist", "core");
        // load only articles which we show on screen
        $oArtList->iSQLRecords  = $myConfig->iNrofCatArticles;
        $oArtList->iSQLStart    = $myConfig->iNrofCatArticles * $this->iActPage;
        // load the articles
        $this->iAllArtCnt = $oArtList->LoadCategoryArticles( $sActCat);
        $this->aArticleList = $oArtList->aList;

        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( $this->oActCategory->oxcategories__oxtitle->value);
        $this->aTopAngeboteList = $oArtList->aList;

    }

    function render()
    {   global $myConfig;
        global $mySession;
        
        parent::render();

        $this->aViewData['articlelist'] = $this->aArticleList;
        
        $oTopOffer 		= null;
        $oBargainOffer 	= null;

        if( $this->aTopAngeboteList)
        {	foreach( $this->aTopAngeboteList as $oOffer)
	        {	
	        	if( !$oTopOffer)
	        		$oTopOffer = $oOffer;
	        	elseif( !$oBargainOffer)
	            	$oBargainOffer = $oOffer;
	        }
        }
                
        $this->aViewData['toparticle']		= $oTopOffer;
        $this->aViewData['articlebargain']	= $oBargainOffer;

        // generate the page navigation
        $pageNavigation->iArtCnt    = $this->iAllArtCnt;
        $pageNavigation->NrOfPages  = round( $this->iAllArtCnt/$myConfig->iNrofCatArticles + 0.49);
        $pageNavigation->actPage    = $this->iActPage + 1;
        $sActCat = $myConfig->getParameter("cnid");
        if( $this->iActPage > 0)
            $pageNavigation->previousPage = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=".($this->iActPage-1)."&cnid=$sActCat");
        else
            $pageNavigation->previousPage = null;
            
        if( $this->iActPage < $pageNavigation->NrOfPages-1)
            $pageNavigation->nextPage = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=".($this->iActPage+1)."&cnid=$sActCat");
        else
            $pageNavigation->nextPage = null;

        if( $pageNavigation->NrOfPages > 1)
        {   for ($i=1; $i < $pageNavigation->NrOfPages + 1; $i++)
            {	$page->url = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=".($i-1)."&cnid=$sActCat");
				$page->selected = 0;
				if( $i == $pageNavigation->actPage)
					$page->selected = 1;
				$pageNavigation->changePage[$i] = $page;
			}
			// first/last one
			$pageNavigation->firstpage = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=0&cnid=$sActCat");
			$iLast =  $pageNavigation->NrOfPages - 1;
			$pageNavigation->lastpage = $mySession->url( "index.php?cl=".$this->sThisAction."&pgNr=".$iLast."&cnid=$sActCat");
		}

        $this->aViewData['pageNavigation'] = $pageNavigation;
        
        $sTemplate = "list.tpl";
        if( $this->oActCategory->oxcategories__oxtemplate->value)
        	$sTemplate = $this->oActCategory->oxcategories__oxtemplate->value;
        
        return $sTemplate;
    }
    
}

?>
