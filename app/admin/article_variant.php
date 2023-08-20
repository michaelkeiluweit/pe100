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

class Article_variant extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;

        $this->sListClass   = "oxarticle";
        
        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $soxId);
            $oVariants = $oArticle->GetAdminVariants();

            // variant handling
            if( $oArticle->oxarticles__oxparentid->value)
            {   $oParentArticle = &oxNew( "oxarticle", "core");
                $oParentArticle->NLoad( $oArticle->oxarticles__oxparentid->value);
                $this->aViewData["parentarticle"] =  $oParentArticle;
                $this->aViewData["oxparentid"] =  $oArticle->oxarticles__oxparentid->value;
            }

            $this->aViewData["mylist"] =  $oVariants->aList;
            
            // for new variant
            $edit->oxarticles__oxnid->value = $oArticle->oxarticles__oxnid->value;
            $this->aViewData["edit"] =  $edit;
        }

        return "article_variant.tpl";
    }

}

?>
