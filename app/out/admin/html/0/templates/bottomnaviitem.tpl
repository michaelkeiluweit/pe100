<tr>
<td valign="top" align="left" height="40"><table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr>
    <td valign="top" class="edittext">
[{ if $navigation == "user"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=user_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=user_new}] ><img src="[{$shop->imagedir}]/new_user_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
<a href="extern/user.php?sid=[{$shop->sid}]" target="_new" [{include file="help.tpl" helpid=user_result}] ><img src="[{$shop->imagedir}]/new_selectlist_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ if $oxid != "-1"}]
<a href="Javascript:parent.list.document.search.actedit.value=2;parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=user_remark&sid=[{$shop->sid}]&oxid=[{$oxid}]'" target="edit" [{include file="help.tpl" helpid=user_newremark}]><img src="[{$shop->imagedir}]/new_remark_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
<a href="Javascript:parent.list.document.search.actedit.value=3;parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=user_address&sid=[{$shop->sid}]&oxaddressid=-1&oxid=[{$oxid}]'" target="edit" [{include file="help.tpl" helpid=user_newaddress}]><img src="[{$shop->imagedir}]/new_address_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
<!--a href="Javascript:parent.list.document.search.actedit.value=4;parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=user_payment&sid=[{$shop->sid}]&oxpaymentid=-1&oxid=[{$oxid}]'" target="edit" [{include file="help.tpl" helpid=user_newpayment}]><img src="[{$shop->imagedir}]/new_userpayment_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a-->
[{ /if }]
[{ elseif $navigation == "payment"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=payment_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=payment_new}] ><img src="[{$shop->imagedir}]/new_payment_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "newsletter"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=newsletter_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=newsletter_new}] ><img src="[{$shop->imagedir}]/new_newsletter_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "shop"}]
[{ if $malladmin == 1}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=shop_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=shop_new}] ><img src="[{$shop->imagedir}]/new_shop_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ /if}]
[{ elseif $navigation == "usergroups"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=usergroup_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=usergroup_new}] ><img src="[{$shop->imagedir}]/new_usergroup_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "category"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=category_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=category_new}] ><img src="[{$shop->imagedir}]/new_category_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "mallcategory"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=mallcategory_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=mallcategory_new}] ><img src="[{$shop->imagedir}]/new_mallcategory_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "article"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=article_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=article_new}] ><img src="[{$shop->imagedir}]/new_article_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ if $oxid != "-1"}]
<a href="Javascript:parent.list.document.search.oxid.value='[{$oxid}]'; parent.list.document.search.actedit.value=1; parent.list.document.search.submit();document.myedit.cl.value='article_main'; document.myedit.voxid.value='-1'; document.myedit.oxparentid.value='[{$edit->oxarticles__oxnid->value}]';document.myedit.submit();" target="edit" [{include file="help.tpl" helpid=article_variant_new}] ><img src="[{$shop->imagedir}]/new_variant_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ /if }]
[{ elseif $navigation == "article_novar"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=article_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=article_new}] ><img src="[{$shop->imagedir}]/new_article_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "attribute"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=attribute_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=attribute_new}] ><img src="[{$shop->imagedir}]/new_attribute_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "selectlist"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=selectlist_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=selectlist_new}] ><img src="[{$shop->imagedir}]/new_selectlist_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "discount"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=discount_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=discount_new}] ><img src="[{$shop->imagedir}]/new_discount_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "delivery"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=delivery_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=delivery_new}] ><img src="[{$shop->imagedir}]/new_delivery_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "vat"}]
<a href="Javascript:parent.list.document.search.oxid.value='-1'; parent.list.document.search.submit();document.location='[{$shop->selflink}]?cl=vat_main&sid=[{$shop->sid}]'" target="edit" [{include file="help.tpl" helpid=vat_new}] ><img src="[{$shop->imagedir}]/new_vat_button.gif" alt="" border="0" align="top" hspace="0" vspace="0"></a>
[{ elseif $navigation == "order"}]
[{ elseif $navigation == "imex"}]
[{ else}]
    Navigation fehlt 
[{ /if}]

    </td>
    <td class="naviactshop" align="right" valign="center">Shop : [{ $actshop}]</td>
</tr>
</table>

</td>
</tr>
