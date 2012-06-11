 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersBean" />
		
		<cfset var qCreateUsers = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localEntry = arguments.bean.getEntry() />
		<cfset var localEntryPoint = arguments.bean.getEntryPoint() />
		<cfset var localEntryQID = arguments.bean.getEntryQID() />
		<cfset var localEntryResponse = arguments.bean.getEntryResponse() />
		<cfset var localChangedPassword = arguments.bean.getChangedPassword() />
		<cfset var localLastOpenedClaimID = arguments.bean.getLastOpenedClaimID() />
		<cfset var localSuspend = arguments.bean.getSuspend() />
		<cfset var localLoginStart = arguments.bean.getLoginStart() />
		<cfset var localLoginEnd = arguments.bean.getLoginEnd() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateUsers" datasource="#trim(arguments.ds)#">
				INSERT INTO users (SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localEntry) NEQ "" AND trim(localEntry) NEQ "@@" AND trim(localEntry) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntry)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEntryPoint) NEQ "" AND trim(localEntryPoint) NEQ "@@" AND trim(localEntryPoint) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryPoint)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localEntryQID))>						
						<cfqueryparam value="#trim(localEntryQID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localEntryResponse) NEQ "" AND trim(localEntryResponse) NEQ "@@" AND trim(localEntryResponse) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryResponse)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localChangedPassword)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localLastOpenedClaimID))>						
						<cfqueryparam value="#trim(localLastOpenedClaimID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localSuspend)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif IsDate(trim(localLoginStart))>						
						<cfqueryparam value="#trim(localLoginStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localLoginEnd))>						
						<cfqueryparam value="#trim(localLoginEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS UsersID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setUsersID(qCreateUsers.UsersID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="UsersBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersID" required="yes" type="numeric" />		
		<cfset var qGetUsers = "" />		
		
		<cfset qGetUsers = getUsers(trim(arguments.ds), trim(UsersID)) />
				
		<cfif qGetUsers.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objUsers = createObject("component", "UsersBean").init(arguments.ds);
			objUsers.setUsersID(qGetUsers.UsersID);
			objUsers.setSiteID(qGetUsers.SiteID);
			objUsers.setClientID(qGetUsers.ClientID);
			objUsers.setEntityID(qGetUsers.EntityID);
			objUsers.setEntry(qGetUsers.Entry);
			objUsers.setEntryPoint(qGetUsers.EntryPoint);
			objUsers.setEntryQID(qGetUsers.EntryQID);
			objUsers.setEntryResponse(qGetUsers.EntryResponse);
			objUsers.setChangedPassword(qGetUsers.ChangedPassword);
			objUsers.setLastOpenedClaimID(qGetUsers.LastOpenedClaimID);
			objUsers.setSuspend(qGetUsers.Suspend);
			objUsers.setLoginStart(qGetUsers.LoginStart);
			objUsers.setLoginEnd(qGetUsers.LoginEnd);
			objUsers.setActive(qGetUsers.Active);
			objUsers.setInactiveCode(qGetUsers.InactiveCode);
			objUsers.setDateCreated(qGetUsers.DateCreated);
			objUsers.setDateModified(qGetUsers.DateModified);				
			return objUsers;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersBean" />
		<cfset var qUpdateUsers = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localEntry = arguments.bean.getEntry() />
		<cfset var localEntryPoint = arguments.bean.getEntryPoint() />
		<cfset var localEntryQID = arguments.bean.getEntryQID() />
		<cfset var localEntryResponse = arguments.bean.getEntryResponse() />
		<cfset var localChangedPassword = arguments.bean.getChangedPassword() />
		<cfset var localLastOpenedClaimID = arguments.bean.getLastOpenedClaimID() />
		<cfset var localSuspend = arguments.bean.getSuspend() />
		<cfset var localLoginStart = arguments.bean.getLoginStart() />
		<cfset var localLoginEnd = arguments.bean.getLoginEnd() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateUsers" datasource="#trim(arguments.ds)#">
				UPDATE users  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Entry =	
					<cfif trim(localEntry) NEQ "" AND trim(localEntry) NEQ "@@" AND trim(localEntry) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntry)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntryPoint =	
					<cfif trim(localEntryPoint) NEQ "" AND trim(localEntryPoint) NEQ "@@" AND trim(localEntryPoint) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryPoint)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntryQID =				
					<cfif IsNumeric(trim(localEntryQID))>						
						<cfqueryparam value="#trim(localEntryQID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					EntryResponse =	
					<cfif trim(localEntryResponse) NEQ "" AND trim(localEntryResponse) NEQ "@@" AND trim(localEntryResponse) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryResponse)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ChangedPassword =						
						<cfqueryparam value="#trim(localChangedPassword)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					LastOpenedClaimID =				
					<cfif IsNumeric(trim(localLastOpenedClaimID))>						
						<cfqueryparam value="#trim(localLastOpenedClaimID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Suspend =						
						<cfqueryparam value="#trim(localSuspend)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					LoginStart =	
					<cfif IsDate(trim(localLoginStart))>						
						<cfqueryparam value="#trim(localLoginStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					LoginEnd =	
					<cfif IsDate(trim(localLoginEnd))>						
						<cfqueryparam value="#trim(localLoginEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
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
				WHERE UsersID = <cfqueryparam value="#trim(arguments.bean.getUsersID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersBean" />
		<cfset var qDeleteUsers = "">

		<cfquery name="qDeleteUsers" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM users
			WHERE UsersID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getUsersID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsers" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersID" required="yes" type="numeric" />		
		<cfset var qGetUsers = "" />		
	
		<cfquery name="qGetUsers" datasource="#trim(arguments.ds)#">
	  		SELECT UsersID,SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode,DateCreated,DateModified
			FROM users  
			WHERE UsersID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.UsersID)#" /> 
		</cfquery>
		
		<cfreturn qGetUsers>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>




