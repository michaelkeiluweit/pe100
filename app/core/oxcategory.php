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

class oxCategory extends oxI18n
{
    var $aSubCats = array();
    
    function oxCategory()
    {   
        $this->sClassName  = "oxcategory";
        $this->Init( array( "oxcategories"));
        
        parent::oxI18n();
    }
    
    function Assign( $dbRecord)
    {   parent::Assign( $dbRecord);
    
        $this->isroot = $this->isRoot();
    }
    
    function isRoot()
    {
        return $this->oxcategories__oxparentid->value == "oxrootid";
    }
    
    function insert()
    {
        if( !isset( $this->oxcategories__oxorder->value) || $this->oxcategories__oxorder->value == "")
        {   $iPos = array_search( "oxcategories__oxorder", $this->aIdx2FldName);
            unset( $this->aIdx2FldName[$iPos]);
        }
        
        if( !isset( $this->oxcategories__oxtype->value) || !$this->oxcategories__oxtype->value)
            $this->oxcategories__oxtype->value = 0;
            
        return parent::insert();
    }


    
}

?>
