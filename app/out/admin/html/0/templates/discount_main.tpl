[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<script type="text/javascript">
<!--
[{ if $updatelist == 1}]
    UpdateList('[{ $oxid }]');
[{ /if}]

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
    <input type="hidden" name="cl" value="discount_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="discount_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[discount__oxid]" value="[{ $oxid }]">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext">

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="120">
            Name
            </td>
            <td class="edittext" width="250">
            <input type="text" class="editinput" size="50" maxlength="[{$edit->oxdiscount__oxtitle->fldmax_length}]" name="editval[oxdiscount__oxtitle]" value="[{$edit->oxdiscount__oxtitle->value}]">
            </td>
        </tr>
        [{ if $oxid != "-1"}]
        <tr>
            <td class="edittext" width="120">
            Aktiv
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" name="editval[oxdiscount__oxactiv]" value='1' [{if $edit->oxdiscount__oxactiv->value == 1}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Aktiv (von-bis)
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="23" maxlength="[{$edit->oxdiscount__oxactivfrom->fldmax_length}]" name="editval[oxdiscount__oxactivfrom]" value="[{$edit->oxdiscount__oxactivfrom->value}]" [{include file="help.tpl" helpid=article_vonbis}]>(Von)<br>
            <input type="text" class="editinput" size="23" maxlength="[{$edit->oxdiscount__oxactivto->fldmax_length}]" name="editval[oxdiscount__oxactivto]" value="[{$edit->oxdiscount__oxactivto->value}]" [{include file="help.tpl" helpid=article_vonbis}]>(Bis)
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Ab Einkaufsmenge
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxdiscount__oxamount->fldmax_length}]" name="editval[oxdiscount__oxamount]" value="[{$edit->oxdiscount__oxamount->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Ab Einkaufspreis
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxdiscount__oxprice->fldmax_length}]" name="editval[oxdiscount__oxprice]" value="[{$edit->oxdiscount__oxprice->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" width="120">
            Kategorie
            </td>
            <td class="edittext">
                <select name="editval[oxdiscount__oxcatnid]" class="editinput" style="width:220px;">
                [{foreach from=$cattree->aList item=pcat}]
                <option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        
        <tr>
            <td class="edittext" width="120">
            Artikel
            </td>
            <td class="edittext">
                <select name="editval[oxdiscount__oxartnid]" class="editinput" style="width:220px;">
                [{foreach from=$arttree item=pcat}]
                <option value="[{ $pcat->oxarticles__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxarticles__oxartnum->value }] [{ $pcat->oxarticles__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>
            <td class="edittext">aus Kategorie :
                <select name="artcat" class="editinput" onChange="Javascript:document.myedit.submit();">
                [{foreach from=$artcattree->aList item=pcat}]
                <option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="120">
            Benutzergruppe
            </td>
            <td class="edittext">
                <select name="editval[oxdiscount__oxusergroupid]" class="editinput" style="width:220px;">
                [{foreach from=$grouptree->aList item=pcat}]
                <option value="[{ $pcat->oxgroups__oxid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxgroups__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="120">
            Benutzer
            </td>
            <td class="edittext">
                <select name="editval[oxdiscount__oxuserid]" class="editinput" style="width:220px;">
                [{foreach from=$usertree->aList item=pcat}]
                <option value="[{ $pcat->oxuser__oxid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxuser__oxfname->value }] [{ $pcat->oxuser__oxlname->value }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        <tr>
            <td class="edittext" height="30">
            Rabatt
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxdiscount__oxaddsum->fldmax_length}]" name="editval[oxdiscount__oxaddsum]" value="[{$edit->oxdiscount__oxaddsum->value }]">
                <select name="editval[oxdiscount__oxaddsumtype]" class="editinput" [{include file="help.tpl" helpid=addsumtype}]>
                [{foreach from=$sumtype item=sum}]
                <option value="[{ $sum }]" [{ if $sum == $edit->oxdiscount__oxaddsumtype->value}]SELECTED[{/if}]>[{ $sum }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        [{ /if}]
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
            <input type="submit" class="edittext" name="save" value="[{if $oxid!=-1}]Speichern[{else}]Neu anlegen[{/if}]" onClick="Javascript:document.myedit.fnc.value='save'""><br>
            </td>
        </tr>
        </table>
    </td>
    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=discount}]
</table>
[{include file="bottomitem.tpl"}]
