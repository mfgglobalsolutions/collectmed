<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcBorderedTable.cfm                                      --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   General                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---    Guillermo Cruz                                          --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag will wrap any of your code in a (curved) table    --->
<!--- with a header and bounding box.                            --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---   &lt;cf_gcBorderedTable title="The title"&gt;<br>         --->
<!---   You input goes here<br>                                  --->
<!---   &lt;/cf_gcBorderedTable&gt;                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---  None                                                      --->  
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!--- tableWidth default="100"<br>                               --->
<!--- tableAlign left | right | <strong>center</strong><br>      --->
<!--- Curved yes | <strong>no</strong><br>                       --->
<!--- boxLineBorderColor default="cccccc"<br>                    --->
<!--- backgroundColor default="cccccc"><br>                      --->
<!--- title<br>                                                  --->
<!--- subtitle<br>                                               --->
<!--- titleFont default="arial"<br>                              --->
<!--- subTitleFont default="arial"<br>                           --->
<!--- titlesize default="3"<br>                                  --->
<!--- subtitlesize default="2"<br>                               --->
<!--- boxFont default="arial"<br>                                --->
<!--- boxFontSize default="2"<br>                                --->
<!--- boxTextAlign <strong>left</strong> | right | center<br>    --->
<!--- qnote<br>                                                  --->
<!--- view <strong>block</strong> | inline<br>                   --->
<!--- titleFontColor default="000000"<br>                        --->
<!--- topSpace yes | <strong>no</strong><br>                     --->
<!--- bottomSpace yes | <strong>no</strong><br>                  --->
<!--- titleBold <strong>yes</strong>|no<br>                      --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---  [None]                                                    --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---  Created 05/05/04                                          --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>  



