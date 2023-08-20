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

function SendForgotPwdeMail() 
{ 
    //set cross-browser DOM 
    if (document.all) 
        docObj = eval("document.all.loginform"); 
    else 
        docObj = eval("document.getElementById(\"loginform\")"); 
    
    docObj.fnc.value='forgotpassword';
    docObj.submit();
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
	
	[{include file="steps_item.tpl" highlight=2}]

    [{ if !$oxcmp_user }]
	<span class="userlogincontent">Ich bin bereits Stammkunde :</span><br>
	<br>
    <table border="0" cellspacing="0" cellpadding="0">
    <form action="index.php" name="loginform" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="fnc" value="login">
    <input type="hidden" name="cl" value="user">
    <input type="hidden" name="cnid" value="[{$shop->cnid}]">
    <input type="hidden" name="lgn_cook" value="0">
    <tr>
    <td class="order" width="90">
    eMail Adresse 
    </td>
    <td class="order" width="200">
    <input type="text" name="lgn_usr" value="" size="25" class="order"> <span class="orderhighlight"><b>*</b></span>
    </td>
    </tr>    
    <tr>
    <td class="order">
    Passwort 
    </td>
    <td class="order">
    <input type="password" name="lgn_pwd" value="" size="25" class="order"> <span class="orderhighlight"><b>*</b></span>&nbsp;&nbsp;
    <input type="image" src="[{$shop->imagedir}]/login_button.gif" align="top" hspace="0" vspace="0" border="0">
    </td>
    </tr>    
    </table>
	
    <br>
    <span class="userlogincontent">Passwort vergessen ?</span><br>
	<br>
	[{ if $sendForgotMail}]
	<span class="orderhighlight">Passwort wurde verschickt an : [{$sendForgotMail}]</span><br>
	[{ /if}]
    Einfach oben eMail Adresse eingeben und <a href="Javascript:SendForgotPwdeMail();" class="defaultcontent"><b>hier klicken</b></a> und das Passwort wird Ihnen per eMail zugeschickt.<br>
    <br>   
    <span class="userlogincontent">Ich m&ouml;chte Kunde werden :</span><br>
	<br>
    <table border="0" cellspacing="0" cellpadding="0">
    </form>
    <form action="index.php" name="order" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="fnc" value="createuser">
    <input type="hidden" name="cl" value="payment">
    <input type="hidden" name="cnid" value="[{$shop->cnid}]">
    <input type="hidden" name="lgn_cook" value="0">
    <tr>
    <td class="order" width="90">
    eMail Adresse 
    </td>
    <td class="order">
    <input type="text" name="lgn_usr" value="[{$lgn_usr}]" size="25" class="order"> <span class="orderhighlight"><b>*</b></span>
    </td>
    </tr>    
    <tr>
    <td class="order">
    Passwort 
    </td>
    <td class="order">
    <input type="password" name="lgn_pwd" value="[{$lgn_pwd}]" size="25" class="order"> <span class="orderhighlight"><b>*</b></span>
    </td>
    </tr>    
    <tr>
    <td class="order">
    Wiederholung :
    </td>
    <td class="order">
    <input type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" size="25" class="order"> <span class="orderhighlight"><b>*</b></span>
    </td>
    </tr>    
    </table>
	<br>
    Felder mit einem * müssen ausgefüllt werden.<br>
	<br>
    [{if $usr_error == "-1"}]
    <span class="orderhighlight">Fehler : Passw&ouml;rter stimmen nicht &uuml;berein !</span><br>
    [{elseif $usr_error == "-2"}]
    <span class="orderhighlight">Fehler : Falscher Benutzer/Passwort !</span><br>
    [{elseif $usr_error == "-3"}]
    <span class="orderhighlight">Fehler : Bitte f&uuml;llen Sie alle Felder mit "*" aus !</span><br>
    [{elseif $usr_error == "-4"}]
    <span class="orderhighlight">Fehler : Bitte f&uuml;llen Sie auch Ihre Rechnungs Adresse aus !</span><br>
    [{elseif $usr_error == "-5"}]
    <span class="orderhighlight">Fehler : Keine g&uuml;ltige eMail Adresse !</span><br>
    [{/if}]
    [{else}]
    Sie sind angemeldet als [{ $oxcmp_user->oxuser__oxfname->value }] [{ $oxcmp_user->oxuser__oxlname->value }] ( [{ $oxcmp_user->oxuser__oxusername->value }] ).<br>
    <a href="[{$shop->logoutlink}]" class="login"><img src="[{$shop->imagedir}]/subcat_more.gif" width="9" height="9" alt="" border="0"><b>abmelden</b></a>
    <form action="index.php" name="order" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="fnc" value="changeuser">
    <input type="hidden" name="cl" value="payment">
    <input type="hidden" name="cnid" value="[{$shop->cnid}]">
    <input type="hidden" name="lgn_cook" value="0">
    [{ /if }]
	<br>
	
	<table border="0" cellspacing="0" cellpadding="2" width="100%">
	<tr>
	<td class="basketlisthead" valign="top" width="50%" height="17">
	&nbsp;&nbsp;Rechnungsadresse :
	</td>
	<td class="basketlisthead" valign="top">
	Lieferadresse :
	</td>
	</tr>

    <tr>
    <td class="orderleft">&nbsp;</td>
    <td class="orderright">
	<br>
	<span class="orderhighlight">
	Folgende Felder bitte nur ausfüllen, falls die gewünschte Lieferadresse von der Rechnungsadresse abweicht.</span><br>
	<br>
	</td>
	
    </tr>
	
    <tr>
    <td class="orderleft" valign="top">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="order">
            Anrede
            </td>
            <td class="order">
            <SELECT NAME="invadr[oxuser__oxsal]" class="order">
		    <OPTION [{ if $oxcmp_user->oxuser__oxsal->value == "Herr"}]SELECTED[{/if}]>Herr</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxsal->value == "Frau"}]SELECTED[{/if}]>Frau</option>
	    	</select>
            </td>
        </tr>
        <tr>
            <td class="order">
            Vor/Nachname
            </td>
            <td class="order">
            <input type="text" class="order" size="10" maxlength="[{$oxcmp_user->oxuser__oxfname->fldmax_length}]" name="invadr[oxuser__oxfname]" value="[{if $oxcmp_user->oxuser__oxfname->value }][{$oxcmp_user->oxuser__oxfname->value }][{else}][{$invadr.oxuser__oxfname }][{/if}]">
            <input type="text" class="order" size="20" maxlength="[{$oxcmp_user->oxuser__oxlname->fldmax_length}]" name="invadr[oxuser__oxlname]" value="[{if $oxcmp_user->oxuser__oxlname->value }][{$oxcmp_user->oxuser__oxlname->value }][{else}][{$invadr.oxuser__oxlname }][{/if}]"> <span class="orderhighlight"><b>*</b></span>
            </td>
        </tr>
        <tr>
            <td class="order">
            Firma
            </td>
            <td class="order">
            <input type="text" class="order" size="37" maxlength="[{$oxcmp_user->oxuser__oxcompany->fldmax_length}]" name="invadr[oxuser__oxcompany]" value="[{if $oxcmp_user->oxuser__oxcompany->value }][{$oxcmp_user->oxuser__oxcompany->value }][{else}][{$invadr.oxuser__oxcompany }][{/if}]">
            </td>
        </tr>
        <tr>
            <td class="order">
            Strasse, Hausnr.
            </td>
            <td class="order">
            <input type="text" class="order" size="37" maxlength="[{$oxcmp_user->oxuser__oxstreet->fldmax_length}]" name="invadr[oxuser__oxstreet]" value="[{if $oxcmp_user->oxuser__oxstreet->value }][{$oxcmp_user->oxuser__oxstreet->value }][{else}][{$invadr.oxuser__oxcompany }][{/if}]">
            </td>
        </tr>
        <tr>
            <td class="order">
            PLZ Ort
            </td>
            <td class="order">
            <input type="text" class="order" size="5" maxlength="[{$oxcmp_user->oxuser__oxzip->fldmax_length}]" name="invadr[oxuser__oxzip]" value="[{if $oxcmp_user->oxuser__oxzip->value }][{$oxcmp_user->oxuser__oxzip->value }][{else}][{$invadr.oxuser__oxzip }][{/if}]">
            <input type="text" class="order" size="25" maxlength="[{$oxcmp_user->oxuser__oxcity->fldmax_length}]" name="invadr[oxuser__oxcity]" value="[{if $oxcmp_user->oxuser__oxcity->value }][{$oxcmp_user->oxuser__oxcity->value }][{else}][{$invadr.oxuser__oxcity }][{/if}]">
            </td>
        </tr>
        <tr>
            <td class="order">
            zus. Info
            </td>
            <td class="order">
            <input type="text" class="order" size="37" maxlength="[{$oxcmp_user->oxuser__oxaddinfo->fldmax_length}]" name="invadr[oxuser__oxaddinfo]" value="[{if $oxcmp_user->oxuser__oxaddinfo->value }][{$oxcmp_user->oxuser__oxaddinfo->value }][{else}][{$invadr.oxuser__oxaddinfo }][{/if}]">
            </td>
        </tr>
        <tr>
            <td class="order">
            Land
            </td>
            <td class="order">
            <SELECT NAME="invadr[oxuser__oxcountry]" class="order">
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Deutschland"}]SELECTED[{/if}]>Deutschland</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Österreich"}]SELECTED[{/if}]>Österreich</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Schweiz"}]SELECTED[{/if}]>Schweiz</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Liechtenstein"}]SELECTED[{/if}]>Liechtenstein</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Luxemburg"}]SELECTED[{/if}]>Luxemburg</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Schweden"}]SELECTED[{/if}]>Schweden</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Finnland"}]SELECTED[{/if}]>Finnland</option>
		    <OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Grossbritannien"}]SELECTED[{/if}]>Grossbritannien</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Irland"}]SELECTED[{/if}]>Irland</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Holland"}]SELECTED[{/if}]>Holland</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Belgien"}]SELECTED[{/if}]>Belgien</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Frankreich"}]SELECTED[{/if}]>Frankreich</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Portugal"}]SELECTED[{/if}]>Portugal</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Spanien"}]SELECTED[{/if}]>Spanien</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Italien"}]SELECTED[{/if}]>Italien</option>
			<OPTION [{ if $oxcmp_user->oxuser__oxcountry->value == "Griechenland"}]SELECTED[{/if}]>Griechenland</option>
	    	</select>
            </td>
        </tr>
        <tr>
            <td class="order">
            Fon
            </td>
            <td class="order">
            <input type="text" class="order" size="20" maxlength="[{$oxcmp_user->oxuser__oxfon->fldmax_length}]" name="invadr[oxuser__oxfon]" value="[{if $oxcmp_user->oxuser__oxfon->value }][{$oxcmp_user->oxuser__oxfon->value }][{else}][{$invadr.oxuser__oxfon }][{/if}]">
            </td>
        </tr>
        <tr>
            <td class="order">
            Fax
            </td>
            <td class="order">
            <input type="text" class="order" size="20" maxlength="[{$oxcmp_user->oxuser__oxfax->fldmax_length}]" name="invadr[oxuser__oxfax]" value="[{if $oxcmp_user->oxuser__oxfax->value }][{$oxcmp_user->oxuser__oxfax->value }][{else}][{$invadr.oxuser__oxfax }][{/if}]">
            </td>
        </tr>
        </table>
    </td>
    <td class="orderright">
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="order" width="70">
            Adressen
            </td>
            <td class="order">
                <select name="oxaddressid" class="order" onChange="ReloadAdress();">
					[{foreach from=$oxcmp_user->oAddresses->aList item=address}] 
	            	<option value="[{ $address->oxaddress__oxid->value }]" [{ if $address->selected}]SELECTED[{/if}]>[{ $address->oxaddress__oxfname->value }] [{ $address->oxaddress__oxlname->value }], [{ $address->oxaddress__oxcity->value }]</option>
	                [{/foreach}]
                    <option value="-1">Neue Adresse</option>
	            </select>
            </td>
        </tr>
        <tr>
            <td class="order">
            Anrede
            </td>
            <td class="order">
            <SELECT NAME="deladr[oxaddress__oxsal]" class="order">
		    <OPTION [{ if $delivadr->oxaddress__oxsal->value == "Herr"}]SELECTED[{/if}]>Herr</option>
		    <OPTION [{ if $delivadr->oxaddress__oxsal->value == "Frau"}]SELECTED[{/if}]>Frau</option>
	    	</select>
            </td>
        </tr>
        <tr>
            <td class="order">
            Name
            </td>
            <td class="order">
            <input type="text" class="order" size="10" maxlength="[{$delivadr->oxaddress__oxfname->fldmax_length}]" name="deladr[oxaddress__oxfname]" value="[{$delivadr->oxaddress__oxfname->value }]">
            <input type="text" class="order" size="20" maxlength="[{$delivadr->oxaddress__oxlname->fldmax_length}]" name="deladr[oxaddress__oxlname]" value="[{$delivadr->oxaddress__oxlname->value }]">
            </td>
        </tr>
        <tr>
            <td class="order">
            Firma
            </td>
            <td class="order">
            <input type="text" class="order" size="37" maxlength="[{$delivadr->oxaddress__oxcompany->fldmax_length}]" name="deladr[oxaddress__oxcompany]" value="[{$delivadr->oxaddress__oxcompany->value }]">
            </td>
        </tr>
        <tr>
            <td class="order">
            Strasse
            </td>
            <td class="order">
            <input type="text" class="order" size="37" maxlength="[{$delivadr->oxaddress__oxstreet->fldmax_length}]" name="deladr[oxaddress__oxstreet]" value="[{$delivadr->oxaddress__oxstreet->value }]">
            </td>
        </tr>
        <tr>
            <td class="order">
            PLZ Ort
            </td>
            <td class="order">
            <input type="text" class="order" size="5" maxlength="[{$delivadr->oxaddress__oxzip->fldmax_length}]" name="deladr[oxaddress__oxzip]" value="[{$delivadr->oxaddress__oxzip->value }]">
            <input type="text" class="order" size="25" maxlength="[{$delivadr->oxaddress__oxcity->fldmax_length}]" name="deladr[oxaddress__oxcity]" value="[{$delivadr->oxaddress__oxcity->value }]">
            </td>
        </tr>
        <tr>
            <td class="order">
            zus. Info
            </td>
            <td class="order">
            <input type="text" class="order" size="37" maxlength="[{$delivadr->oxaddress__oxaddinfo->fldmax_length}]" name="deladr[oxaddress__oxaddinfo]" value="[{$delivadr->oxaddress__oxaddinfo->value }]">
            </td>
        </tr>
        <tr>
            <td class="order">
            Land
            </td>
            <td class="order">
            <SELECT NAME="deladr[oxaddress__oxcountry]" class="order">
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Deutschland"}]SELECTED[{/if}]>Deutschland</option>
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Österreich"}]SELECTED[{/if}]>Österreich</option>
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Schweiz"}]SELECTED[{/if}]>Schweiz</option>
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Liechtenstein"}]SELECTED[{/if}]>Liechtenstein</option>
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Luxemburg"}]SELECTED[{/if}]>Luxemburg</option>
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Schweden"}]SELECTED[{/if}]>Schweden</option>
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Finnland"}]SELECTED[{/if}]>Finnland</option>
		    <OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Grossbritannien"}]SELECTED[{/if}]>Grossbritannien</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Irland"}]SELECTED[{/if}]>Irland</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Holland"}]SELECTED[{/if}]>Holland</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Belgien"}]SELECTED[{/if}]>Belgien</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Frankreich"}]SELECTED[{/if}]>Frankreich</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Portugal"}]SELECTED[{/if}]>Portugal</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Spanien"}]SELECTED[{/if}]>Spanien</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Italien"}]SELECTED[{/if}]>Italien</option>
			<OPTION [{ if $delivadr->oxaddress__oxcountry->value == "Griechenland"}]SELECTED[{/if}]>Griechenland</option>
	    	</select>
            </td>
        </tr>
        <tr>
            <td class="order">
            Fon
            </td>
            <td class="order">
            <input type="text" class="order" size="12" maxlength="[{$delivadr->oxaddress__oxfon->fldmax_length}]" name="deladr[oxaddress__oxfon]" value="[{$delivadr->oxaddress__oxfon->value }]">
            </td>
        </tr>
        <tr>
            <td class="order">
            Fax
            </td>
            <td class="order">
            <input type="text" class="order" size="12" maxlength="[{$delivadr->oxaddress__oxfax->fldmax_length}]" name="deladr[oxaddress__oxfax]" value="[{$delivadr->oxaddress__oxfax->value }]">
            </td>
        </tr>
        </table>
		<br>
    </td>
    </tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="2" width="100%">
		<tr>
		<td valign="top" bgcolor="#CECDCD" class="stepnext" style="border : 1px #494949; border-style : none none solid solid;">&nbsp;
		</td>
		<td class="basketsum" bgcolor="#CECDCD" style="border : 1px #494949; border-style : none solid solid none;" align="right" valign="middle">
		<input type="image" src="[{$shop->imagedir}]/user_nextstep.gif" alt="Weiter zur Kasse" align="absmiddle">
		&nbsp;&nbsp;
		</td>
		</tr>
	</table>
    </form>
	
	
	[{ if $toparticle }]
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td class="aktionhead" align="center" height="17" width="290">Jetzt g&uuml;nstig !</td>
	</tr>
	<tr>
	<td class="aktionmain" align="left">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
		    <td class="startpageProduct" height="120" align="middle">
			    <a class="startpageProduct" href="[{ $toparticle->oxdetaillink}]"><img src="[{$shop->dimagedir}]/[{$toparticle->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $toparticle->oxarticles__oxtitle->value }]"></a>
		    </td>
		    <td width="131" class="searchitem" style="padding-left: 5px;">
			
				<table border="0" cellspacing="0" cellpadding="0">
				<tr>
				<td class="aktion" height="15">[{ $toparticle->oxarticles__oxtitle->value }]</td>
				<td class="aktion"></td>
				</tr>
				<tr>
				<td class="aktionhighlight" height="15"><b>Jetzt nur [{ $toparticle->fprice }] [{ $currency->sign}] !!</b></td>
				</tr>
				<tr>
				<td class="aktion" height="25">
					<table border="0" cellspacing="0" cellpadding="0">
					<tr>
					<td class="aktion" width="120"><a class="aktion" href="[{ $toparticle->oxdetaillink}]">mehr Infos</a></td>
					<td class="aktion"><a href="[{ $toparticle->tobasketlink }]&am=1"><img src="[{$shop->imagedir}]/tobasket_button.gif" alt="in den Warenkorb" border="0" hspace="0" vspace="0" ></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					</table>
				</td>
				</tr>
				</table>
		    </td>
		</tr>
		</table>	
	</td>
	</tr>
	</table>
	[{/if}]
	
    </td>
    </tr>
    </table>
</td></tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
