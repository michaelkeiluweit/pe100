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

class Delivery_main extends oxAdminView
{
	
    function render()
    {   global $myConfig;

        parent::render();
        
        // Deliverytypes
        $aDelTypes = array();
        $oType->typ 	= "a";		// amount
        $oType->Desc	= "Menge";
        $aDelTypes['a']	= $oType;
        $oType->typ 	= "s";		// Size
        $oType->Desc	= "Grösse";
        $aDelTypes['s']	= $oType;
        $oType->typ 	= "w";		// Weight
        $oType->Desc	= "Gewicht";
        $aDelTypes['w']	= $oType;
        $oType->typ 	= "p";		// Price
        $oType->Desc	= "Preis";
        $aDelTypes['p']	= $oType;
        
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
            $oDelivery = &oxNew( "oxdelivery", "core");
            $oDelivery->Load( $soxId);
            $this->aViewData["edit"] =  $oDelivery;
            
            $sChosenArtCat = $oDelivery->oxdelivery__oxcatnid->value;
            
            // set selected delivery type
            if( !$oDelivery->oxdelivery__oxdeltype->value)
            	$oDelivery->oxdelivery__oxdeltype->value = "a";	// default
            $aDelTypes[$oDelivery->oxdelivery__oxdeltype->value]->selected = true;

            $oCatTree = &oxNew( "oxCategoryList", "core");
            $oCatTree->select();
            // add No Cat. as fake category
            $oRoot->oxcategories__oxnid->value  = "";
            $oRoot->oxcategories__oxtitle->value= "-- keine --";
            // rebuild list as we need the not used entry at the first position
            $aNewList = array();
            $aNewList[] = $oRoot;
            while (list($key, $val) = each($oCatTree->aList))
            {   if( $val->oxcategories__oxnid->value == $sChosenArtCat)
                    $val->selected = 1;
                $aNewList[] = $val;
            }
            $oCatTree->aList = $aNewList;
            $this->aViewData["cattree"]     =  $oCatTree;
            
            // load articles from chosen categorie
            $sChosenArtCat = $myConfig->getParameter( "artcat");
            $iLanguage = $myConfig->getParameter( "language");
            $sSelect =  "select oxarticles.oxnid, oxarticles.oxartnum, oxarticles.oxtitle from oxarticles ";
            if( !isset( $sChosenArtCat) || !$sChosenArtCat)
                 $sSelect .= "where oxarticles.oxnid = '".$oDelivery->oxdelivery__oxartnid->value."' and oxarticles.oxlang = $iLanguage ";
            else
                $sSelect .= "left join oxobject2category on oxarticles.oxnid=oxobject2category.oxobjectid where oxobject2category.oxcatnid = '$sChosenArtCat' and ".GetActivSnippet("oxarticles")." and oxarticles.oxlang = $iLanguage order by oxobject2category.oxpos";
                
            // We do NOT use Shop Framework here as we do have to much overhead
            // this list can be up to 1000 entries
            $aList = array();
            $oArt->oxarticles__oxnid->value     = "";
            $oArt->oxarticles__oxartnum->value  = "";
            $oArt->oxarticles__oxtitle->value   = "-- kein Artikel --";
            $aList[] = $oArt;
            if( $oDelivery->oxdelivery__oxartnid->value || $sChosenArtCat)
            {   $oDB = GetDB();
                $rs = $oDB->SelectLimit( $sSelect, 1000, 0);
                if ($rs != false && $rs->RecordCount() > 0)
                {   while (!$rs->EOF)
                    {   $oArt->oxarticles__oxnid->value     = $rs->fields[0];
                        $oArt->oxarticles__oxartnum->value  = $rs->fields[1];
                        $oArt->oxarticles__oxtitle->value   = $rs->fields[2];
                        if( $oArt->oxarticles__oxnid->value == $oDelivery->oxdelivery__oxartnid->value)
                            $oArt->selected = 1;
                        else
                            $oArt->selected = 0;
                        $aList[] = $oArt;
                        $rs->MoveNext();
                    }
                }
            }
            $this->aViewData["arttree"] =  $aList;

            // artikel choose list
            $oCatTree = &oxNew( "oxCategoryList", "core");
            $oCatTree->select();
            // add Root as fake category
            $oRoot->oxcategories__oxnid->value  = "oxrootid";
            $oRoot->oxcategories__oxtitle->value= "-- keine ausgewählt --";
            // rebuild list as we need the root entry at the first position
            $aNewList = array();
            $aNewList[] = $oRoot;
            while (list($key, $val) = each($oCatTree->aList))
            {   if( $val->oxcategories__oxnid->value == $sChosenArtCat)
                    $val->selected = 1;
                $aNewList[] = $val;
            }
            $oCatTree->aList = $aNewList;
            $this->aViewData["artcattree"]     =  $oCatTree;

            // all usergroups
            $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxgroups"));
            $oGroups->select();
            $oRoot->oxgroups__oxid->value  = "";
            $oRoot->oxgroups__oxtitle->value= "-- keine ausgewählt --";
            // rebuild list as we need the "no value" entry at the first position
            $aNewList = array();
            $aNewList[] = $oRoot;
            while (list($key, $val) = each($oGroups->aList))
            {   if( $val->oxgroups__oxid->value == $oDelivery->oxdelivery__oxusergroupid->value)
                    $val->selected = 1;
                $aNewList[] = $val;
            }
            $oGroups->aList = $aNewList;
            $this->aViewData["grouptree"]     =  $oGroups;

            // all users
            $oUsers->aList = array();
            $oRoot->oxuser__oxid->value  = "";
            $oRoot->oxuser__oxfname->value= "-- keinen ausgewählt --";
            $oUsers->aList[] = $oRoot;

            $oDB = GetDB();
            $sSelect =  "select oxuser.oxid, oxuser.oxfname, oxuser.oxlname from oxuser order by  oxuser.oxlname";
            $rs = $oDB->SelectLimit( $sSelect, 5000, 0);
            if ($rs != false && $rs->RecordCount() > 0)
            {   while (!$rs->EOF)
                {   $oArt->oxuser__oxid->value     = $rs->fields[0];
                    $oArt->oxuser__oxfname->value  = $rs->fields[1];
                    $oArt->oxuser__oxlname->value  = $rs->fields[2];
                    if( $oArt->oxuser__oxid->value == $oDelivery->oxdelivery__oxuserid->value)
                        $oArt->selected = 1;
                    else
                        $oArt->selected = 0;
                    $oUsers->aList[] = $oArt;
                    $rs->MoveNext();
                }
            }
            $this->aViewData["usertree"]  =  $oUsers;
        }
        
        $this->aViewData["deltypes"] = $aDelTypes;
        

        return "delivery_main.tpl";
    }
    
    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $aParams    = $myConfig->getParameter( "editval");

        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $aParams['oxdelivery__oxshopid'] = $sShopID;

        $oAttr = &oxNew( "oxdelivery", "core");
        if( $soxId != "-1")
            $oAttr->Load( $soxId);
        else
            $aParams['oxdelivery__oxid'] = null;
        // checkbox handling
        if( !isset( $aParams['oxdelivery__oxactiv']))
            $aParams['oxdelivery__oxactiv'] = 0;

        $aParams = $oAttr->ConvertNameArray2Idx( $aParams);
        $oAttr->Assign( $aParams);
        $oAttr = parent::ProcessFiles( $oAttr);
        $oAttr->Save();

        // set oxid if inserted
        if( $soxId == "-1")
            $myConfig->setParameter( "saved_oxid", $oAttr->oxdelivery__oxid->value);
    }


}

?>
