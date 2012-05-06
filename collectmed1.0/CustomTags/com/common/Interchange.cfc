



<cfcomponent extends="com.common.db.InterchangeIO">	


	<cffunction name="getInterchangeFileID" retruntype="numeric" output="no">
		
		<cfargument name="clientID" type="numeric" hint="Client ID" required="true">
		<cfargument name="interchangeID" type="numeric" hint="Interchange ID" required="true">
						
		<cftry>
			
			<cfquery name="getFileID" datasource="PAClient_#trim(ClientID)#">
				SELECT FileID 
				FROM Interchange  
				WHERE InterchangeID = #trim(InterchangeID)#
			</cfquery>
									
			<cfif IsDefined("getFileID.FileID") AND IsNumeric(getFileID.FileID)>				
				<cfreturn trim(getFileID.FileID)>								
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

		