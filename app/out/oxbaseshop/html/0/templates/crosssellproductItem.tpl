<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
    <td class="startpageProduct" height="120" align="center">
	    <a class="startpageProduct" href="[{ $product->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$product->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]"></a>
    </td>
    <td width="131" class="searchitem" style="padding-left: 5px;">
	
		<table border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td class="aktion" height="15">[{ $product->oxarticles__oxtitle->value }]</td>
		<td class="aktion"></td>
		</tr>
		<tr>
		<td class="aktionhighlight" height="15"><b>Jetzt nur [{ $product->fprice }] [{ $currency->sign}] !!</b></td>
		</tr>
		<tr>
		<td class="aktion" height="25">
			<table border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td class="aktion" width="120"><a class="aktion" href="[{ $product->oxdetaillink}]">mehr Infos</a></td>
			<td class="aktion"><a href="[{ $product->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/tobasket_button.gif" alt="in den Warenkorb" border="0" hspace="0" vspace="0" align="right"></a>&nbsp;&nbsp;</td>
			</tr>
			</table>
		</td>
		</tr>
		</table>
    </td>
</tr>
</table>