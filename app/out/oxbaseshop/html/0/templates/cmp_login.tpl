[{ if !$oxcmp_user }]
	<table border="0" cellspacing="0" cellpadding="0" width="165">
	<form action="index.php" method="post">
	[{ $shop->hiddensid }]
	<input type="hidden" name="fnc" value="login_noredirect">
	<input type="hidden" name="cl" value="[{$shop->cl}]">
	<input type="hidden" name="cnid" value="[{$shop->cnid}]">
	[{ if $product }]
	<input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
	[{/if}]
	<tr>
	<td class="login">
	eMail :
	</td>
	<td class="login" width="100">
	<input type="text" name="lgn_usr" value="" size="17" class="login">
	</td>
	</tr>    
	<tr>
	<td class="login">
	Passwort :
	</td>
	<td class="login">
	<input type="password" name="lgn_pwd" value="" size="17" class="login">
	</td>
	</tr>    
	<tr>
	<td class="login">
	</td>
	<td class="login">
	<input type="image" src="[{$shop->imagedir}]/login_button.gif" align="top" hspace="0" vspace="0" border="0">
	</td>
	</tr>    
	</table>
	<br>
	<div class="login" align="left">
	Ich möchte eingeloggt bleiben, bis ich mich abmelde. 
	<input type="checkbox" name="lgn_cook" value="1" checked>
	</div>
	</form>
[{else}]
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td class="login">
	Sie sind nicht [{ $oxcmp_user->oxuser__oxfname->value }] [{ $oxcmp_user->oxuser__oxlname->value }] ?
	</td>
	</tr>    
	<tr>
	<td class="login">
	<a href="[{$shop->logoutlink}]" class="login"><img src="[{$shop->imagedir}]/subcat_more.gif" width="9" height="9" alt="" border="0"><b>abmelden</b></a>
	</td>
	</tr>    
	</table>
[{ /if }]

