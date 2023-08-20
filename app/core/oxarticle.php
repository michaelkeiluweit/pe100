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

function cmp ($a, $b)
{   // sorting for crossselling
    if ($a->cnt == $b->cnt) return 0;
    return ($a->cnt > $b->cnt) ? -1 : 1;
}

class oxArticle extends oxI18n
{
    var $oVAT           = null;
    var $oDiscount      = null;
    var $sShopID        = null;
    var $blCalcPrice    = true;
    var $vat            = 0;
    var $vatPercent     = 0;
  	var $netPrice     	= 0;
    var $brutPrice 		= 0;
    var $oDiscountList  = null;
    
    function oxArticle()
    {   global $mySession;
    
        $this->sClassName  = "oxarticle";
        $this->Init( array( "oxarticles"));
        
        $this->sShopID = $mySession->getVar( "actshop");
        
        parent::oxI18n();
    }
    
    function GetAdminVariants()
    {
        $oVariants = &oxNew( "oxlist", "core");
        $oVariants->Init( "oxbase");
        $oVariants->oLstoTpl->Init( array( "oxarticles"));
        $oVariants->select( array( "oxarticles.oxparentid" => $this->sOXNID));
        
        return $oVariants;
    }
    
    function Load( $oxID)
    {   
        global $myConfig;
        
        $blRet = parent::Load( $oxID);

        // convert date's to international format
        $this->oxarticles__oxinsert->value      = FormatDBDate( $this->oxarticles__oxinsert->value);
        $this->oxarticles__oxtimestamp->value   = FormatDBDate( $this->oxarticles__oxtimestamp->value);

        return $blRet;
    }
    
    function RemoveFields()
    {
        $iPos = array_search( "oxarticles__oxtimestamp", $this->aIdx2FldName);
        unset( $this->aIdx2FldName[$iPos]);
        if( !isset( $this->oxarticles__oxparentid->value) || $this->oxarticles__oxparentid->value == "")
        {   $iPos = array_search( "oxarticles__oxparentid", $this->aIdx2FldName);
            unset( $this->aIdx2FldName[$iPos]);
        }
    }
    
    function insert()
    {
        $this->RemoveFields();
        
        // set oxinsert
        $timeout = time();
        $now = date("Y-m-d H:i:s", $timeout);
        $this->oxarticles__oxinsert->value = $now;
        
        return parent::insert();
    }
    
    function update()
    {
        $this->RemoveFields();
        // dont change this field
        $iPos = array_search( "oxarticles__oxinsert", $this->aIdx2FldName);
        unset( $this->aIdx2FldName[$iPos]);

        parent::update();
    }

