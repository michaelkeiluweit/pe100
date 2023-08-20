<?php

require_once '../_compatible_layer_patch.php';

error_reporting  (E_ERROR | E_WARNING | E_PARSE);

function SplitSqlFile(&$ret, $sql)
{
    $sql          = trim($sql);
    $sql_len      = strlen($sql);
    $char         = '';
    $string_start = '';
    $in_string    = FALSE;
    $time0        = time();

    for ($i = 0; $i < $sql_len; ++$i) {
        $char = $sql[$i];
        if ($in_string) {
            for (;;) {
                $i         = strpos($sql, $string_start, $i);
                 if (!$i) {
                    $ret[] = $sql;
                    return TRUE;
                }
                else if ($string_start == '`' || $sql[$i-1] != '\\') {
                    $string_start      = '';
                    $in_string         = FALSE;
                    break;
                }
                else {
                    $j                     = 2;
                    $escaped_backslash     = FALSE;
                    while ($i-$j > 0 && $sql[$i-$j] == '\\') {
                        $escaped_backslash = !$escaped_backslash;
                        $j++;
                    }
                     if ($escaped_backslash) {
                        $string_start  = '';
                        $in_string     = FALSE;
                        break;
                    }
                    else {
                        $i++;
                    }
                }
            }
        }
        else if ($char == ';') {
            $ret[]      = substr($sql, 0, $i);
            $sql        = ltrim(substr($sql, min($i + 1, $sql_len)));
            $sql_len    = strlen($sql);
            if ($sql_len) {
                $i      = -1;
            } else {
                return TRUE;
            }
        }
        else if (($char == '"') || ($char == '\'') || ($char == '`')) {
            $in_string    = TRUE;
            $string_start = $char;
        }
        else if ($char == '#'
                 || ($char == ' ' && $i > 1 && $sql[$i-2] . $sql[$i-1] == '--')) {
            $start_of_comment = (($sql[$i] == '#') ? $i : $i-2);
            $end_of_comment   = (strpos(' ' . $sql, "\012", $i+2))
                              ? strpos(' ' . $sql, "\012", $i+2)
                              : strpos(' ' . $sql, "\015", $i+2);
            if (!$end_of_comment) {
                if ($start_of_comment > 0) {
                    $ret[]    = trim(substr($sql, 0, $start_of_comment));
                }
                return TRUE;
            } else {
                $sql          = substr($sql, 0, $start_of_comment)
                              . ltrim(substr($sql, $end_of_comment));
                $sql_len      = strlen($sql);
                $i--;
            }
        }
        else if (($char == '!' && $i > 1  && $sql[$i-2] . $sql[$i-1] == '/*')) {
            $sql[$i] = ' ';
        }
        $time1     = time();
        if ($time1 >= $time0 + 30) {
            $time0 = $time1;
            header('X-pmaPing: Pong');
        }
    }
    if (!empty($sql) && ereg('[^[:space:]]+', $sql)) {
        $ret[] = $sql;
    }

    return TRUE;
}
if(phpversion() >= "4.2.0")
{
	if (!empty($_POST)) extract($_POST);
   elseif (!empty($HTTP_POST_VARS)) extract($HTTP_POST_VARS);

	if (!empty($_GET)) extract($_GET);
   elseif (!empty($HTTP_GET_VARS)) extract($HTTP_GET_VARS);

	if (!empty($_COOKIE)) extract($_COOKIE);
   elseif (!empty($HTTP_COOKIE_VARS)) extract($HTTP_COOKIE_VARS);
}

$modul = "CaupoShop Classik - Statistik";

if( !isset( $iStep)) $iStep = 0;
if( $iEula == "N")   $iStep = 0;

$cfgModulStep[0]['text']   = "Herzlich willkommen bei dem Setup Assistenten f&uuml;r oxid eSales Shop

Um eine erfolgreiche und einfache Installation zu gew&auml;hrleisten,
nehmen Sie sich bitte die Zeit, die folgenden Punkte aufmerksam zu lesen und Schritt f&uuml;r Schritt auszuf&uuml;hren.
Viel Erfolg mit Ihrem oxid eSales Shop w&uuml;nscht Ihnen

NFQ eSales GmbH
Am Kraftwerk 4
79183 Waldkirch
Deutschland";
$cfgModulStep[0]['rows']   = "12";
$cfgModulStep[0]['cols']   = "70";


$cfgModulStep[1]['text']   = "Datenbankanpassung wird nun erstellt.
Bitte geben Sie hier den Hostnamen oder IP-Adresse, User, Passwort und den Datenbanknamen ein.";
$cfgModulStep[1]['rows']   = "4";
$cfgModulStep[1]['cols']   = "70";

$cfgModulStep[2]['text']   = "";
$cfgModulStep[2]['rows']   = "4";
$cfgModulStep[2]['cols']   = "70";

