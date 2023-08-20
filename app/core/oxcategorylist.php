<?php
// // oxid eSales � NFQ GmbH 2003
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

class oxCategoryList extends oxList
{
    // 0 = Product categories, 1 = Mallcategories
    var $iListType      = 0;
    var $aPath          = array();
    var $blPathComplete = false;
    
    function oxCategoryList()
    {
        parent::oxList();
        $this->Init();
    }

    function Init( $sListObject = null)
    {
        $this->oLstoTpl = &oxNew( "oxcategory", "core");
    }
    
    function BuildSelectString( $aWhere=false, $aOrder = false, $sDescending = false, $blCnt = false)
    {
        if( !$aOrder)
            $aOrder = array( "oxcategories.oxorder");
            
        $aWhere['oxcategories.oxtype'] = $this->iListType;
        if( $this->iListType == 1)
            $aWhere['oxcategories.oxshopid'] = "oxbaseshop";

        return parent::BuildSelectString( $aWhere, $aOrder, $sDescending, $blCnt);
    }

    function BuildCategoryTree()
    {
        // load all categories
        $this->select( array( "oxcategories.oxactiv" => 1));
        
        while (list($key, $value) = each( $this->aList))
        {   // find sub categories and assign them
            if( $value->oxcategories__oxparentid->value != "oxrootid")
            {   // yes, this is a subcat.
                $oxid = $value->GetOXID( $value->oxcategories__oxparentid->value);
                if( isset( $this->aList[$oxid]))
                {   $oParent = $this->aList[$oxid];
                    $oParent->aSubCats[$value->oxcategories__oxnid->value] = $value;
                    $oParent->hasSubCats = true;
                //echo( "sub cat ".$value->oxcategories__oxnid->value." an parent ".$oParent->oxcategories__oxnid->value."<br>");
                    $this->aList[$oxid] = $oParent;
                }
                else
                {   // there is no parent ( e.g. inactive )
                    unset( $this->aList[$key]);
                }
            }
        }
        
        // delete not root entries and move cats with subcats
        reset( $this->aList);
        while (list($key, $value) = each($this->aList))
        {   if( $value->oxcategories__oxparentid->value != "oxrootid")
            {   if( current($value->aSubCats) )
                {   // yes, we have to move this entrie
                    unset( $this->aList[$key]);
                    $this->aPath = array();
                    $this->blPathComplete = false;
                    $this->findPath2Category( $value->oxcategories__oxnid->value, $this->aList);
                    $this->aPath = array_reverse( $this->aPath);
                    $this->aPath[0] = $value->GetOXID($this->aPath[0]);
                    // copy the categorie into the right place
                    $blFirst = false;
                    while (list($Poskey, $Posvalue) = each($this->aPath))
                    {   if( !$blFirst)
                        {   $blFirst = true;
                            // MK
                            //$pos = &$this->aList[$Posvalue];
                            $pos = $this->aList[$Posvalue];
                        }
                        else
                            // MK
                            //$pos = &$pos->aSubCats[$Posvalue];
                            $pos = $pos->aSubCats[$Posvalue];
                    }
                    $pos = $value;
                }
                else
                    unset( $this->aList[$key]);
            }
        }
    }
    
    function findPath2Category( $sCatnid, $aCats)
    {
        if( !isset($aCats) || !$aCats || $this->blPathComplete)
            return false;

        reset( $aCats);
        while (list($key, $value) = each($aCats))
        {   //echo( "vergleiche : ".$value->oxcategories__oxnid->value."<br>");
            if( $value->oxcategories__oxnid->value == $sCatnid)
            {   $this->aPath[] = $value->oxcategories__oxnid->value;
                //echo( "gefunden : ".$value->oxcategories__oxnid->value."<br>");
                $this->blPathComplete = true;
                return true;
            }
            else
            {   //echo( "springe in subcats von : ".$value->oxcategories__oxnid->value."<br>");
                if( $this->findPath2Category( $sCatnid, $value->aSubCats))
                {   // yes, the entrie is in this subcat
                    $this->aPath[] = $value->oxcategories__oxnid->value;
                    return true;
                }
            }
        }
    }
    
}

?>
