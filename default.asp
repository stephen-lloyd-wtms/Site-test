<%@ Language=VBScript %>
<% Option Explicit

'Dim objPM, objHomePage, intHomePage, objPage

'Set objPM = Server.CreateObject("NetDevPlus.PageManager")
'objPM.ConnectionString = Application("DBConnection")
'Set objHomePage = objPM.getHomePage()
'Set objPage = objHomePage.selectSingleNode("//page")

'If objPage Is Nothing Then
'	Response.Write "There are no published pages in this system yet."
'Else
'	'Response.Write objPage.getattribute("id")
'	Response.Redirect "/output/Page" & objPage.getattribute("id") & Application("FileExtension")
'End If
Response.Redirect "/output/Page2.asp"
%>