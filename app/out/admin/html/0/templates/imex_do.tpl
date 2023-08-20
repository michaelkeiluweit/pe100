[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<script type="text/javascript">
<!--

function ChangeEditBar( sLocation, sPos)
{
    document.search.actedit.value=sPos;
    document.search.submit();
    parent.edit.document.forms['transfer'].cl.value=sLocation;
    parent.edit.transfer.submit();
}

//-->
</script>
<form name="search" id="search" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="actedit" value="[{ $actedit }]">
    <input type="hidden" name="cl" value="imex_do">
	<input type="hidden" name="oxid" value="x">
</form>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="editnavigation" height="201">[{if $blFin}]Aktion beendet[{/if}]</td>
<td></td>
</tr>
</table>

<table cellspacing="0" cellpadding="0" border="0">
<tr>
[{foreach from=$editnavi item=edit}]
[{ if $edit->pos == $actedit}]
<td background="[{$shop->imagedir}]/navedit_high.gif" width="63" class="editnavigation" align="middle" height="17">
[{else}]
<td background="[{$shop->imagedir}]/navedit_low.gif" width="63" class="editnavigation" align="middle" height="17">
[{/if}]
<a href="Javascript:ChangeEditBar( '[{ $edit->location }]', [{ $edit->pos }]);" class="editnavigation">
[{ $edit->name }]
</a>
</td>
[{/foreach}]
<td class="editnavigation" align="middle" width="[{$navilinesize}]" background="[{$shop->imagedir}]/navedit_line.gif"></td>
</tr>
</table>

[{include file="bottomitem.tpl"}]
