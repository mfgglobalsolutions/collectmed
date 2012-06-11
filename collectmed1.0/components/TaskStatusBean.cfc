 	


<cfcomponent name="taskstatusBean" output="false" alias="taskstatusBean" extends="TaskStatusDAO">

	<cfproperty name="TaskStatusID" type="numeric" default="0" />
	<cfproperty name="TaskID" type="numeric" default="" />
	<cfproperty name="StatusID" type="numeric" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="Note" type="string" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.TaskStatusID = 0;
		variables.TaskID = "";
		variables.StatusID = "";
		variables.UsersID = "";
		variables.DateCreated = "";
		variables.Note = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="taskstatusBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "TaskStatusID") AND stValues.TaskStatusID NEQ 0>
				<cfquery name="qGetTaskStatus" datasource="#trim(arguments.ds)#">
			  		SELECT TaskStatusID,TaskID,StatusID,UsersID,DateCreated,Note
					FROM taskstatus  
					WHERE TaskStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.TaskStatusID#" /> 
				</cfquery>		
				<cfif qGetTaskStatus.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.TaskID = qGetTaskStatus.TaskID;
					variables.StatusID = qGetTaskStatus.StatusID;
					variables.UsersID = qGetTaskStatus.UsersID;
					variables.Note = qGetTaskStatus.Note;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "TaskStatusID")><cfset variables.TaskStatusID = stValues.TaskStatusID /></cfif>
			<cfif StructKeyExists(stValues, "TaskID")><cfset variables.TaskID = stValues.TaskID /></cfif>
			<cfif StructKeyExists(stValues, "StatusID")><cfset variables.StatusID = stValues.StatusID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TaskStatusID.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTaskStatusID" acess="public" output="false" returntype="any">
		<cfreturn variables.TaskStatusID>
	</cffunction>
	
	<cffunction name="setTaskStatusID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TaskStatusID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.TaskStatusID)) OR trim(arguments.TaskStatusID) EQ "">
			<cfset variables.TaskStatusID = arguments.TaskStatusID />
		<cfelse>
			<cfthrow message="TaskStatusID (#arguments.TaskStatusID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TaskStatusID") />		
		
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
	<!--- GET and SET methods for StatusID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStatusID" acess="public" output="false" returntype="any">
		<cfreturn variables.StatusID>
	</cffunction>
	
	<cffunction name="setStatusID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="StatusID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.StatusID)) OR trim(arguments.StatusID) EQ "">
			<cfset variables.StatusID = arguments.StatusID />
		<cfelse>
			<cfthrow message="StatusID (#arguments.StatusID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "StatusID") />		
		
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



