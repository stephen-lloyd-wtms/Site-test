<%@ Language=VBScript %>
<!--#include file="validationTools.asp"-->
<% 
	'Response.CacheControl = "no-cache"
	'Response.AddHeader "Pragma", "no-cache"
	'Response.ExpiresAbsolute = Now()-1

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
				.AddAddress "newbusinessuk@xmlondon.com"
				'.AddAddress "gcompton@xmlondon.com"
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
			%>
				<div id="thankYou">
					</br>
					<p>Thank you,</p>
					<p>Your enquiry has been submitted successfully.</p>
					<p>A member of our team will contact you shortly.<p>
				</div>
			<%	
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
		
		if not validEmail(strEmail) then 
			errEmail = true
			errOnPage = true
		else
			errEmail = false
		end if
		
		if strOption = "none" Then
			errOption = true
			errOnPage = true
		else
			errOption = false
		End If

'These validation options have been deemed as not required - 11/11/2005
		'if not isAlphaNumeric(strName) or strName = "" then 
		'	errName = true
		'	errOnPage = true
		'else
		'	errName = false
		'end if
				
		'If Not isAlphaNumeric(strComments) or strComments = "" Then
		'	errComments = true
		'	errOnPage = true
		'else
		'	errComments = false
		'End If
		
		isValidData = errOnPage 

	End Function


Sub DisplayForm
%>

<span class="errorLabel">
	<%if errEmail = true then 
			Response.Write "<strong>Please enter a valid email</strong>"
		Else if errOption then
			Response.Write "<strong>Please select an area of interest</strong>"						
		End If
	End If%>
</span>

<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form1" name="form1">
	<p>
		<label for="name">Your name</label>
		<input id="name" name="name" type="text" class="contactfield" maxlength="50" tabindex="1" onfocus="this.value=''; this.onfocus=null;" value="<%if errOnPage = True Then Response.Write strName Else Response.Write "Enter your name here..."%>" />
	</p>
	<p>
		<label for="email">Your email address</label>
		<input id="email" name="email" type="text" class="contactfield" maxlength="50" tabindex="2" onfocus="this.value=''; this.onfocus=null;" value="<%if errOnPage = True Then Response.Write strEmail Else Response.Write "Enter your email address here ..."%>" />
	</p>
			
	<p>
		<label for="interests">Your area of interest</label>
		<select id="interests" name="interests" class="contactfield" tabindex="3">
			<option value="none" selected="selected">Select option</option>
			<option value="Government Public Facing">Government Public Facing</option>
			<option value="Business to Business">Business to Business</option>
			<option value="Intranets and Extranets">Intranets and Extranets</option>
			<option value="Consumer related">Consumer Related</option>
			<option value="Working with XM">Working with XM</option>
			<option value="Working for XM">Working for XM</option>
			<option value="Press Enquiries">Press Enquiries</option>
			<option value="Other">Other</option>
		</select>
	</p>
	<p>
		<%if errComments = true then Response.Write "<strong>Please enter your comments</strong>" else Response.Write "<label for=""comments"">Comments</label>" end if%>
		<textarea id="comments" name="comments" class="contactfield" rows="4" cols="" tabindex="4" onfocus="this.value=''; this.onfocus=null;">Please enter your comments here - for example, your telephone number</textarea>
	</p>
	<div id="contactformsubmit">
		<p><input id="Send" name="Send" type="submit" value="Send" tabindex="5" />
			<input type="reset" value="Clear" tabindex="6"  id="Reset" name="Reset" /></p>
	</div>
</form>
<%end sub%>