    function Assign( $dbRecord)
    {   global $myConfig;
    
        // load object from database
        parent::Assign( $dbRecord);

        // and assign special article values
        $sURL       = $myConfig->getShopHomeURL();
        $sActCat    = $myConfig->getParameter("cnid");
        $sActClass  = $myConfig->getParameter("cl");
        $this->oxdetaillink     = $sURL. "&cl=details&cnid=$sActCat&anid=".$this->sOXNID;
        $this->oxmoredetaillink = $sURL. "&cl=moredetails&cnid=$sActCat&anid=".$this->sOXNID;
        $this->tobasketlink     = $sURL. "&cl=$sActClass&fnc=tobasket&cnid=$sActCat&aid=".$this->sOXID."&anid=".$this->sOXNID;

        // special treatment if we are a variant in shop
        if( $this->oxarticles__oxparentid->value)
        {   // yes, we are in fact a variant
            if( !$myConfig->blAdmin)
            {   // get parent article and assign values which are not set by this variant
                $oParentArticle = &oxNew( "oxarticle", "core");
                $oParentArticle->NLoad( $this->oxarticles__oxparentid->value);
                $aClass_vars = get_object_vars( $oParentArticle);
                while (list($name, $value) = each($aClass_vars))
                {   if( substr( $name, 0, 12) != "oxarticles__" || $name == "oxarticles__oxparentid" || $name == "oxarticles__oxid" || $name == "oxarticles__oxnid")
                        continue;   // only overwrite database values
                    if( $this->$name->value == "" || $this->$name->value == "0000-00-00 00:00:00" || ( $this->$name->fldtype == "double" && $this->$name->value == 0))
                    {   $this->$name->value = $oParentArticle->$name->value;
                    }
                        
                }
            }
        }
        
        // picture handling
        $sNoPic = "nopic.jpg";
        if( !$this->oxarticles__oxthumb->value)
        	$this->oxarticles__oxthumb->value = $sNoPic;
        if( !$this->oxarticles__oxpic1->value)
        	$this->oxarticles__oxpic1->value = $sNoPic;
        if( !$this->oxarticles__oxpic2->value)
        	$this->oxarticles__oxpic2->value = $sNoPic;
        if( !$this->oxarticles__oxpic3->value)
        	$this->oxarticles__oxpic3->value = $sNoPic;
        if( !$this->oxarticles__oxpic4->value)
        	$this->oxarticles__oxpic4->value = $sNoPic;
        if( !$this->oxarticles__oxpic5->value)
        	$this->oxarticles__oxpic5->value = $sNoPic;
        
        // price handling
        if( $this->blCalcPrice)
            $this->price = $this->getPrice();
        else
            $this->price = $this->oxarticles__oxprice->value;
            
    }
    
    function GetReviews()
    {
        $oRevs = &oxNew( "oxlist", "core");
        $oRevs->Init( "oxreview");
        $oRevs->oLstoTpl->Init( array( "oxreviews", "oxuser"));
        $oRevs->select( array( "oxreviews.oxparentid" => $this->oxarticles__oxnid->value), array( "oxreviews.oxcreate"), true);

        if( !isset( $oRevs->aList) || !count($oRevs->aList))
            $oRevs->aList = null;
        else
        {   // change date
            while (list($key, $value) = each($oRevs->aList))
            {   $value->oxreviews__oxcreate->value = FormatDBDate( $value->oxreviews__oxcreate->value);
                $value->oxreviews__oxtext->value = nl2br( $value->oxreviews__oxtext->value);
                $oRevs->aList[$key] = $value;
            }
        }
        //print_r( $oRevs->aList);
        
        return $oRevs->aList;
    }
    
    function GetCrossSelling()
    {	global $myConfig;
    
        $oCrosslist = &oxNew( "oxlist", "core");
        $oCrosslist->Init( "oxarticle");
        $oCrosslist->oLstoTpl->Init( array( "oxarticles", "oxobject2article"));

        $sSelect =  "select oxarticles.* from oxarticles left join oxobject2article on oxarticles.oxnid=oxobject2article.oxobjectid ";
        $sSelect .= "where oxobject2article.oxarticlenid = '".$this->oxarticles__oxnid->value."' and oxarticles.oxlang = ".$this->sLanguage;
        $sSelect .= " and ".GetActivSnippet( "oxarticles")." and oxshopid = '".$this->sShopID."' and oxarticles.oxparentid is null";
        $oCrosslist->iSQLRecords  = $myConfig->iNrofCrossellArticles;
        $oCrosslist->iSQLStart    = 0;
        $oCrosslist->selectString( $sSelect);
        if( !isset( $oCrosslist->aList) || !count($oCrosslist->aList))
            $oCrosslist->aList = null;
        
        return $oCrosslist->aList;
    }

