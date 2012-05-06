<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- QuoteIO.cfc                                                                    --->
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
<!--- This tag is a CFC tag tied to the Quote table in the dB.                       --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_QuoteTable                                                       --->  
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
<!--- QuoteID<br>                                                                    --->
<!--- ClientID<br>                                                                   --->
<!--- AssignedToUserID<br>                                                           --->
<!--- hidden_UsersID<br>                                                             --->
<!--- hidden_TimeStart<br>                                                           --->
<!--- callerFNameTBox<br>                                                            --->
<!--- callerMInitialTBox<br>                                                         --->
<!--- callerLNameTBox<br>                                                            --->
<!--- callerPhoneTBox<br>                                                            --->
<!--- patientFNameTBox<br>                                                           --->
<!--- patientMInitialTBox<br>                                                        --->
<!--- patientLNameTBox<br>                                                           --->
<!--- roomNumberTBox<br>                                                             --->
<!--- bedNumberTBox<br>                                                              --->
<!--- patientAddressTBox<br>                                                         --->
<!--- patientCityTBox<br>                                                            --->
<!--- patientStateTBox<br>                                                           --->
<!--- patientZipTBox<br>                                                             --->
<!--- patientPhoneTBox<br>                                                           --->
<!--- patientDOBMM<br>                                                               --->
<!--- patientDOBDD<br>                                                               --->
<!--- patientDOBYY<br>                                                               --->
<!--- OPTION_3a_CBox_PatientSexMale<br>                                              --->
<!--- OPTION_3a_CBox_PatientSexFemale<br>                                            --->
<!--- patientSSNTBox<br>                                                             --->
<!--- patientHeightFeet<br>                                                          --->
<!--- patientHeightInches<br>                                                        --->
<!--- patientWeightTBox<br>                                                          --->
<!--- alternateContactFNameTBox<br>                                                  --->
<!--- alternateContactMInitialTBox<br>                                               --->
<!--- alternateContactLNameTBox<br>                                                  --->
<!--- alternateContactRelationshipTBox<br>                                           --->
<!--- alternateContactPhoneTBox<br>                                                  --->
<!--- alternateContactWorkPhoneTBox<br>                                              --->
<!--- primaryInsuranceNameTBox<br>                                                   --->
<!--- secondaryInsuranceNameTBox<br>                                                 --->
<!--- primaryPolicyNumberTBox<br>                                                    --->
<!--- secondaryPolicyNumberTBox<br>                                                  --->
<!--- orderingPhysicianFNameTBox<br>                                                 --->
<!--- orderingPhysicianMInitialTBox<br>                                              --->
<!--- orderingPhysicianLNameTBox<br>                                                 --->
<!--- orderingPhysicianPhoneTBox<br>                                                 --->
<!--- printed<br>                                                                    --->
<!--- Cancelled<br>                                                                  --->
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


