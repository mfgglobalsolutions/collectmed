 	

<cfcomponent displayname="VerificationPatientInsuranceGateway" output="false" hint="I am the VerificationPatientInsurance Gateway Class.">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the VerificationPatientInsurance Gateway Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- PUBLIC METHODS                                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllVerificationPatientInsurances" access="public" output="false" hint="I run a query of all VerificationPatientInsurances within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllVerificationPatientInsurances(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- PRIVATE METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllVerificationPatientInsurances" access="package" output="false" hint="I run a query and will return all VerificationPatientInsurance records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.datasource.getDSName()#">
				SELECT VerificationPatientInsuranceID,usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified
				FROM verificationpatientinsurance
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "VerificationPatientInsuranceID")>				
						AND VerificationPatientInsuranceID IN(#arguments.filter.VerificationPatientInsuranceID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "usersID")>				
						AND usersID = <cfqueryparam value="#arguments.filter.usersID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "picID")>				
						AND picID = <cfqueryparam value="#arguments.filter.picID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationRepFName")>				
						AND VerificationRepFName = <cfqueryparam value="#arguments.filter.VerificationRepFName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationRepLName")>				
						AND VerificationRepLName = <cfqueryparam value="#arguments.filter.VerificationRepLName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationDate")>				
						AND VerificationDate = <cfqueryparam value="#arguments.filter.VerificationDate#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationTime")>				
						AND VerificationTime = <cfqueryparam value="#arguments.filter.VerificationTime#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationHaveIns")>				
						AND VerificationHaveIns = <cfqueryparam value="#arguments.filter.VerificationHaveIns#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationHaveInsFromDate")>				
						AND VerificationHaveInsFromDate = <cfqueryparam value="#arguments.filter.VerificationHaveInsFromDate#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationHaveInsToDate")>				
						AND VerificationHaveInsToDate = <cfqueryparam value="#arguments.filter.VerificationHaveInsToDate#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationHaveDMECov")>				
						AND VerificationHaveDMECov = <cfqueryparam value="#arguments.filter.VerificationHaveDMECov#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationDeductible")>				
						AND VerificationDeductible = <cfqueryparam value="#arguments.filter.VerificationDeductible#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationDeductibleAmount")>				
						AND VerificationDeductibleAmount = <cfqueryparam value="#arguments.filter.VerificationDeductibleAmount#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationDeductibleAmountMet")>				
						AND VerificationDeductibleAmountMet = <cfqueryparam value="#arguments.filter.VerificationDeductibleAmountMet#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationPPOPolicy")>				
						AND VerificationPPOPolicy = <cfqueryparam value="#arguments.filter.VerificationPPOPolicy#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationPercentagePayAfterDeductible")>				
						AND VerificationPercentagePayAfterDeductible = <cfqueryparam value="#arguments.filter.VerificationPercentagePayAfterDeductible#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationPriorAuth")>				
						AND VerificationPriorAuth = <cfqueryparam value="#arguments.filter.VerificationPriorAuth#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationAuthNumber")>				
						AND VerificationAuthNumber = <cfqueryparam value="#arguments.filter.VerificationAuthNumber#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationLifetimeBenefitMet")>				
						AND VerificationLifetimeBenefitMet = <cfqueryparam value="#arguments.filter.VerificationLifetimeBenefitMet#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationAuthPhoneNumber")>				
						AND VerificationAuthPhoneNumber = <cfqueryparam value="#arguments.filter.VerificationAuthPhoneNumber#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationMedicareSupplement")>				
						AND VerificationMedicareSupplement = <cfqueryparam value="#arguments.filter.VerificationMedicareSupplement#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationCoordinateBenefits")>				
						AND VerificationCoordinateBenefits = <cfqueryparam value="#arguments.filter.VerificationCoordinateBenefits#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationPaidMedicareDeductible")>				
						AND VerificationPaidMedicareDeductible = <cfqueryparam value="#arguments.filter.VerificationPaidMedicareDeductible#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationMedicaidPlan")>				
						AND VerificationMedicaidPlan = <cfqueryparam value="#arguments.filter.VerificationMedicaidPlan#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "VerificationTypeBasePlan")>				
						AND VerificationTypeBasePlan = <cfqueryparam value="#arguments.filter.VerificationTypeBasePlan#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "Active")>				
						AND Active = <cfqueryparam value="#arguments.filter.Active#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InactiveCode")>				
						AND InactiveCode = <cfqueryparam value="#arguments.filter.InactiveCode#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "DateCreated")>				
						AND DateCreated = <cfqueryparam value="#arguments.filter.DateCreated#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>
					<cfif structKeyExists(arguments.filter, "orderBy")>
						ORDER BY #arguments.filter.orderBy#		
					</cfif>
				</cfif>		
			</cfquery>
				
		<cfreturn qSearch />
		
	</cffunction>
		
		
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>



