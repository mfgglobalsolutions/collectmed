


<cfcomponent name="WorkGroup" extends="com.common.db.WorkGroupIO">		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Get users with a specific role from a client.                                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getWorkGroups" returntype="Query" hint="Get all available groups from a client.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
				
		<cftry>	
				
			<cfquery name="getAllWorkGroups" datasource="PAClient_#trim(ClientID)#">				
				SELECT WorkGroupID, ClientID, WorkGroupName, DateCreated, DateModified, Description, MondayStart, MondayEnd, TuesdayStart, TuesdayEnd, WednesdayStart, WednesdayEnd, ThursdayStart, ThursdayEnd, FridayStart, FridayEnd, SaturdayStart, SaturdayEnd, SundayStart, SundayEnd
				FROM workgroup		
			</cfquery>				
			
			<cfreturn getAllWorkGroups>
			
			<cfcatch type="Any">				
				
				<cf_gcGatewayLogger			
					datasource="PAClient_#trim(ClientID)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
																
	</cffunction>	
	
	
</cfcomponent>



