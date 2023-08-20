[{include file="headitem.tpl" title="Impressum"}]
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

<b>[{ $oxcmp_shop->oxshops__oxcompany->value }]</b><br>
[{ $oxcmp_shop->oxshops__oxzip->value }] [{ $oxcmp_shop->oxshops__oxcity->value }]<br>
[{ $oxcmp_shop->oxshops__oxstreet->value }]<br>
[{ $oxcmp_shop->oxshops__oxcountry->value }]<br>
<br>
Fon: [{ $oxcmp_shop->oxshops__oxtelefon->value }]<br>
Fax: [{ $oxcmp_shop->oxshops__oxtelefax->value }]<br>
e-Mail: <a href="mailto:[{ $oxcmp_shop->oxshops__oxinfoemail->value }]" class="defaultcontent">[{ $oxcmp_shop->oxshops__oxinfoemail->value }]</a><br>
 <br>
Geschäftsführer: Lars Jankowfsky, Eric Jankowfsky<br>
Eingetragen beim Amtsgericht XXX, HRB XXXX<br>
 <br>
Umsatzsteueridentifikationsnummer (USt.-IdNr.) [{ $oxcmp_shop->oxshops__oxvatnumber->value }]<br>
 <br>
Bankverbindung <br>
[{ $oxcmp_shop->oxshops__oxbankname->value }]<br>
Konto : [{ $oxcmp_shop->oxshops__oxbanknumber->value }]<br>
BLZ : [{ $oxcmp_shop->oxshops__oxbankcode->value }]<br>

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
