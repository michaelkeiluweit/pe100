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


require_once( $myConfig->sCoreDir . "oxlist.php");

class oxArticleList extends oxList
{
    function oxArticleList()
    {
        parent::oxList();
        $this->Init();

        // set callback so that Shopowner is able to add any information to the article
        $this->aAssignCallback = array( &$this, "AddCustomArticleData");
    }

    function Init( $sListObject = null)
    {
        $this->oLstoTpl = &oxNew( "oxarticle", "core");
    }
    
    function BuildSelectString( $aWhere=false, $aOrder = false, $sDescending = false, $blCnt = false)
    {
        if( !isset( $aWhere))
            $aWhere = array();
            
        // we add this, so that article list never shows variants
        // only real articles
        $aWhere['oxarticles.oxparentid'] = "is null";
        
        $sRet = parent::BuildSelectString( $aWhere, $aOrder, $sDescending, $blCnt);
        
        if( strstr( $sRet, "oxarticles.oxactiv like '1'"))
            $sRet = str_replace( "oxarticles.oxactiv like '1'",GetActivSnippet( "oxarticles"),$sRet);
            
        return $sRet;
    }
    
    function LoadAktionArticles( $sAktion)
    {
        if( !$this->select( array( "oxarticles.oxactiv" => 1, "oxarticles.oxaktion" => "%$sAktion%")))
            $this->aList = null;
    }

    function LoadCategoryArticles( $sCatNID)
    {
        $this->oLstoTpl->Init( array( "oxarticles"));
        $sSelect =  "select oxarticles.* from oxarticles left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid ";
        $sSelect .= "where oxobject2category.oxcatnid = '$sCatNID' and oxarticles.oxlang = ".$this->sLanguage;
        $sSelect .= " and ".GetActivSnippet( "oxarticles")." and oxarticles.oxparentid is null and oxshopid = '".$this->sShopID."' order by oxobject2category.oxpos";
        $this->selectString( $sSelect);
        //echo( $sSelect);
        
        $sSelect =  "select count(oxarticles.oxid) from oxarticles left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid ";
        $sSelect .= "where oxobject2category.oxcatnid = '$sCatNID' and ".GetActivSnippet( "oxarticles")." and oxshopid = '".$this->sShopID."' and oxarticles.oxparentid is null and oxarticles.oxlang = ".$this->sLanguage;
        return $this->GetSelectStringCount( $sSelect);
    }

    function AddCustomArticleData( $oArticle)
    {
        // $oArticle->oxarticles__oxtitle->value = "HURZ";

        return $oArticle;
    }
    
    function LoadNewestArticles()
    {
        $this->iSQLRecords  = 5;
        $this->iSQLStart    = 0;
        $this->select( array( "oxarticles.oxactiv" => 1), array( "oxarticles.oxinsert"));
    }

    function LoadTop5Articles()
    {
        $this->iSQLRecords  = 5;
        $this->iSQLStart    = 0;
        
        $this->oLstoTpl->Init( array( "oxarticles"));
        $sSelect =  "select oxarticles.*, sum( oxorderarticles.oxamount) as anzahl from oxorderarticles left join oxarticles on oxarticles.oxid=oxorderarticles.oxartid ";
        $sSelect .= "where oxarticles.oxlang = ".$this->sLanguage;
        $sSelect .= " and ".GetActivSnippet( "oxarticles")." and oxarticles.oxparentid is null and oxshopid = '".$this->sShopID."' ";
        $sSelect .= "group by oxarticles.oxid order by anzahl desc ";
        $this->selectString( $sSelect);
    }

}

?>
