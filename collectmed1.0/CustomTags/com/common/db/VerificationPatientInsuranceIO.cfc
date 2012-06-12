<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- VerificationPatientInsuranceIO.cfc                                             --->
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
<!--- This tag is a CFC tag tied to the VerificationPatientInsurance table in the    --->
<!--- dB.                                                                            --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_VerificationPatientInsuranceTable                                --->  
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
<!--- VerificationPatientInsuranceID<br>                                             --->
<!--- usersID<br>                                                                    --->
<!--- picID<br>                                                                      --->
<!--- VerificationRepFName<br>                                                       --->
<!--- VerificationRepLName<br>                                                       --->
<!--- VerificationDate<br>                                                           --->
<!--- VerificationTime<br>                                                           --->
<!--- VerificationHaveIns<br>                                                        --->
<!--- VerificationHaveInsFromDate<br>                                                --->
<!--- VerificationHaveInsToDate<br>                                                  --->
<!--- VerificationHaveDMECov<br>                                                     --->
<!--- VerificationDeductible<br>                                                     --->
<!--- VerificationDeductibleAmount<br>                                               --->
<!--- VerificationDeductibleAmountMet<br>                                            --->
<!--- VerificationPPOPolicy<br>                                                      --->
<!--- VerificationPercentagePayAfterDeductible<br>                                   --->
<!--- VerificationPriorAuth<br>                                                      --->
<!--- VerificationAuthNumber<br>                                                     --->
<!--- VerificationLifetimeBenefitMet<br>                                             --->
<!--- VerificationAuthPhoneNumber<br>                                                --->
<!--- VerificationMedicareSupplement<br>                                             --->
<!--- VerificationCoordinateBenefits<br>                                             --->
<!--- VerificationPaidMedicareDeductible<br>                                         --->
<!--- VerificationMedicaidPlan<br>                                                   --->
<!--- VerificationTypeBasePlan<br>                                                   --->
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


