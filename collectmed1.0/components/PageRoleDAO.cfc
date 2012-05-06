 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageRoleBean" />
		
		<cfset var qCreatePageRole = "" />		
		
		<cfset var localPageID = arguments.bean.getPageID() />
		<cfset var localRoleID = arguments.bean.getRoleID() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePageRole" datasource="#trim(arguments.ds)#">
				INSERT INTO PageRole (PageID,RoleID,SiteID,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localPageID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localRoleID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS PageRoleID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setPageRoleID(qCreatePageRole.PageRoleID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PageRoleBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PageRoleID" required="yes" type="numeric" />		
		<cfset var qGetPageRole = "" />		
		
		<cfset qGetPageRole = getPageRole(trim(arguments.ds), trim(PageRoleID)) />
				
		<cfif qGetPageRole.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objPageRole = createObject("component", "PageRoleBean").init(arguments.ds);
			objPageRole.setPageRoleID(qGetPageRole.PageRoleID);
			objPageRole.setPageID(qGetPageRole.PageID);
			objPageRole.setRoleID(qGetPageRole.RoleID);
			objPageRole.setSiteID(qGetPageRole.SiteID);
			objPageRole.setActive(qGetPageRole.Active);
			objPageRole.setInactiveCode(qGetPageRole.InactiveCode);
			objPageRole.setDateCreated(qGetPageRole.DateCreated);
			objPageRole.setDateModified(qGetPageRole.DateModified);				
			return objPageRole;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageRoleBean" />
		<cfset var qUpdatePageRole = "" />
		<cfset var localPageID = arguments.bean.getPageID() />
		<cfset var localRoleID = arguments.bean.getRoleID() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePageRole" datasource="#trim(arguments.ds)#">
				UPDATE PageRole  SET
					
					PageID =						
						<cfqueryparam value="#trim(localPageID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					RoleID =						
						<cfqueryparam value="#trim(localRoleID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE PageRoleID = <cfqueryparam value="#trim(arguments.bean.getPageRoleID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageRoleBean" />
		<cfset var qDeletePageRole = "">

		<cfquery name="qDeletePageRole" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM PageRole
			WHERE PageRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getPageRoleID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPageRole" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PageRoleID" required="yes" type="numeric" />		
		<cfset var qGetPageRole = "" />		
	
		<cfquery name="qGetPageRole" datasource="#trim(arguments.ds)#">
	  		SELECT PageRoleID,PageID,RoleID,SiteID,Active,InactiveCode,DateCreated,DateModified
			FROM PageRole  
			WHERE PageRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PageRoleID)#" /> 
		</cfquery>
		
		<cfreturn qGetPageRole>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


