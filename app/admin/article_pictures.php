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

class Article_pictures extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");

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
        }

        return "article_pictures.tpl";
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

}

?>
