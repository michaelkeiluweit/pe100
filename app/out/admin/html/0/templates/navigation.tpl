<html>
<head>
    <title>Navigation</title>
    <link rel="stylesheet" href="[{$shop->basetpldir}]style.css">

<script language="javascript">
<!--

function show( oMenuentries)
{
    if (oMenuentries.style.display=='none')
    {
        document.all.menu1outline.style.display='none';
        document.all.menu2outline.style.display='none';
        document.all.menu3outline.style.display='none';
        document.all.menu4outline.style.display='none';
        document.all.menu5outline.style.display='none';
        document.all.menu6outline.style.display='none';

        oMenuentries.style.display='';
    }
    else
    {
        oMenuentries.style.display='none';
    }
}

function Highlight( oMe)
{
    document.all.menu1_1.style.setAttribute("fontweight","normal","false");
    document.all.menu1_2.style.setAttribute("fontweight","normal","false");
    //document.all.menu2_1.style.setAttribute("fontweight","normal","false");
    document.all.menu2_2.style.setAttribute("fontweight","normal","false");
    document.all.menu2_3.style.setAttribute("fontweight","normal","false");
    document.all.menu2_4.style.setAttribute("fontweight","normal","false");
    document.all.menu2_5.style.setAttribute("fontweight","normal","false");
    document.all.menu2_6.style.setAttribute("fontweight","normal","false");
    document.all.menu3_1.style.setAttribute("fontweight","normal","false");
    document.all.menu3_2.style.setAttribute("fontweight","normal","false");
    document.all.menu3_3.style.setAttribute("fontweight","normal","false");
    document.all.menu3_4.style.setAttribute("fontweight","normal","false");
    document.all.menu4_1.style.setAttribute("fontweight","normal","false");
    document.all.menu5_1.style.setAttribute("fontweight","normal","false");
	document.all.menu6_1.style.setAttribute("fontweight","normal","false");
	document.all.menu6_2.style.setAttribute("fontweight","normal","false");
    oMe.style.setAttribute("fontweight","bold","false");

}

function Rollover( oMe, oMe2, oMe3, blHigh)
{
    if( blHigh)
    {   oMe.style.setAttribute("backgroundcolor","#BDBEBE","false");
        //oMe2.style.setAttribute("backgroundcolor","#BDBEBE","false");
        //oMe3.style.setAttribute("backgroundcolor","#BDBEBE","false");
    }
    else
    {   oMe.style.setAttribute("backgroundcolor","#B8BBBE","false");
        //oMe2.style.setAttribute("backgroundcolor","#B8BBBE","false");
        //oMe3.style.setAttribute("backgroundcolor","#B8BBBE","false");
    }
}

-->
</script>

</head>

<body bgcolor="#00FFFF">

    <table height="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
        <td valign="top" height="75"><img src="[{$shop->imagedir}]/logo.gif" width="142" height="75" alt="" border="0"></td>
        </tr>
        <tr>
        <td valign="top" bgcolor="#B1AFB0" background="[{$shop->imagedir}]/nav_bgrnd.gif" height="242" align="center">
<br>
<table border="0" cellspacing="0" cellpadding="0" width="140">
<tr>
    <td class="mainnavi_level1" onMouseOver="Javascript:Rollover( menu2_out1, menu2_out2, menu2_out3, 1);" onMouseOut="Javascript:Rollover( menu2_out1, menu2_out2, menu2_out3, 0);">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="middle" id="menu6">
            <td valign="middle" class="mainnavi_level1" id="menu6_out1" width="19"><a href="Javascript:show(menu6outline);" class="mainnavi_level1" id="menu6_out3"><img src="[{$shop->imagedir}]/icons/closed.gif" border="0" hspace="0" vspace="0"></a></td>
            <td valign="middle" class="mainnavi_level1" id="menu6_out2" align="left"><a href="Javascript:show(menu6outline);" class="mainnavi_level1" id="menu6_out3">Stammdaten</a></td>
        </tr>
        </table>    
    </td>
