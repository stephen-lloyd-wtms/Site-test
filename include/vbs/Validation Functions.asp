<%

Function GetCountries
	Dim objConn
	
	Set objConn = Server.CreateObject("NetDevPlus.DBConnection")
	objConn.ConnectionString = Application("DBConnection")

	Set GetCountries = objConn.RunSPReturnRS("spUserGetUserCountries", True, "")

End Function

Function validateText(valText, acceptableChars)
	Dim valTextChar
	Dim iLoopCounter
	
    'loop through each character of subject
    For iLoopCounter = 1 to Len(valText)
		'Use Lcase &amp; Mid functions, Mid function used to return each individual character
		'in the subject, and then Lcase converts it into lowercase
		valTextChar = Lcase(Mid(valText, iLoopCounter, 1))
		'Check if the characters are acceptable
		If InStr(acceptableChars, valTextChar) = 0 Then
			validateText = false
			exit for
		Else
			validateText = true
		End if
    Next
    

End Function

Function removeSpecialChars(theString)
'This function will remove inserted carriage returns and line feeds
'It is aimed at removing characters that could be entered maliciously
'in a penetration attack.
	theString = replace(theString, vbcrlf, "")
	theString = escape(theString)
	theString = replace(theString, "0D%0A", "")
	theString = replace(theString, "%0D", "")
	theString = replace(theString, "%0A", "")
	theString = replace(theString, "\r", "")
	theString = unEscape(theString)
	removeSpecialChars = theString
End function


'The IsValidEmail function checks for a valid email
'IsValidEmail returns True if the email address is a valid email
'IsValidEmail returns false if the email address isn't proper syntax
'Please look up rfc2822 for the latest email address standards.
Function IsValidEmail(emailAddress)
   'Declare variables</span> <br>
	Dim ValidEmail, emailParts, iLoopCounter, emailChar, acceptableChars
	ValidEmail = True 
	'set the default result to True
	'acceptableChars are the characters that we will allow in our email
	acceptableChars="abcdefghijklmnopqrstuvwxyz.-_!#$%&'*+/=?^`{|}~@1234567890"


    'use the Split function to create an array with the @ as the separator
	'so if your email was test@tester.com the email would be split into an array
	'with the first array element holding "test" and the second "tester.com"
    emailParts = Split(emailAddress, "@")

    'check to make sure that there is only 1 @ and that there are 2 parts
	'remember arrays are zero based
    'Using the UBound function will return the highest element in the array
	'So if it's a valid email the UBound function will return 1, i.e. 0 start
	If UBound(emailParts) <> 1 Then
	    ValidEmail = false
	Else
		'Check the length of each part of the email address
		'first part can be just one character and not more than 64, 
		'2nd part must be at least 4 and not more than 255.
		If Len(emailParts(0)) < 1 OR Len(emailParts(0)) > 64 OR Len(emailParts(1)) < 4 OR Len(emailParts(1)) > 255 Then
		    ValidEmail = false
		End If
		'check first character on the left part isn't a "." using Left function
		If Left(emailParts(0), 1) = "." Then
		    ValidEmail = false
		End If
		'check the last &amp; 2nd character from right part using Right function 
		If Right(emailParts(1), 1) = "." OR Right(emailParts(1), 2) = "." Then
		    ValidEmail = false
		End If
		'check that there is a . in the second part of the email address - .com
		If InStr(emailParts(1), ".") <= 0 Then
		    ValidEmail = false
		End If
		'check that there shouldn't be a _ in the second part of the email address
		If InStr(emailParts(1), "_") > 0 Then
		    ValidEmail = false
		End If
    End If
    'loop through each character of email
    For iLoopCounter = 1 to Len(emailAddress)
		'Use Lcase &amp; Mid functions, Mid function used to return each individual character
		'in the email, and then Lcase converts it into lowercase
		emailChar = Lcase(Mid(emailAddress, iLoopCounter, 1))
		'Check if the emailAddress characters are acceptable
		If InStr(acceptableChars, emailChar) = 0 and Not IsNumeric(emailChar) Then
			ValidEmail = false
		End if
    Next
    'check if there is 2 . in a row
    If InStr(emailAddress, "..") > 0 Then
    ValidEmail=false
    End If
    'check if there is @. in a row
    If InStr(emailAddress, "@.") > 0 Then
		ValidEmail=false
    End If
	
	IsValidEmail=ValidEmail

End function
%>

