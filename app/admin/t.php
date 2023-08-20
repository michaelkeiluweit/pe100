<?php
// MK
chdir(__DIR__);
require_once '../_compatible_layer_patch.php';

require_once 'login.php';


$_REQUEST['user'] = 'admin';
$_REQUEST['pwd'] = 'admin';

$l = new Login();
$l->checklogin();