</tr>
<tr id="menu6outline" class="mainnavi_level2" style="display:'none'">
    <td>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=shop&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu6_1" onClick="Javascript:Highlight( menu6_1);">Grundeinstellungen</a></td>
    </tr>
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=imex&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu6_2" onClick="Javascript:Highlight( menu6_2);">Im/Export</a></td>
    </tr>
	</table>    
</tr>

<tr>
    <td class="mainnavi_level1" onMouseOver="Javascript:Rollover( menu2_out1, menu2_out2, menu2_out3, 1);" onMouseOut="Javascript:Rollover( menu2_out1, menu2_out2, menu2_out3, 0);">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="middle" id="menu2">
            <td valign="middle" class="mainnavi_level1" id="menu2_out1" width="19"><a href="Javascript:show(menu2outline);" class="mainnavi_level1" id="menu2_out3"><img src="[{$shop->imagedir}]/icons/closed.gif" border="0" hspace="0" vspace="0"></a></td>
            <td valign="middle" class="mainnavi_level1" id="menu2_out2" align="left"><a href="Javascript:show(menu2outline);" class="mainnavi_level1" id="menu2_out3">Shopeinstellungen</a></td>
        </tr>
        </table>    
    </td>
</tr>
<tr id="menu2outline" class="mainnavi_level2" style="display:'none'">
    <td>
    <table border="0" cellspacing="0" cellpadding="0">
    <!--tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=shop&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu2_1" onClick="Javascript:Highlight( menu2_1);">Shopeinstellungen</a></td>
    </tr-->
    [{if $ismall}]
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=mallcategory&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu2_4" onClick="Javascript:Highlight( menu2_4);">Mall Gruppen</a></td>
    </tr>
    [{else}]<span id="menu2_4"></span>[{/if}]
    <tr>
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=payment&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu2_2" onClick="Javascript:Highlight( menu2_2);">Bezahlmethoden</a></td>
    </tr>
    <tr>
        <td></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=discount&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu2_3" onClick="Javascript:Highlight( menu2_3);">Rabatte</a></td>
    </tr>
    <tr>
        <td></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=vat&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu2_5" onClick="Javascript:Highlight( menu2_5);">Mwst.</a></td>
    </tr>
    <tr>
        <td></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=delivery&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu2_6" onClick="Javascript:Highlight( menu2_6);">Versandkosten</a></td>
    </tr>
    </table>        
    </td>
</tr>
<tr>
    <td class="mainnavi_level1" onMouseOver="Javascript:Rollover( menu3_out1, menu3_out2, menu3_out3, 1);" onMouseOut="Javascript:Rollover( menu3_out1, menu3_out2, menu3_out3, 0);">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="middle" id="menu3">
            <td valign="middle" class="mainnavi_level1" id="menu3_out1" width="19"><a href="Javascript:show(menu3outline);" class="mainnavi_level1" id="menu3_out3"><img src="[{$shop->imagedir}]/icons/closed.gif" border="0" hspace="0" vspace="0"></a></td>
            <td valign="middle" class="mainnavi_level1" id="menu3_out2" align="left"><a href="Javascript:show(menu3outline);" class="mainnavi_level1" id="menu3_out3">Produkte verwalten</a></td>
        </tr>
        </table>    
    </td>
</tr>
<tr id="menu3outline" class="mainnavi_level2" style="display:'none'">
    <td>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="middle">
        <td></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=article&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu3_2" onClick="Javascript:Highlight( menu3_2);">Artikel</a></td>
    </tr>
    <tr valign="middle">
        <td></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=attribute&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu3_3" onClick="Javascript:Highlight( menu3_3);">Attribute</a></td>
    </tr>
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=category&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu3_1" onClick="Javascript:Highlight( menu3_1);">Produktgruppen</a></td>
    </tr>
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=selectlist&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu3_4" onClick="Javascript:Highlight( menu3_4);">Auswahllisten</a></td>
    </tr>
    </table>        
    </td>
