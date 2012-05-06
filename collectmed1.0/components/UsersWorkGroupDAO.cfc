 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersWorkGroupBean" />
		
		<cfset var qCreateUsersWorkGroup = "" />		
		
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localWorkGroupID = arguments.bean.getWorkGroupID() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateUsersWorkGroup" datasource="#trim(arguments.ds)#">
				INSERT INTO UsersWorkGroup (UsersID,WorkGroupID)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localWorkGroupID)#" cfsqltype="CF_SQL_INTEGER" />	
				);
				SELECT LAST_INSERT_ID() AS UsersWorkGroupID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setUsersWorkGroupID(qCreateUsersWorkGroup.UsersWorkGroupID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="UsersWorkGroupBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersWorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetUsersWorkGroup = "" />		
		
		<cfset qGetUsersWorkGroup = getUsersWorkGroup(trim(arguments.ds), trim(UsersWorkGroupID)) />
				
		<cfif qGetUsersWorkGroup.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objUsersWorkGroup = createObject("component", "UsersWorkGroupBean").init(arguments.ds);
			objUsersWorkGroup.setUsersWorkGroupID(qGetUsersWorkGroup.UsersWorkGroupID);
			objUsersWorkGroup.setUsersID(qGetUsersWorkGroup.UsersID);
			objUsersWorkGroup.setWorkGroupID(qGetUsersWorkGroup.WorkGroupID);
			objUsersWorkGroup.setDateCreated(qGetUsersWorkGroup.DateCreated);				
			return objUsersWorkGroup;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersWorkGroupBean" />
		<cfset var qUpdateUsersWorkGroup = "" />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localWorkGroupID = arguments.bean.getWorkGroupID() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateUsersWorkGroup" datasource="#trim(arguments.ds)#">
				UPDATE UsersWorkGroup  SET
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					WorkGroupID =						
						<cfqueryparam value="#trim(localWorkGroupID)#" cfsqltype="CF_SQL_INTEGER" />					
				WHERE UsersWorkGroupID = <cfqueryparam value="#trim(arguments.bean.getUsersWorkGroupID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="UsersWorkGroupBean" />
		<cfset var qDeleteUsersWorkGroup = "">

		<cfquery name="qDeleteUsersWorkGroup" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM UsersWorkGroup
			WHERE UsersWorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getUsersWorkGroupID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersWorkGroup" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="UsersWorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetUsersWorkGroup = "" />		
	
		<cfquery name="qGetUsersWorkGroup" datasource="#trim(arguments.ds)#">
	  		SELECT UsersWorkGroupID,UsersID,WorkGroupID,DateCreated
			FROM UsersWorkGroup  
			WHERE UsersWorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.UsersWorkGroupID)#" /> 
		</cfquery>
		
		<cfreturn qGetUsersWorkGroup>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


