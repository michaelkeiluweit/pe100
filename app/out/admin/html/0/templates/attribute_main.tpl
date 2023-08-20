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
    <input type="hidden" name="cl" value="attribute_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="attribute_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[attribute__oxid]" value="[{ $oxid }]">

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
            <td class="edittext" width="120">
            Name
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxattribute__oxtitle->fldmax_length}]" name="editval[oxattribute__oxtitle]" value="[{$edit->oxattribute__oxtitle->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
            <input type="submit" class="edittext" name="save" value="[{if $oxid!=-1}]Speichern[{else}]Neu anlegen[{/if}]" onClick="Javascript:document.myedit.fnc.value='save'""><br>
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
            Alle verf&uuml;gbaren Artikel
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Artikel mit diesem Attribute
            </td>
        </tr>
        <tr>
            <td class="edittext">
                <select name="artcat" class="editinput" onChange="Javascript:document.myedit.submit();">
                [{foreach from=$artcattree->aList item=pcat}]
            	<option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            </td>
        </tr>
        <tr>
            <td class="edittext">

                <select name="allartincat[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$allartincat item=allitem}]
                <option value="[{ $allitem->oxarticles__oxnid->value }]">[{ $allitem->oxarticles__oxartnum->value }] [{ $allitem->oxarticles__oxtitle->value }]</option>
                [{/foreach}]
                </select>

            </td>
            <td class="edittext">
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='addarticle';document.myedit.submit();"><b>==></b></a>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='removearticle';document.myedit.submit();"><b><==</b></a>&nbsp;&nbsp;&nbsp;
            </td>
            <td class="edittext">

                <select name="artinthiscat[]" size="20" multiple class="editinput" style="width:160px;">
                [{foreach from=$artthisincat item=allitem}]
                <option value="[{ $allitem->oxarticles__oxnid->value }]">[{ $allitem->oxarticles__oxartnum->value }] [{ $allitem->oxarticles__oxtitle->value }]</option>
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
    <!-- Ende rechte Seite -->

    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=attribute}]
</table>
[{include file="bottomitem.tpl"}]
