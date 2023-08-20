<?php

//error_reporting(E_ERROR | E_WARNING);
error_reporting(E_ERROR | E_PARSE);
set_time_limit(5);

define('mysql_NUM', MYSQLI_NUM);
define('mysql_ASSOC', MYSQLI_ASSOC);
define('mysql_BOTH', MYSQLI_BOTH);

chdir(__DIR__);

/** @var mysqli $compatibleLayerMysqlConnection */
$compatibleLayerMysqlConnection = null;

function mysql_connect($host, $user, $pass)
{
    global $compatibleLayerMysqlConnection;
    global $cfgSQLDataBase;

    $compatibleLayerMysqlConnection = mysqli_connect($host, $user, $pass, $cfgSQLDataBase);

    return $compatibleLayerMysqlConnection;
}

function mysql_select_db($databaseName)
{
    global $compatibleLayerMysqlConnection;
    return mysqli_select_db($compatibleLayerMysqlConnection, $databaseName);
}

function mysql_query($query, $connection)
{
    global $compatibleLayerMysqlConnection;

    return mysqli_query($compatibleLayerMysqlConnection, $query);
}

function mysql_error()
{
    global $compatibleLayerMysqlConnection;

    return mysqli_error($compatibleLayerMysqlConnection);
}

function mysql_num_rows($result)
{
    return mysqli_num_rows($result);
}

function mysql_num_fields($result)
{
    return mysqli_num_fields($result);
}

function mysql_fetch_array($result, $mode)
{
    $mode = strtoupper($mode);

    switch ($mode) {
        case 'MYSQL_NUM':
            $mode = MYSQLI_NUM;
            break;
        case 'MYSQL_ASSOC':
            $mode = MYSQLI_ASSOC;
            break;
        case 'MYSQL_BOTH':
            $mode = MYSQLI_BOTH;
            break;
    }

    return mysqli_fetch_array($result, $mode);
}

function mysql_real_escape_string($string, $connection = null)
{
    global $compatibleLayerMysqlConnection;

    return mysqli_real_escape_string($compatibleLayerMysqlConnection, $string);
}

function mysql_free_result($result)
{
    mysqli_free_result($result);
}

function getShopBasePath()
{
    $sFilepath = $_SERVER['SCRIPT_FILENAME'];

    $sFilepath = strtolower( $sFilepath);

    $sFilepath = str_replace('admin/index.php', '', $sFilepath);
    $sFilepath = str_replace('index.php', '', $sFilepath);

    return $sFilepath;
}