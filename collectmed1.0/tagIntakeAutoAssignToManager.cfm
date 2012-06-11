	
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.intakeID" default="">
	<cfset intakeID = attributes.intakeID>

	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>

	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="clientID,intakeID"
		fieldnames="numeric,numeric">		



<!-------------------------------------------------------------------------------------->
<!--- When all steps have been met we should automatically reassign the intake to    --->
<!--- someone from the Intake Managers group so they can close the intake or take    --->
<!--- whatever action they want to on the intake.                                    --->
<!-------------------------------------------------------------------------------------->	

	<!-------------------------------------------------------------------------------------->
	<!--- Get the Administrator ID.                                                      --->
	<!-------------------------------------------------------------------------------------->
	<cfquery name="getIntakeGroup" datasource="PAClient_#trim(ClientID)#">
		SELECT WorkGroupID
		FROM workgroup
		WHERE WorkGroupName = 'Intake Manager'
	</cfquery>
	
	<cfif getIntakeGroup.RecordCount EQ 1>
	
		<cfquery name="getAssignedIntakes" datasource="PAClient_#trim(ClientID)#">
			SELECT AssignedToUserID, Count(IntakeID) AS NumberOfIntakes
			FROM intake
			WHERE AssignedToUserID IN (SELECT UsersID FROM usersworkgroup   WHERE WorkGroupID = #trim(getIntakeGroup.WorkGroupID)#) 
			AND Active = 1 AND ClosingInvoiceNumber IS NULL
			--Looking to see who has more intakes currently assigned counting the ClosingInvoiceNumber
			--AND (Active = 1 OR ClosingInvoiceNumber IS NOT NULL)		
			GROUP BY AssignedToUserID					
		</cfquery>
		
		<cfset count = 0>
		
		<cfloop query="getAssignedIntakes">
			<cfif NumberOfIntakes GT count>
				<cfset assignToUserID = getAssignedIntakes.AssignedToUserID>
			</cfif>
		</cfloop>
	
	</cfif>

	<!-------------------------------------------------------------------------------------->
	<!--- Get the administrator information.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cfset AdminInfo = GetAdministratorInformation(ClientID)>

	<cffunction name="GetAdministratorInformation" access="remote" hint="Get Administrator Information">		
		<cfargument name="clientID" required="yes" type="numeric">
				
		<cfquery name="getAdminInfo" datasource="PA_Client#trim(arguments.clientID)#">						
			SELECT u.UsersID, E.EntityID, E.Fname, E. Lname, E.Mname, E.DOB, E.SSN, E.Sex, E.Active 
			FROM pa_master.Users AS u 
			INNER JOIN entity AS E ON u.EntityID = E.EntityID 
			WHERE E.EntityID = (SELECT AdministratorEntityID FROM pa_master.[Client] WHERE ClientID = #trim(arguments.clientID)#)
		</cfquery>
		
		<cfreturn getAdminInfo>
												
	</cffunction>
			
	<!--------------------------------------------------------------------------------------->
	<!--- If the asssignToUserID is not defined or not set then use the administrator ID. --->
	<!--------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("assignToUserID") OR NOT IsNumeric(assignToUserID)>			
		<cfset assignToUserID = AdminInfo.UsersID>
	</cfif>
	
	

	<cf_tagIntakeAssign 
		clientid="#trim(ClientID)#"
		assignToUserID="#trim(assignToUserID)#"
		IntakeID="#trim(IntakeID)#"
		assignorID="#trim(AdminInfo.UsersID)#"
		note="System Note: #trim(note)#"
		userFName="#trim(AdminInfo.FName)#"
		userLName="#trim(AdminInfo.LName)#">

		

<!-------------------------------------------------------------------------------------->
<!--- Locate the user back to the desktop after assigning.                           --->
<!-------------------------------------------------------------------------------------->
	<cfset msg = "The Intake has been reassigned.">
	<cflocation addtoken="No" url="appMyDesktop.cfm?msg=#URLEncodedFormat(trim(msg))#">
	
		




