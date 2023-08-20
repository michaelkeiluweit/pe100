[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_overview">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%">

&nbsp;&nbsp;&nbsp;&Uuml;bersicht<br>
<br>
&nbsp;&nbsp;&nbsp;[{$edit->oxpayments__oxdesc->value }] <br>
<br>
&nbsp;&nbsp;&nbsp;Wieviel Einküfe wurden mit dieser Bezahlmethode gemacht<br>
&nbsp;&nbsp;&nbsp;Umsatz letztes Jahr, letzter Monat, letzte Woche<br>

</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=payment}]
</table>
[{include file="bottomitem.tpl"}]
