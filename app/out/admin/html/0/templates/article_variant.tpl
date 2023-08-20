[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<script type="text/javascript">
<!--
function EditThis( sID)
{
    document.search.oxid.value=sID;
    document.search.cl.value='article_main';
    document.search.submit();

    parent.list.document.search.oxid.value = sID;
    parent.list.document.search.actedit.value=1;
    parent.list.document.search.submit();
}

function DeleteThis( sID)
{
    blCheck = confirm("Wollen Sie diese Variante wirklich löschen ?");
    if( blCheck == true)
    {   document.forms.search.oxid.value=sID;
        document.forms.search.fnc.value='deleteentry';
        document.forms.search.submit();
    }
}
//-->
</script>

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="article_variant">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%" align="center" class="edittext">
<br>
[{ if $oxparentid }]
<b>Variante von [{ $parentarticle->oxarticles__oxartnum->value }] [{ $parentarticle->oxarticles__oxtitle->value }]</b>
[{ /if}]

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="article_variant">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[article__oxid]" value="[{ $oxid }]">
<input type="hidden" name="voxid" value="[{ $oxid }]">
<input type="hidden" name="oxparentid" value="[{ $oxparentid }]">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="700">
<form name="search" id="search" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="cl" value="article_variant">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="fnc" value="">
<tr>
    <td class="listheader" height="15">&nbsp;&nbsp;&nbsp;Art. Nr.</td>
    <td class="listheader">&nbsp;&nbsp;&nbsp;Titel</td>
    <td class="listheader">&nbsp;&nbsp;&nbsp;Kurz Beschreibung</td>
    <td class="listheader">&nbsp;</td>
    <td class="listheader">&nbsp;</td>
</tr>
[{assign var="blWhite" value=""}]
[{foreach from=$mylist item=listitem}]
<tr>
    [{assign var="listclass" value=listitem$blWhite }]
    <td valign="top" class="[{ $listclass}]" height="15"><a href="Javascript:EditThis('[{ $listitem->oxarticles__oxid->value}]');" class="[{ $listclass}]">[{ $listitem->oxarticles__oxartnum->value }]</a></td>
    <td valign="top" class="[{ $listclass}]"><a href="Javascript:EditThis('[{ $listitem->oxarticles__oxid->value }]');" class="[{ $listclass}]">[{ if !$listitem->oxarticles__oxtitle->value }]- no title -[{else}][{ $listitem->oxarticles__oxtitle->value }][{/if}]</a></td>
    <td valign="top" class="[{ $listclass}]"><a href="Javascript:EditThis('[{ $listitem->oxarticles__oxid->value }]');" class="[{ $listclass}]">[{ $listitem->oxarticles__oxshortdesc->value|string_format:"%.30s"|strip_tags }]</a></td>
    <td valign="top" class="[{ $listclass}]"></td>
    <td class="[{ $listclass}]"><a href="Javascript:DeleteThis('[{ $listitem->oxarticles__oxnid->value }]');" class="[{ $listclass}]"><img src="[{$shop->imagedir}]/delete_button.gif" hspace="0" vspace="0" border="0" align="middle" alt="" [{include file="help.tpl" helpid=item_delete}]></a></td>
</tr>
[{if $blWhite == "2"}]
[{assign var="blWhite" value=""}]
[{else}]
[{assign var="blWhite" value="2"}]
[{/if}]
[{/foreach}]
</table>
</form>

</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=article}]
</table>
[{include file="bottomitem.tpl"}]
