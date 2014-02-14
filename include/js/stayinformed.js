var contractsymbol1='<img src="/files/images/stayInformed_qf_dd_down.gif" /> '
var contractsymbol2='<img src="/files/images/stayInformed_uni_dd_down.gif" /> '
var contractsymbol3='<img src="/files/images/stayInformed_sr_dd_down.gif" /> '
var contractsymbol4='<img src="/files/images/stayInformed_edu_dd_down.gif" /> '
var contractsymbol5='<img src="/files/images/stayInformed_community_dd_d.gif" /> '
var expandsymbol1='<img src="/files/images/stayInformed_qf_dd_up.gif" /> '
var expandsymbol2='<img src="/files/images/stayInformed_uni_dd_up.gif" /> '
var expandsymbol3='<img src="/files/images/stayInformed_sr_dd_up.gif" /> '
var expandsymbol4='<img src="/files/images/stayInformed_edu_dd_up.gif" /> '
var expandsymbol5='<img src="/files/images/stayInformed_community_drop.gif" /> '


if (document.getElementById){
document.write('<style type="text/css">')
document.write('.switchcontent{display:none;}')
document.write('</style>')
}

function getElementbyClass(rootobj, classname){
var temparray=new Array()
var inc=0
for (i=0; i<rootobj.length; i++){
if (rootobj[i].className==classname)
temparray[inc++]=rootobj[i]
}
return temparray
}

function expandcontent(curobj, cid)
{
	var spantags=curobj.getElementsByTagName("SPAN")
	var showstateobj1=getElementbyClass(spantags, "showstate1")
	var showstateobj2=getElementbyClass(spantags, "showstate2")
	var showstateobj3=getElementbyClass(spantags, "showstate3")
	var showstateobj4=getElementbyClass(spantags, "showstate4")
	var showstateobj5=getElementbyClass(spantags, "showstate5")
	if (ccollect.length>0)
	{
		document.getElementById(cid).style.display=(document.getElementById(cid).style.display!="block")? "block" : "none"
		if (showstateobj1.length>0)
		{ 	
		showstateobj1[0].innerHTML=(document.getElementById(cid).style.display=="block")? contractsymbol1 : expandsymbol1
		}
		if (showstateobj2.length>0)
		{ 
			showstateobj2[0].innerHTML=(document.getElementById(cid).style.display=="block")? contractsymbol2 : expandsymbol2
		}
		if (showstateobj3.length>0)
		{ 
			showstateobj3[0].innerHTML=(document.getElementById(cid).style.display=="block")? contractsymbol3 : expandsymbol3
		}
		if (showstateobj4.length>0)
		{ 
			showstateobj4[0].innerHTML=(document.getElementById(cid).style.display=="block")? contractsymbol4 : expandsymbol4
		}
		if (showstateobj5.length>0)
		{ 
			showstateobj5[0].innerHTML=(document.getElementById(cid).style.display=="block")? contractsymbol5 : expandsymbol5
		}
	}
}

function revivestatus(){
var inc=0
while (statecollect[inc]){
if (ccollect[inc].style.display=="block")
statecollect[inc].innerHTML=contractsymbol[inc]
else
statecollect[inc].innerHTML=expandsymbol[inc]
inc++
}
}

function do_onload(){
var alltags=document.all? document.all : document.getElementsByTagName("*")
ccollect=getElementbyClass(alltags, "switchcontent")
statecollect=getElementbyClass(alltags, "showstate")
if (ccollect.length>0 && statecollect.length>0)
revivestatus()
}

if (window.addEventListener)
window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
window.attachEvent("onload", do_onload)
else if (document.getElementById)
window.onload=do_onload