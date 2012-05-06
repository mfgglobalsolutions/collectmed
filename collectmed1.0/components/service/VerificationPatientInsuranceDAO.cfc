 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the VerificationPatientInsurance DAO Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a VerificationPatientInsurance, either by creating a new entry or updating an existing one.">
		<cfargument name="VerificationPatientInsurance" required="true" type="cmComponents.com.common.model.VerificationPatientInsurance" hint="I am the VerificationPatientInsurance bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.VerificationPatientInsurance)>
			<cfset success = update(arguments.VerificationPatientInsurance) />
		<cfelse>
			<cfset success = create(arguments.VerificationPatientInsurance) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific VerificationPatientInsurance exists within the database, using the ID as a check.">
		<cfargument name="VerificationPatientInsurance" required="true" type="cmComponents.com.common.model.VerificationPatientInsurance" hint="I am the VerificationPatientInsurance bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.datasource.getDSName()#" maxrows="1">
			SELECT count(1) as idexists
			FROM VerificationPatientInsurance
			WHERE VerificationPatientInsuranceID = <cfqueryparam value="#arguments.VerificationPatientInsurance.getVerificationPatientInsuranceID()#" CFSQLType="cf_sql_integer" />
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
				
		<cfargument name="VerificationPatientInsurance" required="true" type="cmComponents.com.common.model.VerificationPatientInsurance" />
		
		<cfset var qCreateVerificationPatientInsurance = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateVerificationPatientInsurance" datasource="#variables.instance.datasource.getDSName()#">
				INSERT INTO VerificationPatientInsurance (usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getusersID())#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getpicID())#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationRepFName()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationRepFName()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationRepFName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationRepFName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationRepLName()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationRepLName()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationRepLName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationRepLName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(arguments.VerificationPatientInsurance.getVerificationDate()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDate())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationTime()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationTime()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationTime()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationTime())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationHaveIns()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveIns()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveIns()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveIns())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(arguments.VerificationPatientInsurance.getVerificationHaveInsFromDate()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveInsFromDate())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(arguments.VerificationPatientInsurance.getVerificationHaveInsToDate()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveInsToDate())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationDeductible()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductible()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductible()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDeductible())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.VerificationPatientInsurance.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS VerificationPatientInsuranceID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.VerificationPatientInsurance.setVerificationPatientInsuranceID(qCreateVerificationPatientInsurance.VerificationPatientInsuranceID);
		</cfscript>
		
		<cfreturn arguments.VerificationPatientInsurance />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="VerificationPatientInsurance" type="cmComponents.com.common.model.VerificationPatientInsurance" required="true" />
				
		<cfset var qGetVerificationPatientInsurance = "" />
				
		<cfset qGetVerificationPatientInsurance = getVerificationPatientInsuranceByID(trim(arguments.VerificationPatientInsurance.getVerificationPatientInsuranceID())) />
				
		<cfif qGetVerificationPatientInsurance.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetVerificationPatientInsurance.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetVerificationPatientInsurance, 1)>
				<cfset arguments.VerificationPatientInsurance.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="VerificationPatientInsurance" required="true" type="cmComponents.com.common.model.VerificationPatientInsurance" />
		<cfset var qUpdateVerificationPatientInsurance = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdateVerificationPatientInsurance" datasource="#variables.instance.datasource.getDSName()#">
				UPDATE VerificationPatientInsurance  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					usersID =						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getusersID())#" cfsqltype="CF_SQL_INTEGER" />,
					
					picID =						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getpicID())#" cfsqltype="CF_SQL_INTEGER" />,
					
					VerificationRepFName =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationRepFName()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationRepFName()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationRepFName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationRepFName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationRepLName =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationRepLName()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationRepLName()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationRepLName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationRepLName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDate =	
					<cfif IsDate(trim(arguments.VerificationPatientInsurance.getVerificationDate()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDate())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					VerificationTime =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationTime()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationTime()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationTime()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationTime())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationHaveIns =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationHaveIns()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveIns()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveIns()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveIns())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationHaveInsFromDate =	
					<cfif IsDate(trim(arguments.VerificationPatientInsurance.getVerificationHaveInsFromDate()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveInsFromDate())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					VerificationHaveInsToDate =	
					<cfif IsDate(trim(arguments.VerificationPatientInsurance.getVerificationHaveInsToDate()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveInsToDate())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					VerificationHaveDMECov =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationHaveDMECov())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDeductible =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationDeductible()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductible()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductible()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDeductible())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDeductibleAmount =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmount())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationDeductibleAmountMet =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationDeductibleAmountMet())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPPOPolicy =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPPOPolicy())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPercentagePayAfterDeductible =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPercentagePayAfterDeductible())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPriorAuth =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPriorAuth())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationAuthNumber =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationAuthNumber())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationLifetimeBenefitMet =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationLifetimeBenefitMet())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationAuthPhoneNumber =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationAuthPhoneNumber())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationMedicareSupplement =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationMedicareSupplement())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationCoordinateBenefits =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationCoordinateBenefits())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationPaidMedicareDeductible =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPaidMedicareDeductible())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationMedicaidPlan =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationMedicaidPlan())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					VerificationTypeBasePlan =	
					<cfif trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan()) NEQ "" AND trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan()) NEQ "@@" AND trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationTypeBasePlan())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.VerificationPatientInsurance.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE VerificationPatientInsuranceID = <cfqueryparam value="#trim(arguments.VerificationPatientInsurance.getVerificationPatientInsuranceID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="VerificationPatientInsuranceID" required="true" type="String" />
		
		<cfset var qDeleteVerificationPatientInsurance = "">

		<cfquery name="qDeleteVerificationPatientInsurance" datasource="#variables.instance.datasource.getDSName()#" result="status">
			DELETE
			FROM VerificationPatientInsurance
			WHERE VerificationPatientInsuranceID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.VerificationPatientInsuranceID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPatientInsuranceByID" output="false" access="public" returntype="query">
		
		<cfargument name="VerificationPatientInsuranceID" required="yes" type="numeric" />		
		
		<cfset var qGetVerificationPatientInsurance = "" />		
	
		<cfquery name="qGetVerificationPatientInsurance" datasource="#variables.instance.datasource.getDSName()#">
	  		SELECT VerificationPatientInsuranceID,usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified
			FROM VerificationPatientInsurance  
			WHERE VerificationPatientInsuranceID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.VerificationPatientInsuranceID)#" /> 
		</cfquery>
		
		<cfreturn qGetVerificationPatientInsurance>
		
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


