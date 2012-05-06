 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureOpenCloseBean" />
		
		<cfset var qCreateProcedureOpenClose = "" />		
		
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localOpenOrClose = arguments.bean.getOpenOrClose() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedureOpenClose" datasource="#trim(arguments.ds)#">
				INSERT INTO ProcedureOpenClose (ProcedureID,OpenOrClose,UsersID,Note,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localProcedureID))>						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localOpenOrClose)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,	
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
				SELECT LAST_INSERT_ID() AS ProcedureOpenCloseID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setProcedureOpenCloseID(qCreateProcedureOpenClose.ProcedureOpenCloseID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ProcedureOpenCloseBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ProcedureOpenCloseID" required="yes" type="numeric" />		
		<cfset var qGetProcedureOpenClose = "" />		
		
		<cfset qGetProcedureOpenClose = getProcedureOpenClose(trim(arguments.ds), trim(ProcedureOpenCloseID)) />
				
		<cfif qGetProcedureOpenClose.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedureOpenClose = createObject("component", "ProcedureOpenCloseBean").init(arguments.ds);
			objProcedureOpenClose.setProcedureOpenCloseID(qGetProcedureOpenClose.ProcedureOpenCloseID);
			objProcedureOpenClose.setProcedureID(qGetProcedureOpenClose.ProcedureID);
			objProcedureOpenClose.setOpenOrClose(qGetProcedureOpenClose.OpenOrClose);
			objProcedureOpenClose.setUsersID(qGetProcedureOpenClose.UsersID);
			objProcedureOpenClose.setNote(qGetProcedureOpenClose.Note);
			objProcedureOpenClose.setActive(qGetProcedureOpenClose.Active);
			objProcedureOpenClose.setInactiveCode(qGetProcedureOpenClose.InactiveCode);
			objProcedureOpenClose.setDateCreated(qGetProcedureOpenClose.DateCreated);
			objProcedureOpenClose.setDateModified(qGetProcedureOpenClose.DateModified);				
			return objProcedureOpenClose;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureOpenCloseBean" />
		<cfset var qUpdateProcedureOpenClose = "" />
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localOpenOrClose = arguments.bean.getOpenOrClose() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedureOpenClose" datasource="#trim(arguments.ds)#">
				UPDATE ProcedureOpenClose  SET
					
					ProcedureID =				
					<cfif IsNumeric(trim(localProcedureID))>						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					OpenOrClose =						
						<cfqueryparam value="#trim(localOpenOrClose)#" cfsqltype="CF_SQL_INTEGER" />,
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE ProcedureOpenCloseID = <cfqueryparam value="#trim(arguments.bean.getProcedureOpenCloseID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureOpenCloseBean" />
		<cfset var qDeleteProcedureOpenClose = "">

		<cfquery name="qDeleteProcedureOpenClose" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM ProcedureOpenClose
			WHERE ProcedureOpenCloseID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getProcedureOpenCloseID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureOpenClose" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ProcedureOpenCloseID" required="yes" type="numeric" />		
		<cfset var qGetProcedureOpenClose = "" />		
	
		<cfquery name="qGetProcedureOpenClose" datasource="#trim(arguments.ds)#">
	  		SELECT ProcedureOpenCloseID,ProcedureID,OpenOrClose,UsersID,Note,Active,InactiveCode,DateCreated,DateModified
			FROM ProcedureOpenClose  
			WHERE ProcedureOpenCloseID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ProcedureOpenCloseID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedureOpenClose>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


