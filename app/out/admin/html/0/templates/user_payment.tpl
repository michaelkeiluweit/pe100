[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_bank">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="user_payment">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxuserpayments__oxid]" value="[{ $oxpaymentid }]">
<input type="hidden" name="editval[oxuserpayments__oxuserid]" value="[{ $oxid }]">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left" width="50%">
    [{ if $oxid != "-1"}]
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Zahlungsarten :
            </td>
        </tr>
        <tr>
            <td class="edittext">
                <select name="oxpaymentid" class="editinput" style="width:320px;" onChange="document.myedit.submit();">
					<option value="-1">Neue Zahlmethode</option>
                    [{foreach from=$edituser->oPayments->aList item=payment}]
                    <option value="[{ $payment->oxuserpayments__oxid->value }]" [{ if $payment->selected}]SELECTED[{/if}]>[{ $payment->oxpayments__oxdesc->value }]</option>
                    [{/foreach}]
                </select>
            </td>

        </tr>
        </table>
    [{ /if}]
    </td>
    <td width="35">
    <img src="[{ $shop->imagedir }]/greyline_vert.gif" width="2" height="300" alt="" border="0">
    </td>
    <td valign="top" class="edittext">

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="70">
            Methodentyp
            </td>
            <td class="edittext">
                <select name="editval[oxuserpayments__oxpaymentsid]" class="editinput">
                    [{foreach from=$paymenttypes item=payment}]
                    <option value="[{ $payment->oxpayments__oxid->value }]" [{ if $payment->selected}]SELECTED[{/if}]>[{ $payment->oxpayments__oxdesc->value }]</option>
                    [{/foreach}]
                </select>
            </td>
        </tr>
        <!--tr>
            <td class="edittext" width="70">
            Wert
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxuserpayments__oxvalue->fldmax_length}]" name="editval[oxuserpayments__oxvalue]" value="[{$edit->oxuserpayments__oxvalue->value }]">
            </td>
        </tr-->
        [{foreach from=$edit->aDynValues item=value}]
        <tr>
            <td class="edittext" width="70">
            [{ $value->name}]
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="64" name="dynvalue[[{$value->name}]]" value="[{ $value->value}]">
            </td>
        </tr>
        [{/foreach}]
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
            <input type="submit" class="edittext" name="save" value="Speichern" onClick="Javascript:document.myedit.fnc.value='save'"">
            [{ if $oxpaymentid != "-1"}]
                <input type="submit" class="edittext" name="save" value="Löschen" onClick="Javascript:document.myedit.fnc.value='delpayment'"">
            [{/if}]
            </td>
        </tr>
        </table>

    </td>

</tr>
</table>

</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=user}]
</table>
[{include file="bottomitem.tpl"}]
