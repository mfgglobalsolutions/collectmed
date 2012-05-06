 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ReminderBean" />
		
		<cfset var qCreateReminder = "" />		
		
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localObjectID = arguments.bean.getObjectID() />
		<cfset var localInstanceID = arguments.bean.getInstanceID() />
		<cfset var localshowDate = arguments.bean.getshowDate() />
		<cfset var localDismissed = arguments.bean.getDismissed() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateReminder" datasource="#trim(arguments.ds)#">
				INSERT INTO Reminder (UsersID,ObjectID,InstanceID,showDate,Dismissed,Note,Active,InactiveCode)
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
						<cfqueryparam value="#trim(localDismissed)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
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
			arguments.bean.setReminderID(qCreateReminder.ReminderID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ReminderBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ReminderID" required="yes" type="numeric" />		
		<cfset var qGetReminder = "" />		
		
		<cfset qGetReminder = getReminder(trim(arguments.ds), trim(ReminderID)) />
				
		<cfif qGetReminder.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objReminder = createObject("component", "ReminderBean").init(arguments.ds);
			objReminder.setReminderID(qGetReminder.ReminderID);
			objReminder.setUsersID(qGetReminder.UsersID);
			objReminder.setObjectID(qGetReminder.ObjectID);
			objReminder.setInstanceID(qGetReminder.InstanceID);
			objReminder.setshowDate(qGetReminder.showDate);
			objReminder.setDismissed(qGetReminder.Dismissed);
			objReminder.setNote(qGetReminder.Note);
			objReminder.setActive(qGetReminder.Active);
			objReminder.setInactiveCode(qGetReminder.InactiveCode);
			objReminder.setDateCreated(qGetReminder.DateCreated);
			objReminder.setDateModified(qGetReminder.DateModified);				
			return objReminder;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ReminderBean" />
		<cfset var qUpdateReminder = "" />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localObjectID = arguments.bean.getObjectID() />
		<cfset var localInstanceID = arguments.bean.getInstanceID() />
		<cfset var localshowDate = arguments.bean.getshowDate() />
		<cfset var localDismissed = arguments.bean.getDismissed() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateReminder" datasource="#trim(arguments.ds)#">
				UPDATE Reminder  SET
					
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
				WHERE ReminderID = <cfqueryparam value="#trim(arguments.bean.getReminderID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ReminderBean" />
		<cfset var qDeleteReminder = "">

		<cfquery name="qDeleteReminder" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Reminder
			WHERE ReminderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getReminderID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getReminder" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ReminderID" required="yes" type="numeric" />		
		<cfset var qGetReminder = "" />		
	
		<cfquery name="qGetReminder" datasource="#trim(arguments.ds)#">
	  		SELECT ReminderID,UsersID,ObjectID,InstanceID,showDate,Dismissed,Note,Active,InactiveCode,DateCreated,DateModified
			FROM Reminder  
			WHERE ReminderID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ReminderID)#" /> 
		</cfquery>
		
		<cfreturn qGetReminder>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


