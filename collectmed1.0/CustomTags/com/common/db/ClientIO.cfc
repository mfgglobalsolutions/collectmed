
<cfcomponent name="ClientIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.ClientID = "NULL";
			variables.instance.ClientName = "";
			variables.instance.ClientDBA = "";
			variables.instance.FederalTaxID = "";
			variables.instance.PinNumber = "";
			variables.instance.GroupNumber = "";
			variables.instance.EntityID = "NULL";
			variables.instance.ProviderID = "";
			variables.instance.PreferredPayMethod = "NULL";
			variables.instance.SupportEmailID = "NULL";
			variables.instance.AdministratorEntityID = "NULL";
			variables.instance.MainPhoneID = "NULL";
			variables.instance.Logo = "";
			variables.instance.RecordsperPage = "NULL";
			variables.instance.SettingsXML = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 19)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTNAME", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTDBA", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEDERALTAXID", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PINNUMBER", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "GROUPNUMBER", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTITYID", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROVIDERID", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PREFERREDPAYMETHOD", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SUPPORTEMAILID", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ADMINISTRATORENTITYID", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MAINPHONEID", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LOGO", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RECORDSPERPAGE", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "25", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SETTINGSXML", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 19)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientName.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientName>
	</cffunction>
	 
	<cffunction name="setClientName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientName" required="Yes" type="String">
		
		<cfif ClientName NEQ "NULL">	
			
			<cfif arguments.ClientName EQ "@@" OR arguments.ClientName EQ "">
				
				<cfset arguments.ClientName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientName</strong> (#ClientName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientName) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientName</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientName = arguments.ClientName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientDBA.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientDBA" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientDBA>
	</cffunction>
	 
	<cffunction name="setClientDBA" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientDBA" required="Yes" type="String">
		
		<cfif ClientDBA NEQ "NULL">	
			
			<cfif arguments.ClientDBA EQ "@@" OR arguments.ClientDBA EQ "">
				
				<cfset arguments.ClientDBA = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientDBA)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientDBA</strong> (#ClientDBA#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientDBA) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientDBA</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientDBA = arguments.ClientDBA>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientDBA")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FederalTaxID.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFederalTaxID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FederalTaxID>
	</cffunction>
	 
	<cffunction name="setFederalTaxID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FederalTaxID" required="Yes" type="String">
		
		<cfif FederalTaxID NEQ "NULL">	
			
			<cfif arguments.FederalTaxID EQ "@@" OR arguments.FederalTaxID EQ "">
				
				<cfset arguments.FederalTaxID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FederalTaxID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FederalTaxID</strong> (#FederalTaxID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FederalTaxID) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FederalTaxID</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FederalTaxID = arguments.FederalTaxID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FederalTaxID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PinNumber.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPinNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PinNumber>
	</cffunction>
	 
	<cffunction name="setPinNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PinNumber" required="Yes" type="String">
		
		<cfif PinNumber NEQ "NULL">	
			
			<cfif arguments.PinNumber EQ "@@" OR arguments.PinNumber EQ "">
				
				<cfset arguments.PinNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PinNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PinNumber</strong> (#PinNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PinNumber) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PinNumber</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PinNumber = arguments.PinNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PinNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for GroupNumber.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getGroupNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.GroupNumber>
	</cffunction>
	 
	<cffunction name="setGroupNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="GroupNumber" required="Yes" type="String">
		
		<cfif GroupNumber NEQ "NULL">	
			
			<cfif arguments.GroupNumber EQ "@@" OR arguments.GroupNumber EQ "">
				
				<cfset arguments.GroupNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(GroupNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>GroupNumber</strong> (#GroupNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(GroupNumber) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>GroupNumber</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.GroupNumber = arguments.GroupNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "GroupNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntityID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntityID>
	</cffunction>
	 
	<cffunction name="setEntityID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntityID" required="Yes" type="String">
		
		<cfif EntityID NEQ "NULL">	
			
			<cfif arguments.EntityID EQ "@@" OR arguments.EntityID EQ "">
				
				<cfset arguments.EntityID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EntityID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntityID</strong> (#EntityID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntityID = arguments.EntityID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EntityID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ProviderID.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProviderID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ProviderID>
	</cffunction>
	 
	<cffunction name="setProviderID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ProviderID" required="Yes" type="String">
		
		<cfif ProviderID NEQ "NULL">	
			
			<cfif arguments.ProviderID EQ "@@" OR arguments.ProviderID EQ "">
				
				<cfset arguments.ProviderID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ProviderID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ProviderID</strong> (#ProviderID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ProviderID) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ProviderID</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ProviderID = arguments.ProviderID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ProviderID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PreferredPayMethod.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPreferredPayMethod" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PreferredPayMethod>
	</cffunction>
	 
	<cffunction name="setPreferredPayMethod" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PreferredPayMethod" required="Yes" type="String">
		
		<cfif PreferredPayMethod NEQ "NULL">	
			
			<cfif arguments.PreferredPayMethod EQ "@@" OR arguments.PreferredPayMethod EQ "">
				
				<cfset arguments.PreferredPayMethod = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PreferredPayMethod)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PreferredPayMethod</strong> (#PreferredPayMethod#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PreferredPayMethod = arguments.PreferredPayMethod>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PreferredPayMethod")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SupportEmailID.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSupportEmailID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SupportEmailID>
	</cffunction>
	 
	<cffunction name="setSupportEmailID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SupportEmailID" required="Yes" type="String">
		
		<cfif SupportEmailID NEQ "NULL">	
			
			<cfif arguments.SupportEmailID EQ "@@" OR arguments.SupportEmailID EQ "">
				
				<cfset arguments.SupportEmailID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(SupportEmailID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SupportEmailID</strong> (#SupportEmailID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SupportEmailID = arguments.SupportEmailID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SupportEmailID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AdministratorEntityID.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAdministratorEntityID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AdministratorEntityID>
	</cffunction>
	 
	<cffunction name="setAdministratorEntityID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AdministratorEntityID" required="Yes" type="String">
		
		<cfif AdministratorEntityID NEQ "NULL">	
			
			<cfif arguments.AdministratorEntityID EQ "@@" OR arguments.AdministratorEntityID EQ "">
				
				<cfset arguments.AdministratorEntityID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AdministratorEntityID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AdministratorEntityID</strong> (#AdministratorEntityID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AdministratorEntityID = arguments.AdministratorEntityID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AdministratorEntityID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MainPhoneID.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMainPhoneID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MainPhoneID>
	</cffunction>
	 
	<cffunction name="setMainPhoneID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MainPhoneID" required="Yes" type="String">
		
		<cfif MainPhoneID NEQ "NULL">	
			
			<cfif arguments.MainPhoneID EQ "@@" OR arguments.MainPhoneID EQ "">
				
				<cfset arguments.MainPhoneID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(MainPhoneID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MainPhoneID</strong> (#MainPhoneID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MainPhoneID = arguments.MainPhoneID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MainPhoneID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Logo.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLogo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Logo>
	</cffunction>
	 
	<cffunction name="setLogo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Logo" required="Yes" type="String">
		
		<cfif Logo NEQ "NULL">	
			
			<cfif arguments.Logo EQ "@@" OR arguments.Logo EQ "">
				
				<cfset arguments.Logo = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Logo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Logo</strong> (#Logo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Logo) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Logo</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Logo = arguments.Logo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Logo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RecordsperPage.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRecordsperPage" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RecordsperPage>
	</cffunction>
	 
	<cffunction name="setRecordsperPage" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RecordsperPage" required="Yes" type="String">
		
		<cfif RecordsperPage NEQ "NULL">	
			
			<cfif arguments.RecordsperPage EQ "@@" OR arguments.RecordsperPage EQ "">
				
				<cfset arguments.RecordsperPage = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(RecordsperPage)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RecordsperPage</strong> (#RecordsperPage#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RecordsperPage = arguments.RecordsperPage>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RecordsperPage")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SettingsXML.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSettingsXML" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SettingsXML>
	</cffunction>
	 
	<cffunction name="setSettingsXML" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SettingsXML" required="Yes" type="String">
		
		<cfif SettingsXML NEQ "NULL">	
			
			<cfif arguments.SettingsXML EQ "@@" OR arguments.SettingsXML EQ "">
				
				<cfset arguments.SettingsXML = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SettingsXML)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SettingsXML</strong> (#SettingsXML#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SettingsXML) GT 8000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SettingsXML</strong> cannot be greater than 8000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SettingsXML = arguments.SettingsXML>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SettingsXML")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="ClientName" required="No" type="String" default="">
		<cfargument name="ClientDBA" required="No" type="String" default="">
		<cfargument name="FederalTaxID" required="No" type="String" default="">
		<cfargument name="PinNumber" required="No" type="String" default="">
		<cfargument name="GroupNumber" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="ProviderID" required="No" type="String" default="">
		<cfargument name="PreferredPayMethod" required="No" type="String" default="">
		<cfargument name="SupportEmailID" required="No" type="String" default="">
		<cfargument name="AdministratorEntityID" required="No" type="String" default="">
		<cfargument name="MainPhoneID" required="No" type="String" default="">
		<cfargument name="Logo" required="No" type="String" default="">
		<cfargument name="RecordsperPage" required="No" type="String" default="">
		<cfargument name="SettingsXML" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.ClientName = arguments.ClientName>
		<cfset variables.instance.ClientDBA = arguments.ClientDBA>
		<cfset variables.instance.FederalTaxID = arguments.FederalTaxID>
		<cfset variables.instance.PinNumber = arguments.PinNumber>
		<cfset variables.instance.GroupNumber = arguments.GroupNumber>
		<cfset variables.instance.EntityID = arguments.EntityID>
		<cfset variables.instance.ProviderID = arguments.ProviderID>
		<cfset variables.instance.PreferredPayMethod = arguments.PreferredPayMethod>
		<cfset variables.instance.SupportEmailID = arguments.SupportEmailID>
		<cfset variables.instance.AdministratorEntityID = arguments.AdministratorEntityID>
		<cfset variables.instance.MainPhoneID = arguments.MainPhoneID>
		<cfset variables.instance.Logo = arguments.Logo>
		<cfset variables.instance.RecordsperPage = arguments.RecordsperPage>
		<cfset variables.instance.SettingsXML = arguments.SettingsXML>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitClientIO" access="public" returntype="ClientIO" output="No">
		
		<cfargument name="ClientID" required="yes" type="numeric">		
		<cfset var qGetClient = "">
		
		<cfset preInit(ClientID)>
	
		<cfquery name="qGetClient" datasource="pa_master">
	  		SELECT ClientID,ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,EntityID,ProviderID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo,RecordsperPage,SettingsXML,Active,InactiveCode,DateCreated,DateModified
			FROM client  
			WHERE ClientID = #trim(arguments.ClientID)# 
		</cfquery>
		
		<cfif qGetClient.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetClient.ClientID EQ "" OR qGetClient.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetClient.ClientID;
							
				variables.instance.ClientName = qGetClient.ClientName;
							
				variables.instance.ClientDBA = qGetClient.ClientDBA;
							
				variables.instance.FederalTaxID = qGetClient.FederalTaxID;
							
				variables.instance.PinNumber = qGetClient.PinNumber;
							
				variables.instance.GroupNumber = qGetClient.GroupNumber;
				
			IF(qGetClient.EntityID EQ "" OR qGetClient.EntityID EQ "NULL") 
				variables.instance.EntityID = "NULL"; 
			ELSE 
				variables.instance.EntityID = qGetClient.EntityID;
							
				variables.instance.ProviderID = qGetClient.ProviderID;
				
			IF(qGetClient.PreferredPayMethod EQ "" OR qGetClient.PreferredPayMethod EQ "NULL") 
				variables.instance.PreferredPayMethod = "NULL"; 
			ELSE 
				variables.instance.PreferredPayMethod = qGetClient.PreferredPayMethod;
				
			IF(qGetClient.SupportEmailID EQ "" OR qGetClient.SupportEmailID EQ "NULL") 
				variables.instance.SupportEmailID = "NULL"; 
			ELSE 
				variables.instance.SupportEmailID = qGetClient.SupportEmailID;
				
			IF(qGetClient.AdministratorEntityID EQ "" OR qGetClient.AdministratorEntityID EQ "NULL") 
				variables.instance.AdministratorEntityID = "NULL"; 
			ELSE 
				variables.instance.AdministratorEntityID = qGetClient.AdministratorEntityID;
				
			IF(qGetClient.MainPhoneID EQ "" OR qGetClient.MainPhoneID EQ "NULL") 
				variables.instance.MainPhoneID = "NULL"; 
			ELSE 
				variables.instance.MainPhoneID = qGetClient.MainPhoneID;
							
				variables.instance.Logo = qGetClient.Logo;
				
			IF(qGetClient.RecordsperPage EQ "" OR qGetClient.RecordsperPage EQ "NULL") 
				variables.instance.RecordsperPage = "NULL"; 
			ELSE 
				variables.instance.RecordsperPage = qGetClient.RecordsperPage;
							
				variables.instance.SettingsXML = qGetClient.SettingsXML;
							
				variables.instance.Active = qGetClient.Active;
				
			IF(qGetClient.InactiveCode EQ "" OR qGetClient.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetClient.InactiveCode;
							
				variables.instance.DateCreated = qGetClient.DateCreated;
							
				variables.instance.DateModified = qGetClient.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(ClientID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitClient = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.ClientID) AND variables.instance.ClientID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitClient" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitClient" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.ClientID = qInsertCommitClient.ClientID>
				
				<cfreturn qInsertCommitClient.ClientID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "ClientID,ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,EntityID,ProviderID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo,RecordsperPage,SettingsXML,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,ProviderID,Logo,SettingsXML,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE Client  SET #columnsToUpdate# WHERE ClientID = #trim(variables.instance.ClientID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,ProviderID,Logo,SettingsXML,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,EntityID,ProviderID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo,RecordsperPage,SettingsXML,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO client  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS ClientID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getClientQuery">						
		<cfargument name="Fields" required="No" type="String" default="ClientID,ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,EntityID,ProviderID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo,RecordsperPage,SettingsXML,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientName" required="No" type="String" default="">
		<cfargument name="ClientName_IN" required="No" type="String" default="">
		<cfargument name="ClientName_LIKE" required="No" type="String" default="">
		<cfargument name="ClientDBA" required="No" type="String" default="">
		<cfargument name="ClientDBA_IN" required="No" type="String" default="">
		<cfargument name="ClientDBA_LIKE" required="No" type="String" default="">
		<cfargument name="FederalTaxID" required="No" type="String" default="">
		<cfargument name="FederalTaxID_IN" required="No" type="String" default="">
		<cfargument name="FederalTaxID_LIKE" required="No" type="String" default="">
		<cfargument name="PinNumber" required="No" type="String" default="">
		<cfargument name="PinNumber_IN" required="No" type="String" default="">
		<cfargument name="PinNumber_LIKE" required="No" type="String" default="">
		<cfargument name="GroupNumber" required="No" type="String" default="">
		<cfargument name="GroupNumber_IN" required="No" type="String" default="">
		<cfargument name="GroupNumber_LIKE" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="EntityID_IN" required="No" type="String" default="">
		<cfargument name="EntityID_LIKE" required="No" type="String" default="">
		<cfargument name="ProviderID" required="No" type="String" default="">
		<cfargument name="ProviderID_IN" required="No" type="String" default="">
		<cfargument name="ProviderID_LIKE" required="No" type="String" default="">
		<cfargument name="PreferredPayMethod" required="No" type="String" default="">
		<cfargument name="PreferredPayMethod_IN" required="No" type="String" default="">
		<cfargument name="PreferredPayMethod_LIKE" required="No" type="String" default="">
		<cfargument name="SupportEmailID" required="No" type="String" default="">
		<cfargument name="SupportEmailID_IN" required="No" type="String" default="">
		<cfargument name="SupportEmailID_LIKE" required="No" type="String" default="">
		<cfargument name="AdministratorEntityID" required="No" type="String" default="">
		<cfargument name="AdministratorEntityID_IN" required="No" type="String" default="">
		<cfargument name="AdministratorEntityID_LIKE" required="No" type="String" default="">
		<cfargument name="MainPhoneID" required="No" type="String" default="">
		<cfargument name="MainPhoneID_IN" required="No" type="String" default="">
		<cfargument name="MainPhoneID_LIKE" required="No" type="String" default="">
		<cfargument name="Logo" required="No" type="String" default="">
		<cfargument name="Logo_IN" required="No" type="String" default="">
		<cfargument name="Logo_LIKE" required="No" type="String" default="">
		<cfargument name="RecordsperPage" required="No" type="String" default="">
		<cfargument name="RecordsperPage_IN" required="No" type="String" default="">
		<cfargument name="RecordsperPage_LIKE" required="No" type="String" default="">
		<cfargument name="SettingsXML" required="No" type="String" default="">
		<cfargument name="SettingsXML_IN" required="No" type="String" default="">
		<cfargument name="SettingsXML_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "ClientID,ClientID_IN,ClientID_LIKE,ClientName,ClientName_IN,ClientName_LIKE,ClientDBA,ClientDBA_IN,ClientDBA_LIKE,FederalTaxID,FederalTaxID_IN,FederalTaxID_LIKE,PinNumber,PinNumber_IN,PinNumber_LIKE,GroupNumber,GroupNumber_IN,GroupNumber_LIKE,EntityID,EntityID_IN,EntityID_LIKE,ProviderID,ProviderID_IN,ProviderID_LIKE,PreferredPayMethod,PreferredPayMethod_IN,PreferredPayMethod_LIKE,SupportEmailID,SupportEmailID_IN,SupportEmailID_LIKE,AdministratorEntityID,AdministratorEntityID_IN,AdministratorEntityID_LIKE,MainPhoneID,MainPhoneID_IN,MainPhoneID_LIKE,Logo,Logo_IN,Logo_LIKE,RecordsperPage,RecordsperPage_IN,RecordsperPage_LIKE,SettingsXML,SettingsXML_IN,SettingsXML_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Client"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getClientQuery" datasource="pa_master">
				SELECT #trim(Fields)#
				FROM client   
				WHERE 1=1
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif ClientName NEQ "">AND ClientName = '#ClientName#'</cfif>
					<cfif ClientName_IN NEQ "">AND ClientName IN(#trim(ClientName_IN)#)</cfif>
					<cfif ClientName_LIKE NEQ "">AND ClientName LIKE '%#trim(ClientName_LIKE)#%'</cfif>
					<cfif ClientDBA NEQ "">AND ClientDBA = '#ClientDBA#'</cfif>
					<cfif ClientDBA_IN NEQ "">AND ClientDBA IN(#trim(ClientDBA_IN)#)</cfif>
					<cfif ClientDBA_LIKE NEQ "">AND ClientDBA LIKE '%#trim(ClientDBA_LIKE)#%'</cfif>
					<cfif FederalTaxID NEQ "">AND FederalTaxID = '#FederalTaxID#'</cfif>
					<cfif FederalTaxID_IN NEQ "">AND FederalTaxID IN(#trim(FederalTaxID_IN)#)</cfif>
					<cfif FederalTaxID_LIKE NEQ "">AND FederalTaxID LIKE '%#trim(FederalTaxID_LIKE)#%'</cfif>
					<cfif PinNumber NEQ "">AND PinNumber = '#PinNumber#'</cfif>
					<cfif PinNumber_IN NEQ "">AND PinNumber IN(#trim(PinNumber_IN)#)</cfif>
					<cfif PinNumber_LIKE NEQ "">AND PinNumber LIKE '%#trim(PinNumber_LIKE)#%'</cfif>
					<cfif GroupNumber NEQ "">AND GroupNumber = '#GroupNumber#'</cfif>
					<cfif GroupNumber_IN NEQ "">AND GroupNumber IN(#trim(GroupNumber_IN)#)</cfif>
					<cfif GroupNumber_LIKE NEQ "">AND GroupNumber LIKE '%#trim(GroupNumber_LIKE)#%'</cfif>
					<cfif EntityID NEQ "" AND IsNumeric(EntityID)>AND EntityID = #EntityID#</cfif>
					<cfif EntityID_IN NEQ "">AND EntityID IN(#trim(EntityID_IN)#)</cfif>
					<cfif EntityID_LIKE NEQ "">AND EntityID LIKE '%#trim(EntityID_LIKE)#%'</cfif>
					<cfif ProviderID NEQ "">AND ProviderID = '#ProviderID#'</cfif>
					<cfif ProviderID_IN NEQ "">AND ProviderID IN(#trim(ProviderID_IN)#)</cfif>
					<cfif ProviderID_LIKE NEQ "">AND ProviderID LIKE '%#trim(ProviderID_LIKE)#%'</cfif>
					<cfif PreferredPayMethod NEQ "" AND IsNumeric(PreferredPayMethod)>AND PreferredPayMethod = #PreferredPayMethod#</cfif>
					<cfif PreferredPayMethod_IN NEQ "">AND PreferredPayMethod IN(#trim(PreferredPayMethod_IN)#)</cfif>
					<cfif PreferredPayMethod_LIKE NEQ "">AND PreferredPayMethod LIKE '%#trim(PreferredPayMethod_LIKE)#%'</cfif>
					<cfif SupportEmailID NEQ "" AND IsNumeric(SupportEmailID)>AND SupportEmailID = #SupportEmailID#</cfif>
					<cfif SupportEmailID_IN NEQ "">AND SupportEmailID IN(#trim(SupportEmailID_IN)#)</cfif>
					<cfif SupportEmailID_LIKE NEQ "">AND SupportEmailID LIKE '%#trim(SupportEmailID_LIKE)#%'</cfif>
					<cfif AdministratorEntityID NEQ "" AND IsNumeric(AdministratorEntityID)>AND AdministratorEntityID = #AdministratorEntityID#</cfif>
					<cfif AdministratorEntityID_IN NEQ "">AND AdministratorEntityID IN(#trim(AdministratorEntityID_IN)#)</cfif>
					<cfif AdministratorEntityID_LIKE NEQ "">AND AdministratorEntityID LIKE '%#trim(AdministratorEntityID_LIKE)#%'</cfif>
					<cfif MainPhoneID NEQ "" AND IsNumeric(MainPhoneID)>AND MainPhoneID = #MainPhoneID#</cfif>
					<cfif MainPhoneID_IN NEQ "">AND MainPhoneID IN(#trim(MainPhoneID_IN)#)</cfif>
					<cfif MainPhoneID_LIKE NEQ "">AND MainPhoneID LIKE '%#trim(MainPhoneID_LIKE)#%'</cfif>
					<cfif Logo NEQ "">AND Logo = '#Logo#'</cfif>
					<cfif Logo_IN NEQ "">AND Logo IN(#trim(Logo_IN)#)</cfif>
					<cfif Logo_LIKE NEQ "">AND Logo LIKE '%#trim(Logo_LIKE)#%'</cfif>
					<cfif RecordsperPage NEQ "" AND IsNumeric(RecordsperPage)>AND RecordsperPage = #RecordsperPage#</cfif>
					<cfif RecordsperPage_IN NEQ "">AND RecordsperPage IN(#trim(RecordsperPage_IN)#)</cfif>
					<cfif RecordsperPage_LIKE NEQ "">AND RecordsperPage LIKE '%#trim(RecordsperPage_LIKE)#%'</cfif>
					<cfif SettingsXML NEQ "">AND SettingsXML = '#SettingsXML#'</cfif>
					<cfif SettingsXML_IN NEQ "">AND SettingsXML IN(#trim(SettingsXML_IN)#)</cfif>
					<cfif SettingsXML_LIKE NEQ "">AND SettingsXML LIKE '%#trim(SettingsXML_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getClientQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