<cfcomponent name="QuoteIO">

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
			variables.instance.QuoteID = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.AssignedToUserID = "NULL";
			variables.instance.hidden_UsersID = "";
			variables.instance.hidden_TimeStart = "";
			variables.instance.callerFNameTBox = "";
			variables.instance.callerMInitialTBox = "";
			variables.instance.callerLNameTBox = "";
			variables.instance.callerPhoneTBox = "";
			variables.instance.patientFNameTBox = "";
			variables.instance.patientMInitialTBox = "";
			variables.instance.patientLNameTBox = "";
			variables.instance.roomNumberTBox = "";
			variables.instance.bedNumberTBox = "";
			variables.instance.patientAddressTBox = "";
			variables.instance.patientCityTBox = "";
			variables.instance.patientStateTBox = "";
			variables.instance.patientZipTBox = "";
			variables.instance.patientPhoneTBox = "";
			variables.instance.patientDOBMM = "";
			variables.instance.patientDOBDD = "";
			variables.instance.patientDOBYY = "";
			variables.instance.OPTION_3a_CBox_PatientSexMale = "";
			variables.instance.OPTION_3a_CBox_PatientSexFemale = "";
			variables.instance.patientSSNTBox = "";
			variables.instance.patientHeightFeet = "";
			variables.instance.patientHeightInches = "";
			variables.instance.patientWeightTBox = "";
			variables.instance.alternateContactFNameTBox = "";
			variables.instance.alternateContactMInitialTBox = "";
			variables.instance.alternateContactLNameTBox = "";
			variables.instance.alternateContactRelationshipTBox = "";
			variables.instance.alternateContactPhoneTBox = "";
			variables.instance.alternateContactWorkPhoneTBox = "";
			variables.instance.primaryInsuranceNameTBox = "";
			variables.instance.secondaryInsuranceNameTBox = "";
			variables.instance.primaryPolicyNumberTBox = "";
			variables.instance.secondaryPolicyNumberTBox = "";
			variables.instance.orderingPhysicianFNameTBox = "";
			variables.instance.orderingPhysicianMInitialTBox = "";
			variables.instance.orderingPhysicianLNameTBox = "";
			variables.instance.orderingPhysicianPhoneTBox = "";
			variables.instance.printed = "";
			variables.instance.Cancelled = "";
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
	<cfset temp = QueryAddRow(defaultsQuery, 48)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "QUOTEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTHEIGHTINCHES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTWEIGHTTBOX", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTFNAMETBOX", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTMINITIALTBOX", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTLNAMETBOX", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTRELATIONSHIPTBOX", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTPHONETBOX", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTWORKPHONETBOX", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIMARYINSURANCENAMETBOX", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECONDARYINSURANCENAMETBOX", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIMARYPOLICYNUMBERTBOX", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECONDARYPOLICYNUMBERTBOX", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANFNAMETBOX", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANMINITIALTBOX", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANLNAMETBOX", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANPHONETBOX", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRINTED", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CANCELLED", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "0", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ASSIGNEDTOUSERID", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HIDDEN_USERSID", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HIDDEN_TIMESTART", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERFNAMETBOX", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERMINITIALTBOX", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERLNAMETBOX", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERPHONETBOX", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTFNAMETBOX", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 32)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTMINITIALTBOX", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 33)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTLNAMETBOX", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 34)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ROOMNUMBERTBOX", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 35)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "BEDNUMBERTBOX", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 36)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTADDRESSTBOX", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 37)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTCITYTBOX", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 38)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTSTATETBOX", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 39)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTZIPTBOX", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 40)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTPHONETBOX", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 41)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTDOBMM", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 42)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTDOBDD", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 43)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTDOBYY", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 44)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3A_CBOX_PATIENTSEXMALE", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 45)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3A_CBOX_PATIENTSEXFEMALE", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 46)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTSSNTBOX", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 47)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTHEIGHTFEET", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 48)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for QuoteID.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuoteID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.QuoteID>
	</cffunction>
	 
	<cffunction name="setQuoteID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="QuoteID" required="Yes" type="String">
		
		<cfif QuoteID NEQ "NULL">	
			
			<cfif arguments.QuoteID EQ "@@" OR arguments.QuoteID EQ "">
				
				<cfset arguments.QuoteID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(QuoteID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>QuoteID</strong> (#QuoteID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.QuoteID = arguments.QuoteID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AssignedToUserID.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAssignedToUserID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AssignedToUserID>
	</cffunction>
	 
	<cffunction name="setAssignedToUserID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AssignedToUserID" required="Yes" type="String">
		
		<cfif AssignedToUserID NEQ "NULL">	
			
			<cfif arguments.AssignedToUserID EQ "@@" OR arguments.AssignedToUserID EQ "">
				
				<cfset arguments.AssignedToUserID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AssignedToUserID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AssignedToUserID</strong> (#AssignedToUserID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AssignedToUserID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hidden_UsersID.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHidden_UsersID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_UsersID>
	</cffunction>
	 
	<cffunction name="setHidden_UsersID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Hidden_UsersID" required="Yes" type="String">
		
		<cfif Hidden_UsersID NEQ "NULL">	
			
			<cfif arguments.hidden_UsersID EQ "@@" OR arguments.hidden_UsersID EQ "">
				
				<cfset arguments.hidden_UsersID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Hidden_UsersID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Hidden_UsersID</strong> (#Hidden_UsersID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hidden_UsersID) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Hidden_UsersID</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Hidden_UsersID = arguments.Hidden_UsersID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Hidden_UsersID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hidden_TimeStart.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHidden_TimeStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_TimeStart>
	</cffunction>
	 
	<cffunction name="setHidden_TimeStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Hidden_TimeStart" required="Yes" type="String">
		
		<cfif Hidden_TimeStart NEQ "NULL">	
			
			<cfif arguments.hidden_TimeStart EQ "@@" OR arguments.hidden_TimeStart EQ "">
				
				<cfset arguments.hidden_TimeStart = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Hidden_TimeStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Hidden_TimeStart</strong> (#Hidden_TimeStart#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hidden_TimeStart) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Hidden_TimeStart</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Hidden_TimeStart = arguments.Hidden_TimeStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Hidden_TimeStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerFNameTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerFNameTBox>
	</cffunction>
	 
	<cffunction name="setCallerFNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerFNameTBox" required="Yes" type="String">
		
		<cfif CallerFNameTBox NEQ "NULL">	
			
			<cfif arguments.callerFNameTBox EQ "@@" OR arguments.callerFNameTBox EQ "">
				
				<cfset arguments.callerFNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerFNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerFNameTBox</strong> (#CallerFNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerFNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerFNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerFNameTBox = arguments.CallerFNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerFNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerMInitialTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerMInitialTBox>
	</cffunction>
	 
	<cffunction name="setCallerMInitialTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerMInitialTBox" required="Yes" type="String">
		
		<cfif CallerMInitialTBox NEQ "NULL">	
			
			<cfif arguments.callerMInitialTBox EQ "@@" OR arguments.callerMInitialTBox EQ "">
				
				<cfset arguments.callerMInitialTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerMInitialTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerMInitialTBox</strong> (#CallerMInitialTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerMInitialTBox) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerMInitialTBox</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerMInitialTBox = arguments.CallerMInitialTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerMInitialTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerLNameTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerLNameTBox>
	</cffunction>
	 
	<cffunction name="setCallerLNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerLNameTBox" required="Yes" type="String">
		
		<cfif CallerLNameTBox NEQ "NULL">	
			
			<cfif arguments.callerLNameTBox EQ "@@" OR arguments.callerLNameTBox EQ "">
				
				<cfset arguments.callerLNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerLNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerLNameTBox</strong> (#CallerLNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerLNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerLNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerLNameTBox = arguments.CallerLNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerLNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerPhoneTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerPhoneTBox>
	</cffunction>
	 
	<cffunction name="setCallerPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerPhoneTBox" required="Yes" type="String">
		
		<cfif CallerPhoneTBox NEQ "NULL">	
			
			<cfif arguments.callerPhoneTBox EQ "@@" OR arguments.callerPhoneTBox EQ "">
				
				<cfset arguments.callerPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerPhoneTBox</strong> (#CallerPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerPhoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerPhoneTBox = arguments.CallerPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientFNameTBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientFNameTBox>
	</cffunction>
	 
	<cffunction name="setPatientFNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientFNameTBox" required="Yes" type="String">
		
		<cfif PatientFNameTBox NEQ "NULL">	
			
			<cfif arguments.patientFNameTBox EQ "@@" OR arguments.patientFNameTBox EQ "">
				
				<cfset arguments.patientFNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientFNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientFNameTBox</strong> (#PatientFNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientFNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientFNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientFNameTBox = arguments.PatientFNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientFNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientMInitialTBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientMInitialTBox>
	</cffunction>
	 
	<cffunction name="setPatientMInitialTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientMInitialTBox" required="Yes" type="String">
		
		<cfif PatientMInitialTBox NEQ "NULL">	
			
			<cfif arguments.patientMInitialTBox EQ "@@" OR arguments.patientMInitialTBox EQ "">
				
				<cfset arguments.patientMInitialTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientMInitialTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientMInitialTBox</strong> (#PatientMInitialTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientMInitialTBox) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientMInitialTBox</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientMInitialTBox = arguments.PatientMInitialTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientMInitialTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientLNameTBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientLNameTBox>
	</cffunction>
	 
	<cffunction name="setPatientLNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientLNameTBox" required="Yes" type="String">
		
		<cfif PatientLNameTBox NEQ "NULL">	
			
			<cfif arguments.patientLNameTBox EQ "@@" OR arguments.patientLNameTBox EQ "">
				
				<cfset arguments.patientLNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientLNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientLNameTBox</strong> (#PatientLNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientLNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientLNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientLNameTBox = arguments.PatientLNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientLNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for roomNumberTBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRoomNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RoomNumberTBox>
	</cffunction>
	 
	<cffunction name="setRoomNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RoomNumberTBox" required="Yes" type="String">
		
		<cfif RoomNumberTBox NEQ "NULL">	
			
			<cfif arguments.roomNumberTBox EQ "@@" OR arguments.roomNumberTBox EQ "">
				
				<cfset arguments.roomNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(RoomNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RoomNumberTBox</strong> (#RoomNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(roomNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RoomNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RoomNumberTBox = arguments.RoomNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RoomNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for bedNumberTBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getBedNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.BedNumberTBox>
	</cffunction>
	 
	<cffunction name="setBedNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="BedNumberTBox" required="Yes" type="String">
		
		<cfif BedNumberTBox NEQ "NULL">	
			
			<cfif arguments.bedNumberTBox EQ "@@" OR arguments.bedNumberTBox EQ "">
				
				<cfset arguments.bedNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(BedNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>BedNumberTBox</strong> (#BedNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(bedNumberTBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>BedNumberTBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.BedNumberTBox = arguments.BedNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "BedNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientAddressTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientAddressTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientAddressTBox>
	</cffunction>
	 
	<cffunction name="setPatientAddressTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientAddressTBox" required="Yes" type="String">
		
		<cfif PatientAddressTBox NEQ "NULL">	
			
			<cfif arguments.patientAddressTBox EQ "@@" OR arguments.patientAddressTBox EQ "">
				
				<cfset arguments.patientAddressTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientAddressTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientAddressTBox</strong> (#PatientAddressTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientAddressTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientAddressTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientAddressTBox = arguments.PatientAddressTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientAddressTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientCityTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientCityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientCityTBox>
	</cffunction>
	 
	<cffunction name="setPatientCityTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientCityTBox" required="Yes" type="String">
		
		<cfif PatientCityTBox NEQ "NULL">	
			
			<cfif arguments.patientCityTBox EQ "@@" OR arguments.patientCityTBox EQ "">
				
				<cfset arguments.patientCityTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientCityTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientCityTBox</strong> (#PatientCityTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientCityTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientCityTBox</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientCityTBox = arguments.PatientCityTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientCityTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientStateTBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientStateTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientStateTBox>
	</cffunction>
	 
	<cffunction name="setPatientStateTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientStateTBox" required="Yes" type="String">
		
		<cfif PatientStateTBox NEQ "NULL">	
			
			<cfif arguments.patientStateTBox EQ "@@" OR arguments.patientStateTBox EQ "">
				
				<cfset arguments.patientStateTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientStateTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientStateTBox</strong> (#PatientStateTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientStateTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientStateTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientStateTBox = arguments.PatientStateTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientStateTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientZipTBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientZipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientZipTBox>
	</cffunction>
	 
	<cffunction name="setPatientZipTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientZipTBox" required="Yes" type="String">
		
		<cfif PatientZipTBox NEQ "NULL">	
			
			<cfif arguments.patientZipTBox EQ "@@" OR arguments.patientZipTBox EQ "">
				
				<cfset arguments.patientZipTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientZipTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientZipTBox</strong> (#PatientZipTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientZipTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientZipTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientZipTBox = arguments.PatientZipTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientZipTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientPhoneTBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientPhoneTBox>
	</cffunction>
	 
	<cffunction name="setPatientPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientPhoneTBox" required="Yes" type="String">
		
		<cfif PatientPhoneTBox NEQ "NULL">	
			
			<cfif arguments.patientPhoneTBox EQ "@@" OR arguments.patientPhoneTBox EQ "">
				
				<cfset arguments.patientPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientPhoneTBox</strong> (#PatientPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientPhoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientPhoneTBox = arguments.PatientPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientDOBMM.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientDOBMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBMM>
	</cffunction>
	 
	<cffunction name="setPatientDOBMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientDOBMM" required="Yes" type="String">
		
		<cfif PatientDOBMM NEQ "NULL">	
			
			<cfif arguments.patientDOBMM EQ "@@" OR arguments.patientDOBMM EQ "">
				
				<cfset arguments.patientDOBMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientDOBMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientDOBMM</strong> (#PatientDOBMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientDOBMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientDOBMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientDOBMM = arguments.PatientDOBMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientDOBMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientDOBDD.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientDOBDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBDD>
	</cffunction>
	 
	<cffunction name="setPatientDOBDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientDOBDD" required="Yes" type="String">
		
		<cfif PatientDOBDD NEQ "NULL">	
			
			<cfif arguments.patientDOBDD EQ "@@" OR arguments.patientDOBDD EQ "">
				
				<cfset arguments.patientDOBDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientDOBDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientDOBDD</strong> (#PatientDOBDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientDOBDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientDOBDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientDOBDD = arguments.PatientDOBDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientDOBDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientDOBYY.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientDOBYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBYY>
	</cffunction>
	 
	<cffunction name="setPatientDOBYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientDOBYY" required="Yes" type="String">
		
		<cfif PatientDOBYY NEQ "NULL">	
			
			<cfif arguments.patientDOBYY EQ "@@" OR arguments.patientDOBYY EQ "">
				
				<cfset arguments.patientDOBYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientDOBYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientDOBYY</strong> (#PatientDOBYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientDOBYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientDOBYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientDOBYY = arguments.PatientDOBYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientDOBYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_3a_CBox_PatientSexMale.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_3a_CBox_PatientSexMale" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3a_CBox_PatientSexMale>
	</cffunction>
	 
	<cffunction name="setOPTION_3a_CBox_PatientSexMale" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_3a_CBox_PatientSexMale" required="Yes" type="String">
		
		<cfif OPTION_3a_CBox_PatientSexMale NEQ "NULL">	
			
			<cfif arguments.OPTION_3a_CBox_PatientSexMale EQ "@@" OR arguments.OPTION_3a_CBox_PatientSexMale EQ "">
				
				<cfset arguments.OPTION_3a_CBox_PatientSexMale = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_3a_CBox_PatientSexMale)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3a_CBox_PatientSexMale</strong> (#OPTION_3a_CBox_PatientSexMale#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3a_CBox_PatientSexMale) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3a_CBox_PatientSexMale</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_3a_CBox_PatientSexMale = arguments.OPTION_3a_CBox_PatientSexMale>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_3a_CBox_PatientSexMale")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_3a_CBox_PatientSexFemale.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_3a_CBox_PatientSexFemale" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3a_CBox_PatientSexFemale>
	</cffunction>
	 
	<cffunction name="setOPTION_3a_CBox_PatientSexFemale" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_3a_CBox_PatientSexFemale" required="Yes" type="String">
		
		<cfif OPTION_3a_CBox_PatientSexFemale NEQ "NULL">	
			
			<cfif arguments.OPTION_3a_CBox_PatientSexFemale EQ "@@" OR arguments.OPTION_3a_CBox_PatientSexFemale EQ "">
				
				<cfset arguments.OPTION_3a_CBox_PatientSexFemale = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_3a_CBox_PatientSexFemale)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3a_CBox_PatientSexFemale</strong> (#OPTION_3a_CBox_PatientSexFemale#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3a_CBox_PatientSexFemale) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3a_CBox_PatientSexFemale</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_3a_CBox_PatientSexFemale = arguments.OPTION_3a_CBox_PatientSexFemale>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_3a_CBox_PatientSexFemale")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientSSNTBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientSSNTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientSSNTBox>
	</cffunction>
	 
	<cffunction name="setPatientSSNTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientSSNTBox" required="Yes" type="String">
		
		<cfif PatientSSNTBox NEQ "NULL">	
			
			<cfif arguments.patientSSNTBox EQ "@@" OR arguments.patientSSNTBox EQ "">
				
				<cfset arguments.patientSSNTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientSSNTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientSSNTBox</strong> (#PatientSSNTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientSSNTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientSSNTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientSSNTBox = arguments.PatientSSNTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientSSNTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientHeightFeet.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientHeightFeet" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientHeightFeet>
	</cffunction>
	 
	<cffunction name="setPatientHeightFeet" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientHeightFeet" required="Yes" type="String">
		
		<cfif PatientHeightFeet NEQ "NULL">	
			
			<cfif arguments.patientHeightFeet EQ "@@" OR arguments.patientHeightFeet EQ "">
				
				<cfset arguments.patientHeightFeet = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientHeightFeet)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientHeightFeet</strong> (#PatientHeightFeet#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientHeightFeet) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientHeightFeet</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientHeightFeet = arguments.PatientHeightFeet>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientHeightFeet")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientHeightInches.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientHeightInches" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientHeightInches>
	</cffunction>
	 
	<cffunction name="setPatientHeightInches" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientHeightInches" required="Yes" type="String">
		
		<cfif PatientHeightInches NEQ "NULL">	
			
			<cfif arguments.patientHeightInches EQ "@@" OR arguments.patientHeightInches EQ "">
				
				<cfset arguments.patientHeightInches = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientHeightInches)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientHeightInches</strong> (#PatientHeightInches#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientHeightInches) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientHeightInches</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientHeightInches = arguments.PatientHeightInches>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientHeightInches")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientWeightTBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientWeightTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientWeightTBox>
	</cffunction>
	 
	<cffunction name="setPatientWeightTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientWeightTBox" required="Yes" type="String">
		
		<cfif PatientWeightTBox NEQ "NULL">	
			
			<cfif arguments.patientWeightTBox EQ "@@" OR arguments.patientWeightTBox EQ "">
				
				<cfset arguments.patientWeightTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientWeightTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientWeightTBox</strong> (#PatientWeightTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientWeightTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientWeightTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientWeightTBox = arguments.PatientWeightTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientWeightTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactFNameTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactFNameTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactFNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactFNameTBox" required="Yes" type="String">
		
		<cfif AlternateContactFNameTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactFNameTBox EQ "@@" OR arguments.alternateContactFNameTBox EQ "">
				
				<cfset arguments.alternateContactFNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactFNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactFNameTBox</strong> (#AlternateContactFNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactFNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactFNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactFNameTBox = arguments.AlternateContactFNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactFNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactMInitialTBox.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactMInitialTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactMInitialTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactMInitialTBox" required="Yes" type="String">
		
		<cfif AlternateContactMInitialTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactMInitialTBox EQ "@@" OR arguments.alternateContactMInitialTBox EQ "">
				
				<cfset arguments.alternateContactMInitialTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactMInitialTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactMInitialTBox</strong> (#AlternateContactMInitialTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactMInitialTBox) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactMInitialTBox</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactMInitialTBox = arguments.AlternateContactMInitialTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactMInitialTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactLNameTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactLNameTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactLNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactLNameTBox" required="Yes" type="String">
		
		<cfif AlternateContactLNameTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactLNameTBox EQ "@@" OR arguments.alternateContactLNameTBox EQ "">
				
				<cfset arguments.alternateContactLNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactLNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactLNameTBox</strong> (#AlternateContactLNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactLNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactLNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactLNameTBox = arguments.AlternateContactLNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactLNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactRelationshipTBox.                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactRelationshipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactRelationshipTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactRelationshipTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactRelationshipTBox" required="Yes" type="String">
		
		<cfif AlternateContactRelationshipTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactRelationshipTBox EQ "@@" OR arguments.alternateContactRelationshipTBox EQ "">
				
				<cfset arguments.alternateContactRelationshipTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactRelationshipTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactRelationshipTBox</strong> (#AlternateContactRelationshipTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactRelationshipTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactRelationshipTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactRelationshipTBox = arguments.AlternateContactRelationshipTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactRelationshipTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactPhoneTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactPhoneTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactPhoneTBox" required="Yes" type="String">
		
		<cfif AlternateContactPhoneTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactPhoneTBox EQ "@@" OR arguments.alternateContactPhoneTBox EQ "">
				
				<cfset arguments.alternateContactPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactPhoneTBox</strong> (#AlternateContactPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactPhoneTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactPhoneTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactPhoneTBox = arguments.AlternateContactPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactWorkPhoneTBox.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactWorkPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactWorkPhoneTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactWorkPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactWorkPhoneTBox" required="Yes" type="String">
		
		<cfif AlternateContactWorkPhoneTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactWorkPhoneTBox EQ "@@" OR arguments.alternateContactWorkPhoneTBox EQ "">
				
				<cfset arguments.alternateContactWorkPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactWorkPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactWorkPhoneTBox</strong> (#AlternateContactWorkPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactWorkPhoneTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactWorkPhoneTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactWorkPhoneTBox = arguments.AlternateContactWorkPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactWorkPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for primaryInsuranceNameTBox.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrimaryInsuranceNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrimaryInsuranceNameTBox>
	</cffunction>
	 
	<cffunction name="setPrimaryInsuranceNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrimaryInsuranceNameTBox" required="Yes" type="String">
		
		<cfif PrimaryInsuranceNameTBox NEQ "NULL">	
			
			<cfif arguments.primaryInsuranceNameTBox EQ "@@" OR arguments.primaryInsuranceNameTBox EQ "">
				
				<cfset arguments.primaryInsuranceNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PrimaryInsuranceNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrimaryInsuranceNameTBox</strong> (#PrimaryInsuranceNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(primaryInsuranceNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PrimaryInsuranceNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PrimaryInsuranceNameTBox = arguments.PrimaryInsuranceNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrimaryInsuranceNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secondaryInsuranceNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecondaryInsuranceNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecondaryInsuranceNameTBox>
	</cffunction>
	 
	<cffunction name="setSecondaryInsuranceNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecondaryInsuranceNameTBox" required="Yes" type="String">
		
		<cfif SecondaryInsuranceNameTBox NEQ "NULL">	
			
			<cfif arguments.secondaryInsuranceNameTBox EQ "@@" OR arguments.secondaryInsuranceNameTBox EQ "">
				
				<cfset arguments.secondaryInsuranceNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SecondaryInsuranceNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecondaryInsuranceNameTBox</strong> (#SecondaryInsuranceNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secondaryInsuranceNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecondaryInsuranceNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SecondaryInsuranceNameTBox = arguments.SecondaryInsuranceNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecondaryInsuranceNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for primaryPolicyNumberTBox.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrimaryPolicyNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrimaryPolicyNumberTBox>
	</cffunction>
	 
	<cffunction name="setPrimaryPolicyNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrimaryPolicyNumberTBox" required="Yes" type="String">
		
		<cfif PrimaryPolicyNumberTBox NEQ "NULL">	
			
			<cfif arguments.primaryPolicyNumberTBox EQ "@@" OR arguments.primaryPolicyNumberTBox EQ "">
				
				<cfset arguments.primaryPolicyNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PrimaryPolicyNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrimaryPolicyNumberTBox</strong> (#PrimaryPolicyNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(primaryPolicyNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PrimaryPolicyNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PrimaryPolicyNumberTBox = arguments.PrimaryPolicyNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrimaryPolicyNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secondaryPolicyNumberTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecondaryPolicyNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecondaryPolicyNumberTBox>
	</cffunction>
	 
	<cffunction name="setSecondaryPolicyNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecondaryPolicyNumberTBox" required="Yes" type="String">
		
		<cfif SecondaryPolicyNumberTBox NEQ "NULL">	
			
			<cfif arguments.secondaryPolicyNumberTBox EQ "@@" OR arguments.secondaryPolicyNumberTBox EQ "">
				
				<cfset arguments.secondaryPolicyNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SecondaryPolicyNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecondaryPolicyNumberTBox</strong> (#SecondaryPolicyNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secondaryPolicyNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecondaryPolicyNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SecondaryPolicyNumberTBox = arguments.SecondaryPolicyNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecondaryPolicyNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianFNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianFNameTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianFNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianFNameTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianFNameTBox NEQ "NULL">	
			
			<cfif arguments.orderingPhysicianFNameTBox EQ "@@" OR arguments.orderingPhysicianFNameTBox EQ "">
				
				<cfset arguments.orderingPhysicianFNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianFNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianFNameTBox</strong> (#OrderingPhysicianFNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianFNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianFNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianFNameTBox = arguments.OrderingPhysicianFNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianFNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianMInitialTBox.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianMInitialTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianMInitialTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianMInitialTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianMInitialTBox NEQ "NULL">	
			
			<cfif arguments.orderingPhysicianMInitialTBox EQ "@@" OR arguments.orderingPhysicianMInitialTBox EQ "">
				
				<cfset arguments.orderingPhysicianMInitialTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianMInitialTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianMInitialTBox</strong> (#OrderingPhysicianMInitialTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianMInitialTBox) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianMInitialTBox</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianMInitialTBox = arguments.OrderingPhysicianMInitialTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianMInitialTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianLNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianLNameTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianLNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianLNameTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianLNameTBox NEQ "NULL">	
			
			<cfif arguments.orderingPhysicianLNameTBox EQ "@@" OR arguments.orderingPhysicianLNameTBox EQ "">
				
				<cfset arguments.orderingPhysicianLNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianLNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianLNameTBox</strong> (#OrderingPhysicianLNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianLNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianLNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianLNameTBox = arguments.OrderingPhysicianLNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianLNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianPhoneTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianPhoneTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianPhoneTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianPhoneTBox NEQ "NULL">	
			
			<cfif arguments.orderingPhysicianPhoneTBox EQ "@@" OR arguments.orderingPhysicianPhoneTBox EQ "">
				
				<cfset arguments.orderingPhysicianPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianPhoneTBox</strong> (#OrderingPhysicianPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianPhoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianPhoneTBox = arguments.OrderingPhysicianPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for printed.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrinted" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Printed>
	</cffunction>
	 
	<cffunction name="setPrinted" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Printed" required="Yes" type="String">
		
		<cfif Printed NEQ "NULL">	
			
			<cfif arguments.printed EQ "@@" OR arguments.printed EQ "">
				
				<cfset arguments.printed = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Printed)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Printed</strong> (#Printed#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(printed) GT 4000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Printed</strong> cannot be greater than 4000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Printed = arguments.Printed>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Printed")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Cancelled.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCancelled" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Cancelled>
	</cffunction>
	 
	<cffunction name="setCancelled" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Cancelled" required="Yes" type="String">
		
		<cfif Cancelled NEQ "NULL">	
			
			<cfif arguments.Cancelled EQ "@@" OR arguments.Cancelled EQ "">
				
				<cfset arguments.Cancelled = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Cancelled)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Cancelled</strong> (#Cancelled#) is not of type <strong>char</strong>.">	
			<cfelseif len(Cancelled) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Cancelled</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Cancelled = arguments.Cancelled>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Cancelled")>			
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

		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="hidden_UsersID" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart" required="No" type="String" default="">
		<cfargument name="callerFNameTBox" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox" required="No" type="String" default="">
		<cfargument name="callerLNameTBox" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox" required="No" type="String" default="">
		<cfargument name="patientFNameTBox" required="No" type="String" default="">
		<cfargument name="patientMInitialTBox" required="No" type="String" default="">
		<cfargument name="patientLNameTBox" required="No" type="String" default="">
		<cfargument name="roomNumberTBox" required="No" type="String" default="">
		<cfargument name="bedNumberTBox" required="No" type="String" default="">
		<cfargument name="patientAddressTBox" required="No" type="String" default="">
		<cfargument name="patientCityTBox" required="No" type="String" default="">
		<cfargument name="patientStateTBox" required="No" type="String" default="">
		<cfargument name="patientZipTBox" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox" required="No" type="String" default="">
		<cfargument name="patientDOBMM" required="No" type="String" default="">
		<cfargument name="patientDOBDD" required="No" type="String" default="">
		<cfargument name="patientDOBYY" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexMale" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexFemale" required="No" type="String" default="">
		<cfargument name="patientSSNTBox" required="No" type="String" default="">
		<cfargument name="patientHeightFeet" required="No" type="String" default="">
		<cfargument name="patientHeightInches" required="No" type="String" default="">
		<cfargument name="patientWeightTBox" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox" required="No" type="String" default="">
		<cfargument name="printed" required="No" type="String" default="">
		<cfargument name="Cancelled" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>
		<cfset variables.instance.hidden_UsersID = arguments.hidden_UsersID>
		<cfset variables.instance.hidden_TimeStart = arguments.hidden_TimeStart>
		<cfset variables.instance.callerFNameTBox = arguments.callerFNameTBox>
		<cfset variables.instance.callerMInitialTBox = arguments.callerMInitialTBox>
		<cfset variables.instance.callerLNameTBox = arguments.callerLNameTBox>
		<cfset variables.instance.callerPhoneTBox = arguments.callerPhoneTBox>
		<cfset variables.instance.patientFNameTBox = arguments.patientFNameTBox>
		<cfset variables.instance.patientMInitialTBox = arguments.patientMInitialTBox>
		<cfset variables.instance.patientLNameTBox = arguments.patientLNameTBox>
		<cfset variables.instance.roomNumberTBox = arguments.roomNumberTBox>
		<cfset variables.instance.bedNumberTBox = arguments.bedNumberTBox>
		<cfset variables.instance.patientAddressTBox = arguments.patientAddressTBox>
		<cfset variables.instance.patientCityTBox = arguments.patientCityTBox>
		<cfset variables.instance.patientStateTBox = arguments.patientStateTBox>
		<cfset variables.instance.patientZipTBox = arguments.patientZipTBox>
		<cfset variables.instance.patientPhoneTBox = arguments.patientPhoneTBox>
		<cfset variables.instance.patientDOBMM = arguments.patientDOBMM>
		<cfset variables.instance.patientDOBDD = arguments.patientDOBDD>
		<cfset variables.instance.patientDOBYY = arguments.patientDOBYY>
		<cfset variables.instance.OPTION_3a_CBox_PatientSexMale = arguments.OPTION_3a_CBox_PatientSexMale>
		<cfset variables.instance.OPTION_3a_CBox_PatientSexFemale = arguments.OPTION_3a_CBox_PatientSexFemale>
		<cfset variables.instance.patientSSNTBox = arguments.patientSSNTBox>
		<cfset variables.instance.patientHeightFeet = arguments.patientHeightFeet>
		<cfset variables.instance.patientHeightInches = arguments.patientHeightInches>
		<cfset variables.instance.patientWeightTBox = arguments.patientWeightTBox>
		<cfset variables.instance.alternateContactFNameTBox = arguments.alternateContactFNameTBox>
		<cfset variables.instance.alternateContactMInitialTBox = arguments.alternateContactMInitialTBox>
		<cfset variables.instance.alternateContactLNameTBox = arguments.alternateContactLNameTBox>
		<cfset variables.instance.alternateContactRelationshipTBox = arguments.alternateContactRelationshipTBox>
		<cfset variables.instance.alternateContactPhoneTBox = arguments.alternateContactPhoneTBox>
		<cfset variables.instance.alternateContactWorkPhoneTBox = arguments.alternateContactWorkPhoneTBox>
		<cfset variables.instance.primaryInsuranceNameTBox = arguments.primaryInsuranceNameTBox>
		<cfset variables.instance.secondaryInsuranceNameTBox = arguments.secondaryInsuranceNameTBox>
		<cfset variables.instance.primaryPolicyNumberTBox = arguments.primaryPolicyNumberTBox>
		<cfset variables.instance.secondaryPolicyNumberTBox = arguments.secondaryPolicyNumberTBox>
		<cfset variables.instance.orderingPhysicianFNameTBox = arguments.orderingPhysicianFNameTBox>
		<cfset variables.instance.orderingPhysicianMInitialTBox = arguments.orderingPhysicianMInitialTBox>
		<cfset variables.instance.orderingPhysicianLNameTBox = arguments.orderingPhysicianLNameTBox>
		<cfset variables.instance.orderingPhysicianPhoneTBox = arguments.orderingPhysicianPhoneTBox>
		<cfset variables.instance.printed = arguments.printed>
		<cfset variables.instance.Cancelled = arguments.Cancelled>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="QuoteIO" output="No">
		
		<cfargument name="QuoteID" required="yes" type="numeric">		
		<cfset var qGetQuote = "">
		
		<cfset preInit(QuoteID)>
	
		<cfquery name="qGetQuote" datasource="#trim(request.datasource)#">
	  		SELECT QuoteID,ClientID,AssignedToUserID,hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active,InactiveCode,DateCreated,DateModified
			FROM Quote  
			WHERE QuoteID = #trim(arguments.QuoteID)# 
		</cfquery>
		
		<cfif qGetQuote.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetQuote.QuoteID EQ "" OR qGetQuote.QuoteID EQ "NULL") 
				variables.instance.QuoteID = "NULL"; 
			ELSE 
				variables.instance.QuoteID = qGetQuote.QuoteID;
				
			IF(qGetQuote.ClientID EQ "" OR qGetQuote.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetQuote.ClientID;
				
			IF(qGetQuote.AssignedToUserID EQ "" OR qGetQuote.AssignedToUserID EQ "NULL") 
				variables.instance.AssignedToUserID = "NULL"; 
			ELSE 
				variables.instance.AssignedToUserID = qGetQuote.AssignedToUserID;
							
				variables.instance.hidden_UsersID = qGetQuote.hidden_UsersID;
							
				variables.instance.hidden_TimeStart = qGetQuote.hidden_TimeStart;
							
				variables.instance.callerFNameTBox = qGetQuote.callerFNameTBox;
							
				variables.instance.callerMInitialTBox = qGetQuote.callerMInitialTBox;
							
				variables.instance.callerLNameTBox = qGetQuote.callerLNameTBox;
							
				variables.instance.callerPhoneTBox = qGetQuote.callerPhoneTBox;
							
				variables.instance.patientFNameTBox = qGetQuote.patientFNameTBox;
							
				variables.instance.patientMInitialTBox = qGetQuote.patientMInitialTBox;
							
				variables.instance.patientLNameTBox = qGetQuote.patientLNameTBox;
							
				variables.instance.roomNumberTBox = qGetQuote.roomNumberTBox;
							
				variables.instance.bedNumberTBox = qGetQuote.bedNumberTBox;
							
				variables.instance.patientAddressTBox = qGetQuote.patientAddressTBox;
							
				variables.instance.patientCityTBox = qGetQuote.patientCityTBox;
							
				variables.instance.patientStateTBox = qGetQuote.patientStateTBox;
							
				variables.instance.patientZipTBox = qGetQuote.patientZipTBox;
							
				variables.instance.patientPhoneTBox = qGetQuote.patientPhoneTBox;
							
				variables.instance.patientDOBMM = qGetQuote.patientDOBMM;
							
				variables.instance.patientDOBDD = qGetQuote.patientDOBDD;
							
				variables.instance.patientDOBYY = qGetQuote.patientDOBYY;
							
				variables.instance.OPTION_3a_CBox_PatientSexMale = qGetQuote.OPTION_3a_CBox_PatientSexMale;
							
				variables.instance.OPTION_3a_CBox_PatientSexFemale = qGetQuote.OPTION_3a_CBox_PatientSexFemale;
							
				variables.instance.patientSSNTBox = qGetQuote.patientSSNTBox;
							
				variables.instance.patientHeightFeet = qGetQuote.patientHeightFeet;
							
				variables.instance.patientHeightInches = qGetQuote.patientHeightInches;
							
				variables.instance.patientWeightTBox = qGetQuote.patientWeightTBox;
							
				variables.instance.alternateContactFNameTBox = qGetQuote.alternateContactFNameTBox;
							
				variables.instance.alternateContactMInitialTBox = qGetQuote.alternateContactMInitialTBox;
							
				variables.instance.alternateContactLNameTBox = qGetQuote.alternateContactLNameTBox;
							
				variables.instance.alternateContactRelationshipTBox = qGetQuote.alternateContactRelationshipTBox;
							
				variables.instance.alternateContactPhoneTBox = qGetQuote.alternateContactPhoneTBox;
							
				variables.instance.alternateContactWorkPhoneTBox = qGetQuote.alternateContactWorkPhoneTBox;
							
				variables.instance.primaryInsuranceNameTBox = qGetQuote.primaryInsuranceNameTBox;
							
				variables.instance.secondaryInsuranceNameTBox = qGetQuote.secondaryInsuranceNameTBox;
							
				variables.instance.primaryPolicyNumberTBox = qGetQuote.primaryPolicyNumberTBox;
							
				variables.instance.secondaryPolicyNumberTBox = qGetQuote.secondaryPolicyNumberTBox;
							
				variables.instance.orderingPhysicianFNameTBox = qGetQuote.orderingPhysicianFNameTBox;
							
				variables.instance.orderingPhysicianMInitialTBox = qGetQuote.orderingPhysicianMInitialTBox;
							
				variables.instance.orderingPhysicianLNameTBox = qGetQuote.orderingPhysicianLNameTBox;
							
				variables.instance.orderingPhysicianPhoneTBox = qGetQuote.orderingPhysicianPhoneTBox;
							
				variables.instance.printed = qGetQuote.printed;
							
				variables.instance.Cancelled = qGetQuote.Cancelled;
							
				variables.instance.Active = qGetQuote.Active;
				
			IF(qGetQuote.InactiveCode EQ "" OR qGetQuote.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetQuote.InactiveCode;
							
				variables.instance.DateCreated = qGetQuote.DateCreated;
							
				variables.instance.DateModified = qGetQuote.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(QuoteID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitQuote = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.QuoteID) AND variables.instance.QuoteID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitQuote" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitQuote" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.QuoteID = qInsertCommitQuote.QuoteID>
				
				<cfreturn qInsertCommitQuote.QuoteID>
			
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
			<cfset tableColumns = "QuoteID,ClientID,AssignedToUserID,hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

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
				<cfset sqlStatement = "UPDATE Quote  SET #columnsToUpdate# WHERE QuoteID = #trim(variables.instance.QuoteID)#">
				
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
			<cfset stringTableColumns = "hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="ClientID,AssignedToUserID,hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO Quote  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS QuoteID ">
				
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
	<cffunction name="getQuoteQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getQuoteQuery">						
		<cfargument name="Fields" required="No" type="String" default="QuoteID,ClientID,AssignedToUserID,hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="QuoteID" required="No" type="String" default="">
		<cfargument name="QuoteID_IN" required="No" type="String" default="">
		<cfargument name="QuoteID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_IN" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_LIKE" required="No" type="String" default="">
		<cfargument name="hidden_UsersID" required="No" type="String" default="">
		<cfargument name="hidden_UsersID_IN" required="No" type="String" default="">
		<cfargument name="hidden_UsersID_LIKE" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart_IN" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart_LIKE" required="No" type="String" default="">
		<cfargument name="callerFNameTBox" required="No" type="String" default="">
		<cfargument name="callerFNameTBox_IN" required="No" type="String" default="">
		<cfargument name="callerFNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox_IN" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox_LIKE" required="No" type="String" default="">
		<cfargument name="callerLNameTBox" required="No" type="String" default="">
		<cfargument name="callerLNameTBox_IN" required="No" type="String" default="">
		<cfargument name="callerLNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientFNameTBox" required="No" type="String" default="">
		<cfargument name="patientFNameTBox_IN" required="No" type="String" default="">
		<cfargument name="patientFNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientMInitialTBox" required="No" type="String" default="">
		<cfargument name="patientMInitialTBox_IN" required="No" type="String" default="">
		<cfargument name="patientMInitialTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientLNameTBox" required="No" type="String" default="">
		<cfargument name="patientLNameTBox_IN" required="No" type="String" default="">
		<cfargument name="patientLNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="roomNumberTBox" required="No" type="String" default="">
		<cfargument name="roomNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="roomNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="bedNumberTBox" required="No" type="String" default="">
		<cfargument name="bedNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="bedNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientAddressTBox" required="No" type="String" default="">
		<cfargument name="patientAddressTBox_IN" required="No" type="String" default="">
		<cfargument name="patientAddressTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientCityTBox" required="No" type="String" default="">
		<cfargument name="patientCityTBox_IN" required="No" type="String" default="">
		<cfargument name="patientCityTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientStateTBox" required="No" type="String" default="">
		<cfargument name="patientStateTBox_IN" required="No" type="String" default="">
		<cfargument name="patientStateTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientZipTBox" required="No" type="String" default="">
		<cfargument name="patientZipTBox_IN" required="No" type="String" default="">
		<cfargument name="patientZipTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientDOBMM" required="No" type="String" default="">
		<cfargument name="patientDOBMM_IN" required="No" type="String" default="">
		<cfargument name="patientDOBMM_LIKE" required="No" type="String" default="">
		<cfargument name="patientDOBDD" required="No" type="String" default="">
		<cfargument name="patientDOBDD_IN" required="No" type="String" default="">
		<cfargument name="patientDOBDD_LIKE" required="No" type="String" default="">
		<cfargument name="patientDOBYY" required="No" type="String" default="">
		<cfargument name="patientDOBYY_IN" required="No" type="String" default="">
		<cfargument name="patientDOBYY_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexMale" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexMale_IN" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexMale_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexFemale" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexFemale_IN" required="No" type="String" default="">
		<cfargument name="OPTION_3a_CBox_PatientSexFemale_LIKE" required="No" type="String" default="">
		<cfargument name="patientSSNTBox" required="No" type="String" default="">
		<cfargument name="patientSSNTBox_IN" required="No" type="String" default="">
		<cfargument name="patientSSNTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientHeightFeet" required="No" type="String" default="">
		<cfargument name="patientHeightFeet_IN" required="No" type="String" default="">
		<cfargument name="patientHeightFeet_LIKE" required="No" type="String" default="">
		<cfargument name="patientHeightInches" required="No" type="String" default="">
		<cfargument name="patientHeightInches_IN" required="No" type="String" default="">
		<cfargument name="patientHeightInches_LIKE" required="No" type="String" default="">
		<cfargument name="patientWeightTBox" required="No" type="String" default="">
		<cfargument name="patientWeightTBox_IN" required="No" type="String" default="">
		<cfargument name="patientWeightTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox_IN" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox_IN" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFNameTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="printed" required="No" type="String" default="">
		<cfargument name="printed_IN" required="No" type="String" default="">
		<cfargument name="printed_LIKE" required="No" type="String" default="">
		<cfargument name="Cancelled" required="No" type="String" default="">
		<cfargument name="Cancelled_IN" required="No" type="String" default="">
		<cfargument name="Cancelled_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "QuoteID,QuoteID_IN,QuoteID_LIKE,ClientID,ClientID_IN,ClientID_LIKE,AssignedToUserID,AssignedToUserID_IN,AssignedToUserID_LIKE,hidden_UsersID,hidden_UsersID_IN,hidden_UsersID_LIKE,hidden_TimeStart,hidden_TimeStart_IN,hidden_TimeStart_LIKE,callerFNameTBox,callerFNameTBox_IN,callerFNameTBox_LIKE,callerMInitialTBox,callerMInitialTBox_IN,callerMInitialTBox_LIKE,callerLNameTBox,callerLNameTBox_IN,callerLNameTBox_LIKE,callerPhoneTBox,callerPhoneTBox_IN,callerPhoneTBox_LIKE,patientFNameTBox,patientFNameTBox_IN,patientFNameTBox_LIKE,patientMInitialTBox,patientMInitialTBox_IN,patientMInitialTBox_LIKE,patientLNameTBox,patientLNameTBox_IN,patientLNameTBox_LIKE,roomNumberTBox,roomNumberTBox_IN,roomNumberTBox_LIKE,bedNumberTBox,bedNumberTBox_IN,bedNumberTBox_LIKE,patientAddressTBox,patientAddressTBox_IN,patientAddressTBox_LIKE,patientCityTBox,patientCityTBox_IN,patientCityTBox_LIKE,patientStateTBox,patientStateTBox_IN,patientStateTBox_LIKE,patientZipTBox,patientZipTBox_IN,patientZipTBox_LIKE,patientPhoneTBox,patientPhoneTBox_IN,patientPhoneTBox_LIKE,patientDOBMM,patientDOBMM_IN,patientDOBMM_LIKE,patientDOBDD,patientDOBDD_IN,patientDOBDD_LIKE,patientDOBYY,patientDOBYY_IN,patientDOBYY_LIKE,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexMale_IN,OPTION_3a_CBox_PatientSexMale_LIKE,OPTION_3a_CBox_PatientSexFemale,OPTION_3a_CBox_PatientSexFemale_IN,OPTION_3a_CBox_PatientSexFemale_LIKE,patientSSNTBox,patientSSNTBox_IN,patientSSNTBox_LIKE,patientHeightFeet,patientHeightFeet_IN,patientHeightFeet_LIKE,patientHeightInches,patientHeightInches_IN,patientHeightInches_LIKE,patientWeightTBox,patientWeightTBox_IN,patientWeightTBox_LIKE,alternateContactFNameTBox,alternateContactFNameTBox_IN,alternateContactFNameTBox_LIKE,alternateContactMInitialTBox,alternateContactMInitialTBox_IN,alternateContactMInitialTBox_LIKE,alternateContactLNameTBox,alternateContactLNameTBox_IN,alternateContactLNameTBox_LIKE,alternateContactRelationshipTBox,alternateContactRelationshipTBox_IN,alternateContactRelationshipTBox_LIKE,alternateContactPhoneTBox,alternateContactPhoneTBox_IN,alternateContactPhoneTBox_LIKE,alternateContactWorkPhoneTBox,alternateContactWorkPhoneTBox_IN,alternateContactWorkPhoneTBox_LIKE,primaryInsuranceNameTBox,primaryInsuranceNameTBox_IN,primaryInsuranceNameTBox_LIKE,secondaryInsuranceNameTBox,secondaryInsuranceNameTBox_IN,secondaryInsuranceNameTBox_LIKE,primaryPolicyNumberTBox,primaryPolicyNumberTBox_IN,primaryPolicyNumberTBox_LIKE,secondaryPolicyNumberTBox,secondaryPolicyNumberTBox_IN,secondaryPolicyNumberTBox_LIKE,orderingPhysicianFNameTBox,orderingPhysicianFNameTBox_IN,orderingPhysicianFNameTBox_LIKE,orderingPhysicianMInitialTBox,orderingPhysicianMInitialTBox_IN,orderingPhysicianMInitialTBox_LIKE,orderingPhysicianLNameTBox,orderingPhysicianLNameTBox_IN,orderingPhysicianLNameTBox_LIKE,orderingPhysicianPhoneTBox,orderingPhysicianPhoneTBox_IN,orderingPhysicianPhoneTBox_LIKE,printed,printed_IN,printed_LIKE,Cancelled,Cancelled_IN,Cancelled_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Quote"
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
			<cfquery Name="getQuoteQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM Quote   
				WHERE 1=1
					<cfif QuoteID NEQ "" AND IsNumeric(QuoteID)>AND QuoteID = #QuoteID#</cfif>
					<cfif QuoteID_IN NEQ "">AND QuoteID IN(#trim(QuoteID_IN)#)</cfif>
					<cfif QuoteID_LIKE NEQ "">AND QuoteID LIKE '%#trim(QuoteID_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif AssignedToUserID NEQ "" AND IsNumeric(AssignedToUserID)>AND AssignedToUserID = #AssignedToUserID#</cfif>
					<cfif AssignedToUserID_IN NEQ "">AND AssignedToUserID IN(#trim(AssignedToUserID_IN)#)</cfif>
					<cfif AssignedToUserID_LIKE NEQ "">AND AssignedToUserID LIKE '%#trim(AssignedToUserID_LIKE)#%'</cfif>
					<cfif hidden_UsersID NEQ "">AND hidden_UsersID = '#hidden_UsersID#'</cfif>
					<cfif hidden_UsersID_IN NEQ "">AND hidden_UsersID IN(#trim(hidden_UsersID_IN)#)</cfif>
					<cfif hidden_UsersID_LIKE NEQ "">AND hidden_UsersID LIKE '%#trim(hidden_UsersID_LIKE)#%'</cfif>
					<cfif hidden_TimeStart NEQ "">AND hidden_TimeStart = '#hidden_TimeStart#'</cfif>
					<cfif hidden_TimeStart_IN NEQ "">AND hidden_TimeStart IN(#trim(hidden_TimeStart_IN)#)</cfif>
					<cfif hidden_TimeStart_LIKE NEQ "">AND hidden_TimeStart LIKE '%#trim(hidden_TimeStart_LIKE)#%'</cfif>
					<cfif callerFNameTBox NEQ "">AND callerFNameTBox = '#callerFNameTBox#'</cfif>
					<cfif callerFNameTBox_IN NEQ "">AND callerFNameTBox IN(#trim(callerFNameTBox_IN)#)</cfif>
					<cfif callerFNameTBox_LIKE NEQ "">AND callerFNameTBox LIKE '%#trim(callerFNameTBox_LIKE)#%'</cfif>
					<cfif callerMInitialTBox NEQ "">AND callerMInitialTBox = '#callerMInitialTBox#'</cfif>
					<cfif callerMInitialTBox_IN NEQ "">AND callerMInitialTBox IN(#trim(callerMInitialTBox_IN)#)</cfif>
					<cfif callerMInitialTBox_LIKE NEQ "">AND callerMInitialTBox LIKE '%#trim(callerMInitialTBox_LIKE)#%'</cfif>
					<cfif callerLNameTBox NEQ "">AND callerLNameTBox = '#callerLNameTBox#'</cfif>
					<cfif callerLNameTBox_IN NEQ "">AND callerLNameTBox IN(#trim(callerLNameTBox_IN)#)</cfif>
					<cfif callerLNameTBox_LIKE NEQ "">AND callerLNameTBox LIKE '%#trim(callerLNameTBox_LIKE)#%'</cfif>
					<cfif callerPhoneTBox NEQ "">AND callerPhoneTBox = '#callerPhoneTBox#'</cfif>
					<cfif callerPhoneTBox_IN NEQ "">AND callerPhoneTBox IN(#trim(callerPhoneTBox_IN)#)</cfif>
					<cfif callerPhoneTBox_LIKE NEQ "">AND callerPhoneTBox LIKE '%#trim(callerPhoneTBox_LIKE)#%'</cfif>
					<cfif patientFNameTBox NEQ "">AND patientFNameTBox = '#patientFNameTBox#'</cfif>
					<cfif patientFNameTBox_IN NEQ "">AND patientFNameTBox IN(#trim(patientFNameTBox_IN)#)</cfif>
					<cfif patientFNameTBox_LIKE NEQ "">AND patientFNameTBox LIKE '%#trim(patientFNameTBox_LIKE)#%'</cfif>
					<cfif patientMInitialTBox NEQ "">AND patientMInitialTBox = '#patientMInitialTBox#'</cfif>
					<cfif patientMInitialTBox_IN NEQ "">AND patientMInitialTBox IN(#trim(patientMInitialTBox_IN)#)</cfif>
					<cfif patientMInitialTBox_LIKE NEQ "">AND patientMInitialTBox LIKE '%#trim(patientMInitialTBox_LIKE)#%'</cfif>
					<cfif patientLNameTBox NEQ "">AND patientLNameTBox = '#patientLNameTBox#'</cfif>
					<cfif patientLNameTBox_IN NEQ "">AND patientLNameTBox IN(#trim(patientLNameTBox_IN)#)</cfif>
					<cfif patientLNameTBox_LIKE NEQ "">AND patientLNameTBox LIKE '%#trim(patientLNameTBox_LIKE)#%'</cfif>
					<cfif roomNumberTBox NEQ "">AND roomNumberTBox = '#roomNumberTBox#'</cfif>
					<cfif roomNumberTBox_IN NEQ "">AND roomNumberTBox IN(#trim(roomNumberTBox_IN)#)</cfif>
					<cfif roomNumberTBox_LIKE NEQ "">AND roomNumberTBox LIKE '%#trim(roomNumberTBox_LIKE)#%'</cfif>
					<cfif bedNumberTBox NEQ "">AND bedNumberTBox = '#bedNumberTBox#'</cfif>
					<cfif bedNumberTBox_IN NEQ "">AND bedNumberTBox IN(#trim(bedNumberTBox_IN)#)</cfif>
					<cfif bedNumberTBox_LIKE NEQ "">AND bedNumberTBox LIKE '%#trim(bedNumberTBox_LIKE)#%'</cfif>
					<cfif patientAddressTBox NEQ "">AND patientAddressTBox = '#patientAddressTBox#'</cfif>
					<cfif patientAddressTBox_IN NEQ "">AND patientAddressTBox IN(#trim(patientAddressTBox_IN)#)</cfif>
					<cfif patientAddressTBox_LIKE NEQ "">AND patientAddressTBox LIKE '%#trim(patientAddressTBox_LIKE)#%'</cfif>
					<cfif patientCityTBox NEQ "">AND patientCityTBox = '#patientCityTBox#'</cfif>
					<cfif patientCityTBox_IN NEQ "">AND patientCityTBox IN(#trim(patientCityTBox_IN)#)</cfif>
					<cfif patientCityTBox_LIKE NEQ "">AND patientCityTBox LIKE '%#trim(patientCityTBox_LIKE)#%'</cfif>
					<cfif patientStateTBox NEQ "">AND patientStateTBox = '#patientStateTBox#'</cfif>
					<cfif patientStateTBox_IN NEQ "">AND patientStateTBox IN(#trim(patientStateTBox_IN)#)</cfif>
					<cfif patientStateTBox_LIKE NEQ "">AND patientStateTBox LIKE '%#trim(patientStateTBox_LIKE)#%'</cfif>
					<cfif patientZipTBox NEQ "">AND patientZipTBox = '#patientZipTBox#'</cfif>
					<cfif patientZipTBox_IN NEQ "">AND patientZipTBox IN(#trim(patientZipTBox_IN)#)</cfif>
					<cfif patientZipTBox_LIKE NEQ "">AND patientZipTBox LIKE '%#trim(patientZipTBox_LIKE)#%'</cfif>
					<cfif patientPhoneTBox NEQ "">AND patientPhoneTBox = '#patientPhoneTBox#'</cfif>
					<cfif patientPhoneTBox_IN NEQ "">AND patientPhoneTBox IN(#trim(patientPhoneTBox_IN)#)</cfif>
					<cfif patientPhoneTBox_LIKE NEQ "">AND patientPhoneTBox LIKE '%#trim(patientPhoneTBox_LIKE)#%'</cfif>
					<cfif patientDOBMM NEQ "">AND patientDOBMM = '#patientDOBMM#'</cfif>
					<cfif patientDOBMM_IN NEQ "">AND patientDOBMM IN(#trim(patientDOBMM_IN)#)</cfif>
					<cfif patientDOBMM_LIKE NEQ "">AND patientDOBMM LIKE '%#trim(patientDOBMM_LIKE)#%'</cfif>
					<cfif patientDOBDD NEQ "">AND patientDOBDD = '#patientDOBDD#'</cfif>
					<cfif patientDOBDD_IN NEQ "">AND patientDOBDD IN(#trim(patientDOBDD_IN)#)</cfif>
					<cfif patientDOBDD_LIKE NEQ "">AND patientDOBDD LIKE '%#trim(patientDOBDD_LIKE)#%'</cfif>
					<cfif patientDOBYY NEQ "">AND patientDOBYY = '#patientDOBYY#'</cfif>
					<cfif patientDOBYY_IN NEQ "">AND patientDOBYY IN(#trim(patientDOBYY_IN)#)</cfif>
					<cfif patientDOBYY_LIKE NEQ "">AND patientDOBYY LIKE '%#trim(patientDOBYY_LIKE)#%'</cfif>
					<cfif OPTION_3a_CBox_PatientSexMale NEQ "">AND OPTION_3a_CBox_PatientSexMale = '#OPTION_3a_CBox_PatientSexMale#'</cfif>
					<cfif OPTION_3a_CBox_PatientSexMale_IN NEQ "">AND OPTION_3a_CBox_PatientSexMale IN(#trim(OPTION_3a_CBox_PatientSexMale_IN)#)</cfif>
					<cfif OPTION_3a_CBox_PatientSexMale_LIKE NEQ "">AND OPTION_3a_CBox_PatientSexMale LIKE '%#trim(OPTION_3a_CBox_PatientSexMale_LIKE)#%'</cfif>
					<cfif OPTION_3a_CBox_PatientSexFemale NEQ "">AND OPTION_3a_CBox_PatientSexFemale = '#OPTION_3a_CBox_PatientSexFemale#'</cfif>
					<cfif OPTION_3a_CBox_PatientSexFemale_IN NEQ "">AND OPTION_3a_CBox_PatientSexFemale IN(#trim(OPTION_3a_CBox_PatientSexFemale_IN)#)</cfif>
					<cfif OPTION_3a_CBox_PatientSexFemale_LIKE NEQ "">AND OPTION_3a_CBox_PatientSexFemale LIKE '%#trim(OPTION_3a_CBox_PatientSexFemale_LIKE)#%'</cfif>
					<cfif patientSSNTBox NEQ "">AND patientSSNTBox = '#patientSSNTBox#'</cfif>
					<cfif patientSSNTBox_IN NEQ "">AND patientSSNTBox IN(#trim(patientSSNTBox_IN)#)</cfif>
					<cfif patientSSNTBox_LIKE NEQ "">AND patientSSNTBox LIKE '%#trim(patientSSNTBox_LIKE)#%'</cfif>
					<cfif patientHeightFeet NEQ "">AND patientHeightFeet = '#patientHeightFeet#'</cfif>
					<cfif patientHeightFeet_IN NEQ "">AND patientHeightFeet IN(#trim(patientHeightFeet_IN)#)</cfif>
					<cfif patientHeightFeet_LIKE NEQ "">AND patientHeightFeet LIKE '%#trim(patientHeightFeet_LIKE)#%'</cfif>
					<cfif patientHeightInches NEQ "">AND patientHeightInches = '#patientHeightInches#'</cfif>
					<cfif patientHeightInches_IN NEQ "">AND patientHeightInches IN(#trim(patientHeightInches_IN)#)</cfif>
					<cfif patientHeightInches_LIKE NEQ "">AND patientHeightInches LIKE '%#trim(patientHeightInches_LIKE)#%'</cfif>
					<cfif patientWeightTBox NEQ "">AND patientWeightTBox = '#patientWeightTBox#'</cfif>
					<cfif patientWeightTBox_IN NEQ "">AND patientWeightTBox IN(#trim(patientWeightTBox_IN)#)</cfif>
					<cfif patientWeightTBox_LIKE NEQ "">AND patientWeightTBox LIKE '%#trim(patientWeightTBox_LIKE)#%'</cfif>
					<cfif alternateContactFNameTBox NEQ "">AND alternateContactFNameTBox = '#alternateContactFNameTBox#'</cfif>
					<cfif alternateContactFNameTBox_IN NEQ "">AND alternateContactFNameTBox IN(#trim(alternateContactFNameTBox_IN)#)</cfif>
					<cfif alternateContactFNameTBox_LIKE NEQ "">AND alternateContactFNameTBox LIKE '%#trim(alternateContactFNameTBox_LIKE)#%'</cfif>
					<cfif alternateContactMInitialTBox NEQ "">AND alternateContactMInitialTBox = '#alternateContactMInitialTBox#'</cfif>
					<cfif alternateContactMInitialTBox_IN NEQ "">AND alternateContactMInitialTBox IN(#trim(alternateContactMInitialTBox_IN)#)</cfif>
					<cfif alternateContactMInitialTBox_LIKE NEQ "">AND alternateContactMInitialTBox LIKE '%#trim(alternateContactMInitialTBox_LIKE)#%'</cfif>
					<cfif alternateContactLNameTBox NEQ "">AND alternateContactLNameTBox = '#alternateContactLNameTBox#'</cfif>
					<cfif alternateContactLNameTBox_IN NEQ "">AND alternateContactLNameTBox IN(#trim(alternateContactLNameTBox_IN)#)</cfif>
					<cfif alternateContactLNameTBox_LIKE NEQ "">AND alternateContactLNameTBox LIKE '%#trim(alternateContactLNameTBox_LIKE)#%'</cfif>
					<cfif alternateContactRelationshipTBox NEQ "">AND alternateContactRelationshipTBox = '#alternateContactRelationshipTBox#'</cfif>
					<cfif alternateContactRelationshipTBox_IN NEQ "">AND alternateContactRelationshipTBox IN(#trim(alternateContactRelationshipTBox_IN)#)</cfif>
					<cfif alternateContactRelationshipTBox_LIKE NEQ "">AND alternateContactRelationshipTBox LIKE '%#trim(alternateContactRelationshipTBox_LIKE)#%'</cfif>
					<cfif alternateContactPhoneTBox NEQ "">AND alternateContactPhoneTBox = '#alternateContactPhoneTBox#'</cfif>
					<cfif alternateContactPhoneTBox_IN NEQ "">AND alternateContactPhoneTBox IN(#trim(alternateContactPhoneTBox_IN)#)</cfif>
					<cfif alternateContactPhoneTBox_LIKE NEQ "">AND alternateContactPhoneTBox LIKE '%#trim(alternateContactPhoneTBox_LIKE)#%'</cfif>
					<cfif alternateContactWorkPhoneTBox NEQ "">AND alternateContactWorkPhoneTBox = '#alternateContactWorkPhoneTBox#'</cfif>
					<cfif alternateContactWorkPhoneTBox_IN NEQ "">AND alternateContactWorkPhoneTBox IN(#trim(alternateContactWorkPhoneTBox_IN)#)</cfif>
					<cfif alternateContactWorkPhoneTBox_LIKE NEQ "">AND alternateContactWorkPhoneTBox LIKE '%#trim(alternateContactWorkPhoneTBox_LIKE)#%'</cfif>
					<cfif primaryInsuranceNameTBox NEQ "">AND primaryInsuranceNameTBox = '#primaryInsuranceNameTBox#'</cfif>
					<cfif primaryInsuranceNameTBox_IN NEQ "">AND primaryInsuranceNameTBox IN(#trim(primaryInsuranceNameTBox_IN)#)</cfif>
					<cfif primaryInsuranceNameTBox_LIKE NEQ "">AND primaryInsuranceNameTBox LIKE '%#trim(primaryInsuranceNameTBox_LIKE)#%'</cfif>
					<cfif secondaryInsuranceNameTBox NEQ "">AND secondaryInsuranceNameTBox = '#secondaryInsuranceNameTBox#'</cfif>
					<cfif secondaryInsuranceNameTBox_IN NEQ "">AND secondaryInsuranceNameTBox IN(#trim(secondaryInsuranceNameTBox_IN)#)</cfif>
					<cfif secondaryInsuranceNameTBox_LIKE NEQ "">AND secondaryInsuranceNameTBox LIKE '%#trim(secondaryInsuranceNameTBox_LIKE)#%'</cfif>
					<cfif primaryPolicyNumberTBox NEQ "">AND primaryPolicyNumberTBox = '#primaryPolicyNumberTBox#'</cfif>
					<cfif primaryPolicyNumberTBox_IN NEQ "">AND primaryPolicyNumberTBox IN(#trim(primaryPolicyNumberTBox_IN)#)</cfif>
					<cfif primaryPolicyNumberTBox_LIKE NEQ "">AND primaryPolicyNumberTBox LIKE '%#trim(primaryPolicyNumberTBox_LIKE)#%'</cfif>
					<cfif secondaryPolicyNumberTBox NEQ "">AND secondaryPolicyNumberTBox = '#secondaryPolicyNumberTBox#'</cfif>
					<cfif secondaryPolicyNumberTBox_IN NEQ "">AND secondaryPolicyNumberTBox IN(#trim(secondaryPolicyNumberTBox_IN)#)</cfif>
					<cfif secondaryPolicyNumberTBox_LIKE NEQ "">AND secondaryPolicyNumberTBox LIKE '%#trim(secondaryPolicyNumberTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianFNameTBox NEQ "">AND orderingPhysicianFNameTBox = '#orderingPhysicianFNameTBox#'</cfif>
					<cfif orderingPhysicianFNameTBox_IN NEQ "">AND orderingPhysicianFNameTBox IN(#trim(orderingPhysicianFNameTBox_IN)#)</cfif>
					<cfif orderingPhysicianFNameTBox_LIKE NEQ "">AND orderingPhysicianFNameTBox LIKE '%#trim(orderingPhysicianFNameTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianMInitialTBox NEQ "">AND orderingPhysicianMInitialTBox = '#orderingPhysicianMInitialTBox#'</cfif>
					<cfif orderingPhysicianMInitialTBox_IN NEQ "">AND orderingPhysicianMInitialTBox IN(#trim(orderingPhysicianMInitialTBox_IN)#)</cfif>
					<cfif orderingPhysicianMInitialTBox_LIKE NEQ "">AND orderingPhysicianMInitialTBox LIKE '%#trim(orderingPhysicianMInitialTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianLNameTBox NEQ "">AND orderingPhysicianLNameTBox = '#orderingPhysicianLNameTBox#'</cfif>
					<cfif orderingPhysicianLNameTBox_IN NEQ "">AND orderingPhysicianLNameTBox IN(#trim(orderingPhysicianLNameTBox_IN)#)</cfif>
					<cfif orderingPhysicianLNameTBox_LIKE NEQ "">AND orderingPhysicianLNameTBox LIKE '%#trim(orderingPhysicianLNameTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianPhoneTBox NEQ "">AND orderingPhysicianPhoneTBox = '#orderingPhysicianPhoneTBox#'</cfif>
					<cfif orderingPhysicianPhoneTBox_IN NEQ "">AND orderingPhysicianPhoneTBox IN(#trim(orderingPhysicianPhoneTBox_IN)#)</cfif>
					<cfif orderingPhysicianPhoneTBox_LIKE NEQ "">AND orderingPhysicianPhoneTBox LIKE '%#trim(orderingPhysicianPhoneTBox_LIKE)#%'</cfif>
					<cfif printed NEQ "">AND printed = '#printed#'</cfif>
					<cfif printed_IN NEQ "">AND printed IN(#trim(printed_IN)#)</cfif>
					<cfif printed_LIKE NEQ "">AND printed LIKE '%#trim(printed_LIKE)#%'</cfif>
					<cfif Cancelled NEQ "">AND Cancelled = '#Cancelled#'</cfif>
					<cfif Cancelled_IN NEQ "">AND Cancelled IN(#trim(Cancelled_IN)#)</cfif>
					<cfif Cancelled_LIKE NEQ "">AND Cancelled LIKE '%#trim(Cancelled_LIKE)#%'</cfif>
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
			
			<cfreturn getQuoteQuery>
		
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


