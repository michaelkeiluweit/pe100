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

require_once ( getShopBasePath() . "/core/oxsession.php");
require_once ( getShopBasePath() . "/core/oxutils.php");
require_once ( getShopBasePath() . "/core/adodb/adodb.inc.php");

if (!function_exists('str_rot13'))
{
   function str_rot13($str) {
       $from = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
       $to   = 'nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM';

      return strtr($str, $from, $to);
   }
}

/** docu is missing !
 *
 *  add docu here
 *
*/
if( !class_exists("oxConfig"))
{
    class oxConfig
    {
        // --------------------------------------------------------
        // internal
        // --------------------------------------------------------
        var $oDB            = null;
        var $sCoreDir       = null;
        var $sVersion       = "1.0.1";
        var $iAdminListSize = 9;

        // Cached Objects - for better perfomance these are used
        // in some core classes
        var $oUser          = null;
        var $aArticleCats   = array();
        var $oBasket        = null;
        var $blAdmin        = false;

        var $sSerialNr      = null;

        function oxConfig()
        {	
        	include( getShopBasePath()."/config.inc.php");
        }

        function Init()
        {
            // init the system
            $this->StartUpDatabase();

            $this->sShopURL     .= "/";
            $this->sSSLShopURL  .= "/";

            $this->sCoreDir = $this->sShopDir . "/core/";
        }

        function getParameter(  $paramName)
        {   global $mySession;
            global $_SERVER;

            // get the param from the session
            $paramValue = null;
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST[$paramName]))
                $paramValue = $_POST[$paramName];
            else if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET[$paramName]))
                $paramValue = $_GET[$paramName];
            else if ($mySession->hasVar($paramName))
                $paramValue = $mySession->getVar($paramName);
            else
                $paramValue = null;

            return $paramValue;
        }

        function setParameter($paramName, $paramValue)
        {   global $mySession;

            $mySession->setVar($paramName, $paramValue);
        }

        function delParameter($paramName)
        {   global $mySession;

            $mySession->deleteVar($paramName);
        }

        function getClassFile( $className)
        {   if (array_key_exists($className, $this->aModules))
                $sClassName = $this->aModules[$className];
            else
                $sClassName = $className;

           	// check if there is path, if yes, remove it
           	$iPos = strrpos( $sClassName, "/");
           	if( $iPos !== false)
    			$sClassName = substr( $sClassName, $iPos+1);

    		return $sClassName;
        }

        function getClassDir( $className, $sOffset = null)
        {
            if( $this->blAdmin && !$sOffset)
                $sShopDir = "/admin";
            elseif( $sOffset)
                $sShopDir = "/" . $sOffset;
            else
                $sShopDir = "";

            if (array_key_exists($className, $this->aModules))
            {  // if module is installed then we need toset different pammmth
                $sClassPath = $this->sShopDir . "/modules/" . $this->aModules[$className] . ".php";
            }
            else
                $sClassPath = $this->sShopDir . "$sShopDir/" . $className . ".php";

            return $sClassPath;
        }

        function getShopId()
        {   $shopid = $this->getParameter( "shopid");

            if( !$shopid)
            {   if( $this->IsMall())
                    $shopid = "mall";
                else
                    $shopid = "oxbaseshop";
            }

            return $shopid;
        }

        function getActURLPara()
        {   global $_POST;
            global $_GET;

    	if (!empty($_POST)) extract($_POST);
            elseif (!empty($HTTP_POST_VARS)) extract($HTTP_POST_VARS);

    	if (!empty($_GET)) extract($_GET);
            elseif (!empty($HTTP_GET_VARS)) extract($HTTP_GET_VARS);

            if( isset( $_SERVER["argv"][0]))
                return $_SERVER["argv"][0];
            else
                return null;
        }

        function getShopHomeURL()
        {   global $mySession;

            return $mySession->url( $this->sShopURL."index.php");
        }

        function getShopSecureHomeURL()
        {   global $mySession;

            if( strlen( $this->sSSLShopURL) > 1)
                $sURL = $this->sSSLShopURL;
            else
                $sURL = $this->sShopURL;
                
            return $mySession->url( $sURL."index.php");
        }

        function getShopLanguage()
        {   $slang = $this->getParameter( "tpllanguage");

            if( !$slang)
                $slang = $this->sDefaultLang;

            return $slang;
        }

        function getShopCurrency()
        {   $sCur = $this->getParameter( "currency");

            if( !$sCur)
                $sCur = 0;

            return $sCur;
        }

        function getActShopCurrencyObject()
        {   $iCur = $this->getShopCurrency();
            $aCurrencies = $this->GetCurrencyArray();
            $oCur = $aCurrencies[$iCur];

            return $oCur;
        }

        function getTemplateFile( $template)
        {
            return $this->getTemplateDir() . "/" . $template;
        }

        function getTemplateDir()
        {
            $sTemplateDir  = $this->sShopDir . "/" . $this->getBaseTplDir();
            $sTemplateDir .= $this->getShopLanguage() . "/templates";

            return $sTemplateDir;
        }

        function getURLTemplateDir()
        {
            $sTemplateDir  = $this->sShopURL . $this->getBaseTplDir();
            $sTemplateDir .= $this->getShopLanguage() . "/templates";

            return $sTemplateDir;
        }

        function getImageDir()
        {
            $sTemplateDir  = $this->sShopURL;
            $sTemplateDir .= $this->getBaseTplDir();
            $sTemplateDir .= $this->getShopLanguage() . "/images";

            return $sTemplateDir;
        }

        function getAbsImageDir()
        {
            $sTemplateDir  = $this->sShopDir;
            $sShopDir      = $this->getShopId();
            $sTemplateDir .=  "/out" . "/" . $sShopDir . "/" . $this->sChannel . "/";
            $sTemplateDir .= $this->getShopLanguage() . "/images";

            return $sTemplateDir;
        }

        function getDynImageDir()
        {
            $sTemplateDir  = $this->sShopURL;
            $sShopDir = $this->getShopId();
            $sTemplateDir .=  "out" . "/" . $sShopDir . "/" . $this->sChannel . "/";
            $sTemplateDir .= $this->getShopLanguage() . "/dyn_images";

            return $sTemplateDir;
        }

        function getAbsDynImageDir()
        {
            $sTemplateDir  = $this->sShopDir;
            $sShopDir      = $this->getShopId();
            $sTemplateDir .=  "/out" . "/" . $sShopDir . "/" . $this->sChannel . "/";
            $sTemplateDir .= $this->getShopLanguage() . "/dyn_images";

            return $sTemplateDir;
        }

        function getBaseTplDir()
        {   $sShopDir = $this->getShopId();
            if( $this->blAdmin)
                $sShopDir = "admin";

            $sTemplateDir  =  "out" . "/" . $sShopDir . "/" . $this->sChannel . "/";

            return $sTemplateDir;
        }

        function StartUpDatabase()
        {   global $ADODB_FETCH_MODE;
            global $ADODB_CACHE_DIR;

            $ADODB_FETCH_MODE   = ADODB_FETCH_NUM;
            $ADODB_CACHE_DIR    = $this->sCompileDir;

            $this->oDB          = ADONewConnection( $this->dbType);
            if( $this->iDebug == 2 || $this->iDebug == 3 || $this->iDebug == 4)
                $this->oDB->debug = true;

            if( !$this->oDB->Connect( $this->dbHost, $this->dbUser, $this->dbPwd, $this->dbName ))

                die( "Error connecting to database, check settings in config.inc.php !");
            $this->oDB->cacheSecs    = 60 * 10;     // 10 minute caching
        }

        function GetLanguageArray( $iLanguage = null)
        {

            // MK
            if (!isset($oLang)) {
                $oLang = new stdClass();
            }


            $aLanguages[] = array();
            reset( $this->aLanguages);
            while(list($key, $val)=each($this->aLanguages))
            {   if( $val)
                {   $oLang->id      = $key;
                    $oLang->name    = $val;
                    if( isset( $iLanguage) && $key == $iLanguage)
                        $oLang->selected = 1;
                    else
                        $oLang->selected = 0;
                    $aLanguages[$key]   = $oLang;
                }
            }
            return $aLanguages;
        }

        function GetCurrencyArray( $iCurrency = null)
        {   $aCurrencies[] = array();
            reset( $this->aCurrencies);
            while(list($key, $val)=each($this->aCurrencies))
            {   if( $val)
                {   $oCur->id      = $key;
                    $sCur = explode( "@ ", $val);
                    $oCur->name    = $sCur[0];
                    $oCur->rate    = $sCur[1];
                    $oCur->dec     = $sCur[2];
                    $oCur->thousand= $sCur[3];
                    $oCur->sign    = $sCur[4];
                    if( isset( $iCurrency) && $key == $iCurrency)
                        $oCur->selected = 1;
                    else
                        $oCur->selected = 0;
                    $aCurrencies[$key]   = $oCur;
                }
            }
            return $aCurrencies;
        }

        function GetOXID( $soxNID, $iLanguage)
        {   $sRet = "";

            $sRet = $soxNID . "_" . $iLanguage;

            return $sRet;
        }

        function SetSerial( $sSerial)
        {   // 0123456789
            // BKVQRFNYRFQRZBYVMRAM
            $this->sSerialNr = $sSerial;
            if( strlen( $this->sSerialNr) < 10)
                $this->sSerialNr = "NOVALIDSERIALNR";
        }

        function IsMall()
        {
            return str_rot13($this->sSerialNr[0]) == 'O';
        }

        function IsNewsletter()
        {
            return str_rot13($this->sSerialNr[1]) == 'X';
        }

        function IsVarianten()
        {
            return str_rot13($this->sSerialNr[2]) == 'I';
        }

        function IsReview()
        {
            return str_rot13($this->sSerialNr[3]) == 'D';
        }

        function IsAddSales()
        {
            return str_rot13($this->sSerialNr[4]) == 'E';
        }

        function IsDemoVersion()
        {
        	return $this->sSerialNr == "XKVQRFNYRFQRZBYVMRAM";
        }
    }

    $myConfig = new oxConfig();
    $myConfig->Init();

}


?>
