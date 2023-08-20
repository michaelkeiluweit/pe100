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
    <input type="hidden" name="cl" value="category_order">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="category_order">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[category__oxid]" value="[{ $oxid }]">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext" align="left">
    [{ if $oxid != "-1"}]

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Aktuelle Sortierung
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Neue Sortierung
            </td>
        </tr>
        <tr>
            <td class="edittext">

                <select name="artinthiscat[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$artthisincat item=allitem}]
                <option value="[{ $allitem->oxarticles__oxnid->value }]">[{ $allitem->oxarticles__oxartnum->value }] [{ $allitem->oxarticles__oxtitle->value }]</option>
                [{/foreach}]
                </select>

            </td>
            <td class="edittext">
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='repositionarticle';document.myedit.submit();"><b>==></b></a>&nbsp;&nbsp;&nbsp;<br>
            </td>
            <td class="edittext">

                <select name="neworder[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$neworder item=allitem}]
                <option value="[{ $allitem->oxarticles__oxnid->value }]" SELECTED>[{ $allitem->oxarticles__oxartnum->value }] [{ $allitem->oxarticles__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>

        </tr>
        <tr>
            <td class="edittext">
            (max. 1000 Eintr. angezeigt)
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            (max. 1000 Eintr. angezeigt)
            </td>
        </tr>
        </table>
        [{ /if}]

    </td>
    [{ if $allorderassigned }]
    <td valign="top" class="edittext" align="left">
    <br>
    <input type="submit" class="edittext" name="save" value="Neue Sortierung abspeichern" onClick="Javascript:document.myedit.fnc.value='saveneworder'""><br>
    </td>
    [{ /if }]
    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=category}]
</table>
[{include file="bottomitem.tpl"}]
