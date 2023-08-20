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
    <input type="hidden" name="cl" value="article_pictures">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">


<form name="myedit" id="myedit" enctype="multipart/form-data" action="[{ $shop->selflink }]" method="post">
<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="article_pictures">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{ $oxid }]">
<input type="hidden" name="editval[article__oxid]" value="[{ $oxid }]">
<input type="hidden" name="voxid" value="[{ $oxid }]">
<input type="hidden" name="oxparentid" value="[{ $oxparentid }]">

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
            <td class="edittext">
            Thumbnail
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxthumb->fldmax_length}]" name="editval[oxarticles__oxthumb]" value="[{$edit->oxarticles__oxthumb->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Thumbn. uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[TH@oxarticles__oxthumb]" type="file">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild 1
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxpic1->fldmax_length}]" name="editval[oxarticles__oxpic1]" value="[{$edit->oxarticles__oxpic1->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild1 uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[P1@oxarticles__oxpic1]" type="file">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild 2
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxpic2->fldmax_length}]" name="editval[oxarticles__oxpic2]" value="[{$edit->oxarticles__oxpic2->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild2 uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[P2@oxarticles__oxpic2]" type="file">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild 3
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxpic3->fldmax_length}]" name="editval[oxarticles__oxpic3]" value="[{$edit->oxarticles__oxpic3->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild3 uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[P3@oxarticles__oxpic3]" type="file">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild 4
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxpic4->fldmax_length}]" name="editval[oxarticles__oxpic4]" value="[{$edit->oxarticles__oxpic4->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild4 uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[P4@oxarticles__oxpic4]" type="file">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild 5
            </td>
            <td class="edittext">
            <input type="text" class="editinput" size="25" maxlength="[{$edit->oxarticles__oxpic5->fldmax_length}]" name="editval[oxarticles__oxpic5]" value="[{$edit->oxarticles__oxpic5->value}]">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bild5 uploaden :
            </td>
            <td class="edittext">
            <input class="editinput" name="myfile[P5@oxarticles__oxpic5]" type="file">
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
    
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
        <td class="edittext" valign="top">
        [{if $edit->oxarticles__oxthumb->value }]
        Thumbnail<br>
        <img src="[{$shop->dimagedir}]/[{$edit->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0">
        [{/if}]
        </td>
        <td  width="20"></td>
        <td class="edittext" valign="top">
        [{if $edit->oxarticles__oxpic1->value }]
        Bild 1<br>
        <img src="[{$shop->dimagedir}]/[{$edit->oxarticles__oxpic1->value }]" border="0" hspace="0" vspace="0">
        [{/if}]
        </tr>
        </table>
    
    </td>
    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=article}]
</table>
[{include file="bottomitem.tpl"}]
