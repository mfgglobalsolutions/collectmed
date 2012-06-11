 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the PatientInsuranceCompany DAO Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a PatientInsuranceCompany, either by creating a new entry or updating an existing one.">
		<cfargument name="PatientInsuranceCompany" required="true" type="cmComponents.com.common.model.PatientInsuranceCompany" hint="I am the PatientInsuranceCompany bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.PatientInsuranceCompany)>
			<cfset success = update(arguments.PatientInsuranceCompany) />
		<cfelse>
			<cfset success = create(arguments.PatientInsuranceCompany) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific PatientInsuranceCompany exists within the database, using the ID as a check.">
		<cfargument name="PatientInsuranceCompany" required="true" type="cmComponents.com.common.model.PatientInsuranceCompany" hint="I am the PatientInsuranceCompany bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.datasource.getDSName()#" maxrows="1">
			SELECT count(1) as idexists
			FROM patientinsurancecompany
			WHERE recordID = <cfqueryparam value="#arguments.PatientInsuranceCompany.getRecordID()#" CFSQLType="cf_sql_integer" />
		</cfquery>
		
		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
		
	</cffunction>


										
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="private">
				
		<cfargument name="PatientInsuranceCompany" required="true" type="cmComponents.com.common.model.PatientInsuranceCompany" />
		
		<cfset var qCreatePatientInsuranceCompany = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePatientInsuranceCompany" datasource="#variables.instance.datasource.getDSName()#">
				INSERT INTO patientinsurancecompany (PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPatientID())#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getInsuranceCompanyID())#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPrimSecTer()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPrimSecTer())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyNumber()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyNumber()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyNumber())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(arguments.PatientInsuranceCompany.getPolicyHoldersDOB()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersDOB())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPolicyHoldersSex()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersSex())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPolicyHoldersStateID()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersStateID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateFrom()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateFrom())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateTo()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateTo())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getGroupNumber()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getGroupNumber()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getGroupNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getGroupNumber())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.PatientInsuranceCompany.getGroupName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getGroupName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getGroupName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getGroupName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getDeductible()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getDeductible())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPayPercentage()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPayPercentage())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getRelationship()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getRelationship())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				)
				SELECT LAST_INSERT_ID() AS recordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.PatientInsuranceCompany.setrecordID(qCreatePatientInsuranceCompany.recordID);
		</cfscript>
		
		<cfreturn arguments.PatientInsuranceCompany />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="PatientInsuranceCompany" type="cmComponents.com.common.model.PatientInsuranceCompany" required="true" />
				
		<cfset var qGetPatientInsuranceCompany = "" />
				
		<cfset qGetPatientInsuranceCompany = getPatientInsuranceCompanyByID(trim(arguments.PatientInsuranceCompany.getRecordID())) />
				
		<cfif qGetPatientInsuranceCompany.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetPatientInsuranceCompany.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetPatientInsuranceCompany, 1)>
				<cfset arguments.PatientInsuranceCompany.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="PatientInsuranceCompany" required="true" type="cmComponents.com.common.model.PatientInsuranceCompany" />
		<cfset var qUpdatePatientInsuranceCompany = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdatePatientInsuranceCompany" datasource="#variables.instance.datasource.getDSName()#">
				UPDATE patientinsurancecompany  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					PatientID =						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPatientID())#" cfsqltype="CF_SQL_INTEGER" />,
					
					InsuranceCompanyID =						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getInsuranceCompanyID())#" cfsqltype="CF_SQL_INTEGER" />,
					
					PrimSecTer =				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPrimSecTer()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPrimSecTer())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PolicyNumber =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyNumber()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyNumber()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyNumber())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersFirstName =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersFirstName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersLastName =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersLastName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersMiddleInitial =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersMiddleInitial())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersDOB =	
					<cfif IsDate(trim(arguments.PatientInsuranceCompany.getPolicyHoldersDOB()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersDOB())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					PolicyHoldersSex =				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPolicyHoldersSex()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersSex())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PolicyHoldersAddressLine1 =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine1())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersAddressLine2 =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersAddressLine2())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersCity =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersCity())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersStateID =				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPolicyHoldersStateID()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersStateID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PolicyHoldersZipCode =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersZipCode())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersPhone =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhone())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersPhoneExtension =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersPhoneExtension())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersEmployerSchoolName =	
					<cfif trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersEffectiveDateFrom =	
					<cfif IsDate(trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateFrom()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateFrom())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					PolicyHoldersEffectiveDateTo =	
					<cfif IsDate(trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateTo()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPolicyHoldersEffectiveDateTo())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					GroupNumber =	
					<cfif trim(arguments.PatientInsuranceCompany.getGroupNumber()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getGroupNumber()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getGroupNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getGroupNumber())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					GroupName =	
					<cfif trim(arguments.PatientInsuranceCompany.getGroupName()) NEQ "" AND trim(arguments.PatientInsuranceCompany.getGroupName()) NEQ "@@" AND trim(arguments.PatientInsuranceCompany.getGroupName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getGroupName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Deductible =				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getDeductible()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getDeductible())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PayPercentage =				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getPayPercentage()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getPayPercentage())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Relationship =				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getRelationship()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getRelationship())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.PatientInsuranceCompany.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE recordID = <cfqueryparam value="#trim(arguments.PatientInsuranceCompany.getrecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="recordID" required="true" type="String" />
		
		<cfset var qDeletePatientInsuranceCompany = "">

		<cfquery name="qDeletePatientInsuranceCompany" datasource="#variables.instance.datasource.getDSName()#" result="status">
			DELETE
			FROM patientinsurancecompany
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientInsuranceCompanyByID" output="false" access="public" returntype="query">
		
		<cfargument name="recordID" required="yes" type="numeric" />		
		
		<cfset var qGetPatientInsuranceCompany = "" />		
	
		<cfquery name="qGetPatientInsuranceCompany" datasource="#variables.instance.datasource.getDSName()#">
	  		SELECT recordID,PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified
			FROM patientinsurancecompany  
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>
		
		<cfreturn qGetPatientInsuranceCompany>
		
	</cffunction>	
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="QueryToStruct" access="public" returntype="any" output="false" hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">
	
		<!--- Define arguments. --->
		<cfargument name="Query" type="query" required="true" />
		<cfargument name="Row" type="numeric" required="false" default="0" />
	
		<cfscript>
			
			// Define the local scope.
			var LOCAL = StructNew();
	
			// Determine the indexes that we will need to loop over. To do so, check to see if we are working with a given row, or the whole record set.
			if (ARGUMENTS.Row){				
				// We are only looping over one row.
				LOCAL.FromIndex = ARGUMENTS.Row;
				LOCAL.ToIndex = ARGUMENTS.Row;
			} 
			else{				
				// We are looping over the entire query.
				LOCAL.FromIndex = 1;
				LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;
			}
	
			// Get the list of columns as an array and the column count.
			LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
			LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );
			
			// Create an array to keep all the objects.
			LOCAL.DataArray = ArrayNew( 1 );
	
			// Loop over the rows to create a structure for each row.
			for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
	
				// Create a new structure for this row.
				ArrayAppend( LOCAL.DataArray, StructNew() );
		
				// Get the index of the current data array object.
				LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );
		
				// Loop over the columns to set the structure values.
				for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
		
					// Get the column value.
					LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
			
					// Set column value into the structure.
					LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
				}
		
			}
	
			// At this point, we have an array of structure objects that represent the rows in the query over the indexes that we wanted to convert. 
			// If we did not want to convert a specific record, return the array. If we wanted to convert a single row, then return the just that STRUCTURE, not the array.
			if (ARGUMENTS.Row){			
				// Return the first array item.
				return( LOCAL.DataArray[ 1 ] );			
			} 
			else{			
				// Return the entire array.
				return( LOCAL.DataArray );
			}
	
		</cfscript>
	
	</cffunction>	
	
	
	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





