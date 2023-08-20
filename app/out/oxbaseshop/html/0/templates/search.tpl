[{include file="headitem.tpl" title="oxid - eSales f&uuml;r Morgen"}]
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
    [{ if !$pageNavigation->iArtCnt  }]
    Leider keine Artikel gefunden.<br>
    [{/if}]
    [{ if $pageNavigation->NrOfPages > 1  }]
	Es wurden [{ $pageNavigation->iArtCnt }] Artikel gefunden.<br>
	<br>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
    <td class="searchpagenavigation">
    [{ if $pageNavigation->previousPage }]<a href="[{ $pageNavigation->previousPage }]" class="searchpagenavigation">zur&uuml;ck</a>&nbsp;&nbsp;[{/if}]
    [{ if $pageNavigation->nextPage }]<a href="[{ $pageNavigation->nextPage }]" class="searchpagenavigation">n&auml;chste</a>[{/if}]
    </td>
    <td class="searchpagenavigation" align="center">
    Seite [{ $pageNavigation->actPage  }] von [{ $pageNavigation->NrOfPages  }]
    </td>
    [{ if $pageNavigation->changePage}]
    <td class="searchpagenavigation" align="right" width="200">Seiten :
    [{foreach key=iPage from=$pageNavigation->changePage item=page}]      
    <a href="[{$page}]" class="searchpagenavigation">[{$iPage}]</a>&nbsp;
    [{/foreach}][{if $morepages}]...[{/if}]
    </td>
    [{/if}]
    </tr>
    </table>
    <br><br>
    [{/if}]
	
	[{if isset($articlelist) }]
        <table border="0" cellspacing="0" cellpadding="5">
    	[{foreach from=$articlelist item=product}]  
    	<tr>
    	<td valign="top" class="defaultcontent">
        [{include file="searchproductItem.tpl"}]
    	</td>
        </tr>
    	[{/foreach}] 
        </table>
    [{/if}]
    
    [{ if $pageNavigation->NrOfPages > 1  }]
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
    <td class="searchpagenavigation">
    [{ if $pageNavigation->previousPage }]<a href="[{ $pageNavigation->previousPage }]" class="searchpagenavigation">zur&uuml;ck</a>&nbsp;&nbsp;[{/if}]
    [{ if $pageNavigation->nextPage }]<a href="[{ $pageNavigation->nextPage }]" class="searchpagenavigation">n&auml;chste</a>[{/if}]
    </td>
    <td class="searchpagenavigation" align="center">
    Seite [{ $pageNavigation->actPage  }] von [{ $pageNavigation->NrOfPages  }]
    </td>
    [{ if $pageNavigation->changePage}]
    <td class="searchpagenavigation" align="right" width="200">Seiten :
    [{foreach key=iPage from=$pageNavigation->changePage item=page}]      
    <a href="[{$page}]" class="searchpagenavigation">[{$iPage}]</a>&nbsp;
    [{/foreach}][{if $morepages}]...[{/if}]
    </td>
    [{/if}]
    </tr>
    </table>
    <br><br>
    [{/if}]
    </td>
    [{include file="aktionitem.tpl"}]
    </tr>
    </table>
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
