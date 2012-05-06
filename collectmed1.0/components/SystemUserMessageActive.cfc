 	


<cfcomponent name="systemusermessageActive" output="false" alias="systemusermessageActive">

	<cfproperty name="SystemUserMessageID" type="numeric" default="0" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="Dismissed" type="numeric" default="" />
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
		variables.SystemUserMessageID = 0;
		variables.UsersID = "";
		variables.Dismissed = "";
		variables.Note = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="systemusermessageActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "SystemUserMessageID") AND stValues.SystemUserMessageID NEQ 0>
				<cfquery name="qGetSystemUserMessage" datasource="#trim(variables.ds)#">
			  		SELECT SystemUserMessageID,UsersID,Dismissed,Note,Active,InactiveCode,DateCreated,DateModified
					FROM SystemUserMessage  
					WHERE SystemUserMessageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.SystemUserMessageID#" /> 
				</cfquery>		
				<cfif qGetSystemUserMessage.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.UsersID = qGetSystemUserMessage.UsersID;
					variables.Dismissed = qGetSystemUserMessage.Dismissed;
					variables.Note = qGetSystemUserMessage.Note;
					variables.Active = qGetSystemUserMessage.Active;
					variables.InactiveCode = qGetSystemUserMessage.InactiveCode;
					variables.DateModified = qGetSystemUserMessage.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "SystemUserMessageID")><cfset variables.SystemUserMessageID = stValues.SystemUserMessageID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "Dismissed")><cfset variables.Dismissed = stValues.Dismissed /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SystemUserMessageID.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSystemUserMessageID" acess="public" output="false" returntype="any">
		<cfreturn variables.SystemUserMessageID>
	</cffunction>
	
	<cffunction name="setSystemUserMessageID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SystemUserMessageID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SystemUserMessageID)) OR trim(arguments.SystemUserMessageID) EQ "">
			<cfset variables.SystemUserMessageID = arguments.SystemUserMessageID />
		<cfelse>
			<cfthrow message="SystemUserMessageID (#arguments.SystemUserMessageID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SystemUserMessageID") />		
		
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
	<!--- GET and SET methods for Dismissed.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDismissed" acess="public" output="false" returntype="any">
		<cfreturn variables.Dismissed>
	</cffunction>
	
	<cffunction name="setDismissed" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Dismissed" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Dismissed)) OR trim(arguments.Dismissed) EQ "">
			<cfset variables.Dismissed = arguments.Dismissed />
		<cfelse>
			<cfthrow message="Dismissed (#arguments.Dismissed#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Dismissed") />		
		
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
				 		
		<cfif this.getSystemUserMessageID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getSystemUserMessageID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSystemUserMessage" output="false" access="public" returntype="query">
				
		<cfargument name="SystemUserMessageID" required="yes" type="numeric" />		
		<cfset var qGetSystemUserMessage = "" />		
	
		<cfquery name="qGetSystemUserMessage" datasource="#trim(variables.ds)#">
	  		SELECT SystemUserMessageID,UsersID,Dismissed,Note,Active,InactiveCode,DateCreated,DateModified
			FROM SystemUserMessage  
			WHERE SystemUserMessageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.SystemUserMessageID)#" /> 
		</cfquery>
		
		<cfreturn qGetSystemUserMessage>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="SystemUserMessageActive" />
		
		<cfset var qCreateSystemUserMessage = "" />		
		
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localDismissed = arguments.obj.getDismissed() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateSystemUserMessage" datasource="#trim(variables.ds)#">
				INSERT INTO SystemUserMessage (UsersID,Note,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS SystemUserMessageID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateSystemUserMessage.SystemUserMessageID);
			arguments.obj.setSystemUserMessageID(qCreateSystemUserMessage.SystemUserMessageID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="SystemUserMessageActive">
				
		<cfargument name="SystemUserMessageID" required="yes" type="numeric" />		
		<cfset var qGetSystemUserMessage = "" />		
		
		<cfset qGetSystemUserMessage = getSystemUserMessage(trim(SystemUserMessageID)) />
				
		<cfif qGetSystemUserMessage.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setSystemUserMessageID(qGetSystemUserMessage.SystemUserMessageID);
			this.setUsersID(qGetSystemUserMessage.UsersID);
			this.setDismissed(qGetSystemUserMessage.Dismissed);
			this.setNote(qGetSystemUserMessage.Note);
			this.setActive(qGetSystemUserMessage.Active);
			this.setInactiveCode(qGetSystemUserMessage.InactiveCode);
			this.setDateCreated(qGetSystemUserMessage.DateCreated);
			this.setDateModified(qGetSystemUserMessage.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="SystemUserMessageActive" />
		<cfset var qUpdateSystemUserMessage = "" />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localDismissed = arguments.obj.getDismissed() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateSystemUserMessage" datasource="#trim(variables.ds)#">
				UPDATE SystemUserMessage  SET
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Dismissed =						
						<cfqueryparam value="#trim(localDismissed)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Note =						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
				WHERE SystemUserMessageID = <cfqueryparam value="#trim(arguments.obj.getSystemUserMessageID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="SystemUserMessageActive" />
		<cfset var qDeleteSystemUserMessage = "">

		<cfquery name="qDeleteSystemUserMessage" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM SystemUserMessage
			WHERE SystemUserMessageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getSystemUserMessageID())#" /> 
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


