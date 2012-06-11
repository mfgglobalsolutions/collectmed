
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.testmode" default="no">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="c:\eobmanager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="FinancialHistory_COMB_TAB_Temp.txt">
	<cfset filename = attributes.filename>
		
	<cfset count = 1>
	
	
	
<!------------------------------------------------------------------>
<!--- Set the timeout for the code to be able to run throughly.  --->
<!------------------------------------------------------------------>
	<cfsetting requestTimeOut = "900">
	
	
	
<!------------------------------------------------------------------>
<!--- Verify the needed variables were passed in.                --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="filename,filepath"
		fieldnames="File Name,File Path">	


	
<!------------------------------------------------------------------>
<!--- Include the files that contain the necessary javascript    --->
<!--- and cfscripts to run this page.                            --->
<!------------------------------------------------------------------>
	<cf_gcCFScriptIncludes>
	<cf_gcJScriptIncludes>



<!------------------------------------------------------------------>
<!--- Check to make sure the directory actually exists.          --->
<!------------------------------------------------------------------>
	<cfif NOT DirectoryExists("#trim(filepath)#\")>
		<cf_gcGeneralErrorTemplate
			message="The specified path does not exist (#trim(filepath)#).">
	</cfif>



<!------------------------------------------------------------------>
<!--- Check to make sure the file actually exists.               --->
<!------------------------------------------------------------------>
	<cfif NOT FileExists("#trim(filepath)#\#trim(fileName)#")>
		<cf_gcGeneralErrorTemplate
			message="The file you are trying to view is not in the specified path (#trim(filepath)#\#trim(fileName)#).">
	</cfif>



<!------------------------------------------------------------------>
<!--- Read the file that has been sent in and set it ue.         --->
<!------------------------------------------------------------------>
	<cffile
		action="READ"
		file="#trim(filepath)#\#trim(fileName)#" variable="fileContent">
		
		
		
<!------------------------------------------------------------------>
<!--- Output to the screen.                                      --->
<!------------------------------------------------------------------>		
	<cfif testmode>
		<font size="5" color="FF0000">RAN IN TEST MODE</font><p>
	<cfelse>
		<font size="5" color="FF0000">RAN IN LIVE MODE</font><p>	
	</cfif>
	
	
					
<!------------------------------------------------------------------>
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database.               --->
<!------------------------------------------------------------------>				
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">				
		
		<cftry>
				
				<cfif NOT testmode>					
					
					
						
						
									
			
			<cfset count = 1>		
			<!---<cfset siteID = "#trim(data.siteID)#">			
			<cfset clientID = "#trim(data.clientID)#">    	
			<cfset request.datasource = "#trim(data.datasource)#">
			<cfset supportEmailAddressID = "#trim(data.SupportEmailAddressID)#">  
			<cfset i = "#trim(data.dataString)#">  --->
				
			<cfset FirstName_1 = ListGetAt(i, 1, "|")>
			<cfset MI_2 = ListGetAt(i, 2, "|")>
			<cfset LName_3 = ListGetAt(i, 3, "|")>
			<cfset Address1_4 = ListGetAt(i, 4, "|")>
			<cfset Address2_5 = ListGetAt(i, 5, "|")>
			<cfset City_6 = ListGetAt(i, 6, "|")>
			<cfset ST_7 = ListGetAt(i, 7, "|")>
			<cfset Zip_8 = ListGetAt(i, 8, "|")>
			<cfset PhoneHome_9 = ListGetAt(i, 9, "|")>
			<cfset PhoneWork_10 = ListGetAt(i, 10, "|")>
			<cfset Ext_11 = ListGetAt(i, 11, "|")>
			<cfset Company_12 = ListGetAt(i, 12, "|")>
			<cfset DezineAcctNo_13 = ListGetAt(i, 13, "|")>
			<cfset AcctType_14 = ListGetAt(i, 14, "|")>
			<cfset SSN_15 = ListGetAt(i, 15, "|")>
			<cfset DOB_16 = ListGetAt(i, 16, "|")>
			<cfset Sex_17 = ListGetAt(i, 17, "|")>
			<cfset MarStat_18 = ListGetAt(i, 18, "|")>
			<cfset EmplStat_19 = ListGetAt(i, 19, "|")>
			<cfset StmtFormat_20 = ListGetAt(i, 20, "|")>
			<cfset CoordCare_21 = ListGetAt(i, 21, "|")>
			<cfset CustClass_22 = ListGetAt(i, 22, "|")>
			<cfset ShipTo_23 = ListGetAt(i, 23, "|")>
			<cfset ShipName_24 = ListGetAt(i, 24, "|")>
			<cfset CntFirst_25 = ListGetAt(i, 25, "|")>
			<cfset CntLast_26 = ListGetAt(i, 26, "|")>
			<cfset Address1_27 = ListGetAt(i, 27, "|")>
			<cfset Address2_28 = ListGetAt(i, 28, "|")>
			<cfset City_29 = ListGetAt(i, 29, "|")>
			<cfset State_30 = ListGetAt(i, 30, "|")>
			<cfset Zip_31 = ListGetAt(i, 31, "|")>
			<cfset Phone_32 = ListGetAt(i, 32, "|")>
			<cfset Ext_33 = ListGetAt(i, 33, "|")>
			<cfset Employer_34 = ListGetAt(i, 34, "|")>
			<cfset EmpName_35 = ListGetAt(i, 35, "|")>
			<cfset CNTFIRSTNAMEEMPINFO_36 = ListGetAt(i, 36, "|")>
			<cfset CNTLNAMEEMPINFO_37 = ListGetAt(i, 37, "|")>
			<cfset Address1_38 = ListGetAt(i, 38, "|")>
			<cfset Address2_39 = ListGetAt(i, 39, "|")>
			<cfset City_40 = ListGetAt(i, 40, "|")>
			<cfset State_41 = ListGetAt(i, 41, "|")>
			<cfset Zip_42 = ListGetAt(i, 42, "|")>
			<cfset Phone_43 = ListGetAt(i, 43, "|")>
			<cfset Ext_44 = ListGetAt(i, 44, "|")>
			
			<cfset Payor1_45 = ListGetAt(i, 45, "|")>
			<cfset PayorName1_46 = ListGetAt(i, 46, "|")>
			<cfset Deductable_47 = ListGetAt(i, 47, "|")>
			<cfset PayPercentage_48 = ListGetAt(i, 48, "|")>
			<cfset Address1_49 = ListGetAt(i, 49, "|")>
			<cfset Address2_50 = ListGetAt(i, 50, "|")>
			<cfset City_51 = ListGetAt(i, 51, "|")>
			<cfset State_52 = ListGetAt(i, 52, "|")>
			<cfset Zip_53 = ListGetAt(i, 53, "|")>
			<cfset CNTName_54 = ListGetAt(i, 54, "|")>
			<cfset PolicyNumber_55 = ListGetAt(i, 55, "|")>
			<cfset GROUPNumber_56 = ListGetAt(i, 56, "|")>
			<cfset Phone_57 = ListGetAt(i, 57, "|")>
			<cfset Ext_58 = ListGetAt(i, 58, "|")>
			<cfset Relation_59 = ListGetAt(i, 59, "|")>
			<cfset LName_60 = ListGetAt(i, 60, "|")>
			<cfset FName_61 = ListGetAt(i, 61, "|")>
			<cfset DOB_62 = ListGetAt(i, 62, "|")>
			<cfset Sex_63 = ListGetAt(i, 63, "|")>
			
			<cfset Payor2_64 = ListGetAt(i, 64, "|")>
			<cfset PayName2_65 = ListGetAt(i, 65, "|")>
			<cfset Deductablr_66 = ListGetAt(i, 66, "|")>
			<cfset PayPercentage_67 = ListGetAt(i, 67, "|")>
			<cfset Address1_68 = ListGetAt(i, 68, "|")>
			<cfset Address2_69 = ListGetAt(i, 69, "|")>
			<cfset City_70 = ListGetAt(i, 70, "|")>
			<cfset State_71 = ListGetAt(i, 71, "|")>
			<cfset Zip_72 = ListGetAt(i, 72, "|")>
			<cfset CNTName_73 = ListGetAt(i, 73, "|")>
			<cfset PolicyNumber_74 = ListGetAt(i, 74, "|")>
			<cfset GroupNumber_75 = ListGetAt(i, 75, "|")>
			<cfset Phone_76 = ListGetAt(i, 76, "|")>
			<cfset Ext_77 = ListGetAt(i, 77, "|")>
			<cfset REL_78 = ListGetAt(i, 78, "|")>
			<cfset LName_79 = ListGetAt(i, 79, "|")>
			<cfset FName_80 = ListGetAt(i, 80, "|")>
			<cfset DOB_81 = ListGetAt(i, 81, "|")>
			<cfset Sex_82 = ListGetAt(i, 82, "|")>
			
			<cfset Payor3_83 = ListGetAt(i, 83, "|")>
			<cfset PayName3_84 = ListGetAt(i, 84, "|")>
			<cfset Deductable_85 = ListGetAt(i, 85, "|")>
			<cfset PayPercentage_86 = ListGetAt(i, 86, "|")>
			<cfset Address1_87 = ListGetAt(i, 87, "|")>
			<cfset Address2_88 = ListGetAt(i, 88, "|")>
			<cfset City_89 = ListGetAt(i, 89, "|")>
			<cfset State_90 = ListGetAt(i, 90, "|")>
			<cfset Zip_91 = ListGetAt(i, 91, "|")>
			<cfset CNTName_92 = ListGetAt(i, 92, "|")>
			<cfset PolicyNumber_93 = ListGetAt(i, 93, "|")>
			<cfset GroupNumber_94 = ListGetAt(i, 94, "|")>
			<cfset Phone_95 = ListGetAt(i, 95, "|")>
			<cfset Ext_96 = ListGetAt(i, 96, "|")>
			<cfset REL_97 = ListGetAt(i, 97, "|")>
			<cfset LName_98 = ListGetAt(i, 98, "|")>
			<cfset FName_99 = ListGetAt(i, 99, "|")>
			<cfset DOB_100 = ListGetAt(i, 100, "|")>
			<cfset Sex_101 = ListGetAt(i, 101, "|")>
			
			<cfset ClaimSubmitterIdentifier_102 = ListGetAt(i, 102, "|")>
			<cfset ClaimSubmitterIdentifier_102 = NumberFormat(ClaimSubmitterIdentifier_102, "00000")>
			
			
			<cfif trim(FirstName_1) NEQ "NULL" AND trim(LName_3) NEQ "NULL">
						
				<cfif trim(FirstName_1) NEQ "NULL">			
					<cfset thisFName = trim(FirstName_1)>					
					<cfset First = "#trim(thisFName)#">
				<cfelse>
					<cfset First = "NULL">
				</cfif>
				
				<cfif trim(MI_2) NEQ "NULL">
					<cfset Middle = "#trim(MI_2)#">
				<cfelse>
					<cfset Middle = "NULL">
				</cfif>
				
				<cfif trim(LName_3) NEQ "NULL">			
					<cfset thisLName = trim(LName_3)>					
					<cfset Last = "#trim(thisLName)#">
				<cfelse>
					<cfset Last = "NULL">
				</cfif>
								
				<cfif LEN(DOB_16) EQ 8 AND DOB_16 NEQ "NULL">
					<cfset dobYear = MID(DOB_16, 1, 4)> 
					<cfset dobMonth = MID(DOB_16, 5, 2)> 
					<cfset dobDay = MID(DOB_16, 7, 2)>
					<cfset dobDate = CreateODBCDate(CreateDate(dobYear, dobMonth, dobDay))>		
				<cfelse>
					<cfset dobDate = "NULL">
				</cfif>
				
				<cfif trim(Sex_17) EQ "F">
					<cfset Sex = 1>
				<cfelseif trim(Sex_17) EQ "M">
					<cfset Sex = 0>
				<cfelse>
					<cfset Sex = "NULL">	
				</cfif>
						
				<cfif trim(SSN_15) NEQ "NULL" AND trim(SSN_15) NEQ "NULL">
					<cfset SSN = "#trim(SSN_15)#">				
				<cfelse>
					<cfset SSN = "NULL">	
				</cfif>
								
				<cfif trim(MarStat_18) NEQ "NULL">
					<cfif trim(MarStat_18) EQ "S">
						<cfset MaritalStatus = 231>
					<cfelseif trim(MarStat_18) EQ "M">
						<cfset MaritalStatus = 232>							
					<cfelseif trim(MarStat_18) EQ "W" AND Sex EQ 0>
						<cfset MaritalStatus = 234>
					<cfelseif trim(MarStat_18) EQ "W" AND Sex EQ 1>
						<cfset MaritalStatus = 233>	
					<cfelseif trim(MarStat_18) EQ "D">
						<cfset MaritalStatus = 235>		
					<cfelse><!---if trim(MarStat_18) EQ "O"--->
						<cfset MaritalStatus = 236>					
					</cfif>
				<cfelse>	
					<cfset MaritalStatus = "NULL">	
				</cfif>
				
			
			<cfquery name="getEntity" datasource="PAClient_1088">
				SELECT entityID
				FROM entity
				WHERE ObjectTypeID = 3 AND Fname <cfif First EQ "NULL">IS NULL<cfelse> = '#trim(First)#'</cfif> AND  Mname <cfif Middle EQ "NULL">IS NULL<cfelse> = '#trim(Middle)#'</cfif> AND  Lname <cfif Last EQ "NULL">IS NULL<cfelse> = '#trim(Last)#'</cfif> AND  DOB <cfif dobDate EQ "NULL">IS NULL<cfelse>= #trim(dobDate)#</cfif> AND  Sex <cfif Sex EQ "NULL">IS NULL<cfelse>= #trim(Sex)#</cfif> AND  SSN <cfif SSN EQ "NULL">IS NULL<cfelse> = '#trim(SSN)#'</cfif>							
			</cfquery>
			
			<cfif getEntity.recordCount GTE 1>			
				<cfquery name="getPat" datasource="PAClient_1088">
					SELECT ClientPatientID
					FROM patient
					WHERE entityID = #getEntity.entityID#
				</cfquery>
				<cfoutput><font size="1">{#getPat.ClientPatientID#}</font></cfoutput>
			</cfif>
							
				
			<cfoutput>		
				<font size="1">[#trim(ClaimSubmitterIdentifier_102)#] <cfif First EQ "NULL">NULL<cfelse>'#trim(First)#'</cfif>, <cfif Middle EQ "NULL">NULL<cfelse>'#trim(Middle)#'</cfif>, <cfif Last EQ "NULL">NULL<cfelse>'#trim(Last)#'</cfif>, #trim(dobDate)#, #trim(Sex)#, <cfif SSN EQ "NULL">NULL<cfelse>'#trim(SSN)#'</cfif>, #trim(MaritalStatus)#</font><br>
			</cfoutput>
			
			</cfif>
													
			<!---<cfset tempClear = StructClear(Request)>	--->				
    
									
					
				</cfif>				
				
				
		
			<cfset count = count + 1>
			
		
		
			<cfcatch type="Any">
				
				<!---<cfoutput>
					<font color="FF0000">[#count#][INSERT NEW]<br><p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p> The contents of the tag stack are:</font><br><cfdump var="#cfcatch.tagcontext#">  	
				</cfoutput>
				<cfabort>--->
				
			</cfcatch>
			
		</cftry>
		
	</cfloop>
					
	


