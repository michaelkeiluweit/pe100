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


class oxBase
{
    var $sShopID        = null;
    var $sLanguage      = null;

    /**
    * oxBase::$sClassName
    *
    * { Description }
    *
    */
    var $sClassName     = "oxbase";

    // data handling see oxutils for class description
    //var $aoData         = array();

    /**
    * oxBase::$sMainTbl
    *
    * { Description }
    *
    */
    var $sMainTbl       = null;
    
    var $sExistKey      = "oxid";
    /**
    * oxBase::$aTables
    *
    * { Description }
    *
    */
    var $aTables        = null;
    /**
    * oxBase::$aIdx2FldName
    *
    * here we store the fieldnames
    *
    */
    var $aIdx2FldName   = array();
    /**
    * oxBase::$sOXID
    *
    * { Description }
    *
    */
    var $sOXID          = null;

    /**
    * oxBase::oxBase()
    *
    * { Description }
    *
    */
    function oxBase()
    {   global $mySession;
    
        // set active shop
        $this->sShopID = $mySession->getVar( "actshop");
    }

    /**
    * oxBase::Clone()
    *
    * Clone this object - similar to Copy Constructor
    *
    */
    function Clone( $oObject)
    {
        $aClass_vars = get_object_vars( $oObject);
        while (list($name, $value) = each($aClass_vars))
            $this->$name = $oObject->$name;
    }

    /**
    * oxBase::Init()
    *
    * { Description }
    *
    */
    function Init( $aTableNames)
    {   // we allow a list of tables
        if( !is_array( $aTableNames))
            $aTableNames = array( $aTableNames);

        // the first table is considered the "main" table
        $this->sMainTbl     = $aTableNames[0];
        $this->aTables      = $aTableNames;
        $this->aIdx2FldName = array();

        foreach($aTableNames as $sTableName)
        {   $aFields        = GetTableDescription( $sTableName);
            while (list($name, $value) = each($aFields))
            {   $this->$name = $value;
                // store names
                $this->aIdx2FldName[] = $name;
            }
        }
    }

    /**
    * TODO : DOKU
    *
    * { Description }
    *
    * @param $sOXID optional, type: string
    * @returns bool true on success
    */
    function Assign( $dbRecord)
    {
        $iCnt = 0;
        
        while (list($name, $value) = each($dbRecord))
        {   // we need to check that as adodb gives back strings efen if I told adodb not to do so
            $value = stripslashes($value);
            if( !is_string($name))
            {   if( !isset( $this->aIdx2FldName[$name]))
                    continue;
                $sName = $this->aIdx2FldName[$name];
                // if we have a double field we replace "," through "."
                if( isset($this->$sName) && ($this->$sName->fldtype == "double" || $this->$sName->fldtype == "float"))
                    $value = str_replace( ",",".", $value);
                $this->$sName->value = $value;
                // assign ID
                if( $sName == GetArrFldName( $this->sMainTbl . ".oxid"))
                    $this->sOXID = $value;
                // assign NID
                else if( $sName == GetArrFldName( $this->sMainTbl . ".oxnid"))
                    $this->sOXNID = $value;
                // assign language
                else if( $sName == GetArrFldName( $this->sMainTbl . ".oxlang"))
                    $this->sLanguage = $value;
                $iCnt++;
            }
        }
    }

    /**
    * oxBase::Load()
    *
    * { Description }
    *
    */
    function Load( $oxID)
    {
        $sSelect = $this->BuildSelectString( array( $this->sMainTbl.".oxid" => $oxID));

        return $this->select( $sSelect);
    }

    /**
    * oxBase::BuildSelectString()
    *
    * { Description }
    *
    * @param [type] $aWhere
    */
    function BuildSelectString( $aWhere=false)
    {
        $blSep = false;
        foreach($this->aTables as $sTableName)
        {   if( !$blSep)
            {   // first table is select table
                $blSep  = true;
                $sGet = $this->GetSelectFields();
                $sSelect = "select $sGet from $sTableName ";
                continue;
            }
            $sSelect .= " left join $sTableName on ".$this->sMainTbl.".oxid=$sTableName.".$this->sMainTbl."id ";
        }
        
        // add active shop
        if( $this->sShopID)
        {   // check if our main table has a field for the shopid
            $sSearch = $this->sMainTbl . "__oxshopid";
            if( isset( $this->$sSearch))
            {   $sSearch = $this->sMainTbl . ".oxshopid";
                $aWhere[$sSearch] = $this->sShopID;
            }
        }
        // add active language
        if( isset($this->sLanguage))
        {   // check if our main table has a field for the language
            $sSearch = $this->sMainTbl . "__oxlang";
            if( isset( $this->$sSearch))
            {   $sSearch = $this->sMainTbl . ".oxlang";
                $aWhere[$sSearch] = $this->sLanguage;
            }
        }

        if( $aWhere)
        {   $blSep = false;
            while (list($name, $value) = each($aWhere))
            {   // get field type
                $sArrFldName = GetArrFldName( $name);
                $type   = $this->$sArrFldName->fldtype;

                if( !IsQuoteNeeded( $type) && $value)
                    $sSelect .= (( $blSep) ? " and ":" where ")."$name = $value";
                else
                    $sSelect .= (( $blSep) ? " and ":" where ")."$name like '$value'";
                $blSep = true;
            }
        }

        //echo( "$sSelect <br>");

        return $sSelect;
    }

