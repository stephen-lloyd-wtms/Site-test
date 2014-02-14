<%@ Language=VBScript %>
<p class="flash"><script type="text/javascript" language="JavaScript">
<!--
var MM_contentVersion = 6;
var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"]) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
		var words = navigator.plugins["Shockwave Flash"].description.split(" ");
	    for (var i = 0; i < words.length; ++i)
	    {
		if (isNaN(parseInt(words[i])))
		continue;
		var MM_PluginVersion = words[i]; 
	    }
	var MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
}
else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0 
   && (navigator.appVersion.indexOf("Win") != -1)) {
	document.write('<scr' + 'ipt language=VBScript\> \n'); //FS hide this from IE4.5 Mac by splitting the tag
	document.write('on error resume next \n');
	document.write('MM_FlashCanPlay = ( IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
	document.write('</scr' + 'ipt\> \n');
}
if ( MM_FlashCanPlay ) {
		document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"');
	document.write('  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
	document.write(' id="xm" width="285" height="104"  align="">');
	document.write(' <param name="movie" value="/files/shockwave/xmlondon.swf"> <param name="quality" value="high"> <param name="bgcolor" value="#fff">  '); 
	document.write(' <embed src="/files/shockwave/xmlondon.swf" quality="high" bgcolor="#fff" ');
	document.write(' swLiveConnect="false" width="285" height="104" name="movie" align=""');
	document.write(' type="application/x-shockwave-flash" id="xm" plunginspace="http://www.macromedia.com/go/getflashplayer">');
	document.write(' </embed>');
	document.write(' </object>');
} else{
	document.write('<img src="/files/images/nma.gif" alt="New Media Edge" title="New Media Edge">');
}
//-->
</script><noscript><img src="/files/images/nma.gif" alt="New Media Edge" title="New Media Edge" border="0" / WIDTH="288" HEIGHT="88"></noscript>
</p>
