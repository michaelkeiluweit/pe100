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


require_once( $myConfig->sCoreDir . "oxi18n.php");

class oxReview extends oxI18n
{
    function oxReview()
    {   
        $this->sClassName  = "oxreview";
        $this->Init( array( "oxreviews"));
        
        parent::oxI18n();
    }
    
    function Load( $oxID)
    {   global $myConfig;
        
        $blRet = parent::Load( $oxID);
        
        // convert date's to international format
        $this->oxreviews__oxcreate->value      = FormatDBDate( $this->oxreviews__oxcreate->value);

        return $blRet;
    }
    
    function insert()
    {
        // set oxcreate
        $timeout = time();
        $now = date("Y-m-d H:i:s", $timeout);
        $this->oxreviews__oxcreate->value = $now;
        
        return parent::insert();
    }
    
    function update()
    {
        // dont change this field
        $iPos = array_search( "oxreviews__oxcreate", $this->aIdx2FldName);
        unset( $this->aIdx2FldName[$iPos]);

        parent::update();
    }
}

?>
