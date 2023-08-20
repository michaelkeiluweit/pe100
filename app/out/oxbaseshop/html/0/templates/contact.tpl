[{include file="headitem.tpl" title="Kontakt"}]
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">
[{include file="pagehead.tpl"}]
<!-- Content Start -->
<tr>
<td valign="top">

    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    [{include file="leftitem.tpl"}]
	<td width="15"></td>
    <td class="defaultcontent" style="padding-right: 10px;">
    [{ if !$success }]
        <table border="0" cellspacing="0" cellpadding="0">
            <form action="index.php" method="post">
            [{ $shop->hiddensid }]
            <input type="hidden" name="fnc" value="send">
            <input type="hidden" name="cl" value="contact">
        <tr>
        	<td class="defaultcontent">Anrede&nbsp;&nbsp;</td>
        	<td class="defaultcontent">
              <select name="editval[oxuser__oxsal]" option="" class="defaultcontent">
        	  	<option>Herr</option>
        		<option>Frau</option>
        	  </select>
        	</td>
        </tr>
        <tr>
        	
        	<td class="defaultcontent">Vorname&nbsp;&nbsp;</td>
        	<td class="defaultcontent">
              <input type="Text" name="editval[oxuser__oxfname]" size=40 maxlength=40 value="" class="defaultcontent">&nbsp;<b>*</b>
        	</td>
        </tr>
        <tr>
        	
        	<td class="defaultcontent">Nachname&nbsp;&nbsp;</td>
        	<td class="defaultcontent">
              <input type="Text" name="editval[oxuser__oxlname]" size=40 maxlength=40 value="" class="defaultcontent">&nbsp;<b>*</b>
        	  </td>
        </tr>
        <tr>
        	
        	<td class="defaultcontent">e-Mail&nbsp;&nbsp;</td>
        	<td class="defaultcontent">
              <input type="Text" name="editval[oxuser__oxusername]" size=40 maxlength=40 value="" class="defaultcontent">&nbsp;<b>*</b>
              </td>
        </tr>
        <tr>
        	
        	<td class="defaultcontent">Betreff&nbsp;&nbsp;</td>
        	<td class="defaultcontent">
              <input type="Text" name="c_subject" size=60 maxlength=80 value="[{$c_subject}]" class="defaultcontent"><b>*</b>
              </td>
        </tr>
        <tr>
        	
        	<td valign="top" class="defaultcontent">Nachricht&nbsp;&nbsp;</td>
        	<td valign="top" class="defaultcontent"><textarea cols="60" rows="20" name="c_message" class="defaultcontent">[{$c_message}]</textarea>
            </td>
        </tr>
        <tr>
        	<td valign="top" class="defaultcontent"></td>
        	<td valign="top" class="defaultcontenthigh">Felder mit einem <b>*</b> m&uuml;ssen ausgef&uuml;llt werden.</td>
        </tr>
        [{ if $error }]
        <tr>
        	<td valign="top" class="defaultcontent"></td>
        	<td valign="top" class="defaultcontenthigh"><br><b>Bitte alle Felder mit * ausf&uuml;llen !</b></td>
        </tr>
        [{/if}]
        <tr>
        	<td class="defaultcontent"></td>
        	<td class="defaultcontent"><br>
            <input  class="defaultcontent" type="submit" value="Nachricht abschicken">
            </td>
        </tr>
        </form>
        </table>
    [{else}]
    Vielen Dank f&uuml;r Ihre Nachricht an [{ $oxcmp_shop->oxshops__oxname->value }].<br>
    <br>
    [{/if}]
    </td>
    [{include file="aktionitem.tpl"}]
    </tr>
    </table>

</td>
</tr>
<!-- Content Ende -->
[{include file="pagebottom.tpl"}]
</table>
</body>
</html>
