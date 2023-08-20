<table border="0" cellspacing="0" cellpadding="0">
<tr>
    <td class="startpageProduct" height="100" align="left" width="220">
    <a class="startpageProduct" href="[{ $product->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$product->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]"></a>
    </td>
</tr>
<tr>
    <td class="startpageProductTitle" align="left">
    [{ $product->oxarticles__oxtitle->value }]
    </td>
</tr>
<tr>
    <td class="startpageProductText" align="left" height="20">
    <b>Jetzt nur [{ $product->fprice }] [{ $currency->sign}]</b>&nbsp;
    </td>
</tr>
<tr>
    <td class="startpageProductText" align="left" height="20">
    <a class="startpageProductText" href="[{ $product->oxdetaillink}]">mehr Infos</a><br>
    <a href="[{ $product->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/tobasket_button.gif" alt="in den Warenkorb" border="0" hspace="0" vspace="5" align="absmiddle"></a>
    </td>
</tr>
</table>