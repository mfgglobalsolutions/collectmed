

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
	
	<cfparam name="attributes.providerID" default="">
	<cfset providerID = attributes.providerID>
	
	<cfif IsDefined("form.providerID") AND form.providerID NEQ "">
		<cfset providerID = form.providerID>
	<cfelseif IsDefined("url.providerID") AND url.providerID NEQ "">
		<cfset providerID = url.providerID>	
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
				
				<!-------------------------------------------------------------------------------------->
				<!--- check to see that the medicare number for region is populated.                 --->
				<!-------------------------------------------------------------------------------------->						
				<cfif N1s[N1].EntityIdentifierCode1.XMLText EQ "PE" AND NOT ListFindNoCase("742726523,1111111,2222222,33333333,4444444", N1s[N1].IdentificationCode4.XMLText)>	
					<cf_gcGeneralErrorTemplate message="The file uploaded does not meet the Medicare 835 file standard. The medicare number was not found. Please check the file for errors.">
				</cfif>
			
			
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
												
			
			<!--- Original Code. Took out becuase a client can now have multiple clientIDs GC 01/20/07
			
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
			<!--- error and warn supprt of the issue.                                            --->
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
			
			--->
			
			
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
				
				<!-------------------------------------------------------------------------------------->
				<!--- On page 79 of the implementation guide is the explanation of this value        --->
				<!-------------------------------------------------------------------------------------->				
				<cfif StructKeyExists(interchange835.ISA.GS.LX, 'AssignedNumber1')>
					<cfset LXAssignedNumber = interchange835.ISA.GS.LX.AssignedNumber1.XMLText>
				<cfelse>
					<cfset LXAssignedNumber = "">	
				</cfif>
				<cfset request.Interchange.setLXAssignedNumber(trim(LXAssignedNumber))>
				
				<!-------------------------------------------------------------------------------------->
				<!--- Commit the new interchange.                                                    --->
				<!-------------------------------------------------------------------------------------->				
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
			<cfloop from="1" to="#Arraylen(CLPs)#" index="i">
				
				<cfif debug>
					<cfoutput><hr></cfoutput>
				</cfif>
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Because this is the medicare patient process of the 835 file we put a 110      --->
				<!--- patientType to the patient record.                                             --->
				<!-------------------------------------------------------------------------------------->				
				<cfset patientType = 110>			
				<cfset IdentificationCodeQualifier = "">
				
												
				<!-------------------------------------------------------------------------------------->
				<!--- Get the patients Name from the interchange.                                    --->
				<!-------------------------------------------------------------------------------------->					
				<!---This will have to be looked at in the near future for the NM1 loop info--->
				<cfinclude template="ei_1002_Process835XMLFileIntoDB_NM1_Element.cfm">
														

				<!----------------------------------------------------------------------------------------------->
				<!--- Find out if the current insuranceID is already in the database and get their ID Record. --->
				<!----------------------------------------------------------------------------------------------->	
				<cfset Patient = CreateObject("component","com.common.Patient")>	
				<cfset getPatient = Patient.patientExists(clientID: trim(session.clientID), InsuranceID: trim(thisInsuranceID))>			
						
				<cfif getPatient.RecordCount LTE 0>
					
					<!-------------------------------------------------------------------------------------->
					<!--- Patient does not exist create the entoty record and then the patient record    --->
					<!--- that tie the two together.                                                     --->
					<!-------------------------------------------------------------------------------------->					
					<cfset Entity = CreateObject("component","com.common.Entity")>	
					<cfset Entity.setSiteID(trim(request.Site.getSiteID()))>  
					<cfset Entity.setClientID(trim(session.clientID))>					
					<cfset Entity.setFName(trim(patientFName))>
					<cfset Entity.setMName(trim(patientMiddleName))>
					<cfset Entity.setLName(trim(patientLName))>
					<cfset Entity.setSuffixName(trim(patientSuffix))>
					<cfset Entity.setObjectTypeID(3)>
					<cfset EntityID = Entity.commit()>
					
					<cfset Patient.setEntityID(trim(EntityID))>
					<cfset Patient.setPatientType(trim(patientType))>
					<cfset Patient.setInsuranceIDType(trim(IdentificationCodeQualifier))>
					<cfset Patient.setInsuranceID(trim(thisInsuranceID))>					
					<cfset patientID = Patient.commit()>
					
					<cfif debug>
						<cfoutput>							
							<div align="left">
								<strong><font color="FF0000">PATIENT WAS CREATED - DID NOT EXIST</font></strong><br>								
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
						message="<strong>User Note:</strong><br>#trim(Message)#<br><br><strong>Admin Note:</strong><br> There is an issue with more than one patient ID record with the same insuranceID.<br><br>QUERY ATTEMPTED: SELECT patientID FROM patient   WHERE InsuranceID = #trim(thisInsuranceID)#	">	
						
					<cfthrow message="#trim(message)#">	
												 
				</cfif>						
				
				<cfif debug>
					<cfoutput>
						<div align="left">												
							<strong>Entity ID:</strong> #trim(entityID)#<br>	
							<strong>PatientID:</strong> #trim(patientID)#<br>							
						</div>	
					</cfoutput>
				</cfif>				
				

				
				<!-------------------------------------------------------------------------------------->
				<!--- Set the claims defaults                                                        --->
				<!-------------------------------------------------------------------------------------->				
				<cfset oldInterchangeClaimID = "">				
				<cfset interchangeClaimID = CLPs[i].ReferenceIdentification7.XMLText>
				<cfset clientAssignedClaimID = CLPs[i].ClaimSubmittersIdentifier1.XMLText>
				<cfset FacilityCode = CLPs[i].FacilityCodeValue8.XMLText>
				<cfset CrossoverEntityTypeQualifier2 = "">
				<cfset CrossoverNameLastorOrganizationName3 = "">
				<cfset CrossoverIdentificationCode9 = "">			
				
				
				
				<!-------------------------------------------------------------------------------------->
				<!---  loop in the CLP Name Element looking for the crossover entity.                --->
				<!-------------------------------------------------------------------------------------->		
				<cfloop from="1" to="#trim(ArrayLen(CLPs[i].NM1))#" index="crossoveri">							
					<cfif CLPs[i].NM1[crossoveri].EntityIdentifierCode1.XMLText EQ "TT">
						<cfset CrossoverEntityTypeQualifier2 = CLPs[i].NM1[crossoveri].EntityTypeQualifier2.XMLText>
						<cfset CrossoverNameLastorOrganizationName3 = CLPs[i].NM1[crossoveri].NameLastorOrganizationName3.XMLText>
						<cfset CrossoverIdentificationCode9 = CLPs[i].NM1[crossoveri].IdentificationCode9.XMLText>
						<cfif debug>
							<cfoutput>
								<div align="left">	
									<strong><font color="FF0000">CROSSOVER ENTITY</font></strong><br>
									<strong>Crossover Entity Type Qualifier:</strong> #trim(CrossoverEntityTypeQualifier2)#<br>
									<strong>Crossover NameLast or Organization Name:</strong> #trim(CrossoverNameLastorOrganizationName3)#<br>
									<strong>Crossover Identification Code:</strong> #trim(CrossoverIdentificationCode9)#<br>																					
								</div>	
							</cfoutput>
						</cfif>									
					</cfif>					
				</cfloop>
				
							
								
				<!-------------------------------------------------------------------------------------->
				<!--- If the last number of the interchange claim ID is anything other than a 0      --->
				<!--- then there is a flag letting you know there is history for this claim.         --->
				<!-------------------------------------------------------------------------------------->				
				
				<!---CODE FLAG--->
				<!---
				`Query for the cliamID minus the last number
				
				interchangeClaimID
				if recordcount gte 1 FLAG
				--->
					
					
																
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
					<cfif CLPs[i].DTM[1].DateTimeQualifier1.XMLText EQ 232>
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
					<cfelseif CLPs[i].DTM[1].DateTimeQualifier1.XMLText EQ 050>						
						<cfset fromYear = MID(CLPs[i].DTM[1].Date2.XMLText, 1, 4)>
						<cfset fromMonth = MID(CLPs[i].DTM[1].Date2.XMLText, 5, 2)>
						<cfset fromDay = MID(CLPs[i].DTM[1].Date2.XMLText, 7, 2)>
						<cfset fromDate = CreateDate(fromYear, fromMonth, fromDay)>	
						<cfset toYear = MID(CLPs[i].DTM[1].Date2.XMLText, 1, 4)>
						<cfset toMonth = MID(CLPs[i].DTM[1].Date2.XMLText, 5, 2)>
						<cfset toDay = MID(CLPs[i].DTM[1].Date2.XMLText, 7, 2)>
						<cfset toDate = CreateDate(toYear, toMonth, toDay)>	
					</cfif>
					
					
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
					<!--- Set the patients responsibility amount.                                        --->
					<!-------------------------------------------------------------------------------------->
					<cfset PatientResponsibilityAmount = "0.00">
					<cfif StructKeyExists(CLPs[i], 'MonetaryAmount5') AND IsNumeric(CLPs[i].MonetaryAmount5.XMLText)>
						<cfset PatientResponsibilityAmount = CLPs[i].MonetaryAmount5.XMLText>
					</cfif>
					
															
					<!-------------------------------------------------------------------------------------->
					<!--- Start the inserting of the claim.                                              --->
					<!-------------------------------------------------------------------------------------->					
					<cfset Claim.setClaimType(108)><!---This is a hardcoded EOB number found in the table StandardListItem/ListID 14 for medicare--->
					<cfset Claim.setInterchangeClaimID(trim(interchangeClaimID))>
					<cfset Claim.setClientAssignedClaimID(trim(clientAssignedClaimID))>					
					<cfset Claim.setInterchangeID(trim(InterchangeID))>
					<cfset Claim.setClientID(trim(session.clientID))>
					<cfset Claim.setEntityID(trim(EntityID))>
					<cfset Claim.setFacilityCode(trim(FacilityCode))>
					<cfset Claim.setDueDate(trim(claimDueDate))>
					<cfset Claim.setPatientResponsibilityAmount(trim(PatientResponsibilityAmount))>					
					<cfset Claim.setCrossoverEntityTypeQualifier2(trim(CrossoverEntityTypeQualifier2))>
					<cfset Claim.setCrossoverNameLastorOrganizationName3(trim(CrossoverNameLastorOrganizationName3))>
					<cfset Claim.setCrossoverIdentificationCode9(trim(CrossoverIdentificationCode9))>				
					<cfset ClaimID = Claim.commit()>
					
					
					<cfif debug>
						<cfoutput>
							<div align="left">	
								<strong><font color="FF0000">CLAIM CREATED</font></strong><br>
								<strong>Interchange Claim ID:</strong> #trim(interchangeClaimID)#<br>
								<strong>Claim ID:</strong> #trim(ClaimID)#<br>
								<strong>Facility Code:</strong> #trim(FacilityCode)#<br>
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
				
				
								
				<!-------------------------------------------------------------------------------------->
				<!--- Get the Amount at the cliam level that will be placed in the DB.               --->
				<!-------------------------------------------------------------------------------------->				
				<cfinclude template="ei_1002_ProcessMedicare835XMLFileIntoDB_ClaimSupplementalAmountElement.cfm">
				
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- enter into the database the Medicare Outpatient Adjudication (MOA)codes        --->
				<!--- attached to this claim.                                                        --->
				<!-------------------------------------------------------------------------------------->				
				<cfif StructKeyExists(CLPs[i], 'MOA')>
					
					<cfset ClaimMOA = CreateObject("component","com.common.db.Claim_MEDICARE_MOAIO")>
					
					<cfif StructKeyExists(CLPs[i].MOA, 'Percent1') AND CLPs[i].MOA.Percent1.XMLText GT "">
						<cfset ClaimMOA.reset()>
						<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
						<cfset ClaimMOA.setReimbursementRate(trim(CLPs[i].MOA.Percent1.XMLText))>
						<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
					</cfif>						
					<cfif StructKeyExists(CLPs[i].MOA, 'ReferenceIdentification3') AND CLPs[i].MOA.ReferenceIdentification3.XMLText GT "">
						<cfset ClaimMOA.reset()>
						<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
						<cfset ClaimMOA.setMOACode(trim(CLPs[i].MOA.ReferenceIdentification3.XMLText))>
						<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
					</cfif>		
					<cfif StructKeyExists(CLPs[i].MOA, 'ReferenceIdentification4') AND CLPs[i].MOA.ReferenceIdentification4.XMLText GT "">
						<cfset ClaimMOA.reset()>
						<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
						<cfset ClaimMOA.setMOACode(trim(CLPs[i].MOA.ReferenceIdentification4.XMLText))>
						<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
					</cfif>		
					<cfif StructKeyExists(CLPs[i].MOA, 'ReferenceIdentification5') AND CLPs[i].MOA.ReferenceIdentification5.XMLText GT "">
						<cfset ClaimMOA.reset()>
						<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
						<cfset ClaimMOA.setMOACode(trim(CLPs[i].MOA.ReferenceIdentification5.XMLText))>
						<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
					</cfif>		
					<cfif StructKeyExists(CLPs[i].MOA, 'ReferenceIdentification6') AND CLPs[i].MOA.ReferenceIdentification6.XMLText GT "">
						<cfset ClaimMOA.reset()>
						<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
						<cfset ClaimMOA.setMOACode(trim(CLPs[i].MOA.ReferenceIdentification6.XMLText))>
						<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
					</cfif>		
					<cfif StructKeyExists(CLPs[i].MOA, 'ReferenceIdentification7') AND CLPs[i].MOA.ReferenceIdentification7.XMLText GT "">
						<cfset ClaimMOA.reset()>
						<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
						<cfset ClaimMOA.setMOACode(trim(CLPs[i].MOA.ReferenceIdentification7.XMLText))>
						<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>	
					</cfif>
							
				</cfif>	
				
					
								
				<!-------------------------------------------------------------------------------------->
				<!--- This is where the services are parsed out of the XML and the sub elments       --->
				<!--- also like CAS.                                                                 --->
				<!-------------------------------------------------------------------------------------->				
				<cfinclude template="ei_1002_ProcessMedicare835XMLFileIntoDB_ServiceElement.cfm">
				
				
				
						
				
				<cfif debug>
					<cfoutput><p></p></cfoutput>
				</cfif>
				
			</cfloop>		
		
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Show Any error while processing.                                               --->
		<!-------------------------------------------------------------------------------------->	
		<cfcatch type="Security">			
				
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
	
		
