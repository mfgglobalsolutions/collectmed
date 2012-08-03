<!---- appClaimSearchProcess.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->			
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	<cfparam name="attributes.active" default="">
	<cfset active = attributes.active>
	
	<cfif IsDefined("form.active") AND form.active NEQ "">
		<cfset active = form.active>
	<cfelseif IsDefined("url.active") AND url.active NEQ "">
		<cfset active = url.active>	
	</cfif>
	
	<cfparam name="attributes.claimType" default="">
	<cfset claimType = attributes.claimType>
	
	<cfif IsDefined("form.claimType") AND form.claimType NEQ "">
		<cfset claimType = form.claimType>
	<cfelseif IsDefined("url.claimType") AND url.claimType NEQ "">
		<cfset claimType = url.claimType>	
	</cfif>
	
	<cfparam name="attributes.lastNameContains" default="">
	<cfset lastNameContains = attributes.lastNameContains>
	
	<cfif IsDefined("form.lastNameContains") AND form.lastNameContains NEQ "">
		<cfset lastNameContains = form.lastNameContains>
	<cfelseif IsDefined("url.lastNameContains") AND url.lastNameContains NEQ "">
		<cfset lastNameContains = url.lastNameContains>	
	</cfif>
	
	<cfparam name="attributes.icn" default="">
	<cfset icn = attributes.icn>
	
	<cfif IsDefined("form.icn") AND form.icn NEQ "">
		<cfset icn = form.icn>
	<cfelseif IsDefined("url.icn") AND url.icn NEQ "">
		<cfset icn = url.icn>	
	</cfif>
	
	<cfparam name="attributes.assignedToUserID" default="">
	<cfset assignedToUserID = attributes.assignedToUserID>
	
	<cfif IsDefined("form.assignedToUserID") AND form.assignedToUserID NEQ "">
		<cfset assignedToUserID = form.assignedToUserID>
	<cfelseif IsDefined("url.assignedToUserID") AND url.assignedToUserID NEQ "">
		<cfset assignedToUserID = url.assignedToUserID>	
	</cfif>
	
	<cfparam name="attributes.unassigned_Hidden" default="">
	<cfset unassigned_Hidden = attributes.unassigned_Hidden>
	
	<cfif IsDefined("form.unassigned_Hidden") AND form.unassigned_Hidden NEQ "">
		<cfset unassigned_Hidden = form.unassigned_Hidden>
	<cfelseif IsDefined("url.unassigned_Hidden") AND url.unassigned_Hidden NEQ "">
		<cfset unassigned_Hidden = url.unassigned_Hidden>	
	</cfif>
	
	<cfparam name="attributes.dateCreated" default="">
	<cfset dateCreated = attributes.dateCreated>
	
	<cfif IsDefined("form.dateCreated") AND form.dateCreated NEQ "">
		<cfset dateCreated = form.dateCreated>
	<cfelseif IsDefined("url.dateCreated") AND url.dateCreated NEQ "">
		<cfset dateCreated = url.dateCreated>	
	</cfif>
	
	<cfparam name="attributes.dateCreatedBetween" default="">
	<cfset dateCreatedBetween = attributes.dateCreatedBetween>
	
	<cfif IsDefined("form.dateCreatedBetween") AND form.dateCreatedBetween NEQ "">
		<cfset dateCreatedBetween = form.dateCreatedBetween>
	<cfelseif IsDefined("url.dateCreatedBetween") AND url.dateCreatedBetween NEQ "">
		<cfset dateCreatedBetween = url.dateCreatedBetween>	
	</cfif>
	
	<cfparam name="attributes.dateCreatedParameter" default="">
	<cfset dateCreatedParameter = attributes.dateCreatedParameter>
	
	<cfif IsDefined("form.dateCreatedParameter") AND form.dateCreatedParameter NEQ "">
		<cfset dateCreatedParameter = form.dateCreatedParameter>
	<cfelseif IsDefined("url.dateCreatedParameter") AND url.dateCreatedParameter NEQ "">
		<cfset dateCreatedParameter = url.dateCreatedParameter>	
	</cfif>
	
	<cfparam name="attributes.serviceDateCreated" default="">
	<cfset serviceDateCreated = attributes.serviceDateCreated>
	
	<cfif IsDefined("form.serviceDateCreated") AND form.serviceDateCreated NEQ "">
		<cfset serviceDateCreated = form.serviceDateCreated>
	<cfelseif IsDefined("url.serviceDateCreated") AND url.serviceDateCreated NEQ "">
		<cfset serviceDateCreated = url.serviceDateCreated>	
	</cfif>
	
	<cfparam name="attributes.serviceDateCreatedBetween" default="">
	<cfset serviceDateCreatedBetween = attributes.serviceDateCreatedBetween>
	
	<cfif IsDefined("form.serviceDateCreatedBetween") AND form.serviceDateCreatedBetween NEQ "">
		<cfset serviceDateCreatedBetween = form.serviceDateCreatedBetween>
	<cfelseif IsDefined("url.serviceDateCreatedBetween") AND url.serviceDateCreatedBetween NEQ "">
		<cfset serviceDateCreatedBetween = url.serviceDateCreatedBetween>	
	</cfif>
	
	<cfparam name="attributes.serviceDateCreatedParameter" default="">
	<cfset serviceDateCreatedParameter = attributes.serviceDateCreatedParameter>
	
	<cfif IsDefined("form.serviceDateCreatedParameter") AND form.serviceDateCreatedParameter NEQ "">
		<cfset serviceDateCreatedParameter = form.serviceDateCreatedParameter>
	<cfelseif IsDefined("url.serviceDateCreatedParameter") AND url.serviceDateCreatedParameter NEQ "">
		<cfset serviceDateCreatedParameter = url.serviceDateCreatedParameter>	
	</cfif>
	
	<cfparam name="attributes.dueDate" default="">
	<cfset dueDate = attributes.dueDate>
	
	<cfif IsDefined("form.dueDate") AND form.dueDate NEQ "">
		<cfset dueDate = form.dueDate>
	<cfelseif IsDefined("url.dueDate") AND url.dueDate NEQ "">
		<cfset dueDate = url.dueDate>	
	</cfif>
	
	<cfparam name="attributes.dueDateBetween" default="">
	<cfset dueDateBetween = attributes.dueDateBetween>
	
	<cfif IsDefined("form.dueDateBetween") AND form.dueDateBetween NEQ "">
		<cfset dueDateBetween = form.dueDateBetween>
	<cfelseif IsDefined("url.dueDateBetween") AND url.dueDateBetween NEQ "">
		<cfset dueDateBetween = url.dueDateBetween>	
	</cfif>
	
	<cfparam name="attributes.dueDateParameter" default="">
	<cfset dueDateParameter = attributes.dueDateParameter>
	
	<cfif IsDefined("form.dueDateParameter") AND form.dueDateParameter NEQ "">
		<cfset dueDateParameter = form.dueDateParameter>
	<cfelseif IsDefined("url.dueDateParameter") AND url.dueDateParameter NEQ "">
		<cfset dueDateParameter = url.dueDateParameter>	
	</cfif>
	
	<cfparam name="attributes.ProcedureCode" default="">
	<cfset ProcedureCode = attributes.ProcedureCode>
	
	<cfif IsDefined("form.ProcedureCode") AND form.ProcedureCode NEQ "">
		<cfset ProcedureCode = form.ProcedureCode>
	<cfelseif IsDefined("url.ProcedureCode") AND url.ProcedureCode NEQ "">
		<cfset ProcedureCode = url.ProcedureCode>	
	</cfif>
	
	<cfparam name="attributes.ProcedureCodeList" default="">
	<cfset ProcedureCodeList = attributes.ProcedureCodeList>
	
	<cfparam name="attributes.PatientID" default="">
	<cfset PatientID = attributes.PatientID>
	
	<cfif IsDefined("form.PatientID") AND form.PatientID NEQ "">
		<cfset PatientID = form.PatientID>
	<cfelseif IsDefined("url.PatientID") AND url.PatientID NEQ "">
		<cfset PatientID = url.PatientID>	
	</cfif>
	
	<cfparam name="attributes.statusIDNotIn" default="">
	<cfset statusIDNotIn = attributes.statusIDNotIn>
	
	<cfif IsDefined("form.statusIDNotIn") AND form.statusIDNotIn NEQ "">
		<cfset statusIDNotIn = form.statusIDNotIn>
	<cfelseif IsDefined("url.statusIDNotIn") AND url.statusIDNotIn NEQ "">
		<cfset statusIDNotIn = url.statusIDNotIn>	
	</cfif>
		
	<cfparam name="attributes.statusIDIn" default="">
	<cfset statusIDIn = attributes.statusIDIn>
	
	<cfif IsDefined("form.statusIDIn") AND form.statusIDIn NEQ "">
		<cfset statusIDIn = form.statusIDIn>
	<cfelseif IsDefined("url.statusIDIn") AND url.statusIDIn NEQ "">
		<cfset statusIDIn = url.statusIDIn>	
	</cfif>
	
	<cfparam name="attributes.showQuery_statusIDIn" default="">
	<cfset showQuery_statusIDIn = attributes.showQuery_statusIDIn>
	
	<cfparam name="attributes.showQuery_statusIDNotIn" default="">
	<cfset showQuery_statusIDNotIn = attributes.showQuery_statusIDNotIn>

	<cfparam name="attributes.clear" default="0">
	<cfset clear = attributes.clear>
	
	<cfif IsDefined("form.clear") AND form.clear NEQ "">
		<cfset clear = form.clear>
	<cfelseif IsDefined("url.clear") AND url.clear NEQ "">
		<cfset clear = url.clear>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the list to show Status                                                 --->
