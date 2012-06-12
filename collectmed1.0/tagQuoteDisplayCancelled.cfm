<!---tagQuoteDisplay.cfm--->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.unassigned_Hidden" default="">
	<cfset unassigned_Hidden = attributes.unassigned_Hidden>
	
	<cfif IsDefined("form.unassigned_Hidden") AND form.unassigned_Hidden NEQ "">
		<cfset unassigned_Hidden = form.unassigned_Hidden>
	<cfelseif IsDefined("url.unassigned_Hidden") AND url.unassigned_Hidden NEQ "">
		<cfset unassigned_Hidden = url.unassigned_Hidden>	
	</cfif>	
	
	<cfparam name="attributes.PatientID" default="">
	<cfset PatientID = attributes.PatientID>
	
	<cfif IsDefined("form.PatientID") AND form.PatientID NEQ "">
		<cfset PatientID = form.PatientID>
	<cfelseif IsDefined("url.PatientID") AND url.PatientID NEQ "">
		<cfset PatientID = url.PatientID>	
	</cfif>
	
	<cfparam name="attributes.quoteIDs" default="">
	<cfset quoteIDs = attributes.quoteIDs>
	
	<cfif IsDefined("form.quoteIDs") AND form.quoteIDs NEQ "">
		<cfset quoteIDs = form.quoteIDs>
	<cfelseif IsDefined("url.quoteIDs") AND url.quoteIDs NEQ "">
		<cfset quoteIDs = url.quoteIDs>	
	</cfif>

		
		