    function GetCustomerAlsoBoughtThisProducts()
    {	global $myConfig;
    
        $oList = &oxNew( "oxlist", "core");
        $oList->Init( "oxbase");
        $oList->oLstoTpl->Init( array( "oxorderarticles"));

        $sSelect =  "select oxorderarticles.* from oxorderarticles ";
        $sSelect .= "where oxorderarticles.oxartid = '".$this->oxarticles__oxid->value."' ";
        $oList->selectString( $sSelect);
        if( count( $oList->aList))
        {   // get orders

            $sSelect =  "select oxarticles.* from oxorderarticles left join oxarticles on oxorderarticles.oxartid=oxarticles.oxid where ( ";
            $blSep = false;
            foreach( $oList->aList as $oOrder)
            {   if( $blSep)
                    $sSelect .= " or ";
                $sSelect .= " oxorderarticles.oxorderid='".$oOrder->oxorderarticles__oxorderid->value."'";
                $blSep = true;
            }
            $sSelect .= ") and oxorderarticles.oxartid != '".$this->oxarticles__oxid->value."'";

            $oArticles = &oxNew( "oxlist", "core");
            $oArticles->iSQLRecords  = $myConfig->iNrofCustomerWhoArticles;
            $oArticles->iSQLStart    = 0;
            $oArticles->Init( "oxarticle");
            $oArticles->oLstoTpl->Init( array( "oxarticles", "oxorderarticles"));
            $oArticles->selectString( $sSelect);
        }

        if( !isset( $oArticles->aList) || !count($oArticles->aList))
            $oArticles->aList = null;
            
            //print_r ($oArticles->aList);
            
        return $oArticles->aList;
    }

    function GetSimilarProducts()
    {	global $myConfig;
    
        // we do not use lists here as we dont need this overhead right now
        $oDB = GetDB();
        $sSelect =  "select oxattrid from oxobject2attribute where oxobject2attribute.oxobjectid='".$this->oxarticles__oxnid->value."' ";
        $aList = array();
        $rs = $oDB->Execute( $sSelect);
        if ($rs != false && $rs->RecordCount() > 0)
        {   while (!$rs->EOF)
            {   $aList[] = $rs->fields[0];
                $rs->MoveNext();
            }
        }
        if( !count( $aList))
            return null;

        $sAttribs = "";
        $blSep = false;
        foreach( $aList as $oAttrib)
        {   if( $blSep)
                $sAttribs .= " or ";
            $sAttribs .= "oxobject2attribute.oxattrid = '$oAttrib' ";
            $blSep = true;
        }
        $aList = array();
        $sSelect =  "select oxobjectid,count(oxobjectid) from oxobject2attribute where $sAttribs group by oxobjectid";
        // we do not use lists here as we dont need this overhead right now
        $rs = $oDB->Execute( $sSelect);
        $iHitMax = 0;
        if ($rs != false && $rs->RecordCount() > 0)
        {   while (!$rs->EOF)
            {   $oSimilar->anid = $rs->fields[0];
                $oSimilar->cnt  = $rs->fields[1];
                $iHitMax = max( $iHitMax, $oSimilar->cnt);
                $aList[] = $oSimilar;
                $rs->MoveNext();
            }
        }
        // product needs at least 70% of attributes to get listed here
        $iHitMin = $iHitMax * 0.70;
        // sort the list so that we have the best hits at the beginning
        usort( $aList, "cmp");
        reset( $aList);
        while (list($key, $value) = each($aList))
        {   // delete entries if they are not near enough
            if( $value->cnt < $iHitMin || $value->anid == $this->sOXNID)
                unset($aList[$key]);
        }
        // now load these products
        reset( $aList);
        $sSearch = "select oxarticles.* from oxarticles where ".GetActivSnippet( "oxarticles")." and oxarticles.oxlang = ".$this->sLanguage." and ( ";
        $blSep = false;
        foreach( $aList as $oSim)
        {   if( $blSep)
                $sSearch .= " or ";
            $sSearch .= "oxarticles.oxnid = '$oSim->anid' ";
            $blSep = true;
        }
        $sSearch .= ") and oxshopid = '".$this->sShopID."' and oxarticles.oxparentid is null";

        $oSimilarlist = &oxNew( "oxarticlelist", "core");
        $oSimilarlist->iSQLRecords  = $myConfig->iNrofSimilarArticles;
        $oSimilarlist->iSQLStart    = 0;
        $oSimilarlist->selectString( $sSearch);

        return $oSimilarlist->aList;
    }
    
