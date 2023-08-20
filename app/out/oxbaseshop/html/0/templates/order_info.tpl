[{include file="headitem.tpl" title="Wie Bestellen ?"}]
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr>
<td valign="top">

    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
	<td width="15"></td>
    <td class="defaultcontent" style="padding-right: 10px;">

	[{ $oxcmp_shop->oxshops__oxname->value }], Ihr Online-Shop f&uuml;r ... <br>
	<br>
	Bei uns haben Sie die Wahl aus mehr als	... Artikeln <br>
    von bester Qualität und namhaften Herstellern.<br>
	Schauen Sie sich um, stöbern Sie in unseren Angeboten!<br>
	<br>
	[{ $oxcmp_shop->oxshops__oxname->value }] steht Ihnen im Internet <br>
    rund um die Uhr und	7 Tage die Woche offen.<br>
	<br> 
	Und wenn Sie ein Bestellung aufgeben möchten, können Sie das:
	<br><br>
	<ul>
		<li>direkt im Internet über unseren Shop
		<br><br>
		<li>per Fax unter <b>...</b>
		<br><br>
		<li>per Telefon unter <b>....</b>
		<br><br>
		<li>oder per Email unter <a href="mailto:[{ $oxcmp_shop->oxshops__oxorderemail->value }]?subject=Bestellung" class="defaultcontent"><b>[{ $oxcmp_shop->oxshops__oxorderemail->value }]</b></a>		
	</ul>
	Telefonisch sind wir für Sie <br>
	Montag - Freitag von 10-18 Uhr erreichbar.<br>
	<br>
	Wenn Sie auf der Suche nach einem Artikel sind, <br>
    der zum Sortiment von [{ $oxcmp_shop->oxshops__oxname->value }]	passen könnte, <br>
    Ihn aber nirgends finden, lassen Sie`s uns wissen.<br>
	Gern bemühen wir uns um eine L&ouml;sung für Sie. <br>
    <br>
    Schreiben Sie an <a href="mailto:[{ $oxcmp_shop->oxshops__oxinfoemail->value }]?subject=Produktidee" class="defaultcontent">[{ $oxcmp_shop->oxshops__oxinfoemail->value }]</a>.
    
    </td>
    [{include file="aktionitem.tpl"}]
    </tr>
    </table>

</td>
</tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
