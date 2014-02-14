//<script>

function newImage(arg) {
	if (document.images) {
		rslt = new Image();
		rslt.src = arg;
		return rslt;
	}
}

function changeImages() {
	if (document.images && (preloadFlag == true)) {
		for (var i=0; i<changeImages.arguments.length; i+=2) {
			document[changeImages.arguments[i]].src = changeImages.arguments[i+1];
		}
	}
}

var preloadFlag = false;

function preloadImages() {
	if (document.images) {
		case_study_unilever_01_over = newImage("files/images/case_study_unilever_01-over.gif");
		casestudy_secondary_06_rol_01_over = newImage("files/images/casestudy_secondary_06_r-02.gif");
		casestudy_sec_19_roll_01_over = newImage("files/images/casestudy_sec_19_roll_01-ov.gif");
		preloadFlag = true;
	}
}

function swapOptions(address){
	location.href = address+".html";
}

var objectTag='<div id=\"background\"><a href=\"#\" onmouseover=\"hideMovie()\"><img src=\"files/images/spacer.gif\" width=\"225\" height=\"100\" border=\"0\"></a></div><div id=\"foreground\">'
objectTag+='<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\"  codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0\" id=swfmovie width=204 height=\"78\">'
objectTag+='<param name=movie value=\"http://www.ccgxm.com/CCGXMmap.swf\"><param name=quality value=high><param name=bgcolor value=#000000>'
objectTag+='<embed src=\"http://www.ccgxm.com/CCGXMmap.swf\" quality=high bgcolor=#000000  width=204 height=78 type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash\"></embed>'
objectTag+='</object></div>'
//alert(objectTag)
function showMovie(){
	if(document.layers){
		document.map.document.open();
		document.map.document.write(objectTag);
	}
	else
		map.innerHTML=objectTag;
	divMap.css.visibility=visible;
	changeImages("globe","/files/images/spacer.gif");
}
function hideMovie(){
	if(document.layers){
		document.map.document.open();
		document.map.document.write("&nbsp");
	}
	else
		map.innerHTML="";
	divMap.css.visibility=hidden;
	changeImages("globe","/files/images/globe.gif");
}