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

require_once ( getShopBasePath()."/core/smarty/Smarty.class.php");

class oxData
{
    var $fldname        = "";
    var $table          = "";
    var $fldmax_length  = 0;
    var $fldtype        = "";
    var $value          = null;
}

function getSmarty()
{   global $myConfig;

    $smarty = new Smarty;

    $smarty->compile_dir    = $myConfig->sCompileDir;
    $smarty->template_dir   = $myConfig->getTemplateDir();

    if( $myConfig->blAdmin)
        $shopid = "admin";
    else
        $shopid = $myConfig->getShopId();

    $smarty->compile_id     = $shopid.".".$myConfig->getShopLanguage();
    $smarty->compile_check  = true;
    if( $myConfig->iDebug == 1 || $myConfig->iDebug == 3 || $myConfig->iDebug == 4)
        $smarty->debugging = true;

    return $smarty;
}

function GetDB()
{   global $myConfig;

    return $myConfig->oDB;
}

function &oxNew($classname, $location = null, $params = null)
{   global $myConfig;

    $classname = strtolower( $classname);

    $sClassPath = $myConfig->getClassDir( $classname, $location);

    if( !class_exists ( $classname))
    {   if( !file_exists($sClassPath))
            die("couldn't load class file $sClassPath <br>\n");
        require_once( $sClassPath);
    }

    // create an instance of the object
    $actionClassName = $myConfig->getClassFile( $classname);

    if(!class_exists( $actionClassName))
        die("couldn't find class declaration : $actionClassName<br>\n");
    // MK
    //$actionObject = &new $actionClassName( $params);
    $actionObject = new $actionClassName( $params);
    $actionObject->sClassLocation = $location;

    return $actionObject;
}

function &oxCopyNew( $oObject, $location = null, $params = null)
{   // clone this object

    $oRet = &oxNew( $oObject->sClassName, $location, $params);
    $oRet->Clone( $oObject);

    return $oRet;
}

function IsQuoteNeeded( $sFieldtype)
{   $blRet = false;
    $aTypesWoQuotes = array("int", "decimal", "float", "tinyint", "smallint", "mediumint", "bigint", "double");

    $blRet = !in_array( $sFieldtype, $aTypesWoQuotes);

    return $blRet;
}

function ReadRemoteFile( $sPath)
{   $sRet = "";

    //$fp = fsockopen( $sPath, 80, $errno, $errstr, 3);
    $fp = fopen( $sPath, "r");
    if( $fp)
    {    socket_set_timeout($fp, 2);
        while( !feof ($fp))
        {   $sLine = fgets($fp, 4096);
            $sRet .= $sLine;
        }
        fclose( $fp);
    }

    return $sRet;
}

$aTblDescCache = array();

function GetTableDescription( $sTableName)
{   global $myConfig;
    global $aTblDescCache;

    // simple cache
    if( isset( $aTblDescCache[$sTableName]))
        return $aTblDescCache[$sTableName];

    $aRet = array();

    $aFields = $myConfig->oDB->MetaColumns( $sTableName);
    if( isset( $aFields) && $aFields)
    {	while (list($key, $val) = each($aFields))
	    {   $newKey = strtolower( $sTableName . "__" . $key);
	        // assign Data
	        $oData = new oxData();
	        $oData->fldname         = strtolower( $key);
	        $oData->table           = $sTableName;
	        if( $val->max_length == -1)
	            $val->max_length = 10;      // double or float
	        if( $val->type == "datetime")
	            $val->max_length = 20;
	        $oData->fldmax_length   = $val->max_length;
	        $oData->fldtype         = $val->type;
	        $aRet[$newKey] = $oData;
	    }
    }
    
    $aTblDescCache[$sTableName] = $aRet;

    return $aRet;
}

function GetArrFldName( $sName)
{
    return str_replace( ".", "__", $sName);
}

/**
 * generates unique ID
 */
