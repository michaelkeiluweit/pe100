<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>[{ $shop->oxshops__oxordersubject->value }]</title>
</head>
<body bgcolor="#FFFFFF" link="#355222" alink="#355222" vlink="#355222" style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;">
<img src="[{$shop->imagedir}]/logo_white.gif" border="0" hspace="0" vspace="0" alt="[{ $shop->oxshops__oxname->value }]" align="texttop"><br>
<br>
Vielen Dank f&uuml;r Ihre Bestellung!<br>
<br>
Nachfolgend haben wir zur Kontrolle Ihre Bestellung noch einmal aufgelistet.<br>
Bei Fragen sind wir jederzeit f&uuml;r Sie da: Schreiben Sie einfach an [{ $shop->oxshops__oxorderemail->value }] !<br>
<br>
Bestellnr. <b>[{ $order->oxorder__oxordernr->value }]</b><br>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="600">
<tr>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; background-color: #494949; color: #FFFFFF;" height="15" width="100">
	&nbsp;&nbsp;<b>Produkt</b>
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; background-color: #494949; color: #FFFFFF;" height="15">
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; background-color: #494949; color: #FFFFFF;" align="right" width="70">
	<b>Anzahl</b>
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; background-color: #494949; color: #FFFFFF;" align="right" width="70">
	<b>Einzelpreis</b>
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; background-color: #494949; color: #FFFFFF;" align="right" width="70">
	<b>Gesamt</b>&nbsp;&nbsp;
	</td>
</tr>
[{foreach from=$basket->aBasketContents item=basketitem}]  
<tr>
		<td valign="top" style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; padding-top: 10px;">
			<img src="[{$shop->dimagedir}]/[{$basketitem->oProduct->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $basketitemitem->oProduct->oxarticles__oxtitle->value }]" align="texttop">
		</td>
		<td valign="top" style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; padding-top: 10px;">
			<b>[{ $basketitem->oProduct->oxarticles__oxtitle->value }]</b>
			[{ if $basketitem->chosen_selectlist }]
			,[{foreach from=$basketitem->chosen_selectlist item=oList}]
					[{ $oList->name }] [{ $oList->value }]&nbsp;
        	 [{/foreach}]
			[{/if}]
		</td>
		<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; padding-top: 10px;" valign="top" align="right">
			[{$basketitem->dAmount}]
		</td>
		<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; padding-top: 10px;" valign="top" align="right">
			<b>[{ $basketitem->oProduct->fprice }] [{ $currency->sign}]</b>
		</td>
		<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px; padding-top: 10px;" valign="top" align="right"
			<b>[{ $basketitem->ftotalprice }] [{ $currency->sign}]</b>
		</td>
</tr>
[{/foreach}] 
<tr>
<td height="1" bgcolor="#BEBEBE"></td>
<td height="1" bgcolor="#BEBEBE"></td>
<td height="1" bgcolor="#BEBEBE"></td>
<td height="1" bgcolor="#BEBEBE"></td>
<td height="1" bgcolor="#BEBEBE"></td>
</tr>
</table>
<br>
<table border="0" cellspacing="0" cellpadding="2" width="600">
	<tr>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
	Summe Produkte :
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right" width="60">
	[{ $basket->fproductsprice }] [{ $currency->sign}]
	</td>
	</tr>
	<tr>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
	davon Mwst. :
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
	[{ $basket->fVAT }] [{ $currency->sign}]
	</td>
	</tr>
	<tr>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
	Versandkosten :
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
	[{ $basket->fdeliverycost }] [{ $currency->sign}]
	</td>
	</tr>
	[{ if $basket->dAddPaymentSum }]
   	<tr>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
		Aufschlag Zahlungsart :
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
        [{ $basket->fAddPaymentSum }] [{ $currency->sign}]
	</td>
	</tr>
	[{/if}]
	<tr>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
	<b>Gesamtsumme :</b>
	</td>
	<td style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;" valign="top" align="right">
	<b>[{ $basket->fprice }] [{ $currency->sign}]</b>
	</td>
	</tr>
</table>
<br>
Die Bezahlung erfolgt mit : <b>[{ $payment->oxpayments__oxdesc->value }]</b><br>
<br>
eMail Adresse : [{ $user->oxuser__oxusername->value }]<br>
<br>
Rechnungsanschrift:  <br>
[{ $order->oxorder__oxbillsal->value }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }]<br>
[{if $order->oxorder__oxbilladdinfo->value }][{ $order->oxorder__oxbilladdinfo->value }]<br>[{/if}]
[{ $order->oxorder__oxbillstreet->value }]<br>
[{ $order->oxorder__oxbillzip->value }] [{ $order->oxorder__oxbillcity->value }]<br>
[{ $order->oxorder__oxbillcountry->value }]<br>
Telefon: [{ $order->oxorder__oxbillfon->value }]<br>
<br>
[{ if $order->oxorder__oxdellname->value }]
Lieferanschrift:  <br>
[{ $order->oxorder__oxdelsal->value }] [{ $order->oxorder__oxdelfname->value }] [{ $order->oxorder__oxdellname->value }]<br>
[{if $order->oxorder__oxdeladdinfo->value }][{ $order->oxorder__oxdeladdinfo->value }]<br>[{/if}]
[{ $order->oxorder__oxdelstreet->value }]<br>
[{ $order->oxorder__oxdelzip->value }] [{ $order->oxorder__oxdelcity->value }]<br>
[{ $order->oxorder__oxdelcountry->value }]<br>
[{/if}]



</body>
</html>
