<?php
// oxid eSales © NFQ GmbH 2003
//
// Diese Software ist urheberrechtlich geschuetzt - sie ist
// KEINE Freeware.
//
// Die unerlaubte Verwendung dieser Software ohne gueltigen 
// Lizenzschluessel ist ein ein Verstoss gegen die Lizenz-
// bedingungen und wird straf- bzw. auch zivilrechtlich verfolgt.
//
// http://www.nfq-esales.de

require_once( "ubase.php");

class shoppingscout extends oxUBase
{
    function render()
    {   global $myConfig;
        global $mySession;

        parent::render();
        
        // direct databasecall cause of performance reason
        $aRet = array();
        $oDB = GetDB();
        
        $oArt = &oxNew( "oxarticle", "core");
        
        $sSearchString = $myConfig->getParameter( "search");

        $sSelect =  "select oxarticles.oxid from oxarticles where ".GetActivSnippet( "oxarticles")." and oxparentid is null ";
        if( isset( $sSearchString))
        {   $sSelect .= "and ( oxarticles.OXTITLE like '%$sSearchString%' ";
            $sSelect .= "or oxarticles.OXSHORTDESC  like '%$sSearchString%' ";
            $sSelect .= "or oxarticles.oxsearchkeys  like '%$sSearchString%') ";
        }
        
        $rs = $oDB->Execute( $sSelect);
        if ($rs != false && $rs->RecordCount() > 0)
        {   while (!$rs->EOF)
            {   $soxid = $rs->fields[0];
            
                $oArt->Load( $soxid);
                
                $oErg->title        = $oArt->oxarticles__oxtitle->value;
                $oErg->shortdesc    = $oArt->oxarticles__oxshortdesc->value;
                $oErg->price        = $oArt->brutPrice;
                // remove sid from link
                $link = str_replace( "sid=".$mySession->id, "", $oArt->oxdetaillink);
                $oErg->link         = $link;
                
                $aRet[] = $oErg;
            
                $rs->MoveNext();
            }
        }

        if( count($aRet))
            $this->aViewData['articlelist'] = $aRet;
        
        return "sscout.tpl";
    }
    
}

?>