function generateUID()
{   global $mySession;

    $suID = substr( $mySession->id, 0, 3) . uniqid( "", true);

    return $suID;
}

/** Takes a string and assign all values
 *  @param $sIn , type: string
 *  @returns array with values
 */
function AssignValuesFromText( $sIn)
{   $aRet = array();

    $aPieces = explode("@@", $sIn);
    while(list($key, $val)=each($aPieces))
    {   if( $val)
        {   $aName = explode("__", $val);
            if( isset($aName[0]) && isset($aName[1]))
            {   $oObject->name  = $aName[0];
                $oObject->value = $aName[1];
                $aRet[] = $oObject;
            }
        }
    }

    return $aRet;
}

/** Takes a array and builds again a string
 *  @param $aIn , type: array
 *  @returns string with values
 */
function AssignValuesToText( $aIn)
{   $sRet = "";

    while(list($key, $val)=each($aIn))
    {   $sRet .= $key;
        $sRet .= "__";
        $sRet .= $val;
        $sRet .= "@@";
    }

    return $sRet;
}


/** Copies directory tree for creating a new shop
 *  @param $Source, $sTarger , type: string
 *
 */
function CopyDir( $sSourceDir, $sTargetDir)
{
    $handle = opendir( $sSourceDir);
    while( false !== ( $file = readdir( $handle ) ) )
    {   if( $file != '.' && $file != '..')
        {   if( is_dir( $sSourceDir . '/' . $file ))
            {   // recursive
                $sNewSourceDir = $sSourceDir . '/' . $file;
                $sNewTargetDir = $sTargetDir . "/" . $file;
                if( !strstr( $sNewTargetDir, "dyn_images"))
                {   @mkdir( $sNewTargetDir, 0777);
                    CopyDir( $sNewSourceDir, $sNewTargetDir);
                }
            }
            else
            {   $sSourceFile = $sSourceDir . '/' . $file;
                $sTargetFile = $sTargetDir . '/' . $file;
                @copy( $sSourceFile, $sTargetFile);
            }
        }
    }
}

/** Deletes directory tree
 *  @param $Source, type: string
 *
 */
function DeleteDir( $sSourceDir)
{
    $handle = opendir( $sSourceDir);
    while( false !== ( $file = readdir( $handle ) ) )
    {   if( $file != '.' && $file != '..')
        {   if( is_dir( $sSourceDir . '/' . $file ))
            {   // recursive
                $sNewSourceDir = $sSourceDir . '/' . $file;
                DeleteDir( $sNewSourceDir);
                @rmdir( $sNewSourceDir);
            }
            else
            {   $sSourceFile = $sSourceDir . '/' . $file;
                @unlink( $sSourceFile);
            }
        }
    }
}