<!-------------------------------------------------------------------------------------->				
	<cfif IsDefined("form.isCreated") AND IsNumeric(isCreated)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isCreated))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Created")>
	</cfif>
	<cfif IsDefined("form.isNotCreated") AND IsNumeric(isNotCreated)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotCreated))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Created")>
	</cfif>
	<cfif IsDefined("form.isAssigned") AND IsNumeric(isAssigned)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isAssigned))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Assigned")>
	</cfif>
	<cfif IsDefined("form.isNotAssigned") AND IsNumeric(isNotAssigned)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotAssigned))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Assigned")>
	</cfif>
	<cfif IsDefined("form.isReAssigned") AND IsNumeric(isReAssigned)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isReAssigned))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Re-Assigned")>
	</cfif>
	<cfif IsDefined("form.isNotReAssigned") AND IsNumeric(isNotReAssigned)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotReAssigned))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Re-Assigned")>
	</cfif>
	<cfif IsDefined("form.isOpened") AND IsNumeric(isOpened)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isOpened))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Opened")>
	</cfif>
	<cfif IsDefined("form.isNotOpened") AND IsNumeric(isNotOpened)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotOpened))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Opened")>
	</cfif>
	<cfif IsDefined("form.isReOpened") AND IsNumeric(isReOpened)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isReOpened))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Re-Opened")>
	</cfif>
	<cfif IsDefined("form.isNotReOpened") AND IsNumeric(isNotReOpened)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotReOpened))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Re-Opened")>
	</cfif>
	<cfif IsDefined("form.isWorking") AND IsNumeric(isWorking)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isWorking))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Working")>
	</cfif>
	<cfif IsDefined("form.isNotWorking") AND IsNumeric(isNotWorking)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotWorking))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Working")>
	</cfif>
	<cfif IsDefined("form.isCompleted") AND IsNumeric(isCompleted)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isCompleted))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Completed")>
	</cfif>
	<cfif IsDefined("form.isNotCompleted") AND IsNumeric(isNotCompleted)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotCompleted))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Completed")>
	</cfif>
	<cfif IsDefined("form.isEscalated") AND IsNumeric(isEscalated)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isEscalated))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Escalated")>
	</cfif>
	<cfif IsDefined("form.isNotEscalated") AND IsNumeric(isNotEscalated)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotEscalated))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Escalated")>
	</cfif>
	<cfif IsDefined("form.isClosed") AND IsNumeric(isClosed)>
		<cfset statusIDIn = ListAppend(statusIDIn, trim(form.isClosed))>
		<cfset showQuery_statusIDIn = ListAppend(showQuery_statusIDIn, "Closed")>
	</cfif>
	<cfif IsDefined("form.isNotClosed") AND IsNumeric(isNotClosed)>
		<cfset statusIDNotIn = ListAppend(statusIDNotIn, trim(form.isNotClosed))>
		<cfset showQuery_statusIDNotIn = ListAppend(showQuery_statusIDNotIn, "Closed")>
	</cfif>
	

		