</tr>
<tr>
    <td class="mainnavi_level1" onMouseOver="Javascript:Rollover( menu1_out1, menu1_out2, menu1_out3, 1);" onMouseOut="Javascript:Rollover( menu1_out1, menu1_out2, menu1_out3, 0);">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="middle" id="menu1">
            <td valign="middle" class="mainnavi_level1" id="menu1_out1" width="19"><a href="Javascript:show(menu1outline);" class="mainnavi_level1" id="menu1_out3"><img src="[{$shop->imagedir}]/icons/closed.gif" border="0" hspace="0" vspace="0"></a></td>
            <td valign="middle" class="mainnavi_level1" id="menu1_out2" align="left"><a href="Javascript:show(menu1outline);" class="mainnavi_level1" id="menu1_out3">Benutzer verwalten</a></td>
        </tr>
        </table>    
    </td>
</tr>
<tr id="menu1outline" class="mainnavi_level2" style="display:'none'">
    <td>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=user&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu1_1" onClick="Javascript:Highlight( menu1_1);">Benutzer</a></td>
    </tr>
    <tr>
        <td></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=usergroup&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu1_2" onClick="Javascript:Highlight( menu1_2);">Gruppen</a></td>
    </tr>
    </table>        
    </td>
</tr>

<tr>
    <td class="mainnavi_level1" onMouseOver="Javascript:Rollover( menu4_out1, menu4_out2, menu4_out3, 1);" onMouseOut="Javascript:Rollover( menu4_out1, menu4_out2, menu4_out3, 0);">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="middle" id="menu4">
            <td valign="middle" class="mainnavi_level1" id="menu4_out1" width="19"><a href="Javascript:show(menu4outline);" class="mainnavi_level1" id="menu4_out3"><img src="[{$shop->imagedir}]/icons/closed.gif" border="0" hspace="0" vspace="0"></a></td>
            <td valign="middle" class="mainnavi_level1" id="menu4_out2" align="left"><a href="Javascript:show(menu4outline);" class="mainnavi_level1" id="menu4_out3">Bestellungen</a></td>
        </tr>
        </table>    
    </td>
</tr>
<tr id="menu4outline" class="mainnavi_level2" style="display:'none'">
    <td>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=order&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu4_1" onClick="Javascript:Highlight( menu4_1);">anzeigen</a></td>
    </tr>
    </table>        
    </td>
</tr>
[{if $isnewsletter}]
<tr>
    <td class="mainnavi_level1" onMouseOver="Javascript:Rollover( menu5_out1, menu5_out2, menu5_out3, 1);" onMouseOut="Javascript:Rollover( menu5_out1, menu5_out2, menu5_out3, 0);">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="middle" id="menu5">
            <td valign="middle" class="mainnavi_level1" id="menu5_out1" width="19"><a href="Javascript:show(menu5outline);" class="mainnavi_level1" id="menu5_out3"><img src="[{$shop->imagedir}]/icons/closed.gif" border="0" hspace="0" vspace="0"></a></td>
            <td valign="middle" class="mainnavi_level1" id="menu5_out2" align="left"><a href="Javascript:show(menu5outline);" class="mainnavi_level1" id="menu5_out3">Newsletter</a></td>
        </tr>
        </table>    
    </td>
</tr>
<tr id="menu5outline" class="mainnavi_level2" style="display:'none'">
    <td>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="middle">
        <td width="15"></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=newsletter&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu5_1" onClick="Javascript:Highlight( menu5_1);">verwalten</a></td>
    </tr>
    <!--tr>
        <td></td>
        <td valign="middle" class="mainnavi_level2"><img src="[{$shop->imagedir}]/icons/bullet.gif" border="0" hspace="0" vspace="0"></td>
        <td valign="middle" class="mainnavi_level2"><a href="[{$shop->selflink}]?cl=usergroup&sid=[{$shop->sid}]" target="basefrm" class="mainnavi_level2" id="menu1_2" onClick="Javascript:Highlight( menu1_2);">Gruppen</a></td>
    </tr-->
    </table>        
    </td>
</tr>
[{else}]
<span id="menu5"></span>
<span id="menu5outline"></span>
<span id="menu5_1"></span>
[{/if}]


</table>

        </td>
        </tr>
        <tr>
        <td height="100%"></td>
        </tr>
    </table>
</body>
</html>
