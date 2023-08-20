    <td class="leftitem">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <form action="index.php" method="get">
    <input type="hidden" name="cl" value="search">
    [{ $shop->hiddensid }]
    <td class="lefthightlightitem" width="8">&nbsp;</td>
    <td class="lefthightlightitem" valign="middle" align="left">
    Artikelsuche
    </td>
</tr>
<tr>
    <td></td>
    <td class="leftinternitem" height="3" valign="top"></td>
</tr>
<tr>
    <td></td>
    <td class="leftinternitem" height="40" valign="top">
        <input type="text" name="sSearchParam" value="[{$sSearchParam}]" size="10" class="search">
        <input type="image" src="[{$shop->imagedir}]/search_button.gif" alt="Suche" align="absmiddle" hspace="0" vspace="0" border="0">
    </td>
    </form>
</tr>
</table>

<!-- Kategorienbaum ausgeben -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="cmp_categories.tpl" Tree=$oxcmp_categories sSpacer=""}]
<tr>
<td height="1" bgcolor="#000000"></td>
<td height="1" bgcolor="#000000"></td>
</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td></td>
    <td class="leftinternitem" height="16" valign="top"></td>
</tr>
<tr>
<td height="1" bgcolor="#000000"></td>
<td height="1" bgcolor="#000000"></td>
</tr>
[{if !$catalogue }]
<tr>
    <td class="lefthightlightitem" width="8">&nbsp;</td>
    <td class="lefthightlightitem" valign="middle" align="left">
    Sprachauswahl
    </td>
</tr>
<tr>
    <td></td>
    <td height="18" valign="middle" class="leftinternitem">
    [{include file="cmp_lang.tpl" }]
    </td>
</tr>
<tr>
    <td></td>
    <td height="18" valign="middle" class="leftinternitem">
    </td>
</tr>
<tr>
<td height="1" bgcolor="#000000"></td>
<td height="1" bgcolor="#000000"></td>
</tr>
<tr>
    <td class="lefthightlightitem">&nbsp;</td>
    <td class="lefthightlightitem" valign="middle" align="left">
    W&auml;hrung
    </td>
</tr>
<tr>
    <td></td>
    <td height="18" valign="middle" class="leftinternitem">
    [{include file="cmp_cur.tpl" }]
    </td>
</tr>
<tr>
    <td></td>
    <td height="18" valign="middle" class="leftinternitem">
    </td>
</tr>
<tr>
<td height="1" bgcolor="#000000"></td>
<td height="1" bgcolor="#000000"></td>
</tr>
<tr>
    <td class="lefthightlightitem">&nbsp;</td>
    <td class="lefthightlightitem" valign="middle" align="left">
    Warenkorb
    </td>
</tr>
<tr>
    <td class="leftinternitem"></td>
    <td class="leftinternitem">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td class="leftinternitem" height="3"></td>
    <td class="leftinternitem"></td>
    </tr>
    <tr>
    <td class="leftinternitem" height="15" align="left" width="60">Artikel :</td>
    <td class="leftinternitem">[{ $oxcmp_basket->iCntProducts }]</td>
    </tr>
    <tr>
    <td class="leftinternitem" height="15">Anzahl :</td>
    <td class="leftinternitem">[{ $oxcmp_basket->dCntItems }]</td>
    </tr>
	[{ if $oxcmp_basket->ddeliverycost }]
    <tr>
    <td class="leftinternitem" height="15">Versand :</td>
    <td class="leftinternitem">[{ $oxcmp_basket->fdeliverycost }]</td>
    </tr>
	[{ /if}]
    <tr>
    <td class="leftinternitem" height="15"><b>Summe :</b></td>
    <td class="leftinternitem"><b>[{ $oxcmp_basket->fprice }] [{ $currency->sign}]</b></td>
    </tr>
    <tr>
    <td class="leftinternitem" height="7"></td>
    <td class="leftinternitem"></td>
    </tr>
    </table>    

	<a href="[{ $shop->basketlink }]"><img src="[{$shop->imagedir}]/basket_button.gif" width="131" height="19" alt="" border="0"></a>

    </td>
</tr>
[{/if}]
</table>


    </td>
