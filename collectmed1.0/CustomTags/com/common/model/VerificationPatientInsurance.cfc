 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.VerificationPatientInsuranceID = "";				
		variables.instance.usersID = "";				
		variables.instance.picID = "";				
		variables.instance.VerificationRepFName = "";				
		variables.instance.VerificationRepLName = "";				
		variables.instance.VerificationDate = "";				
		variables.instance.VerificationTime = "";				
		variables.instance.VerificationHaveIns = "";				
		variables.instance.VerificationHaveInsFromDate = "";				
		variables.instance.VerificationHaveInsToDate = "";				
		variables.instance.VerificationHaveDMECov = "";				
		variables.instance.VerificationDeductible = "";				
		variables.instance.VerificationDeductibleAmount = "";				
		variables.instance.VerificationDeductibleAmountMet = "";				
		variables.instance.VerificationPPOPolicy = "";				
		variables.instance.VerificationPercentagePayAfterDeductible = "";				
		variables.instance.VerificationPriorAuth = "";				
		variables.instance.VerificationAuthNumber = "";				
		variables.instance.VerificationLifetimeBenefitMet = "";				
		variables.instance.VerificationAuthPhoneNumber = "";				
		variables.instance.VerificationMedicareSupplement = "";				
		variables.instance.VerificationCoordinateBenefits = "";				
		variables.instance.VerificationPaidMedicareDeductible = "";				
		variables.instance.VerificationMedicaidPlan = "";				
		variables.instance.VerificationTypeBasePlan = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="VerificationPatientInsurance" output="false">				
		<cfargument name="VerificationPatientInsuranceID" type="string" required="false" default="" hint="VerificationPatientInsuranceID" />				
		<cfargument name="usersID" type="string" required="false" default="" hint="usersID" />				
		<cfargument name="picID" type="string" required="false" default="" hint="picID" />				
		<cfargument name="VerificationRepFName" type="string" required="false" default="" hint="VerificationRepFName" />				
		<cfargument name="VerificationRepLName" type="string" required="false" default="" hint="VerificationRepLName" />				
		<cfargument name="VerificationDate" type="string" required="false" default="" hint="VerificationDate" />				
		<cfargument name="VerificationTime" type="string" required="false" default="" hint="VerificationTime" />				
		<cfargument name="VerificationHaveIns" type="string" required="false" default="" hint="VerificationHaveIns" />				
		<cfargument name="VerificationHaveInsFromDate" type="string" required="false" default="" hint="VerificationHaveInsFromDate" />				
		<cfargument name="VerificationHaveInsToDate" type="string" required="false" default="" hint="VerificationHaveInsToDate" />				
		<cfargument name="VerificationHaveDMECov" type="string" required="false" default="" hint="VerificationHaveDMECov" />				
		<cfargument name="VerificationDeductible" type="string" required="false" default="" hint="VerificationDeductible" />				
		<cfargument name="VerificationDeductibleAmount" type="string" required="false" default="" hint="VerificationDeductibleAmount" />				
		<cfargument name="VerificationDeductibleAmountMet" type="string" required="false" default="" hint="VerificationDeductibleAmountMet" />				
		<cfargument name="VerificationPPOPolicy" type="string" required="false" default="" hint="VerificationPPOPolicy" />				
		<cfargument name="VerificationPercentagePayAfterDeductible" type="string" required="false" default="" hint="VerificationPercentagePayAfterDeductible" />				
		<cfargument name="VerificationPriorAuth" type="string" required="false" default="" hint="VerificationPriorAuth" />				
		<cfargument name="VerificationAuthNumber" type="string" required="false" default="" hint="VerificationAuthNumber" />				
		<cfargument name="VerificationLifetimeBenefitMet" type="string" required="false" default="" hint="VerificationLifetimeBenefitMet" />				
		<cfargument name="VerificationAuthPhoneNumber" type="string" required="false" default="" hint="VerificationAuthPhoneNumber" />				
		<cfargument name="VerificationMedicareSupplement" type="string" required="false" default="" hint="VerificationMedicareSupplement" />				
		<cfargument name="VerificationCoordinateBenefits" type="string" required="false" default="" hint="VerificationCoordinateBenefits" />				
		<cfargument name="VerificationPaidMedicareDeductible" type="string" required="false" default="" hint="VerificationPaidMedicareDeductible" />				
		<cfargument name="VerificationMedicaidPlan" type="string" required="false" default="" hint="VerificationMedicaidPlan" />				
		<cfargument name="VerificationTypeBasePlan" type="string" required="false" default="" hint="VerificationTypeBasePlan" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setVerificationPatientInsuranceID(arguments.VerificationPatientInsuranceID);				
			setusersID(arguments.usersID);				
			setpicID(arguments.picID);				
			setVerificationRepFName(arguments.VerificationRepFName);				
			setVerificationRepLName(arguments.VerificationRepLName);				
			setVerificationDate(arguments.VerificationDate);				
			setVerificationTime(arguments.VerificationTime);				
			setVerificationHaveIns(arguments.VerificationHaveIns);				
			setVerificationHaveInsFromDate(arguments.VerificationHaveInsFromDate);				
			setVerificationHaveInsToDate(arguments.VerificationHaveInsToDate);				
			setVerificationHaveDMECov(arguments.VerificationHaveDMECov);				
			setVerificationDeductible(arguments.VerificationDeductible);				
			setVerificationDeductibleAmount(arguments.VerificationDeductibleAmount);				
			setVerificationDeductibleAmountMet(arguments.VerificationDeductibleAmountMet);				
			setVerificationPPOPolicy(arguments.VerificationPPOPolicy);				
			setVerificationPercentagePayAfterDeductible(arguments.VerificationPercentagePayAfterDeductible);				
			setVerificationPriorAuth(arguments.VerificationPriorAuth);				
			setVerificationAuthNumber(arguments.VerificationAuthNumber);				
			setVerificationLifetimeBenefitMet(arguments.VerificationLifetimeBenefitMet);				
			setVerificationAuthPhoneNumber(arguments.VerificationAuthPhoneNumber);				
			setVerificationMedicareSupplement(arguments.VerificationMedicareSupplement);				
			setVerificationCoordinateBenefits(arguments.VerificationCoordinateBenefits);				
			setVerificationPaidMedicareDeductible(arguments.VerificationPaidMedicareDeductible);				
			setVerificationMedicaidPlan(arguments.VerificationMedicaidPlan);				
			setVerificationTypeBasePlan(arguments.VerificationTypeBasePlan);				
			setActive(arguments.Active);				
			setInactiveCode(arguments.InactiveCode);				
			setDateCreated(arguments.DateCreated);				
			setDateModified(arguments.DateModified);							
		</cfscript>							
		
		<cfreturn this />
			
	</cffunction>

	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!--- getters/setters --->	
	<cffunction name="getVerificationPatientInsuranceID" access="public" hint="Getter for VerificationPatientInsuranceID" output="false" returnType="any">
		<cfreturn variables.instance.VerificationPatientInsuranceID />
	</cffunction>
	
	<cffunction name="setVerificationPatientInsuranceID" access="public" hint="Setter for VerificationPatientInsuranceID" output="false" returnType="void">
		<cfargument name="VerificationPatientInsuranceID" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationPatientInsuranceID = arguments.VerificationPatientInsuranceID />
	</cffunction>				
	
	<cffunction name="getusersID" access="public" hint="Getter for usersID" output="false" returnType="any">
		<cfreturn variables.instance.usersID />
	</cffunction>
	
	<cffunction name="setusersID" access="public" hint="Setter for usersID" output="false" returnType="void">
		<cfargument name="usersID" hint="" required="yes" type="any" />
		<cfset variables.instance.usersID = arguments.usersID />
	</cffunction>				
	
	<cffunction name="getpicID" access="public" hint="Getter for picID" output="false" returnType="any">
		<cfreturn variables.instance.picID />
	</cffunction>
	
	<cffunction name="setpicID" access="public" hint="Setter for picID" output="false" returnType="void">
		<cfargument name="picID" hint="" required="yes" type="any" />
		<cfset variables.instance.picID = arguments.picID />
	</cffunction>				
	
	<cffunction name="getVerificationRepFName" access="public" hint="Getter for VerificationRepFName" output="false" returnType="any">
		<cfreturn variables.instance.VerificationRepFName />
	</cffunction>
	
	<cffunction name="setVerificationRepFName" access="public" hint="Setter for VerificationRepFName" output="false" returnType="void">
		<cfargument name="VerificationRepFName" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationRepFName = arguments.VerificationRepFName />
	</cffunction>				
	
	<cffunction name="getVerificationRepLName" access="public" hint="Getter for VerificationRepLName" output="false" returnType="any">
		<cfreturn variables.instance.VerificationRepLName />
	</cffunction>
	
	<cffunction name="setVerificationRepLName" access="public" hint="Setter for VerificationRepLName" output="false" returnType="void">
		<cfargument name="VerificationRepLName" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationRepLName = arguments.VerificationRepLName />
	</cffunction>				
	
	<cffunction name="getVerificationDate" access="public" hint="Getter for VerificationDate" output="false" returnType="any">
		<cfreturn variables.instance.VerificationDate />
	</cffunction>
	
	<cffunction name="setVerificationDate" access="public" hint="Setter for VerificationDate" output="false" returnType="void">
		<cfargument name="VerificationDate" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationDate = arguments.VerificationDate />
	</cffunction>				
	
	<cffunction name="getVerificationTime" access="public" hint="Getter for VerificationTime" output="false" returnType="any">
		<cfreturn variables.instance.VerificationTime />
	</cffunction>
	
	<cffunction name="setVerificationTime" access="public" hint="Setter for VerificationTime" output="false" returnType="void">
		<cfargument name="VerificationTime" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationTime = arguments.VerificationTime />
	</cffunction>				
	
	<cffunction name="getVerificationHaveIns" access="public" hint="Getter for VerificationHaveIns" output="false" returnType="any">
		<cfreturn variables.instance.VerificationHaveIns />
	</cffunction>
	
	<cffunction name="setVerificationHaveIns" access="public" hint="Setter for VerificationHaveIns" output="false" returnType="void">
		<cfargument name="VerificationHaveIns" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationHaveIns = arguments.VerificationHaveIns />
	</cffunction>				
	
	<cffunction name="getVerificationHaveInsFromDate" access="public" hint="Getter for VerificationHaveInsFromDate" output="false" returnType="any">
		<cfreturn variables.instance.VerificationHaveInsFromDate />
	</cffunction>
	
	<cffunction name="setVerificationHaveInsFromDate" access="public" hint="Setter for VerificationHaveInsFromDate" output="false" returnType="void">
		<cfargument name="VerificationHaveInsFromDate" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationHaveInsFromDate = arguments.VerificationHaveInsFromDate />
	</cffunction>				
	
	<cffunction name="getVerificationHaveInsToDate" access="public" hint="Getter for VerificationHaveInsToDate" output="false" returnType="any">
		<cfreturn variables.instance.VerificationHaveInsToDate />
	</cffunction>
	
	<cffunction name="setVerificationHaveInsToDate" access="public" hint="Setter for VerificationHaveInsToDate" output="false" returnType="void">
		<cfargument name="VerificationHaveInsToDate" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationHaveInsToDate = arguments.VerificationHaveInsToDate />
	</cffunction>				
	
	<cffunction name="getVerificationHaveDMECov" access="public" hint="Getter for VerificationHaveDMECov" output="false" returnType="any">
		<cfreturn variables.instance.VerificationHaveDMECov />
	</cffunction>
	
	<cffunction name="setVerificationHaveDMECov" access="public" hint="Setter for VerificationHaveDMECov" output="false" returnType="void">
		<cfargument name="VerificationHaveDMECov" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationHaveDMECov = arguments.VerificationHaveDMECov />
	</cffunction>				
	
	<cffunction name="getVerificationDeductible" access="public" hint="Getter for VerificationDeductible" output="false" returnType="any">
		<cfreturn variables.instance.VerificationDeductible />
	</cffunction>
	
	<cffunction name="setVerificationDeductible" access="public" hint="Setter for VerificationDeductible" output="false" returnType="void">
		<cfargument name="VerificationDeductible" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationDeductible = arguments.VerificationDeductible />
	</cffunction>				
	
	<cffunction name="getVerificationDeductibleAmount" access="public" hint="Getter for VerificationDeductibleAmount" output="false" returnType="any">
		<cfreturn variables.instance.VerificationDeductibleAmount />
	</cffunction>
	
	<cffunction name="setVerificationDeductibleAmount" access="public" hint="Setter for VerificationDeductibleAmount" output="false" returnType="void">
		<cfargument name="VerificationDeductibleAmount" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationDeductibleAmount = arguments.VerificationDeductibleAmount />
	</cffunction>				
	
	<cffunction name="getVerificationDeductibleAmountMet" access="public" hint="Getter for VerificationDeductibleAmountMet" output="false" returnType="any">
		<cfreturn variables.instance.VerificationDeductibleAmountMet />
	</cffunction>
	
	<cffunction name="setVerificationDeductibleAmountMet" access="public" hint="Setter for VerificationDeductibleAmountMet" output="false" returnType="void">
		<cfargument name="VerificationDeductibleAmountMet" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationDeductibleAmountMet = arguments.VerificationDeductibleAmountMet />
	</cffunction>				
	
	<cffunction name="getVerificationPPOPolicy" access="public" hint="Getter for VerificationPPOPolicy" output="false" returnType="any">
		<cfreturn variables.instance.VerificationPPOPolicy />
	</cffunction>
	
	<cffunction name="setVerificationPPOPolicy" access="public" hint="Setter for VerificationPPOPolicy" output="false" returnType="void">
		<cfargument name="VerificationPPOPolicy" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationPPOPolicy = arguments.VerificationPPOPolicy />
	</cffunction>				
	
	<cffunction name="getVerificationPercentagePayAfterDeductible" access="public" hint="Getter for VerificationPercentagePayAfterDeductible" output="false" returnType="any">
		<cfreturn variables.instance.VerificationPercentagePayAfterDeductible />
	</cffunction>
	
	<cffunction name="setVerificationPercentagePayAfterDeductible" access="public" hint="Setter for VerificationPercentagePayAfterDeductible" output="false" returnType="void">
		<cfargument name="VerificationPercentagePayAfterDeductible" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationPercentagePayAfterDeductible = arguments.VerificationPercentagePayAfterDeductible />
	</cffunction>				
	
	<cffunction name="getVerificationPriorAuth" access="public" hint="Getter for VerificationPriorAuth" output="false" returnType="any">
		<cfreturn variables.instance.VerificationPriorAuth />
	</cffunction>
	
	<cffunction name="setVerificationPriorAuth" access="public" hint="Setter for VerificationPriorAuth" output="false" returnType="void">
		<cfargument name="VerificationPriorAuth" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationPriorAuth = arguments.VerificationPriorAuth />
	</cffunction>				
	
	<cffunction name="getVerificationAuthNumber" access="public" hint="Getter for VerificationAuthNumber" output="false" returnType="any">
		<cfreturn variables.instance.VerificationAuthNumber />
	</cffunction>
	
	<cffunction name="setVerificationAuthNumber" access="public" hint="Setter for VerificationAuthNumber" output="false" returnType="void">
		<cfargument name="VerificationAuthNumber" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationAuthNumber = arguments.VerificationAuthNumber />
	</cffunction>				
	
	<cffunction name="getVerificationLifetimeBenefitMet" access="public" hint="Getter for VerificationLifetimeBenefitMet" output="false" returnType="any">
		<cfreturn variables.instance.VerificationLifetimeBenefitMet />
	</cffunction>
	
	<cffunction name="setVerificationLifetimeBenefitMet" access="public" hint="Setter for VerificationLifetimeBenefitMet" output="false" returnType="void">
		<cfargument name="VerificationLifetimeBenefitMet" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationLifetimeBenefitMet = arguments.VerificationLifetimeBenefitMet />
	</cffunction>				
	
	<cffunction name="getVerificationAuthPhoneNumber" access="public" hint="Getter for VerificationAuthPhoneNumber" output="false" returnType="any">
		<cfreturn variables.instance.VerificationAuthPhoneNumber />
	</cffunction>
	
	<cffunction name="setVerificationAuthPhoneNumber" access="public" hint="Setter for VerificationAuthPhoneNumber" output="false" returnType="void">
		<cfargument name="VerificationAuthPhoneNumber" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationAuthPhoneNumber = arguments.VerificationAuthPhoneNumber />
	</cffunction>				
	
	<cffunction name="getVerificationMedicareSupplement" access="public" hint="Getter for VerificationMedicareSupplement" output="false" returnType="any">
		<cfreturn variables.instance.VerificationMedicareSupplement />
	</cffunction>
	
	<cffunction name="setVerificationMedicareSupplement" access="public" hint="Setter for VerificationMedicareSupplement" output="false" returnType="void">
		<cfargument name="VerificationMedicareSupplement" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationMedicareSupplement = arguments.VerificationMedicareSupplement />
	</cffunction>				
	
	<cffunction name="getVerificationCoordinateBenefits" access="public" hint="Getter for VerificationCoordinateBenefits" output="false" returnType="any">
		<cfreturn variables.instance.VerificationCoordinateBenefits />
	</cffunction>
	
	<cffunction name="setVerificationCoordinateBenefits" access="public" hint="Setter for VerificationCoordinateBenefits" output="false" returnType="void">
		<cfargument name="VerificationCoordinateBenefits" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationCoordinateBenefits = arguments.VerificationCoordinateBenefits />
	</cffunction>				
	
	<cffunction name="getVerificationPaidMedicareDeductible" access="public" hint="Getter for VerificationPaidMedicareDeductible" output="false" returnType="any">
		<cfreturn variables.instance.VerificationPaidMedicareDeductible />
	</cffunction>
	
	<cffunction name="setVerificationPaidMedicareDeductible" access="public" hint="Setter for VerificationPaidMedicareDeductible" output="false" returnType="void">
		<cfargument name="VerificationPaidMedicareDeductible" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationPaidMedicareDeductible = arguments.VerificationPaidMedicareDeductible />
	</cffunction>				
	
	<cffunction name="getVerificationMedicaidPlan" access="public" hint="Getter for VerificationMedicaidPlan" output="false" returnType="any">
		<cfreturn variables.instance.VerificationMedicaidPlan />
	</cffunction>
	
	<cffunction name="setVerificationMedicaidPlan" access="public" hint="Setter for VerificationMedicaidPlan" output="false" returnType="void">
		<cfargument name="VerificationMedicaidPlan" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationMedicaidPlan = arguments.VerificationMedicaidPlan />
	</cffunction>				
	
	<cffunction name="getVerificationTypeBasePlan" access="public" hint="Getter for VerificationTypeBasePlan" output="false" returnType="any">
		<cfreturn variables.instance.VerificationTypeBasePlan />
	</cffunction>
	
	<cffunction name="setVerificationTypeBasePlan" access="public" hint="Setter for VerificationTypeBasePlan" output="false" returnType="void">
		<cfargument name="VerificationTypeBasePlan" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationTypeBasePlan = arguments.VerificationTypeBasePlan />
	</cffunction>				
	
	<cffunction name="getActive" access="public" hint="Getter for Active" output="false" returnType="any">
		<cfreturn variables.instance.Active />
	</cffunction>
	
	<cffunction name="setActive" access="public" hint="Setter for Active" output="false" returnType="void">
		<cfargument name="Active" hint="" required="yes" type="any" />
		<cfset variables.instance.Active = arguments.Active />
	</cffunction>				
	
	<cffunction name="getInactiveCode" access="public" hint="Getter for InactiveCode" output="false" returnType="any">
		<cfreturn variables.instance.InactiveCode />
	</cffunction>
	
	<cffunction name="setInactiveCode" access="public" hint="Setter for InactiveCode" output="false" returnType="void">
		<cfargument name="InactiveCode" hint="" required="yes" type="any" />
		<cfset variables.instance.InactiveCode = arguments.InactiveCode />
	</cffunction>				
	
	<cffunction name="getDateCreated" access="public" hint="Getter for DateCreated" output="false" returnType="any">
		<cfreturn variables.instance.DateCreated />
	</cffunction>
	
	<cffunction name="setDateCreated" access="public" hint="Setter for DateCreated" output="false" returnType="void">
		<cfargument name="DateCreated" hint="" required="yes" type="any" />
		<cfset variables.instance.DateCreated = arguments.DateCreated />
	</cffunction>				
	
	<cffunction name="getDateModified" access="public" hint="Getter for DateModified" output="false" returnType="any">
		<cfreturn variables.instance.DateModified />
	</cffunction>
	
	<cffunction name="setDateModified" access="public" hint="Setter for DateModified" output="false" returnType="void">
		<cfargument name="DateModified" hint="" required="yes" type="any" />
		<cfset variables.instance.DateModified = arguments.DateModified />
	</cffunction>				
	


<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


