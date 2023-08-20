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

function EditThis( sID)
{
    document.transfer.oxid.value=sID;
    document.transfer.cl.value='article_main';
    document.transfer.submit();
    
    parent.list.document.search.oxid.value=sID;
    parent.list.document.search.submit();
}

//-->
</script>


<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="article_main">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="article_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="voxid" value="[{ $oxid }]">
<input type="hidden" name="oxparentid" value="[{ $oxparentid }]">
<input type="hidden" name="editval[oxarticles__oxid]" value="[{ $oxid }]">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext">

        <table cellspacing="0" cellpadding="0" border="0">
        [{ if $oxparentid }]
        <tr>
            <td class="edittext" width="120">
            <b>Variante von</b>
            </td>
            <td class="edittext">
            <a href="Javascript:EditThis('[{ $parentarticle->oxarticles__oxid->value}]');" class="edittext"><b>[{ $parentarticle->oxarticles__oxartnum->value }] [{ $parentarticle->oxarticles__oxtitle->value }]</b></a>
            </td>
        </tr>
        [{ /if}]
        
        <tr>
            <td class="edittext" width="120">
            Aktiv
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" name="editval[oxarticles__oxactiv]" value='1' [{if $edit->oxarticles__oxactiv->value == 1}]checked[{/if}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Aktiv (von-bis)
            </td>
            <td class="edittext">
            Von <input type="text" class="editinput" size="23" maxlength="[{$edit->oxarticles__oxactivfrom->fldmax_length}]" name="editval[oxarticles__oxactivfrom]" value="[{$edit->oxarticles__oxactivfrom->value}]" [{include file="help.tpl" helpid=article_vonbis}]><br>
            Bis&nbsp; <input type="text" class="editinput" size="23" maxlength="[{$edit->oxarticles__oxactivto->fldmax_length}]" name="editval[oxarticles__oxactivto]" value="[{$edit->oxarticles__oxactivto->value}]" [{include file="help.tpl" helpid=article_vonbis}]>
            </td>
        </tr>

        <tr>
            <td class="edittext">
            Titel
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxarticles__oxtitle->fldmax_length}]" name="editval[oxarticles__oxtitle]" value="[{$edit->oxarticles__oxtitle->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Artikelnr.
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxarticles__oxartnum->fldmax_length}]" name="editval[oxarticles__oxartnum]" value="[{$edit->oxarticles__oxartnum->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Kurzbeschreibung
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxarticles__oxshortdesc->fldmax_length}]" name="editval[oxarticles__oxshortdesc]" value="[{$edit->oxarticles__oxshortdesc->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Suchbegriffe
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxarticles__oxsearchkeys->fldmax_length}]" name="editval[oxarticles__oxsearchkeys]" value="[{$edit->oxarticles__oxsearchkeys->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Preis
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxprice->fldmax_length}]" name="editval[oxarticles__oxprice]" value="[{$edit->oxarticles__oxprice->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Mwst.
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="10" maxlength="[{$edit->oxarticles__oxvat->fldmax_length}]" name="editval[oxarticles__oxvat]" value="[{$edit->oxarticles__oxvat->value}]" [{include file="help.tpl" helpid=article_vat}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Externe URL
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxarticles__oxexturl->fldmax_length}]" name="editval[oxarticles__oxexturl]" value="http://[{$edit->oxarticles__oxexturl->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Text für ext. URL
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxarticles__oxurldesc->fldmax_length}]" name="editval[oxarticles__oxurldesc]" value="[{$edit->oxarticles__oxurldesc->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild für ext. URL
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxarticles__oxurlimg->fldmax_length}]" name="editval[oxarticles__oxurlimg]" value="[{$edit->oxarticles__oxurlimg->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext">
            <input type="submit" class="edittext" name="save" value="[{if $oxid!=-1}]Speichern[{else}]Neu anlegen[{/if}]" onClick="Javascript:document.myedit.fnc.value='save'""><br>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext">

                [{ if $oxid != "-1"}]
                <table cellspacing="2" cellpadding="2" border="0" bgcolor="#D3DFEC">
                <tr>
                <td align="left" class="saveinnewlangtext">
                    Verfügbar in :
                </td>
                <td align="left">
                    <select name="oxid" class="saveinnewlanginput" onChange="Javascript:document.myedit.submit();">
                    [{foreach from=$otherlang->aList item=olang}]
                    <option value="[{ $olang->oxarticles__oxid->value }]"[{ if $olang->selected}]SELECTED[{/if}]>[{ $olang->sLangDesc }]</option>
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
    
    <textarea class="editinput" cols="67" rows="25" wrap="VIRTUAL" name="editval[oxarticles__oxlongdesc]">[{$edit->oxarticles__oxlongdesc->value}]</textarea>


    </td>
    <!-- Ende rechte Seite -->

    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=article}]
</table>
[{include file="bottomitem.tpl"}]
