 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskAssignmentBean" />
		
		<cfset var qCreateTaskAssignment = "" />		
		
		<cfset var localTaskID = arguments.bean.getTaskID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localAssignorID = arguments.bean.getAssignorID() />
		<cfset var localNote = arguments.bean.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateTaskAssignment" datasource="#trim(arguments.ds)#">
				INSERT INTO taskassignment (TaskID,UsersID,AssignorID,Note)
				VALUES (						
						<cfqueryparam value="#trim(localTaskID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localAssignorID))>						
						<cfqueryparam value="#trim(localAssignorID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS TaskAssignmentID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setTaskAssignmentID(qCreateTaskAssignment.TaskAssignmentID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="TaskAssignmentBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="TaskAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetTaskAssignment = "" />		
		
		<cfset qGetTaskAssignment = getTaskAssignment(trim(arguments.ds), trim(TaskAssignmentID)) />
				
		<cfif qGetTaskAssignment.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objTaskAssignment = createObject("component", "TaskAssignmentBean").init(arguments.ds);
			objTaskAssignment.setTaskAssignmentID(qGetTaskAssignment.TaskAssignmentID);
			objTaskAssignment.setTaskID(qGetTaskAssignment.TaskID);
			objTaskAssignment.setUsersID(qGetTaskAssignment.UsersID);
			objTaskAssignment.setDateCreated(qGetTaskAssignment.DateCreated);
			objTaskAssignment.setAssignorID(qGetTaskAssignment.AssignorID);
			objTaskAssignment.setNote(qGetTaskAssignment.Note);				
			return objTaskAssignment;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskAssignmentBean" />
		<cfset var qUpdateTaskAssignment = "" />
		<cfset var localTaskID = arguments.bean.getTaskID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localAssignorID = arguments.bean.getAssignorID() />
		<cfset var localNote = arguments.bean.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateTaskAssignment" datasource="#trim(arguments.ds)#">
				UPDATE taskassignment  SET
					
					TaskID =						
						<cfqueryparam value="#trim(localTaskID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					AssignorID =				
					<cfif IsNumeric(trim(localAssignorID))>						
						<cfqueryparam value="#trim(localAssignorID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Note =	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>					
				WHERE TaskAssignmentID = <cfqueryparam value="#trim(arguments.bean.getTaskAssignmentID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskAssignmentBean" />
		<cfset var qDeleteTaskAssignment = "">

		<cfquery name="qDeleteTaskAssignment" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM taskassignment
			WHERE TaskAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getTaskAssignmentID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTaskAssignment" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="TaskAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetTaskAssignment = "" />		
	
		<cfquery name="qGetTaskAssignment" datasource="#trim(arguments.ds)#">
	  		SELECT TaskAssignmentID,TaskID,UsersID,DateCreated,AssignorID,Note
			FROM taskassignment  
			WHERE TaskAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.TaskAssignmentID)#" /> 
		</cfquery>
		
		<cfreturn qGetTaskAssignment>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





