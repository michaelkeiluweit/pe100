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
    <input type="hidden" name="cl" value="category_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" enctype="multipart/form-data" action="[{ $shop->selflink }]" method="post">
<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="category_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[oxcategories__oxid]" value="[{ $oxid }]">

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
            Aktiv
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" name="editval[oxcategories__oxactiv]" value='1' [{if $edit->oxcategories__oxactiv->value == 1}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Titel
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxcategories__oxtitle->fldmax_length}]" name="editval[oxcategories__oxtitle]" value="[{$edit->oxcategories__oxtitle->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Beschreibung
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxcategories__oxdesc->fldmax_length}]" name="editval[oxcategories__oxdesc]" value="[{$edit->oxcategories__oxdesc->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Untergruppe von
            </td>
            <td class="edittext">
                <select name="editval[oxcategories__oxparentid]" class="editinput">
                [{foreach from=$cattree->aList item=pcat}]
            	<option value="[{ $pcat->oxcategories__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxcategories__oxtitle->value }]</option>
                [{/foreach}]
                </select>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Sortierung
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxcategories__oxorder->fldmax_length}]" name="editval[oxcategories__oxorder]" value="[{$edit->oxcategories__oxorder->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Thumbnail
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxcategories__oxthumb->fldmax_length}]" name="editval[oxcategories__oxthumb]" value="[{$edit->oxcategories__oxthumb->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Thumbn. uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[TC@oxcategories__oxthumb]" type="file">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Externer Link
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="42" maxlength="[{$edit->oxcategories__oxextlink->fldmax_length}]" name="editval[oxcategories__oxextlink]" value="[{$edit->oxcategories__oxextlink->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            alt. Template ?
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="42" maxlength="[{$edit->oxcategories__oxtemplate->fldmax_length}]" name="editval[oxcategories__oxtemplate]" value="[{$edit->oxcategories__oxtemplate->value}]" [{include file="help.tpl" helpid=article_template}]>
            </td>
        </tr>
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
                <br>
                <table cellspacing="2" cellpadding="2" border="0" bgcolor="#D3DFEC">
                <tr>
                <td align="left" class="saveinnewlangtext">
                    Verf�gbar in : 
                </td>
                <td align="left">
                    <select name="oxid" class="saveinnewlanginput" onChange="Javascript:document.myedit.submit();">
                    [{foreach from=$otherlang->aList item=olang}]
                    <option value="[{ $olang->oxcategories__oxid->value }]"[{ if $olang->selected}]SELECTED[{/if}]>[{ $olang->sLangDesc }]</option>
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
            Artikel in dieser Gruppe
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


    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=category}]
</table>
[{include file="bottomitem.tpl"}]
