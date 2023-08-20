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

	<table border="0" width="95%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="defaultcontent"><b>Wie wird versandt?</b></td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td class="defaultcontent">
					Die Produkte aus unserem Sortiment werden per Post
					oder Kurier, z.B UPS verschickt.<br>
					Bei gr&ouml;sseren Volumen und Mengen beauftragen wir eine Spedition.
					</td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td class="defaultcontent"><b>Die Lieferzeit?</b></td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td class="defaultcontent">
					Ihre Bestellung wird nach Eingang nat&uuml;rlich umgehend von uns bearbeitet.
					Die Auslieferung Ihrer Bestellung erfolgt zur Zeit innerhalb von
					3-7 Arbeitstagen. Durchschnittlich dauert die Lieferung 4 Arbeitstage
					ab Eingang der Bestellung.
					<br>
					Wir arbeiten aber weiterhin an einer Verbesserung der Logistik und einer
					Verk&uuml;rzung der Lieferzeit f&uuml;r Sie, um Ihnen zuk&uuml;nftig Lieferzeiten von
					48-72 Stunden bieten zu k&ouml;nnen.
					<br>
					
					</td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td class="defaultcontent"><b>Versandkosten?</b></td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td class="defaultcontent">
					Ab einem Warenwert von ... Euro liefern wir alle Artikel f&uuml;r 
					Sie versandkostenfrei.<br>
					<br>
					Wieder ein Grund mehr, f&uuml;r eine Bestellung bei [{ $oxcmp_shop->oxshops__oxname->value }] !<br>
            		<br>
                    Alle unsere Versandkosten :<br>
                    <br>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
            	    [{foreach from=$deliverylist item=deliverycost}]
            	    <tr>
            	    <td class="defaultcontent" height="15">
            	    [{ $deliverycost->oxdelivery__oxtitle->value }]
            	    </td>
            	    </tr>
                    [{/foreach}] 
                    </table>
                    <br>
                    </td>
				</tr>
				<tr>
					<td class="defaultcontent"><b>Wichtiger Hinweis</b></td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td class="defaultcontent">
					Trotz aller Sorgfalt, kann es bei der Liefung zu Sch&auml;den beim Transport kommen.
					In diesem Fall erstatten wir Ihnen nat&uuml;rlich die besch&auml;digten Artikel <b>kostenlos</b>.
					<br><br>
					Bitte beachten Sie aber folgende Vorgehensweise:<br>
					Transportsch&auml;den sind sofort bei Zugang der Ware beim Lieferanten zu reklamieren. 
					Sie informieren anschliessend <b>[{ $oxcmp_shop->oxshops__oxname->value }]</b> &uuml;ber festegestellte Transportsch&auml;den. 
					Sollten Sie Ware zur&uuml;cksenden wollen, informieren Sie uns bitte <b>vorher</b> per E-Mail, Fax oder Telefon.
					<br><br>
					Wir danken Ihnen f&uuml;r Ihr Verst&auml;ndnis und Ihre Mithilfe.
					</td>
				</tr>
		</table>
	
    
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
