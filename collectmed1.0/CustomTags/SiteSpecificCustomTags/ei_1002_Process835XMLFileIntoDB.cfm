

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.debug" default="yes">
	<cfset debug = attributes.debug>
		
	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>
	
	<cfif IsDefined("form.clientID") AND form.clientID NEQ "">
		<cfset clientID = form.clientID>
	<cfelseif IsDefined("url.clientID") AND url.clientID NEQ "">
		<cfset clientID = url.clientID>	
	</cfif>
	
	<cfparam name="attributes.fileID" default="">
	<cfset fileID = attributes.fileID>
	
	<cfif IsDefined("form.fileID") AND form.fileID NEQ "">
		<cfset fileID = form.fileID>
	<cfelseif IsDefined("url.fileID") AND url.fileID NEQ "">
		<cfset fileID = url.fileID>	
	</cfif>
	
	<cfparam name="attributes.delFileID" default="">
	<cfset delFileID = attributes.delFileID>
	
	<cfif IsDefined("form.delFileID") AND form.delFileID NEQ "">
		<cfset delFileID = form.delFileID>
	<cfelseif IsDefined("url.delFileID") AND url.delFileID NEQ "">
		<cfset delFileID = url.delFileID>	
	</cfif>
	
	<cfparam name="attributes.SupportEmailAddressID" default="">
	<cfset SupportEmailAddressID = attributes.SupportEmailAddressID>
	
	<cfif IsDefined("form.SupportEmailAddressID") AND form.SupportEmailAddressID NEQ "">
		<cfset SupportEmailAddressID = form.SupportEmailAddressID>
	<cfelseif IsDefined("url.SupportEmailAddressID") AND url.SupportEmailAddressID NEQ "">
		<cfset SupportEmailAddressID = url.SupportEmailAddressID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Wrap all processing in a try block.                                            --->
