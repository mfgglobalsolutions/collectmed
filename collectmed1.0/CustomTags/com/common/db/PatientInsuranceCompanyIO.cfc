<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- PatientInsuranceCompanyIO.cfc                                                  --->
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->
<!--- This tag is a CFC tag tied to the PatientInsuranceCompany table in the dB.     --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_PatientInsuranceCompanyTable                                     --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!--- Queryname<br>                                                                  --->
<!--- fields<br>                                                                     --->
<!--- orderby<br>                                                                    --->
<!--- groupby (same as fields contents maybe different order)<br>                    --->
<!--- andclause example.... (CN1= Column Name)                                       --->
<!--- [ andclause="RTRIM(CN1)+''+RTRIM(CN2)='#Var#'" ]<br>                           --->
<!--- recordID<br>                                                                   --->
<!--- PatientID<br>                                                                  --->
<!--- InsuranceCompanyID<br>                                                         --->
<!--- PrimSecTer<br>                                                                 --->
<!--- PolicyNumber<br>                                                               --->
<!--- PolicyHoldersFirstName<br>                                                     --->
<!--- PolicyHoldersLastName<br>                                                      --->
<!--- PolicyHoldersMiddleInitial<br>                                                 --->
<!--- PolicyHoldersDOB<br>                                                           --->
<!--- PolicyHoldersSex<br>                                                           --->
<!--- PolicyHoldersAddressLine1<br>                                                  --->
<!--- PolicyHoldersAddressLine2<br>                                                  --->
<!--- PolicyHoldersCity<br>                                                          --->
<!--- PolicyHoldersStateID<br>                                                       --->
<!--- PolicyHoldersZipCode<br>                                                       --->
<!--- PolicyHoldersPhone<br>                                                         --->
<!--- PolicyHoldersPhoneExtension<br>                                                --->
<!--- PolicyHoldersEmployerSchoolName<br>                                            --->
<!--- PolicyHoldersEffectiveDateFrom<br>                                             --->
<!--- PolicyHoldersEffectiveDateTo<br>                                               --->
<!--- GroupNumber<br>                                                                --->
<!--- GroupName<br>                                                                  --->
<!--- Deductible<br>                                                                 --->
<!--- PayPercentage<br>                                                              --->
<!--- Relationship<br>                                                               --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- recordID                                                                       --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="PatientInsuranceCompanyIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.recordID = "NULL";
			variables.instance.PatientID = "NULL";
			variables.instance.InsuranceCompanyID = "NULL";
			variables.instance.PrimSecTer = "NULL";
			variables.instance.PolicyNumber = "";
			variables.instance.PolicyHoldersFirstName = "";
			variables.instance.PolicyHoldersLastName = "";
			variables.instance.PolicyHoldersMiddleInitial = "";
			variables.instance.PolicyHoldersDOB = "";
			variables.instance.PolicyHoldersSex = "NULL";
			variables.instance.PolicyHoldersAddressLine1 = "";
			variables.instance.PolicyHoldersAddressLine2 = "";
			variables.instance.PolicyHoldersCity = "";
			variables.instance.PolicyHoldersStateID = "NULL";
			variables.instance.PolicyHoldersZipCode = "";
			variables.instance.PolicyHoldersPhone = "";
			variables.instance.PolicyHoldersPhoneExtension = "";
			variables.instance.PolicyHoldersEmployerSchoolName = "";
			variables.instance.PolicyHoldersEffectiveDateFrom = "";
			variables.instance.PolicyHoldersEffectiveDateTo = "";
			variables.instance.GroupNumber = "";
			variables.instance.GroupName = "";
			variables.instance.Deductible = "NULL";
			variables.instance.PayPercentage = "NULL";
			variables.instance.Relationship = "NULL";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 29)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RECORDID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INSURANCECOMPANYID", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIMSECTER", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYNUMBER", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSFIRSTNAME", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSLASTNAME", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSMIDDLEINITIAL", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSDOB", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSSEX", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSADDRESSLINE1", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSADDRESSLINE2", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSCITY", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSSTATEID", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSZIPCODE", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSPHONE", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSPHONEEXTENSION", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSEMPLOYERSCHOOLNAME", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSEFFECTIVEDATEFROM", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POLICYHOLDERSEFFECTIVEDATETO", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "GROUPNUMBER", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "GROUPNAME", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DEDUCTIBLE", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PAYPERCENTAGE", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RELATIONSHIP", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 29)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for recordID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRecordID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RecordID>
	</cffunction>
	 
	<cffunction name="setRecordID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RecordID" required="Yes" type="String">
		
		<cfif RecordID NEQ "NULL">	
			
			<cfif arguments.recordID EQ "@@" OR arguments.recordID EQ "">
				
				<cfset arguments.recordID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(RecordID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RecordID</strong> (#RecordID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RecordID = arguments.RecordID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PatientID.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientID>
	</cffunction>
	 
	<cffunction name="setPatientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientID" required="Yes" type="String">
		
		<cfif PatientID NEQ "NULL">	
			
			<cfif arguments.PatientID EQ "@@" OR arguments.PatientID EQ "">
				
				<cfset arguments.PatientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PatientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientID</strong> (#PatientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientID = arguments.PatientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InsuranceCompanyID.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInsuranceCompanyID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InsuranceCompanyID>
	</cffunction>
	 
	<cffunction name="setInsuranceCompanyID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InsuranceCompanyID" required="Yes" type="String">
		
		<cfif InsuranceCompanyID NEQ "NULL">	
			
			<cfif arguments.InsuranceCompanyID EQ "@@" OR arguments.InsuranceCompanyID EQ "">
				
				<cfset arguments.InsuranceCompanyID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InsuranceCompanyID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InsuranceCompanyID</strong> (#InsuranceCompanyID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InsuranceCompanyID = arguments.InsuranceCompanyID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InsuranceCompanyID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PrimSecTer.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrimSecTer" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrimSecTer>
	</cffunction>
	 
	<cffunction name="setPrimSecTer" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrimSecTer" required="Yes" type="String">
		
		<cfif PrimSecTer NEQ "NULL">	
			
			<cfif arguments.PrimSecTer EQ "@@" OR arguments.PrimSecTer EQ "">
				
				<cfset arguments.PrimSecTer = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PrimSecTer)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrimSecTer</strong> (#PrimSecTer#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PrimSecTer = arguments.PrimSecTer>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrimSecTer")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyNumber.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyNumber>
	</cffunction>
	 
	<cffunction name="setPolicyNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyNumber" required="Yes" type="String">
		
		<cfif PolicyNumber NEQ "NULL">	
			
			<cfif arguments.PolicyNumber EQ "@@" OR arguments.PolicyNumber EQ "">
				
				<cfset arguments.PolicyNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyNumber</strong> (#PolicyNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyNumber) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyNumber</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyNumber = arguments.PolicyNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersFirstName.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersFirstName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersFirstName>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersFirstName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersFirstName" required="Yes" type="String">
		
		<cfif PolicyHoldersFirstName NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersFirstName EQ "@@" OR arguments.PolicyHoldersFirstName EQ "">
				
				<cfset arguments.PolicyHoldersFirstName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersFirstName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersFirstName</strong> (#PolicyHoldersFirstName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersFirstName) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersFirstName</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersFirstName = arguments.PolicyHoldersFirstName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersFirstName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersLastName.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersLastName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersLastName>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersLastName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersLastName" required="Yes" type="String">
		
		<cfif PolicyHoldersLastName NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersLastName EQ "@@" OR arguments.PolicyHoldersLastName EQ "">
				
				<cfset arguments.PolicyHoldersLastName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersLastName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersLastName</strong> (#PolicyHoldersLastName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersLastName) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersLastName</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersLastName = arguments.PolicyHoldersLastName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersLastName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersMiddleInitial.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersMiddleInitial" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersMiddleInitial>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersMiddleInitial" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersMiddleInitial" required="Yes" type="String">
		
		<cfif PolicyHoldersMiddleInitial NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersMiddleInitial EQ "@@" OR arguments.PolicyHoldersMiddleInitial EQ "">
				
				<cfset arguments.PolicyHoldersMiddleInitial = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersMiddleInitial)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersMiddleInitial</strong> (#PolicyHoldersMiddleInitial#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersMiddleInitial) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersMiddleInitial</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersMiddleInitial = arguments.PolicyHoldersMiddleInitial>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersMiddleInitial")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersDOB.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersDOB" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersDOB>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersDOB" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersDOB" required="Yes" type="String">
		
		<cfif PolicyHoldersDOB NEQ "NULL" AND PolicyHoldersDOB NEQ "NOW">	
			
			<cfif arguments.PolicyHoldersDOB EQ "@@" OR arguments.PolicyHoldersDOB EQ "">
				
				<cfset arguments.PolicyHoldersDOB = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(PolicyHoldersDOB)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersDOB</strong> (#PolicyHoldersDOB#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersDOB = arguments.PolicyHoldersDOB>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersDOB")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersSex.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersSex" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersSex>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersSex" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersSex" required="Yes" type="String">
		
		<cfif PolicyHoldersSex NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersSex EQ "@@" OR arguments.PolicyHoldersSex EQ "">
				
				<cfset arguments.PolicyHoldersSex = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PolicyHoldersSex)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersSex</strong> (#PolicyHoldersSex#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersSex = arguments.PolicyHoldersSex>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersSex")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersAddressLine1.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersAddressLine1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersAddressLine1>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersAddressLine1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersAddressLine1" required="Yes" type="String">
		
		<cfif PolicyHoldersAddressLine1 NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersAddressLine1 EQ "@@" OR arguments.PolicyHoldersAddressLine1 EQ "">
				
				<cfset arguments.PolicyHoldersAddressLine1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersAddressLine1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersAddressLine1</strong> (#PolicyHoldersAddressLine1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersAddressLine1) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersAddressLine1</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersAddressLine1 = arguments.PolicyHoldersAddressLine1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersAddressLine1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersAddressLine2.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersAddressLine2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersAddressLine2>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersAddressLine2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersAddressLine2" required="Yes" type="String">
		
		<cfif PolicyHoldersAddressLine2 NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersAddressLine2 EQ "@@" OR arguments.PolicyHoldersAddressLine2 EQ "">
				
				<cfset arguments.PolicyHoldersAddressLine2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersAddressLine2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersAddressLine2</strong> (#PolicyHoldersAddressLine2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersAddressLine2) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersAddressLine2</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersAddressLine2 = arguments.PolicyHoldersAddressLine2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersAddressLine2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersCity.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersCity" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersCity>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersCity" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersCity" required="Yes" type="String">
		
		<cfif PolicyHoldersCity NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersCity EQ "@@" OR arguments.PolicyHoldersCity EQ "">
				
				<cfset arguments.PolicyHoldersCity = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersCity)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersCity</strong> (#PolicyHoldersCity#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersCity) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersCity</strong> cannot be greater than 25 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersCity = arguments.PolicyHoldersCity>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersCity")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersStateID.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersStateID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersStateID>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersStateID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersStateID" required="Yes" type="String">
		
		<cfif PolicyHoldersStateID NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersStateID EQ "@@" OR arguments.PolicyHoldersStateID EQ "">
				
				<cfset arguments.PolicyHoldersStateID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PolicyHoldersStateID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersStateID</strong> (#PolicyHoldersStateID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersStateID = arguments.PolicyHoldersStateID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersStateID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersZipCode.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersZipCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersZipCode>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersZipCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersZipCode" required="Yes" type="String">
		
		<cfif PolicyHoldersZipCode NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersZipCode EQ "@@" OR arguments.PolicyHoldersZipCode EQ "">
				
				<cfset arguments.PolicyHoldersZipCode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersZipCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersZipCode</strong> (#PolicyHoldersZipCode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersZipCode) GT 15>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersZipCode</strong> cannot be greater than 15 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersZipCode = arguments.PolicyHoldersZipCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersZipCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersPhone.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersPhone" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersPhone>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersPhone" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersPhone" required="Yes" type="String">
		
		<cfif PolicyHoldersPhone NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersPhone EQ "@@" OR arguments.PolicyHoldersPhone EQ "">
				
				<cfset arguments.PolicyHoldersPhone = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersPhone)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersPhone</strong> (#PolicyHoldersPhone#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersPhone) GT 15>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersPhone</strong> cannot be greater than 15 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersPhone = arguments.PolicyHoldersPhone>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersPhone")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersPhoneExtension.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersPhoneExtension" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersPhoneExtension>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersPhoneExtension" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersPhoneExtension" required="Yes" type="String">
		
		<cfif PolicyHoldersPhoneExtension NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersPhoneExtension EQ "@@" OR arguments.PolicyHoldersPhoneExtension EQ "">
				
				<cfset arguments.PolicyHoldersPhoneExtension = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersPhoneExtension)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersPhoneExtension</strong> (#PolicyHoldersPhoneExtension#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersPhoneExtension) GT 5>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersPhoneExtension</strong> cannot be greater than 5 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersPhoneExtension = arguments.PolicyHoldersPhoneExtension>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersPhoneExtension")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersEmployerSchoolName.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersEmployerSchoolName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersEmployerSchoolName>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersEmployerSchoolName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersEmployerSchoolName" required="Yes" type="String">
		
		<cfif PolicyHoldersEmployerSchoolName NEQ "NULL">	
			
			<cfif arguments.PolicyHoldersEmployerSchoolName EQ "@@" OR arguments.PolicyHoldersEmployerSchoolName EQ "">
				
				<cfset arguments.PolicyHoldersEmployerSchoolName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PolicyHoldersEmployerSchoolName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersEmployerSchoolName</strong> (#PolicyHoldersEmployerSchoolName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PolicyHoldersEmployerSchoolName) GT 45>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PolicyHoldersEmployerSchoolName</strong> cannot be greater than 45 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersEmployerSchoolName = arguments.PolicyHoldersEmployerSchoolName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersEmployerSchoolName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersEffectiveDateFrom.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersEffectiveDateFrom" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersEffectiveDateFrom>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersEffectiveDateFrom" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersEffectiveDateFrom" required="Yes" type="String">
		
		<cfif PolicyHoldersEffectiveDateFrom NEQ "NULL" AND PolicyHoldersEffectiveDateFrom NEQ "NOW">	
			
			<cfif arguments.PolicyHoldersEffectiveDateFrom EQ "@@" OR arguments.PolicyHoldersEffectiveDateFrom EQ "">
				
				<cfset arguments.PolicyHoldersEffectiveDateFrom = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(PolicyHoldersEffectiveDateFrom)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersEffectiveDateFrom</strong> (#PolicyHoldersEffectiveDateFrom#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersEffectiveDateFrom = arguments.PolicyHoldersEffectiveDateFrom>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersEffectiveDateFrom")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PolicyHoldersEffectiveDateTo.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPolicyHoldersEffectiveDateTo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PolicyHoldersEffectiveDateTo>
	</cffunction>
	 
	<cffunction name="setPolicyHoldersEffectiveDateTo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PolicyHoldersEffectiveDateTo" required="Yes" type="String">
		
		<cfif PolicyHoldersEffectiveDateTo NEQ "NULL" AND PolicyHoldersEffectiveDateTo NEQ "NOW">	
			
			<cfif arguments.PolicyHoldersEffectiveDateTo EQ "@@" OR arguments.PolicyHoldersEffectiveDateTo EQ "">
				
				<cfset arguments.PolicyHoldersEffectiveDateTo = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(PolicyHoldersEffectiveDateTo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PolicyHoldersEffectiveDateTo</strong> (#PolicyHoldersEffectiveDateTo#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PolicyHoldersEffectiveDateTo = arguments.PolicyHoldersEffectiveDateTo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PolicyHoldersEffectiveDateTo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for GroupNumber.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getGroupNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.GroupNumber>
	</cffunction>
	 
	<cffunction name="setGroupNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="GroupNumber" required="Yes" type="String">
		
		<cfif GroupNumber NEQ "NULL">	
			
			<cfif arguments.GroupNumber EQ "@@" OR arguments.GroupNumber EQ "">
				
				<cfset arguments.GroupNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(GroupNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>GroupNumber</strong> (#GroupNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(GroupNumber) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>GroupNumber</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.GroupNumber = arguments.GroupNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "GroupNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for GroupName.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getGroupName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.GroupName>
	</cffunction>
	 
	<cffunction name="setGroupName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="GroupName" required="Yes" type="String">
		
		<cfif GroupName NEQ "NULL">	
			
			<cfif arguments.GroupName EQ "@@" OR arguments.GroupName EQ "">
				
				<cfset arguments.GroupName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(GroupName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>GroupName</strong> (#GroupName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(GroupName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>GroupName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.GroupName = arguments.GroupName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "GroupName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Deductible.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDeductible" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Deductible>
	</cffunction>
	 
	<cffunction name="setDeductible" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Deductible" required="Yes" type="String">
		
		<cfif Deductible NEQ "NULL">	
			
			<cfif arguments.Deductible EQ "@@" OR arguments.Deductible EQ "">
				
				<cfset arguments.Deductible = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Deductible)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Deductible</strong> (#Deductible#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Deductible = arguments.Deductible>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Deductible")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PayPercentage.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPayPercentage" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PayPercentage>
	</cffunction>
	 
	<cffunction name="setPayPercentage" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PayPercentage" required="Yes" type="String">
		
		<cfif PayPercentage NEQ "NULL">	
			
			<cfif arguments.PayPercentage EQ "@@" OR arguments.PayPercentage EQ "">
				
				<cfset arguments.PayPercentage = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PayPercentage)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PayPercentage</strong> (#PayPercentage#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PayPercentage = arguments.PayPercentage>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PayPercentage")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Relationship.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRelationship" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Relationship>
	</cffunction>
	 
	<cffunction name="setRelationship" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Relationship" required="Yes" type="String">
		
		<cfif Relationship NEQ "NULL">	
			
			<cfif arguments.Relationship EQ "@@" OR arguments.Relationship EQ "">
				
				<cfset arguments.Relationship = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(Relationship)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Relationship</strong> (#Relationship#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Relationship = arguments.Relationship>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Relationship")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="PatientID" required="No" type="String" default="">
		<cfargument name="InsuranceCompanyID" required="No" type="String" default="">
		<cfargument name="PrimSecTer" required="No" type="String" default="">
		<cfargument name="PolicyNumber" required="No" type="String" default="">
		<cfargument name="PolicyHoldersFirstName" required="No" type="String" default="">
		<cfargument name="PolicyHoldersLastName" required="No" type="String" default="">
		<cfargument name="PolicyHoldersMiddleInitial" required="No" type="String" default="">
		<cfargument name="PolicyHoldersDOB" required="No" type="String" default="">
		<cfargument name="PolicyHoldersSex" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine1" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine2" required="No" type="String" default="">
		<cfargument name="PolicyHoldersCity" required="No" type="String" default="">
		<cfargument name="PolicyHoldersStateID" required="No" type="String" default="">
		<cfargument name="PolicyHoldersZipCode" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhone" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhoneExtension" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEmployerSchoolName" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateFrom" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateTo" required="No" type="String" default="">
		<cfargument name="GroupNumber" required="No" type="String" default="">
		<cfargument name="GroupName" required="No" type="String" default="">
		<cfargument name="Deductible" required="No" type="String" default="">
		<cfargument name="PayPercentage" required="No" type="String" default="">
		<cfargument name="Relationship" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.PatientID = arguments.PatientID>
		<cfset variables.instance.InsuranceCompanyID = arguments.InsuranceCompanyID>
		<cfset variables.instance.PrimSecTer = arguments.PrimSecTer>
		<cfset variables.instance.PolicyNumber = arguments.PolicyNumber>
		<cfset variables.instance.PolicyHoldersFirstName = arguments.PolicyHoldersFirstName>
		<cfset variables.instance.PolicyHoldersLastName = arguments.PolicyHoldersLastName>
		<cfset variables.instance.PolicyHoldersMiddleInitial = arguments.PolicyHoldersMiddleInitial>
		<cfset variables.instance.PolicyHoldersDOB = arguments.PolicyHoldersDOB>
		<cfset variables.instance.PolicyHoldersSex = arguments.PolicyHoldersSex>
		<cfset variables.instance.PolicyHoldersAddressLine1 = arguments.PolicyHoldersAddressLine1>
		<cfset variables.instance.PolicyHoldersAddressLine2 = arguments.PolicyHoldersAddressLine2>
		<cfset variables.instance.PolicyHoldersCity = arguments.PolicyHoldersCity>
		<cfset variables.instance.PolicyHoldersStateID = arguments.PolicyHoldersStateID>
		<cfset variables.instance.PolicyHoldersZipCode = arguments.PolicyHoldersZipCode>
		<cfset variables.instance.PolicyHoldersPhone = arguments.PolicyHoldersPhone>
		<cfset variables.instance.PolicyHoldersPhoneExtension = arguments.PolicyHoldersPhoneExtension>
		<cfset variables.instance.PolicyHoldersEmployerSchoolName = arguments.PolicyHoldersEmployerSchoolName>
		<cfset variables.instance.PolicyHoldersEffectiveDateFrom = arguments.PolicyHoldersEffectiveDateFrom>
		<cfset variables.instance.PolicyHoldersEffectiveDateTo = arguments.PolicyHoldersEffectiveDateTo>
		<cfset variables.instance.GroupNumber = arguments.GroupNumber>
		<cfset variables.instance.GroupName = arguments.GroupName>
		<cfset variables.instance.Deductible = arguments.Deductible>
		<cfset variables.instance.PayPercentage = arguments.PayPercentage>
		<cfset variables.instance.Relationship = arguments.Relationship>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitPatientInsuranceCompanyIO" access="public" returntype="PatientInsuranceCompanyIO" output="No">
		
		<cfargument name="recordID" required="yes" type="numeric">		
		<cfset var qGetPatientInsuranceCompany = "">
		
		<cfset preInit(recordID)>
	
		<cfquery name="qGetPatientInsuranceCompany" datasource="#trim(request.datasource)#">
	  		SELECT recordID,PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified
			FROM patientinsurancecompany  
			WHERE recordID = #trim(arguments.recordID)# 
		</cfquery>
		
		<cfif qGetPatientInsuranceCompany.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetPatientInsuranceCompany.recordID EQ "" OR qGetPatientInsuranceCompany.recordID EQ "NULL") 
				variables.instance.recordID = "NULL"; 
			ELSE 
				variables.instance.recordID = qGetPatientInsuranceCompany.recordID;
				
			IF(qGetPatientInsuranceCompany.PatientID EQ "" OR qGetPatientInsuranceCompany.PatientID EQ "NULL") 
				variables.instance.PatientID = "NULL"; 
			ELSE 
				variables.instance.PatientID = qGetPatientInsuranceCompany.PatientID;
				
			IF(qGetPatientInsuranceCompany.InsuranceCompanyID EQ "" OR qGetPatientInsuranceCompany.InsuranceCompanyID EQ "NULL") 
				variables.instance.InsuranceCompanyID = "NULL"; 
			ELSE 
				variables.instance.InsuranceCompanyID = qGetPatientInsuranceCompany.InsuranceCompanyID;
				
			IF(qGetPatientInsuranceCompany.PrimSecTer EQ "" OR qGetPatientInsuranceCompany.PrimSecTer EQ "NULL") 
				variables.instance.PrimSecTer = "NULL"; 
			ELSE 
				variables.instance.PrimSecTer = qGetPatientInsuranceCompany.PrimSecTer;
							
				variables.instance.PolicyNumber = qGetPatientInsuranceCompany.PolicyNumber;
							
				variables.instance.PolicyHoldersFirstName = qGetPatientInsuranceCompany.PolicyHoldersFirstName;
							
				variables.instance.PolicyHoldersLastName = qGetPatientInsuranceCompany.PolicyHoldersLastName;
							
				variables.instance.PolicyHoldersMiddleInitial = qGetPatientInsuranceCompany.PolicyHoldersMiddleInitial;
							
				variables.instance.PolicyHoldersDOB = qGetPatientInsuranceCompany.PolicyHoldersDOB;
				
			IF(qGetPatientInsuranceCompany.PolicyHoldersSex EQ "" OR qGetPatientInsuranceCompany.PolicyHoldersSex EQ "NULL") 
				variables.instance.PolicyHoldersSex = "NULL"; 
			ELSE 
				variables.instance.PolicyHoldersSex = qGetPatientInsuranceCompany.PolicyHoldersSex;
							
				variables.instance.PolicyHoldersAddressLine1 = qGetPatientInsuranceCompany.PolicyHoldersAddressLine1;
							
				variables.instance.PolicyHoldersAddressLine2 = qGetPatientInsuranceCompany.PolicyHoldersAddressLine2;
							
				variables.instance.PolicyHoldersCity = qGetPatientInsuranceCompany.PolicyHoldersCity;
				
			IF(qGetPatientInsuranceCompany.PolicyHoldersStateID EQ "" OR qGetPatientInsuranceCompany.PolicyHoldersStateID EQ "NULL") 
				variables.instance.PolicyHoldersStateID = "NULL"; 
			ELSE 
				variables.instance.PolicyHoldersStateID = qGetPatientInsuranceCompany.PolicyHoldersStateID;
							
				variables.instance.PolicyHoldersZipCode = qGetPatientInsuranceCompany.PolicyHoldersZipCode;
							
				variables.instance.PolicyHoldersPhone = qGetPatientInsuranceCompany.PolicyHoldersPhone;
							
				variables.instance.PolicyHoldersPhoneExtension = qGetPatientInsuranceCompany.PolicyHoldersPhoneExtension;
							
				variables.instance.PolicyHoldersEmployerSchoolName = qGetPatientInsuranceCompany.PolicyHoldersEmployerSchoolName;
							
				variables.instance.PolicyHoldersEffectiveDateFrom = qGetPatientInsuranceCompany.PolicyHoldersEffectiveDateFrom;
							
				variables.instance.PolicyHoldersEffectiveDateTo = qGetPatientInsuranceCompany.PolicyHoldersEffectiveDateTo;
							
				variables.instance.GroupNumber = qGetPatientInsuranceCompany.GroupNumber;
							
				variables.instance.GroupName = qGetPatientInsuranceCompany.GroupName;
				
			IF(qGetPatientInsuranceCompany.Deductible EQ "" OR qGetPatientInsuranceCompany.Deductible EQ "NULL") 
				variables.instance.Deductible = "NULL"; 
			ELSE 
				variables.instance.Deductible = qGetPatientInsuranceCompany.Deductible;
				
			IF(qGetPatientInsuranceCompany.PayPercentage EQ "" OR qGetPatientInsuranceCompany.PayPercentage EQ "NULL") 
				variables.instance.PayPercentage = "NULL"; 
			ELSE 
				variables.instance.PayPercentage = qGetPatientInsuranceCompany.PayPercentage;
				
			IF(qGetPatientInsuranceCompany.Relationship EQ "" OR qGetPatientInsuranceCompany.Relationship EQ "NULL") 
				variables.instance.Relationship = "NULL"; 
			ELSE 
				variables.instance.Relationship = qGetPatientInsuranceCompany.Relationship;
							
				variables.instance.Active = qGetPatientInsuranceCompany.Active;
				
			IF(qGetPatientInsuranceCompany.InactiveCode EQ "" OR qGetPatientInsuranceCompany.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetPatientInsuranceCompany.InactiveCode;
							
				variables.instance.DateCreated = qGetPatientInsuranceCompany.DateCreated;
							
				variables.instance.DateModified = qGetPatientInsuranceCompany.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(recordID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitPatientInsuranceCompany = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.recordID) AND variables.instance.recordID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitPatientInsuranceCompany" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitPatientInsuranceCompany" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.recordID = qInsertCommitPatientInsuranceCompany.recordID>
				
				<cfreturn qInsertCommitPatientInsuranceCompany.recordID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "recordID,PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,GroupNumber,GroupName,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "PolicyHoldersDOB,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE patientinsurancecompany  SET #columnsToUpdate# WHERE recordID = #trim(variables.instance.recordID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,GroupNumber,GroupName,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "PolicyHoldersDOB,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO patientinsurancecompany  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS recordID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPatientInsuranceCompanyQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getPatientInsuranceCompanyQuery">						
		<cfargument name="Fields" required="No" type="String" default="recordID,PatientID,InsuranceCompanyID,PrimSecTer,PolicyNumber,PolicyHoldersFirstName,PolicyHoldersLastName,PolicyHoldersMiddleInitial,PolicyHoldersDOB,PolicyHoldersSex,PolicyHoldersAddressLine1,PolicyHoldersAddressLine2,PolicyHoldersCity,PolicyHoldersStateID,PolicyHoldersZipCode,PolicyHoldersPhone,PolicyHoldersPhoneExtension,PolicyHoldersEmployerSchoolName,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateTo,GroupNumber,GroupName,Deductible,PayPercentage,Relationship,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="recordID" required="No" type="String" default="">
		<cfargument name="recordID_IN" required="No" type="String" default="">
		<cfargument name="recordID_LIKE" required="No" type="String" default="">
		<cfargument name="PatientID" required="No" type="String" default="">
		<cfargument name="PatientID_IN" required="No" type="String" default="">
		<cfargument name="PatientID_LIKE" required="No" type="String" default="">
		<cfargument name="InsuranceCompanyID" required="No" type="String" default="">
		<cfargument name="InsuranceCompanyID_IN" required="No" type="String" default="">
		<cfargument name="InsuranceCompanyID_LIKE" required="No" type="String" default="">
		<cfargument name="PrimSecTer" required="No" type="String" default="">
		<cfargument name="PrimSecTer_IN" required="No" type="String" default="">
		<cfargument name="PrimSecTer_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyNumber" required="No" type="String" default="">
		<cfargument name="PolicyNumber_IN" required="No" type="String" default="">
		<cfargument name="PolicyNumber_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersFirstName" required="No" type="String" default="">
		<cfargument name="PolicyHoldersFirstName_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersFirstName_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersLastName" required="No" type="String" default="">
		<cfargument name="PolicyHoldersLastName_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersLastName_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersMiddleInitial" required="No" type="String" default="">
		<cfargument name="PolicyHoldersMiddleInitial_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersMiddleInitial_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersDOB" required="No" type="String" default="">
		<cfargument name="PolicyHoldersDOB_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersDOB_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersSex" required="No" type="String" default="">
		<cfargument name="PolicyHoldersSex_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersSex_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine1" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine1_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine1_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine2" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine2_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersAddressLine2_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersCity" required="No" type="String" default="">
		<cfargument name="PolicyHoldersCity_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersCity_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersStateID" required="No" type="String" default="">
		<cfargument name="PolicyHoldersStateID_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersStateID_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersZipCode" required="No" type="String" default="">
		<cfargument name="PolicyHoldersZipCode_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersZipCode_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhone" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhone_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhone_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhoneExtension" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhoneExtension_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersPhoneExtension_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEmployerSchoolName" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEmployerSchoolName_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEmployerSchoolName_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateFrom" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateFrom_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateFrom_LIKE" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateTo" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateTo_IN" required="No" type="String" default="">
		<cfargument name="PolicyHoldersEffectiveDateTo_LIKE" required="No" type="String" default="">
		<cfargument name="GroupNumber" required="No" type="String" default="">
		<cfargument name="GroupNumber_IN" required="No" type="String" default="">
		<cfargument name="GroupNumber_LIKE" required="No" type="String" default="">
		<cfargument name="GroupName" required="No" type="String" default="">
		<cfargument name="GroupName_IN" required="No" type="String" default="">
		<cfargument name="GroupName_LIKE" required="No" type="String" default="">
		<cfargument name="Deductible" required="No" type="String" default="">
		<cfargument name="Deductible_IN" required="No" type="String" default="">
		<cfargument name="Deductible_LIKE" required="No" type="String" default="">
		<cfargument name="PayPercentage" required="No" type="String" default="">
		<cfargument name="PayPercentage_IN" required="No" type="String" default="">
		<cfargument name="PayPercentage_LIKE" required="No" type="String" default="">
		<cfargument name="Relationship" required="No" type="String" default="">
		<cfargument name="Relationship_IN" required="No" type="String" default="">
		<cfargument name="Relationship_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "recordID,recordID_IN,recordID_LIKE,PatientID,PatientID_IN,PatientID_LIKE,InsuranceCompanyID,InsuranceCompanyID_IN,InsuranceCompanyID_LIKE,PrimSecTer,PrimSecTer_IN,PrimSecTer_LIKE,PolicyNumber,PolicyNumber_IN,PolicyNumber_LIKE,PolicyHoldersFirstName,PolicyHoldersFirstName_IN,PolicyHoldersFirstName_LIKE,PolicyHoldersLastName,PolicyHoldersLastName_IN,PolicyHoldersLastName_LIKE,PolicyHoldersMiddleInitial,PolicyHoldersMiddleInitial_IN,PolicyHoldersMiddleInitial_LIKE,PolicyHoldersDOB,PolicyHoldersDOB_IN,PolicyHoldersDOB_LIKE,PolicyHoldersSex,PolicyHoldersSex_IN,PolicyHoldersSex_LIKE,PolicyHoldersAddressLine1,PolicyHoldersAddressLine1_IN,PolicyHoldersAddressLine1_LIKE,PolicyHoldersAddressLine2,PolicyHoldersAddressLine2_IN,PolicyHoldersAddressLine2_LIKE,PolicyHoldersCity,PolicyHoldersCity_IN,PolicyHoldersCity_LIKE,PolicyHoldersStateID,PolicyHoldersStateID_IN,PolicyHoldersStateID_LIKE,PolicyHoldersZipCode,PolicyHoldersZipCode_IN,PolicyHoldersZipCode_LIKE,PolicyHoldersPhone,PolicyHoldersPhone_IN,PolicyHoldersPhone_LIKE,PolicyHoldersPhoneExtension,PolicyHoldersPhoneExtension_IN,PolicyHoldersPhoneExtension_LIKE,PolicyHoldersEmployerSchoolName,PolicyHoldersEmployerSchoolName_IN,PolicyHoldersEmployerSchoolName_LIKE,PolicyHoldersEffectiveDateFrom,PolicyHoldersEffectiveDateFrom_IN,PolicyHoldersEffectiveDateFrom_LIKE,PolicyHoldersEffectiveDateTo,PolicyHoldersEffectiveDateTo_IN,PolicyHoldersEffectiveDateTo_LIKE,GroupNumber,GroupNumber_IN,GroupNumber_LIKE,GroupName,GroupName_IN,GroupName_LIKE,Deductible,Deductible_IN,Deductible_LIKE,PayPercentage,PayPercentage_IN,PayPercentage_LIKE,Relationship,Relationship_IN,Relationship_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="PatientInsuranceCompany"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getPatientInsuranceCompanyQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM patientinsurancecompany   
				WHERE 1=1
					<cfif recordID NEQ "" AND IsNumeric(recordID)>AND recordID = #recordID#</cfif>
					<cfif recordID_IN NEQ "">AND recordID IN(#trim(recordID_IN)#)</cfif>
					<cfif recordID_LIKE NEQ "">AND recordID LIKE '%#trim(recordID_LIKE)#%'</cfif>
					<cfif PatientID NEQ "" AND IsNumeric(PatientID)>AND PatientID = #PatientID#</cfif>
					<cfif PatientID_IN NEQ "">AND PatientID IN(#trim(PatientID_IN)#)</cfif>
					<cfif PatientID_LIKE NEQ "">AND PatientID LIKE '%#trim(PatientID_LIKE)#%'</cfif>
					<cfif InsuranceCompanyID NEQ "" AND IsNumeric(InsuranceCompanyID)>AND InsuranceCompanyID = #InsuranceCompanyID#</cfif>
					<cfif InsuranceCompanyID_IN NEQ "">AND InsuranceCompanyID IN(#trim(InsuranceCompanyID_IN)#)</cfif>
					<cfif InsuranceCompanyID_LIKE NEQ "">AND InsuranceCompanyID LIKE '%#trim(InsuranceCompanyID_LIKE)#%'</cfif>
					<cfif PrimSecTer NEQ "" AND IsNumeric(PrimSecTer)>AND PrimSecTer = #PrimSecTer#</cfif>
					<cfif PrimSecTer_IN NEQ "">AND PrimSecTer IN(#trim(PrimSecTer_IN)#)</cfif>
					<cfif PrimSecTer_LIKE NEQ "">AND PrimSecTer LIKE '%#trim(PrimSecTer_LIKE)#%'</cfif>
					<cfif PolicyNumber NEQ "">AND PolicyNumber = '#PolicyNumber#'</cfif>
					<cfif PolicyNumber_IN NEQ "">AND PolicyNumber IN(#trim(PolicyNumber_IN)#)</cfif>
					<cfif PolicyNumber_LIKE NEQ "">AND PolicyNumber LIKE '%#trim(PolicyNumber_LIKE)#%'</cfif>
					<cfif PolicyHoldersFirstName NEQ "">AND PolicyHoldersFirstName = '#PolicyHoldersFirstName#'</cfif>
					<cfif PolicyHoldersFirstName_IN NEQ "">AND PolicyHoldersFirstName IN(#trim(PolicyHoldersFirstName_IN)#)</cfif>
					<cfif PolicyHoldersFirstName_LIKE NEQ "">AND PolicyHoldersFirstName LIKE '%#trim(PolicyHoldersFirstName_LIKE)#%'</cfif>
					<cfif PolicyHoldersLastName NEQ "">AND PolicyHoldersLastName = '#PolicyHoldersLastName#'</cfif>
					<cfif PolicyHoldersLastName_IN NEQ "">AND PolicyHoldersLastName IN(#trim(PolicyHoldersLastName_IN)#)</cfif>
					<cfif PolicyHoldersLastName_LIKE NEQ "">AND PolicyHoldersLastName LIKE '%#trim(PolicyHoldersLastName_LIKE)#%'</cfif>
					<cfif PolicyHoldersMiddleInitial NEQ "">AND PolicyHoldersMiddleInitial = '#PolicyHoldersMiddleInitial#'</cfif>
					<cfif PolicyHoldersMiddleInitial_IN NEQ "">AND PolicyHoldersMiddleInitial IN(#trim(PolicyHoldersMiddleInitial_IN)#)</cfif>
					<cfif PolicyHoldersMiddleInitial_LIKE NEQ "">AND PolicyHoldersMiddleInitial LIKE '%#trim(PolicyHoldersMiddleInitial_LIKE)#%'</cfif>
					<cfif PolicyHoldersDOB NEQ "">AND PolicyHoldersDOB = '#PolicyHoldersDOB#'</cfif>
					<cfif PolicyHoldersDOB_IN NEQ "">AND PolicyHoldersDOB IN(#trim(PolicyHoldersDOB_IN)#)</cfif>
					<cfif PolicyHoldersDOB_LIKE NEQ "">AND PolicyHoldersDOB LIKE '%#trim(PolicyHoldersDOB_LIKE)#%'</cfif>
					<cfif PolicyHoldersSex NEQ "" AND IsNumeric(PolicyHoldersSex)>AND PolicyHoldersSex = #PolicyHoldersSex#</cfif>
					<cfif PolicyHoldersSex_IN NEQ "">AND PolicyHoldersSex IN(#trim(PolicyHoldersSex_IN)#)</cfif>
					<cfif PolicyHoldersSex_LIKE NEQ "">AND PolicyHoldersSex LIKE '%#trim(PolicyHoldersSex_LIKE)#%'</cfif>
					<cfif PolicyHoldersAddressLine1 NEQ "">AND PolicyHoldersAddressLine1 = '#PolicyHoldersAddressLine1#'</cfif>
					<cfif PolicyHoldersAddressLine1_IN NEQ "">AND PolicyHoldersAddressLine1 IN(#trim(PolicyHoldersAddressLine1_IN)#)</cfif>
					<cfif PolicyHoldersAddressLine1_LIKE NEQ "">AND PolicyHoldersAddressLine1 LIKE '%#trim(PolicyHoldersAddressLine1_LIKE)#%'</cfif>
					<cfif PolicyHoldersAddressLine2 NEQ "">AND PolicyHoldersAddressLine2 = '#PolicyHoldersAddressLine2#'</cfif>
					<cfif PolicyHoldersAddressLine2_IN NEQ "">AND PolicyHoldersAddressLine2 IN(#trim(PolicyHoldersAddressLine2_IN)#)</cfif>
					<cfif PolicyHoldersAddressLine2_LIKE NEQ "">AND PolicyHoldersAddressLine2 LIKE '%#trim(PolicyHoldersAddressLine2_LIKE)#%'</cfif>
					<cfif PolicyHoldersCity NEQ "">AND PolicyHoldersCity = '#PolicyHoldersCity#'</cfif>
					<cfif PolicyHoldersCity_IN NEQ "">AND PolicyHoldersCity IN(#trim(PolicyHoldersCity_IN)#)</cfif>
					<cfif PolicyHoldersCity_LIKE NEQ "">AND PolicyHoldersCity LIKE '%#trim(PolicyHoldersCity_LIKE)#%'</cfif>
					<cfif PolicyHoldersStateID NEQ "" AND IsNumeric(PolicyHoldersStateID)>AND PolicyHoldersStateID = #PolicyHoldersStateID#</cfif>
					<cfif PolicyHoldersStateID_IN NEQ "">AND PolicyHoldersStateID IN(#trim(PolicyHoldersStateID_IN)#)</cfif>
					<cfif PolicyHoldersStateID_LIKE NEQ "">AND PolicyHoldersStateID LIKE '%#trim(PolicyHoldersStateID_LIKE)#%'</cfif>
					<cfif PolicyHoldersZipCode NEQ "">AND PolicyHoldersZipCode = '#PolicyHoldersZipCode#'</cfif>
					<cfif PolicyHoldersZipCode_IN NEQ "">AND PolicyHoldersZipCode IN(#trim(PolicyHoldersZipCode_IN)#)</cfif>
					<cfif PolicyHoldersZipCode_LIKE NEQ "">AND PolicyHoldersZipCode LIKE '%#trim(PolicyHoldersZipCode_LIKE)#%'</cfif>
					<cfif PolicyHoldersPhone NEQ "">AND PolicyHoldersPhone = '#PolicyHoldersPhone#'</cfif>
					<cfif PolicyHoldersPhone_IN NEQ "">AND PolicyHoldersPhone IN(#trim(PolicyHoldersPhone_IN)#)</cfif>
					<cfif PolicyHoldersPhone_LIKE NEQ "">AND PolicyHoldersPhone LIKE '%#trim(PolicyHoldersPhone_LIKE)#%'</cfif>
					<cfif PolicyHoldersPhoneExtension NEQ "">AND PolicyHoldersPhoneExtension = '#PolicyHoldersPhoneExtension#'</cfif>
					<cfif PolicyHoldersPhoneExtension_IN NEQ "">AND PolicyHoldersPhoneExtension IN(#trim(PolicyHoldersPhoneExtension_IN)#)</cfif>
					<cfif PolicyHoldersPhoneExtension_LIKE NEQ "">AND PolicyHoldersPhoneExtension LIKE '%#trim(PolicyHoldersPhoneExtension_LIKE)#%'</cfif>
					<cfif PolicyHoldersEmployerSchoolName NEQ "">AND PolicyHoldersEmployerSchoolName = '#PolicyHoldersEmployerSchoolName#'</cfif>
					<cfif PolicyHoldersEmployerSchoolName_IN NEQ "">AND PolicyHoldersEmployerSchoolName IN(#trim(PolicyHoldersEmployerSchoolName_IN)#)</cfif>
					<cfif PolicyHoldersEmployerSchoolName_LIKE NEQ "">AND PolicyHoldersEmployerSchoolName LIKE '%#trim(PolicyHoldersEmployerSchoolName_LIKE)#%'</cfif>
					<cfif PolicyHoldersEffectiveDateFrom NEQ "">AND PolicyHoldersEffectiveDateFrom = '#PolicyHoldersEffectiveDateFrom#'</cfif>
					<cfif PolicyHoldersEffectiveDateFrom_IN NEQ "">AND PolicyHoldersEffectiveDateFrom IN(#trim(PolicyHoldersEffectiveDateFrom_IN)#)</cfif>
					<cfif PolicyHoldersEffectiveDateFrom_LIKE NEQ "">AND PolicyHoldersEffectiveDateFrom LIKE '%#trim(PolicyHoldersEffectiveDateFrom_LIKE)#%'</cfif>
					<cfif PolicyHoldersEffectiveDateTo NEQ "">AND PolicyHoldersEffectiveDateTo = '#PolicyHoldersEffectiveDateTo#'</cfif>
					<cfif PolicyHoldersEffectiveDateTo_IN NEQ "">AND PolicyHoldersEffectiveDateTo IN(#trim(PolicyHoldersEffectiveDateTo_IN)#)</cfif>
					<cfif PolicyHoldersEffectiveDateTo_LIKE NEQ "">AND PolicyHoldersEffectiveDateTo LIKE '%#trim(PolicyHoldersEffectiveDateTo_LIKE)#%'</cfif>
					<cfif GroupNumber NEQ "">AND GroupNumber = '#GroupNumber#'</cfif>
					<cfif GroupNumber_IN NEQ "">AND GroupNumber IN(#trim(GroupNumber_IN)#)</cfif>
					<cfif GroupNumber_LIKE NEQ "">AND GroupNumber LIKE '%#trim(GroupNumber_LIKE)#%'</cfif>
					<cfif GroupName NEQ "">AND GroupName = '#GroupName#'</cfif>
					<cfif GroupName_IN NEQ "">AND GroupName IN(#trim(GroupName_IN)#)</cfif>
					<cfif GroupName_LIKE NEQ "">AND GroupName LIKE '%#trim(GroupName_LIKE)#%'</cfif>
					<cfif Deductible NEQ "" AND IsNumeric(Deductible)>AND Deductible = #Deductible#</cfif>
					<cfif Deductible_IN NEQ "">AND Deductible IN(#trim(Deductible_IN)#)</cfif>
					<cfif Deductible_LIKE NEQ "">AND Deductible LIKE '%#trim(Deductible_LIKE)#%'</cfif>
					<cfif PayPercentage NEQ "" AND IsNumeric(PayPercentage)>AND PayPercentage = #PayPercentage#</cfif>
					<cfif PayPercentage_IN NEQ "">AND PayPercentage IN(#trim(PayPercentage_IN)#)</cfif>
					<cfif PayPercentage_LIKE NEQ "">AND PayPercentage LIKE '%#trim(PayPercentage_LIKE)#%'</cfif>
					<cfif Relationship NEQ "" AND IsNumeric(Relationship)>AND Relationship = #Relationship#</cfif>
					<cfif Relationship_IN NEQ "">AND Relationship IN(#trim(Relationship_IN)#)</cfif>
					<cfif Relationship_LIKE NEQ "">AND Relationship LIKE '%#trim(Relationship_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getPatientInsuranceCompanyQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




