
<cfcomponent name="TaskIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.TaskID = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.CreatorID = "NULL";
			variables.instance.ObjectID = "NULL";
			variables.instance.InstanceID = "NULL";
			variables.instance.Priority = "NULL";
			variables.instance.AssignedToUserID = "NULL";
			variables.instance.StatusID = "NULL";
			variables.instance.DueDate = "";
			variables.instance.Note = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 14)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TASKID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CREATORID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OBJECTID", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INSTANCEID", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIORITY", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ASSIGNEDTOUSERID", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "STATUSID", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DUEDATE", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "NOTE", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "text", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 14)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TaskID.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTaskID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TaskID>
	</cffunction>
	 
	<cffunction name="setTaskID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TaskID" required="Yes" type="String">
		
		<cfif TaskID NEQ "NULL">	
			
			<cfif arguments.TaskID EQ "@@" OR arguments.TaskID EQ "">
				
				<cfset arguments.TaskID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(TaskID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TaskID</strong> (#TaskID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TaskID = arguments.TaskID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CreatorID.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCreatorID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CreatorID>
	</cffunction>
	 
	<cffunction name="setCreatorID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CreatorID" required="Yes" type="String">
		
		<cfif CreatorID NEQ "NULL">	
			
			<cfif arguments.CreatorID EQ "@@" OR arguments.CreatorID EQ "">
				
				<cfset arguments.CreatorID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(CreatorID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CreatorID</strong> (#CreatorID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CreatorID = arguments.CreatorID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CreatorID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ObjectID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getObjectID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ObjectID>
	</cffunction>
	 
	<cffunction name="setObjectID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ObjectID" required="Yes" type="String">
		
		<cfif ObjectID NEQ "NULL">	
			
			<cfif arguments.ObjectID EQ "@@" OR arguments.ObjectID EQ "">
				
				<cfset arguments.ObjectID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ObjectID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ObjectID</strong> (#ObjectID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ObjectID = arguments.ObjectID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ObjectID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InstanceID.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInstanceID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InstanceID>
	</cffunction>
	 
	<cffunction name="setInstanceID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InstanceID" required="Yes" type="String">
		
		<cfif InstanceID NEQ "NULL">	
			
			<cfif arguments.InstanceID EQ "@@" OR arguments.InstanceID EQ "">
				
				<cfset arguments.InstanceID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InstanceID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InstanceID</strong> (#InstanceID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InstanceID = arguments.InstanceID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InstanceID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Priority.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriority" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Priority>
	</cffunction>
	 
	<cffunction name="setPriority" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Priority" required="Yes" type="String">
		
		<cfif Priority NEQ "NULL">	
			
			<cfif arguments.Priority EQ "@@" OR arguments.Priority EQ "">
				
				<cfset arguments.Priority = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(Priority)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Priority</strong> (#Priority#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Priority = arguments.Priority>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Priority")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AssignedToUserID.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAssignedToUserID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AssignedToUserID>
	</cffunction>
	 
	<cffunction name="setAssignedToUserID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AssignedToUserID" required="Yes" type="String">
		
		<cfif AssignedToUserID NEQ "NULL">	
			
			<cfif arguments.AssignedToUserID EQ "@@" OR arguments.AssignedToUserID EQ "">
				
				<cfset arguments.AssignedToUserID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AssignedToUserID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AssignedToUserID</strong> (#AssignedToUserID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AssignedToUserID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for StatusID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStatusID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.StatusID>
	</cffunction>
	 
	<cffunction name="setStatusID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="StatusID" required="Yes" type="String">
		
		<cfif StatusID NEQ "NULL">	
			
			<cfif arguments.StatusID EQ "@@" OR arguments.StatusID EQ "">
				
				<cfset arguments.StatusID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(StatusID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>StatusID</strong> (#StatusID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.StatusID = arguments.StatusID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "StatusID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DueDate.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDueDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DueDate>
	</cffunction>
	 
	<cffunction name="setDueDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DueDate" required="Yes" type="String">
		
		<cfif DueDate NEQ "NULL" AND DueDate NEQ "NOW">	
			
			<cfif arguments.DueDate EQ "@@" OR arguments.DueDate EQ "">
				
				<cfset arguments.DueDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DueDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DueDate</strong> (#DueDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DueDate = arguments.DueDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DueDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Note.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getNote" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Note>
	</cffunction>
	 
	<cffunction name="setNote" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Note" required="Yes" type="String">
		
		<cfif Note NEQ "NULL">	
			
			<cfif arguments.Note EQ "@@" OR arguments.Note EQ "">
				
				<cfset arguments.Note = "NULL">
						
			<cfelseif NOT REQUEST.istextDataType(Note)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Note</strong> (#Note#) is not of type <strong>text</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Note = arguments.Note>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Note")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="CreatorID" required="No" type="String" default="">
		<cfargument name="ObjectID" required="No" type="String" default="">
		<cfargument name="InstanceID" required="No" type="String" default="">
		<cfargument name="Priority" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="StatusID" required="No" type="String" default="">
		<cfargument name="DueDate" required="No" type="String" default="">
		<cfargument name="Note" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.CreatorID = arguments.CreatorID>
		<cfset variables.instance.ObjectID = arguments.ObjectID>
		<cfset variables.instance.InstanceID = arguments.InstanceID>
		<cfset variables.instance.Priority = arguments.Priority>
		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>
		<cfset variables.instance.StatusID = arguments.StatusID>
		<cfset variables.instance.DueDate = arguments.DueDate>
		<cfset variables.instance.Note = arguments.Note>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitTaskIO" access="public" returntype="TaskIO" output="No">
		
		<cfargument name="TaskID" required="yes" type="numeric">		
		<cfset var qGetTask = "">
		
		<cfset preInit(TaskID)>
	
		<cfquery name="qGetTask" datasource="#trim(request.datasource)#">
	  		SELECT TaskID,ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode,DateCreated,DateModified
			FROM task  
			WHERE TaskID = #trim(arguments.TaskID)# 
		</cfquery>
		
		<cfif qGetTask.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetTask.TaskID EQ "" OR qGetTask.TaskID EQ "NULL") 
				variables.instance.TaskID = "NULL"; 
			ELSE 
				variables.instance.TaskID = qGetTask.TaskID;
				
			IF(qGetTask.ClientID EQ "" OR qGetTask.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetTask.ClientID;
				
			IF(qGetTask.CreatorID EQ "" OR qGetTask.CreatorID EQ "NULL") 
				variables.instance.CreatorID = "NULL"; 
			ELSE 
				variables.instance.CreatorID = qGetTask.CreatorID;
				
			IF(qGetTask.ObjectID EQ "" OR qGetTask.ObjectID EQ "NULL") 
				variables.instance.ObjectID = "NULL"; 
			ELSE 
				variables.instance.ObjectID = qGetTask.ObjectID;
				
			IF(qGetTask.InstanceID EQ "" OR qGetTask.InstanceID EQ "NULL") 
				variables.instance.InstanceID = "NULL"; 
			ELSE 
				variables.instance.InstanceID = qGetTask.InstanceID;
				
			IF(qGetTask.Priority EQ "" OR qGetTask.Priority EQ "NULL") 
				variables.instance.Priority = "NULL"; 
			ELSE 
				variables.instance.Priority = qGetTask.Priority;
				
			IF(qGetTask.AssignedToUserID EQ "" OR qGetTask.AssignedToUserID EQ "NULL") 
				variables.instance.AssignedToUserID = "NULL"; 
			ELSE 
				variables.instance.AssignedToUserID = qGetTask.AssignedToUserID;
				
			IF(qGetTask.StatusID EQ "" OR qGetTask.StatusID EQ "NULL") 
				variables.instance.StatusID = "NULL"; 
			ELSE 
				variables.instance.StatusID = qGetTask.StatusID;
							
				variables.instance.DueDate = qGetTask.DueDate;
							
				variables.instance.Note = qGetTask.Note;
							
				variables.instance.Active = qGetTask.Active;
				
			IF(qGetTask.InactiveCode EQ "" OR qGetTask.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetTask.InactiveCode;
							
				variables.instance.DateCreated = qGetTask.DateCreated;
							
				variables.instance.DateModified = qGetTask.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(TaskID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitTask = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.TaskID) AND variables.instance.TaskID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitTask" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitTask" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.TaskID = qInsertCommitTask.TaskID>
				
				<cfreturn qInsertCommitTask.TaskID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "TaskID,ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "Note,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DueDate,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE task  SET #columnsToUpdate# WHERE TaskID = #trim(variables.instance.TaskID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "Note,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DueDate,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO task  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS TaskID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTaskQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getTaskQuery">						
		<cfargument name="Fields" required="No" type="String" default="TaskID,ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="TaskID" required="No" type="String" default="">
		<cfargument name="TaskID_IN" required="No" type="String" default="">
		<cfargument name="TaskID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="CreatorID" required="No" type="String" default="">
		<cfargument name="CreatorID_IN" required="No" type="String" default="">
		<cfargument name="CreatorID_LIKE" required="No" type="String" default="">
		<cfargument name="ObjectID" required="No" type="String" default="">
		<cfargument name="ObjectID_IN" required="No" type="String" default="">
		<cfargument name="ObjectID_LIKE" required="No" type="String" default="">
		<cfargument name="InstanceID" required="No" type="String" default="">
		<cfargument name="InstanceID_IN" required="No" type="String" default="">
		<cfargument name="InstanceID_LIKE" required="No" type="String" default="">
		<cfargument name="Priority" required="No" type="String" default="">
		<cfargument name="Priority_IN" required="No" type="String" default="">
		<cfargument name="Priority_LIKE" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_IN" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_LIKE" required="No" type="String" default="">
		<cfargument name="StatusID" required="No" type="String" default="">
		<cfargument name="StatusID_IN" required="No" type="String" default="">
		<cfargument name="StatusID_LIKE" required="No" type="String" default="">
		<cfargument name="DueDate" required="No" type="String" default="">
		<cfargument name="DueDate_IN" required="No" type="String" default="">
		<cfargument name="DueDate_LIKE" required="No" type="String" default="">
		<cfargument name="Note" required="No" type="String" default="">
		<cfargument name="Note_IN" required="No" type="String" default="">
		<cfargument name="Note_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "TaskID,TaskID_IN,TaskID_LIKE,ClientID,ClientID_IN,ClientID_LIKE,CreatorID,CreatorID_IN,CreatorID_LIKE,ObjectID,ObjectID_IN,ObjectID_LIKE,InstanceID,InstanceID_IN,InstanceID_LIKE,Priority,Priority_IN,Priority_LIKE,AssignedToUserID,AssignedToUserID_IN,AssignedToUserID_LIKE,StatusID,StatusID_IN,StatusID_LIKE,DueDate,DueDate_IN,DueDate_LIKE,Note,Note_IN,Note_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Task"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getTaskQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM task   
				WHERE 1=1
					<cfif TaskID NEQ "" AND IsNumeric(TaskID)>AND TaskID = #TaskID#</cfif>
					<cfif TaskID_IN NEQ "">AND TaskID IN(#trim(TaskID_IN)#)</cfif>
					<cfif TaskID_LIKE NEQ "">AND TaskID LIKE '%#trim(TaskID_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif CreatorID NEQ "" AND IsNumeric(CreatorID)>AND CreatorID = #CreatorID#</cfif>
					<cfif CreatorID_IN NEQ "">AND CreatorID IN(#trim(CreatorID_IN)#)</cfif>
					<cfif CreatorID_LIKE NEQ "">AND CreatorID LIKE '%#trim(CreatorID_LIKE)#%'</cfif>
					<cfif ObjectID NEQ "" AND IsNumeric(ObjectID)>AND ObjectID = #ObjectID#</cfif>
					<cfif ObjectID_IN NEQ "">AND ObjectID IN(#trim(ObjectID_IN)#)</cfif>
					<cfif ObjectID_LIKE NEQ "">AND ObjectID LIKE '%#trim(ObjectID_LIKE)#%'</cfif>
					<cfif InstanceID NEQ "" AND IsNumeric(InstanceID)>AND InstanceID = #InstanceID#</cfif>
					<cfif InstanceID_IN NEQ "">AND InstanceID IN(#trim(InstanceID_IN)#)</cfif>
					<cfif InstanceID_LIKE NEQ "">AND InstanceID LIKE '%#trim(InstanceID_LIKE)#%'</cfif>
					<cfif Priority NEQ "" AND IsNumeric(Priority)>AND Priority = #Priority#</cfif>
					<cfif Priority_IN NEQ "">AND Priority IN(#trim(Priority_IN)#)</cfif>
					<cfif Priority_LIKE NEQ "">AND Priority LIKE '%#trim(Priority_LIKE)#%'</cfif>
					<cfif AssignedToUserID NEQ "" AND IsNumeric(AssignedToUserID)>AND AssignedToUserID = #AssignedToUserID#</cfif>
					<cfif AssignedToUserID_IN NEQ "">AND AssignedToUserID IN(#trim(AssignedToUserID_IN)#)</cfif>
					<cfif AssignedToUserID_LIKE NEQ "">AND AssignedToUserID LIKE '%#trim(AssignedToUserID_LIKE)#%'</cfif>
					<cfif StatusID NEQ "" AND IsNumeric(StatusID)>AND StatusID = #StatusID#</cfif>
					<cfif StatusID_IN NEQ "">AND StatusID IN(#trim(StatusID_IN)#)</cfif>
					<cfif StatusID_LIKE NEQ "">AND StatusID LIKE '%#trim(StatusID_LIKE)#%'</cfif>
					<cfif DueDate NEQ "">AND DueDate = '#DueDate#'</cfif>
					<cfif DueDate_IN NEQ "">AND DueDate IN(#trim(DueDate_IN)#)</cfif>
					<cfif DueDate_LIKE NEQ "">AND DueDate LIKE '%#trim(DueDate_LIKE)#%'</cfif>
					<cfif Note NEQ "">AND Note = '#Note#'</cfif>
					<cfif Note_IN NEQ "">AND Note IN(#trim(Note_IN)#)</cfif>
					<cfif Note_LIKE NEQ "">AND Note LIKE '%#trim(Note_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getTaskQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