    function GetSelectLists()
    {
        // all selectlists this article has
        $oLists = &oxNew( "oxlist", "core");
        $oLists->Init( "oxbase");
        $oLists->oLstoTpl->Init( array( "oxobject2selectlist", "oxselectlist"));
        $sSelect =  "select * from oxobject2selectlist left join oxselectlist on oxselectlist.oxnid=oxobject2selectlist.oxselnid ";
        $sSelect .= "where oxobject2selectlist.oxobjectid='".$this->sOXNID."' and oxselectlist.oxlang = ".$this->sLanguage;
        $oLists->selectString( $sSelect);
        
        $aRet = array();
        
        $iCnt = 0;
        foreach( $oLists->aList as $oSelectlist)
        {
            $aRet[$iCnt] = AssignValuesFromText( $oSelectlist->oxselectlist__oxvaldesc->value);
         	$aRet[$iCnt]['name'] = $oSelectlist->oxselectlist__oxtitle->value;
         	$iCnt++;
        }
        
        return $aRet;
    }
    
    function GetVariants()
    {
        // no article list here as this list don't load variants
        $oVariants = &oxNew( "oxlist", "core");
        $oVariants->Init( "oxarticle");
        $sSelect =  "select oxarticles.* from oxarticles ";
        $sSelect .= "where ".GetActivSnippet( "oxarticles")." and oxarticles.oxparentid ='".$this->sOXNID."' and oxarticles.oxshopid = '".$this->sShopID."' ";
        $sSelect .= "and oxarticles.oxlang = ".$this->sLanguage;
        
        $oVariants->selectString( $sSelect);
        
        return $oVariants->aList;
    }
    
    function GetCategoryIds()
    {   global $myConfig;
    
        if( isset( $myConfig->aArticleCats[$this->sOXNID]))
            return $myConfig->aArticleCats[$this->sOXNID];

        $aRet = array();
        
        // we do not use lists here as we dont need this overhead right now
        $oDB = GetDB();
        $sSelect =  "select oxobject2category.oxcatnid from oxobject2category left join oxcategories on oxcategories.oxnid = oxobject2category.oxcatnid ";
        $sSelect .= "where oxobject2category.oxobjectid='".$this->sOXNID."' and oxcategories.oxactiv = 1";
        if( $myConfig->blDBCaching)
            $rs = $oDB->CacheExecute( $sSelect);
        else
            $rs = $oDB->Execute( $sSelect);
            
        $iHitMax = 0;
        if ($rs != false && $rs->RecordCount() > 0)
        {   while (!$rs->EOF)
            {   $aRet[] = $rs->fields[0];
                $rs->MoveNext();
            }
        }
        
        $myConfig->aArticleCats[$this->sOXNID] = $aRet;

        return $aRet;
    }
    
    function InCategory( $sCatNID)
    {
        return in_array( $sCatNID, $this->GetCategoryIds());
    }
    
