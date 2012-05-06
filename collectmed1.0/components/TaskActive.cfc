 	


<cfcomponent name="taskActive" output="false" alias="taskActive">

	<cfproperty name="TaskID" type="numeric" default="0" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="CreatorID" type="numeric" default="" />
	<cfproperty name="ObjectID" type="numeric" default="" />
	<cfproperty name="InstanceID" type="numeric" default="" />
	<cfproperty name="Priority" type="numeric" default="" />
	<cfproperty name="AssignedToUserID" type="numeric" default="" />
	<cfproperty name="StatusID" type="numeric" default="" />
	<cfproperty name="DueDate" type="datetime" default="" />
	<cfproperty name="Note" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.TaskID = 0;
		variables.ClientID = "";
		variables.CreatorID = "";
		variables.ObjectID = "";
		variables.InstanceID = "";
		variables.Priority = "";
		variables.AssignedToUserID = "";
		variables.StatusID = "";
		variables.DueDate = "";
		variables.Note = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="taskActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "TaskID") AND stValues.TaskID NEQ 0>
				<cfquery name="qGetTask" datasource="#trim(variables.ds)#">
			  		SELECT TaskID,ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode,DateCreated,DateModified
					FROM Task  
					WHERE TaskID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.TaskID#" /> 
				</cfquery>		
				<cfif qGetTask.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClientID = qGetTask.ClientID;
					variables.CreatorID = qGetTask.CreatorID;
					variables.ObjectID = qGetTask.ObjectID;
					variables.InstanceID = qGetTask.InstanceID;
					variables.Priority = qGetTask.Priority;
					variables.AssignedToUserID = qGetTask.AssignedToUserID;
					variables.StatusID = qGetTask.StatusID;
					variables.DueDate = qGetTask.DueDate;
					variables.Note = qGetTask.Note;
					variables.Active = qGetTask.Active;
					variables.InactiveCode = qGetTask.InactiveCode;
					variables.DateModified = qGetTask.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "TaskID")><cfset variables.TaskID = stValues.TaskID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "CreatorID")><cfset variables.CreatorID = stValues.CreatorID /></cfif>
			<cfif StructKeyExists(stValues, "ObjectID")><cfset variables.ObjectID = stValues.ObjectID /></cfif>
			<cfif StructKeyExists(stValues, "InstanceID")><cfset variables.InstanceID = stValues.InstanceID /></cfif>
			<cfif StructKeyExists(stValues, "Priority")><cfset variables.Priority = stValues.Priority /></cfif>
			<cfif StructKeyExists(stValues, "AssignedToUserID")><cfset variables.AssignedToUserID = stValues.AssignedToUserID /></cfif>
			<cfif StructKeyExists(stValues, "StatusID")><cfset variables.StatusID = stValues.StatusID /></cfif>
			<cfif StructKeyExists(stValues, "DueDate")><cfset variables.DueDate = stValues.DueDate /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
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
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CreatorID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCreatorID" acess="public" output="false" returntype="any">
		<cfreturn variables.CreatorID>
	</cffunction>
	
	<cffunction name="setCreatorID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CreatorID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.CreatorID)) OR trim(arguments.CreatorID) EQ "">
			<cfset variables.CreatorID = arguments.CreatorID />
		<cfelse>
			<cfthrow message="CreatorID (#arguments.CreatorID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CreatorID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ObjectID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getObjectID" acess="public" output="false" returntype="any">
		<cfreturn variables.ObjectID>
	</cffunction>
	
	<cffunction name="setObjectID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ObjectID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ObjectID)) OR trim(arguments.ObjectID) EQ "">
			<cfset variables.ObjectID = arguments.ObjectID />
		<cfelse>
			<cfthrow message="ObjectID (#arguments.ObjectID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ObjectID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InstanceID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInstanceID" acess="public" output="false" returntype="any">
		<cfreturn variables.InstanceID>
	</cffunction>
	
	<cffunction name="setInstanceID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InstanceID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InstanceID)) OR trim(arguments.InstanceID) EQ "">
			<cfset variables.InstanceID = arguments.InstanceID />
		<cfelse>
			<cfthrow message="InstanceID (#arguments.InstanceID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InstanceID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Priority.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPriority" acess="public" output="false" returntype="any">
		<cfreturn variables.Priority>
	</cffunction>
	
	<cffunction name="setPriority" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Priority" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Priority)) OR trim(arguments.Priority) EQ "">
			<cfset variables.Priority = arguments.Priority />
		<cfelse>
			<cfthrow message="Priority (#arguments.Priority#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Priority") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AssignedToUserID.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAssignedToUserID" acess="public" output="false" returntype="any">
		<cfreturn variables.AssignedToUserID>
	</cffunction>
	
	<cffunction name="setAssignedToUserID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AssignedToUserID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AssignedToUserID)) OR trim(arguments.AssignedToUserID) EQ "">
			<cfset variables.AssignedToUserID = arguments.AssignedToUserID />
		<cfelse>
			<cfthrow message="AssignedToUserID (#arguments.AssignedToUserID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AssignedToUserID") />		
		
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
	<!--- GET and SET methods for DueDate.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDueDate" acess="public" output="false" returntype="any">
		<cfreturn variables.DueDate>
	</cffunction>
	
	<cffunction name="setDueDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DueDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DueDate)) OR trim(arguments.DueDate) EQ "">
			<cfset variables.DueDate = arguments.DueDate />
		<cfelse>
			<cfthrow message="DueDate (#arguments.DueDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DueDate") />		
		
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
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
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
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getTaskID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getTaskID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTask" output="false" access="public" returntype="query">
				
		<cfargument name="TaskID" required="yes" type="numeric" />		
		<cfset var qGetTask = "" />		
	
		<cfquery name="qGetTask" datasource="#trim(variables.ds)#">
	  		SELECT TaskID,ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,Active,InactiveCode,DateCreated,DateModified
			FROM Task  
			WHERE TaskID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.TaskID)#" /> 
		</cfquery>
		
		<cfreturn qGetTask>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="TaskActive" />
		
		<cfset var qCreateTask = "" />		
		
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localCreatorID = arguments.obj.getCreatorID() />
		<cfset var localObjectID = arguments.obj.getObjectID() />
		<cfset var localInstanceID = arguments.obj.getInstanceID() />
		<cfset var localPriority = arguments.obj.getPriority() />
		<cfset var localAssignedToUserID = arguments.obj.getAssignedToUserID() />
		<cfset var localStatusID = arguments.obj.getStatusID() />
		<cfset var localDueDate = arguments.obj.getDueDate() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateTask" datasource="#trim(variables.ds)#">
				INSERT INTO Task (ClientID,CreatorID,ObjectID,InstanceID,Priority,AssignedToUserID,StatusID,DueDate,Note,InactiveCode)
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
			read(qCreateTask.TaskID);
			arguments.obj.setTaskID(qCreateTask.TaskID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="TaskActive">
				
		<cfargument name="TaskID" required="yes" type="numeric" />		
		<cfset var qGetTask = "" />		
		
		<cfset qGetTask = getTask(trim(TaskID)) />
				
		<cfif qGetTask.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setTaskID(qGetTask.TaskID);
			this.setClientID(qGetTask.ClientID);
			this.setCreatorID(qGetTask.CreatorID);
			this.setObjectID(qGetTask.ObjectID);
			this.setInstanceID(qGetTask.InstanceID);
			this.setPriority(qGetTask.Priority);
			this.setAssignedToUserID(qGetTask.AssignedToUserID);
			this.setStatusID(qGetTask.StatusID);
			this.setDueDate(qGetTask.DueDate);
			this.setNote(qGetTask.Note);
			this.setActive(qGetTask.Active);
			this.setInactiveCode(qGetTask.InactiveCode);
			this.setDateCreated(qGetTask.DateCreated);
			this.setDateModified(qGetTask.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="TaskActive" />
		<cfset var qUpdateTask = "" />
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localCreatorID = arguments.obj.getCreatorID() />
		<cfset var localObjectID = arguments.obj.getObjectID() />
		<cfset var localInstanceID = arguments.obj.getInstanceID() />
		<cfset var localPriority = arguments.obj.getPriority() />
		<cfset var localAssignedToUserID = arguments.obj.getAssignedToUserID() />
		<cfset var localStatusID = arguments.obj.getStatusID() />
		<cfset var localDueDate = arguments.obj.getDueDate() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateTask" datasource="#trim(variables.ds)#">
				UPDATE Task  SET
					
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
				WHERE TaskID = <cfqueryparam value="#trim(arguments.obj.getTaskID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="TaskActive" />
		<cfset var qDeleteTask = "">

		<cfquery name="qDeleteTask" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Task
			WHERE TaskID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getTaskID())#" /> 
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


