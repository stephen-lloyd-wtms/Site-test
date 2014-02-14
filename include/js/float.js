//<script>
function chaserRollover(imgid,imgsrc)
{
	nnstr=(document.layers)?"document.layers.CC.":""
	eval(nnstr+"document.images['"+imgid+"'].src='"+imgsrc+"'")
}


function ClassChaser(divName, objName,takeOffTop, takeOffBottom)
{
	// note the object is assuming that the magins of the HTML page are set to 0
	//Properties
	this.objName=objName 
	this.name=divName
	this.takeOffTop=(takeOffTop!=null)?parseInt(takeOffTop):0;			//default value to 0 
	this.takeOffBottom=(takeOffBottom!=null)?parseInt(takeOffBottom):0;	//default value to 0 
	this.startPos												//position where the div start chasing from
	this.endPos													//position where the div end chasing in	
	this.styleRef												//refers to div styles according to browsers
	this.divObj													//div object reference
	this.availableScrollingHeight								//available height for the div to scroll in
	this.divHeight												//chaserHeight
	this.callRate = 10
	this.slideTime = 1200
	this.A
	this.B
	this.C
	this.D
	this.interval
	this.initialised
	
	
	//methods
	this.init = m_sw_init;	
	this.findObj = m_sw_findObj;
	this.main =	m_sw_main;
	this.slide = m_sw_slide;
	this.slideInit = m_sw_slideInit;
	this.startChase = m_sw_startChase;
}
function m_sw_init()
{
	this.macstr='MacPPC'
	this.ismac = (navigator.platform == this.macstr)
	//alert('hello');
	this.styleRef=(document.layers)?"":".style"
	this.divObj=this.findObj(this.name)
	//position layer
	eval("this.divObj"+this.styleRef+".top=this.takeOffTop")
	this.divHeight=(document.layers)?parseInt(this.divObj.document.height):((document.all)?parseInt(this.divObj.clientHeight):parseInt(this.divObj.offsetHeight))
	this.availableScrollingHeight=((document.all)?((this.ismac)?parseInt(document.body.offsetHeight):parseInt(document.body.scrollHeight)):parseInt(document.height))-this.takeOffTop-this.takeOffBottom-this.divHeight
	this.startPos=this.takeOffTop
	this.endPos=this.availableScrollingHeight+this.takeOffTop;
	this.initialised=true
	if (!document.all)
	{
		eval("this.interval=setInterval(\'"+this.objName+".main()\',this.callRate)");//this.callRate
	}
}

function m_sw_findObj(n,d) { 
	var p,i,x;  
	if(!d) d=document; 
	if((p=n.indexOf("?"))>0&&parent.frames.length) 
	{
	    	d=parent.frames[n.substring(p+1)].document; 
		n=n.substring(0,p);
	}
	//Case IE
	if(!(x=d[n])&&d.all) 
		x=d.all[n]; 
	for (i=0;!x&&i<d.forms.length;i++) 
		x=d.forms[i][n];
	//Case NN
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) 
		x=this.findObj(n,d.layers[i].document);
	//Case NN6
	if(!x && d.getElementById) 
		x=d.getElementById(n); 
	return x;
}

function m_sw_main()
{
	eval("this.currentY=parseInt(this.divObj"+this.styleRef+".top)")
	this.scrollTop	= (document.all)?parseInt(getScrollPos()):parseInt(window.pageYOffset);
	var newTargetY	= this.scrollTop +(this.startPos)
		
	if ( this.currentY != newTargetY ) {

		if ( newTargetY != this.targetY ) {

			this.targetY = newTargetY
			if (this.availableScrollingHeight>0)
				this.slideInit( )
	
		}
	if (this.availableScrollingHeight>0)
		this.slide( )
		
	}
}

function m_sw_slideInit()
{
	var now	= new Date( )
	this.A		= this.targetY - this.currentY
	this.B		= Math.PI / ( 2 * this.slideTime )
	this.C		= now.getTime( )

	if (Math.abs(this.A) > this.availableScrollingHeight) {
		this.D = this.A > 0 ? this.targetY - this.availableScrollingHeight : this.targetY + this.availableScrollingHeight
		this.A = this.A > 0 ? this.availableScrollingHeight : -this.availableScrollingHeight
	} else {
		this.D = this.currentY
	}
}




function m_sw_slide()
{
	var now	= new Date( )
	var newY	= this.A * Math.sin( this.B * ( now.getTime( ) - this.C ) ) + this.D
	newY		= Math.round( newY )

	if (( (this.A > 0) && (newY > this.currentY) && (newY<=this.endPos)) ||
		( (this.A < 0) && (newY < this.currentY) && (newY<=this.endPos) )) {
			eval("this.divObj"+this.styleRef+".top=newY")
	}
	if ((newY==this.targetY)&& (this.interval)&&(document.all))
	{
		clearInterval(this.interval)
	}
}

function m_sw_startChase()
{
	//alert(getScrollPos());
	if ((document.all)&&(this.initialised))
	{
		if (this.interval)
		{	
			clearInterval(this.interval)
		}
		eval("this.interval=setInterval(\'"+this.objName+".main()\',this.callRate)");
	}
}

function SurfTo(PageLocation) {
	window.location.href = PageLocation;
}

function getScrollPos()
{
	var xmlpos = document.documentElement.scrollTop;
	var htmlpos = document.body.scrollTop;
	var retval = 0;	
	if (xmlpos == 0) retval = htmlpos;
	if (htmlpos == 0) retval = xmlpos;	
	return retval;
}

function getLeftScrollPos()
{
	var xmlpos = document.documentElement.scrollLeft;
	var htmlpos = document.body.scrollLeft;
	var retval = 0;	
	if (xmlpos == 0) retval = htmlpos;
	if (htmlpos == 0) retval = xmlpos;	
	return retval;
}
