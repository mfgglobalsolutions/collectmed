 	


<cfcomponent name="verificationpatientinsuranceBean" output="false" alias="verificationpatientinsuranceBean" extends="VerificationPatientInsuranceDAO">

	<cfproperty name="VerificationPatientInsuranceID" type="numeric" default="0" />
	<cfproperty name="usersID" type="numeric" default="" />
	<cfproperty name="picID" type="numeric" default="" />
	<cfproperty name="VerificationRepFName" type="string" default="" />
	<cfproperty name="VerificationRepLName" type="string" default="" />
	<cfproperty name="VerificationDate" type="datetime" default="" />
	<cfproperty name="VerificationTime" type="string" default="" />
	<cfproperty name="VerificationHaveIns" type="string" default="" />
	<cfproperty name="VerificationHaveInsFromDate" type="datetime" default="" />
	<cfproperty name="VerificationHaveInsToDate" type="datetime" default="" />
	<cfproperty name="VerificationHaveDMECov" type="string" default="" />
	<cfproperty name="VerificationDeductible" type="string" default="" />
	<cfproperty name="VerificationDeductibleAmount" type="string" default="" />
	<cfproperty name="VerificationDeductibleAmountMet" type="string" default="" />
	<cfproperty name="VerificationPPOPolicy" type="string" default="" />
	<cfproperty name="VerificationPercentagePayAfterDeductible" type="string" default="" />
	<cfproperty name="VerificationPriorAuth" type="string" default="" />
	<cfproperty name="VerificationAuthNumber" type="string" default="" />
	<cfproperty name="VerificationLifetimeBenefitMet" type="string" default="" />
	<cfproperty name="VerificationAuthPhoneNumber" type="string" default="" />
	<cfproperty name="VerificationMedicareSupplement" type="string" default="" />
	<cfproperty name="VerificationCoordinateBenefits" type="string" default="" />
	<cfproperty name="VerificationPaidMedicareDeductible" type="string" default="" />
	<cfproperty name="VerificationMedicaidPlan" type="string" default="" />
	<cfproperty name="VerificationTypeBasePlan" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.VerificationPatientInsuranceID = 0;
		variables.usersID = "";
		variables.picID = "";
		variables.VerificationRepFName = "";
		variables.VerificationRepLName = "";
		variables.VerificationDate = "";
		variables.VerificationTime = "";
		variables.VerificationHaveIns = "";
		variables.VerificationHaveInsFromDate = "";
		variables.VerificationHaveInsToDate = "";
		variables.VerificationHaveDMECov = "";
		variables.VerificationDeductible = "";
		variables.VerificationDeductibleAmount = "";
		variables.VerificationDeductibleAmountMet = "";
		variables.VerificationPPOPolicy = "";
		variables.VerificationPercentagePayAfterDeductible = "";
		variables.VerificationPriorAuth = "";
		variables.VerificationAuthNumber = "";
		variables.VerificationLifetimeBenefitMet = "";
		variables.VerificationAuthPhoneNumber = "";
		variables.VerificationMedicareSupplement = "";
		variables.VerificationCoordinateBenefits = "";
		variables.VerificationPaidMedicareDeductible = "";
		variables.VerificationMedicaidPlan = "";
		variables.VerificationTypeBasePlan = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="verificationpatientinsuranceBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "VerificationPatientInsuranceID") AND stValues.VerificationPatientInsuranceID NEQ 0>
				<cfquery name="qGetVerificationPatientInsurance" datasource="#trim(arguments.ds)#">
			  		SELECT VerificationPatientInsuranceID,usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified
					FROM VerificationPatientInsurance  
					WHERE VerificationPatientInsuranceID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.VerificationPatientInsuranceID#" /> 
				</cfquery>		
				<cfif qGetVerificationPatientInsurance.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.usersID = qGetVerificationPatientInsurance.usersID;
					variables.picID = qGetVerificationPatientInsurance.picID;
					variables.VerificationRepFName = qGetVerificationPatientInsurance.VerificationRepFName;
					variables.VerificationRepLName = qGetVerificationPatientInsurance.VerificationRepLName;
					variables.VerificationDate = qGetVerificationPatientInsurance.VerificationDate;
					variables.VerificationTime = qGetVerificationPatientInsurance.VerificationTime;
					variables.VerificationHaveIns = qGetVerificationPatientInsurance.VerificationHaveIns;
					variables.VerificationHaveInsFromDate = qGetVerificationPatientInsurance.VerificationHaveInsFromDate;
					variables.VerificationHaveInsToDate = qGetVerificationPatientInsurance.VerificationHaveInsToDate;
					variables.VerificationHaveDMECov = qGetVerificationPatientInsurance.VerificationHaveDMECov;
					variables.VerificationDeductible = qGetVerificationPatientInsurance.VerificationDeductible;
					variables.VerificationDeductibleAmount = qGetVerificationPatientInsurance.VerificationDeductibleAmount;
					variables.VerificationDeductibleAmountMet = qGetVerificationPatientInsurance.VerificationDeductibleAmountMet;
					variables.VerificationPPOPolicy = qGetVerificationPatientInsurance.VerificationPPOPolicy;
					variables.VerificationPercentagePayAfterDeductible = qGetVerificationPatientInsurance.VerificationPercentagePayAfterDeductible;
					variables.VerificationPriorAuth = qGetVerificationPatientInsurance.VerificationPriorAuth;
					variables.VerificationAuthNumber = qGetVerificationPatientInsurance.VerificationAuthNumber;
					variables.VerificationLifetimeBenefitMet = qGetVerificationPatientInsurance.VerificationLifetimeBenefitMet;
					variables.VerificationAuthPhoneNumber = qGetVerificationPatientInsurance.VerificationAuthPhoneNumber;
					variables.VerificationMedicareSupplement = qGetVerificationPatientInsurance.VerificationMedicareSupplement;
					variables.VerificationCoordinateBenefits = qGetVerificationPatientInsurance.VerificationCoordinateBenefits;
					variables.VerificationPaidMedicareDeductible = qGetVerificationPatientInsurance.VerificationPaidMedicareDeductible;
					variables.VerificationMedicaidPlan = qGetVerificationPatientInsurance.VerificationMedicaidPlan;
					variables.VerificationTypeBasePlan = qGetVerificationPatientInsurance.VerificationTypeBasePlan;
					variables.Active = qGetVerificationPatientInsurance.Active;
					variables.InactiveCode = qGetVerificationPatientInsurance.InactiveCode;
					variables.DateModified = qGetVerificationPatientInsurance.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "VerificationPatientInsuranceID")><cfset variables.VerificationPatientInsuranceID = stValues.VerificationPatientInsuranceID /></cfif>
			<cfif StructKeyExists(stValues, "usersID")><cfset variables.usersID = stValues.usersID /></cfif>
			<cfif StructKeyExists(stValues, "picID")><cfset variables.picID = stValues.picID /></cfif>
			<cfif StructKeyExists(stValues, "VerificationRepFName")><cfset variables.VerificationRepFName = stValues.VerificationRepFName /></cfif>
			<cfif StructKeyExists(stValues, "VerificationRepLName")><cfset variables.VerificationRepLName = stValues.VerificationRepLName /></cfif>
			<cfif StructKeyExists(stValues, "VerificationDate")><cfset variables.VerificationDate = stValues.VerificationDate /></cfif>
			<cfif StructKeyExists(stValues, "VerificationTime")><cfset variables.VerificationTime = stValues.VerificationTime /></cfif>
			<cfif StructKeyExists(stValues, "VerificationHaveIns")><cfset variables.VerificationHaveIns = stValues.VerificationHaveIns /></cfif>
			<cfif StructKeyExists(stValues, "VerificationHaveInsFromDate")><cfset variables.VerificationHaveInsFromDate = stValues.VerificationHaveInsFromDate /></cfif>
			<cfif StructKeyExists(stValues, "VerificationHaveInsToDate")><cfset variables.VerificationHaveInsToDate = stValues.VerificationHaveInsToDate /></cfif>
			<cfif StructKeyExists(stValues, "VerificationHaveDMECov")><cfset variables.VerificationHaveDMECov = stValues.VerificationHaveDMECov /></cfif>
			<cfif StructKeyExists(stValues, "VerificationDeductible")><cfset variables.VerificationDeductible = stValues.VerificationDeductible /></cfif>
			<cfif StructKeyExists(stValues, "VerificationDeductibleAmount")><cfset variables.VerificationDeductibleAmount = stValues.VerificationDeductibleAmount /></cfif>
			<cfif StructKeyExists(stValues, "VerificationDeductibleAmountMet")><cfset variables.VerificationDeductibleAmountMet = stValues.VerificationDeductibleAmountMet /></cfif>
			<cfif StructKeyExists(stValues, "VerificationPPOPolicy")><cfset variables.VerificationPPOPolicy = stValues.VerificationPPOPolicy /></cfif>
			<cfif StructKeyExists(stValues, "VerificationPercentagePayAfterDeductible")><cfset variables.VerificationPercentagePayAfterDeductible = stValues.VerificationPercentagePayAfterDeductible /></cfif>
			<cfif StructKeyExists(stValues, "VerificationPriorAuth")><cfset variables.VerificationPriorAuth = stValues.VerificationPriorAuth /></cfif>
			<cfif StructKeyExists(stValues, "VerificationAuthNumber")><cfset variables.VerificationAuthNumber = stValues.VerificationAuthNumber /></cfif>
			<cfif StructKeyExists(stValues, "VerificationLifetimeBenefitMet")><cfset variables.VerificationLifetimeBenefitMet = stValues.VerificationLifetimeBenefitMet /></cfif>
			<cfif StructKeyExists(stValues, "VerificationAuthPhoneNumber")><cfset variables.VerificationAuthPhoneNumber = stValues.VerificationAuthPhoneNumber /></cfif>
			<cfif StructKeyExists(stValues, "VerificationMedicareSupplement")><cfset variables.VerificationMedicareSupplement = stValues.VerificationMedicareSupplement /></cfif>
			<cfif StructKeyExists(stValues, "VerificationCoordinateBenefits")><cfset variables.VerificationCoordinateBenefits = stValues.VerificationCoordinateBenefits /></cfif>
			<cfif StructKeyExists(stValues, "VerificationPaidMedicareDeductible")><cfset variables.VerificationPaidMedicareDeductible = stValues.VerificationPaidMedicareDeductible /></cfif>
			<cfif StructKeyExists(stValues, "VerificationMedicaidPlan")><cfset variables.VerificationMedicaidPlan = stValues.VerificationMedicaidPlan /></cfif>
			<cfif StructKeyExists(stValues, "VerificationTypeBasePlan")><cfset variables.VerificationTypeBasePlan = stValues.VerificationTypeBasePlan /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationPatientInsuranceID.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationPatientInsuranceID" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationPatientInsuranceID>
	</cffunction>
	
	<cffunction name="setVerificationPatientInsuranceID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationPatientInsuranceID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.VerificationPatientInsuranceID)) OR trim(arguments.VerificationPatientInsuranceID) EQ "">
			<cfset variables.VerificationPatientInsuranceID = arguments.VerificationPatientInsuranceID />
		<cfelse>
			<cfthrow message="VerificationPatientInsuranceID (#arguments.VerificationPatientInsuranceID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationPatientInsuranceID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for usersID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getusersID" acess="public" output="false" returntype="any">
		<cfreturn variables.usersID>
	</cffunction>
	
	<cffunction name="setusersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="usersID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.usersID)) OR trim(arguments.usersID) EQ "">
			<cfset variables.usersID = arguments.usersID />
		<cfelse>
			<cfthrow message="usersID (#arguments.usersID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "usersID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for picID.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpicID" acess="public" output="false" returntype="any">
		<cfreturn variables.picID>
	</cffunction>
	
	<cffunction name="setpicID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="picID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.picID)) OR trim(arguments.picID) EQ "">
			<cfset variables.picID = arguments.picID />
		<cfelse>
			<cfthrow message="picID (#arguments.picID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "picID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationRepFName.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationRepFName" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationRepFName>
	</cffunction>
	
	<cffunction name="setVerificationRepFName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationRepFName" required="true" type="any" />
			
		<cfset variables.VerificationRepFName = arguments.VerificationRepFName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationRepFName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationRepLName.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationRepLName" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationRepLName>
	</cffunction>
	
	<cffunction name="setVerificationRepLName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationRepLName" required="true" type="any" />
			
		<cfset variables.VerificationRepLName = arguments.VerificationRepLName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationRepLName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationDate.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationDate" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationDate>
	</cffunction>
	
	<cffunction name="setVerificationDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.VerificationDate)) OR trim(arguments.VerificationDate) EQ "">
			<cfset variables.VerificationDate = arguments.VerificationDate />
		<cfelse>
			<cfthrow message="VerificationDate (#arguments.VerificationDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationTime.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationTime" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationTime>
	</cffunction>
	
	<cffunction name="setVerificationTime" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationTime" required="true" type="any" />
			
		<cfset variables.VerificationTime = arguments.VerificationTime />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationTime") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationHaveIns.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationHaveIns" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationHaveIns>
	</cffunction>
	
	<cffunction name="setVerificationHaveIns" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationHaveIns" required="true" type="any" />
			
		<cfset variables.VerificationHaveIns = arguments.VerificationHaveIns />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationHaveIns") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationHaveInsFromDate.                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationHaveInsFromDate" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationHaveInsFromDate>
	</cffunction>
	
	<cffunction name="setVerificationHaveInsFromDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationHaveInsFromDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.VerificationHaveInsFromDate)) OR trim(arguments.VerificationHaveInsFromDate) EQ "">
			<cfset variables.VerificationHaveInsFromDate = arguments.VerificationHaveInsFromDate />
		<cfelse>
			<cfthrow message="VerificationHaveInsFromDate (#arguments.VerificationHaveInsFromDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationHaveInsFromDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationHaveInsToDate.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationHaveInsToDate" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationHaveInsToDate>
	</cffunction>
	
	<cffunction name="setVerificationHaveInsToDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationHaveInsToDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.VerificationHaveInsToDate)) OR trim(arguments.VerificationHaveInsToDate) EQ "">
			<cfset variables.VerificationHaveInsToDate = arguments.VerificationHaveInsToDate />
		<cfelse>
			<cfthrow message="VerificationHaveInsToDate (#arguments.VerificationHaveInsToDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationHaveInsToDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationHaveDMECov.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationHaveDMECov" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationHaveDMECov>
	</cffunction>
	
	<cffunction name="setVerificationHaveDMECov" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationHaveDMECov" required="true" type="any" />
			
		<cfset variables.VerificationHaveDMECov = arguments.VerificationHaveDMECov />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationHaveDMECov") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationDeductible.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationDeductible" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationDeductible>
	</cffunction>
	
	<cffunction name="setVerificationDeductible" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationDeductible" required="true" type="any" />
			
		<cfset variables.VerificationDeductible = arguments.VerificationDeductible />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationDeductible") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationDeductibleAmount.                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationDeductibleAmount" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationDeductibleAmount>
	</cffunction>
	
	<cffunction name="setVerificationDeductibleAmount" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationDeductibleAmount" required="true" type="any" />
			
		<cfset variables.VerificationDeductibleAmount = arguments.VerificationDeductibleAmount />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationDeductibleAmount") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationDeductibleAmountMet.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationDeductibleAmountMet" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationDeductibleAmountMet>
	</cffunction>
	
	<cffunction name="setVerificationDeductibleAmountMet" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationDeductibleAmountMet" required="true" type="any" />
			
		<cfset variables.VerificationDeductibleAmountMet = arguments.VerificationDeductibleAmountMet />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationDeductibleAmountMet") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationPPOPolicy.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationPPOPolicy" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationPPOPolicy>
	</cffunction>
	
	<cffunction name="setVerificationPPOPolicy" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationPPOPolicy" required="true" type="any" />
			
		<cfset variables.VerificationPPOPolicy = arguments.VerificationPPOPolicy />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationPPOPolicy") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationPercentagePayAfterDeductible.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationPercentagePayAfterDeductible" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationPercentagePayAfterDeductible>
	</cffunction>
	
	<cffunction name="setVerificationPercentagePayAfterDeductible" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationPercentagePayAfterDeductible" required="true" type="any" />
			
		<cfset variables.VerificationPercentagePayAfterDeductible = arguments.VerificationPercentagePayAfterDeductible />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationPercentagePayAfterDeductible") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationPriorAuth.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationPriorAuth" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationPriorAuth>
	</cffunction>
	
	<cffunction name="setVerificationPriorAuth" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationPriorAuth" required="true" type="any" />
			
		<cfset variables.VerificationPriorAuth = arguments.VerificationPriorAuth />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationPriorAuth") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationAuthNumber.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationAuthNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationAuthNumber>
	</cffunction>
	
	<cffunction name="setVerificationAuthNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationAuthNumber" required="true" type="any" />
			
		<cfset variables.VerificationAuthNumber = arguments.VerificationAuthNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationAuthNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationLifetimeBenefitMet.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationLifetimeBenefitMet" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationLifetimeBenefitMet>
	</cffunction>
	
	<cffunction name="setVerificationLifetimeBenefitMet" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationLifetimeBenefitMet" required="true" type="any" />
			
		<cfset variables.VerificationLifetimeBenefitMet = arguments.VerificationLifetimeBenefitMet />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationLifetimeBenefitMet") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationAuthPhoneNumber.                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationAuthPhoneNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationAuthPhoneNumber>
	</cffunction>
	
	<cffunction name="setVerificationAuthPhoneNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationAuthPhoneNumber" required="true" type="any" />
			
		<cfset variables.VerificationAuthPhoneNumber = arguments.VerificationAuthPhoneNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationAuthPhoneNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationMedicareSupplement.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationMedicareSupplement" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationMedicareSupplement>
	</cffunction>
	
	<cffunction name="setVerificationMedicareSupplement" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationMedicareSupplement" required="true" type="any" />
			
		<cfset variables.VerificationMedicareSupplement = arguments.VerificationMedicareSupplement />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationMedicareSupplement") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationCoordinateBenefits.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationCoordinateBenefits" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationCoordinateBenefits>
	</cffunction>
	
	<cffunction name="setVerificationCoordinateBenefits" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationCoordinateBenefits" required="true" type="any" />
			
		<cfset variables.VerificationCoordinateBenefits = arguments.VerificationCoordinateBenefits />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationCoordinateBenefits") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationPaidMedicareDeductible.                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationPaidMedicareDeductible" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationPaidMedicareDeductible>
	</cffunction>
	
	<cffunction name="setVerificationPaidMedicareDeductible" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationPaidMedicareDeductible" required="true" type="any" />
			
		<cfset variables.VerificationPaidMedicareDeductible = arguments.VerificationPaidMedicareDeductible />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationPaidMedicareDeductible") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationMedicaidPlan.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationMedicaidPlan" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationMedicaidPlan>
	</cffunction>
	
	<cffunction name="setVerificationMedicaidPlan" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationMedicaidPlan" required="true" type="any" />
			
		<cfset variables.VerificationMedicaidPlan = arguments.VerificationMedicaidPlan />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationMedicaidPlan") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for VerificationTypeBasePlan.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getVerificationTypeBasePlan" acess="public" output="false" returntype="any">
		<cfreturn variables.VerificationTypeBasePlan>
	</cffunction>
	
	<cffunction name="setVerificationTypeBasePlan" acess="public" output="false" returntype="boolean">
		
		<cfargument name="VerificationTypeBasePlan" required="true" type="any" />
			
		<cfset variables.VerificationTypeBasePlan = arguments.VerificationTypeBasePlan />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "VerificationTypeBasePlan") />		
		
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


