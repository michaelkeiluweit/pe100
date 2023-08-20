[{include file="headitem.tpl" title=""}]


<script type="text/javascript">
<!--
function chkAGB()
{
	if( document.forms.order.agb.checked == false)
		alert("Bitte bestätigen Sie unsere Geschäftsbedingungen\n und drücken dann nocheinmal auf 'Bestellung jetzt abschicken'.");
	else
		document.forms.order.submit();
}
//-->
</script>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr>
<td valign="top">
    <table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
    <td class="defaultcontent" width="17"></td>
    <td class="defaultcontent">
	[{include file="steps_item.tpl" highlight=4}]

        <span class="userlogincontent">Ihre Bestellung :</span><br>
        <br>
        <table border="0" cellspacing="0" cellpadding="2" width="100%">
    	<tr>
        <td class="basketlisthead" valign="top" height="17">
        &nbsp;&nbsp;Produkt
        </td>
        <td class="basketlisthead" valign="top"></td>
        <td class="basketlisthead" valign="top">
        Anzahl
        </td>
        <td class="basketlisthead" valign="top">
		Typ
		</td>
        <td class="basketlisthead" valign="top">
        Einzelpreis
        </td>
        <td class="basketlisthead" valign="top">
        Gesamt
        </td>
        </tr>
    	[{foreach from=$basket->aBasketContents item=basketitem}]  
    	<tr>
        
        <td class="basketlist" valign="top" style="padding-top : 10px; padding-left : 10px; border : 1px #494949; border-style : none none solid solid;">
        <img src="[{$shop->dimagedir}]/[{$basketitem->oProduct->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $basketitemitem->oProduct->oxarticles__oxtitle->value }]">
        <td class="basketlist" valign="top" style="padding-top : 10px; border : 1px #494949; border-style : none none solid none;">
        <br>
        <b>[{ $basketitem->oProduct->oxarticles__oxtitle->value }]</b><br>
        <br>
        [{ $basketitem->oProduct->oxarticles__oxshortdesc->value }]
        </td>
        <td class="basketlist" valign="top" align="right" style="padding-top : 10px; border : 1px #494949; border-style : none none solid none;">
        [{$basketitem->dAmount}]
        </td>
        <td class="basketlist" valign="top" style="padding-top : 10px; border : 1px #494949; border-style : none none solid none;">&nbsp;
        [{foreach from=$basketitem->chosen_selectlist item=oList}]
		[{ $oList->name }] : [{ $oList->value }]
        [{/foreach}]
		</td>
        <td class="basketlist" valign="top" align="right" style="padding-top : 10px; border : 1px #494949; border-style : none none solid none;">
        <b>[{ $basketitem->oProduct->fprice }] [{ $currency->sign}]</b>
        </td>
        <td class="basketlist" valign="top" align="right" style="padding-top : 10px; border : 1px #494949; border-style : none solid solid none;">
        <b>[{ $basketitem->ftotalprice }] [{ $currency->sign}]</b>
        </td>
        </tr>
    	[{/foreach}] 
        </table>
		[{ if $basket->aDiscounts }]
		<table border="0" cellspacing="0" cellpadding="2" width="100%">
			[{foreach from=$basket->aDiscounts item=sDiscount}]
		    	<tr>
					<td class="basketsum" align="right" height="20" valign="bottom" style="border : 1px #494949; border-style : none none solid solid;">
					Rabatt : 
					</td>
			        <td class="basketsum" width="200" align="right" valign="bottom" style="border : 1px #494949; border-style : none solid solid none;">
					<em>[{ $sDiscount }]</em>
			        </td>
		        </tr>
			[{/foreach}]
		</table>
		[{/if}]
        <table border="0" cellspacing="0" cellpadding="2" width="100%">
	    	<tr>
	        <td class="basketlist" valign="top" align="right" style="padding-top : 10px; border : 1px #494949; border-style : none none none solid;">
			Summe Produkte :
	        </td>
	        <td class="basketlist" valign="top" align="right" width="90" style="padding-top : 10px; padding-right : 5px; border : 1px #494949; border-style : none solid none none;">
	        [{ $basket->fproductsprice }] [{ $currency->sign}]
	        </td>
	        </tr>
	    	<tr>
	        <td class="basketlist" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
			davon Mwst. :
	        </td>
	        <td class="basketlist" valign="top" align="right" style="padding-right : 5px; border : 1px #494949; border-style : none solid none none;">
	        [{ $basket->fVAT }] [{ $currency->sign}]
	        </td>
	        </tr>
	    	<tr>
	        <td class="basketlist" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
			Versandkosten :
	        </td>
	        <td class="basketlist" valign="top" align="right" style="padding-right : 5px; border : 1px #494949; border-style : none solid none none;">
	        [{ $basket->fdeliverycost }] [{ $currency->sign}]
	        </td>
	        </tr>
			[{ if $basket->dAddPaymentSum }]
	    	<tr>
	        <td class="basketlist" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
			Aufschlag Zahlungsart :
	        </td>
	        <td class="basketlist" valign="top" align="right" style="padding-right : 5px; border : 1px #494949; border-style : none solid none none;">
	        [{ $basket->fAddPaymentSum }] [{ $currency->sign}]
	        </td>
	        </tr>
			[{/if}]
	    	<tr>
	        <td class="basketlist" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
			<b>Gesamtsumme :</b>
	        </td>
	        <td class="basketlist" valign="top" align="right" style="padding-bottom : 10px; padding-right : 5px; border : 1px #494949; border-style : none solid none none;">
	        <b>[{ $basket->fprice }] [{ $currency->sign}]</b>
	        </td>
	        </tr>
		    <form action="index.php" method="post" name="order" id="order">
		    [{ $shop->hiddensid }]
		    <input type="hidden" name="cl" value="order">
		    <input type="hidden" name="fnc" value="execute">
		    <input type="hidden" name="cnid" value="[{$shop->cnid}]">
	    	<tr>
	        <td class="basketlist" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
			<b>Ich habe die <a href="[{$shop->selflink}]&cl=info&tpl=agb.tpl">AGB's</a> gelesen und bin einverstanden</b>
	        </td>
	        <td class="basketlist" valign="top" align="right" style="padding-bottom : 10px; padding-right : 5px; border : 1px #494949; border-style : none solid none none;">
			<input type="checkbox" name="agb" value="1">
	        </td>
	        </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="2" width="100%">
	    	<tr>
		        <td bgcolor="#CECDCD" class="basketlist" style="border : 1px #494949; border-style : none none solid solid;">&nbsp;
				Die Bezahlung erfolgt mit : <b>[{ $payment->oxpayments__oxdesc->value }]</b>
		        </td>
		        <td class="basketsum" bgcolor="#CECDCD" style="border : 1px #494949; border-style : none solid solid none;" align="right" valign="middle">
				<a class="ordernow" href="javascript:chkAGB();"><img src="[{$shop->imagedir}]/order_execute.gif" alt="Bestellung abschicken" border="0" align="absmiddle"></a>&nbsp;&nbsp;
		        </td>
				</form>
	        </tr>
        </table>

	[{ if $toparticle }]
	<br><br>
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td class="aktionhead" align="center" height="17" width="290">Jetzt g&uuml;nstig !</td>
	</tr>
	<tr>
	<td class="aktionmain" align="left">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
		    <td class="startpageProduct" height="120" align="middle">
			    <a class="startpageProduct" href="[{ $toparticle->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$toparticle->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $toparticle->oxarticles__oxtitle->value }]"></a>
		    </td>
		    <td width="131" class="searchitem" style="padding-left: 5px;">
			
				<table border="0" cellspacing="0" cellpadding="0">
				<tr>
				<td class="aktion" height="15">[{ $toparticle->oxarticles__oxtitle->value }]</td>
				<td class="aktion"></td>
				</tr>
				<tr>
				<td class="aktionhighlight" height="15"><b>Jetzt nur [{ $toparticle->fprice }] [{ $currency->sign}] !!</b></td>
				</tr>
				<tr>
				<td class="aktion" height="25">
					<table border="0" cellspacing="0" cellpadding="0">
					<tr>
					<td class="aktion" width="120"><a class="aktion" href="[{ $toparticle->oxdetaillink}]">mehr Infos</a></td>
					<td class="aktion"><a href="[{ $toparticle->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/tobasket_button.gif" alt="in den Warenkorb" border="0" hspace="0" vspace="0" ></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					</table>
				</td>
				</tr>
				</table>
		    </td>
		</tr>
		</table>	
	</td>
	</tr>
	</table>
	[{/if}]
		
    </td>
    </tr>
    </table>
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