<!-------------------------------------------------------------------------------------->
<!--- The following parameters need to stay this way due to the way that cfparam     --->
<!--- handles the setting of these even when session is defined for them.            --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.OrderBy") AND form.OrderBy NEQ "">
		<cfset session.OrderBy = form.OrderBy>		
	<cfelseif IsDefined("url.OrderBy") AND url.OrderBy NEQ "">
		<cfset session.OrderBy = url.OrderBy>		
	<cfelseif IsDefined("session.OrderBy") AND session.OrderBy NEQ "">
		<cfset session.OrderBy = session.OrderBy>		
	<cfelse>
		<cfset session.OrderBy = "DueDate">		
	</cfif>
		
	<cfif IsDefined("form.Order") AND form.Order NEQ "">
		<cfset session.Order = form.Order>
	<cfelseif IsDefined("url.Order") AND url.Order NEQ "">
		<cfset session.Order = url.Order>	
	<cfelseif IsDefined("session.Order") AND session.Order NEQ "">
		<cfset session.Order = session.Order>	
	<cfelse>
		<cfset session.Order = "ASC">		
	</cfif>
		
		
				
<!-------------------------------------------------------------------------------------->
<!--- Any scripts that would cause this page to fail                                 --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDate(dateCreated) AND IsDate(dateCreatedBetween) AND dateCreated GT dateCreatedBetween>
		<cf_gcGeneralErrorTemplate				
			message="There is an issue with the Created Date values please check then and resubmit your search.">
	<cfelseif IsDate(dueDate) AND IsDate(dueDateBetween) AND dueDate GT dueDateBetween>
		<cf_gcGeneralErrorTemplate				
			message="There is an issue with the Due Date values please check then and resubmit your search.">	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the available EOB patients this client has.                            --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.EntityID") AND form.EntityID NEQ "">
		<cfquery name="getClientEntities" datasource="#trim(request.datasource)#">
			SELECT EntityID, CONCAT(FName, ' ', LName) AS eobFullname
			FROM entity
			WHERE ClientID = #trim(session.ClientID)# AND ObjectTypeID = 3
			AND EntityID IN(#trim(form.EntityID)#)
		</cfquery>	
		<cfset patientNames = valuelist(getClientEntities.eobFullname, ", ")>		
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the available client users this client has.                            --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.AssignedToUserID") AND form.AssignedToUserID NEQ "">
		<cfquery name="getClientEntities" datasource="#trim(request.datasource)#">
			SELECT e.EntityID, CONCAT(e.FName, ' ', e.LName) AS eobFullname 
			FROM entity e LEFT JOIN pa_master.users u ON e.EntityID = u.EntityID
			WHERE e.ClientID = #trim(session.ClientID)# AND e.ObjectTypeID = 2
			AND u.usersID IN(#trim(form.AssignedToUserID)#)			
		</cfquery>	
		<cfset assignedNames = valuelist(getClientEntities.eobFullname, ", ")>		
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascript neede for this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			
			function submitReprocess(field, order){
				document.SearchReProcessASCDESC.orderby.value = field; 
				document.SearchReProcessASCDESC.order.value = order; 
				SearchReProcessASCDESC.submit();
			};
			
			function assignClaim(claimid,reassign){
				assign=window.open('appClaimAssign.cfm?claimid='+claimid+'&reassign='+reassign,'assign','top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=340,height=295'); assign.focus(0);
			};
			
			function editClaim(claimid){
				editClaim=window.open('appClaimEdit.cfm?claimid='+claimid,'editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=700,height=550'); editClaim.focus(0);
			};
			
		</script>
		
	</cfoutput>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Form needed for ordering.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form name="SearchReProcessASCDESC" method="post">
			<input type="Hidden" name="orderby" value="">
			<input type="Hidden" name="order" value="">
			<cf_gcEmbedFields except="orderby,order">
		</form>
	</cfoutput>	 	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Build the query based on the parameters sent in.                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>
			
			<cfif clear OR (IsDefined("form.clear_session.User.ClaimSearchQuery") AND form.clear_session.User.ClaimSearchQuery EQ 1) OR NOT IsDefined("session.User.ClaimSearchQuery") OR session.User.ClaimSearchQuery EQ "">
				
				<cfsavecontent variable="sqlStatement">			
					SELECT DISTINCT c.ClaimID, c.InterchangeClaimID, c.claimType, c.EntityID, c.InterchangeID, c.assignedToUserID, c.Active, c.InactiveCode, c.DateCreated, c.DueDate, u.usersID, e.FName As userFName, e.LName AS userLName, TIMESTAMPDIFF(day, c.DateCreated, now()) AS days
					, patientEntity.FName AS patientFName, patientEntity.LName AS patientLName
					FROM claim c 
					LEFT JOIN pa_master.users u ON c.AssignedToUserID = u.UsersID 
					LEFT JOIN entity e ON u.EntityID = e.EntityID
					LEFT JOIN [procedure] cp ON c.ClaimID = cp.ClaimID
					LEFT JOIN entity patientEntity ON c.entityID = patientEntity.EntityID				
					LEFT JOIN patient p ON c.entityID = p.EntityID			
					
					WHERE c.ClientID = #trim(session.clientID)#
					
					<!---<!---Active parameter--->		
					<cfif Active GTE 0>
						AND c.Active = #trim(active)#
					</cfif>--->
					
					<!---Claim Type--->
					<cfif claimtype NEQ "">
						AND c.claimType IN(#trim(claimType)#)
					</cfif>
					
					<!---Title parameter LATER: Add the full text search http://www.databasejournal.com/features/mssql/article.php/3441981 Full Text Search on SQL 2000 Part 1 By Don Schlichting --->		
					<cfif lastNameContains NEQ "">
						AND patientEntity.LName LIKE '%#trim(lastNameContains)#%'
					</cfif> 
					
					<cfif icn NEQ "">
						AND c.InterchangeClaimID = '#trim(icn)#'
					</cfif>
					
					<!---Assigned to UserID--->
					<cfif assignedToUserID NEQ "">
						AND c.AssignedToUserID IN(#trim(assignedToUserID)#)
					</cfif>
					
					<!---Unassigned Claims--->			
					<cfif unassigned_Hidden NEQ "">
						AND c.AssignedToUserID IS NULL
					</cfif>
					
					<!---ServiceDateCreated--->				
					<cfif IsDate(ServiceDateCreated) AND ServiceDateCreatedBetween EQ "" AND ServiceDateCreatedParameter NEQ "">
						AND  cp.ServiceDateFrom <cfif ServiceDateCreatedParameter EQ "GT"> > <cfelseif ServiceDateCreatedParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateCreated)# 				
					<cfelseif IsDate(ServiceDateCreated) AND ServiceDateCreatedParameter EQ "between" AND IsDate(ServiceDateCreatedBetween)>
						AND  cp.ServiceDateFrom > #CreateODBCDate(ServiceDateCreated)#
						AND  cp.ServiceDateTo < #CreateODBCDate(ServiceDateCreatedBetween)# 						
					</cfif>
					
					<!---DateCreated--->				
					<cfif IsDate(DateCreated) AND DateCreatedBetween EQ "" AND dateCreatedParameter NEQ "">
						AND  c.DateCreated <cfif dateCreatedParameter EQ "GT"> > <cfelseif dateCreatedParameter EQ "LT"> < </cfif> #CreateODBCDate(dateCreated)# 				
					<cfelseif IsDate(DateCreated) AND dateCreatedParameter EQ "between" AND IsDate(DateCreatedBetween)>
						AND  c.DateCreated > #CreateODBCDate(dateCreated)#
						AND  c.DateCreated < #CreateODBCDate(dateCreatedBetween)# 						
					</cfif>
					
					<!---DueDate--->				
					<cfif IsDate(DueDate) AND DueDateBetween EQ "" AND (DueDateParameter EQ "GT" OR DueDateParameter EQ "LT")>
						AND  c.DueDate <cfif DueDateParameter EQ "GT"> > <cfelseif DueDateParameter EQ "LT"> < </cfif> #CreateODBCDate(DueDate)# 				
					<cfelseif IsDate(DueDate) AND DueDateParameter EQ "between" AND IsDate(DueDateBetween)>
						AND  c.DueDate > #CreateODBCDate(DueDate)#
						AND  c.DueDate < #CreateODBCDate(DueDateBetween)# 
					<cfelseif DueDateParameter NEQ "" AND NOT ListFindNoCase("GT,LT,between,NULL", DueDateParameter)>
						<cfif DueDateParameter EQ "1weeks">
							<cfset DueDateCalculated = DateAdd("d", 7, NOW())>
						<cfelseif DueDateParameter EQ "2weeks">
							<cfset DueDateCalculated = DateAdd("d", 14, NOW())>	
						<cfelseif DueDateParameter EQ "3weeks">
							<cfset DueDateCalculated = DateAdd("d", 21, NOW())>	
						<cfelseif DueDateParameter EQ "1months">
							<cfset DueDateCalculated = DateAdd("m", 1, NOW())>
						<cfelseif DueDateParameter EQ "2months">
							<cfset DueDateCalculated = DateAdd("m", 2, NOW())>
						<cfelseif DueDateParameter EQ "3months">
							<cfset DueDateCalculated = DateAdd("m", 3, NOW())>			
						</cfif>
						AND  c.DueDate > #CreateODBCDate(NOW())#
						AND  c.DueDate < #CreateODBCDate(DueDateCalculated)#
					<cfelseif DueDateParameter EQ "NULL">	 							
						AND DueDate IS NULL
					</cfif>
					
					<!---Procedure Code--->
					<cfif ProcedureCode NEQ "">					
						
						<!---Taken out because changed the table Procedure to be an int column (ProcedureCode).--->
						<cfset Count = 1>
						
						<cfloop list="#trim(ProcedureCode)#" index="i">						
							<cfset ProcedureCodeList = ProcedureCodeList & "'" & i & "'">						
							<cfif Count NEQ ListLen(ProcedureCode)>						
								<cfset ProcedureCodeList = ProcedureCodeList & ", ">
							</cfif>						
							<cfset Count = Count  + 1>						
						</cfloop>
						
						<cfset procIn = "AND cp.ProcedureCode IN(SELECT RecordID FROM pa_master.eob_medicare_procedurecode WHERE HCPC IN(" & ProcedureCodeList & "))">
										
						<cfif ProcedureCodeList NEQ "">
							<cfoutput>#trim(procIn)#</cfoutput>
						</cfif>							
						
					</cfif>
													
					<!---Patient ID--->
					<cfif patientID NEQ "">
						AND c.EntityID IN(#trim(patientID)#)
					</cfif>
					
					<!---This cancels out the nagatives it is ClaimStausCode 22 which is a reversal but the agents should not see it.--->
					AND c.ClaimStatusCode NOT IN(189)
									
					<cfif statusIDIn NEQ "">
						AND c.StatusID IN(#trim(statusIDIn)#)
					</cfif>
									
					<cfif statusIDNotIn NEQ "">
						AND c.StatusID NOT IN(#trim(statusIDNotIn)#)
					</cfif>
					
					<!---Order by--->				
					<cfif session.OrderBY NEQ "">			
						ORDER BY 
							<cfif trim(session.OrderBy) EQ "claimID">
								c.claimID
							<cfelse>
								#trim(session.OrderBy)#
							</cfif>	
					</cfif>
					<cfif session.Order NEQ "">			
						#trim(session.Order)#
					</cfif>
					
				</cfsavecontent>	
			
				<cfset session.User.ClaimSearchQuery = sqlStatement>
			
			<cfelse>
			
				<cfset sqlStatement = session.User.ClaimSearchQuery>
			
			</cfif>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Run the query that was just built.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getClaims" datasource="#trim(request.datasource)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>
				


			<!-------------------------------------------------------------------------------------->
			<!--- Code Needed to run the Next N records view of claims query.                    --->
			<!-------------------------------------------------------------------------------------->
			<cfparam name="startRow_Claim" default="1" type="numeric">	
			<cfif IsDefined("form.startRow_Claim") AND form.startRow_Claim NEQ "">
				<cfset startRow_Claim = form.startRow_Claim>
			<cfelseif IsDefined("url.startRow_Claim") AND url.startRow_Claim NEQ "">
				<cfset startRow_Claim = url.startRow_Claim>	
			</cfif>
			
			<cfparam name="showAll" type="boolean" default="No">
			<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
				<cfset showAll = form.showAll>
			<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
				<cfset showAll = url.showAll>	
			</cfif>		
			
			<cfif clear>
				<cfset session.rowsPerPage_Claim = "">
				<!---<cfset startRow_Claim = 1>	--->
			</cfif>	
			
			<cfif IsDefined("form.rowsPerPage_Claim") AND form.rowsPerPage_Claim NEQ "">
				<cfset session.rowsPerPage_Claim = form.rowsPerPage_Claim>
			<cfelseif IsDefined("url.rowsPerPage_Claim") AND url.rowsPerPage_Claim NEQ "">
				<cfset session.rowsPerPage_Claim = url.rowsPerPage_Claim>	
			<cfelseif IsDefined("session.rowsPerPage_Claim") AND IsNumeric(session.rowsPerPage_Claim)>
				<cfset session.rowsPerPage_Claim = session.rowsPerPage_Claim>	
			<cfelse>
				<cfset session.rowsPerPage_Claim = session.Client.getRecordsPerPage()>
			</cfif>
						
			<cfset totalRows = getClaims.recordCount>
			<cfif showAll>
				<cfset rowsPerPage = totalRows>
			</cfif>
			<cfset endRow_Claim = min(startRow_Claim + session.rowsPerPage_Claim - 1, totalRows)>
			<cfset startRowNext = endRow_Claim + 1>
			<cfset startRowBack = startRow_Claim - session.rowsPerPage_Claim>
				
			
									
			<!-------------------------------------------------------------------------------------->
			<!--- Start the display of this page.                                                --->
			<!-------------------------------------------------------------------------------------->				
					<br>
					<cfif msg NEQ "">
						<cfoutput>
							<p><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font></p>			
						</cfoutput>
					</cfif>
					
					
					
					<cfif getClaims.RecordCount GTE 2>
						<cfset title = getClaims.recordcount & " Claims Found">
					<cfelse>
						<cfset title = getClaims.recordcount & " Claim Found">
					</cfif> 
					
					<cfoutput>
						<script language="JavaScript">
							function closeOpenCriteria(){
								if(criteriaTable.style.display == 'none'){criteriaTable.style.display='inline'} else{criteriaTable.style.display='none'}
							}	
						
							function winChange(){
								window.location.href = 'appClaimSearch.cfm';
							};					
					</script>
						
					</cfoutput>
					
					<cf_gcBorderedTable	title="#title#" tablewidth="50%" tablealign="center" titleright="<span class=SiteLabel style=cursor:hand onclick=winChange();><u>Search&nbsp;Claims</u></span>&nbsp;&nbsp;&nbsp;<span class=SiteLabel style=cursor:hand onclick=closeOpenCriteria();><u>Search&nbsp;Criteria&nbsp;Used</u></span>">	
					
						<cf_gcNextNRecords type="Claim">					
														
							<table id="criteriaTable" align="center" border="0" cellpadding="0" cellspacing="3" style="display: 'none';">					
								
								<!---Status In--->
								<cfif showQuery_statusIDIn NEQ "">
									<tr>			
										<td class="SiteLabel" nowrap align="right">
											<strong>Status&nbsp;Is:</strong> 
										</td>	
										<td class="SiteLabel" nowrap>
											#trim(showQuery_statusIDIn)#
										</td>			
									</tr>	
								</cfif>		
								
								<!---Status Not In--->
								<cfif showQuery_statusIDNotIn NEQ "">
									<tr>			
										<td class="SiteLabel" nowrap align="right">
											<strong>Status&nbsp;Is&nbsp;Not:</strong> 
										</td>	
										<td class="SiteLabel" nowrap>
											#trim(showQuery_statusIDNotIn)#
										</td>			
									</tr>	
								</cfif>			
								
								<!---<!---Active--->
								<cfif IsDefined("form.showQuery_Active") AND form.showQuery_Active NEQ "">
									<tr>			
										<td class="SiteLabel" nowrap align="right">
											<strong>Active:</strong> 
										</td>	
										<td class="SiteLabel" nowrap>
											#trim(form.showQuery_Active)#
										</td>			
									</tr>	
								</cfif>			--->				
								
								<!---Type--->
								<cfif IsDefined("form.showQuery_claimType") AND form.showQuery_claimType NEQ "">
								<tr>			
									<td class="SiteLabel" nowrap align="right">
										<strong>Claim&nbsp;Type:</strong> 
									</td>	
									<td class="SiteLabel" nowrap>
										#form.showQuery_claimType#
									</td>			
								</tr>	
								</cfif>					
								
								<!---LastNameContains--->
								<cfif IsDefined("form.lastNameContains") AND form.lastNameContains NEQ "">
									<tr>			
										<td class="SiteLabel" nowrap align="right">
											<strong>Last&nbsp;Name&nbsp;Contains:</strong> 
										</td>	
										<td class="SiteLabel" nowrap>#trim(form.lastNameContains)#</td>			
									</tr>						
								</cfif>
																		
								<!---Patient ID--->
								<cfif IsDefined("patientNames")>
									<tr id="patientID_TR" style="display: 'inline';">			
										<td class="SiteLabel" nowrap align="right">
											<strong>Patient&nbsp;Names:</strong>
										</td>	
										<td class="SiteLabel" nowrap>						
											#trim(patientNames)#							
										</td>			
									</tr>			
								</cfif>
								
								<!---Assigned To--->
								<cfif IsDefined("assignedNames")>
									<tr id="assigned_TR" style="display: 'inline';">			
										<td class="SiteLabel" nowrap align="right">
											<strong>Assigned to:</strong>
										</td>	
										<td class="SiteLabel" nowrap>						
											#trim(assignedNames)#
										</td>			
									</tr>					
								</cfif>
								
								<!---Service Dates--->
								<cfif IsDefined("form.serviceDateCreatedParameter") AND form.serviceDateCreatedParameter NEQ "">
									<tr>							
										<td class="SiteLabel" nowrap align="right">
											<strong>Service Dates:</strong> 
										</td>	
										<td class="SiteLabel" nowrap>						
											<cfif trim(form.serviceDateCreatedParameter) EQ "LT">
												BEFORE
											<cfelseif trim(form.serviceDateCreatedParameter) EQ "GT">
												AFTER
											<cfelseif trim(form.serviceDateCreatedParameter) EQ "between">
												BETWEEN
											</cfif>											
											#trim(form.serviceDateCreated)#
											<cfif IsDefined("form.serviceDateCreatedBetween") AND IsDate(form.serviceDateCreatedBetween)>
												AND #trim(form.serviceDateCreatedBetween)#
											</cfif>	
										</td>			
									</tr>														
								</cfif>
								
								<!---Date Created--->
								<cfif IsDefined("form.dateCreatedParameter") AND form.dateCreatedParameter NEQ "">
									<tr>							
										<td class="SiteLabel" nowrap align="right">
											<strong>Date Created:</strong> 
										</td>
										<td class="SiteLabel" nowrap>						
											<cfif trim(form.dateCreatedParameter) EQ "LT">
												BEFORE
											<cfelseif trim(form.dateCreatedParameter) EQ "GT">
												AFTER
											<cfelseif trim(form.dateCreatedParameter) EQ "between">
												BETWEEN
											</cfif>											
											#trim(form.dateCreated)#
											<cfif IsDefined("form.dateCreatedBetween") AND IsDate(form.dueDateBetween)>
												AND #trim(form.dateCreatedBetween)#
											</cfif>	
										</td>													
									</tr>						
								</cfif>
								
								<!---Due Date--->
								<cfif IsDefined("form.dueDateParameter") AND form.dueDateParameter NEQ "">
									<tr>							
										<td class="SiteLabel" nowrap align="right">
											<strong>Out of Time Filling Date:</strong> 
										</td>
										<td class="SiteLabel" nowrap>						
											<cfif trim(form.dueDateParameter) EQ "LT">
												BEFORE
											<cfelseif trim(form.dueDateParameter) EQ "GT">
												AFTER
											<cfelseif trim(form.dueDateParameter) EQ "between">
												BETWEEN
											<cfelseif trim(form.dueDateParameter) EQ "1weeks">
												One Week Out	
											<cfelseif trim(form.dueDateParameter) EQ "2weeks">
												Two Weeks Out
											<cfelseif trim(form.dueDateParameter) EQ "3weeks">
												Three Weeks Out
											<cfelseif trim(form.dueDateParameter) EQ "1months">
												One Month Out
											<cfelseif trim(form.dueDateParameter) EQ "2months">
												Two Months Out
											<cfelseif trim(form.dueDateParameter) EQ "3months">
												Three Months Out					
											</cfif>											
											#trim(form.dueDate)#
											<cfif IsDefined("form.dueDateBetween") AND IsDate(form.dueDateBetween)>
												AND #trim(form.dueDateBetween)#
											</cfif>	
										</td>												
									</tr>
								</cfif>
																						
								<!---Procedure Codes--->
								<cfif IsDefined("form.ProcedureCode") AND form.ProcedureCode NEQ "">
									<tr id="assigned_TR" style="display: 'inline';">			
										<td class="SiteLabel" nowrap align="right">
											<strong>Procedure&nbsp;Code:</strong>
										</td>	
										<td class="SiteLabel">						
											#form.ProcedureCode#
										</td>			
									</tr>
								</cfif>
								
							</table>
							
								
							<table border="0" cellpadding="4" cellspacing="0" class="Tbl">
							
								<thead>												
									<td nowrap valign="bottom">										
										<table cellspacing="0" cellpadding="0" border="0">
											<tr>
											    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Claim&nbsp;ID&nbsp;</td>
											   	<td><span style="cursor: hand;" onclick="submitReprocess('claimid', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
											</tr>
											<tr>
											    <td><span style="cursor: hand;" onclick="submitReprocess('claimid', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
											</tr>
										</table>
									</td>	
									
									<td>&nbsp;</td>
									<td nowrap valign="bottom">										
										<table cellspacing="0" cellpadding="0" border="0">
											<tr>
											    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Type&nbsp;</td>
											   	<td><span style="cursor: hand;" onclick="submitReprocess('claimtype', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
											</tr>
											<tr>
											    <td><span style="cursor: hand;" onclick="submitReprocess('claimtype', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
											</tr>
										</table>
									</td>
									
									<td>&nbsp;</td>														
									<td nowrap valign="bottom">										
										<table cellspacing="0" cellpadding="0" border="0">
											<tr>
											    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Patient&nbsp;</td>
											    <td><span style="cursor: hand;" onclick="submitReprocess('patientLName', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
											</tr>
											<tr>
											    <td><span style="cursor: hand;" onclick="submitReprocess('patientLName', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
											</tr>
										</table>
									</td>
																												
									<td>&nbsp;</td>
									<td nowrap valign="bottom">										
										<table cellspacing="0" cellpadding="0" border="0">
											<tr>
											    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Assigned&nbsp;to&nbsp;</td>
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
											    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; ">Due&nbsp;Date&nbsp;</td>
											    <td><span style="cursor: hand;" onclick="submitReprocess('duedate', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
											</tr>
											<tr>
											    <td><span style="cursor: hand;" onclick="submitReprocess('duedate', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
											</tr>
										</table>
									</td>	
										
									<td>&nbsp;</td>	
									<td nowrap valign="bottom">										
										<table cellspacing="0" cellpadding="0" border="0">
											<tr>
											    <td nowrap valign="bottom" rowspan="2" style="padding-right: 1; padding-left: 1; background-color: c0cddc; font-weight: 700; color: ffffff; font-family: sans-serif,MS Sans Serif,Verdana; font-variant: small-caps; "><span style="cursor: hand;" onmouseover="doTooltip(0, this, event, 'Number of days this claim has been in the system since being read in from the 835 file.')" onmouseout="hideTip(this);">Days</span></td>
											    <td><span style="cursor: hand;" onclick="submitReprocess('days', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
											</tr>
											<tr>
											    <td><span style="cursor: hand;" onclick="submitReprocess('days', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
											</tr>
										</table>
									</td>			
								</thead>
														
								<cfloop query="getClaims" startRow="#trim(startRow_Claim)#" endRow="#trim(endRow_Claim)#">					
									
									
									<cfset showCodes = "">
									
									<cfquery name="getProcedureCodes" datasource="#trim(request.datasource)#">
										SELECT cp.ProcedureID, cp.ProcedureCode, pc.HCPC AS Code, pc.ShortDescription AS Description, cp.ServiceDateFrom, cp.ServiceDateTo							
										FROM [Procedure] cp
										LEFT JOIN pa_master.eob_medicare_procedurecode pc ON cp.ProcedureCode = pc.RecordID
										WHERE cp.ClaimID = #trim(ClaimID)#
									</cfquery>						
									
									<cfif getProcedureCodes.RecordCount GTE 1>
										
										<cfloop query="getProcedureCodes">
										
											<cfset showCodes = showCodes & "<strong>" & getProcedureCodes.Code & "</strong>: #DateFormat(getProcedureCodes.ServiceDateFrom, 'mm/dd/yyyy')# - #DateFormat(getProcedureCodes.ServiceDateTo, 'mm/dd/yyyy')#<br>" & LEFT(getProcedureCodes.Description, 200) & "<br><br>">
																													
											<!---<!---Query for information on the EOB codes--->						
											<cfquery name="getEOBCodes" datasource="#trim(request.datasource)#">
												SELECT cp.ProcedureID, ce.EOBCode, eob.Code, eob.Description
												FROM [Procedure] cp
												LEFT JOIN ProcedureEOBCode ce ON cp.ProcedureID = ce.ProcedureID
												LEFT JOIN pa_master.eob_eobcode eob ON ce.EOBCode = eob.RecordID
												WHERE cp.ProcedureID = #trim(ProcedureID)#
											</cfquery>
											
											<!---Query for information on the EOPS codes--->						
											<cfquery name="getEOPSCodes" datasource="#trim(request.datasource)#">
												SELECT cp.ProcedureID, ce.EOPSCode, eops.Code, eops.Description
												FROM [Procedure] cp
												LEFT JOIN ProcedureEOPSCode ce ON cp.ProcedureID = ce.ProcedureID
												LEFT JOIN pa_master.eob_eopscode eops ON ce.EOPSCode = eops.RecordID
												WHERE cp.ProcedureID = #trim(ProcedureID)#
											</cfquery>
																
											<cfloop query="getEOBCodes">
												<cfif EOBCode NEQ "">
													<cfset showCodes = showCodes & "<table cellpadding=0 cellspacing=0><tr><td>&nbsp;&nbsp;&nbsp;</td><td><span class=sm><strong>EOB</strong><br>" & Code & ": " & Description & "</span></td></tr></table><br>">
												</cfif>	
											</cfloop>
											
											<cfloop query="getEOPSCodes">
												<cfif EOPSCode NEQ "">
													<cfset showCodes = showCodes & "<table cellpadding=0 cellspacing=0><tr><td>&nbsp;&nbsp;&nbsp;</td><td><span class=sm><strong>EOPS</strong><br>" & Code & ": " & Description & "</span></td></tr></table><br>">
												</cfif>	
											</cfloop>--->
										
										</cfloop>
										
									</cfif>	
									
									
									<!---Show Claim Assignments--->
									<cfquery name="getAssignments" datasource="#trim(request.datasource)#">
										SELECT ca.UserID, ca.AssignorID, ca.DateCreated AS AssignmentDateCreated, ca.Note, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname 
										FROM claimassignment ca 
										JOIN view_useraccountparameters vuap ON ca.UserID = vuap.UsersID
										WHERE ca.ClaimID = #trim(ClaimID)#
										ORDER BY ca.DateCreated DESC
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
									
									
									<cfif DateDiff("d",NOW(), DueDate) LT 8>
										<cfset rowColor = "ff6666">
									<cfelseif DateDiff("d",NOW(), DueDate) LTE 14>
										<cfset rowColor = "FFFF66">
									<cfelse>
										<cfif currentrow MOD 2 EQ 0> 
											<cfset rowColor = "f9f9f9">
										<cfelse>
											<cfset rowColor = "FFFFFF">	
										</cfif>
									</cfif>
																											
									<cfoutput>							
										<tr bgcolor=#trim(rowColor)# style="cursor:hand" onmouseover="this.style.backgroundColor='lightgrey';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';">			
											<td class="SiteLabel" nowrap>
												<cfif ClaimType EQ 109>
													<span onclick="editClaim=window.open('appClaimEdit.cfm?claimid=#trim(claimID)#','editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=850,height=480'); editClaim.focus(0);" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'Claim ID: <a href=https://secure.tmhp.com/Claim%20Status%20Inquiry/default.aspx?pn=ClaimView&src=RS&icn=#InterchangeClaimID# target=_blank>#InterchangeClaimID#</a> click on the Claim ID to go to the TMHP website.');" onmouseout="hideTip(this);"><u>#trim(InterchangeClaimID)#</u></span>
												<cfelseif ClaimType EQ 108>
													<span onclick="editClaim=window.open('appClaimEditMedicare.cfm?claimid=#trim(claimID)#','editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=950,height=480'); editClaim.focus(0);" style="cursor: hand;" onmouseover="doTooltip(1, this, event, '#showCodes#');" onmouseout="hideTip(this);"><u>#trim(InterchangeClaimID)#</u></span>
												<cfelse>
													&nbsp;
												</cfif>																		
											</td>	
											<td>&nbsp;</td>								
											
											<cfif ClaimType EQ 109>
												<td class="SiteLabel" nowrap align="left">Medicaid</td>
											<cfelseif ClaimType EQ 108>
												<td class="SiteLabel" nowrap align="left">Medicare</td>
											<cfelse>
												<td>&nbsp;</td>
											</cfif>
											
											<td>&nbsp;</td>
											<!---<td class="SiteLabel" nowrap align="left"><span onclick="editClaim=window.open('appClaimEdit.cfm?claimid=#trim(claimID)#','editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=850,height=480'); editClaim.focus(0);" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'Claim ID: <a href=https://secure.tmhp.com/Claim%20Status%20Inquiry/default.aspx?pn=ClaimView&src=RS&icn=#InterchangeClaimID# target=_blank>#InterchangeClaimID#</a> click on the Claim ID to go to the TMHP website.');" onmouseout="hideTip(this);"><u>#patientLName#, #patientFName#</u></span></td>--->
											<cfif ClaimType EQ 109>
												<td class="SiteLabel" nowrap align="left"><span onclick="editClaim=window.open('appClaimEdit.cfm?claimid=#trim(claimID)#','editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=850,height=480'); editClaim.focus(0);" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'Claim ID: <a href=https://secure.tmhp.com/Claim%20Status%20Inquiry/default.aspx?pn=ClaimView&src=RS&icn=#InterchangeClaimID# target=_blank>#InterchangeClaimID#</a> click on the Claim ID to go to the TMHP website.');" onmouseout="hideTip(this);"><u>#patientLName#, #patientFName#</u></span></td>
											<cfelseif ClaimType EQ 108>
												<td class="SiteLabel" nowrap align="left"><span onclick="editClaim=window.open('appClaimEditMedicare.cfm?claimid=#trim(claimID)#','editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=900,height=480'); editClaim.focus(0);" style="cursor: hand;"><u>#patientLName#, #patientFName#</u></span></td>
											<cfelse>
												<td>&nbsp;</td>
											</cfif>
											
											<td>&nbsp;</td>	
											<cfset showAssignments = Replace(showAssignments, "'", "\'", "ALL")>
											<td class="SiteLabel" nowrap align="left"><cfif trim(AssignedToUserID) EQ ""><font color="990000"><span style="cursor: hand;" onclick="assignClaim(#ClaimID#,0);"><u>Unassigned</u></span></font><cfelse><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, ' <span style=cursor:hand onclick=assignClaim(#ClaimID#,1);><u><strong>Re-Assign Claim</strong></u></span><p>#showAssignments#');" onmouseout="hideTip(this);">#LEFT(trim(userFName), 1)#<cfif userLName NEQ "">.</cfif> #trim(userLName)#</span></cfif></td>
											<td>&nbsp;</td>
											
											<!--- Today is not counted as overdue as the day is not over only 24 hour periods are considred overdue. ---> 
											<cfif DateDiff("d",NOW(), DueDate) LT 0> 
												<cfset numDays = NumberFormat(DateDiff("d", DueDate, NOW()))>
												<cfif numDays EQ 1>
													<cfset daysWord = "day">
												<cfelse>
													<cfset daysWord = "days">	
												</cfif>
												<cfset thisTitle = "title="" " & trim(numDays) & " " & daysWord & " overdue""">
											<cfelse>	
												<cfset thisTitle = "">
											</cfif>
											
											<td class="SiteLabel" nowrap align="left" #trim(thisTitle)#>#DateFormat(trim(DueDate), "MMM d, yyyy")#</td>
											<td>&nbsp;</td>	
											<td class="SiteLabel" nowrap title="Date imported into Collect Med: #DateFormat(trim(DateCreated), 'MMM d, yyyy')#">#trim(days)#</td>									
										</tr>
									</cfoutput>
									
								</cfloop>
									
							</table>
								
						</cf_gcNextNrecords>			
						
						<br>
					
					</cf_gcBorderedTable>			
						
					
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

	
	
	
	
	
	
	
	
	
	
<!---
<!---DEBUG--->
<cfdump var="#getClaims#" expand="no">	
<cfoutput><br><br></cfoutput>
<!---<cfdump var="#variables#" expand="no">--->
<cfdump var="#form#" expand="no">		
--->	



