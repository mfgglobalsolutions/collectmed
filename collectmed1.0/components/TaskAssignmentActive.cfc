 	


<cfcomponent name="taskassignmentActive" output="false" alias="taskassignmentActive">

	<cfproperty name="TaskAssignmentID" type="numeric" default="0" />
	<cfproperty name="TaskID" type="numeric" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="AssignorID" type="numeric" default="" />
	<cfproperty name="Note" type="string" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.TaskAssignmentID = 0;
		variables.TaskID = "";
		variables.UsersID = "";
		variables.DateCreated = "";
		variables.AssignorID = "";
		variables.Note = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="taskassignmentActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "TaskAssignmentID") AND stValues.TaskAssignmentID NEQ 0>
				<cfquery name="qGetTaskAssignment" datasource="#trim(variables.ds)#">
			  		SELECT TaskAssignmentID,TaskID,UsersID,DateCreated,AssignorID,Note
					FROM TaskAssignment  
					WHERE TaskAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.TaskAssignmentID#" /> 
				</cfquery>		
				<cfif qGetTaskAssignment.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.TaskID = qGetTaskAssignment.TaskID;
					variables.UsersID = qGetTaskAssignment.UsersID;
					variables.AssignorID = qGetTaskAssignment.AssignorID;
					variables.Note = qGetTaskAssignment.Note;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "TaskAssignmentID")><cfset variables.TaskAssignmentID = stValues.TaskAssignmentID /></cfif>
			<cfif StructKeyExists(stValues, "TaskID")><cfset variables.TaskID = stValues.TaskID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "AssignorID")><cfset variables.AssignorID = stValues.AssignorID /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TaskAssignmentID.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTaskAssignmentID" acess="public" output="false" returntype="any">
		<cfreturn variables.TaskAssignmentID>
	</cffunction>
	
	<cffunction name="setTaskAssignmentID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TaskAssignmentID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.TaskAssignmentID)) OR trim(arguments.TaskAssignmentID) EQ "">
			<cfset variables.TaskAssignmentID = arguments.TaskAssignmentID />
		<cfelse>
			<cfthrow message="TaskAssignmentID (#arguments.TaskAssignmentID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TaskAssignmentID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TaskID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTaskID" acess="public" output="false" returntype="any">
		<cfreturn variables.TaskID>
	</cffunction>
	
	<cffunction name="setTaskID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TaskID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.TaskID)) OR trim(arguments.TaskID) EQ "">
			<cfset variables.TaskID = arguments.TaskID />
		<cfelse>
			<cfthrow message="TaskID (#arguments.TaskID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TaskID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersID>
	</cffunction>
	
	<cffunction name="setUsersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersID)) OR trim(arguments.UsersID) EQ "">
			<cfset variables.UsersID = arguments.UsersID />
		<cfelse>
			<cfthrow message="UsersID (#arguments.UsersID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AssignorID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAssignorID" acess="public" output="false" returntype="any">
		<cfreturn variables.AssignorID>
	</cffunction>
	
	<cffunction name="setAssignorID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AssignorID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AssignorID)) OR trim(arguments.AssignorID) EQ "">
			<cfset variables.AssignorID = arguments.AssignorID />
		<cfelse>
			<cfthrow message="AssignorID (#arguments.AssignorID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AssignorID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Note.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getNote" acess="public" output="false" returntype="any">
		<cfreturn variables.Note>
	</cffunction>
	
	<cffunction name="setNote" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Note" required="true" type="any" />
			
		<cfset variables.Note = arguments.Note />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Note") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getTaskAssignmentID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getTaskAssignmentID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTaskAssignment" output="false" access="public" returntype="query">
				
		<cfargument name="TaskAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetTaskAssignment = "" />		
	
		<cfquery name="qGetTaskAssignment" datasource="#trim(variables.ds)#">
	  		SELECT TaskAssignmentID,TaskID,UsersID,DateCreated,AssignorID,Note
			FROM TaskAssignment  
			WHERE TaskAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.TaskAssignmentID)#" /> 
		</cfquery>
		
		<cfreturn qGetTaskAssignment>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="TaskAssignmentActive" />
		
		<cfset var qCreateTaskAssignment = "" />		
		
		<cfset var localTaskID = arguments.obj.getTaskID() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localAssignorID = arguments.obj.getAssignorID() />
		<cfset var localNote = arguments.obj.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateTaskAssignment" datasource="#trim(variables.ds)#">
				INSERT INTO TaskAssignment (TaskID,UsersID,AssignorID,Note)
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
			read(qCreateTaskAssignment.TaskAssignmentID);
			arguments.obj.setTaskAssignmentID(qCreateTaskAssignment.TaskAssignmentID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="TaskAssignmentActive">
				
		<cfargument name="TaskAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetTaskAssignment = "" />		
		
		<cfset qGetTaskAssignment = getTaskAssignment(trim(TaskAssignmentID)) />
				
		<cfif qGetTaskAssignment.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setTaskAssignmentID(qGetTaskAssignment.TaskAssignmentID);
			this.setTaskID(qGetTaskAssignment.TaskID);
			this.setUsersID(qGetTaskAssignment.UsersID);
			this.setDateCreated(qGetTaskAssignment.DateCreated);
			this.setAssignorID(qGetTaskAssignment.AssignorID);
			this.setNote(qGetTaskAssignment.Note);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="TaskAssignmentActive" />
		<cfset var qUpdateTaskAssignment = "" />
		<cfset var localTaskID = arguments.obj.getTaskID() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localAssignorID = arguments.obj.getAssignorID() />
		<cfset var localNote = arguments.obj.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateTaskAssignment" datasource="#trim(variables.ds)#">
				UPDATE TaskAssignment  SET
					
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
				WHERE TaskAssignmentID = <cfqueryparam value="#trim(arguments.obj.getTaskAssignmentID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="TaskAssignmentActive" />
		<cfset var qDeleteTaskAssignment = "">

		<cfquery name="qDeleteTaskAssignment" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM TaskAssignment
			WHERE TaskAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getTaskAssignmentID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


