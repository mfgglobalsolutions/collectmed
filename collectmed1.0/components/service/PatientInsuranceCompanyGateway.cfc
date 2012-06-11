 	

<cfcomponent displayname="PatientInsuranceCompanyGateway" output="false" hint="I am the PatientInsuranceCompany Gateway Class.">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the PatientInsuranceCompany Gateway Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- PUBLIC METHODS                                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllPatientInsuranceCompanys" access="public" output="false" hint="I run a query of all PatientInsuranceCompanys within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllPatientInsuranceCompanys(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- PRIVATE METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllPatientInsuranceCompanys" access="package" output="false" hint="I run a query and will return all PatientInsuranceCompany records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.datasource.getDSName()#">
				SELECT recordID,PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified
				FROM patientinsurancecompany
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "recordID")>				
						AND recordID IN(#arguments.filter.recordID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PatientID")>				
						AND PatientID = <cfqueryparam value="#arguments.filter.PatientID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InsuranceCompanyID")>				
						AND InsuranceCompanyID = <cfqueryparam value="#arguments.filter.InsuranceCompanyID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PrimSecTer")>				
						AND PrimSecTer = <cfqueryparam value="#arguments.filter.PrimSecTer#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyNumber")>				
						AND PolicyNumber = <cfqueryparam value="#arguments.filter.PolicyNumber#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersFirstName")>				
						AND PolicyHoldersFirstName = <cfqueryparam value="#arguments.filter.PolicyHoldersFirstName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersLastName")>				
						AND PolicyHoldersLastName = <cfqueryparam value="#arguments.filter.PolicyHoldersLastName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersMiddleInitial")>				
						AND PolicyHoldersMiddleInitial = <cfqueryparam value="#arguments.filter.PolicyHoldersMiddleInitial#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersDOB")>				
						AND PolicyHoldersDOB = <cfqueryparam value="#arguments.filter.PolicyHoldersDOB#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersSex")>				
						AND PolicyHoldersSex = <cfqueryparam value="#arguments.filter.PolicyHoldersSex#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersAddressLine1")>				
						AND PolicyHoldersAddressLine1 = <cfqueryparam value="#arguments.filter.PolicyHoldersAddressLine1#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersAddressLine2")>				
						AND PolicyHoldersAddressLine2 = <cfqueryparam value="#arguments.filter.PolicyHoldersAddressLine2#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersCity")>				
						AND PolicyHoldersCity = <cfqueryparam value="#arguments.filter.PolicyHoldersCity#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersStateID")>				
						AND PolicyHoldersStateID = <cfqueryparam value="#arguments.filter.PolicyHoldersStateID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersZipCode")>				
						AND PolicyHoldersZipCode = <cfqueryparam value="#arguments.filter.PolicyHoldersZipCode#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersPhone")>				
						AND PolicyHoldersPhone = <cfqueryparam value="#arguments.filter.PolicyHoldersPhone#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersPhoneExtension")>				
						AND PolicyHoldersPhoneExtension = <cfqueryparam value="#arguments.filter.PolicyHoldersPhoneExtension#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersEmployerSchoolName")>				
						AND PolicyHoldersEmployerSchoolName = <cfqueryparam value="#arguments.filter.PolicyHoldersEmployerSchoolName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersEffectiveDateFrom")>				
						AND PolicyHoldersEffectiveDateFrom = <cfqueryparam value="#arguments.filter.PolicyHoldersEffectiveDateFrom#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PolicyHoldersEffectiveDateTo")>				
						AND PolicyHoldersEffectiveDateTo = <cfqueryparam value="#arguments.filter.PolicyHoldersEffectiveDateTo#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "GroupNumber")>				
						AND GroupNumber = <cfqueryparam value="#arguments.filter.GroupNumber#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "GroupName")>				
						AND GroupName = <cfqueryparam value="#arguments.filter.GroupName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "Deductible")>				
						AND Deductible = <cfqueryparam value="#arguments.filter.Deductible#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PayPercentage")>				
						AND PayPercentage = <cfqueryparam value="#arguments.filter.PayPercentage#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "Relationship")>				
						AND Relationship = <cfqueryparam value="#arguments.filter.Relationship#" cfsqltype="CF_SQL_INTEGER" />
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



