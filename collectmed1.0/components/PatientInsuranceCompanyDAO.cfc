 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PatientInsuranceCompanyBean" />
		
		<cfset var qCreatePatientInsuranceCompany = "" />		
		
		<cfset var localPatientID = arguments.bean.getPatientID() />
		<cfset var localInsuranceCompanyID = arguments.bean.getInsuranceCompanyID() />
		<cfset var localPrimSecTer = arguments.bean.getPrimSecTer() />
		<cfset var localPolicyNumber = arguments.bean.getPolicyNumber() />
		<cfset var localPolicyHoldersFirstName = arguments.bean.getPolicyHoldersFirstName() />
		<cfset var localPolicyHoldersLastName = arguments.bean.getPolicyHoldersLastName() />
		<cfset var localPolicyHoldersMiddleInitial = arguments.bean.getPolicyHoldersMiddleInitial() />
		<cfset var localPolicyHoldersDOB = arguments.bean.getPolicyHoldersDOB() />
		<cfset var localPolicyHoldersSex = arguments.bean.getPolicyHoldersSex() />
		<cfset var localPolicyHoldersAddressLine1 = arguments.bean.getPolicyHoldersAddressLine1() />
		<cfset var localPolicyHoldersAddressLine2 = arguments.bean.getPolicyHoldersAddressLine2() />
		<cfset var localPolicyHoldersCity = arguments.bean.getPolicyHoldersCity() />
		<cfset var localPolicyHoldersStateID = arguments.bean.getPolicyHoldersStateID() />
		<cfset var localPolicyHoldersZipCode = arguments.bean.getPolicyHoldersZipCode() />
		<cfset var localPolicyHoldersPhone = arguments.bean.getPolicyHoldersPhone() />
		<cfset var localPolicyHoldersPhoneExtension = arguments.bean.getPolicyHoldersPhoneExtension() />
		<cfset var localPolicyHoldersEmployerSchoolName = arguments.bean.getPolicyHoldersEmployerSchoolName() />
		<cfset var localPolicyHoldersEffectiveDateFrom = arguments.bean.getPolicyHoldersEffectiveDateFrom() />
		<cfset var localPolicyHoldersEffectiveDateTo = arguments.bean.getPolicyHoldersEffectiveDateTo() />
		<cfset var localGroupNumber = arguments.bean.getGroupNumber() />
		<cfset var localGroupName = arguments.bean.getGroupName() />
		<cfset var localDeductible = arguments.bean.getDeductible() />
		<cfset var localPayPercentage = arguments.bean.getPayPercentage() />
		<cfset var localRelationship = arguments.bean.getRelationship() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePatientInsuranceCompany" datasource="#trim(arguments.ds)#">
				INSERT INTO PatientInsuranceCompany (PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localPatientID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localInsuranceCompanyID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localPrimSecTer))>						
						<cfqueryparam value="#trim(localPrimSecTer)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localPolicyNumber) NEQ "" AND trim(localPolicyNumber) NEQ "@@" AND trim(localPolicyNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersFirstName) NEQ "" AND trim(localPolicyHoldersFirstName) NEQ "@@" AND trim(localPolicyHoldersFirstName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersFirstName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersLastName) NEQ "" AND trim(localPolicyHoldersLastName) NEQ "@@" AND trim(localPolicyHoldersLastName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersLastName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersMiddleInitial) NEQ "" AND trim(localPolicyHoldersMiddleInitial) NEQ "@@" AND trim(localPolicyHoldersMiddleInitial) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersMiddleInitial)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localPolicyHoldersDOB))>						
						<cfqueryparam value="#trim(localPolicyHoldersDOB)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,				
					<cfif IsNumeric(trim(localPolicyHoldersSex))>						
						<cfqueryparam value="#trim(localPolicyHoldersSex)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localPolicyHoldersAddressLine1) NEQ "" AND trim(localPolicyHoldersAddressLine1) NEQ "@@" AND trim(localPolicyHoldersAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersAddressLine2) NEQ "" AND trim(localPolicyHoldersAddressLine2) NEQ "@@" AND trim(localPolicyHoldersAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersCity) NEQ "" AND trim(localPolicyHoldersCity) NEQ "@@" AND trim(localPolicyHoldersCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersCity)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localPolicyHoldersStateID))>						
						<cfqueryparam value="#trim(localPolicyHoldersStateID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localPolicyHoldersZipCode) NEQ "" AND trim(localPolicyHoldersZipCode) NEQ "@@" AND trim(localPolicyHoldersZipCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersZipCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersPhone) NEQ "" AND trim(localPolicyHoldersPhone) NEQ "@@" AND trim(localPolicyHoldersPhone) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersPhone)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersPhoneExtension) NEQ "" AND trim(localPolicyHoldersPhoneExtension) NEQ "@@" AND trim(localPolicyHoldersPhoneExtension) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersPhoneExtension)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPolicyHoldersEmployerSchoolName) NEQ "" AND trim(localPolicyHoldersEmployerSchoolName) NEQ "@@" AND trim(localPolicyHoldersEmployerSchoolName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersEmployerSchoolName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localPolicyHoldersEffectiveDateFrom))>						
						<cfqueryparam value="#trim(localPolicyHoldersEffectiveDateFrom)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localPolicyHoldersEffectiveDateTo))>						
						<cfqueryparam value="#trim(localPolicyHoldersEffectiveDateTo)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localGroupNumber) NEQ "" AND trim(localGroupNumber) NEQ "@@" AND trim(localGroupNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localGroupName) NEQ "" AND trim(localGroupName) NEQ "@@" AND trim(localGroupName) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localDeductible))>						
						<cfqueryparam value="#trim(localDeductible)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localPayPercentage))>						
						<cfqueryparam value="#trim(localPayPercentage)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localRelationship))>						
						<cfqueryparam value="#trim(localRelationship)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS recordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setrecordID(qCreatePatientInsuranceCompany.recordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PatientInsuranceCompanyBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetPatientInsuranceCompany = "" />		
		
		<cfset qGetPatientInsuranceCompany = getPatientInsuranceCompany(trim(arguments.ds), trim(PatientInsuranceCompanyID)) />
				
		<cfif qGetPatientInsuranceCompany.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objPatientInsuranceCompany = createObject("component", "PatientInsuranceCompanyBean").init(arguments.ds);
			objPatientInsuranceCompany.setrecordID(qGetPatientInsuranceCompany.recordID);
			objPatientInsuranceCompany.setPatientID(qGetPatientInsuranceCompany.PatientID);
			objPatientInsuranceCompany.setInsuranceCompanyID(qGetPatientInsuranceCompany.InsuranceCompanyID);
			objPatientInsuranceCompany.setPrimSecTer(qGetPatientInsuranceCompany.PrimSecTer);
			objPatientInsuranceCompany.setPolicyNumber(qGetPatientInsuranceCompany.PolicyNumber);
			objPatientInsuranceCompany.setPolicyHoldersFirstName(qGetPatientInsuranceCompany.PolicyHoldersFirstName);
			objPatientInsuranceCompany.setPolicyHoldersLastName(qGetPatientInsuranceCompany.PolicyHoldersLastName);
			objPatientInsuranceCompany.setPolicyHoldersMiddleInitial(qGetPatientInsuranceCompany.PolicyHoldersMiddleInitial);
			objPatientInsuranceCompany.setPolicyHoldersDOB(qGetPatientInsuranceCompany.PolicyHoldersDOB);
			objPatientInsuranceCompany.setPolicyHoldersSex(qGetPatientInsuranceCompany.PolicyHoldersSex);
			objPatientInsuranceCompany.setPolicyHoldersAddressLine1(qGetPatientInsuranceCompany.PolicyHoldersAddressLine1);
			objPatientInsuranceCompany.setPolicyHoldersAddressLine2(qGetPatientInsuranceCompany.PolicyHoldersAddressLine2);
			objPatientInsuranceCompany.setPolicyHoldersCity(qGetPatientInsuranceCompany.PolicyHoldersCity);
			objPatientInsuranceCompany.setPolicyHoldersStateID(qGetPatientInsuranceCompany.PolicyHoldersStateID);
			objPatientInsuranceCompany.setPolicyHoldersZipCode(qGetPatientInsuranceCompany.PolicyHoldersZipCode);
			objPatientInsuranceCompany.setPolicyHoldersPhone(qGetPatientInsuranceCompany.PolicyHoldersPhone);
			objPatientInsuranceCompany.setPolicyHoldersPhoneExtension(qGetPatientInsuranceCompany.PolicyHoldersPhoneExtension);
			objPatientInsuranceCompany.setPolicyHoldersEmployerSchoolName(qGetPatientInsuranceCompany.PolicyHoldersEmployerSchoolName);
			objPatientInsuranceCompany.setPolicyHoldersEffectiveDateFrom(qGetPatientInsuranceCompany.PolicyHoldersEffectiveDateFrom);
			objPatientInsuranceCompany.setPolicyHoldersEffectiveDateTo(qGetPatientInsuranceCompany.PolicyHoldersEffectiveDateTo);
			objPatientInsuranceCompany.setGroupNumber(qGetPatientInsuranceCompany.GroupNumber);
			objPatientInsuranceCompany.setGroupName(qGetPatientInsuranceCompany.GroupName);
			objPatientInsuranceCompany.setDeductible(qGetPatientInsuranceCompany.Deductible);
			objPatientInsuranceCompany.setPayPercentage(qGetPatientInsuranceCompany.PayPercentage);
			objPatientInsuranceCompany.setRelationship(qGetPatientInsuranceCompany.Relationship);
			objPatientInsuranceCompany.setActive(qGetPatientInsuranceCompany.Active);
			objPatientInsuranceCompany.setInactiveCode(qGetPatientInsuranceCompany.InactiveCode);
			objPatientInsuranceCompany.setDateCreated(qGetPatientInsuranceCompany.DateCreated);
			objPatientInsuranceCompany.setDateModified(qGetPatientInsuranceCompany.DateModified);				
			return objPatientInsuranceCompany;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PatientInsuranceCompanyBean" />
		<cfset var qUpdatePatientInsuranceCompany = "" />
		<cfset var localPatientID = arguments.bean.getPatientID() />
		<cfset var localInsuranceCompanyID = arguments.bean.getInsuranceCompanyID() />
		<cfset var localPrimSecTer = arguments.bean.getPrimSecTer() />
		<cfset var localPolicyNumber = arguments.bean.getPolicyNumber() />
		<cfset var localPolicyHoldersFirstName = arguments.bean.getPolicyHoldersFirstName() />
		<cfset var localPolicyHoldersLastName = arguments.bean.getPolicyHoldersLastName() />
		<cfset var localPolicyHoldersMiddleInitial = arguments.bean.getPolicyHoldersMiddleInitial() />
		<cfset var localPolicyHoldersDOB = arguments.bean.getPolicyHoldersDOB() />
		<cfset var localPolicyHoldersSex = arguments.bean.getPolicyHoldersSex() />
		<cfset var localPolicyHoldersAddressLine1 = arguments.bean.getPolicyHoldersAddressLine1() />
		<cfset var localPolicyHoldersAddressLine2 = arguments.bean.getPolicyHoldersAddressLine2() />
		<cfset var localPolicyHoldersCity = arguments.bean.getPolicyHoldersCity() />
		<cfset var localPolicyHoldersStateID = arguments.bean.getPolicyHoldersStateID() />
		<cfset var localPolicyHoldersZipCode = arguments.bean.getPolicyHoldersZipCode() />
		<cfset var localPolicyHoldersPhone = arguments.bean.getPolicyHoldersPhone() />
		<cfset var localPolicyHoldersPhoneExtension = arguments.bean.getPolicyHoldersPhoneExtension() />
		<cfset var localPolicyHoldersEmployerSchoolName = arguments.bean.getPolicyHoldersEmployerSchoolName() />
		<cfset var localPolicyHoldersEffectiveDateFrom = arguments.bean.getPolicyHoldersEffectiveDateFrom() />
		<cfset var localPolicyHoldersEffectiveDateTo = arguments.bean.getPolicyHoldersEffectiveDateTo() />
		<cfset var localGroupNumber = arguments.bean.getGroupNumber() />
		<cfset var localGroupName = arguments.bean.getGroupName() />
		<cfset var localDeductible = arguments.bean.getDeductible() />
		<cfset var localPayPercentage = arguments.bean.getPayPercentage() />
		<cfset var localRelationship = arguments.bean.getRelationship() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePatientInsuranceCompany" datasource="#trim(arguments.ds)#">
				UPDATE PatientInsuranceCompany  SET
					
					PatientID =						
						<cfqueryparam value="#trim(localPatientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					InsuranceCompanyID =						
						<cfqueryparam value="#trim(localInsuranceCompanyID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					PrimSecTer =				
					<cfif IsNumeric(trim(localPrimSecTer))>						
						<cfqueryparam value="#trim(localPrimSecTer)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PolicyNumber =	
					<cfif trim(localPolicyNumber) NEQ "" AND trim(localPolicyNumber) NEQ "@@" AND trim(localPolicyNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersFirstName =	
					<cfif trim(localPolicyHoldersFirstName) NEQ "" AND trim(localPolicyHoldersFirstName) NEQ "@@" AND trim(localPolicyHoldersFirstName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersFirstName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersLastName =	
					<cfif trim(localPolicyHoldersLastName) NEQ "" AND trim(localPolicyHoldersLastName) NEQ "@@" AND trim(localPolicyHoldersLastName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersLastName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersMiddleInitial =	
					<cfif trim(localPolicyHoldersMiddleInitial) NEQ "" AND trim(localPolicyHoldersMiddleInitial) NEQ "@@" AND trim(localPolicyHoldersMiddleInitial) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersMiddleInitial)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersDOB =	
					<cfif IsDate(trim(localPolicyHoldersDOB))>						
						<cfqueryparam value="#trim(localPolicyHoldersDOB)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					PolicyHoldersSex =				
					<cfif IsNumeric(trim(localPolicyHoldersSex))>						
						<cfqueryparam value="#trim(localPolicyHoldersSex)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PolicyHoldersAddressLine1 =	
					<cfif trim(localPolicyHoldersAddressLine1) NEQ "" AND trim(localPolicyHoldersAddressLine1) NEQ "@@" AND trim(localPolicyHoldersAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersAddressLine2 =	
					<cfif trim(localPolicyHoldersAddressLine2) NEQ "" AND trim(localPolicyHoldersAddressLine2) NEQ "@@" AND trim(localPolicyHoldersAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersCity =	
					<cfif trim(localPolicyHoldersCity) NEQ "" AND trim(localPolicyHoldersCity) NEQ "@@" AND trim(localPolicyHoldersCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersCity)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersStateID =				
					<cfif IsNumeric(trim(localPolicyHoldersStateID))>						
						<cfqueryparam value="#trim(localPolicyHoldersStateID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PolicyHoldersZipCode =	
					<cfif trim(localPolicyHoldersZipCode) NEQ "" AND trim(localPolicyHoldersZipCode) NEQ "@@" AND trim(localPolicyHoldersZipCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersZipCode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersPhone =	
					<cfif trim(localPolicyHoldersPhone) NEQ "" AND trim(localPolicyHoldersPhone) NEQ "@@" AND trim(localPolicyHoldersPhone) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersPhone)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersPhoneExtension =	
					<cfif trim(localPolicyHoldersPhoneExtension) NEQ "" AND trim(localPolicyHoldersPhoneExtension) NEQ "@@" AND trim(localPolicyHoldersPhoneExtension) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersPhoneExtension)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersEmployerSchoolName =	
					<cfif trim(localPolicyHoldersEmployerSchoolName) NEQ "" AND trim(localPolicyHoldersEmployerSchoolName) NEQ "@@" AND trim(localPolicyHoldersEmployerSchoolName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPolicyHoldersEmployerSchoolName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PolicyHoldersEffectiveDateFrom =	
					<cfif IsDate(trim(localPolicyHoldersEffectiveDateFrom))>						
						<cfqueryparam value="#trim(localPolicyHoldersEffectiveDateFrom)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					PolicyHoldersEffectiveDateTo =	
					<cfif IsDate(trim(localPolicyHoldersEffectiveDateTo))>						
						<cfqueryparam value="#trim(localPolicyHoldersEffectiveDateTo)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					GroupNumber =	
					<cfif trim(localGroupNumber) NEQ "" AND trim(localGroupNumber) NEQ "@@" AND trim(localGroupNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					GroupName =	
					<cfif trim(localGroupName) NEQ "" AND trim(localGroupName) NEQ "@@" AND trim(localGroupName) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Deductible =				
					<cfif IsNumeric(trim(localDeductible))>						
						<cfqueryparam value="#trim(localDeductible)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PayPercentage =				
					<cfif IsNumeric(trim(localPayPercentage))>						
						<cfqueryparam value="#trim(localPayPercentage)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Relationship =				
					<cfif IsNumeric(trim(localRelationship))>						
						<cfqueryparam value="#trim(localRelationship)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
				WHERE recordID = <cfqueryparam value="#trim(arguments.bean.getrecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PatientInsuranceCompanyBean" />
		<cfset var qDeletePatientInsuranceCompany = "">

		<cfquery name="qDeletePatientInsuranceCompany" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM PatientInsuranceCompany
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getrecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientInsuranceCompany" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PatientInsuranceCompanyID" required="yes" type="numeric" />		
		<cfset var qGetPatientInsuranceCompany = "" />		
	
		<cfquery name="qGetPatientInsuranceCompany" datasource="#trim(arguments.ds)#">
	  		SELECT recordID,PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified
			FROM PatientInsuranceCompany  
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>
		
		<cfreturn qGetPatientInsuranceCompany>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


