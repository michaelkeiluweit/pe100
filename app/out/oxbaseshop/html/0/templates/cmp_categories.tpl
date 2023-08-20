[{foreach from=$Tree item=ocat}]

<!-- Top Kategorie -->
[{if $sSpacer == ""}]
<tr>
<td class="rootcategory" width="8">&nbsp;</td>
<td class="rootcategory">
<a href="[{ if $ocat->expanded}][{ $ocat->closelink }][{else}][{ $ocat->openlink }][{/if}]" class="[{ if $ocat->expanded}]rootcategory_exp[{else}]rootcategorylink[{/if}]">
[{if $ocat->hasSubCats}]
[{ if $ocat->expanded}]<img src="[{$shop->imagedir}]/rootcat_open.gif" width="9" height="9" alt="" border="0">
[{else}]<img src="[{$shop->imagedir}]/rootcat_closed.gif" width="9" height="9" alt="" border="0">[{/if}]
[{/if}]
[{ $ocat->oxcategories__oxtitle->value }]</a>
</td>
</tr>
<!-- Top Kategorie end-->
<!-- Sub Kategorie -->
[{else}]
<tr>
<td class="subcategory" width="8">&nbsp;</td>
<td class="subcategory">[{$sSpacer}]
<a href="[{ if $ocat->expanded}][{ $ocat->closelink }][{else}][{ $ocat->openlink }][{/if}]" class="subcategory"><img src="[{$shop->imagedir}]/[{if $ocat->hasSubCats}]subcat_more.gif[{else}]subcat.gif[{/if}]" width="9" height="9" alt="" border="0">[{ $ocat->oxcategories__oxtitle->value }]</a>
</td>
</tr>
<!-- Sub Kategorie end-->
[{/if}]

[{ if $ocat->expanded}]
[{if $sSpacer == ""}]
<!-- expanded root cat -->
<tr>
<td height="1" bgcolor="#000000"></td>
<td height="1" bgcolor="#000000"></td>
</tr>
[{/if}]
    [{include file="cmp_categories.tpl" Tree=$ocat->aSubCats sSpacer=$sSpacer&nbsp;&nbsp;&nbsp; }]
[{/if}]
[{/foreach}]
