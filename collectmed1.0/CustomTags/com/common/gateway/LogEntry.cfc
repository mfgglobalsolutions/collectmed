
<cfcomponent>
  
   <cffunction name="onIncomingMessage" output="no">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
					
			<cf_gcCFScriptIncludes>
			<cfset data = CFEvent.data>		
			
			<cfset request.datasource = trim(data.datasource)>	
			
			<cfset temp = CreateObject("component","com.common.db.LogIO")>						
			
			<cfif IsDefined("data.ipaddress") AND data.ipaddress NEQ "">
				<cfset temp.setIPAddress('#trim(data.ipaddress)#')>
			</cfif>				
			
			<cfif IsDefined("data.code") AND data.code NEQ "">
				<cfset temp.setCode(trim(data.Code))>
			</cfif>				
			
			<cfset temp.setLogText('#trim(data.logText)#')>					
			<cfset temp.Commit()>
					
			<!------------------------------------------------------------------>
			<!--- Placing this in response to the inability by JRun to       --->
			<!--- possibly not releasing ram used by the request scope.      --->
			<!--- 05/04/05                                                   --->
			<!------------------------------------------------------------------>
			<cfset tempClear = StructClear(Request)>				
									
			<cfcatch type="Any">
				
				<!-------------------------------------------------------------------------------------->
				<!--- This is the only tag that will call the log file all other tags will           --->
				<!--- call <cf_gcGatewayLogger code="115"> within the cfcatch.                       --->
				<!-------------------------------------------------------------------------------------->
				<cflog text="115 There was an issue with the file processing. <p> IN LogEntry.cfc <p> #cfcatch.type# #cfcatch.message# #cfcatch.detail#" file="GatewaysEventLog" type="info" thread="yes" date="yes" time="yes" application="yes">						
							
			</cfcatch>
		
		</cftry>
     
   </cffunction>
   
</cfcomponent>

	