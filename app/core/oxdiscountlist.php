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


require_once( $myConfig->sCoreDir . "oxlist.php");

class oxDiscountList extends oxList
{
    var $sType  = null;
    
    function oxDiscountList()
    {
        parent::oxList();
        $this->Init();
        
        $this->sType = 'd';
    }

    function Init( $sListObject = null)
    {
        if( !$this->oLstoTpl)
            $this->oLstoTpl = &oxNew( "oxdiscount", "core");
    }
    
    function BuildSelectString( $aWhere=false, $aOrder = false, $sDescending = false, $blCnt = false)
    {
        if( !isset( $aWhere))
            $aWhere = array();
            
        $aWhere['oxdiscount.oxtype'] = $this->sType;
            
        return parent::BuildSelectString( $aWhere, $aOrder, $sDescending, $blCnt);
    }
}

?>
