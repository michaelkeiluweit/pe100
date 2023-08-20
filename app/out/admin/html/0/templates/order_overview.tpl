[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="order_overview">
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
        <td valign="top" class="edittext" width="50%">
            <table cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td class="edittext" height="20">
                Anzahl Bestellungen heute 
                </td>
                <td class="edittext">
                :&nbsp;<b>[{ $ordercnt }]</b>
                </td>
            </tr>
            <tr>
                <td class="edittext" height="20">
                Summe Bestellungen heute
                </td>
                <td class="edittext">
                :&nbsp;<b>[{ $ordersum }]</b> [{ $currency->sign}]
                </td>
            </tr>
            <tr>
                <td class="edittext" height="20">
                Anzahl Bestellungen TOTAL 
                </td>
                <td class="edittext">
                :&nbsp;<b>[{ $ordertotalcnt }]</b>
                </td>
            </tr>
            <tr>
                <td class="edittext" height="20">
                Summe Bestellungen TOTAL
                </td>
                <td class="edittext">
                :&nbsp;<b>[{ $ordertotalsum }]</b> [{ $currency->sign}]
                </td>
            </tr>
            </table>
        </td>
		<td valign="top" class="edittext" align="right">
		<a href="[{ $shop->selflink }]?sid=[{$shop->sid}]&cl=order_overview&fnc=exportlex"><img src="[{$shop->imagedir}]/lexware.jpg" width="88" height="71" alt="" border="0"></a>
		&nbsp;&nbsp;
		[{ if $edit }]
		<br>
		<br>
		<br>
		<a href="[{ $shop->selflink }]?sid=[{$shop->sid}]&cl=order_overview&fnc=createPDF&oxid=[{ $oxid }]" class="edittext"><b>PDF erzeugen</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>(Rechtsklick + Ziel speichern unter)&nbsp;&nbsp;
		[{ /if}]
		</td>
    </tr>
    </table>

</td>
</tr>
    
[{include file="bottomnaviitem.tpl" navigation=order}]
</table>
[{include file="bottomitem.tpl"}]
