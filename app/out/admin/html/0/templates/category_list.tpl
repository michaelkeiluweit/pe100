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
    {    document.search.oxid.value=sID;
        document.search.fnc.value='deleteentry';
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
    parent.edit.document.transfer.cl.value='category_main';
    parent.edit.transfer.submit();

}

//-->
</script>

<div id="liste">
<table cellspacing="0" cellpadding="0" border="0" width="760">
<form name="search" id="search" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="cl" value="category_list">
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
    <input class="listedit" type="text" size="5" maxlength="128" name="where[oxcategories.oxorder]" value="[{ $where->oxcategories__oxorder }]">
    </td>
    <td valign="top" class="listitem" height="20">
    <input class="listedit" type="text" size="50" maxlength="128" name="where[oxcategories.oxtitle]" value="[{ $where->oxcategories__oxtitle }]">
    </td>
    <td valign="top" class="listitem" height="20">
        <select name="where[oxcategories.oxparentid]" class="editinput" onChange="Javascript:document.search.submit();">
        [{foreach from=$cattree->aList item=pcat}]
        <option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
        [{/foreach}]
        </select>
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
    <td class="listheader" height="15">&nbsp;&nbsp;&nbsp;<a href="Javascript:document.search.sort.value='oxcategories.oxorder';document.search.submit();" class="listheader">Sortierung</a></td>
    <td class="listheader" height="15"><a href="Javascript:document.search.sort.value='oxcategories.oxtitle';document.search.submit();" class="listheader">Titel</a></td>
    <td class="listheader">&nbsp;</td>
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
    <td valign="top" class="[{ $listclass}]" height="15" align="center"><a href="Javascript:EditThis('[{ $listitem->oxcategories__oxid->value}]');" class="[{ $listclass}]">[{ $listitem->oxcategories__oxorder->value }]</a></td>
    <td valign="top" class="[{ $listclass}]" height="15"><a href="Javascript:EditThis('[{ $listitem->oxcategories__oxid->value}]');" class="[{ $listclass}]">[{ $listitem->oxcategories__oxtitle->value }]</a></td>
    <td class="[{ $listclass}]">&nbsp;</td>
    <td class="[{ $listclass}]">&nbsp;</td>
    <td class="[{ $listclass}]"><a href="Javascript:DeleteThis('[{ $listitem->oxcategories__oxnid->value }]');" class="[{ $listclass}]"><img src="[{$shop->imagedir}]/delete_button.gif" hspace="0" vspace="0" border="0" align="middle" alt="" [{include file="help.tpl" helpid=item_delete}]></a></td>
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
