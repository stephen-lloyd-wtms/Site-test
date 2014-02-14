//<script>
function rollover(imgid,imgsrc)
{
	eval("document.images['"+imgid+"'].src='"+imgsrc+"'")
}

function emptyField(obj,str)
{
	if(obj.value == str)
	{
		obj.value = "";
	}
}

//</script>

