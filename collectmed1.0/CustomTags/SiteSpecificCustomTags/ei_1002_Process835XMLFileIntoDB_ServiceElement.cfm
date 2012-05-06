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
									
					<cfset procedureCode = ListGetAt(CLPs[i].SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText, 2, ">")>
					<cfset procModifierList = CLPs[i].SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText>
					<cfset procModifierList = ListDeleteAt(procModifierList, 1, ">")>
					<cfset procModifierList = ListDeleteAt(procModifierList, 1, ">")>
					
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
								&nbsp;&nbsp;&nbsp;<strong>Procedure Code:</strong>#ListGetAt(CLPs[i].SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText, 2, ">")#<br>
							</div>
						</cfoutput>
					</cfif>	
					
					<cfset thisModifierCode = "">
					<cfif procModifierList NEQ "">
					
						<cfloop list="#trim(procModifierList)#" delimiters=">" index="thisMod">
							
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
							
							<cfset adminMessage = "<p><strong>User screen:</strong> <br>#trim(message)#</p><p><strong>Admin Note: IMMEDIATE ATTENTION REQUIRED</strong><br>The tag #GetCurrentTemplatePath()# found an issue with the procedure code the recordcount from the query returned #getEOBProcedureCode.RecordCount# record(s).  <br>Query attempted: SELECT * FROM pa_master.EOB_PROCEDURECode WHERE Code = '#trim(ProcedureCode)#'</p>">
								    			
							<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="EOB Procedure Code NOT Found. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
								
							<cf_gcGatewayLogger	datasource="#trim(request.datasource)#"  code="115" logtext="#trim(adminMessage)#">	
								
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
						<!--- <cfset Procedure.setBilledQuantity(billedPaidQuantity)> took out because this would not be correct this number is coming from report.	--->
						<cfset Procedure.setBilledAmount(trim(billedAmount))>
						<cfset Procedure.setPaidQuantity(trim(billedPaidQuantity))>
						<cfset Procedure.setPaidAmount(trim(paidAmount))>
						<cfset ProcedureID = Procedure.commit()>
					
					</cfif>
					
					
															
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
						
						
						
					<!-------------------------------------------------------------------------------------->
					<!--- Get the cliam adjustments that will be input.                                  --->
					<!-------------------------------------------------------------------------------------->					
					<!---<cfinclude template="ei_1002_Process835XMLFileIntoDB_ClaimAdjustmentElement.cfm">--->
					
						
						
						
					</p>
					</div>
				</cfloop>
				