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
require_once( "../oxview.php");

class oxAdminView extends oxView
{
    var $oList          = null;
    var $iCurrListPos   = 0;
    var $iListSize      = 0;
    var $aWhere         = null;
    var $sListClass     = null;
    var $sListType      = "oxlist";
    var $aEditNavigation= array();
    var $iActiveEditNav = 0;
    // assigned by main class
    var $sDefSort       = null;
    var $aSort          = array();
    // fixed types - enums in database
    var $aSumType       = array(
                                0 => "abs",
                                1 => "%"
                                );
    // override this in list class to show other tab from beginning
    var $iDefEdit       = 1;
    var $blDesc			= false;
    var $sShopTitle     = null;

    function oxAdminView()
    {   global $myConfig;
        global $mySession;
    
        // actual shop
        $sShopID = $mySession->getVar( "actshop");
        if( $sShopID)
        {   $oShop = &oxNew( "oxshop", "core");
            if( $oShop->Load( $sShopID))
            {   $this->sShopTitle = $oShop->oxshops__oxname->value;
                $myConfig->SetSerial( $oShop->oxshops__oxserial->value);
            }
        }
        if( !isset($this->sShopTitle) || !$this->sShopTitle)
            $this->sShopTitle = " - ";

        parent::oxView();
    }
    
    function IsOX( $oObject)
    {
        if( $oObject->sOXID[0] == 'o' && $oObject->sOXID[1] == 'x')
            $oObject->isinternal = true;
        
        return $oObject;
    }

    function Init()
    {   global $myConfig;
        global $mySession;

        $this->iCurrListPos = $myConfig->getParameter( "lstrt");
        if( !isset( $this->iCurrListPos) || !$this->iCurrListPos)
            $this->iCurrListPos = 0;

        $iLanguage = $myConfig->getParameter( "language");
        if( isset( $iLanguage))
            $mySession->setVar( "language", $iLanguage);

        if( $this->sListClass)
        {   $this->oList = &oxNew( $this->sListType, "core");
            $this->oList->iSQLRecords   = $myConfig->iAdminListSize;
            $this->oList->iSQLStart     = $this->iCurrListPos;
            $this->oList->Init( $this->sListClass);
            // callback for setting OX
            $this->oList->aAssignCallback = array(&$this, "IsOX");
            // sorting
            $this->aSort[0] = $myConfig->getParameter( "sort");
            if( !isset( $this->aSort[0]) || !$this->aSort[0])
                $this->aSort[0] = $this->sDefSort;
            $aWhere = $this->BuildWhere();
            
            if( isset( $this->aSort[0]))
            {   //echo( $this->aSort[0]);
                $blDesc = $myConfig->getParameter( "adminorder");
                if( !isset( $blDesc))
                    $blDesc = $this->blDesc;
                //$myConfig->setParameter( "adminorder", !$blDesc);   // toggle
            }
            else
                $blDesc = $this->blDesc;
                
            $this->oList->Select( $aWhere, $this->aSort, $blDesc);
            
            $this->iListSize = $this->oList->GetSQLCount( $aWhere);
        }

        // Init Edit navigation
        while (list($key, $val) = each($this->aEditNavigation))
        {   $val->pos = $key;
            $this->aEditNavigation[$key] = $val;
        }

        parent::Init();
    }

    /** TODO : DOKU
     *  @param $aIn , type: array
     *  @returns string with values
     */
    function AddGlobalParams( $shop = null)
    {   global $mySession;
        global $myConfig;

        $shop = parent::AddGlobalParams( $shop);

        // override cause of admin dir
        $this->aViewData["shop"]->selflink     = $myConfig->sShopURL."admin/index.php";
        
        return $shop;
    }

