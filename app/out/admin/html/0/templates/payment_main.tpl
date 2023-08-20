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
    <input type="hidden" name="cl" value="payment_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="payment_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxpayments__oxid]" value="[{ $oxid }]">

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
            <td class="edittext" width="70">
            Aktiv
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" name="editval[oxpayments__oxactiv]" value='1' [{if $edit->oxpayments__oxactiv->value == 1}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="100">
            Beschreibung
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxpayments__oxdesc->fldmax_length}]" name="editval[oxpayments__oxdesc]" value="[{$edit->oxpayments__oxdesc->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Preis Aufschlag
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxpayments__oxaddsum->fldmax_length}]" name="editval[oxpayments__oxaddsum]" value="[{$edit->oxpayments__oxaddsum->value }]">
                <select name="editval[oxpayments__oxaddsumtype]" class="editinput" [{include file="help.tpl" helpid=addsumtype}]>
                [{foreach from=$sumtype item=sum}]
                <option value="[{ $sum }]" [{ if $sum == $edit->oxpayments__oxaddsumtype->value}]SELECTED[{/if}]>[{ $sum }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Ab Bonitätsindex
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxpayments__oxfromboni->fldmax_length}]" name="editval[oxpayments__oxfromboni]" value="[{$edit->oxpayments__oxfromboni->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Felder
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="128" name="editval[oxpayments__oxvaldesc]" value="[{$edit->oxpayments__oxvaldesc->value}]" [{include file="help.tpl" helpid=selectlist_valdesc}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
            <input type="submit" class="edittext" name="save" value="[{if $oxid!=-1}]Speichern[{else}]Neu anlegen[{/if}]" onClick="Javascript:document.myedit.fnc.value='save'"">
            </td>
        </tr>
        </table>
    </td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left" width="50%">
    [{ if $oxid != "-1"}]

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Verfügbar in Gruppe
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Nicht verf&uuml;gbar in Gruppe
            </td>
        </tr>
        <tr>
            <td class="edittext">

                <select name="groups[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$edit->oGroups->aList item=group}]
                <option value="[{ $group->oxgroups__oxid->value }]">[{ $group->oxgroups__oxtitle->value }]</option>
                [{/foreach}]
                </select>

            </td>
            <td class="edittext">
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='removegroup';document.myedit.submit();"><b>==></b></a>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='addgroup';document.myedit.submit();"><b><==</b></a>&nbsp;&nbsp;&nbsp;
            </td>
            <td class="edittext">

                <select name="allgroups[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$allgroups->aList item=allgroupitem}]
                <option value="[{ $allgroupitem->oxgroups__oxid->value }]">[{ $allgroupitem->oxgroups__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>

        </tr>
        </table>
        [{ /if}]
    </td>

    </tr>
</table>


</td>
</tr>
</form>

[{include file="bottomnaviitem.tpl" navigation=payment}]
</table>
[{include file="bottomitem.tpl"}]
