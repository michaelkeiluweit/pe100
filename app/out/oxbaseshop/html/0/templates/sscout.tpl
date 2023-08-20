<html>
<head>
	<title>oxid article list</title>
	<link rel="stylesheet" href="[{$shop->basetpldir}]style.css">
</head>

<body>
[{if !$articlelist}]
Leider keine Artikel gefunden.
[{/if}]
<table border="0" cellspacing="0" cellpadding="0" width="100%">
[{foreach from=$articlelist item=article}]  
<tr>
<td class="defaultcontent">[{$article->title}]</td>
<td class="defaultcontent">[{$article->shortdesc}]</td>
<td class="defaultcontent">[{$article->price}]</td>
<td class="defaultcontent"><a href="[{$article->link}]" class="defaultcontent">deeplink</a></td>
</tr>
[{/foreach}]
</table>


</body>
</html>
