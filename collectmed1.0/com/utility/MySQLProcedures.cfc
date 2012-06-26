

<cfcomponent>


	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Address DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
		
		<cfscript>
			variables.instance.configBean = arguments.configBean;
		</cfscript>
			
		<cfreturn this />
		
	</cffunction>


	<cffunction name="createNewClientDB" returntype="any" >
	
		<cfargument name="mainClientDB" required="true" type="string">
		<cfargument name="newClientDB" required="true" type="string">
		<cfargument name="mySQLPath" required="true" type="string">
		<cfargument name="mySQLIpAddress" required="true" type="string">
		<cfargument name="mySQLPort" required="true" type="string">
		<cfargument name="mySQLUser" required="true" type="string">
		<cfargument name="mySQLPass" required="true" type="string">	
		<cfargument name="clientTemplatePath" required="false" default="#expandPath('./mysql/paclient_master.sql')#">
		<cfargument name="newClientBatShellPath" required="false" default="#expandPath('./mysql/newClientDB.bat')#">
		<cfargument name="newClientDBSQLPath" required="false" default="#expandPath('./mysql')#/#trim(arguments.newClientDB)#.sql">
	
		<!--- <cftry> --->


			<cfquery name="local.getAllClients" datasource="#trim(variables.instance.configBean.getDsn().master)#">
				SHOW Databases
			</cfquery>
			
				
			<cfset local.clientList = "">
			<cfloop query="local.getAllClients">
				<cfif findNoCase("paclient_", DATABASE)>
					<cfset local.clientList = ListAppend(clientList, DATABASE)>
				</cfif>
			</cfloop>
		
			
			<cfif NOT ListFindNocase(local.clientList, trim(arguments.newClientDB))>				
		
				<!---------------------------------------------------------------------------->
				<!--- Create the backup of the MAIN client database                        --->
				<!---------------------------------------------------------------------------->
				<cfexecute 
					name="#arguments.mySQLPath#/mysqldump" 
					arguments="--host=#trim(arguments.mySQLIpAddress)# --port=#trim(arguments.mySQLPort)# --user=#trim(arguments.mySQLUser)# --password=#trim(arguments.mySQLPass)# --no-data #trim(arguments.mainClientDB)#"
					outputfile="#trim(arguments.clientTemplatePath)#"	 	
					timeout="60"/> 

				<!---------------------------------------------------------------------------->		
				<!--- Reset the AUTOINCREMENT SO THAT ALL TABLES START WITH FRESH ID's     --->
				<!---------------------------------------------------------------------------->				
				<cffile 
					action="READ" 
					file="#trim(arguments.clientTemplatePath)#" 
					variable="fileContent">
			
				<cfset newFileContent = REReplaceNoCase(fileContent, '(AUTO_INCREMENT=)+[0-9]+[ ]+(DEFAULT)', 'AUTO_INCREMENT=1 DEFAULT', 'all') />
				
				<cffile 
					action="write" 
					nameconflict="OVERWRITE" 
					file="#trim(arguments.clientTemplatePath)#" 
					output="#newFileContent#">
					
				<cffile 
					action="write" 
					nameconflict="OVERWRITE" 
					file="#trim(arguments.newClientDBSQLPath)#" 
					output="CREATE DATABASE #trim(arguments.newClientDB)#;">					
										
				<!---------------------------------------------------------------------------->
				<!--- Create the new database from the backup of the main client database. --->
				<!---------------------------------------------------------------------------->
				<cfexecute 
					name="#arguments.mySQLPath#/mysql --host=#trim(arguments.mySQLIpAddress)# --port=#trim(arguments.mySQLPort)# --user=#trim(arguments.mySQLUser)# --password=#trim(arguments.mySQLPass)# < #trim(arguments.newClientDBSQLPath)#"	
					variable="results"	
					timeout="60"/>
				<!--- <cfexecute 
					name="#trim(newClientBatShellPath)#" 
					arguments="""#arguments.mySQLPath#/mysql.exe"" #trim(arguments.mySQLIpAddress)# #trim(arguments.mySQLPort)# #trim(arguments.mySQLUser)# #trim(arguments.mySQLPass)# #trim(arguments.newClientDB)# #trim(arguments.newClientDBSQLPath)# #trim(arguments.clientTemplatePath)# 1"
					variable="results"	
					timeout="60"/> ---> 
					
		<cfdump var="#results#">		
									
				<cfscript>
					go_to = createObject("java", "java.lang.Thread");
					go_to.sleep(3000); //sleep time in milliseconds 
				</cfscript>
				
				<!---------------------------------------------------------------------------->
				<!--- REM APPLY A SCHEMA TO THE NEW DATABASE TO BUILD ITS TABLES.          --->
				<!---------------------------------------------------------------------------->	
				<cfexecute 
					name="#arguments.mySQLPath#/mysql"
					arguments="--host=#trim(arguments.mySQLIpAddress)# --port=#trim(arguments.mySQLPort)# --user=#trim(arguments.mySQLUser)# --password=#trim(arguments.mySQLPass)# #trim(arguments.newClientDB)# < #trim(arguments.clientTemplatePath)#"
					variable="results"	
					timeout="60"/> 
				<!--- <cfexecute 
					name="#trim(newClientBatShellPath)#" 
					arguments="""#arguments.mySQLPath#/mysql.exe"" #trim(arguments.mySQLIpAddress)# #trim(arguments.mySQLPort)# #trim(arguments.mySQLUser)# #trim(arguments.mySQLPass)# #trim(arguments.newClientDB)# #trim(arguments.newClientDBSQLPath)# #trim(arguments.clientTemplatePath)# 2"
					variable="results"	
					timeout="60"/>  --->
		<cfdump var="#results#">				
			</cfif>
	
		
			<cfreturn true>		
			
			<!--- <cfcatch type="Any">			
				<cfthrow message="[#cfcatch.message#<br><br>#cfcatch.detail#] There was an error MySQL createNewClientDB.">						
			</cfcatch>
			
		</cftry> --->
		
	</cffunction>


	<cffunction name="createClientDBBackups" returntype="any" output="false">
		<cfargument name="masterDatasource" required="true">
		<cfargument name="mySQLPath" required="true">
		<cfargument name="mySQLIpAddress" required="true">
		<cfargument name="mySQLPort" required="true">
		<cfargument name="mySQLUser" required="true">
		<cfargument name="mySQLPass" required="true">
		<cfargument name="dbBackupPath" required="true">

		<cftry>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Get the administrator information.                                             --->
			<!-------------------------------------------------------------------------------------->	
			<cfquery name="getAllClients" datasource="#trim(arguments.masterDatasource)#">
				SHOW Databases
			</cfquery>	
			
			<cfset clientList = "">
			<cfloop query="getAllClients">
				<cfif findNoCase("paclient_", DATABASE)>
					<cfset clientList = ListAppend(clientList, DATABASE)>
				</cfif>
			</cfloop>
		
			<cfloop list="#trim(clientList)#" index="thisDB">		
				<cfset temp = createClientDBBKP(thisDB, arguments.mySQLPath, arguments.mySQLIpAddress, arguments.mySQLPort, arguments.mySQLUser, arguments.mySQLPass, arguments.dbBackupPath)>
			</cfloop>
			
			<cfreturn true>		

			<cfcatch type="Any">
				
				<cfthrow message="[#cfcatch.message#<br><br>#cfcatch.detail#] There was an error MySQL createClientDBBackups.">
						
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	


	<cffunction name="createClientDBBKP" returntype="any" output="false">
		
		<cfargument name="clientDB" required="true">
		<cfargument name="mySQLPath" required="true">
		<cfargument name="mySQLIpAddress" required="true">
		<cfargument name="mySQLPort" required="true">
		<cfargument name="mySQLUser" required="true">
		<cfargument name="mySQLPass" required="true">	
		<cfargument name="dbBackupPath" required="true">	
		<cfargument name="clientBKPPathWName" required="false" default="#trim(arguments.dbBackupPath)##trim(arguments.clientDB)#_BKP#DateFormat(NOW(), 'mmddyy')##TimeFormat(NOW(), 'hhmmss')#.sql">
	
		<cftry>
			
			<!---------------------------------------------------------------------------->
			<!--- Create the backup of the MAIN client database                        --->
			<!---------------------------------------------------------------------------->
			<cfif NOT FindNoCase("1084", arguments.clientDB)>
			<cfexecute 
				name="#trim(arguments.mySQLPath)#/mysqldump" 
				arguments="--host=#trim(arguments.mySQLIpAddress)# --port=#trim(arguments.mySQLPort)# --user=#trim(arguments.mySQLUser)# --password=#trim(arguments.mySQLPass)# #trim(arguments.clientDB)#"
				outputfile="#trim(arguments.clientBKPPathWName)#"	 	
				timeout="60"/> 
			</cfif>	
		
			<cfreturn true>		
			
			<cfcatch type="Any">			
				<cfthrow message="[#cfcatch.message#<br><br>#cfcatch.detail#] There was an error MySQL createClientDBBKP.">						
			</cfcatch>
			
		</cftry>
						
	</cffunction>
	
			
</cfcomponent>

	
