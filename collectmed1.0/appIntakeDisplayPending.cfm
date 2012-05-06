<!---- appIntakeDisplayPending.cfm ---->

	

<!-------------------------------------------------------------------------------------->
<!--- Query to get the Intakes.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getPendingIntakes" datasource="#trim(request.datasource)#">
		SELECT CONCAT(patientFName, ' ', LEFT(patientLName, 9)) AS patientName,RecordID,UsersID,Active,DateCreated,DateModified,
		TIMESTAMPDIFF(hour, DateCreated, now()) AS hours
		FROM IntakeAutoSave		
		WHERE UsersID = #session.user.getUsersID()# AND Active = 1
		ORDER BY DateCreated						
	</cfquery>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Set the task tab verbage.                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">
			var taskElement = document.getElementById("tabIntakePendingVerbage");
			if (taskElement != null){
				document.getElementById("tabIntakePendingVerbage").innerHTML = 'Pending (#trim(getPendingIntakes.RecordCount)#)';		
			};	
		</script>
	</cfoutput>			
		

		
<!-------------------------------------------------------------------------------------->
<!--- Code Needed to run the Next N records view of claims query.                    --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="startRow_PendingIntake" default="1" type="numeric">	
	<cfif IsDefined("form.startRow_PendingIntake") AND form.startRow_PendingIntake NEQ "">
		<cfset startRow_PendingIntake = form.startRow_PendingIntake>
	<cfelseif IsDefined("url.startRow_PendingIntake") AND url.startRow_PendingIntake NEQ "">
		<cfset startRow_PendingIntake = url.startRow_PendingIntake>	
	</cfif>
	
	<cfparam name="showAll" type="boolean" default="No">
	<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
		<cfset showAll = form.showAll>
	<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
		<cfset showAll = url.showAll>	
	</cfif>			
	
	<cfif IsDefined("form.rowsPerPage_PendingIntake") AND form.rowsPerPage_PendingIntake NEQ "">
		<cfset session.rowsPerPage_PendingIntake = form.rowsPerPage_PendingIntake>
	<cfelseif IsDefined("url.rowsPerPage_PendingIntake") AND url.rowsPerPage_PendingIntake NEQ "">
		<cfset session.rowsPerPage_PendingIntake = url.rowsPerPage_PendingIntake>	
	<cfelseif IsDefined("session.rowsPerPage_PendingIntake") AND IsNumeric(session.rowsPerPage_PendingIntake)>
		<cfset session.rowsPerPage_PendingIntake = session.rowsPerPage_PendingIntake>	
	<cfelse>
		<cfset session.rowsPerPage_PendingIntake = 10>
	</cfif>
				
	<cfset totalRows = getPendingIntakes.recordCount>
	<cfif showAll>
		<cfset rowsPerPage = totalRows>
	</cfif>
	<cfset endRow_PendingIntake = min(startRow_PendingIntake + session.rowsPerPage_PendingIntake - 1, totalRows)>
	<cfset startRowNext = endRow_PendingIntake + 1>
	<cfset startRowBack = startRow_PendingIntake - session.rowsPerPage_PendingIntake>
		
	
			
			
<!-------------------------------------------------------------------------------------->
<!--- Show the intakes.                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
					
			<cfif getPendingIntakes.RecordCount LTE 0>
				<cfset title = "No&nbsp;Pending&nbsp;Intakes&nbsp;Found">			
			<cfelseif getPendingIntakes.RecordCount GTE 2>
				<cfset title = getPendingIntakes.recordcount & "&nbsp;Pending&nbsp;Intakes&nbsp;Found">
			<cfelse>
				<cfset title = getPendingIntakes.recordcount & "&nbsp;Pending&nbsp;Intake&nbsp;Found">
			</cfif> 			
			
			<!---<cf_gcBorderedTable	title="#title#" tableWidth="100%" tablealign="left" titleRight="#trim(titleRight)#">--->	
			<table border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td valign="bottom">
						<font color="003399" face="arial" size="2"><strong>#trim(title)#</strong></font>								
					</td>
					<td align="right" valign="middle">
						&nbsp;
					</td>
				</tr>		
								
				<cfif getPendingIntakes.Recordcount GTE 1>
					
					<tr><td colspan="2">
					
					<cf_gcNextNRecords type="PendingIntake">
						
						<cf_gcTableScrollFixedHeader headers="ID,Date&nbsp;Created,Patient&nbsp;Name" mainwidth="420">
							<cfset Priority = 1>											
							<cfloop query="getPendingIntakes" startRow="#trim(startRow_PendingIntake)#" endRow="#trim(endRow_PendingIntake)#">							
															
								<!---<cfif hours GT 96>
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
								 														
								<tr bgcolor=#trim(rowColor)# style="cursor:hand" onmouseover="this.style.backgroundColor='lightgrey';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="location.href='appPatientIntakePendingEdit.cfm?recordID=#trim(RecordID)#'">			
									<td class="SiteLabel" nowrap align="center">#trim(recordID)#</td>
									<td class="SiteLabel" nowrap>#DateFormat(DateCreated, "m/dd/yy")# #TimeFormat(DateCreated, "hh:mm ttt")#</td>									
									<td class="SiteLabel" nowrap>#REQUEST.capitalizeEveryFirstLetter(trim(patientName))#</td>			
								</tr>
												
								<tr>
								    <td bgcolor="000000" colspan="5" style="height: 1px; border: 0px solid FF0000; padding: 0px 0px 0px 0px;"></td>
								</tr>							
								
							</cfloop>
					
						</cf_gcTableScrollFixedHeader>	
						
						<!---<table cellspacing="0" cellpadding="0" border="0">														
							<tr>
							    <td bgcolor="FFFFFF" colspan="11" style="height: 4px; border: 0px solid FFFFFF; padding: 0px 0px 0px 0px;"></td>
							</tr>	
							<tr>	   
								<td class="sitelabel" bgcolor="FF0000" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FF0000">m</font></td>
								<td class="sitelabel" onmouseover="doTooltip(1, this, event, 'Over 96 hours in queue');" onmouseout="hideTip(this);">&nbsp;Urgent</td>
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="FFFF66" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FFFF66">m</font></td>
								<td class="sitelabel" onmouseover="doTooltip(1, this, event, 'Over 48 hours in queue');" onmouseout="hideTip(this);">&nbsp;High</td>   	
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="CCFFCC" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="CCFFCC">m</font></td>
								<td class="sitelabel" onmouseover="doTooltip(1, this, event, 'Over 24 hours in queue');" onmouseout="hideTip(this);">&nbsp;Medium</td>   	
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="FFFFFF" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FFFFFF">m</font></td>
								<td class="sitelabel">&nbsp;Low</td>   	    
							</tr>
						</table>--->																		
									
					</cf_gcNextNrecords>
					
					</td></tr>
				
				<cfelse>
					
					<tr><td colspan="2">
					
						<table align="left" cellpadding="5" cellspacing="0" border="0">				
							<tr>
								<td class="SiteLabel" valign="top">
									There are no intakes to show.
								</td>															
							</tr>
						</table>
					
					</td></tr>	
						
				</cfif>					
							
				<!---</cf_gcBorderedTable>--->
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
		
		