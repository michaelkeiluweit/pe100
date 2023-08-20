[{include file="headitem.tpl" title="Bestellung abgeschlossen"}]


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr>
<td valign="top">
    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
    <td class="defaultcontent" width="10"></td>
    <td class="defaultcontent">
Vielen Dank für Ihre Bestellung im [{ $oxcmp_shop->oxshops__oxname->value }]. <br>
<br>
Ihre Bestellung ist unter der Nummer [{ $order->oxorder__oxordernr->value }] bei uns registriert.<br>
Sie haben bereits eine Bestellbest&auml;tigung &uuml;ber die gewünschten Artikel per Mail erhalten.<br>
<br>
Sollte etwas nicht lieferbar sein, werden wir Sie sofort informieren.<br>
    </td>
    [{include file="ordersnippet.tpl"}]
    </tr>
    </table>
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
