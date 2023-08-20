[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="category_overview">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%">

&nbsp;&nbsp;&nbsp;&Uuml;bersicht<br>
<br>
&nbsp;&nbsp;&nbsp;[{$edit->oxcategories__oxtitle->value }] <br>
<br>
&nbsp;&nbsp;&nbsp;Keine Ahung was wir hier an Informationen geben sollten<br>

</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=category}]
</table>
[{include file="bottomitem.tpl"}]
