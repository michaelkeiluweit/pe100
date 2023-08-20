[{include file="headitem.tpl" title=""}]

<script type="text/javascript">
<!--
function ReloadAdress() 
{ 
    //set cross-browser DOM 
    if (document.all) 
        docObj = eval("document.all.order"); 
    else 
        docObj = eval("document.getElementById(\"order\")"); 
        
    if( docObj.oxaddressid.value != -1)
    {   docObj.fnc.value    = "";
        docObj.cl.value     = "user";
        docObj.submit();
    }
} 
//-->
</script>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr>
<td valign="top">
    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
    <td class="defaultcontent" width="17"></td>
    <td class="defaultcontent">

	[{include file="steps_item.tpl" highlight=3}]

    <form action="index.php" name="order" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="cl" value="order">
    <input type="hidden" name="cnid" value="[{$shop->cnid}]">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr>
	<td height="17" class="basketlisthead"></td>
	<td class="basketlisthead" valign="middle">
	Bezahlung :
	</td>
	<td class="basketlisthead" ></td>
	</tr>
	
	[{foreach key=sPaymentID from=$payments item=paymentmethod}] 
    <tr>
    [{if $sPaymentID == "oxidcashondel"}]
        <td class="paymentleft"><input class="paymenthighlight" type="radio" name="paymentid" value="[{$sPaymentID}]" checked></td>
        <td class="paymentmiddle" width="200">[{ $paymentmethod->oxpayments__oxdesc->value}]</td>
        <td class="paymentright">
                zuzüglich 7,50 € Nachnahmegebühr
        </td>
    [{elseif $sPaymentID == "oxidcreditcard"}]
        <td class="paymentleft"><input class="paymenthighlight" type="radio" name="paymentid" value="[{$sPaymentID}]"></td>
        <td class="paymentmiddle">[{ $paymentmethod->oxpayments__oxdesc->value}]</td>
        <td class="paymentright">

            <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="payment" width="100"><b>Karte</b></td>
                <td class="payment">
                    <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                    <td class="payment">Mastercard</td>
                    <td class="payment"><input type="radio" class="payment" name="dynvalue[kktype]" value="master"></td>
                    <td class="payment">Visa</td>
                    <td class="payment"><input type="radio" class="payment" name="dynvalue[kktype]" value="visa"></td>
                    </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="payment"><b>Nummer</b></td>
                <td class="payment">
                <input type="text" class="payment" size="20" maxlength="64" name="dynvalue[kknumber]" value="">
                </td>
            </tr>
            <tr>
                <td class="payment"><b>Name</b></td>
                <td class="payment">
                <input type="text" class="payment" size="20" maxlength="64" name="dynvalue[kkname]" value=""><br>
                Falls abweichend von der Rechnungsadresse.
                </td>
            </tr>
            <tr>
                <td class="payment"><b>G&uuml;ltig bis</b></td>
                <td class="payment">
                    <table border="0" cellspacing="0" cellpadding="0">
		            <tr>
		            <td><SELECT NAME="dynvalue[kkmonth]" class="payment">
                		<option>01</option> 
                		<OPTION>02</option> 
                		<OPTION>03</option> 
                		<OPTION>04</option> 
                		<OPTION>05</option> 
                		<OPTION>06</option> 
                		<OPTION>07</option> 
                		<OPTION>08</option> 
                		<OPTION>09</option> 
                		<OPTION>10</option> 
                		<OPTION>11</option> 
                		<OPTION>12</option> 
		                </select>
                    </td>
		            <TD class="payment">&nbsp;/&nbsp;</td>
		            <TD><SELECT NAME="dynvalue[kkyear]" class="payment">
                		<OPTION>2003</option> 
                		<OPTION>2004</option> 
                		<OPTION>2005</option> 
                		<OPTION>2006</option> 
                		<OPTION>2007</option> 
                		<OPTION>2008</option> 
                		<OPTION>2009</option> 
                		<OPTION>2010</option> 
                		<OPTION>2011</option> 
                		<OPTION>2012</option> 
                		</select>
                    </td>
		            </tr>
                    </table>
                </td>
            </tr>
            </table>        
        </td>
    [{elseif $sPaymentID == "oxiddebitnote"}]
        <td class="paymentleft"><input class="paymenthighlight" type="radio" name="paymentid" value="[{$sPaymentID}]"></td>
        <td class="paymentmiddle">[{ $paymentmethod->oxpayments__oxdesc->value}]</td>
        <td class="paymentright">

            <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="payment" width="100"><b>Bankname</b></td>
                <td class="payment">
                <input type="text" class="payment" size="20" maxlength="64" name="dynvalue[lsbankname]" value="">
                </td>
            </tr>
            <tr>
                <td class="payment"><b>BLZ</b></td>
                <td class="payment">
                <input type="text" class="payment" size="20" maxlength="64" name="dynvalue[lsblz]" value="">
                </td>
            </tr>
            <tr>
                <td class="payment"><b>Kontonr.</b></td>
                <td class="payment">
                <input type="text" class="payment" size="20" maxlength="64" name="dynvalue[lsktonr]" value="">
                </td>
            </tr>
            <tr>
                <td class="payment"><b>Kontoinhaber</b></td>
                <td class="payment">
                <input type="text" class="payment" size="20" maxlength="64" name="dynvalue[lsktoinhaber]" value="">
                </td>
            </tr>
            </table>        
        </td>
    [{else}]
        <td class="paymentleft"><input class="paymenthighlight" type="radio" name="paymentid" value="[{$sPaymentID}]"></td>
        <td class="paymentmiddle">[{ $paymentmethod->oxpayments__oxdesc->value}]</td>
        <td class="paymentright">
            <table border="0" cellspacing="0" cellpadding="0">
            [{foreach from=$paymentmethod->aDynValues item=value}]
            <tr>
                <td class="payment" width="150">
                [{ $value->name}]
                </td>
                <td class="payment">
                <input type="text" class="payment" size="20" maxlength="64" name="dynvalue[[{$value->name}]]" value="[{ $value->value}]">
                </td>
            </tr>
            [{/foreach}]
            </table>        
        </td>
    [{/if}]
    </tr>
    [{/foreach}]
    </table>
	<table border="0" cellspacing="0" cellpadding="2" width="100%">
		<tr>
		<td valign="top" bgcolor="#CECDCD" class="stepnext" style="border : 1px #494949; border-style : none none solid solid;">&nbsp;
		</td>
		<td class="basketsum" bgcolor="#CECDCD" style="border : 1px #494949; border-style : none solid solid none;" align="right" valign="middle">
		<input type="image" src="[{$shop->imagedir}]/payment_nextstep.gif" alt="Bezahlen" align="absmiddle">
		&nbsp;&nbsp;
		</td>
		</tr>
	</table>
    </form>

    [{ if $toparticle }]
	    [{include file="topoffer_item.tpl" product=$toparticle}]
    [{ /if }]

    </td>
    </tr>
    

    </tr>
    </table>
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
