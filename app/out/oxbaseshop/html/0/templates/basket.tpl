[{include file="headitem.tpl" title=""}]
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr>
<td valign="top">
    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
    <td class="defaultcontent" width="17"></td>
    <td class="defaultcontent">
	[{include file="steps_item.tpl" highlight=1}]

    [{ if !$basket->iCntProducts  }]
    <b>Der Warenkorb ist leer.</b><br>
    [{else}]
        <table border="0" cellspacing="0" cellpadding="2" width="100%">
    	<tr>
        <td class="basketlisthead" valign="top" height="17">
        &nbsp;&nbsp;Produkt
        </td>
        <td class="basketlisthead" valign="top" width="10"></td>
        <td class="basketlisthead" valign="top">
        Anzahl
        </td>
        <td class="basketlisthead" valign="top"></td>
        <td class="basketlisthead" valign="top"></td>
        <td class="basketlisthead" valign="top" width="70">
        Einzelpreis
        </td>
        <td class="basketlisthead" valign="top" width="70">
        Gesamt
        </td>
        </tr>
    	[{foreach key=basketindex from=$basket->aBasketContents item=basketitem}]  
    	<tr>
        
        <td class="basketlist" valign="top" height="110" style="padding-top : 10px; padding-left : 5px;	border : 1px #494949; border-style : none none none solid;">
        <a class="basketlist" href="[{ $basketitem->oProduct->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$basketitem->oProduct->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $basketitemitem->oProduct->oxarticles__oxtitle->value }]"></a>
        </td>
        <form action="index.php" method="get">
        [{ $shop->hiddensid }]
        <input type="hidden" name="cl" value="basket">
        <input type="hidden" name="fnc" value="changebasket">
        <input type="hidden" name="aid" value="[{$basketitem->sProduct}]">
        <input type="hidden" name="bindex" value="[{$basketindex}]">
        <td class="basketlist" valign="top" width="10"></td>
        <td class="basketlist" valign="top" width="180" style="padding-top : 10px;">
        <input type="text" name="am" value="[{$basketitem->dAmount}]" size="2" class="basketlist">
        <input type="image" src="[{$shop->imagedir}]/basketact_button.gif" align="top" hspace="0" vspace="0" border="0"><br>
        <br>
        <b>[{ $basketitem->oProduct->oxarticles__oxtitle->value }]</b><br>
        <br>
        [{ $basketitem->oProduct->oxarticles__oxshortdesc->value }]
        </td>
		
		<td class="basketlist" valign="top" style="padding-top : 10px;">
		<a href="[{$shop->selflink}]&cl=basket&fnc=changebasket&aid=[{$basketitem->sProduct}]&am=0&bindex=[{$basketindex}]"><img src="[{$shop->imagedir}]/delete_button.gif" alt="Aus Warenkorb entfernen" border="0"></a>
        </td>
		
        <td class="basketlist" valign="top" style="padding-top : 10px;">
        [{foreach key=iSel from=$basketitem->selectlist item=oList}]
            <select class="producttext" name="sel[[{$iSel}]]">
            [{foreach key=iSelIdx from=$oList item=oSelItem}]
			[{ if $oSelItem->name }]
            <option class="producttext" value="[{$iSelIdx}]" [{if $oSelItem->selected}]SELECTED[{/if}]>[{ $oSelItem->name }]</option>
			[{/if}]
            [{/foreach}]
            </select>&nbsp;&nbsp;&nbsp;
        [{/foreach}]
        </td>
        
        </form>
        <td class="basketlist" valign="top" style="padding-top : 10px;">
        <b>[{ $basketitem->oProduct->fprice }] [{ $currency->sign}]</b>
        </td>
        <td class="basketlist" valign="top" style="padding-top : 10px; border : 1px #494949; border-style : none solid none none;">
        <b>[{ $basketitem->ftotalprice }] [{ $currency->sign}]</b>
        </td>
        </tr>
        <tr>
	        <td height="1" bgcolor="#494949"></td>
	        <td height="1" bgcolor="#494949"></td>
	        <td height="1" bgcolor="#494949"></td>
	        <td height="1" bgcolor="#494949"></td>
	        <td height="1" bgcolor="#494949"></td>
	        <td height="1" bgcolor="#494949"></td>
	        <td height="1" bgcolor="#494949"></td>
        </tr>
    	[{/foreach}] 
        </table>
		[{ if $basket->aDiscounts }]
		<table border="0" cellspacing="0" cellpadding="2" width="100%">
			[{foreach from=$basket->aDiscounts item=sDiscount}]
		    	<tr>
					<td class="basketsum" align="right" style="border : 1px #494949; border-style : none none none solid; " height="20" valign="bottom">
					Rabatt : 
					</td>
			        <td class="basketsum" width="200" align="right" style="border : 1px #494949; border-style : none solid none none;" valign="bottom">
					<em>[{ $sDiscount }]</em>&nbsp;&nbsp;
			        </td>
		        </tr>
			[{/foreach}]
		</table>
		[{/if}]
        <table border="0" cellspacing="0" cellpadding="2" width="100%">
	    	<tr>
		        <td class="basketsum" align="right" style="border : 1px #494949; border-style : none none none solid; " height="20" valign="bottom">
				Summe Produkte :
		        </td>
		        <td class="basketsum" align="right" width="80" style="border : 1px #494949; border-style : none solid none none;" valign="bottom">
		        [{ $basket->fproductsprice }] [{ $currency->sign}]&nbsp;&nbsp;
		        </td>
	        </tr>
	    	<tr>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
				davon Mwst. :
		        </td>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none solid none none;">
		        [{ $basket->fVAT }] [{ $currency->sign}]&nbsp;&nbsp;
		        </td>
	        </tr>
	    	<tr>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
				Versandkosten :
		        </td>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none solid none none;">
		        [{ $basket->fdeliverycost }] [{ $currency->sign}]&nbsp;&nbsp;
		        </td>
	        </tr>
			[{ if $basket->dAddPaymentSum }]
	    	<tr>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;">
				Aufschlag Zahlungsart :
		        </td>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none solid none none;">
		        [{ $basket->fAddPaymentSum }] [{ $currency->sign}]&nbsp;&nbsp;
		        </td>
	        </tr>
			[{/if}]
	    	<tr>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none none none solid;"  height="25" >
				<b>Gesamtsumme :</b>
		        </td>
		        <td class="basketsum" valign="top" align="right" style="border : 1px #494949; border-style : none solid none none;">
		        <b>[{ $basket->fprice }] [{ $currency->sign}]</b>&nbsp;&nbsp;
		        </td>
	        </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="2" width="100%">
	    	<tr>
		        <td valign="top" bgcolor="#CECDCD" class="stepnext" style="border : 1px #494949; border-style : none none solid solid;">&nbsp;
		        </td>
		        <td class="basketsum" bgcolor="#CECDCD" style="border : 1px #494949; border-style : none solid solid none;" align="right" valign="middle">
				[{if $basket->iCntProducts}]<a href="[{ $shop->orderlink }]" class="stepnext"><img src="[{$shop->imagedir}]/basket_nextstep.gif" width="175" height="17" alt="Weiter zum n&auml;chsten Schritt" border="0" align="absmiddle"></a>[{/if}]&nbsp;&nbsp;
		        </td>
	        </tr>
        </table>
        <br>
    [{/if}]
	
