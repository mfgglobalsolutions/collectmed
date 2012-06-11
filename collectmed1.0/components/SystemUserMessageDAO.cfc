 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SystemUserMessageBean" />
		
		<cfset var qCreateSystemUserMessage = "" />		
		
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localDismissed = arguments.bean.getDismissed() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateSystemUserMessage" datasource="#trim(arguments.ds)#">
				INSERT INTO systemusermessage (UsersID,Dismissed,Note,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localDismissed)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
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
			arguments.bean.setSystemUserMessageID(qCreateSystemUserMessage.SystemUserMessageID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="SystemUserMessageBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="SystemUserMessageID" required="yes" type="numeric" />		
		<cfset var qGetSystemUserMessage = "" />		
		
		<cfset qGetSystemUserMessage = getSystemUserMessage(trim(arguments.ds), trim(SystemUserMessageID)) />
				
		<cfif qGetSystemUserMessage.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objSystemUserMessage = createObject("component", "SystemUserMessageBean").init(arguments.ds);
			objSystemUserMessage.setSystemUserMessageID(qGetSystemUserMessage.SystemUserMessageID);
			objSystemUserMessage.setUsersID(qGetSystemUserMessage.UsersID);
			objSystemUserMessage.setDismissed(qGetSystemUserMessage.Dismissed);
			objSystemUserMessage.setNote(qGetSystemUserMessage.Note);
			objSystemUserMessage.setActive(qGetSystemUserMessage.Active);
			objSystemUserMessage.setInactiveCode(qGetSystemUserMessage.InactiveCode);
			objSystemUserMessage.setDateCreated(qGetSystemUserMessage.DateCreated);
			objSystemUserMessage.setDateModified(qGetSystemUserMessage.DateModified);				
			return objSystemUserMessage;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SystemUserMessageBean" />
		<cfset var qUpdateSystemUserMessage = "" />
		<cfset var localUsersID = arguments.bean.getUsersID() />
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
				
			<cfquery name="qUpdateSystemUserMessage" datasource="#trim(arguments.ds)#">
				UPDATE systemusermessage  SET
					
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
				WHERE SystemUserMessageID = <cfqueryparam value="#trim(arguments.bean.getSystemUserMessageID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SystemUserMessageBean" />
		<cfset var qDeleteSystemUserMessage = "">

		<cfquery name="qDeleteSystemUserMessage" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM systemusermessage
			WHERE SystemUserMessageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getSystemUserMessageID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSystemUserMessage" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="SystemUserMessageID" required="yes" type="numeric" />		
		<cfset var qGetSystemUserMessage = "" />		
	
		<cfquery name="qGetSystemUserMessage" datasource="#trim(arguments.ds)#">
	  		SELECT SystemUserMessageID,UsersID,Dismissed,Note,Active,InactiveCode,DateCreated,DateModified
			FROM systemusermessage  
			WHERE SystemUserMessageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.SystemUserMessageID)#" /> 
		</cfquery>
		
		<cfreturn qGetSystemUserMessage>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