<!-------------------------------------------------------------------------------------->	
	<cftry>		
	
			<!-------------------------------------------------------------------------------------->
			<!--- Verify that the needed parameters have been sent in.                           --->
			<!-------------------------------------------------------------------------------------->
			<cf_gcVerifyFields
				fields="clientID,fileID,SupportEmailAddressID"
				fieldnames="Client ID,File ID,Support Email Address ID"
				datatypes="numeric,numeric,numeric">
				
				
							
			<!-------------------------------------------------------------------------------------->
			<!--- Create the File object.                                                        --->
			<!-------------------------------------------------------------------------------------->		
			<cfset request.File = CreateObject("component","com.common.File")>	
			
					
			<!-------------------------------------------------------------------------------------->
			<!--- First find out if the file actually has a DB record.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfif request.File.checkFileExistsInDB(trim(fileID))>
				<cfset request.File.Init(trim(fileID))>	
			<cfelse>
				<cfthrow message="The file you are attempting to process does not exist in the database. Please contact an administrator if you feel this is an error.">	
			</cfif>
		
			<!----------------------------------------------------------------------------------------------->
			<!--- To this point the DB record is in place now setup the variables to check the directory. --->
			<!----------------------------------------------------------------------------------------------->		
			<cfset directoryPath = trim(request.applicationPath) & ListDeleteAt(request.File.getServerDirectory(), 1, "\")>
			<cfset fileName	= request.File.getServerFile()>			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Does the File Exists and can it be found in the Directory with this string     --->
			<!--- in it.                                                                         --->
			<!-------------------------------------------------------------------------------------->			
			<cfset existsFile = request.File.checkFileExistsInDirectory(filename: "#trim(fileName)#", directory: "#trim(directoryPath)#\")>
			
			<cfif NOT existsFile>
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				
				<cfset message = "The file you are attempting to process does not exist in the directory but does exist in the database. Please contact an administrator.">
					    			
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client file in directory does not exist. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
					
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
								
				<cfthrow message="#trim(message)#">
			
			</cfif>
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check the file the 835 file string.                                            --->
			<!-------------------------------------------------------------------------------------->			
			<cffile action="READ" file="#trim(directoryPath)#\#trim(fileName)#" variable="fileContents">
				
			<cfif NOT FindNoCase("<TransactionSetIdentifierCode1>835</TransactionSetIdentifierCode1>", trim(fileContents))>					
				<cf_gcGeneralErrorTemplate message="The file uploaded does not meet the 835 file standard. Please check the file for errors.">
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check to make sure that the XML is correct.                                    --->
			<!-------------------------------------------------------------------------------------->			
			<cfset xmlErrorsPassed = "yes">
			<cfset xmlFatalErrorsPassed = "yes">
			<cfset adminMessage = ""> 
			
			<cfset checkXML = XMLValidate("#trim(directoryPath)#\#trim(fileName)#")>
			
			<cfif IsArray(checkXML.errors) AND NOT ArrayIsEmpty(checkXML.errors)>
				<cfif ArrayLen(checkXML.errors) GTE 2>
					<cfset xmlErrorsPassed = "no">
				<cfelseif ArrayLen(checkXML.errors) EQ 1 AND NOT Find("ISA", checkXML.errors[1])>
					<cfset xmlErrorsPassed = "no">
				</cfif>		
			</cfif>			
						
			<cfif IsArray(checkXML.fatalerrors) AND NOT ArrayIsEmpty(checkXML.fatalerrors)>
				<cfif ArrayLen(checkXML.fatalerrors) GTE 1>
					<cfset xmlFatalErrorsPassed = "no">
				</cfif>		
			</cfif>		
			
			<!--- For Debugging issues create the errors to check for code handling errors.
				<CFSET checkXML.errors = ArrayNew(1)>
				<cfset temp = ArrayAppend(checkXML.errors, "Error: just an error that will keep from processing")>
				<cfset temp = ArrayAppend(checkXML.errors, "Error: Second error that needs to be addressed")>			
				<cfset xmlErrorsPassed = "no">
				
				<CFSET checkXML.fatalerrors = ArrayNew(1)>
				<cfset temp = ArrayAppend(checkXML.fatalerrors, "Fatal Error: Your XML is weak")>
				<cfset temp = ArrayAppend(checkXML.fatalerrors, "Fatal Error: You killed brother Chow now you must die.")>			
				<cfset xmlFatalErrorsPassed = "no">
			--->
			
			<cfif NOT xmlErrorsPassed OR NOT xmlFatalErrorsPassed>	
				
				<cfset Message = "The file uploaded does not meet the XML file standard. Please check the file for errors.">
				
				<cfif NOT xmlErrorsPassed>
				
					<cfset adminMessage = adminMessage & "<strong>Admin Note Errors:</strong><br>These are the errors shown in the checkXMl.errors array processing file: #trim(directoryPath)#\#trim(fileName)#<br><br>">
								
					<cfloop from="1" to="#ArrayLen(checkXML.errors)#" index="i">
						<cfset adminMessage = adminMessage & checkXML.errors[i] & "<br>">
					</cfloop>
					
				</cfif>	
				
				<cfif NOT xmlFatalErrorsPassed>
					
					<cfif NOT xmlErrorsPassed>
						<cfset adminMessage = adminMessage & "<p></p>">
					</cfif>
					
					<cfset adminMessage = adminMessage & "<strong>Admin Note FATAL Errors:</strong><br>These are the FATAL errors shown in the checkXMl.FATALerrors array processing file: #trim(directoryPath)#\#trim(fileName)#<br><br>">
								
					<cfloop from="1" to="#ArrayLen(checkXML.fatalerrors)#" index="i">
						<cfset adminMessage = adminMessage & checkXML.fatalerrors[i] & "<br>">
					</cfloop>
					
				</cfif>	
										
				<cfset adminMessage = adminMessage & "<p><strong>User Note:</strong><br>#message#</p>">
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#SupportEmailAddressID#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(adminMessage)#">	
									
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="XML issues with processing file IMMEDIATE ATTENTION REQUIRED." message="#trim(adminMessage)#">	
															
				<cf_gcGeneralErrorTemplate message="#trim(Message)#">
				
			</cfif>	
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Now that all the tests are passed we can bring the XML file into a local       --->
			<!--- variable.                                                                      --->
			<!-------------------------------------------------------------------------------------->		
			<cfset interchange835 = XMLParse(fileContents)>
			
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check the XML file for the Payee information make sure that the logged in user  --->
			<!--- is submitting for the correct client.                                           --->
			<!--------------------------------------------------------------------------------------->							
			<cfset N1s = XMLSearch(interchange835, "//N1")>

			<cfloop from="1" to="#trim(ArrayLen(N1s))#" index="N1">
				<cfif ArrayLen(N1s[N1].XMLChildren) GTE 4 AND N1s[N1].EntityIdentifierCode1.XMLText EQ "PE">	
						
						<cfset clientName = N1s[N1].Name2.XMLText>							
						<cfset clientAddress = N1s[N1].N3.AddressInformation1.XMLText>
						
						<cfloop from="1" to="#ArrayLen(N1s[N1].N3)#" index="N3">
							<cfif N3 EQ 1>
								<cfset clientAddressLine1 = N1s[N1].N3[N3].AddressInformation1.XMLText>								
							<cfelseif N3 EQ 2>
								<cfset clientAddressLine2 = N1s[N1].N3[N3].AddressInformation1.XMLText>										
							</cfif>
						</cfloop>						
						
						<cfset clientCity = N1s[N1].N4.CityName1.XMLText>
						<cfset clientState = N1s[N1].N4.StateorProvinceCode2.XMLText>
						<cfset clientZipCode = N1s[N1].N4.PostalCode3.XMLText>
						<cfset providerID = N1s[N1].REF.ReferenceIdentification2.XMLText>				
					
				</cfif>
			</cfloop>

			<!-------------------------------------------------------------------------------------->
			<!--- Query to see if the clientID in the 835 XMl is already in the DB.              --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getClientRecord" datasource="#trim(request.datasource)#">
				SELECT clientID
				FROM pa_master.Client 
				WHERE providerID = '#trim(providerID)#'
			</cfquery>

			<!-------------------------------------------------------------------------------------->
			<!--- If there is no record of the client in the database then we need to throw an   --->
			<!--- error and warn support of the issue.                                           --->
			<!-------------------------------------------------------------------------------------->			
			<cfif getClientRecord.Recordcount NEQ 1>
			
				<cfset request.File.deleteFileDBAndDirectory(trim(fileID))>
				<cfset request.File.deleteFileDBAndDirectory(trim(delFileID))>
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				
				<cfset message = "The client does not exist. Please contact an administrator.">
				
				<cfset adminMessage = "<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>The Provider ID (#trim(providerID)#) that the 835 XML file (#trim(directoryPath)#\#trim(fileName)#) contains does not exist in the client table. FILES WERE DELETED.</p>">
					    			
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client id in 835 XML file does not exist. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
					
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(adminMessage)#">	
								
				<cfthrow message="#trim(message)#">		
			
			<cfelseif getClientRecord.clientID NEQ session.clientID>
			
				<cfset request.File.deleteFileDBAndDirectory(trim(fileID))>
				<cfset request.File.deleteFileDBAndDirectory(trim(delFileID))>
			
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				
				<cfset message = "You may not process this file because the Client ID does not match. Please contact an administrator.">
				
				<cfset adminMessage = "<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>The Provider ID (#trim(providerID)#) that the 835 XML file (#trim(directoryPath)#\#trim(fileName)#) contains belongs to client #getClientRecord.clientID# and does not match the session.clientID (#session.clientID#) this user is logged in on. FILES WERE DELETED.</p>">
					    			
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client id in 835 XML file does not exist. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
					
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(adminMessage)#">	
												
				<cfthrow message="#trim(message)#">										
				
			</cfif>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Now we add the report to the database so we can attach a reportid to the       --->
			<!--- individual claims to show what report they came in on.                         --->
			<!-------------------------------------------------------------------------------------->		
			<cfset interchangeFileID = trim(interchange835.ISA.ControlNumber13.XMLText)>
			<cfset interchangeDateYear = MID(interchange835.ISA.Date9.XMLText, 1, 2)>
			<cfset interchangeDateMonth = MID(interchange835.ISA.Date9.XMLText, 3, 2)>
			<cfset interchangeDateDay = MID(interchange835.ISA.Date9.XMLText, 5, 2)>
			<cfset interchangeDate = CreateDate(interchangeDateYear, interchangeDateMonth, interchangeDateDay)>
			
			<cfset request.Interchange = CreateObject("component","com.common.Interchange")>	
			<cfset getInterchange = request.Interchange.getInterchangeQuery(interchangeFileID: trim(interchangeFileID))>			
						
			<cfif getInterchange.RecordCount GTE 1>				
				
				<cfset request.File.deleteFileDBAndDirectory(trim(fileID))>
				<cfset request.File.deleteFileDBAndDirectory(trim(delFileID))>
			
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				
				<cfset message = "The report you are trying to process has already been processed. If you feel this is an error please contact an administrator.">
				
				<cfset adminMessage = "<p><strong>User was sent:</strong> <br>#trim(message)#</p>">
					    			
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The report to process has already been processed. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
					
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(adminMessage)#">	
				
				<cfthrow message="#trim(message)#">
				
			<cfelse>
			
				<!-------------------------------------------------------------------------------------->
				<!--- The interchange has not been processed before. We can now add the interchange  --->
				<!--- record and get the ID.                                                         --->
				<!-------------------------------------------------------------------------------------->						
				<cfset request.Interchange.setFileID(trim(fileID))>
				<cfset request.Interchange.setInterchangeFileID(trim(interchangeFileID))> 
				<cfset request.Interchange.setInterchangeDate(trim(interchangeDate))>
				<cfset request.Interchange.setClientID(trim(session.clientID))>
				<cfset interchangeID = request.Interchange.Commit()>			
										
 			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Verify that the needed parameters have been sent in.                           --->
			<!-------------------------------------------------------------------------------------->
			<cf_gcVerifyFields
				fields="interchangeID"
				fieldnames="Interchange ID"
				datatypes="numeric">
			
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- We will loop over all the CLP which are claims in this file.                   --->
			<!-------------------------------------------------------------------------------------->			
			<cfset CLPs = XMLSearch(interchange835, "//CLP")>
			
			
			<cfif debug>
				<cfoutput>
					<p><font size="4" color="FF0000">Found #ArrayLen(CLPs)# CLP's in this report.</font></p>
				</cfoutput>
			</cfif>
			
			
			<!--------------------------------------------------------------------------------------->
			<!--- loop through all the claims on this interchange and place them in the database. --->
			<!--------------------------------------------------------------------------------------->			
			<cfloop from="1" to="#Arraylen(CLPs)#" index="i"><!---#Arraylen(CLPs)#--->
				
				<cfif debug>
					<cfoutput><hr></cfoutput>
				</cfif>
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- start with looking for the patient in the DB and if not found then add them in.--->
				<!--- If the ID on this user is non existant then throw an error.                    --->
				<!-------------------------------------------------------------------------------------->			
				<cfloop from="1" to="#trim(ArrayLen(CLPs[i].NM1))#" index="insuranceIDi">
			
					<cfif CLPs[i].NM1[insuranceIDi].EntityIdentifierCode1.XMLText EQ "QC" AND CLPs[i].NM1[insuranceIDi].EntityTypeQualifier2.XMLText EQ 1>
						<cfset thisInsuranceID = CLPs[i].NM1[insuranceIDi].IdentificationCode9.XMLText>
					</cfif>	
												
				</cfloop>
				
				
				
				<cfif thisInsuranceID EQ "">
					<cfthrow message="While processing the file this iteration (#i#) record did not have a correctly formatted Insurance ID.">					
				</cfif>
				
				<!---<!-------------------------------------------------------------------------------------->
				<!--- start with looking for the patient in the DB and if not then add them in.      --->
				<!--- If the ID on this user is non existant then throw an error.                    --->
				<!-------------------------------------------------------------------------------------->			
				<cfset thisInsuranceID = CLPs[i].ClaimSubmittersIdentifier1.XMLText>
				
				<cfif thisInsuranceID EQ "">
					<cfthrow message="While processing the file this iteration (#i#) record did not have a correctly formatted Insurance ID.">					
				</cfif>--->
				
				<cfset thisLName = CLPs[i].NM1.NameLastorOrganizationName3.XMLText>			
				<cfif thisLName NEQ "">
					<cfset thisLName = UCase(Mid(thisLName,1, 1)) & LCase(mid(thisLName, 2, len(thisLName)))>				
				</cfif>
				<cfset thisFName = CLPs[i].NM1.NameFirst4.XMLText>
				<cfif thisFName NEQ "">			
					<cfset thisFName = UCase(Mid(thisFName,1, 1)) & LCase(mid(thisFName, 2, len(thisFName)))>	
				</cfif>
				<cfset thisMiddleName = CLPs[i].NM1.NameMiddle5.XMLText>
				<cfset thisPrefix = CLPs[i].NM1.NamePrefix6.XMLText>
				<cfset thisSuffix = CLPs[i].NM1.NameSuffix7.XMLText>	
				
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Because this is the medicaid patient process of the 835 file we put a 111      --->
				<!--- patientType to the patient record.                                             --->
				<!-------------------------------------------------------------------------------------->				
				<cfset patientType = 111>							
				
							
				<!----------------------------------------------------------------------------------------------->
				<!--- Find out if the current insuranceID is already in the database and get their ID Record. --->
				<!----------------------------------------------------------------------------------------------->	
				<cfset Patient = CreateObject("component","com.common.Patient")>	
				<cfset getPatient = Patient.getPatientQuery(fields: "patientID,EntityID", InsuranceID: trim(thisInsuranceID))>			
								
				<cfif getPatient.RecordCount LTE 0>
					
					<!-------------------------------------------------------------------------------------->
					<!--- Patient does not exist create the entoty record and then the patient record    --->
					<!--- that tie the two together.                                                     --->
					<!-------------------------------------------------------------------------------------->					
					<cfset Entity = CreateObject("component","com.common.Entity")>	
					<cfset Entity.setSiteID(trim(request.Site.getSiteID()))>  
					<cfset Entity.setClientID(trim(session.clientID))>
					<cfset Entity.setPrefixName(trim(thisPrefix))>
					<cfset Entity.setFName(trim(thisFName))>
					<cfset Entity.setMName(trim(thisMiddleName))>
					<cfset Entity.setLName(trim(thisLName))>
					<cfset Entity.setSuffixName(trim(thisSuffix))>
					<cfset Entity.setObjectTypeID(2)>
					<cfset EntityID = Entity.commit()>
					
					<cfset Patient.setEntityID(trim(EntityID))>
					<cfset Patient.setPatientType(trim(patientType))>
					<cfset Patient.setInsuranceID(trim(thisInsuranceID))>
					<cfset patientID = Patient.commit()>
					
					<cfif debug>
						<cfoutput>							
							<div align="left">
								<strong><font color="FF0000">PATIENT WAS CREATED - DID NOT EXIST</font></strong><br>
								<strong>EntityID:</strong> #EntityID#<br>
								<strong>PatientID:</strong> #PatientID#<br>
							</div>	
						</cfoutput>						
					</cfif>	
					
				<cfelseif getPatient.RecordCount EQ 1>
					
					<cfset patientID = getPatient.patientID>
					<cfset entityID = getPatient.EntityID>
				
				<cfelse>
					
					<!----------------------------------------------------------------------------------------->
					<!--- There is an issue with more than one patient ID record with the same insuranceID. --->
					<!----------------------------------------------------------------------------------------->	
					<cfset message = "There is an issue with Patient Accounts table.">
														
					<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#request.Site.getSupportEmailAddressID()#">
										
					<cf_gcSendEmail
						from="#trim(EAQuery.Email)#"
						to="#trim(EAQuery.Email)#"
						subject="Mulitple entries in Patient IMMEDIATE ATTENTION REQUIRED."
						message="<strong>User Note:</strong><br>#trim(Message)#<br><br><strong>Admin Note:</strong><br> There is an issue with more than one patient ID record with the same insuranceID.<br><br>QUERY ATTEMPTED: SELECT patientID FROM Patient   WHERE InsuranceID = #trim(thisInsuranceID)#	">	
						
					<cfthrow message="#trim(message)#">	
												 
				</cfif>						
				
				<cfif debug>
					<cfoutput>
						<div align="left">	
							<strong>Patient Last Name:</strong> #thisLName#<br>
							<strong>Patient First Name:</strong> #thisFName#<br>			
							<strong>Patient Middle Name:</strong> #CLPs[i].NM1.NameMiddle5.XMLText#<br>
							<strong>Patient Name Prefix:</strong> #CLPs[i].NM1.NamePrefix6.XMLText#<br>
							<strong>Patient Name Suffix:</strong> #CLPs[i].NM1.NameSuffix7.XMLText#<br>						
							<strong>Entity ID:</strong> #entityID#<br>					
							<strong>Insurance ID:</strong> #thisInsuranceID#<br>
						</div>	
					</cfoutput>
				</cfif>				
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Set the claimID                                                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfset interchangeClaimID = CLPs[i].ReferenceIdentification7.XMLText>
				
				<cfset oldInterchangeClaimID = "">
				<cfif StructKeyExists(CLPs[i], 'REF') AND CLPs[i].REF.ReferenceIdentification2.XMLText GT "">
					<cfset oldInterchangeClaimID = CLPs[i].REF.ReferenceIdentification2.XMLText>	
				</cfif>	
											
				<cfset Claim = CreateObject("component","com.common.Claim")>	
				<cfset getClaim = Claim.getClaimQuery(fields: "ClaimID,InterchangeID,EntityID", ClaimID: trim(interchangeClaimID))>			
								
								
				<!-------------------------------------------------------------------------------------->
				<!--- If the claim already exists then we need to bypass this code.                  --->
				<!-------------------------------------------------------------------------------------->					
				<cfif getClaim.RecordCount LTE 0>
				
					<cfif debug>
						<cfoutput>
							<div align="left">	
								<strong>Interchange Claim ID:</strong> #trim(interchangeClaimID)#<br>
								<font color="800080"><strong>OLD Interchange Claim ID:</strong> #trim(oldInterchangeClaimID)#</font><br>
								
							</div>	
						</cfoutput>
					</cfif>
					
					<!-------------------------------------------------------------------------------------->
					<!--- Set the date that the claim is due. It will be 120 days from the report date.  --->
					<!-------------------------------------------------------------------------------------->	
					<cfset claimDueDate = DateAdd("d", 120, interchangeDate)>
									
					<!-------------------------------------------------------------------------------------->
					<!--- Get the Claim Dates.                                                           --->
					<!-------------------------------------------------------------------------------------->			
					<cfloop from="1" to="2" index="ii">
						<cfif CLPs[i].DTM[ii].DateTimeQualifier1.XMLText EQ 232 AND IsNumeric(CLPs[i].DTM[ii].Date2.XMLText) AND LEN(CLPs[i].DTM[ii].Date2.XMLText) EQ 8>
							<cfset fromYear = MID(CLPs[i].DTM[ii].Date2.XMLText, 1, 4)>
							<cfset fromMonth = MID(CLPs[i].DTM[ii].Date2.XMLText, 5, 2)>
							<cfset fromDay = MID(CLPs[i].DTM[ii].Date2.XMLText, 7, 2)>
							<cfset fromDate = CreateDate(fromYear, fromMonth, fromDay)>								
						<cfelseif CLPs[i].DTM[ii].DateTimeQualifier1.XMLText EQ 233 AND IsNumeric(CLPs[i].DTM[ii].Date2.XMLText) AND LEN(CLPs[i].DTM[ii].Date2.XMLText) EQ 8>
							<cfset toYear = MID(CLPs[i].DTM[ii].Date2.XMLText, 1, 4)>
							<cfset toMonth = MID(CLPs[i].DTM[ii].Date2.XMLText, 5, 2)>
							<cfset toDay = MID(CLPs[i].DTM[ii].Date2.XMLText, 7, 2)>
							<cfset toDate = CreateDate(toYear, toMonth, toDay)>	
						</cfif>
					</cfloop>
					
					<cfif NOT IsDefined("fromDate") OR NOT IsDate(fromDate)>
						<cfthrow message="While processing the file this iteration (#i#) record did not have a Claim From Date in the correct format.">					
					</cfif>
					
					<cfif NOT IsDefined("toDate") OR NOT IsDate(toDate)>
						<cfthrow message="While processing the file this iteration (#i#) record did not have a Claim To Date in the correct format.">					
					</cfif>
					
					
					<cfif debug>
						<cfoutput>
							<div align="left">
								<strong>Claim Due Date:</strong> #DateFormat(claimDueDate, "mm/dd/yyyy")#<br>
								<strong>Claim (Sevice Date) From Date:</strong> #DateFormat(fromDate, "mm/dd/yyyy")#<br>
								<strong>Claim (Sevice Date) To Date:</strong> #DateFormat(toDate, "mm/dd/yyyy")#<br>
							</div>
						</cfoutput>
					</cfif>		
					
															
					<!-------------------------------------------------------------------------------------->
					<!--- Start the inserting of the claim.                                              --->
					<!-------------------------------------------------------------------------------------->					
					<cfset Claim.setClaimType(109)><!---This is a hardcoded EOB number found in the table StandardListItem/ListID 14 for Medicaid--->
					<cfset Claim.setInterchangeClaimID(trim(interchangeClaimID))>
					<cfset Claim.setInterchangeID(trim(InterchangeID))>
					<cfset Claim.setClientID(trim(session.clientID))>
					<cfset Claim.setEntityID(trim(EntityID))>
					<cfset Claim.setDueDate(trim(claimDueDate))>
					<cfset ClaimID = Claim.commit()>
					
					
					<cfif debug>
						<cfoutput>
							<div align="left">	
								<strong><font color="FF0000">CLAIM CREATED</font></strong><br>
								<strong>Interchange Claim ID:</strong> #trim(interchangeClaimID)#<br>
								<strong>Claim ID:</strong> #trim(ClaimID)#<br>
							</div>	
						</cfoutput>
					</cfif>					
					
								
										
				<cfelse>
				
					<cfif debug>
						<cfoutput>
							<div align="left">	
								<strong>CLAIM ALREADY EXISTS</strong>
								<strong>Claim ID:</strong> #trim(interchangeClaimID)#<br>
							</div>	
						</cfoutput>
					</cfif>
					
					<cfthrow message="CLAIM ALREADY EXISTS. No insertion past this point.">	
				
				</cfif>
				
				
				
				
				<cfif debug>
					<cfoutput>
						<div align="left">	
							<br><strong><font color="FF0000">BEGIN PROCEDURES</font></strong><br>
						</div>
					</cfoutput>
				</cfif>	
				
				
				<cfset changedCodes = "T4521,T4522,T4523,T4524,T4525,T4526,T4527,T4528,T4529,T4530,T4531,T4532,T4533,T4534,T4535">
				

				
				<!--------------------------------------------------------------------------------------->
				<!--- From here the claim ID is new and now we can insert its individual procedures.  --->
				<!--- Take note that from this point forward to avoid confusion we are using          --->
				<!--- "PROCEDURE CODE" to describe the codes that come in from the report and the     --->
				<!--- "EOB PROCEDURE CODE" to describe the EOB code given to a procedure code.        --->
				<!--------------------------------------------------------------------------------------->			
				<cfloop from="1" to="#trim(ArrayLen(CLPs[i].SVC))#" index="iii">
									
					<cfset procedureCode = ListGetAt(CLPs[i].SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText, 2, ":")>
					<cfset procModifierList = CLPs[i].SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText>
					<cfset procModifierList = ListDeleteAt(procModifierList, 1, ":")>
					<cfset procModifierList = ListDeleteAt(procModifierList, 1, ":")>
					
					<!-------------------------------------------------------------------------------------->
					<!--- Some of the codes have changed to to others here the exceptions are taken      --->
					<!--- care of.                                                                       --->
					<!-------------------------------------------------------------------------------------->					
					<cfif ListFindNoCase(trim(changedCodes), trim(procedureCode))>
						<cfset procedureCode = Replace(trim(procedureCode), "T", "A")>
					</cfif>
					
					
					<cfif debug>
						<cfoutput>
							<div align="left">	
								&nbsp;&nbsp;&nbsp;<strong>Procedure Code:</strong>#ListGetAt(CLPs[i].SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText, 2, ":")#<br>
							</div>
						</cfoutput>
					</cfif>	
					
					<cfset thisModifierCode = "">
					<cfif procModifierList NEQ "">
					
						<cfloop list="#trim(procModifierList)#" delimiters=":" index="thisMod">
							
							<cfif debug>
								<cfoutput>
									<div align="left">	
										&nbsp;&nbsp;&nbsp;[#trim(procModifierList)#] <strong>Modifier Code:</strong> #thisModifierCode#<br>
									</div>
								</cfoutput>
							</cfif>		
										
						</cfloop>
										
					</cfif>					
										
					<cfset billedAmount = CLPs[i].SVC[iii].MonetaryAmount2.XMLText>
					<cfset paidAmount = CLPs[i].SVC[iii].MonetaryAmount3.XMLText>
					<cfset billedPaidQuantity = CLPs[i].SVC[iii].Quantity5.XMLText>
										
					<cfif debug>
						<cfoutput>
							<div align="left">	
								&nbsp;&nbsp;&nbsp;<strong>Billed Amount</strong> (MonetaryAmount2)<strong>:</strong> $#NumberFormat(billedAmount, "__.__")#<br>
								&nbsp;&nbsp;&nbsp;<strong>Paid Amount</strong> (MonetaryAmount3)<strong>:</strong> $#NumberFormat(paidAmount, "__.__")#<br>
								&nbsp;&nbsp;&nbsp;<strong>Billed/Paid Quantity</strong> (Quantity5)<strong>:</strong> #billedPaidQuantity#<br>
							</div>
						</cfoutput>
					</cfif>	
					
					
					
					<cfset procedureFlag = "yes">
					<cfset insertProcedure = "yes">
					<cfset eobProcedureCode = "">
					<cfset procedureMessage = "">	
								
					
					<!---------------------------------------------------------------------------------------------->
					<!--- Few Exceptions when two codes are found.                                               --->
					<!--- As for E0562, if the price is 28.72, the TOS is L if the price is 299.73 the TOS is J. --->
					<!--- For E0601, if the price is 98.42, the TOS is L, if the price is 1279.46 the TOS is J.  --->
					<!---------------------------------------------------------------------------------------------->					
					<cfif trim(ProcedureCode) EQ "E0562">
							
						<cfif paidAmount EQ "28.72">
							<cfset thisTOSCode = "L">
						<cfelseif paidAmount EQ "299.73">
							<cfset thisTOSCode = "J">
						<cfelse>
							<cfoutput>paidAmount (#paidAmount#) does not match.</cfoutput>	
						</cfif> 
						
						<cfquery name="getEOBProcedureCode2" datasource="#trim(request.datasource)#">
							SELECT RecordID FROM pa_master.EOB_PROCEDURECode WHERE Code = '#trim(ProcedureCode)#' AND TOSCode = '#trim(thisTOSCode)#'
						</cfquery>
						
						<cfif getEOBProcedureCode2.RecordCount EQ 1>
							<cfset procedureFlag = "no">
							<cfset eobProcedureCode = getEOBProcedureCode2.RecordID>
						</cfif>
					
					<cfelseif trim(ProcedureCode) EQ "E0601">
						
						<cfif paidAmount EQ "98.42">
							<cfset thisTOSCode = "L">
						<cfelseif paidAmount EQ "1279.46">
							<cfset thisTOSCode = "J">
						<cfelse>
							<cfoutput>paidAmount (#paidAmount#) does not match.</cfoutput>	
						</cfif> 
						
						<cfquery name="getEOBProcedureCode2" datasource="#trim(request.datasource)#">
							SELECT RecordID FROM pa_master.EOB_PROCEDURECode WHERE Code = '#trim(ProcedureCode)#' AND TOSCode = '#trim(thisTOSCode)#'
						</cfquery>
						
						<cfif getEOBProcedureCode2.RecordCount EQ 1>
							<cfset procedureFlag = "no">
							<cfset eobProcedureCode = getEOBProcedureCode2.RecordID>
						</cfif>
					
										
					<!-------------------------------------------------------------------------------------->
					<!--- at this point this is a regular code so lets just search for the code.         --->
					<!-------------------------------------------------------------------------------------->					
					<cfelse>
					
						<!-------------------------------------------------------------------------------------->
						<!--- Query to get the EOB Code for this ProcedureCode                               --->
						<!-------------------------------------------------------------------------------------->						
						<cfquery name="getEOBProcedureCode" datasource="#trim(request.datasource)#">
							SELECT RecordID FROM pa_master.EOB_PROCEDURECode
							WHERE Code = '#trim(ProcedureCode)#'
						</cfquery>
						
						<cfif getEOBProcedureCode.RecordCount EQ 1>
							
							<cfset procedureFlag = "no">
							<cfset eobProcedureCode = getEOBProcedureCode.RecordID>
																					
						<cfelse>
							
							<!---Set the EOBProcCode to the EXCEPTION code. Leave flag at yes--->							
							<cfset eobProcedureCode = 13086>
							
							<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(session.Client.getSupportEmailID())#">
							<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
							
							<cfset message = "CODE NOT FOUND.">
							
							<cfset adminMessage = "<p><strong>User screen:</strong> <br>#trim(message)#</p><p><strong>Admin Note: IMMEDIATE ATTENTION REQUIRED</strong><br>The tag #GetCurrentTemplatePath()# found an issue with the procedure code the recordcount from the query returned #getEOBProcedureCode.RecordCount# record(s).  <br>Query attempted: SELECT * FROM pa_master.EOB_PROCEDURECode WHERE Code = '#trim(ProcedureCode)#</p>">
								    			
							<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="EOB Procedure Code NOT Found. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
								
							<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(adminMessage)#">	
								
							<cfif debug>
								<cfoutput>
									<div align="left">							
										<cfoutput><font face="Arial Black" size="4" color="FF0000">#trim(message)#</font><br></cfoutput>
									</div>
								</cfoutput>
							</cfif>		
						
						</cfif>
						
					</cfif>
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- Find out if the procedure for this claim already exists. Chances are that it   --->
					<!--- does not exist since these are new claims but check anyway.                    --->
					<!-------------------------------------------------------------------------------------->					
					<cfset Procedure = CreateObject("component","com.common.Procedure")>	
					<cfset getProcedure = Procedure.getProcedureQuery(fields: "ProcedureID", ProcedureCode: trim(eobProcedureCode), ClaimID: trim(ClaimID))>			
					
					<cfif getProcedure.RecordCount GT 0>
						<cfset procedureFlag = "yes">
						<cfset procedureMessage = procedureMessage & "<br>This Procedure already exists for this claim.">
						<cfset insertProcedure = "no">
					</cfif>
					
					<cfif trim(eobProcedureCode) EQ "">
						<cfset procedureMessage = procedureMessage & "<br>This Procedure Does not have an EOCProcedureCode.">
						<cfset insertProcedure = "no">
					</cfif>
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- We are now ready to insert or not Isert the procedure for this claim.          --->
					<!-------------------------------------------------------------------------------------->					
					<cfif insertProcedure>
						
						<!-------------------------------------------------------------------------------------->
						<!--- Start the inserting of the Procedure.                                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfset Procedure.setClaimID(trim(ClaimID))>
						<cfset Procedure.setProcedureCode(trim(eobProcedureCode))>
						<cfset Procedure.setServiceDateFrom(CreateODBCDate(fromDate))>
						<cfset Procedure.setServiceDateTo(CreateODBCDate(toDate))>
						<!--- took out because this would not be correct this number is coming form report.
						<cfset Procedure.setBilledQuantity(billedPaidQuantity)>--->
						<cfset Procedure.setBilledAmount(trim(billedAmount))>
						<cfset Procedure.setPaidQuantity(trim(billedPaidQuantity))>
						<cfset Procedure.setPaidAmount(trim(paidAmount))>
						<cfset ProcedureID = Procedure.commit()>
					
					</cfif>
					
					<!---
						1	1	11504	10/27/2005 11:46:40 AM	10/27/2005 11:46:40 AM	2	50	2	41
	2	2	1	11/28/2005 11:46:40 AM	11/28/2005 11:46:40 AM	144	252	144	119.52
	3	2	11597	11/28/2005 11:46:40 AM	11/28/2005 11:46:40 AM	648	1620	648	660.96
	4	3	1	11/12/2005 11:46:40 AM	11/12/2005 11:46:40 AM	180	315	180	165.6
	5	3	11335	11/12/2005 11:46:40 AM	11/12/2005 11:46:40 AM	150	150	150	61.5
	6	3	11244	11/12/2005 11:46:40 AM	11/12/2005 11:46:40 AM	2	20	2	6.18
					--->
															
					<cfif debug>
						<cfoutput>
							<div align="left">	
								<font color="FF0000">&nbsp;&nbsp;&nbsp;<strong>Procedure Flagged:</strong> #trim(procedureFlag)#</font><br>
								<font color="FF0000">&nbsp;&nbsp;&nbsp;<strong>EOB Procedure Code:</strong> #trim(eobProcedureCode)#</font><br>
								<font color="FF0000">&nbsp;&nbsp;&nbsp;<strong>Procedure Message:</strong> #trim(procedureMessage)#</font><br>
								<font color="FF0000">&nbsp;&nbsp;&nbsp;<strong>Insert Procedure:</strong> #trim(insertProcedure)#</font><br>
							</div>
						</cfoutput>
					</cfif>											
										
					
					
					
					
					
					
					
															
					<cfif StructKeyExists(CLPs[i].SVC[iii], 'CAS')>
						<cfif debug>
							<cfoutput>
								<div align="left">	
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="FF0000">BEGIN CLAIM ADJUSTMENTS</font></strong>
									<cfloop from="1" to="#trim(ArrayLen(CLPs[i].SVC[iii].CAS))#" index="iiii">						
										<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Claim Adjustment Group Code:</strong> #CLPs[i].SVC[iii].CAS[iiii].ClaimAdjustmentGroupCode1.XMLText#<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Claim Adjustment Reason Code:</strong> #CLPs[i].SVC[iii].CAS[iiii].ClaimAdjustmentReasonCode2.XMLText#<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Billed Amount</strong> (MonetaryAmount3)<strong>:</strong> $#NumberFormat(CLPs[i].SVC[iii].CAS[iiii].MonetaryAmount3.XMLText, "__.__")#<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Quantity</strong> (Quantity4)<strong>:</strong> #CLPs[i].SVC[iii].CAS[iiii].Quantity4.XMLText#<br>
										<br>
									</cfloop>
								</div>
							</cfoutput>
						</cfif>		
					</cfif>
						
						
					</p>
					</div>
				</cfloop>
				
				
				
				
				
				
				
				
				
				
				
				
				
				<cfif debug>
					<cfoutput><p></p></cfoutput>
				</cfif>
				
			</cfloop>		
		
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Show Any error while processing.                                               --->
		<!-------------------------------------------------------------------------------------->	
		<cfcatch type="Any">			
				
			<cf_gcGeneralErrorTemplate message="#cfcatch.message#">					
			
			<cfabort>
				
		</cfcatch>
		
		
	</cftry>

	
	
<!-------------------------------------------------------------------------------------->
<!--- This is needed for debugging reasons otherwise it just escapes thios custom    --->
<!--- tag but keeps processing.                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfif debug>	
		<cfabort>	
	</cfif>
	
	
	






	<!---<strong>ClaimStatusCode2:</strong> #CLPs[i].ClaimStatusCode2.XMLText#<br>--->
			<!---<strong>MonetaryAmount3:</strong> #CLPs[i].MonetaryAmount3.XMLText#<br>
			<strong>MonetaryAmount4:</strong> #CLPs[i].MonetaryAmount4.XMLText#<br>
			<strong>MonetaryAmount5:</strong> #CLPs[i].MonetaryAmount5.XMLText#<br>--->
			
			
	<!---	<strong>ClaimFilingIndicatorCode6:</strong> #CLPs[i].ClaimFilingIndicatorCode6.XMLText#<br>--->
			
			<!---<strong>FacilityCodeValue8:</strong> #CLPs[i].FacilityCodeValue8.XMLText#<br>--->
			<!---<strong>ClaimFrequencyTypeCode9:</strong> #CLPs[i].ClaimFrequencyTypeCode9.XMLText#<br>--->
			<!---<strong>PatientStatusCode10:</strong> #CLPs[i].PatientStatusCode10.XMLText#<br>--->
			<!---<strong>DiagnosisRelatedGroupAaADRGAaACode11:</strong> #CLPs[i].DiagnosisRelatedGroupAaADRGAaACode11.XMLText#<br>	--->	
			<!---<strong>Quantity12:</strong> #CLPs[i].Quantity12.XMLText#<br>
			<strong>Percent13:</strong> #CLPs[i].Percent13.XMLText#<br>--->
			<!---<strong>CLPs[i].NM1.EntityIdentifierCode1.XMLText:</strong> #CLPs[i].NM1.EntityIdentifierCode1.XMLText#<br>--->	
			
			
			
			
			