<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.tableWidth" default=""><!--- DO NOT put a number in here it will throw off any page calling it inside of an IFrame instead have the caller send in the tablewidth.--->
	<cfset tableWidth = attributes.tableWidth>
	
	<cfparam name="attributes.Width" default="#trim(tableWidth)#"><!--- DO NOT put a number in here it will throw off any page calling it inside of an IFrame instead have the caller send in the tablewidth.--->
	<cfset Width = attributes.Width>
	
	<cfparam name="attributes.margin" default="0">
	<cfset margin = attributes.margin>
	
	<cfparam name="attributes.tableAlign" default="left">
	<cfset tableAlign = attributes.tableAlign>
	
	<cfparam name="attributes.dataAlign" default="center">
	<cfset dataAlign = attributes.dataAlign>
	
	<cfparam name="attributes.Curved" default="no">
	<cfset Curved = attributes.Curved>
	
	<cfparam name="attributes.boxLineBorderWidth" default="1">
	<cfset boxLineBorderWidth = attributes.boxLineBorderWidth>
	
	<cfparam name="attributes.boxLineBorderColor" default="CBD9E9"><!---DCE3EB---><!---c0cddc---><!---FF9706--->
	<cfset boxLineBorderColor = attributes.boxLineBorderColor>
	
	<cfparam name="attributes.boxLineBorderColorTop" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorTop = attributes.boxLineBorderColorTop>
	
	<cfparam name="attributes.boxLineBorderColorRight" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorRight = attributes.boxLineBorderColorRight>
	
	<cfparam name="attributes.boxLineBorderColorBottom" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorBottom = attributes.boxLineBorderColorBottom>
	
	<cfparam name="attributes.boxLineBorderColorLeft" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorLeft = attributes.boxLineBorderColorLeft>
	
	<cfparam name="attributes.backgroundColor" default="DCE3EB"><!---CBD9E9---><!---c0cddc---><!---FF9706--->
	<cfset backgroundColor = attributes.backgroundColor>
	
	<cfparam name="attributes.title" default="">
	<cfset title = attributes.title>
	
	<cfparam name="attributes.subtitle" default="">
	<cfset subtitle = attributes.subtitle>
	
	<cfparam name="attributes.titleFont" default="arial">
	<cfset titleFont = attributes.titleFont>
	
	<cfparam name="attributes.subTitleFont" default="arial">
	<cfset subTitleFont = attributes.subTitleFont>		
		
	<cfparam name="attributes.titlesize" default="2">
	<cfset titlesize = attributes.titlesize>
	
	<cfparam name="attributes.subtitlesize" default="2">
	<cfset subtitlesize = attributes.subtitlesize>				
		
	<cfparam name="attributes.boxFont" default="arial">
	<cfset boxFont = attributes.boxFont>
	
	<cfparam name="attributes.boxFontSize" default="2">
	<cfset boxFontSize = attributes.boxFontSize>	
	
	<cfparam name="attributes.boxTextAlign" default="left">
	<cfset boxTextAlign = attributes.boxTextAlign>
	
	<cfparam name="attributes.qnote" default="">
	<cfset qnote = attributes.qnote>
	
	<cfparam name="attributes.view" default="block">
	<cfset view = attributes.view>
	
	<cfparam name="attributes.randRange" default="#randRange(1, 5000)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.TitleFontColor" default="003399">
	<cfset TitleFontColor = attributes.TitleFontColor>
	
	<cfparam name="attributes.topSpace" default="no">
	<cfset topSpace = attributes.topSpace>
	
	<cfparam name="attributes.bottomSpace" default="no">
	<cfset bottomSpace = attributes.bottomSpace>
	
	<cfparam name="attributes.titleBold" default="yes">
	<cfset titleBold = attributes.titleBold>
	
	<cfparam name="attributes.spanLink" default="no">
	<cfset spanLink = attributes.spanLink>
	
	<cfparam name="attributes.spanLinkTitle" default="">
	<cfset spanLinkTitle = attributes.spanLinkTitle>
	
	<cfparam name="attributes.titleRight" default="">
	<cfset titleRight = attributes.titleRight>
	
	<cfparam name="attributes.callWhenVisible" default="">
	<cfset callWhenVisible = attributes.callWhenVisible>
	
	<cfparam name="attributes.onclick" default="">
	<cfset onclick = attributes.onclick>
	
	<cfparam name="attributes.rightBottomLeftPadding" default="4">
	<cfset rightBottomLeftPadding = attributes.rightBottomLeftPadding>
	
	<cfparam name="attributes.topPadding" default="2">
	<cfset topPadding = attributes.topPadding>	 


<!-------------------------------------------------------------------------------------->
<!--- CSS for any box that we create.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<style type="text/css">
			
			div.cntDiv_#trim(randRange)#{				
				/*background: ##FFF;*/ /*##919191;*/ /*DEDADA*/
				/*border: 1px dotted green;*/
				<cfif width NEQ "">
				width: #trim(Width)#; 
				</cfif>		
				margin-top: #trim(margin)#px;		
				margin-bottom: #trim(margin)#px;		
				margin-left: #trim(margin)#px;		
				margin-right: #trim(margin)#px;		
				align: #tablealign#;				
			};
			
			div.btDiv_#trim(randRange)#{
				position: relative;
				top: 0px; /*-4*/
				left: 0px; /*-4*/
				border: 1px solid;				
				border-color: ###boxLineBorderColor#;
				background: ##FFFFFF
			};
			
			div.spTitle_#trim(randRange)#{
				background: ##FFFFFF
				text-align: #trim(boxTextAlign)#;
				color: #trim(TitleFontColor)#;
				font-weight: bold;
				font-style: #trim(titleFont)#;
				font-size: 12;
				padding: 4px 2px 4px 4px;
				background-color: ###backgroundColor#;
				clear: both;
			};
			##dataDiv_#trim(randRange)#{
				background: ##FFFFFF;				
				padding: #topPadding#px #rightBottomLeftPadding#px #rightBottomLeftPadding#px #rightBottomLeftPadding#px;						
			};
		</style>
		
	</cfoutput>		  
	  
	  
