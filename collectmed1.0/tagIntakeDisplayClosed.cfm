<!---tagIntakeDisplayPending.cfm--->
	
	

		
<!-------------------------------------------------------------------------------------->
<!--- Build the query based on the parameters sent in.                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>		
			
			<cfif clear OR (IsDefined("form.clear_session.User.IntakeDisplayClosedQuery") AND form.clear_session.User.IntakeDisplayClosedQuery EQ 1) OR NOT IsDefined("session.User.IntakeDisplayClosedQuery") OR session.User.IntakeDisplayClosedQuery EQ "">
							
				<cfsavecontent variable="sqlStatement">			
					SELECT DISTINCT i.ClosingInvoiceNumber, i.IntakeID, i.assignedToUserID, i.Active, i.InactiveCode, i.DateCreated, u.usersID, 
					e.FName As userFName, e.LName AS userLName, TIMESTAMPDIFF(hour, i.DateCreated, now()) AS hours, CONCAT(i.orderingPhysicianFNameTBox, ' ', orderingPhysicianLNameTBox) AS orderingPhysicianNameTBox, 
					CONCAT(ee.FName, ' ', LEFT(ee.LName, 9)) AS patientNameTBox, 
					a.City AS patientCityTBox, 
					ee.DOB AS patientDOB, 
					ee.SSN AS patientSSNTBox				
					FROM intake i 
					LEFT JOIN pa_master.Users u ON i.hidden_UsersID = u.UsersID 
					LEFT JOIN Entity e ON u.EntityID = e.EntityID
					LEFT JOIN Patient p ON i.PatientID = p.PatientID
					LEFT JOIN Entity ee ON ee.EntityID = p.EntityID
					LEFT JOIN ADDRESS a ON a.AddressID = i.patientAddressID
					WHERE i.ClientID = #trim(session.clientID)#
													
					AND i.Active = 1				
													
					<!---Title parameter LATER: Add the full text search http://www.databasejournal.com/features/mssql/article.php/3441981 Full Text Search on SQL 2000 Part 1 By Don Schlichting --->		
					<cfif lastNameContains NEQ "">
						AND ee.LName LIKE '%#trim(lastNameContains)#%'
					</cfif> 
					
					<!---Assigned to UserID--->
					<cfif assignedToUserID NEQ "">
						AND i.AssignedToUserID IN(#trim(assignedToUserID)#)
					</cfif>
					
					<!---Unassigned Intakes--->			
					<cfif unassigned_Hidden NEQ "">
						AND i.AssignedToUserID IS NULL
					</cfif>			
					
					<!---DateCreated--->				
					<cfif IsDate(DateCreated) AND DateCreatedBetween EQ "" AND dateCreatedParameter NEQ "">
						AND  i.DateCreated <cfif dateCreatedParameter EQ "GT"> > <cfelseif dateCreatedParameter EQ "LT"> < </cfif> #CreateODBCDate(dateCreated)# 				
					<cfelseif IsDate(DateCreated) AND dateCreatedParameter EQ "between" AND IsDate(DateCreatedBetween)>
						AND  i.DateCreated > #CreateODBCDate(dateCreated)#
						AND  i.DateCreated < #CreateODBCDate(dateCreatedBetween)# 						
					</cfif>
					
					<!---datecreated--->				
					<cfif IsDate(datecreated) AND datecreatedBetween EQ "" AND (datecreatedParameter EQ "GT" OR datecreatedParameter EQ "LT")>
						AND  i.datecreated <cfif datecreatedParameter EQ "GT"> > <cfelseif datecreatedParameter EQ "LT"> < </cfif> #CreateODBCDate(datecreated)# 				
					<cfelseif IsDate(datecreated) AND datecreatedParameter EQ "between" AND IsDate(datecreatedBetween)>
						AND  i.datecreated > #CreateODBCDate(datecreated)#
						AND  i.datecreated < #CreateODBCDate(datecreatedBetween)# 
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
						AND  i.datecreated > #CreateODBCDate(NOW())#
						AND  i.datecreated < #CreateODBCDate(datecreatedCalculated)#
					<cfelseif datecreatedParameter EQ "NULL">	 							
						AND datecreated IS NULL
					</cfif>
																	
					<!---Patient ID--->
					<cfif patientID NEQ "">
						AND i.EntityID IN(#trim(patientID)#)
					</cfif>
					
					<!---Intake IDs--->
					<cfif intakeIDs NEQ "">
						AND i.IntakeID IN(#trim(intakeIDs)#)
					</cfif>
					
					<!---PatientSSNTBox--->
					<cfif IsDefined("ID") AND IsNumeric(ID)>
						AND ee.SSN = '#REQUEST.formatSSN(trim(ID))#'
					</cfif>
					
					AND i.ClosingInvoiceNumber IS NOT NULL
									
				</cfsavecontent>	
			
				<cfset session.User.IntakeDisplayClosedQuery = sqlStatement>
			
			<cfelse>
			
				<cfset sqlStatement = session.User.IntakeDisplayClosedQuery>
			
			</cfif>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Run the query that was just built.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getClosedIntakes" datasource="#trim(request.datasource)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>
				
			<!-------------------------------------------------------------------------------------->
			<!--- Set the task tab verbage.                                                      --->
			<!-------------------------------------------------------------------------------------->	
			<cfoutput>
				<script language="JavaScript">
					var taskElement = document.getElementById("tabIntakeClosedVerbage");
					if (taskElement != null){
						document.getElementById("tabIntakeClosedVerbage").innerHTML = 'Closed (#trim(getClosedIntakes.RecordCount)#)';		
					};	
				</script>
			</cfoutput>	


			<!-------------------------------------------------------------------------------------->
			<!--- Code Needed to run the Next N records view of intakes query.                    --->
			<!-------------------------------------------------------------------------------------->
			<cfparam name="startRow_ClosedIntake" default="1" type="numeric">	
			<cfif IsDefined("form.startRow_ClosedIntake") AND form.startRow_ClosedIntake NEQ "">
				<cfset startRow_ClosedIntake = form.startRow_ClosedIntake>
			<cfelseif IsDefined("url.startRow_ClosedIntake") AND url.startRow_ClosedIntake NEQ "">
				<cfset startRow_ClosedIntake = url.startRow_ClosedIntake>	
			</cfif>
			
			<cfparam name="showAll" type="boolean" default="No">
			<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
				<cfset showAll = form.showAll>
			<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
				<cfset showAll = url.showAll>	
			</cfif>			
			
			<cfif clear>
				<cfset session.rowsPerPage_ClosedIntake = "">
				<!---<cfset startRow_ClosedIntake = 1>	--->
			</cfif>
			
			<cfif IsDefined("form.rowsPerPage_ClosedIntake") AND form.rowsPerPage_ClosedIntake NEQ "">
				<cfset session.rowsPerPage_ClosedIntake = form.rowsPerPage_ClosedIntake>
			<cfelseif IsDefined("url.rowsPerPage_ClosedIntake") AND url.rowsPerPage_ClosedIntake NEQ "">
				<cfset session.rowsPerPage_ClosedIntake = url.rowsPerPage_ClosedIntake>	
			<cfelseif IsDefined("session.rowsPerPage_ClosedIntake") AND IsNumeric(session.rowsPerPage_ClosedIntake)>
				<cfset session.rowsPerPage_ClosedIntake = session.rowsPerPage_ClosedIntake>	
			<cfelse>
				<cfset session.rowsPerPage_ClosedIntake = session.Client.getRecordsPerPage()>
			</cfif>
						
			<cfset totalRows = getClosedIntakes.recordCount>
			<cfif showAll>
				<cfset rowsPerPage = totalRows>
			</cfif>
			<cfset endRow_ClosedIntake = min(startRow_ClosedIntake + session.rowsPerPage_ClosedIntake - 1, totalRows)>
			<cfset startRowNext = endRow_ClosedIntake + 1>
			<cfset startRowBack = startRow_ClosedIntake - session.rowsPerPage_ClosedIntake>
				
			
									
			<!-------------------------------------------------------------------------------------->
			<!--- Start the display of this page.                                                --->
			<!-------------------------------------------------------------------------------------->						
			<cfif msg NEQ "">
				<cfoutput>
					<p><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font></p>			
				</cfoutput>
			</cfif>				
				
			<cf_gcNextNRecords type="ClosedIntake">					
			
				<table border="0" cellpadding="4" cellspacing="0" class="Tbl">
				
					<thead>												
						<td nowrap valign="bottom">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">ID&nbsp;</td>
								   	<td><span style="cursor: hand;" onclick="submitReprocess('intakeid', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
								</tr>
								<tr>
								    <td><span style="cursor: hand;" onclick="submitReprocess('intakeid', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
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
						<td nowrap valign="bottom">										
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Assigned</td>
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
											
					<cfloop query="getClosedIntakes" startRow="#trim(startRow_ClosedIntake)#" endRow="#trim(endRow_ClosedIntake)#">					
																				
						<!---Show Intake Assignments--->
						<cfquery name="getAssignments" datasource="#trim(request.datasource)#">
							SELECT ia.UserID, ia.AssignorID, ia.DateCreated AS AssignmentDateCreated, ia.Note, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname 
							FROM intakeassignment ia 
							JOIN view_useraccountparameters vuap ON ia.UserID = vuap.UsersID
							WHERE ia.IntakeID = #trim(IntakeID)#
							ORDER BY ia.DateCreated DESC
						</cfquery>
						
						<cfset showAssignments = "">
						
						<cfloop query="getAssignments">
							
							<cfquery name="getByAssignmentName" datasource="#trim(request.datasource)#">
								SELECT CONCAT(FName, ' ', LName) AS AssignorFullname 
								FROM view_useraccountparameters 
								WHERE UsersID = #trim(AssignorID)#
							</cfquery>
							
							<cfset showAssignments = showAssignments & "<strong>Assigned to:</strong> " & Fullname & " <strong>by</strong> " & getByAssignmentName.AssignorFullname & " <strong>on</strong> " & DateFormat(AssignmentDateCreated, 'm/d/yy') & " " & TimeFormat(AssignmentDateCreated, 'hh:mm:ss tt') & "<br> <strong>Note:</strong> " & note & "<p>">
						
						</cfloop>
						
						<cfset assignedToUserFName = "">
						<cfset assignedToUserLName = "">
						
						<cfif IsNumeric(assignedToUserID)>
							<cfquery name="getByAssignedToName" datasource="#trim(request.datasource)#">
								SELECT FName, LName
								FROM view_useraccountparameters 
								WHERE UsersID = #trim(assignedToUserID)#
							</cfquery>
							
							<cfset assignedToUserFName = getByAssignedToName.FName>
							<cfset assignedToUserLName = getByAssignedToName.LName>
						
						</cfif>
						
						<!---<cfif IsNumeric(ClosingInvoiceNumber)>
							<cfset rowColor = "FF9933">								
						<cfelseif hours GT 96>
							<cfset rowColor = "ff6666">
						<cfelseif hours GT 48 AND hours LTE 96>
							<cfset rowColor = "FFFF66">
						<cfelseif hours GT 24 AND hours LTE 48>
							<cfset rowColor = "CCFFCC">
						<cfelse>--->
							<cfif currentrow MOD 2 EQ 0> 
								<cfset rowColor = "f9f9f9">
							<cfelse>
								<cfset rowColor = "FFFFFF">	
							</cfif>					
						<!---</cfif>--->
						
						<cfset timeInQueue = countdown(trim(DateCreated))>	
																								
						<cfoutput>							
							<tr bgcolor=#trim(rowColor)# style="cursor:hand" onmouseover="this.style.backgroundColor='lightgrey';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="location.href='appPatientIntakeEdit.cfm?intakeID=#trim(intakeID)#'">										
								<td class="SiteLabel"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '<span style=cursor:hand onmouseover=getIntakeNote(#trim(intakeID)#);><u><strong>View Intake Notes</strong></u></span><p><span id=spIntakeNote>&nbsp;</span>');" onmouseout="hideTip(this);">#intakeID#</span></td>
								<td class="SiteLabel">&nbsp;</td>		
								<td class="SiteLabel" nowrap align="left">#REQUEST.capitalizeEveryFirstLetter(trim(patientNameTBox))#</td>
								<td>&nbsp;</td>	
								<td class="SiteLabel" nowrap>#DateFormat(trim(patientDOB), "mm/dd/yyyy")#</td>
								<td>&nbsp;</td>	
								<td class="SiteLabel" nowrap align="left">#REQUEST.capitalizeEveryFirstLetter(trim(patientSSNTBox))#</td>
								<td>&nbsp;</td>												
								<td class="SiteLabel" nowrap align="left">#LEFT(trim(userFName), 1)#<cfif userLName NEQ "">.</cfif> #trim(userLName)#</td>
								<td>&nbsp;</td>												
								<cfset showAssignments = Replace(showAssignments, "'", "\'", "ALL")>
								<cfset showAssignments = Replace(showAssignments, CHR(10), "", "ALL")>	
								<cfset showAssignments = Replace(showAssignments, CHR(13), "", "ALL")>
								<td class="SiteLabel" nowrap align="left"><cfif trim(AssignedToUserID) EQ ""><font color="990000"><span style="cursor: hand;" onclick="assignIntake(#IntakeID#,0);"><u>Unassigned</u></span></font><cfelse><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, ' <span style=cursor:hand onclick=assignIntake(#IntakeID#,1);><u><strong>Re-Assign Intake</strong></u></span><p>#trim(showAssignments)#');" onmouseout="hideTip(this);">#LEFT(trim(assignedToUserFName), 1)#<cfif userLName NEQ "">.</cfif> #trim(assignedToUserLName)#</span></cfif></td>
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
	
	


