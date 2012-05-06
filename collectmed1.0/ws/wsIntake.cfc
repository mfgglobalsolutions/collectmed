

<cfcomponent>

	<cffunction name="wsIntakeNotes" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="An Intake ID" required="true">
		<cfargument name="Data2" type="string" hint="Show Time" required="No" default="no">
		<cfargument name="Data3" type="string" hint="Client ID" required="true">
		
		<cfset intakeID = Data1>		
		<cfset showTime = Data2>
		<cfset clientID = Data3>		
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
				
			<cfset request.datasource = "PAClient_" & clientID>	
			
			<cfset request.Note = CreateObject("component","com.common.Note")>				
			<cfset noteID = request.Note.getNoteID(clientID: trim(clientID), objectID: 8, instanceID: trim(intakeID))>			
			<cfset formattedNotes = request.Note.getFormattedNotes(noteID: trim(noteID), showTime: trim(showTime), clientID: trim(clientID))>
 										
			<cfif trim(formattedNotes) NEQ "">				
				<!---<cfset desc = Replace(getIntakeNotes.Note, "'", "\'", "ALL")>		--->		
				<cfset desc = formattedNotes>
				<cfreturn desc>				
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">				
			
				<cf_gcGatewayLogger			
					datasource="#trim(request.datasource)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
		
		
	<cffunction name="wsAutoAssignToManager" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="An Intake ID" required="true">
		
		<cfset clientID = Data1>				
		<cfset intakeID = Data2>		
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
				
			<cfinvoke component="com.common.Intake" method="AutoAssignToManager" clientid="#trim(clientID)#" intakeid="#trim(intakeID)#" returnvariable="success">
				
			<cfreturn success>
								
			<cfcatch type="Any">				
			
				<cf_gcGatewayLogger			
					datasource="#trim(request.datasource)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
</cfcomponent>

	