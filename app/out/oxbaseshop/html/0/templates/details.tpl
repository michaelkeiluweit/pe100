[{include file="headitem.tpl" title=$product->oxarticles__oxtitle->value }]
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr>
<td valign="top">
    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
	<td width="10"></td>
   	<td class="defaultcontent">

    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
		<td class="details_catpath" valign="top">
		    [{foreach from=$actCatpath item=oCatPath}]
			<img src="[{$shop->imagedir}]/fforward.gif" width="11" height="11" alt="" border="0" align="absmiddle" hspace="0" vspace="0">&nbsp;<a href="[{$oCatPath->link}]" class="details_catpath">[{ $oCatPath->oxcategories__oxtitle->value }]</a>
			[{/foreach}]
		</td>
		<td class="details_catpath" valign="bottom" align="right">
			[{ if $actCategory && $actCategory->iProductPos }]
			Produkt [{ $actCategory->iProductPos }] von [{ $actCategory->iCntOfProd }]<br>

			[{ assign var="blSep" value=""}]
			[{ if $actCategory->prevProductLink }]
			<a href="[{$actCategory->prevProductLink }]" class="detailproductlink">Artikel zur&uuml;ck</a>&nbsp;&nbsp;&nbsp;
			[{ assign var="blSep" value="y"}]
			[{ /if}]
		

			[{ if $actCategory->nextProductLink }]
			    [{ if $blSep == "y"}]
			    <span class="detailproductlink">|</span>
			    [{/if}]
			&nbsp;&nbsp;&nbsp;<a href="[{$actCategory->nextProductLink }]" class="detailproductlink">n&auml;chster Artikel</a>
			[{ /if}]
			[{ /if}]
		</td>	
	</tr>
    <tr>
		<td height="6"></td>
		<td></td>	
	</tr>
    <tr>
		<td class="aktionhead" height="18">&nbsp;&nbsp;[{ $product->oxarticles__oxtitle->value }]</td>
		<td class="aktionhead"></td>	
	</tr>
	
    <tr>
	
	<td style="border: 1px solid #BFBFBF; border-style: none solid none none;" valign="top">
	
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
	        <td class="producthead">
			<br>
	        <a href="[{$product->oxmoredetaillink}]" class="producthead" target="_new">
	        <img src="[{$shop->dimagedir}]/[{$product->oxarticles__oxpic1->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]">
	        </a>
	        </td>
        </tr>
        <tr>
	        <td height="1" bgcolor="#BEBEBE"></td>
        </tr>
        <tr>
    	    <td class="productgreytext"><a href="[{$product->oxmoredetaillink}]" class="productgreytext" target="_new">weitere Bilder</a></td>
        </tr>
        <tr>
	        <form action="index.php" method="post">
	        [{ $shop->hiddensid }]
	        <input type="hidden" name="cl" value="details">
	        <input type="hidden" name="fnc" value="tobasket">
	        <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
	        <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
	        <input type="hidden" name="cnid" value="[{ $shop->cnid }]">
	        <td class="productgreytext" height="25">
			<br>
			[{ $product->oxarticles__oxtitle->value }] / <b>[{ $product->fprice }] [{ $currency->sign}]</b>
	        </td>
        </tr>
        <tr>
        <td class="productgreytext" height="30">
	        [{ if $selectlist }]
		        [{foreach key=iSel from=$selectlist item=oList}]
					[{ $oList.name }] :
		            <select class="producttext" name="sel[[{$iSel}]]">
		            [{foreach key=iSelIdx from=$oList item=oSelItem}]
					[{ if $oSelItem->name }]
		            	<option class="productgreytext" value="[{$iSelIdx}]">[{ $oSelItem->name }]</option>
					[{/if}]
		            [{/foreach}]
		            </select>&nbsp;&nbsp;&nbsp;
		        [{/foreach}]
		    [{/if}]
	        Menge : <input type="text" name="am" value="1" size="2" class="productgreytext">
	        <input type="image" src="[{$shop->imagedir}]/tobasket_button.gif" align="top" hspace="0" vspace="0" border="0">
        </td>
        </form>
        </tr>
			[{ if $product->foxdelivery }]
	        <tr>
		        <td class="producttext" height="20">			
				<b>Lieferbar ab [{ $product->foxdelivery }]</b>
				</td>
	        </tr>
			[{/if}]
			[{ if $product->oxarticles__oxstock->value == 0 }]
	        <tr>
		        <td class="producttext" height="40">
				<em>Dieser Artikel ist nicht auf Lager und muss erst nachbestellt werden.</em>
				</td>
	        </tr>
			[{/if}]
        <tr>
	        <td class="producttext"><em>[{ $product->oxarticles__oxshortdesc->value }]</em><br><br></td>
        </tr>
        <tr>
        	<td class="producttext">[{ $product->oxarticles__oxlongdesc->value }]<br></td>
        </tr>
        <tr>
        	<td class="producttext"><br>
			Sie haben <a href="mailto:[{if $product->oxarticles__oxquestionemail->value}][{$product->oxarticles__oxquestionemail->value}][{else}][{$oxcmp_shop->oxshops__oxinfoemail->value}][{/if}]?subject=Fragen zu Artikel [{$product->oxarticles__oxartnum->value}]" class="producttext"><b>Fragen</b></a> zu diesem Produkt ?<br></td>
        </tr>
		[{ if $product->oxarticles__oxexturl->value }]
        <tr>
        	<td class="producttext"><br>
			<a href="http://[{ $product->oxarticles__oxexturl->value }]" target="_new" class="producttext"><b>[{ $product->oxarticles__oxurldesc->value }]</b></a>
        </tr>
		[{ /if}]
        <tr>
        	<td height="1" bgcolor="#BEBEBE"></td>
        </tr>
        [{ if $variants }]
        <tr>
        <td class="producthighlight">
			<br>
			erh&auml;ltlich in folgenden Varianten :
		</td>
        </tr>
        [{foreach from=$variants item=variant}]  
        <form action="index.php" method="post">
        [{ $shop->hiddensid }]
        <input type="hidden" name="cl" value="details">
        <input type="hidden" name="fnc" value="tobasket">
        <input type="hidden" name="aid" value="[{ $variant->oxarticles__oxid->value }]">
        <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        <input type="hidden" name="cnid" value="[{ $shop->cnid }]">
        <tr>
        <td class="producttext" height="30">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
            <td class="producttext" width="200"><a href="[{$variant->oxdetaillink}]" class="producttext"><b>[{ $variant->oxarticles__oxtitle->value }]</b></a></td>
            <td class="producttext" width="70">[{ $variant->fprice }] [{ $currency->sign}]</td>
			<td class="producttext" width="70">&nbsp;&nbsp;
		        <input type="text" name="am" value="1" size="2" class="producttext">
	    	    <input type="image" src="[{$shop->imagedir}]/tobasket_button.gif" align="top" hspace="0" vspace="0" border="0">
			</td>
            </tr>
            </table>
        </td>
        </tr>
		</form>
        [{/foreach}]
        <tr>
        <td height="1" bgcolor="#BEBEBE"></td>
        </tr>
        [{ /if}]

        [{ if $isreview }]
        
        [{ if $reviews }]
        <tr>
        <td class="producthighlight"><br><b>Produktbewertungen :</b><br><br></td>
        </tr>
        [{foreach from=$reviews item=review}]  
        <tr>
        <td class="productreviewhead">Geschrieben von [{ $review->oxuser__oxfname->value }] [{ $review->oxuser__oxlname->value }] am [{ $review->oxreviews__oxcreate->value }]<br></td>
        </tr>
        <tr>
        <td class="productreviewtext">[{ $review->oxreviews__oxtext->value }]<br><br></td>
        </tr>
        [{/foreach}] 
        [{else}]
        <tr>
        <td class="productreviewhead"><br>Keine Bewertungen zu diesem Artikel vorhanden.<br><br></td>
        </tr>
        [{/if}]
        <tr>
        <td class="productreviewhead">[{ if $oxcmp_user }]<a href="[{$shop->selflink}]&anid=[{$product->oxarticles__oxnid->value }]&cl=review&cnid=[{$shop->cnid}]" class="productreviewhead">Eine <b>Bewertung</b> schreiben.</a>[{else}]<a href="[{$shop->selflink}]" class="productreviewhead">Um eine Bewertung zu schreiben, m&uuml;ssen sie <b>eingeloggt</b> sein.</a>[{/if}]</td>
        </tr>
        [{/if}]
        
        </table>
        
        [{ if $customerwho }]
        <br>
	    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	    <td class="producttext">
	    Kunden, die sich diesen Artikel gekauft haben, <br>
        haben sich auch folgende Produkte gekauft :
	    </td>
	    </tr>
	    [{foreach from=$customerwho item=product}]
	    <tr>
	    <td class="producttext">
	    -&nbsp;<a href="[{ $product->oxdetaillink}]" class="producttext"><b>[{ $product->oxarticles__oxtitle->value }]</b></a>
	    </td>
	    </tr>
	    [{/foreach}] 
	    </table>
        [{ /if }]
                    
    </td>

    [{include file="detailitem.tpl"}]
    </tr>
    </table>
	
	</td>
	</tr>
	</table>
	
	
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
