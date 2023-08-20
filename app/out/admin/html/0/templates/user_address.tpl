[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}] 

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="user_address">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="user_address">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxaddress__oxid]" value="[{ $oxaddressid }]">
<input type="hidden" name="editval[oxaddress__oxuserid]" value="[{ $oxid }]">


<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
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
            Lieferadressen :
            </td>
        </tr>
        <tr>
            <td class="edittext">
            
                [{ if $edituser->oAddresses->aList}]
                <select name="oxaddressid" class="editinput" style="width:320px;" onChange="document.myedit.submit();">
					[{foreach from=$edituser->oAddresses->aList item=address}] 
	            	<option value="[{ $address->oxaddress__oxid->value }]" [{ if $address->selected}]SELECTED[{/if}]>[{ $address->oxaddress__oxfname->value }] [{ $address->oxaddress__oxlname->value }], [{ $address->oxaddress__oxstreet->value }], [{ $address->oxaddress__oxcity->value }]</option>
	                [{/foreach}] 
	            </select>
				[{else}]
                <select class="editinput" style="width:320px;">
	            	<option value="-1">Neue Adresse</option>
	            </select>
				[{/if}]
            
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
            <td class="edittext">
            Anrede
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="15" maxlength="[{$edit->oxuser__oxsal->fldmax_length}]" name="editval[oxaddress__oxsal]" value="[{$edit->oxaddress__oxsal->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Name
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="10" maxlength="[{$edit->oxaddress__oxfname->fldmax_length}]" name="editval[oxaddress__oxfname]" value="[{$edit->oxaddress__oxfname->value }]">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxaddress__oxlname->fldmax_length}]" name="editval[oxaddress__oxlname]" value="[{$edit->oxaddress__oxlname->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Firma
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxaddress__oxcompany->fldmax_length}]" name="editval[oxaddress__oxcompany]" value="[{$edit->oxaddress__oxcompany->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Strasse
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxaddress__oxstreet->fldmax_length}]" name="editval[oxaddress__oxstreet]" value="[{$edit->oxaddress__oxstreet->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            PLZ Ort
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="5" maxlength="[{$edit->oxaddress__oxzip->fldmax_length}]" name="editval[oxaddress__oxzip]" value="[{$edit->oxaddress__oxzip->value }]">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxaddress__oxcity->fldmax_length}]" name="editval[oxaddress__oxcity]" value="[{$edit->oxaddress__oxcity->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            zus. Info
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxaddress__oxaddinfo->fldmax_length}]" name="editval[oxaddress__oxaddinfo]" value="[{$edit->oxaddress__oxaddinfo->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Land
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="37" maxlength="[{$edit->oxaddress__oxcountry->fldmax_length}]" name="editval[oxaddress__oxcountry]" value="[{$edit->oxaddress__oxcountry->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fon
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="12" maxlength="[{$edit->oxaddress__oxfon->fldmax_length}]" name="editval[oxaddress__oxfon]" value="[{$edit->oxaddress__oxfon->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Fax
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="12" maxlength="[{$edit->oxaddress__oxfax->fldmax_length}]" name="editval[oxaddress__oxfax]" value="[{$edit->oxaddress__oxfax->value }]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
		    <input type="submit" class="edittext" name="save" value="Speichern" onClick="Javascript:document.myedit.fnc.value='save'"">
			[{ if $oxaddressid != "-1"}]
		    	<input type="submit" class="edittext" name="save" value="Löschen" onClick="Javascript:document.myedit.fnc.value='deladdress'"">
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
