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
    <input type="hidden" name="cl" value="shop_extend">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="shop_extend">
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
            <td class="edittext" >
            Firmen Name
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxcompany->fldmax_length}]" name="editval[oxshops__oxcompany]" value="[{$edit->oxshops__oxcompany->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" width="100">
            Name
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="10" maxlength="[{$edit->oxshops__oxfname->fldmax_length}]" name="editval[oxshops__oxfname]" value="[{$edit->oxshops__oxfname->value }]">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxshops__oxlname->fldmax_length}]" name="editval[oxshops__oxlname]" value="[{$edit->oxshops__oxlname->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Strasse
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxshops__oxstreet->fldmax_length}]" name="editval[oxshops__oxstreet]" value="[{$edit->oxshops__oxstreet->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            PLZ Ort
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="5" maxlength="[{$edit->oxshops__oxzip->fldmax_length}]" name="editval[oxshops__oxzip]" value="[{$edit->oxshops__oxzip->value }]">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxshops__oxcity->fldmax_length}]" name="editval[oxshops__oxcity]" value="[{$edit->oxshops__oxcity->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Land
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxshops__oxcountry->fldmax_length}]" name="editval[oxshops__oxcountry]" value="[{$edit->oxshops__oxcountry->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Telefon
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxshops__oxtelefon->fldmax_length}]" name="editval[oxshops__oxtelefon]" value="[{$edit->oxshops__oxtelefon->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fax
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxshops__oxtelefax->fldmax_length}]" name="editval[oxshops__oxtelefax]" value="[{$edit->oxshops__oxtelefax->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            URL
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxshops__oxurl->fldmax_length}]" name="editval[oxshops__oxurl]" value="[{$edit->oxshops__oxurl->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            Bankname
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxbankname->fldmax_length}]" name="editval[oxshops__oxbankname]" value="[{$edit->oxshops__oxbankname->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            BLZ
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxbankcode->fldmax_length}]" name="editval[oxshops__oxbankcode]" value="[{$edit->oxshops__oxbankcode->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            Kto.Nr.
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxbanknumber->fldmax_length}]" name="editval[oxshops__oxbanknumber]" value="[{$edit->oxshops__oxbanknumber->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            Ust.ID
            </td>
            <td class="edittext">
            <input type="text" name="editval[oxshops__oxvatnumber]" value="[{$edit->oxshops__oxvatnumber->value}]" size="35" maxlength="[{$edit->oxshops__oxsmtppwd->fldmax_length}]" class="editinput">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
            <input type="submit" class="edittext" name="save" value="Speichern" onClick="Javascript:document.myedit.fnc.value='save'"">
            </td>
        </tr>
        </table>
    </td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left">
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="160">
            Aktive Kategorie beim Start&nbsp;
            </td>
            <td class="edittext">
                <select name="editval[oxshops__oxdefcat]" class="editinput">
                [{foreach from=$cattree->aList item=pcat}]
                <option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        </table>
	
	
    </td>
    </tr>
</table>


</td>
</tr>
</form>

[{include file="bottomnaviitem.tpl" navigation=shop}]
</table>
[{include file="bottomitem.tpl"}]
