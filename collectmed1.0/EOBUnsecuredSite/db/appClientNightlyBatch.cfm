
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.message" default="Successful Nightly Batch Work Page Call<br>">
	<cfset message = attributes.message>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the clientIDs that will be run against.                                --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getClientIDs" datasource="PA_Master">
		SELECT ClientID FROM Client
	</cfquery>
	
	<cfset clientIDs = valuelist(getClientIDs.ClientID)>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the object with all the function that will be run.                      --->
<!-------------------------------------------------------------------------------------->
	<cfset request.ClientNightlyBatch = CreateObject("component", "com.common.ClientNightlyBatch")> 	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Call the stored procedure that will create user messages concerning the        --->
<!--- number of intakes that have no action taken against them for longer            --->
<!--- than 72 hours. Only run on Weekdays.                                           --->
<!-------------------------------------------------------------------------------------->
	<cfif ListFind("2,3,4,5,6", DayOfweek(NOW()))>	
		<cfloop list="#trim(clientIDs)#" index="i">
			<cfset message = message & "<p>" & request.ClientNightlyBatch.checkIntakesTimeSpan(i) & "</p>"> 
		</cfloop>
	</cfif>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Call the stored procedure that will create user messages concerning the        --->
<!--- number of intakes that have no action taken against them for longer            --->
<!--- than 48 hours. Only run on Weekdays.                                           --->
<!-------------------------------------------------------------------------------------->
	<cfif ListFind("2,3,4,5,6", DayOfweek(NOW()))>
		<cfloop list="#trim(clientIDs)#" index="i">
			<cfset message = message & "<p>" & request.ClientNightlyBatch.checkUserIntakesTimeSpan(i) & "</p>"> 
		</cfloop>	
	</cfif>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Call the stored procedure that will create user messages concerning the        --->
<!--- Tasks that past their due date.  Only run on Weekdays.                         --->
<!-------------------------------------------------------------------------------------->		
	<cfif ListFind("2,3,4,5,6", DayOfweek(NOW()))>
		<cfloop list="#trim(clientIDs)#" index="i">
			<cfset message = message & "<p>" & request.ClientNightlyBatch.checkUserTasksTimeSpan(i) & "</p>"> 
		</cfloop>		
	</cfif>	
	

	
<!-------------------------------------------------------------------------------------->
<!--- Email the administrator that this run was successful.                          --->
<!-------------------------------------------------------------------------------------->		
	<cfmail	from="support@eobmanager.net" to="support@eobmanager.net" subject="Nightly Bactch Work #DayOfWeekAsString(DayOfweek(NOW()))# #DateFormat(NOW(), 'mm/dd/yyyy')# #TimeFormat(NOW(), 'hh:mm:ss')# [#trim(CGI.REMOTE_ADDR)#]" type="HTML">
		<cfoutput>
			<p>#trim(message)#</p>			
		</cfoutput>
	</cfmail>
		
	
