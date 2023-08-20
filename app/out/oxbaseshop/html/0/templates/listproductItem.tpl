<table border="0" cellspacing="0" cellpadding="0" width="290">
<tr>
<td class="listproduct" height="120" width="130">
	<a class="aktion" href="[{ $product->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$product->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]"></a>
</td>
<td class="listproduct">

	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td class="aktion" height="15">[{ $product->oxarticles__oxtitle->value }]</td>
	<td class="aktion"></td>
	</tr>
	<tr>
	<td class="aktionhighlight" height="15"><b>[{ $product->fprice }] [{ $currency->sign}]</b></td>
	</tr>
	<tr>
		<td class="aktion" height="25">
		<a class="aktion" href="[{ $product->oxdetaillink}]"><b>mehr Infos</b></a>
		</td>
	</tr>
	<tr>
		<td class="aktion" height="25" align="left">
		<a href="[{ $product->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/tobasket_button.gif" alt="in den Warenkorb" border="0" hspace="0" vspace="0"></a></td>
		</td>
	</tr>
	</table>
	
</td>
</tr>
</table>
