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
	<td width="25"></td>
    <td class="defaultcontent">
        Willkommen [{ if $oxcmp_user }]<b>[{ $oxcmp_user->oxuser__oxfname->value }] [{ $oxcmp_user->oxuser__oxlname->value }]</b> [{/if}]im oxid e-sales Onlineshop !<br>
        Dies ist ein Demo Shop - also keine Sorge, Sie bestellen hier nicht verbindlich - also probieren Sie alles aus.<br>
        <br>
        Und nun w&uuml;nschen wir Ihnen viel Spass beim testen !<br>
        <br>
	
	[{if isset($firstarticle) }]
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
		<td width="200">
		<a class="startpageProduct" href="[{ $firstarticle->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$firstarticle->oxarticles__oxpic1->value }]" border="0" hspace="0" vspace="0" alt="[{ $firstarticle->oxarticles__oxtitle->value }]"></a>
		</td>
		<td class="startpageFirstProductTitle" valign="top" width="10">*</td>
		<td class="startpageFirstProductTitle" valign="top" width="100%">
		[{ $firstarticle->oxarticles__oxtitle->value }]<br>
		<br>
		<span class="startpageFirstProductText">[{ $firstarticle->oxarticles__oxshortdesc->value }]</span><br>
		<br>
		<span class="startpageProductText"><b>Statt <span class="startpageFirstProductOldPrice">[{ $firstarticle->ftprice}]</span> jetzt nur </b></span><span class="startpageFirstProductPrice">[{ $firstarticle->fprice }] [{ $currency->sign}]</span><br>
		<br>
		<a class="startpageProductText" href="[{ $firstarticle->oxdetaillink}]"><b>mehr Infos</b></a><br>
		<a href="[{ $firstarticle->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/inbasket_button.gif" alt="in den Warenkorb" border="0" hspace="0" vspace="5" align="absmiddle"></a>
		</td>
		</tr>
	    </table>
	[{/if}]


        <table border="0" cellspacing="0" cellpadding="0">
		
	[{if isset($articlelist) }]
		<tr>
		<td height="1" bgcolor="#CECDCD"></td>
		<td height="1" bgcolor="#CECDCD"></td>
		</tr>
		<tr>
		<td height="7"></td>
		<td></td>
		</tr>
    	[{assign var="iPos" value=1}]
    	[{foreach from=$articlelist item=product}]  
    	
    	[{if $iPos == 1}]
    	<tr>
    	<td valign="top">
    			[{include file="startProductItem.tpl"}]
    	</td>
    	[{assign var="iPos" value=2}]
    	[{elseif $iPos==2}]
    	<td valign="top">
    			[{include file="startProductItem.tpl"}]
    	</td>
    	</tr>
		<tr>
		<td height="7"></td>
		<td></td>
		</tr>
		<tr>
		<td height="1" bgcolor="#CECDCD"></td>
		<td height="1" bgcolor="#CECDCD"></td>
		</tr>
		<tr>
		<td height="7"></td>
		<td></td>
		</tr>
    	<!-- ende zeile -->
    	[{assign var="iPos" value=1}]
    	[{/if}]
    	[{/foreach}] 
        
        <!-- fehlende ausgleichen -->
    	[{if $iPos == 1}]
    	<td></td>
    	</tr>
    	[{/if}]
    [{/if}]           
    
    <br>
    
    <tr>
    <td>
		<table border="0" cellspacing="0" cellpadding="0" width="220">
		<tr>
		<td class="startpageBoxHead" align="left" height="18">&nbsp;&nbsp;oxid am Start !</td>
		</tr>
		<tr>
		<td class="startpageBoxContent">
		Im April starten wir durch und beglücken euch wieder mit unglaubliche geilen Produkten. Um das Warten erträglich zu machen, haben wir als warm-up hier schon mal einen kleinen Demo Shop geschnürt. Einfach so, zum rumklicken und freuen !
		</td>
		</tr>
		</table>
	</td>
    <td valign="top" style="padding-left: 10px;">
		[{ if $aNewestArticles }]
	    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	    <td height="20" valign="middle" class="newestProductHead">
	    <img src="[{$shop->imagedir}]/rootcat_open.gif" width="9" height="9" alt="" border="0">Neueste Artikel :
	    </td>
	    </tr>
	    [{foreach from=$aNewestArticles item=product}]
	    <tr>
	    <td class="newestProduct" height="20" valign="middle">
	    -&nbsp;<a href="[{ $product->oxdetaillink}]" class="newestProduct">[{ $product->oxarticles__oxtitle->value }]</a>
	    </td>
	    </tr>
	    [{/foreach}] 
	    </table>
		[{ /if}]
	</td>
    </tr>

    <tr>
    <td height="10">
	</td>
    <td>
	</td>
    </tr>
	
    <tr>
    <td>
		[{ if $aTop5Articles }]
	    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	    <td height="20" valign="middle" class="newestProductHead">
	    <img src="[{$shop->imagedir}]/rootcat_open.gif" width="9" height="9" alt="" border="0">Bestverkaufte Artikel :
	    </td>
	    </tr>
	    [{foreach from=$aTop5Articles item=product}]
	    <tr>
	    <td class="newestProduct" height="20" valign="middle">
	    -&nbsp;<a href="[{ $product->oxdetaillink}]" class="newestProduct">[{ $product->oxarticles__oxtitle->value }]</a>
	    </td>
	    </tr>
	    [{/foreach}] 
	    </table>
		[{ /if }]
	</td>
    <td>
	</td>
    </tr>
	</table>


   	<br>
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