<cfcomponent name="VerificationPatientInsuranceIO">

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
			variables.instance.VerificationPatientInsuranceID = "NULL";
			variables.instance.usersID = "NULL";
			variables.instance.picID = "NULL";
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
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONPATIENTINSURANCEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSID", 2)>
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
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PICID", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONREPFNAME", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONREPLNAME", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDATE", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONTIME", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINS", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSFROMDATE", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSTODATE", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEDMECOV", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDEDUCTIBLE", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDEDUCTIBLEAMOUNT", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDEDUCTIBLEAMOUNTMET", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONPPOPOLICY", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLE", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONPRIORAUTH", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONAUTHNUMBER", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONLIFETIMEBENEFITMET", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONAUTHPHONENUMBER", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONMEDICARESUPPLEMENT", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONCOORDINATEBENEFITS", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONPAIDMEDICAREDEDUCTIBLE", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONMEDICAIDPLAN", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONTYPEBASEPLAN", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 29)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationPatientInsuranceID.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPatientInsuranceID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationPatientInsuranceID>
	</cffunction>
	 
	<cffunction name="setVerificationPatientInsuranceID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationPatientInsuranceID" required="Yes" type="String">
		
		<cfif VerificationPatientInsuranceID NEQ "NULL">	
			
			<cfif arguments.VerificationPatientInsuranceID EQ "@@" OR arguments.VerificationPatientInsuranceID EQ "">
				
				<cfset arguments.VerificationPatientInsuranceID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(VerificationPatientInsuranceID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationPatientInsuranceID</strong> (#VerificationPatientInsuranceID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationPatientInsuranceID = arguments.VerificationPatientInsuranceID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for usersID.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersID>
	</cffunction>
	 
	<cffunction name="setUsersID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersID" required="Yes" type="String">
		
		<cfif UsersID NEQ "NULL">	
			
			<cfif arguments.usersID EQ "@@" OR arguments.usersID EQ "">
				
				<cfset arguments.usersID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersID</strong> (#UsersID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersID = arguments.UsersID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for picID.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPicID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PicID>
	</cffunction>
	 
	<cffunction name="setPicID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PicID" required="Yes" type="String">
		
		<cfif PicID NEQ "NULL">	
			
			<cfif arguments.picID EQ "@@" OR arguments.picID EQ "">
				
				<cfset arguments.picID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PicID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PicID</strong> (#PicID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PicID = arguments.PicID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PicID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationRepFName.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationRepFName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationRepFName>
	</cffunction>
	 
	<cffunction name="setVerificationRepFName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationRepFName" required="Yes" type="String">
		
		<cfif VerificationRepFName NEQ "NULL">	
			
			<cfif arguments.VerificationRepFName EQ "@@" OR arguments.VerificationRepFName EQ "">
				
				<cfset arguments.VerificationRepFName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationRepFName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationRepFName</strong> (#VerificationRepFName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationRepFName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationRepFName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationRepFName = arguments.VerificationRepFName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationRepFName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationRepLName.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationRepLName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationRepLName>
	</cffunction>
	 
	<cffunction name="setVerificationRepLName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationRepLName" required="Yes" type="String">
		
		<cfif VerificationRepLName NEQ "NULL">	
			
			<cfif arguments.VerificationRepLName EQ "@@" OR arguments.VerificationRepLName EQ "">
				
				<cfset arguments.VerificationRepLName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationRepLName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationRepLName</strong> (#VerificationRepLName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationRepLName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationRepLName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationRepLName = arguments.VerificationRepLName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationRepLName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationDate.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDate>
	</cffunction>
	 
	<cffunction name="setVerificationDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDate" required="Yes" type="String">
		
		<cfif VerificationDate NEQ "NULL" AND VerificationDate NEQ "NOW">	
			
			<cfif arguments.VerificationDate EQ "@@" OR arguments.VerificationDate EQ "">
				
				<cfset arguments.VerificationDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(VerificationDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDate</strong> (#VerificationDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationDate = arguments.VerificationDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationTime.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationTime" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationTime>
	</cffunction>
	 
	<cffunction name="setVerificationTime" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationTime" required="Yes" type="String">
		
		<cfif VerificationTime NEQ "NULL">	
			
			<cfif arguments.VerificationTime EQ "@@" OR arguments.VerificationTime EQ "">
				
				<cfset arguments.VerificationTime = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationTime)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationTime</strong> (#VerificationTime#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationTime) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationTime</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationTime = arguments.VerificationTime>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationTime")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationHaveIns.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveIns" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveIns>
	</cffunction>
	 
	<cffunction name="setVerificationHaveIns" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveIns" required="Yes" type="String">
		
		<cfif VerificationHaveIns NEQ "NULL">	
			
			<cfif arguments.VerificationHaveIns EQ "@@" OR arguments.VerificationHaveIns EQ "">
				
				<cfset arguments.VerificationHaveIns = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationHaveIns)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveIns</strong> (#VerificationHaveIns#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationHaveIns) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveIns</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveIns = arguments.VerificationHaveIns>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveIns")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationHaveInsFromDate.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsFromDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsFromDate>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsFromDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsFromDate" required="Yes" type="String">
		
		<cfif VerificationHaveInsFromDate NEQ "NULL" AND VerificationHaveInsFromDate NEQ "NOW">	
			
			<cfif arguments.VerificationHaveInsFromDate EQ "@@" OR arguments.VerificationHaveInsFromDate EQ "">
				
				<cfset arguments.VerificationHaveInsFromDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(VerificationHaveInsFromDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsFromDate</strong> (#VerificationHaveInsFromDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsFromDate = arguments.VerificationHaveInsFromDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsFromDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationHaveInsToDate.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsToDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsToDate>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsToDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsToDate" required="Yes" type="String">
		
		<cfif VerificationHaveInsToDate NEQ "NULL" AND VerificationHaveInsToDate NEQ "NOW">	
			
			<cfif arguments.VerificationHaveInsToDate EQ "@@" OR arguments.VerificationHaveInsToDate EQ "">
				
				<cfset arguments.VerificationHaveInsToDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(VerificationHaveInsToDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsToDate</strong> (#VerificationHaveInsToDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsToDate = arguments.VerificationHaveInsToDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsToDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationHaveDMECov.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveDMECov" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveDMECov>
	</cffunction>
	 
	<cffunction name="setVerificationHaveDMECov" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveDMECov" required="Yes" type="String">
		
		<cfif VerificationHaveDMECov NEQ "NULL">	
			
			<cfif arguments.VerificationHaveDMECov EQ "@@" OR arguments.VerificationHaveDMECov EQ "">
				
				<cfset arguments.VerificationHaveDMECov = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationHaveDMECov)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveDMECov</strong> (#VerificationHaveDMECov#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationHaveDMECov) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveDMECov</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveDMECov = arguments.VerificationHaveDMECov>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveDMECov")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationDeductible.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDeductible" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDeductible>
	</cffunction>
	 
	<cffunction name="setVerificationDeductible" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDeductible" required="Yes" type="String">
		
		<cfif VerificationDeductible NEQ "NULL">	
			
			<cfif arguments.VerificationDeductible EQ "@@" OR arguments.VerificationDeductible EQ "">
				
				<cfset arguments.VerificationDeductible = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationDeductible)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDeductible</strong> (#VerificationDeductible#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationDeductible) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationDeductible</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationDeductible = arguments.VerificationDeductible>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDeductible")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationDeductibleAmount.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDeductibleAmount" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDeductibleAmount>
	</cffunction>
	 
	<cffunction name="setVerificationDeductibleAmount" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDeductibleAmount" required="Yes" type="String">
		
		<cfif VerificationDeductibleAmount NEQ "NULL">	
			
			<cfif arguments.VerificationDeductibleAmount EQ "@@" OR arguments.VerificationDeductibleAmount EQ "">
				
				<cfset arguments.VerificationDeductibleAmount = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationDeductibleAmount)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDeductibleAmount</strong> (#VerificationDeductibleAmount#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationDeductibleAmount) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationDeductibleAmount</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationDeductibleAmount = arguments.VerificationDeductibleAmount>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDeductibleAmount")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationDeductibleAmountMet.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDeductibleAmountMet" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDeductibleAmountMet>
	</cffunction>
	 
	<cffunction name="setVerificationDeductibleAmountMet" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDeductibleAmountMet" required="Yes" type="String">
		
		<cfif VerificationDeductibleAmountMet NEQ "NULL">	
			
			<cfif arguments.VerificationDeductibleAmountMet EQ "@@" OR arguments.VerificationDeductibleAmountMet EQ "">
				
				<cfset arguments.VerificationDeductibleAmountMet = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationDeductibleAmountMet)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDeductibleAmountMet</strong> (#VerificationDeductibleAmountMet#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationDeductibleAmountMet) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationDeductibleAmountMet</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationDeductibleAmountMet = arguments.VerificationDeductibleAmountMet>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDeductibleAmountMet")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationPPOPolicy.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPPOPolicy" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationPPOPolicy>
	</cffunction>
	 
	<cffunction name="setVerificationPPOPolicy" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationPPOPolicy" required="Yes" type="String">
		
		<cfif VerificationPPOPolicy NEQ "NULL">	
			
			<cfif arguments.VerificationPPOPolicy EQ "@@" OR arguments.VerificationPPOPolicy EQ "">
				
				<cfset arguments.VerificationPPOPolicy = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationPPOPolicy)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationPPOPolicy</strong> (#VerificationPPOPolicy#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationPPOPolicy) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationPPOPolicy</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationPPOPolicy = arguments.VerificationPPOPolicy>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationPPOPolicy")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationPercentagePayAfterDeductible.               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPercentagePayAfterDeductible" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationPercentagePayAfterDeductible>
	</cffunction>
	 
	<cffunction name="setVerificationPercentagePayAfterDeductible" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationPercentagePayAfterDeductible" required="Yes" type="String">
		
		<cfif VerificationPercentagePayAfterDeductible NEQ "NULL">	
			
			<cfif arguments.VerificationPercentagePayAfterDeductible EQ "@@" OR arguments.VerificationPercentagePayAfterDeductible EQ "">
				
				<cfset arguments.VerificationPercentagePayAfterDeductible = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationPercentagePayAfterDeductible)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationPercentagePayAfterDeductible</strong> (#VerificationPercentagePayAfterDeductible#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationPercentagePayAfterDeductible) GT 3>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationPercentagePayAfterDeductible</strong> cannot be greater than 3 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationPercentagePayAfterDeductible = arguments.VerificationPercentagePayAfterDeductible>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationPercentagePayAfterDeductible")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationPriorAuth.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPriorAuth" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationPriorAuth>
	</cffunction>
	 
	<cffunction name="setVerificationPriorAuth" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationPriorAuth" required="Yes" type="String">
		
		<cfif VerificationPriorAuth NEQ "NULL">	
			
			<cfif arguments.VerificationPriorAuth EQ "@@" OR arguments.VerificationPriorAuth EQ "">
				
				<cfset arguments.VerificationPriorAuth = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationPriorAuth)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationPriorAuth</strong> (#VerificationPriorAuth#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationPriorAuth) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationPriorAuth</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationPriorAuth = arguments.VerificationPriorAuth>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationPriorAuth")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationAuthNumber.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationAuthNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationAuthNumber>
	</cffunction>
	 
	<cffunction name="setVerificationAuthNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationAuthNumber" required="Yes" type="String">
		
		<cfif VerificationAuthNumber NEQ "NULL">	
			
			<cfif arguments.VerificationAuthNumber EQ "@@" OR arguments.VerificationAuthNumber EQ "">
				
				<cfset arguments.VerificationAuthNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationAuthNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationAuthNumber</strong> (#VerificationAuthNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationAuthNumber) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationAuthNumber</strong> cannot be greater than 25 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationAuthNumber = arguments.VerificationAuthNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationAuthNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationLifetimeBenefitMet.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationLifetimeBenefitMet" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationLifetimeBenefitMet>
	</cffunction>
	 
	<cffunction name="setVerificationLifetimeBenefitMet" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationLifetimeBenefitMet" required="Yes" type="String">
		
		<cfif VerificationLifetimeBenefitMet NEQ "NULL">	
			
			<cfif arguments.VerificationLifetimeBenefitMet EQ "@@" OR arguments.VerificationLifetimeBenefitMet EQ "">
				
				<cfset arguments.VerificationLifetimeBenefitMet = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationLifetimeBenefitMet)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationLifetimeBenefitMet</strong> (#VerificationLifetimeBenefitMet#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationLifetimeBenefitMet) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationLifetimeBenefitMet</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationLifetimeBenefitMet = arguments.VerificationLifetimeBenefitMet>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationLifetimeBenefitMet")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationAuthPhoneNumber.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationAuthPhoneNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationAuthPhoneNumber>
	</cffunction>
	 
	<cffunction name="setVerificationAuthPhoneNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationAuthPhoneNumber" required="Yes" type="String">
		
		<cfif VerificationAuthPhoneNumber NEQ "NULL">	
			
			<cfif arguments.VerificationAuthPhoneNumber EQ "@@" OR arguments.VerificationAuthPhoneNumber EQ "">
				
				<cfset arguments.VerificationAuthPhoneNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationAuthPhoneNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationAuthPhoneNumber</strong> (#VerificationAuthPhoneNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationAuthPhoneNumber) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationAuthPhoneNumber</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationAuthPhoneNumber = arguments.VerificationAuthPhoneNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationAuthPhoneNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationMedicareSupplement.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationMedicareSupplement" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationMedicareSupplement>
	</cffunction>
	 
	<cffunction name="setVerificationMedicareSupplement" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationMedicareSupplement" required="Yes" type="String">
		
		<cfif VerificationMedicareSupplement NEQ "NULL">	
			
			<cfif arguments.VerificationMedicareSupplement EQ "@@" OR arguments.VerificationMedicareSupplement EQ "">
				
				<cfset arguments.VerificationMedicareSupplement = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationMedicareSupplement)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationMedicareSupplement</strong> (#VerificationMedicareSupplement#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationMedicareSupplement) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationMedicareSupplement</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationMedicareSupplement = arguments.VerificationMedicareSupplement>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationMedicareSupplement")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationCoordinateBenefits.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationCoordinateBenefits" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationCoordinateBenefits>
	</cffunction>
	 
	<cffunction name="setVerificationCoordinateBenefits" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationCoordinateBenefits" required="Yes" type="String">
		
		<cfif VerificationCoordinateBenefits NEQ "NULL">	
			
			<cfif arguments.VerificationCoordinateBenefits EQ "@@" OR arguments.VerificationCoordinateBenefits EQ "">
				
				<cfset arguments.VerificationCoordinateBenefits = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationCoordinateBenefits)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationCoordinateBenefits</strong> (#VerificationCoordinateBenefits#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationCoordinateBenefits) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationCoordinateBenefits</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationCoordinateBenefits = arguments.VerificationCoordinateBenefits>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationCoordinateBenefits")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationPaidMedicareDeductible.                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPaidMedicareDeductible" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationPaidMedicareDeductible>
	</cffunction>
	 
	<cffunction name="setVerificationPaidMedicareDeductible" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationPaidMedicareDeductible" required="Yes" type="String">
		
		<cfif VerificationPaidMedicareDeductible NEQ "NULL">	
			
			<cfif arguments.VerificationPaidMedicareDeductible EQ "@@" OR arguments.VerificationPaidMedicareDeductible EQ "">
				
				<cfset arguments.VerificationPaidMedicareDeductible = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationPaidMedicareDeductible)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationPaidMedicareDeductible</strong> (#VerificationPaidMedicareDeductible#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationPaidMedicareDeductible) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationPaidMedicareDeductible</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationPaidMedicareDeductible = arguments.VerificationPaidMedicareDeductible>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationPaidMedicareDeductible")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationMedicaidPlan.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationMedicaidPlan" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationMedicaidPlan>
	</cffunction>
	 
	<cffunction name="setVerificationMedicaidPlan" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationMedicaidPlan" required="Yes" type="String">
		
		<cfif VerificationMedicaidPlan NEQ "NULL">	
			
			<cfif arguments.VerificationMedicaidPlan EQ "@@" OR arguments.VerificationMedicaidPlan EQ "">
				
				<cfset arguments.VerificationMedicaidPlan = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(VerificationMedicaidPlan)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationMedicaidPlan</strong> (#VerificationMedicaidPlan#) is not of type <strong>char</strong>.">	
			<cfelseif len(VerificationMedicaidPlan) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationMedicaidPlan</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationMedicaidPlan = arguments.VerificationMedicaidPlan>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationMedicaidPlan")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationTypeBasePlan.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationTypeBasePlan" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationTypeBasePlan>
	</cffunction>
	 
	<cffunction name="setVerificationTypeBasePlan" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationTypeBasePlan" required="Yes" type="String">
		
		<cfif VerificationTypeBasePlan NEQ "NULL">	
			
			<cfif arguments.VerificationTypeBasePlan EQ "@@" OR arguments.VerificationTypeBasePlan EQ "">
				
				<cfset arguments.VerificationTypeBasePlan = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(VerificationTypeBasePlan)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationTypeBasePlan</strong> (#VerificationTypeBasePlan#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationTypeBasePlan) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationTypeBasePlan</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.VerificationTypeBasePlan = arguments.VerificationTypeBasePlan>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationTypeBasePlan")>			
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

		<cfargument name="usersID" required="No" type="String" default="">
		<cfargument name="picID" required="No" type="String" default="">
		<cfargument name="VerificationRepFName" required="No" type="String" default="">
		<cfargument name="VerificationRepLName" required="No" type="String" default="">
		<cfargument name="VerificationDate" required="No" type="String" default="">
		<cfargument name="VerificationTime" required="No" type="String" default="">
		<cfargument name="VerificationHaveIns" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsFromDate" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsToDate" required="No" type="String" default="">
		<cfargument name="VerificationHaveDMECov" required="No" type="String" default="">
		<cfargument name="VerificationDeductible" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmount" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmountMet" required="No" type="String" default="">
		<cfargument name="VerificationPPOPolicy" required="No" type="String" default="">
		<cfargument name="VerificationPercentagePayAfterDeductible" required="No" type="String" default="">
		<cfargument name="VerificationPriorAuth" required="No" type="String" default="">
		<cfargument name="VerificationAuthNumber" required="No" type="String" default="">
		<cfargument name="VerificationLifetimeBenefitMet" required="No" type="String" default="">
		<cfargument name="VerificationAuthPhoneNumber" required="No" type="String" default="">
		<cfargument name="VerificationMedicareSupplement" required="No" type="String" default="">
		<cfargument name="VerificationCoordinateBenefits" required="No" type="String" default="">
		<cfargument name="VerificationPaidMedicareDeductible" required="No" type="String" default="">
		<cfargument name="VerificationMedicaidPlan" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlan" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.usersID = arguments.usersID>
		<cfset variables.instance.picID = arguments.picID>
		<cfset variables.instance.VerificationRepFName = arguments.VerificationRepFName>
		<cfset variables.instance.VerificationRepLName = arguments.VerificationRepLName>
		<cfset variables.instance.VerificationDate = arguments.VerificationDate>
		<cfset variables.instance.VerificationTime = arguments.VerificationTime>
		<cfset variables.instance.VerificationHaveIns = arguments.VerificationHaveIns>
		<cfset variables.instance.VerificationHaveInsFromDate = arguments.VerificationHaveInsFromDate>
		<cfset variables.instance.VerificationHaveInsToDate = arguments.VerificationHaveInsToDate>
		<cfset variables.instance.VerificationHaveDMECov = arguments.VerificationHaveDMECov>
		<cfset variables.instance.VerificationDeductible = arguments.VerificationDeductible>
		<cfset variables.instance.VerificationDeductibleAmount = arguments.VerificationDeductibleAmount>
		<cfset variables.instance.VerificationDeductibleAmountMet = arguments.VerificationDeductibleAmountMet>
		<cfset variables.instance.VerificationPPOPolicy = arguments.VerificationPPOPolicy>
		<cfset variables.instance.VerificationPercentagePayAfterDeductible = arguments.VerificationPercentagePayAfterDeductible>
		<cfset variables.instance.VerificationPriorAuth = arguments.VerificationPriorAuth>
		<cfset variables.instance.VerificationAuthNumber = arguments.VerificationAuthNumber>
		<cfset variables.instance.VerificationLifetimeBenefitMet = arguments.VerificationLifetimeBenefitMet>
		<cfset variables.instance.VerificationAuthPhoneNumber = arguments.VerificationAuthPhoneNumber>
		<cfset variables.instance.VerificationMedicareSupplement = arguments.VerificationMedicareSupplement>
		<cfset variables.instance.VerificationCoordinateBenefits = arguments.VerificationCoordinateBenefits>
		<cfset variables.instance.VerificationPaidMedicareDeductible = arguments.VerificationPaidMedicareDeductible>
		<cfset variables.instance.VerificationMedicaidPlan = arguments.VerificationMedicaidPlan>
		<cfset variables.instance.VerificationTypeBasePlan = arguments.VerificationTypeBasePlan>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="VerificationPatientInsuranceIO" output="No">
		
		<cfargument name="VerificationPatientInsuranceID" required="yes" type="numeric">		
		<cfset var qGetVerificationPatientInsurance = "">
		
		<cfset preInit(VerificationPatientInsuranceID)>
	
		<cfquery name="qGetVerificationPatientInsurance" datasource="#trim(request.datasource)#">
	  		SELECT VerificationPatientInsuranceID,usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified
			FROM verificationpatientinsurance  
			WHERE VerificationPatientInsuranceID = #trim(arguments.VerificationPatientInsuranceID)# 
		</cfquery>
		
		<cfif qGetVerificationPatientInsurance.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetVerificationPatientInsurance.VerificationPatientInsuranceID EQ "" OR qGetVerificationPatientInsurance.VerificationPatientInsuranceID EQ "NULL") 
				variables.instance.VerificationPatientInsuranceID = "NULL"; 
			ELSE 
				variables.instance.VerificationPatientInsuranceID = qGetVerificationPatientInsurance.VerificationPatientInsuranceID;
				
			IF(qGetVerificationPatientInsurance.usersID EQ "" OR qGetVerificationPatientInsurance.usersID EQ "NULL") 
				variables.instance.usersID = "NULL"; 
			ELSE 
				variables.instance.usersID = qGetVerificationPatientInsurance.usersID;
				
			IF(qGetVerificationPatientInsurance.picID EQ "" OR qGetVerificationPatientInsurance.picID EQ "NULL") 
				variables.instance.picID = "NULL"; 
			ELSE 
				variables.instance.picID = qGetVerificationPatientInsurance.picID;
							
				variables.instance.VerificationRepFName = qGetVerificationPatientInsurance.VerificationRepFName;
							
				variables.instance.VerificationRepLName = qGetVerificationPatientInsurance.VerificationRepLName;
							
				variables.instance.VerificationDate = qGetVerificationPatientInsurance.VerificationDate;
							
				variables.instance.VerificationTime = qGetVerificationPatientInsurance.VerificationTime;
							
				variables.instance.VerificationHaveIns = qGetVerificationPatientInsurance.VerificationHaveIns;
							
				variables.instance.VerificationHaveInsFromDate = qGetVerificationPatientInsurance.VerificationHaveInsFromDate;
							
				variables.instance.VerificationHaveInsToDate = qGetVerificationPatientInsurance.VerificationHaveInsToDate;
							
				variables.instance.VerificationHaveDMECov = qGetVerificationPatientInsurance.VerificationHaveDMECov;
							
				variables.instance.VerificationDeductible = qGetVerificationPatientInsurance.VerificationDeductible;
							
				variables.instance.VerificationDeductibleAmount = qGetVerificationPatientInsurance.VerificationDeductibleAmount;
							
				variables.instance.VerificationDeductibleAmountMet = qGetVerificationPatientInsurance.VerificationDeductibleAmountMet;
							
				variables.instance.VerificationPPOPolicy = qGetVerificationPatientInsurance.VerificationPPOPolicy;
							
				variables.instance.VerificationPercentagePayAfterDeductible = qGetVerificationPatientInsurance.VerificationPercentagePayAfterDeductible;
							
				variables.instance.VerificationPriorAuth = qGetVerificationPatientInsurance.VerificationPriorAuth;
							
				variables.instance.VerificationAuthNumber = qGetVerificationPatientInsurance.VerificationAuthNumber;
							
				variables.instance.VerificationLifetimeBenefitMet = qGetVerificationPatientInsurance.VerificationLifetimeBenefitMet;
							
				variables.instance.VerificationAuthPhoneNumber = qGetVerificationPatientInsurance.VerificationAuthPhoneNumber;
							
				variables.instance.VerificationMedicareSupplement = qGetVerificationPatientInsurance.VerificationMedicareSupplement;
							
				variables.instance.VerificationCoordinateBenefits = qGetVerificationPatientInsurance.VerificationCoordinateBenefits;
							
				variables.instance.VerificationPaidMedicareDeductible = qGetVerificationPatientInsurance.VerificationPaidMedicareDeductible;
							
				variables.instance.VerificationMedicaidPlan = qGetVerificationPatientInsurance.VerificationMedicaidPlan;
							
				variables.instance.VerificationTypeBasePlan = qGetVerificationPatientInsurance.VerificationTypeBasePlan;
							
				variables.instance.Active = qGetVerificationPatientInsurance.Active;
				
			IF(qGetVerificationPatientInsurance.InactiveCode EQ "" OR qGetVerificationPatientInsurance.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetVerificationPatientInsurance.InactiveCode;
							
				variables.instance.DateCreated = qGetVerificationPatientInsurance.DateCreated;
							
				variables.instance.DateModified = qGetVerificationPatientInsurance.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(VerificationPatientInsuranceID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitVerificationPatientInsurance = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.VerificationPatientInsuranceID) AND variables.instance.VerificationPatientInsuranceID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitVerificationPatientInsurance" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitVerificationPatientInsurance" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.VerificationPatientInsuranceID = qInsertCommitVerificationPatientInsurance.VerificationPatientInsuranceID>
				
				<cfreturn qInsertCommitVerificationPatientInsurance.VerificationPatientInsuranceID>
			
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
			<cfset tableColumns = "VerificationPatientInsuranceID,usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "VerificationRepFName,VerificationRepLName,VerificationTime,VerificationHaveIns,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "VerificationDate,VerificationHaveInsFromDate,VerificationHaveInsToDate,DateCreated,DateModified">

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
				<cfset sqlStatement = "UPDATE verificationpatientinsurance  SET #columnsToUpdate# WHERE VerificationPatientInsuranceID = #trim(variables.instance.VerificationPatientInsuranceID)#">
				
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
			<cfset stringTableColumns = "VerificationRepFName,VerificationRepLName,VerificationTime,VerificationHaveIns,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "VerificationDate,VerificationHaveInsFromDate,VerificationHaveInsToDate,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO verificationpatientinsurance  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS VerificationPatientInsuranceID ">
				
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
	<cffunction name="getVerificationPatientInsuranceQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getVerificationPatientInsuranceQuery">						
		<cfargument name="Fields" required="No" type="String" default="VerificationPatientInsuranceID,usersID,picID,VerificationRepFName,VerificationRepLName,VerificationDate,VerificationTime,VerificationHaveIns,VerificationHaveInsFromDate,VerificationHaveInsToDate,VerificationHaveDMECov,VerificationDeductible,VerificationDeductibleAmount,VerificationDeductibleAmountMet,VerificationPPOPolicy,VerificationPercentagePayAfterDeductible,VerificationPriorAuth,VerificationAuthNumber,VerificationLifetimeBenefitMet,VerificationAuthPhoneNumber,VerificationMedicareSupplement,VerificationCoordinateBenefits,VerificationPaidMedicareDeductible,VerificationMedicaidPlan,VerificationTypeBasePlan,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="VerificationPatientInsuranceID" required="No" type="String" default="">
		<cfargument name="VerificationPatientInsuranceID_IN" required="No" type="String" default="">
		<cfargument name="VerificationPatientInsuranceID_LIKE" required="No" type="String" default="">
		<cfargument name="usersID" required="No" type="String" default="">
		<cfargument name="usersID_IN" required="No" type="String" default="">
		<cfargument name="usersID_LIKE" required="No" type="String" default="">
		<cfargument name="picID" required="No" type="String" default="">
		<cfargument name="picID_IN" required="No" type="String" default="">
		<cfargument name="picID_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationRepFName" required="No" type="String" default="">
		<cfargument name="VerificationRepFName_IN" required="No" type="String" default="">
		<cfargument name="VerificationRepFName_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationRepLName" required="No" type="String" default="">
		<cfargument name="VerificationRepLName_IN" required="No" type="String" default="">
		<cfargument name="VerificationRepLName_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationDate" required="No" type="String" default="">
		<cfargument name="VerificationDate_IN" required="No" type="String" default="">
		<cfargument name="VerificationDate_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationTime" required="No" type="String" default="">
		<cfargument name="VerificationTime_IN" required="No" type="String" default="">
		<cfargument name="VerificationTime_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationHaveIns" required="No" type="String" default="">
		<cfargument name="VerificationHaveIns_IN" required="No" type="String" default="">
		<cfargument name="VerificationHaveIns_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsFromDate" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsFromDate_IN" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsFromDate_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsToDate" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsToDate_IN" required="No" type="String" default="">
		<cfargument name="VerificationHaveInsToDate_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationHaveDMECov" required="No" type="String" default="">
		<cfargument name="VerificationHaveDMECov_IN" required="No" type="String" default="">
		<cfargument name="VerificationHaveDMECov_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationDeductible" required="No" type="String" default="">
		<cfargument name="VerificationDeductible_IN" required="No" type="String" default="">
		<cfargument name="VerificationDeductible_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmount" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmount_IN" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmount_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmountMet" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmountMet_IN" required="No" type="String" default="">
		<cfargument name="VerificationDeductibleAmountMet_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationPPOPolicy" required="No" type="String" default="">
		<cfargument name="VerificationPPOPolicy_IN" required="No" type="String" default="">
		<cfargument name="VerificationPPOPolicy_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationPercentagePayAfterDeductible" required="No" type="String" default="">
		<cfargument name="VerificationPercentagePayAfterDeductible_IN" required="No" type="String" default="">
		<cfargument name="VerificationPercentagePayAfterDeductible_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationPriorAuth" required="No" type="String" default="">
		<cfargument name="VerificationPriorAuth_IN" required="No" type="String" default="">
		<cfargument name="VerificationPriorAuth_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationAuthNumber" required="No" type="String" default="">
		<cfargument name="VerificationAuthNumber_IN" required="No" type="String" default="">
		<cfargument name="VerificationAuthNumber_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationLifetimeBenefitMet" required="No" type="String" default="">
		<cfargument name="VerificationLifetimeBenefitMet_IN" required="No" type="String" default="">
		<cfargument name="VerificationLifetimeBenefitMet_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationAuthPhoneNumber" required="No" type="String" default="">
		<cfargument name="VerificationAuthPhoneNumber_IN" required="No" type="String" default="">
		<cfargument name="VerificationAuthPhoneNumber_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationMedicareSupplement" required="No" type="String" default="">
		<cfargument name="VerificationMedicareSupplement_IN" required="No" type="String" default="">
		<cfargument name="VerificationMedicareSupplement_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationCoordinateBenefits" required="No" type="String" default="">
		<cfargument name="VerificationCoordinateBenefits_IN" required="No" type="String" default="">
		<cfargument name="VerificationCoordinateBenefits_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationPaidMedicareDeductible" required="No" type="String" default="">
		<cfargument name="VerificationPaidMedicareDeductible_IN" required="No" type="String" default="">
		<cfargument name="VerificationPaidMedicareDeductible_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationMedicaidPlan" required="No" type="String" default="">
		<cfargument name="VerificationMedicaidPlan_IN" required="No" type="String" default="">
		<cfargument name="VerificationMedicaidPlan_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlan" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlan_IN" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlan_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "VerificationPatientInsuranceID,VerificationPatientInsuranceID_IN,VerificationPatientInsuranceID_LIKE,usersID,usersID_IN,usersID_LIKE,picID,picID_IN,picID_LIKE,VerificationRepFName,VerificationRepFName_IN,VerificationRepFName_LIKE,VerificationRepLName,VerificationRepLName_IN,VerificationRepLName_LIKE,VerificationDate,VerificationDate_IN,VerificationDate_LIKE,VerificationTime,VerificationTime_IN,VerificationTime_LIKE,VerificationHaveIns,VerificationHaveIns_IN,VerificationHaveIns_LIKE,VerificationHaveInsFromDate,VerificationHaveInsFromDate_IN,VerificationHaveInsFromDate_LIKE,VerificationHaveInsToDate,VerificationHaveInsToDate_IN,VerificationHaveInsToDate_LIKE,VerificationHaveDMECov,VerificationHaveDMECov_IN,VerificationHaveDMECov_LIKE,VerificationDeductible,VerificationDeductible_IN,VerificationDeductible_LIKE,VerificationDeductibleAmount,VerificationDeductibleAmount_IN,VerificationDeductibleAmount_LIKE,VerificationDeductibleAmountMet,VerificationDeductibleAmountMet_IN,VerificationDeductibleAmountMet_LIKE,VerificationPPOPolicy,VerificationPPOPolicy_IN,VerificationPPOPolicy_LIKE,VerificationPercentagePayAfterDeductible,VerificationPercentagePayAfterDeductible_IN,VerificationPercentagePayAfterDeductible_LIKE,VerificationPriorAuth,VerificationPriorAuth_IN,VerificationPriorAuth_LIKE,VerificationAuthNumber,VerificationAuthNumber_IN,VerificationAuthNumber_LIKE,VerificationLifetimeBenefitMet,VerificationLifetimeBenefitMet_IN,VerificationLifetimeBenefitMet_LIKE,VerificationAuthPhoneNumber,VerificationAuthPhoneNumber_IN,VerificationAuthPhoneNumber_LIKE,VerificationMedicareSupplement,VerificationMedicareSupplement_IN,VerificationMedicareSupplement_LIKE,VerificationCoordinateBenefits,VerificationCoordinateBenefits_IN,VerificationCoordinateBenefits_LIKE,VerificationPaidMedicareDeductible,VerificationPaidMedicareDeductible_IN,VerificationPaidMedicareDeductible_LIKE,VerificationMedicaidPlan,VerificationMedicaidPlan_IN,VerificationMedicaidPlan_LIKE,VerificationTypeBasePlan,VerificationTypeBasePlan_IN,VerificationTypeBasePlan_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="VerificationPatientInsurance"
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
			<cfquery Name="getVerificationPatientInsuranceQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM verificationpatientinsurance   
				WHERE 1=1
					<cfif VerificationPatientInsuranceID NEQ "" AND IsNumeric(VerificationPatientInsuranceID)>AND VerificationPatientInsuranceID = #VerificationPatientInsuranceID#</cfif>
					<cfif VerificationPatientInsuranceID_IN NEQ "">AND VerificationPatientInsuranceID IN(#trim(VerificationPatientInsuranceID_IN)#)</cfif>
					<cfif VerificationPatientInsuranceID_LIKE NEQ "">AND VerificationPatientInsuranceID LIKE '%#trim(VerificationPatientInsuranceID_LIKE)#%'</cfif>
					<cfif usersID NEQ "" AND IsNumeric(usersID)>AND usersID = #usersID#</cfif>
					<cfif usersID_IN NEQ "">AND usersID IN(#trim(usersID_IN)#)</cfif>
					<cfif usersID_LIKE NEQ "">AND usersID LIKE '%#trim(usersID_LIKE)#%'</cfif>
					<cfif picID NEQ "" AND IsNumeric(picID)>AND picID = #picID#</cfif>
					<cfif picID_IN NEQ "">AND picID IN(#trim(picID_IN)#)</cfif>
					<cfif picID_LIKE NEQ "">AND picID LIKE '%#trim(picID_LIKE)#%'</cfif>
					<cfif VerificationRepFName NEQ "">AND VerificationRepFName = '#VerificationRepFName#'</cfif>
					<cfif VerificationRepFName_IN NEQ "">AND VerificationRepFName IN(#trim(VerificationRepFName_IN)#)</cfif>
					<cfif VerificationRepFName_LIKE NEQ "">AND VerificationRepFName LIKE '%#trim(VerificationRepFName_LIKE)#%'</cfif>
					<cfif VerificationRepLName NEQ "">AND VerificationRepLName = '#VerificationRepLName#'</cfif>
					<cfif VerificationRepLName_IN NEQ "">AND VerificationRepLName IN(#trim(VerificationRepLName_IN)#)</cfif>
					<cfif VerificationRepLName_LIKE NEQ "">AND VerificationRepLName LIKE '%#trim(VerificationRepLName_LIKE)#%'</cfif>
					<cfif VerificationDate NEQ "">AND VerificationDate = '#VerificationDate#'</cfif>
					<cfif VerificationDate_IN NEQ "">AND VerificationDate IN(#trim(VerificationDate_IN)#)</cfif>
					<cfif VerificationDate_LIKE NEQ "">AND VerificationDate LIKE '%#trim(VerificationDate_LIKE)#%'</cfif>
					<cfif VerificationTime NEQ "">AND VerificationTime = '#VerificationTime#'</cfif>
					<cfif VerificationTime_IN NEQ "">AND VerificationTime IN(#trim(VerificationTime_IN)#)</cfif>
					<cfif VerificationTime_LIKE NEQ "">AND VerificationTime LIKE '%#trim(VerificationTime_LIKE)#%'</cfif>
					<cfif VerificationHaveIns NEQ "">AND VerificationHaveIns = '#VerificationHaveIns#'</cfif>
					<cfif VerificationHaveIns_IN NEQ "">AND VerificationHaveIns IN(#trim(VerificationHaveIns_IN)#)</cfif>
					<cfif VerificationHaveIns_LIKE NEQ "">AND VerificationHaveIns LIKE '%#trim(VerificationHaveIns_LIKE)#%'</cfif>
					<cfif VerificationHaveInsFromDate NEQ "">AND VerificationHaveInsFromDate = '#VerificationHaveInsFromDate#'</cfif>
					<cfif VerificationHaveInsFromDate_IN NEQ "">AND VerificationHaveInsFromDate IN(#trim(VerificationHaveInsFromDate_IN)#)</cfif>
					<cfif VerificationHaveInsFromDate_LIKE NEQ "">AND VerificationHaveInsFromDate LIKE '%#trim(VerificationHaveInsFromDate_LIKE)#%'</cfif>
					<cfif VerificationHaveInsToDate NEQ "">AND VerificationHaveInsToDate = '#VerificationHaveInsToDate#'</cfif>
					<cfif VerificationHaveInsToDate_IN NEQ "">AND VerificationHaveInsToDate IN(#trim(VerificationHaveInsToDate_IN)#)</cfif>
					<cfif VerificationHaveInsToDate_LIKE NEQ "">AND VerificationHaveInsToDate LIKE '%#trim(VerificationHaveInsToDate_LIKE)#%'</cfif>
					<cfif VerificationHaveDMECov NEQ "">AND VerificationHaveDMECov = '#VerificationHaveDMECov#'</cfif>
					<cfif VerificationHaveDMECov_IN NEQ "">AND VerificationHaveDMECov IN(#trim(VerificationHaveDMECov_IN)#)</cfif>
					<cfif VerificationHaveDMECov_LIKE NEQ "">AND VerificationHaveDMECov LIKE '%#trim(VerificationHaveDMECov_LIKE)#%'</cfif>
					<cfif VerificationDeductible NEQ "">AND VerificationDeductible = '#VerificationDeductible#'</cfif>
					<cfif VerificationDeductible_IN NEQ "">AND VerificationDeductible IN(#trim(VerificationDeductible_IN)#)</cfif>
					<cfif VerificationDeductible_LIKE NEQ "">AND VerificationDeductible LIKE '%#trim(VerificationDeductible_LIKE)#%'</cfif>
					<cfif VerificationDeductibleAmount NEQ "">AND VerificationDeductibleAmount = '#VerificationDeductibleAmount#'</cfif>
					<cfif VerificationDeductibleAmount_IN NEQ "">AND VerificationDeductibleAmount IN(#trim(VerificationDeductibleAmount_IN)#)</cfif>
					<cfif VerificationDeductibleAmount_LIKE NEQ "">AND VerificationDeductibleAmount LIKE '%#trim(VerificationDeductibleAmount_LIKE)#%'</cfif>
					<cfif VerificationDeductibleAmountMet NEQ "">AND VerificationDeductibleAmountMet = '#VerificationDeductibleAmountMet#'</cfif>
					<cfif VerificationDeductibleAmountMet_IN NEQ "">AND VerificationDeductibleAmountMet IN(#trim(VerificationDeductibleAmountMet_IN)#)</cfif>
					<cfif VerificationDeductibleAmountMet_LIKE NEQ "">AND VerificationDeductibleAmountMet LIKE '%#trim(VerificationDeductibleAmountMet_LIKE)#%'</cfif>
					<cfif VerificationPPOPolicy NEQ "">AND VerificationPPOPolicy = '#VerificationPPOPolicy#'</cfif>
					<cfif VerificationPPOPolicy_IN NEQ "">AND VerificationPPOPolicy IN(#trim(VerificationPPOPolicy_IN)#)</cfif>
					<cfif VerificationPPOPolicy_LIKE NEQ "">AND VerificationPPOPolicy LIKE '%#trim(VerificationPPOPolicy_LIKE)#%'</cfif>
					<cfif VerificationPercentagePayAfterDeductible NEQ "">AND VerificationPercentagePayAfterDeductible = '#VerificationPercentagePayAfterDeductible#'</cfif>
					<cfif VerificationPercentagePayAfterDeductible_IN NEQ "">AND VerificationPercentagePayAfterDeductible IN(#trim(VerificationPercentagePayAfterDeductible_IN)#)</cfif>
					<cfif VerificationPercentagePayAfterDeductible_LIKE NEQ "">AND VerificationPercentagePayAfterDeductible LIKE '%#trim(VerificationPercentagePayAfterDeductible_LIKE)#%'</cfif>
					<cfif VerificationPriorAuth NEQ "">AND VerificationPriorAuth = '#VerificationPriorAuth#'</cfif>
					<cfif VerificationPriorAuth_IN NEQ "">AND VerificationPriorAuth IN(#trim(VerificationPriorAuth_IN)#)</cfif>
					<cfif VerificationPriorAuth_LIKE NEQ "">AND VerificationPriorAuth LIKE '%#trim(VerificationPriorAuth_LIKE)#%'</cfif>
					<cfif VerificationAuthNumber NEQ "">AND VerificationAuthNumber = '#VerificationAuthNumber#'</cfif>
					<cfif VerificationAuthNumber_IN NEQ "">AND VerificationAuthNumber IN(#trim(VerificationAuthNumber_IN)#)</cfif>
					<cfif VerificationAuthNumber_LIKE NEQ "">AND VerificationAuthNumber LIKE '%#trim(VerificationAuthNumber_LIKE)#%'</cfif>
					<cfif VerificationLifetimeBenefitMet NEQ "">AND VerificationLifetimeBenefitMet = '#VerificationLifetimeBenefitMet#'</cfif>
					<cfif VerificationLifetimeBenefitMet_IN NEQ "">AND VerificationLifetimeBenefitMet IN(#trim(VerificationLifetimeBenefitMet_IN)#)</cfif>
					<cfif VerificationLifetimeBenefitMet_LIKE NEQ "">AND VerificationLifetimeBenefitMet LIKE '%#trim(VerificationLifetimeBenefitMet_LIKE)#%'</cfif>
					<cfif VerificationAuthPhoneNumber NEQ "">AND VerificationAuthPhoneNumber = '#VerificationAuthPhoneNumber#'</cfif>
					<cfif VerificationAuthPhoneNumber_IN NEQ "">AND VerificationAuthPhoneNumber IN(#trim(VerificationAuthPhoneNumber_IN)#)</cfif>
					<cfif VerificationAuthPhoneNumber_LIKE NEQ "">AND VerificationAuthPhoneNumber LIKE '%#trim(VerificationAuthPhoneNumber_LIKE)#%'</cfif>
					<cfif VerificationMedicareSupplement NEQ "">AND VerificationMedicareSupplement = '#VerificationMedicareSupplement#'</cfif>
					<cfif VerificationMedicareSupplement_IN NEQ "">AND VerificationMedicareSupplement IN(#trim(VerificationMedicareSupplement_IN)#)</cfif>
					<cfif VerificationMedicareSupplement_LIKE NEQ "">AND VerificationMedicareSupplement LIKE '%#trim(VerificationMedicareSupplement_LIKE)#%'</cfif>
					<cfif VerificationCoordinateBenefits NEQ "">AND VerificationCoordinateBenefits = '#VerificationCoordinateBenefits#'</cfif>
					<cfif VerificationCoordinateBenefits_IN NEQ "">AND VerificationCoordinateBenefits IN(#trim(VerificationCoordinateBenefits_IN)#)</cfif>
					<cfif VerificationCoordinateBenefits_LIKE NEQ "">AND VerificationCoordinateBenefits LIKE '%#trim(VerificationCoordinateBenefits_LIKE)#%'</cfif>
					<cfif VerificationPaidMedicareDeductible NEQ "">AND VerificationPaidMedicareDeductible = '#VerificationPaidMedicareDeductible#'</cfif>
					<cfif VerificationPaidMedicareDeductible_IN NEQ "">AND VerificationPaidMedicareDeductible IN(#trim(VerificationPaidMedicareDeductible_IN)#)</cfif>
					<cfif VerificationPaidMedicareDeductible_LIKE NEQ "">AND VerificationPaidMedicareDeductible LIKE '%#trim(VerificationPaidMedicareDeductible_LIKE)#%'</cfif>
					<cfif VerificationMedicaidPlan NEQ "">AND VerificationMedicaidPlan = '#VerificationMedicaidPlan#'</cfif>
					<cfif VerificationMedicaidPlan_IN NEQ "">AND VerificationMedicaidPlan IN(#trim(VerificationMedicaidPlan_IN)#)</cfif>
					<cfif VerificationMedicaidPlan_LIKE NEQ "">AND VerificationMedicaidPlan LIKE '%#trim(VerificationMedicaidPlan_LIKE)#%'</cfif>
					<cfif VerificationTypeBasePlan NEQ "">AND VerificationTypeBasePlan = '#VerificationTypeBasePlan#'</cfif>
					<cfif VerificationTypeBasePlan_IN NEQ "">AND VerificationTypeBasePlan IN(#trim(VerificationTypeBasePlan_IN)#)</cfif>
					<cfif VerificationTypeBasePlan_LIKE NEQ "">AND VerificationTypeBasePlan LIKE '%#trim(VerificationTypeBasePlan_LIKE)#%'</cfif>
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
			
			<cfreturn getVerificationPatientInsuranceQuery>
		
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




