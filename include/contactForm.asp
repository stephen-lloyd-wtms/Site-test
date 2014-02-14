<%@ Language=VBScript %>
<!--#include file="validationTools.asp"-->
<% 
	Dim strName, strEmail, strOption, strComments
	Dim errName, errEmail, errOption, errComments
	
	Dim strBodyText, strSubject
	
	Dim Mail
	
	errName = false
	errEmail = false
	errComments = false
	errOnPage = false
	
	With Request
		strName = .Form ("name")
		strEmail = .Form ("email")
		strOption = .Form ("interests")
		strComments = .Form ("comments")
	End With

	If Request.ServerVariables("REQUEST_METHOD") = "POST" then
		If Not isValidData Then
		
			'Registration email to XM
			Set Mail = Server.CreateObject("Persits.MailSender")
			With Mail
				.Host = Application("ContactUsHost")
				.From = strEmail
				.FromName = strName
				'.AddAddress "ksharfman@xmlondon.com"
				'.AddAddress "pnash@xmlondon.com"
				.AddAddress "lleonardi@xmlondon.com"
				.AddAddress "lleonardi@vtr1000.co.uk"
				.Subject = ("XM London website enquiry")
				.Body = "Name: " & strName & vbcrlf & "Email: " & strEmail & vbcrlf & "Area of Interest: " & strOption & vbcrlf & "Comments: " & strComments & vbcrlf
				.Send
			End With
			
			'set value to null
			Set Mail = Nothing
			
			'Confirmation email to customer
			Set Mail = Server.CreateObject("Persits.MailSender")
			With Mail
				.Host = Application("ContactUsHost")
				.From = ("newbusinessuk@xmlondon.com")
				.FromName = ("XM London")
				.AddAddress strEmail
				.Subject = "Your XM London enquiry"
				.Body = "Thank you for submitting your request. A member of our team will contact you shortly." & vbcrlf & vbcrlf & "Kind regards" & vbcrlf & "XM London" & vbcrlf & vbcrlf & "http://www.xmlondon.com/" & vbcrlf & "New business enquiries 020 7479 0319"
				.Send
			End With
			
			Response.Write ("<div id=""thankYou""><p>Your enquiry has been submitted successfully.</p><p>A member of our team will contact you shortly.<p></div>")
		
		Else
			EncodeFields
			DisplayForm
		End If
		
	Else
		DisplayForm
	End If
	
	Sub EncodeFields
		With server
			strName = .HTMLEncode(strName)
			strEmail = .HTMLEncode(strEmail)
			strComment = .HTMLEncode(strComment)
		End With 
	End Sub
	
	Function isValidData
		if not isAlphaNumeric(strName) or strName = "" then 
			errName = true
			errOnPage = true
		else
			errName = false
		end if
		
		if not validEmail(strEmail) then 
			errEmail = true
			errOnPage = true
		else
			errEmail = false
		end if
		
		If Not isAlphaNumeric(strComments) or strComments = "" Then
			errComments = true
			errOnPage = true
		else
			errComments = false
		End If
		
		isValidData = errOnPage 

	End Function


Sub DisplayForm
%>
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form1" name="form1">
		<div id="contactform">
			<div id="contactformleft">
				<p>
					<%if errName = true then Response.Write "<strong>Please enter your name</strong>" else Response.Write "Your name" end if%>
					<input id="name" name="name" type="text" class="contactfield" maxlength="35" tabindex="1" onFocus="this.value=''; this.onfocus=null;" value="<%if errOnPage = True Then Response.Write strName Else Response.Write "Enter your name here..."%>" />
				</p>
				<p>
					<%if errEmail = true then Response.Write "<strong>Please enter a valid email</strong>" else Response.Write "Your email address" End If%>
					<input id="email" name="email" type="text" class="contactfield" maxlength="35" tabindex="2" onFocus="this.value=''; this.onfocus=null;" value="<%if errOnPage = True Then Response.Write strEmail Else Response.Write "Enter your email address here ..."%>" />
				</p>
			</div>
			<div id="contactformright">
				<p>
					Your area of interest
					<select id="interests" name="interests" class="contactfield" tabindex="3">
						<option value="none">Select option</option>
						<option value="Government Public Facing">Government Public Facing</option>
						<option value="Business to Business">Business to Business</option>
						<option value="Intranets and Extranets">Intranets and Extranets</option>
						<option value="Consumer related">Consumer Related</option>
					</select>
				</p>
				<p>
					<%if errComments = true then Response.Write "<strong>Please enter your comments</strong>" else Response.Write "Comments" end if%><br/>
					<textarea id="comments" name="comments" class="contactfield" rows="4" tabindex="4" onFocus="this.value=''; this.onfocus=null;">Please enter your comments here - for example, your telephone number</textarea>
				</p>
				<div id="contactformsubmit">
					<p><input id="Send" name="Send" type="submit" value="Send" tabindex="5" />
						<input type="reset" value="Clear" tabindex="6" /></p>
				</div>
			</div>
		</div>
	</form>
<%end sub%>
