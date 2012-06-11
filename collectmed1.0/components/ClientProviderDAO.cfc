 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClientProviderBean" />
		
		<cfset var qCreateClientProvider = "" />		
		
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClientProvider" datasource="#trim(arguments.ds)#">
				INSERT INTO clientprovider (ClientID,ProviderID,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ClientProviderID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClientProviderID(qCreateClientProvider.ClientProviderID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ClientProviderBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClientProviderID" required="yes" type="numeric" />		
		<cfset var qGetClientProvider = "" />		
		
		<cfset qGetClientProvider = getClientProvider(trim(arguments.ds), trim(ClientProviderID)) />
				
		<cfif qGetClientProvider.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClientProvider = createObject("component", "ClientProviderBean").init(arguments.ds);
			objClientProvider.setClientProviderID(qGetClientProvider.ClientProviderID);
			objClientProvider.setClientID(qGetClientProvider.ClientID);
			objClientProvider.setProviderID(qGetClientProvider.ProviderID);
			objClientProvider.setActive(qGetClientProvider.Active);
			objClientProvider.setInactiveCode(qGetClientProvider.InactiveCode);
			objClientProvider.setDateCreated(qGetClientProvider.DateCreated);
			objClientProvider.setDateModified(qGetClientProvider.DateModified);				
			return objClientProvider;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClientProviderBean" />
		<cfset var qUpdateClientProvider = "" />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClientProvider" datasource="#trim(arguments.ds)#">
				UPDATE clientprovider  SET
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ProviderID =						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
				WHERE ClientProviderID = <cfqueryparam value="#trim(arguments.bean.getClientProviderID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClientProviderBean" />
		<cfset var qDeleteClientProvider = "">

		<cfquery name="qDeleteClientProvider" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM clientprovider
			WHERE ClientProviderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClientProviderID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientProvider" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClientProviderID" required="yes" type="numeric" />		
		<cfset var qGetClientProvider = "" />		
	
		<cfquery name="qGetClientProvider" datasource="#trim(arguments.ds)#">
	  		SELECT ClientProviderID,ClientID,ProviderID,Active,InactiveCode,DateCreated,DateModified
			FROM clientprovider  
			WHERE ClientProviderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClientProviderID)#" /> 
		</cfquery>
		
		<cfreturn qGetClientProvider>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