    function LoadDiscountList()
    {   global $mySession;
        global $myConfig;

        $oList = &oxNew( "oxlist", "core");
        $oList->oLstoTpl = &oxNew( "oxdiscount", "core");

        $sSelect  = "select * from oxdiscount where ";
        // activ from - to
        $sSelect .= GetActivSnippet( "oxdiscount");
        $sSelect .= "and oxshopid = '".$this->sShopID."'";
        $sSelect .= "and ( ";

        // category
        $aCats = $this->GetCategoryIds();
        $blSep = false;
        $sSelect .= " ( ";
        while (list($key, $value) = each($aCats))
        {   if( $blSep)
                $sSelect .= " or ";
            $sSelect .= " oxdiscount.oxcatnid = '$value'";
            $blSep = true;
        }
        if( $blSep)
            $sSelect .= " or ";
        $sSelect .= " oxdiscount.oxcatnid = '') and ";
        // article
        $sSelect .= " ( oxdiscount.oxartnid = '".$this->sOXNID."' or oxdiscount.oxartnid = '' ) ";
        // user
        $sUserID = $mySession->getVar( "usr");
        if( $sUserID)
        {   $sSelect .= " and ( oxdiscount.oxuserid = '$sUserID' or oxdiscount.oxuserid = '' ) and (";
            // usergroup
            if( $myConfig->oUser)
                $oUser = &$myConfig->oUser;
            else
            {   $oUser = &oxNew( "oxuser", "core");
                $oUser->Load( $sUserID);
                // cache this
                $myConfig->oUser = &$oUser;
            }
            $blSep = false;
            if( isset( $oUser->oGroups->aList))
            {	reset( $oUser->oGroups->aList);
	            while (list($key, $value) = each($oUser->oGroups->aList))
	            {   if( $blSep)
	                    $sSelect .= " or ";
	                $sSelect .= " oxdiscount.oxusergroupid = '".$value->oxobject2group__oxgroupsid->value."'";
	                $blSep = true;
	            }
	            if( $blSep)
	                $sSelect .= " or ";
            }
            $sSelect .= " oxdiscount.oxusergroupid = '' ) ";
        }
        else
            $sSelect .= " and oxdiscount.oxuserid = '' and oxdiscount.oxusergroupid = '' ";

        $sSelect .= ")";

        $oList->selectString( $sSelect);
        //echo( "$sSelect  <br><br>");
        
        return $oList;
    }

