<html>
<head>
	<title>oxid e-sales Login</title>
    <link rel="stylesheet" href="[{$shop->basetpldir}]style.css">
	[{include file="tooltips.tpl"}] 
</head>

<body onLoad="Javascript:document.login.user.focus();">

<table cellspacing="0" cellpadding="0" border="0" width="100%" height="100%">
<tr>
    <td align="center" valign="middle" bgcolor="#E6E6E6">

			<table cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td></td>
			<td align="right">
			<img src="[{$shop->imagedir}]/loginlogo.gif" alt="" border="0">
			</td>
			
			</tr>
	        [{ if $loginerror}]
				<tr>
					<td></td>
				    <td class="loginerror">
					Fehler ! Falscher Benutzername und/oder Passwort !
					</td>
				</tr>
	        [{ /if}]
        <form action="[{ $shop->selflink }]" method="post" name="login" id="login">
        [{ $shop->hiddensid }]
        <input type="hidden" name="fnc" value="checklogin">
			<tr>
			    <td class="login" width="70">
                    Benutzer 
				</td>
				<td>
				<input type="text"  class="loginedit" name="user" value="[{ $user }]" size="49" style="width:300px;">
				</td>
			</tr>
			<tr>
			    <td class="login">
                    Passwort 
				</td>
				<td>
				<input class="loginedit" type="password" name="pwd" value="[{ $pwd }]" size="49" style="width:300px;">
				</td>
			</tr>
			<tr>
			    <td>
				</td>
				<td height="40" valign="middle">
				<input class="loginbutton" type="submit" value="oxid eSales Admin starten" style="width:300px;">
				</td>
			</tr>
			</form>
			</table>
    </td>
</tr>
</table>

[{include file="bottomitem.tpl" }]