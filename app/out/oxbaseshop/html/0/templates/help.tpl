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
    <td class="defaultcontent" width="30"></td>
    <td class="defaultcontent">
    <br>
    &nbsp;&nbsp;[{foreach from=$actCatpath item=oCatPath}]<a href="[{$oCatPath->link}]" class="list_catpath">[{ $oCatPath->oxcategories__oxtitle->value }]</a><span class="list_catpath">/</span>[{/foreach}]<br>
    <br>
    
    [{$helptext }]
    
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
