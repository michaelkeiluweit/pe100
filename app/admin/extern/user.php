<html>
<head>
	<title>oxid Benutzerliste</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<?php

$sThisFile = "user.php";

if( isset($_GET['sort']) )
	$sSortBy = $_GET['sort'];

function connectDB()
{
	require ("../../config.inc.php");
   
	$oConn 		= mysqli_connect($this->dbHost, $this->dbUser, $this->dbPwd);
	$blSuccess 	= @mysql_select_db($this->dbName, $oConn);
	
	// �berpr�fe, ob Connection stattgefunden hat ** if connection failed
	if(!$oConn)
		die( "Connection to SQL-Server $cfgSQLDataSource failed");
	if(!$blSuccess)
		die( "Connection to database $cfgSQLDataBase failed");

	return $oConn;
}

$oConn = connectDB();

$sSQL = "select * from oxuser";
if( isset( $sSortBy))
	$sSQL .= " order by  $sSortBy";

$result = mysqli_query( $sSQL, $oConn);
?>

<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
    <td class="listheader" height="15">&nbsp;</td>
    <td class="listheader"><a href="<?php echo( $sThisFile); ?>?sort=OXLNAME" class="listheader">Anrede/Vorname/Nachname</a></td>
    <td class="listheader"><a href="<?php echo( $sThisFile); ?>?sort=OXUSERNAME" class="listheader">eMail(login)</a></td>
    <td class="listheader"><a href="<?php echo( $sThisFile); ?>?sort=OXCREATE" class="listheader">Angelegt am</a></td>
</tr>

<?php
$sWhite = "";
while( $saRow = mysqli_fetch_array($result))
{	$sClass = "listitem".$sWhite;
?>
<tr>
	<td valign="top" class="<?php echo($sClass); ?>"></td>
	<td valign="top" class="<?php echo($sClass); ?>" height="15"><?php echo( $saRow['OXSAL']); ?> <?php echo( $saRow['OXFNAME']); ?> <?php echo( $saRow['OXLNAME']); ?></td>
    <td valign="top" class="<?php echo($sClass); ?>"><?php echo( $saRow['OXUSERNAME']); ?></td>
    <td valign="top" class="<?php echo($sClass); ?>"><?php echo( $saRow['OXCREATE']); ?></td>
</tr>
<?php
	if( $sWhite == "")
		$sWhite = "2";
	else
		$sWhite = "";
}
?>

</table>

</body>
</html>
