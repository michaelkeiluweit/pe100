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
    <input type="hidden" name="cl" value="user_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="user_main">
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
    
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="90">
            Aktiv
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" name="editval[oxuser__oxactiv]" value='1' [{if $edit->oxuser__oxactiv->value == 1}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Rechte 
            </td>
            <td class="edittext">
                <select name="editval[oxuser__oxrights]" class="editinput">
                [{foreach from=$rights item=shopitem}] 
            	<option value="[{ $shopitem->id }]" [{ if $shopitem->selected}]SELECTED[{/if}]>[{ $shopitem->name }]</option>
                [{/foreach}] 
                </select>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            eMail/Login
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxuser__oxusername->fldmax_length}]" name="editval[oxuser__oxusername]" value="[{$edit->oxuser__oxusername->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Passwort
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxuser__oxpassword->fldmax_length}]" name="editval[oxuser__oxpassword]" value="[{$edit->oxuser__oxpassword->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Kundennr.
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxuser__oxcustnr->fldmax_length}]" name="editval[oxuser__oxcustnr]" value="[{$edit->oxuser__oxcustnr->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Anrede
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxuser__oxsal->fldmax_length}]" name="editval[oxuser__oxsal]" value="[{$edit->oxuser__oxsal->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Vor/Nachname
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="10" maxlength="[{$edit->oxuser__oxfname->fldmax_length}]" name="editval[oxuser__oxfname]" value="[{$edit->oxuser__oxfname->value }]">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxuser__oxlname->fldmax_length}]" name="editval[oxuser__oxlname]" value="[{$edit->oxuser__oxlname->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Firma
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxuser__oxcompany->fldmax_length}]" name="editval[oxuser__oxcompany]" value="[{$edit->oxuser__oxcompany->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Str./Hausnr.
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxuser__oxstreet->fldmax_length}]" name="editval[oxuser__oxstreet]" value="[{$edit->oxuser__oxstreet->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            PLZ Ort
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="5" maxlength="[{$edit->oxuser__oxzip->fldmax_length}]" name="editval[oxuser__oxzip]" value="[{$edit->oxuser__oxzip->value }]">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxuser__oxcity->fldmax_length}]" name="editval[oxuser__oxcity]" value="[{$edit->oxuser__oxcity->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            zus. Info
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxuser__oxaddinfo->fldmax_length}]" name="editval[oxuser__oxaddinfo]" value="[{$edit->oxuser__oxaddinfo->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Land
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxuser__oxcountry->fldmax_length}]" name="editval[oxuser__oxcountry]" value="[{$edit->oxuser__oxcountry->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Telefon
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxuser__oxfon->fldmax_length}]" name="editval[oxuser__oxfon]" value="[{$edit->oxuser__oxfon->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fax
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxuser__oxfax->fldmax_length}]" name="editval[oxuser__oxfax]" value="[{$edit->oxuser__oxfax->value }]">
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
    <td width="35">
    <img src="[{ $shop->imagedir }]/greyline_vert.gif" width="2" height="270" alt="" border="0">
    </td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left" width="50%">
	[{ if $oxid != "-1"}]
	
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            In Gruppe
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Alle Gruppen
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

[{include file="bottomnaviitem.tpl" navigation=user}] 
</table>
[{include file="bottomitem.tpl"}]         
