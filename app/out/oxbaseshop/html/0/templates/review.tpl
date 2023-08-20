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
	<td width="10">&nbsp;</td>
    <td class="defaultcontent">

    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
		<td class="list_catpath" height="18" >
			[{ assign var="blSep" value=""}]
			&nbsp;&nbsp;&nbsp;
		    [{foreach from=$actCatpath item=oCatPath}]
		    [{ if $blSep == "y"}]
		    /
		    [{/if}]
			<a href="[{$oCatPath->link}]" class="list_catpath">[{ $oCatPath->oxcategories__oxtitle->value }]</a>
		    [{ assign var="blSep" value="y"}]
			[{/foreach}]
		</td>
	</tr>
    </table>
    
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
        <td><a href="[{ $product->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$product->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]"></a></td>
        <td width="10"></td>
        <td class="producttext" valign="top">
        <a href="[{ $product->oxdetaillink}]" class="producttext"><b>[{ $product->oxarticles__oxtitle->value }]</b></a><br>
        <br>
        [{ $product->oxarticles__oxshortdesc->value }]
        </td>
        </tr>
        </table>
        <br>
        <table border="0" cellspacing="0" cellpadding="0" width="400">
        <tr>
        <td class="producthighlight"><b>Ihre Bewertung :</b><br><br></td>
        </tr>
        <tr>
        <td>
        <form action="index.php" method="post">
        [{ $shop->hiddensid }]
        <input type="hidden" name="fnc" value="savereview">
        <input type="hidden" name="cl" value="[{$shop->cl}]">
        <input type="hidden" name="cnid" value="[{$shop->cnid}]">
        <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        <textarea cols="70" rows="25" name="rvw_txt" class="productreviewtext"></textarea><br>
        <br>
        <input class="productreviewtext" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bewertung speichern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
        </form>        
        </td>
        </tr>
        </table>
        <br>
        [{ if $reviews }]
            <table border="0" cellspacing="0" cellpadding="0" width="400">
            <tr>
            <td width="10"></td>
            <td class="producthighlight"><b>Bisherige Bewertungen :</b><br><br></td>
            </tr>
            [{foreach from=$reviews item=review}]  
            <tr>
            <td></td>
            <td class="productreviewhead">Geschrieben von [{ $review->oxuser__oxfname->value }] [{ $review->oxuser__oxlname->value }] am [{ $review->oxreviews__oxcreate->value }]<br></td>
            </tr>
            <tr>
            <td></td>
            <td class="productreviewtext">[{ $review->oxreviews__oxtext->value }]<br><br></td>
            </tr>
            [{/foreach}] 
            </table>
        [{/if}]
            
    </td>

    <td class="defaultcontent" width="30"></td>
    [{include file="detailitem.tpl"}]
    </tr>
    
    </table>
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
