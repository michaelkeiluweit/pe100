[{include file="headitem.tpl" title=$actCategory->oxcategories__oxdesc->value }]
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr><td valign="top">
    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
	<td width="8"></td>
    <td class="defaultcontent">
	
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
		<td class="list_catpath" height="18" width="50%">
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
		<td class="list_catdesc" align="right">
		[{ $actCategory->oxcategories__oxdesc->value }]&nbsp;&nbsp;&nbsp;
		</td>	
	</tr>
	
    [{ if !$pageNavigation->iArtCnt  }]
	<tr>
	<td class="defaultcontent">
	<br>
	Diese Kategorie ist leer ! Bitte Kategorie entfernen oder Produkte im Shop Administrator hinzuf&uuml;gen.<br>
	</td>
	<td></td>
	</tr>
    [{else}]

    	[{assign var="iPos" value=1}]

	   	[{assign var="iOffer" value=0}]
	   	[{assign var="iBargain" value=0}]


    	[{foreach key=iProdNr from=$articlelist item=product}]  
    	
    	[{if $iPos == 1}]
    	<tr>
	    	<td valign="top">
	    			[{include file="listproductItem.tpl"}]
	    	</td>
	    	[{assign var="iPos" value=2}]
    	[{elseif $iPos==2}]
			[{if $iOffer == 0 && $toparticle }]
		    	<td valign="listspecialitem" align="right">
				[{assign var="iOffer" value=1}]
				<!-- Top Angebot der Woche -->
						<table border="0" cellspacing="0" cellpadding="0" width="290">
						<tr>
						<td height="15"></td>
						</tr>
						<tr>
							<td class="listtophead" height="15" width="100%">&nbsp;&nbsp;&nbsp;Top Angebot der Woche</td>
						</tr>
						<tr>
						<td class="listtopmain">

							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							<td class="aktion" width="120">
								<a class="aktion" href="[{ $toparticle->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$toparticle->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $toparticle->oxarticles__oxtitle->value }]"></a>
							</td>
							<td class="aktion" valign="bottom">
								<table border="0" cellspacing="0" cellpadding="0">
								<tr>
								<td class="aktion" height="15">[{ $toparticle->oxarticles__oxtitle->value }]</td>
								<td class="aktion"></td>
								</tr>
								<tr>
								<td class="aktionhighlight" height="15"><b>Jetzt nur [{ $toparticle->fprice }] [{ $currency->sign}] !!</b></td>
								</tr>
								<tr>
									<td class="aktion" height="25">
										<table border="0" cellspacing="0" cellpadding="0">
										<tr>
										<td class="aktion" width="120"><a class="aktion" href="[{ $toparticle->oxdetaillink}]">mehr Infos</a></td>
										<td class="aktion"><a href="[{ $toparticle->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/tobasket_button.gif" alt="in den Warenkorb" border="0" hspace="0" vspace="0" align="right"></a>&nbsp;&nbsp;</td>
										</tr>
										</table>
									</td>
								</tr>
								</table>
							</td>
							</tr>
							</table>
						</td>
						</tr>
						</table>
		    	</td>
			   	</tr>
		    	<tr>
			    	<td valign="top">
			    			[{include file="listproductItem.tpl"}]
			    	</td>
			    	[{assign var="iPos" value=2}]
			[{elseif $iBargain == 0 && $articlebargain}]
		    	<td valign="top" align="right">
				[{assign var="iBargain" value=1}]
				<!-- Schnaeppchen -->
						<table border="0" cellspacing="0" cellpadding="0" width="290">
						<tr>
						<td height="15"></td>
						</tr>
						<tr>
							<td class="listtophead" height="15" width="100%">&nbsp;&nbsp;&nbsp;Schn&auml;ppchen</td>
						</tr>
						<tr>
						<td class="listtopmain">
						<br>
						Jetzt gibt es unseren Bestseller <a href="[{ $articlebargain->oxdetaillink}]" class="aktionhighlight">[{ $articlebargain->oxarticles__oxtitle->value }]</a> in der günstigen Sonderausgabe exklusiv bei oxid !<br>
						<br>
						Gleich <a href="[{ $articlebargain->tobasketlink }]&am=1" class="aktionhighlight">bestellen</a> !<br>
						<br>
						</td>
						</tr>
						</table>
		    	</td>
			   	</tr>
		    	<tr>
			    	<td valign="top">
			    			[{include file="listproductItem.tpl"}]
			    	</td>
			    	[{assign var="iPos" value=2}]
			[{else}]
	    	<td valign="top" align="right">
	    		[{include file="listproductItem.tpl"}]
	    	</td>
		   	</tr>
		   	[{assign var="iPos" value=1}]
			[{/if}]
    	[{/if}]

    	<!-- ende zeile -->
    	[{/foreach}] 
        
        <!-- fehlende ausgleichen -->
    	[{if $iPos == 2}]
    	<td></td>
    	</tr>
    	[{/if}]

    [{/if}]
	</table>

	<br><br>
    
    [{ if $pageNavigation->NrOfPages > 1  }]
	    <table border="0" cellspacing="0" cellpadding="0" width="100%">
	
	    <tr>
	    <td class="pagenavigation">
	    [{ if $pageNavigation->previousPage }]<a href="[{ $pageNavigation->previousPage }]" class="defaultcontent"><b>Seite zur&uuml;ck</b></a>&nbsp;&nbsp;[{/if}]
	    [{ if $pageNavigation->nextPage }]<a href="[{ $pageNavigation->nextPage }]" class="defaultcontent"><b>n&auml;chste Seite</b></a>[{/if}]
	    </td>
	    <td class="pagenavigation" align="center">
	    Seite [{ $pageNavigation->actPage  }] von [{ $pageNavigation->NrOfPages  }]
	    </td>
	    [{ if $pageNavigation->changePage}]
	    <td class="pagenavigation" align="right" width="200">Seiten :
	    [{foreach key=iPage from=$pageNavigation->changePage item=page}]      
	    <a href="[{$page->url}]" class="defaultcontent"><b>[{$iPage}]</b></a>&nbsp;
	    [{/foreach}] 
	    </td>
	    [{/if}]
	    </tr>
	    </table>
    [{/if}]
	
	<br><br>
	
	</td>
    
    </tr>
    </table>
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