    function LoadDeliveryList( $sDeliveryCountry, $dAmount, $dPrice, $dSize, $dWeight, $blBasketType = false)
    {   global $mySession;
        global $myConfig;

        $oList = &oxNew( "oxdeliverylist", "core");

        $sSelect  = "select * from oxdelivery where ";
        // activ from - to
        $sSelect .= GetActivSnippet( "oxdelivery");
        $sSelect .= "and oxshopid = '".$this->sShopID."'";

        if( !$blBasketType)
        {	// category
	        $aCats = $this->GetCategoryIds();
	        $blSep = false;
	        $sSelect .= " and ( ";
	        while (list($key, $value) = each($aCats))
	        {   if( $blSep)
	                $sSelect .= " or ";
	            $sSelect .= " oxdelivery.oxcatnid = '$value'";
	            $blSep = true;
	        }
	        if( $blSep)
	            $sSelect .= " or ";
	        $sSelect .= " oxdelivery.oxcatnid = '') and ";
	        // article
	        $sSelect .= " ( oxdelivery.oxartnid = '".$this->sOXNID."' or oxdelivery.oxartnid = '' ) ";
	        
	        // don't take the shop wide stuff here
	        $sSelect .= " and ( oxdelivery.oxartnid != '' || oxdelivery.oxcatnid != '' ) ";
        }
        else 
        {	// only take the shop wide stuff here
        	$sSelect .= " and oxdelivery.oxartnid = '' && oxdelivery.oxcatnid = '' ";
        }

        // ------------------------------------------------------
        // delivery cost rules
        // ------------------------------------------------------
        $sSelect .= " and ( ";
        // amount
        $sSelect .= " ( oxdelivery.oxdeltype = 'a' and $dAmount > oxdelivery.oxparam and $dAmount < oxdelivery.oxparamend ) or ";
        // size
        $sSelect .= " ( oxdelivery.oxdeltype = 's' and $dSize > oxdelivery.oxparam and $dSize < oxdelivery.oxparamend  ) or ";
        // weight
        $sSelect .= " ( oxdelivery.oxdeltype = 'w' and $dWeight > oxdelivery.oxparam and $dWeight < oxdelivery.oxparamend  ) or ";
		// price
        $sSelect .= " ( oxdelivery.oxdeltype = 'p' and $dPrice > oxdelivery.oxparam and $dPrice < oxdelivery.oxparamend  ) ";

        $sSelect .= " ) ";
        // ------------------------------------------------------
        
        // user
        $sUserID = $mySession->getVar( "usr");
        if( $sUserID)
        {   $sSelect .= " and ( oxdelivery.oxuserid = '$sUserID' or oxdelivery.oxuserid = '' ) and (";
            // usergroup
            if( $myConfig->oUser)
                $oUser = &$myConfig->oUser;
            else
            {   $oUser = &oxNew( "oxuser", "core");
                $oUser->Load( $sUserID);
                // cache this
                $myConfig->oUser = &$oUser;
            }
            $blSep = false;
			if( isset( $oUser->oGroups->aList))
            {	reset( $oUser->oGroups->aList);
	            while (list($key, $value) = each($oUser->oGroups->aList))
	            {   if( $blSep)
	                    $sSelect .= " or ";
	                $sSelect .= " oxdelivery.oxusergroupid = '".$value->oxobject2group__oxgroupsid->value."'";
	                $blSep = true;
	            }
			}
            if( $blSep)
                $sSelect .= " or ";
            $sSelect .= " oxdelivery.oxusergroupid = '' ) ";
            
            // add delivery country if it's there
            if( $sDeliveryCountry)
            	$sSelect .= " and ( oxdelivery.oxcountry like '%$sDeliveryCountry%' || oxdelivery.oxcountry = '' ) ";
        }
        else
            $sSelect .= " and oxdelivery.oxuserid = '' and oxdelivery.oxusergroupid = '' ";

        $oList->selectString( $sSelect);
        
        //echo( "$sSelect  <br><br>");
        
        return $oList;
    }
    
    
    function getVATList()
    {
        $oVAT = &oxNew( "oxvatlist", "core");

        foreach( $this->oDiscountList->aList as $oDiscount)
            if( $oDiscount->oxdiscount__oxtype->value == "v")
            {   //echo( "adding ".$oDiscount->sOXID." - ".$oDiscount->oxdiscount__oxaddsum->value." <br>");
                $oVAT->aList[$oDiscount->sOXID] = $oDiscount;
            }
            
        return $oVAT;
    }

    function getDiscountList( $blArticle = true)
    {   // if $blArticle we dont get the discounts connected to basket
        // as these will be calculated in basket otherwise we only get these
        
        // load discounts
        $oDiscList = &oxNew( "oxdiscountList", "core");
        
        foreach( $this->oDiscountList->aList as $oDiscount)
            if( $oDiscount->oxdiscount__oxtype->value == "d")
            {   if( $blArticle && !($oDiscount->oxdiscount__oxamount->value || $oDiscount->oxdiscount__oxprice->value))
                    $oDiscList->aList[$oDiscount->sOXID] = $oDiscount;
                elseif( !$blArticle && ($oDiscount->oxdiscount__oxamount->value || $oDiscount->oxdiscount__oxprice->value))
                    $oDiscList->aList[$oDiscount->sOXID] = $oDiscount;
            }
            
        return $oDiscList;
    }

