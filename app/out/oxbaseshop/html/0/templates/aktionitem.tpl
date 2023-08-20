    <td class="defaultcontent" align="right" width="165">
    [{ if $toparticle }]
    [{include file="topoffer_item.tpl" product=$toparticle}]
    <br>
    <br>
    [{ /if }]

	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="aktionhead" align="center" height="15" width="165">Wichtige Informationen</td>
	</tr>
	<tr>
	<td class="aktionmain">
		&nbsp;&nbsp;<img src="[{$shop->imagedir}]/rootcat_open.gif" width="9" height="9" alt="" border="0">&nbsp;<a href="[{$shop->selflink}]&cl=info&tpl=order_info.tpl" class="aktionhighlight">Wie bestellen ?</a><br>
		<br>
		&nbsp;&nbsp;<img src="[{$shop->imagedir}]/rootcat_open.gif" width="9" height="9" alt="" border="0">&nbsp;<a href="[{$shop->selflink}]&cl=info&tpl=delivery_info.tpl" class="aktionhighlight">Versand und Kosten</a><br>
		<br>
		&nbsp;&nbsp;<img src="[{$shop->imagedir}]/rootcat_open.gif" width="9" height="9" alt="" border="0">&nbsp;<a href="[{$shop->selflink}]&cl=info&tpl=security_info.tpl" class="aktionhighlight">Sicherheit !</a><br>
        [{ if $isnewsletter }]
		<br>
		&nbsp;&nbsp;<img src="[{$shop->imagedir}]/rootcat_open.gif" width="9" height="9" alt="" border="0">&nbsp;<a href="[{$shop->selflink}]&cl=newsletter" class="aktionhighlight">Newsletter</a><br>
        [{/if}]
	</td>
	</tr>
	</table>

<br><br>

[{ if $articlebargain }]
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="aktionhead" align="center" height="15" width="165">Schnäppchen !</td>
	</tr>
	<tr>
		<td class="aktionmain" height="145" valign="top">
		Jetzt gibt es unseren Bestseller <a href="[{ $articlebargain->oxdetaillink}]" class="aktionhighlight">[{ $articlebargain->oxarticles__oxtitle->value }]</a> in der günstigen Sonderausgabe exklusiv bei oxid !<br>
		Gleich <a href="[{ $articlebargain->tobasketlink }]&am=1" class="aktionhighlight">bestellen</a> !<br>
		</td>
	</tr>
	</table>
[{/if}]

<br>
    [{include file="cmp_login.tpl"}]

    </td>
