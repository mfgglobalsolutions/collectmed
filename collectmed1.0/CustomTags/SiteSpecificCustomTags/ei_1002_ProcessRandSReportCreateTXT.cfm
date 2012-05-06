

<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->
<!------------------------------------------------------------------>
	<cfparam name="attributes.PDFFilePath" default="">
	<cfset PDFFilePath = attributes.PDFFilePath>

	<cfparam name="attributes.filePath" default="">
	<cfset filePath = attributes.filePath>
	
	<cfparam name="attributes.filename" default="">
	<cfset filename = attributes.filename>	
	
	
	
<!------------------------------------------------------------------>
<!--- Check to make sure the directory actually exists.          --->
<!------------------------------------------------------------------>
	<cfif NOT DirectoryExists("#trim(filePath)#\")>
		
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="The specified path does not exist (#trim(filePath)#).] IN ei_1002_ProcessRandSReportCreateTXT.cfm Line 25">
			
		<cfexit>	
		
	</cfif>	
	
	

<!------------------------------------------------------------------>
<!--- Working call used to make all the test files               --->
<!------------------------------------------------------------------>
	
	<cftry>
	
		<cfobject type="COM"
			action="Create"
		    name="p2t"
		    class="P2TServer.P2T">
		
		<cfset strName="POLY-ALLIANCE P2T 1 Server"><!---4747457--->
		<cfset strKey="D0FBE21F7DB3CFFFFFB3FC"><!---345srwr242342423--->
		<cfset result = p2t.VerifyLicense(strName, strKey)>
		<cfset nCtrlFlag=64+32>
		<cfset strPageRange="1-150">
		<cfset strPageBreaker="*@*(page%%NUM)*@*">
		<cfset result=p2t.EngageProcessor(nCtrlFlag, strPageRange, strPageBreaker)>
		<cfset strPDFName="#trim(PDFFilePath)#">		
		<cfset strTXTName="#trim(filePath)#\#trim(fileName)#">
		
		<cfset result=p2t.Convert(strPDFName, strTXTName)>
	
		<cfcatch type="Any">
					
			<cf_db_Insert_debugTable	 		
				referenceid="115"
				note="There was an issue with the COM file processing. [filename: #filename#] [#trim(PDFFilePath)#] #cfcatch.type# #cfcatch.message# #cfcatch.detail#">		
							
		</cfcatch>
	
	</cftry>
