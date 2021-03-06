<?php
// Function to work out correct summer time zone regardless of web platform,
// according to The Ninth European Parliament and Council Directive on 
// Summer Time Arrangements

// Declare some start variables
$ThisYear = (date("Y"));
$MarStartDate = ($ThisYear."-03-25");
$OctStartDate = ($ThisYear."-10-25");
$MarEndDate = ($ThisYear."-03-31");
$OctEndDate = ($ThisYear."-10-31");

//work out the Unix timestamp for 1:00am GMT on the last Sunday of March, when BST starts
while ($MarStartDate <= $MarEndDate) {
	$day = date("l", strtotime($MarStartDate));
	if ($day == "Sunday"){
		$BSTStartDate = ($MarStartDate);
	}
	$MarStartDate++;
}
$BSTStartDate = (date("U", strtotime($BSTStartDate))+(60*60));
//echo "BST this year starts at 1:00am GMT on ".date("l, dS M", $BSTStartDate)."<br>";

//work out the Unix timestamp for 1:00am GMT on the last Sunday of October, when BST ends
while ($OctStartDate <= $OctEndDate) {
	$day = date("l", strtotime($OctStartDate));
	if ($day == "Sunday"){
		$BSTEndDate = ($OctStartDate);
	}
	$OctStartDate++;
}
$BSTEndDate = (date("U", strtotime($BSTEndDate))+(60*60));
//echo "BST this year ends at 1:00am GMT on ".date("l, dS M", $BSTEndDate)."<br>";

//Check to see if we are now in BST
$now = mktime();
if (($now >= $BSTStartDate) && ($now <= $BSTEndDate)){
	$T = "BST";
} else {
	$T = "GMT";
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">

<head>

<title>Globe</title>

<script type="text/javascript"><!--
	function changeImageMode(str)
	{
		//alert(str)
		var objImage=document.images['TheGlobe'];
		//alert(objImage)
		if(objImage.src.indexOf('h_panel_globe_blank.jpg')>0)
		{
			objImage.src='../../files/images/h_globe_<?php echo date("H"); ?>_'+ str +'.jpg'
		}
		else
		{
			if (objImage.src.indexOf("day")>0)
			{
				objImage.src=objImage.src.replace('day', str)
			}
			else
			{
				objImage.src=objImage.src.replace('night', str)
			}
		}
	}

function rollover(imgid,imgsrc)

{
	eval("document.images['"+imgid+"'].src='"+imgsrc+"'")
}
//--></script>
<script type="text/javascript" src="../js/extra.js"></script>
<link rel="stylesheet" href="../../styles/generic.css" type="text/css" />
<style type="text/css">
body {margin:0; padding:0; background-color: 1a2215;}
</style>
</head>
<body>
<?php

	echo "<div id=\"globe\"><p class=\"homeglobe\">";

	if (isset($_GET['mode'])) {
		if ($_GET['mode'] == "day") {
			$m = "globe_".date("H")."_day.jpg";
		} elseif ($_GET['mode'] == "night") {
			$m = "globe_".date("H")."_night.jpg";
		}
	} else {
		$m = "panel_globe_blank.jpg";
	}
	echo "<img id=\"TheGlobe\" name=\"TheGlobe\" src=\"../../files/images/h_".$m."\" alt=\"".date("H:i")."\" width=\"139\" height=\"149\" border=\"0\" /><br />";

?>
<img src="../../files/images/h_click_to_view.gif" alt="Click to view" title="Click to view" width="139" height="12" border="0" /><br />
<a href="?mode=day" onMouseOut="rollover('img101','../../files/images/h_btn_daylight_off.gif')" onblur="rollover('img101','../../files/images/h_btn_daylight_off.gif')" onmouseover="rollover('img101','../../files/images/h_btn_daylight_on.gif')" onfocus="rollover('img101','../../files/images/h_btn_daylight_on.gif')" onclick="changeImageMode('day');return(false);"  onkeypress="changeImageMode('day');return(false);" title="Daylight"><img alt="Daylight" id="img101" title="Daylight" src="../../files/images/h_btn_daylight_off.gif" border="0" /></a><a href="?mode=night" onMouseOut="rollover('img102','../../files/images/h_btn_darkness_off.gif')" onblur="rollover('img102','../../files/images/h_btn_darkness_off.gif')" onmouseover="rollover('img102','../../files/images/h_btn_darkness_on.gif')" onfocus="rollover('img102','../../files/images/h_btn_darkness_on.gif')" onclick="changeImageMode('night');return(false);" onkeypress="changeImageMode('night');return(false);" title="Darkness"><img alt="Darkness" id="img102" title="Darkness" src="../../files/images/h_btn_darkness_off.gif" border="0" /></a></p>
<?php

	echo "<p class=\"homeglobedetail\"><img alt=\"\" border=\"0\" height=\"13\" src=\"../../files/images/h_icon_calendar.gif\" title=\"calendar icon\" width=\"13\" /> ".date("d.m.Y")."</p>";
	echo "<p class=\"homeglobedetail\"><img alt=\"\" border=\"0\" height=\"13\" src=\"../../files/images/h_icon_time.gif\" title=\"clock icon\" width=\"13\" /> ".date("H:i")." ".$T."</p></div>";

?></body>

</html>