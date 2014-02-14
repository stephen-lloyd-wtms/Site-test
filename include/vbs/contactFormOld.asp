<% 
	Response.Expires = -1444
	Response.Buffer= true
	If not Request.ServerVariables("REQUEST_METHOD")="POST" Then
		Response.Write "Illegal use of this page"
		Response.End
	end if
	information = Request.Form("information")
	network = Request.Form("network")
	contact = Request.Form("contact")
	name = Request.Form("name")
	email = Request.Form("email")
	SelOption = Request.Form("SelOption")
	comments = Request.Form("comments")
	
	mailmsg = "More information" & vbcrlf & information & vbcrlf
	mailmsg = mailmsg & "Friends of GT Newsletter" & vbcrlf & network & vbcrlf
	mailmsg = mailmsg & "Contact me"  & vbcrlf & contact & vbcrlf
	mailmsg = mailmsg & "Name: " & vbcrlf & name & vbcrlf 
	mailmsg = mailmsg & "Email address: " & vbcrlf & email & vbcrlf 
	mailmsg = mailmsg & "SelOption" & vbcrlf & SelOption  & vbcrlf
	mailmsg = mailmsg & "Comments: " & vbcrlf & comments & vbcrlf 
	 
	
	'Response.Write mailmsg
	'Response.End
	on error resume next
	Set objEmail = Server.CreateObject("Persits.MailSender")	
	With objEmail
		'.AddAddress "xmagarinos@xmlondon.com"
		'.AddAddress "dsleeman@xmlondon.com"
		.AddAddress "newbusinessuk@xmlondon.com"
		.Host    = "172.26.20.32"
		.From    = "website@xmlondon.com"
		.FromName = name & "  " & email
		.Subject = "Register page"
		.Body    = mailmsg
		.IsHTML = false
		.Send()
		
	'Response.Write "Email has been sent"
	End With
	Set objEmail = Nothing
	on error goto 0
	
	'text for friends
	if network="yes" then
		mailmsg = "Thank you for subscribing to the Newsletter.If you want to unsubscribe please contact us on info@xmlondon.com" & vbcrlf & vbcrlf
	else
		'every other case
		mailmsg = "Thank you for submitting your request.We will contact you shortly."  & vbcrlf & vbcrlf
	end if
	
		
	on error resume next
	Set objEmail = Server.CreateObject("Persits.MailSender")	
	With objEmail
		.AddAddress email
		'.AddAddress "info@xmlondon.com"
		.Host    = "172.26.20.32"
		.From    = "website@xmlondon.com"
		.FromName = "GT XM London" 
		.Subject = "GT XM London Registration"
		.Body    = mailmsg
		.IsHTML = false
		.Send()
		
	'Response.Write "Email has been sent"
	End With
	Set objEmail = Nothing
	on error goto 0
 %>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<TITLE>GT.XM London</TITLE>
	<link rel="stylesheet" href="../style.css" type="text/css">
	<script language="javascript" type="text/javascript">
				
					var objPage = Page();
					function Page() {
						return(this);
					}
					objPage.idPage='1';
						
					function rollover(imgid,imgsrc)
					{
						eval("document.images['"+imgid+"'].src='"+imgsrc+"'")
					}

					function preload()
					{
							img_1 = new Image();
							img_1.src="/images/email_on.gif";
							img_2 = new Image();
							img_2.src="/images/Our_Clients_off.gif";
							img_3 = new Image();
							img_3.src="/images/Register_off.gif";
							img_4 = new Image();
							img_4.src="/images/Home_off.gif";
							img_5 = new Image ();
							img_5.src="/images/Back_Home_off.gif";					
					}

					function init()
					{
						preload();
					}
				
			
					
				</script>
