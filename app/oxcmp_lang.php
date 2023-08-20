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


require_once( "oxview.php");

class oxcmp_lang extends oxView
{
    var $aLanguages = null;
    
    function init()
    {   global $myConfig;
        global $mySession;

        $iLang  = $myConfig->getParameter("lang");
        if( isset( $iLang))
        {   // set new language
            $myConfig->setParameter("tpllanguage", $iLang);
            $myConfig->setParameter("language", $iLang);
        }

        $this->aLanguages = $myConfig->GetLanguageArray( $myConfig->getShopLanguage());
        
        $sClass = $myConfig->getParameter( "cl");
        $sFnc   = $myConfig->getParameter( "fnc");
        if( $sFnc == "tobasket")	
        	$sFnc = "";
        $sCatnid= $myConfig->getParameter( "cnid");
        $sArtnid= $myConfig->getParameter( "anid");
        $sURL   = $mySession->url( "index.php?cl=$sClass&fnc=$sFnc&cnid=$sCatnid&anid=$sArtnid");

        while(list($key, $val)=each($this->aLanguages))
        {   $val->link = $sURL."&lang=".$val->id;
            $this->aLanguages[$key] = $val;
        }
        
        parent::init();
    }
    
    function render()
    {
        parent::render();
        
        return $this->aLanguages;
    }

}

?>
