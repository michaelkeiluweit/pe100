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
    <input type="hidden" name="cl" value="shop_licence">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="shop_licence">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxuser__oxid]" value="[{ $oxid }]">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext" width="50%">

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="120">
            Seriennummer
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxserial->fldmax_length}]" name="editval[oxshops__oxserial]" value="[{$edit->oxshops__oxserial->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" width="130">
            Shopping Mall :
            </td>
            <td class="edittext">
            <input class="edittext" disabled type="checkbox" value='1' [{if $ismall}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="130">
            Newsletter Modul
            </td>
            <td class="edittext">
            <input class="edittext" disabled type="checkbox" value='1' [{if $isnewsletter}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="130">
            Varianten Modul
            </td>
            <td class="edittext">
            <input class="edittext" disabled type="checkbox" value='1' [{if $isvarianten}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="130">
            Bewertungen Modul
            </td>
            <td class="edittext">
            <input class="edittext" disabled type="checkbox" value='1' [{if $isreview}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext" width="130">
            Zusatzverkaufs Modul
            </td>
            <td class="edittext">
            <input class="edittext" disabled type="checkbox" value='1' [{if $addsales}]checked[{/if}]>
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
    <td valign="top" class="edittext" align="left">
        Sie k&ouml;nnen jederzeit Ihren bestehenden Shop um diese Module erweitern - <b>ohne Neuinstallation oder Aufwand</b> !<br>
        <br>
        Ein Anruf gen&uuml;gt - <b>0800 0999444</b> .<br>
    </td>
    </tr>
</table>


</td>
</tr>
</form>

[{include file="bottomnaviitem.tpl" navigation=shop}]
</table>
[{include file="bottomitem.tpl"}]
