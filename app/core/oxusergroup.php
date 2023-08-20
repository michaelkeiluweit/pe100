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

class oxUsergroup extends oxBase
{
    function oxUsergroup()
    {   parent::oxBase();

        $this->sClassName  = "oxusergroup";
        $this->Init( array( "oxgroups"));
    }

    /** Get all Members of this group
     *
     *  @returns List Object with all members
     */
    function GetMembers()
    {    if( !$this->sOXID)
            return false;

        $oGroups = &oxNew( "oxlist", "core");
        $oGroups->Init( "oxbase");
        $oGroups->oLstoTpl->Init( array( "oxuser", "oxobject2group"));
        $sSelect =  "select * from oxuser left join oxobject2group on oxuser.oxid=oxobject2group.oxobjectid where oxobject2group.oxgroupsid = '$this->sOXID' order by oxuser.oxlname";
        $oGroups->selectString( $sSelect);

        return $oGroups;
    }
	
    function delete( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;
            
        parent::delete( $sOXID);

        $oDB = GetDB();
        
        $sDelete = "delete from oxobject2group where oxobject2group.oxgroupsid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);

        return $rs->EOF;
    }
}

?>
