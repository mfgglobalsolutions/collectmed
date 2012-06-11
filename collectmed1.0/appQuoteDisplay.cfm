<!---- appQuoteDisplay.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Query to get the Intakes.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getQuotes" datasource="#trim(request.datasource)#">
		SELECT CONCAT(patientFNameTBox, ' ', LEFT(patientLNameTBox, 9)) AS patientName, QuoteID, hidden_UsersID, Active, DateCreated, DateModified,
		timestampdiff(hour, DateCreated, NOW()) AS hours
		FROM quote	
		WHERE Active = 1				
		ORDER BY DateCreated 			
	</cfquery>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Set the task tab verbage.                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">
			var taskElement = document.getElementById("tabQuoteVerbage");
			if (taskElement != null){
				document.getElementById("tabQuoteVerbage").innerHTML = 'Quotes (#trim(getQuotes.RecordCount)#)';		
			};	
		</script>
	</cfoutput>			


	
<!-------------------------------------------------------------------------------------->
<!--- Code Needed to run the Next N records view of claims query.                    --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="startRow_Quote" default="1" type="numeric">	
	<cfif IsDefined("form.startRow_Quote") AND form.startRow_Quote NEQ "">
		<cfset startRow_Quote = form.startRow_Quote>
	<cfelseif IsDefined("url.startRow_Quote") AND url.startRow_Quote NEQ "">
		<cfset startRow_Quote = url.startRow_Quote>	
	</cfif>
	
	<cfparam name="showAll" type="boolean" default="No">
	<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
		<cfset showAll = form.showAll>
	<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
		<cfset showAll = url.showAll>	
	</cfif>			
	
	<cfif IsDefined("form.rowsPerPage_Quote") AND form.rowsPerPage_Quote NEQ "">
		<cfset session.rowsPerPage_Quote = form.rowsPerPage_Quote>
	<cfelseif IsDefined("url.rowsPerPage_Quote") AND url.rowsPerPage_Quote NEQ "">
		<cfset session.rowsPerPage_Quote = url.rowsPerPage_Quote>	
	<cfelseif IsDefined("session.rowsPerPage_Quote") AND IsNumeric(session.rowsPerPage_Quote)>
		<cfset session.rowsPerPage_Quote = session.rowsPerPage_Quote>	
	<cfelse>
		<cfset session.rowsPerPage_Quote = 10>
	</cfif>
				
	<cfset totalRows = getQuotes.recordCount>
	<cfif showAll>
		<cfset rowsPerPage = totalRows>
	</cfif>
	<cfset endRow_Quote = min(startRow_Quote + session.rowsPerPage_Quote - 1, totalRows)>
	<cfset startRowNext = endRow_Quote + 1>
	<cfset startRowBack = startRow_Quote - session.rowsPerPage_Quote>
	
	
			
<!-------------------------------------------------------------------------------------->
<!--- Show the Quotes.                                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
					
			<cfif getQuotes.RecordCount LTE 0>
				<cfset title = "No&nbsp;Quotes&nbsp;Found">			
			<cfelseif getQuotes.RecordCount GTE 2>
				<cfset title = getQuotes.recordcount & "&nbsp;Quotes&nbsp;Found">
			<cfelse>
				<cfset title = getQuotes.recordcount & "&nbsp;Quote&nbsp;Found">
			</cfif>
			
			<!---<cfif ListContains(session.User.getRoleIDs(), "5") OR ListContains(session.User.getRoleIDs(), "6")>--->
				<cfset titleRight = "<span style=cursor:hand class=siteLabel onclick=""location.href='appQuoteSearch.cfm'""><u>Search&nbsp;Quotes</u></span>&nbsp;<span class=siteLabel>|</span>&nbsp;<span style=cursor:hand class=siteLabel onclick=""location.href='appQuoteCreateForm.cfm'""><u>Create&nbsp;Quote</u></span>">
			<!---<cfelse>--->
				<!---<cfset titleRight = "<span style=cursor:hand class=siteLabel onclick=""location.href='appQuoteCreateForm.cfm?'""><u>Create&nbsp;Quote</u></span>">--->
			<!---</cfif>--->
					
			<table border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td valign="bottom">
						<font color="003399" face="arial" size="2"><strong>#trim(title)#</strong></font>								
					</td>					
					<td align="right" valign="middle">
						&nbsp;&nbsp;&nbsp;&nbsp;#trim(titleRight)#
					</td>
				</tr>		
								
				<cfif getQuotes.Recordcount GTE 1>
					
					<tr><td colspan="2">
					
					<cf_gcNextNRecords type="Quote">
						
						<cf_gcTableScrollFixedHeader headers="ID,Input&nbsp;By,Date&nbsp;Created,Patient&nbsp;Name" mainwidth="420">
							<cfset Priority = 1>											
							<cfloop query="getQuotes" startRow="#trim(startRow_Quote)#" endRow="#trim(endRow_Quote)#">							
								
								<cfquery name="getCreatorName" datasource="#trim(request.datasource)#">
									SELECT FName, LName 
									FROM view_useraccountparameters 
									WHERE UsersID = #trim(hidden_UsersID)#
								</cfquery>
															
								<cfif currentrow MOD 2 EQ 0> 
									<cfset rowColor = "f9f9f9">
								<cfelse>
									<cfset rowColor = "FFFFFF">	
								</cfif>																
								 														
								<tr bgcolor=#trim(rowColor)# style="cursor:hand" onmouseover="this.style.backgroundColor='lightgrey';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="location.href='appQuoteEdit.cfm?quoteID=#trim(QuoteID)#'">			
									<td class="SiteLabel" nowrap align="center">#trim(quoteID)#</td>
									<td class="SiteLabel" nowrap>#UCASE(LEFT(trim(getCreatorName.FName),1))#. #REQUEST.capitalizeEveryFirstLetter(trim(getCreatorName.LName))#</td>
									<td class="SiteLabel" nowrap>#DateFormat(DateCreated, "m/dd/yy")# #TimeFormat(DateCreated, "hh:mm ttt")#</td>									
									<td class="SiteLabel" nowrap>#REQUEST.capitalizeEveryFirstLetter(trim(patientName))#</td>			
								</tr>
												
								<tr>
								    <td bgcolor="000000" colspan="5" style="height: 1px; border: 0px solid FF0000; padding: 0px 0px 0px 0px;"></td>
								</tr>							
								
							</cfloop>
					
						</cf_gcTableScrollFixedHeader>	
														
					</cf_gcNextNrecords>
					
					</td></tr>
				
				<cfelse>
					
					<tr><td colspan="2">
					
						<table align="left" cellpadding="5" cellspacing="0" border="0">				
							<tr>
								<td class="SiteLabel" valign="top">
									There are no quotes to show.
								</td>															
							</tr>
						</table>
					
					</td></tr>	
						
				</cfif>									
				
				</table>
				
			
			<!--- CFCATCH QUERY ERRORS--->			
			<cfcatch type="Any">
				
				<cfoutput>
					
					<p>Caught an exception, type = #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>	 		      
	
				</cfoutput>
				<cfexit>
				
			</cfcatch>
			
		</cftry>
		
	</cfoutput>
		
					


