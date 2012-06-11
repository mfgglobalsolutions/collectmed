				
					
				
							
				<!--------------------------------------------------------------------------------------->
				<!--- From here the claim ID is new and now we can insert its individual procedures.  --->
				<!--- Take note that from this point forward to avoid confusion we are using          --->
				<!--- "PROCEDURE CODE" to describe the codes that come in from the report and the     --->
				<!--- "EOB PROCEDURE CODE" to describe the EOB code given to a procedure code.        --->
				<!--------------------------------------------------------------------------------------->			
				<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.SVC))#" index="iii">
						
					<cfset procedureFlag = "yes">
					<cfset insertProcedure = "yes">
					<cfset eobProcedureCode = "">
					<cfset procedureMessage = "">
					<cfset priorProcedureCode = "">
										
					<cfset procModifierList = ClaimXML.CLP.SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText>
										
					<cfset procedureCode = ListGetAt(procModifierList, 2, ">")>		
					
					<!---Medicare changed the proc code.--->
					<cfif StructKeyExists(ClaimXML.CLP.SVC[iii], 'CompositeMedicalProcedureIdentifier6') AND ClaimXML.CLP.SVC[iii].CompositeMedicalProcedureIdentifier6.XMLText NEQ "">				
						<cfset priorProcedureCode = ClaimXML.CLP.SVC[iii].CompositeMedicalProcedureIdentifier6.XMLText>		
					</cfif>
							
						
															
					<!-------------------------------------------------------------------------------------->
					<!--- Few Exceptions when two codes are found.                                       --->
					<!--- HCPC with a RIC equal to 3 is a billable procedure code.                       --->
					<!--- Can be found at                                                                --->
					<!--- request.filesPath\misc\Medicare_ProcedureCodes_UnZipped                        --->
					<!--- 06EXPLANATION_OF_MEDICARE_ PEOCEDURE_COLUMNS.txt                               --->			
					<!--- CODE 4, 7, 8  LATER                                                            --->	
					<!-------------------------------------------------------------------------------------->				
					<cfquery name="getEOBProcedureCode" datasource="#trim(request.datasource)#">
						SELECT RecordID
						FROM pa_master.EOB_MEDICARE_PROCEDURECode
						WHERE HCPC = '#trim(ProcedureCode)#' AND RIC = 3
					</cfquery>
					
					<cfif getEOBProcedureCode.RecordCount EQ 1>
						
						<cfset procedureFlag = "no">
						<cfset eobProcedureCode = getEOBProcedureCode.RecordID>
																													
					<cfelse>
						
						<!---Set the EOBProcCode to the EXCEPTION code. Leave flag at yes--->							
						<cfset eobProcedureCode = 9175>
						
						<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
						<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
						<cfset message = "CODE NOT FOUND.">
						<cfset adminMessage = "<p><strong>Admin Note: IMMEDIATE ATTENTION REQUIRED</strong><br>The tag #GetCurrentTemplatePath()# found an issue with the procedure code the recordcount from the query returned #getEOBProcedureCode.RecordCount# record(s).  <br>Where clause attempted: WHERE HCPC = '#trim(ProcedureCode)#'</p>">
						<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="#patientID# #entityID# EOB Procedure Code NOT Found. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
						<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(adminMessage)#">	
							
						<!---CODE FLAG--->							
										
					</cfif>
					
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- Get the monetary amounts on this claim                                         --->
					<!-------------------------------------------------------------------------------------->										
					<cfset billedAmount = ClaimXML.CLP.SVC[iii].MonetaryAmount2.XMLText>
					<cfset paidAmount = ClaimXML.CLP.SVC[iii].MonetaryAmount3.XMLText>
					
					
										
					<!--------------------------------------------------------------------------------------->
					<!--- Quantity5 shows us what they paid but if it is blank then assume that it is 1.  --->
					<!--- Set the billed quantity here but if Quantity7 exists then set billed            --->
					<!--- quantity to it. Differences in these numbers would flag this claim              --->
					<!--------------------------------------------------------------------------------------->					
					<cfif NOT StructKeyExists(ClaimXML.CLP.SVC[iii], 'Quantity5') OR ClaimXML.CLP.SVC[iii].Quantity5.XMLText EQ "">
						<cfset billedQuantity = 1>
						<cfset paidQuantity = 1>
					<cfelse>						
						<cfset billedQuantity = ClaimXML.CLP.SVC[iii].Quantity5.XMLText> 
						<cfset paidQuantity = ClaimXML.CLP.SVC[iii].Quantity5.XMLText> 
					</cfif>					
							
					<cfif StructKeyExists(ClaimXML.CLP.SVC[iii], 'Quantity7')>					
						<cfset billedQuantity = ClaimXML.CLP.SVC[iii].Quantity7.XMLText> 						
					</cfif>			
					
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- Start the processing of the date for this service whether it has a date on it  --->
					<!--- or we must use the claim date.                                                 --->
					<!-------------------------------------------------------------------------------------->					
					<cfset svcPeriodStart = fromDate>
					<cfset svcPeriodEnd = toDate>
					
					<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].DTM, 'DateTimeQualifier1')>
						
						<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.SVC[iii].DTM))#" index="svcdatei">
							
							<cfif ClaimXML.CLP.SVC[iii].DTM[svcdatei].DateTimeQualifier1.XMLText EQ 472>
								<cfset svcDateYear = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 1, 4)>		
								<cfset svcDateMonth = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 5, 2)>		
								<cfset svcDateDay = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 7, 2)>
								<cfset svcDate = CreateDate(svcDateYear, svcDateMonth, svcDateDay)>	
								<cfset svcPeriodStart = svcDate>
								<cfset svcPeriodEnd = svcDate>
							<cfelseif ClaimXML.CLP.SVC[iii].DTM[svcdatei].DateTimeQualifier1.XMLText EQ 150>
								<cfset svcDateYear = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 1, 4)>		
								<cfset svcDateMonth = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 5, 2)>		
								<cfset svcDateDay = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 7, 2)>
								<cfset svcStartDate = CreateDate(svcDateYear, svcDateMonth, svcDateDay)>	
								<cfset svcPeriodStart = svcStartDate>							
							<cfelseif ClaimXML.CLP.SVC[iii].DTM[svcdatei].DateTimeQualifier1.XMLText EQ 151>
								<cfset svcDateYear = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 1, 4)>		
								<cfset svcDateMonth = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 5, 2)>		
								<cfset svcDateDay = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 7, 2)>
								<cfset svcDateEnd = CreateDate(svcDateYear, svcDateMonth, svcDateDay)>	
								<cfset svcPeriodEnd = svcDateEnd>	
							</cfif>	
						
						</cfloop>				
						
					</cfif>
									
						
								
					<!-------------------------------------------------------------------------------------->
					<!--- Find out if the procedure for this claim already exists. Chances are that it   --->
					<!--- does not exist since these are new claims but check anyway.                    --->
					<!-------------------------------------------------------------------------------------->					
					<cfset Procedure = CreateObject("component","com.common.Procedure")>	
					<cfset getProcedure = Procedure.getProcedureQuery(fields: "ProcedureID", ProcedureCode: trim(eobProcedureCode), ClaimID: trim(ClaimID))>			
										
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
						<cfset Procedure.setPriorProcedureCode(trim(priorProcedureCode))>
						<cfset Procedure.setServiceDateFrom(CreateODBCDate(svcPeriodStart))>
						<cfset Procedure.setServiceDateTo(CreateODBCDate(svcPeriodEnd))>
						<cfset Procedure.setBilledQuantity(trim(billedQuantity))> <!--- Take note this may be wrong but must be set to one if not sent in. --->
						<cfset Procedure.setBilledAmount(trim(billedAmount))>
						<cfset Procedure.setPaidQuantity(trim(paidQuantity))>
						<cfset Procedure.setPaidAmount(trim(paidAmount))>
						<cfset ProcedureID = Procedure.commit()>
					
					</cfif>
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- Start the insertion of the modifiers tied to this procedure.                   --->
					<!-------------------------------------------------------------------------------------->					
					<cfif ListLen(procModifierList, ">") GTE 3>
					
						<cfset request.Procedure_MEDICARE_MODIFIER = CreateObject("component","com.common.db.Procedure_MEDICARE_MODIFIERIO")>
						<cfset request.EOB_MEDICARE_CLAIMMODIFIERCode = CreateObject("component","com.common.db.EOB_MEDICARE_CLAIMMODIFIERCodeIO")>
								
						<cfloop from="3" to="#ListLen(procModifierList, '>')#" index="i_procModifierList">
																				
							<cfset thisMod = ListGetAt(trim(procModifierList), i_procModifierList, ">")>
							
							<cfif i_procModifierList EQ 7>
							
								<cfset request.Procedure_MEDICARE_MODIFIER.reset()>
								<cfset request.Procedure_MEDICARE_MODIFIER.setClaimID(trim(ClaimID))>						
								<cfset request.Procedure_MEDICARE_MODIFIER.setDescription(trim(thisMod))>
								<cfset request.Procedure_MEDICARE_MODIFIERID = request.Procedure_MEDICARE_MODIFIER.commit()>							
							
							<cfelse>
							
								<!-------------------------------------------------------------------------------------->
								<!--- Check the DB for this modifier. HardCoded 132 FROM standardlist table ID: 17   --->
								<!-------------------------------------------------------------------------------------->		
								<cfset request.EOB_MEDICARE_CLAIMMODIFIERCode.reset()>
								<cfset getModifierInDB = request.EOB_MEDICARE_CLAIMMODIFIERCode.getEOB_MEDICARE_CLAIMMODIFIERCodeQuery(fields: "RecordID", StandardListItemID: 132, modifier: trim(thisMod))>			
								
								<!-------------------------------------------------------------------------------------->
								<!--- Found out that the 835 file does not tell us what category to use for the      --->
								<!--- modifier so what we need to do is first look for the DME category (132) and    --->
								<!--- then search the first and choose the first category.                           --->
								<!-------------------------------------------------------------------------------------->							
								<cfif getModifierInDB.RecordCount LTE 0>
									<cfset getModifierInDB = request.EOB_MEDICARE_CLAIMMODIFIERCode.getEOB_MEDICARE_CLAIMMODIFIERCodeQuery(fields: "RecordID", top1: 'yes', modifier: trim(thisMod))>			
								</cfif>
								
								<!-------------------------------------------------------------------------------------->
								<!--- The code was not found so alert the EOB Admin and insert the record.           --->
								<!-------------------------------------------------------------------------------------->
								<cfif getModifierInDB.RecordCount LTE 0>
									
									<!--- When we changed to a gateway we could not delete the file when a claim is being processed individually.
									<cfset request.File = CreateObject("component","com.common.File")>	
									<cfset request.File.deleteFileDBAndDirectory(trim(fileID))>
									<cfset request.File.deleteFileDBAndDirectory(trim(delFileID))>--->																									
									<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
									<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
									<cfset message = "There was an issue with the modifier code. An administrator has been notified.">
									<cfset adminMessage = "Admin Note:</strong><br> The Modifier Code (Modifier: #trim(thisMod)#, StandardListItemID: 132) used for this Medicare Claim (#trim(ClaimID)#) cannot be found in the pa_master.EOB_MEDICARE_CLAIMMODIFIERCode table. DEFAULT Modifier (-X- 117) was used must be replaced when correct modifier is added.</p>">
									<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The medicare Claim Modifier does not exist. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
									<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(adminMessage)#">	
									<cfset getModifierInDBRecordID = 117>
									<!---<cfthrow message="#trim(message)#">--->
																	
								</cfif>
								
								<cfif getModifierInDB.RecordCount GTE 1>
									<cfset getModifierInDBRecordID = getModifierInDB.RecordID>
								</cfif>
									
								<cfset request.Procedure_MEDICARE_MODIFIER.reset()>
								<cfset request.Procedure_MEDICARE_MODIFIER.setProcedureID(trim(ProcedureID))>						
								<cfset request.Procedure_MEDICARE_MODIFIER.setModifierCode(trim(getModifierInDBRecordID))>
								<cfset request.Procedure_MEDICARE_MODIFIERID = request.Procedure_MEDICARE_MODIFIER.commit()>							
							
							</cfif>
								
						</cfloop>
										
					</cfif>
					
					
										
					<!-------------------------------------------------------------------------------------->
					<!--- Code into input into the DB the service Supplemental Amounts if any.           --->
					<!-------------------------------------------------------------------------------------->															
					<cfinclude template="ei_1002_ProcessMedicare835XMLFileIntoDB_ServiceSupplementalAmountElement.cfm">							
						
					<!-------------------------------------------------------------------------------------->
					<!--- Get the claim adjustments that will be input.                                  --->
					<!-------------------------------------------------------------------------------------->					
					<cfinclude template="ei_1002_ProcessMedicare835XMLFileIntoDB_ClaimAdjustmentElement.cfm">
					
					<!-------------------------------------------------------------------------------------->
					<!--- Get the procedure remarks that will be input.                                  --->
					<!-------------------------------------------------------------------------------------->					
					<cfinclude template="ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm">
					
					
					
					<cfset procModifierList = "">	
					
				</cfloop>
				
