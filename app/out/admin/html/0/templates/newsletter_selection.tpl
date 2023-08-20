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

var newWind;
function OpenSendWindow()
{
	newWind = window.open('[{$shop->selflink}]?cl=newsletter_send&sid=[{$shop->sid}]&user=[{$user}]&id=[{ $oxid }]&iStart=0', 'Newsletter',"width=200,height=70,left=100,top=100, resizable=yes,scrollbars=no");
	newWind.opener = self;	
	newWind.focus();
}

//-->
</script>


<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="newsletter_selection">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="newsletter_selection">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxnewsletter__oxid]" value="[{ $oxid }]">

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
            <td class="edittext">
            Benutzte Gruppen :
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
	
    
    </td>

    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left">
	<br>
	<b>Selektierte Mail Empf&auml;nger : [{ $user }]</b>
	<br>
	<br>
	<br>
	[{ if $user }]
	<a href="JavaScript:OpenSendWindow();" class="highlight">-- Newsletter senden --</a>
	[{ /if }]
    </td>
    </tr>
</table>


</td>
</tr>
</form>

[{include file="bottomnaviitem.tpl" navigation=newsletter}] 
</table>
[{include file="bottomitem.tpl"}]         
