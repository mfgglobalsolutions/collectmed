 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeAutoSaveBean" />
		
		<cfset var qCreateIntakeAutoSave = "" />		
		
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localPatientFName = arguments.bean.getPatientFName() />
		<cfset var localPatientLName = arguments.bean.getPatientLName() />
		<cfset var localIntakeXML = arguments.bean.getIntakeXML() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateIntakeAutoSave" datasource="#trim(arguments.ds)#">
				INSERT INTO intakeautosave (UsersID,PatientFName,PatientLName,IntakeXML,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localPatientFName)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localPatientLName)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localIntakeXML) NEQ "" AND trim(localIntakeXML) NEQ "@@" AND trim(localIntakeXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localIntakeXML)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS RecordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setRecordID(qCreateIntakeAutoSave.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IntakeAutoSaveBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAutoSave = "" />		
		
		<cfset qGetIntakeAutoSave = getIntakeAutoSave(trim(arguments.ds), trim(IntakeAutoSaveID)) />
				
		<cfif qGetIntakeAutoSave.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objIntakeAutoSave = createObject("component", "IntakeAutoSaveBean").init(arguments.ds);
			objIntakeAutoSave.setRecordID(qGetIntakeAutoSave.RecordID);
			objIntakeAutoSave.setUsersID(qGetIntakeAutoSave.UsersID);
			objIntakeAutoSave.setPatientFName(qGetIntakeAutoSave.PatientFName);
			objIntakeAutoSave.setPatientLName(qGetIntakeAutoSave.PatientLName);
			objIntakeAutoSave.setIntakeXML(qGetIntakeAutoSave.IntakeXML);
			objIntakeAutoSave.setActive(qGetIntakeAutoSave.Active);
			objIntakeAutoSave.setInactiveCode(qGetIntakeAutoSave.InactiveCode);
			objIntakeAutoSave.setDateCreated(qGetIntakeAutoSave.DateCreated);
			objIntakeAutoSave.setDateModified(qGetIntakeAutoSave.DateModified);				
			return objIntakeAutoSave;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeAutoSaveBean" />
		<cfset var qUpdateIntakeAutoSave = "" />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localPatientFName = arguments.bean.getPatientFName() />
		<cfset var localPatientLName = arguments.bean.getPatientLName() />
		<cfset var localIntakeXML = arguments.bean.getIntakeXML() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateIntakeAutoSave" datasource="#trim(arguments.ds)#">
				UPDATE intakeautosave  SET
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					PatientFName =						
						<cfqueryparam value="#trim(localPatientFName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					PatientLName =						
						<cfqueryparam value="#trim(localPatientLName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					IntakeXML =	
					<cfif trim(localIntakeXML) NEQ "" AND trim(localIntakeXML) NEQ "@@" AND trim(localIntakeXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localIntakeXML)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.bean.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeAutoSaveBean" />
		<cfset var qDeleteIntakeAutoSave = "">

		<cfquery name="qDeleteIntakeAutoSave" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM intakeautosave
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeAutoSave" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="IntakeAutoSaveID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAutoSave = "" />		
	
		<cfquery name="qGetIntakeAutoSave" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,UsersID,PatientFName,PatientLName,IntakeXML,Active,InactiveCode,DateCreated,DateModified
			FROM intakeautosave  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetIntakeAutoSave>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





