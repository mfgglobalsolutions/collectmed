 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="RoleBean" />
		
		<cfset var qCreateRole = "" />		
		
		<cfset var localRoleName = arguments.bean.getRoleName() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateRole" datasource="#trim(arguments.ds)#">
				INSERT INTO role (RoleName,SiteID,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localRoleName)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS RoleID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setRoleID(qCreateRole.RoleID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="RoleBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RoleID" required="yes" type="numeric" />		
		<cfset var qGetRole = "" />		
		
		<cfset qGetRole = getRole(trim(arguments.ds), trim(RoleID)) />
				
		<cfif qGetRole.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objRole = createObject("component", "RoleBean").init(arguments.ds);
			objRole.setRoleID(qGetRole.RoleID);
			objRole.setRoleName(qGetRole.RoleName);
			objRole.setSiteID(qGetRole.SiteID);
			objRole.setActive(qGetRole.Active);
			objRole.setInactiveCode(qGetRole.InactiveCode);
			objRole.setDateCreated(qGetRole.DateCreated);
			objRole.setDateModified(qGetRole.DateModified);				
			return objRole;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="RoleBean" />
		<cfset var qUpdateRole = "" />
		<cfset var localRoleName = arguments.bean.getRoleName() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateRole" datasource="#trim(arguments.ds)#">
				UPDATE role  SET
					
					RoleName =						
						<cfqueryparam value="#trim(localRoleName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
				WHERE RoleID = <cfqueryparam value="#trim(arguments.bean.getRoleID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="RoleBean" />
		<cfset var qDeleteRole = "">

		<cfquery name="qDeleteRole" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM role
			WHERE RoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRoleID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRole" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RoleID" required="yes" type="numeric" />		
		<cfset var qGetRole = "" />		
	
		<cfquery name="qGetRole" datasource="#trim(arguments.ds)#">
	  		SELECT RoleID,RoleName,SiteID,Active,InactiveCode,DateCreated,DateModified
			FROM role  
			WHERE RoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RoleID)#" /> 
		</cfquery>
		
		<cfreturn qGetRole>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





