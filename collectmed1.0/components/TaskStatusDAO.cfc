 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskStatusBean" />
		
		<cfset var qCreateTaskStatus = "" />		
		
		<cfset var localTaskID = arguments.bean.getTaskID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localNote = arguments.bean.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateTaskStatus" datasource="#trim(arguments.ds)#">
				INSERT INTO TaskStatus (TaskID,StatusID,UsersID,Note)
				VALUES (						
						<cfqueryparam value="#trim(localTaskID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS TaskStatusID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setTaskStatusID(qCreateTaskStatus.TaskStatusID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="TaskStatusBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="TaskStatusID" required="yes" type="numeric" />		
		<cfset var qGetTaskStatus = "" />		
		
		<cfset qGetTaskStatus = getTaskStatus(trim(arguments.ds), trim(TaskStatusID)) />
				
		<cfif qGetTaskStatus.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objTaskStatus = createObject("component", "TaskStatusBean").init(arguments.ds);
			objTaskStatus.setTaskStatusID(qGetTaskStatus.TaskStatusID);
			objTaskStatus.setTaskID(qGetTaskStatus.TaskID);
			objTaskStatus.setStatusID(qGetTaskStatus.StatusID);
			objTaskStatus.setUsersID(qGetTaskStatus.UsersID);
			objTaskStatus.setDateCreated(qGetTaskStatus.DateCreated);
			objTaskStatus.setNote(qGetTaskStatus.Note);				
			return objTaskStatus;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskStatusBean" />
		<cfset var qUpdateTaskStatus = "" />
		<cfset var localTaskID = arguments.bean.getTaskID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localNote = arguments.bean.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateTaskStatus" datasource="#trim(arguments.ds)#">
				UPDATE TaskStatus  SET
					
					TaskID =						
						<cfqueryparam value="#trim(localTaskID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					StatusID =						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Note =	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>					
				WHERE TaskStatusID = <cfqueryparam value="#trim(arguments.bean.getTaskStatusID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskStatusBean" />
		<cfset var qDeleteTaskStatus = "">

		<cfquery name="qDeleteTaskStatus" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM TaskStatus
			WHERE TaskStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getTaskStatusID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTaskStatus" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="TaskStatusID" required="yes" type="numeric" />		
		<cfset var qGetTaskStatus = "" />		
	
		<cfquery name="qGetTaskStatus" datasource="#trim(arguments.ds)#">
	  		SELECT TaskStatusID,TaskID,StatusID,UsersID,DateCreated,Note
			FROM TaskStatus  
			WHERE TaskStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.TaskStatusID)#" /> 
		</cfquery>
		
		<cfreturn qGetTaskStatus>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


