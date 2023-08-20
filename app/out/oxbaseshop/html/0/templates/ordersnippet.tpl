    <td class="defaultcontent" width="30"></td>
    <td class="defaultcontent" align="left" width="160">
    <br>
    [{ if $toparticle }]
    [{include file="topoffer_item.tpl" product=$toparticle}]
    [{ /if }]
<br><br>
[{ if $similarlist }]
    <br>
    <br>
    <br>
<table border="0" cellspacing="0" cellpadding="0" width="150">
<tr>
<td class="aktionhead" width="1"></td>
<td class="aktionhead" align="center" height="15">&Auml;hnliche Produkte</td>
<td class="aktionhead" width="1"></td>
</tr>
<tr>
<td class="aktionhead" width="1"></td>
<td class="aktionmain">
[{foreach from=$similarlist item=simproduct}]  
[{include file="crosssellproductItem.tpl" product=$simproduct}]
[{/foreach}] 
</td>
<td class="aktionhead" width="1"></td>
</tr>
<tr>
<td class="aktionhead" height="1"></td>
<td class="aktionhead" height="1"></td>
<td class="aktionhead" height="1"></td>
</tr>
</table>
[{/if}]
<br>
    </td>
