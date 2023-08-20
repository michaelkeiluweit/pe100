[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="article_overview">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" width="100%" class="edittext">
    
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
                <td class="edittext" height="20">
                Verkaufsrang Position&nbsp;
                </td>
                <td class="edittext">
                :&nbsp;<b>[{ $postopten }]/[{$toptentotal}]</b>
                </td>
            </tr>
            <tr>
                <td class="edittext" height="20">
                Anzahl Verk&auml;ufe total&nbsp;
                </td>
                <td class="edittext">
                :&nbsp;<b>[{ $soldcnt }]</b>
                </td>
            </tr>
            </table>
        </td>
    </tr>
    </table>

</td>
</tr>

[{include file="bottomnaviitem.tpl" navigation=article_novar}]
</table>
[{include file="bottomitem.tpl"}]
