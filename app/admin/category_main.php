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

class Category_main extends oxAdminView
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

        // parent categorie tree
        $oCatTree = &oxNew( "oxCategoryList", "core");
        $oCatTree->select();
        // add Root as fake category
        $oRoot->oxcategories__oxnid->value  = "oxrootid";
        $oRoot->oxcategories__oxtitle->value= "-- Hauptkat. --";
        // rebuild list as we need the root entry at the first position
        $aNewList = array();
        $aNewList[] = $oRoot;
        while (list($key, $val) = each($oCatTree->aList))
        {   if( isset($sChosenArtCat) && $val->oxcategories__oxnid->value == $sChosenArtCat)
                $val->selected = 1;
            $aNewList[] = $val;
        }
        $oCatTree->aList = $aNewList;

        // copy this tree for our article choose
        $sChosenArtCat = $myConfig->getParameter( "artcat");
        $oArticleList = $oCatTree;
        $oArticleList->aList[0]->oxcategories__oxnid->value = null;
        $oArticleList->aList[0]->oxcategories__oxtitle->value = "-- nicht zugeordnet --";
        reset( $oArticleList->aList);
        while (list($key, $val) = each($oArticleList->aList))
        {   if( $val->oxcategories__oxnid->value == $sChosenArtCat)
            {   $val->selected = 1;
                $oArticleList->aList[$key] = $val;
                break;
            }
        }

        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oCategory = &oxNew( "oxcategory", "core");
            $oCategory->Load( $soxId);
            $this->aViewData["edit"] =  $oCategory;
            
            // load object in other languages
            $oOtherLang = $oCategory->GetAvailI18nObjects();
            // remove already created languages
            $possLanguages = $myConfig->GetLanguageArray();
            foreach( $oOtherLang->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->sLanguage;
                reset( $possLanguages);
                while (list($key, $val) = each($possLanguages))
                {   if( $key == $sSearchKey)
                    {   // already in, so lets remove it
                        unset( $possLanguages[$key]);
                        break;
                    }
                }
            }
            $this->aViewData["posslang"] =  $possLanguages;

            // load articles from chosen categorie
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid ";
            $iLanguage = $myConfig->getParameter( "language");
            if( !isset( $sChosenArtCat) || !$sChosenArtCat)
                 $sSelect .= "where oxobject2category.oxobjectid is NULL";
            else
                $sSelect .= "where oxobject2category.oxcatnid = '$sChosenArtCat' and oxarticles.oxlang = $iLanguage and oxarticles.oxparentid is null order by oxobject2category.oxpos ";
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
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid ";
            $sSelect .= "where oxobject2category.oxcatnid = '".$oCategory->oxcategories__oxnid->value."' and oxarticles.oxlang = $iLanguage and oxarticles.oxparentid is null ";
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

            // remove ourselve from articlecattree
            reset( $oArticleList->aList);
            while (list($key, $val) = each($oArticleList->aList))
            {   if( $val->oxcategories__oxnid->value == $oCategory->oxcategories__oxnid->value)
                {   // already in, so lets remove it
                    unset( $oArticleList->aList[$key]);
                    break;
                }
            }

            // generate posslanguage
            reset( $oOtherLang->aList);
            while (list($key, $val) = each($oOtherLang->aList))
            {   if( $val->sLanguage == $oCategory->sLanguage)
                {   $val->selected = 1;
                    $oOtherLang->aList[$key] = $val;
                    break;
                }
            }
            $this->aViewData["otherlang"] =  $oOtherLang;
            
            // parent categorie tree
            while (list($key, $val) = each($oCatTree->aList))
            {   if( $val->oxcategories__oxnid->value == $oCategory->oxcategories__oxparentid->value)
                {   $val->selected = 1;
                    $oCatTree->aList[$key] = $val;
                }
                if( $val->oxcategories__oxnid->value == $oCategory->oxcategories__oxnid->value)
                    unset( $oCatTree->aList[$key]);
            }

        }

        $this->aViewData["cattree"]     =  $oCatTree;
        $this->aViewData["artcattree"]  =  $oArticleList;

        return "category_main.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxcategories__oxactiv']))
            $aParams['oxcategories__oxactiv'] = 0;

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxcategories__oxshopid'] = $sShopID;

        $oCategory = &oxNew( "oxcategory", "core");
        if( $soxId != "-1")
            $oCategory->Load( $soxId);
        else
            $aParams['oxcategories__oxid'] = null;
        $aParams = $oCategory->ConvertNameArray2Idx( $aParams);
        $oCategory->Assign( $aParams);
        $oCategory = parent::ProcessFiles( $oCategory);
        $oCategory->Save();

        // if parentid is changed we need to set it to all languages
        $oAllLang = $oCategory->GetAvailI18nObjects();
        foreach( $oAllLang->aList as $oCat)
        {
            $oCat->oxcategories__oxparentid->value = $oCategory->oxcategories__oxparentid->value;
            $oCat->Save();
        }
        
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oCategory->oxcategories__oxid->value);
    }

    function saveinnlang()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxcategories__oxactiv']))
            $aParams['oxcategories__oxactiv'] = 0;

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxcategories__oxshopid'] = $sShopID;
        
        $oCategory = &oxNew( "oxcategory", "core");
        
        if( $soxId != "-1")
            $oCategory->Load( $soxId);
        else
            $aParams['oxcategories__oxid'] = null;
        $aParams = $oCategory->ConvertNameArray2Idx( $aParams);
        $oCategory->Assign( $aParams);

        // apply new language
        $sNewLanguage = $myConfig->getParameter( "new_lang");
        $oCategory->SetLanguage( $sNewLanguage);
        
        $oCategory->insert();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oCategory->oxcategories__oxid->value);
    }


    function removearticle()
    {   global $myConfig;

        $aRemoveArt = $myConfig->getParameter( "artinthiscat");
        $soxId      = $myConfig->getParameter( "oxid");
        $oCategory  = &oxNew( "oxcategory", "core");
        $oCategory->Load( $soxId);

        if( isset( $aRemoveArt) && $aRemoveArt)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2category"));
            $sSelect =  "select * from oxobject2category ";
            $sSelect .= "where oxobject2category.oxcatnid='".$oCategory->oxcategories__oxnid->value."' and ";
            $blSep = false;
            foreach($aRemoveArt as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2category.oxobjectid = '$sRem'";
                $blSep = true;
            }
            $sSelect .= ")";
            $oGroups->selectString( $sSelect);
            foreach($oGroups->aList as $sRemgroup)
                $sRemgroup->delete();
        }
    }

    function addarticle()
    {   global $myConfig;

        $aAddArticle = $myConfig->getParameter( "allartincat");
        $soxId       = $myConfig->getParameter( "oxid");
        $oCategory = &oxNew( "oxcategory", "core");
        $oCategory->Load( $soxId);

        $oGroups = &oxNew( "oxlist", "core");
        $oGroups->Init( "oxbase");
        $oGroups->oLstoTpl->Init( array( "oxobject2category"));

        if( isset( $aAddArticle) && $aAddArticle)
        {   foreach($aAddArticle as $sAdd)
            {   // check, if it's already in, then don't add it again
                $sSelect =  "select * from oxobject2category ";
                $sSelect .= "where oxobject2category.oxcatnid='".$oCategory->oxcategories__oxnid->value."' and oxobject2category.oxobjectid ='".$sAdd."'";
                $oGroups->aList = array();
                $oGroups->selectString( $sSelect);
                if( count( $oGroups->aList))
                    continue;   // already in

                $oNewGroup = &oxNew( "oxbase", "core");
                $oNewGroup->Init( array( "oxobject2category"));
                $oNewGroup->oxobject2category__oxobjectid->value= $sAdd;
                $oNewGroup->oxobject2category__oxcatnid->value  = $oCategory->oxcategories__oxnid->value;
                $oNewGroup->Save();
            }
        }
    }


}

?>
