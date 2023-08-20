<?php

// MK
require_once '_compatible_layer_patch.php';

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

if (!function_exists('getShopBasePath'))
{	function getShopBasePath()
	{	global $HTTP_SERVER_VARS;
	    
		// try path translated
		if( isset( $HTTP_SERVER_VARS['PATH_TRANSLATED']))
			$sFilepath = $HTTP_SERVER_VARS['PATH_TRANSLATED'];
		else 
			$sFilepath = $HTTP_SERVER_VARS['SCRIPT_FILENAME'];
			
		$sFilepath = strtolower( $sFilepath);
		$sFilepath = str_replace( "admin/index.php", "", $sFilepath);   	
		$sFilepath = str_replace( "admin\\\\index.php", "", $sFilepath);
		$sFilepath = str_replace( "index.php", "", $sFilepath);   	
				
		return $sFilepath;
	}
}

require_once( getShopBasePath()."/oxconfig.php");
oxPageStart();

$oShopControl = new oxShopControl();
$oShopControl->start();

class oxShopControl
{
    var $aClassCache = array();

    function start()
    {   global $myConfig;
        global $mySession;

        $class     = $myConfig->getParameter("cl");
        $function  = $myConfig->getParameter("fnc");
        
        if ($class == "") 
        {   if( !isset( $myConfig->blAdmin) || !$myConfig->blAdmin)
            {   // first start of the shop
                // check wether we have to display mall startscreen or not

                if( $myConfig->IsMall())
                {	$oShoplist = &oxNew( "oxshoplist", "core");
	                if( $oShoplist->GetSQLCount( array( "oxshops.oxactiv" => 1)) > 1)
    		                $class = "mallstart";
                }
                else
                {   $class = "start";
                    $oShoplist = &oxNew( "oxshoplist", "core");
                    if( $oShoplist->GetSQLCount( array( "oxshops.oxactiv" => 1, "oxshops.oxid" => "oxbaseshop")) != 1)
                        die( "Shop wegen Wartungsarbeiten deaktiviert<br>Bitte versuchen Sie es spaeter nocheinmal<br><br>Wir bitten um Verstaendniss.");
                	// baseshop always active
                    $mySession->setVar( "actshop", "oxbaseshop");
                }
            }
            else
                $class = "login";
        }
 
        $this->process( $class, $function);
    }
    
    function process( $class, $function)
    {	global $myConfig;
    
		// OXID : add timing
		if( $myConfig->iDebug)
		{	list($usec, $sec) = explode(" ",microtime());
        	$time_start = ((float)$usec + (float)$sec);
		}

		if ($class == "") 
			die ("You need to specify a valid class name !");
		
		$classObject  = null;
		$sNewAction   = null;
		
		if (!isset( $this->aClassCache[$class] ))
			$this->aClassCache[$class] = &oxNew( $class);
		
        $classObject = &$this->aClassCache[$class];
	
		// init
        $classObject->init();
        $blExecuted = false;
        // execute
        if( $function)		
        {   if( method_exists( $classObject, $function))
            {   $sNewAction = $classObject->$function();
                $blExecuted = true;
            }
    		else
            {   // search for this function in the components
                foreach (array_keys( $classObject->oaComponents) as $key)
                {   $oComponent = & $classObject->oaComponents[$key];
                    if( method_exists( $oComponent, $function))
                    {   $sNewAction = $oComponent->$function();
                        $blExecuted = true;
                        break;
                    }
                }
            }
            if( !$blExecuted)
                die( "Function $function not found in $classObject and dependend components ! => shutdown");
        }
        
        // render it
        $templateName = $classObject->render();

	    // do we have to display something else ?
		if( !$sNewAction)
		{
			oxPageClose();
			// show output
			$smarty = getSmarty();
			
			foreach($classObject->aViewData as $viewName=>$viewData)
			{	// show debbuging information
				if( $myConfig->iDebug == 4)	
				{	echo( "TemplateData[$viewName] : \n");
					print_r( $classObject->aViewData[$viewName]);
				}
				$smarty->assign($viewName, $classObject->aViewData[$viewName]);
			}
		
			// check if template dir exists
			$sFile = $myConfig->getTemplateFile( $templateName);
			if (!file_exists( $sFile))
				die( "$sFile not found !<br>Shutdown system...");
			
			$smarty->display($templateName);
			
			if( $myConfig->iDebug)
			{	// output timing
	            list($usec, $sec) = explode(" ",microtime());
	            $time_end = ((float)$usec + (float)$sec);
	            $time = $time_end - $time_start;
	            echo "Execution time :  $time <br>";
			}
						
			exit();
		}
        else
        {   // another action
    		$aNewAction   = explode("/", $sNewAction);
    		$cl           = @$aNewAction[0];
    		$fnc          = @$aNewAction[1];
    		if( $cl != "stop")
    			$this->process( $cl, $fnc);
        }
    }
}
?>
