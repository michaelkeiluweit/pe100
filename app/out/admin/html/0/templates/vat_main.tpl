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
    <input type="hidden" name="cl" value="vat_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="vat_main">
<input type="hidden" name="fnc" value="save">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxdiscount__oxid]" value="[{ $oxid }]">
<input type="hidden" name="editval[oxdiscount__oxtype]" value="v">

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
            <td class="edittext" width="120">
            </td>
            <td class="edittext"><br>
			Wenn Sie einem Artikel eine spezielle Mwst. geben wollen, <br>
			so k&ouml;nnen Sie dies direkt in der Artikel Maske eingeben.<br>
			<br>
            </td>
        </tr>
        <tr>
            <td class="edittext" height="30">
            Mwst.
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxdiscount__oxaddsum->fldmax_length}]" name="editval[oxdiscount__oxaddsum]" value="[{$edit->oxdiscount__oxaddsum->value }]">
            <input type="hidden" name="editval[oxdiscount__oxaddsumtype]" value="%">
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

[{include file="bottomnaviitem.tpl" navigation=vat}]
</table>
[{include file="bottomitem.tpl"}]
