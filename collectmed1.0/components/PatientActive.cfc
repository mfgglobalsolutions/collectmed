 	


<cfcomponent name="patientActive" output="false" alias="patientActive">

	<cfproperty name="PatientID" type="numeric" default="0" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="ClaimSubmitterIdentifier" type="string" default="" />
	<cfproperty name="NM1IdentificationCode9" type="string" default="" />
	<cfproperty name="AccountNumber" type="string" default="" />
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
		variables.PatientID = 0;
		variables.EntityID = "";
		variables.ClaimSubmitterIdentifier = "";
		variables.NM1IdentificationCode9 = "";
		variables.AccountNumber = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="patientActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "PatientID") AND stValues.PatientID NEQ 0>
				<cfquery name="qGetPatient" datasource="#trim(variables.ds)#">
			  		SELECT PatientID,EntityID,ClaimSubmitterIdentifier,NM1IdentificationCode9,AccountNumber,Active,InactiveCode,DateCreated,DateModified
					FROM Patient  
					WHERE PatientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.PatientID#" /> 
				</cfquery>		
				<cfif qGetPatient.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.EntityID = qGetPatient.EntityID;
					variables.ClaimSubmitterIdentifier = qGetPatient.ClaimSubmitterIdentifier;
					variables.NM1IdentificationCode9 = qGetPatient.NM1IdentificationCode9;
					variables.AccountNumber = qGetPatient.AccountNumber;
					variables.Active = qGetPatient.Active;
					variables.InactiveCode = qGetPatient.InactiveCode;
					variables.DateModified = qGetPatient.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "PatientID")><cfset variables.PatientID = stValues.PatientID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimSubmitterIdentifier")><cfset variables.ClaimSubmitterIdentifier = stValues.ClaimSubmitterIdentifier /></cfif>
			<cfif StructKeyExists(stValues, "NM1IdentificationCode9")><cfset variables.NM1IdentificationCode9 = stValues.NM1IdentificationCode9 /></cfif>
			<cfif StructKeyExists(stValues, "AccountNumber")><cfset variables.AccountNumber = stValues.AccountNumber /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PatientID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPatientID" acess="public" output="false" returntype="any">
		<cfreturn variables.PatientID>
	</cffunction>
	
	<cffunction name="setPatientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PatientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PatientID)) OR trim(arguments.PatientID) EQ "">
			<cfset variables.PatientID = arguments.PatientID />
		<cfelse>
			<cfthrow message="PatientID (#arguments.PatientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PatientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimSubmitterIdentifier.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimSubmitterIdentifier" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimSubmitterIdentifier>
	</cffunction>
	
	<cffunction name="setClaimSubmitterIdentifier" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimSubmitterIdentifier" required="true" type="any" />
			
		<cfset variables.ClaimSubmitterIdentifier = arguments.ClaimSubmitterIdentifier />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimSubmitterIdentifier") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for NM1IdentificationCode9.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getNM1IdentificationCode9" acess="public" output="false" returntype="any">
		<cfreturn variables.NM1IdentificationCode9>
	</cffunction>
	
	<cffunction name="setNM1IdentificationCode9" acess="public" output="false" returntype="boolean">
		
		<cfargument name="NM1IdentificationCode9" required="true" type="any" />
			
		<cfset variables.NM1IdentificationCode9 = arguments.NM1IdentificationCode9 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "NM1IdentificationCode9") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AccountNumber.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAccountNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.AccountNumber>
	</cffunction>
	
	<cffunction name="setAccountNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AccountNumber" required="true" type="any" />
			
		<cfset variables.AccountNumber = arguments.AccountNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AccountNumber") />		
		
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
				 		
		<cfif this.getPatientID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getPatientID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatient" output="false" access="public" returntype="query">
				
		<cfargument name="PatientID" required="yes" type="numeric" />		
		<cfset var qGetPatient = "" />		
	
		<cfquery name="qGetPatient" datasource="#trim(variables.ds)#">
	  		SELECT PatientID,EntityID,ClaimSubmitterIdentifier,NM1IdentificationCode9,AccountNumber,Active,InactiveCode,DateCreated,DateModified
			FROM Patient  
			WHERE PatientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PatientID)#" /> 
		</cfquery>
		
		<cfreturn qGetPatient>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="PatientActive" />
		
		<cfset var qCreatePatient = "" />		
		
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localClaimSubmitterIdentifier = arguments.obj.getClaimSubmitterIdentifier() />
		<cfset var localNM1IdentificationCode9 = arguments.obj.getNM1IdentificationCode9() />
		<cfset var localAccountNumber = arguments.obj.getAccountNumber() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePatient" datasource="#trim(variables.ds)#">
				INSERT INTO Patient (EntityID,ClaimSubmitterIdentifier,NM1IdentificationCode9,AccountNumber,InactiveCode)
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
			read(qCreatePatient.PatientID);
			arguments.obj.setPatientID(qCreatePatient.PatientID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PatientActive">
				
		<cfargument name="PatientID" required="yes" type="numeric" />		
		<cfset var qGetPatient = "" />		
		
		<cfset qGetPatient = getPatient(trim(PatientID)) />
				
		<cfif qGetPatient.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setPatientID(qGetPatient.PatientID);
			this.setEntityID(qGetPatient.EntityID);
			this.setClaimSubmitterIdentifier(qGetPatient.ClaimSubmitterIdentifier);
			this.setNM1IdentificationCode9(qGetPatient.NM1IdentificationCode9);
			this.setAccountNumber(qGetPatient.AccountNumber);
			this.setActive(qGetPatient.Active);
			this.setInactiveCode(qGetPatient.InactiveCode);
			this.setDateCreated(qGetPatient.DateCreated);
			this.setDateModified(qGetPatient.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="PatientActive" />
		<cfset var qUpdatePatient = "" />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localClaimSubmitterIdentifier = arguments.obj.getClaimSubmitterIdentifier() />
		<cfset var localNM1IdentificationCode9 = arguments.obj.getNM1IdentificationCode9() />
		<cfset var localAccountNumber = arguments.obj.getAccountNumber() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePatient" datasource="#trim(variables.ds)#">
				UPDATE Patient  SET
					
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
				WHERE PatientID = <cfqueryparam value="#trim(arguments.obj.getPatientID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="PatientActive" />
		<cfset var qDeletePatient = "">

		<cfquery name="qDeletePatient" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Patient
			WHERE PatientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getPatientID())#" /> 
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


