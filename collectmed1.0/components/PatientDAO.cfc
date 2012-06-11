 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PatientBean" />
		
		<cfset var qCreatePatient = "" />		
		
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localClaimSubmitterIdentifier = arguments.bean.getClaimSubmitterIdentifier() />
		<cfset var localNM1IdentificationCode9 = arguments.bean.getNM1IdentificationCode9() />
		<cfset var localAccountNumber = arguments.bean.getAccountNumber() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePatient" datasource="#trim(arguments.ds)#">
				INSERT INTO patient (EntityID,ClaimSubmitterIdentifier,NM1IdentificationCode9,AccountNumber,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localClaimSubmitterIdentifier) NEQ "" AND trim(localClaimSubmitterIdentifier) NEQ "@@" AND trim(localClaimSubmitterIdentifier) NEQ "NULL">						
						<cfqueryparam value="#trim(localClaimSubmitterIdentifier)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localNM1IdentificationCode9) NEQ "" AND trim(localNM1IdentificationCode9) NEQ "@@" AND trim(localNM1IdentificationCode9) NEQ "NULL">						
						<cfqueryparam value="#trim(localNM1IdentificationCode9)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAccountNumber) NEQ "" AND trim(localAccountNumber) NEQ "@@" AND trim(localAccountNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localAccountNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS PatientID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setPatientID(qCreatePatient.PatientID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PatientBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PatientID" required="yes" type="numeric" />		
		<cfset var qGetPatient = "" />		
		
		<cfset qGetPatient = getPatient(trim(arguments.ds), trim(PatientID)) />
				
		<cfif qGetPatient.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objPatient = createObject("component", "PatientBean").init(arguments.ds);
			objPatient.setPatientID(qGetPatient.PatientID);
			objPatient.setEntityID(qGetPatient.EntityID);
			objPatient.setClaimSubmitterIdentifier(qGetPatient.ClaimSubmitterIdentifier);
			objPatient.setNM1IdentificationCode9(qGetPatient.NM1IdentificationCode9);
			objPatient.setAccountNumber(qGetPatient.AccountNumber);
			objPatient.setActive(qGetPatient.Active);
			objPatient.setInactiveCode(qGetPatient.InactiveCode);
			objPatient.setDateCreated(qGetPatient.DateCreated);
			objPatient.setDateModified(qGetPatient.DateModified);				
			return objPatient;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PatientBean" />
		<cfset var qUpdatePatient = "" />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localClaimSubmitterIdentifier = arguments.bean.getClaimSubmitterIdentifier() />
		<cfset var localNM1IdentificationCode9 = arguments.bean.getNM1IdentificationCode9() />
		<cfset var localAccountNumber = arguments.bean.getAccountNumber() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePatient" datasource="#trim(arguments.ds)#">
				UPDATE patient  SET
					
					EntityID =				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimSubmitterIdentifier =	
					<cfif trim(localClaimSubmitterIdentifier) NEQ "" AND trim(localClaimSubmitterIdentifier) NEQ "@@" AND trim(localClaimSubmitterIdentifier) NEQ "NULL">						
						<cfqueryparam value="#trim(localClaimSubmitterIdentifier)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					NM1IdentificationCode9 =	
					<cfif trim(localNM1IdentificationCode9) NEQ "" AND trim(localNM1IdentificationCode9) NEQ "@@" AND trim(localNM1IdentificationCode9) NEQ "NULL">						
						<cfqueryparam value="#trim(localNM1IdentificationCode9)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AccountNumber =	
					<cfif trim(localAccountNumber) NEQ "" AND trim(localAccountNumber) NEQ "@@" AND trim(localAccountNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localAccountNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE PatientID = <cfqueryparam value="#trim(arguments.bean.getPatientID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PatientBean" />
		<cfset var qDeletePatient = "">

		<cfquery name="qDeletePatient" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM patient
			WHERE PatientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getPatientID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatient" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PatientID" required="yes" type="numeric" />		
		<cfset var qGetPatient = "" />		
	
		<cfquery name="qGetPatient" datasource="#trim(arguments.ds)#">
	  		SELECT PatientID,EntityID,ClaimSubmitterIdentifier,NM1IdentificationCode9,AccountNumber,Active,InactiveCode,DateCreated,DateModified
			FROM patient  
			WHERE PatientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PatientID)#" /> 
		</cfquery>
		
		<cfreturn qGetPatient>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