<!-------------------------------------------------------------------------------------->
<!--- Code for top of the Bordered Table.                                            --->
<!-------------------------------------------------------------------------------------->
	<cfif ThisTag.ExecutionMode neq "end">
	
		<cfoutput>
			
			<div class="cntDiv_#trim(randRange)#">
				<div class="btDiv_#trim(randRange)#">
					<div class="spTitle_#trim(randRange)#">#trim(title)#</div>				
						<div id="dataDiv_#trim(randRange)#">
		
		</cfoutput>										
									

<!-------------------------------------------------------------------------------------->
<!--- This is the code for the end of the table border below this comment is where   --->
<!--- the generated code will be output.                                             --->
<!-------------------------------------------------------------------------------------->				  
	<cfelseif ThisTag.ExecutionMode eq "end">				
						
		<cfoutput> 								
					</div>					
				</div>	   							
			</div>
		</cfoutput>							
	
	</cfif>
	
	





















































<!---



<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcBorderedTable.cfm                                      --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   General                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---    Guillermo Cruz                                          --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag will wrap any of your code in a (curved) table    --->
<!--- with a header and bounding box.                            --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---   &lt;cf_gcBorderedTable title="The title"&gt;<br>         --->
<!---   You input goes here<br>                                  --->
<!---   &lt;/cf_gcBorderedTable&gt;                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---  None                                                      --->  
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!--- tableWidth default="100"<br>                               --->
<!--- tableAlign left | right | <strong>center</strong><br>      --->
<!--- Curved yes | <strong>no</strong><br>                       --->
<!--- boxLineBorderColor default="cccccc"<br>                    --->
<!--- backgroundColor default="cccccc"><br>                      --->
<!--- title<br>                                                  --->
<!--- subtitle<br>                                               --->
<!--- titleFont default="arial"<br>                              --->
<!--- subTitleFont default="arial"<br>                           --->
<!--- titlesize default="3"<br>                                  --->
<!--- subtitlesize default="2"<br>                               --->
<!--- boxFont default="arial"<br>                                --->
<!--- boxFontSize default="2"<br>                                --->
<!--- boxTextAlign <strong>left</strong> | right | center<br>    --->
<!--- qnote<br>                                                  --->
<!--- view <strong>block</strong> | inline<br>                   --->
<!--- titleFontColor default="000000"<br>                        --->
<!--- topSpace yes | <strong>no</strong><br>                     --->
<!--- bottomSpace yes | <strong>no</strong><br>                  --->
<!--- titleBold <strong>yes</strong>|no<br>                      --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---  [None]                                                    --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---  Created 05/05/04                                          --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>  



