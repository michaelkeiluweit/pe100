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


class oxList
{
    var $aList          = array();
    var $oLstoTpl       = null;
    var $iSQLStart      = -1;
    var $iSQLRecords    = -1;
    var $sShopID        = null;
    var $sLanguage      = null;
    var $aAssignCallback= null;

    function oxList()
    {   global $mySession;
        global $myConfig;

        // set active shop
        $this->sShopID = $mySession->getVar( "actshop");
        if( !isset( $this->sShopID) || !$this->sShopID)
        	$this->sShopID = $myConfig->getShopId();
        	
        // set language
        $iLanguage = $myConfig->getParameter( "language");
        if( !isset( $iLanguage))
            $iLanguage = $myConfig->sDefaultLang;
        $this->sLanguage = $iLanguage;
    }

    function Init( $sListObject)
    {   // we need to know which type of objects we do have in our list
        $this->oLstoTpl = &oxNew( $sListObject, "core");
    }

    function GetSQLCount( $aWhere=null)
    {   $iRet = 0;

        $oDB = GetDB();

        $sSelect = $this->BuildSelectString( $aWhere, false, false, true);
        $iRet = $oDB->GetOne( $sSelect);

        return $iRet;
    }

    function GetMax( $aWhere=null, $sMaxField)
    {   $iRet = 0;

        $oDB = GetDB();
        $sSelect = "select max( $sMaxField ) as maxf from ".$this->oLstoTpl->sMainTbl. " ";
        $iRet = $oDB->GetOne( $sSelect);

        return $iRet;
    }
    
    function GetSelectStringCount( $sSelect)
    {   $iRet = 0;
    
        $oDB = GetDB();
        $iRet = $oDB->GetOne( $sSelect);

        return $iRet;
    }

    function select( $aWhere=false, $aOrder = false, $sDescending = false)
    {
        $sSelect = $this->BuildSelectString( $aWhere, $aOrder, $sDescending);

        return $this->selectString( $sSelect);
    }

    function selectString( $select)
    {   global $myConfig;
    
        $blRet = false;

        //echo( "$select ( ".$this->iSQLRecords." )<br>");

        $oDB = GetDB();
        $this->aList = array();

        if( $this->iSQLRecords != -1 && $this->iSQLStart != -1)
        {   if( $myConfig->blDBCaching)
                $rs = $oDB->CacheSelectLimit( $select, $this->iSQLRecords, $this->iSQLStart);
            else
                $rs = $oDB->SelectLimit( $select, $this->iSQLRecords, $this->iSQLStart);
        }
        else
        {   if( $myConfig->blDBCaching)
                $rs = $oDB->CacheExecute( $select);
            else
                $rs = $oDB->Execute( $select);
        }
            
        if ($rs != false && $rs->RecordCount() > 0)
        {   $blRet = true;

            $iDBCnt = 0;
            
            while (!$rs->EOF)
            {
                $object = &oxCopyNew( $this->oLstoTpl, "core");
                $object->Assign( $rs->fields);
                // callback for adding custom data to any objects
                if( $this->aAssignCallback)
                    $object = call_user_func( $this->aAssignCallback, $object);
                $this->aList[$object->sOXID] = $object;

                $rs->MoveNext();
                $iDBCnt++;
            }
        }


        return $blRet;
    }
    
    function GetWhere( $aWhere)
    {	$blSep 		= false;
    	$sSelect	= "";

    	while (list($name, $value) = each($aWhere))
        {   // get field type
            $sArrFldName = GetArrFldName( $name);
            $type   = @$this->oLstoTpl->$sArrFldName->fldtype;

            if( !IsQuoteNeeded( $type))
                $sSelect .= (( $blSep) ? " and ":" where ")."$name = $value";
            elseif( strstr( $value, "is"))
                $sSelect .= (( $blSep) ? " and ":" where ")."$name $value";
            else
                $sSelect .= (( $blSep) ? " and ":" where ")."$name like '$value'";
            $blSep = true;
        }
        
        return $sSelect;
    }

    function BuildSelectString( $aWhere=false, $aOrder = false, $sDescending = false, $blCnt = false)
    {
        $blSep = false;
        foreach( $this->oLstoTpl->aTables as $sTableName)
        {   if( !$blSep)
            {   // first table is select table
                $blSep  = true;
                if( $blCnt)
                    $sGet = "count( $sTableName.oxid)";
                else
                    $sGet = $this->oLstoTpl->GetSelectFields();
                $sSelect = "select $sGet from $sTableName ";
                continue;
            }
            $sSelect .= " left join $sTableName on ".$this->oLstoTpl->sMainTbl.".$sTableName"."id=$sTableName.oxid ";
        }

        // add active shop
        if( $this->sShopID)
        {   // check if our main table has a field for the shopid
            $sSearch = $this->oLstoTpl->sMainTbl . "__oxshopid";
            if( isset( $this->oLstoTpl->$sSearch))
            {   $sSearch = $this->oLstoTpl->sMainTbl . ".oxshopid";
                if( !isset( $aWhere[$sSearch]))
                    $aWhere[$sSearch] = $this->sShopID;
            }
        }
        // add active language
        if( isset($this->sLanguage))
        {   // check if our main table has a field for the language
            $sSearch = $this->oLstoTpl->sMainTbl . "__oxlang";
            if( isset( $this->oLstoTpl->$sSearch))
            {   $sSearch = $this->oLstoTpl->sMainTbl . ".oxlang";
                $aWhere[$sSearch] = $this->sLanguage;
            }
        }
        
        if( $aWhere)
        	$sSelect .= $this->GetWhere( $aWhere);
        
        if( $aOrder && isset($aOrder[0]) )
        {   $sSelect .= " order by ";
            $blSep = false;
            foreach($aOrder as $orderColumn)
            {   $sSelect .= ((( $blSep) ? ", ":""))."$orderColumn";
                $blSep    = true;
            }
            if( $sDescending)
                $sSelect .= " DESC ";
        }

        //echo( "$sSelect <br>");

        return $sSelect;
    }

}

?>
