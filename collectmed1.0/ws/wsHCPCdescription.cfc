

<cfcomponent>

	<cffunction name="wsHCPCDescription" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="An ID" required="true">
		
		<cfset Code = Data1>		
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
						
			<cfquery name="getHCPCDescription" datasource="pa_master">
				SELECT LongDescription AS Description 
				FROM eob_medicare_procedurecode
				WHERE HCPC = '#trim(Code)#'
				LIMIT 1
			</cfquery>
									
			<cfif getHCPCDescription.RecordCount GTE 1>				
				<!---<cfset desc = Replace(getDXDescription.Description, "'", "\'", "ALL")>		--->		
				<cfset desc = getHCPCDescription.Description>
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

	
