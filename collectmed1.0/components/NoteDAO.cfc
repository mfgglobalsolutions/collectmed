 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="NoteBean" />
		
		<cfset var qCreateNote = "" />		
		
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localObjectID = arguments.bean.getObjectID() />
		<cfset var localInstanceID = arguments.bean.getInstanceID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateNote" datasource="#trim(arguments.ds)#">
				INSERT INTO Note (ClientID,ObjectID,InstanceID,Note,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localObjectID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localInstanceID))>						
						<cfqueryparam value="#trim(localInstanceID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
				SELECT LAST_INSERT_ID() AS NoteID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setNoteID(qCreateNote.NoteID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="NoteBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="NoteID" required="yes" type="numeric" />		
		<cfset var qGetNote = "" />		
		
		<cfset qGetNote = getNote(trim(arguments.ds), trim(NoteID)) />
				
		<cfif qGetNote.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objNote = createObject("component", "NoteBean").init(arguments.ds);
			objNote.setNoteID(qGetNote.NoteID);
			objNote.setClientID(qGetNote.ClientID);
			objNote.setObjectID(qGetNote.ObjectID);
			objNote.setInstanceID(qGetNote.InstanceID);
			objNote.setNote(qGetNote.Note);
			objNote.setActive(qGetNote.Active);
			objNote.setInactiveCode(qGetNote.InactiveCode);
			objNote.setDateCreated(qGetNote.DateCreated);
			objNote.setDateModified(qGetNote.DateModified);				
			return objNote;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="NoteBean" />
		<cfset var qUpdateNote = "" />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localObjectID = arguments.bean.getObjectID() />
		<cfset var localInstanceID = arguments.bean.getInstanceID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateNote" datasource="#trim(arguments.ds)#">
				UPDATE Note  SET
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ObjectID =						
						<cfqueryparam value="#trim(localObjectID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					InstanceID =				
					<cfif IsNumeric(trim(localInstanceID))>						
						<cfqueryparam value="#trim(localInstanceID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
				WHERE NoteID = <cfqueryparam value="#trim(arguments.bean.getNoteID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="NoteBean" />
		<cfset var qDeleteNote = "">

		<cfquery name="qDeleteNote" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Note
			WHERE NoteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getNoteID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getNote" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="NoteID" required="yes" type="numeric" />		
		<cfset var qGetNote = "" />		
	
		<cfquery name="qGetNote" datasource="#trim(arguments.ds)#">
	  		SELECT NoteID,ClientID,ObjectID,InstanceID,Note,Active,InactiveCode,DateCreated,DateModified
			FROM Note  
			WHERE NoteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.NoteID)#" /> 
		</cfquery>
		
		<cfreturn qGetNote>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


