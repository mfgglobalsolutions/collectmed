 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersSessionBean" />
		
		<cfset var qCreateUsersSession = "" />		
		
		<cfset var localUsersSessionIdentification = arguments.bean.getUsersSessionIdentification() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localIPAddress = arguments.bean.getIPAddress() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateUsersSession" datasource="#trim(arguments.ds)#">
				INSERT INTO userssession (UsersSessionIdentification,UsersID,IPAddress,SiteID,Active,InactiveCode)
				VALUES (	
					<cfif trim(localUsersSessionIdentification) NEQ "" AND trim(localUsersSessionIdentification) NEQ "@@" AND trim(localUsersSessionIdentification) NEQ "NULL">						
						<cfqueryparam value="#trim(localUsersSessionIdentification)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localIPAddress) NEQ "" AND trim(localIPAddress) NEQ "@@" AND trim(localIPAddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPAddress)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS UsersSessionID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setUsersSessionID(qCreateUsersSession.UsersSessionID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="UsersSessionBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersSessionID" required="yes" type="numeric" />		
		<cfset var qGetUsersSession = "" />		
		
		<cfset qGetUsersSession = getUsersSession(trim(arguments.ds), trim(UsersSessionID)) />
				
		<cfif qGetUsersSession.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objUsersSession = createObject("component", "UsersSessionBean").init(arguments.ds);
			objUsersSession.setUsersSessionID(qGetUsersSession.UsersSessionID);
			objUsersSession.setUsersSessionIdentification(qGetUsersSession.UsersSessionIdentification);
			objUsersSession.setUsersID(qGetUsersSession.UsersID);
			objUsersSession.setIPAddress(qGetUsersSession.IPAddress);
			objUsersSession.setSiteID(qGetUsersSession.SiteID);
			objUsersSession.setActive(qGetUsersSession.Active);
			objUsersSession.setInactiveCode(qGetUsersSession.InactiveCode);
			objUsersSession.setDateCreated(qGetUsersSession.DateCreated);
			objUsersSession.setDateModified(qGetUsersSession.DateModified);				
			return objUsersSession;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersSessionBean" />
		<cfset var qUpdateUsersSession = "" />
		<cfset var localUsersSessionIdentification = arguments.bean.getUsersSessionIdentification() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localIPAddress = arguments.bean.getIPAddress() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateUsersSession" datasource="#trim(arguments.ds)#">
				UPDATE userssession  SET
					
					UsersSessionIdentification =	
					<cfif trim(localUsersSessionIdentification) NEQ "" AND trim(localUsersSessionIdentification) NEQ "@@" AND trim(localUsersSessionIdentification) NEQ "NULL">						
						<cfqueryparam value="#trim(localUsersSessionIdentification)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					IPAddress =	
					<cfif trim(localIPAddress) NEQ "" AND trim(localIPAddress) NEQ "@@" AND trim(localIPAddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPAddress)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SiteID =						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE UsersSessionID = <cfqueryparam value="#trim(arguments.bean.getUsersSessionID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersSessionBean" />
		<cfset var qDeleteUsersSession = "">

		<cfquery name="qDeleteUsersSession" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM userssession
			WHERE UsersSessionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getUsersSessionID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersSession" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersSessionID" required="yes" type="numeric" />		
		<cfset var qGetUsersSession = "" />		
	
		<cfquery name="qGetUsersSession" datasource="#trim(arguments.ds)#">
	  		SELECT UsersSessionID,UsersSessionIdentification,UsersID,IPAddress,SiteID,Active,InactiveCode,DateCreated,DateModified
			FROM userssession  
			WHERE UsersSessionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.UsersSessionID)#" /> 
		</cfquery>
		
		<cfreturn qGetUsersSession>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





