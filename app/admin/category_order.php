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

function cmp ($a, $b)
{
    if ($a->pos == $b->pos) return 0;
    return ($a->pos < $b->pos) ? -1 : 1;
}

class Category_order extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();

        $soxId = $myConfig->getParameter( "oxid");

        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oCategory = &oxNew( "oxcategory", "core");
            $oCategory->Load( $soxId);
            $this->aViewData["edit"] =  $oCategory;

            // load new sort order list
            $aNewOrder      = $myConfig->getParameter( "neworder_sess");
            // We do NOT use Shop Framework here as we do have to much overhead
            // this list can be up to 2500 entries
            if( isset($aNewOrder))
            {   $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles where oxarticles.oxparentid is null and ";
                $blSep = false;
                foreach($aNewOrder as $sOb)
                {   $sSelect .= (( $blSep) ? " or ":"(")."oxarticles.oxnid = '$sOb'";
                    $blSep = true;
                }
                $sSelect .= ")";
                $oDB = GetDB();
                $aList = array();
                $rs = $oDB->SelectLimit( $sSelect, 1000, 0);
                if ($rs != false && $rs->RecordCount() > 0)
                {   while (!$rs->EOF)
                    {   $oArt->oxarticles__oxnid->value     = $rs->fields[0];
                        settype( $oArt->oxarticles__oxnid->value, "string");
                        $iPos = my_array_search( $oArt->oxarticles__oxnid->value, $aNewOrder);
                        $oArt->pos = $iPos;
                        $oArt->oxarticles__oxartnum->value  = /*$iPos . "__" . */$rs->fields[1];
                        $oArt->oxarticles__oxtitle->value   = $rs->fields[2];
                        $aList[] = $oArt;
                        $rs->MoveNext();
                    }
                }
                usort( $aList, "cmp");
                $this->aViewData["neworder"] = $aList;
                $myConfig->setParameter( "neworder_sess", null);
            }
            
            // load articles from OUR categorie
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid ";
            $sSelect .= "where oxobject2category.oxcatnid = '".$oCategory->oxcategories__oxnid->value."'  and oxarticles.oxparentid is null ";
            $sSelect .= "order by oxobject2category.oxpos";
            // We do NOT use Shop Framework here as we do have to much overhead
            // this list can be up to 2500 entries
            $oDB = GetDB();
            $aList = array();
            $rs = $oDB->SelectLimit( $sSelect, 1000, 0);
            $blShowAssignButton = true;
            if ($rs != false && $rs->RecordCount() > 0)
            {   while (!$rs->EOF)
                {   $oArt->oxarticles__oxnid->value     = $rs->fields[0];
                    $oArt->oxarticles__oxartnum->value  = $rs->fields[1];
                    $oArt->oxarticles__oxtitle->value   = $rs->fields[2];
                    // remove already resorted stuff
                    // no use of array_search here cause of type mismatch - it brings wrong results
                    $blAlreadyIn = false;
                    if( isset( $aNewOrder))
                        $blAlreadyIn = my_array_search( $oArt->oxarticles__oxnid->value, $aNewOrder, true);
                        
                    if( !$blAlreadyIn)
                    {   $aList[] = $oArt;
                        $blShowAssignButton = false;
                    }
                    $rs->MoveNext();
                }
            }

            $this->aViewData["artthisincat"]        =  $aList;
            $this->aViewData["allorderassigned"]     = $blShowAssignButton;
        }

        return "category_order.tpl";
    }

    function repositionarticle()
    {   global $myConfig;

        $aAddArticle    = $myConfig->getParameter( "artinthiscat");
        $aNewOrder      = $myConfig->getParameter( "neworder");
  
        if( isset( $aAddArticle) && $aAddArticle)
        {   $aNewStore = array();
            if( isset( $aNewOrder) && $aNewOrder)
                foreach( $aNewOrder as $sEntry)
                    $aNewStore[] = $sEntry;
            foreach( $aAddArticle as $sEntry)
                $aNewStore[] = $sEntry;
        }
        else
            $aNewStore = $aNewOrder;

        $myConfig->setParameter( "neworder_sess", $aNewStore);
    }
    
    function saveneworder()
    {   global $myConfig;

        $aNewOrder  = $myConfig->getParameter( "neworder");
        if( !isset( $aNewOrder))
            return;
            
        $soxId      = $myConfig->getParameter( "oxid");
        $oCategory = &oxNew( "oxcategory", "core");
        $oCategory->Load( $soxId);

        $oGroups = &oxNew( "oxlist", "core");
        $oGroups->Init( "oxbase");
        $oGroups->oLstoTpl->Init( array( "oxobject2category"));
        $sSelect =  "select * from oxobject2category ";
        $sSelect .= "where oxobject2category.oxcatnid='$oCategory->sOXNID' and ";
        $blSep = false;
        foreach($aNewOrder as $sObj)
        {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2category.oxobjectid = '$sObj'";
            $blSep = true;
        }
        $sSelect .= ")";
        $oGroups->selectString( $sSelect);
        foreach($oGroups->aList as $oObj)
        {
            $sSearchKey = $oObj->oxobject2category__oxobjectid->value;
            $pos = my_array_search( $sSearchKey, $aNewOrder);
            $oObj->oxobject2category__oxpos->value = $pos;
            $oObj->save();
        }
    }


}

?>
