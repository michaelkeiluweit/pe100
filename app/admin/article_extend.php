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

class Article_extend extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");
        
        // all categories
        $oCatTree = &oxNew( "oxCategoryList", "core");
        $oCatTree->select();
        
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $soxId);
            $this->aViewData["edit"] =  $oArticle;

            // variant handling
            if( $oArticle->oxarticles__oxparentid->value)
            {   $oParentArticle = &oxNew( "oxarticle", "core");
                $oParentArticle->NLoad( $oArticle->oxarticles__oxparentid->value);
                $this->aViewData["parentarticle"] =  $oParentArticle;
                $this->aViewData["oxparentid"] =  $oArticle->oxarticles__oxparentid->value;
            }

            // all categories this article is in
            $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2category", "oxcategories"));
            $sSelect =  "select * from oxobject2category left join oxcategories on oxcategories.oxnid=oxobject2category.oxcatnid ";
            $sSelect .= "where oxobject2category.oxobjectid='".$oArticle->oxarticles__oxnid->value."' ";
            $sSelect .= "and oxcategories.oxlang = $oGroups->sLanguage";
            $oGroups->selectString( $sSelect);
            $this->aViewData["allartcat"] =  $oGroups->aList;
            // remove already assigned categories from all list
            foreach( $oGroups->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->oxcategories__oxnid->value;
                reset( $oCatTree->aList);
                while (list($key, $val) = each($oCatTree->aList))
                {   if( $val->oxcategories__oxnid->value == $sSearchKey)
                    {   // already in, so lets remove it
                        unset( $oCatTree->aList[$key]);
                        break;
                    }
                }
            }

        }
        
        $this->aViewData["allcat"] =  $oCatTree->aList;

        return "article_extend.tpl";
    }
    
    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        
        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxarticles__oxshopid'] = $sShopID;
        
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);
        $aParams = $oArticle->ConvertNameArray2Idx( $aParams);
        $oArticle->Assign( $aParams);
        $oArticle = parent::ProcessFiles( $oArticle);
        $oArticle->Save();
    }
    
    function addcat()
    {   global $myConfig;

        $aAddCat   = $myConfig->getParameter( "allcat");
        $soxId     = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aAddCat) && $aAddCat)
        {   foreach($aAddCat as $sAdd)
            {   $oNew = &oxNew( "oxbase", "core");
                $oNew->Init( array( "oxobject2category"));
                $oNew->oxobject2category__oxobjectid->value= $oArticle->oxarticles__oxnid->value;
                $oNew->oxobject2category__oxcatnid->value  = $sAdd;
                $oNew->Save();
            }
        }
    }

    function removecat()
    {   global $myConfig;

        $aRemoveCat = $myConfig->getParameter( "allartcat");
        $soxId      = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aRemoveCat) && $aRemoveCat)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2category"));
            $sSelect =  "select * from oxobject2category ";
            $sSelect .= "where oxobject2category.oxobjectid='".$oArticle->oxarticles__oxnid->value."' and ";
            $blSep = false;
            foreach($aRemoveCat as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2category.oxcatnid = '$sRem'";
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
