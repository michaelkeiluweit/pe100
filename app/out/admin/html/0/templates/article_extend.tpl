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
    <input type="hidden" name="cl" value="article_extend">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" action="[{ $shop->selflink }]" enctype="multipart/form-data" method="post">
<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="article_extend">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="voxid" value="[{ $oxid }]">
<input type="hidden" name="oxparentid" value="[{ $oxparentid }]">
<input type="hidden" name="editval[article__oxid]" value="[{ $oxid }]">

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
            Artikel erstellt am
            </td>
            <td class="edittext">
            [{$edit->oxarticles__oxinsert->value}]
            </td>
        </tr>
        <tr>
            <td class="edittext" width="120">
            Letzte Änderung am
            </td>
            <td class="edittext">
            [{$edit->oxarticles__oxtimestamp->value}]
            </td>
        </tr>
        <tr>
            <td class="edittext" width="120">
            Gewicht
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxweight->fldmax_length}]" name="editval[oxarticles__oxweight]" value="[{$edit->oxarticles__oxweight->value}]">kg
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Länge/Breite/H&ouml;he
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="4" maxlength="[{$edit->oxarticles__oxlength->fldmax_length}]" name="editval[oxarticles__oxlength]" value="[{$edit->oxarticles__oxlength->value}]">m
            <input type="text" class="editinput" size="4" maxlength="[{$edit->oxarticles__oxlength->fldmax_width}]" name="editval[oxarticles__oxwidth]" value="[{$edit->oxarticles__oxwidth->value}]">m
            <input type="text" class="editinput" size="4" maxlength="[{$edit->oxarticles__oxlength->fldmax_height}]" name="editval[oxarticles__oxheight]" value="[{$edit->oxarticles__oxheight->value}]">m
            </td>
        </tr>
        <tr>
            <td class="edittext">
            EK Preis
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxbprice->fldmax_length}]" name="editval[oxarticles__oxbprice]" value="[{$edit->oxarticles__oxbprice->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            UVP
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxtprice->fldmax_length}]" name="editval[oxarticles__oxtprice]" value="[{$edit->oxarticles__oxtprice->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            VK Preis
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxprice->fldmax_length}]" name="editval[oxarticles__oxprice]" value="[{$edit->oxarticles__oxprice->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Lagerbestand
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxstock->fldmax_length}]" name="editval[oxarticles__oxstock]" value="[{$edit->oxarticles__oxstock->value}]" [{include file="help.tpl" helpid=article_stock}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Lieferbar am
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxdelivery->fldmax_length}]" name="editval[oxarticles__oxdelivery]" value="[{$edit->oxarticles__oxdelivery->value}]" [{include file="help.tpl" helpid=article_delivery}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Aktion
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__oxaktion->fldmax_length}]" name="editval[oxarticles__oxaktion]" value="[{$edit->oxarticles__oxaktion->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Datei
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxfile->fldmax_length}]" name="editval[oxarticles__oxfile]" value="[{$edit->oxarticles__oxfile->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Datei uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[FL@oxarticles__oxfile]" type="file">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            alt. Template ?
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxtemplate->fldmax_length}]" name="editval[oxarticles__oxtemplate]" value="[{$edit->oxarticles__oxtemplate->value}]" [{include file="help.tpl" helpid=article_template}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            alt. Ansprechpartner
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxquestionemail->fldmax_length}]" name="editval[oxarticles__oxquestionemail]" value="[{$edit->oxarticles__oxquestionemail->value}]">
            </td>
        </tr>
		<tr>
            <td class="edittext">
            </td>
            <td class="edittext">
            <input type="submit" class="edittext" name="save" value="[{if $oxid!=-1}]Speichern[{else}]Neu anlegen[{/if}]" onClick="Javascript:document.myedit.fnc.value='save'""><br>
            </td>
        </tr>
        </table>
    </td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left" width="50%">

        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Alle verfügbaren Gruppen
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Artikel ist in diesen Gruppen
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
