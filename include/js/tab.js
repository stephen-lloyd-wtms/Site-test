//<script language="javascript" type="text/javascript">
	
	var currentSelection="Eng";

	function preload()
	{
		imgTabEng = new Image()
		imgTabEng.src = '/files/images/HM_A_tabeng_over.gif';
		
		imgTabScot = new Image()
		imgTabScot.src = '/files/images/HM_A_tabScot_over.gif';
		
		imgTabUK = new Image()
		imgTabUK.src = '/files/images/HM_A_tabUK_over.gif';
	}
	
	function changeSelection(str)
	{
		newSelection=str
		if (newSelection!=currentSelection)
		{
			if (currentSelection!='')
				eval("document.images['"+currentSelection+"'].src='/files/images/HM_A_tab"+currentSelection+".gif'")				
			eval("document.images['"+newSelection+"'].src='/files/images/HM_A_tab"+newSelection+"_over.gif'")
			currentSelection=newSelection	
			FillOptions(newSelection)
			document.forms[0].action=newSelection+".asp"
		}
	}
		
	function FillOptions(selection)
	{	
		document.forms[0].select1.length=1;
		
		var newoption = new Option(' ','0');
		document.forms[0].select1.options[0]=newoption
				
		eval("len="+selection+"Text.length")	
		for (var i=0; i < len; i++)
		{	
			document.forms[0].select1.length=i+1;
			eval("newoption= new Option("+selection+"Text[i]),"+selection+"Value[i]");
			document.forms[0].select1.options[i]=newoption;
		}
		document.forms[0].select1.selectedIndex=0
	}
	
	function init()
	{
		preload();
		changeSelection('Eng');
	}
	
	function NNReload()
	{
		if (document.layers)
			history.go(0)
	}
