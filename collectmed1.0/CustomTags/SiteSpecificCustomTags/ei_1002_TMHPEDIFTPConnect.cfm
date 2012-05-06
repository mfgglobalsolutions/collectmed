<!---how to call this page.


<cf_ei_1002_TMHPEDIFTPConnect
	clientID="44"	
	username="anonymous"
	password="gcruz@email.com"
	ftpserver="fte.eobmanager.net">

--->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>
	
	<cfparam name="attributes.port" default="21">
	<cfset port = attributes.port>
	
	<cfparam name="attributes.username" default="">
	<cfset username = attributes.username>
	
	<cfparam name="attributes.password" default="">
	<cfset password = attributes.password>
	
	<cfparam name="attributes.ftpserver" default="">
	<cfset ftpserver = attributes.ftpserver>
	
	<cfparam name="attributes.stoponerror" default="no">
	<cfset stoponerror = attributes.stoponerror>
	
	<cfparam name="attributes.retrycount" default="3">
	<cfset retrycount = attributes.retrycount>
	
	<cfset gcrandomnumber = RandRange(1,5000)>	
	
	<cfparam name="attributes.connection" default="ftp_#trim(clientID)#_#trim(gcrandomnumber)#">
	<cfset connection = attributes.connection>
	
	<cfparam name="attributes.homeDirectoryFiles" default="">
	<cfset homeDirectoryFiles = attributes.homeDirectoryFiles>
	
	<cfparam name="attributes.batchDirectoryFiles" default="">
	<cfset batchDirectoryFiles = attributes.batchDirectoryFiles>


	
<!-------------------------------------------------------------------------------------->
<!--- Open a connection                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfftp
		action="open" 
		port="#trim(port)#"
	    username="#trim(username)#"
	    connection="#trim(connection)#"
	    password="#trim(password)#"
	    server="#trim(ftpserver)#"
	    stoponerror="#trim(stoponerror)#"
		retrycount="#trim(retrycount)#">

		
		
<!-------------------------------------------------------------------------------------->
<!--- Find out if the connection succeeded.                                          --->
<!-------------------------------------------------------------------------------------->
	<cfif NOT CFFTe.Succeeded>
	
		<cfinvoke
			component="com.common.db.EmailAddressIO" 
			method="getEmailAddressQuery"
			returnVariable="EAQuery"
			fields="Email"
			EmailAddressID="#request.Site.getSupportEmailAddressID()#">
						
		<cfset errorMessage = "clientID: #trim(clientID)#<p>CFFTe.Succeeded: #CFFTe.Succeeded#<br>cffte.errorCode: #cffte.errorCode#<br>cffte.errorText: #cffte.errorText# <p>The FTP connection failed IN ei_1002_TMHPEDIFTPConnect.cfm Line 51">
	
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="#trim(errorMessage)#">	
			
		<cf_gcSendEmail
			from="#trim(EAQuery.Email)#"
			to="#trim(EAQuery.Email)#"
			subject="FTP Connect ERROR IMMEDIATE ATTENTION REQUIRED"
			message="#trim(errorMessage)#">		
			
		<cfexit>	
		
	</cfif>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- List the files in a directory.                                                 --->
<!-------------------------------------------------------------------------------------->	
	<cfftp
		transfermode="binary"
		action="LISTDIR"
       	stoponerror="#trim(stoponerror)#"
       	name="ListFiles"
       	directory="/"
       	connection="#trim(connection)#">
	   
		<cfloop query="ListFiles">			
			<cfif NOT isdirectory>
				<cfset homeDirectoryFiles = listAppend(trim(homeDirectoryFiles), trim(name))>
			</cfif>
		</cfloop>



<!-------------------------------------------------------------------------------------->
<!--- List the files in a batch directory.                                           --->
<!-------------------------------------------------------------------------------------->			   
	<cfftp		
		transfermode="binary"
		action="LISTDIR"
       	stoponerror="#trim(stoponerror)#"
       	name="ListBatchFiles"
       	directory="/download/batch"
       	connection="#trim(connection)#">
	   
		<cfloop query="ListBatchFiles">			
			<cfif NOT isdirectory>
				<cfset batchDirectoryFiles = listAppend(trim(batchDirectoryFiles), trim(name))>
			</cfif>
		</cfloop>
		
		
						
