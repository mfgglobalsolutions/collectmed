

<cfcomponent>

	<cffunction name="wsDXDescription" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="An ID" required="true">
		
		<cfset Code = Data1>		
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
						
			<cfquery name="getDXDescription" datasource="PA_Master">
				SELECT Description 
				FROM EOB_MEDICARE_DXCode
				WHERE Code = '#trim(Code)#'
			</cfquery>
									
			<cfif getDXDescription.RecordCount EQ 1>				
				<!---<cfset desc = Replace(getDXDescription.Description, "'", "\'", "ALL")>		--->		
				<cfset desc = getDXDescription.Description>
				<cfreturn desc>				
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

</cfcomponent>

	