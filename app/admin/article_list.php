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

class Article_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;

        $this->sListClass   = "oxarticle";
        $this->sDefSort     = null;     // no sort cause this makes the system slow when having tons of articles
        $this->sListType    = "oxarticlelist";

        // create navigation
        $this->aEditNavigation = array();
        $oNavItem->name     = "&Uuml;bersicht";
        $oNavItem->location = "article_overview";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Stamm";
        $oNavItem->location = "article_main";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Erweitert";
        $oNavItem->location = "article_extend";
        $this->aEditNavigation[] = $oNavItem;

        if( $myConfig->IsAddSales())
            $oNavItem->name     = "Attr./Ausw.";
        else
            $oNavItem->name     = "Auswahl.";
        $oNavItem->location = "article_attribute";
        $this->aEditNavigation[] = $oNavItem;

        if( $myConfig->IsAddSales())
        {   $oNavItem->name     = "Crosssell.";
            $oNavItem->location = "article_crossselling";
            $this->aEditNavigation[] = $oNavItem;
        }
        
        if( $myConfig->IsVarianten())
        {   // check if we are a variant
            $soxId = $myConfig->getParameter( "oxid");
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $soxId);
            if( $oArticle->oxarticles__oxparentid->value)
                $oNavItem->name = "Subvarian.";
            else
                $oNavItem->name     = "Varianten";
            $oNavItem->location = "article_variant";
            $this->aEditNavigation[] = $oNavItem;
        }
        
        $oNavItem->name     = "Bilder";
        $oNavItem->location = "article_pictures";
        $this->aEditNavigation[] = $oNavItem;

        if( $myConfig->IsReview())
        {   $oNavItem->name     = "Bewertung";
            $oNavItem->location = "article_review";
            $this->aEditNavigation[] = $oNavItem;
        }
        
        $oNavItem->name     = "Userdef.";
        $oNavItem->location = "article_userdef";
        $this->aEditNavigation[] = $oNavItem;

        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "article_overview";

        return "article_list.tpl";
    }
}

?>
