<!---- appFileUploadProcess.cfm ---->


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
				
		<cfset msg = "Your file (#trim(ClientFile)#) was uploaded successfully">	
		
		<cfif trim(FileWasRenamed) EQ "Yes">
			<cfset msg = msg & "<br>It was renamed (#trim(ServerFile)#) because it already existed.">	
		</cfif>
		
		<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
		<cfset request.FileProcess.setFileID(trim(fileID))>
		<cfset request.FileProcess.setNote('System Entered Note: initial entry through upload')>			
					
	<cfelse>
	
		<cf_gcGeneralErrorTemplate message="There was an error produced while uploading your file please try again.">
			
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Depending on the type different actions will take place.                       --->
<!-------------------------------------------------------------------------------------->	
	<cfif filetype EQ 101>
		
		<!-------------------------------------------------------------------------------------->
		<!--- The file has been uploaded. Create the XML File and then process it.           --->
		<!-------------------------------------------------------------------------------------->
		<cf_ei_1002_CreateFile835ToXML
			clientID="#trim(session.ClientID)#" 
			fileID="#trim(fileID)#" 
			supportemailaddressID="#request.Site.getSupportEmailAddressID()#">
		
	</cfif>				
			
			
				
<!-------------------------------------------------------------------------------------->
<!--- Once all processes then go ahead and locate them back to the file page.        --->
<!-------------------------------------------------------------------------------------->	
	<cfif returnCode EQ 1>
		<cflocation addtoken="No" url="appFileCheckStatus.cfm?openfileid=#trim(fileID)#&msg=#URLEncodedFormat(trim(msg))#">
	</cfif>
	
	