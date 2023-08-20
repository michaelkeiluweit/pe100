<?php
require_once(  $myConfig->sShopDir . "/core/oxsession.php");

$a = $myConfig->sShopDir . "/core/oxsession.php";
$b = is_file($myConfig->sShopDir . "/core/oxsession.php");

global $mySession;

// provide authentification
$blIsAuth       = false;

$oUserID = $mySession->getVar( "auth");
if( $oUserID)
{   $oUser = &oxNew( "oxuser", "core");
    $oUser->Load( $oUserID);
    $mySession->setVar( "malladmin", 0);

    $sRights = $oUser->oxuser__oxrights->value;
    if( $sRights != "user")
    {   // malladmin ?
        if( $sRights == "malladmin")
        {   $mySession->setVar( "malladmin", 1);
            $sShop = $mySession->getVar( "actshop");
            if( !isset($sShop))
                $mySession->setVar( "actshop", "oxbaseshop");     // default shop
            $blIsAuth = true;
        }
        else
        {   // Shopadmin... check if this shop is valid and exists
            $oShop = &oxNew( "oxshop", "core");
            if( $oShop->Load( $sRights))
            {   // success, this shop exists
                $mySession->setVar( "actshop", $sRights);
                $blIsAuth = true;
            }
        }
    }
}

if( !$blIsAuth)
{
    header( "location:index.php");
    exit();
}
?>
