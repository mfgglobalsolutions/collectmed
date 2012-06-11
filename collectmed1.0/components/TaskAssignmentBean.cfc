 	


<cfcomponent name="taskassignmentBean" output="false" alias="taskassignmentBean" extends="TaskAssignmentDAO">

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
	<cffunction name="init" output="false" returntype="taskassignmentBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "TaskAssignmentID") AND stValues.TaskAssignmentID NEQ 0>
				<cfquery name="qGetTaskAssignment" datasource="#trim(arguments.ds)#">
			  		SELECT TaskAssignmentID,TaskID,UsersID,DateCreated,AssignorID,Note
					FROM taskassignment  
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>