    /**
    * oxBase::select()
    *
    * { Description }
    *
    */
    function select( $select)
    {   $blRet = false;

        $oDB = GetDB();

        $rs = $oDB->Execute( $select);
        if ($rs != false && $rs->RecordCount() > 0)
        {   $blRet = true;
            $this->Assign( $rs->fields);
        }

        return $blRet;
    }

    /**
    * oxBase::GetSelectFields()
    *
    * Function to build the field list used in select
    *
    */
    function GetSelectFields()
    {   $sRet = "";

        $blSep = false;
        foreach( $this->aIdx2FldName as $sField)
        {   if( $blSep)
                $sRet .= ",";
            $sRet .= $this->$sField->table . "." . $this->$sField->fldname;
            $blSep = true;
        }

        return $sRet;
    }

    /**
    * oxBase::ConvertNameArray2Idx()
    *
    * Convert Array from fieldname based ( oxuser__oxid ) to idx based
    *
    */
    function ConvertNameArray2Idx( $aArray)
    {   $aRet = array();

        while (list($name, $value) = each($aArray))
        {   
            $iIdx = array_search( $name, $this->aIdx2FldName);
            $aRet[$iIdx] = $value;
        }

        return $aRet;
    }

    /**
    * oxBase::exists()
    *
    * Checks if this object exists.
    *
    * @param $sOXID optional, type: string
    * @returns bool true on success
    */
    function exists( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;

        $oDB    = GetDB();
        $sSelect= "select oxid from ".$this->sMainTbl." where ".$this->sExistKey." = '$sOXID'";
        if( $oDB->GetOne( $sSelect))
            return true;
        else
            return false;
    }

    /**
    * oxBase::delete()
    *
    * Delete this object from the database
    *
    * @param $sOXID optional, type: string
    * @returns bool true on success
    */
    function delete( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;

        $oDB = GetDB();
        $sDelete = "delete from $this->sMainTbl where oxid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);

        return $rs->EOF;
    }


    /**
    * oxBase::save()
    *
    * Save this Object to database, insert or update as needed
    *
    */
    function Save()
    {   if ($this->exists())
            return $this->update();
        else
            return $this->insert();
    }

    /**
    * Update this Object into the database
    * this function only works on the main table, it will not save any dependend tables
    * which might be loaded through oxlist
    */
    function update()
    {
        $oDB    = GetDB();
        $sUpdate= "update $this->sMainTbl set ";
        $blSep  = false;

        foreach ($this->aIdx2FldName as $fName)
        {   $oField = $this->$fName;

            // quote it
            if( $oField->value)
            	$sVal = $oDB->qstr( $oField->value, false);
            else
            	$sVal = "null";
            	
            $sUpdate .= (( $blSep) ? ",":" " ).$oField->fldname." = $sVal";

            $blSep = true;
        }
        $sUpdate .= " where ".$this->sMainTbl.".oxid = '$this->sOXID' ";
        $blRet = $oDB->Execute( $sUpdate);
        //echo( "SQL : $sUpdate <br>\n");

        return $blRet;
    }

    /**
    * Insert this Object into the database
    * this function only works on the main table, it will not save any dependend tables
    * which might be loaded through oxlist
    */
    function insert()
    {
        $oDB    = GetDB();
        // let's get a new ID
        if( !$this->sOXID)
            $this->sOXID = generateUID();
        $sIDKey = GetArrFldName( $this->sMainTbl.".oxid");
        $this->$sIDKey->value = $this->sOXID;

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
        //echo( "SQL : $sInsert <br>\n");

        return $blRet;
    }
}

?>
