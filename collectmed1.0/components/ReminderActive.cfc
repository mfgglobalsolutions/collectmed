 	


<cfcomponent name="reminderActive" output="false" alias="reminderActive">

	<cfproperty name="ReminderID" type="numeric" default="0" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="ObjectID" type="numeric" default="" />
	<cfproperty name="InstanceID" type="numeric" default="" />
	<cfproperty name="showDate" type="datetime" default="" />
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
		variables.ReminderID = 0;
		variables.UsersID = "";
		variables.ObjectID = "";
		variables.InstanceID = "";
		variables.showDate = "";
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
	<cffunction name="init" output="false" returntype="reminderActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ReminderID") AND stValues.ReminderID NEQ 0>
				<cfquery name="qGetReminder" datasource="#trim(variables.ds)#">
			  		SELECT ReminderID,UsersID,ObjectID,InstanceID,showDate,Dismissed,Note,Active,InactiveCode,DateCreated,DateModified
					FROM reminder  
					WHERE ReminderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ReminderID#" /> 
				</cfquery>		
				<cfif qGetReminder.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.UsersID = qGetReminder.UsersID;
					variables.ObjectID = qGetReminder.ObjectID;
					variables.InstanceID = qGetReminder.InstanceID;
					variables.showDate = qGetReminder.showDate;
					variables.Dismissed = qGetReminder.Dismissed;
					variables.Note = qGetReminder.Note;
					variables.Active = qGetReminder.Active;
					variables.InactiveCode = qGetReminder.InactiveCode;
					variables.DateModified = qGetReminder.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ReminderID")><cfset variables.ReminderID = stValues.ReminderID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "ObjectID")><cfset variables.ObjectID = stValues.ObjectID /></cfif>
			<cfif StructKeyExists(stValues, "InstanceID")><cfset variables.InstanceID = stValues.InstanceID /></cfif>
			<cfif StructKeyExists(stValues, "showDate")><cfset variables.showDate = stValues.showDate /></cfif>
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
	<!--- GET and SET methods for ReminderID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getReminderID" acess="public" output="false" returntype="any">
		<cfreturn variables.ReminderID>
	</cffunction>
	
	<cffunction name="setReminderID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ReminderID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ReminderID)) OR trim(arguments.ReminderID) EQ "">
			<cfset variables.ReminderID = arguments.ReminderID />
		<cfelse>
			<cfthrow message="ReminderID (#arguments.ReminderID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ReminderID") />		
		
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
	<!--- GET and SET methods for showDate.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getshowDate" acess="public" output="false" returntype="any">
		<cfreturn variables.showDate>
	</cffunction>
	
	<cffunction name="setshowDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="showDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.showDate)) OR trim(arguments.showDate) EQ "">
			<cfset variables.showDate = arguments.showDate />
		<cfelse>
			<cfthrow message="showDate (#arguments.showDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "showDate") />		
		
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
				 		
		<cfif this.getReminderID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getReminderID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getReminder" output="false" access="public" returntype="query">
				
		<cfargument name="ReminderID" required="yes" type="numeric" />		
		<cfset var qGetReminder = "" />		
	
		<cfquery name="qGetReminder" datasource="#trim(variables.ds)#">
	  		SELECT ReminderID,UsersID,ObjectID,InstanceID,showDate,Dismissed,Note,Active,InactiveCode,DateCreated,DateModified
			FROM reminder  
			WHERE ReminderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ReminderID)#" /> 
		</cfquery>
		
		<cfreturn qGetReminder>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ReminderActive" />
		
		<cfset var qCreateReminder = "" />		
		
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localObjectID = arguments.obj.getObjectID() />
		<cfset var localInstanceID = arguments.obj.getInstanceID() />
		<cfset var localshowDate = arguments.obj.getshowDate() />
		<cfset var localDismissed = arguments.obj.getDismissed() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateReminder" datasource="#trim(variables.ds)#">
				INSERT INTO reminder (UsersID,ObjectID,InstanceID,showDate,Note,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,				
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
						<cfqueryparam value="#trim(localshowDate)#" cfsqltype="CF_SQL_TIMESTAMP" />,						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ReminderID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateReminder.ReminderID);
			arguments.obj.setReminderID(qCreateReminder.ReminderID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ReminderActive">
				
		<cfargument name="ReminderID" required="yes" type="numeric" />		
		<cfset var qGetReminder = "" />		
		
		<cfset qGetReminder = getReminder(trim(ReminderID)) />
				
		<cfif qGetReminder.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setReminderID(qGetReminder.ReminderID);
			this.setUsersID(qGetReminder.UsersID);
			this.setObjectID(qGetReminder.ObjectID);
			this.setInstanceID(qGetReminder.InstanceID);
			this.setshowDate(qGetReminder.showDate);
			this.setDismissed(qGetReminder.Dismissed);
			this.setNote(qGetReminder.Note);
			this.setActive(qGetReminder.Active);
			this.setInactiveCode(qGetReminder.InactiveCode);
			this.setDateCreated(qGetReminder.DateCreated);
			this.setDateModified(qGetReminder.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ReminderActive" />
		<cfset var qUpdateReminder = "" />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localObjectID = arguments.obj.getObjectID() />
		<cfset var localInstanceID = arguments.obj.getInstanceID() />
		<cfset var localshowDate = arguments.obj.getshowDate() />
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
				
			<cfquery name="qUpdateReminder" datasource="#trim(variables.ds)#">
				UPDATE reminder  SET
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
					
					showDate =						
						<cfqueryparam value="#trim(localshowDate)#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
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
				WHERE ReminderID = <cfqueryparam value="#trim(arguments.obj.getReminderID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="ReminderActive" />
		<cfset var qDeleteReminder = "">

		<cfquery name="qDeleteReminder" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM reminder
			WHERE ReminderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getReminderID())#" /> 
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





