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


require_once( $myConfig->sCoreDir . "oxbase.php");

class oxI18n extends oxBase
{

    /**
    * oxI18n::$sClassName
    *
    * { Description }
    *
    */
    var $sClassName     = "oxI18n";

    /**
    * oxI18n::$sOXNID
    *
    * { Description }
    *
    */
    var $sOXNID         = null;

    /**
    * oxI18n::oxI18n()
    *
    * { Description }
    *
    */
    function oxI18n()
    {
        // set default language
        $this->SetLanguage();

        parent::oxBase();
    }

    function SetLanguage( $sLanguage = null)
    {   global $myConfig;

        if( !isset($sLanguage))
            $this->sLanguage    = $myConfig->getParameter( "language");
        else
            $this->sLanguage    = $sLanguage;

        if( !isset( $this->sLanguage))
            $this->sLanguage = $myConfig->sDefaultLang;

        $sName = GetArrFldName( $this->sMainTbl . ".oxlang");
        $this->$sName->value = $this->sLanguage;

        //echo( "Setlanguage : $this->sLanguage <br>");
    }

    /**
    * oxI18n::GetOXID()
    *
    * build unique id from language and oxnid
    *
    */
    function GetOXID( $soxNID)
    {   global $myConfig;

        return $myConfig->GetOXID( $soxNID, $this->sLanguage);
    }

    /**
    * oxI18n::exists()
    *
    * { Description }
    *
    * @param [type] $sOXID
    */
    function exists( $sOXNID = null)
    {
        if( !$sOXNID)
            $sOXNID = $this->sOXNID;
        if( !$sOXNID)
            return false;

        $oDB    = GetDB();
        $sSelect= $this->BuildSelectString( array( $this->sMainTbl.".oxnid" => $sOXNID, $this->sMainTbl.".oxlang" => $this->sLanguage));

        //echo( "EXIST : $sSelect");

        if( $oDB->GetOne( $sSelect))
            return true;
        else
            return false;
    }

    /**
    * oxI18n::update()
    *
    * { Description }
    *
    */
    function update()
    {
        $oDB    = GetDB();
        $sUpdate= "update $this->sMainTbl set ";
        $blSep  = false;

        foreach ($this->aIdx2FldName as $fName)
        {   $oField = $this->$fName;

            // quote it
            $sVal = $oDB->qstr( $oField->value, false);
            $sUpdate .= (( $blSep) ? ",":" " ).$oField->fldname." = $sVal";

            $blSep = true;
        }
        $sUpdate .= " where ".$this->sMainTbl.".oxnid = '$this->sOXNID' and oxlang = $this->sLanguage";
        $blRet = $oDB->Execute( $sUpdate);
        //echo( "SQL : $sUpdate <br>\n");

        return $blRet;
    }

    /**
    * oxI18n::insert()
    *
    * { Description }
    *
    */
    function insert()
    {
        $oDB    = GetDB();
        // let's get a new ID
        if( !$this->sOXNID)
            $this->sOXNID = generateUID();
        $this->sOXID = $this->GetOXID( $this->sOXNID);

        $sIDKey = GetArrFldName( $this->sMainTbl.".oxid");
        $this->$sIDKey->value = $this->sOXID;
        $sIDNKey = GetArrFldName( $this->sMainTbl.".oxnid");
        $this->$sIDNKey->value = $this->sOXNID;

        $sInsert= "Insert into $this->sMainTbl set ";
        $blSep  = false;
        foreach ($this->aIdx2FldName as $fName)
        {   $oField = $this->$fName;
            // quote it
            $sVal = $oDB->qstr( $oField->value, get_magic_quotes_gpc());
            $sInsert .= (( $blSep) ? ",":" " ).$oField->fldname." = $sVal";
            $blSep = true;
        }
        $blRet = $oDB->Execute( $sInsert);
        //echo( "SQLINS : $sInsert <br>\n");

        return $blRet;
    }

    function GetAvailI18nObjects()
    {   global $myConfig;

        $oObjectlist = &oxNew( "oxlist", "core");
        $oObjectlist->Init( $this->sClassName);
        $oObjectlist->sLanguage = null;
        $oObjectlist->select( array( $this->sMainTbl.".oxnid" => $this->sOXNID));
        
        //print_r( $oObjectlist);
        //die();
        
        // add languge desc
        while (list($key, $value) = each($oObjectlist->aList))
        {   $sLangKey = GetArrFldName( $this->sMainTbl.".oxlang");
            $value->sLangDesc = $myConfig->aLanguages[$value->$sLangKey->value];
            $oObjectlist->aList[$key] = $value;
        }

        return $oObjectlist;
    }

    function NLoad( $oxNID)
    {
        // set default language
        $this->SetLanguage();

        $sSelect = $this->BuildSelectString( array( $this->sMainTbl.".oxnid" => $oxNID));

        return $this->select( $sSelect);
    }

    function Load( $oxID)
    {
        // clear language as we are querying for ID not nid
        $this->sLanguage = null;

        $sSelect = $this->BuildSelectString( array( $this->sMainTbl.".oxid" => $oxID));

        return $this->select( $sSelect);
    }

    function delete( $sOXNID = null)
    {
        if( !$sOXNID)
            $sOXNID = $this->sOXNID;
        if( !$sOXNID)
            return false;

        $oDB = GetDB();
        $sDelete = "delete from $this->sMainTbl where oxnid = '$sOXNID'";
        $rs = $oDB->Execute( $sDelete);

        return $rs->EOF;
    }

}
?>
