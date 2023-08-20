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

class oxPayment extends oxBase
{
    var $oGroups        = null;
    var $fAddsum        = 0;

    function oxPayment()
    {   parent::oxBase();

        $this->sClassName  = "oxpayment";
        $this->Init( array( "oxpayments"));
    }

    function Assign( $dbRecord)
    {   global $myConfig;
    
        parent::Assign( $dbRecord);

        // usergroups
        $this->oGroups = &oxNew( "oxlist", "core");
        $this->oGroups->Init( "oxbase");
        $this->oGroups->oLstoTpl->Init( array( "oxobject2group", "oxgroups"));
        $sSelect =  "select * from oxobject2group left join oxgroups on oxobject2group.oxgroupsid=oxgroups.oxid ";
        $sSelect .= "where oxobject2group.oxobjectid='$this->sOXID'";
        $this->oGroups->selectString( $sSelect);
        
        // addsum
        $oCur = $myConfig->getActShopCurrencyObject();
        $this->fAddsum   = FormatCurrency( $this->oxpayments__oxaddsum->value, $oCur);
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

}

?>
