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

class Article_crossselling extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $sChosenArtCat = $myConfig->getParameter( "artcat");

        $oCatTree = &oxNew( "oxCategoryList", "core");
        $oCatTree->select();
        // add Root as fake category
        $oRoot->oxcategories__oxnid->value  = "oxrootid";
        $oRoot->oxcategories__oxtitle->value= "-- root cat. --";
        // rebuild list as we need the root entry at the first position
        $aNewList = array();
        $aNewList[] = $oRoot;
        while (list($key, $val) = each($oCatTree->aList))
        {   if( $val->oxcategories__oxnid->value == $sChosenArtCat)
                $val->selected = 1;
            $aNewList[] = $val;
        }
        $oCatTree->aList = $aNewList;
        $this->aViewData["artcattree"]     =  $oCatTree;
        
        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $soxId);
            $this->aViewData["edit"] =  $oArticle;
            
            // load articles from chosen categorie
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid ";
            $iLanguage = $myConfig->getParameter( "language");
            if( !isset( $sChosenArtCat) || !$sChosenArtCat)
                 $sSelect .= "where oxobject2category.oxobjectid is NULL";
            else
                $sSelect .= "where oxobject2category.oxcatnid = '$sChosenArtCat' and oxarticles.oxlang = $iLanguage order by oxarticles.oxartnum, oxobject2category.oxpos";
            // We do NOT use Shop Framework here as we do have to much overhead
            // this list can be up to 2500 entries
            $oDB = GetDB();
            $aList = array();
            $rs = $oDB->SelectLimit( $sSelect, 1000, 0);
            if ($rs != false && $rs->RecordCount() > 0)
            {   while (!$rs->EOF)
                {   $oArt->oxarticles__oxnid->value     = $rs->fields[0];
                    $oArt->oxarticles__oxartnum->value  = $rs->fields[1];
                    $oArt->oxarticles__oxtitle->value   = $rs->fields[2];
                    $aList[] = $oArt;
                    $rs->MoveNext();
                }
            }
            $this->aViewData["allartincat"] =  $aList;
            
            // load articles from OUR categorie
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2article on oxarticles.oxnid=oxobject2article.oxobjectid ";
            $sSelect .= "where oxobject2article.oxarticlenid = '".$oArticle->oxarticles__oxnid->value."' and oxarticles.oxlang = $iLanguage";
            // We do NOT use Shop Framework here as we do have to much overhead
            // this list can be up to 2500 entries
            $oDB = GetDB();
            $aList = array();
            $rs = $oDB->SelectLimit( $sSelect, 1000, 0);
            if ($rs != false && $rs->RecordCount() > 0)
            {   while (!$rs->EOF)
                {   $oArt->oxarticles__oxnid->value     = $rs->fields[0];
                    $oArt->oxarticles__oxartnum->value  = $rs->fields[1];
                    $oArt->oxarticles__oxtitle->value   = $rs->fields[2];
                    $aList[] = $oArt;
                    $rs->MoveNext();
                }
            }
            $this->aViewData["artthisincat"] =  $aList;

        }
        
        return "article_crossselling.tpl";
    }

    function addarticle()
    {   global $myConfig;

        $aAddArticle = $myConfig->getParameter( "allartincat");
        $soxId       = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aAddArticle) && $aAddArticle)
        {   foreach($aAddArticle as $sAdd)
            {   $oNewGroup = &oxNew( "oxbase", "core");
                $oNewGroup->Init( array( "oxobject2article"));
                $oNewGroup->oxobject2article__oxobjectid->value     = $sAdd;
                $oNewGroup->oxobject2article__oxarticlenid->value   = $oArticle->oxarticles__oxnid->value;
                $oNewGroup->Save();
            }
        }
    }

    function removearticle()
    {   global $myConfig;

        $aRemoveArt = $myConfig->getParameter( "artinthiscat");
        $soxId      = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aRemoveArt) && $aRemoveArt)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2article"));
            $sSelect =  "select * from oxobject2article ";
            $sSelect .= "where oxobject2article.oxarticlenid='".$oArticle->oxarticles__oxnid->value."' and ";
            $blSep = false;
            foreach($aRemoveArt as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2article.oxobjectid = '$sRem'";
                $blSep = true;
            }
            $sSelect .= ")";
            $oGroups->selectString( $sSelect);
            foreach($oGroups->aList as $sRemgroup)
                $sRemgroup->delete();
        }
    }

}

?>
