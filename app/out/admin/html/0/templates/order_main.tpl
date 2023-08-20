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
    <input type="hidden" name="cl" value="order_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="order_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxorder__oxid]" value="[{ $oxid }]">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext">
	
		<b>Rechnungsadresse :</b><br>
		<br>
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Anrede
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxorder__oxbillsal->fldmax_length}]" name="editval[oxorder__oxbillsal]" value="[{$edit->oxorder__oxbillsal->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Name
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="10" maxlength="[{$edit->oxorder__oxbillfname->fldmax_length}]" name="editval[oxorder__oxbillfname]" value="[{$edit->oxorder__oxbillfname->value }]">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxorder__oxbilllname->fldmax_length}]" name="editval[oxorder__oxbilllname]" value="[{$edit->oxorder__oxbilllname->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Firma
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxbillcompany->fldmax_length}]" name="editval[oxorder__oxbillcompany]" value="[{$edit->oxorder__oxbillcompany->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Strasse
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxbillstreet->fldmax_length}]" name="editval[oxorder__oxbillstreet]" value="[{$edit->oxorder__oxbillstreet->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            PLZ Ort
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="5" maxlength="[{$edit->oxorder__oxbillzip->fldmax_length}]" name="editval[oxorder__oxbillzip]" value="[{$edit->oxorder__oxbillzip->value }]">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxorder__oxbillcity->fldmax_length}]" name="editval[oxorder__oxbillcity]" value="[{$edit->oxorder__oxbillcity->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            zus. Info
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxbilladdinfo->fldmax_length}]" name="editval[oxorder__oxbilladdinfo]" value="[{$edit->oxorder__oxbilladdinfo->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Land
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxbillcountry->fldmax_length}]" name="editval[oxorder__oxbillcountry]" value="[{$edit->oxorder__oxbillcountry->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fon
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="12" maxlength="[{$edit->oxorder__oxbillfon->fldmax_length}]" name="editval[oxorder__oxbillfon]" value="[{$edit->oxorder__oxbillfon->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fax
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="12" maxlength="[{$edit->oxorder__oxbillfax->fldmax_length}]" name="editval[oxorder__oxbillfax]" value="[{$edit->oxorder__oxbillfax->value }]">
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

		<b>Lieferadresse :</b><br>
		<br>
		
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Anrede
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxorder__oxdelsal->fldmax_length}]" name="editval[oxorder__oxdelsal]" value="[{$edit->oxorder__oxdelsal->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Name
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="10" maxlength="[{$edit->oxorder__oxdelfname->fldmax_length}]" name="editval[oxorder__oxdelfname]" value="[{$edit->oxorder__oxdelfname->value }]">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxorder__oxdellname->fldmax_length}]" name="editval[oxorder__oxdellname]" value="[{$edit->oxorder__oxdellname->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Firma
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxdelcompany->fldmax_length}]" name="editval[oxorder__oxdelcompany]" value="[{$edit->oxorder__oxdelcompany->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Strasse
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxdelstreet->fldmax_length}]" name="editval[oxorder__oxdelstreet]" value="[{$edit->oxorder__oxdelstreet->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            PLZ Ort
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="5" maxlength="[{$edit->oxorder__oxdelzip->fldmax_length}]" name="editval[oxorder__oxdelzip]" value="[{$edit->oxorder__oxdelzip->value }]">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxorder__oxdelcity->fldmax_length}]" name="editval[oxorder__oxdelcity]" value="[{$edit->oxorder__oxdelcity->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            zus. Info
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxdeladdinfo->fldmax_length}]" name="editval[oxorder__oxdeladdinfo]" value="[{$edit->oxorder__oxdeladdinfo->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Land
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxorder__oxdelcountry->fldmax_length}]" name="editval[oxorder__oxdelcountry]" value="[{$edit->oxorder__oxdelcountry->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fon
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="12" maxlength="[{$edit->oxorder__oxdelfon->fldmax_length}]" name="editval[oxorder__oxdelfon]" value="[{$edit->oxorder__oxdelfon->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fax
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="12" maxlength="[{$edit->oxorder__oxdelfax->fldmax_length}]" name="editval[oxorder__oxdelfax]" value="[{$edit->oxorder__oxdelfax->value }]">
            </td>
        </tr>
        </table>

    </td>


    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=order}]
</table>
[{include file="bottomitem.tpl"}]
