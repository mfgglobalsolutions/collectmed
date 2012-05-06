	



<cfcomponent>
  
   <cffunction name="onIncomingMessage" output="no">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
						
			<cf_gcCFScriptIncludes>		
			<cfset data = CFEvent.data>
			
			<cfset Claim_ProcessXMLToDBID = "#trim(data.Claim_ProcessXMLToDBID)#">			
			<cfset request.datasource = "#trim(data.datasource)#">			
			<cfset request.RO_datasource = "#trim(data.datasource)#">
			<cfset siteID = "#trim(data.siteID)#">			
			<cfset clientID = "#trim(data.clientID)#">    	
			
			<!---<cfset xmlFileID = "#trim(data.XMLfileID)#">  --->
				
							
			<!-------------------------------------------------------------------------------------->
			<!--- Verify that the needed parameters have been sent in.                           --->
			<!-------------------------------------------------------------------------------------->
			<cf_gcVerifyFields
				fields="Claim_ProcessXMLToDBID,fileManagementSystemDriveLetter,clientID"
				fieldnames="Claim ID,File Management System Drive Letter,Client ID"
				datatypes="numeric,*,numeric"
				senderrortocaller="yes">				
				
				
			<!-------------------------------------------------------------------------------------->
			<!--- Get the Administrators Email Address.                                          --->
			<!-------------------------------------------------------------------------------------->
			<cfinvoke
				component="com.common.Client" 
				method="getClientSupportEmailAddressID"										
				clientID="#trim(clientID)#"
				returnVariable="SupportEmailAddressID">	
				
				
							
			<!-------------------------------------------------------------------------------------->
			<!--- Create the ClaimXML object.                                                    --->
			<!-------------------------------------------------------------------------------------->		
			<cfset request.ClaimXML = CreateObject("component","com.common.db.Claim_ProcessXMLToDBIO").Init(trim(Claim_ProcessXMLToDBID))>		
			<cfset ClaimXML = XMLParse(request.ClaimXML.getClaimXML())>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create the interchange object                                                  --->
			<!-------------------------------------------------------------------------------------->				
			<cfset request.Interchange = CreateObject("component","com.common.Interchange").init(request.ClaimXML.getInterchangeID())>

			
			<!-------------------------------------------------------------------------------------->
			<!--- Get the fileID of this interchange                                             --->
			<!-------------------------------------------------------------------------------------->
			<cfset fileID = request.Interchange.getInterchangeFileID(clientID, request.ClaimXML.getInterchangeID())>
			<cfset interchangeID = request.ClaimXML.getInterchangeID()>
			
										
			<!-------------------------------------------------------------------------------------->
			<!--- The claim XML must have a patientID attachec to it to process.                 --->
			<!-------------------------------------------------------------------------------------->				
			<cfset Patient = CreateObject("component","com.common.Patient").init(request.ClaimXML.getPatientID())>		
			<cfset patientID = Patient.getPatientID()>				
			<cfset EntityID = Patient.getEntityID()>
			
			<cfif NOT IsDefined("patientID") OR NOT IsNumeric(patientID) OR NOT IsDefined("entityID") OR NOT IsNumeric(entityID)>
				<cfthrow message="There was an issue with the patient record. ProcessClaimXMLtoDB.cfc. 62">
			</cfif>
			
														
			<!-------------------------------------------------------------------------------------->
			<!--- Set the claims defaults                                                        --->
			<!-------------------------------------------------------------------------------------->				
			<cfset oldInterchangeClaimID = "">				
			<cfset interchangeClaimID = ClaimXML.CLP.ReferenceIdentification7.XMLText>
			<cfset clientAssignedClaimID = ClaimXML.CLP.ClaimSubmittersIdentifier1.XMLText>
			<cfset claimStatusCode = ClaimXML.CLP.ClaimStatusCode2.XMLText>
			
			<cfif NOT StructKeyExists(ClaimXML.CLP, 'FacilityCodeValue8') OR ClaimXML.CLP.FacilityCodeValue8.XMLText EQ "">
				<cfset FacilityCode = 0>
			<cfelse>
				<cfset FacilityCode = ClaimXML.CLP.FacilityCodeValue8.XMLText>
			</cfif>
			
			<cfset CrossoverEntityTypeQualifier2 = "">
			<cfset CrossoverNameLastorOrganizationName3 = "">
			<cfset CrossoverIdentificationCode9 = "">			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Crete the claim object.                                                        --->
			<!-------------------------------------------------------------------------------------->			
			<cfset Claim = CreateObject("component","com.common.Claim")>	
			
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- If the last number of the interchangeClaimID is not equal to Zero it means     --->
			<!--- that the claim has a history that needs to be looked at for the total paid     --->
			<!--- to this claim changing the net shown.                                          --->
			<!-------------------------------------------------------------------------------------->
			<cfset claimPreviousPaidAmount = "0.00">
			<cfset lastclaimIDDigit = RIGHT(trim(interchangeClaimID), 1)>
			
			<cfif lastclaimIDDigit NEQ 0>
				
				<cfset toCount = lastclaimIDDigit - 1>
				<cfloop from="0" to="#trim(toCount)#" index="digit">
					
					<cfset previousClaimID = MID(trim(interchangeClaimID), 1, evaluate(len(trim(interchangeClaimID)) - 1)) & digit>
					<cfset getPreviousClaim = Claim.getClaimQuery(fields: "ClaimID,ClaimPreviousPaidAmount", ClaimID: trim(previousClaimID))>			
					
					<cfif getPreviousClaim.RecordCount LTE 0>
						<cfset getPreviousClaimXML = request.ClaimXML.getClaim_ProcessXMLToDBQuery(fields: "ClaimXML", interchangeClaimID: trim(previousClaimID))>			
						<cfif getPreviousClaimXML.recordCount EQ 1>
							<cfset previousClaimXML = XMLParse(getPreviousClaimXML.ClaimXML)>
							<cfif StructKeyExists(previousClaimXML.CLP, 'MonetaryAmount4') AND IsNumeric(previousClaimXML.CLP.MonetaryAmount4.XMLText)>
								<cfset previousClaimPaidAmount = previousClaimXML.CLP.MonetaryAmount4.XMLText>
								<cfset claimPreviousPaidAmount = claimPreviousPaidAmount + previousClaimPaidAmount>	
							</cfif>
						</cfif>	
					<cfelseif getPreviousClaim.RecordCount EQ 1>
						<cfset claimPreviousPaidAmount = claimPreviousPaidAmount + getPreviousClaim.ClaimPreviousPaidAmount>	
					</cfif>				
				
				</cfloop>
				
			</cfif>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Set the patients responsibility amount.                                        --->
			<!-------------------------------------------------------------------------------------->
			<cfset claimPaidAmount = "0.00">
			<cfif StructKeyExists(ClaimXML.CLP, 'MonetaryAmount4') AND IsNumeric(ClaimXML.CLP.MonetaryAmount4.XMLText)>
				<cfset claimPaidAmount = ClaimXML.CLP.MonetaryAmount4.XMLText>
			</cfif>
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!---  loop in the CLP Name Element looking for the crossover entity.                --->
			<!-------------------------------------------------------------------------------------->		
			<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.NM1))#" index="crossoveri">							
				<cfif ClaimXML.CLP.NM1[crossoveri].EntityIdentifierCode1.XMLText EQ "TT">
					<cfset CrossoverEntityTypeQualifier2 = ClaimXML.CLP.NM1[crossoveri].EntityTypeQualifier2.XMLText>
					<cfset CrossoverNameLastorOrganizationName3 = ClaimXML.CLP.NM1[crossoveri].NameLastorOrganizationName3.XMLText>
					<cfset CrossoverIdentificationCode9 = ClaimXML.CLP.NM1[crossoveri].IdentificationCode9.XMLText>													
				</cfif>					
			</cfloop>
			
						
							
			<!-------------------------------------------------------------------------------------->
			<!--- If the last number of the interchange claim ID is anything other than a 0      --->
			<!--- then there is a flag letting you know there is history for this claim.         --->
			<!-------------------------------------------------------------------------------------->				
			
			<!---CODE FLAG--->
			<!---
			Query for the cliamID minus the last number
			
			interchangeClaimID
			if recordcount gte 1 FLAG
			--->
				
				
															
			
			<cfset getClaim = Claim.getClaimQuery(fields: "ClaimID,InterchangeID,EntityID", ClaimID: trim(interchangeClaimID))>			
							
							
			<!-------------------------------------------------------------------------------------->
			<!--- If the claim already exists then we need to bypass this code.                  --->
			<!-------------------------------------------------------------------------------------->					
			<cfif getClaim.RecordCount LTE 0>
													
				<!-------------------------------------------------------------------------------------->
				<!--- Set the date that the claim is due. It will be 120 days from the report date.  --->
				<!-------------------------------------------------------------------------------------->	
				<cfset claimDueDate = DateAdd("d", 120, request.Interchange.getInterchangeDate())>
								
				<!-------------------------------------------------------------------------------------->
				<!--- Get the Claim Dates.                                                           --->
				<!-------------------------------------------------------------------------------------->			
				<cfif ClaimXML.CLP.DTM[1].DateTimeQualifier1.XMLText EQ 232>
					<cfloop from="1" to="2" index="ii">
						<cfif ClaimXML.CLP.DTM[ii].DateTimeQualifier1.XMLText EQ 232 AND IsNumeric(ClaimXML.CLP.DTM[ii].Date2.XMLText) AND LEN(ClaimXML.CLP.DTM[ii].Date2.XMLText) EQ 8>
							<cfset fromYear = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 1, 4)>
							<cfset fromMonth = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 5, 2)>
							<cfset fromDay = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 7, 2)>
							<cfset fromDate = CreateDate(fromYear, fromMonth, fromDay)>															
						<cfelseif ClaimXML.CLP.DTM[ii].DateTimeQualifier1.XMLText EQ 233 AND IsNumeric(ClaimXML.CLP.DTM[ii].Date2.XMLText) AND LEN(ClaimXML.CLP.DTM[ii].Date2.XMLText) EQ 8>
							<cfset toYear = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 1, 4)>
							<cfset toMonth = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 5, 2)>
							<cfset toDay = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 7, 2)>
							<cfset toDate = CreateDate(toYear, toMonth, toDay)>	
						</cfif>
					</cfloop>					
				<cfelseif ClaimXML.CLP.DTM[1].DateTimeQualifier1.XMLText EQ 050>						
					<cfset fromYear = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 1, 4)>
					<cfset fromMonth = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 5, 2)>
					<cfset fromDay = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 7, 2)>
					<cfset fromDate = CreateDate(fromYear, fromMonth, fromDay)>	
					<cfset toYear = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 1, 4)>
					<cfset toMonth = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 5, 2)>
					<cfset toDay = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 7, 2)>
					<cfset toDate = CreateDate(toYear, toMonth, toDay)>	
				</cfif>
				
				
				<cfif NOT IsDefined("fromDate") OR NOT IsDate(fromDate)>
					<cfthrow message="While processing the file this claim XML record did not have a Claim From Date in the correct format.">					
				</cfif>
				
				<cfif NOT IsDefined("toDate") OR NOT IsDate(toDate)>
					<cfthrow message="While processing the file this claim XML record did not have a Claim To Date in the correct format.">					
				</cfif>
				
								
				
				<!-------------------------------------------------------------------------------------->
				<!--- Set the patients responsibility amount.                                        --->
				<!-------------------------------------------------------------------------------------->
				<cfset PatientResponsibilityAmount = "0.00">
				<cfif StructKeyExists(ClaimXML.CLP, 'MonetaryAmount5') AND IsNumeric(ClaimXML.CLP.MonetaryAmount5.XMLText)>
					<cfset PatientResponsibilityAmount = ClaimXML.CLP.MonetaryAmount5.XMLText>
				</cfif>
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Get the patients Name from the interchange.                                    --->
				<!-------------------------------------------------------------------------------------->					
				<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.NM1))#" index="namei">
		
					<!-------------------------------------------------------------------------------------->
					<!--- PATIENT loop in the CLP Name Element.                                          --->
					<!-------------------------------------------------------------------------------------->		
					<cfif ClaimXML.CLP.NM1[namei].EntityIdentifierCode1.XMLText EQ "QC" AND ClaimXML.CLP.NM1[namei].EntityTypeQualifier2.XMLText EQ 1>
											
						<!--- The actual ID that the patient will be known as --->													
						<cfset NM1IdentificationCode9 = ClaimXML.CLP.NM1[namei].IdentificationCode9.XMLText>
									
					<!-------------------------------------------------------------------------------------->
					<!---  loop in the CLP Name Element looking for the corrected name.                  --->
					<!-------------------------------------------------------------------------------------->		
					<cfelseif ClaimXML.CLP.NM1[namei].EntityIdentifierCode1.XMLText EQ "74" AND ClaimXML.CLP.NM1[namei].EntityTypeQualifier2.XMLText EQ 1>
														
						<!--- The actual ID that the patient will be known as --->													
						<cfif StructKeyExists(ClaimXML.CLP.NM1[namei], 'IdentificationCode9') AND ClaimXML.CLP.NM1[namei].IdentificationCode9.XMLText NEQ "">
							<cfset NM1IdentificationCode9 = ClaimXML.CLP.NM1[namei].IdentificationCode9.XMLText>				
						</cfif>
																
					</cfif>
					
				</cfloop>
				
				<cfif NM1IdentificationCode9 EQ "">
					<cfthrow message="While processing the file record did not have a correctly formatted NM Identification Code 9.">					
				</cfif>					
					
														
														
				<!-------------------------------------------------------------------------------------->
				<!--- Start the inserting of the claim.                                              --->
				<!-------------------------------------------------------------------------------------->					
				<cfset Claim.setClaimType(108)><!---This is a hardcoded EOB number found in the table StandardListItem/ListID 14 for medicare--->
				<cfset Claim.setInterchangeClaimID(trim(interchangeClaimID))>
								
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID" listid="21" itemnamedisplay="#trim(ClaimStatusCode)#" active="1" returnvariable="getListID">
				<cfset Claim.setClaimStatusCode(trim(getListID.StandardListItemID))>
				
				<cfset Claim.setStatusID(193)>					
				<cfset Claim.setClientAssignedClaimID(trim(clientAssignedClaimID))>					
				<cfset Claim.setInterchangeID(trim(InterchangeID))>
				<cfset Claim.setProviderID(trim(request.ClaimXML.getProviderID()))>
				<cfset Claim.setClientID(trim(clientID))>
				<cfset Claim.setEntityID(trim(EntityID))>
				<cfset Claim.setHICNumber(trim(NM1IdentificationCode9))>
				<cfset Claim.setFacilityCode(trim(FacilityCode))>
				<cfset Claim.setDueDate(trim(claimDueDate))>
				<cfset Claim.setClaimPreviousPaidAmount(trim(claimPreviousPaidAmount))>
				<cfset Claim.setClaimPaidAmount(trim(claimPaidAmount))>
				<cfset Claim.setPatientResponsibilityAmount(trim(PatientResponsibilityAmount))>					
				<cfset Claim.setCrossoverEntityTypeQualifier2(trim(CrossoverEntityTypeQualifier2))>
				<cfset Claim.setCrossoverNameLastorOrganizationName3(trim(CrossoverNameLastorOrganizationName3))>
				<cfset Claim.setCrossoverIdentificationCode9(trim(CrossoverIdentificationCode9))>				
				<cfset ClaimID = Claim.commit()>
				
					
				
				<cfif StructKeyExists(data,"note")>
					
					<cfset notes = data.note>															
					
					<cfif ListLen(notes, "|") EQ 4>
						
						<cfset UsersID = ListGetAt(notes, 1, "|")>
						<cfset userFName = ListGetAt(notes, 2, "|")>
						<cfset userLName = ListGetAt(notes, 3, "|")>
						<cfset note = ListGetAt(notes, 4, "|")>
						
						<cfset request.NoteXML = CreateObject("component","com.common.Note")>		
						<cfset noteID = request.NoteXML.addNote(clientID: trim(clientID), objectID: 5, instanceID: trim(ClaimID))>						
						<cfset request.NoteXML.addNoteEntry(clientID: trim(clientID), NoteID: noteID, noteEntry: '#trim(note)#', userID: trim(UsersID), userFName: '#trim(userFName)#', userLName: '#trim(userLName)#', newClaimID: '#trim(ClaimID)#')>
					
					</cfif>
					
				</cfif>
				
														
			<cfelse>
							
				<cfthrow message="CLAIM ALREADY EXISTS. No insertion past this point.">	
			
			</cfif>
			
			
							
			<!-------------------------------------------------------------------------------------->
			<!--- Get the Amount at the claim level that will be placed in the DB.               --->
			<!-------------------------------------------------------------------------------------->				
			<cfinclude template="../../../SiteSpecificCustomTags/ei_1002_ProcessMedicare835XMLFileIntoDB_ClaimSupplementalAmountElement.cfm">
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- enter into the database the Medicare Outpatient Adjudication (MOA)codes        --->
			<!--- attached to this claim.                                                        --->
			<!-------------------------------------------------------------------------------------->				
			<cfif StructKeyExists(ClaimXML.CLP, 'MOA')>
				
				<cfset ClaimMOA = CreateObject("component","com.common.db.Claim_MEDICARE_MOAIO")>
				
				<cfif StructKeyExists(ClaimXML.CLP.MOA, 'Percent1') AND ClaimXML.CLP.MOA.Percent1.XMLText GT "">
					<cfset ClaimMOA.reset()>
					<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
					<cfset ClaimMOA.setReimbursementRate(trim(ClaimXML.CLP.MOA.Percent1.XMLText))>
					<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
				</cfif>						
				<cfif StructKeyExists(ClaimXML.CLP.MOA, 'ReferenceIdentification3') AND ClaimXML.CLP.MOA.ReferenceIdentification3.XMLText GT "">
					<cfset ClaimMOA.reset()>
					<cfset ClaimMOA.setClaimID(trim(ClaimID))>							
					<cfinvoke component="com.common.db.EOB_MEDICARE_REMITTANCEADVICEREMARKCodeIO" method="getEOB_MEDICARE_REMITTANCEADVICEREMARKCodeQuery" fields="RecordID" code="#trim(ClaimXML.CLP.MOA.ReferenceIdentification3.XMLText)#" active="1" returnvariable="getMOACode">
					<cfif getMOACode.RecordCount NEQ 1>
						<cf_gcGatewayLogger	code="115" logtext="115 There was an issue with the file processing. <p> ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm <p> When searching for the code #trim(procedureIndustryCode)# in the EOB_MEDICARE_REMITTANCEADVICEREMARKCode table it was not found. <p>Records Found: #getMOACode.RecordCount#">	
						<cfset codeID = 643><!---HardCoded record that was placed in table as a catchall.--->
					<cfelse>
						<cfset codeID = getMOACode.RecordID>
					</cfif>					
					<cfset ClaimMOA.setMOACode(trim(codeID))>
					<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
				</cfif>		
				<cfif StructKeyExists(ClaimXML.CLP.MOA, 'ReferenceIdentification4') AND ClaimXML.CLP.MOA.ReferenceIdentification4.XMLText GT "">
					<cfset ClaimMOA.reset()>
					<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
					<cfinvoke component="com.common.db.EOB_MEDICARE_REMITTANCEADVICEREMARKCodeIO" method="getEOB_MEDICARE_REMITTANCEADVICEREMARKCodeQuery" fields="RecordID" code="#trim(ClaimXML.CLP.MOA.ReferenceIdentification4.XMLText)#" active="1" returnvariable="getMOACode">
					<cfif getMOACode.RecordCount NEQ 1>
						<cf_gcGatewayLogger	code="115" logtext="115 There was an issue with the file processing. <p> ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm <p> When searching for the code #trim(procedureIndustryCode)# in the EOB_MEDICARE_REMITTANCEADVICEREMARKCode table it was not found. <p>Records Found: #getMOACode.RecordCount#">	
						<cfset codeID = 643><!---HardCoded record that was placed in table as a catchall.--->
					<cfelse>
						<cfset codeID = getMOACode.RecordID>
					</cfif>					
					<cfset ClaimMOA.setMOACode(trim(codeID))>
					<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
				</cfif>		
				<cfif StructKeyExists(ClaimXML.CLP.MOA, 'ReferenceIdentification5') AND ClaimXML.CLP.MOA.ReferenceIdentification5.XMLText GT "">
					<cfset ClaimMOA.reset()>
					<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
					<cfinvoke component="com.common.db.EOB_MEDICARE_REMITTANCEADVICEREMARKCodeIO" method="getEOB_MEDICARE_REMITTANCEADVICEREMARKCodeQuery" fields="RecordID" code="#trim(ClaimXML.CLP.MOA.ReferenceIdentification5.XMLText)#" active="1" returnvariable="getMOACode">
					<cfif getMOACode.RecordCount NEQ 1>
						<cf_gcGatewayLogger	code="115" logtext="115 There was an issue with the file processing. <p> ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm <p> When searching for the code #trim(procedureIndustryCode)# in the EOB_MEDICARE_REMITTANCEADVICEREMARKCode table it was not found. <p>Records Found: #getMOACode.RecordCount#">	
						<cfset codeID = 643><!---HardCoded record that was placed in table as a catchall.--->
					<cfelse>
						<cfset codeID = getMOACode.RecordID>
					</cfif>					
					<cfset ClaimMOA.setMOACode(trim(codeID))>
					<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
				</cfif>		
				<cfif StructKeyExists(ClaimXML.CLP.MOA, 'ReferenceIdentification6') AND ClaimXML.CLP.MOA.ReferenceIdentification6.XMLText GT "">
					<cfset ClaimMOA.reset()>
					<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
					<cfinvoke component="com.common.db.EOB_MEDICARE_REMITTANCEADVICEREMARKCodeIO" method="getEOB_MEDICARE_REMITTANCEADVICEREMARKCodeQuery" fields="RecordID" code="#trim(ClaimXML.CLP.MOA.ReferenceIdentification6.XMLText)#" active="1" returnvariable="getMOACode">
					<cfif getMOACode.RecordCount NEQ 1>
						<cf_gcGatewayLogger	code="115" logtext="115 There was an issue with the file processing. <p> ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm <p> When searching for the code #trim(procedureIndustryCode)# in the EOB_MEDICARE_REMITTANCEADVICEREMARKCode table it was not found. <p>Records Found: #getMOACode.RecordCount#">	
						<cfset codeID = 643><!---HardCoded record that was placed in table as a catchall.--->
					<cfelse>
						<cfset codeID = getMOACode.RecordID>
					</cfif>					
					<cfset ClaimMOA.setMOACode(trim(codeID))>
					<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>
				</cfif>		
				<cfif StructKeyExists(ClaimXML.CLP.MOA, 'ReferenceIdentification7') AND ClaimXML.CLP.MOA.ReferenceIdentification7.XMLText GT "">
					<cfset ClaimMOA.reset()>
					<cfset ClaimMOA.setClaimID(trim(ClaimID))>						
					<cfinvoke component="com.common.db.EOB_MEDICARE_REMITTANCEADVICEREMARKCodeIO" method="getEOB_MEDICARE_REMITTANCEADVICEREMARKCodeQuery" fields="RecordID" code="#trim(ClaimXML.CLP.MOA.ReferenceIdentification7.XMLText)#" active="1" returnvariable="getMOACode">
					<cfif getMOACode.RecordCount NEQ 1>
						<cf_gcGatewayLogger	code="115" logtext="115 There was an issue with the file processing. <p> ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm <p> When searching for the code #trim(procedureIndustryCode)# in the EOB_MEDICARE_REMITTANCEADVICEREMARKCode table it was not found. <p>Records Found: #getMOACode.RecordCount#">	
						<cfset codeID = 643><!---HardCoded record that was placed in table as a catchall.--->
					<cfelse>
						<cfset codeID = getMOACode.RecordID>
					</cfif>					
					<cfset ClaimMOA.setMOACode(trim(codeID))>
					<cfset Claim_MEDICARE_MOAID = ClaimMOA.commit()>	
				</cfif>
						
			</cfif>	
			
				
							
			<!-------------------------------------------------------------------------------------->
			<!--- This is where the services are parsed out of the XML and the sub elements      --->
			<!--- also like CAS.                                                                 --->
			<!-------------------------------------------------------------------------------------->				
			<cfinclude template="../../../SiteSpecificCustomTags/ei_1002_ProcessMedicare835XMLFileIntoDB_ServiceElement.cfm">
	
	
	
			<!-------------------------------------------------------------------------------------->
			<!--- Update the record to mark it processed.                                        --->
			<!-------------------------------------------------------------------------------------->			
			<cfset request.ClaimXML.setActive(0)>
			<cfset request.ClaimXML.setInactiveCode(68)>
			<cfset request.ClaimXML.commit()>
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- If all the claimXML records are set to Zero it means the file has finished     --->
			<!--- processing all the records and you can set the file to finished processing.    --->
			<!-------------------------------------------------------------------------------------->			
			<cfset request.ClaimFile = CreateObject("component", "com.common.ClaimFile")>
			<cfset request.ClaimFile.processingFinishedUpdateStatus(trim(interchangeID), trim(fileID))>		
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- Placing this in response to the inability by JRun to possibly not releasing    --->
			<!--- ram used by the request scope. 05/04/05                                        --->
			<!-------------------------------------------------------------------------------------->
			<cfset tempClear = StructClear(Request)>				
									
			
			
			<cfcatch type="Any">				
				
				<cf_gcGatewayLogger code="115" logtext="115 There was an issue with the claim XML processing. <p> IN ProcessClaimXMLToDB.cfc <p> #cfcatch.type# #cfcatch.message# #cfcatch.detail# 363">				
			
			</cfcatch>
		
		
		</cftry>
     
   </cffunction>
   
</cfcomponent>

	