    function render()
    {   global $myConfig;
        global $mySession;

        parent::render();

        //print_r( $this->oList->aList);

        // assign our list
        if( $this->oList)
            $this->aViewData["mylist"] = $this->oList->aList;

        // build where
        $aWhere  = $myConfig->getParameter( "where");
        if( isset( $aWhere) && $aWhere)
        {   while (list($name, $value) = each($aWhere))
            {   $sName = GetArrFldName($name);
                $aSmartyWhere->$sName = $value;
            }
            $this->aViewData["where"] = $aSmartyWhere;
        }

        // list navigation
        $blShowNavigation = false;
        if( $this->iListSize > $myConfig->iAdminListSize)
        {   // yes, we need to build the navigation object
            $pagenavigation->pages      = round( ($this->iListSize / $myConfig->iAdminListSize) + 0.5, 0);
            $pagenavigation->actpage    = round( ($this->iCurrListPos / $myConfig->iAdminListSize) + 0.5, 0);
            $iPos =  $this->iCurrListPos + $myConfig->iAdminListSize;
            if(  $iPos < $this->iListSize)
            {   $iPos =  $this->iCurrListPos + $myConfig->iAdminListSize;
                $pagenavigation->nextlink   = "Javascript:document.search.lstrt.value=$iPos;document.search.submit();";
            }
            else
                $pagenavigation->nextlink = "";

            if( ($this->iCurrListPos - $myConfig->iAdminListSize) >= 0)
            {   $iPos =  $this->iCurrListPos - $myConfig->iAdminListSize;
                $pagenavigation->backlink   = "Javascript:document.search.lstrt.value=$iPos;document.search.submit();";
            }
            else
                $pagenavigation->backlink = "";

            $this->aViewData["pagenavi"] = $pagenavigation;
            $iPos = $myConfig->getParameter( "lstrt");
            if( !isset( $iPos) || !$iPos)
                $iPos = 0;
            $this->aViewData["lstrt"]    = $iPos;
            $this->aViewData["listsize"] = $this->iListSize;
            $blShowNavigation = true;
        }
        // determine not used space in List
        $iShowListSize = $this->iListSize - $this->iCurrListPos;
        $iNotUsed = $myConfig->iAdminListSize - min( $iShowListSize, $myConfig->iAdminListSize);
        $iSpace = $iNotUsed * 15;
        if( !$blShowNavigation)
            $iSpace += 20;
        $this->aViewData["iListFillsize"]= $iSpace;
        
        // sorting
        $this->aSort[0] = $myConfig->getParameter( "sort");
        if( !isset( $this->aSort[0]) || !$this->aSort[0])
            $this->aSort[0] = $this->sDefSort;
        $this->aViewData["sort"] = $this->aSort[0];

        // object to edit
        $soxId = $myConfig->getParameter( "oxid");
        if( !isset( $soxId) || !$soxId)
            $soxId = -1;
        $this->aViewData["oxid"] = $soxId;

        // Navigation bar
        $this->iActiveEditNav = $myConfig->getParameter( "actedit");
        if( !isset( $this->iActiveEditNav) || !$this->iActiveEditNav)
            $this->iActiveEditNav = 0;
        // first call set to page 1
        if( $soxId == -1)
            $this->iActiveEditNav = $this->iDefEdit;
        $iCnt = sizeof( $this->aEditNavigation);
        $iLineSize = 760 - ($iCnt * 63);
        $this->aViewData["navilinesize"]    = $iLineSize;

        $this->aViewData["editnavi"]    = $this->aEditNavigation;
        $this->aViewData["actedit"]     = $this->iActiveEditNav;

        // add Sumtype to all templates
        $this->aViewData["sumtype"] =  $this->aSumType;

        $this->aViewData["actshop"] = $this->sShopTitle;

        // language
        $iLanguage = $myConfig->getParameter( "language");
        if( !isset( $iLanguage))
            $iLanguage = 0;
        $aLanguages = $myConfig->GetLanguageArray($iLanguage);
        // add languages to all templates
        $this->aViewData["languages"]   = $aLanguages;
        $this->aViewData["actlang"]     = $iLanguage;
        
        // serial stuff
        $this->aViewData["ismall"]          = $myConfig->IsMall();
        $this->aViewData["isnewsletter"]    = $myConfig->IsNewsletter();
        $this->aViewData["isvarianten"]     = $myConfig->IsVarianten();
        $this->aViewData["isreview"]        = $myConfig->IsReview();
        $this->aViewData["addsales"]        = $myConfig->IsAddSales();
        $this->aViewData["isdemoversion"]   = $myConfig->IsDemoVersion();
    }

    function BuildWhere()
    {   global $myConfig;
        $aWhere = array();

        $aWhere  = $myConfig->getParameter( "where");
        if( isset( $aWhere) && $aWhere)
        {   while (list($name, $value) = each($aWhere))
                if( $value)
                    $this->aWhere[$name] = "%".$value."%";
        }

        return $this->aWhere;
    }

    /** Delete this entry from the database
     *
     */
    function DeleteEntry()
    {   global $myConfig;

        $soxId = $myConfig->getParameter( "oxid");
        $oDelete = &oxNew( $this->sListClass, "core");
        $oDelete->delete( $soxId);

        $this->Init();
    }
    
    function ProcessFiles( $oObject)
    {   global $_FILES;
        global $myConfig;
        
        if( isset( $_FILES['myfile']['name']))
        {   // process all files
            while (list($key, $value) = each($_FILES['myfile']['name']))
            {   $aSource = $_FILES['myfile']['tmp_name'];
                $sSource = $aSource[$key];
                $aFiletype = explode( "@", $key);
                $key    = $aFiletype[1];
                $sType  = $aFiletype[0];
                $value = strtolower( $value);
                // add type to name
                $aFilename = explode( ".", $value);
                if( isset($aFilename[1]))
                    $value = $aFilename[0] . "_" .strtolower($sType).".".$aFilename[1];
                $sTarget = $myConfig->getAbsDynImageDir() . "/$value";
                // add file process here
                $blCopy = false;
                switch( $sType)
                {   case 'TH':
                        if( $myConfig->sThumbnailsize)
                        {   // convert this file
                            $aSize = explode( "*",$myConfig->sThumbnailsize);
                            $iX = $aSize[0];
                            $iY = $aSize[1];
                            $blCopy = resizeImage( $sSource, $sTarget, $iX, $iY);
                        }
                        break;
                    case 'TC':
                        if( $myConfig->sCatThumbnailsize)
                        {   // convert this file
                            $aSize = explode( "*",$myConfig->sCatThumbnailsize);
                            $iX = $aSize[0];
                            $iY = $aSize[1];
                            $blCopy = resizeImage( $sSource, $sTarget, $iX, $iY);
                        }
                        break;
                    case 'P1':
                    case 'P2':
                    case 'P3':
                    case 'P4':
                    case 'P5':
                        $iPic = $sType[1] - 1;
                        if( $myConfig->aPicSizes[$iPic])
                        {   // convert this file
                            $aSize = explode( "*",$myConfig->aPicSizes[$iPic]);
                            $iX = $aSize[0];
                            $iY = $aSize[1];
                            $blCopy = resizeImage( $sSource, $sTarget, $iX, $iY);
                        }
                        break;
                    default:
                        break;
                }
                if( !$blCopy)
                    move_uploaded_file( $sSource, $sTarget);
                // assign the name
                if( isset( $value) && $value)
                    $oObject->$key->value = $value;
            }
        }
        
        return $oObject;
    }
}

?>
