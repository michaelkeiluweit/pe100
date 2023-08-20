[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<script type="text/javascript">
<!--
function EditThis( sID)
{
    parent.edit.document.transfer.oxid.value=sID;
    parent.edit.document.transfer.cl.value='[{ $default_edit }]';
    parent.edit.transfer.submit();

    document.search.oxid.value=sID;
    document.search.actedit.value=0;
    document.search.submit();
}

function DeleteThis( sID)
{
    blCheck = confirm("Wollen Sie diesen Eintrag wirklich löschen ?");
    if( blCheck == true)
    {   document.search.oxid.value=sID;
        document.search.fnc.value='deleteentry';
        document.search.actedit.value=0;
        document.search.submit();

        parent.edit.document.transfer.oxid.value='-1';
        parent.edit.document.transfer.cl.value='[{ $default_edit }]';
        parent.edit.transfer.submit();
    }
}

function ChangeEditBar( sLocation, sPos)
{
    document.search.actedit.value=sPos;
    document.search.submit();
    parent.edit.document.forms['transfer'].cl.value=sLocation;
    parent.edit.transfer.submit();
}

function ChangeLanguage()
{
    document.search.language.value=document.search.changelang.value;
    document.search.actedit.value=1;
    document.search.oxid.value='-1';
    document.search.submit();
    
    parent.edit.document.transfer.oxid.value='-1';
    parent.edit.document.transfer.cl.value='article_main';
    parent.edit.transfer.submit();
}

//-->
</script>

<div id="liste">
<table cellspacing="0" cellpadding="0" border="0" width="760">
<form name="search" id="search" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="cl" value="article_list">
    <input type="hidden" name="lstrt" value="[{ $lstrt }]">
    <input type="hidden" name="sort" value="[{ $sort }]">
    <input type="hidden" name="actedit" value="[{ $actedit }]">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="language" value="[{ $actlang }]">
<tr class="listitem">
<td height="4"></td>
</tr>
<tr class="listitem">
    <td valign="top" class="listitem" height="20">
    <input class="listedit" type="text" size="20" maxlength="128" name="where[oxarticles.oxartnum]" value="[{ $where->oxarticles__oxartnum }]">
    </td>
    <td valign="top" class="listitem">
    <input class="listedit" type="text" size="30" maxlength="128" name="where[oxarticles.oxtitle]" value="[{ $where->oxarticles__oxtitle }]">
    </td>
    <td valign="top" class="listitem">
    <input class="listedit" type="text" size="30" maxlength="128" name="where[oxarticles.oxshortdesc]" value="[{ $where->oxarticles__oxshortdesc }]">
    </td>
    <td valign="top" class="listitem" height="20">
    <select name="changelang" class="editinput" onChange="Javascript:ChangeLanguage();">
    [{foreach from=$languages item=lang}]
    <option value="[{ $lang->id }]" [{ if $lang->selected}]SELECTED[{/if}]>[{ $lang->name }]</option>
    [{/foreach}]
    </select>
    </td>
    <td valign="top" class="listitem">
    <input class="listedit" type="submit" name="submitit" value="Suchen">
    </td>
</tr>
<tr class="listitem">
<td height="4"></td>
</tr>
<tr>
    <td class="listheader" height="15">&nbsp;&nbsp;&nbsp;<a href="Javascript:document.search.sort.value='oxarticles.oxartnum';document.search.submit();" class="listheader">Art. Nr.</a></td>
    <td class="listheader">&nbsp;&nbsp;&nbsp;<a href="Javascript:document.search.sort.value='oxarticles.oxtitle';document.search.submit();" class="listheader">Titel</a></td>
    <td class="listheader">&nbsp;&nbsp;&nbsp;<a href="Javascript:document.search.sort.value='oxarticles.oxshortdesc';document.search.submit();" class="listheader">Kurz Beschreibung</a></td>
    <td class="listheader">&nbsp;</td>
    <td class="listheader">&nbsp;</td>
</tr>

[{assign var="blWhite" value=""}]
[{foreach from=$mylist item=listitem}]
<tr>
    [{ if $listitem->blacklist == 1}]
        [{assign var="listclass" value=listitem3 }]
    [{ else}]
        [{assign var="listclass" value=listitem$blWhite }]
    [{ /if}]
    [{ if $listitem->oxarticles__oxid->value == $oxid }]
        [{assign var="listclass" value=listitem4 }]
    [{ /if}]
    <td valign="top" class="[{ $listclass}]" height="15"><a href="Javascript:EditThis('[{ $listitem->oxarticles__oxid->value}]');" class="[{ $listclass}]">[{ $listitem->oxarticles__oxartnum->value }]</a></td>
    <td valign="top" class="[{ $listclass}]"><a href="Javascript:EditThis('[{ $listitem->oxarticles__oxid->value }]');" class="[{ $listclass}]">[{ if !$listitem->oxarticles__oxtitle->value }]- no title -[{else}][{ $listitem->oxarticles__oxtitle->value|string_format:"%.40s"|strip_tags }][{/if}]</a></td>
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
</table><img src="[{$shop->imagedir}]/greydot.gif" width="760" height="1" alt="" border="0" align="top" hspace="0" vspace="0">[{ if $iListFillsize > 0}]<img src="[{$shop->imagedir}]/whitedot.gif" width="760" height="[{ $iListFillsize}]" alt="" border="0" align="top">[{ /if}][{include file="pagenavisnippet.tpl"}]
<table cellspacing="0" cellpadding="0" border="0">
<tr>
[{foreach from=$editnavi item=edit}]
[{ if $edit->pos == $actedit}]
<td background="[{$shop->imagedir}]/navedit_high.gif" width="63" class="editnavigation" align="middle" height="17">
[{else}]
<td background="[{$shop->imagedir}]/navedit_low.gif" width="63" class="editnavigation" align="middle" height="17">
[{/if}]
[{ if $oxid != "-1"}]
<a href="Javascript:ChangeEditBar( '[{ $edit->location }]', [{ $edit->pos }]);" class="editnavigation">
[{/if}]
[{ $edit->name }]
[{ if $oxid != "-1"}]
</a>
[{/if}]
</td>
[{/foreach}]
<td class="editnavigation" align="middle" width="[{$navilinesize}]" background="[{$shop->imagedir}]/navedit_line.gif"></td>
</tr>
</table></form></div>
[{include file="bottomitem.tpl"}]