if ($iStep == 2) {

	$connectionID = mysql_connect( $cfgSQLDataSource, $cfgSQLUsername, $cfgSQLPasswd);
    $bCheck = @mysql_select_db( $cfgSQLDataBase, $connectionID);

	$filename = "install.sql";

	$fp = @fopen( $filename, "r");
	if( $fp)
	{	$sql_query = fread ($fp, filesize ($filename));
		fclose ($fp);

		$aSQL[] = null;
		SplitSqlFile($aSQL, $sql_query);

		for( $i=0; $i<count( $aSQL); $i++)
		{	if( strlen( $aSQL[$i]))
			{	$res = mysql_query( $aSQL[$i], $connectionID);
				if( !$res)
			    {	$cfgModulStep[$iStep]['text'] .= "Fehler : Konnte [".$aSQL[$i]."] nicht ausf&uuml;hren !";
    		   	 	$iStep = 2;
	    		}
			}
		}
    $cfgModulStep[$iStep]['text'] .= "Datenbank - Aenderungen wurden erstellt
Bitte dr&uuml;cken Sie auf weiter um zum n&auml;chsten Schritt zu gelangen.";
	}
	else
    {	$cfgModulStep[$iStep]['text'] .= "Kann $filename nicht auslesen !
Bitte &uuml;berpr&uuml;fen Sie ob diese Datei im Setup Ordner vorhanden ist.";
        $iStep = 2;
    }
}

$cfgModulStep[3]['text']   = '
Weitere Informationen zur Handhabung des Shops erhalten Sie in der beiligenden Dokumentation.
Diese finden Sie im Shop Verzeichniss unter "documentation".

Als letzten Schritt muessen Sie die Datei "config.inc.php" mit Ihren Datenbankzugang
im Stamm Verzeichniss des Shop.

Hier erg�nzen Sie bitte folgende Bereiche jeweils zwischen den beiden Ausrufungszeichen.

    $this->dbHost         = "localhost"
    $this->dbName         = "Ihr Datenbank Name"
    $this->dbUser         = "Ihr Benutzer Name"
    $this->dbPwd          = "Ihr Passwort"
    $this->dbType         = "mysql"

    $this->sShopURL       = "http://ihr-domain-pfad-zum-shop"
    $this->sSSLShopURL    = "https://ihr-domain-ssl-pfad-zum-shop"
    $this->sShopDir       = "'.$DOCUMENT_ROOT.'"
    $this->sCompileDir    = "'.$DOCUMENT_ROOT.'/tmp"
    
    Desweiteren m�ssen Sie noch evtl. die Verzeichnisse :

    "out/oxbaseshop/html/0/dyn_images"
    "import"
    "tmp"
    
    per chmod f�r den Webserver schreibbar machen. ( 777 )

    Sollten Sie alles richtig eingetragen haben, ist ihr Shop nun
    fertig installiert.

    ';
