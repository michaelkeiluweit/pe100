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

class Article_overview extends oxAdminView
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
            
            $oDB = GetDB();
            
            // how often was this article sold
            $sSelect =  "select count(oxartid) from oxorderarticles ";
            $sSelect .= "where oxartid='$soxId'";
            $rs = $oDB->Execute( $sSelect);
            $iCnt = 0;
            if( $rs != false && $rs->RecordCount() > 0)
                $iCnt = $rs->fields[0];
            $this->aViewData["soldcnt"] = $iCnt;
            
            // position in top ten
            $sSelect =  "select oxartid,count(oxartid) as cnt from oxorderarticles group by oxartid order by cnt desc";
            $rs = $oDB->Execute( $sSelect);
            $iTopPos 	= 0;
            $iPos		= 0;
            if( $rs != false && $rs->RecordCount() > 0)
            	$iPos = 1;
            while (!$rs->EOF)
            {   if( $rs->fields[0] == $soxId)
                    $iTopPos = $iPos;
                $iPos++;
                $rs->MoveNext();
            }
            $this->aViewData["postopten"] = $iTopPos;
            $this->aViewData["toptentotal"] = $iPos;
        }

        return "article_overview.tpl";
    }

}

?>
