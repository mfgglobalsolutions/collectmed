

<cfcomponent>

	<cffunction name="wsEmailExists" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="An email address" required="true">
		
		<cfset EmailAddress = Data1>
					
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfinvoke 
				component="EmailAddressBean" 
				method="emailExists" 
				emailaddress="#trim(EmailAddress)#"
				returnvariable="EmailID">
			
			<cfif IsNumeric(EmailID) AND EmailID GT 0>
				<cfreturn true>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">
				
				<cf_gcGeneralErrorTemplate
					message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

</cfcomponent>

	