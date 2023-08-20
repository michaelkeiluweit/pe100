Vielen Dank fuer Ihre Bestellung!

Nachfolgend haben wir zur Kontrolle Ihre Bestellung noch einmal aufgelistet.
Bei Fragen sind wir jederzeit fuer Sie da: Schreiben Sie einfach an [{ $shop->oxshops__oxorderemail->value }] !

Bestellnr. [{ $order->oxorder__oxordernr->value }]
[{foreach from=$basket->aBasketContents item=basketitem}]  
[{ $basketitem->oProduct->oxarticles__oxtitle->value }]
[{ if $basketitem->chosen_selectlist }][{foreach from=$basketitem->chosen_selectlist item=oList}][{ $oList->name }] [{ $oList->value }][{/foreach}][{/if}]\n
Menge : [{$basketitem->dAmount}] 
Preis : [{ $basketitem->oProduct->fprice }] [{ $currency->name}]
Gesamt : [{ $basketitem->ftotalprice }] [{ $currency->name}]
[{/foreach}] 
------------------------------------------------------------------

Summe Produkte : [{ $basket->fproductsprice }] [{ $currency->name}]
davon Mwst. : [{ $basket->fVAT }] [{ $currency->name}]
Versandkosten : [{ $basket->fdeliverycost }] [{ $currency->name}]
[{ if $basket->dAddPaymentSum }]
Aufschlag Zahlungsart : [{ $basket->fAddPaymentSum }] [{ $currency->name}]
[{/if}]

Gesamtsumme : [{ $basket->fprice }] [{ $currency->name}]

Die Bezahlung erfolgt mit : [{ $payment->oxpayments__oxdesc->value }]

eMail Adresse : [{ $user->oxuser__oxusername->value }]

Rechnungsanschrift:  
[{ $order->oxorder__oxbillsal->value }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }]
[{if $order->oxorder__oxbilladdinfo->value }][{ $order->oxorder__oxbilladdinfo->value }][{/if}]
[{ $order->oxorder__oxbillstreet->value }]
[{ $order->oxorder__oxbillzip->value }] [{ $order->oxorder__oxbillcity->value }]
[{ $order->oxorder__oxbillcountry->value }]
Telefon: [{ $order->oxorder__oxbillfon->value }]

[{ if $order->oxorder__oxdellname->value }]Lieferanschrift:  
[{ $order->oxorder__oxdelsal->value }] [{ $order->oxorder__oxdelfname->value }] [{ $order->oxorder__oxdellname->value }]
[{if $order->oxorder__oxdeladdinfo->value }][{ $order->oxorder__oxdeladdinfo->value }][{/if}]
[{ $order->oxorder__oxdelstreet->value }]
[{ $order->oxorder__oxdelzip->value }] [{ $order->oxorder__oxdelcity->value }]
[{ $order->oxorder__oxdelcountry->value }]
[{/if}]

