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

class Selectlist_main extends oxAdminView
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
        
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oAttr = &oxNew( "oxselectlist", "core");
            $oAttr->Load( $soxId);
            $this->aViewData["edit"] =  $oAttr;
            
            // load object in other languages
            $oOtherLang = $oAttr->GetAvailI18nObjects();
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
            {   if( $val->sLanguage == $oAttr->sLanguage)
                {   $val->selected = 1;
                    $oOtherLang->aList[$key] = $val;
                    break;
                }
            }
            $this->aViewData["otherlang"] =  $oOtherLang;

            $iLanguage = $myConfig->getParameter( "language");

            // load articles from chosen list
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2selectlist on oxarticles.oxnid=oxobject2selectlist.oxobjectid ";
            $sSelect .= "where oxobject2selectlist.oxselnid = '".$oAttr->oxselectlist__oxnid->value."' and oxarticles.oxlang = $iLanguage";
            // We do NOT use Shop Framework here as we do have to much overhead
            // this list can be up to 1000 entries
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

            // load all articles without our selectlist
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles where oxarticles.oxlang = $iLanguage and oxarticles.oxparentid is NULL";
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
            
            // add fields
            $this->aViewData["selectfields"] = AssignValuesFromText( $oAttr->oxselectlist__oxvaldesc->value);
        }

        return "selectlist_main.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxselectlist__oxshopid'] = $sShopID;

        $oAttr = &oxNew( "oxselectlist", "core");
        if( $soxId != "-1")
            $oAttr->Load( $soxId);
        else
            $aParams['oxselectlist__oxid'] = null;
        $aParams = $oAttr->ConvertNameArray2Idx( $aParams);
        $oAttr->Assign( $aParams);
        $oAttr = parent::ProcessFiles( $oAttr);
        $oAttr->Save();

        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oAttr->oxselectlist__oxid->value);
    }
    
    function saveinnlang()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxselectlist__oxshopid'] = $sShopID;

        $oObj = &oxNew( "oxselectlist", "core");

        if( $soxId != "-1")
            $oObj->Load( $soxId);
        else
            $aParams['oxselectlist__oxid'] = null;
        $aParams = $oObj->ConvertNameArray2Idx( $aParams);
        $oObj->Assign( $aParams);

        // apply new language
        $sNewLanguage = $myConfig->getParameter( "new_lang");
        $oObj->SetLanguage( $sNewLanguage);

        $oObj->insert();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oObj->oxselectlist__oxid->value);
    }

    function removearticle()
    {   global $myConfig;

        $aRemoveArt = $myConfig->getParameter( "artinthiscat");
        $soxId      = $myConfig->getParameter( "oxid");
        $oCategory  = &oxNew( "oxselectlist", "core");
        $oCategory->Load( $soxId);

        if( isset( $aRemoveArt) && $aRemoveArt)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2selectlist"));
            $sSelect =  "select * from oxobject2selectlist ";
            $sSelect .= "where oxobject2selectlist.oxselnid='".$oCategory->oxselectlist__oxnid->value."' and ";
            $blSep = false;
            foreach($aRemoveArt as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2selectlist.oxobjectid = '$sRem'";
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
        $oCategory = &oxNew( "oxselectlist", "core");
        $oCategory->Load( $soxId);

        if( isset( $aAddArticle) && $aAddArticle)
        {   foreach($aAddArticle as $sAdd)
            {   $oNewGroup = &oxNew( "oxbase", "core");
                $oNewGroup->Init( array( "oxobject2selectlist"));
                $oNewGroup->oxobject2selectlist__oxobjectid->value= $sAdd;
                $oNewGroup->oxobject2selectlist__oxselnid->value  = $oCategory->oxselectlist__oxnid->value;
                $oNewGroup->Save();
            }
        }
    }

}

?>
