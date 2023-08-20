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
    <input type="hidden" name="cl" value="shop_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="shop_main">
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
    <td valign="top" class="edittext">
		[{if $oxid!=-1}]
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="130">
            Aktiv
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" name="editval[oxshops__oxactiv]" value='1' [{if $edit->oxshops__oxactiv->value == 1}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            Shop Name
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxname->fldmax_length}]" name="editval[oxshops__oxname]" value="[{$edit->oxshops__oxname->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            SMTP Server
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxsmtp->fldmax_length}]" name="editval[oxshops__oxsmtp]" value="[{$edit->oxshops__oxsmtp->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            SMTP Benutzer
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxsmtpuser->fldmax_length}]" name="editval[oxshops__oxsmtpuser]" value="[{$edit->oxshops__oxsmtpuser->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            SMTP Passwort
            </td>
            <td class="edittext">
            <input type="password" name="editval[oxshops__oxsmtppwd]" value="[{$edit->oxshops__oxsmtppwd->value}]" size="35" maxlength="[{$edit->oxshops__oxsmtppwd->fldmax_length}]" class="editinput">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            Info eMail
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxinfoemail->fldmax_length}]" name="editval[oxshops__oxinfoemail]" value="[{$edit->oxshops__oxinfoemail->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            BestellMail Reply
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxorderemail->fldmax_length}]" name="editval[oxshops__oxorderemail]" value="[{$edit->oxshops__oxorderemail->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            Bestellungen an
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxowneremail->fldmax_length}]" name="editval[oxshops__oxowneremail]" value="[{$edit->oxshops__oxowneremail->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            BestellMail Subject
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxordersubject->fldmax_length}]" name="editval[oxshops__oxordersubject]" value="[{$edit->oxshops__oxordersubject->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            RegistrierMail Subject
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxregistersubject->fldmax_length}]" name="editval[oxshops__oxregistersubject]" value="[{$edit->oxshops__oxregistersubject->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" >
            Vergess.Pwd.Mail Subject
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__oxforgotpwdsubject->fldmax_length}]" name="editval[oxshops__oxforgotpwdsubject]" value="[{$edit->oxshops__oxforgotpwdsubject->value}]">
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
		[{else}]
		Bitte Shop ausw&auml;hlen.
		[{/if}]
    </td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left">
    [{ if $oxid != "-1" && $ismall}]

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Alle verfügbaren Gruppen
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Shop ist in diesen Gruppen
            </td>
        </tr>
        <tr>
            <td class="edittext">

                <select name="allcat[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$allcat item=pcat}]
                <option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
                [{/foreach}]
                </select>

            </td>
            <td class="edittext">
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='addcat';document.myedit.submit();"><b>==></b></a>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='removecat';document.myedit.submit();"><b><==</b></a>&nbsp;&nbsp;&nbsp;
            </td>
            <td class="edittext">

                <select name="allartcat[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$allartcat item=pcat}]
                <option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
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

[{include file="bottomnaviitem.tpl" navigation=shop}]
</table>
[{include file="bottomitem.tpl"}]
