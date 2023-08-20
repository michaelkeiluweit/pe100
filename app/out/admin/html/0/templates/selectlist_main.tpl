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
    <input type="hidden" name="cl" value="selectlist_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="selectlist_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxselectlist__oxid]" value="[{ $oxid }]">

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
            <td class="edittext" width="70">
            Titel
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxselectlist__oxtitle->fldmax_length}]" name="editval[oxselectlist__oxtitle]" value="[{$edit->oxselectlist__oxtitle->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext" width="70">
            Felder
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="1024" name="editval[oxselectlist__oxvaldesc]" value="[{$edit->oxselectlist__oxvaldesc->value}]" [{include file="help.tpl" helpid=selectlist_valdesc}]>
            </td>
        </tr>
        [{ if $oxid != "-1"}]
        <tr>
            <td class="edittext" width="70">
            Vorschau
            </td>
            <td class="edittext">
                <select name="" class="editinput">
                    [{foreach from=$selectfields item=value}]
                    <option value="[{ $value->name}]">[{ $value->name}]</option>
                    [{/foreach}]
                </select>
            </td>
        </tr>
        [{/if}]
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
            <input type="submit" class="edittext" name="save" value="[{if $oxid!=-1}]Speichern[{else}]Neu anlegen[{/if}]" onClick="Javascript:document.myedit.fnc.value='save'""><br>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
                [{ if $oxid != "-1"}]
                <br><br><br><br>
                <table cellspacing="2" cellpadding="2" border="0" bgcolor="#D3DFEC">
                <tr>
                <td align="left" class="saveinnewlangtext">
                    Verfügbar in :
                </td>
                <td align="left">
                    <select name="oxid" class="saveinnewlanginput" onChange="Javascript:document.myedit.submit();">
                    [{foreach from=$otherlang->aList item=olang}]
                    <option value="[{ $olang->oxselectlist__oxid->value }]"[{ if $olang->selected}]SELECTED[{/if}]>[{ $olang->sLangDesc }]</option>
                    [{/foreach}]
                    </select>
                </td>
                </tr>
                <tr>
                <td align="left">
                    <input type="submit" name="save" value="Kopieren nach" class="saveinnewlangtext" style="width: 100;" onClick="Javascript:document.myedit.fnc.value='saveinnlang'">
                </td>
                <td align="left">
                    <select name="new_lang" class="saveinnewlanginput">
                    [{foreach from=$posslang item=lang}]
                    <option value="[{ $lang->id }]">[{ $lang->name }]</option>
                    [{/foreach}]
                    </select>
                </td>
                </tr>
                </table>

                [{/if}]

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
            Artikel mit dieser Ausw.liste
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


    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=selectlist}]
</table>
[{include file="bottomitem.tpl"}]
