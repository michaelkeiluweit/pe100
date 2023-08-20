<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>

<td class="stepitem[{ if $highlight == 1}]high[{/if}]" width="25%" valign="top">
[{if $basket->iCntProducts}]<a href="[{ $shop->basketlink }]" class="stepitem[{ if $highlight == 1}]high[{/if}]">[{/if}]
<span style="font-size: 23px;"><b>1.</b></span>&nbsp;&nbsp;</font><span style="font-size: 10px;"><b>Warenkorb</b></span><br>
Bestellmenge &auml;ndern,<br>
ausgew&auml;hlte Produkte<br>
entfernen.
[{if $basket->iCntProducts}]</a>[{/if}]
</td>

<td class="stepitem[{ if $highlight == 2}]high[{/if}]" width="25%" valign="top">
[{if $basket->iCntProducts}]<a href="[{ $shop->orderlink }]" class="stepitem[{ if $highlight == 2}]high[{/if}]">[{/if}]
<span style="font-size: 23px;"><b>2.</b></span>&nbsp;&nbsp;</font><span style="font-size: 10px;"><b>Versenden</b></span><br>
Login und<br>
Adressen w&auml;hlen.<br>
</a>
</td>

<td class="stepitem[{ if $highlight == 3}]high[{/if}]" width="25%" valign="top">
[{if $highlight != 1}][{ if $oxcmp_user }]<a href="[{ $shop->paymentlink }]" class="stepitem[{ if $highlight == 3}]high[{/if}]">[{/if}][{/if}]
<span style="font-size: 23px;"><b>3.</b></span>&nbsp;&nbsp;</font><span style="font-size: 10px;"><b>Bezahlen</b></span><br>
Zahlungsart ausw&auml;hlen<br>
[{ if $oxcmp_user }]</a>[{/if}]
</td>

<td class="stepitem[{ if $highlight == 4}]high[{/if}]" width="25%" valign="top">
<span style="font-size: 23px;"><b>4.</b></span>&nbsp;&nbsp;</font><span style="font-size: 10px;"><b>Bestellen</b></span><br>
Bestellung ausf&uuml;hren<br>
</td>

</tr>
</table>
<br>
