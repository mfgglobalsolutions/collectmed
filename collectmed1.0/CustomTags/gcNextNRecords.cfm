
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.type" default="">
	<cfset type = attributes.type>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>		
		<script language="JavaScript">			
			function submitRowsPerPage#trim(type)#(val){					
				document.getNextN_#trim(type)#Form.rowsPerPage_#trim(type)#.value = val; 
				getNextN_#trim(type)#Form.submit();				
			};		
		</script>		
	</cfoutput>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="type"
		fieldnames="Type">	
	
	<cfset typeNumber = "session.RowsPerPage_" & trim(type)>	  
	
	<cfset callerEndRow = "caller.endRow_" & type>
	 
	<cfset callerStartRow = "caller.startRow_" & type>  
	  
	  
<!------------------------------------------------------------------>
<!--- Code for top of the Table.                                 --->
<!------------------------------------------------------------------>	
	<cfif ThisTag.ExecutionMode neq "end">
		
		<cfoutput>
			
			<table border="0" cellSpacing="0" cellPadding="0">	
				<tr>
					<td nowrap>						
						<span class="siteLabel">
							<cfif trim(caller.totalRows) GTE 1>
								<cfoutput>Displaying <b>#evaluate(callerStartRow)#</b> to <b>#evaluate(callerEndRow)#</b> of <b>#trim(caller.totalRows)#</b><br></cfoutput>
							</cfif>	
						</span>
					</td>								
					<td align="right">			
						
						 <!--- Show link for Back, if appropriate --->
						 <cfif caller.startRowBack gt 0>
						 	<span class="siteLabel" style="cursor: hand;" onclick="location='#CGI.script_name#?startRow_#type#=#trim(caller.startRowBack)#';">< Back</span>
						 </cfif>
						 
						 <!--- Show link for Next, if appropriate --->
						 <cfif caller.startRowNext lte caller.totalRows>
						 	<span class="siteLabel" style="cursor: hand;" onclick="location='#CGI.script_name#?startRow_#type#=#trim(caller.startRowNext)#';">Next ></span>
						 </cfif>
						
					</td>
				</tr>	
				<tr><td colspan="2"><hr color="c0c0c0" style="margin:0px;padding:0px;border-bottom:1px dashed 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;"></td></tr>
				<tr>
					<td colspan="2">
					
		</cfoutput>
		
