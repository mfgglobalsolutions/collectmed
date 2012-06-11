



<cfcomponent extends="com.common.db.PatientIO">		


	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check if a file exists in the DB.              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="patientExists" output="yes" hint="This function will be called to find out if a specific patient exists for this client.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="ClaimSubmitterIdentifier" required="no" type="string" default="">
		<cfargument name="FName" required="no" type="string" default="">
		<cfargument name="MName" required="no" type="string" default="">
		<cfargument name="LName" required="no" type="string" default="">	
		<cfargument name="nameMatch" required="no" type="string" default="0">
		<cfargument name="patientID" required="no" type="string" default="">		
		<cfargument name="DOB" required="no" type="string" default="">	
		<cfargument name="SSN" required="no" type="string" default="">		
						
		<cftry>
		
			<cfif IsNumeric(patientID)>
				
				<cfquery name="getPatient" datasource="PAClient_#trim(ClientID)#">
					SELECT p.PatientID, e.entityID
					FROM patient p   INNER JOIN entity e ON p.EntityID = e.EntityID
					WHERE p.PatientID = '#trim(patientID)#'
				</cfquery>
							
				<cfreturn getPatient>
			
			</cfif>
		
			<!-------------------------------------------------------------------------------------->
			<!--- Check the ClaimSubmitterIdentifier that was sent in from the element           --->
			<!--- CLPsElements[CLPi].ClaimSubmittersIdentifier1.XMLText in the 835 file.         --->
			<!--------------------------------------------------------------------------------------> 		
			<cfif trim(ClaimSubmitterIdentifier) NEQ "" AND trim(ClaimSubmitterIdentifier) NEQ 0>		
			
				<cfset getPatient = patientExistsByClaimSubmitterIdentifier(ClientID: trim(clientID), ClaimSubmitterIdentifier: trim(ClaimSubmitterIdentifier))>
				
				<cfif IsQuery(getPatient) AND getPatient.RecordCount EQ 1>					
					<cfreturn getPatient.PatientID>	
				</cfif>
				
			</cfif>	
						
					
			<cfif trim(FName) NEQ "" AND trim(LName) NEQ "">
					
				<cfquery name="getPatient" datasource="PAClient_#trim(ClientID)#">
					SELECT p.PatientID, e.entityID
					FROM patient p   INNER JOIN entity e ON p.EntityID = e.EntityID
					WHERE e.clientID = #trim(clientID)# AND (e.FName = '#trim(FName)#' OR e.FName = '#LEFT(trim(FName), 1)#') AND e.LName = '#trim(LName)#' 
					<cfif MName NEQ "">	AND e.MName = '#trim(MName)#' </cfif>
					<cfif DOB NEQ ""> AND e.DOB BETWEEN '#DateFormat(trim(DOB), "YYYY-MM-DD")#' AND '#DateFormat(trim(DOB), "YYYY-MM-DD")# 23:59:59.997'</cfif>
					<cfif SSN NEQ ""> AND e.SSN = '#trim(SSN)#' </cfif>
				</cfquery>
						
				
				<cfif getPatient.RecordCount GT 0>
																
					<!-------------------------------------------------------------------------------------->
					<!--- Because the user has decided they want back the query that makes up the found  --->
					<!--- names return back that query.                                                  --->
					<!-------------------------------------------------------------------------------------->						
					<cfif nameMatch>
						<cfreturn getPatient>
					</cfif>	
														
				</cfif>	
										
			</cfif>	
						
				
				
			<!-------------------------------------------------------------------------------------->
			<!--- Everything to get a match to a patient failed just send back zero.             --->
			<!-------------------------------------------------------------------------------------->		
			<cfreturn 0>
				
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to see if a patient exists based on the           --->
	<!--- Claim Submitter Identifier.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="patientExistsByClaimSubmitterIdentifier" output="yes" hint="This function will be called to see if a patient exists based on the Claim Submitter Identifier.">		
			
		<cfargument name="ClientID" required="yes" type="numeric">
		<cfargument name="ClaimSubmitterIdentifier" required="yes" type="string">
						
		<cftry>
				
			<cfif trim(ClaimSubmitterIdentifier) NEQ "" AND trim(ClaimSubmitterIdentifier) NEQ 0>		
							
				<cfquery name="getPatient" datasource="PAClient_#trim(ClientID)#">
					SELECT p.PatientID, e.entityID
					FROM patient p   INNER JOIN entity e ON p.EntityID = e.EntityID
					WHERE p.ClaimSubmitterIdentifier = '#trim(ClaimSubmitterIdentifier)#'
				</cfquery>
								
				<cfif getpatient.RecordCount GTE 2>
					<cf_gcGatewayLogger datasource="PAClient_#trim(ClientID)#" code="115" logtext="There is an issue with Patient Accounts table. <br>Multiple Patient Records: patientExists(clientID: #trim(clientID)#, ClaimSubmitterIdentifier: #trim(ClaimSubmitterIdentifier)#)">			
				</cfif>
				
				<cfreturn getPatient>
			
			<cfelse>			
				<cfreturn false>				
			</cfif>
						
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
							
	</cffunction>
			
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to create a patient.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="patientCreate" output="yes" hint="This function will be called to create a patient.">		
		
		<cfargument name="SiteID" required="no" default="1002" type="numeric">
		<cfargument name="ClientID" required="yes" type="numeric">
		<cfargument name="FName" required="yes" type="string">
		<cfargument name="MName" required="yes" type="string">
		<cfargument name="LName" required="yes" type="string">
		<cfargument name="SuffixName" required="no" type="string" default="">
		<cfargument name="ClaimSubmitterIdentifier" required="no" type="string">		
								
		<cftry>
									
				
			<!-------------------------------------------------------------------------------------->
			<!--- Patient does not exist create the entity record and then the patient record    --->
			<!--- that tie the two together.                                                     --->
			<!-------------------------------------------------------------------------------------->					
			<cfset Entity = CreateObject("component","com.common.Entity")>	
			<cfset Entity.setSiteID(trim(SiteID))>  
			<cfset Entity.setClientID(trim(clientID))>					
			<cfset Entity.setFName(trim(FName))>
			<cfset Entity.setMName(trim(MName))>
			<cfset Entity.setLName(trim(LName))>
			<cfset Entity.setSuffixName(trim(SuffixName))>
			<cfset Entity.setObjectTypeID(3)>
			<cfset EntityID = Entity.commit()>
			
			<cfset this.setEntityID(trim(EntityID))>
			<cfset this.setClaimSubmitterIdentifier(trim(ClaimSubmitterIdentifier))>								
			<cfset patientID = this.commit()>
											
			<cfreturn patientID>
																		
								
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the patients Insurance companies.          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientInsCom" hint="This function will be called to get the patients Insurance companies.">		
		
		<cfargument name="patientID" required="yes" type="numeric">
							
		<cftry>
		
			<cfquery name="getInsComs" datasource="#trim(request.datasource)#">
				SELECT pic.InsuranceCompanyID, pic.PrimSecTer, pic.PolicyNumber, pic.PolicyHoldersFirstName, pic.PolicyHoldersLastName, pic.PolicyHoldersMiddleInitial, pic.PolicyHoldersDOB, pic.PolicyHoldersSex, pic.PolicyHoldersAddressLine1, pic.PolicyHoldersAddressLine2, pic.PolicyHoldersCity, pic.PolicyHoldersStateID, pic.PolicyHoldersZipCode, pic.PolicyHoldersPhone, pic.PolicyHoldersPhoneExtension, pic.PolicyHoldersEmployerSchoolName, pic.PolicyHoldersEffectiveDateFrom, pic.PolicyHoldersEffectiveDateTo, pic.GroupNumber, pic.GroupName, pic.Relationship, pic.Deductible, pic.PayPercentage, ic.InsuranceCompanyName
				FROM patientinsurancecompany pic
				INNER JOIN insurancecompany ic ON pic.InsuranceCompanyID = ic.InsuranceCompanyID
				WHERE pic.patientID = #trim(patientID)#
				Order By pic.PrimSecTer 
			</cfquery>			
			
			<cfreturn getInsComs>
						
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the patients full name Last name first.    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientNameLastFirst" output="yes" hint="This function will be called to get the patients full name Last name first.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="patientID" required="yes" type="numeric">
							
		<cftry>
			
			<cfquery name="getPatient" datasource="PAClient_#trim(ClientID)#">
				SELECT e.LName + ', ' + e.FName AS Fullname
				FROM patient p   INNER JOIN entity e ON p.EntityID = e.EntityID
				WHERE p.PatientID = '#trim(patientID)#'
			</cfquery>
			
			<cfif getPatient.Fullname NEQ "">
				<cfreturn getPatient.Fullname>
			</cfif>
			
			<cfreturn "">
						
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>	
	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get a patient.                                 --->
	<!--- IF YOU CHANGE THIS QUERY YOU NEED TO MAKE SURE YOU CHANGE IT IN THE WEB        --->
	<!--- SERVICE wsPatient.                                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatient" hint="This function will be called to get a Patient.">		
		
		<cfargument name="clientID" required="Yes" type="numeric">
		<cfargument name="PatientID" required="Yes" type="numeric">
		
					
		<cftry>			
			
			<cfset returnList = "">
						
			<cfquery name="getPatient" datasource="PAClient_#trim(ClientID)#">								
				SELECT p.EntityID, p.PatientID, e.FName, e.Mname, e.LName, e.SSN, e.DOB, e.Sex, e.Weight, e.HeightInInches, e.MaritalStatus 				
				FROM patient p
				INNER JOIN entity e ON p.EntityID = e.EntityID						
				WHERE p.PatientID = '#trim(PatientID)#'					
			</cfquery>
			
									
			<cfif getPatient.RecordCount EQ 1>
					
				<!-------------------------------------------------------------------------------------->
				<!--- Will be in this order thanks to CF resorting the columns                       --->
				<!--- DOB|ENTITYID|FNAME|HEIGHTININCHES|LNAME|MNAME|PATIENTID|SEX|SSN|WEIGHT         --->
				<!-------------------------------------------------------------------------------------->													
				<cfloop list="#getPatient.ColumnList#" index="i_col">
					<cfset column = "getPatient.#i_col#">																										
					<cfif evaluate(column) NEQ "">	
						<cfif IsDate(evaluate(column))>
							<cfset returnList = listAppend(returnList, "#DateFormat(trim(evaluate(column)), 'mm/dd/yyyy')#", "|")>	
						<cfelse>	
							<cfset returnList = listAppend(returnList, "#trim(evaluate(column))#", "|")>							
						</cfif>
					<cfelse>						
						<cfset returnList = listAppend(returnList, " ", "|")><!---this is super important to put a space here. The Web Service expects it to work with Javascript. --->												
					</cfif>																	
				</cfloop>
			
				<cfreturn returnList>
			
			<cfelse>			
				
				<cfreturn false>
												
			</cfif>										
			
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
	
	
	
	
	
		
</cfcomponent>















<!---
<!-------------------------------------------------------------------------------------->
<!--- Patient does not exist create the entoty record and then the patient record    --->
<!--- that tie the two together.                                                     --->
<!-------------------------------------------------------------------------------------->					
<cfset Entity = CreateObject("component","com.common.Entity")>	
<cfset Entity.setSiteID(1002)>  
<cfset Entity.setClientID(trim(clientID))>					
<cfset Entity.setFName(trim(patientFName))>
<cfset Entity.setMName(trim(patientMiddleName))>
<cfset Entity.setLName(trim(patientLName))>
<cfset Entity.setSuffixName(trim(patientSuffix))>
<cfset Entity.setObjectTypeID(3)>
<cfset EntityID = Entity.commit()>

<cfset Patient.setEntityID(trim(EntityID))>
<cfset Patient.setClaimSubmitterIdentifier(trim(thisClaimSubmitterIdentifier))>					
<cfset patientID = Patient.commit()>

--->

		



