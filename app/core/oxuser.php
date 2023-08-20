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

class oxUser extends oxBase
{
    var $oGroups        = null;
    var $oAddresses     = null;
    var $oPayments      = null;

    function oxUser()
    {   parent::oxBase();

        $this->sClassName  = "oxuser";
        $this->Init( array( "oxuser"));
    }

    function Assign( $dbRecord)
    {
        parent::Assign( $dbRecord);

        // usergroups
        $this->oGroups = &oxNew( "oxlist", "core");
        $this->oGroups->Init( "oxbase");
        $this->oGroups->oLstoTpl->Init( array( "oxobject2group", "oxgroups"));
        $sSelect =  "select * from oxobject2group left join oxgroups on oxobject2group.oxgroupsid=oxgroups.oxid ";
        $sSelect .= "where oxobject2group.oxobjectid='$this->sOXID'";
        $this->oGroups->selectString( $sSelect);

        // addresses
        $this->oAddresses = &oxNew( "oxlist", "core");
        $this->oAddresses->Init( "oxbase");
        $this->oAddresses->oLstoTpl->Init( array( "oxaddress"));
        $sSelect =  "select * from oxaddress  ";
        $sSelect .= "where oxaddress.oxuserid='$this->sOXID'";
        $this->oAddresses->selectString( $sSelect);

        // payments
        $this->oPayments = &oxNew( "oxlist", "core");
        $this->oPayments->Init( "oxbase");
        $this->oPayments->oLstoTpl->Init( array( "oxuserpayments", "oxpayments"));
        $sSelect =  "select * from oxuserpayments left join oxpayments on oxuserpayments.oxpaymentsid=oxpayments.oxid ";
        $sSelect .= "where oxuserpayments.oxuserid='$this->sOXID'";
        $this->oPayments->selectString( $sSelect);
        while(list($key, $val) = each($this->oPayments->aList))
        {   // add custom fields to this class
            $aVal = AssignValuesFromText( $val->oxuserpayments__oxvalue->value);
            $val->aDynValues = $aVal;
            $this->oPayments->aList[$key] = $val;
        }
    }

    function Save()
    {
        if( !isset( $this->oxuser__oxrights))
            $this->oxuser__oxrights = "user";

        return parent::save();
    }

    /** Checks if this object is in group
     *
     *  @param $sGroupID type: string
     *  @returns bool true on success
     */
    function InGroup( $sGroupID)
    {    if( !$this->oGroups)
            return false;

        foreach( $this->oGroups->aList as $group)
        {
            if( $group->oxgroups__oxid->value == $sGroupID)
                return true;
        }

        return false;
    }
    
    function delete( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;
            
        parent::delete( $sOXID);

        $oDB = GetDB();
        
        $sDelete = "delete from oxuserpayments where oxuserpayments.oxuserid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);
        $sDelete = "delete from oxaddress where oxaddress.oxuserid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);
        $sDelete = "delete from oxobject2group where oxobject2group.oxobjectid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);
        $sDelete = "delete from oxremark where oxparentid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);

        return $rs->EOF;
    }
    
    function Load( $oxID)
    {   global $myConfig;
        
        $blRet = parent::Load( $oxID);
        
        // convert date's to international format
        if( isset( $this->oxuser__oxcreate->value))
        	$this->oxuser__oxcreate->value = FormatDBDate( $this->oxuser__oxcreate->value);

        return $blRet;
    }
    
    function insert()
    {
        // set oxcreate
        $timeout = time();
        $now = date("Y-m-d H:i:s", $timeout);
        $this->oxuser__oxcreate->value = $now;
        
        return parent::insert();
    }
    
    function update()
    {
        // dont change this field
        $iPos = array_search( "oxuser__oxcreate", $this->aIdx2FldName);
        unset( $this->aIdx2FldName[$iPos]);

        parent::update();
    }

    function exists( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;

        $oDB    = GetDB();
        $sSelect= "select oxid from ".$this->sMainTbl." where oxusername = '".$this->oxuser__oxusername->value."' or oxid='".$sOXID."'";
        $sOxid = $oDB->GetOne( $sSelect);
        if( $sOxid)
        {   // update - set oxid
            $this->sOXID = $sOxid;
            $sField = $this->sMainTbl."__oxid";
            $this->$sField->value = $sOxid;
            return true;
        }
        else
            return false;
    }

}

?>