<!-------------------------------------------------------------------------------------->
<!--- Loop through the batch files and find out if the file is in the home directory --->
<!--- if it is download it.                                                          --->
<!-------------------------------------------------------------------------------------->		
	<cfif ListLen(trim(homeDirectoryFiles)) AND ListLen(trim(batchDirectoryFiles))>
		<cfloop list="#trim(batchDirectoryFiles)#" index="i">
			<cfif ListFindNoCase(trim(homeDirectoryFiles), trim(i))>
				<cfoutput>
					
					<cfftp
						connection="#trim(connection)#"                   
                        action="getfile"
                        directory="\download\batch"                               
                        remotefile="#trim(i)#"
                        localfile="c:\temp\#trim(i)#"
                        failifexists="NO"
                        stoponerror="#trim(stoponerror)#">
					
					<!-------------------------------------------------------------------------------------->
					<!--- Find out if the download succeeded.                                            --->
					<!-------------------------------------------------------------------------------------->
						<cfif NOT CFFTe.Succeeded>
						
							<cfinvoke
								component="com.common.db.EmailAddressIO" 
								method="getEmailAddressQuery"
								returnVariable="EAQuery"
								fields="Email"
								EmailAddressID="#request.Site.getSupportEmailAddressID()#">
											
							<cfset errorMessage = "clientID: #trim(clientID)#<p>CFFTe.Succeeded: #CFFTe.Succeeded#<br>cffte.errorCode: #cffte.errorCode#<br>cffte.errorText: #cffte.errorText# <p>The FTP file (#trim(i)#) download failed IN ei_1002_TMHPEDIFTPConnect.cfm Line 51">
						
							<cf_gcGatewayLogger
								datasource="#trim(request.datasource)#" 
								code="115"
								logtext = "#trim(errorMessage)#">
							
								
							<cf_gcSendEmail
								from="#trim(EAQuery.Email)#"
								to="#trim(EAQuery.Email)#"
								subject="FTP DOWNLOAD ERROR IMMEDIATE ATTENTION REQUIRED"
								message="#trim(errorMessage)#">		
																			
						</cfif>
					
					
				</cfoutput>
			</cfif>	
		</cfloop>
		
		
		
		
		
		
<cfoutput><p></p>
	[#homeDirectoryFiles#]<br>
	[#batchDirectoryFiles#]<br>
</cfoutput>		
		
	</cfif>
		

		
		

















<!-------------------------------------------------------------------------------------->
<!--- Extremely Important: Close the connection.                                     --->
<!-------------------------------------------------------------------------------------->
	<cfftp 
		action="close" 
		connection="#trim(connection)#" 
		stoponerror="#trim(stoponerror)#">
		
	<cfif NOT CFFTe.Succeeded>
	
		<cfinvoke
			component="com.common.db.EmailAddressIO" 
			method="getEmailAddressQuery"
			returnVariable="EAQuery"
			fields="Email"
			EmailAddressID="#request.Site.getSupportEmailAddressID()#">
						
		<cfset errorMessage = "clientID: #trim(clientID)#<p>CFFTe.Succeeded: #CFFTe.Succeeded#<br>cffte.errorCode: #cffte.errorCode#<br>cffte.errorText: #cffte.errorText# <p>The FTP connection failed to CLOSE IN ei_1002_TMHPEDIFTPConnect.cfm Line 119">
	
		<cf_gcGatewayLogger
			datasource="#trim(request.datasource)#" 
			code="115"
			logtext = "#trim(errorMessage)#">
			
		<cf_gcSendEmail
			from="#trim(EAQuery.Email)#"
			to="#trim(EAQuery.Email)#"
			subject="FTP CLOSE CONNECTION ERROR IMMEDIATE ATTENTION REQUIRED"
			message="#trim(errorMessage)#">		
			
		<cfexit>	
		
	</cfif>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!---
<cfftp 
    action="GetCurrentDir" 
    connection="#trim(connection)#">	  

  <cfset Folder = "#CFFTe.ReturnValue#">


<cfoutput>
	[#trim(folder)#]<br>[#homeDirectoryFiles#]<br>
</cfoutput>

--->	