</HEAD>
<BODY background="../images/BG_Tile2.gif">
	<table cellpadding="0" cellspacing="0" summary="" align="center" border="0" width="1%">
		<tr>
			<td><img src="/images/Intro_Tag_1.gif" width="307" height="134" alt="" /></td>
			<td colspan="2" align="left">
				<table cellpadding="0" cellspacing="0" summary="" border="0">
					<tr>
						<td valign="top" align="left">
							<table cellpadding="0" cellspacing="0" summary="" border="0">
								<tr>
									<td valign="top"><img src="/images/XM_logo.gif" width="190" height="58" alt="" /></td>
								</tr>
								<tr>
									<td><img src="/images/NuBrand_Home_04.gif" width="190" height="48" alt="" /></td>
								</tr>
							</table>
						</td>
						<td>
							<table cellpadding="0" cellspacing="0" summary="" border="0">
								<tr>
									<td valign="top" colspan="2"><img src="/images/NuBrand_Home_03.gif" width="274" height="85" alt="" /></td>
								</tr>
								<tr>
									<td><a href="mailto:info@xmlondon.com" onmouseover="rollover('mnav1','/images/email_on-over.gif')" onmouseout="rollover('mnav1','/images/email_on.gif')" ><IMG src="/images/email_on.gif" width="151" height="21" alt=""  border="0" name=mnav1 /></a></td>
									<td><img src="/images/NuBrand_Home_06.gif" width="123" height="21" alt="" /></td>
								</tr>
							</table>
						</td>
					</tr>	
					<tr>
						<td valign="top" colspan="2">
							<table cellpadding="0" cellspacing="0" summary="" border="0">
								<tr>
									<td><a href="/ourclients.htm" onmouseover="rollover('mnav2','/images/Our_Clients_off-email_on_ov.gif')" onmouseout="rollover('mnav2','/images/Our_Clients_off.gif')"><img src="/images/Our_Clients_off.gif" width="115" height="23" alt="" border="0" name=mnav2 /></a></td>
									<td><img src="/images/Register_off-email_on_over.gif" width="95"  height="23" alt="" border="0" /></td>
									<td><a href="/home.htm" onmouseover="rollover('mnav4','/images/Home_on.gif')" onmouseout="rollover('mnav4','/images/Home_off.gif')"><img src="/images/Home_off.gif" width="69" height="23" alt="" border="0" name=mnav4 /></a></td>
									<td><img src="/images/NUBrand_Home_10.gif" width="185" height="23" alt="" /></td>
								</tr>
								<tr>
									<td colspan="4"><img src="/images/Logo_strip_shadow.gif" width="464" height="5" alt="" /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top" bgcolor="#ffffff"><img src="/images/NuBrand_Register_12.gif" width="307" height="157" alt="" /></td>
			<td align="left" valign="top" bgcolor="white"><img src="/images/spacer.gif" width="458" height="1" alt="" /></td>
			<td rowspan="2" width="6"><img src="/images/Cutting_ClientSub_14.gif" width="6" height="325" alt="" /></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="white" valign="top">
				<table cellpadding="0" cellspacing="0" summary="" border="0">
					<tr>
						<td colspan="2"><img src="/images/spacer.gif"  width="550" height="29" alt="" /></td>
					</tr>
					<tr>
						<td><img src="/images/spacer.gif" width="307" height="29" alt="" /></td>
						<td><img src="/images/ThankYou.gif" width="139" height="39" alt="" /><p style="padding-left:10px; padding-right:80px;">Your information will be sent shortly.</td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/spacer.gif" width="1" height="29" alt="" /></td>
					</tr>
					<tr>
						<td colspan="2" ><img src="/images/spacer.gif" width="255" height="1" /><a href="/home.htm"><img onmouseover="rollover('mnav5','/images/Back_Home_off-over.gif')" onmouseout="rollover('mnav5','/images/Back_Home_off.gif')" src="/images/Back_Home_off.gif" width="216" height="27" border="0" alt="" name=mnav5 /></a></td>
					</tr>
					<tr>
						<td colspan="2"><img src="/images/spacer.gif" width="1" height="15" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan=3>
				<table cellpadding="0" cellspacing="0" summary="" border="0">
					<tr>
						<td><img src="/images/Cutting_ClientSub_21.gif" width="574" height="29" alt="" /></td>
						<td><img src="/images/Cutting_ClientSub_22.gif" width="197" height="29" alt="" /></td>
					</tr>
				</table>			
			</td>
		</tr>		
	</table>
</BODY>
</HTML>
