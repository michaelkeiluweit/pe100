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
chdir(__DIR__);
require_once '../_compatible_layer_patch.php';

require_once( "../oxconfig.php");


$myConfig->blAdmin = true;
require_once( "oxadminview.php");

class Login extends oxAdminView
{
    function login()
    {
        $this->sThisAction  = "login";
    }

    function render()
    {   global $myConfig;
    
        parent::render();

        if( $myConfig->blDemoMode)
        {	$this->AddTplParam( "user", "admin");
        	$this->AddTplParam( "pwd", "admin");
        }

        return "login.tpl";
    }
    
    function checklogin()
    {   global $myConfig;
        global $mySession;
        
        $user   = $myConfig->getParameter(  "user");
        $pwd    = $myConfig->getParameter(  "pwd");

        if( $mySession->login( $user, $pwd))
        {   // success
            return "start";
        }
        else
        {   
            $this->AddTplParam( "user", $user);
            $this->AddTplParam( "pwd", $pwd);
            $this->AddTplParam( "loginerror", 1);
        }
    }
}

?>