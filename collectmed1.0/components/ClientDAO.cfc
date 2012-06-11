 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClientBean" />
		
		<cfset var qCreateClient = "" />		
		
		<cfset var localClientName = arguments.bean.getClientName() />
		<cfset var localClientDBA = arguments.bean.getClientDBA() />
		<cfset var localFederalTaxID = arguments.bean.getFederalTaxID() />
		<cfset var localPinNumber = arguments.bean.getPinNumber() />
		<cfset var localGroupNumber = arguments.bean.getGroupNumber() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localPreferredPayMethod = arguments.bean.getPreferredPayMethod() />
		<cfset var localSupportEmailID = arguments.bean.getSupportEmailID() />
		<cfset var localAdministratorEntityID = arguments.bean.getAdministratorEntityID() />
		<cfset var localMainPhoneID = arguments.bean.getMainPhoneID() />
		<cfset var localLogo = arguments.bean.getLogo() />
		<cfset var localRecordsperPage = arguments.bean.getRecordsperPage() />
		<cfset var localSettingsXML = arguments.bean.getSettingsXML() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClient" datasource="#trim(arguments.ds)#">
				INSERT INTO client (ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,EntityID,ProviderID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo,RecordsperPage,SettingsXML,Active,InactiveCode)
				VALUES (	
					<cfif trim(localClientName) NEQ "" AND trim(localClientName) NEQ "@@" AND trim(localClientName) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localClientDBA) NEQ "" AND trim(localClientDBA) NEQ "@@" AND trim(localClientDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientDBA)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFederalTaxID) NEQ "" AND trim(localFederalTaxID) NEQ "@@" AND trim(localFederalTaxID) NEQ "NULL">						
						<cfqueryparam value="#trim(localFederalTaxID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPinNumber) NEQ "" AND trim(localPinNumber) NEQ "@@" AND trim(localPinNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localPinNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localGroupNumber) NEQ "" AND trim(localGroupNumber) NEQ "@@" AND trim(localGroupNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localPreferredPayMethod))>						
						<cfqueryparam value="#trim(localPreferredPayMethod)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localSupportEmailID))>						
						<cfqueryparam value="#trim(localSupportEmailID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localAdministratorEntityID))>						
						<cfqueryparam value="#trim(localAdministratorEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMainPhoneID))>						
						<cfqueryparam value="#trim(localMainPhoneID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localLogo) NEQ "" AND trim(localLogo) NEQ "@@" AND trim(localLogo) NEQ "NULL">						
						<cfqueryparam value="#trim(localLogo)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localRecordsperPage))>						
						<cfqueryparam value="#trim(localRecordsperPage)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localSettingsXML) NEQ "" AND trim(localSettingsXML) NEQ "@@" AND trim(localSettingsXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localSettingsXML)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ClientID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClientID(qCreateClient.ClientID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ClientBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClientID" required="yes" type="numeric" />		
		<cfset var qGetClient = "" />		
		
		<cfset qGetClient = getClient(trim(arguments.ds), trim(ClientID)) />
				
		<cfif qGetClient.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClient = createObject("component", "ClientBean").init(arguments.ds);
			objClient.setClientID(qGetClient.ClientID);
			objClient.setClientName(qGetClient.ClientName);
			objClient.setClientDBA(qGetClient.ClientDBA);
			objClient.setFederalTaxID(qGetClient.FederalTaxID);
			objClient.setPinNumber(qGetClient.PinNumber);
			objClient.setGroupNumber(qGetClient.GroupNumber);
			objClient.setEntityID(qGetClient.EntityID);
			objClient.setProviderID(qGetClient.ProviderID);
			objClient.setPreferredPayMethod(qGetClient.PreferredPayMethod);
			objClient.setSupportEmailID(qGetClient.SupportEmailID);
			objClient.setAdministratorEntityID(qGetClient.AdministratorEntityID);
			objClient.setMainPhoneID(qGetClient.MainPhoneID);
			objClient.setLogo(qGetClient.Logo);
			objClient.setRecordsperPage(qGetClient.RecordsperPage);
			objClient.setSettingsXML(qGetClient.SettingsXML);
			objClient.setActive(qGetClient.Active);
			objClient.setInactiveCode(qGetClient.InactiveCode);
			objClient.setDateCreated(qGetClient.DateCreated);
			objClient.setDateModified(qGetClient.DateModified);				
			return objClient;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClientBean" />
		<cfset var qUpdateClient = "" />
		<cfset var localClientName = arguments.bean.getClientName() />
		<cfset var localClientDBA = arguments.bean.getClientDBA() />
		<cfset var localFederalTaxID = arguments.bean.getFederalTaxID() />
		<cfset var localPinNumber = arguments.bean.getPinNumber() />
		<cfset var localGroupNumber = arguments.bean.getGroupNumber() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localPreferredPayMethod = arguments.bean.getPreferredPayMethod() />
		<cfset var localSupportEmailID = arguments.bean.getSupportEmailID() />
		<cfset var localAdministratorEntityID = arguments.bean.getAdministratorEntityID() />
		<cfset var localMainPhoneID = arguments.bean.getMainPhoneID() />
		<cfset var localLogo = arguments.bean.getLogo() />
		<cfset var localRecordsperPage = arguments.bean.getRecordsperPage() />
		<cfset var localSettingsXML = arguments.bean.getSettingsXML() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClient" datasource="#trim(arguments.ds)#">
				UPDATE client  SET
					
					ClientName =	
					<cfif trim(localClientName) NEQ "" AND trim(localClientName) NEQ "@@" AND trim(localClientName) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientDBA =	
					<cfif trim(localClientDBA) NEQ "" AND trim(localClientDBA) NEQ "@@" AND trim(localClientDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientDBA)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FederalTaxID =	
					<cfif trim(localFederalTaxID) NEQ "" AND trim(localFederalTaxID) NEQ "@@" AND trim(localFederalTaxID) NEQ "NULL">						
						<cfqueryparam value="#trim(localFederalTaxID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PinNumber =	
					<cfif trim(localPinNumber) NEQ "" AND trim(localPinNumber) NEQ "@@" AND trim(localPinNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localPinNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					GroupNumber =	
					<cfif trim(localGroupNumber) NEQ "" AND trim(localGroupNumber) NEQ "@@" AND trim(localGroupNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntityID =				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ProviderID =	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PreferredPayMethod =				
					<cfif IsNumeric(trim(localPreferredPayMethod))>						
						<cfqueryparam value="#trim(localPreferredPayMethod)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					SupportEmailID =				
					<cfif IsNumeric(trim(localSupportEmailID))>						
						<cfqueryparam value="#trim(localSupportEmailID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AdministratorEntityID =				
					<cfif IsNumeric(trim(localAdministratorEntityID))>						
						<cfqueryparam value="#trim(localAdministratorEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MainPhoneID =				
					<cfif IsNumeric(trim(localMainPhoneID))>						
						<cfqueryparam value="#trim(localMainPhoneID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Logo =	
					<cfif trim(localLogo) NEQ "" AND trim(localLogo) NEQ "@@" AND trim(localLogo) NEQ "NULL">						
						<cfqueryparam value="#trim(localLogo)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					RecordsperPage =				
					<cfif IsNumeric(trim(localRecordsperPage))>						
						<cfqueryparam value="#trim(localRecordsperPage)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					SettingsXML =	
					<cfif trim(localSettingsXML) NEQ "" AND trim(localSettingsXML) NEQ "@@" AND trim(localSettingsXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localSettingsXML)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE ClientID = <cfqueryparam value="#trim(arguments.bean.getClientID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClientBean" />
		<cfset var qDeleteClient = "">

		<cfquery name="qDeleteClient" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM client
			WHERE ClientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClientID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClient" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClientID" required="yes" type="numeric" />		
		<cfset var qGetClient = "" />		
	
		<cfquery name="qGetClient" datasource="#trim(arguments.ds)#">
	  		SELECT ClientID,ClientName,ClientDBA,FederalTaxID,PinNumber,GroupNumber,EntityID,ProviderID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo,RecordsperPage,SettingsXML,Active,InactiveCode,DateCreated,DateModified
			FROM client  
			WHERE ClientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClientID)#" /> 
		</cfquery>
		
		<cfreturn qGetClient>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





