 	


<cfcomponent name="clientBean" output="false" alias="clientBean" extends="ClientDAO">

	<cfproperty name="ClientID" type="numeric" default="0" />
	<cfproperty name="ClientName" type="string" default="" />
	<cfproperty name="ClientDBA" type="string" default="" />
	<cfproperty name="FederalTaxID" type="string" default="" />
	<cfproperty name="PinNumber" type="string" default="" />
	<cfproperty name="GroupNumber" type="string" default="" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="ProviderID" type="string" default="" />
	<cfproperty name="PreferredPayMethod" type="numeric" default="" />
	<cfproperty name="SupportEmailID" type="numeric" default="" />
	<cfproperty name="AdministratorEntityID" type="numeric" default="" />
	<cfproperty name="MainPhoneID" type="numeric" default="" />
	<cfproperty name="Logo" type="string" default="" />
	<cfproperty name="RecordsperPage" type="numeric" default="" />
	<cfproperty name="SettingsXML" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.ClientID = 0;
		variables.ClientName = "";
		variables.ClientDBA = "";
		variables.FederalTaxID = "";
		variables.PinNumber = "";
		variables.GroupNumber = "";
		variables.EntityID = "";
		variables.ProviderID = "";
		variables.PreferredPayMethod = "";
		variables.SupportEmailID = "";
		variables.AdministratorEntityID = "";
		variables.MainPhoneID = "";
		variables.Logo = "";
		variables.RecordsperPage = "";
		variables.SettingsXML = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="clientBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClientID") AND stValues.ClientID NEQ 0>
				<cfquery name="qGetClient" datasource="#trim(arguments.ds)#">
			  		SELECT ClientID,ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,EntityID,ProviderID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo,RecordsperPage,SettingsXML,Active,InactiveCode,DateCreated,DateModified
					FROM client  
					WHERE ClientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClientID#" /> 
				</cfquery>		
				<cfif qGetClient.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClientName = qGetClient.ClientName;
					variables.ClientDBA = qGetClient.ClientDBA;
					variables.FederalTaxID = qGetClient.FederalTaxID;
					variables.PinNumber = qGetClient.PinNumber;
					variables.GroupNumber = qGetClient.GroupNumber;
					variables.EntityID = qGetClient.EntityID;
					variables.ProviderID = qGetClient.ProviderID;
					variables.PreferredPayMethod = qGetClient.PreferredPayMethod;
					variables.SupportEmailID = qGetClient.SupportEmailID;
					variables.AdministratorEntityID = qGetClient.AdministratorEntityID;
					variables.MainPhoneID = qGetClient.MainPhoneID;
					variables.Logo = qGetClient.Logo;
					variables.RecordsperPage = qGetClient.RecordsperPage;
					variables.SettingsXML = qGetClient.SettingsXML;
					variables.Active = qGetClient.Active;
					variables.InactiveCode = qGetClient.InactiveCode;
					variables.DateModified = qGetClient.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "ClientName")><cfset variables.ClientName = stValues.ClientName /></cfif>
			<cfif StructKeyExists(stValues, "ClientDBA")><cfset variables.ClientDBA = stValues.ClientDBA /></cfif>
			<cfif StructKeyExists(stValues, "FederalTaxID")><cfset variables.FederalTaxID = stValues.FederalTaxID /></cfif>
			<cfif StructKeyExists(stValues, "PinNumber")><cfset variables.PinNumber = stValues.PinNumber /></cfif>
			<cfif StructKeyExists(stValues, "GroupNumber")><cfset variables.GroupNumber = stValues.GroupNumber /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "ProviderID")><cfset variables.ProviderID = stValues.ProviderID /></cfif>
			<cfif StructKeyExists(stValues, "PreferredPayMethod")><cfset variables.PreferredPayMethod = stValues.PreferredPayMethod /></cfif>
			<cfif StructKeyExists(stValues, "SupportEmailID")><cfset variables.SupportEmailID = stValues.SupportEmailID /></cfif>
			<cfif StructKeyExists(stValues, "AdministratorEntityID")><cfset variables.AdministratorEntityID = stValues.AdministratorEntityID /></cfif>
			<cfif StructKeyExists(stValues, "MainPhoneID")><cfset variables.MainPhoneID = stValues.MainPhoneID /></cfif>
			<cfif StructKeyExists(stValues, "Logo")><cfset variables.Logo = stValues.Logo /></cfif>
			<cfif StructKeyExists(stValues, "RecordsperPage")><cfset variables.RecordsperPage = stValues.RecordsperPage /></cfif>
			<cfif StructKeyExists(stValues, "SettingsXML")><cfset variables.SettingsXML = stValues.SettingsXML /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientName.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientName" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientName>
	</cffunction>
	
	<cffunction name="setClientName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientName" required="true" type="any" />
			
		<cfset variables.ClientName = arguments.ClientName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientDBA.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientDBA" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientDBA>
	</cffunction>
	
	<cffunction name="setClientDBA" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientDBA" required="true" type="any" />
			
		<cfset variables.ClientDBA = arguments.ClientDBA />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientDBA") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FederalTaxID.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFederalTaxID" acess="public" output="false" returntype="any">
		<cfreturn variables.FederalTaxID>
	</cffunction>
	
	<cffunction name="setFederalTaxID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FederalTaxID" required="true" type="any" />
			
		<cfset variables.FederalTaxID = arguments.FederalTaxID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FederalTaxID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PinNumber.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPinNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.PinNumber>
	</cffunction>
	
	<cffunction name="setPinNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PinNumber" required="true" type="any" />
			
		<cfset variables.PinNumber = arguments.PinNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PinNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for GroupNumber.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getGroupNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.GroupNumber>
	</cffunction>
	
	<cffunction name="setGroupNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="GroupNumber" required="true" type="any" />
			
		<cfset variables.GroupNumber = arguments.GroupNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "GroupNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProviderID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProviderID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProviderID>
	</cffunction>
	
	<cffunction name="setProviderID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProviderID" required="true" type="any" />
			
		<cfset variables.ProviderID = arguments.ProviderID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProviderID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PreferredPayMethod.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPreferredPayMethod" acess="public" output="false" returntype="any">
		<cfreturn variables.PreferredPayMethod>
	</cffunction>
	
	<cffunction name="setPreferredPayMethod" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PreferredPayMethod" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PreferredPayMethod)) OR trim(arguments.PreferredPayMethod) EQ "">
			<cfset variables.PreferredPayMethod = arguments.PreferredPayMethod />
		<cfelse>
			<cfthrow message="PreferredPayMethod (#arguments.PreferredPayMethod#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PreferredPayMethod") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SupportEmailID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSupportEmailID" acess="public" output="false" returntype="any">
		<cfreturn variables.SupportEmailID>
	</cffunction>
	
	<cffunction name="setSupportEmailID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SupportEmailID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SupportEmailID)) OR trim(arguments.SupportEmailID) EQ "">
			<cfset variables.SupportEmailID = arguments.SupportEmailID />
		<cfelse>
			<cfthrow message="SupportEmailID (#arguments.SupportEmailID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SupportEmailID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AdministratorEntityID.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAdministratorEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.AdministratorEntityID>
	</cffunction>
	
	<cffunction name="setAdministratorEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AdministratorEntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AdministratorEntityID)) OR trim(arguments.AdministratorEntityID) EQ "">
			<cfset variables.AdministratorEntityID = arguments.AdministratorEntityID />
		<cfelse>
			<cfthrow message="AdministratorEntityID (#arguments.AdministratorEntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AdministratorEntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MainPhoneID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMainPhoneID" acess="public" output="false" returntype="any">
		<cfreturn variables.MainPhoneID>
	</cffunction>
	
	<cffunction name="setMainPhoneID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MainPhoneID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MainPhoneID)) OR trim(arguments.MainPhoneID) EQ "">
			<cfset variables.MainPhoneID = arguments.MainPhoneID />
		<cfelse>
			<cfthrow message="MainPhoneID (#arguments.MainPhoneID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MainPhoneID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Logo.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLogo" acess="public" output="false" returntype="any">
		<cfreturn variables.Logo>
	</cffunction>
	
	<cffunction name="setLogo" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Logo" required="true" type="any" />
			
		<cfset variables.Logo = arguments.Logo />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Logo") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RecordsperPage.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRecordsperPage" acess="public" output="false" returntype="any">
		<cfreturn variables.RecordsperPage>
	</cffunction>
	
	<cffunction name="setRecordsperPage" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RecordsperPage" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RecordsperPage)) OR trim(arguments.RecordsperPage) EQ "">
			<cfset variables.RecordsperPage = arguments.RecordsperPage />
		<cfelse>
			<cfthrow message="RecordsperPage (#arguments.RecordsperPage#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RecordsperPage") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SettingsXML.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSettingsXML" acess="public" output="false" returntype="any">
		<cfreturn variables.SettingsXML>
	</cffunction>
	
	<cffunction name="setSettingsXML" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SettingsXML" required="true" type="any" />
			
		<cfset variables.SettingsXML = arguments.SettingsXML />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SettingsXML") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!-------------------------------------------------------------------------------------->
	<!--- This function will get the clients available users.                            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="ClientExists" output="false" returntype="boolean">		
		
		<cfargument name="ds" required="yes" type="string">
		<cfargument name="ClientName" required="yes" type="string">
													
		<cftry>		
					
			<!-------------------------------------------------------------------------------------->
			<!--- Start by checking to see if the client name is not taken.                      --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="checkExistsClient" datasource="#trim(arguments.ds)#">
				SELECT clientID
				FROM client  
				WHERE lower(ClientName) = '#LCase(trim(arguments.clientName))#'
			</cfquery>
			
			<cfif checkExistsClient.RecordCount GTE 1>
				<cfreturn true>
			<cfelse>
				<cfreturn false>
			</cfif>
			
			<cfcatch type="Any">
			
				<cfthrow message="Caught an exception, type = #CFCATCH.TYPE# message = #cfcatch.message# detail = #cfcatch.detail#"> 
							
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will crete the new Client database                               --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="CreateClientDB" output="false" returntype="boolean">		
			
		<cfargument name="ds" required="yes" type="string">	
															
		<cftry>		
							
			<cfset serverName = "EOB">
					
			<cfquery name="createDB" datasource="pa_master">		
				RESTORE DATABASE #trim(arguments.ds)#
			   	FROM PAClient_MASTER
			   	WITH RECOVERY,
			   	MOVE 'PAClient_MASTER_data' TO 'C:\Program Files\Microsoft SQL Server\MSSQL$#trim(serverName)#\Data\#trim(arguments.ds)#_data.mdf', 
			   	MOVE 'PAClient_MASTER_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL$#trim(serverName)#\Data\#trim(arguments.ds)#_log.ldf'					
			</cfquery>		
			
			<cfreturn true>
			
			<cfcatch type="Any">
							
				<cfthrow message="Caught an exception, type = #CFCATCH.TYPE# message = #cfcatch.message# detail = #cfcatch.detail#"> 
				
			</cfcatch>
						
		</cftry>
		
	</cffunction>		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will crete the new Client CF datasource                          --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="CreateClientCFDatasource" output="false" returntype="boolean">		
		
		<cfargument name="ds" required="yes" type="string">
															
		<cftry>		

			<cfscript>
			   adminObj = createObject("component","cfide.adminapi.administrator");
			   adminObj.login("eobmanagernet");
			  
			   myObj = createObject("component","cfide.adminapi.datasource");   
			   myObj.setMSSQL(driver="MSSQLServer", 
			      name="#trim(arguments.ds)#", host = "127.0.0.1", port = "1433",
			      database = "#trim(arguments.ds)#", username = "eobmanager", password="eobmanagernet", login_timeout = "30",
				  timeout = "20", interval = 7, buffer = "64000", blob_buffer = "64000", setStringParameterAsUnicode = "false",
			      description = "", pooling = true, maxpooledstatements = 1000, enableMaxConnections = "true",
			      maxConnections = "300", enable_clob = true, enable_blob = true, disable = false, storedProc = true,
			      alter = false, grant = true, select = true, update = true, create = true, delete = true, drop = false, 
				  revoke = false );
			</cfscript>	
						
			<cfreturn true>
			
			<cfcatch type="Any">
							
				<cfthrow message="Caught an exception, type = #CFCATCH.TYPE# message = #cfcatch.message# detail = #cfcatch.detail#"> 
				
			</cfcatch>
						
		</cftry>
		
	</cffunction>
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>