[{ if $similarlist }]
    <b>weitere interessante Produkte speziell f&uuml;r Sie :</b><br>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
	[{assign var="iPos" value=1}]
	[{foreach from=$similarlist item=simproduct}]  
   	[{if $iPos == 1}]
   	<tr>
	<td>
	[{include file="startProductItem.tpl" product=$simproduct}]
	</td>
   	[{assign var="iPos" value=2}]
   	[{elseif $iPos==2}]
	<td>
	[{include file="startProductItem.tpl" product=$simproduct}]
	</td>
   	[{assign var="iPos" value=3}]
   	[{elseif $iPos==3}]
	<td>
	[{include file="startProductItem.tpl" product=$simproduct}]
	</td>
   	[{assign var="iPos" value=4}]
   	[{elseif $iPos==4}]
	<td>
	[{include file="startProductItem.tpl" product=$simproduct}]
	</td>
	</tr>
   	[{assign var="iPos" value=1}]
	[{/if}]
	[{/foreach}] 
     <!-- fehlende ausgleichen -->
   	[{if $iPos == 1}]
   	<td></td>
   	<td></td>
   	<td></td>
   	</tr>
   	[{elseif $iPos==2}]
   	<td></td>
   	<td></td>
   	</tr>
   	[{elseif $iPos==3}]
   	<td></td>
   	</tr>
   	[{elseif $iPos==4}]
   	</tr>
   	[{/if}]
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
