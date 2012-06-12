<!-------------------------------------------------------------------------------------------------------->
<!--- TASK STATUSES                                                                                    --->
<!--- 168      Created   The task is initially created.                                                --->
<!--- 169      Opened   The Task has been looked at by assigned user.                                  --->
<!--- 170      Commented   The task has been looked at and has been commented by the assigned user.    --->
<!--- 171      Re-Assigned   The task has been sent to another user for processing.                    --->
<!--- 172      On-Hold   The task has been suspended.                                                  --->
<!--- 173      Re-Opened   The task has been re-opened by someone                                      --->
<!--- 174      Closed   The task has been closed by the assigned user.                                 --->
<!--- 175      Archive   The task has been marked for archive into the history system.                 --->
<!-------------------------------------------------------------------------------------------------------->



<cfcomponent name="Task" extends="cmComponents.com.common.db.TaskIO">	


	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to reassign a task.                               --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="assignTask" hint="Assign the task">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="assignorID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">
		<cfargument name="taskID" required="yes" type="numeric">
		<cfargument name="note" required="no" default="">
		
		<cfquery name="getTaskClientID" datasource="#trim(request.datasource)#">
			SELECT ClientID 
			FROM task 
			WHERE TaskID = #trim(TaskID)#
		</cfquery>
		
		
		<cfif getTaskClientID.Recordcount EQ 1 AND getTaskClientID.ClientID EQ clientID> 
		
			<cfquery name="insertAssignment" datasource="#trim(request.datasource)#">
				INSERT INTO taskassignment (TaskID, UsersID, AssignorID, Note)
				VALUES(#trim(TaskID)#, #trim(UsersID)#, #trim(assignorID)#, '#trim(Note)#')				
			</cfquery>		
			
			<cfset UpdateTaskAssignedToUserID(TaskID: TaskID)>
						
		</cfif>
		
												
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the assigned to id of a Task.          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="UpdateTaskAssignedToUserID" hint="This function will be called to update the assigned to id of a Task.">		
		<cfargument name="TaskID" required="yes" type="numeric">

		<cfquery name="getID" datasource="#trim(request.datasource)#">
			SELECT UsersID
			FROM taskassignment 
			WHERE TaskID = #arguments.TaskID#
			ORDER BY DateCreated DESC
			LIMIT 1
		</cfquery>
		
		<cfquery name="updateTask" datasource="#trim(request.datasource)#">
			UPDATE task 
			SET AssignedToUserID = #getID.UsersID#
			WHERE TaskID = #arguments.TaskID#
		</cfquery>
									
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the TaskID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="updateTaskStatus" hint="Change the status of the task in the database table.">		
				
		<cfargument name="taskID" required="yes" type="numeric">
		<cfargument name="statusID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">		
		<cfargument name="note" required="no" default="">
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getTask" datasource="#trim(request.datasource)#">
			INSERT INTO TaskStatus(TaskID, StatusID, UsersID, Note)
			VALUES(#trim(taskID)#, #trim(Arguments.statusID)#, #trim(Arguments.usersID)#, '#trim(Arguments.note)#')		
		</cfquery>
		
		<cfset UpdateTaskStatusID(TaskID: TaskID)>
																		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the status id of a Task.  Called by     --->
	<!--- function updateTaskStatus.                                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="UpdateTaskStatusID" hint="This function will be called to update the status id of a Task.">			
		<cfargument name="TaskID" required="yes" type="numeric">
		
		<cfquery name="getStatusID" datasource="#trim(request.datasource)#">
			SELECT statusID
			FROM taskstatus 
			WHERE TaskID = #arguments.TaskID# 
			ORDER BY DateCreated DESC
			LIMIT 1
		</cfquery>
			
		<cfquery name="updateTask" datasource="#trim(request.datasource)#">	
			UPDATE task
			SET statusID = #getStatusID.StatusID#
			WHERE TaskID = #arguments.TaskID#
		</cfquery>
									
	</cffunction>
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Task parameters.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getTaskDB" returntype="query" hint="get the tasks parameters from database.">		
		
		<cfargument name="taskID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfset getTaskQuery = this.getTaskQuery(fields: 'TaskID, ClientID, ObjectID, InstanceID, Note, Active, DateCreated', TaskID: trim(TaskID))>
					
		<!-------------------------------------------------------------------------------------->
		<!--- return the task query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getTaskQuery>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Task parameters.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="addTaskEntry" hint="Add an entry to a task.">		
		
		<cfargument name="taskID" required="yes" type="numeric">
		<cfargument name="userID" required="yes" type="numeric">
		<cfargument name="userFName" required="yes" type="string">
		<cfargument name="userLName" required="yes" type="string">
		<cfargument name="taskEntry" required="yes" type="string">	
				
		<cfset getTask = getTaskXML(taskID)>
	
		<cfif getTask EQ "">
			<cfscript>
				getTask = XmlNew();
				getTask.xmlRoot = XmlElemNew(getTask,"task");
			</cfscript>
		</cfif>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfscript>				
			addTask = XmlElemNew(getTask, "entry");	  
		  	addTask["UserID"] = XmlElemNew(getTask, "UserID");
		  	addTask["UserID"].xmlText = "#trim(userID)#";
		  	addTask["UserFName"] = XmlElemNew(getTask, "UserFName");
		  	addTask["UserFName"].xmlText = "#trim(userFName)#";
		  	addTask["UserLName"] = XmlElemNew(getTask, "UserLName");
		  	addTask["UserLName"].xmlText = "#trim(userLName)#";
		  	addTask["EntryDate"] = XmlElemNew(getTask, "EntryDate");
		  	addTask["EntryDate"].xmlText = "#DateFormat(NOW(), 'mm/dd/yyyy')#";
		  	addTask["EntryTime"] = XmlElemNew(getTask, "EntryTime");
		  	addTask["EntryTime"].xmlText = "#TimeFormat(NOW(), 'hh:mm:ss tt')#"; 	  
		  	addTask["EntryTask"] = XmlElemNew(getTask, "EntryTask");
		  	addTask["EntryTask"].xmlText = "#trim(taskEntry)#"; 			  	
			ArrayAppend(getTask["Task"].xmlChildren, addTask);		   
		</cfscript>
			
		<cfquery name="updateTask" datasource="#trim(request.datasource)#">
			UPDATE task SET Note = '#trim(getTask)#'
			WHERE taskID = #trim(TaskID)#
		</cfquery>	
														
	</cffunction>	
	
		 
		 
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called toget the Task in XML Format.                     --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getTaskXML" hint="Get the tasks of this taskId in an CF XML object">		
		
		<cfargument name="taskID" required="yes" type="numeric">
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task query.                                                            --->
		<!-------------------------------------------------------------------------------------->	
		<cfset getTaskXML = getTaskDB(taskID)>
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create the full XML Node from the XML in Database.                             --->
		<!-------------------------------------------------------------------------------------->	
		<cfif getTaskXML.Note EQ "">
			<cfset taskXML = "">
		<cfelse>	
			<cfset taskXML = XMLParse(getTaskXML.Note)>		
		</cfif>
		
		<cfreturn taskXML>		
														
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the TaskID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getTaskID" hint="get the tasks DBID database table.">		
		
		<cfargument name="objectID" required="yes" type="numeric">
		<cfargument name="instanceID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getTask" datasource="#trim(request.datasource)#">
			SELECT TaskID
			FROM task 
			WHERE objectID = #trim(objectID)# AND instanceID = #trim(instanceID)#		
		</cfquery>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the task query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getTask.TaskID>		
														
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the TaskID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="taskHasBeenViewed" hint="get the tasks DBID database table.">		
		
		<cfargument name="usersID" required="yes" type="numeric">		
		<cfargument name="taskID" required="yes" type="numeric">		
		<cfargument name="hasBeenViewed" default="0">		
		<cfparam name="newList" default="">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getTask" datasource="#trim(request.datasource)#">
			SELECT StatusID	
			FROM taskstatus
			WHERE TaskID = #trim(taskID)# AND usersID = #trim(usersID)#		
			Order by DateCreated DESC
		</cfquery>
												
		<cfset statusList = ValueList(getTask.StatusID)>
		
		<cfif ListContains(statusList, "171")>
			<cfloop list="#trim(statusList)#" index="i">
				<cfset newList = ListAppend(newList, i)>
				<cfif i EQ 171>
					<cfbreak>
				</cfif>
			</cfloop>
		<cfelseif ListContains(statusList, "169")>
			<cfset hasBeenViewed = 1>	
		</cfif>
		
		<cfif ListLen(newList) GTE 1 AND ListContains(newList, "169")>
			<cfset hasBeenViewed = 1>
		</cfif>
		
		<!-------------------------------------------------------------------------------------->
		<!--- return the task query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn trim(hasBeenViewed)>		
														
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Task Statuses.                         --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="taskStatuses" hint="Get the tasks statuses in the database table.">		
					
		<cfargument name="taskID" required="yes" type="numeric">		
		<cfparam name="orderby" default="DESC">		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getTaskStatus" datasource="#trim(request.datasource)#">
			SELECT  sli.ItemNameDisplay, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname, fs.note, fs.dateCreated
			FROM taskstatus fs JOIN view_UserAccountParameters vuap ON fs.UsersID = vuap.UsersID
			LEFT JOIN pa_master.standardlistitem sli ON fs.statusID = sli.StandardListItemID
			WHERE fs.taskID = #trim(taskID)#
			ORDER BY  fs.DateCreated #trim(orderby)#	
		</cfquery>		
					
		<!-------------------------------------------------------------------------------------->
		<!--- return the task statuses query.                                                --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getTaskStatus>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get Assigned by user.                          --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getAssignedBy" hint="Get the task assigned by.">		
					
		<cfargument name="taskID" required="yes" type="numeric">		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Task parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getTaskAssignor" datasource="#trim(request.datasource)#">
			SELECT AssignorID, vuap.FName AS assignorFName, vuap.LName AS assignorLName
			FROM taskassignment ta JOIN view_UserAccountParameters vuap ON ta.AssignorID = vuap.UsersID
			WHERE ta.taskID = #trim(taskID)#
			Order BY ta.DateCreated DESC	
			LIMIT 1		
		</cfquery>		
					
		<!-------------------------------------------------------------------------------------->
		<!--- return the task statuses query.                                                --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getTaskAssignor>		
														
	</cffunction>
	
	
</cfcomponent>

	





