//<script language="JavaScript1.2">

ie=(document.all)?true:false;
ns=(document.layers)?true:false;
moz=(document.getElementById)?true:false;
scrollTimer=null
function write(s){document.open();document.write(s);document.close()}
function scrollBox(x,y,w,h,a,c,id){
	this.x=x;this.y=y;this.h=h;this.w=w;this.a=a
	if(c!=null)this.c="background-color:"+c;this.id=id
	if(a=="hor"){this.hor=true};if(a=="ver"){this.ver=true}
	write("<style type='text/css'>#"+this.id+"{position:absolute;left:"+this.x+";top:"+this.y+";")
	if(this.ver)write("width:"+this.w+";");if(this.hor)write("height:"+this.h+";")
	if(c!=null)write(this.c+";layer-"+this.c+";")
	write("clip:rect(0,"+this.w+","+this.h+",0);z-index:15;}</style>")
}




function upBtn(){write("<a href='#' onmousedown='scrollTimer = setInterval(\""+this.id+".scrollUp()\",10);return;' onmouseup='clearTimeout(scrollTimer)' onmouseout='clearTimeout(scrollTimer)'><img src='/media/images/scroll/upButton_e15.gif' border=0></a>")}
function dnBtn(){write("<a href='#' onmousedown='scrollTimer = setInterval(\""+this.id+".scrollDn()\",10);return;' onmouseup='clearTimeout(scrollTimer)' onmouseout='clearTimeout(scrollTimer)'><img src='/media/images/scroll/dnButton_e16.gif' border=0></a>")}
function ltBtn(){write("<a href='#' onmousedown='scrollTimer = setInterval(\""+this.id+".scrollLt()\",10);return;' onmouseup='clearTimeout(scrollTimer)' onmouseout='clearTimeout(scrollTimer)'><img src='/media/images/scroll/ltButton_e17.gif' border=0></a>")}
function rtBtn(){write("<a href='#' onmousedown='scrollTimer = setInterval(\""+this.id+".scrollRt()\",10);return;' onmouseup='clearTimeout(scrollTimer)' onmouseout='clearTimeout(scrollTimer)'><img src='/media/images/scroll/rtButton_e18.gif' border=0></a>")}
function activate(){
	if(ie)document.all[this.id].style.top=this.y
	if(ie)document.all[this.id].style.left=this.x
	if(moz)document.getElementById(this.id).style.top=this.y
	if(moz)document.getElementById(this.id).style.left=this.x
	this.ct=0;this.cb=this.h;this.cl=0;this.cr=this.w
	if(ie){this.hand=document.all[this.id].style;this.th=document.all[this.id].offsetHeight;this.tw=document.all[this.id].offsetWidth}
	if(ns){if(ns)this.hand=document[this.id];if(ns)this.th=this.hand.document.height;if(ns)this.tw=this.hand.document.width}
	if(moz){this.hand=document.getElementById(this.id).style;this.th=document.getElementById(this.id).offsetHeight;this.tw=document.getElementById(this.id).offsetWidth}
	this.currentY=parseInt(this.hand.top)
	this.currentX=parseInt(this.hand.left)
}
function scrollDn(){
	if (this.currentY>(this.y+this.h-this.th)){
		this.currentY-=5;this.ct+=5;this.cb+=5
		this.hand.top=this.currentY
		if(ie || moz){this.hand.clip="rect("+this.ct+" "+this.w+" "+this.cb+" 0)"}
		if(ns){this.hand.clip.top=this.ct;this.hand.clip.bottom=this.cb}
	}
}
function scrollUp(){
	if (this.currentY<(this.y)){
		this.currentY+=5;this.ct-=5;this.cb-=5
		this.hand.top=this.currentY
		if(ie || moz){this.hand.clip="rect("+this.ct+" "+this.w+" "+this.cb+" 0)"}
		if(ns){this.hand.clip.top=this.ct;this.hand.clip.bottom=this.cb}
	}
}
function scrollRt(){
	if (this.currentX>(this.x+this.w-this.tw)){
		this.currentX-=5;this.cl+=5;this.cr+=5
		this.hand.left=this.currentX
		if(ie || moz){this.hand.clip="rect(0 "+this.cr+" "+this.h+" "+this.cl+")"}
		if(ns){this.hand.clip.left=this.cl;this.hand.clip.right=this.cr}
	}
}
function scrollLt(){
	if (this.currentX<this.x){
		this.currentX+=5;this.cl-=5;this.cr-=5
		this.hand.left=this.currentX
		if(ie || moz){this.hand.clip="rect(0 "+this.cr+" "+this.h+" "+this.cl+")"}
		if(ns){this.hand.clip.left=this.cl;this.hand.clip.right=this.cr}
	}
}
scrollBox.prototype.activate=activate
scrollBox.prototype.upBtn=upBtn
scrollBox.prototype.dnBtn=dnBtn
scrollBox.prototype.ltBtn=ltBtn
scrollBox.prototype.rtBtn=rtBtn
scrollBox.prototype.scrollDn=scrollDn
scrollBox.prototype.scrollUp=scrollUp
scrollBox.prototype.scrollLt=scrollLt
scrollBox.prototype.scrollRt=scrollRt

//</script>