<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.tableWidth" default=""><!--- DO NOT put a number in here it will throw off any page calling it inside of an IFrame instead have the caller send in the tablewidth.--->
	<cfset tableWidth = attributes.tableWidth>
	
	<cfparam name="attributes.tableAlign" default="left">
	<cfset tableAlign = attributes.tableAlign>
	
	<cfparam name="attributes.dataAlign" default="center">
	<cfset dataAlign = attributes.dataAlign>
	
	<cfparam name="attributes.Curved" default="no">
	<cfset Curved = attributes.Curved>
	
	<cfparam name="attributes.boxLineBorderWidth" default="1">
	<cfset boxLineBorderWidth = attributes.boxLineBorderWidth>
	
	<cfparam name="attributes.boxLineBorderColor" default="CBD9E9"><!---DCE3EB---><!---c0cddc---><!---FF9706--->
	<cfset boxLineBorderColor = attributes.boxLineBorderColor>
	
	<cfparam name="attributes.boxLineBorderColorTop" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorTop = attributes.boxLineBorderColorTop>
	
	<cfparam name="attributes.boxLineBorderColorRight" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorRight = attributes.boxLineBorderColorRight>
	
	<cfparam name="attributes.boxLineBorderColorBottom" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorBottom = attributes.boxLineBorderColorBottom>
	
	<cfparam name="attributes.boxLineBorderColorLeft" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorLeft = attributes.boxLineBorderColorLeft>
	
	<cfparam name="attributes.backgroundColor" default="DCE3EB"><!---CBD9E9---><!---c0cddc---><!---FF9706--->
	<cfset backgroundColor = attributes.backgroundColor>
	
	<cfparam name="attributes.title" default="">
	<cfset title = attributes.title>
	
	<cfparam name="attributes.subtitle" default="">
	<cfset subtitle = attributes.subtitle>
	
	<cfparam name="attributes.titleFont" default="arial">
	<cfset titleFont = attributes.titleFont>
	
	<cfparam name="attributes.subTitleFont" default="arial">
	<cfset subTitleFont = attributes.subTitleFont>		
		
	<cfparam name="attributes.titlesize" default="2">
	<cfset titlesize = attributes.titlesize>
	
	<cfparam name="attributes.subtitlesize" default="2">
	<cfset subtitlesize = attributes.subtitlesize>				
		
	<cfparam name="attributes.boxFont" default="arial">
	<cfset boxFont = attributes.boxFont>
	
	<cfparam name="attributes.boxFontSize" default="2">
	<cfset boxFontSize = attributes.boxFontSize>	
	
	<cfparam name="attributes.boxTextAlign" default="left">
	<cfset boxTextAlign = attributes.boxTextAlign>
	
	<cfparam name="attributes.qnote" default="">
	<cfset qnote = attributes.qnote>
	
	<cfparam name="attributes.view" default="block">
	<cfset view = attributes.view>
	
	<cfparam name="attributes.randRange" default="#randRange(1, 5000)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.TitleFontColor" default="003399">
	<cfset TitleFontColor = attributes.TitleFontColor>
	
	<cfparam name="attributes.topSpace" default="no">
	<cfset topSpace = attributes.topSpace>
	
	<cfparam name="attributes.bottomSpace" default="no">
	<cfset bottomSpace = attributes.bottomSpace>
	
	<cfparam name="attributes.titleBold" default="yes">
	<cfset titleBold = attributes.titleBold>
	
	<cfparam name="attributes.spanLink" default="no">
	<cfset spanLink = attributes.spanLink>
	
	<cfparam name="attributes.spanLinkTitle" default="">
	<cfset spanLinkTitle = attributes.spanLinkTitle>
	
	<cfparam name="attributes.titleRight" default="">
	<cfset titleRight = attributes.titleRight>
	
	<cfparam name="attributes.callWhenVisible" default="">
	<cfset callWhenVisible = attributes.callWhenVisible>
	
	<cfparam name="attributes.onclick" default="">
	<cfset onclick = attributes.onclick>
 
	
	  
