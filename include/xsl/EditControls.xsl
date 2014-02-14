<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:template match="PageTools">
				<div id="PageTools" style="position:absolute; width:400px; height:30px; z-index:1; left: 80px; top: 20px; visibility: visible; background-color: #CCCCCC; layer-background-color: #CCCCCC; border: 2px none #000000">
				<b>Page Tools - </b>
					<img src="/images/admin/addpage.gif" alt="Add new page" onclick="javascript:objPage.newPage();" /> 
					<img src="/images/admin/publish.gif" alt="Publish page" onclick="javascript:objPage.publishPage(objPage.idPage);" /> 
					<img src="/images/admin/delete.gif" alt="Delete page" onclick="javascript:objPage.deletePage(objPage.idPage);" /> 
					<img src="/images/admin/editproperties.gif" alt="Edit page properties" onclick="javascript:objPage.editPageProperties();" /> 
					<img src="/images/admin/addnews.gif" alt="Edit exchange rates" onclick="javascript:objPage.editExchangeRates();" /> 
				</div>
	</xsl:template>
	
	<xsl:template match="ChunkTools">
				<div id="ChunkTools" style="position:absolute; width:400px; height:30px; z-index:1; left: 80px; top: 50px; visibility: visible; background-color: #CCCCCC; layer-background-color: #CCCCCC; border: 2px none #000000">
				<b>Chunk Tools - </b>
					<img src="/images/admin/bold.gif" alt="Bold" WIDTH="23" HEIGHT="22" onclick="execCommandOnSelection(''BOLD'');" />
					<img src="/images/admin/italic.gif" alt="Italic" WIDTH="23" HEIGHT="22" onclick="execCommandOnSelection(''ITALIC'');" />
					<img src="/images/admin/under.gif" alt="Underline" WIDTH="23" HEIGHT="22" onclick="execCommandOnSelection(''UNDERLINE'');" />
					<br/>Font Size: 
					<select name="fontsize" onchange="document.execCommand(''FONTSIZE'',false,this.value);">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
					Font Name:
					<select name="fontname" onchange="document.execCommand(''FONTNAME'',false,this.value);">
						<option value="Arial">Arial</option>
						<option value="Times New Roman">Times New Roman</option>
						<option value="Verdana">Verdana</option>
					</select>
					<img src="/images/admin/fgcolor.gif" alt="Text Colour" WIDTH="23" HEIGHT="22" onclick="SetTextColor();" />
					<p/>
				</div>
	</xsl:template>
	
	<xsl:template match="TreeTool">
				<div id="TreeTool" style="position:absolute; width:170px; height:185px; z-index:1; left: 80px; top: 130px; visibility: visible; background-color: #CCCCCC; layer-background-color: #CCCCCC; border: 2px none #000000">
					<div style="position:absolute; left:0px; top:0px; font-size: 7pt; color: #000000; font-family: Verdana; text-decoration: none">Site Map Navigation</div>
					<div id="CTreeViewCtrl" style="DISPLAY: block;FONT-FAMILY: verdana; FONT-SIZE: 8pt;">
						<object classid="clsid:5220cb21-c88d-11cf-b347-00aa00a28331" id="Microsoft_Licensed_Class_Manager_1_0" viewastext="1">
						   <param name="LPKPath" value="/mstree5.lpk"/>
						</object>
						<object classid="clsid:0713E8A2-850A-101B-AFC0-4210102A8DA7"  codebase="../../../Comctl32.cab#Version=5,00" height="170" viewastext="1" id="objTreeView" style="position: relative; LEFT: 0px; TOP: 15px" width="170" type="application/x-oleobject">
							<param name="_ExtentX" value="8202"/>
							<param name="_ExtentY" value="2910"/>
							<param name="_Version" value="393217"/>
							<param name="HideSelection" value="0"/>
							<param name="Indentation" value="1005"/>
							<param name="LabelEdit" value="1"/>
							<param name="LineStyle" value="1"/>
							<param name="PathSeparator" value="\"/>
							<param name="Sorted" value="0"/>
							<param name="Style" value="6"/>
							<param name="Checkboxes" value="0"/>
							<param name="FullRowSelect" value="0"/>
							<param name="HotTracking" value="0"/>
							<param name="Scroll" value="1"/>
							<param name="SingleSel" value="0"/>
							<param name="ImageList" value=""/>
							<param name="BorderStyle" value="1"/>
							<param name="Appearance" value="1"/>
							<param name="MousePointer" value="0"/>
							<param name="Enabled" value="1"/>
							<param name="OLEDragMode" value="0"/>
							<param name="OLEDropMode" value="0"/>
						</object>
					</div>
				</div>
				<script language="vbscript">
				<xsl:for-each select="page-content/DocumentTree/page">
					<xsl:choose>
						<xsl:when test="position() = 1">
							Set root = objTreeView.Nodes.Add(,0,"a<xsl:value-of select="@id"></xsl:value-of>", "<xsl:value-of select="@pagename"></xsl:value-of>")
						</xsl:when>
						<xsl:otherwise>
							ParentIndex = objTreeView.Nodes.Item("a<xsl:value-of select="@parent"></xsl:value-of>").Index
							Set nextnode = objTreeView.Nodes.Add(ParentIndex,4,"a<xsl:value-of select="@id"></xsl:value-of>","<xsl:value-of select="@pagename"></xsl:value-of>")
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				</script>
	</xsl:template>
	
</xsl:stylesheet>