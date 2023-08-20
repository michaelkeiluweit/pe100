<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MALL Startpage</title>
    <link rel="stylesheet" href="[{$shop->basetpldir}]style.css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

MALL Startseite<br>
<br><br>

Aktive Kategorie : [{ $actCategory->oxcategories__oxtitle->value}]<br>
<br>
[{include file="cmp_categories.tpl" Tree=$oxcmp_categories sSpacer=""}]
<br>
Sprachen :
<br>
[{include file="cmp_lang.tpl" }]
<br><br><br>
Shops :<br>
<br>
[{foreach from=$shopList item=oShop}]
<a href="[{$shop->selflink}]&cl=mallstart&fnc=chshp&shp=[{ $oShop->oxshops__oxid->value }]" class="categorylink">[{ $oShop->oxshops__oxname->value }]</a><br>
[{/foreach}]


</body>
</html>
