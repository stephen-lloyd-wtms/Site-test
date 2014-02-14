//<script>
function validEmail(address) {
		address = address.toLowerCase();
		valids = "abcdefghijklmnopqrstuvwxyz0123456789@.-_";
		
		for (i=0; i < address.length; i++) 
		{
			testChar = address.charAt(i);
			if (valids.indexOf(testChar,0) == -1) {
				return false;
			}
		}
							
		atPos = address.indexOf("@",1);
		if (atPos == -1)
			return false;
						
		if (address.indexOf("@",atPos+1) != -1)
			return false;
						
		periodPos = address.indexOf(".",atPos);
		if (periodPos == -1)
			return false;
						
		if (periodPos+3 > address.length)
			return false;
		
		if (address.charAt(address.length-1)=='.')	
			return false;
		
		return(true);
	}
	
	//function rollover(imgid,imgsrc)
	//{
	//	document.images[imgid].src=imgsrc;	
	//}
	
	function emptyField(obj,str)
	{
		if(obj.value == str)
		{
			obj.value = "";
		}
	}
		function rollover(imgid,imgsrc)
	{
		eval("document.images['"+imgid+"'].src='"+imgsrc+"'")
	}
	
//</script>