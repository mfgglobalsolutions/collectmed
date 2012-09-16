

<cfcomponent>

	<cfset variables.objToXML = application.beanFactory.getBean("old_toXML") />
		
	<cffunction name="wsAddPatient" access="remote" returntype="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="First Name" required="true">
		<cfargument name="Data4" type="string" hint="Last Name" required="true">
		<cfargument name="Data5" type="string" hint="DOB" required="true">		
		<cfargument name="Data6" type="string" hint="Middle Name" required="false" default="">
		<cfargument name="Data7" type="string" hint="Sex" required="false" default="0">
		<cfargument name="Data8" type="string" hint="SSN" required="false" default="">
		<cfargument name="Data9" type="string" hint="Object Type ID" required="false" default="">
		<cfargument name="Data10" type="string" hint="Policy Number" required="false" default="">
		<cfargument name="Data11" type="string" hint="Insurance Company ID" required="false" default="">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.UserID = arguments.Data2>
		<cfset variables.FName = arguments.Data3>
		<cfset variables.LName = arguments.Data4>
		<cfset variables.DOB = arguments.Data5>
		<cfset variables.MName = arguments.Data6>
		<cfset variables.Sex = arguments.Data7>
		<cfset variables.SSN = arguments.Data8>
		<cfset variables.ObjectTypeID = arguments.Data9>
		<cfset variables.PolicyNumber = arguments.Data10>
		<cfset variables.InsuranceCompanyID = arguments.Data11>

						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<!--------------------------------------------------------------------------------------->
			<!--- Search for this patient first, if found just return them.                       --->			
			<!--------------------------------------------------------------------------------------->
			<cfset variables.findPatient = wsSearchPatientsPlainXML(
				Data1: variables.ClientID,
				Data2: variables.UserID,
				Data3: variables.FName,
				Data4: variables.LName,
				Data5: variables.SSN,
				Data6: Month(variables.DOB),
				Data7: Day(variables.DOB),
				Data8: Year(variables.DOB)								
			)>					
			<cfset variables.xmlPatients = xmlsearch(variables.findPatient, "PATIENTS/PATIENT")>			
			<cfif arrayLen(variables.xmlPatients) GTE 1>				
				<cfset xmlFalse = variables.objToXML.stringToXML(
																data: "<PATIENTID>#variables.xmlPatients[1].PATIENTID.xmlText#</PATIENTID>",
																rootelement: "ENTITY",
																itemelement: "NEWPATIENT"
																) />
				
				<cfreturn xmlFalse>
			</cfif>

			<!--------------------------------------------------------------------------------------->
			<!--- Check that the userID sent in belongs to the Client                             --->
			<!--------------------------------------------------------------------------------------->			
			<cfset variables.Security = application.beanFactory.getBean('old_Security')>
			<cfset variables.Client = application.beanFactory.getBean('old_Client')>
			<cfif NOT variables.Security.AuthenticateUserToClient(variables.ClientID, variables.UserID, variables.Client)>
				<cfset xmlFalse = variables.objToXML.stringToXML(
																data: "<PATIENTID>You cannot create patients under this client. Please contact an administrator if you feel you are receiving this message in error.</PATIENTID>",
																rootelement: "ENTITY",
																itemelement: "NEWPATIENT"
																) />
				<cfreturn xmlFalse>				
			</cfif>
			
			
			<cfset Patient = application.beanFactory.getBean("Patient") />		
			<cfset Entity = application.beanFactory.getBean("Entity") />			
			<cfset Entity.setFName(variables.FName)>
			<cfset Entity.setMName(variables.MName)>
			<cfset Entity.setLName(variables.LName)>		
			<cfset Entity.setDOB(trim(variables.DOB))>	
			<cfset Entity.setSex(variables.Sex)>
			<cfset Entity.setSSN(variables.SSN)>
			<cfset Entity.setObjectTypeID(variables.ObjectTypeID)>
			<cfset EntityID = Entity.commit()>					
			
			<cfset Patient.setEntityID(trim(EntityID))>
			<cfset patientID = Patient.commit()>

		
			<!--------------------------------------------------------------------------------------->
			<!--- If the Ins Com ID came in and a Policy Number came in we have                   --->
			<!--- enough to save a PatientInsuranceCompany Record.                                --->
			<!--------------------------------------------------------------------------------------->
			<cfif variables.PolicyNumber NEQ "" AND isNumeric(PatientID) AND isNumeric(variables.InsuranceCompanyID)>				
							
				<cfset variables.PatientInsuranceCompany = application.beanFactory.getBean("PatientInsuranceCompanyIO") />		
				<cfset variables.PatientInsuranceCompany.setInsuranceCompanyID(trim(variables.InsuranceCompanyID))>
				<cfset variables.PatientInsuranceCompany.setPatientID(trim(patientID))>
				<cfset variables.PatientInsuranceCompany.setPrimSecTer(1)> 
				<cfset variables.PatientInsuranceCompany.setPolicyNumber(trim(variables.PolicyNumber))>
				<cfset variables.PatientInsuranceCompany.setPolicyHoldersSex(variables.Sex)>
				<cfset variables.PatientInsuranceCompany.setPolicyHoldersFirstName(trim(variables.FName))>
				<cfset variables.PatientInsuranceCompany.setPolicyHoldersMiddleInitial(LEFT(trim(variables.MName), 1))>
				<cfset variables.PatientInsuranceCompany.setPolicyHoldersLastName(trim(variables.LName))>
				<cfset variables.PatientInsuranceCompany.setPolicyHoldersDOB(trim(variables.DOB))>			
				<cfset variables.PatientInsuranceCompany.commit()>
								
			</cfif>
			
									
			<cfif patientID>				
				<cfset xmlPatient = variables.objToXML.stringToXML(
																	data: "<PATIENTID>#variables.patientID#</PATIENTID>",
																	rootelement: "ENTITY",
																	itemelement: "NEWPATIENT"
																) />
				<cfreturn xmlPatient>
			<cfelse>
				<cfset xmlFalse = variables.objToXML.stringToXML(
																	data: "<PATIENTID>false</PATIENTID>",
																	rootelement: "ENTITY",
																	itemelement: "NEWPATIENT"
																) />
				<cfreturn xmlFalse>
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 



	<cffunction name="wsGetPatient" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset patientID = Data2>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset Patient = application.beanFactory.getBean("Patient").getPatient(clientID: "#trim(ClientID)#",	patientid: "#trim(patientID)#") />						
												
			<cfif Patient NEQ "">				
				<cfreturn Patient>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

	
	
	<cffunction name="wsGetPatientInsCom" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset patientID = Data2>
			
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
						
			<!---This code will not work for whatever reason. Will need to be looked later.
			<cfset request.Patient = CreateObject("component","com.common.Patient")>	
			<cfset PatientIns = request.Patient.getPatientInsCom(clientID: trim(clientID), patientid: trim(patientID))>--->
						
			<cfquery name="PatientIns" datasource="paclient_#ClientID#">
				SELECT pic.recordID, pic.Deductible, pic.GroupName, pic.GroupNumber, ic.InsuranceCompanyDBA, pic.InsuranceCompanyID, ic.InsuranceCompanyName, pic.PayPercentage, pic.PolicyHoldersAddressLine1, pic.PolicyHoldersAddressLine2, pic.PolicyHoldersCity,  pic.PolicyHoldersDOB AS PolicyHoldersDOB, pic.PolicyHoldersEffectiveDateFrom, pic.PolicyHoldersEffectiveDateTo, pic.PolicyHoldersEmployerSchoolName, pic.PolicyHoldersFirstName, pic.PolicyHoldersLastName, pic.PolicyHoldersMiddleInitial, pic.PolicyHoldersPhone, pic.PolicyHoldersPhoneExtension, pic.PolicyHoldersSex, pic.PolicyHoldersStateID, pic.PolicyHoldersZipCode, pic.PolicyNumber, pic.PrimSecTer, pic.Relationship, ic.EntityID AS Z_ICEntityID
				FROM patientinsurancecompany pic
				INNER JOIN insurancecompany ic ON pic.InsuranceCompanyID = ic.InsuranceCompanyID
				WHERE  pic.patientID = #trim(patientID)# AND pic.Active = 1 
				Order By  pic.PrimSecTer
			</cfquery> 
								
			<cfif IsQuery(PatientIns) AND PatientIns.RecordCount GTE 1>			
				<cfset verificationsArray = ArrayNew(1)>	
				<cfset verificationsXmlArray = ArrayNew(1)>	
				<cfloop query="PatientIns">
					<cfset thisString = "">
					<cfquery name="getVerifications" datasource="paclient_#ClientID#">
						SELECT vpi.VerificationPatientInsuranceID, vpi.DateCreated AS DateCreated, vpi.VerificationDateAS VerificationDate, vpi.VerificationTime,
						CONCAT(vu.FName, ' ', vu.LName) AS Fullname, vpi.VerificationRepFName, vpi.VerificationRepLName, vpi.VerificationHaveInsFromDateAS VerificationHaveInsFromDate, vpi.VerificationHaveInsToDateAS VerificationHaveInsToDate						 
						FROM verificationpatientinsurance vpi		
						LEFT JOIN view_useraccountparameters vu on vpi.UsersID = vu.UsersID			
						WHERE vpi.picID = #trim(recordID)# AND vpi.Active = 1
						ORDER BY vpi.DateCreated DESC				
					</cfquery> 
					<cfloop query="getVerifications">
						<cfset temp = trim(VerificationPatientInsuranceID) & "|" & trim(DateCreated)>
						<cfset thisString = ListAppend(thisString, temp, "~")>
					</cfloop>					
					<cfset verificationsArray[PatientIns.CurrentRow] = "#trim(thisString)#">	
										
					<cfset local.xmlPatientInsComVer = variables.objToXML.queryToXML(
																				includeheader: "false",
																				data: "#getVerifications#",
																				rootelement: "VERIFICATIONS",
																				itemelement: "VERIFICATION"
																			) />
																			
					<cfset verificationsXmlArray[PatientIns.CurrentRow] = "#trim(local.xmlPatientInsComVer)#">					
					
				</cfloop>		
					
				<cfset QueryAddColumn(PatientIns, "Verifications", "VarChar", verificationsArray)>
				<cfset QueryAddColumn(PatientIns, "VerificationsXml", "VarChar", verificationsXmlArray)>
				
				<cfreturn PatientIns>
				
			<cfelse>
			
				<cfreturn false>	
				
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	<!--------------------------------------------------------------------------------------------->
	<!--- Be vary careful changing this function this gets fed to javascript via a web service. --->
	<!--------------------------------------------------------------------------------------------->	
	<cffunction name="wsGetPatientInsComString" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset patientID = Data2>
			
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset returnList = "">			
				
			<cfset temp = wsGetPatientInsCom(data1: clientID, data2: patientID)>			
			
			<cfif IsQuery(temp)>
			
				<cfloop from="1" to="#temp.recordcount#" index="u">
					<cfset returnList = returnList & "~">
					<cfloop list="#temp.ColumnList#" index="i_col">
						<cfset column = "temp.#i_col#[#trim(u)#]">																										
						<cfif evaluate(column) NEQ "">	
							<cfif IsDate(evaluate(column))>
								<cfset returnList = listAppend(returnList, "#DateFormat(trim(evaluate(column)), 'mm/dd/yyyy')#", "|")>	
							<cfelse>	
								<cfset returnList = listAppend(returnList, "#trim(evaluate(column))#", "|")>							
							</cfif>
						<cfelse>						
							<cfset returnList = listAppend(returnList, "@@", "|")><!---this is super important to put a space here. The Web Service expects it to work with Javascript. --->												
						</cfif>														
					</cfloop>					
				</cfloop>
				
				<cfset returnList = Replace(returnList, CHR(9), CHR(124), "ALL")>
				<cfset returnList = Replace(returnList, "||", "|@@|", "ALL")>
				<cfset returnList = Replace(returnList, "|""", CHR(124), "ALL")>
				<cfset returnList = Replace(returnList, """|", CHR(124), "ALL")>				
				<cfif Left(returnList, 1) EQ "|">
					<cfset returnList = returnList & "@@">
				</cfif>				
				<cfif Right(returnList, 1) EQ "|">
					<cfset returnList = returnList & "@@">
				</cfif>
				
				<!---<cffile action="write" file="c:\temp\thisNOW.txt" output="#returnList#" addnewline="no">--->
						
				<cfreturn returnList>
				
			<cfelse>
				
				<cfreturn false>	
			
			</cfif>
					
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	<cffunction name="wsGetPatientInsComXML" access="remote" returnType="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset PatientID = Data2>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<cfset temp = wsGetPatientInsCom(data1: clientID, data2: patientID)>			
			
			<cfif NOT IsQuery(temp)>
				<cfset temp = querynew("recordID")>
			</cfif>
			
			<cfset local.xmlPatientInsCom = variables.objToXML.queryToXML(
																				data: "#temp#",
																				preserveXML: "true",
																				rootelement: "INSURANCES", 
																				itemelement: "INSURANCE"
																			) />
																																						
			<cfif local.xmlPatientInsCom NEQ "">				
				<cfreturn local.xmlPatientInsCom>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
<!--- This function with retruntype string will have to be removedafter analysis --->	
	<cffunction name="wsSearchPatientsXML" access="remote" returnType="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="First Name" required="false" default="">
		<cfargument name="Data4" type="string" hint="Last Name" required="false" default="">
		<cfargument name="Data5" type="string" hint="SSN" required="false" default="">
		<cfargument name="Data6" type="string" hint="DOB Month" required="false" default="">
		<cfargument name="Data7" type="string" hint="DOB Day" required="false" default="">
		<cfargument name="Data8" type="string" hint="DOB Year" required="false" default="">
		
		<cfset ClientID = Data1>
		<cfset UserID = Data2>
		<cfset FName = Data3>
		<cfset LName = Data4>
		<cfset SSN = Data5>
		<cfset DOBMM = Data6>
		<cfset DOBDD = Data7>
		<cfset DOBYY = Data8>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<cfsavecontent variable="sqlStatement">			
				<cfoutput>
					SELECT p.EntityID, p.PatientID, e.PrefixName, e.FName, LEFT(e.Mname, 1) AS Mname, e.LName, e.SSN, e.DOB as DOB, e.Sex, e.Weight, e.HeightinInches, e.MaritalStatus <!---, a.addressline1, a.addressline2, City, StateID, sli.ItemNameDisplay, ZipCode--->   
					FROM patient p
					INNER JOIN entity e ON p.EntityID = e.EntityID				
					WHERE 1 =1 
					<cfif LName NEQ "">
						AND e.LName LIKE '#trim(LName)#%'
					</cfif>
					<cfif FName NEQ "">
						AND e.FName LIKE '#trim(FName)#%'
					</cfif>		
					<cfif SSN NEQ "">
						AND e.SSN LIKE '%#trim(SSN)#%'
					</cfif>	
					<cfif DOBMM NEQ "" AND DOBDD NEQ "" AND DOBYY NEQ "">					
						<cfset DOB = CreateDateTime(trim(DOBYY), trim(DOBMM), trim(DOBDD), 0, 0, 0)>	
						<cfif DOB NEQ ""> AND e.DOB BETWEEN '#DateFormat(trim(DOB), "YYYY-MM-DD")#' AND '#DateFormat(trim(DOB), "YYYY-MM-DD")# 23:59:59.997'</cfif>						
					<cfelseif DOBYY NEQ "">					
						AND DATEPART(year, e.DOB) = #trim(DOBYY)#
					</cfif>								
				</cfoutput>			
			</cfsavecontent>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Run the query that was just built.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="temp" datasource="PAClient_#trim(ClientID)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>
			
			<cfif NOT IsQuery(temp)>
				<cfset temp = querynew("patientID")>
			</cfif>
			
			<cfset local.xmlPatients = variables.objToXML.queryToXML(
																		data: "#temp#",
																		preserveXML: "true",
																		rootelement: "PATIENT", 
																		itemelement: "PATIENT"
																	) />
																			
			<cfif local.xmlPatients NEQ "">				
				<cfreturn local.xmlPatients>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
<!--- ASAP The function above needs to be get rid off in place of this one which returns plain XML --->	
	<cffunction name="wsSearchPatientsPlainXML" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="First Name" required="false" default="">
		<cfargument name="Data4" type="string" hint="Last Name" required="false" default="">
		<cfargument name="Data5" type="string" hint="SSN" required="false" default="">
		<cfargument name="Data6" type="string" hint="DOB Month" required="false" default="">
		<cfargument name="Data7" type="string" hint="DOB Day" required="false" default="">
		<cfargument name="Data8" type="string" hint="DOB Year" required="false" default="">
		<cfargument name="Data9" type="numeric" hint="PatientID" required="false" default="0">
		<cfargument name="Data10" type="string" hint="InsurancePolicyID" required="false" default="">
		<cfargument name="Data11" type="string" hint="InsuranceCompanyID" required="false" default="">

		<cfscript>
			var ClientID = arguments.Data1;
			var UserID = arguments.Data2;
			var FName = arguments.Data3;
			var LName = arguments.Data4;
			var SSN = arguments.Data5;
			var DOBMM = arguments.Data6;
			var DOBDD = arguments.Data7;
			var DOBYY = arguments.Data8;
			var PatientID = arguments.Data9;
			var InsurancePolicyID = arguments.Data10;
			var InsuranceCompanyID = arguments.Data11;
		</cfscript>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
				
			<cfset temp = searchPatientQuery(ClientID, UserID, FName, LName, SSN, DOBMM, DOBDD, DOBYY, PatientID, InsurancePolicyID, InsuranceCompanyID)>
						
			<cfset local.xmlPatients = variables.objToXML.queryToXML(
																		data: "#temp#",
																		rootelement: "PATIENTS", 
																		itemelement: "PATIENT"
																	) />																			
			<cfif local.xmlPatients NEQ "">				
				<cfreturn local.xmlPatients>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	


	<cffunction name="wsGetPatientGroupsXML" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">		
		<cfargument name="Data3" type="string" hint="Patient IDs" required="true">

		<cfscript>
			var ClientID = arguments.Data1;
			var UserID = arguments.Data2;			
			var PatientIDs = urlDecode(arguments.Data3);// CAN COME IN ENCODED SO DECODE.			
		</cfscript>
					
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset variables.temp = searchPatientQuery(Data1: ClientID, Data2: UserID, Data9: PatientIDs)>
		
			<cfset local.xmlPatients = variables.objToXML.queryToXML(
																		data: "#variables.temp#",																		
																		rootelement: "PATIENTS", 
																		itemelement: "PATIENT"
																	) />																				
			<cfif local.xmlPatients NEQ "">				
				<cfreturn local.xmlPatients>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cflog file="testing" text="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><error>#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#</error>">				
										
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

	
	<cffunction name="searchPatientQuery" returnType="query" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="First Name" required="false" default="">
		<cfargument name="Data4" type="string" hint="Last Name" required="false" default="">
		<cfargument name="Data5" type="string" hint="SSN" required="false" default="">
		<cfargument name="Data6" type="string" hint="DOB Month" required="false" default="">
		<cfargument name="Data7" type="string" hint="DOB Day" required="false" default="">
		<cfargument name="Data8" type="string" hint="DOB Year" required="false" default="">
		<cfargument name="Data9" type="string" hint="PatientID" required="false" default="0">
		<cfargument name="Data10" type="string" hint="InsurancePolicyID" required="false" default="">
		<cfargument name="Data11" type="string" hint="InsuranceCompanyID" required="false" default="">
		
		<cfscript>
			var ClientID = arguments.Data1;
			var UserID = arguments.Data2;
			var FName = arguments.Data3;
			var LName = arguments.Data4;
			var SSN = arguments.Data5;
			var DOBMM = arguments.Data6;
			var DOBDD = arguments.Data7;
			var DOBYY = arguments.Data8;
			var PatientID = arguments.Data9;
			var InsurancePolicyID = arguments.Data10;
			var InsuranceCompanyID = arguments.Data11;
		</cfscript>
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<cfsavecontent variable="sqlStatement">			
				<cfoutput>
					SELECT p.EntityID, p.PatientID, e.PrefixName, e.FName, LEFT(e.Mname, 1) AS Mname, e.LName, e.SSN, CONCAT(MONTH(e.DOB), '/', DAY(e.DOB), '/', YEAR(e.DOB)) AS DOB, e.Sex, e.Weight, e.HeightinInches, e.MaritalStatus 
					<cfif isNumeric(InsuranceCompanyID)>
						,pic.PolicyNumber
					</cfif>	
					FROM patient p
					INNER JOIN entity e ON p.EntityID = e.EntityID
					<cfif isNumeric(InsuranceCompanyID)>
						LEFT JOIN patientinsurancecompany pic ON pic.PatientID = p.PatientID AND pic.InsuranceCompanyID = #trim(InsuranceCompanyID)#
					</cfif>				
					WHERE 1 =1 
					<cfif LName NEQ "">
						AND e.LName LIKE '#trim(LName)#%'
					</cfif>
					<cfif FName NEQ "">
						AND e.FName LIKE '#trim(FName)#%'
					</cfif>		
					<cfif SSN NEQ "">
						AND e.SSN LIKE '%#trim(SSN)#%'
					</cfif>	
					<cfif DOBMM NEQ "" AND DOBDD NEQ "" AND DOBYY NEQ "">					
						<cfset DOB = CreateDateTime(trim(DOBYY), trim(DOBMM), trim(DOBDD), 0, 0, 0)>	
						<cfif DOB NEQ ""> AND e.DOB BETWEEN '#DateFormat(trim(DOB), "YYYY-MM-DD")#' AND '#DateFormat(trim(DOB), "YYYY-MM-DD")# 23:59:59.997'</cfif>						
					<cfelseif DOBYY NEQ "">					
						AND DATEPART(year, e.DOB) = #trim(DOBYY)#
					</cfif>	
					<cfif PatientID GT 0>
						AND p.PatientID IN(#trim(PatientID)#)
					</cfif>	
					<cfif InsurancePolicyID NEQ "">
						AND pic.PolicyNumber LIKE '%#trim(InsurancePolicyID)#%'
					</cfif>											
				</cfoutput>			
			</cfsavecontent>	
		
			<!-------------------------------------------------------------------------------------->
			<!--- Run the query that was just built.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="temp" datasource="PAClient_#trim(ClientID)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>
		
			<cfif NOT IsQuery(temp)>
				<cfset temp = querynew("patientID")>
			</cfif>
			
			<cfreturn temp>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>


	
</cfcomponent>

	




