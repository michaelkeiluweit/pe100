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

require_once( "../oxconfig.php");
$myConfig->blAdmin = true;
require( "inc/auth.inc.php");
require_once( "oxadminview.php");

class Shop_main extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        // all categories
        $oCatTree = &oxNew( "oxCategoryList", "core");
        $oCatTree->iListType = 1;
        $oCatTree->select();

        $soxId = $myConfig->getParameter( "oxid");
        // check if we right now saved a new entry
        $sSavedID = $myConfig->getParameter( "saved_oxid");
        if( ($soxId == "-1" || !isset( $soxId)) && isset( $sSavedID) )
        {   $soxId = $sSavedID;
            $myConfig->delParameter( "saved_oxid");
            $this->aViewData["oxid"] =  $soxId;
            // for reloading upper frame
            $this->aViewData["updatelist"] =  "1";
        }

        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oShop = &oxNew( "oxshop", "core");
            $oShop->Load( $soxId);
            $this->aViewData["edit"] =  $oShop;
            
            // all categories this SHOP is in
            $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2category", "oxcategories"));
            $sSelect =  "select * from oxobject2category left join oxcategories on oxcategories.oxnid=oxobject2category.oxcatnid ";
            $sSelect .= "where oxobject2category.oxobjectid='".$oShop->oxshops__oxid->value."' ";
            $sSelect .= "and oxcategories.oxlang = $oGroups->sLanguage";
            $oGroups->selectString( $sSelect);
            $this->aViewData["allartcat"] =  $oGroups->aList;
            // remove already assigned categories from all list
            foreach( $oGroups->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->oxcategories__oxnid->value;
                reset( $oCatTree->aList);
                while (list($key, $val) = each($oCatTree->aList))
                {   if( $val->oxcategories__oxnid->value == $sSearchKey)
                    {   // already in, so lets remove it
                        unset( $oCatTree->aList[$key]);
                        break;
                    }
                }
            }
        }
        
        $this->aViewData["allcat"] =  $oCatTree->aList;

        return "shop_main.tpl";
    }

    function save()
    {   global $myConfig;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");
        // checkbox handling
        if( !isset( $aParams['oxshops__oxactiv']))
            $aParams['oxshops__oxactiv'] = 0;

        $oShop = &oxNew( "oxshops", "core");
        if( $soxId != "-1")
            $oShop->Load( $soxId);
        else
            $aParams['oxshops__oxid'] = null;
        $aParams = $oShop->ConvertNameArray2Idx( $aParams);
        $oShop->Assign( $aParams);
        $oShop->Save();
        // set oxid if inserted
        if( $soxId == "-1")
        {   $myConfig->setParameter( "saved_oxid", $oShop->oxshops__oxid->value);
            // copy directories
            $Source     = $myConfig->sShopDir . "/out/oxbaseshop";
            $sTarget    = $myConfig->sShopDir . "/out/" . $oShop->oxshops__oxid->value;
            mkdir( $sTarget, 0777);
            CopyDir( $Source, $sTarget);
        }
    }

    function addcat()
    {   global $myConfig;

        $aAddCat   = $myConfig->getParameter( "allcat");
        $soxId     = $myConfig->getParameter( "oxid");
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $soxId);

        if( isset( $aAddCat) && $aAddCat)
        {   foreach($aAddCat as $sAdd)
            {   $oNew = &oxNew( "oxbase", "core");
                $oNew->Init( array( "oxobject2category"));
                $oNew->oxobject2category__oxobjectid->value= $oShop->oxshops__oxid->value;
                $oNew->oxobject2category__oxcatnid->value  = $sAdd;
                $oNew->Save();
            }
        }
    }

    function removecat()
    {   global $myConfig;

        $aRemoveCat = $myConfig->getParameter( "allartcat");
        $soxId      = $myConfig->getParameter( "oxid");
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $soxId);

        if( isset( $aRemoveCat) && $aRemoveCat)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2category"));
            $sSelect =  "select * from oxobject2category ";
            $sSelect .= "where oxobject2category.oxobjectid='".$oShop->oxshops__oxid->value."' and ";
            $blSep = false;
            foreach($aRemoveCat as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2category.oxcatnid = '$sRem'";
                $blSep = true;
            }
            $sSelect .= ")";
            $oGroups->selectString( $sSelect);
            foreach($oGroups->aList as $sRemgroup)
                $sRemgroup->delete();
        }
    }



}

?>
