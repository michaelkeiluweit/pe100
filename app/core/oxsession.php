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

if( !class_exists("oxSession"))
{   class oxSession
    {
        var $id     = "";
        var $name   = "";

        function start()
        {
            // MK
            /*
            @ini_set('session.use_trans_sid', 0);
            @ini_set('session.use_cookies', 0 );
            @ini_set('session.serialize_handler', 'php' );
            @ini_set('session.name', "sid" );
            @ini_set('session.gc_probability', 1);
            @ini_set('session.gc_maxlifetime', 86400);
            @ini_set('session.auto_start', 0);
            @ini_set('register_globals', 0);
            */
            session_start();

            $this->id   =   session_id();
            $this->name =   "sid";
        }

        function freeze()
        {
            session_write_close();
        }

        function setVar( $name, $value )
        {
            $_SESSION[$name] = $value;
        }

        function getVar( $name )
        {
            if( isset( $_SESSION[$name] ))
                return $_SESSION[$name];
            else
                return null;
        }

        function deleteVar( $name )
        {   $_SESSION[$name] = null;
            unset($_SESSION[$name]);
        }

        function hasVar( $name )
        {
            return isset($_SESSION[$name]);
        }

        function hiddenSession()
        {
            return "<input type=\"hidden\" name=\"" . $this->name . "\" value=\"". $this->id . "\">";
        }

        function url($url)
        {
            // MK
            //$url    = ereg_replace("[&?]+$", "", $url);
            $url    = preg_replace("/[&?]+$/", "", $url);
            $url   .= ( strstr($url, "?") != false ?  "&" : "?" ).  $this->sid();

            return $url;
        }

        function sid()
        {	global $myConfig;

            $sRet = $this->name."=".$this->id;

    		$sClient = strtolower( getenv("HTTP_USER_AGENT"));
    		foreach( $myConfig->aRobots as $sRobot)
    		{	if( strstr( $sClient, $sRobot))
    			{	$sRet = $this->name."=x";
    				break;
    			}
    		}

            return $sRet;
        }

        function destroy()
        {
            unset($_SESSION);
            session_destroy();
        }

        function login( $user, $password)
        {    global $myConfig;

            $oRet = null;

            $oUserList = &oxNew( "oxlist", "core");
            $oUserList->Init( "oxuser");

            $sSelect =  "select * from oxuser where oxuser.oxactiv = 1 and oxuser.oxpassword = '$password' and ( oxuser.oxcustnr = '$user' or oxuser.oxusername = '$user') ";
            if( $oUserList->selectString( $sSelect));
            {

                $oUser = current( $oUserList->aList);

                if( isset( $oUser))
                {   $this->setVar( "auth", $oUser->oxuser__oxid->value);
                    $oRet = $oUser;
                }
            }

            return $oRet;
        }

    }
}

$mySession = null;

if (!function_exists('oxPageStart'))
{   function oxPageStart()
    {
        global $myConfig;
        global $mySession;

        $mySession = new oxSession();
        $mySession->start();

        // assign default values
        if (!$mySession->hasVar("language") )
            $mySession->setVar("language", $myConfig->sDefaultLang );
        if (!$mySession->hasVar("currency") )
            $mySession->setVar("currency", "0" );
    }
}

if (!function_exists('oxPageClose'))
{   function oxPageClose()
    {
        global $mySession;

        if (isset($mySession))
            $mySession->freeze();
        unset( $mySession);
        $mySession = NULL;
    }
}


?>
