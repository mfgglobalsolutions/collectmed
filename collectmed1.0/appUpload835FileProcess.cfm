<!---- appUpload835FileProcess.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->			
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Include the upload template that will save the file information.               --->
<!-------------------------------------------------------------------------------------->
	<cf_gcEOBFileUpload>


	
<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->	
	<cfif returnCode EQ 1>
				
		<cfset msg = "Your file (#trim(ClientFile)#) was uploaded successfully. It will be processed and you will be notified upon completion.">	
		
		<cfif trim(FileWasRenamed) EQ "Yes">
			<cfset msg = msg & "<br>It was renamed (#trim(ServerFile)#) because it already existed.">	
		</cfif>
							
	<cfelse>
	
		<cf_gcGeneralErrorTemplate message="There was an error produced while uploading your file please try again.">
			
	</cfif>
	
		

<!-------------------------------------------------------------------------------------->
<!--- The file has been uploaded. Create the XML File and then process it.           --->
<!-------------------------------------------------------------------------------------->
	<cf_ei_1002_CreateFile835ToXML
		clientID="#trim(session.ClientID)#" 
		fileID="#trim(fileID)#" 
		supportemailaddressID="#request.Site.getSupportEmailAddressID()#">
	
	
			
<!-------------------------------------------------------------------------------------->
<!--- Once all processes then go ahead and locate them back to the file page.        --->
<!-------------------------------------------------------------------------------------->	
	<cfif returnCode EQ 1>
		<cflocation addtoken="No" url="appFileCheckStatus.cfm?msg=#URLEncodedFormat(trim(msg))#">
	</cfif>	
	
	