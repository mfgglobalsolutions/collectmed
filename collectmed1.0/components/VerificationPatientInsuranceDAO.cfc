 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="VerificationPatientInsuranceBean" />
		
		<cfset var qCreateVerificationPatientInsurance = "" />		
		
		<cfset var localusersID = arguments.bean.getusersID() />
		<cfset var localpicID = arguments.bean.getpicID() />
		<cfset var localVerificationRepFName = arguments.bean.getVerificationRepFName() />
		<cfset var localVerificationRepLName = arguments.bean.getVerificationRepLName() />
		<cfset var localVerificationDate = arguments.bean.getVerificationDate() />
		<cfset var localVerificationTime = arguments.bean.getVerificationTime() />
		<cfset var localVerificationHaveIns = arguments.bean.getVerificationHaveIns() />
		<cfset var localVerificationHaveInsFromDate = arguments.bean.getVerificationHaveInsFromDate() />
		<cfset var localVerificationHaveInsToDate = arguments.bean.getVerificationHaveInsToDate() />
		<cfset var localVerificationHaveDMECov = arguments.bean.getVerificationHaveDMECov() />
		<cfset var localVerificationDeductible = arguments.bean.getVerificationDeductible() />
		<cfset var localVerificationDeductibleAmount = arguments.bean.getVerificationDeductibleAmount() />
		<cfset var localVerificationDeductibleAmountMet = arguments.bean.getVerificationDeductibleAmountMet() />
		<cfset var localVerificationPPOPolicy = arguments.bean.getVerificationPPOPolicy() />
		<cfset var localVerificationPercentagePayAfterDeductible = arguments.bean.getVerificationPercentagePayAfterDeductible() />
		<cfset var localVerificationPriorAuth = arguments.bean.getVerificationPriorAuth() />
		<cfset var localVerificationAuthNumber = arguments.bean.getVerificationAuthNumber() />
		<cfset var localVerificationLifetimeBenefitMet = arguments.bean.getVerificationLifetimeBenefitMet() />
		<cfset var localVerificationAuthPhoneNumber = arguments.bean.getVerificationAuthPhoneNumber() />
		<cfset var localVerificationMedicareSupplement = arguments.bean.getVerificationMedicareSupplement() />
		<cfset var localVerificationCoordinateBenefits = arguments.bean.getVerificationCoordinateBenefits() />
		<cfset var localVerificationPaidMedicareDeductible = arguments.bean.getVerificationPaidMedicareDeductible() />
		<cfset var localVerificationMedicaidPlan = arguments.bean.getVerificationMedicaidPlan() />
		<cfset var localVerificationTypeBasePlan = arguments.bean.getVerificationTypeBasePlan() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateVerificationPatientInsurance" datasource="#trim(arguments.ds)#">
				INSERT INTO VerificationPatientInsurance (usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localusersID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localpicID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localVerificationRepFName) NEQ "" AND trim(localVerificationRepFName) NEQ "@@" AND trim(localVerificationRepFName) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationRepFName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationRepLName) NEQ "" AND trim(localVerificationRepLName) NEQ "@@" AND trim(localVerificationRepLName) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationRepLName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localVerificationDate))>						
						<cfqueryparam value="#trim(localVerificationDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localVerificationTime) NEQ "" AND trim(localVerificationTime) NEQ "@@" AND trim(localVerificationTime) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationTime)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationHaveIns) NEQ "" AND trim(localVerificationHaveIns) NEQ "@@" AND trim(localVerificationHaveIns) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationHaveIns)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localVerificationHaveInsFromDate))>						
						<cfqueryparam value="#trim(localVerificationHaveInsFromDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localVerificationHaveInsToDate))>						
						<cfqueryparam value="#trim(localVerificationHaveInsToDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localVerificationHaveDMECov) NEQ "" AND trim(localVerificationHaveDMECov) NEQ "@@" AND trim(localVerificationHaveDMECov) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationHaveDMECov)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationDeductible) NEQ "" AND trim(localVerificationDeductible) NEQ "@@" AND trim(localVerificationDeductible) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationDeductible)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationDeductibleAmount) NEQ "" AND trim(localVerificationDeductibleAmount) NEQ "@@" AND trim(localVerificationDeductibleAmount) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationDeductibleAmount)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationDeductibleAmountMet) NEQ "" AND trim(localVerificationDeductibleAmountMet) NEQ "@@" AND trim(localVerificationDeductibleAmountMet) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationDeductibleAmountMet)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationPPOPolicy) NEQ "" AND trim(localVerificationPPOPolicy) NEQ "@@" AND trim(localVerificationPPOPolicy) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPPOPolicy)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationPercentagePayAfterDeductible) NEQ "" AND trim(localVerificationPercentagePayAfterDeductible) NEQ "@@" AND trim(localVerificationPercentagePayAfterDeductible) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPercentagePayAfterDeductible)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationPriorAuth) NEQ "" AND trim(localVerificationPriorAuth) NEQ "@@" AND trim(localVerificationPriorAuth) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPriorAuth)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationAuthNumber) NEQ "" AND trim(localVerificationAuthNumber) NEQ "@@" AND trim(localVerificationAuthNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationAuthNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationLifetimeBenefitMet) NEQ "" AND trim(localVerificationLifetimeBenefitMet) NEQ "@@" AND trim(localVerificationLifetimeBenefitMet) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationLifetimeBenefitMet)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationAuthPhoneNumber) NEQ "" AND trim(localVerificationAuthPhoneNumber) NEQ "@@" AND trim(localVerificationAuthPhoneNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationAuthPhoneNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationMedicareSupplement) NEQ "" AND trim(localVerificationMedicareSupplement) NEQ "@@" AND trim(localVerificationMedicareSupplement) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationMedicareSupplement)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationCoordinateBenefits) NEQ "" AND trim(localVerificationCoordinateBenefits) NEQ "@@" AND trim(localVerificationCoordinateBenefits) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationCoordinateBenefits)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationPaidMedicareDeductible) NEQ "" AND trim(localVerificationPaidMedicareDeductible) NEQ "@@" AND trim(localVerificationPaidMedicareDeductible) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPaidMedicareDeductible)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationMedicaidPlan) NEQ "" AND trim(localVerificationMedicaidPlan) NEQ "@@" AND trim(localVerificationMedicaidPlan) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationMedicaidPlan)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localVerificationTypeBasePlan) NEQ "" AND trim(localVerificationTypeBasePlan) NEQ "@@" AND trim(localVerificationTypeBasePlan) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationTypeBasePlan)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS VerificationPatientInsuranceID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setVerificationPatientInsuranceID(qCreateVerificationPatientInsurance.VerificationPatientInsuranceID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="VerificationPatientInsuranceBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="VerificationPatientInsuranceID" required="yes" type="numeric" />		
		<cfset var qGetVerificationPatientInsurance = "" />		
		
		<cfset qGetVerificationPatientInsurance = getVerificationPatientInsurance(trim(arguments.ds), trim(VerificationPatientInsuranceID)) />
				
		<cfif qGetVerificationPatientInsurance.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objVerificationPatientInsurance = createObject("component", "VerificationPatientInsuranceBean").init(arguments.ds);
			objVerificationPatientInsurance.setVerificationPatientInsuranceID(qGetVerificationPatientInsurance.VerificationPatientInsuranceID);
			objVerificationPatientInsurance.setusersID(qGetVerificationPatientInsurance.usersID);
			objVerificationPatientInsurance.setpicID(qGetVerificationPatientInsurance.picID);
			objVerificationPatientInsurance.setVerificationRepFName(qGetVerificationPatientInsurance.VerificationRepFName);
			objVerificationPatientInsurance.setVerificationRepLName(qGetVerificationPatientInsurance.VerificationRepLName);
			objVerificationPatientInsurance.setVerificationDate(qGetVerificationPatientInsurance.VerificationDate);
			objVerificationPatientInsurance.setVerificationTime(qGetVerificationPatientInsurance.VerificationTime);
			objVerificationPatientInsurance.setVerificationHaveIns(qGetVerificationPatientInsurance.VerificationHaveIns);
			objVerificationPatientInsurance.setVerificationHaveInsFromDate(qGetVerificationPatientInsurance.VerificationHaveInsFromDate);
			objVerificationPatientInsurance.setVerificationHaveInsToDate(qGetVerificationPatientInsurance.VerificationHaveInsToDate);
			objVerificationPatientInsurance.setVerificationHaveDMECov(qGetVerificationPatientInsurance.VerificationHaveDMECov);
			objVerificationPatientInsurance.setVerificationDeductible(qGetVerificationPatientInsurance.VerificationDeductible);
			objVerificationPatientInsurance.setVerificationDeductibleAmount(qGetVerificationPatientInsurance.VerificationDeductibleAmount);
			objVerificationPatientInsurance.setVerificationDeductibleAmountMet(qGetVerificationPatientInsurance.VerificationDeductibleAmountMet);
			objVerificationPatientInsurance.setVerificationPPOPolicy(qGetVerificationPatientInsurance.VerificationPPOPolicy);
			objVerificationPatientInsurance.setVerificationPercentagePayAfterDeductible(qGetVerificationPatientInsurance.VerificationPercentagePayAfterDeductible);
			objVerificationPatientInsurance.setVerificationPriorAuth(qGetVerificationPatientInsurance.VerificationPriorAuth);
			objVerificationPatientInsurance.setVerificationAuthNumber(qGetVerificationPatientInsurance.VerificationAuthNumber);
			objVerificationPatientInsurance.setVerificationLifetimeBenefitMet(qGetVerificationPatientInsurance.VerificationLifetimeBenefitMet);
			objVerificationPatientInsurance.setVerificationAuthPhoneNumber(qGetVerificationPatientInsurance.VerificationAuthPhoneNumber);
			objVerificationPatientInsurance.setVerificationMedicareSupplement(qGetVerificationPatientInsurance.VerificationMedicareSupplement);
			objVerificationPatientInsurance.setVerificationCoordinateBenefits(qGetVerificationPatientInsurance.VerificationCoordinateBenefits);
			objVerificationPatientInsurance.setVerificationPaidMedicareDeductible(qGetVerificationPatientInsurance.VerificationPaidMedicareDeductible);
			objVerificationPatientInsurance.setVerificationMedicaidPlan(qGetVerificationPatientInsurance.VerificationMedicaidPlan);
			objVerificationPatientInsurance.setVerificationTypeBasePlan(qGetVerificationPatientInsurance.VerificationTypeBasePlan);
			objVerificationPatientInsurance.setActive(qGetVerificationPatientInsurance.Active);
			objVerificationPatientInsurance.setInactiveCode(qGetVerificationPatientInsurance.InactiveCode);
			objVerificationPatientInsurance.setDateCreated(qGetVerificationPatientInsurance.DateCreated);
			objVerificationPatientInsurance.setDateModified(qGetVerificationPatientInsurance.DateModified);				
			return objVerificationPatientInsurance;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="VerificationPatientInsuranceBean" />
		<cfset var qUpdateVerificationPatientInsurance = "" />
		<cfset var localusersID = arguments.bean.getusersID() />
		<cfset var localpicID = arguments.bean.getpicID() />
		<cfset var localVerificationRepFName = arguments.bean.getVerificationRepFName() />
		<cfset var localVerificationRepLName = arguments.bean.getVerificationRepLName() />
		<cfset var localVerificationDate = arguments.bean.getVerificationDate() />
		<cfset var localVerificationTime = arguments.bean.getVerificationTime() />
		<cfset var localVerificationHaveIns = arguments.bean.getVerificationHaveIns() />
		<cfset var localVerificationHaveInsFromDate = arguments.bean.getVerificationHaveInsFromDate() />
		<cfset var localVerificationHaveInsToDate = arguments.bean.getVerificationHaveInsToDate() />
		<cfset var localVerificationHaveDMECov = arguments.bean.getVerificationHaveDMECov() />
		<cfset var localVerificationDeductible = arguments.bean.getVerificationDeductible() />
		<cfset var localVerificationDeductibleAmount = arguments.bean.getVerificationDeductibleAmount() />
		<cfset var localVerificationDeductibleAmountMet = arguments.bean.getVerificationDeductibleAmountMet() />
		<cfset var localVerificationPPOPolicy = arguments.bean.getVerificationPPOPolicy() />
		<cfset var localVerificationPercentagePayAfterDeductible = arguments.bean.getVerificationPercentagePayAfterDeductible() />
		<cfset var localVerificationPriorAuth = arguments.bean.getVerificationPriorAuth() />
		<cfset var localVerificationAuthNumber = arguments.bean.getVerificationAuthNumber() />
		<cfset var localVerificationLifetimeBenefitMet = arguments.bean.getVerificationLifetimeBenefitMet() />
		<cfset var localVerificationAuthPhoneNumber = arguments.bean.getVerificationAuthPhoneNumber() />
		<cfset var localVerificationMedicareSupplement = arguments.bean.getVerificationMedicareSupplement() />
		<cfset var localVerificationCoordinateBenefits = arguments.bean.getVerificationCoordinateBenefits() />
		<cfset var localVerificationPaidMedicareDeductible = arguments.bean.getVerificationPaidMedicareDeductible() />
		<cfset var localVerificationMedicaidPlan = arguments.bean.getVerificationMedicaidPlan() />
		<cfset var localVerificationTypeBasePlan = arguments.bean.getVerificationTypeBasePlan() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateVerificationPatientInsurance" datasource="#trim(arguments.ds)#">
				UPDATE VerificationPatientInsurance  SET
					
					usersID =						
						<cfqueryparam value="#trim(localusersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					picID =						
						<cfqueryparam value="#trim(localpicID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					VerificationRepFName =	
					<cfif trim(localVerificationRepFName) NEQ "" AND trim(localVerificationRepFName) NEQ "@@" AND trim(localVerificationRepFName) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationRepFName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationRepLName =	
					<cfif trim(localVerificationRepLName) NEQ "" AND trim(localVerificationRepLName) NEQ "@@" AND trim(localVerificationRepLName) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationRepLName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDate =	
					<cfif IsDate(trim(localVerificationDate))>						
						<cfqueryparam value="#trim(localVerificationDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					VerificationTime =	
					<cfif trim(localVerificationTime) NEQ "" AND trim(localVerificationTime) NEQ "@@" AND trim(localVerificationTime) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationTime)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationHaveIns =	
					<cfif trim(localVerificationHaveIns) NEQ "" AND trim(localVerificationHaveIns) NEQ "@@" AND trim(localVerificationHaveIns) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationHaveIns)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationHaveInsFromDate =	
					<cfif IsDate(trim(localVerificationHaveInsFromDate))>						
						<cfqueryparam value="#trim(localVerificationHaveInsFromDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					VerificationHaveInsToDate =	
					<cfif IsDate(trim(localVerificationHaveInsToDate))>						
						<cfqueryparam value="#trim(localVerificationHaveInsToDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					VerificationHaveDMECov =	
					<cfif trim(localVerificationHaveDMECov) NEQ "" AND trim(localVerificationHaveDMECov) NEQ "@@" AND trim(localVerificationHaveDMECov) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationHaveDMECov)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDeductible =	
					<cfif trim(localVerificationDeductible) NEQ "" AND trim(localVerificationDeductible) NEQ "@@" AND trim(localVerificationDeductible) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationDeductible)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDeductibleAmount =	
					<cfif trim(localVerificationDeductibleAmount) NEQ "" AND trim(localVerificationDeductibleAmount) NEQ "@@" AND trim(localVerificationDeductibleAmount) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationDeductibleAmount)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDeductibleAmountMet =	
					<cfif trim(localVerificationDeductibleAmountMet) NEQ "" AND trim(localVerificationDeductibleAmountMet) NEQ "@@" AND trim(localVerificationDeductibleAmountMet) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationDeductibleAmountMet)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPPOPolicy =	
					<cfif trim(localVerificationPPOPolicy) NEQ "" AND trim(localVerificationPPOPolicy) NEQ "@@" AND trim(localVerificationPPOPolicy) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPPOPolicy)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPercentagePayAfterDeductible =	
					<cfif trim(localVerificationPercentagePayAfterDeductible) NEQ "" AND trim(localVerificationPercentagePayAfterDeductible) NEQ "@@" AND trim(localVerificationPercentagePayAfterDeductible) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPercentagePayAfterDeductible)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPriorAuth =	
					<cfif trim(localVerificationPriorAuth) NEQ "" AND trim(localVerificationPriorAuth) NEQ "@@" AND trim(localVerificationPriorAuth) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPriorAuth)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationAuthNumber =	
					<cfif trim(localVerificationAuthNumber) NEQ "" AND trim(localVerificationAuthNumber) NEQ "@@" AND trim(localVerificationAuthNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationAuthNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationLifetimeBenefitMet =	
					<cfif trim(localVerificationLifetimeBenefitMet) NEQ "" AND trim(localVerificationLifetimeBenefitMet) NEQ "@@" AND trim(localVerificationLifetimeBenefitMet) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationLifetimeBenefitMet)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationAuthPhoneNumber =	
					<cfif trim(localVerificationAuthPhoneNumber) NEQ "" AND trim(localVerificationAuthPhoneNumber) NEQ "@@" AND trim(localVerificationAuthPhoneNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationAuthPhoneNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationMedicareSupplement =	
					<cfif trim(localVerificationMedicareSupplement) NEQ "" AND trim(localVerificationMedicareSupplement) NEQ "@@" AND trim(localVerificationMedicareSupplement) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationMedicareSupplement)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationCoordinateBenefits =	
					<cfif trim(localVerificationCoordinateBenefits) NEQ "" AND trim(localVerificationCoordinateBenefits) NEQ "@@" AND trim(localVerificationCoordinateBenefits) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationCoordinateBenefits)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPaidMedicareDeductible =	
					<cfif trim(localVerificationPaidMedicareDeductible) NEQ "" AND trim(localVerificationPaidMedicareDeductible) NEQ "@@" AND trim(localVerificationPaidMedicareDeductible) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationPaidMedicareDeductible)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationMedicaidPlan =	
					<cfif trim(localVerificationMedicaidPlan) NEQ "" AND trim(localVerificationMedicaidPlan) NEQ "@@" AND trim(localVerificationMedicaidPlan) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationMedicaidPlan)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationTypeBasePlan =	
					<cfif trim(localVerificationTypeBasePlan) NEQ "" AND trim(localVerificationTypeBasePlan) NEQ "@@" AND trim(localVerificationTypeBasePlan) NEQ "NULL">						
						<cfqueryparam value="#trim(localVerificationTypeBasePlan)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE VerificationPatientInsuranceID = <cfqueryparam value="#trim(arguments.bean.getVerificationPatientInsuranceID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="VerificationPatientInsuranceBean" />
		<cfset var qDeleteVerificationPatientInsurance = "">

		<cfquery name="qDeleteVerificationPatientInsurance" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM VerificationPatientInsurance
			WHERE VerificationPatientInsuranceID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getVerificationPatientInsuranceID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPatientInsurance" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="VerificationPatientInsuranceID" required="yes" type="numeric" />		
		<cfset var qGetVerificationPatientInsurance = "" />		
	
		<cfquery name="qGetVerificationPatientInsurance" datasource="#trim(arguments.ds)#">
	  		SELECT VerificationPatientInsuranceID,usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified
			FROM VerificationPatientInsurance  
			WHERE VerificationPatientInsuranceID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.VerificationPatientInsuranceID)#" /> 
		</cfquery>
		
		<cfreturn qGetVerificationPatientInsurance>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


