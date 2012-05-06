 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_ProviderBean" />
		
		<cfset var qCreateEOB_Provider = "" />		
		
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localProviderName = arguments.bean.getProviderName() />
		<cfset var localProviderMainAddressID = arguments.bean.getProviderMainAddressID() />
		<cfset var localProviderMainPhoneID = arguments.bean.getProviderMainPhoneID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_Provider" datasource="#trim(arguments.ds)#">
				INSERT INTO EOB_Provider (ProviderID,ProviderName,ProviderMainAddressID,ProviderMainPhoneID,Active,InactiveCode)
				VALUES (	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localProviderName) NEQ "" AND trim(localProviderName) NEQ "@@" AND trim(localProviderName) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localProviderMainAddressID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localProviderMainPhoneID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS recordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setrecordID(qCreateEOB_Provider.recordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_ProviderBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_Provider = "" />		
		
		<cfset qGetEOB_Provider = getEOB_Provider(trim(arguments.ds), trim(EOB_ProviderID)) />
				
		<cfif qGetEOB_Provider.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEOB_Provider = createObject("component", "EOB_ProviderBean").init(arguments.ds);
			objEOB_Provider.setrecordID(qGetEOB_Provider.recordID);
			objEOB_Provider.setProviderID(qGetEOB_Provider.ProviderID);
			objEOB_Provider.setProviderName(qGetEOB_Provider.ProviderName);
			objEOB_Provider.setProviderMainAddressID(qGetEOB_Provider.ProviderMainAddressID);
			objEOB_Provider.setProviderMainPhoneID(qGetEOB_Provider.ProviderMainPhoneID);
			objEOB_Provider.setActive(qGetEOB_Provider.Active);
			objEOB_Provider.setInactiveCode(qGetEOB_Provider.InactiveCode);
			objEOB_Provider.setDateCreated(qGetEOB_Provider.DateCreated);
			objEOB_Provider.setDateModified(qGetEOB_Provider.DateModified);				
			return objEOB_Provider;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_ProviderBean" />
		<cfset var qUpdateEOB_Provider = "" />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localProviderName = arguments.bean.getProviderName() />
		<cfset var localProviderMainAddressID = arguments.bean.getProviderMainAddressID() />
		<cfset var localProviderMainPhoneID = arguments.bean.getProviderMainPhoneID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_Provider" datasource="#trim(arguments.ds)#">
				UPDATE EOB_Provider  SET
					
					ProviderID =	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ProviderName =	
					<cfif trim(localProviderName) NEQ "" AND trim(localProviderName) NEQ "@@" AND trim(localProviderName) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ProviderMainAddressID =						
						<cfqueryparam value="#trim(localProviderMainAddressID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ProviderMainPhoneID =						
						<cfqueryparam value="#trim(localProviderMainPhoneID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE recordID = <cfqueryparam value="#trim(arguments.bean.getrecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_ProviderBean" />
		<cfset var qDeleteEOB_Provider = "">

		<cfquery name="qDeleteEOB_Provider" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EOB_Provider
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getrecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_Provider" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EOB_ProviderID" required="yes" type="numeric" />		
		<cfset var qGetEOB_Provider = "" />		
	
		<cfquery name="qGetEOB_Provider" datasource="#trim(arguments.ds)#">
	  		SELECT recordID,ProviderID,ProviderName,ProviderMainAddressID,ProviderMainPhoneID,Active,InactiveCode,DateCreated,DateModified
			FROM EOB_Provider  
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_Provider>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


