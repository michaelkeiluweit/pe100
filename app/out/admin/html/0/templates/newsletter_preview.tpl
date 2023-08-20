<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="newsletter_preview">
</form>
<hr>
<b>PLAIN TEXT</b>:<br>
[{ $previewtext }]
<hr>
<b>HTML</b>:<br>
[{ $previewhtml }]



