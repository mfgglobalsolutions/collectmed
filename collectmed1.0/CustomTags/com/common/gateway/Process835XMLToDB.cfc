	



<cfcomponent>
  
   <cffunction name="onIncomingMessage" output="no">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
						
			<cf_gcCFScriptIncludes>		
			<cfset data = CFEvent.data>
			
			<cfset request.datasource = "#trim(data.datasource)#">			
			<cfset request.RO_datasource = "#trim(data.datasource)#">
			<cfset siteID = "#trim(data.siteID)#">			
			<cfset clientID = "#trim(data.clientID)#">    	
			<cfset fileID = "#trim(data.fileID)#">  
			<cfset xmlFileID = "#trim(data.XMLfileID)#">  
			<cfset interchangeID = "#trim(data.interchangeID)#">  
			<cfset SupportEmailAddressID = "#trim(data.SupportEmailAddressID)#"> 
			
				
		
			<!-------------------------------------------------------------------------------------->
			<!--- Verify that the needed parameters have been sent in.                           --->
			<!-------------------------------------------------------------------------------------->
			<cf_gcVerifyFields
				fields="clientID,fileID,SupportEmailAddressID,XMLFileID"
				fieldnames="Client ID,File ID,Support Email Address ID,XML File ID"
				datatypes="numeric,numeric,numeric,numeric"
				senderrortocaller="yes">
				
			<cfif errorMessage NEQ "">
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "#trim(errorMessage)#">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The file processed is missing fields. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong></p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(siteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			</cfif>
				
				
							
			<!-------------------------------------------------------------------------------------->
			<!--- Create the File object.                                                        --->
			<!-------------------------------------------------------------------------------------->		
			<cfset request.File = CreateObject("component","com.common.File")>	
			
			
					
			<!-------------------------------------------------------------------------------------->
			<!--- First find out if the file actually has a DB record.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfif request.File.checkFileExistsInDB(trim(XMLFileID))>
				<cfset request.File.Init(trim(XMLFileID))>	
			<cfelse>
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The file you are attempting to process does not exist in the database. Please contact an administrator if you feel this is an error.">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The file is missing. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong></p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(siteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			</cfif>
			
			
		
			<!----------------------------------------------------------------------------------------------->
			<!--- To this point the DB record is in place now setup the variables to check the directory. --->
			<!----------------------------------------------------------------------------------------------->		
			<cfset directoryPath = request.File.getServerDirectory()>
			<cfset fileName	= request.File.getServerFile()>			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Does the File Exist and can it be found in the Directory.                      --->
			<!-------------------------------------------------------------------------------------->			
			<cfset existsFile = request.File.checkFileExistsInDirectory(filename: "#trim(fileName)#", directory: "#trim(directoryPath)#\")>
			
			<cfif NOT existsFile>
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The file you are attempting to process does not exist in the directory but does exist in the database. Please contact an administrator.">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client file in directory does not exist. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(siteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			
			</cfif>			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check the file the 835 file string.                                            --->
			<!-------------------------------------------------------------------------------------->			
			<cffile action="READ" file="#trim(directoryPath)#\#trim(fileName)#" variable="fileContents">
				
						
			
			<!-------------------------------------------------------------------------------------->
			<!--- Now that all the tests are passed we can bring the XML file into a local       --->
			<!--- variable.                                                                      --->
			<!-------------------------------------------------------------------------------------->		
			<cfset interchange835 = XMLParse(fileContents)>
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Now we add the report to the database so we can attach a reportid to the       --->
			<!--- individual claims to show what report they came in on.                         --->
			<!-------------------------------------------------------------------------------------->		
			<cfset interchangeFileID = trim(interchange835.ISA.ControlNumber13.XMLText)>
			<cfset interchangeDateYear = MID(interchange835.ISA.Date9.XMLText, 1, 2)>
			<cfset interchangeDateMonth = MID(interchange835.ISA.Date9.XMLText, 3, 2)>
			<cfset interchangeDateDay = MID(interchange835.ISA.Date9.XMLText, 5, 2)>
			<cfset interchangeDate = CreateDate(interchangeDateYear, interchangeDateMonth, interchangeDateDay)>
			
			
			<cfset stElements = XMLSearch(interchange835, "//ST")>

			<cfloop from="1" to="#trim(ArrayLen(stElements))#" index="sti">
								
				<!--------------------------------------------------------------------------------------->
				<!--- loop through all the claims on this interchange and place them in the database. --->
				<!--------------------------------------------------------------------------------------->			
				<cfloop from="1" to="#Arraylen(stElements[sti])#" index="i">
									
					<cfset N1s = XMLSearch(stElements[sti], "N1")>
					<cfloop from="1" to="#trim(ArrayLen(N1s))#" index="N1">						
						<cfif ArrayLen(N1s[N1].XMLChildren) GTE 4 AND N1s[N1].EntityIdentifierCode1.XMLText EQ "PE">	
							<cfset providerID = N1s[N1].REF.ReferenceIdentification2.XMLText>									
						</cfif>						
					</cfloop>
					
					<cfset CLPsElements = XMLSearch(stElements[sti], "LX/CLP")>

					<cfloop from="1" to="#trim(ArrayLen(CLPsElements))#" index="CLPi">
						
						<!-------------------------------------------------------------------------------------->
						<!--- We will loop over all the CLP which are claims in this file.                   --->
						<!-------------------------------------------------------------------------------------->			
						<!---<cfset CLPs = XMLSearch(interchange835, "//CLP")>--->
						<cfset numberOfClaims = ArrayLen(CLPsElements[CLPi])>
						<cfset request.ClaimProcess = CreateObject("component", "com.common.db.Claim_ProcessXMLToDBIO")>	
						<cfset Patient = CreateObject("component","com.common.Patient")>				
						
								
						<!--------------------------------------------------------------------------------------->
						<!--- loop through all the claims on this interchange and place them in the database. --->
						<!--------------------------------------------------------------------------------------->			
						<cfloop from="1" to="#Arraylen(CLPsElements[CLPi])#" index="i">
										
							<cfset IdentificationCodeQualifier = "">
							<cfset ClaimSubmitterIdentifier = CLPsElements[CLPi].ClaimSubmittersIdentifier1.XMLText>
							<cfset interchangeClaimID = CLPsElements[CLPi].ReferenceIdentification7.XMLText>
																			
							<!-------------------------------------------------------------------------------------->
							<!--- Get the patients Name from the interchange.                                    --->
							<!-------------------------------------------------------------------------------------->					
							<!---This will have to be looked at in the near future for the NM1 loop info--->			
							<cfinclude template="../../../SiteSpecificCustomTags/ei_1002_Process835XMLFileIntoDB_NM1_Element.cfm">		
									
											
							<!----------------------------------------------------------------------------------------------->
							<!--- Find out if the current ClaimSubmitterIdentifier is in the database and get their       --->
							<!--- ID Record. PatientCreate() methods checks if the ClaimSubmitterIdentifier exists.       --->   
							<!----------------------------------------------------------------------------------------------->								
							<cfset Patient.reset()>
							
							<cfset patientQueryORid = Patient.patientExists(ClientID: trim(clientID), ClaimSubmitterIdentifier: trim(ClaimSubmitterIdentifier), FName: trim(patientFName), MName: trim(patientMiddleName), LName: trim(patientLName), nameMatch: 1)>				
																					
							<cfif NOT IsQuery(patientQueryORid) AND IsNumeric(patientQueryORid)>
								
								<cfif trim(patientQueryORid) LTE 0>
									<cfset patientID = Patient.patientCreate(ClientID: trim(clientID), ClaimSubmitterIdentifier: trim(ClaimSubmitterIdentifier), FName: trim(patientFName), MName: trim(patientMiddleName), LName: trim(patientLName))>				
								<cfelse>
									<cfset patientID = patientQueryORid>
								</cfif>
														
								<cfset request.ClaimProcess.reset()>
								<cfset request.ClaimProcess.setInterchangeID(trim(interchangeID))>
								<cfset request.ClaimProcess.setClaimXML(trim(toString(CLPsElements[CLPi])))>
								<cfset request.ClaimProcess.setPatientID(trim(patientID))>	
								<cfset request.ClaimProcess.setProviderID(trim(providerID))>	
								<cfset request.ClaimProcess.setinterchangeClaimID(trim(interchangeClaimID))>			
								<cfset Claim_ProcessXMLToDBID = request.ClaimProcess.commit()>													
												
								<!-------------------------------------------------------------------------------------->
								<!--- actual call to process the single CLP by the gateway.                          --->
								<!-------------------------------------------------------------------------------------->
								<cfscript>	   
								   structParameters = structNew();	    
								   structParameters.Claim_ProcessXMLToDBID = #trim(Claim_ProcessXMLToDBID)#;
								   structParameters.datasource = #trim(request.datasource)#;
								   structParameters.siteID = #trim(SiteID)#;	 
								   structParameters.clientID = #trim(clientID)#;										
								</cfscript>	
								
								<cfset SendGatewayMessage("ProcessClaimXMLToDB", structParameters)>
							
							<cfelseif IsQuery(patientQueryORid)>


								<!-------------------------------------------------------------------------------------->
								<!--- Put the file on hold this one claim cannot be cleared from this file.          --->
								<!-------------------------------------------------------------------------------------->																
								<cfset request.File.updateFileStatus(trim(fileID), 97, 'Auto Note: Claims on this file have issues.')>
																
								<cfset request.ClaimProcess.reset()>
								<cfset request.ClaimProcess.setInterchangeID(trim(interchangeID))>
								<cfset request.ClaimProcess.setClaimXML(trim(toString(CLPsElements[CLPi])))>
								<cfset request.ClaimProcess.setProviderID(trim(providerID))>	
								<cfset request.ClaimProcess.setPossiblePatientID('#valuelist(patientQueryORid.patientID)#')>	
								<cfset request.ClaimProcess.setinterchangeClaimID(trim(interchangeClaimID))>			
								<cfset Claim_ProcessXMLToDBID = request.ClaimProcess.commit()>	
								
								<!-------------------------------------------------------------------------------------->
								<!--- This claim will need to be handled manually to verify the patientID.           --->
								<!--- The administrator will get the choice of the patients found or rerun this one  --->
								<!--- with a forced creation of a patient.                                           --->
								<!--------------------------------------------------------------------------------------> 						
								<cfset request.role = CreateObject("component", "com.common.role")>
								<cfset usersID = request.role.getUsersWithSpecificRole(clientID, '2,3')>
															
								<cfif ListLen(usersID) GTE 1 AND usersID NEQ 0>
												
									<cfset note =  "<p><strong>The following claim cannot be processed. Multiple possible patient identifications possible.</strong></p><script language=JavaScript>function editClaimXMLToDBPage(){Claim_ProcessXMLToDB=window.open('appProcessClaimXMLToDB.cfm?Claim_ProcessXMLToDBID=#trim(Claim_ProcessXMLToDBID)#', 'Claim_ProcessXMLToDB', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=780,height=450'); Claim_ProcessXMLToDB.focus(0);};</script><p><a href=## onclick=editClaimXMLToDBPage();>View&nbsp;This&nbsp;Claim</a></p>">	
																	
									<cfloop list="#trim(usersID)#" index="i">
										<cfquery name="insertSystemUserMessage" datasource="PAClient_#trim(ClientID)#">
											INSERT INTO systemusermessage(UsersID,Note)
											VALUES(#trim(i)#, '#trim(note)#')
										</cfquery>
									</cfloop>
								
								</cfif>	
								
							
							</cfif>							
											
							
						</cfloop>			
						
					</cfloop>
					
				</cfloop>	
						
			</cfloop>	
			
					
						
			<!-------------------------------------------------------------------------------------->
			<!--- Placing this in response to the inability by JRun to possibly not releasing    --->
			<!--- ram used by the request scope. 05/04/05                                        --->
			<!-------------------------------------------------------------------------------------->
			<cfset tempClear = StructClear(Request)>				
									
			
			
			<cfcatch type="Any">
				
				 <cf_gcGatewayLogger datasource="#trim(request.datasource)#" code="115" logtext="115 There was an issue with the file processing. <p> IN Process835XMLToDB.cfc <p> #cfcatch.type# #cfcatch.message# #cfcatch.detail#">				
				
			</cfcatch>
		
		
		</cftry>
     
   </cffunction>
   
</cfcomponent>

	