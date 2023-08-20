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

class Article_review extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();
        
        $soxId      = $myConfig->getParameter( "oxid");
        $sRevoxId   = $myConfig->getParameter( "rev_oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $soxId);
            $this->aViewData["edit"] =  $oArticle;
            
            // all reviews
            $oRevs = &oxNew( "oxlist", "core");
            $oRevs->Init( "oxreview");
            $oRevs->select( array( "oxreviews.oxparentid" => $oArticle->oxarticles__oxnid->value));
            while (list($key, $val) = each($oRevs->aList))
            {   if( $val->oxreviews__oxnid->value == $sRevoxId)
                {   $val->selected = 1;
                    $oRevs->aList[$key] = $val;
                    break;
                }
            }
            $this->aViewData["allreviews"] = $oRevs->aList;
            
            if( isset( $sRevoxId))
            {   $oReview = &oxNew( "oxreview", "core");
                $oReview->NLoad( $sRevoxId);
                $this->aViewData["reviewtext"] = $oReview->oxreviews__oxtext->value;
                
                $oUser = &oxNew( "oxuser", "core");
                $oUser->Load( $oReview->oxreviews__oxuserid->value);
                $this->aViewData["user"] =  $oUser;
            }

        }
        
        return "article_review.tpl";
    }
    
    function save()
    {   global $myConfig;
        global $mySession;

        $sRevoxId   = $myConfig->getParameter( "rev_oxid");
        $oReview    = &oxNew( "oxreview", "core");
        $oReview->NLoad( $sRevoxId);
        
        $sNewText   = $myConfig->getParameter( "reviewtext");
        $oReview->oxreviews__oxtext->value = $sNewText;

        $oReview->Save();
    }

    function delete()
    {   global $myConfig;
        global $mySession;

        $sRevoxId   = $myConfig->getParameter( "rev_oxid");
        $oReview    = &oxNew( "oxreview", "core");
        $oReview->NLoad( $sRevoxId);
        $oReview->delete();
    }

}

?>
