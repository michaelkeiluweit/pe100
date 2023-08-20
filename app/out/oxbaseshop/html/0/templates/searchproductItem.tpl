<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
    <td class="startpageProduct" valign="top" width="200">
    <a class="startpageProduct" href="[{ $product->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$product->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]"></a>
    </td>
    <td class="searchitem" valign="top" width="140">
    <b>[{ $product->oxarticles__oxtitle->value }]</b><br>
    <br>
    <a class="startpageProduct" href="[{ $product->oxdetaillink}]"><img src="[{$shop->imagedir}]/subcat_more.gif" width="9" height="9" alt="" border="0"><span class="searchitemhighlight"><b>mehr Infos</b></span></a><br>
    &nbsp;Nur <b>[{ $product->fprice }] [{ $currency->sign}]</b><br>
    <br>
    <a href="[{ $product->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/inbasket_button.gif" width="117" height="19" alt="" border="0"></a>
    </td>
    <td class="searchitem" valign="top">
    [{ $product->oxarticles__oxshortdesc->value }]
    </td>
</tr>
<tr>
<td height="1" bgcolor="#BEBEBE"></td>
<td height="1" bgcolor="#BEBEBE"></td>
<td height="1" bgcolor="#BEBEBE"></td>
</tr>
</table>