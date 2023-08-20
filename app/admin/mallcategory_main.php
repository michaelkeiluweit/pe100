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
require_once( "category_main.php");

class MallCategory_main extends Category_main
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
        $oCatTree->iListType  = 1;      // mall cats
        $oCatTree->select();
        // add Root as fake category
        $oRoot->oxcategories__oxnid->value  = "oxrootid";
        $oRoot->oxcategories__oxtitle->value= "-- root cat. --";
        // rebuild list as we need the root entry at the first position
        $aNewList = array();
        $aNewList[] = $oRoot;
        while (list($key, $val) = each($oCatTree->aList))
        {   if( isset($sChosenArtCat) && $val->oxcategories__oxnid->value == $sChosenArtCat)
                $val->selected = 1;
            $aNewList[] = $val;
        }
        $oCatTree->aList = $aNewList;

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

        return "mallcategory_main.tpl";
    }
}

?>
