
<cfcomponent>
  
   <cffunction name="onIncomingMessage" output="no">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
					
			<cf_gcCFScriptIncludes>
			<cfset data = CFEvent.data>
			
										
				<!------------------------------------------------------------------>
				<!--- Check to make sure the directory actually exists.          --->
				<!------------------------------------------------------------------>
				<cfif NOT DirectoryExists("#trim(filePath)#\")>					
					<cf_db_Insert_debugTable
						referenceid="115"
						note="The specified path does not exist (#trim(filePath)#).] <p> IN ProcessRandSReportClaimsPaidOrDenied.cfc Line 20">								
					<cfexit>						
				</cfif>
						
			
				<!------------------------------------------------------------------>
				<!--- Check to make sure the file actually exists.               --->
				<!------------------------------------------------------------------>
				<cfif NOT FileExists("#trim(filePath)#\#trim(fileName)#")>					
					<cf_db_Insert_debugTable
						referenceid="115"
						note="The file you are trying to view is not in the specified path (#trim(filePath)#\#trim(fileName)#).] <p> IN ProcessRandSReportClaimsPaidOrDenied.cfc Line 34">
					<cfexit>						
				</cfif>	
									
					
				<!------------------------------------------------------------------>
				<!--- Read the file into a variable.                             --->
				<!------------------------------------------------------------------>
				<cffile 
					action="append"
					file="#trim(data.filepath)#\#trim(data.filename)#"
					output="#trim(data.string)#">

									
				<!------------------------------------------------------------------>
				<!--- Placing this in response to the inability by JRun to       --->
				<!--- possible not releasing ram used by the request scope.      --->
				<!--- 05/04/05                                                   --->
				<!------------------------------------------------------------------>
				<cfset tempClear = StructClear(Request)>								
									
			<cfcatch type="Any">
				
				  <cflog text="115 There was an issue with the file processing. <p> IN ProcessRandSReportClaimsPaidOrDenied.cfc <p>#cfcatch.type# #cfcatch.message# #cfcatch.detail#" file="GatewaysEventLog" type="info" thread="yes" date="yes" time="yes" application="yes">						
							
			</cfcatch>
		
		</cftry>
     
   </cffunction>
   
</cfcomponent>

	