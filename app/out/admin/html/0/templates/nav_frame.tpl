<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
    <title>[OXID Administrator]</title>
</head>

<!-- frames -->
<frameset  rows="317,227,*" border="0">
    <frame src="[{$shop->selflink}]?cl=navigation&sid=[{$shop->sid}]&item=navigation.tpl" name="navigation" id="navigation" frameborder="0" scrolling="no" noresize marginwidth="0" marginheight="0">
	[{ if $isdemoversion }]
    <frame src="http://www.nfq-esales.de/dinc/admin.html?cl=admin" name="adminfrm" id="adminfrm" frameborder="0" scrolling="no" noresize marginwidth="0" marginheight="0">
	<frame src="http://www.nfq-esales.de/dinc/version.html?cl=admin" name="versionfrm" id="versionfrm" frameborder="0" scrolling="no" noresize marginwidth="0" marginheight="0">
	[{else}]
    <frame src="http://www.nfq-esales.de/ainc/admin.html?cl=admin" name="adminfrm" id="adminfrm" frameborder="0" scrolling="no" noresize marginwidth="0" marginheight="0">
	<frame src="http://www.nfq-esales.de/ainc/version.html?cl=admin" name="versionfrm" id="versionfrm" frameborder="0" scrolling="no" noresize marginwidth="0" marginheight="0">
	[{/if}]
</frameset>

</html>