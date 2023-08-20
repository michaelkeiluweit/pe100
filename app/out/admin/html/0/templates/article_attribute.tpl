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
    <input type="hidden" name="cl" value="article_attribute">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="article_attribute">
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
    [{if $addsales}]
    <td valign="top" class="edittext">

        <table cellspacing="0" cellpadding="0" border="0">
        [{ if $oxparentid }]
        <tr>
            <td class="edittext" width="120">
            <b>Variante von</b>
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            <a href="Javascript:EditThis('[{ $parentarticle->oxarticles__oxid->value}]');" class="edittext"><b>[{ $parentarticle->oxarticles__oxartnum->value }] [{ $parentarticle->oxarticles__oxtitle->value }]</b></a>
            </td>
        </tr>
        [{ /if}]
        <tr>
            <td class="edittext">
			Nicht ben. Attribute
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Artikel hat diese Attrib.
            </td>
        </tr>
        <tr>
            <td class="edittext">

                <select name="allattr[]" size="20" multiple class="editinput" style="width:140px;">
                [{foreach from=$allattr item=pcat}]
                <option value="[{ $pcat->oxattribute__oxid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxattribute__oxtitle->value }]</option>
                [{/foreach}]
                </select>

            </td>
            <td class="edittext">
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='addattr';document.myedit.submit();"><b>==></b></a>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='removeattr';document.myedit.submit();"><b><==</b></a>&nbsp;&nbsp;&nbsp;
            </td>
            <td class="edittext">

                <select name="allartattr[]" size="20" multiple class="editinput" style="width:140px;">
                [{foreach from=$allartattr item=pcat}]
                <option value="[{ $pcat->oxattribute__oxid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxattribute__oxtitle->value }]</option>
                [{/foreach}]
                </select>

            </td>

        </tr>
        </table>
    
    </td>
    <td width="35" align="center">
    <img src="[{ $shop->imagedir }]/greyline_vert.gif" width="2" height="270" alt="" border="0">
    </td>
    [{/if}]
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left" width="50%">
    
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext">
            Nicht ben. Ausw.listen
            </td>
            <td class="edittext">
            </td>
            <td class="edittext">
            Artikel hat diese Ausw.listen
            </td>
        </tr>
        <tr>
            <td class="edittext">

                <select name="allsel[]" size="20" multiple class="editinput" style="width:140px;">
                [{foreach from=$allsel item=pcat}]
                <option value="[{ $pcat->oxselectlist__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxselectlist__oxtitle->value }]</option>
                [{/foreach}]
                </select>

            </td>
            <td class="edittext">
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='addsel';document.myedit.submit();"><b>==></b></a>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;<a href="Javascript:document.myedit.fnc.value='removesel';document.myedit.submit();"><b><==</b></a>&nbsp;&nbsp;&nbsp;
            </td>
            <td class="edittext">

                <select name="allartsel[]" size="20" multiple class="editinput" style="width:140px;">
                [{foreach from=$allartsel item=pcat}]
                <option value="[{ $pcat->oxselectlist__oxnid->value }]" [{ if $pcat->selected}]SELECTED[{/if}]>[{ $pcat->oxselectlist__oxtitle->value }]</option>
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
[{include file="bottomnaviitem.tpl" navigation=article}]
</table>
[{include file="bottomitem.tpl"}]