    function getPrice()
    {   global $myConfig;
    
        // generate disocunt list
        if( !$this->oDiscountList)
            $this->oDiscountList = $this->LoadDiscountList();
            
        $dPrice = $this->oxarticles__oxprice->value;

        // 1.) calculate discounts
        $this->oDiscount = $this->getDiscountList();
        $dDiscount = 0;
        if( isset( $this->oDiscount->aList))
        {   foreach( $this->oDiscount->aList as $oDiscount)
            {   //echo( "checking ".$oDiscount->oxdiscount__oxtitle->value."<br>");
                if( $oDiscount->oxdiscount__oxaddsumtype->value == "abs")
                    $dValue = $oDiscount->oxdiscount__oxaddsum->value;
                elseif( $oDiscount->oxdiscount__oxaddsumtype->value == "%")
                    $dValue = ($oDiscount->oxdiscount__oxaddsum->value/100) * $dPrice;

                if( $dValue > $dDiscount)
                    $dDiscount = $dValue;
            }
        }
        //echo("discount : $dPrice - $dDiscount (".$oDiscount->oxdiscount__oxaddsum->value.")<br>");
        $dPrice = $dPrice - $dDiscount;
        
        // 2.) apply VAT
        $this->oVAT = $this->getVATList();
        $aVAT = array();

        if( isset( $this->oVAT->aList))
        {   foreach( $this->oVAT->aList as $oVAT)
            {   // take the VAT in the order how it is shown in admin
                $dVAT = $oVAT->oxdiscount__oxaddsum->value;
                //echo( "checking : $dVAT <br>");
                if( $oVAT->oxdiscount__oxuserid->value)
                {   if( isset( $aVAT[0]) && $dVAT > $aVAT[0])
                        continue;
                    $aVAT[0] = $dVAT;
                    continue;
                }
                elseif( $oVAT->oxdiscount__oxusergroupid->value)
                {   if( isset( $aVAT[1]) && $dVAT > $aVAT[1])
                        continue;
                    $aVAT[1] = $dVAT;
                    continue;
                }
                elseif( $this->oxarticles__oxvat->value)
                {   // vat at article itself
                    if( isset( $aVAT[2]) && $this->oxarticles__oxvat->value > $aVAT[2])
                        continue;
                    $aVAT[2] = $this->oxarticles__oxvat->value;
                    continue;
                }
                elseif( $oVAT->oxdiscount__oxcatnid->value)
                {   if( isset( $aVAT[3]) && $dVAT > $aVAT[3])
                        continue;
                    $aVAT[3] = $dVAT;
                    continue;
                }
                elseif( $oVAT->oxdiscount__oxuserid->value=="" && $oVAT->oxdiscount__oxusergroupid->value=="" && $oVAT->oxdiscount__oxcatnid->value=="")
                {   if( isset( $aVAT[4]) && $dVAT > $aVAT[4])
                        continue;
                    $aVAT[4] = $dVAT;
                    continue;
                }
            }
        }
        
        // take the right one
        for( $i = 0; $i < 5; $i++)
        {   if( isset( $aVAT[$i]))
            {   $dVAT = $aVAT[$i];
                break;
            }
        }
        
        if( !isset( $dVAT))
            $dVAT = $myConfig->dDefaultVAT;

        $this->vatPercent   = $dVAT;
            
        // now we have to decide if the base price was stored including VAT or nor
		if( $myConfig->blEnterNetPrice)
		{	// price from the database is NETPRICE            
        	$this->netPrice     = $dPrice;
        	$this->brutPrice 	= $this->netPrice * ( 1 + ((1/100)*$this->vatPercent));
		}
		else 
		{	// price from the database is BRUTPRICE
        	$this->brutPrice    = $dPrice;
        	$this->netPrice 	= $this->brutPrice / ( 1 + ((1/100)*$this->vatPercent));
		}

       	$this->vat 			= $this->brutPrice - $this->netPrice;
        // convert to target currency
        $oCur = $myConfig->getActShopCurrencyObject();
        
        $dPrice = $this->brutPrice * $oCur->rate;
        
        $this->fprice   = FormatCurrency( $dPrice, $oCur);
        $this->ftprice  = FormatCurrency( $this->oxarticles__oxtprice->value * $oCur->rate, $oCur);
        
        // format deliverydate
        if( $this->oxarticles__oxdelivery->value != "0000-00-00")
        	$this->foxdelivery = FormatDBDate( $this->oxarticles__oxdelivery->value);
        
        return $dPrice;
    }
    
}

?>
