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
&nbsp;&nbsp;&nbsp;[{$edit->oxuser__oxsal->value }] [{$edit->oxuser__oxfname->value }] [{$edit->oxuser__oxlname->value }]<br>
&nbsp;&nbsp;&nbsp;fon : [{$edit->oxuser__oxfon->value }]<br>
&nbsp;&nbsp;&nbsp;email : <a href="mailto:[{$edit->oxuser__oxusername->value}]">[{$edit->oxuser__oxusername->value}]</a><br>
<br>
&nbsp;&nbsp;&nbsp;Gruppen<br>
&nbsp;&nbsp;&nbsp;Umsatz letztes Jahr, letzter Monat, letzte Woche<br>
&nbsp;&nbsp;&nbsp;Zuletzt gekaufte Artikel<br>
&nbsp;&nbsp;&nbsp;Letzter Kauf<br>
&nbsp;&nbsp;&nbsp;Bonit&auml;t als Ampel<br>
&nbsp;&nbsp;&nbsp;oxid : [{ $oxid }]<br>
&nbsp;&nbsp;&nbsp;Abgebrochene Bestellungen<br>


</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=user}] 
</table>
[{include file="bottomitem.tpl"}]         
