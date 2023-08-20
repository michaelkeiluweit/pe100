[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}] 

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_extend">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="user_extend">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxuser__oxid]" value="[{ $oxid }]">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext">
    
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="120">
            Telefon Privat
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxuser__oxprivfon->fldmax_length}]" name="editval[oxuser__oxprivfon]" value="[{$edit->oxuser__oxprivfon->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Telefon Mobil
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxuser__oxmobfon->fldmax_length}]" name="editval[oxuser__oxmobfon]" value="[{$edit->oxuser__oxmobfon->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Newsletter ?
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" name="editval[oxuser__oxdboptin]" value='1' [{if $edit->oxuser__oxdboptin->value == 1}]checked[{/if}]>
            </td>
        </tr>

        
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
    		<input type="submit" class="edittext" name="save" value="Speichern" onClick="Javascript:document.myedit.fnc.value='save'"">
            </td>
        </tr>
        </table>
    </td>

    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left" width="50%">
    </td>

    </tr>
</table>


</td>
</tr>
</form>

[{include file="bottomnaviitem.tpl" navigation=user}] 
</table>
[{include file="bottomitem.tpl"}]         
