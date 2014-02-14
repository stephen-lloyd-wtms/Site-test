//<script>


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



//</script>