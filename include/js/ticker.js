//<script>
		function Ticker(objName, divName, width, height, textArray, linkArray)
	{
		this.DivName=divName;
		this.ObjName=objName;
		this.Width=width;
		this.Height=height;
		this.TextArray=textArray;
		this.LinkArray=linkArray;
		this.currentItem=0;
		this.CharTimer=50;
		this.TextTimer=5000;
		
	}
	
	Ticker.prototype.Init=m_init;
	Ticker.prototype.FindObj=findObj;
	Ticker.prototype.DisplayString=displayString;
	
	
	function m_init()
	{
		this.DivObj=this.FindObj(this.DivName);
		this.DivObj.style.width=this.Width + "px";
		this.DivObj.style.height=this.Height + "px";;
		this.DivObj.style.overflow="hidden";
		
		//this.DivObj.style.backgroundColor='#ffffff';
		//this.DivObj.style.color='green';
		//this.DivObj.style.fontWeight='bold';
		//this.DivObj.style.fontFamily='Verdana, Arial, Helvetica';
		//this.DivObj.style.fontSize='12px';
		
		this.CurrentCharThread;
		this.CurrentStringThread;
		
		
		this.CurrentItem=0;
		this.CurrentChar=1;
		this.DisplayString()
		this.DivObj.href=this.LinkArray[0];
	}
	
	function displayString()
	{
		this.DivObj.href=this.LinkArray[this.CurrentItem];
		this.DivObj.innerHTML=this.TextArray[this.CurrentItem].substring(0,this.CurrentChar);
		if (this.CurrentChar<this.TextArray[this.CurrentItem].length)
		{
			this.DivObj.innerHTML+="_";
			this.CurrentChar++;
			//if(this.CurrentCharThread!=null)
			//{
				clearTimeout(this.CurrentCharThread);
				this.CurrentCharThread=null;
				
			//}
			//alert(this.CurrentCharThread)
			this.CurrentCharThread=setTimeout(this.ObjName + ".DisplayString()", this.CharTimer)
		}
		else
		{
			if (this.CurrentItem<(this.TextArray.length-1))
			{
				this.CurrentItem++;
			}
			else
			{
				this.CurrentItem=0;
				
			}
			this.CurrentChar=1;
			//if(this.CurrentStringThread!=null)
			//{
				clearTimeout(this.CurrentStringThread);
				this.CurrentStringThread=null;
			//}
			this.CurrentStringThread=setTimeout(this.ObjName + ".DisplayString()", this.TextTimer);
		}
	}
	
	function findObj(n,d) { 
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
			x=findObj(n,d.layers[i].document);
		//Case NN6
		if(!x && d.getElementById) 
			x=d.getElementById(n); 
		return x;
	}
//</script>