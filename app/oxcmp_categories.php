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


require_once( "oxview.php");

class oxcmp_categories extends oxView
{
    var $oCategoryTree  = null;
    var $oClickCat      = null;
    var $aNavigationPath= null;
    
    function init()
    {   global $mySession;
        global $myConfig;
        
        parent::init();
    
        $this->oCategoryTree = &oxNew( "oxcategorylist", "core");
        if( $mySession->getVar( "mallcat"))
        {   $this->oCategoryTree->iListType = 1;    // mall categories
            $mySession->deleteVar( "mallcat");
            $sLinkTarget = "mallstart";
        }
        else
            $sLinkTarget = "alist";
        // load the full tree
        $this->oCategoryTree->BuildCategoryTree();
        
        // search for the chosen category
        $sActCat    = $myConfig->getParameter("cnid");
        if( !isset( $sActCat) || !$sActCat)
            $sActCat = $myConfig->getParameter("cdefnid");
        
        $aPath      = array();
        $sActProduct= $myConfig->getParameter("anid");
        // load product
        $oProduct = null;
        if( isset( $sActProduct))
        {	$oProduct = &oxNew( "oxarticle", "core");
        	$oProduct->NLoad( $sActProduct);
        }
		// if there is no cat chosen let's see if we get it from the product        
        if( (!isset( $sActCat) || !$sActCat) && isset( $oProduct))
        {	// try to get category from article
        	$aCatList = $oProduct->GetCategoryIds();
        	if( $aCatList)
        		$sActCat = current( $aCatList);	// take the first one
        }
        
        if( isset( $sActCat))
        {   $this->oCategoryTree->aPath = array();
            $this->oCategoryTree->blPathComplete = false;
            $this->oCategoryTree->findPath2Category( $sActCat, $this->oCategoryTree->aList);
            $aPath = $this->oCategoryTree->aPath;
        }
            
        // add information for links etc.
        $this->AddCategoryInformation( $this->oCategoryTree->aList, $sLinkTarget, $aPath);

        if( isset( $sActCat))
        {   $this->oClickCat = &$this->GetCategory( $sActCat, $aPath, $this->oCategoryTree->aList);
            // generate full navigation path
            reset( $aPath);
            $sURL = $myConfig->getShopHomeURL();
            $this->aNavigationPath = array();
            while (list($key, $value) = each($aPath))
            {   $oCat       = &$this->GetCategory( $value, $aPath, $this->oCategoryTree->aList);
                $oCat->link = $sURL. "&cl=" . $sLinkTarget . "&cnid=" . $oCat->oxcategories__oxnid->value . "&fnc=oc";
                $this->aNavigationPath[] = $oCat;
            }
            // reverse, as the klicked on is always on first position
            $this->aNavigationPath = array_reverse( $this->aNavigationPath);
            
            // Product x from y in the category
            if( isset( $oProduct) && isset( $this->oClickCat))
            {	$oArtList = &oxNew( "oxarticlelist", "core");
		        $oArtList->LoadCategoryArticles( $sActCat);
	
				$i 		= 1;
				$iPos 	= 0;
				$backProduct = null;
				$nextProduct = null;
				if( isset( $oArtList->aList))
				{	foreach( $oArtList->aList as $my_product) 
					{	if( $iPos)
						{	$nextProduct = $my_product;
							break;
						}
						
						if( $my_product->sOXID == $oProduct->sOXID)
							$iPos = $i;
						
						if( !$iPos)
							$backProduct = $my_product;	
						$i++;
					}
				}
				
				$sURL       = $myConfig->getShopHomeURL();
		        //$sActCat    = $myConfig->getParameter("cnid");
		        $sActClass  = $myConfig->getParameter("cl");
		        if( $nextProduct)
		        	$this->oClickCat->nextProductLink    = $sURL. "&cl=details&cnid=$sActCat&anid=".$nextProduct->sOXNID;				
		        if( $backProduct)
		        	$this->oClickCat->prevProductLink    = $sURL. "&cl=details&cnid=$sActCat&anid=".$backProduct->sOXNID;				
		        
				$this->oClickCat->iProductPos 	= $iPos;
				$this->oClickCat->iCntOfProd	= count( $oArtList->aList);
            }	        
        
            
            
        }
        
        // tell the views the act. category
        $this->oParent->oActCategory = $this->oClickCat;
    }
    
    function render()
    {
        parent::render();

        // add to the parent view
        $this->oParent->aViewData['actCategory']    = $this->oClickCat;
        $this->oParent->aViewData['actCatpath']     = $this->aNavigationPath;

        return $this->oCategoryTree->aList;
    }
    
    function AddCategoryInformation( &$aCats, $sLinkTarget, $aPath)
    {   global $myConfig;
    	global $mySession;

        $sURL = $myConfig->getShopHomeURL();

        reset( $aCats);
        while (list($key, $value) = each($aCats))
        {   $sLink = $sURL. "&cl=" . $sLinkTarget . "&cnid=" . $value->oxcategories__oxnid->value . "&fnc=oc";
            $value->openlink = $sLink;
            $sLink = $sURL. "&cl=" . $sLinkTarget . "&cnid=" . $value->oxcategories__oxnid->value . "&fnc=cc";
            $value->closelink = $sLink;
            if( in_array( $value->oxcategories__oxnid->value, $aPath))
                $value->expanded = true;
            if( count( $value->aSubCats))
                $this->AddCategoryInformation( $value->aSubCats, $sLinkTarget, $aPath);

            // external link ?
            if( $value->oxcategories__oxextlink->value)
            {
            	$value->closelink	= $mySession->url( $value->oxcategories__oxextlink->value);
            	$value->openlink 	= $mySession->url( $value->oxcategories__oxextlink->value);
            }

            $aCats[$key] = $value;
        }
    }
    
    function &GetCategory( $snid, $aPath, &$aCatArray)
    {   global $myConfig;
        $blFirst = false;
    
        // reverse, as the klicked on is always on first position
        $aPath = array_reverse( $aPath);
        
        while (list($Poskey, $Posvalue) = each($aPath))
        {   if( !$blFirst)
            {   $blFirst = true;
                $sID = $myConfig->GetOXID( $Posvalue, $myConfig->getParameter( "language"));
                $pos = &$aCatArray[$sID];
            }
            else
                $pos = &$pos->aSubCats[$Posvalue];
                
            if( $pos->oxcategories__oxnid->value == $snid)
                break;
        }
        return $pos;
    }
    
    function oc()
    {   // unused
    }
    
    function cc()
    {
        //$this->oClickCat->expanded = false;
    }
    

}

?>
