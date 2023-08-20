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
    <input type="hidden" name="cl" value="article_review">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="article_review">
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

        <select name="rev_oxid" size="20" class="editinput" style="width:160px;" onChange="Javascript:document.myedit.submit();">
        [{foreach from=$allreviews item=allitem}]
        <option value="[{ $allitem->oxreviews__oxnid->value }]" [{ if $allitem->selected}]SELECTED[{/if}]>[{ $allitem->oxreviews__oxcreate->value }]</option>
        [{/foreach}]
        </select><br><br>
        <input type="submit" class="edittext" name="save" value="Speichern" onClick="Javascript:document.myedit.fnc.value='save'"">
        <input type="submit" class="edittext" name="save" value="L&ouml;schen" onClick="Javascript:document.myedit.fnc.value='delete'""><br>
    
    </td>
    <!-- Anfang rechte Seite -->
    <td valign="top" class="edittext" align="left">
    [{ if $user }]
    <textarea class="editinput" cols="100" rows="20" wrap="VIRTUAL" name="reviewtext">[{$reviewtext}]</textarea><br>
    Gepostet von : [{ $user->oxuser__oxfname->value}] [{ $user->oxuser__oxlname->value}]
    [{ /if}]
    </td>
    <!-- Ende rechte Seite -->

</tr>
</table>

</td>
</tr>
[{include file="bottomnaviitem.tpl" navigation=article}]
</table>
[{include file="bottomitem.tpl"}]
