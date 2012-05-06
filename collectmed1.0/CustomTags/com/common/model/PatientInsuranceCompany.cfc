 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.recordID = "";				
		variables.instance.PatientID = "";				
		variables.instance.InsuranceCompanyID = "";				
		variables.instance.PrimSecTer = "";				
		variables.instance.PolicyNumber = "";				
		variables.instance.PolicyHoldersFirstName = "";				
		variables.instance.PolicyHoldersLastName = "";				
		variables.instance.PolicyHoldersMiddleInitial = "";				
		variables.instance.PolicyHoldersDOB = "";				
		variables.instance.PolicyHoldersSex = "";				
		variables.instance.PolicyHoldersAddressLine1 = "";				
		variables.instance.PolicyHoldersAddressLine2 = "";				
		variables.instance.PolicyHoldersCity = "";				
		variables.instance.PolicyHoldersStateID = "";				
		variables.instance.PolicyHoldersZipCode = "";				
		variables.instance.PolicyHoldersPhone = "";				
		variables.instance.PolicyHoldersPhoneExtension = "";				
		variables.instance.PolicyHoldersEmployerSchoolName = "";				
		variables.instance.PolicyHoldersEffectiveDateFrom = "";				
		variables.instance.PolicyHoldersEffectiveDateTo = "";				
		variables.instance.GroupNumber = "";				
		variables.instance.GroupName = "";				
		variables.instance.Deductible = "";				
		variables.instance.PayPercentage = "";				
		variables.instance.Relationship = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="PatientInsuranceCompany" output="false">				
		<cfargument name="recordID" type="string" required="false" default="" hint="recordID" />				
		<cfargument name="PatientID" type="string" required="false" default="" hint="PatientID" />				
		<cfargument name="InsuranceCompanyID" type="string" required="false" default="" hint="InsuranceCompanyID" />				
		<cfargument name="PrimSecTer" type="string" required="false" default="" hint="PrimSecTer" />				
		<cfargument name="PolicyNumber" type="string" required="false" default="" hint="PolicyNumber" />				
		<cfargument name="PolicyHoldersFirstName" type="string" required="false" default="" hint="PolicyHoldersFirstName" />				
		<cfargument name="PolicyHoldersLastName" type="string" required="false" default="" hint="PolicyHoldersLastName" />				
		<cfargument name="PolicyHoldersMiddleInitial" type="string" required="false" default="" hint="PolicyHoldersMiddleInitial" />				
		<cfargument name="PolicyHoldersDOB" type="string" required="false" default="" hint="PolicyHoldersDOB" />				
		<cfargument name="PolicyHoldersSex" type="string" required="false" default="" hint="PolicyHoldersSex" />				
		<cfargument name="PolicyHoldersAddressLine1" type="string" required="false" default="" hint="PolicyHoldersAddressLine1" />				
		<cfargument name="PolicyHoldersAddressLine2" type="string" required="false" default="" hint="PolicyHoldersAddressLine2" />				
		<cfargument name="PolicyHoldersCity" type="string" required="false" default="" hint="PolicyHoldersCity" />				
		<cfargument name="PolicyHoldersStateID" type="string" required="false" default="" hint="PolicyHoldersStateID" />				
		<cfargument name="PolicyHoldersZipCode" type="string" required="false" default="" hint="PolicyHoldersZipCode" />				
		<cfargument name="PolicyHoldersPhone" type="string" required="false" default="" hint="PolicyHoldersPhone" />				
		<cfargument name="PolicyHoldersPhoneExtension" type="string" required="false" default="" hint="PolicyHoldersPhoneExtension" />				
		<cfargument name="PolicyHoldersEmployerSchoolName" type="string" required="false" default="" hint="PolicyHoldersEmployerSchoolName" />				
		<cfargument name="PolicyHoldersEffectiveDateFrom" type="string" required="false" default="" hint="PolicyHoldersEffectiveDateFrom" />				
		<cfargument name="PolicyHoldersEffectiveDateTo" type="string" required="false" default="" hint="PolicyHoldersEffectiveDateTo" />				
		<cfargument name="GroupNumber" type="string" required="false" default="" hint="GroupNumber" />				
		<cfargument name="GroupName" type="string" required="false" default="" hint="GroupName" />				
		<cfargument name="Deductible" type="string" required="false" default="" hint="Deductible" />				
		<cfargument name="PayPercentage" type="string" required="false" default="" hint="PayPercentage" />				
		<cfargument name="Relationship" type="string" required="false" default="" hint="Relationship" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setrecordID(arguments.recordID);				
			setPatientID(arguments.PatientID);				
			setInsuranceCompanyID(arguments.InsuranceCompanyID);				
			setPrimSecTer(arguments.PrimSecTer);				
			setPolicyNumber(arguments.PolicyNumber);				
			setPolicyHoldersFirstName(arguments.PolicyHoldersFirstName);				
			setPolicyHoldersLastName(arguments.PolicyHoldersLastName);				
			setPolicyHoldersMiddleInitial(arguments.PolicyHoldersMiddleInitial);				
			setPolicyHoldersDOB(arguments.PolicyHoldersDOB);				
			setPolicyHoldersSex(arguments.PolicyHoldersSex);				
			setPolicyHoldersAddressLine1(arguments.PolicyHoldersAddressLine1);				
			setPolicyHoldersAddressLine2(arguments.PolicyHoldersAddressLine2);				
			setPolicyHoldersCity(arguments.PolicyHoldersCity);				
			setPolicyHoldersStateID(arguments.PolicyHoldersStateID);				
			setPolicyHoldersZipCode(arguments.PolicyHoldersZipCode);				
			setPolicyHoldersPhone(arguments.PolicyHoldersPhone);				
			setPolicyHoldersPhoneExtension(arguments.PolicyHoldersPhoneExtension);				
			setPolicyHoldersEmployerSchoolName(arguments.PolicyHoldersEmployerSchoolName);				
			setPolicyHoldersEffectiveDateFrom(arguments.PolicyHoldersEffectiveDateFrom);				
			setPolicyHoldersEffectiveDateTo(arguments.PolicyHoldersEffectiveDateTo);				
			setGroupNumber(arguments.GroupNumber);				
			setGroupName(arguments.GroupName);				
			setDeductible(arguments.Deductible);				
			setPayPercentage(arguments.PayPercentage);				
			setRelationship(arguments.Relationship);				
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
	<cffunction name="getrecordID" access="public" hint="Getter for recordID" output="false" returnType="any">
		<cfreturn variables.instance.recordID />
	</cffunction>
	
	<cffunction name="setrecordID" access="public" hint="Setter for recordID" output="false" returnType="void">
		<cfargument name="recordID" hint="" required="yes" type="any" />
		<cfset variables.instance.recordID = arguments.recordID />
	</cffunction>				
	
	<cffunction name="getPatientID" access="public" hint="Getter for PatientID" output="false" returnType="any">
		<cfreturn variables.instance.PatientID />
	</cffunction>
	
	<cffunction name="setPatientID" access="public" hint="Setter for PatientID" output="false" returnType="void">
		<cfargument name="PatientID" hint="" required="yes" type="any" />
		<cfset variables.instance.PatientID = arguments.PatientID />
	</cffunction>				
	
	<cffunction name="getInsuranceCompanyID" access="public" hint="Getter for InsuranceCompanyID" output="false" returnType="any">
		<cfreturn variables.instance.InsuranceCompanyID />
	</cffunction>
	
	<cffunction name="setInsuranceCompanyID" access="public" hint="Setter for InsuranceCompanyID" output="false" returnType="void">
		<cfargument name="InsuranceCompanyID" hint="" required="yes" type="any" />
		<cfset variables.instance.InsuranceCompanyID = arguments.InsuranceCompanyID />
	</cffunction>				
	
	<cffunction name="getPrimSecTer" access="public" hint="Getter for PrimSecTer" output="false" returnType="any">
		<cfreturn variables.instance.PrimSecTer />
	</cffunction>
	
	<cffunction name="setPrimSecTer" access="public" hint="Setter for PrimSecTer" output="false" returnType="void">
		<cfargument name="PrimSecTer" hint="" required="yes" type="any" />
		<cfset variables.instance.PrimSecTer = arguments.PrimSecTer />
	</cffunction>				
	
	<cffunction name="getPolicyNumber" access="public" hint="Getter for PolicyNumber" output="false" returnType="any">
		<cfreturn variables.instance.PolicyNumber />
	</cffunction>
	
	<cffunction name="setPolicyNumber" access="public" hint="Setter for PolicyNumber" output="false" returnType="void">
		<cfargument name="PolicyNumber" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyNumber = arguments.PolicyNumber />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersFirstName" access="public" hint="Getter for PolicyHoldersFirstName" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersFirstName />
	</cffunction>
	
	<cffunction name="setPolicyHoldersFirstName" access="public" hint="Setter for PolicyHoldersFirstName" output="false" returnType="void">
		<cfargument name="PolicyHoldersFirstName" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersFirstName = arguments.PolicyHoldersFirstName />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersLastName" access="public" hint="Getter for PolicyHoldersLastName" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersLastName />
	</cffunction>
	
	<cffunction name="setPolicyHoldersLastName" access="public" hint="Setter for PolicyHoldersLastName" output="false" returnType="void">
		<cfargument name="PolicyHoldersLastName" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersLastName = arguments.PolicyHoldersLastName />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersMiddleInitial" access="public" hint="Getter for PolicyHoldersMiddleInitial" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersMiddleInitial />
	</cffunction>
	
	<cffunction name="setPolicyHoldersMiddleInitial" access="public" hint="Setter for PolicyHoldersMiddleInitial" output="false" returnType="void">
		<cfargument name="PolicyHoldersMiddleInitial" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersMiddleInitial = arguments.PolicyHoldersMiddleInitial />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersDOB" access="public" hint="Getter for PolicyHoldersDOB" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersDOB />
	</cffunction>
	
	<cffunction name="setPolicyHoldersDOB" access="public" hint="Setter for PolicyHoldersDOB" output="false" returnType="void">
		<cfargument name="PolicyHoldersDOB" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersDOB = arguments.PolicyHoldersDOB />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersSex" access="public" hint="Getter for PolicyHoldersSex" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersSex />
	</cffunction>
	
	<cffunction name="setPolicyHoldersSex" access="public" hint="Setter for PolicyHoldersSex" output="false" returnType="void">
		<cfargument name="PolicyHoldersSex" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersSex = arguments.PolicyHoldersSex />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersAddressLine1" access="public" hint="Getter for PolicyHoldersAddressLine1" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersAddressLine1 />
	</cffunction>
	
	<cffunction name="setPolicyHoldersAddressLine1" access="public" hint="Setter for PolicyHoldersAddressLine1" output="false" returnType="void">
		<cfargument name="PolicyHoldersAddressLine1" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersAddressLine1 = arguments.PolicyHoldersAddressLine1 />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersAddressLine2" access="public" hint="Getter for PolicyHoldersAddressLine2" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersAddressLine2 />
	</cffunction>
	
	<cffunction name="setPolicyHoldersAddressLine2" access="public" hint="Setter for PolicyHoldersAddressLine2" output="false" returnType="void">
		<cfargument name="PolicyHoldersAddressLine2" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersAddressLine2 = arguments.PolicyHoldersAddressLine2 />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersCity" access="public" hint="Getter for PolicyHoldersCity" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersCity />
	</cffunction>
	
	<cffunction name="setPolicyHoldersCity" access="public" hint="Setter for PolicyHoldersCity" output="false" returnType="void">
		<cfargument name="PolicyHoldersCity" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersCity = arguments.PolicyHoldersCity />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersStateID" access="public" hint="Getter for PolicyHoldersStateID" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersStateID />
	</cffunction>
	
	<cffunction name="setPolicyHoldersStateID" access="public" hint="Setter for PolicyHoldersStateID" output="false" returnType="void">
		<cfargument name="PolicyHoldersStateID" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersStateID = arguments.PolicyHoldersStateID />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersZipCode" access="public" hint="Getter for PolicyHoldersZipCode" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersZipCode />
	</cffunction>
	
	<cffunction name="setPolicyHoldersZipCode" access="public" hint="Setter for PolicyHoldersZipCode" output="false" returnType="void">
		<cfargument name="PolicyHoldersZipCode" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersZipCode = arguments.PolicyHoldersZipCode />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersPhone" access="public" hint="Getter for PolicyHoldersPhone" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersPhone />
	</cffunction>
	
	<cffunction name="setPolicyHoldersPhone" access="public" hint="Setter for PolicyHoldersPhone" output="false" returnType="void">
		<cfargument name="PolicyHoldersPhone" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersPhone = arguments.PolicyHoldersPhone />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersPhoneExtension" access="public" hint="Getter for PolicyHoldersPhoneExtension" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersPhoneExtension />
	</cffunction>
	
	<cffunction name="setPolicyHoldersPhoneExtension" access="public" hint="Setter for PolicyHoldersPhoneExtension" output="false" returnType="void">
		<cfargument name="PolicyHoldersPhoneExtension" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersPhoneExtension = arguments.PolicyHoldersPhoneExtension />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersEmployerSchoolName" access="public" hint="Getter for PolicyHoldersEmployerSchoolName" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersEmployerSchoolName />
	</cffunction>
	
	<cffunction name="setPolicyHoldersEmployerSchoolName" access="public" hint="Setter for PolicyHoldersEmployerSchoolName" output="false" returnType="void">
		<cfargument name="PolicyHoldersEmployerSchoolName" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersEmployerSchoolName = arguments.PolicyHoldersEmployerSchoolName />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersEffectiveDateFrom" access="public" hint="Getter for PolicyHoldersEffectiveDateFrom" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersEffectiveDateFrom />
	</cffunction>
	
	<cffunction name="setPolicyHoldersEffectiveDateFrom" access="public" hint="Setter for PolicyHoldersEffectiveDateFrom" output="false" returnType="void">
		<cfargument name="PolicyHoldersEffectiveDateFrom" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersEffectiveDateFrom = arguments.PolicyHoldersEffectiveDateFrom />
	</cffunction>				
	
	<cffunction name="getPolicyHoldersEffectiveDateTo" access="public" hint="Getter for PolicyHoldersEffectiveDateTo" output="false" returnType="any">
		<cfreturn variables.instance.PolicyHoldersEffectiveDateTo />
	</cffunction>
	
	<cffunction name="setPolicyHoldersEffectiveDateTo" access="public" hint="Setter for PolicyHoldersEffectiveDateTo" output="false" returnType="void">
		<cfargument name="PolicyHoldersEffectiveDateTo" hint="" required="yes" type="any" />
		<cfset variables.instance.PolicyHoldersEffectiveDateTo = arguments.PolicyHoldersEffectiveDateTo />
	</cffunction>				
	
	<cffunction name="getGroupNumber" access="public" hint="Getter for GroupNumber" output="false" returnType="any">
		<cfreturn variables.instance.GroupNumber />
	</cffunction>
	
	<cffunction name="setGroupNumber" access="public" hint="Setter for GroupNumber" output="false" returnType="void">
		<cfargument name="GroupNumber" hint="" required="yes" type="any" />
		<cfset variables.instance.GroupNumber = arguments.GroupNumber />
	</cffunction>				
	
	<cffunction name="getGroupName" access="public" hint="Getter for GroupName" output="false" returnType="any">
		<cfreturn variables.instance.GroupName />
	</cffunction>
	
	<cffunction name="setGroupName" access="public" hint="Setter for GroupName" output="false" returnType="void">
		<cfargument name="GroupName" hint="" required="yes" type="any" />
		<cfset variables.instance.GroupName = arguments.GroupName />
	</cffunction>				
	
	<cffunction name="getDeductible" access="public" hint="Getter for Deductible" output="false" returnType="any">
		<cfreturn variables.instance.Deductible />
	</cffunction>
	
	<cffunction name="setDeductible" access="public" hint="Setter for Deductible" output="false" returnType="void">
		<cfargument name="Deductible" hint="" required="yes" type="any" />
		<cfset variables.instance.Deductible = arguments.Deductible />
	</cffunction>				
	
	<cffunction name="getPayPercentage" access="public" hint="Getter for PayPercentage" output="false" returnType="any">
		<cfreturn variables.instance.PayPercentage />
	</cffunction>
	
	<cffunction name="setPayPercentage" access="public" hint="Setter for PayPercentage" output="false" returnType="void">
		<cfargument name="PayPercentage" hint="" required="yes" type="any" />
		<cfset variables.instance.PayPercentage = arguments.PayPercentage />
	</cffunction>				
	
	<cffunction name="getRelationship" access="public" hint="Getter for Relationship" output="false" returnType="any">
		<cfreturn variables.instance.Relationship />
	</cffunction>
	
	<cffunction name="setRelationship" access="public" hint="Setter for Relationship" output="false" returnType="void">
		<cfargument name="Relationship" hint="" required="yes" type="any" />
		<cfset variables.instance.Relationship = arguments.Relationship />
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