<!------------------------------------------------------------------>
<!--- This is the code for the end of the table border           --->
<!--- below this comment is where the generated code             --->
<!--- will be output.                                            --->
<!------------------------------------------------------------------>				  
	<cfelseif ThisTag.ExecutionMode eq "end">				
		
		<cfoutput>	
		
				</td>
			</tr>				
			<tr><td colspan="2"><hr color="c0c0c0" style="margin:0px;padding:0px;border-bottom:1px dashed 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;"></td></tr>
			<tr>
				<td align="left">
					<cfif trim(caller.totalRows) GTE 1>						
						<!--- Simple "Page" counter, starting at first "Page" --->
						<cfset thisPage = 1>
						
						<!---<cfif NOT caller.showAll AND caller.totalRows GT evaluate(typeNumber)><cfoutput><span class="SiteRequiredLabel"><a href="#CGI.script_name#?&showAll=Yes">Show&nbsp;All</a>&nbsp;</span></cfoutput></cfif> --->
						
						<!--- Loop thru row numbers, in increments of RowsPerPage --->
						<cfloop from="1" to="#trim(caller.totalRows)#" step="#trim(evaluate(typeNumber))#" index="pageRow">
						 
							<!--- Detect whether this "Page" currently being viewed --->
							<cfset isCurrentPage = (pageRow GTE evaluate(callerStartRow)) AND (pageRow LTE evaluate(callerEndRow))>
							
							<!--- If this "Page" is current page, show without link --->
							<cfif isCurrentPage>
							
							<cfif NOT caller.showAll AND caller.totalRows GT trim(evaluate(typeNumber))><cfoutput><span class="siteLabel"><b>#thisPage#</b></span></cfoutput></cfif> 
							
							<!--- Otherwise, show with link so user can go to page ---> 
							<cfelse>
							
							 <cfoutput>
							 	<span class="siteLabel" style="cursor: hand;" onclick="location='#CGI.script_name#?startRow_#type#=#pageRow#';"><u>#thisPage#</u></span>
							 </cfoutput> 
							 
							</cfif>
											
							<!--- Increment ThisPage variable --->
							<cfset thisPage = thisPage + 1>
							
						</cfloop> 							
												
					</cfif>	
					
				</td>	
				
				<cfset specificType = "RowsPerPage_" & trim(type)>
				<cfset rowsString = trim(CGI.script_name) & "?" & specificType>				
							
				<td align="right" nowrap>																				
					<span class="siteLabel" style="cursor: hand;" onclick="submitRowsPerPage#trim(type)#(10);"><cfif evaluate(typeNumber) EQ 10><u></cfif>10<cfif evaluate(typeNumber) EQ 10></u></cfif></span>
					<span class="siteLabel" style="cursor: hand;" onclick="submitRowsPerPage#trim(type)#(20);"><cfif evaluate(typeNumber) EQ 20><u></cfif>20<cfif evaluate(typeNumber) EQ 20></u></cfif></span>
					<span class="siteLabel" style="cursor: hand;" onclick="submitRowsPerPage#trim(type)#(50);"><cfif evaluate(typeNumber) EQ 50><u></cfif>50<cfif evaluate(typeNumber) EQ 50></u></cfif></span>
					<span class="siteLabel" style="cursor: hand;" onclick="submitRowsPerPage#trim(type)#(75);"><cfif evaluate(typeNumber) EQ 75><u></cfif>75<cfif evaluate(typeNumber) EQ 75></u></cfif></span>
					<span class="siteLabel" style="cursor: hand;" onclick="submitRowsPerPage#trim(type)#(100);"><cfif evaluate(typeNumber) EQ 100><u></cfif>100<cfif evaluate(typeNumber) EQ 100></u></cfif></span>
					<span class="siteLabel" style="cursor: hand;" onclick="submitRowsPerPage#trim(type)#(200);"><cfif evaluate(typeNumber) EQ 200><u></cfif>200<cfif evaluate(typeNumber) EQ 200></u></cfif></span>
					<!---
					<span class="siteLabel" style="cursor: hand;" onclick="location='#CGI.script_name#?RowsPerPage_#type#=300';"><cfif evaluate(typeNumber) EQ 300><u></cfif>300<cfif evaluate(typeNumber) EQ 300></u></cfif></span>
					<span class="siteLabel" style="cursor: hand;" onclick="location='#CGI.script_name#?RowsPerPage_#type#=400';"><cfif evaluate(typeNumber) EQ 400><u></cfif>400<cfif evaluate(typeNumber) EQ 400></u></cfif></span>
					<span class="siteLabel" style="cursor: hand;" onclick="location='#CGI.script_name#?RowsPerPage_#type#=500';"><cfif evaluate(typeNumber) EQ 500><u></cfif>500<cfif evaluate(typeNumber) EQ 500></u></cfif></span>
					--->	
					
					<!---
					<select name="RowsPerPageSelect" class="SiteSelectBox" onchange="location='#CGI.script_name#?RowsPerPage_#type#='+this.options.value;">
						<option value="">								
						<option value="10" <cfif evaluate(typeNumber) EQ 10>SELECTED</cfif>> 10
						<option value="20" <cfif evaluate(typeNumber) EQ 20>SELECTED</cfif>> 20
						<option value="25" <cfif evaluate(typeNumber) EQ 25>SELECTED</cfif>> 25
						<option value="50" <cfif evaluate(typeNumber) EQ 50>SELECTED</cfif>> 50
						<option value="75" <cfif evaluate(typeNumber) EQ 75>SELECTED</cfif>> 75
						<option value="100" <cfif evaluate(typeNumber) EQ 100>SELECTED</cfif>> 100
						<option value="200" <cfif evaluate(typeNumber) EQ 200>SELECTED</cfif>> 200
						<option value="300" <cfif evaluate(typeNumber) EQ 300>SELECTED</cfif>> 300
						<option value="400" <cfif evaluate(typeNumber) EQ 400>SELECTED</cfif>> 400
						<option value="500" <cfif evaluate(typeNumber) EQ 500>SELECTED</cfif>> 500
					</select>		
					--->	
										
				</td>
			</tr>
		</table>	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Form needed for dismissing.                                                    --->
		<!-------------------------------------------------------------------------------------->			
		<span id="sp_getNextN_#trim(type)#" style="display:'none';">
			<form name="getNextN_#trim(type)#Form" method="post">
				<input type="Hidden" name="rowsPerPage_#trim(type)#" value="">
				<cf_gcEmbedFields except="rowsPerPage_#trim(type)#" notcontains="rowsPerPage_">
			</form>			
		</span>
		
		</cfoutput>							
			
	</cfif>
	
	

