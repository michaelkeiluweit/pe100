[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="cl" value="imex_import">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post" target="list">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="imex_do">
<input type="hidden" name="fnc" value="doimport">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext">

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="140">
            Datei : 
            </td>
            <td class="edittext">
			<input type="text" class="editinput" size="60" maxlength="128" name="filepath" value="[{$filepath}]"><br>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br><br><br>
            <input type="submit" class="edittext" name="save" value="Import starten">
            </td>
        </tr>
        </table>
		
    </td>


    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=imex}]
</table>
[{include file="bottomitem.tpl"}]
