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
    <input type="hidden" name="cl" value="usergroup_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="usergroup_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxgroups__oxid]" value="[{ $oxid }]">

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
            <input class="edittext" type="checkbox" name="editval[oxgroups__oxactiv]" value='1' [{if $edit->oxgroups__oxactiv->value == 1}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="100">
            Beschreibung
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxgroups__oxtitle->fldmax_length}]" name="editval[oxgroups__oxtitle]" value="[{$edit->oxgroups__oxtitle->value}]">
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
            Mitglieder in Gruppe
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Alle Mitglieder
            </td>
        </tr>
        <tr>
            <td class="edittext">

                <select name="members[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$members->aList item=member}]
                <option value="[{ $member->oxuser__oxid->value }]">[{ $member->oxuser__oxfname->value }] [{ $member->oxuser__oxlname->value }]</option>
                [{/foreach}]
                </select>

            </td>
            <td class="edittext">
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='removeuser';document.myedit.submit();"><b>==></b></a>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='adduser';document.myedit.submit();"><b><==</b></a>&nbsp;&nbsp;&nbsp;
            </td>
            <td class="edittext">

                <select name="allusers[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$users->aList item=alluseritem}]
                <option value="[{ $alluseritem->oxuser__oxid->value }]">[{ $alluseritem->oxuser__oxfname->value }] [{ $alluseritem->oxuser__oxlname->value }]</option>
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

[{include file="bottomnaviitem.tpl" navigation=usergroups}]
</table>
[{include file="bottomitem.tpl"}]
