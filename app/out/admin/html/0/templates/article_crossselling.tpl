[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<script type="text/javascript">
<!--
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
    <input type="hidden" name="cl" value="article_crossselling">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="article_crossselling">
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
        <tr>
            <td class="edittext">
            Alle verf&uuml;gbaren Artikel
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Cross selling Artikel
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
    
    
    </td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left" width="50%">
    </td>
    <!-- Ende rechte Seite -->

    </tr>
</table>

</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=article}]
</table>
[{include file="bottomitem.tpl"}]
