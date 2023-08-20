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

class Imex_do extends oxAdminView
{

	function Init()
    {   global $myConfig;
        global $mySession;

        // create navigation
        $this->aEditNavigation = array();

        $oNavItem->name     = "Export";
        $oNavItem->location = "imex_export";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Import";
        $oNavItem->location = "imex_import";
        $this->aEditNavigation[] = $oNavItem;
        
        $this->iDefEdit = 0;

        parent::Init();
    }

    function render()
    {   global $myConfig;

        parent::render();
        
       	$this->aViewData["default_edit"] =  "imex_export";
        
        $sDo 	= $myConfig->getParameter( "imex_fnc");
        $iStart = $myConfig->getParameter( "rStart");
        $this->aViewData["iStart"] =  $iStart;
        $iTable = $myConfig->getParameter( "rparam");
        if( isset( $iTable))
        {	$this->aViewData["param"] =  $iTable;
        	$aTables = $myConfig->getParameter( "atables");
        	$this->aViewData["table"] =  $aTables[$iTable];
        }
        
        if( isset($sDo) && $sDo == "doexport")
        {	$this->aViewData["default_edit"] 	=  "imex_export";
        	$this->aViewData["fnc"] 			=  $sDo;
        	$this->aViewData["text"] 			=  "Exportiere... ";
        	$this->aViewData["refresh"]  		=  $myConfig->iExportTickerRefresh;

        	return "imex_run.tpl";
        }
        elseif( isset($sDo) && $sDo == "doimport")
        {	$this->aViewData["default_edit"] 	= "imex_import";
        	$this->aViewData["fnc"] 			= $sDo;
        	$this->aViewData["text"] 			= "Importiere... ";
        	$this->aViewData["refresh"]  		= $myConfig->iImportTickerRefresh;
        	$this->aViewData["actedit"]     	= 1;
        	$this->aViewData["default_edit"] 	=  "imex_import";

        	return "imex_run.tpl";
        }
        else 
        {	        	
        	$blFin = $myConfig->getParameter( "finished");
        	$myConfig->delParameter( "finished");
        	if( isset( $blFin) && $blFin)
        	{	$this->aViewData["blFin"] 	= 1;
        		$this->aViewData["actedit"] = $blFin - 1;
        	}
        	
	        return "imex_do.tpl";
        }
    }
    
    function doexport()
    {	global $myConfig;
    	$blEnd  = false;
    	
        $sFilepath = $myConfig->getParameter( "filepath");
       	$myConfig->setParameter( "filepath", $sFilepath);
        	
    	$iStart = $myConfig->getParameter( "iStart");
    	if( !isset( $iStart))
    		$iStart = 0;
    	$iTable = $myConfig->getParameter( "param");
    	if( !isset( $iTable))
    	{	// start export, delete file
    		@unlink( $sFilepath);
    		$iTable = 0;
    	}
    	$aTables = $myConfig->getParameter( "atables");
    	
    	$myConfig->setParameter( "atables", $aTables);
    	
    	$sTable = $aTables[$iTable];
    	
    	$oImex = &oxNew( "oximex", "core");
    	$oImex->Init( $sTable);
    	
    	if( !$oImex->export( $iStart, $myConfig->iExportNrofLines, $sFilepath))
    	{	// next table ?
    		$iTable++;
    		$iStart = -$myConfig->iExportNrofLines;
    		if( $iTable >= count( $aTables))
    			$blEnd = true;	
    	}
		
		if( !$blEnd)
		{	// continue	
    		$iStart += $myConfig->iExportNrofLines; 
	    	$myConfig->setParameter( "rStart", $iStart);
	    	$myConfig->setParameter( "rparam", $iTable);
    		$myConfig->setParameter( "imex_fnc", "doexport");
		}
		else
		{	$myConfig->delParameter( "imex_fnc");
			$myConfig->delParameter( "rStart");
			$myConfig->delParameter( "rparam");
			$myConfig->delParameter( "filepath");
			$myConfig->delParameter( "atables");
			$myConfig->setParameter( "finished", 1);
		}	
    	
    }
    
    function doimport()
    {	global $myConfig;
    	
        $sFilepath = $myConfig->getParameter( "filepath");
       	$myConfig->setParameter( "filepath", $sFilepath);
        	
    	$iStart = $myConfig->getParameter( "iStart");
    	if( !isset( $iStart))
    		$iStart = 0;
    		
    	$oImex = &oxNew( "oximex", "core");
    	
    	if( !$oImex->import( $iStart, $myConfig->iImportNrofLines, $sFilepath))
		{	$myConfig->delParameter( "imex_fnc");
			$myConfig->delParameter( "rStart");
			$myConfig->delParameter( "rparam");
			$myConfig->delParameter( "filepath");
			$myConfig->delParameter( "atables");
			$myConfig->setParameter( "finished", 2);
		}	
		else
		{	// continue	
    		$iStart += $myConfig->iImportNrofLines; 
	    	$myConfig->setParameter( "rStart", $iStart);
    		$myConfig->setParameter( "imex_fnc", "doimport");
		}
    	
    }    
}

?>
