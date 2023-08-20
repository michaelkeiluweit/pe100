[{include file="headitem.tpl" title="Newsletter"}]
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
<b>Lassen Sie sich informieren!</b><br>
<br>
Mit dem [{ $oxcmp_shop->oxshops__oxname->value }]-Newsletter alle paar Wochen. <br>
Mit Tipps, Infos, Aktionen... <br>
<br>
Das Abo kann jederzeit durch Austragen der Email beendet werden. <br>
Eine <b>Weitergabe Ihrer Daten an Dritte lehnen wir ab</b>. <br>
    <br>
Sie bekommen zur Best&auml;tigung nach dem Abonnement eine eMail - so stellen wir sicher,
das kein unbefugter Sie in unseren Newsletter eintragen kann. ( sog. "Double Opt-In" )<br>
    <br>
        <table border="0" cellspacing="0" cellpadding="0">
            <form action="index.php" method="post">
            [{ $shop->hiddensid }]
            <input type="hidden" name="fnc" value="send">
            <input type="hidden" name="cl" value="newsletter">
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
        	
        	<td class="defaultcontent">Passwort&nbsp;&nbsp;</td>
        	<td class="defaultcontent">
              <input type="Text" name="editval[oxuser__oxpassword]" size=40 maxlength=40 value="" class="defaultcontent">&nbsp;<b>*</b><br>
              Mit diesem Passwort k&ouml;nnen Sie sich sp&auml;ter auch in unserem Shop einloggen, so sparen Sie sich die l&auml;stige Doppel Eingabe Ihrer Daten.<br>
              <br>
            </td>
        </tr>
        <tr>
        	<td valign="top" class="defaultcontent"></td>
        	<td valign="top" class="defaultcontenthigh">Felder mit einem <b>*</b> m&uuml;ssen ausgef&uuml;llt werden.</td>
        </tr>
        [{ if $error == 1 }]
        <tr>
        	<td valign="top" class="defaultcontent"></td>
        	<td valign="top" class="defaultcontenthigh"><br><b>Bitte alle Felder mit * ausf&uuml;llen !</b></td>
        </tr>
        [{/if}]
        [{ if $error == 2 }]
        <tr>
        	<td valign="top" class="defaultcontent"></td>
        	<td valign="top" class="defaultcontenthigh"><br><b>eMail Adresse ist bereits vorhanden !</b></td>
        </tr>
        [{/if}]
        <tr>
        	<td class="defaultcontent"></td>
        	<td class="defaultcontent"><br>
            <input  class="defaultcontent" type="submit" value="Newsletter abonnieren">
            </td>
        </tr>
        </form>
        </table>    
    [{elseif $success == 1}]
    Vielen Dank f&uuml;r das Abonnement unseres Newsletters.<br>
    <br>
    Sie haben soeben eine eMail erhalten, die mit der Sie unseren Newsletter freischalten k&ouml;nnen.<br>
    <br>
    [{elseif $success == 2}]
    Herzlichen Gl&uuml;ckwunsch !<br>
    <br>
    Sie sind nun freigeschaltet f&uuml;r den Empfang unseres Newsletters.<br>
    <br>
    [{elseif $success == 3}]
    Erfolg !<br>
    <br>
    Sie haben den Empfang unseres Newsletters erfolgreich abbestellt.<br>
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
