


<cfcomponent>

	<cffunction name="onAdd" output="no">
	  
	   <cfargument name="CFEvent" type="struct" required="yes">
	   
	   	<cfset data=CFEvent.data>
	   	
		<cftry>									
			
			<cfset request.datasource = "devEOBManager">		
			
			<cf_ei_1002_ProcessRandSReport PDFFilePath="#trim(data.fileName)#">				
				
			<cfcatch type="Any">
				
				<cf_db_Insert_debugTable	 		
					referenceid="115"
					note="There was an issue with the file processing. <p> IN ei_1002_EOBDirectoryWatcher.cfc<p> [data.filename: #data.filename#] #cfcatch.type# #cfcatch.message# #cfcatch.detail#">				
							
			</cfcatch>
		
		</cftry>			
	   
	</cffunction>
	
</cfcomponent>


