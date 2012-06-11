 	


<cfcomponent name="patientinsurancecompanyBean" output="false" alias="patientinsurancecompanyBean" extends="PatientInsuranceCompanyDAO">

	<cfproperty name="recordID" type="numeric" default="0" />
	<cfproperty name="PatientID" type="numeric" default="" />
	<cfproperty name="InsuranceCompanyID" type="numeric" default="" />
	<cfproperty name="PrimSecTer" type="numeric" default="" />
	<cfproperty name="PolicyNumber" type="string" default="" />
	<cfproperty name="PolicyHoldersFirstName" type="string" default="" />
	<cfproperty name="PolicyHoldersLastName" type="string" default="" />
	<cfproperty name="PolicyHoldersMiddleInitial" type="string" default="" />
	<cfproperty name="PolicyHoldersDOB" type="datetime" default="" />
	<cfproperty name="PolicyHoldersSex" type="numeric" default="" />
	<cfproperty name="PolicyHoldersAddressLine1" type="string" default="" />
	<cfproperty name="PolicyHoldersAddressLine2" type="string" default="" />
	<cfproperty name="PolicyHoldersCity" type="string" default="" />
	<cfproperty name="PolicyHoldersStateID" type="numeric" default="" />
	<cfproperty name="PolicyHoldersZipCode" type="string" default="" />
	<cfproperty name="PolicyHoldersPhone" type="string" default="" />
	<cfproperty name="PolicyHoldersPhoneExtension" type="string" default="" />
	<cfproperty name="PolicyHoldersEmployerSchoolName" type="string" default="" />
	<cfproperty name="PolicyHoldersEffectiveDateFrom" type="datetime" default="" />
	<cfproperty name="PolicyHoldersEffectiveDateTo" type="datetime" default="" />
	<cfproperty name="GroupNumber" type="string" default="" />
	<cfproperty name="GroupName" type="string" default="" />
	<cfproperty name="Deductible" type="numeric" default="" />
	<cfproperty name="PayPercentage" type="numeric" default="" />
	<cfproperty name="Relationship" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.recordID = 0;
		variables.PatientID = "";
		variables.InsuranceCompanyID = "";
		variables.PrimSecTer = "";
		variables.PolicyNumber = "";
		variables.PolicyHoldersFirstName = "";
		variables.PolicyHoldersLastName = "";
		variables.PolicyHoldersMiddleInitial = "";
		variables.PolicyHoldersDOB = "";
		variables.PolicyHoldersSex = "";
		variables.PolicyHoldersAddressLine1 = "";
		variables.PolicyHoldersAddressLine2 = "";
		variables.PolicyHoldersCity = "";
		variables.PolicyHoldersStateID = "";
		variables.PolicyHoldersZipCode = "";
		variables.PolicyHoldersPhone = "";
		variables.PolicyHoldersPhoneExtension = "";
		variables.PolicyHoldersEmployerSchoolName = "";
		variables.PolicyHoldersEffectiveDateFrom = "";
		variables.PolicyHoldersEffectiveDateTo = "";
		variables.GroupNumber = "";
		variables.GroupName = "";
		variables.Deductible = "";
		variables.PayPercentage = "";
		variables.Relationship = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="patientinsurancecompanyBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "recordID") AND stValues.recordID NEQ 0>
				<cfquery name="qGetPatientInsuranceCompany" datasource="#trim(arguments.ds)#">
			  		SELECT recordID,PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified
					FROM patientinsurancecompany  
					WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.recordID#" /> 
				</cfquery>		
				<cfif qGetPatientInsuranceCompany.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.PatientID = qGetPatientInsuranceCompany.PatientID;
					variables.InsuranceCompanyID = qGetPatientInsuranceCompany.InsuranceCompanyID;
					variables.PrimSecTer = qGetPatientInsuranceCompany.PrimSecTer;
					variables.PolicyNumber = qGetPatientInsuranceCompany.PolicyNumber;
					variables.PolicyHoldersFirstName = qGetPatientInsuranceCompany.PolicyHoldersFirstName;
					variables.PolicyHoldersLastName = qGetPatientInsuranceCompany.PolicyHoldersLastName;
					variables.PolicyHoldersMiddleInitial = qGetPatientInsuranceCompany.PolicyHoldersMiddleInitial;
					variables.PolicyHoldersDOB = qGetPatientInsuranceCompany.PolicyHoldersDOB;
					variables.PolicyHoldersSex = qGetPatientInsuranceCompany.PolicyHoldersSex;
					variables.PolicyHoldersAddressLine1 = qGetPatientInsuranceCompany.PolicyHoldersAddressLine1;
					variables.PolicyHoldersAddressLine2 = qGetPatientInsuranceCompany.PolicyHoldersAddressLine2;
					variables.PolicyHoldersCity = qGetPatientInsuranceCompany.PolicyHoldersCity;
					variables.PolicyHoldersStateID = qGetPatientInsuranceCompany.PolicyHoldersStateID;
					variables.PolicyHoldersZipCode = qGetPatientInsuranceCompany.PolicyHoldersZipCode;
					variables.PolicyHoldersPhone = qGetPatientInsuranceCompany.PolicyHoldersPhone;
					variables.PolicyHoldersPhoneExtension = qGetPatientInsuranceCompany.PolicyHoldersPhoneExtension;
					variables.PolicyHoldersEmployerSchoolName = qGetPatientInsuranceCompany.PolicyHoldersEmployerSchoolName;
					variables.PolicyHoldersEffectiveDateFrom = qGetPatientInsuranceCompany.PolicyHoldersEffectiveDateFrom;
					variables.PolicyHoldersEffectiveDateTo = qGetPatientInsuranceCompany.PolicyHoldersEffectiveDateTo;
					variables.GroupNumber = qGetPatientInsuranceCompany.GroupNumber;
					variables.GroupName = qGetPatientInsuranceCompany.GroupName;
					variables.Deductible = qGetPatientInsuranceCompany.Deductible;
					variables.PayPercentage = qGetPatientInsuranceCompany.PayPercentage;
					variables.Relationship = qGetPatientInsuranceCompany.Relationship;
					variables.Active = qGetPatientInsuranceCompany.Active;
					variables.InactiveCode = qGetPatientInsuranceCompany.InactiveCode;
					variables.DateModified = qGetPatientInsuranceCompany.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "recordID")><cfset variables.recordID = stValues.recordID /></cfif>
			<cfif StructKeyExists(stValues, "PatientID")><cfset variables.PatientID = stValues.PatientID /></cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyID")><cfset variables.InsuranceCompanyID = stValues.InsuranceCompanyID /></cfif>
			<cfif StructKeyExists(stValues, "PrimSecTer")><cfset variables.PrimSecTer = stValues.PrimSecTer /></cfif>
			<cfif StructKeyExists(stValues, "PolicyNumber")><cfset variables.PolicyNumber = stValues.PolicyNumber /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersFirstName")><cfset variables.PolicyHoldersFirstName = stValues.PolicyHoldersFirstName /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersLastName")><cfset variables.PolicyHoldersLastName = stValues.PolicyHoldersLastName /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersMiddleInitial")><cfset variables.PolicyHoldersMiddleInitial = stValues.PolicyHoldersMiddleInitial /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersDOB")><cfset variables.PolicyHoldersDOB = stValues.PolicyHoldersDOB /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersSex")><cfset variables.PolicyHoldersSex = stValues.PolicyHoldersSex /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersAddressLine1")><cfset variables.PolicyHoldersAddressLine1 = stValues.PolicyHoldersAddressLine1 /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersAddressLine2")><cfset variables.PolicyHoldersAddressLine2 = stValues.PolicyHoldersAddressLine2 /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersCity")><cfset variables.PolicyHoldersCity = stValues.PolicyHoldersCity /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersStateID")><cfset variables.PolicyHoldersStateID = stValues.PolicyHoldersStateID /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersZipCode")><cfset variables.PolicyHoldersZipCode = stValues.PolicyHoldersZipCode /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersPhone")><cfset variables.PolicyHoldersPhone = stValues.PolicyHoldersPhone /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersPhoneExtension")><cfset variables.PolicyHoldersPhoneExtension = stValues.PolicyHoldersPhoneExtension /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersEmployerSchoolName")><cfset variables.PolicyHoldersEmployerSchoolName = stValues.PolicyHoldersEmployerSchoolName /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersEffectiveDateFrom")><cfset variables.PolicyHoldersEffectiveDateFrom = stValues.PolicyHoldersEffectiveDateFrom /></cfif>
			<cfif StructKeyExists(stValues, "PolicyHoldersEffectiveDateTo")><cfset variables.PolicyHoldersEffectiveDateTo = stValues.PolicyHoldersEffectiveDateTo /></cfif>
			<cfif StructKeyExists(stValues, "GroupNumber")><cfset variables.GroupNumber = stValues.GroupNumber /></cfif>
			<cfif StructKeyExists(stValues, "GroupName")><cfset variables.GroupName = stValues.GroupName /></cfif>
			<cfif StructKeyExists(stValues, "Deductible")><cfset variables.Deductible = stValues.Deductible /></cfif>
			<cfif StructKeyExists(stValues, "PayPercentage")><cfset variables.PayPercentage = stValues.PayPercentage /></cfif>
			<cfif StructKeyExists(stValues, "Relationship")><cfset variables.Relationship = stValues.Relationship /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for recordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getrecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.recordID>
	</cffunction>
	
	<cffunction name="setrecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="recordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.recordID)) OR trim(arguments.recordID) EQ "">
			<cfset variables.recordID = arguments.recordID />
		<cfelse>
			<cfthrow message="recordID (#arguments.recordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "recordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PatientID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPatientID" acess="public" output="false" returntype="any">
		<cfreturn variables.PatientID>
	</cffunction>
	
	<cffunction name="setPatientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PatientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PatientID)) OR trim(arguments.PatientID) EQ "">
			<cfset variables.PatientID = arguments.PatientID />
		<cfelse>
			<cfthrow message="PatientID (#arguments.PatientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PatientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InsuranceCompanyID.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyID" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyID>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InsuranceCompanyID)) OR trim(arguments.InsuranceCompanyID) EQ "">
			<cfset variables.InsuranceCompanyID = arguments.InsuranceCompanyID />
		<cfelse>
			<cfthrow message="InsuranceCompanyID (#arguments.InsuranceCompanyID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PrimSecTer.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPrimSecTer" acess="public" output="false" returntype="any">
		<cfreturn variables.PrimSecTer>
	</cffunction>
	
	<cffunction name="setPrimSecTer" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PrimSecTer" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PrimSecTer)) OR trim(arguments.PrimSecTer) EQ "">
			<cfset variables.PrimSecTer = arguments.PrimSecTer />
		<cfelse>
			<cfthrow message="PrimSecTer (#arguments.PrimSecTer#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PrimSecTer") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyNumber.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyNumber>
	</cffunction>
	
	<cffunction name="setPolicyNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyNumber" required="true" type="any" />
			
		<cfset variables.PolicyNumber = arguments.PolicyNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersFirstName.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersFirstName" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersFirstName>
	</cffunction>
	
	<cffunction name="setPolicyHoldersFirstName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersFirstName" required="true" type="any" />
			
		<cfset variables.PolicyHoldersFirstName = arguments.PolicyHoldersFirstName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersFirstName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersLastName.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersLastName" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersLastName>
	</cffunction>
	
	<cffunction name="setPolicyHoldersLastName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersLastName" required="true" type="any" />
			
		<cfset variables.PolicyHoldersLastName = arguments.PolicyHoldersLastName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersLastName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersMiddleInitial.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersMiddleInitial" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersMiddleInitial>
	</cffunction>
	
	<cffunction name="setPolicyHoldersMiddleInitial" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersMiddleInitial" required="true" type="any" />
			
		<cfset variables.PolicyHoldersMiddleInitial = arguments.PolicyHoldersMiddleInitial />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersMiddleInitial") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersDOB.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersDOB" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersDOB>
	</cffunction>
	
	<cffunction name="setPolicyHoldersDOB" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersDOB" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.PolicyHoldersDOB)) OR trim(arguments.PolicyHoldersDOB) EQ "">
			<cfset variables.PolicyHoldersDOB = arguments.PolicyHoldersDOB />
		<cfelse>
			<cfthrow message="PolicyHoldersDOB (#arguments.PolicyHoldersDOB#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersDOB") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersSex.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersSex" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersSex>
	</cffunction>
	
	<cffunction name="setPolicyHoldersSex" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersSex" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PolicyHoldersSex)) OR trim(arguments.PolicyHoldersSex) EQ "">
			<cfset variables.PolicyHoldersSex = arguments.PolicyHoldersSex />
		<cfelse>
			<cfthrow message="PolicyHoldersSex (#arguments.PolicyHoldersSex#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersSex") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersAddressLine1.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersAddressLine1" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersAddressLine1>
	</cffunction>
	
	<cffunction name="setPolicyHoldersAddressLine1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersAddressLine1" required="true" type="any" />
			
		<cfset variables.PolicyHoldersAddressLine1 = arguments.PolicyHoldersAddressLine1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersAddressLine1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersAddressLine2.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersAddressLine2" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersAddressLine2>
	</cffunction>
	
	<cffunction name="setPolicyHoldersAddressLine2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersAddressLine2" required="true" type="any" />
			
		<cfset variables.PolicyHoldersAddressLine2 = arguments.PolicyHoldersAddressLine2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersAddressLine2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersCity.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersCity" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersCity>
	</cffunction>
	
	<cffunction name="setPolicyHoldersCity" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersCity" required="true" type="any" />
			
		<cfset variables.PolicyHoldersCity = arguments.PolicyHoldersCity />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersCity") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersStateID.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersStateID" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersStateID>
	</cffunction>
	
	<cffunction name="setPolicyHoldersStateID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersStateID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PolicyHoldersStateID)) OR trim(arguments.PolicyHoldersStateID) EQ "">
			<cfset variables.PolicyHoldersStateID = arguments.PolicyHoldersStateID />
		<cfelse>
			<cfthrow message="PolicyHoldersStateID (#arguments.PolicyHoldersStateID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersStateID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersZipCode.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersZipCode" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersZipCode>
	</cffunction>
	
	<cffunction name="setPolicyHoldersZipCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersZipCode" required="true" type="any" />
			
		<cfset variables.PolicyHoldersZipCode = arguments.PolicyHoldersZipCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersZipCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersPhone.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersPhone" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersPhone>
	</cffunction>
	
	<cffunction name="setPolicyHoldersPhone" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersPhone" required="true" type="any" />
			
		<cfset variables.PolicyHoldersPhone = arguments.PolicyHoldersPhone />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersPhone") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersPhoneExtension.                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersPhoneExtension" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersPhoneExtension>
	</cffunction>
	
	<cffunction name="setPolicyHoldersPhoneExtension" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersPhoneExtension" required="true" type="any" />
			
		<cfset variables.PolicyHoldersPhoneExtension = arguments.PolicyHoldersPhoneExtension />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersPhoneExtension") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersEmployerSchoolName.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersEmployerSchoolName" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersEmployerSchoolName>
	</cffunction>
	
	<cffunction name="setPolicyHoldersEmployerSchoolName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersEmployerSchoolName" required="true" type="any" />
			
		<cfset variables.PolicyHoldersEmployerSchoolName = arguments.PolicyHoldersEmployerSchoolName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersEmployerSchoolName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersEffectiveDateFrom.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersEffectiveDateFrom" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersEffectiveDateFrom>
	</cffunction>
	
	<cffunction name="setPolicyHoldersEffectiveDateFrom" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersEffectiveDateFrom" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.PolicyHoldersEffectiveDateFrom)) OR trim(arguments.PolicyHoldersEffectiveDateFrom) EQ "">
			<cfset variables.PolicyHoldersEffectiveDateFrom = arguments.PolicyHoldersEffectiveDateFrom />
		<cfelse>
			<cfthrow message="PolicyHoldersEffectiveDateFrom (#arguments.PolicyHoldersEffectiveDateFrom#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersEffectiveDateFrom") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PolicyHoldersEffectiveDateTo.                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPolicyHoldersEffectiveDateTo" acess="public" output="false" returntype="any">
		<cfreturn variables.PolicyHoldersEffectiveDateTo>
	</cffunction>
	
	<cffunction name="setPolicyHoldersEffectiveDateTo" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PolicyHoldersEffectiveDateTo" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.PolicyHoldersEffectiveDateTo)) OR trim(arguments.PolicyHoldersEffectiveDateTo) EQ "">
			<cfset variables.PolicyHoldersEffectiveDateTo = arguments.PolicyHoldersEffectiveDateTo />
		<cfelse>
			<cfthrow message="PolicyHoldersEffectiveDateTo (#arguments.PolicyHoldersEffectiveDateTo#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PolicyHoldersEffectiveDateTo") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for GroupNumber.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getGroupNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.GroupNumber>
	</cffunction>
	
	<cffunction name="setGroupNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="GroupNumber" required="true" type="any" />
			
		<cfset variables.GroupNumber = arguments.GroupNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "GroupNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for GroupName.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getGroupName" acess="public" output="false" returntype="any">
		<cfreturn variables.GroupName>
	</cffunction>
	
	<cffunction name="setGroupName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="GroupName" required="true" type="any" />
			
		<cfset variables.GroupName = arguments.GroupName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "GroupName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Deductible.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDeductible" acess="public" output="false" returntype="any">
		<cfreturn variables.Deductible>
	</cffunction>
	
	<cffunction name="setDeductible" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Deductible" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Deductible)) OR trim(arguments.Deductible) EQ "">
			<cfset variables.Deductible = arguments.Deductible />
		<cfelse>
			<cfthrow message="Deductible (#arguments.Deductible#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Deductible") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PayPercentage.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPayPercentage" acess="public" output="false" returntype="any">
		<cfreturn variables.PayPercentage>
	</cffunction>
	
	<cffunction name="setPayPercentage" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PayPercentage" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PayPercentage)) OR trim(arguments.PayPercentage) EQ "">
			<cfset variables.PayPercentage = arguments.PayPercentage />
		<cfelse>
			<cfthrow message="PayPercentage (#arguments.PayPercentage#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PayPercentage") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Relationship.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRelationship" acess="public" output="false" returntype="any">
		<cfreturn variables.Relationship>
	</cffunction>
	
	<cffunction name="setRelationship" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Relationship" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Relationship)) OR trim(arguments.Relationship) EQ "">
			<cfset variables.Relationship = arguments.Relationship />
		<cfelse>
			<cfthrow message="Relationship (#arguments.Relationship#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Relationship") />		
		
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



