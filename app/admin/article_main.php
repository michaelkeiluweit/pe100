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

class Article_main extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $soxId          = $myConfig->getParameter( "oxid");
        $soxparentId    = $myConfig->getParameter( "oxparentid");
        $svoxId          = $myConfig->getParameter("voxid");

        // new variant ?
        if( isset( $svoxId) && $svoxId == "-1" && isset($soxparentId) && $soxparentId && $soxparentId != "-1")
        {   $oParentArticle = &oxNew( "oxarticle", "core");
            $oParentArticle->NLoad( $soxparentId);
            $this->aViewData["parentarticle"] =  $oParentArticle;
            $this->aViewData["oxparentid"] =  $soxparentId;
            
            $soxId = "-1";
            $this->aViewData["oxid"] =  $soxId;
        }
        
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
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $soxId);
            $this->aViewData["edit"] =  $oArticle;
            
            // variant handling
            if( $oArticle->oxarticles__oxparentid->value)
            {   $oParentArticle = &oxNew( "oxarticle", "core");
                $oParentArticle->NLoad( $oArticle->oxarticles__oxparentid->value);
                $this->aViewData["parentarticle"] =  $oParentArticle;
                $this->aViewData["oxparentid"] =  $oArticle->oxarticles__oxparentid->value;
                $this->aViewData["issubvariant"] = 1;
            }
            
            // load object in other languages
            $oOtherLang = $oArticle->GetAvailI18nObjects();
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
            {   if( $val->sLanguage == $oArticle->sLanguage)
                {   $val->selected = 1;
                    $oOtherLang->aList[$key] = $val;
                    break;
                }
            }
            $this->aViewData["otherlang"] =  $oOtherLang;
            
        }
        

        return "article_main.tpl";
    }

    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxarticles__oxactiv']))
            $aParams['oxarticles__oxactiv'] = 0;

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxarticles__oxshopid'] = $sShopID;

        // default values
        $aParams = $this->AddDefaultValues( $aParams);
        
        // varianthandling
        $soxparentId = $myConfig->getParameter( "oxparentid");
        if( isset( $soxparentId) && $soxparentId && $soxparentId != "-1")
            $aParams['oxarticles__oxparentid'] = $soxparentId;
        else
            unset( $aParams['oxarticles__oxparentid']);

        $oArticle = &oxNew( "oxarticle", "core");
        if( $soxId != "-1")
            $oArticle->Load( $soxId);
        else
            $aParams['oxarticles__oxid'] = null;
        $aParams = $oArticle->ConvertNameArray2Idx( $aParams);
        
        $oArticle->Assign( $aParams);
        $oArticle = parent::ProcessFiles( $oArticle);
        $oArticle->Save();

        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oArticle->oxarticles__oxid->value);
    }

    function saveinnlang()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxarticles__oxactiv']))
            $aParams['oxarticles__oxactiv'] = 0;

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxarticles__oxshopid'] = $sShopID;
        
        // default values
        $aParams = $this->AddDefaultValues( $aParams);

        // varianthandling
        $soxparentId = $myConfig->getParameter( "oxparentid");
        if( isset( $soxparentId) && $soxparentId && $soxparentId != "-1")
            $aParams['oxarticles__oxparentid'] = $soxparentId;

        $oArticle = &oxNew( "oxarticle", "core");
        
        if( $soxId != "-1")
            $oArticle->Load( $soxId);
        else
            $aParams['oxarticles__oxid'] = null;
        $aParams = $oArticle->ConvertNameArray2Idx( $aParams);
        $oArticle->Assign( $aParams);

        // apply new language
        $sNewLanguage = $myConfig->getParameter( "new_lang");
        $oArticle->SetLanguage( $sNewLanguage);
        
        $oArticle->insert();
        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oArticle->oxcategories__oxid->value);
    }
    
    function AddDefaultValues( $aParams)
    {
        $aParams['oxarticles__oxexturl'] = str_replace( "http://", "", $aParams['oxarticles__oxexturl']);
        if( !isset( $aParams['oxarticles__oxstock']))
            $aParams['oxarticles__oxstock'] = -1;

        return $aParams;
    }
}

?>
