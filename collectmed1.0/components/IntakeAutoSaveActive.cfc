 	


<cfcomponent name="intakeautosaveActive" output="false" alias="intakeautosaveActive">

	<cfproperty name="RecordID" type="numeric" default="0" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="PatientFName" type="string" default="" />
	<cfproperty name="PatientLName" type="string" default="" />
	<cfproperty name="IntakeXML" type="string" default="" />
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
		variables.RecordID = 0;
		variables.UsersID = "";
		variables.PatientFName = "";
		variables.PatientLName = "";
		variables.IntakeXML = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="intakeautosaveActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RecordID") AND stValues.RecordID NEQ 0>
				<cfquery name="qGetIntakeAutoSave" datasource="#trim(variables.ds)#">
			  		SELECT RecordID,UsersID,PatientFName,PatientLName,IntakeXML,Active,InactiveCode,DateCreated,DateModified
					FROM IntakeAutoSave  
					WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RecordID#" /> 
				</cfquery>		
				<cfif qGetIntakeAutoSave.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.UsersID = qGetIntakeAutoSave.UsersID;
					variables.PatientFName = qGetIntakeAutoSave.PatientFName;
					variables.PatientLName = qGetIntakeAutoSave.PatientLName;
					variables.IntakeXML = qGetIntakeAutoSave.IntakeXML;
					variables.Active = qGetIntakeAutoSave.Active;
					variables.InactiveCode = qGetIntakeAutoSave.InactiveCode;
					variables.DateModified = qGetIntakeAutoSave.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RecordID")><cfset variables.RecordID = stValues.RecordID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "PatientFName")><cfset variables.PatientFName = stValues.PatientFName /></cfif>
			<cfif StructKeyExists(stValues, "PatientLName")><cfset variables.PatientLName = stValues.PatientLName /></cfif>
			<cfif StructKeyExists(stValues, "IntakeXML")><cfset variables.IntakeXML = stValues.IntakeXML /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RecordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.RecordID>
	</cffunction>
	
	<cffunction name="setRecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RecordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RecordID)) OR trim(arguments.RecordID) EQ "">
			<cfset variables.RecordID = arguments.RecordID />
		<cfelse>
			<cfthrow message="RecordID (#arguments.RecordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RecordID") />		
		
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
	<!--- GET and SET methods for PatientFName.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPatientFName" acess="public" output="false" returntype="any">
		<cfreturn variables.PatientFName>
	</cffunction>
	
	<cffunction name="setPatientFName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PatientFName" required="true" type="any" />
			
		<cfset variables.PatientFName = arguments.PatientFName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PatientFName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PatientLName.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPatientLName" acess="public" output="false" returntype="any">
		<cfreturn variables.PatientLName>
	</cffunction>
	
	<cffunction name="setPatientLName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PatientLName" required="true" type="any" />
			
		<cfset variables.PatientLName = arguments.PatientLName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PatientLName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IntakeXML.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIntakeXML" acess="public" output="false" returntype="any">
		<cfreturn variables.IntakeXML>
	</cffunction>
	
	<cffunction name="setIntakeXML" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IntakeXML" required="true" type="any" />
			
		<cfset variables.IntakeXML = arguments.IntakeXML />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IntakeXML") />		
		
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
				 		
		<cfif this.getRecordID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getRecordID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeAutoSave" output="false" access="public" returntype="query">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAutoSave = "" />		
	
		<cfquery name="qGetIntakeAutoSave" datasource="#trim(variables.ds)#">
	  		SELECT RecordID,UsersID,PatientFName,PatientLName,IntakeXML,Active,InactiveCode,DateCreated,DateModified
			FROM IntakeAutoSave  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetIntakeAutoSave>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="IntakeAutoSaveActive" />
		
		<cfset var qCreateIntakeAutoSave = "" />		
		
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localPatientFName = arguments.obj.getPatientFName() />
		<cfset var localPatientLName = arguments.obj.getPatientLName() />
		<cfset var localIntakeXML = arguments.obj.getIntakeXML() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateIntakeAutoSave" datasource="#trim(variables.ds)#">
				INSERT INTO IntakeAutoSave (UsersID,PatientFName,PatientLName,IntakeXML,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localPatientFName)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localPatientLName)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localIntakeXML) NEQ "" AND trim(localIntakeXML) NEQ "@@" AND trim(localIntakeXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localIntakeXML)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
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
			read(qCreateIntakeAutoSave.RecordID);
			arguments.obj.setRecordID(qCreateIntakeAutoSave.RecordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IntakeAutoSaveActive">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAutoSave = "" />		
		
		<cfset qGetIntakeAutoSave = getIntakeAutoSave(trim(RecordID)) />
				
		<cfif qGetIntakeAutoSave.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setRecordID(qGetIntakeAutoSave.RecordID);
			this.setUsersID(qGetIntakeAutoSave.UsersID);
			this.setPatientFName(qGetIntakeAutoSave.PatientFName);
			this.setPatientLName(qGetIntakeAutoSave.PatientLName);
			this.setIntakeXML(qGetIntakeAutoSave.IntakeXML);
			this.setActive(qGetIntakeAutoSave.Active);
			this.setInactiveCode(qGetIntakeAutoSave.InactiveCode);
			this.setDateCreated(qGetIntakeAutoSave.DateCreated);
			this.setDateModified(qGetIntakeAutoSave.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="IntakeAutoSaveActive" />
		<cfset var qUpdateIntakeAutoSave = "" />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localPatientFName = arguments.obj.getPatientFName() />
		<cfset var localPatientLName = arguments.obj.getPatientLName() />
		<cfset var localIntakeXML = arguments.obj.getIntakeXML() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateIntakeAutoSave" datasource="#trim(variables.ds)#">
				UPDATE IntakeAutoSave  SET
					
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.obj.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="IntakeAutoSaveActive" />
		<cfset var qDeleteIntakeAutoSave = "">

		<cfquery name="qDeleteIntakeAutoSave" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM IntakeAutoSave
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getRecordID())#" /> 
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


