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

class oxShops extends oxBase
{
    var $oAllShops;

    function oxShops()
    {   parent::oxBase();

        $this->sClassName  = "oxshops";
        $this->Init( array( "oxshops"));

        // load all shops
        $this->oAllShops = &oxNew( "oxlist", "core");
        $this->oAllShops->Init( "oxbase");
        $this->oAllShops->oLstoTpl->Init( array( "oxshops"));
        $sSelect =  "select * from oxshops";
        $this->oAllShops->selectString( $sSelect);
    }

    /** TODO : DOKU
     *  @param $sOXID optional, type: string
     *  @returns bool true on success
     */
    function delete( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;

        // delete all dependend items in ALL tables !

        // TODO !

        return parent::delete( $sOXID);
    }

}

?>
