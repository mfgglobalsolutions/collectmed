



<cfcomponent extends="com.common.File">
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check the file status.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="processingFinishedUpdateStatus" output="yes" hint="This function will be called to check the records for this claim file have finished processing and update the status of the file.">		
		
		<cfargument name="interchangeID" required="yes" type="numeric">
		<cfargument name="fileID" required="yes" type="numeric">
						
		<cftry>
		
			<!-------------------------------------------------------------------------------------->
			<!--- If all the claimXML records are set to Zero it means the file has finished     --->
			<!--- processing all the records and you can set the file to finished processing.    --->
			<!-------------------------------------------------------------------------------------->			
			<cfset request.ClaimXML = CreateObject("component","com.common.db.Claim_ProcessXMLToDBIO")>		
			<cfset Active = request.ClaimXML.getClaim_ProcessXMLToDBQuery(InterchangeID: trim(interchangeID), Active: 1)>			
			<cfif Active.RecordCount EQ 0>						
				<cfset updateFileStatus(trim(fileID), 98, 'Auto Note: All claims on this file have been processed.')>
			</cfif>	
					
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>


	
	
	
</cfcomponent>

		