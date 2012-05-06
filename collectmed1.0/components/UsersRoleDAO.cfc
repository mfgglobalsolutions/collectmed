 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersRoleBean" />
		
		<cfset var qCreateUsersRole = "" />		
		
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localRoleID = arguments.bean.getRoleID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateUsersRole" datasource="#trim(arguments.ds)#">
				INSERT INTO UsersRole (UsersID,SiteID,RoleID,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localRoleID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS UsersRoleID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setUsersRoleID(qCreateUsersRole.UsersRoleID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="UsersRoleBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersRoleID" required="yes" type="numeric" />		
		<cfset var qGetUsersRole = "" />		
		
		<cfset qGetUsersRole = getUsersRole(trim(arguments.ds), trim(UsersRoleID)) />
				
		<cfif qGetUsersRole.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objUsersRole = createObject("component", "UsersRoleBean").init(arguments.ds);
			objUsersRole.setUsersRoleID(qGetUsersRole.UsersRoleID);
			objUsersRole.setUsersID(qGetUsersRole.UsersID);
			objUsersRole.setSiteID(qGetUsersRole.SiteID);
			objUsersRole.setRoleID(qGetUsersRole.RoleID);
			objUsersRole.setActive(qGetUsersRole.Active);
			objUsersRole.setInactiveCode(qGetUsersRole.InactiveCode);
			objUsersRole.setDateCreated(qGetUsersRole.DateCreated);
			objUsersRole.setDateModified(qGetUsersRole.DateModified);				
			return objUsersRole;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersRoleBean" />
		<cfset var qUpdateUsersRole = "" />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localRoleID = arguments.bean.getRoleID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateUsersRole" datasource="#trim(arguments.ds)#">
				UPDATE UsersRole  SET
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					RoleID =						
						<cfqueryparam value="#trim(localRoleID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE UsersRoleID = <cfqueryparam value="#trim(arguments.bean.getUsersRoleID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersRoleBean" />
		<cfset var qDeleteUsersRole = "">

		<cfquery name="qDeleteUsersRole" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM UsersRole
			WHERE UsersRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getUsersRoleID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersRole" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersRoleID" required="yes" type="numeric" />		
		<cfset var qGetUsersRole = "" />		
	
		<cfquery name="qGetUsersRole" datasource="#trim(arguments.ds)#">
	  		SELECT UsersRoleID,UsersID,SiteID,RoleID,Active,InactiveCode,DateCreated,DateModified
			FROM UsersRole  
			WHERE UsersRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.UsersRoleID)#" /> 
		</cfquery>
		
		<cfreturn qGetUsersRole>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


