	
	
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.ClientID" default="">
	<cfset ClientID = attributes.ClientID>
	
	<cfparam name="attributes.DBNamePre" default="PAClient_">
	<cfset DBNamePre = attributes.DBNamePre>
	
	<cfparam name="attributes.serverName" default="EOB">
	<cfset serverName = attributes.serverName>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="ClientID"
		fieldnames="Client ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the database name.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfset DBName = DBNamePre & ClientID>		

		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the database here.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cftry>
				
		<cfquery name="createDB" datasource="#request.datasource#">		
			RESTORE DATABASE #trim(DBName)#
		   	FROM PAClient_MASTER
		   	WITH RECOVERY,
		   	MOVE 'PAClient_MASTER_data' TO 'C:\Program Files\Microsoft SQL Server\MSSQL$#trim(serverName)#\Data\#trim(DBName)#_data.mdf', 
		   	MOVE 'PAClient_MASTER_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL$#trim(serverName)#\Data\#trim(DBName)#_log.ldf'					
		</cfquery>		
		
		<cfcatch type="Any">
			
			<cfoutput>					
				<p>Caught an exception, type = #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>	       
		        The contents of the tag stack are:<br>
		        <cfdump var="#cfcatch.tagcontext#"> 
			</cfoutput>
			<cfabort>
		
		</cfcatch>
	
	</cftry>

