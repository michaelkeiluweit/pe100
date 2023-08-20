[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<script type="text/javascript">
<!--
[{ if $updatelist == 1}]
    UpdateList('[{ $oxid }]');
[{ /if}]

function EditThis( sID)
{
    document.search.oxid.value=sID;
    document.search.cl.value='article_main';
    document.search.submit();

    parent.list.document.search.sort.value = '';
	parent.list.document.search.cl.value='article_list';
    parent.list.document.search.actedit.value=1;
    parent.list.document.search.submit();
}

function UpdateList( sID)
{
    parent.list.document.search.oxid.value=sID;
    parent.list.document.search.submit();
}

//-->
</script>


<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="order_article">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext">

<table cellspacing="0" cellpadding="0" border="0" width="700">
<form name="search" id="search" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="cl" value="article_main">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="fnc" value="">
<tr>
    <td class="listheader">Anzahl</td>
    <td class="listheader" height="15">&nbsp;&nbsp;&nbsp;Art. Nr.</td>
    <td class="listheader">&nbsp;&nbsp;&nbsp;Titel</td>
    <td class="listheader">&nbsp;&nbsp;&nbsp;Typ</td>
    <td class="listheader">&nbsp;&nbsp;&nbsp;Kurz Beschreibung</td>
    <td class="listheader">eNetto</td>
    <td class="listheader">eBrutto</td>
    <td class="listheader">Gesamt</td>
    <td class="listheader">Mwst.</td>
</tr>
[{assign var="blWhite" value=""}]
[{foreach from=$edit->oArticles->aList item=listitem}]
<tr>
    [{assign var="listclass" value=listitem$blWhite }]
    <td valign="top" class="[{ $listclass}]">[{ $listitem->oxorderarticles__oxamount->value }]</td>
    <td valign="top" class="[{ $listclass}]" height="15">[{if $listitem->oxarticles__oxid->value}]<a href="Javascript:EditThis('[{ $listitem->oxarticles__oxid->value}]');" class="[{ $listclass}]">[{/if}][{ $listitem->oxorderarticles__oxartnum->value }]</a></td>
    <td valign="top" class="[{ $listclass}]">[{if $listitem->oxarticles__oxid->value}]<a href="Javascript:EditThis('[{ $listitem->oxarticles__oxid->value }]');" class="[{ $listclass}]">[{/if}][{ $listitem->oxorderarticles__oxtitle->value|string_format:"%.20s"|strip_tags }]</a></td>
    <td valign="top" class="[{ $listclass}]">[{ $listitem->oxorderarticles__oxselvariant->value }]</td>
    <td valign="top" class="[{ $listclass}]">[{ $listitem->oxorderarticles__oxshortdesc->value|string_format:"%.20s"|strip_tags }]</td>
    <td valign="top" class="[{ $listclass}]">[{ $listitem->fnetprice }]</td>
    <td valign="top" class="[{ $listclass}]">[{ $listitem->fbrutprice }]</td>
    <td valign="top" class="[{ $listclass}]">[{ $listitem->ftotbrutprice }]</td>
    <td valign="top" class="[{ $listclass}]">[{ $listitem->oxorderarticles__oxvat->value}]</td>
</tr>
[{if $blWhite == "2"}]
[{assign var="blWhite" value=""}]
[{else}]
[{assign var="blWhite" value="2"}]
[{/if}]
[{/foreach}]
</table>
</form>

	<b>Gesamt : </b><br>
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td class="edittext" height="15">Netto</td>
	<td class="edittext"><b>[{ $edit->totalnetsum }] €</b></td>
	</tr>
	<tr>
	<td class="edittext" height="15">Brutto</td>
	<td class="edittext"><b>[{ $edit->totalbrutsum }] €</b></td>
	</tr>
	<tr>
	<td class="edittext" height="15">Versandkosten&nbsp;&nbsp;</td>
	<td class="edittext"><b>[{ $edit->oxorder__oxdelcost->value }] €</b></td>
	</tr>
	<tr>
	<td class="edittext" height="15">Zahlungsart Aufschlag&nbsp;&nbsp;</td>
	<td class="edittext"><b>[{ $edit->oxorder__oxpaycost->value }] €</b></td>
	</tr>
	</table>

    </td>

    </tr>
</table>

</td>
</tr>


[{include file="bottomnaviitem.tpl" navigation=order}]
</table>
[{include file="bottomitem.tpl"}]
