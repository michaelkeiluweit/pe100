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

class User_list extends oxAdminView
{
    function Init()
    {   global $myConfig;
        global $mySession;
        
        $this->sListClass   = "oxuser"; 
        $this->sDefSort     = "oxuser.oxusername";
        
		
        // create navigation        
		$this->aEditNavigation = array();
        /*$oNavItem->name     = "&Uuml;bersicht";
        $oNavItem->location = "user_overview";
        $this->aEditNavigation[] = $oNavItem;*/

        $oNavItem->name     = "Stamm";
        $oNavItem->location = "user_main";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Erweitert";
        $oNavItem->location = "user_extend";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Historie";
        $oNavItem->location = "user_remark";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Adressen";
        $oNavItem->location = "user_address";
        $this->aEditNavigation[] = $oNavItem;

        $oNavItem->name     = "Zahlung";
        $oNavItem->location = "user_payment";
        $this->aEditNavigation[] = $oNavItem;
        
        $this->iDefEdit = 0;
        
        parent::Init();
		
		// set mark for blacklists
		while (list($name, $value) = each($this->oList->aList))
		{
			if( $value->InGroup( "oxblacklist"))
			{	$value->blacklist = "1";
				$this->oList->aList[$name] = $value;
			}
		}
    }

    function render()
    {   global $myConfig;
    
        parent::render();

        // default page number 1
        $this->aViewData["default_edit"] =  "user_main";
        
        return "user_list.tpl";
    }
}

?>
