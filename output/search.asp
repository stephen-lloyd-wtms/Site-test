<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1;" />
		<meta name="keywords" content="search, find, locate" />
		<meta name="description" content="The search functionality allows you to search for the presence of a word or words on a page in the site." />
		<title>Search</title>
		<link rel="stylesheet" href="/styles/styles.css" type="text/css" />
		<link rel="stylesheet" href="/styles/xm.css" type="text/css" />
	</head>
	<body id="constant">
		<div id="wrapper">
			<div id="topNavigation">
				<form method="post" action="/output/search.asp" name="searchForm" id="searchForm">
					<ul>
						<li><a href="/output/Page2.asp" accesskey="H">Home</a> | </li><li><a href="/output/Page3.asp" accesskey="O">Our Clients and Work</a> | </li><li><a href="/output/Page19.asp" accesskey="W">What We offer</a> | </li><li><a href="/output/Page20.asp" accesskey="A">About us</a> | </li><li><a href="/output/Page21.asp" accesskey="C">Contact us</a></li><li><input type="text" id="searchTerm" name="searchTerm" value="Enter search terms" onfocus="this.value=''; this.onfocus=null;" /></li><li><input type="image" alt="Go" title="Go" src="/files/images/XM_Home_search-but.gif" id="searchBtn" name="searchBtn" width="20" height="20" accesskey="Z"></li>
					</ul>
				</form>
			</div>
			<div id="content">
				<div id="left">
					<h2><img width="162" title="XMLondon Digital Communication" alt="XMLondon Digital Communication" height="70" src="../files/images/XM_logo.gif" /></h2>
					<address>121-141<br />Westbourne Terrace<br />London<br />W2 6JR</address>
					<p>T +44 (0)20 7724 7228</p>
					<p>F +44 (0)20 7479 0876</p>
				</div>
				<div id="right">
					<div id="topContent">
						<div class="prop"></div>
						<div id="introText"><img alt="search" border="0" height="67" src="/files/images/XM_search_hdr.gif" width="86" /></div>
						<div id="subSectionNav"></div>
					</div>
						<form action="search.asp" id="frm" method="post" name="frm">
							
							<%	
							
							'//////////////////////////////////'
							'//XM London Index Server Search //'
							'//Yiannis Koudounis 2005		 //'
							'//////////////////////////////////'
									
							Dim sQuery, oQuery, oRs, sTitle, iRecord, sSitePath
							Dim iCurrPage, iNumPages, iCurrentRecord, sPage
							Dim iSection, iDay, iMonth, iYear, bSection
							Dim sDayQuery, sSectionQuery, sTextQuery, sFullText
							Dim iPerPage, iNumResults
							Dim iCounter, bPDF
							Dim sHTML
									
							sHTML = ""
							iCurrentRecord = 0
							iCounter = 0
									
							'//get all the params from the querystring//'
							iCurrPage   = Request("offset")
							iDay	    = Request("day")
							iMonth	    = Request("month")
							iYear	    = Request("year")
							sPage       = Request.ServerVariables("SCRIPT_NAME")
							iSection    = Request("section")
							sFullText   = Request("searchTerm")
							bSection    = (Request("SearchSection") = "True")
							iPerPage    = cInt(Request("perpage"))
							iNumResults = cInt(Request("numresults"))

							If sFullText = "Enter search terms" or sFullText = "" Then %>
												
						<div id="subContent">
						  <h2><img width="98" alt="Search" height="80" border="0" src="/files/images/XM_search_shdr.gif" /></h2>
						  <div id="subContentText">
							<p><label for="searchTerm">Search query: </label><input maxLength="50" name="searchTerm" size="29" value="Enter search term" onclick="if (this.value=='Enter search term'){this.value = '';}" onkeypress="if (this.value=='Enter search term'){this.value = '';}" /><input type="submit" value="Go" / id=submit1 name=submit1></p>
							</form>							
							<p>The search functionality allows you to search for the presence of a word or words on a page in the site.</p>
							<p>For example:</p>
							<div>
								<ul>
									<li><strong>design AND programming</strong> - will return all pages that contain both design and programming.</li>
									<li><strong>design OR programming</strong> - will return all pages that contain design or programming. </li>
									<li><strong>design NEAR programming</strong> - will return all pages that contain design and programming in order of their proximity to each other on the page. </li>
									<li><strong>&quot;design services&quot;</strong> - will return pages containing the phrase &quot;design services&quot;. </li>
								</ul>
							</div>
						</div>
					  </div>
													
							<%
							Else
																								
								If Len(iSection) Then bSection = True
										
								'//determine the section query//'
								If bSection Then
									If iSection = "PDF" Then
										bPDF = true
									Else
										sSectionQuery = "AND ($docKeywords " & iSection & ") "
									End If
								Else
									'//we are not searching sections//'
									sSectionQuery = ""
								End If
										
								'//set current page if == 0//'
								If Len(iCurrPage) = 0 Then iCurrPage = 1
										
								If iPerPage = 0 Then iPerPage = 5
										
								'//build up date section of query//'
								If (Len(iMonth) > 0) And (Len(iYear) > 0) Then
									'//we are definately doing a date search//'
									sDayQuery = " AND ($docKeywords "
											
									'//we are also doing a day specific search//'
									If Len(iDay) Then
										sDayQuery = sDayQuery & iDay & "*"
									End If
											
									'//build up the rest of the search
									sDayQuery = sDayQuery & iMonth & "*" & iYear & ") "
								Else
									'//we must be doing a non date search//'
									sDayQuery = ""
								End If
										
								'//build up free text portion of query//'
								If Len(sFullText) > 0 Then
									'//dump the date parts//'
									sDayQuery  = ""
									sTextQuery = " AND (" & sFullText & ") "
								End If

								'//create query object...
								Set oQuery = Server.CreateObject("IXSSO.Query")
										
								'//concatenate the full query now//'
								If bPDF Then
									sQuery = "(#vpath *\files\pdf*) " & sDayQuery & sSectionQuery & sTextQuery
								Else
									sQuery = "(#vpath *\output*) AND (NOT #vpath *\_vti*) " & sDayQuery & sSectionQuery & sTextQuery
								End If
										
								On Error Resume Next
								'//set up options...
								With oQuery
									.Columns    = "doctitle, filename, size, characterization, rank"
									.MaxRecords = iNumResults
									.SortBy     = "rank[d], doctitle"
									.Catalog    = "XMLondon"
									.Query		= sQuery
											
									'//create recordset
									Set oRs     = .CreateRecordset("nonsequential")
								End With

								If oRs.EOF Or Err.number > 0 Then%>
								
							  <div id="subContent">
							    <h2><img width="190" alt="Search" height="80" border="0" src="/files/images/XM_searchresults_shdr.gif" /></h2>
								 <div id="subContentText">
									
								<%
									'//no records returned
									Response.Write("<p></p><p>Sorry, your search didn't return any pages.</p>")
									%>
							  </div>
							</div>	
									
							<%	Else%>
						   <div id="subContent">
							 <h2><img width="190" alt="Search" height="80" border="0" src="/files/images/XM_searchresults_shdr.gif" /></h2>
								<div id="subContentText">
											
							 
									<%If Len(iMonth) > 0 Or Len(iYear) > 0 Then
										'Response.Write("<font style='font: Bold 12pt Arial'>" & iDay & " " & MonthName(iMonth) & " " & iYear & "</font><p />")
									End If
											
									With oRs
										.PageSize     = iPerPage
										.AbsolutePage = iCurrPage
										iNumPages     = cInt(.PageCount)
																			
										Do Until oRs.EOF Or iCurrentRecord >= iPerPage

											sTitle = oRs(0)

											If sTitle = "" Then sTitle = "Untitled"
													
											If bPDF Then
												sHTML = sHTML & "<a href='/files/pdf/" & oRs(1) & "'>" & sTitle & "</a><br />"								
											Else
												sHTML = sHTML & "<a href='/output/" & oRs(1) & "'>" & sTitle & "</a><br />"											
											End If
													
												sHTML = sHTML & "<span style='color: #5588EE;'>Relevance: " & (CInt(oRs(4)) / 10) & "%</span><br/>"
												sHTML = sHTML & oRs(3) & "...<br/>"					
												sHTML = sHTML & "<br />"	
										
											'//increment record count
											iCurrentRecord = iCurrentRecord + 1
											'//move to next record
											.MoveNext
										Loop
																						
										'//fix up the query for passing in url //'
										sFullText = Server.URLEncode(sFullText)
												
										'//OK now we need to write out the navigation
										If iCurrPage > 1 Then
											'//we can show prev
											sHTML = sHTML & " <a href='" & sPage & "?numresults=" & iNumResults & "&searchSection=" & bSection & "&perpage=" & iPerPage & "&offset=1&searchTerm=" & sFullText & "&day=" & iDay & "&month=" & iMonth & "&year=" & iYear & "&section=" & iSection & "'>First</a> | "
											sHTML = sHTML & "<a href='" & sPage & "?numresults=" & iNumResults & "&searchSection=" & bSection & "&perpage=" & iPerPage & "&offset=" & (iCurrPage - 1)& "&searchTerm=" & sFullText & "&day=" & iDay & "&month=" & iMonth & "&year=" & iYear & "&section=" & iSection & "'>Prev</a> | "
										End If

										If cInt(iCurrPage) < iNumPages Then
											'//we can show next
											sHTML = sHTML & "<a href='" & sPage & "?numresults=" & iNumResults & "&searchSection=" & bSection & "&perpage=" & iPerPage & "&offset=" & (iCurrPage + 1)& "&searchTerm=" & sFullText & "&day=" & iDay & "&month=" & iMonth & "&year=" & iYear & "&section=" & iSection & "'>Next</a>"
											sHTML = sHTML & " | <a href='" & sPage & "?numresults=" & iNumResults & "&searchSection=" & bSection & "&perpage=" & iPerPage & "&offset=" & iNumPages & "&searchTerm=" & sFullText & "&day=" & iDay & "&month=" & iMonth & "&year=" & iYear & "&section=" & iSection & "'>Last</a> | "
										End If

										If iNumPages > 1 Then
											'//show info
											sHTML = sHTML & "Page <strong>" & iCurrPage & "</strong> of <strong>" & iNumPages & "</strong>"
										End If
									End With
											
										Response.Write ("<p>You have searched for <strong>" & sFullText & "</strong>. Displaying results <strong>" & 1 + iPerPage *  ( iCurrPage - 1 ) & " - " & (iPerPage * iCurrPage) - (iPerPage - iCurrentRecord) & "</strong></p>")
										Response.Write sHTML%>
										
										</div>
								</div>
										
								<% End If
														
							End If	%>
						
						<div id="bottom">
							<ul id="bottomLeft">
								<li><a href="/output/page23.asp" accesskey="L">Accessibility</a> | </li>
								<li><a href="/output/page24.asp" accesskey="T">Terms and Conditions</a></li>
							</ul>
							<ul id="bottomRight">
								<li>&copy; XM London 2006 | </li>
								<li><a href="/output/page25.asp" accesskey="S">Sitemap</a></li>
							</ul>
								<div class="clear"><br /></div>
						</div>
				</div>
					<div class="clear"><br /></div>
			</div>
		</div>
	</body>
</html>