<!------------------------------------------------------------------>
<!--- Code for top of the Bordered Table.                        --->
<!------------------------------------------------------------------>	
	<cfif ThisTag.ExecutionMode neq "end">
	
		<cfoutput>
			<cfif topSpace>
				&nbsp;
			</cfif>
			<table border="0" align="#trim(tableAlign)#" cellspacing="0" cellpadding="0" <cfif IsNumeric(tableWidth)>width="#trim(tableWidth)#%"</cfif>> 
				<tr>
					<td>
						<table border="0" cellspacing="0" cellpadding="0" width="100%">
							<cfif spanLink EQ "yes">
								<tr id="trSpanLink_#trim(randRange)#" valign="bottom" align="center">
									<td><span id="span_Link" style="cursor:hand" class="siteLabel" onclick="if (Box_#trim(randRange)#.style.display=='none') {trBox_#trim(randRange)#.style.display='block'; Box_#trim(randRange)#.style.display='block'; document.all.trSpanLink_#trim(randRange)#.style.display='none'; #trim(callWhenVisible)#} else {trBox_#trim(randRange)#.style.display='none'; Box_#trim(randRange)#.style.display='none'}; #trim(onclick)#"><u>#trim(spanLinkTitle)#</u></span></td>
								</tr> 
							</cfif>
							<tr id="trBox_#trim(randRange)#" valign="bottom" align="center" <cfif spanLink EQ "yes">style="display: none;"</cfif>>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										
										<cfif spanLink EQ "yes">
											<cfset onclick = "if (Box_#trim(randRange)#.style.display=='none') {trBox_#trim(randRange)#.style.display='block'; Box_#trim(randRange)#.style.display='block'; #trim(callWhenVisible)#} else {document.all.trSpanLink_#trim(randRange)#.style.display='inline'; trBox_#trim(randRange)#.style.display='none'; Box_#trim(randRange)#.style.display='none'};">
										<cfelse>
											<cfset onclick = "if(Box_#trim(randRange)#.style.display=='none') {Box_#trim(randRange)#.style.display='block'; #trim(callWhenVisible)#} else {Box_#trim(randRange)#.style.display='none'};">
										</cfif>
										
										<tr style="cursor:hand" valign="top" bgcolor="#trim(backgroundColor)#">
											<cfif curved> 
												<td width="5"><img src="/images/CurvedLeftCorner.gif" height="5" border="0" width="5"></td>
											</cfif>	
											<td>
												<table width="99%" border="0" cellspacing="1" cellpadding="1">
													<tr><td valign="bottom" nowrap <!---style="color: FFFFFF"--->><span onclick="#trim(onclick)#"><font color="#trim(titleFontColor)#" face="#trim(titleFont)#" size="#trim(titleSize)#">&nbsp;<cfif titleBold><strong></cfif>#trim(title)#<cfif titleBold></strong></cfif></font></span>&nbsp;
													<cfif qnote NEQ ""><cf_gcQnoteDisplay qnote="#trim(qnote)#" break="yes"></cfif>
													<br><font face="#trim(subTitleFont)#" size="#trim(subTitleSize)#">#trim(subTitle)#</font></td><td align="right" valign="middle"><cfif titleRight NEQ ""><span style="cursor:hand;">#trim(titleRight)#</span></cfif></td></tr>
												</table>
											</td>
											<cfif Curved>
												<td width="5" align="right"><img src="/images/CurvedRightCorner.gif" height="5" border="0" width="5"></td>
											</cfif>	
										</tr>
									</table>
								</td>
							</tr>
						</table>
						
						<div id="Box_#trim(randRange)#" style="display: #trim(view)#; border: #trim(boxLineBorderWidth)#px solid; border-color: #trim(boxLineBorderColorTop)# #trim(boxLineBorderColorRight)# #trim(boxLineBorderColorBottom)# #trim(boxLineBorderColorLeft)#; padding: 4px; text-align: #trim(boxTextAlign)#;">
							<table cellpadding="0" cellspacing="0" border="0" width="91%" align="#trim(dataAlign)#"> <!---taking this out places everything left but not taking it out causes data outside box. align="#trim(dataAlign)#" --->
								<tr valign="bottom" align="center">
									<td width="95%">
										<font face="#trim(boxFont)#" size="#trim(boxFontSize)#">
		</cfoutput>										
									
<!------------------------------------------------------------------>
<!--- This is the code for the end of the table border           --->
<!--- below this comment is where the generated code             --->
<!--- will be output.                                            --->
<!------------------------------------------------------------------>				  
	<cfelseif ThisTag.ExecutionMode eq "end">				
						
		<cfoutput> 								
									
			   							</font>	
									</td>
								</tr>
							</table>
						</div>
						
					</td>
				</tr>				
			</table>
			<cfif bottomSpace>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>
							<br><br><br>
						</td>
					</tr>
				</table>
			</cfif>	
			
		</cfoutput>							
	
	</cfif>
	
	
	
	
	
	

--->