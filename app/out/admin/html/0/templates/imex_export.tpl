[{include file="headitem.tpl" title="[OktoberX Benutzerverwaltung]"}]

<script type="text/javascript">
<!--

function DisableAll()
{
	document.forms.myedit.cexp1.checked=false;
	document.forms.myedit.cexp2.checked=false;
	document.forms.myedit.cexp3.checked=false;
	document.forms.myedit.cexp4.checked=false;
	document.forms.myedit.cexp5.checked=false;
	document.forms.myedit.cexp6.checked=false;
	document.forms.myedit.cexp7.checked=false;
	document.forms.myedit.cexp8.checked=false;
	document.forms.myedit.cexp9.checked=false;
	document.forms.myedit.cexp10.checked=false;
	document.forms.myedit.cexp11.checked=false;
	document.forms.myedit.cexp12.checked=false;
	document.forms.myedit.cexp13.checked=false;
	document.forms.myedit.cexp14.checked=false;
	document.forms.myedit.cexp15.checked=false;
	document.forms.myedit.cexp16.checked=false;
	document.forms.myedit.cexp17.checked=false;
	document.forms.myedit.cexp18.checked=false;
	document.forms.myedit.cexp19.checked=false;
	
	var blSet = document.forms.myedit.clexware.checked;
	
	document.forms.myedit.cexp1.disabled = blSet;
	document.forms.myedit.cexp2.disabled = blSet;		
	document.forms.myedit.cexp3.disabled = blSet;
	document.forms.myedit.cexp4.disabled = blSet;		
	document.forms.myedit.cexp5.disabled = blSet;
	document.forms.myedit.cexp6.disabled = blSet;		
	document.forms.myedit.cexp7.disabled = blSet;
	document.forms.myedit.cexp8.disabled = blSet;		
	document.forms.myedit.cexp9.disabled = blSet;
	document.forms.myedit.cexp10.disabled = blSet;		
	document.forms.myedit.cexp11.disabled = blSet;
	document.forms.myedit.cexp12.disabled = blSet;		
	document.forms.myedit.cexp13.disabled = blSet;
	document.forms.myedit.cexp14.disabled = blSet;		
	document.forms.myedit.cexp15.disabled = blSet;
	document.forms.myedit.cexp16.disabled = blSet;		
	document.forms.myedit.cexp17.disabled = blSet;
	document.forms.myedit.cexp18.disabled = blSet;		
	document.forms.myedit.cexp19.disabled = blSet;
}

//-->
</script>

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="imex_export">
</form>

<table cellspacing="0" cellpadding="0" border="0" width="760" height="377">
<tr>
<td valign="top" background="[{$shop->imagedir}]/edit_back.gif" align="center" width="100%">

<form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post" target="list">
[{ $shop->hiddensid }]
<input type="hidden" name="cl" value="imex_do">
<input type="hidden" name="fnc" value="doexport">

<table cellspacing="0" cellpadding="0" border="0" height="100%" width="760">
<tr height="10">
    <td></td>
    <td></td>
</tr>
<tr>
    <td width="15"></td>
    <td valign="top" class="edittext" width="50%">
		Datei : <input type="text" class="editinput" size="60" maxlength="128" name="filepath" value="[{$filepath}]"><br>
		<br>
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="140">
            Adressen (oxaddress)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp1" name="atables[]" value="oxaddress">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Artikel (oxarticles)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp2" name="atables[]" value="oxarticles" checked>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Attribute (oxattribute)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp3" name="atables[]" value="oxattribute">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Kategorien (oxcategories)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp4" name="atables[]" value="oxcategories" checked>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Versandkosten (oxdelivery)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp5" name="atables[]" value="oxdelivery">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Rabatte/Mwst. (oxdiscount)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp6" name="atables[]" value="oxdiscount">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Benutzergruppen (oxgroups)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp7" name="atables[]" value="oxgroups">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Verkn. am Artikel (oxobject2article)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp8" name="atables[]" value="oxobject2article">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            <b>Artikel f&uuml;r Lexware Faktura & Auftrag</b>
            </td>
            <td class="edittext">
            <input type="checkbox" name="atables[]" id="clexware" value="lexware" class="edittext" onClick="Javascript:DisableAll();">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br><br><br>
            <input type="submit" class="edittext" name="save" value="Export starten">
            </td>
        </tr>
        </table>
		
    </td>
	<td valign="top" class="edittext" align="left">
	<br>
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="edittext" width="260">
            Verkn. zu Attributen (oxobject2attribute)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp9" name="atables[]" value="oxobject2attribute">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Verkn. zu Kategorien (oxobject2category)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp10" name="atables[]" value="oxobject2category">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Verkn. zu Gruppen (oxobject2group)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp11" name="atables[]" value="oxobject2group">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Verkn. zu Ausw. (oxobject2selectlist)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp12" name="atables[]" value="oxobject2selectlist">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bestellungen/Stamm (oxorder)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp13" name="atables[]" value="oxorder">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bestellungen/Artikel (oxorderarticles)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp14" name="atables[]" value="oxorderarticles">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bezahlmethoden (oxpayments)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp15" name="atables[]" value="oxpayments">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bemerkungen (oxremark)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp16" name="atables[]" value="oxremark">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Bewertungen (oxreviews)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp17" name="atables[]" value="oxreviews">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Ausw. Listen (oxselectlist)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp18" name="atables[]" value="oxselectlist">
            </td>
        </tr>
        <tr>
            <td class="edittext">
            Benutzer (oxuser)
            </td>
            <td class="edittext">
            <input class="edittext" type="checkbox" id="cexp19" name="atables[]" value="oxuser">
            </td>
        </tr>
		</table>
		
	</td>
    </tr>
</table>

</td>
</tr>

</form>

[{include file="bottomnaviitem.tpl" navigation=imex}]
</table>
[{include file="bottomitem.tpl"}]
