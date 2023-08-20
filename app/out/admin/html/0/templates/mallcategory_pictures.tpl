[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="mallcategory_pictures">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext">
    [{$edit->oxcategories__oxtitle->value }] Thumbnail :<br><br>
    [{if $edit->oxcategories__oxthumb->value }]
    <img src="[{$shop->dimagedir}]/[{$edit->oxcategories__oxthumb->value }]" border="0" hspace="0" vspace="0">
    [{/if}]
    </td>
</tr>
</table>

</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=mallcategory}]
</table>
[{include file="bottomitem.tpl"}]
