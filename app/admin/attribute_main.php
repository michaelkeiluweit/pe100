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

class Attribute_main extends oxAdminView
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
            $oAttr = &oxNew( "oxattribute", "core");
            $oAttr->Load( $soxId);
            $this->aViewData["edit"] =  $oAttr;

            $iLanguage = $myConfig->getParameter( "language");

            // load articles from chosen attribute
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2attribute on oxarticles.oxnid=oxobject2attribute.oxobjectid ";
            $sSelect .= "where oxobject2attribute.oxattrid = '".$oAttr->oxattribute__oxid->value."' and oxarticles.oxlang = $iLanguage";
            // We do NOT use Shop Framework here as we do have to much overhead
            // this list can be up to 2500 entries
            $oDB = GetDB();
            $aList = array();
            $aListAllIn = array();
            $rs = $oDB->SelectLimit( $sSelect, 1000, 0);
            if ($rs != false && $rs->RecordCount() > 0)
            {   while (!$rs->EOF)
                {   $oArt->oxarticles__oxnid->value     = $rs->fields[0];
                    $aListAllIn[] = $oArt->oxarticles__oxnid->value;
                    $oArt->oxarticles__oxartnum->value  = $rs->fields[1];
                    $oArt->oxarticles__oxtitle->value   = $rs->fields[2];
                    $aList[] = $oArt;
                    $rs->MoveNext();
                }
            }
            $this->aViewData["artthisincat"] =  $aList;

            // load all articles without our attribute
            //$sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles where oxarticles.oxlang = $iLanguage and oxarticles.oxparentid is NULL";

          	// load articles from chosen categorie
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid ";
            $iLanguage = $myConfig->getParameter( "language");
            if( !isset( $sChosenArtCat) || !$sChosenArtCat)
                 $sSelect .= "where oxobject2category.oxobjectid is NULL";
            else
                $sSelect .= "where oxobject2category.oxcatnid = '$sChosenArtCat' order by oxobject2category.oxpos and oxarticles.oxlang = $iLanguage";
              
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
                    if( !in_array( $oArt->oxarticles__oxnid->value, $aListAllIn))
                        $aList[] = $oArt;
                    $rs->MoveNext();
                }
            }
            $this->aViewData["allartincat"] =  $aList;


        }

        $this->aViewData["cattree"]     =  $oCatTree;
        $this->aViewData["artcattree"]  =  $oArticleList;
        
        return "attribute_main.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxattribute__oxshopid'] = $sShopID;

        $oAttr = &oxNew( "oxattribute", "core");
        if( $soxId != "-1")
            $oAttr->Load( $soxId);
        else
            $aParams['oxattribute__oxid'] = null;
        $aParams = $oAttr->ConvertNameArray2Idx( $aParams);
        $oAttr->Assign( $aParams);
        $oAttr = parent::ProcessFiles( $oAttr);
        $oAttr->Save();

        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oAttr->oxattribute__oxid->value);
    }

    function removearticle()
    {   global $myConfig;

        $aRemoveArt = $myConfig->getParameter( "artinthiscat");
        $soxId      = $myConfig->getParameter( "oxid");
        $oCategory  = &oxNew( "oxattribute", "core");
        $oCategory->Load( $soxId);

        if( isset( $aRemoveArt) && $aRemoveArt)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2attribute"));
            $sSelect =  "select * from oxobject2attribute ";
            $sSelect .= "where oxobject2attribute.oxattrid='".$oCategory->oxattribute__oxid->value."' and ";
            $blSep = false;
            foreach($aRemoveArt as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2attribute.oxobjectid = '$sRem'";
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
        $oCategory = &oxNew( "oxattribute", "core");
        $oCategory->Load( $soxId);

        if( isset( $aAddArticle) && $aAddArticle)
        {   foreach($aAddArticle as $sAdd)
            {   $oNewGroup = &oxNew( "oxbase", "core");
                $oNewGroup->Init( array( "oxobject2attribute"));
                $oNewGroup->oxobject2attribute__oxobjectid->value= $sAdd;
                $oNewGroup->oxobject2attribute__oxattrid->value  = $oCategory->oxattribute__oxid->value;
                $oNewGroup->Save();
            }
        }
    }

}

?>
