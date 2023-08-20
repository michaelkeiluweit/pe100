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

class oxRemark extends oxBase
{
    function oxRemark()
    {   
        $this->sClassName  = "oxremark";
        $this->Init( array( "oxremark"));
        
        parent::oxBase();
    }
    
    function Load( $oxID)
    {   global $myConfig;
        
        $blRet = parent::Load( $oxID);
        
        // convert date's to international format
        $this->oxremark__oxcreate->value      = FormatDBDate( $this->oxremark__oxcreate->value);

        return $blRet;
    }
    
    function insert()
    {
        // set oxcreate
        $timeout = time();
        $now = date("Y-m-d H:i:s", $timeout);
        $this->oxremark__oxcreate->value = $now;
        $this->oxremark__oxheader->value = $now;
        
        return parent::insert();
    }
    
    function update()
    {
        // dont change this field
        $iPos = array_search( "oxremark__oxcreate", $this->aIdx2FldName);
        unset( $this->aIdx2FldName[$iPos]);

        parent::update();
    }
}

?>
