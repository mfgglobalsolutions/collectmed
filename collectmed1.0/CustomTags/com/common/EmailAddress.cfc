

<cfcomponent>

	<cffunction name="emailExists" retruntype="numeric" output="no">
		
		<cfargument name="EmailAddress" type="string" hint="An email address" required="true">
		<cfargument name="PersonID" type="string" hint="An email address" required="false">
		
		<cftry>
			
			<cfquery name="getEmail" datasource="#request.datasource#">
				SELECT EmailAddressID
				FROM emailaddress  
				WHERE Email = '#trim(EmailAddress)#' <cfif IsNumeric(PersonID)> AND PersonID != #trim(PersonID)#</cfif>
			</cfquery>
									
			<cfif IsDefined("getEmail.EmailAddressID") AND IsNumeric(getEmail.EmailAddressID)>
				<cfreturn getEmail.EmailAddressID>
			<cfelse>
				<cfreturn 0>	
			</cfif>
			
		
			<cfcatch type="Any">
				
				<cf_gcGeneralErrorTemplate
					message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

</cfcomponent>

	
