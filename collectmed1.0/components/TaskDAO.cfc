 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskBean" />
		
		<cfset var qCreateTask = "" />		
		
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localCreatorID = arguments.bean.getCreatorID() />
		<cfset var localObjectID = arguments.bean.getObjectID() />
		<cfset var localInstanceID = arguments.bean.getInstanceID() />
		<cfset var localPriority = arguments.bean.getPriority() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localDueDate = arguments.bean.getDueDate() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateTask" datasource="#trim(arguments.ds)#">
				INSERT INTO task (ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localCreatorID))>						
						<cfqueryparam value="#trim(localCreatorID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localObjectID))>						
						<cfqueryparam value="#trim(localObjectID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localInstanceID))>						
						<cfqueryparam value="#trim(localInstanceID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localPriority))>						
						<cfqueryparam value="#trim(localPriority)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localStatusID))>						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif IsDate(trim(localDueDate))>						
						<cfqueryparam value="#trim(localDueDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS TaskID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setTaskID(qCreateTask.TaskID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="TaskBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="TaskID" required="yes" type="numeric" />		
		<cfset var qGetTask = "" />		
		
		<cfset qGetTask = getTask(trim(arguments.ds), trim(TaskID)) />
				
		<cfif qGetTask.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objTask = createObject("component", "TaskBean").init(arguments.ds);
			objTask.setTaskID(qGetTask.TaskID);
			objTask.setClientID(qGetTask.ClientID);
			objTask.setCreatorID(qGetTask.CreatorID);
			objTask.setObjectID(qGetTask.ObjectID);
			objTask.setInstanceID(qGetTask.InstanceID);
			objTask.setPriority(qGetTask.Priority);
			objTask.setAssignedToUserID(qGetTask.AssignedToUserID);
			objTask.setStatusID(qGetTask.StatusID);
			objTask.setDueDate(qGetTask.DueDate);
			objTask.setNote(qGetTask.Note);
			objTask.setActive(qGetTask.Active);
			objTask.setInactiveCode(qGetTask.InactiveCode);
			objTask.setDateCreated(qGetTask.DateCreated);
			objTask.setDateModified(qGetTask.DateModified);				
			return objTask;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskBean" />
		<cfset var qUpdateTask = "" />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localCreatorID = arguments.bean.getCreatorID() />
		<cfset var localObjectID = arguments.bean.getObjectID() />
		<cfset var localInstanceID = arguments.bean.getInstanceID() />
		<cfset var localPriority = arguments.bean.getPriority() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localDueDate = arguments.bean.getDueDate() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateTask" datasource="#trim(arguments.ds)#">
				UPDATE task  SET
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					CreatorID =				
					<cfif IsNumeric(trim(localCreatorID))>						
						<cfqueryparam value="#trim(localCreatorID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ObjectID =				
					<cfif IsNumeric(trim(localObjectID))>						
						<cfqueryparam value="#trim(localObjectID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					InstanceID =				
					<cfif IsNumeric(trim(localInstanceID))>						
						<cfqueryparam value="#trim(localInstanceID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Priority =				
					<cfif IsNumeric(trim(localPriority))>						
						<cfqueryparam value="#trim(localPriority)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AssignedToUserID =				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					StatusID =				
					<cfif IsNumeric(trim(localStatusID))>						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DueDate =	
					<cfif IsDate(trim(localDueDate))>						
						<cfqueryparam value="#trim(localDueDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					Note =	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
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
				WHERE TaskID = <cfqueryparam value="#trim(arguments.bean.getTaskID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TaskBean" />
		<cfset var qDeleteTask = "">

		<cfquery name="qDeleteTask" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM task
			WHERE TaskID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getTaskID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTask" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="TaskID" required="yes" type="numeric" />		
		<cfset var qGetTask = "" />		
	
		<cfquery name="qGetTask" datasource="#trim(arguments.ds)#">
	  		SELECT TaskID,ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode,DateCreated,DateModified
			FROM task  
			WHERE TaskID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.TaskID)#" /> 
		</cfquery>
		
		<cfreturn qGetTask>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





