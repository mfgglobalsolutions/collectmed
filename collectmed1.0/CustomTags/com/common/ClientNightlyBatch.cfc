


<cfcomponent displayname="ClientNightlyBatch">


	<!-------------------------------------------------------------------------------------->
	<!--- Call the stored procedure that will create user messages concerning the        --->
	<!--- number of intakes that have no action taken against them for longer            --->
	<!--- than 72 hours. Gather the list of users from this client that have the role    --->
	<!--- EOB Intake Administrator and send the message to each of them daily they can   --->
	<!--- decide what to do with those intakes.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="checkIntakesTimeSpan" returntype="string" hint="Call the stored procedure that will create user messages concerning the number of intakes that have no action taken against them for longer than 72 hours.">
		
		<cfargument name="clientID" required="yes" type="numeric">
		
		<cfset request.role = CreateObject("component", "com.common.role")>
		<cfset usersID = request.role.getUsersWithSpecificRole(clientID, 5)>
		
		
		
		<!--------------------------------------------------------------------------------------->
		<!--- TO DO  BAD CODE!!!!!!!!!!!!!!!!!                                                --->
		<!--- This was added because Reyna was moved from the administrators group and put    --->
		<!--- into the managers group. When we finally create the Roles and actions module    --->
		<!--- this will have to be taken out.                                                 --->
		<!---                                                                                 --->
		<!--- EMAIL fromPhillip 10/04/2007                                                    --->
		<!--- On another issue I have discovered that Reyna is not getting the system         --->
		<!--- messages on her desktop stating that "The following Intakes have had no action  --->
		<!--- performed" so she has been going through every intake to check on the work the  --->
		<!--- CSR's have been doing the job. Perhaps we can send this to the Intake Managers  --->
		<!--- as well as the Administrators.                                                  --->
		<!--------------------------------------------------------------------------------------->		
		<cfif clientID EQ 1084>
			<cfset usersID = ListAppend(usersID, 100156)><!---Megan Wise--->
		</cfif>
		
		
		
		
		<cfif ListLen(usersID) GTE 1 AND usersID NEQ 0>
			
			<cfset intakeIDList = "">	
			<cfset note =  "<p><strong>The following Intakes have had no action performed on them for 72 hours.</strong></p><script language=JavaScript>function editIntake(intakeid){window.opener.location='appPatientIntakeEdit.cfm?IntakeID='+intakeid};</script>">	
									
			<cfquery name="getIntakesTimeSpan" datasource="PAClient_#trim(ClientID)#">
				SELECT i.IntakeID AS intakeID, e.FName AS patientFNameTBox, e.LName AS PatientLNameTBox, i.assignedToUserID, i.DateModified, TIMESTAMPDIFF(Hour, i.DateModified, now()) AS numofHours, CONCAT(vw.FName, ' ', vw.LName) AS AssignedToName 
				FROM intake i
				LEFT JOIN Patient p ON i.PatientID = p.PatientID
				LEFT JOIN Entity e ON e.EntityID = p.EntityID
				JOIN view_UserAccountParameters vw ON i.assignedToUserID = vw.UsersID
				WHERE i.Active = 1 AND i.DateModified IS NOT NULL AND TIMESTAMPDIFF(Hour, i.DateModified, now()) > 72
				AND i.ClosingInvoiceNumber IS NULL
				UNION
				SELECT i.IntakeID AS intakeID, e.FName AS patientFNameTBox, e.LName AS PatientLNameTBox, i.assignedToUserID, i.DateCreated, TIMESTAMPDIFF(Hour, i.DateCreated, now()) AS numofHours, CONCAT(vw.FName, ' ', vw.LName) AS AssignedToName 
				FROM intake i
				LEFT JOIN Patient p ON i.PatientID = p.PatientID
				LEFT JOIN Entity e ON e.EntityID = p.EntityID
				JOIN view_UserAccountParameters vw ON i.assignedToUserID = vw.UsersID
				WHERE i.Active = 1 AND i.DateModified IS NULL AND TIMESTAMPDIFF(Hour, i.DateCreated, now()) > 72
				AND i.ClosingInvoiceNumber IS NULL
			</cfquery>		
			
			<cfloop query="getIntakesTimeSpan">
				<cfset intakeIDList = ListAppend(intakeIDList, intakeID)>
			</cfloop>
			
			<cfif listLen(intakeIDList) GTE 1>
				<cfset note = note & "<script language=JavaScript>function viewIntakesPage(intakes){window.opener.location='appPatientIntakeSearch.cfm?intakeIDs='+intakes;};</script><p><a href=## onclick=viewIntakesPage('" & intakeIDList & "');>View&nbsp;All&nbsp;These&nbsp;Intakes</a></p>">
			</cfif>
						
			<cfloop query="getIntakesTimeSpan">
				<cfset note = note & "<strong>Intake ID:</strong> <a href=## onclick=editIntake(#trim(IntakeID)#);>#trim(IntakeID)#</a> <strong>Patient:</strong> #patientFNameTBox# #patientLNameTBox# <br><strong>Assigned:</strong> #trim(AssignedToName)# <strong>Modified:</strong> #DateFormat(DateModified, 'mm/dd/yy')# #TimeFormat(DateModified, 'h:mm:ss tt')#<br>">
			</cfloop>
			
			<cfloop list="#trim(usersID)#" index="i">
				<cfquery name="insertSystemUserMessage" datasource="PAClient_#trim(ClientID)#">
					INSERT INTO SystemUserMessage(UsersID,Note)
					VALUES(#trim(i)#, '#trim(note)#')
				</cfquery>
			</cfloop>
			
			<cfreturn "checkIntakesTimeSpan has been processed. CID: #trim(ClientID)#">
		
		<cfelse>
			
			<cfreturn "No users with specific intake role. #clientID# role:5">	
		
		</cfif>
		
		
	</cffunction>
      
	  
	 
	<!-------------------------------------------------------------------------------------->
	<!--- Call the stored procedure that will create user messages concerning the        --->
	<!--- # of intakes that have no action taken against them for longer than 48 hours.  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="checkUserIntakesTimeSpan" returntype="string" hint="Call the stored procedure that will create user messages concerning the number of intakes that have no action taken against them for longer than 48 hours.">
		
		<cfargument name="clientID" required="yes" type="numeric">
		
		<cfquery name="getIntakesTimeSpan" datasource="PAClient_#trim(ClientID)#">
			SELECT i.IntakeID AS intakeID, e.FName AS patientFNameTBox, e.LName AS PatientLNameTBox, i.assignedToUserID, i.DateModified, TIMESTAMPDIFF(Hour, i.DateModified, now()) AS numofHours, CONCAT(vw.FName, ' ', vw.LName) AS AssignedToName 
			FROM intake i
			LEFT JOIN Patient p ON i.PatientID = p.PatientID
			LEFT JOIN Entity e ON e.EntityID = p.EntityID
			JOIN view_UserAccountParameters vw ON i.assignedToUserID = vw.UsersID
			WHERE i.Active = 1 AND i.DateModified IS NOT NULL AND TIMESTAMPDIFF(Hour, i.DateModified, now()) > 48
			AND i.ClosingInvoiceNumber IS NULL
			UNION
			SELECT i.IntakeID AS intakeID, e.FName AS patientFNameTBox, e.LName AS PatientLNameTBox, i.assignedToUserID, i.DateCreated, TIMESTAMPDIFF(Hour, i.DateCreated, now()) AS numofHours, CONCAT(vw.FName, ' ', vw.LName) AS AssignedToName 
			FROM intake i
			LEFT JOIN Patient p ON i.PatientID = p.PatientID
			LEFT JOIN Entity e ON e.EntityID = p.EntityID
			JOIN view_UserAccountParameters vw ON i.assignedToUserID = vw.UsersID
			WHERE i.Active = 1 AND i.DateModified IS NULL AND TIMESTAMPDIFF(Hour, i.DateModified, now()) > 48
			AND i.ClosingInvoiceNumber IS NULL
		</cfquery>		
		
		<cfif getIntakesTimeSpan.recordCount GTE 1>
			
			<cfset assignedUsersIDs = valueList(getIntakesTimeSpan.assignedToUserID)>
			<cf_gcListRemoveDuplicates list="#trim(assignedUsersIDs)#" name="assignedUsersIDs">
						
			<cfloop list="#trim(assignedUsersIDs)#" index="i">
			
				<cfset note =  "<p><strong>The following Intakes currently assigned to you have had no action performed on them for 48 hours.</strong></p><script language=JavaScript>function editIntake(intakeid){window.opener.location='appPatientIntakeEdit.cfm?IntakeID='+intakeid};</script>">	
				
				<cfloop query="getIntakesTimeSpan">
					<cfif assignedToUserID EQ i>
						<cfset note = note & "<strong>Intake ID:</strong> <a href=## onclick=editIntake(#trim(IntakeID)#);>#trim(IntakeID)#</a> <strong>Patient:</strong> #patientFNameTBox# #patientLNameTBox# <br><strong>Last Modified:</strong> #DateFormat(DateModified, 'mm/dd/yy')# #TimeFormat(DateModified, 'h:mm:ss tt')#<br>">			
					</cfif>	
				</cfloop>
				
				<cfquery name="insertSystemUserMessage" datasource="PAClient_#trim(ClientID)#">
					INSERT INTO SystemUserMessage(UsersID,Note)
					VALUES(#trim(i)#, '#trim(note)#')
				</cfquery>
				
			</cfloop>
		
		</cfif>
			
		<cfreturn "checkUserIntakesTimeSpan has been processed. CID: #trim(ClientID)#">
			
		
	</cffunction> 
	
	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call the stored procedure that will create user messages concerning the        --->
	<!--- Tasks that past their due date.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="checkUserTasksTimeSpan" returntype="string" hint="Call the stored procedure that will create user messages concerning the Tasks that past their due date.">
		
		<cfargument name="clientID" required="yes" type="numeric">
						
		<cfquery name="getTasksTimeSpan" datasource="PAClient_#trim(ClientID)#">
			SELECT t.TaskID AS TaskID, t.CreatorID, TIMESTAMPDIFF(Hour, t.DueDate, now()) AS numofHours, CONCAT(vw.FName, ' ', vw.LName) AS AssignedToName 
			FROM task t
			JOIN view_UserAccountParameters vw ON t.AssignedToUserID = vw.UsersID
			WHERE t.Active = 1 AND t.DueDate IS NOT NULL AND TIMESTAMPDIFF(Hour, t.DueDate, now()) > 1 AND t.StatusID NOT IN(174,175) <!---NOT Closed/Archived--->
		</cfquery>		
		
		<cfif getTasksTimeSpan.recordCount GTE 1>
			
			<cfset creatorIDs = valueList(getTasksTimeSpan.CreatorID)>
			<cf_gcListRemoveDuplicates list="#trim(creatorIDs)#" name="creatorIDs">
												
			<cfloop list="#trim(creatorIDs)#" index="i">
			
				<cfset note =  "<p><strong>The following Tasks you created are past their due date.</strong></p><script language=JavaScript>function editTask(taskid){task=window.open('appTaskEdit.cfm?action=edit&taskID='+taskid, 'task', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=460'); task.focus(0);};</script>">	
				
				<cfloop query="getTasksTimeSpan">
					<cfif CreatorID EQ i>
						<cfset note = note & "<strong>Task ID:</strong> <a href=## onclick=editTask(#trim(TaskID)#);>#trim(TaskID)#</a> <strong>Assigned To:</strong> #trim(AssignedToName)# <br>">			
					</cfif>	
				</cfloop>
				
				<cfquery name="insertSystemUserMessage" datasource="PAClient_#trim(ClientID)#">
					INSERT INTO SystemUserMessage(UsersID,Note)
					VALUES(#trim(i)#, '#trim(note)#')
				</cfquery>
				
			</cfloop>
		
		</cfif>
			
		<cfreturn "checkUserTasksTimeSpan has been processed. CID: #trim(ClientID)#">

	</cffunction>
	
	  
	  

</cfcomponent> 

	

