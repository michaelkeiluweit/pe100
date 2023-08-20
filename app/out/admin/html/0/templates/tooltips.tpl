<script language=javascript type="text/javascript">

<!-- Hide script from older browsers
if (document.all)
{
    docObj="document.all."
    styleObj=".style"
}

function popUp(evt,currElem)
{
    popUpWin = eval(docObj + currElem + styleObj)
    popUpWin.top = Math.max(2,parseInt(evt.y) - 20)
    popUpWin.left= Math.max(2,parseInt(evt.x) + 20)
    popUpWin.visibility = "visible"
    window.status = ""
}
function popDown(currElem)
{
    popUpWin = eval(docObj + currElem + styleObj)
    popUpWin.visibility ="hidden"
}

// End hiding script -->

</script>

<span class="popUpStyle" id="user_new" style="position: absolute;visibility: hidden;">Neuer Benutzer</span>
<span class="popUpStyle" id="user_result" style="position: absolute;visibility: hidden;">Benutzerliste &ouml;ffnen</span>
<span class="popUpStyle" id="user_newaddress" style="position: absolute;visibility: hidden;">Neue Adresse</span>
<span class="popUpStyle" id="user_newpayment" style="position: absolute;visibility: hidden;">Neue Zahlmethode</span>
<span class="popUpStyle" id="user_newremark" style="position: absolute;visibility: hidden;">Notiz anf&uuml;gen</span>
<span class="popUpStyle" id="item_delete" style="position: absolute;visibility: hidden;">Eintrag löschen</span>
<span class="popUpStyle" id="payment_new" style="position: absolute;visibility: hidden;">Neue Bezahlmethode</span>
<span class="popUpStyle" id="newsletter_new" style="position: absolute;visibility: hidden;">Neue Newsletter Vorlage</span>
<span class="popUpStyle" id="addsumtype" style="position: absolute;visibility: hidden; z-index: 1;">Absoluter oder<br>prozentualer<br>Auf/Abschlag</span>
<span class="popUpStyle" id="shop_new" style="position: absolute;visibility: hidden;">Neuen Shop anlegen</span>
<span class="popUpStyle" id="usergroup_new" style="position: absolute;visibility: hidden;">Neue Benutzergruppe anlegen</span>
<span class="popUpStyle" id="category_new" style="position: absolute;visibility: hidden;">Neue Kategorie anlegen</span>
<span class="popUpStyle" id="mallcategory_new" style="position: absolute;visibility: hidden;">Neue Mall Kategorie anlegen</span>
<span class="popUpStyle" id="article_new" style="position: absolute;visibility: hidden;">Neuen Artikel anlegen</span>
<span class="popUpStyle" id="article_vat" style="position: absolute;visibility: hidden;">Nur falls spezielle Mwst. hier ausfüllen</span>
<span class="popUpStyle" id="article_vonbis" style="position: absolute;visibility: hidden;">Amerikanisches Format : 2003-MM-TT HH-MM-SS</span>
<span class="popUpStyle" id="article_stock" style="position: absolute;visibility: hidden;">-1 = keine Lagerverwaltung aktiv</span>
<span class="popUpStyle" id="article_delivery" style="position: absolute;visibility: hidden;">0000-00-00 = kein Lieferdatum angeben, bzw. sofort</span>
<span class="popUpStyle" id="article_template" style="position: absolute;visibility: hidden;">Dateiname des Templates<br>falls nicht Standard</span>
<span class="popUpStyle" id="attribute_new" style="position: absolute;visibility: hidden;">Neues Attribute anlegen</span>
<span class="popUpStyle" id="article_variant_new" style="position: absolute;visibility: hidden;">Neue [{ if $issubvariant}]Unter[{/if}]Variante anlegen</span>
<span class="popUpStyle" id="selectlist_new" style="position: absolute;visibility: hidden;">Neue Auswahlliste anlegen</span>
<span class="popUpStyle" id="selectlist_valdesc" style="position: absolute;visibility: hidden;">Eintrag1__@@Eintrag2__@@ usw.</span>
<span class="popUpStyle" id="discount_new" style="position: absolute;visibility: hidden;">Neuen Rabatt anlegen</span>
<span class="popUpStyle" id="vat_new" style="position: absolute;visibility: hidden;">Neuen Mwst. Satz anlegen</span>
<span class="popUpStyle" id="delivery_new" style="position: absolute;visibility: hidden;">Neue Versandkosten anlegen</span>
<span class="popUpStyle" id="order_date" style="position: absolute;visibility: hidden;">Format : YYYY-MM-DD</span>