function resizeImage( $sSrc, $sTarget, $desiredw, $desiredh)
{   global $myConfig;

    // use this GD Version
    $gdver = $myConfig->iUseGDVersion;
    if( !isset( $gdver) || !$gdver)
        return false;
    
	$size = @getimagesize( $sSrc);

	if (!$size)
	   return false;
	else
	{
        if ($size[0]>=$size[1]*((float)($desiredw/$desiredh)))
        {
            $newy = round(($size[1] * (float)($desiredw/$size[0])),0);
            $newx = $desiredw;
        }
        else
        {
            $newy = $desiredh;
            $newx = round(($size[0] * (float)($desiredh/$size[1])),0);
        }

        if( $gdver==1)
            $destimg = imagecreate($newx, $newy );
        else
            $destimg = imagecreatetruecolor($newx, $newy );
            
        if ($size[2]==1)
        {   // GIF
            $sourceimg = @imagecreatefromgif( $sSrc);

            if( $gdver==1)
                imagecopyresized($destimg, $sourceimg, 0,0,0,0, $newx, $newy, $size[0], $size[1]);
            else
                imagecopyresampled($destimg, $sourceimg, 0,0,0,0, $newx, $newy, $size[0], $size[1]);

            // save
            imagegif( $destimg, $sTarget,100);
        	imagedestroy($destimg);
        	imagedestroy($sourceimg);

            return true;
        }
        elseif ($size[2]==2)
        {   // JPG
            $sourceimg = imagecreatefromjpeg( $sSrc);

            if( $gdver==1)
                imagecopyresized($destimg, $sourceimg, 0,0,0,0, $newx, $newy, $size[0], $size[1]);
            else
                imagecopyresampled($destimg, $sourceimg, 0,0,0,0, $newx, $newy, $size[0], $size[1]);

            imagejpeg( $destimg, $sTarget,100);
        	imagedestroy($destimg);
        	imagedestroy($sourceimg);

            return true;
        }
        elseif ($size[2]==3)
        {   // PNG
            $sourceimg = imagecreatefrompng( $sSrc);

            if( $gdver==1)
                imagecopyresized($destimg, $sourceimg, 0,0,0,0, $newx, $newy, $size[0], $size[1]);
            else
                imagecopyresampled($destimg, $sourceimg, 0,0,0,0, $newx, $newy, $size[0], $size[1]);

            imagepng( $destimg, $sTarget,100);
        	imagedestroy($destimg);
        	imagedestroy($sourceimg);

            return true;
        }
	}

}

function my_array_search( $needle, $haystack, $blYesNo = false)
{   // we do not use array_search as it somehow brings wrong results
    $iRet     = null;
    $blRet    = false;

    reset( $haystack);
    while (list($key, $value) = each($haystack))
    {   if( !strcmp( $value, $needle))
        {   $iRet = $key;
            $blRet= true;
            break;
        }
    }
    
    if( $blYesNo)
        return $blRet;
    else
        return $iRet;
}

function FormatDBDate( $sDBDateIn)
{	// convert english format to output format
    global $myConfig;
    
    if( !isset( $sDBDateIn) || !$sDBDateIn)
        return null;
        
    if( !strstr( $sDBDateIn, "-"))
    {   // db timestamp : 20030322100409
	  	$sNew 	   	 	= substr( $sDBDateIn, 0, 4) . "-" . substr( $sDBDateIn, 4, 2) . "-" . substr( $sDBDateIn, 6, 2);
	  	$sNew      	   .= " " . substr( $sDBDateIn, 8, 2) . ":" . substr( $sDBDateIn, 10, 2) . ":" . substr( $sDBDateIn, 12, 2);
	  	$sDBDateConv  	= $sNew;
    }
    else
    	$sDBDateConv	= $sDBDateIn;
    
    $time = @strtotime( $sDBDateConv);
    if( $time == -1)
    	return $sDBDateIn;
    
	$sFormat 	= $myConfig->sDateFormat;
	if( date( "H:i:s", $time) != "00:00:00")
		$sFormat .= " H:i:s";
		
    $sRet = date( $sFormat, $time);

	return $sRet;
}

function FormatCurrency( $dValue, $oActCur)
{   global $myConfig;

    $sFormated = number_format( $dValue, 2, $oActCur->dec, $oActCur->thousand);

    return $sFormated;
}

function RemoveURLPara( $sURL, $sSearchPara)
{
    $iPos = strpos( $sURL, $sSearchPara);
    if( $iPos !== false)
    {   $sURLPara  = substr( $sURL, 0, max( 0, $iPos - 1));
        $iParaLen  = strpos( $sURL, "&", strlen( $sURLPara)+1);
        if( $iParaLen)
            $sURLPara .= substr( $sURL, $iParaLen);
        $sURL = $sURLPara;
    }
    
    return $sURL;
}

function GetActivSnippet( $sTable)
{
    $now = time();
    $Searchdate = date("Y-m-d H:i:s", $now);
    $sSelect = "( $sTable.oxactiv = 1 or ( $sTable.oxactivfrom < '$Searchdate' and $sTable.oxactivto > '$Searchdate')) ";
    
    return $sSelect;
}

?>
