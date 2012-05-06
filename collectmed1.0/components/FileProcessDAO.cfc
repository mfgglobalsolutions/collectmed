 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="FileProcessBean" />
		
		<cfset var qCreateFileProcess = "" />		
		
		<cfset var localFileID = arguments.bean.getFileID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateFileProcess" datasource="#trim(arguments.ds)#">
				INSERT INTO FileProcess (FileID,StatusID,Note,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localFileID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />,	
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
				SELECT LAST_INSERT_ID() AS FileProcessID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setFileProcessID(qCreateFileProcess.FileProcessID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="FileProcessBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="FileProcessID" required="yes" type="numeric" />		
		<cfset var qGetFileProcess = "" />		
		
		<cfset qGetFileProcess = getFileProcess(trim(arguments.ds), trim(FileProcessID)) />
				
		<cfif qGetFileProcess.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objFileProcess = createObject("component", "FileProcessBean").init(arguments.ds);
			objFileProcess.setFileProcessID(qGetFileProcess.FileProcessID);
			objFileProcess.setFileID(qGetFileProcess.FileID);
			objFileProcess.setStatusID(qGetFileProcess.StatusID);
			objFileProcess.setNote(qGetFileProcess.Note);
			objFileProcess.setActive(qGetFileProcess.Active);
			objFileProcess.setInactiveCode(qGetFileProcess.InactiveCode);
			objFileProcess.setDateCreated(qGetFileProcess.DateCreated);
			objFileProcess.setDateModified(qGetFileProcess.DateModified);				
			return objFileProcess;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="FileProcessBean" />
		<cfset var qUpdateFileProcess = "" />
		<cfset var localFileID = arguments.bean.getFileID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateFileProcess" datasource="#trim(arguments.ds)#">
				UPDATE FileProcess  SET
					
					FileID =						
						<cfqueryparam value="#trim(localFileID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					StatusID =						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE FileProcessID = <cfqueryparam value="#trim(arguments.bean.getFileProcessID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="FileProcessBean" />
		<cfset var qDeleteFileProcess = "">

		<cfquery name="qDeleteFileProcess" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM FileProcess
			WHERE FileProcessID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getFileProcessID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileProcess" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="FileProcessID" required="yes" type="numeric" />		
		<cfset var qGetFileProcess = "" />		
	
		<cfquery name="qGetFileProcess" datasource="#trim(arguments.ds)#">
	  		SELECT FileProcessID,FileID,StatusID,Note,Active,InactiveCode,DateCreated,DateModified
			FROM FileProcess  
			WHERE FileProcessID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.FileProcessID)#" /> 
		</cfquery>
		
		<cfreturn qGetFileProcess>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


