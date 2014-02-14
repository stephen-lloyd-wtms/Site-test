var timer;
var loaded=0;
var strVisible="";

function toggleTextOnly() {
	var sOldLocation = window.location.href;
	if (sOldLocation.indexOf('/output/')) {
		var sNewLocation = sOldLocation.replace('/output/', '/textonly/');
	}
	else {
		var sNewLocation = sOldLocation.replace('/textonly/', '/output/');
	}
	window.location.href = sNewLocation;
}

function openwindow(iName){ 
	window.open("popup.html",iName,"status=no,toolbar=no,scrollbars=yes,left=100,top=100,width=550,height=600");

	}

function makeObj(div,nest){
	if(document.layers){
		if(nest){
			obj=eval("document."+nest+".document."+div);
		}
		else
			obj=eval("document."+div);
		this.css=obj;
	}
	else if(document.all){
		obj=div
		this.css=eval(obj+".style");
	}
	else{
		this.css=eval("document.getElementById(\""+div+"\").style");
	}
	this.check=check;
	this.show=show;
	this.hide=hide;
	this.delay=delay;
	this.highlight=highlight;
	hidden=(document.layers)?"hide":"hidden"
	visible=(document.layers)?"show":"visible"
}
function show(){
	if(strVisible!=this)
		hide();
	this.css.visibility=visible
	this.style.visibility=visible
	strVisible=this;
}
/*function check(){
	if(loaded==1)
		this.show();
	else
		return false;
}*/

function check(id)
{
	if(loaded==1)
		eval("document.all."+id+".style.visibility=''")
	else
		return false;
}

function hide(id){
	//alert('hide')
	//if(loaded==1)
		eval("document.all."+id+".style.visibility='hidden'")
	//else
	//	return false;
}

/*function hide(){
	if(strVisible!="")
		strVisible.css.visibility=hidden;
}*/
function delay(id){
	timer=eval("setTimeout('hide(\""+id+"\")',200)");
}
/*function delay(){
	timer=setTimeout('hide()',200);
}*/
function highlight(id,bgcolor,vis){
	eval("this."+vis+"()");
	if(document.layers)
		eval(id+".css.bgColor='"+bgcolor+"'");
	else
		eval(id+".css.backgroundColor='"+bgcolor+"'");
}
function init(){
	//divMenu1=new makeObj('menu1');
	//document.all.menu1.style.visibility='hidden';
	/*divmenu10=new makeObj('menu10','menu1');
	divmenu11=new makeObj('menu11','menu1');
	divmenu12=new makeObj('menu12','menu1');
	divMenu2=new makeObj('menu2');
	divmenu20=new makeObj('menu20','menu2');
	divmenu21=new makeObj('menu21','menu2');
	divmenu22=new makeObj('menu22','menu2');
	divmenu23=new makeObj('menu23','menu2');
	divMenu3=new makeObj('menu3');
	divmenu30=new makeObj('menu30','menu3');
	divmenu31=new makeObj('menu31','menu3');
	divmenu32=new makeObj('menu32','menu3');
	divmenu33=new makeObj('menu33','menu3');
	divmenu34=new makeObj('menu34','menu3');
	divmenu35=new makeObj('menu35','menu3');
	divmenu36=new makeObj('menu36','menu3')
	divmenu37=new makeObj('menu37','menu3')
	divmenu38=new makeObj('menu38','menu3')
	divmenu39=new makeObj('menu39','menu3')
	divmenu310=new makeObj('menu310','menu3')
	divmenu311=new makeObj('menu311','menu3')
	divmenu312=new makeObj('menu312','menu3')
	divmenu313=new makeObj('menu313','menu3')
	divmenu314=new makeObj('menu314','menu3')
	divMenu4=new makeObj('menu4')
	divmenu40=new makeObj('menu40','menu4')
	divmenu41=new makeObj('menu41','menu4')
	divmenu42=new makeObj('menu42','menu4')
	divMenu5=new makeObj('menu5')
	divMap=new makeObj('map')*/
	
	//divMenu5_0=new makeObj('menu5_0','menu5')
	//divMenu5_1=new makeObj('menu5_1','menu5')
	//divMenu5_2=new makeObj('menu5_2','menu5')
	//divMenu5_3=new makeObj('menu5_3','menu5')
	loaded=1;
}