$cfgModulStep[3]['rows']   = "10";
$cfgModulStep[3]['cols']   = "70";
?>
<html>

	<head>
		<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
		<meta name="ProgId" content="FrontPage.Editor.Document">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<title>Setup</title>
		<style>
         <!--
        .text {font-family: Arial; font-size: 12px;}
        -->
        </style>
	</head>
	<body>
		<div align="left">
                    <br><br><br>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="middle" valign="center" width="100%" height="100%">
						<div align="center">
							<center>
								<table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#D6D3CE" background="img/leer.gif">
									<tr>
										<td colspan="5" width="600" bgcolor="#C0C0C0"><img src="img/leer.gif" height="2" width="600" border="0"></td>
									</tr>
									<tr>
										<td rowspan="5" bgcolor="#C0C0C0" align="left" valign="top" width="2"><img src="img/leer.gif" height="396" width="2" border="0"></td>
										<td align="left" class=text" valign="top" width="157" bgcolor="#424942" background="img/leer.gif"><img src="img/leer.jpg" height="1" border="0"><br>
											<br>
											<br><center><font size="4" class="text" color="#FFFFFF"><b>Schritt <?php echo $iStep ?></b></font></center><br></td>
										<td align="left" valign="top" bgcolor="#424942" width="152" background="img/leer.gif">&nbsp;</td>
										<td align="left" valign="top" bgcolor="#424942" width="287" height="60"><img src="img/logo.gif" height="53" width="191" align="right" border="0"></td>
										<td rowspan="5" align="right" valign="top" width="2" bgcolor="#424942"><img src="img/leer.gif" height="396" width="2" border="0"></td>
									</tr>
									<tr>
										<td colspan="3" align="middle" valign="top" width="596" height="2"><img src="img/leer_line.jpg" height="2" width="589" border="0"></td>
									</tr>
									<tr>
										<td colspan="3" align="left" valign="top" width="596" height="280">
											<div align="left">
												<table width="100%" border="0" cellspacing="5" cellpadding="0" height="100%">
													<tr>
														<td align="left" valign="top" width="100%">
 											               <form action="<?php echo $PHP_SELF ?>" method="post">
																<table width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td class="text" width="100%">
                                                                         <?php  if (strlen($cfgModulStep[$iStep]['text'] != "0")) {?>
                                                                        <textarea rows="<?php echo $cfgModulStep[$iStep]['rows'] ?>" cols="<?php echo $cfgModulStep[$iStep]['cols'] ?>" readonly><?php echo $cfgModulStep[$iStep]['text'] ?></textarea><?} ?>
                                                                        <br>
                                                                        <?php  if ($iStep == 0) { ?>
<br><table border="0">
  <tr>
    <td class="text" vAlign="top" align="left">
    <input type="radio" name="iEula" value="Y"> Ich akzeptiere die <a href="lizenz.txt" target="new">Lizenzbestimmungen</a>.<br>
    <input type="radio" name="iEula" value="N" checked> Ich akzeptiere die <a href="lizenz.txt" target="new">Lizenzbestimmungen</a>. nicht.</td>
  </tr>
</table>

                                                                        <?}
                                                                        if ($iStep == 1) {
                                                                        if(file_exists("inc/cfg_sql.inc.php"))   include ("inc/cfg_sql.inc.php");
                                                                        if(file_exists("../inc/cfg_sql.inc.php"))   include ("../inc/cfg_sql.inc.php");
                                                                        if(file_exists("../../inc/cfg_sql.inc.php"))   include ("../../inc/cfg_sql.inc.php");?>
<table border="0">
  <tr>
    <td class="text" vAlign="top" align="left">Hostname oder IP Adresse </td>
    <td vAlign="top" align="left"><input size="40" name="cfgSQLDataSource" value="<?php if( !$cfgSQLDataSource) $cfgSQLDataSource = "localhost"; echo $cfgSQLDataSource ?>"> </td>
  </tr>
  <tr>
    <td class="text" vAlign="top" align="left">Username </td>
    <td vAlign="top" align="left"><input size="40" name="cfgSQLUsername" value="<?php echo $cfgSQLUsername ?>"> </td>
  </tr>
  <tr>
    <td class="text" vAlign="top" align="left">Passwort </td>
    <td vAlign="top" align="left">
    <input type="password" size="40" name="cfgSQLPasswd" value="<?php echo $cfgSQLPasswd ?>"> </td>
  </tr>
  <tr>
    <td class="text" vAlign="top" align="left">Datenbank</td>
    <td vAlign="top" align="left"><input size="40" name="cfgSQLDataBase" value="<?php echo $cfgSQLDataBase ?>"> </td>
  </tr>
  <tr>
    <td class="text" vAlign="top" align="left" colSpan="2"><br><b>Hinweis:</b> Bis
    die n&auml;chste Seite aufgerufen wird, kann es einige Zeit dauern, da in diesem
    Schritt die Tabellen erstellt und die notwendigen Inhalte geschrieben
    werden. Bitte nicht mehrmals auf 'weiter' dr�cken und die Seite nicht neu
    laden ! </td>
  </tr>
</table>
<?}
if ($iStep == 3 && $error != 1) {?>
<table border="0"  width="100%">
  <tr>
    <td class="text" vAlign="top" align="left">&nbsp;</td>
    <td vAlign="top" align="left">&nbsp;</td>
  </tr>
  <tr>
    <td class="" align="center"><center><b>Viel Erfolg mit Ihrem neuem Shopsystem</b></center>
</td>
  </tr>
</table>
<?} ?>


                                                                        </td>
																	</tr>
																</table>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3" align="middle" valign="top" width="596"><img src="img/leer_line.jpg" height="2" width="589" border="0"></td>
									</tr>
									<tr>
										<td colspan="3" align="left" valign="top" width="596" height="32">
											<div align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
													<tr>
														<td width="50%">&nbsp;</td>
														<td align="right" valign="center" width="50%">
                                                        <input type="hidden" name="iStep" value="<?php echo $iStep+1 ?>">
                                                         <? if ($iStep != "" && $iEula != "N" && $iStep != 3) {?>
														<input onclick="javascript:history.go(-1)" type="button" value="&lt; zur&uuml;ck">
                                                        <?  }
                                                        if ($iStep != 3 && $error != 1) {?>
														<input type="submit" value="weiter &gt;"><?} ?>&nbsp;&nbsp;&nbsp;</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="5" bgcolor="#424142" width="600"><img src="img/leer.gif" height="2" width="600" border="0"></td>
									</tr>
								</table>
							</form>
							</center>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>

</html>