<!-------------------------------------------------------------------------------------->
<!--- Build the query based on the parameters sent in.                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>			
			
			<cfsavecontent variable="sqlStatement">			
				SELECT DISTINCT q.QuoteID, q.assignedToUserID, q.Active, q.InactiveCode, q.DateCreated, u.usersID, 
				e.FName As userFName, e.LName AS userLName, TIMESTAMPDIFF(hour, q.DateCreated, now()) AS hours, 
				CONCAT(q.patientFNameTBox, ' ', LEFT(patientLNameTBox, 9)) AS patientNameTBox, patientCityTBox, patientDOBMM, patientDOBDD, patientDOBYY, patientSSNTBox, 
				CONCAT(q.orderingPhysicianFNameTBox, ' ', orderingPhysicianLNameTBox) AS orderingPhysicianNameTBox 
				FROM quote q 
				LEFT JOIN pa_master.users u ON q.hidden_UsersID = u.UsersID 
				LEFT JOIN Entity e ON u.EntityID = e.EntityID
				WHERE q.ClientID = #trim(session.clientID)#
				
				<!---Active parameter--->		
				<cfif Active GTE 0>
					AND q.Active = #trim(active)#
				</cfif>
												
				<!---Title parameter LATER: Add the full text search http://www.databasejournal.com/features/mssql/article.php/3441981 Full Text Search on SQL 2000 Part 1 By Don Schlichting --->		
				<cfif lastNameContains NEQ "">
					AND q.patientLNameTBox LIKE '%#trim(lastNameContains)#%'
				</cfif> 
				
				<!---Assigned to UserID--->
				<cfif assignedToUserID NEQ "">
					AND q.AssignedToUserID IN(#trim(assignedToUserID)#)
				</cfif>
				
				<!---Unassigned Quotes--->			
				<cfif unassigned_Hidden NEQ "">
					AND q.AssignedToUserID IS NULL
				</cfif>			
				
				<!---DateCreated--->				
				<cfif IsDate(DateCreated) AND DateCreatedBetween EQ "" AND dateCreatedParameter NEQ "">
					AND  q.DateCreated <cfif dateCreatedParameter EQ "GT"> > <cfelseif dateCreatedParameter EQ "LT"> < </cfif> #CreateODBCDate(dateCreated)# 				
				<cfelseif IsDate(DateCreated) AND dateCreatedParameter EQ "between" AND IsDate(DateCreatedBetween)>
					AND  q.DateCreated > #CreateODBCDate(dateCreated)#
					AND  q.DateCreated < #CreateODBCDate(dateCreatedBetween)# 						
				</cfif>
				
				<!---datecreated--->				
				<cfif IsDate(datecreated) AND datecreatedBetween EQ "" AND (datecreatedParameter EQ "GT" OR datecreatedParameter EQ "LT")>
					AND  q.datecreated <cfif datecreatedParameter EQ "GT"> > <cfelseif datecreatedParameter EQ "LT"> < </cfif> #CreateODBCDate(datecreated)# 				
				<cfelseif IsDate(datecreated) AND datecreatedParameter EQ "between" AND IsDate(datecreatedBetween)>
					AND  q.datecreated > #CreateODBCDate(datecreated)#
					AND  q.datecreated < #CreateODBCDate(datecreatedBetween)# 
				<cfelseif datecreatedParameter NEQ "" AND NOT ListFindNoCase("GT,LT,between,NULL", datecreatedParameter)>
					<cfif datecreatedParameter EQ "1weeks">
						<cfset datecreatedCalculated = DateAdd("d", 7, NOW())>
					<cfelseif datecreatedParameter EQ "2weeks">
						<cfset datecreatedCalculated = DateAdd("d", 14, NOW())>	
					<cfelseif datecreatedParameter EQ "3weeks">
						<cfset datecreatedCalculated = DateAdd("d", 21, NOW())>	
					<cfelseif datecreatedParameter EQ "1months">
						<cfset datecreatedCalculated = DateAdd("m", 1, NOW())>
					<cfelseif datecreatedParameter EQ "2months">
						<cfset datecreatedCalculated = DateAdd("m", 2, NOW())>
					<cfelseif datecreatedParameter EQ "3months">
						<cfset datecreatedCalculated = DateAdd("m", 3, NOW())>			
					</cfif>
					AND  q.datecreated > #CreateODBCDate(NOW())#
					AND  q.datecreated < #CreateODBCDate(datecreatedCalculated)#
				<cfelseif datecreatedParameter EQ "NULL">	 							
					AND datecreated IS NULL
				</cfif>
				
				<!---Quote IDs--->
				<cfif quoteIDs NEQ "">
					AND q.QuoteID IN(#trim(quoteIDs)#)
				</cfif>
				
				<!---PatientSSNTBox--->
				<cfif IsDefined("ID") AND IsNumeric(ID)>
					AND PatientSSNTBox = '#REQUEST.formatSSN(trim(ID))#'
				</cfif>
				
				AND q.Active = 0
				
				AND q.Cancelled = 1
								
			</cfsavecontent>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Run the query that was just built.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getQuotes" datasource="#trim(request.datasource)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>		
			

			<!-------------------------------------------------------------------------------------->
			<!--- Set the task tab verbage.                                                      --->
			<!-------------------------------------------------------------------------------------->	
			<cfoutput>
				<script language="JavaScript">
					var taskElement = document.getElementById("tabQuoteCancelledVerbage");
					if (taskElement != null){
						document.getElementById("tabQuoteCancelledVerbage").innerHTML = 'Cancelled (#trim(getQuotes.RecordCount)#)';		
					};	
				</script>
			</cfoutput>					


			<!-------------------------------------------------------------------------------------->
			<!--- Code Needed to run the Next N records view of quotes query.                    --->
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
				<cfset session.rowsPerPage_Quote = session.Client.getRecordsPerPage()>
			</cfif>
						
			<cfset totalRows = getQuotes.recordCount>
			<cfif showAll>
				<cfset rowsPerPage = totalRows>
			</cfif>
			<cfset endRow_Quote = min(startRow_Quote + session.rowsPerPage_Quote - 1, totalRows)>
			<cfset startRowNext = endRow_Quote + 1>
			<cfset startRowBack = startRow_Quote - session.rowsPerPage_Quote>
				
			
									
			<!-------------------------------------------------------------------------------------->
			<!--- Start the display of this page.                                                --->
			<!-------------------------------------------------------------------------------------->					
			<cfif msg NEQ "">
				<cfoutput>
					<p><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font></p>			
				</cfoutput>
			</cfif>
									
			<cf_gcNextNRecords type="Quote">					
			
				<table border="0" cellpadding="4" cellspacing="0" class="Tbl">
				
					<thead>												
						<td nowrap valign="bottom">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">ID&nbsp;</td>
								   	<td><span style="cursor: hand;" onclick="submitReprocess('quoteid', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('quoteid', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
								</tr>
							</table>
						</td>	
						
						<td>&nbsp;</td>
						<td nowrap valign="bottom" align="left">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Patient</td>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
								</tr>
							</table>
						</td>
						
						<td>&nbsp;</td>
						<td nowrap valign="bottom">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">DOB</td>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
								</tr>
							</table>
						</td>
						
						<td>&nbsp;</td>
						<td nowrap valign="bottom">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">SSN</td>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
								</tr>
							</table>
						</td>
															
						<td>&nbsp;</td>
						<td nowrap valign="bottom">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Input&nbsp;By</td>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('userLName', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
								</tr>
							</table>
						</td>	
																																	
						
						<td>&nbsp;</td>
						<td nowrap valign="bottom" align="left">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap align="left" valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">City</td>
								    <td><span style="cursor: hand;" onclick="submitReprocess('datecreated', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('datecreated', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
								</tr>
							</table>
						</td>		
																													
						<td>&nbsp;</td>
						<td nowrap valign="bottom">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Created</td>
								    <td><span style="cursor: hand;" onclick="submitReprocess('datecreated', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('datecreated', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
								</tr>
							</table>
						</td>											
							
					</thead>
											
					<cfloop query="getQuotes" startRow="#trim(startRow_Quote)#" endRow="#trim(endRow_Quote)#">					
											
						<cfif hours GT 96>
							<cfset rowColor = "ff6666">
						<cfelseif hours GT 48 AND hours LTE 96>
							<cfset rowColor = "FFFF66">
						<cfelseif hours GT 24 AND hours LTE 48>
							<cfset rowColor = "CCFFCC">
						<cfelse>
							<cfif currentrow MOD 2 EQ 0> 
								<cfset rowColor = "f9f9f9">
							<cfelse>
								<cfset rowColor = "FFFFFF">	
							</cfif>					
						</cfif>	
						
						<cfset timeInQueue = countDown(trim(DateCreated))>	
																								
						<cfoutput>							
							<tr bgcolor=#trim(rowColor)# style="cursor:hand" onmouseover="this.style.backgroundColor='lightgrey';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="location.href='appQuoteEdit.cfm?quoteID=#trim(quoteID)#'">										
								<td class="SiteLabel"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '<span style=cursor:hand onmouseover=getQuoteNote(#trim(quoteID)#);><u><strong>View Quote Notes</strong></u></span><p><span id=spQuoteNote>&nbsp;</span>');" onmouseout="hideTip(this);">#quoteID#</span></td>
								<td class="SiteLabel">&nbsp;</td>		
								<td class="SiteLabel" nowrap align="left">#REQUEST.capitalizeEveryFirstLetter(trim(patientNameTBox))#</td>
								<td>&nbsp;</td>	
								<td class="SiteLabel" nowrap>
									<cfif IsNumeric(trim(patientDOBYY)) AND IsNumeric(trim(patientDOBMM)) AND IsNumeric(trim(patientDOBDD))>
										<cfset thisDate = "#trim(patientDOBMM)#/#trim(patientDOBDD)#/#trim(patientDOBYY)#">
										<cfif IsDate(thisDate)>
											#DateFormat(CreateDate(trim(patientDOBYY), trim(patientDOBMM), trim(patientDOBDD)), "mm/dd/yyyy")#
										<cfelse>
											&nbsp;	
										</cfif>
									<cfelse>
										&nbsp;	
									</cfif>
								</td>
								<td>&nbsp;</td>	
								<td class="SiteLabel" nowrap align="left">#trim(patientSSNTBox)#</td>
								<td>&nbsp;</td>												
								<td class="SiteLabel" nowrap align="left">#LEFT(trim(userFName), 1)#<cfif userLName NEQ "">.</cfif> #trim(userLName)#</td>
								<td>&nbsp;</td>												
								<td class="SiteLabel" nowrap align="left">#REQUEST.capitalizeEveryFirstLetter(trim(patientCityTBox))#</td>
								<td>&nbsp;</td>	
								<td class="SiteLabel" nowrap align="right"><span style="cursor:hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(timeInQueue)# in queue');" onmouseout="hideTip(this);">#DateFormat(trim(DateCreated), 'MMM d, yyyy')# #TimeFormat(trim(DateCreated), 'hh:mm tt')#</span></td>									
							</tr>
						</cfoutput>
						
					</cfloop>
						
				</table>
					
			</cf_gcNextNrecords>			
			
			<br>
															
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
	
	
