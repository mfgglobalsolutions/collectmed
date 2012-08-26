


<cfcomponent name="Intake" extends="cmComponents.com.common.db.IntakeIO">		
	
			
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to reassign an intake.                            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="assignIntake" hint="assign an intake">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="assignorID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">
		<cfargument name="intakeID" required="yes" type="numeric">
		<cfargument name="note" required="no" default="">
		
		<cfquery name="getIntakeClientID" datasource="PAClient_#trim(ClientID)#">
			SELECT ClientID
			FROM intake  
			WHERE IntakeID = #trim(IntakeID)#
		</cfquery>
			
		<cfif getIntakeClientID.Recordcount EQ 1 AND getIntakeClientID.ClientID EQ clientID> 
		
			<cfquery name="insertAssignment" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO intakeassignment  (IntakeID, UserID, AssignorID, Note)
				VALUES(#trim(IntakeID)#, #trim(UsersID)#, #trim(assignorID)#, '#trim(Note)#')				
			</cfquery>		
			
			<cfset UpdateIntakeAssignedToUserID(clientID: trim(clientID), intakeID: trim(intakeID))>
				
		</cfif>		
												
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the assigned to id of an intake.        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="UpdateIntakeAssignedToUserID" hint="This function will be called to update the assigned to id of an intake.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="intakeID" required="yes" type="numeric">

		<cfquery name="getUserID" datasource="PAClient_#trim(ClientID)#">
			SELECT UserID
			FROM intakeassignment 
			WHERE IntakeID = #arguments.IntakeID# 
			ORDER BY DateCreated DESC
			LIMIT 1
		</cfquery>
		
		<cfquery name="updateIntake" datasource="PAClient_#trim(ClientID)#">			
			UPDATE intake 
			SET AssignedToUserID = #getUserID.UserID#
			WHERE IntakeID = #arguments.IntakeID#
		</cfquery>		
										
	</cffunction>
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to reassign an intake.                            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="AutoAssignToManager" access="remote" hint="auto assign an intake to a manager">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="intakeID" required="yes" type="numeric">
		<cfargument name="note" required="no" default="">
		
		<cftry>
		
			<!-------------------------------------------------------------------------------------->
			<!--- When all steps have been met we should automatically reassign the intake to    --->
			<!--- someone from the Intake Managers group so they can close the intake or take    --->
			<!--- whatever action they want to on the intake.                                    --->
			<!-------------------------------------------------------------------------------------->	
			<cfquery name="getIntakeGroup" datasource="PAClient_#trim(ClientID)#">
				SELECT WorkGroupID
				FROM workgroup
				WHERE WorkGroupName = 'Intake Manager'
			</cfquery>
			
			<cfif getIntakeGroup.RecordCount EQ 1>
			
				<cfquery name="getAssignedIntakes" datasource="PAClient_#trim(ClientID)#">
					SELECT AssignedToUserID, Count(IntakeID) AS NumberOfIntakes
					FROM intake
					WHERE AssignedToUserID IN (SELECT UsersID FROM usersworkgroup   WHERE WorkGroupID = #trim(getIntakeGroup.WorkGroupID)#) 
					AND Active = 1 AND ClosingInvoiceNumber IS NULL
					--Looking to see who has more intakes currently assigned counting the ClosingInvoiceNumber
					--AND (Active = 1 OR ClosingInvoiceNumber IS NOT NULL)		
					GROUP BY AssignedToUserID					
				</cfquery>
				
				<cfset count = 0>
				
				<cfloop query="getAssignedIntakes">
					<cfif NumberOfIntakes GT count>
						<cfset assignToUserID = getAssignedIntakes.AssignedToUserID>
					</cfif>
				</cfloop>
			
			</cfif>
		
			<!-------------------------------------------------------------------------------------->
			<!--- Get the administrator information.                                             --->
			<!-------------------------------------------------------------------------------------->	
			<cfset AdminInfo = GetAdministratorInformation(ClientID)>
			
				
			<!--------------------------------------------------------------------------------------->
			<!--- If the asssignToUserID is not defined or not set then use the administrator ID. --->
			<!--------------------------------------------------------------------------------------->	
			<cfif NOT IsDefined("assignToUserID") OR NOT IsNumeric(assignToUserID)>			
				<cfset assignToUserID = AdminInfo.UsersID>
			</cfif>
						
			<!-------------------------------------------------------------------------------------->
			<!--- Re-assign the intake.                                                          --->
			<!-------------------------------------------------------------------------------------->			
			<cfset assignIntake(clientid: trim(ClientID), usersID: trim(assignToUserID), IntakeID: trim(IntakeID), assignorID: trim(AdminInfo.UsersID), note: "System Note: re-assigned by system.")>

			<!-------------------------------------------------------------------------------------->
			<!--- Put a note in the notes for this instance.                                     --->
			<!-------------------------------------------------------------------------------------->
			<cfset request.intakeNote = CreateObject("component","com.common.Note")>	
			<cfset intakeNoteID = request.intakeNote.getNoteID(clientid: trim(ClientID), objectID: 8, instanceID: trim(intakeID))>		
			<cfif NOT IsNumeric(intakeNoteID) AND IsNumeric(intakeID)>
				<cfset intakeNoteID = request.intakeNote.addNote(clientID: trim(clientID), objectID: 8, instanceID: trim(intakeID))>
			</cfif>		
			<cfset request.intakeNote.addNoteEntry(clientID: trim(clientID), NoteID: intakeNoteID, noteEntry: 'System Note: re-assigned by system.', userID: AdminInfo.UsersID, userFName: '#trim(AdminInfo.FName)#', userLName: '#trim(AdminInfo.LName)#')>
					
		
			<cfreturn "true">
		
		
			<cfcatch type="Any">				
			
				<cf_gcGatewayLogger			
					datasource="PAClient_#trim(ClientID)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
		
												
	</cffunction>

	
	<cffunction name="GetAdministratorInformation" access="remote" hint="Get Administrator Information">		
		<cfargument name="clientID" required="yes" type="numeric">
				
		<cfquery name="getAdminInfo" datasource="PA_Client#trim(arguments.clientID)#">						
			SELECT u.UsersID, E.EntityID, E.Fname, E. Lname, E.Mname, E.DOB, E.SSN, E.Sex, E.Active 
			FROM pa_master.users AS u 
			INNER JOIN entity AS E ON u.EntityID = E.EntityID 
			WHERE E.EntityID = (SELECT AdministratorEntityID FROM pa_master.[client] WHERE ClientID = #trim(arguments.clientID)#)
		</cfquery>
		
		<cfreturn getAdminInfo>
												
	</cffunction>
	
		
</cfcomponent>

























<!--- Old Code --->



<!---	





<cffunction name="getIntakeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IntakeID>
	</cffunction>
	 	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 	
	<cffunction name="getAssignedToUserID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AssignedToUserID>
	</cffunction>
	 	
	<cffunction name="getHidden_Step" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_Step>
	</cffunction>
	 	
	<cffunction name="getHidden_UsersID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_UsersID>
	</cffunction>
	 	
	<cffunction name="getHidden_TimeStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_TimeStart>
	</cffunction>
	 	
	<cffunction name="getOPTION_1_CBox_Delivery" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Delivery>
	</cffunction>
	 	
	<cffunction name="getOPTION_1_CBox_Pickup" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Pickup>
	</cffunction>
	 	
	<cffunction name="getOPTION_1_CBox_Repair" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Repair>
	</cffunction>
	 	
	<cffunction name="getOPTION_1_CBox_Switch" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Switch>
	</cffunction>
	 	
	<cffunction name="getOPTION_1_CBox_Existing" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Existing>
	</cffunction>
	 	
	<cffunction name="getOPTION_2_CBox_Other" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_2_CBox_Other>
	</cffunction>
	 	
	<cffunction name="getOPTION_2_CBox_Hospice" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_2_CBox_Hospice>
	</cffunction>
	 	
	<cffunction name="getOPTION_2_CBox_Hospital" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_2_CBox_Hospital>
	</cffunction>
	 	
	<cffunction name="getOtherTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OtherTBox>
	</cffunction>
	 	
	<cffunction name="getHospiceTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HospiceTBox>
	</cffunction>
	 	
	<cffunction name="getOPTION_3_CBox_Medicare" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_Medicare>
	</cffunction>
	 	
	<cffunction name="getOPTION_3_CBox_PrivateInsurance" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_PrivateInsurance>
	</cffunction>
	 	
	<cffunction name="getOPTION_3_CBox_Medicaid" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_Medicaid>
	</cffunction>
	 	
	<cffunction name="getOPTION_3_CBox_PrivatePay" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_PrivatePay>
	</cffunction>
	 	
	<cffunction name="getHospitalTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HospitalTBox>
	</cffunction>
	 	
	<cffunction name="getDischargeDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DischargeDateMM>
	</cffunction>
	 	
	<cffunction name="getDischargeDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DischargeDateDD>
	</cffunction>
	 	
	<cffunction name="getDischargeDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DischargeDateYY>
	</cffunction>
	 	
	<cffunction name="getTypeOfPay_Radio" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TypeOfPay_Radio>
	</cffunction>
			 	
	<cffunction name="getCallerFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerFNameTBox>
	</cffunction>
	 	
	<cffunction name="getCallerMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerMInitialTBox>
	</cffunction>
	 	
	<cffunction name="getCallerLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerLNameTBox>
	</cffunction>
	 	
	<cffunction name="getCallerPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerPhoneTBox>
	</cffunction>
	
	<cffunction name="getPatientFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientFNameTBox>
	</cffunction>
	 	
	<cffunction name="getPatientMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientMInitialTBox>
	</cffunction>
	 	
	<cffunction name="getPatientLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientLNameTBox>
	</cffunction>
	 	
	<cffunction name="getRoomNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RoomNumberTBox>
	</cffunction>
	 	
	<cffunction name="getBedNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.BedNumberTBox>
	</cffunction>
	 	
	<cffunction name="getPatientAddressTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientAddressTBox>
	</cffunction>
	 	
	<cffunction name="getPatientCityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientCityTBox>
	</cffunction>
	 	
	<cffunction name="getPatientStateTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientStateTBox>
	</cffunction>
	 	
	<cffunction name="getPatientZipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientZipTBox>
	</cffunction>
	 	
	<cffunction name="getPatientPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientPhoneTBox>
	</cffunction>
	 	
	<cffunction name="getPatientDOBMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBMM>
	</cffunction>
	 	
	<cffunction name="getPatientDOBDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBDD>
	</cffunction>
	 	
	<cffunction name="getPatientDOBYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBYY>
	</cffunction>
	 	
	<cffunction name="getOPTION_3a_CBox_PatientSexMale" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3a_CBox_PatientSexMale>
	</cffunction>
	 	
	<cffunction name="getOPTION_3a_CBox_PatientSexFemale" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3a_CBox_PatientSexFemale>
	</cffunction>
	 	
	<cffunction name="getPatientSSNTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientSSNTBox>
	</cffunction>
	 	
	<cffunction name="getPatientHeightFeet" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientHeightFeet>
	</cffunction>
	 	
	<cffunction name="getPatientHeightInches" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientHeightInches>
	</cffunction>
	 	
	<cffunction name="getPatientWeightTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientWeightTBox>
	</cffunction>
	
	<cffunction name="getAlternateContactFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactFNameTBox>
	</cffunction>
	 	
	<cffunction name="getAlternateContactMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactMInitialTBox>
	</cffunction>
	 	
	<cffunction name="getAlternateContactLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactLNameTBox>
	</cffunction>
	 	
	<cffunction name="getAlternateContactRelationshipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactRelationshipTBox>
	</cffunction>
	 	
	<cffunction name="getAlternateContactPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactPhoneTBox>
	</cffunction>
	 	
	<cffunction name="getAlternateContactWorkPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactWorkPhoneTBox>
	</cffunction>
		 	
	<cffunction name="getPoNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PoNumberTBox>
	</cffunction>
	 	
	<cffunction name="getCreditCardTypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CreditCardTypeTBox>
	</cffunction>
	 	
	<cffunction name="getCreditCardNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CreditCardNumberTBox>
	</cffunction>
	 	
	<cffunction name="getCcDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CcDateMM>
	</cffunction>
	 	
	<cffunction name="getCcDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CcDateDD>
	</cffunction>
	 	
	<cffunction name="getCcDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CcDateYY>
	</cffunction>
	
	<cffunction name="getOrderingPhysicianFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianFNameTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianMInitialTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianLNameTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianPhoneTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianUPINTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianUPINTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianFaxTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianFaxTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianAddressTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianAddressTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianCityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianCityTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianStateTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianStateTBox>
	</cffunction>
	 	
	<cffunction name="getOrderingPhysicianZipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianZipTBox>
	</cffunction>
	 
	<cffunction name="getOPTION_13_CBox_PastEquipmentYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_13_CBox_PastEquipmentYes>
	</cffunction>
	 	
	<cffunction name="getOPTION_13_CBox_PastEquipmentNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_13_CBox_PastEquipmentNo>
	</cffunction>
	 	
	<cffunction name="getEquipment1TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1TypeTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment1RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1RentPurchasedSelect>
	</cffunction>
	 	
	<cffunction name="getEquipment1FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1FromMM>
	</cffunction>
	 	
	<cffunction name="getEquipment1FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1FromDD>
	</cffunction>
	 	
	<cffunction name="getEquipment1FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1FromYY>
	</cffunction>
	 	
	<cffunction name="getEquipment1ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1ToMM>
	</cffunction>
	 	
	<cffunction name="getEquipment1ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1ToDD>
	</cffunction>
	 	
	<cffunction name="getEquipment1ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1ToYY>
	</cffunction>
	 	
	<cffunction name="getEquipment1SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1SupplierNameTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment1SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1SupplierTelephoneTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment2TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2TypeTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment2RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2RentPurchasedSelect>
	</cffunction>
	 	
	<cffunction name="getEquipment2FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2FromMM>
	</cffunction>
	 	
	<cffunction name="getEquipment2FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2FromDD>
	</cffunction>
	 	
	<cffunction name="getEquipment2FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2FromYY>
	</cffunction>
	 	
	<cffunction name="getEquipment2ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2ToMM>
	</cffunction>
	 	
	<cffunction name="getEquipment2ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2ToDD>
	</cffunction>
	 	
	<cffunction name="getEquipment2ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2ToYY>
	</cffunction>
	 	
	<cffunction name="getEquipment2SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2SupplierNameTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment2SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2SupplierTelephoneTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment3TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3TypeTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment3RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3RentPurchasedSelect>
	</cffunction>
	 	
	<cffunction name="getEquipment3FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3FromMM>
	</cffunction>
	 	
	<cffunction name="getEquipment3FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3FromDD>
	</cffunction>
	 	
	<cffunction name="getEquipment3FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3FromYY>
	</cffunction>
	 	
	<cffunction name="getEquipment3ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3ToMM>
	</cffunction>
	 	
	<cffunction name="getEquipment3ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3ToDD>
	</cffunction>
	 	
	<cffunction name="getEquipment3ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3ToYY>
	</cffunction>
	 	
	<cffunction name="getEquipment3SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3SupplierNameTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment3SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3SupplierTelephoneTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment4TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4TypeTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment4RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4RentPurchasedSelect>
	</cffunction>
	 	
	<cffunction name="getEquipment4FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4FromMM>
	</cffunction>
	 	
	<cffunction name="getEquipment4FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4FromDD>
	</cffunction>
	 	
	<cffunction name="getEquipment4FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4FromYY>
	</cffunction>
	 	
	<cffunction name="getEquipment4ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4ToMM>
	</cffunction>
	 	
	<cffunction name="getEquipment4ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4ToDD>
	</cffunction>
	 	
	<cffunction name="getEquipment4ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4ToYY>
	</cffunction>
	 	
	<cffunction name="getEquipment4SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4SupplierNameTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment4SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4SupplierTelephoneTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment5TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5TypeTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment5RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5RentPurchasedSelect>
	</cffunction>
	 	
	<cffunction name="getEquipment5FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5FromMM>
	</cffunction>
	 	
	<cffunction name="getEquipment5FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5FromDD>
	</cffunction>
	 	
	<cffunction name="getEquipment5FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5FromYY>
	</cffunction>
	 	
	<cffunction name="getEquipment5ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5ToMM>
	</cffunction>
	 	
	<cffunction name="getEquipment5ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5ToDD>
	</cffunction>
	 	
	<cffunction name="getEquipment5ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5ToYY>
	</cffunction>
	 	
	<cffunction name="getEquipment5SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5SupplierNameTBox>
	</cffunction>
	 	
	<cffunction name="getEquipment5SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5SupplierTelephoneTBox>
	</cffunction>
	 	
	<cffunction name="getOPTION_14_CBox_OxygenPAo2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_14_CBox_OxygenPAo2>
	</cffunction>
	 	
	<cffunction name="getOPTION_14_CBox_OxygenSAo2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_14_CBox_OxygenSAo2>
	</cffunction>
	 	
	<cffunction name="getOPTION_14_CBox_OxygenSPo2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_14_CBox_OxygenSPo2>
	</cffunction>
	 	
	<cffunction name="getOxygenPAO2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OxygenPAO2TBox>
	</cffunction>
	 	
	<cffunction name="getOxygenSAO2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OxygenSAO2TBox>
	</cffunction>
	 	
	<cffunction name="getCPAPStudy_CBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudy_CBox>
	</cffunction>
	 	
	<cffunction name="getCPAPStudyNote" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyNote>
	</cffunction>
	 	
	<cffunction name="getOxygenSPO2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OxygenSPO2TBox>
	</cffunction>
	 	
	<cffunction name="getCPAPStudyOnFile_CBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyOnFile_CBox>
	</cffunction>
	 	
	<cffunction name="getCPAPStudyOnFileNote" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyOnFileNote>
	</cffunction>
	 	
	<cffunction name="getLabTestDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestDateMM>
	</cffunction>
	 	
	<cffunction name="getLabTestDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestDateDD>
	</cffunction>
	 	
	<cffunction name="getLabTestDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestDateYY>
	</cffunction>
	 	
	<cffunction name="getCPAPStudyPerformedAt" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyPerformedAt>
	</cffunction>
	 	
	<cffunction name="getLabTestFacilityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestFacilityTBox>
	</cffunction>
	 	
	<cffunction name="getCPAPStudyPerformedAt2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyPerformedAt2>
	</cffunction>
	 	
	<cffunction name="getCPAPStudyPerformedAt3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyPerformedAt3>
	</cffunction>
	 	
	<cffunction name="getClosingInvoiceNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClosingInvoiceNumber>
	</cffunction>
	
	<cffunction name="getPrinted" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Printed>
	</cffunction>
	 	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>







<cffunction name="getHcpcCode1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode1TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty1TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct1TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX1TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis1TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost1TBox>
	</cffunction>
		 	
	<cffunction name="getHcpcLengthOfNeedYear1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear1TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth1TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode2TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty2TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct2TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX2TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis2TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost2TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear2TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth2TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode3TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty3TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct3TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX3TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis3TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost3TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear3TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth3TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode4TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty4TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct4TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX4TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis4TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost4TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear4TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth4TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode5TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty5TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct5TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX5TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis5TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost5TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear5TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth5TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode6TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty6TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct6TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX6TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis6TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost6TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear6TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth6TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode7TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty7TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct7TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX7TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis7TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost7TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear7TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth7TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode8TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty8TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct8TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX8TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis8TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost8TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear8TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth8TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode9TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty9TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct9TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX9TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis9TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost9TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear9TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth9TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcCode10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode10TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcQty10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty10TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcProduct10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct10TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDX10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX10TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcDiagnosis10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis10TBox>
	</cffunction>
	
	<cffunction name="getHcpcCost10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost10TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedYear10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear10TBox>
	</cffunction>
	 	
	<cffunction name="getHcpcLengthOfNeedMonth10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth10TBox>
	</cffunction>







/*<!---IF(qGetIntake.OPTION_3A_CBOX_PATIENTSEXFEMALE EQ "" OR qGetIntake.OPTION_3A_CBOX_PATIENTSEXFEMALE EQ "NULL")
			variables.instance.OPTION_3A_CBOX_PATIENTSEXFEMALE = "NULL";
			ELSE
			variables.instance.OPTION_3A_CBOX_PATIENTSEXFEMALE = qGetIntake.OPTION_3A_CBOX_PATIENTSEXFEMALE;
			
			IF(qGetIntake.OPTION_3A_CBOX_PATIENTSEXMALE EQ "" OR qGetIntake.OPTION_3A_CBOX_PATIENTSEXMALE EQ "NULL")
			variables.instance.OPTION_3A_CBOX_PATIENTSEXMALE = "NULL";
			ELSE
			variables.instance.OPTION_3A_CBOX_PATIENTSEXMALE = qGetIntake.OPTION_3A_CBOX_PATIENTSEXMALE;--->*/
			
			/*<!---IF(qGetIntake.PATIENTADDRESSTBOX EQ "" OR qGetIntake.PATIENTADDRESSTBOX EQ "NULL")
			variables.instance.PATIENTADDRESSTBOX = "NULL";
			ELSE
			variables.instance.PATIENTADDRESSTBOX = qGetIntake.PATIENTADDRESSTBOX;
			
			IF(qGetIntake.PATIENTCITYTBOX EQ "" OR qGetIntake.PATIENTCITYTBOX EQ "NULL")
			variables.instance.PATIENTCITYTBOX = "NULL";
			ELSE
			variables.instance.PATIENTCITYTBOX = qGetIntake.PATIENTCITYTBOX;
			
			IF(qGetIntake.PATIENTDOBDD EQ "" OR qGetIntake.PATIENTDOBDD EQ "NULL")
			variables.instance.PATIENTDOBDD = "NULL";
			ELSE
			variables.instance.PATIENTDOBDD = qGetIntake.PATIENTDOBDD;
			
			IF(qGetIntake.PATIENTDOBMM EQ "" OR qGetIntake.PATIENTDOBMM EQ "NULL")
			variables.instance.PATIENTDOBMM = "NULL";
			ELSE
			variables.instance.PATIENTDOBMM = qGetIntake.PATIENTDOBMM;
			
			IF(qGetIntake.PATIENTDOBYY EQ "" OR qGetIntake.PATIENTDOBYY EQ "NULL")
			variables.instance.PATIENTDOBYY = "NULL";
			ELSE
			variables.instance.PATIENTDOBYY = qGetIntake.PATIENTDOBYY;
			
			IF(qGetIntake.PATIENTFNAMETBOX EQ "" OR qGetIntake.PATIENTFNAMETBOX EQ "NULL")
			variables.instance.PATIENTFNAMETBOX = "NULL";
			ELSE
			variables.instance.PATIENTFNAMETBOX = qGetIntake.PATIENTFNAMETBOX;
			
			IF(qGetIntake.PATIENTHEIGHTINCHES EQ "" OR qGetIntake.PATIENTHEIGHTINCHES EQ "NULL")
			variables.instance.PATIENTHEIGHTINCHES = "NULL";
			ELSE
			variables.instance.PATIENTHEIGHTINCHES = qGetIntake.PATIENTHEIGHTINCHES;
			
			IF(qGetIntake.PATIENTLNAMETBOX EQ "" OR qGetIntake.PATIENTLNAMETBOX EQ "NULL")
			variables.instance.PATIENTLNAMETBOX = "NULL";
			ELSE
			variables.instance.PATIENTLNAMETBOX = qGetIntake.PATIENTLNAMETBOX;
			
			IF(qGetIntake.PATIENTMINITIALTBOX EQ "" OR qGetIntake.PATIENTMINITIALTBOX EQ "NULL")
			variables.instance.PATIENTMINITIALTBOX = "NULL";
			ELSE
			variables.instance.PATIENTMINITIALTBOX = qGetIntake.PATIENTMINITIALTBOX;
			
			IF(qGetIntake.PATIENTPHONETBOX EQ "" OR qGetIntake.PATIENTPHONETBOX EQ "NULL")
			variables.instance.PATIENTPHONETBOX = "NULL";
			ELSE
			variables.instance.PATIENTPHONETBOX = qGetIntake.PATIENTPHONETBOX;
			
			IF(qGetIntake.PATIENTSSNTBOX EQ "" OR qGetIntake.PATIENTSSNTBOX EQ "NULL")
			variables.instance.PATIENTSSNTBOX = "NULL";
			ELSE
			variables.instance.PATIENTSSNTBOX = qGetIntake.PATIENTSSNTBOX;
			
			IF(qGetIntake.PATIENTSTATETBOX EQ "" OR qGetIntake.PATIENTSTATETBOX EQ "NULL")
			variables.instance.PATIENTSTATETBOX = "NULL";
			ELSE
			variables.instance.PATIENTSTATETBOX = qGetIntake.PATIENTSTATETBOX;
			
			IF(qGetIntake.PATIENTWEIGHTTBOX EQ "" OR qGetIntake.PATIENTWEIGHTTBOX EQ "NULL")
			variables.instance.PATIENTWEIGHTTBOX = "NULL";
			ELSE
			variables.instance.PATIENTWEIGHTTBOX = qGetIntake.PATIENTWEIGHTTBOX;
			
			IF(qGetIntake.PATIENTZIPTBOX EQ "" OR qGetIntake.PATIENTZIPTBOX EQ "NULL")
			variables.instance.PATIENTZIPTBOX = "NULL";
			ELSE
			variables.instance.PATIENTZIPTBOX = qGetIntake.PATIENTZIPTBOX;--->*/
			
			/*<!---IF(qGetIntake.PRIMARYCBOX_COORDINATEBENEFITSNO EQ "" OR qGetIntake.PRIMARYCBOX_COORDINATEBENEFITSNO EQ "NULL")
			variables.instance.PRIMARYCBOX_COORDINATEBENEFITSNO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_COORDINATEBENEFITSNO = qGetIntake.PRIMARYCBOX_COORDINATEBENEFITSNO;
			
			IF(qGetIntake.PRIMARYCBOX_COORDINATEBENEFITSYES EQ "" OR qGetIntake.PRIMARYCBOX_COORDINATEBENEFITSYES EQ "NULL")
			variables.instance.PRIMARYCBOX_COORDINATEBENEFITSYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_COORDINATEBENEFITSYES = qGetIntake.PRIMARYCBOX_COORDINATEBENEFITSYES;
			
			IF(qGetIntake.PRIMARYCBOX_MEDICARESUPPLEMENTNO EQ "" OR qGetIntake.PRIMARYCBOX_MEDICARESUPPLEMENTNO EQ "NULL")
			variables.instance.PRIMARYCBOX_MEDICARESUPPLEMENTNO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_MEDICARESUPPLEMENTNO = qGetIntake.PRIMARYCBOX_MEDICARESUPPLEMENTNO;
			
			IF(qGetIntake.PRIMARYCBOX_MEDICARESUPPLEMENTYES EQ "" OR qGetIntake.PRIMARYCBOX_MEDICARESUPPLEMENTYES EQ "NULL")
			variables.instance.PRIMARYCBOX_MEDICARESUPPLEMENTYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_MEDICARESUPPLEMENTYES = qGetIntake.PRIMARYCBOX_MEDICARESUPPLEMENTYES;
			
			IF(qGetIntake.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLENO EQ "" OR qGetIntake.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLENO EQ "NULL")
			variables.instance.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLENO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLENO = qGetIntake.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLENO;
			
			IF(qGetIntake.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLEYES EQ "" OR qGetIntake.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLEYES EQ "NULL")
			variables.instance.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLEYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLEYES = qGetIntake.PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLEYES;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONDEDUCTIBLENO EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONDEDUCTIBLENO EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONDEDUCTIBLENO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONDEDUCTIBLENO = qGetIntake.PRIMARYCBOX_VERIFICATIONDEDUCTIBLENO;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONDEDUCTIBLEYES EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONDEDUCTIBLEYES EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONDEDUCTIBLEYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONDEDUCTIBLEYES = qGetIntake.PRIMARYCBOX_VERIFICATIONDEDUCTIBLEYES;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEDMECOVNO EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEDMECOVNO EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEDMECOVNO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEDMECOVNO = qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEDMECOVNO;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEDMECOVYES EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEDMECOVYES EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEDMECOVYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEDMECOVYES = qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEDMECOVYES;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEINSNO EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEINSNO EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEINSNO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEINSNO = qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEINSNO;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEINSYES EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEINSYES EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEINSYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONHAVEINSYES = qGetIntake.PRIMARYCBOX_VERIFICATIONHAVEINSYES;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO = qGetIntake.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES = qGetIntake.PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANMQMB EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANMQMB EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANMQMB = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANMQMB = qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANMQMB;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANQMB EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANQMB EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANQMB = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANQMB = qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANQMB;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL = qGetIntake.PRIMARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONPPOPOLICYNO EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONPPOPOLICYNO EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONPPOPOLICYNO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONPPOPOLICYNO = qGetIntake.PRIMARYCBOX_VERIFICATIONPPOPOLICYNO;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONPPOPOLICYYES EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONPPOPOLICYYES EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONPPOPOLICYYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONPPOPOLICYYES = qGetIntake.PRIMARYCBOX_VERIFICATIONPPOPOLICYYES;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONPRIORAUTHNO EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONPRIORAUTHNO EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONPRIORAUTHNO = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONPRIORAUTHNO = qGetIntake.PRIMARYCBOX_VERIFICATIONPRIORAUTHNO;
			
			IF(qGetIntake.PRIMARYCBOX_VERIFICATIONPRIORAUTHYES EQ "" OR qGetIntake.PRIMARYCBOX_VERIFICATIONPRIORAUTHYES EQ "NULL")
			variables.instance.PRIMARYCBOX_VERIFICATIONPRIORAUTHYES = "NULL";
			ELSE
			variables.instance.PRIMARYCBOX_VERIFICATIONPRIORAUTHYES = qGetIntake.PRIMARYCBOX_VERIFICATIONPRIORAUTHYES;
			
			IF(qGetIntake.PRIMARYEFFECTIVEDATEDD EQ "" OR qGetIntake.PRIMARYEFFECTIVEDATEDD EQ "NULL")
			variables.instance.PRIMARYEFFECTIVEDATEDD = "NULL";
			ELSE
			variables.instance.PRIMARYEFFECTIVEDATEDD = qGetIntake.PRIMARYEFFECTIVEDATEDD;
			
			IF(qGetIntake.PRIMARYEFFECTIVEDATEMM EQ "" OR qGetIntake.PRIMARYEFFECTIVEDATEMM EQ "NULL")
			variables.instance.PRIMARYEFFECTIVEDATEMM = "NULL";
			ELSE
			variables.instance.PRIMARYEFFECTIVEDATEMM = qGetIntake.PRIMARYEFFECTIVEDATEMM;
			
			IF(qGetIntake.PRIMARYEFFECTIVEDATEYY EQ "" OR qGetIntake.PRIMARYEFFECTIVEDATEYY EQ "NULL")
			variables.instance.PRIMARYEFFECTIVEDATEYY = "NULL";
			ELSE
			variables.instance.PRIMARYEFFECTIVEDATEYY = qGetIntake.PRIMARYEFFECTIVEDATEYY;
			
			IF(qGetIntake.PRIMARYFAXNUMBERTBOX EQ "" OR qGetIntake.PRIMARYFAXNUMBERTBOX EQ "NULL")
			variables.instance.PRIMARYFAXNUMBERTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYFAXNUMBERTBOX = qGetIntake.PRIMARYFAXNUMBERTBOX;
			
			IF(qGetIntake.PRIMARYGROUPNUMBERTBOX EQ "" OR qGetIntake.PRIMARYGROUPNUMBERTBOX EQ "NULL")
			variables.instance.PRIMARYGROUPNUMBERTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYGROUPNUMBERTBOX = qGetIntake.PRIMARYGROUPNUMBERTBOX;
			
			IF(qGetIntake.PRIMARYHOLDERSDOBDD EQ "" OR qGetIntake.PRIMARYHOLDERSDOBDD EQ "NULL")
			variables.instance.PRIMARYHOLDERSDOBDD = "NULL";
			ELSE
			variables.instance.PRIMARYHOLDERSDOBDD = qGetIntake.PRIMARYHOLDERSDOBDD;
			
			IF(qGetIntake.PRIMARYHOLDERSDOBMM EQ "" OR qGetIntake.PRIMARYHOLDERSDOBMM EQ "NULL")
			variables.instance.PRIMARYHOLDERSDOBMM = "NULL";
			ELSE
			variables.instance.PRIMARYHOLDERSDOBMM = qGetIntake.PRIMARYHOLDERSDOBMM;
			
			IF(qGetIntake.PRIMARYHOLDERSDOBYY EQ "" OR qGetIntake.PRIMARYHOLDERSDOBYY EQ "NULL")
			variables.instance.PRIMARYHOLDERSDOBYY = "NULL";
			ELSE
			variables.instance.PRIMARYHOLDERSDOBYY = qGetIntake.PRIMARYHOLDERSDOBYY;
			
			IF(qGetIntake.PRIMARYINSURANCENAMETBOX EQ "" OR qGetIntake.PRIMARYINSURANCENAMETBOX EQ "NULL")
			variables.instance.PRIMARYINSURANCENAMETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYINSURANCENAMETBOX = qGetIntake.PRIMARYINSURANCENAMETBOX;
			
			IF(qGetIntake.PRIMARYNOTETBOX EQ "" OR qGetIntake.PRIMARYNOTETBOX EQ "NULL")
			variables.instance.PRIMARYNOTETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYNOTETBOX = qGetIntake.PRIMARYNOTETBOX;
			
			IF(qGetIntake.PRIMARYPHONENUMBERTBOX EQ "" OR qGetIntake.PRIMARYPHONENUMBERTBOX EQ "NULL")
			variables.instance.PRIMARYPHONENUMBERTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYPHONENUMBERTBOX = qGetIntake.PRIMARYPHONENUMBERTBOX;
			
			IF(qGetIntake.PRIMARYPOLICYHOLDEREMPLOYERTBOX EQ "" OR qGetIntake.PRIMARYPOLICYHOLDEREMPLOYERTBOX EQ "NULL")
			variables.instance.PRIMARYPOLICYHOLDEREMPLOYERTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYPOLICYHOLDEREMPLOYERTBOX = qGetIntake.PRIMARYPOLICYHOLDEREMPLOYERTBOX;
			
			IF(qGetIntake.PRIMARYPOLICYHOLDERFNAMETBOX EQ "" OR qGetIntake.PRIMARYPOLICYHOLDERFNAMETBOX EQ "NULL")
			variables.instance.PRIMARYPOLICYHOLDERFNAMETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYPOLICYHOLDERFNAMETBOX = qGetIntake.PRIMARYPOLICYHOLDERFNAMETBOX;
			
			IF(qGetIntake.PRIMARYPOLICYHOLDERLNAMETBOX EQ "" OR qGetIntake.PRIMARYPOLICYHOLDERLNAMETBOX EQ "NULL")
			variables.instance.PRIMARYPOLICYHOLDERLNAMETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYPOLICYHOLDERLNAMETBOX = qGetIntake.PRIMARYPOLICYHOLDERLNAMETBOX;
			
			IF(qGetIntake.PRIMARYPOLICYHOLDERMINITIALTBOX EQ "" OR qGetIntake.PRIMARYPOLICYHOLDERMINITIALTBOX EQ "NULL")
			variables.instance.PRIMARYPOLICYHOLDERMINITIALTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYPOLICYHOLDERMINITIALTBOX = qGetIntake.PRIMARYPOLICYHOLDERMINITIALTBOX;
			
			IF(qGetIntake.PRIMARYPOLICYNUMBERTBOX EQ "" OR qGetIntake.PRIMARYPOLICYNUMBERTBOX EQ "NULL")
			variables.instance.PRIMARYPOLICYNUMBERTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYPOLICYNUMBERTBOX = qGetIntake.PRIMARYPOLICYNUMBERTBOX;
			
			IF(qGetIntake.PRIMARYSENDTOADDRESS1TBOX EQ "" OR qGetIntake.PRIMARYSENDTOADDRESS1TBOX EQ "NULL")
			variables.instance.PRIMARYSENDTOADDRESS1TBOX = "NULL";
			ELSE
			variables.instance.PRIMARYSENDTOADDRESS1TBOX = qGetIntake.PRIMARYSENDTOADDRESS1TBOX;
			
			IF(qGetIntake.PRIMARYSENDTOADDRESS2TBOX EQ "" OR qGetIntake.PRIMARYSENDTOADDRESS2TBOX EQ "NULL")
			variables.instance.PRIMARYSENDTOADDRESS2TBOX = "NULL";
			ELSE
			variables.instance.PRIMARYSENDTOADDRESS2TBOX = qGetIntake.PRIMARYSENDTOADDRESS2TBOX;
			
			IF(qGetIntake.PRIMARYSENDTOCITYTBOX EQ "" OR qGetIntake.PRIMARYSENDTOCITYTBOX EQ "NULL")
			variables.instance.PRIMARYSENDTOCITYTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYSENDTOCITYTBOX = qGetIntake.PRIMARYSENDTOCITYTBOX;
			
			IF(qGetIntake.PRIMARYSENDTOSTATETBOX EQ "" OR qGetIntake.PRIMARYSENDTOSTATETBOX EQ "NULL")
			variables.instance.PRIMARYSENDTOSTATETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYSENDTOSTATETBOX = qGetIntake.PRIMARYSENDTOSTATETBOX;
			
			IF(qGetIntake.PRIMARYSENDTOZIPCODETBOX EQ "" OR qGetIntake.PRIMARYSENDTOZIPCODETBOX EQ "NULL")
			variables.instance.PRIMARYSENDTOZIPCODETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYSENDTOZIPCODETBOX = qGetIntake.PRIMARYSENDTOZIPCODETBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONAUTHNUMBERTBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONAUTHNUMBERTBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONAUTHNUMBERTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONAUTHNUMBERTBOX = qGetIntake.PRIMARYVERIFICATIONAUTHNUMBERTBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONAUTHPHONENUMBERTBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONAUTHPHONENUMBERTBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONAUTHPHONENUMBERTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONAUTHPHONENUMBERTBOX = qGetIntake.PRIMARYVERIFICATIONAUTHPHONENUMBERTBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONDATEDD EQ "" OR qGetIntake.PRIMARYVERIFICATIONDATEDD EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONDATEDD = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONDATEDD = qGetIntake.PRIMARYVERIFICATIONDATEDD;
			
			IF(qGetIntake.PRIMARYVERIFICATIONDATEMM EQ "" OR qGetIntake.PRIMARYVERIFICATIONDATEMM EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONDATEMM = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONDATEMM = qGetIntake.PRIMARYVERIFICATIONDATEMM;
			
			IF(qGetIntake.PRIMARYVERIFICATIONDATEYY EQ "" OR qGetIntake.PRIMARYVERIFICATIONDATEYY EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONDATEYY = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONDATEYY = qGetIntake.PRIMARYVERIFICATIONDATEYY;
			
			IF(qGetIntake.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX = qGetIntake.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX = qGetIntake.PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMDD EQ "" OR qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMDD EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONHAVEINSFROMDD = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONHAVEINSFROMDD = qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMDD;
			
			IF(qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMMM EQ "" OR qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMMM EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONHAVEINSFROMMM = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONHAVEINSFROMMM = qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMMM;
			
			IF(qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMYY EQ "" OR qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMYY EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONHAVEINSFROMYY = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONHAVEINSFROMYY = qGetIntake.PRIMARYVERIFICATIONHAVEINSFROMYY;
			
			IF(qGetIntake.PRIMARYVERIFICATIONHAVEINSTODD EQ "" OR qGetIntake.PRIMARYVERIFICATIONHAVEINSTODD EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONHAVEINSTODD = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONHAVEINSTODD = qGetIntake.PRIMARYVERIFICATIONHAVEINSTODD;
			
			IF(qGetIntake.PRIMARYVERIFICATIONHAVEINSTOMM EQ "" OR qGetIntake.PRIMARYVERIFICATIONHAVEINSTOMM EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONHAVEINSTOMM = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONHAVEINSTOMM = qGetIntake.PRIMARYVERIFICATIONHAVEINSTOMM;
			
			IF(qGetIntake.PRIMARYVERIFICATIONHAVEINSTOYY EQ "" OR qGetIntake.PRIMARYVERIFICATIONHAVEINSTOYY EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONHAVEINSTOYY = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONHAVEINSTOYY = qGetIntake.PRIMARYVERIFICATIONHAVEINSTOYY;
			
			IF(qGetIntake.PRIMARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX = qGetIntake.PRIMARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONREPFNAMETBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONREPFNAMETBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONREPFNAMETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONREPFNAMETBOX = qGetIntake.PRIMARYVERIFICATIONREPFNAMETBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONREPLNAMETBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONREPLNAMETBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONREPLNAMETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONREPLNAMETBOX = qGetIntake.PRIMARYVERIFICATIONREPLNAMETBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONTIMETBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONTIMETBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONTIMETBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONTIMETBOX = qGetIntake.PRIMARYVERIFICATIONTIMETBOX;
			
			IF(qGetIntake.PRIMARYVERIFICATIONTYPEBASEPLANTBOX EQ "" OR qGetIntake.PRIMARYVERIFICATIONTYPEBASEPLANTBOX EQ "NULL")
			variables.instance.PRIMARYVERIFICATIONTYPEBASEPLANTBOX = "NULL";
			ELSE
			variables.instance.PRIMARYVERIFICATIONTYPEBASEPLANTBOX = qGetIntake.PRIMARYVERIFICATIONTYPEBASEPLANTBOX;			
			
			IF(qGetIntake.SECONDARYCBOX_COORDINATEBENEFITSNO EQ "" OR qGetIntake.SECONDARYCBOX_COORDINATEBENEFITSNO EQ "NULL")
			variables.instance.SECONDARYCBOX_COORDINATEBENEFITSNO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_COORDINATEBENEFITSNO = qGetIntake.SECONDARYCBOX_COORDINATEBENEFITSNO;
			
			IF(qGetIntake.SECONDARYCBOX_COORDINATEBENEFITSYES EQ "" OR qGetIntake.SECONDARYCBOX_COORDINATEBENEFITSYES EQ "NULL")
			variables.instance.SECONDARYCBOX_COORDINATEBENEFITSYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_COORDINATEBENEFITSYES = qGetIntake.SECONDARYCBOX_COORDINATEBENEFITSYES;
			
			IF(qGetIntake.SECONDARYCBOX_MEDICARESUPPLEMENTNO EQ "" OR qGetIntake.SECONDARYCBOX_MEDICARESUPPLEMENTNO EQ "NULL")
			variables.instance.SECONDARYCBOX_MEDICARESUPPLEMENTNO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_MEDICARESUPPLEMENTNO = qGetIntake.SECONDARYCBOX_MEDICARESUPPLEMENTNO;
			
			IF(qGetIntake.SECONDARYCBOX_MEDICARESUPPLEMENTYES EQ "" OR qGetIntake.SECONDARYCBOX_MEDICARESUPPLEMENTYES EQ "NULL")
			variables.instance.SECONDARYCBOX_MEDICARESUPPLEMENTYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_MEDICARESUPPLEMENTYES = qGetIntake.SECONDARYCBOX_MEDICARESUPPLEMENTYES;
			
			IF(qGetIntake.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLENO EQ "" OR qGetIntake.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLENO EQ "NULL")
			variables.instance.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLENO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLENO = qGetIntake.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLENO;
			
			IF(qGetIntake.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLEYES EQ "" OR qGetIntake.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLEYES EQ "NULL")
			variables.instance.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLEYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLEYES = qGetIntake.SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLEYES;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONDEDUCTIBLENO EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONDEDUCTIBLENO EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONDEDUCTIBLENO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONDEDUCTIBLENO = qGetIntake.SECONDARYCBOX_VERIFICATIONDEDUCTIBLENO;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONDEDUCTIBLEYES EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONDEDUCTIBLEYES EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONDEDUCTIBLEYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONDEDUCTIBLEYES = qGetIntake.SECONDARYCBOX_VERIFICATIONDEDUCTIBLEYES;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEDMECOVNO EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEDMECOVNO EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEDMECOVNO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEDMECOVNO = qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEDMECOVNO;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEDMECOVYES EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEDMECOVYES EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEDMECOVYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEDMECOVYES = qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEDMECOVYES;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEINSNO EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEINSNO EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEINSNO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEINSNO = qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEINSNO;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEINSYES EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEINSYES EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEINSYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONHAVEINSYES = qGetIntake.SECONDARYCBOX_VERIFICATIONHAVEINSYES;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO = qGetIntake.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES = qGetIntake.SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANMQMB EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANMQMB EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANMQMB = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANMQMB = qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANMQMB;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANQMB EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANQMB EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANQMB = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANQMB = qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANQMB;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL = qGetIntake.SECONDARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONPPOPOLICYNO EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONPPOPOLICYNO EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONPPOPOLICYNO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONPPOPOLICYNO = qGetIntake.SECONDARYCBOX_VERIFICATIONPPOPOLICYNO;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONPPOPOLICYYES EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONPPOPOLICYYES EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONPPOPOLICYYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONPPOPOLICYYES = qGetIntake.SECONDARYCBOX_VERIFICATIONPPOPOLICYYES;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONPRIORAUTHNO EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONPRIORAUTHNO EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONPRIORAUTHNO = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONPRIORAUTHNO = qGetIntake.SECONDARYCBOX_VERIFICATIONPRIORAUTHNO;
			
			IF(qGetIntake.SECONDARYCBOX_VERIFICATIONPRIORAUTHYES EQ "" OR qGetIntake.SECONDARYCBOX_VERIFICATIONPRIORAUTHYES EQ "NULL")
			variables.instance.SECONDARYCBOX_VERIFICATIONPRIORAUTHYES = "NULL";
			ELSE
			variables.instance.SECONDARYCBOX_VERIFICATIONPRIORAUTHYES = qGetIntake.SECONDARYCBOX_VERIFICATIONPRIORAUTHYES;
			
			IF(qGetIntake.SECONDARYEFFECTIVEDATEDD EQ "" OR qGetIntake.SECONDARYEFFECTIVEDATEDD EQ "NULL")
			variables.instance.SECONDARYEFFECTIVEDATEDD = "NULL";
			ELSE
			variables.instance.SECONDARYEFFECTIVEDATEDD = qGetIntake.SECONDARYEFFECTIVEDATEDD;
			
			IF(qGetIntake.SECONDARYEFFECTIVEDATEMM EQ "" OR qGetIntake.SECONDARYEFFECTIVEDATEMM EQ "NULL")
			variables.instance.SECONDARYEFFECTIVEDATEMM = "NULL";
			ELSE
			variables.instance.SECONDARYEFFECTIVEDATEMM = qGetIntake.SECONDARYEFFECTIVEDATEMM;
			
			IF(qGetIntake.SECONDARYEFFECTIVEDATEYY EQ "" OR qGetIntake.SECONDARYEFFECTIVEDATEYY EQ "NULL")
			variables.instance.SECONDARYEFFECTIVEDATEYY = "NULL";
			ELSE
			variables.instance.SECONDARYEFFECTIVEDATEYY = qGetIntake.SECONDARYEFFECTIVEDATEYY;
			
			IF(qGetIntake.SECONDARYFAXNUMBERTBOX EQ "" OR qGetIntake.SECONDARYFAXNUMBERTBOX EQ "NULL")
			variables.instance.SECONDARYFAXNUMBERTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYFAXNUMBERTBOX = qGetIntake.SECONDARYFAXNUMBERTBOX;
			
			IF(qGetIntake.SECONDARYGROUPNUMBERTBOX EQ "" OR qGetIntake.SECONDARYGROUPNUMBERTBOX EQ "NULL")
			variables.instance.SECONDARYGROUPNUMBERTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYGROUPNUMBERTBOX = qGetIntake.SECONDARYGROUPNUMBERTBOX;
			
			IF(qGetIntake.SECONDARYHOLDERSDOBDD EQ "" OR qGetIntake.SECONDARYHOLDERSDOBDD EQ "NULL")
			variables.instance.SECONDARYHOLDERSDOBDD = "NULL";
			ELSE
			variables.instance.SECONDARYHOLDERSDOBDD = qGetIntake.SECONDARYHOLDERSDOBDD;
			
			IF(qGetIntake.SECONDARYHOLDERSDOBMM EQ "" OR qGetIntake.SECONDARYHOLDERSDOBMM EQ "NULL")
			variables.instance.SECONDARYHOLDERSDOBMM = "NULL";
			ELSE
			variables.instance.SECONDARYHOLDERSDOBMM = qGetIntake.SECONDARYHOLDERSDOBMM;
			
			IF(qGetIntake.SECONDARYHOLDERSDOBYY EQ "" OR qGetIntake.SECONDARYHOLDERSDOBYY EQ "NULL")
			variables.instance.SECONDARYHOLDERSDOBYY = "NULL";
			ELSE
			variables.instance.SECONDARYHOLDERSDOBYY = qGetIntake.SECONDARYHOLDERSDOBYY;
			
			IF(qGetIntake.SECONDARYINSURANCENAMETBOX EQ "" OR qGetIntake.SECONDARYINSURANCENAMETBOX EQ "NULL")
			variables.instance.SECONDARYINSURANCENAMETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYINSURANCENAMETBOX = qGetIntake.SECONDARYINSURANCENAMETBOX;
			
			IF(qGetIntake.SECONDARYNOTETBOX EQ "" OR qGetIntake.SECONDARYNOTETBOX EQ "NULL")
			variables.instance.SECONDARYNOTETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYNOTETBOX = qGetIntake.SECONDARYNOTETBOX;
			
			IF(qGetIntake.SECONDARYPHONENUMBERTBOX EQ "" OR qGetIntake.SECONDARYPHONENUMBERTBOX EQ "NULL")
			variables.instance.SECONDARYPHONENUMBERTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYPHONENUMBERTBOX = qGetIntake.SECONDARYPHONENUMBERTBOX;
			
			IF(qGetIntake.SECONDARYPOLICYHOLDEREMPLOYERTBOX EQ "" OR qGetIntake.SECONDARYPOLICYHOLDEREMPLOYERTBOX EQ "NULL")
			variables.instance.SECONDARYPOLICYHOLDEREMPLOYERTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYPOLICYHOLDEREMPLOYERTBOX = qGetIntake.SECONDARYPOLICYHOLDEREMPLOYERTBOX;
			
			IF(qGetIntake.SECONDARYPOLICYHOLDERFNAMETBOX EQ "" OR qGetIntake.SECONDARYPOLICYHOLDERFNAMETBOX EQ "NULL")
			variables.instance.SECONDARYPOLICYHOLDERFNAMETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYPOLICYHOLDERFNAMETBOX = qGetIntake.SECONDARYPOLICYHOLDERFNAMETBOX;
			
			IF(qGetIntake.SECONDARYPOLICYHOLDERLNAMETBOX EQ "" OR qGetIntake.SECONDARYPOLICYHOLDERLNAMETBOX EQ "NULL")
			variables.instance.SECONDARYPOLICYHOLDERLNAMETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYPOLICYHOLDERLNAMETBOX = qGetIntake.SECONDARYPOLICYHOLDERLNAMETBOX;
			
			IF(qGetIntake.SECONDARYPOLICYHOLDERMINITIALTBOX EQ "" OR qGetIntake.SECONDARYPOLICYHOLDERMINITIALTBOX EQ "NULL")
			variables.instance.SECONDARYPOLICYHOLDERMINITIALTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYPOLICYHOLDERMINITIALTBOX = qGetIntake.SECONDARYPOLICYHOLDERMINITIALTBOX;
			
			IF(qGetIntake.SECONDARYPOLICYNUMBERTBOX EQ "" OR qGetIntake.SECONDARYPOLICYNUMBERTBOX EQ "NULL")
			variables.instance.SECONDARYPOLICYNUMBERTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYPOLICYNUMBERTBOX = qGetIntake.SECONDARYPOLICYNUMBERTBOX;
			
			IF(qGetIntake.SECONDARYSENDTOADDRESS1TBOX EQ "" OR qGetIntake.SECONDARYSENDTOADDRESS1TBOX EQ "NULL")
			variables.instance.SECONDARYSENDTOADDRESS1TBOX = "NULL";
			ELSE
			variables.instance.SECONDARYSENDTOADDRESS1TBOX = qGetIntake.SECONDARYSENDTOADDRESS1TBOX;
			
			IF(qGetIntake.SECONDARYSENDTOADDRESS2TBOX EQ "" OR qGetIntake.SECONDARYSENDTOADDRESS2TBOX EQ "NULL")
			variables.instance.SECONDARYSENDTOADDRESS2TBOX = "NULL";
			ELSE
			variables.instance.SECONDARYSENDTOADDRESS2TBOX = qGetIntake.SECONDARYSENDTOADDRESS2TBOX;
			
			IF(qGetIntake.SECONDARYSENDTOCITYTBOX EQ "" OR qGetIntake.SECONDARYSENDTOCITYTBOX EQ "NULL")
			variables.instance.SECONDARYSENDTOCITYTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYSENDTOCITYTBOX = qGetIntake.SECONDARYSENDTOCITYTBOX;
			
			IF(qGetIntake.SECONDARYSENDTOSTATETBOX EQ "" OR qGetIntake.SECONDARYSENDTOSTATETBOX EQ "NULL")
			variables.instance.SECONDARYSENDTOSTATETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYSENDTOSTATETBOX = qGetIntake.SECONDARYSENDTOSTATETBOX;
			
			IF(qGetIntake.SECONDARYSENDTOZIPCODETBOX EQ "" OR qGetIntake.SECONDARYSENDTOZIPCODETBOX EQ "NULL")
			variables.instance.SECONDARYSENDTOZIPCODETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYSENDTOZIPCODETBOX = qGetIntake.SECONDARYSENDTOZIPCODETBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONAUTHNUMBERTBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONAUTHNUMBERTBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONAUTHNUMBERTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONAUTHNUMBERTBOX = qGetIntake.SECONDARYVERIFICATIONAUTHNUMBERTBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONAUTHPHONENUMBERTBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONAUTHPHONENUMBERTBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONAUTHPHONENUMBERTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONAUTHPHONENUMBERTBOX = qGetIntake.SECONDARYVERIFICATIONAUTHPHONENUMBERTBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONDATEDD EQ "" OR qGetIntake.SECONDARYVERIFICATIONDATEDD EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONDATEDD = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONDATEDD = qGetIntake.SECONDARYVERIFICATIONDATEDD;
			
			IF(qGetIntake.SECONDARYVERIFICATIONDATEMM EQ "" OR qGetIntake.SECONDARYVERIFICATIONDATEMM EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONDATEMM = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONDATEMM = qGetIntake.SECONDARYVERIFICATIONDATEMM;
			
			IF(qGetIntake.SECONDARYVERIFICATIONDATEYY EQ "" OR qGetIntake.SECONDARYVERIFICATIONDATEYY EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONDATEYY = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONDATEYY = qGetIntake.SECONDARYVERIFICATIONDATEYY;
			
			IF(qGetIntake.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX = qGetIntake.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX = qGetIntake.SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMDD EQ "" OR qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMDD EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONHAVEINSFROMDD = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONHAVEINSFROMDD = qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMDD;
			
			IF(qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMMM EQ "" OR qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMMM EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONHAVEINSFROMMM = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONHAVEINSFROMMM = qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMMM;
			
			IF(qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMYY EQ "" OR qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMYY EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONHAVEINSFROMYY = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONHAVEINSFROMYY = qGetIntake.SECONDARYVERIFICATIONHAVEINSFROMYY;
			
			IF(qGetIntake.SECONDARYVERIFICATIONHAVEINSTODD EQ "" OR qGetIntake.SECONDARYVERIFICATIONHAVEINSTODD EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONHAVEINSTODD = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONHAVEINSTODD = qGetIntake.SECONDARYVERIFICATIONHAVEINSTODD;
			
			IF(qGetIntake.SECONDARYVERIFICATIONHAVEINSTOMM EQ "" OR qGetIntake.SECONDARYVERIFICATIONHAVEINSTOMM EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONHAVEINSTOMM = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONHAVEINSTOMM = qGetIntake.SECONDARYVERIFICATIONHAVEINSTOMM;
			
			IF(qGetIntake.SECONDARYVERIFICATIONHAVEINSTOYY EQ "" OR qGetIntake.SECONDARYVERIFICATIONHAVEINSTOYY EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONHAVEINSTOYY = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONHAVEINSTOYY = qGetIntake.SECONDARYVERIFICATIONHAVEINSTOYY;
			
			IF(qGetIntake.SECONDARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX = qGetIntake.SECONDARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONREPFNAMETBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONREPFNAMETBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONREPFNAMETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONREPFNAMETBOX = qGetIntake.SECONDARYVERIFICATIONREPFNAMETBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONREPLNAMETBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONREPLNAMETBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONREPLNAMETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONREPLNAMETBOX = qGetIntake.SECONDARYVERIFICATIONREPLNAMETBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONTIMETBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONTIMETBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONTIMETBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONTIMETBOX = qGetIntake.SECONDARYVERIFICATIONTIMETBOX;
			
			IF(qGetIntake.SECONDARYVERIFICATIONTYPEBASEPLANTBOX EQ "" OR qGetIntake.SECONDARYVERIFICATIONTYPEBASEPLANTBOX EQ "NULL")
			variables.instance.SECONDARYVERIFICATIONTYPEBASEPLANTBOX = "NULL";
			ELSE
			variables.instance.SECONDARYVERIFICATIONTYPEBASEPLANTBOX = qGetIntake.SECONDARYVERIFICATIONTYPEBASEPLANTBOX;
			
			IF(qGetIntake.TERTIARYCBOX_COORDINATEBENEFITSNO EQ "" OR qGetIntake.TERTIARYCBOX_COORDINATEBENEFITSNO EQ "NULL")
			variables.instance.TERTIARYCBOX_COORDINATEBENEFITSNO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_COORDINATEBENEFITSNO = qGetIntake.TERTIARYCBOX_COORDINATEBENEFITSNO;
			
			IF(qGetIntake.TERTIARYCBOX_COORDINATEBENEFITSYES EQ "" OR qGetIntake.TERTIARYCBOX_COORDINATEBENEFITSYES EQ "NULL")
			variables.instance.TERTIARYCBOX_COORDINATEBENEFITSYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_COORDINATEBENEFITSYES = qGetIntake.TERTIARYCBOX_COORDINATEBENEFITSYES;
			
			IF(qGetIntake.TERTIARYCBOX_MEDICARESUPPLEMENTNO EQ "" OR qGetIntake.TERTIARYCBOX_MEDICARESUPPLEMENTNO EQ "NULL")
			variables.instance.TERTIARYCBOX_MEDICARESUPPLEMENTNO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_MEDICARESUPPLEMENTNO = qGetIntake.TERTIARYCBOX_MEDICARESUPPLEMENTNO;
			
			IF(qGetIntake.TERTIARYCBOX_MEDICARESUPPLEMENTYES EQ "" OR qGetIntake.TERTIARYCBOX_MEDICARESUPPLEMENTYES EQ "NULL")
			variables.instance.TERTIARYCBOX_MEDICARESUPPLEMENTYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_MEDICARESUPPLEMENTYES = qGetIntake.TERTIARYCBOX_MEDICARESUPPLEMENTYES;
			
			IF(qGetIntake.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLENO EQ "" OR qGetIntake.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLENO EQ "NULL")
			variables.instance.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLENO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLENO = qGetIntake.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLENO;
			
			IF(qGetIntake.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLEYES EQ "" OR qGetIntake.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLEYES EQ "NULL")
			variables.instance.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLEYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLEYES = qGetIntake.TERTIARYCBOX_PAIDMEDICAREDEDUCTIBLEYES;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONDEDUCTIBLENO EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONDEDUCTIBLENO EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONDEDUCTIBLENO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONDEDUCTIBLENO = qGetIntake.TERTIARYCBOX_VERIFICATIONDEDUCTIBLENO;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONDEDUCTIBLEYES EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONDEDUCTIBLEYES EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONDEDUCTIBLEYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONDEDUCTIBLEYES = qGetIntake.TERTIARYCBOX_VERIFICATIONDEDUCTIBLEYES;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEDMECOVNO EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEDMECOVNO EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEDMECOVNO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEDMECOVNO = qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEDMECOVNO;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEDMECOVYES EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEDMECOVYES EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEDMECOVYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEDMECOVYES = qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEDMECOVYES;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEINSNO EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEINSNO EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEINSNO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEINSNO = qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEINSNO;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEINSYES EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEINSYES EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEINSYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONHAVEINSYES = qGetIntake.TERTIARYCBOX_VERIFICATIONHAVEINSYES;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO = qGetIntake.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES = qGetIntake.TERTIARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANMQMB EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANMQMB EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANMQMB = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANMQMB = qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANMQMB;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANQMB EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANQMB EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANQMB = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANQMB = qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANQMB;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL = qGetIntake.TERTIARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONPPOPOLICYNO EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONPPOPOLICYNO EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONPPOPOLICYNO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONPPOPOLICYNO = qGetIntake.TERTIARYCBOX_VERIFICATIONPPOPOLICYNO;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONPPOPOLICYYES EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONPPOPOLICYYES EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONPPOPOLICYYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONPPOPOLICYYES = qGetIntake.TERTIARYCBOX_VERIFICATIONPPOPOLICYYES;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONPRIORAUTHNO EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONPRIORAUTHNO EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONPRIORAUTHNO = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONPRIORAUTHNO = qGetIntake.TERTIARYCBOX_VERIFICATIONPRIORAUTHNO;
			
			IF(qGetIntake.TERTIARYCBOX_VERIFICATIONPRIORAUTHYES EQ "" OR qGetIntake.TERTIARYCBOX_VERIFICATIONPRIORAUTHYES EQ "NULL")
			variables.instance.TERTIARYCBOX_VERIFICATIONPRIORAUTHYES = "NULL";
			ELSE
			variables.instance.TERTIARYCBOX_VERIFICATIONPRIORAUTHYES = qGetIntake.TERTIARYCBOX_VERIFICATIONPRIORAUTHYES;
			
			IF(qGetIntake.TERTIARYEFFECTIVEDATEDD EQ "" OR qGetIntake.TERTIARYEFFECTIVEDATEDD EQ "NULL")
			variables.instance.TERTIARYEFFECTIVEDATEDD = "NULL";
			ELSE
			variables.instance.TERTIARYEFFECTIVEDATEDD = qGetIntake.TERTIARYEFFECTIVEDATEDD;
			
			IF(qGetIntake.TERTIARYEFFECTIVEDATEMM EQ "" OR qGetIntake.TERTIARYEFFECTIVEDATEMM EQ "NULL")
			variables.instance.TERTIARYEFFECTIVEDATEMM = "NULL";
			ELSE
			variables.instance.TERTIARYEFFECTIVEDATEMM = qGetIntake.TERTIARYEFFECTIVEDATEMM;
			
			IF(qGetIntake.TERTIARYEFFECTIVEDATEYY EQ "" OR qGetIntake.TERTIARYEFFECTIVEDATEYY EQ "NULL")
			variables.instance.TERTIARYEFFECTIVEDATEYY = "NULL";
			ELSE
			variables.instance.TERTIARYEFFECTIVEDATEYY = qGetIntake.TERTIARYEFFECTIVEDATEYY;
			
			IF(qGetIntake.TERTIARYFAXNUMBERTBOX EQ "" OR qGetIntake.TERTIARYFAXNUMBERTBOX EQ "NULL")
			variables.instance.TERTIARYFAXNUMBERTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYFAXNUMBERTBOX = qGetIntake.TERTIARYFAXNUMBERTBOX;
			
			IF(qGetIntake.TERTIARYGROUPNUMBERTBOX EQ "" OR qGetIntake.TERTIARYGROUPNUMBERTBOX EQ "NULL")
			variables.instance.TERTIARYGROUPNUMBERTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYGROUPNUMBERTBOX = qGetIntake.TERTIARYGROUPNUMBERTBOX;
			
			IF(qGetIntake.TERTIARYHOLDERSDOBDD EQ "" OR qGetIntake.TERTIARYHOLDERSDOBDD EQ "NULL")
			variables.instance.TERTIARYHOLDERSDOBDD = "NULL";
			ELSE
			variables.instance.TERTIARYHOLDERSDOBDD = qGetIntake.TERTIARYHOLDERSDOBDD;
			
			IF(qGetIntake.TERTIARYHOLDERSDOBMM EQ "" OR qGetIntake.TERTIARYHOLDERSDOBMM EQ "NULL")
			variables.instance.TERTIARYHOLDERSDOBMM = "NULL";
			ELSE
			variables.instance.TERTIARYHOLDERSDOBMM = qGetIntake.TERTIARYHOLDERSDOBMM;
			
			IF(qGetIntake.TERTIARYHOLDERSDOBYY EQ "" OR qGetIntake.TERTIARYHOLDERSDOBYY EQ "NULL")
			variables.instance.TERTIARYHOLDERSDOBYY = "NULL";
			ELSE
			variables.instance.TERTIARYHOLDERSDOBYY = qGetIntake.TERTIARYHOLDERSDOBYY;
			
			IF(qGetIntake.TERTIARYINSURANCENAMETBOX EQ "" OR qGetIntake.TERTIARYINSURANCENAMETBOX EQ "NULL")
			variables.instance.TERTIARYINSURANCENAMETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYINSURANCENAMETBOX = qGetIntake.TERTIARYINSURANCENAMETBOX;
			
			IF(qGetIntake.TERTIARYNOTETBOX EQ "" OR qGetIntake.TERTIARYNOTETBOX EQ "NULL")
			variables.instance.TERTIARYNOTETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYNOTETBOX = qGetIntake.TERTIARYNOTETBOX;
			
			IF(qGetIntake.TERTIARYPHONENUMBERTBOX EQ "" OR qGetIntake.TERTIARYPHONENUMBERTBOX EQ "NULL")
			variables.instance.TERTIARYPHONENUMBERTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYPHONENUMBERTBOX = qGetIntake.TERTIARYPHONENUMBERTBOX;
			
			IF(qGetIntake.TERTIARYPOLICYHOLDEREMPLOYERTBOX EQ "" OR qGetIntake.TERTIARYPOLICYHOLDEREMPLOYERTBOX EQ "NULL")
			variables.instance.TERTIARYPOLICYHOLDEREMPLOYERTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYPOLICYHOLDEREMPLOYERTBOX = qGetIntake.TERTIARYPOLICYHOLDEREMPLOYERTBOX;
			
			IF(qGetIntake.TERTIARYPOLICYHOLDERFNAMETBOX EQ "" OR qGetIntake.TERTIARYPOLICYHOLDERFNAMETBOX EQ "NULL")
			variables.instance.TERTIARYPOLICYHOLDERFNAMETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYPOLICYHOLDERFNAMETBOX = qGetIntake.TERTIARYPOLICYHOLDERFNAMETBOX;
			
			IF(qGetIntake.TERTIARYPOLICYHOLDERLNAMETBOX EQ "" OR qGetIntake.TERTIARYPOLICYHOLDERLNAMETBOX EQ "NULL")
			variables.instance.TERTIARYPOLICYHOLDERLNAMETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYPOLICYHOLDERLNAMETBOX = qGetIntake.TERTIARYPOLICYHOLDERLNAMETBOX;
			
			IF(qGetIntake.TERTIARYPOLICYHOLDERMINITIALTBOX EQ "" OR qGetIntake.TERTIARYPOLICYHOLDERMINITIALTBOX EQ "NULL")
			variables.instance.TERTIARYPOLICYHOLDERMINITIALTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYPOLICYHOLDERMINITIALTBOX = qGetIntake.TERTIARYPOLICYHOLDERMINITIALTBOX;
			
			IF(qGetIntake.TERTIARYPOLICYNUMBERTBOX EQ "" OR qGetIntake.TERTIARYPOLICYNUMBERTBOX EQ "NULL")
			variables.instance.TERTIARYPOLICYNUMBERTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYPOLICYNUMBERTBOX = qGetIntake.TERTIARYPOLICYNUMBERTBOX;
			
			IF(qGetIntake.TERTIARYSENDTOADDRESS1TBOX EQ "" OR qGetIntake.TERTIARYSENDTOADDRESS1TBOX EQ "NULL")
			variables.instance.TERTIARYSENDTOADDRESS1TBOX = "NULL";
			ELSE
			variables.instance.TERTIARYSENDTOADDRESS1TBOX = qGetIntake.TERTIARYSENDTOADDRESS1TBOX;
			
			IF(qGetIntake.TERTIARYSENDTOADDRESS2TBOX EQ "" OR qGetIntake.TERTIARYSENDTOADDRESS2TBOX EQ "NULL")
			variables.instance.TERTIARYSENDTOADDRESS2TBOX = "NULL";
			ELSE
			variables.instance.TERTIARYSENDTOADDRESS2TBOX = qGetIntake.TERTIARYSENDTOADDRESS2TBOX;
			
			IF(qGetIntake.TERTIARYSENDTOCITYTBOX EQ "" OR qGetIntake.TERTIARYSENDTOCITYTBOX EQ "NULL")
			variables.instance.TERTIARYSENDTOCITYTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYSENDTOCITYTBOX = qGetIntake.TERTIARYSENDTOCITYTBOX;
			
			IF(qGetIntake.TERTIARYSENDTOSTATETBOX EQ "" OR qGetIntake.TERTIARYSENDTOSTATETBOX EQ "NULL")
			variables.instance.TERTIARYSENDTOSTATETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYSENDTOSTATETBOX = qGetIntake.TERTIARYSENDTOSTATETBOX;
			
			IF(qGetIntake.TERTIARYSENDTOZIPCODETBOX EQ "" OR qGetIntake.TERTIARYSENDTOZIPCODETBOX EQ "NULL")
			variables.instance.TERTIARYSENDTOZIPCODETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYSENDTOZIPCODETBOX = qGetIntake.TERTIARYSENDTOZIPCODETBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONAUTHNUMBERTBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONAUTHNUMBERTBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONAUTHNUMBERTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONAUTHNUMBERTBOX = qGetIntake.TERTIARYVERIFICATIONAUTHNUMBERTBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONAUTHPHONENUMBERTBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONAUTHPHONENUMBERTBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONAUTHPHONENUMBERTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONAUTHPHONENUMBERTBOX = qGetIntake.TERTIARYVERIFICATIONAUTHPHONENUMBERTBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONDATEDD EQ "" OR qGetIntake.TERTIARYVERIFICATIONDATEDD EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONDATEDD = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONDATEDD = qGetIntake.TERTIARYVERIFICATIONDATEDD;
			
			IF(qGetIntake.TERTIARYVERIFICATIONDATEMM EQ "" OR qGetIntake.TERTIARYVERIFICATIONDATEMM EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONDATEMM = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONDATEMM = qGetIntake.TERTIARYVERIFICATIONDATEMM;
			
			IF(qGetIntake.TERTIARYVERIFICATIONDATEYY EQ "" OR qGetIntake.TERTIARYVERIFICATIONDATEYY EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONDATEYY = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONDATEYY = qGetIntake.TERTIARYVERIFICATIONDATEYY;
			
			IF(qGetIntake.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX = qGetIntake.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX = qGetIntake.TERTIARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMDD EQ "" OR qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMDD EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONHAVEINSFROMDD = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONHAVEINSFROMDD = qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMDD;
			
			IF(qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMMM EQ "" OR qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMMM EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONHAVEINSFROMMM = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONHAVEINSFROMMM = qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMMM;
			
			IF(qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMYY EQ "" OR qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMYY EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONHAVEINSFROMYY = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONHAVEINSFROMYY = qGetIntake.TERTIARYVERIFICATIONHAVEINSFROMYY;
			
			IF(qGetIntake.TERTIARYVERIFICATIONHAVEINSTODD EQ "" OR qGetIntake.TERTIARYVERIFICATIONHAVEINSTODD EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONHAVEINSTODD = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONHAVEINSTODD = qGetIntake.TERTIARYVERIFICATIONHAVEINSTODD;
			
			IF(qGetIntake.TERTIARYVERIFICATIONHAVEINSTOMM EQ "" OR qGetIntake.TERTIARYVERIFICATIONHAVEINSTOMM EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONHAVEINSTOMM = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONHAVEINSTOMM = qGetIntake.TERTIARYVERIFICATIONHAVEINSTOMM;
			
			IF(qGetIntake.TERTIARYVERIFICATIONHAVEINSTOYY EQ "" OR qGetIntake.TERTIARYVERIFICATIONHAVEINSTOYY EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONHAVEINSTOYY = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONHAVEINSTOYY = qGetIntake.TERTIARYVERIFICATIONHAVEINSTOYY;
			
			IF(qGetIntake.TERTIARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX = qGetIntake.TERTIARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONREPFNAMETBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONREPFNAMETBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONREPFNAMETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONREPFNAMETBOX = qGetIntake.TERTIARYVERIFICATIONREPFNAMETBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONREPLNAMETBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONREPLNAMETBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONREPLNAMETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONREPLNAMETBOX = qGetIntake.TERTIARYVERIFICATIONREPLNAMETBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONTIMETBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONTIMETBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONTIMETBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONTIMETBOX = qGetIntake.TERTIARYVERIFICATIONTIMETBOX;
			
			IF(qGetIntake.TERTIARYVERIFICATIONTYPEBASEPLANTBOX EQ "" OR qGetIntake.TERTIARYVERIFICATIONTYPEBASEPLANTBOX EQ "NULL")
			variables.instance.TERTIARYVERIFICATIONTYPEBASEPLANTBOX = "NULL";
			ELSE
			variables.instance.TERTIARYVERIFICATIONTYPEBASEPLANTBOX = qGetIntake.TERTIARYVERIFICATIONTYPEBASEPLANTBOX;--->*/



/*
			<!---IF(qGetIntake.HCPCCODE10TBOX EQ "" OR qGetIntake.HCPCCODE10TBOX EQ "NULL")
			variables.instance.HCPCCODE10TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE10TBOX = qGetIntake.HCPCCODE10TBOX;
			
			IF(qGetIntake.HCPCCODE11TBOX EQ "" OR qGetIntake.HCPCCODE11TBOX EQ "NULL")
			variables.instance.HCPCCODE11TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE11TBOX = qGetIntake.HCPCCODE11TBOX;
			
			IF(qGetIntake.HCPCCODE12TBOX EQ "" OR qGetIntake.HCPCCODE12TBOX EQ "NULL")
			variables.instance.HCPCCODE12TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE12TBOX = qGetIntake.HCPCCODE12TBOX;
			
			IF(qGetIntake.HCPCCODE13TBOX EQ "" OR qGetIntake.HCPCCODE13TBOX EQ "NULL")
			variables.instance.HCPCCODE13TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE13TBOX = qGetIntake.HCPCCODE13TBOX;
			
			IF(qGetIntake.HCPCCODE14TBOX EQ "" OR qGetIntake.HCPCCODE14TBOX EQ "NULL")
			variables.instance.HCPCCODE14TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE14TBOX = qGetIntake.HCPCCODE14TBOX;
			
			IF(qGetIntake.HCPCCODE15TBOX EQ "" OR qGetIntake.HCPCCODE15TBOX EQ "NULL")
			variables.instance.HCPCCODE15TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE15TBOX = qGetIntake.HCPCCODE15TBOX;
			
			IF(qGetIntake.HCPCCODE16TBOX EQ "" OR qGetIntake.HCPCCODE16TBOX EQ "NULL")
			variables.instance.HCPCCODE16TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE16TBOX = qGetIntake.HCPCCODE16TBOX;
			
			IF(qGetIntake.HCPCCODE17TBOX EQ "" OR qGetIntake.HCPCCODE17TBOX EQ "NULL")
			variables.instance.HCPCCODE17TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE17TBOX = qGetIntake.HCPCCODE17TBOX;
			
			IF(qGetIntake.HCPCCODE18TBOX EQ "" OR qGetIntake.HCPCCODE18TBOX EQ "NULL")
			variables.instance.HCPCCODE18TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE18TBOX = qGetIntake.HCPCCODE18TBOX;
			
			IF(qGetIntake.HCPCCODE19TBOX EQ "" OR qGetIntake.HCPCCODE19TBOX EQ "NULL")
			variables.instance.HCPCCODE19TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE19TBOX = qGetIntake.HCPCCODE19TBOX;
			
			IF(qGetIntake.HCPCCODE1TBOX EQ "" OR qGetIntake.HCPCCODE1TBOX EQ "NULL")
			variables.instance.HCPCCODE1TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE1TBOX = qGetIntake.HCPCCODE1TBOX;
			
			IF(qGetIntake.HCPCCODE20TBOX EQ "" OR qGetIntake.HCPCCODE20TBOX EQ "NULL")
			variables.instance.HCPCCODE20TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE20TBOX = qGetIntake.HCPCCODE20TBOX;
			
			IF(qGetIntake.HCPCCODE21TBOX EQ "" OR qGetIntake.HCPCCODE21TBOX EQ "NULL")
			variables.instance.HCPCCODE21TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE21TBOX = qGetIntake.HCPCCODE21TBOX;
			
			IF(qGetIntake.HCPCCODE22TBOX EQ "" OR qGetIntake.HCPCCODE22TBOX EQ "NULL")
			variables.instance.HCPCCODE22TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE22TBOX = qGetIntake.HCPCCODE22TBOX;
			
			IF(qGetIntake.HCPCCODE23TBOX EQ "" OR qGetIntake.HCPCCODE23TBOX EQ "NULL")
			variables.instance.HCPCCODE23TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE23TBOX = qGetIntake.HCPCCODE23TBOX;
			
			IF(qGetIntake.HCPCCODE24TBOX EQ "" OR qGetIntake.HCPCCODE24TBOX EQ "NULL")
			variables.instance.HCPCCODE24TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE24TBOX = qGetIntake.HCPCCODE24TBOX;
			
			IF(qGetIntake.HCPCCODE25TBOX EQ "" OR qGetIntake.HCPCCODE25TBOX EQ "NULL")
			variables.instance.HCPCCODE25TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE25TBOX = qGetIntake.HCPCCODE25TBOX;
			
			IF(qGetIntake.HCPCCODE26TBOX EQ "" OR qGetIntake.HCPCCODE26TBOX EQ "NULL")
			variables.instance.HCPCCODE26TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE26TBOX = qGetIntake.HCPCCODE26TBOX;
			
			IF(qGetIntake.HCPCCODE27TBOX EQ "" OR qGetIntake.HCPCCODE27TBOX EQ "NULL")
			variables.instance.HCPCCODE27TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE27TBOX = qGetIntake.HCPCCODE27TBOX;
			
			IF(qGetIntake.HCPCCODE28TBOX EQ "" OR qGetIntake.HCPCCODE28TBOX EQ "NULL")
			variables.instance.HCPCCODE28TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE28TBOX = qGetIntake.HCPCCODE28TBOX;
			
			IF(qGetIntake.HCPCCODE29TBOX EQ "" OR qGetIntake.HCPCCODE29TBOX EQ "NULL")
			variables.instance.HCPCCODE29TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE29TBOX = qGetIntake.HCPCCODE29TBOX;
			
			IF(qGetIntake.HCPCCODE2TBOX EQ "" OR qGetIntake.HCPCCODE2TBOX EQ "NULL")
			variables.instance.HCPCCODE2TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE2TBOX = qGetIntake.HCPCCODE2TBOX;
			
			IF(qGetIntake.HCPCCODE30TBOX EQ "" OR qGetIntake.HCPCCODE30TBOX EQ "NULL")
			variables.instance.HCPCCODE30TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE30TBOX = qGetIntake.HCPCCODE30TBOX;
			
			IF(qGetIntake.HCPCCODE31TBOX EQ "" OR qGetIntake.HCPCCODE31TBOX EQ "NULL")
			variables.instance.HCPCCODE31TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE31TBOX = qGetIntake.HCPCCODE31TBOX;
			
			IF(qGetIntake.HCPCCODE32TBOX EQ "" OR qGetIntake.HCPCCODE32TBOX EQ "NULL")
			variables.instance.HCPCCODE32TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE32TBOX = qGetIntake.HCPCCODE32TBOX;
			
			IF(qGetIntake.HCPCCODE33TBOX EQ "" OR qGetIntake.HCPCCODE33TBOX EQ "NULL")
			variables.instance.HCPCCODE33TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE33TBOX = qGetIntake.HCPCCODE33TBOX;
			
			IF(qGetIntake.HCPCCODE34TBOX EQ "" OR qGetIntake.HCPCCODE34TBOX EQ "NULL")
			variables.instance.HCPCCODE34TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE34TBOX = qGetIntake.HCPCCODE34TBOX;
			
			IF(qGetIntake.HCPCCODE35TBOX EQ "" OR qGetIntake.HCPCCODE35TBOX EQ "NULL")
			variables.instance.HCPCCODE35TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE35TBOX = qGetIntake.HCPCCODE35TBOX;
			
			IF(qGetIntake.HCPCCODE36TBOX EQ "" OR qGetIntake.HCPCCODE36TBOX EQ "NULL")
			variables.instance.HCPCCODE36TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE36TBOX = qGetIntake.HCPCCODE36TBOX;
			
			IF(qGetIntake.HCPCCODE37TBOX EQ "" OR qGetIntake.HCPCCODE37TBOX EQ "NULL")
			variables.instance.HCPCCODE37TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE37TBOX = qGetIntake.HCPCCODE37TBOX;
			
			IF(qGetIntake.HCPCCODE38TBOX EQ "" OR qGetIntake.HCPCCODE38TBOX EQ "NULL")
			variables.instance.HCPCCODE38TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE38TBOX = qGetIntake.HCPCCODE38TBOX;
			
			IF(qGetIntake.HCPCCODE39TBOX EQ "" OR qGetIntake.HCPCCODE39TBOX EQ "NULL")
			variables.instance.HCPCCODE39TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE39TBOX = qGetIntake.HCPCCODE39TBOX;
			
			IF(qGetIntake.HCPCCODE3TBOX EQ "" OR qGetIntake.HCPCCODE3TBOX EQ "NULL")
			variables.instance.HCPCCODE3TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE3TBOX = qGetIntake.HCPCCODE3TBOX;
			
			IF(qGetIntake.HCPCCODE40TBOX EQ "" OR qGetIntake.HCPCCODE40TBOX EQ "NULL")
			variables.instance.HCPCCODE40TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE40TBOX = qGetIntake.HCPCCODE40TBOX;
			
			IF(qGetIntake.HCPCCODE4TBOX EQ "" OR qGetIntake.HCPCCODE4TBOX EQ "NULL")
			variables.instance.HCPCCODE4TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE4TBOX = qGetIntake.HCPCCODE4TBOX;
			
			IF(qGetIntake.HCPCCODE5TBOX EQ "" OR qGetIntake.HCPCCODE5TBOX EQ "NULL")
			variables.instance.HCPCCODE5TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE5TBOX = qGetIntake.HCPCCODE5TBOX;
			
			IF(qGetIntake.HCPCCODE6TBOX EQ "" OR qGetIntake.HCPCCODE6TBOX EQ "NULL")
			variables.instance.HCPCCODE6TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE6TBOX = qGetIntake.HCPCCODE6TBOX;
			
			IF(qGetIntake.HCPCCODE7TBOX EQ "" OR qGetIntake.HCPCCODE7TBOX EQ "NULL")
			variables.instance.HCPCCODE7TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE7TBOX = qGetIntake.HCPCCODE7TBOX;
			
			IF(qGetIntake.HCPCCODE8TBOX EQ "" OR qGetIntake.HCPCCODE8TBOX EQ "NULL")
			variables.instance.HCPCCODE8TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE8TBOX = qGetIntake.HCPCCODE8TBOX;
			
			IF(qGetIntake.HCPCCODE9TBOX EQ "" OR qGetIntake.HCPCCODE9TBOX EQ "NULL")
			variables.instance.HCPCCODE9TBOX = "NULL";
			ELSE
			variables.instance.HCPCCODE9TBOX = qGetIntake.HCPCCODE9TBOX;
			
			IF(qGetIntake.HCPCCOST10TBOX EQ "" OR qGetIntake.HCPCCOST10TBOX EQ "NULL")
			variables.instance.HCPCCOST10TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST10TBOX = qGetIntake.HCPCCOST10TBOX;
			
			IF(qGetIntake.HCPCCOST11TBOX EQ "" OR qGetIntake.HCPCCOST11TBOX EQ "NULL")
			variables.instance.HCPCCOST11TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST11TBOX = qGetIntake.HCPCCOST11TBOX;
			
			IF(qGetIntake.HCPCCOST12TBOX EQ "" OR qGetIntake.HCPCCOST12TBOX EQ "NULL")
			variables.instance.HCPCCOST12TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST12TBOX = qGetIntake.HCPCCOST12TBOX;
			
			IF(qGetIntake.HCPCCOST13TBOX EQ "" OR qGetIntake.HCPCCOST13TBOX EQ "NULL")
			variables.instance.HCPCCOST13TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST13TBOX = qGetIntake.HCPCCOST13TBOX;
			
			IF(qGetIntake.HCPCCOST14TBOX EQ "" OR qGetIntake.HCPCCOST14TBOX EQ "NULL")
			variables.instance.HCPCCOST14TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST14TBOX = qGetIntake.HCPCCOST14TBOX;
			
			IF(qGetIntake.HCPCCOST15TBOX EQ "" OR qGetIntake.HCPCCOST15TBOX EQ "NULL")
			variables.instance.HCPCCOST15TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST15TBOX = qGetIntake.HCPCCOST15TBOX;
			
			IF(qGetIntake.HCPCCOST16TBOX EQ "" OR qGetIntake.HCPCCOST16TBOX EQ "NULL")
			variables.instance.HCPCCOST16TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST16TBOX = qGetIntake.HCPCCOST16TBOX;
			
			IF(qGetIntake.HCPCCOST17TBOX EQ "" OR qGetIntake.HCPCCOST17TBOX EQ "NULL")
			variables.instance.HCPCCOST17TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST17TBOX = qGetIntake.HCPCCOST17TBOX;
			
			IF(qGetIntake.HCPCCOST18TBOX EQ "" OR qGetIntake.HCPCCOST18TBOX EQ "NULL")
			variables.instance.HCPCCOST18TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST18TBOX = qGetIntake.HCPCCOST18TBOX;
			
			IF(qGetIntake.HCPCCOST19TBOX EQ "" OR qGetIntake.HCPCCOST19TBOX EQ "NULL")
			variables.instance.HCPCCOST19TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST19TBOX = qGetIntake.HCPCCOST19TBOX;
			
			IF(qGetIntake.HCPCCOST1TBOX EQ "" OR qGetIntake.HCPCCOST1TBOX EQ "NULL")
			variables.instance.HCPCCOST1TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST1TBOX = qGetIntake.HCPCCOST1TBOX;
			
			IF(qGetIntake.HCPCCOST20TBOX EQ "" OR qGetIntake.HCPCCOST20TBOX EQ "NULL")
			variables.instance.HCPCCOST20TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST20TBOX = qGetIntake.HCPCCOST20TBOX;
			
			IF(qGetIntake.HCPCCOST21TBOX EQ "" OR qGetIntake.HCPCCOST21TBOX EQ "NULL")
			variables.instance.HCPCCOST21TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST21TBOX = qGetIntake.HCPCCOST21TBOX;
			
			IF(qGetIntake.HCPCCOST22TBOX EQ "" OR qGetIntake.HCPCCOST22TBOX EQ "NULL")
			variables.instance.HCPCCOST22TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST22TBOX = qGetIntake.HCPCCOST22TBOX;
			
			IF(qGetIntake.HCPCCOST23TBOX EQ "" OR qGetIntake.HCPCCOST23TBOX EQ "NULL")
			variables.instance.HCPCCOST23TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST23TBOX = qGetIntake.HCPCCOST23TBOX;
			
			IF(qGetIntake.HCPCCOST24TBOX EQ "" OR qGetIntake.HCPCCOST24TBOX EQ "NULL")
			variables.instance.HCPCCOST24TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST24TBOX = qGetIntake.HCPCCOST24TBOX;
			
			IF(qGetIntake.HCPCCOST25TBOX EQ "" OR qGetIntake.HCPCCOST25TBOX EQ "NULL")
			variables.instance.HCPCCOST25TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST25TBOX = qGetIntake.HCPCCOST25TBOX;
			
			IF(qGetIntake.HCPCCOST26TBOX EQ "" OR qGetIntake.HCPCCOST26TBOX EQ "NULL")
			variables.instance.HCPCCOST26TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST26TBOX = qGetIntake.HCPCCOST26TBOX;
			
			IF(qGetIntake.HCPCCOST27TBOX EQ "" OR qGetIntake.HCPCCOST27TBOX EQ "NULL")
			variables.instance.HCPCCOST27TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST27TBOX = qGetIntake.HCPCCOST27TBOX;
			
			IF(qGetIntake.HCPCCOST28TBOX EQ "" OR qGetIntake.HCPCCOST28TBOX EQ "NULL")
			variables.instance.HCPCCOST28TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST28TBOX = qGetIntake.HCPCCOST28TBOX;
			
			IF(qGetIntake.HCPCCOST29TBOX EQ "" OR qGetIntake.HCPCCOST29TBOX EQ "NULL")
			variables.instance.HCPCCOST29TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST29TBOX = qGetIntake.HCPCCOST29TBOX;
			
			IF(qGetIntake.HCPCCOST2TBOX EQ "" OR qGetIntake.HCPCCOST2TBOX EQ "NULL")
			variables.instance.HCPCCOST2TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST2TBOX = qGetIntake.HCPCCOST2TBOX;
			
			IF(qGetIntake.HCPCCOST30TBOX EQ "" OR qGetIntake.HCPCCOST30TBOX EQ "NULL")
			variables.instance.HCPCCOST30TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST30TBOX = qGetIntake.HCPCCOST30TBOX;
			
			IF(qGetIntake.HCPCCOST31TBOX EQ "" OR qGetIntake.HCPCCOST31TBOX EQ "NULL")
			variables.instance.HCPCCOST31TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST31TBOX = qGetIntake.HCPCCOST31TBOX;
			
			IF(qGetIntake.HCPCCOST32TBOX EQ "" OR qGetIntake.HCPCCOST32TBOX EQ "NULL")
			variables.instance.HCPCCOST32TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST32TBOX = qGetIntake.HCPCCOST32TBOX;
			
			IF(qGetIntake.HCPCCOST33TBOX EQ "" OR qGetIntake.HCPCCOST33TBOX EQ "NULL")
			variables.instance.HCPCCOST33TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST33TBOX = qGetIntake.HCPCCOST33TBOX;
			
			IF(qGetIntake.HCPCCOST34TBOX EQ "" OR qGetIntake.HCPCCOST34TBOX EQ "NULL")
			variables.instance.HCPCCOST34TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST34TBOX = qGetIntake.HCPCCOST34TBOX;
			
			IF(qGetIntake.HCPCCOST35TBOX EQ "" OR qGetIntake.HCPCCOST35TBOX EQ "NULL")
			variables.instance.HCPCCOST35TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST35TBOX = qGetIntake.HCPCCOST35TBOX;
			
			IF(qGetIntake.HCPCCOST36TBOX EQ "" OR qGetIntake.HCPCCOST36TBOX EQ "NULL")
			variables.instance.HCPCCOST36TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST36TBOX = qGetIntake.HCPCCOST36TBOX;
			
			IF(qGetIntake.HCPCCOST37TBOX EQ "" OR qGetIntake.HCPCCOST37TBOX EQ "NULL")
			variables.instance.HCPCCOST37TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST37TBOX = qGetIntake.HCPCCOST37TBOX;
			
			IF(qGetIntake.HCPCCOST38TBOX EQ "" OR qGetIntake.HCPCCOST38TBOX EQ "NULL")
			variables.instance.HCPCCOST38TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST38TBOX = qGetIntake.HCPCCOST38TBOX;
			
			IF(qGetIntake.HCPCCOST39TBOX EQ "" OR qGetIntake.HCPCCOST39TBOX EQ "NULL")
			variables.instance.HCPCCOST39TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST39TBOX = qGetIntake.HCPCCOST39TBOX;
			
			IF(qGetIntake.HCPCCOST3TBOX EQ "" OR qGetIntake.HCPCCOST3TBOX EQ "NULL")
			variables.instance.HCPCCOST3TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST3TBOX = qGetIntake.HCPCCOST3TBOX;
			
			IF(qGetIntake.HCPCCOST40TBOX EQ "" OR qGetIntake.HCPCCOST40TBOX EQ "NULL")
			variables.instance.HCPCCOST40TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST40TBOX = qGetIntake.HCPCCOST40TBOX;
			
			IF(qGetIntake.HCPCCOST4TBOX EQ "" OR qGetIntake.HCPCCOST4TBOX EQ "NULL")
			variables.instance.HCPCCOST4TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST4TBOX = qGetIntake.HCPCCOST4TBOX;
			
			IF(qGetIntake.HCPCCOST5TBOX EQ "" OR qGetIntake.HCPCCOST5TBOX EQ "NULL")
			variables.instance.HCPCCOST5TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST5TBOX = qGetIntake.HCPCCOST5TBOX;
			
			IF(qGetIntake.HCPCCOST6TBOX EQ "" OR qGetIntake.HCPCCOST6TBOX EQ "NULL")
			variables.instance.HCPCCOST6TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST6TBOX = qGetIntake.HCPCCOST6TBOX;
			
			IF(qGetIntake.HCPCCOST7TBOX EQ "" OR qGetIntake.HCPCCOST7TBOX EQ "NULL")
			variables.instance.HCPCCOST7TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST7TBOX = qGetIntake.HCPCCOST7TBOX;
			
			IF(qGetIntake.HCPCCOST8TBOX EQ "" OR qGetIntake.HCPCCOST8TBOX EQ "NULL")
			variables.instance.HCPCCOST8TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST8TBOX = qGetIntake.HCPCCOST8TBOX;
			
			IF(qGetIntake.HCPCCOST9TBOX EQ "" OR qGetIntake.HCPCCOST9TBOX EQ "NULL")
			variables.instance.HCPCCOST9TBOX = "NULL";
			ELSE
			variables.instance.HCPCCOST9TBOX = qGetIntake.HCPCCOST9TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS10TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS10TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS10TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS10TBOX = qGetIntake.HCPCDIAGNOSIS10TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS11TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS11TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS11TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS11TBOX = qGetIntake.HCPCDIAGNOSIS11TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS12TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS12TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS12TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS12TBOX = qGetIntake.HCPCDIAGNOSIS12TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS13TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS13TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS13TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS13TBOX = qGetIntake.HCPCDIAGNOSIS13TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS14TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS14TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS14TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS14TBOX = qGetIntake.HCPCDIAGNOSIS14TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS15TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS15TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS15TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS15TBOX = qGetIntake.HCPCDIAGNOSIS15TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS16TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS16TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS16TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS16TBOX = qGetIntake.HCPCDIAGNOSIS16TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS17TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS17TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS17TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS17TBOX = qGetIntake.HCPCDIAGNOSIS17TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS18TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS18TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS18TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS18TBOX = qGetIntake.HCPCDIAGNOSIS18TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS19TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS19TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS19TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS19TBOX = qGetIntake.HCPCDIAGNOSIS19TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS1TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS1TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS1TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS1TBOX = qGetIntake.HCPCDIAGNOSIS1TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS20TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS20TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS20TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS20TBOX = qGetIntake.HCPCDIAGNOSIS20TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS21TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS21TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS21TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS21TBOX = qGetIntake.HCPCDIAGNOSIS21TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS22TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS22TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS22TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS22TBOX = qGetIntake.HCPCDIAGNOSIS22TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS23TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS23TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS23TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS23TBOX = qGetIntake.HCPCDIAGNOSIS23TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS24TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS24TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS24TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS24TBOX = qGetIntake.HCPCDIAGNOSIS24TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS25TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS25TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS25TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS25TBOX = qGetIntake.HCPCDIAGNOSIS25TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS26TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS26TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS26TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS26TBOX = qGetIntake.HCPCDIAGNOSIS26TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS27TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS27TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS27TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS27TBOX = qGetIntake.HCPCDIAGNOSIS27TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS28TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS28TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS28TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS28TBOX = qGetIntake.HCPCDIAGNOSIS28TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS29TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS29TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS29TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS29TBOX = qGetIntake.HCPCDIAGNOSIS29TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS2TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS2TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS2TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS2TBOX = qGetIntake.HCPCDIAGNOSIS2TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS30TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS30TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS30TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS30TBOX = qGetIntake.HCPCDIAGNOSIS30TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS31TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS31TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS31TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS31TBOX = qGetIntake.HCPCDIAGNOSIS31TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS32TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS32TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS32TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS32TBOX = qGetIntake.HCPCDIAGNOSIS32TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS33TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS33TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS33TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS33TBOX = qGetIntake.HCPCDIAGNOSIS33TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS34TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS34TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS34TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS34TBOX = qGetIntake.HCPCDIAGNOSIS34TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS35TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS35TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS35TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS35TBOX = qGetIntake.HCPCDIAGNOSIS35TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS36TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS36TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS36TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS36TBOX = qGetIntake.HCPCDIAGNOSIS36TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS37TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS37TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS37TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS37TBOX = qGetIntake.HCPCDIAGNOSIS37TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS38TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS38TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS38TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS38TBOX = qGetIntake.HCPCDIAGNOSIS38TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS39TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS39TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS39TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS39TBOX = qGetIntake.HCPCDIAGNOSIS39TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS3TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS3TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS3TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS3TBOX = qGetIntake.HCPCDIAGNOSIS3TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS40TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS40TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS40TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS40TBOX = qGetIntake.HCPCDIAGNOSIS40TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS4TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS4TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS4TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS4TBOX = qGetIntake.HCPCDIAGNOSIS4TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS5TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS5TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS5TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS5TBOX = qGetIntake.HCPCDIAGNOSIS5TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS6TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS6TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS6TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS6TBOX = qGetIntake.HCPCDIAGNOSIS6TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS7TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS7TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS7TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS7TBOX = qGetIntake.HCPCDIAGNOSIS7TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS8TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS8TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS8TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS8TBOX = qGetIntake.HCPCDIAGNOSIS8TBOX;
			
			IF(qGetIntake.HCPCDIAGNOSIS9TBOX EQ "" OR qGetIntake.HCPCDIAGNOSIS9TBOX EQ "NULL")
			variables.instance.HCPCDIAGNOSIS9TBOX = "NULL";
			ELSE
			variables.instance.HCPCDIAGNOSIS9TBOX = qGetIntake.HCPCDIAGNOSIS9TBOX;
			
			IF(qGetIntake.HCPCDX10TBOX EQ "" OR qGetIntake.HCPCDX10TBOX EQ "NULL")
			variables.instance.HCPCDX10TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX10TBOX = qGetIntake.HCPCDX10TBOX;
			
			IF(qGetIntake.HCPCDX11TBOX EQ "" OR qGetIntake.HCPCDX11TBOX EQ "NULL")
			variables.instance.HCPCDX11TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX11TBOX = qGetIntake.HCPCDX11TBOX;
			
			IF(qGetIntake.HCPCDX12TBOX EQ "" OR qGetIntake.HCPCDX12TBOX EQ "NULL")
			variables.instance.HCPCDX12TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX12TBOX = qGetIntake.HCPCDX12TBOX;
			
			IF(qGetIntake.HCPCDX13TBOX EQ "" OR qGetIntake.HCPCDX13TBOX EQ "NULL")
			variables.instance.HCPCDX13TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX13TBOX = qGetIntake.HCPCDX13TBOX;
			
			IF(qGetIntake.HCPCDX14TBOX EQ "" OR qGetIntake.HCPCDX14TBOX EQ "NULL")
			variables.instance.HCPCDX14TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX14TBOX = qGetIntake.HCPCDX14TBOX;
			
			IF(qGetIntake.HCPCDX15TBOX EQ "" OR qGetIntake.HCPCDX15TBOX EQ "NULL")
			variables.instance.HCPCDX15TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX15TBOX = qGetIntake.HCPCDX15TBOX;
			
			IF(qGetIntake.HCPCDX16TBOX EQ "" OR qGetIntake.HCPCDX16TBOX EQ "NULL")
			variables.instance.HCPCDX16TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX16TBOX = qGetIntake.HCPCDX16TBOX;
			
			IF(qGetIntake.HCPCDX17TBOX EQ "" OR qGetIntake.HCPCDX17TBOX EQ "NULL")
			variables.instance.HCPCDX17TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX17TBOX = qGetIntake.HCPCDX17TBOX;
			
			IF(qGetIntake.HCPCDX18TBOX EQ "" OR qGetIntake.HCPCDX18TBOX EQ "NULL")
			variables.instance.HCPCDX18TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX18TBOX = qGetIntake.HCPCDX18TBOX;
			
			IF(qGetIntake.HCPCDX19TBOX EQ "" OR qGetIntake.HCPCDX19TBOX EQ "NULL")
			variables.instance.HCPCDX19TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX19TBOX = qGetIntake.HCPCDX19TBOX;
			
			IF(qGetIntake.HCPCDX1TBOX EQ "" OR qGetIntake.HCPCDX1TBOX EQ "NULL")
			variables.instance.HCPCDX1TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX1TBOX = qGetIntake.HCPCDX1TBOX;
			
			IF(qGetIntake.HCPCDX20TBOX EQ "" OR qGetIntake.HCPCDX20TBOX EQ "NULL")
			variables.instance.HCPCDX20TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX20TBOX = qGetIntake.HCPCDX20TBOX;
			
			IF(qGetIntake.HCPCDX21TBOX EQ "" OR qGetIntake.HCPCDX21TBOX EQ "NULL")
			variables.instance.HCPCDX21TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX21TBOX = qGetIntake.HCPCDX21TBOX;
			
			IF(qGetIntake.HCPCDX22TBOX EQ "" OR qGetIntake.HCPCDX22TBOX EQ "NULL")
			variables.instance.HCPCDX22TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX22TBOX = qGetIntake.HCPCDX22TBOX;
			
			IF(qGetIntake.HCPCDX23TBOX EQ "" OR qGetIntake.HCPCDX23TBOX EQ "NULL")
			variables.instance.HCPCDX23TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX23TBOX = qGetIntake.HCPCDX23TBOX;
			
			IF(qGetIntake.HCPCDX24TBOX EQ "" OR qGetIntake.HCPCDX24TBOX EQ "NULL")
			variables.instance.HCPCDX24TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX24TBOX = qGetIntake.HCPCDX24TBOX;
			
			IF(qGetIntake.HCPCDX25TBOX EQ "" OR qGetIntake.HCPCDX25TBOX EQ "NULL")
			variables.instance.HCPCDX25TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX25TBOX = qGetIntake.HCPCDX25TBOX;
			
			IF(qGetIntake.HCPCDX26TBOX EQ "" OR qGetIntake.HCPCDX26TBOX EQ "NULL")
			variables.instance.HCPCDX26TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX26TBOX = qGetIntake.HCPCDX26TBOX;
			
			IF(qGetIntake.HCPCDX27TBOX EQ "" OR qGetIntake.HCPCDX27TBOX EQ "NULL")
			variables.instance.HCPCDX27TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX27TBOX = qGetIntake.HCPCDX27TBOX;
			
			IF(qGetIntake.HCPCDX28TBOX EQ "" OR qGetIntake.HCPCDX28TBOX EQ "NULL")
			variables.instance.HCPCDX28TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX28TBOX = qGetIntake.HCPCDX28TBOX;
			
			IF(qGetIntake.HCPCDX29TBOX EQ "" OR qGetIntake.HCPCDX29TBOX EQ "NULL")
			variables.instance.HCPCDX29TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX29TBOX = qGetIntake.HCPCDX29TBOX;
			
			IF(qGetIntake.HCPCDX2TBOX EQ "" OR qGetIntake.HCPCDX2TBOX EQ "NULL")
			variables.instance.HCPCDX2TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX2TBOX = qGetIntake.HCPCDX2TBOX;
			
			IF(qGetIntake.HCPCDX30TBOX EQ "" OR qGetIntake.HCPCDX30TBOX EQ "NULL")
			variables.instance.HCPCDX30TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX30TBOX = qGetIntake.HCPCDX30TBOX;
			
			IF(qGetIntake.HCPCDX31TBOX EQ "" OR qGetIntake.HCPCDX31TBOX EQ "NULL")
			variables.instance.HCPCDX31TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX31TBOX = qGetIntake.HCPCDX31TBOX;
			
			IF(qGetIntake.HCPCDX32TBOX EQ "" OR qGetIntake.HCPCDX32TBOX EQ "NULL")
			variables.instance.HCPCDX32TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX32TBOX = qGetIntake.HCPCDX32TBOX;
			
			IF(qGetIntake.HCPCDX33TBOX EQ "" OR qGetIntake.HCPCDX33TBOX EQ "NULL")
			variables.instance.HCPCDX33TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX33TBOX = qGetIntake.HCPCDX33TBOX;
			
			IF(qGetIntake.HCPCDX34TBOX EQ "" OR qGetIntake.HCPCDX34TBOX EQ "NULL")
			variables.instance.HCPCDX34TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX34TBOX = qGetIntake.HCPCDX34TBOX;
			
			IF(qGetIntake.HCPCDX35TBOX EQ "" OR qGetIntake.HCPCDX35TBOX EQ "NULL")
			variables.instance.HCPCDX35TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX35TBOX = qGetIntake.HCPCDX35TBOX;
			
			IF(qGetIntake.HCPCDX36TBOX EQ "" OR qGetIntake.HCPCDX36TBOX EQ "NULL")
			variables.instance.HCPCDX36TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX36TBOX = qGetIntake.HCPCDX36TBOX;
			
			IF(qGetIntake.HCPCDX37TBOX EQ "" OR qGetIntake.HCPCDX37TBOX EQ "NULL")
			variables.instance.HCPCDX37TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX37TBOX = qGetIntake.HCPCDX37TBOX;
			
			IF(qGetIntake.HCPCDX38TBOX EQ "" OR qGetIntake.HCPCDX38TBOX EQ "NULL")
			variables.instance.HCPCDX38TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX38TBOX = qGetIntake.HCPCDX38TBOX;
			
			IF(qGetIntake.HCPCDX39TBOX EQ "" OR qGetIntake.HCPCDX39TBOX EQ "NULL")
			variables.instance.HCPCDX39TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX39TBOX = qGetIntake.HCPCDX39TBOX;
			
			IF(qGetIntake.HCPCDX3TBOX EQ "" OR qGetIntake.HCPCDX3TBOX EQ "NULL")
			variables.instance.HCPCDX3TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX3TBOX = qGetIntake.HCPCDX3TBOX;
			
			IF(qGetIntake.HCPCDX40TBOX EQ "" OR qGetIntake.HCPCDX40TBOX EQ "NULL")
			variables.instance.HCPCDX40TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX40TBOX = qGetIntake.HCPCDX40TBOX;
			
			IF(qGetIntake.HCPCDX4TBOX EQ "" OR qGetIntake.HCPCDX4TBOX EQ "NULL")
			variables.instance.HCPCDX4TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX4TBOX = qGetIntake.HCPCDX4TBOX;
			
			IF(qGetIntake.HCPCDX5TBOX EQ "" OR qGetIntake.HCPCDX5TBOX EQ "NULL")
			variables.instance.HCPCDX5TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX5TBOX = qGetIntake.HCPCDX5TBOX;
			
			IF(qGetIntake.HCPCDX6TBOX EQ "" OR qGetIntake.HCPCDX6TBOX EQ "NULL")
			variables.instance.HCPCDX6TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX6TBOX = qGetIntake.HCPCDX6TBOX;
			
			IF(qGetIntake.HCPCDX7TBOX EQ "" OR qGetIntake.HCPCDX7TBOX EQ "NULL")
			variables.instance.HCPCDX7TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX7TBOX = qGetIntake.HCPCDX7TBOX;
			
			IF(qGetIntake.HCPCDX8TBOX EQ "" OR qGetIntake.HCPCDX8TBOX EQ "NULL")
			variables.instance.HCPCDX8TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX8TBOX = qGetIntake.HCPCDX8TBOX;
			
			IF(qGetIntake.HCPCDX9TBOX EQ "" OR qGetIntake.HCPCDX9TBOX EQ "NULL")
			variables.instance.HCPCDX9TBOX = "NULL";
			ELSE
			variables.instance.HCPCDX9TBOX = qGetIntake.HCPCDX9TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH10TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH10TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH10TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH10TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH10TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH11TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH11TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH11TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH11TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH11TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH12TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH12TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH12TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH12TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH12TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH13TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH13TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH13TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH13TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH13TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH14TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH14TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH14TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH14TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH14TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH15TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH15TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH15TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH15TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH15TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH16TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH16TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH16TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH16TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH16TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH17TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH17TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH17TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH17TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH17TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH18TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH18TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH18TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH18TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH18TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH19TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH19TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH19TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH19TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH19TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH1TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH1TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH1TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH1TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH1TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH20TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH20TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH20TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH20TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH20TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH21TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH21TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH21TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH21TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH21TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH22TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH22TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH22TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH22TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH22TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH23TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH23TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH23TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH23TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH23TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH24TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH24TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH24TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH24TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH24TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH25TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH25TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH25TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH25TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH25TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH26TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH26TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH26TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH26TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH26TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH27TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH27TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH27TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH27TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH27TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH28TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH28TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH28TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH28TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH28TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH29TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH29TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH29TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH29TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH29TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH2TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH2TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH2TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH2TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH2TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH30TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH30TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH30TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH30TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH30TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH31TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH31TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH31TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH31TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH31TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH32TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH32TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH32TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH32TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH32TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH33TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH33TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH33TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH33TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH33TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH34TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH34TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH34TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH34TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH34TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH35TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH35TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH35TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH35TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH35TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH36TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH36TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH36TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH36TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH36TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH37TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH37TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH37TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH37TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH37TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH38TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH38TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH38TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH38TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH38TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH39TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH39TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH39TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH39TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH39TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH3TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH3TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH3TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH3TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH3TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH40TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH40TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH40TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH40TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH40TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH4TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH4TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH4TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH4TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH4TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH5TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH5TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH5TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH5TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH5TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH6TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH6TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH6TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH6TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH6TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH7TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH7TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH7TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH7TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH7TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH8TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH8TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH8TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH8TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH8TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDMONTH9TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDMONTH9TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDMONTH9TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDMONTH9TBOX = qGetIntake.HCPCLENGTHOFNEEDMONTH9TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR10TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR10TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR10TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR10TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR10TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR11TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR11TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR11TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR11TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR11TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR12TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR12TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR12TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR12TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR12TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR13TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR13TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR13TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR13TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR13TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR14TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR14TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR14TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR14TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR14TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR15TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR15TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR15TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR15TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR15TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR16TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR16TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR16TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR16TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR16TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR17TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR17TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR17TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR17TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR17TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR18TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR18TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR18TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR18TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR18TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR19TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR19TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR19TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR19TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR19TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR1TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR1TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR1TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR1TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR1TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR20TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR20TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR20TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR20TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR20TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR21TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR21TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR21TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR21TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR21TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR22TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR22TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR22TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR22TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR22TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR23TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR23TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR23TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR23TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR23TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR24TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR24TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR24TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR24TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR24TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR25TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR25TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR25TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR25TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR25TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR26TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR26TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR26TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR26TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR26TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR27TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR27TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR27TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR27TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR27TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR28TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR28TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR28TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR28TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR28TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR29TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR29TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR29TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR29TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR29TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR2TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR2TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR2TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR2TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR2TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR30TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR30TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR30TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR30TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR30TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR31TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR31TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR31TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR31TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR31TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR32TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR32TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR32TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR32TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR32TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR33TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR33TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR33TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR33TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR33TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR34TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR34TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR34TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR34TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR34TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR35TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR35TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR35TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR35TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR35TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR36TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR36TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR36TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR36TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR36TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR37TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR37TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR37TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR37TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR37TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR38TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR38TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR38TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR38TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR38TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR39TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR39TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR39TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR39TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR39TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR3TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR3TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR3TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR3TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR3TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR40TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR40TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR40TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR40TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR40TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR4TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR4TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR4TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR4TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR4TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR5TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR5TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR5TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR5TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR5TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR6TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR6TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR6TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR6TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR6TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR7TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR7TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR7TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR7TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR7TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR8TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR8TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR8TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR8TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR8TBOX;
			
			IF(qGetIntake.HCPCLENGTHOFNEEDYEAR9TBOX EQ "" OR qGetIntake.HCPCLENGTHOFNEEDYEAR9TBOX EQ "NULL")
			variables.instance.HCPCLENGTHOFNEEDYEAR9TBOX = "NULL";
			ELSE
			variables.instance.HCPCLENGTHOFNEEDYEAR9TBOX = qGetIntake.HCPCLENGTHOFNEEDYEAR9TBOX;
			
			IF(qGetIntake.HCPCPRODUCT10TBOX EQ "" OR qGetIntake.HCPCPRODUCT10TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT10TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT10TBOX = qGetIntake.HCPCPRODUCT10TBOX;
			
			IF(qGetIntake.HCPCPRODUCT11TBOX EQ "" OR qGetIntake.HCPCPRODUCT11TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT11TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT11TBOX = qGetIntake.HCPCPRODUCT11TBOX;
			
			IF(qGetIntake.HCPCPRODUCT12TBOX EQ "" OR qGetIntake.HCPCPRODUCT12TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT12TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT12TBOX = qGetIntake.HCPCPRODUCT12TBOX;
			
			IF(qGetIntake.HCPCPRODUCT13TBOX EQ "" OR qGetIntake.HCPCPRODUCT13TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT13TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT13TBOX = qGetIntake.HCPCPRODUCT13TBOX;
			
			IF(qGetIntake.HCPCPRODUCT14TBOX EQ "" OR qGetIntake.HCPCPRODUCT14TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT14TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT14TBOX = qGetIntake.HCPCPRODUCT14TBOX;
			
			IF(qGetIntake.HCPCPRODUCT15TBOX EQ "" OR qGetIntake.HCPCPRODUCT15TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT15TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT15TBOX = qGetIntake.HCPCPRODUCT15TBOX;
			
			IF(qGetIntake.HCPCPRODUCT16TBOX EQ "" OR qGetIntake.HCPCPRODUCT16TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT16TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT16TBOX = qGetIntake.HCPCPRODUCT16TBOX;
			
			IF(qGetIntake.HCPCPRODUCT17TBOX EQ "" OR qGetIntake.HCPCPRODUCT17TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT17TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT17TBOX = qGetIntake.HCPCPRODUCT17TBOX;
			
			IF(qGetIntake.HCPCPRODUCT18TBOX EQ "" OR qGetIntake.HCPCPRODUCT18TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT18TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT18TBOX = qGetIntake.HCPCPRODUCT18TBOX;
			
			IF(qGetIntake.HCPCPRODUCT19TBOX EQ "" OR qGetIntake.HCPCPRODUCT19TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT19TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT19TBOX = qGetIntake.HCPCPRODUCT19TBOX;
			
			IF(qGetIntake.HCPCPRODUCT1TBOX EQ "" OR qGetIntake.HCPCPRODUCT1TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT1TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT1TBOX = qGetIntake.HCPCPRODUCT1TBOX;
			
			IF(qGetIntake.HCPCPRODUCT20TBOX EQ "" OR qGetIntake.HCPCPRODUCT20TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT20TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT20TBOX = qGetIntake.HCPCPRODUCT20TBOX;
			
			IF(qGetIntake.HCPCPRODUCT21TBOX EQ "" OR qGetIntake.HCPCPRODUCT21TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT21TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT21TBOX = qGetIntake.HCPCPRODUCT21TBOX;
			
			IF(qGetIntake.HCPCPRODUCT22TBOX EQ "" OR qGetIntake.HCPCPRODUCT22TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT22TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT22TBOX = qGetIntake.HCPCPRODUCT22TBOX;
			
			IF(qGetIntake.HCPCPRODUCT23TBOX EQ "" OR qGetIntake.HCPCPRODUCT23TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT23TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT23TBOX = qGetIntake.HCPCPRODUCT23TBOX;
			
			IF(qGetIntake.HCPCPRODUCT24TBOX EQ "" OR qGetIntake.HCPCPRODUCT24TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT24TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT24TBOX = qGetIntake.HCPCPRODUCT24TBOX;
			
			IF(qGetIntake.HCPCPRODUCT25TBOX EQ "" OR qGetIntake.HCPCPRODUCT25TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT25TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT25TBOX = qGetIntake.HCPCPRODUCT25TBOX;
			
			IF(qGetIntake.HCPCPRODUCT26TBOX EQ "" OR qGetIntake.HCPCPRODUCT26TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT26TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT26TBOX = qGetIntake.HCPCPRODUCT26TBOX;
			
			IF(qGetIntake.HCPCPRODUCT27TBOX EQ "" OR qGetIntake.HCPCPRODUCT27TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT27TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT27TBOX = qGetIntake.HCPCPRODUCT27TBOX;
			
			IF(qGetIntake.HCPCPRODUCT28TBOX EQ "" OR qGetIntake.HCPCPRODUCT28TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT28TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT28TBOX = qGetIntake.HCPCPRODUCT28TBOX;
			
			IF(qGetIntake.HCPCPRODUCT29TBOX EQ "" OR qGetIntake.HCPCPRODUCT29TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT29TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT29TBOX = qGetIntake.HCPCPRODUCT29TBOX;
			
			IF(qGetIntake.HCPCPRODUCT2TBOX EQ "" OR qGetIntake.HCPCPRODUCT2TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT2TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT2TBOX = qGetIntake.HCPCPRODUCT2TBOX;
			
			IF(qGetIntake.HCPCPRODUCT30TBOX EQ "" OR qGetIntake.HCPCPRODUCT30TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT30TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT30TBOX = qGetIntake.HCPCPRODUCT30TBOX;
			
			IF(qGetIntake.HCPCPRODUCT31TBOX EQ "" OR qGetIntake.HCPCPRODUCT31TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT31TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT31TBOX = qGetIntake.HCPCPRODUCT31TBOX;
			
			IF(qGetIntake.HCPCPRODUCT32TBOX EQ "" OR qGetIntake.HCPCPRODUCT32TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT32TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT32TBOX = qGetIntake.HCPCPRODUCT32TBOX;
			
			IF(qGetIntake.HCPCPRODUCT33TBOX EQ "" OR qGetIntake.HCPCPRODUCT33TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT33TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT33TBOX = qGetIntake.HCPCPRODUCT33TBOX;
			
			IF(qGetIntake.HCPCPRODUCT34TBOX EQ "" OR qGetIntake.HCPCPRODUCT34TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT34TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT34TBOX = qGetIntake.HCPCPRODUCT34TBOX;
			
			IF(qGetIntake.HCPCPRODUCT35TBOX EQ "" OR qGetIntake.HCPCPRODUCT35TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT35TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT35TBOX = qGetIntake.HCPCPRODUCT35TBOX;
			
			IF(qGetIntake.HCPCPRODUCT36TBOX EQ "" OR qGetIntake.HCPCPRODUCT36TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT36TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT36TBOX = qGetIntake.HCPCPRODUCT36TBOX;
			
			IF(qGetIntake.HCPCPRODUCT37TBOX EQ "" OR qGetIntake.HCPCPRODUCT37TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT37TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT37TBOX = qGetIntake.HCPCPRODUCT37TBOX;
			
			IF(qGetIntake.HCPCPRODUCT38TBOX EQ "" OR qGetIntake.HCPCPRODUCT38TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT38TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT38TBOX = qGetIntake.HCPCPRODUCT38TBOX;
			
			IF(qGetIntake.HCPCPRODUCT39TBOX EQ "" OR qGetIntake.HCPCPRODUCT39TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT39TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT39TBOX = qGetIntake.HCPCPRODUCT39TBOX;
			
			IF(qGetIntake.HCPCPRODUCT3TBOX EQ "" OR qGetIntake.HCPCPRODUCT3TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT3TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT3TBOX = qGetIntake.HCPCPRODUCT3TBOX;
			
			IF(qGetIntake.HCPCPRODUCT40TBOX EQ "" OR qGetIntake.HCPCPRODUCT40TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT40TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT40TBOX = qGetIntake.HCPCPRODUCT40TBOX;
			
			IF(qGetIntake.HCPCPRODUCT4TBOX EQ "" OR qGetIntake.HCPCPRODUCT4TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT4TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT4TBOX = qGetIntake.HCPCPRODUCT4TBOX;
			
			IF(qGetIntake.HCPCPRODUCT5TBOX EQ "" OR qGetIntake.HCPCPRODUCT5TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT5TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT5TBOX = qGetIntake.HCPCPRODUCT5TBOX;
			
			IF(qGetIntake.HCPCPRODUCT6TBOX EQ "" OR qGetIntake.HCPCPRODUCT6TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT6TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT6TBOX = qGetIntake.HCPCPRODUCT6TBOX;
			
			IF(qGetIntake.HCPCPRODUCT7TBOX EQ "" OR qGetIntake.HCPCPRODUCT7TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT7TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT7TBOX = qGetIntake.HCPCPRODUCT7TBOX;
			
			IF(qGetIntake.HCPCPRODUCT8TBOX EQ "" OR qGetIntake.HCPCPRODUCT8TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT8TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT8TBOX = qGetIntake.HCPCPRODUCT8TBOX;
			
			IF(qGetIntake.HCPCPRODUCT9TBOX EQ "" OR qGetIntake.HCPCPRODUCT9TBOX EQ "NULL")
			variables.instance.HCPCPRODUCT9TBOX = "NULL";
			ELSE
			variables.instance.HCPCPRODUCT9TBOX = qGetIntake.HCPCPRODUCT9TBOX;
			
			IF(qGetIntake.HCPCQTY10TBOX EQ "" OR qGetIntake.HCPCQTY10TBOX EQ "NULL")
			variables.instance.HCPCQTY10TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY10TBOX = qGetIntake.HCPCQTY10TBOX;
			
			IF(qGetIntake.HCPCQTY11TBOX EQ "" OR qGetIntake.HCPCQTY11TBOX EQ "NULL")
			variables.instance.HCPCQTY11TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY11TBOX = qGetIntake.HCPCQTY11TBOX;
			
			IF(qGetIntake.HCPCQTY12TBOX EQ "" OR qGetIntake.HCPCQTY12TBOX EQ "NULL")
			variables.instance.HCPCQTY12TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY12TBOX = qGetIntake.HCPCQTY12TBOX;
			
			IF(qGetIntake.HCPCQTY13TBOX EQ "" OR qGetIntake.HCPCQTY13TBOX EQ "NULL")
			variables.instance.HCPCQTY13TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY13TBOX = qGetIntake.HCPCQTY13TBOX;
			
			IF(qGetIntake.HCPCQTY14TBOX EQ "" OR qGetIntake.HCPCQTY14TBOX EQ "NULL")
			variables.instance.HCPCQTY14TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY14TBOX = qGetIntake.HCPCQTY14TBOX;
			
			IF(qGetIntake.HCPCQTY15TBOX EQ "" OR qGetIntake.HCPCQTY15TBOX EQ "NULL")
			variables.instance.HCPCQTY15TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY15TBOX = qGetIntake.HCPCQTY15TBOX;
			
			IF(qGetIntake.HCPCQTY16TBOX EQ "" OR qGetIntake.HCPCQTY16TBOX EQ "NULL")
			variables.instance.HCPCQTY16TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY16TBOX = qGetIntake.HCPCQTY16TBOX;
			
			IF(qGetIntake.HCPCQTY17TBOX EQ "" OR qGetIntake.HCPCQTY17TBOX EQ "NULL")
			variables.instance.HCPCQTY17TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY17TBOX = qGetIntake.HCPCQTY17TBOX;
			
			IF(qGetIntake.HCPCQTY18TBOX EQ "" OR qGetIntake.HCPCQTY18TBOX EQ "NULL")
			variables.instance.HCPCQTY18TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY18TBOX = qGetIntake.HCPCQTY18TBOX;
			
			IF(qGetIntake.HCPCQTY19TBOX EQ "" OR qGetIntake.HCPCQTY19TBOX EQ "NULL")
			variables.instance.HCPCQTY19TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY19TBOX = qGetIntake.HCPCQTY19TBOX;
			
			IF(qGetIntake.HCPCQTY1TBOX EQ "" OR qGetIntake.HCPCQTY1TBOX EQ "NULL")
			variables.instance.HCPCQTY1TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY1TBOX = qGetIntake.HCPCQTY1TBOX;
			
			IF(qGetIntake.HCPCQTY20TBOX EQ "" OR qGetIntake.HCPCQTY20TBOX EQ "NULL")
			variables.instance.HCPCQTY20TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY20TBOX = qGetIntake.HCPCQTY20TBOX;
			
			IF(qGetIntake.HCPCQTY21TBOX EQ "" OR qGetIntake.HCPCQTY21TBOX EQ "NULL")
			variables.instance.HCPCQTY21TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY21TBOX = qGetIntake.HCPCQTY21TBOX;
			
			IF(qGetIntake.HCPCQTY22TBOX EQ "" OR qGetIntake.HCPCQTY22TBOX EQ "NULL")
			variables.instance.HCPCQTY22TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY22TBOX = qGetIntake.HCPCQTY22TBOX;
			
			IF(qGetIntake.HCPCQTY23TBOX EQ "" OR qGetIntake.HCPCQTY23TBOX EQ "NULL")
			variables.instance.HCPCQTY23TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY23TBOX = qGetIntake.HCPCQTY23TBOX;
			
			IF(qGetIntake.HCPCQTY24TBOX EQ "" OR qGetIntake.HCPCQTY24TBOX EQ "NULL")
			variables.instance.HCPCQTY24TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY24TBOX = qGetIntake.HCPCQTY24TBOX;
			
			IF(qGetIntake.HCPCQTY25TBOX EQ "" OR qGetIntake.HCPCQTY25TBOX EQ "NULL")
			variables.instance.HCPCQTY25TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY25TBOX = qGetIntake.HCPCQTY25TBOX;
			
			IF(qGetIntake.HCPCQTY26TBOX EQ "" OR qGetIntake.HCPCQTY26TBOX EQ "NULL")
			variables.instance.HCPCQTY26TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY26TBOX = qGetIntake.HCPCQTY26TBOX;
			
			IF(qGetIntake.HCPCQTY27TBOX EQ "" OR qGetIntake.HCPCQTY27TBOX EQ "NULL")
			variables.instance.HCPCQTY27TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY27TBOX = qGetIntake.HCPCQTY27TBOX;
			
			IF(qGetIntake.HCPCQTY28TBOX EQ "" OR qGetIntake.HCPCQTY28TBOX EQ "NULL")
			variables.instance.HCPCQTY28TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY28TBOX = qGetIntake.HCPCQTY28TBOX;
			
			IF(qGetIntake.HCPCQTY29TBOX EQ "" OR qGetIntake.HCPCQTY29TBOX EQ "NULL")
			variables.instance.HCPCQTY29TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY29TBOX = qGetIntake.HCPCQTY29TBOX;
			
			IF(qGetIntake.HCPCQTY2TBOX EQ "" OR qGetIntake.HCPCQTY2TBOX EQ "NULL")
			variables.instance.HCPCQTY2TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY2TBOX = qGetIntake.HCPCQTY2TBOX;
			
			IF(qGetIntake.HCPCQTY30TBOX EQ "" OR qGetIntake.HCPCQTY30TBOX EQ "NULL")
			variables.instance.HCPCQTY30TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY30TBOX = qGetIntake.HCPCQTY30TBOX;
			
			IF(qGetIntake.HCPCQTY31TBOX EQ "" OR qGetIntake.HCPCQTY31TBOX EQ "NULL")
			variables.instance.HCPCQTY31TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY31TBOX = qGetIntake.HCPCQTY31TBOX;
			
			IF(qGetIntake.HCPCQTY32TBOX EQ "" OR qGetIntake.HCPCQTY32TBOX EQ "NULL")
			variables.instance.HCPCQTY32TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY32TBOX = qGetIntake.HCPCQTY32TBOX;
			
			IF(qGetIntake.HCPCQTY33TBOX EQ "" OR qGetIntake.HCPCQTY33TBOX EQ "NULL")
			variables.instance.HCPCQTY33TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY33TBOX = qGetIntake.HCPCQTY33TBOX;
			
			IF(qGetIntake.HCPCQTY34TBOX EQ "" OR qGetIntake.HCPCQTY34TBOX EQ "NULL")
			variables.instance.HCPCQTY34TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY34TBOX = qGetIntake.HCPCQTY34TBOX;
			
			IF(qGetIntake.HCPCQTY35TBOX EQ "" OR qGetIntake.HCPCQTY35TBOX EQ "NULL")
			variables.instance.HCPCQTY35TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY35TBOX = qGetIntake.HCPCQTY35TBOX;
			
			IF(qGetIntake.HCPCQTY36TBOX EQ "" OR qGetIntake.HCPCQTY36TBOX EQ "NULL")
			variables.instance.HCPCQTY36TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY36TBOX = qGetIntake.HCPCQTY36TBOX;
			
			IF(qGetIntake.HCPCQTY37TBOX EQ "" OR qGetIntake.HCPCQTY37TBOX EQ "NULL")
			variables.instance.HCPCQTY37TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY37TBOX = qGetIntake.HCPCQTY37TBOX;
			
			IF(qGetIntake.HCPCQTY38TBOX EQ "" OR qGetIntake.HCPCQTY38TBOX EQ "NULL")
			variables.instance.HCPCQTY38TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY38TBOX = qGetIntake.HCPCQTY38TBOX;
			
			IF(qGetIntake.HCPCQTY39TBOX EQ "" OR qGetIntake.HCPCQTY39TBOX EQ "NULL")
			variables.instance.HCPCQTY39TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY39TBOX = qGetIntake.HCPCQTY39TBOX;
			
			IF(qGetIntake.HCPCQTY3TBOX EQ "" OR qGetIntake.HCPCQTY3TBOX EQ "NULL")
			variables.instance.HCPCQTY3TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY3TBOX = qGetIntake.HCPCQTY3TBOX;
			
			IF(qGetIntake.HCPCQTY40TBOX EQ "" OR qGetIntake.HCPCQTY40TBOX EQ "NULL")
			variables.instance.HCPCQTY40TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY40TBOX = qGetIntake.HCPCQTY40TBOX;
			
			IF(qGetIntake.HCPCQTY4TBOX EQ "" OR qGetIntake.HCPCQTY4TBOX EQ "NULL")
			variables.instance.HCPCQTY4TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY4TBOX = qGetIntake.HCPCQTY4TBOX;
			
			IF(qGetIntake.HCPCQTY5TBOX EQ "" OR qGetIntake.HCPCQTY5TBOX EQ "NULL")
			variables.instance.HCPCQTY5TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY5TBOX = qGetIntake.HCPCQTY5TBOX;
			
			IF(qGetIntake.HCPCQTY6TBOX EQ "" OR qGetIntake.HCPCQTY6TBOX EQ "NULL")
			variables.instance.HCPCQTY6TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY6TBOX = qGetIntake.HCPCQTY6TBOX;
			
			IF(qGetIntake.HCPCQTY7TBOX EQ "" OR qGetIntake.HCPCQTY7TBOX EQ "NULL")
			variables.instance.HCPCQTY7TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY7TBOX = qGetIntake.HCPCQTY7TBOX;
			
			IF(qGetIntake.HCPCQTY8TBOX EQ "" OR qGetIntake.HCPCQTY8TBOX EQ "NULL")
			variables.instance.HCPCQTY8TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY8TBOX = qGetIntake.HCPCQTY8TBOX;
			
			IF(qGetIntake.HCPCQTY9TBOX EQ "" OR qGetIntake.HCPCQTY9TBOX EQ "NULL")
			variables.instance.HCPCQTY9TBOX = "NULL";
			ELSE
			variables.instance.HCPCQTY9TBOX = qGetIntake.HCPCQTY9TBOX;--->
			*/


			
				<cffunction name="getprimaryInsuranceNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryInsuranceNameTBox>
	</cffunction>
	
	<cffunction name="getprimaryPolicyNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryPolicyNumberTBox>
	</cffunction>
	
	<cffunction name="getprimaryGroupNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryGroupNumberTBox>
	</cffunction>
	
	<cffunction name="getprimaryPhoneNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryPhoneNumberTBox>
	</cffunction>
	
	<cffunction name="getprimaryFaxNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryFaxNumberTBox>
	</cffunction>
	
	<cffunction name="getprimarySendToAddress1TBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primarySendToAddress1TBox>
	</cffunction>
	
	<cffunction name="getprimarySendToAddress2TBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primarySendToAddress2TBox>
	</cffunction>
	
	<cffunction name="getprimarySendToCityTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primarySendToCityTBox>
	</cffunction>
	
	<cffunction name="getprimarySendToStateTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primarySendToStateTBox>
	</cffunction>
	
	<cffunction name="getprimarySendToZipCodeTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primarySendToZipCodeTBox>
	</cffunction>
	
	<cffunction name="getprimaryEffectiveDateMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryEffectiveDateMM>
	</cffunction>
	
	<cffunction name="getprimaryEffectiveDateDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryEffectiveDateDD>
	</cffunction>
	
	<cffunction name="getprimaryEffectiveDateYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryEffectiveDateYY>
	</cffunction>
	
	<cffunction name="getprimaryPolicyHolderFNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryPolicyHolderFNameTBox>
	</cffunction>
	
	<cffunction name="getprimaryPolicyHolderMInitialTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryPolicyHolderMInitialTBox>
	</cffunction>
	
	<cffunction name="getprimaryPolicyHolderLNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryPolicyHolderLNameTBox>
	</cffunction>
	
	<cffunction name="getprimaryHoldersDOBMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryHoldersDOBMM>
	</cffunction>
	
	<cffunction name="getprimaryHoldersDOBDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryHoldersDOBDD>
	</cffunction>
	
	<cffunction name="getprimaryHoldersDOBYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryHoldersDOBYY>
	</cffunction>
	
	<cffunction name="getprimaryPolicyHolderEmployerTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryPolicyHolderEmployerTBox>
	</cffunction>
	
	<cffunction name="getprimaryNoteTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryNoteTBox>
	</cffunction>
	
	<cffunction name="getprimaryVerificationRepFNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationRepFNameTBox>
	</cffunction>
	
	<cffunction name="getprimaryVerificationRepLNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationRepLNameTBox>
	</cffunction>
	
	<cffunction name="getprimaryVerificationDateMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationDateMM>
	</cffunction>
	
	<cffunction name="getprimaryVerificationDateDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationDateDD>
	</cffunction>
	
	<cffunction name="getprimaryVerificationDateYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationDateYY>
	</cffunction>
	
	<cffunction name="getprimaryVerificationTimeTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationTimeTBox>
	</cffunction>
	
	<cffunction name="getprimaryVerificationHaveInsFromMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationHaveInsFromMM>
	</cffunction>
	
	<cffunction name="getprimaryVerificationHaveInsFromDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationHaveInsFromDD>
	</cffunction>
	
	<cffunction name="getprimaryVerificationHaveInsFromYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationHaveInsFromYY>
	</cffunction>
	
	<cffunction name="getprimaryVerificationHaveInsToMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationHaveInsToMM>
	</cffunction>
	
	<cffunction name="getprimaryVerificationHaveInsToDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationHaveInsToDD>
	</cffunction>
	
	<cffunction name="getprimaryVerificationHaveInsToYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationHaveInsToYY>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationHaveInsYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationHaveInsYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationHaveInsNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationHaveInsNo>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationHaveDMECovYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationHaveDMECovYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationHaveDMECovNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationHaveDMECovNo>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationDeductibleYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationDeductibleYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationDeductibleNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationDeductibleNo>
	</cffunction>
	
	<cffunction name="getprimaryVerificationDeductibleAmountTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationDeductibleAmountTBox>
	</cffunction>
	
	<cffunction name="getprimaryVerificationDeductibleAmountMetTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationDeductibleAmountMetTBox>
	</cffunction>
	
	<cffunction name="getprimaryVerificationPercentagePayAfterDeductibleTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationPercentagePayAfterDeductibleTBox>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationPPOPolicyYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationPPOPolicyYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationPPOPolicyNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationPPOPolicyNo>
	</cffunction>
	
	<cffunction name="getprimaryVerificationAuthNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationAuthNumberTBox>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationPriorAuthYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationPriorAuthYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationPriorAuthNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationPriorAuthNo>
	</cffunction>
	
	<cffunction name="getprimaryVerificationAuthPhoneNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationAuthPhoneNumberTBox>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationLifetimeBenefitMetYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationLifetimeBenefitMetYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationLifetimeBenefitMetNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationLifetimeBenefitMetNo>
	</cffunction>
	
	<cffunction name="getprimaryCBox_MedicareSupplementYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_MedicareSupplementYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_MedicareSupplementNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_MedicareSupplementNo>
	</cffunction>
	
	<cffunction name="getprimaryCBox_CoordinateBenefitsYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_CoordinateBenefitsYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_CoordinateBenefitsNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_CoordinateBenefitsNo>
	</cffunction>
	
	<cffunction name="getprimaryCBox_PaidMedicareDeductibleYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_PaidMedicareDeductibleYes>
	</cffunction>
	
	<cffunction name="getprimaryCBox_PaidMedicareDeductibleNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_PaidMedicareDeductibleNo>
	</cffunction>
	
	<cffunction name="getprimaryVerificationTypeBasePlanTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryVerificationTypeBasePlanTBox>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationMedicaidPlanMQMB" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationMedicaidPlanMQMB>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationMedicaidPlanQMB" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationMedicaidPlanQMB>
	</cffunction>
	
	<cffunction name="getprimaryCBox_VerificationMedicaidPlanTraditional" access="public" returntype="String" output="No">
		<cfreturn variables.instance.primaryCBox_VerificationMedicaidPlanTraditional>
	</cffunction>
	
	<cffunction name="getsecondaryInsuranceNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryInsuranceNameTBox>
	</cffunction>
	
	<cffunction name="getsecondaryPolicyNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryPolicyNumberTBox>
	</cffunction>
	
	<cffunction name="getsecondaryGroupNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryGroupNumberTBox>
	</cffunction>
	
	<cffunction name="getsecondaryPhoneNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryPhoneNumberTBox>
	</cffunction>
	
	<cffunction name="getsecondaryFaxNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryFaxNumberTBox>
	</cffunction>
	
	<cffunction name="getsecondarySendToAddress1TBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondarySendToAddress1TBox>
	</cffunction>
	
	<cffunction name="getsecondarySendToAddress2TBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondarySendToAddress2TBox>
	</cffunction>
	
	<cffunction name="getsecondarySendToCityTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondarySendToCityTBox>
	</cffunction>
	
	<cffunction name="getsecondarySendToStateTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondarySendToStateTBox>
	</cffunction>
	
	<cffunction name="getsecondarySendToZipCodeTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondarySendToZipCodeTBox>
	</cffunction>
	
	<cffunction name="getsecondaryEffectiveDateMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryEffectiveDateMM>
	</cffunction>
	
	<cffunction name="getsecondaryEffectiveDateDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryEffectiveDateDD>
	</cffunction>
	
	<cffunction name="getsecondaryEffectiveDateYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryEffectiveDateYY>
	</cffunction>
	
	<cffunction name="getsecondaryPolicyHolderFNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryPolicyHolderFNameTBox>
	</cffunction>
	
	<cffunction name="getsecondaryPolicyHolderMInitialTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryPolicyHolderMInitialTBox>
	</cffunction>
	
	<cffunction name="getsecondaryPolicyHolderLNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryPolicyHolderLNameTBox>
	</cffunction>
	
	<cffunction name="getsecondaryHoldersDOBMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryHoldersDOBMM>
	</cffunction>
	
	<cffunction name="getsecondaryHoldersDOBDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryHoldersDOBDD>
	</cffunction>
	
	<cffunction name="getsecondaryHoldersDOBYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryHoldersDOBYY>
	</cffunction>
	
	<cffunction name="getsecondaryPolicyHolderEmployerTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryPolicyHolderEmployerTBox>
	</cffunction>
	
	<cffunction name="getsecondaryNoteTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryNoteTBox>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationRepFNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationRepFNameTBox>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationRepLNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationRepLNameTBox>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationDateMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationDateMM>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationDateDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationDateDD>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationDateYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationDateYY>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationTimeTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationTimeTBox>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationHaveInsFromMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationHaveInsFromMM>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationHaveInsFromDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationHaveInsFromDD>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationHaveInsFromYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationHaveInsFromYY>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationHaveInsToMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationHaveInsToMM>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationHaveInsToDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationHaveInsToDD>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationHaveInsToYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationHaveInsToYY>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationHaveInsYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationHaveInsYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationHaveInsNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationHaveInsNo>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationHaveDMECovYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationHaveDMECovYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationHaveDMECovNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationHaveDMECovNo>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationDeductibleYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationDeductibleYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationDeductibleNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationDeductibleNo>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationDeductibleAmountTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationDeductibleAmountTBox>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationDeductibleAmountMetTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationDeductibleAmountMetTBox>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationPercentagePayAfterDeductibleTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationPercentagePayAfterDeductibleTBox>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationPPOPolicyYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationPPOPolicyYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationPPOPolicyNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationPPOPolicyNo>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationAuthNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationAuthNumberTBox>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationPriorAuthYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationPriorAuthYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationPriorAuthNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationPriorAuthNo>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationAuthPhoneNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationAuthPhoneNumberTBox>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationLifetimeBenefitMetYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationLifetimeBenefitMetYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationLifetimeBenefitMetNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationLifetimeBenefitMetNo>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_MedicareSupplementYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_MedicareSupplementYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_MedicareSupplementNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_MedicareSupplementNo>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_CoordinateBenefitsYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_CoordinateBenefitsYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_CoordinateBenefitsNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_CoordinateBenefitsNo>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_PaidMedicareDeductibleYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_PaidMedicareDeductibleYes>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_PaidMedicareDeductibleNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_PaidMedicareDeductibleNo>
	</cffunction>
	
	<cffunction name="getsecondaryVerificationTypeBasePlanTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryVerificationTypeBasePlanTBox>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationMedicaidPlanMQMB" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationMedicaidPlanMQMB>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationMedicaidPlanQMB" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationMedicaidPlanQMB>
	</cffunction>
	
	<cffunction name="getsecondaryCBox_VerificationMedicaidPlanTraditional" access="public" returntype="String" output="No">
		<cfreturn variables.instance.secondaryCBox_VerificationMedicaidPlanTraditional>
	</cffunction>
	
	<cffunction name="gettertiaryInsuranceNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryInsuranceNameTBox>
	</cffunction>
	
	<cffunction name="gettertiaryPolicyNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryPolicyNumberTBox>
	</cffunction>
	
	<cffunction name="gettertiaryGroupNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryGroupNumberTBox>
	</cffunction>
	
	<cffunction name="gettertiaryPhoneNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryPhoneNumberTBox>
	</cffunction>
	
	<cffunction name="gettertiaryFaxNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryFaxNumberTBox>
	</cffunction>
	
	<cffunction name="gettertiarySendToAddress1TBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiarySendToAddress1TBox>
	</cffunction>
	
	<cffunction name="gettertiarySendToAddress2TBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiarySendToAddress2TBox>
	</cffunction>
	
	<cffunction name="gettertiarySendToCityTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiarySendToCityTBox>
	</cffunction>
	
	<cffunction name="gettertiarySendToStateTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiarySendToStateTBox>
	</cffunction>
	
	<cffunction name="gettertiarySendToZipCodeTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiarySendToZipCodeTBox>
	</cffunction>
	
	<cffunction name="gettertiaryEffectiveDateMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryEffectiveDateMM>
	</cffunction>
	
	<cffunction name="gettertiaryEffectiveDateDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryEffectiveDateDD>
	</cffunction>
	
	<cffunction name="gettertiaryEffectiveDateYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryEffectiveDateYY>
	</cffunction>
	
	<cffunction name="gettertiaryPolicyHolderFNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryPolicyHolderFNameTBox>
	</cffunction>
	
	<cffunction name="gettertiaryPolicyHolderMInitialTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryPolicyHolderMInitialTBox>
	</cffunction>
	
	<cffunction name="gettertiaryPolicyHolderLNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryPolicyHolderLNameTBox>
	</cffunction>
	
	<cffunction name="gettertiaryHoldersDOBMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryHoldersDOBMM>
	</cffunction>
	
	<cffunction name="gettertiaryHoldersDOBDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryHoldersDOBDD>
	</cffunction>
	
	<cffunction name="gettertiaryHoldersDOBYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryHoldersDOBYY>
	</cffunction>
	
	<cffunction name="gettertiaryPolicyHolderEmployerTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryPolicyHolderEmployerTBox>
	</cffunction>
	
	<cffunction name="gettertiaryNoteTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryNoteTBox>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationRepFNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationRepFNameTBox>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationRepLNameTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationRepLNameTBox>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationDateMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationDateMM>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationDateDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationDateDD>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationDateYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationDateYY>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationTimeTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationTimeTBox>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationHaveInsFromMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationHaveInsFromMM>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationHaveInsFromDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationHaveInsFromDD>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationHaveInsFromYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationHaveInsFromYY>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationHaveInsToMM" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationHaveInsToMM>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationHaveInsToDD" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationHaveInsToDD>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationHaveInsToYY" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationHaveInsToYY>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationHaveInsYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationHaveInsYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationHaveInsNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationHaveInsNo>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationHaveDMECovYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationHaveDMECovYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationHaveDMECovNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationHaveDMECovNo>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationDeductibleYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationDeductibleYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationDeductibleNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationDeductibleNo>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationDeductibleAmountTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationDeductibleAmountTBox>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationDeductibleAmountMetTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationDeductibleAmountMetTBox>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationPercentagePayAfterDeductibleTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationPercentagePayAfterDeductibleTBox>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationPPOPolicyYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationPPOPolicyYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationPPOPolicyNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationPPOPolicyNo>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationAuthNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationAuthNumberTBox>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationPriorAuthYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationPriorAuthYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationPriorAuthNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationPriorAuthNo>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationAuthPhoneNumberTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationAuthPhoneNumberTBox>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationLifetimeBenefitMetYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationLifetimeBenefitMetYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationLifetimeBenefitMetNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationLifetimeBenefitMetNo>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_MedicareSupplementYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_MedicareSupplementYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_MedicareSupplementNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_MedicareSupplementNo>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_CoordinateBenefitsYes" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_CoordinateBenefitsYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_CoordinateBenefitsNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_CoordinateBenefitsNo>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_PaidMedicareDeductibleYes" access="public" returntype="String" output="No">
			<cfreturn variables.instance.tertiaryCBox_PaidMedicareDeductibleYes>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_PaidMedicareDeductibleNo" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_PaidMedicareDeductibleNo>
	</cffunction>
	
	<cffunction name="gettertiaryVerificationTypeBasePlanTBox" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryVerificationTypeBasePlanTBox>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationMedicaidPlanMQMB" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationMedicaidPlanMQMB>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationMedicaidPlanQMB" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationMedicaidPlanQMB>
	</cffunction>
	
	<cffunction name="gettertiaryCBox_VerificationMedicaidPlanTraditional" access="public" returntype="String" output="No">
		<cfreturn variables.instance.tertiaryCBox_VerificationMedicaidPlanTraditional>
	</cffunction>






i.patientFNameTBox, i.patientMInitialTBox, i.patientLNameTBox, 	i.patientAddressTBox, i.patientCityTBox, i.patientStateTBox, i.patientZipTBox, i.patientPhoneTBox, i.patientDOBMM, i.patientDOBDD, i.patientDOBYY, i.patientSSNTBox,  i.patientHeightInches, i.patientWeightTBox, 

IFNULL(i.OPTION_3a_CBox_PatientSexFemale, 0) AS OPTION_3a_CBox_PatientSexFemale, IFNULL(i.OPTION_3a_CBox_PatientSexMale, 0) AS OPTION_3a_CBox_PatientSexMale, 

i.primaryInsuranceNameTBox, i.primaryPolicyNumberTBox, i.primaryGroupNumberTBox, i.primaryPhoneNumberTBox, i.primaryEffectiveDateMM, i.primaryEffectiveDateDD, i.primaryEffectiveDateYY, i.primaryPolicyHolderFNameTBox, i.primaryPolicyHolderMInitialTBox, i.primaryPolicyHolderLNameTBox, i.primaryHoldersDOBMM, i.primaryHoldersDOBDD, i.primaryHoldersDOBYY, i.primaryPolicyHolderEmployerTBox, i.primaryNoteTBox, i.primaryVerificationRepFNameTBox, i.primaryVerificationRepLNameTBox, i.primaryVerificationDateMM, i.primaryVerificationDateDD, i.primaryVerificationDateYY, i.primaryVerificationTimeTBox, i.primaryVerificationHaveInsFromMM, i.primaryVerificationHaveInsFromDD, i.primaryVerificationHaveInsFromYY, i.primaryVerificationHaveInsToMM, i.primaryVerificationHaveInsToDD, i.primaryVerificationHaveInsToYY, IFNULL(i.primaryCBox_VerificationHaveInsYes, 0) AS primaryCBox_VerificationHaveInsYes, IFNULL(i.primaryCBox_VerificationHaveInsNo, 0) AS primaryCBox_VerificationHaveInsNo, IFNULL(i.primaryCBox_VerificationHaveDMECovYes, 0) AS primaryCBox_VerificationHaveDMECovYes, IFNULL(i.primaryCBox_VerificationHaveDMECovNo, 0) AS primaryCBox_VerificationHaveDMECovNo, IFNULL(i.primaryCBox_VerificationDeductibleYes, 0) AS primaryCBox_VerificationDeductibleYes, IFNULL(i.primaryCBox_VerificationDeductibleNo, 0) AS primaryCBox_VerificationDeductibleNo, i.primaryVerificationDeductibleAmountTBox, i.primaryVerificationDeductibleAmountMetTBox, i.primaryVerificationPercentagePayAfterDeductibleTBox, IFNULL(i.primaryCBox_VerificationPPOPolicyYes, 0) AS primaryCBox_VerificationPPOPolicyYes, IFNULL(i.primaryCBox_VerificationPPOPolicyNo, 0) AS primaryCBox_VerificationPPOPolicyNo, i.primaryVerificationAuthNumberTBox, IFNULL(i.primaryCBox_VerificationPriorAuthYes, 0) AS primaryCBox_VerificationPriorAuthYes, IFNULL(i.primaryCBox_VerificationPriorAuthNo, 0) AS primaryCBox_VerificationPriorAuthNo, i.primaryVerificationAuthPhoneNumberTBox, IFNULL(i.primaryCBox_VerificationLifetimeBenefitMetYes, 0) AS primaryCBox_VerificationLifetimeBenefitMetYes, IFNULL(i.primaryCBox_VerificationLifetimeBenefitMetNo, 0) AS primaryCBox_VerificationLifetimeBenefitMetNo, IFNULL(i.primaryCBox_MedicareSupplementYes, 0) AS primaryCBox_MedicareSupplementYes, IFNULL(i.primaryCBox_MedicareSupplementNo, 0) AS primaryCBox_MedicareSupplementNo, IFNULL(i.primaryCBox_CoordinateBenefitsYes, 0) AS primaryCBox_CoordinateBenefitsYes, IFNULL(i.primaryCBox_CoordinateBenefitsNo, 0) AS primaryCBox_CoordinateBenefitsNo, IFNULL(i.primaryCBox_PaidMedicareDeductibleYes, 0) AS primaryCBox_PaidMedicareDeductibleYes, IFNULL(i.primaryCBox_PaidMedicareDeductibleNo, 0) AS primaryCBox_PaidMedicareDeductibleNo, i.primaryVerificationTypeBasePlanTBox, IFNULL(i.primaryCBox_VerificationMedicaidPlanMQMB, 0) AS primaryCBox_VerificationMedicaidPlanMQMB, IFNULL(i.primaryCBox_VerificationMedicaidPlanQMB, 0) AS primaryCBox_VerificationMedicaidPlanQMB, IFNULL(i.primaryCBox_VerificationMedicaidPlanTraditional, 0) AS primaryCBox_VerificationMedicaidPlanTraditional, i.secondaryInsuranceNameTBox, i.secondaryPolicyNumberTBox, i.secondaryGroupNumberTBox, i.secondaryPhoneNumberTBox, i.secondaryEffectiveDateMM, i.secondaryEffectiveDateDD, i.secondaryEffectiveDateYY, i.secondaryPolicyHolderFNameTBox, i.secondaryPolicyHolderMInitialTBox, i.secondaryPolicyHolderLNameTBox, i.secondaryHoldersDOBMM, i.secondaryHoldersDOBDD, i.secondaryHoldersDOBYY, i.secondaryPolicyHolderEmployerTBox, i.secondaryNoteTBox, i.secondaryVerificationRepFNameTBox, i.secondaryVerificationRepLNameTBox, i.secondaryVerificationDateMM, i.secondaryVerificationDateDD, i.secondaryVerificationDateYY, i.secondaryVerificationTimeTBox, i.secondaryVerificationHaveInsFromMM, i.secondaryVerificationHaveInsFromDD, i.secondaryVerificationHaveInsFromYY, i.secondaryVerificationHaveInsToMM, i.secondaryVerificationHaveInsToDD, i.secondaryVerificationHaveInsToYY, IFNULL(i.secondaryCBox_VerificationHaveInsYes, 0) AS secondaryCBox_VerificationHaveInsYes, IFNULL(i.secondaryCBox_VerificationHaveInsNo, 0) AS secondaryCBox_VerificationHaveInsNo, IFNULL(i.secondaryCBox_VerificationHaveDMECovYes, 0) AS secondaryCBox_VerificationHaveDMECovYes, IFNULL(i.secondaryCBox_VerificationHaveDMECovNo, 0) AS secondaryCBox_VerificationHaveDMECovNo, IFNULL(i.secondaryCBox_VerificationDeductibleYes, 0) AS secondaryCBox_VerificationDeductibleYes, IFNULL(i.secondaryCBox_VerificationDeductibleNo, 0) AS secondaryCBox_VerificationDeductibleNo, i.secondaryVerificationDeductibleAmountTBox, i.secondaryVerificationDeductibleAmountMetTBox, i.secondaryVerificationPercentagePayAfterDeductibleTBox, IFNULL(i.secondaryCBox_VerificationPPOPolicyYes, 0) AS secondaryCBox_VerificationPPOPolicyYes, IFNULL(i.secondaryCBox_VerificationPPOPolicyNo, 0) AS secondaryCBox_VerificationPPOPolicyNo, i.secondaryVerificationAuthNumberTBox, IFNULL(i.secondaryCBox_VerificationPriorAuthYes, 0) AS secondaryCBox_VerificationPriorAuthYes, IFNULL(i.secondaryCBox_VerificationPriorAuthNo, 0) AS secondaryCBox_VerificationPriorAuthNo, i.secondaryVerificationAuthPhoneNumberTBox, IFNULL(i.secondaryCBox_VerificationLifetimeBenefitMetYes, 0) AS secondaryCBox_VerificationLifetimeBenefitMetYes, IFNULL(i.secondaryCBox_VerificationLifetimeBenefitMetNo, 0) AS secondaryCBox_VerificationLifetimeBenefitMetNo, IFNULL(i.secondaryCBox_MedicareSupplementYes, 0) AS secondaryCBox_MedicareSupplementYes, IFNULL(i.secondaryCBox_MedicareSupplementNo, 0) AS secondaryCBox_MedicareSupplementNo, IFNULL(i.secondaryCBox_CoordinateBenefitsYes, 0) AS secondaryCBox_CoordinateBenefitsYes, IFNULL(i.secondaryCBox_CoordinateBenefitsNo, 0) AS secondaryCBox_CoordinateBenefitsNo, IFNULL(i.secondaryCBox_PaidMedicareDeductibleYes, 0) AS secondaryCBox_PaidMedicareDeductibleYes, IFNULL(i.secondaryCBox_PaidMedicareDeductibleNo, 0) AS secondaryCBox_PaidMedicareDeductibleNo, i.secondaryVerificationTypeBasePlanTBox, IFNULL(i.secondaryCBox_VerificationMedicaidPlanMQMB, 0) AS secondaryCBox_VerificationMedicaidPlanMQMB, IFNULL(i.secondaryCBox_VerificationMedicaidPlanQMB, 0) AS secondaryCBox_VerificationMedicaidPlanQMB, IFNULL(i.secondaryCBox_VerificationMedicaidPlanTraditional, 0) AS secondaryCBox_VerificationMedicaidPlanTraditional, i.tertiaryInsuranceNameTBox, i.tertiaryPolicyNumberTBox, i.tertiaryGroupNumberTBox, i.tertiaryPhoneNumberTBox, i.tertiaryEffectiveDateMM, i.tertiaryEffectiveDateDD, i.tertiaryEffectiveDateYY, i.tertiaryPolicyHolderFNameTBox, i.tertiaryPolicyHolderMInitialTBox, i.tertiaryPolicyHolderLNameTBox, i.tertiaryHoldersDOBMM, i.tertiaryHoldersDOBDD, i.tertiaryHoldersDOBYY, i.tertiaryPolicyHolderEmployerTBox, i.tertiaryNoteTBox, i.tertiaryVerificationRepFNameTBox, i.tertiaryVerificationRepLNameTBox, i.tertiaryVerificationDateMM, i.tertiaryVerificationDateDD, i.tertiaryVerificationDateYY, i.tertiaryVerificationTimeTBox, i.tertiaryVerificationHaveInsFromMM, i.tertiaryVerificationHaveInsFromDD, i.tertiaryVerificationHaveInsFromYY, i.tertiaryVerificationHaveInsToMM, i.tertiaryVerificationHaveInsToDD, i.tertiaryVerificationHaveInsToYY, IFNULL(i.tertiaryCBox_VerificationHaveInsYes, 0) AS tertiaryCBox_VerificationHaveInsYes, IFNULL(i.tertiaryCBox_VerificationHaveInsNo, 0) AS tertiaryCBox_VerificationHaveInsNo, IFNULL(i.tertiaryCBox_VerificationHaveDMECovYes, 0) AS tertiaryCBox_VerificationHaveDMECovYes, IFNULL(i.tertiaryCBox_VerificationHaveDMECovNo, 0) AS tertiaryCBox_VerificationHaveDMECovNo, IFNULL(i.tertiaryCBox_VerificationDeductibleYes, 0) AS tertiaryCBox_VerificationDeductibleYes, IFNULL(i.tertiaryCBox_VerificationDeductibleNo, 0) AS tertiaryCBox_VerificationDeductibleNo, i.tertiaryVerificationDeductibleAmountTBox, i.tertiaryVerificationDeductibleAmountMetTBox, i.tertiaryVerificationPercentagePayAfterDeductibleTBox, IFNULL(i.tertiaryCBox_VerificationPPOPolicyYes, 0) AS tertiaryCBox_VerificationPPOPolicyYes, IFNULL(i.tertiaryCBox_VerificationPPOPolicyNo, 0) AS tertiaryCBox_VerificationPPOPolicyNo, i.tertiaryVerificationAuthNumberTBox, IFNULL(i.tertiaryCBox_VerificationPriorAuthYes, 0) AS tertiaryCBox_VerificationPriorAuthYes, IFNULL(i.tertiaryCBox_VerificationPriorAuthNo, 0) AS tertiaryCBox_VerificationPriorAuthNo, i.tertiaryVerificationAuthPhoneNumberTBox, IFNULL(i.tertiaryCBox_VerificationLifetimeBenefitMetYes, 0) AS tertiaryCBox_VerificationLifetimeBenefitMetYes, IFNULL(i.tertiaryCBox_VerificationLifetimeBenefitMetNo, 0) AS tertiaryCBox_VerificationLifetimeBenefitMetNo, IFNULL(i.tertiaryCBox_MedicareSupplementYes, 0) AS tertiaryCBox_MedicareSupplementYes, IFNULL(i.tertiaryCBox_MedicareSupplementNo, 0) AS tertiaryCBox_MedicareSupplementNo, IFNULL(i.tertiaryCBox_CoordinateBenefitsYes, 0) AS tertiaryCBox_CoordinateBenefitsYes, IFNULL(i.tertiaryCBox_CoordinateBenefitsNo, 0) AS tertiaryCBox_CoordinateBenefitsNo, IFNULL(i.tertiaryCBox_PaidMedicareDeductibleYes, 0) AS tertiaryCBox_PaidMedicareDeductibleYes, IFNULL(i.tertiaryCBox_PaidMedicareDeductibleNo, 0) AS tertiaryCBox_PaidMedicareDeductibleNo, i.tertiaryVerificationTypeBasePlanTBox, IFNULL(i.tertiaryCBox_VerificationMedicaidPlanMQMB, 0) AS tertiaryCBox_VerificationMedicaidPlanMQMB, IFNULL(i.tertiaryCBox_VerificationMedicaidPlanQMB, 0) AS tertiaryCBox_VerificationMedicaidPlanQMB, IFNULL(tertiaryCBox_VerificationMedicaidPlanTraditional, 0) AS tertiaryCBox_VerificationMedicaidPlanTraditional, i.primaryFaxNumberTBox, i.primarySendToAddress1TBox, i.primarySendToAddress2TBox, i.primarySendToCityTBox, i.primarySendToStateTBox, i.primarySendToZipCodeTBox, i.secondaryFaxNumberTBox, i.secondarySendToAddress1TBox, i.secondarySendToAddress2TBox, i.secondarySendToCityTBox, i.secondarySendToStateTBox, i.secondarySendToZipCodeTBox, i.tertiaryFaxNumberTBox, i.tertiarySendToAddress1TBox, i.tertiarySendToAddress2TBox, i.tertiarySendToCityTBox, i.tertiarySendToStateTBox, i.tertiarySendToZipCodeTBox, 
--->

<!---
,ih.hcpcCode1TBox, ih.hcpcQty1TBox, ih.hcpcProduct1TBox, ih.hcpcCost1TBox, ih.hcpcDX1TBox, ih.hcpcDiagnosis1TBox, ih.hcpcLengthOfNeedYear1TBox, ih.hcpcLengthOfNeedMonth1TBox, ih.hcpcCode2TBox, ih.hcpcQty2TBox, ih.hcpcProduct2TBox, ih.hcpcCost2TBox, ih.hcpcDX2TBox, ih.hcpcDiagnosis2TBox, ih.hcpcLengthOfNeedYear2TBox, ih.hcpcLengthOfNeedMonth2TBox, ih.hcpcCode3TBox, ih.hcpcQty3TBox, ih.hcpcProduct3TBox, ih.hcpcCost3TBox, ih.hcpcDX3TBox, ih.hcpcDiagnosis3TBox, ih.hcpcLengthOfNeedYear3TBox, ih.hcpcLengthOfNeedMonth3TBox, ih.hcpcCode4TBox, ih.hcpcQty4TBox, ih.hcpcProduct4TBox, ih.hcpcCost4TBox, ih.hcpcDX4TBox, ih.hcpcDiagnosis4TBox, ih.hcpcLengthOfNeedYear4TBox, ih.hcpcLengthOfNeedMonth4TBox, ih.hcpcCode5TBox, ih.hcpcQty5TBox, ih.hcpcProduct5TBox, ih.hcpcCost5TBox, ih.hcpcDX5TBox, ih.hcpcDiagnosis5TBox, ih.hcpcLengthOfNeedYear5TBox, ih.hcpcLengthOfNeedMonth5TBox, ih.hcpcCode6TBox, ih.hcpcQty6TBox, ih.hcpcProduct6TBox, ih.hcpcCost6TBox, ih.hcpcDX6TBox, ih.hcpcDiagnosis6TBox, ih.hcpcLengthOfNeedYear6TBox, ih.hcpcLengthOfNeedMonth6TBox, ih.hcpcCode7TBox, ih.hcpcQty7TBox, ih.hcpcProduct7TBox, ih.hcpcCost7TBox, ih.hcpcDX7TBox, ih.hcpcDiagnosis7TBox, ih.hcpcLengthOfNeedYear7TBox, ih.hcpcLengthOfNeedMonth7TBox, ih.hcpcCode8TBox, ih.hcpcQty8TBox, ih.hcpcProduct8TBox, ih.hcpcCost8TBox, ih.hcpcDX8TBox, ih.hcpcDiagnosis8TBox, ih.hcpcLengthOfNeedYear8TBox, ih.hcpcLengthOfNeedMonth8TBox, ih.hcpcCode9TBox, ih.hcpcQty9TBox, ih.hcpcProduct9TBox, ih.hcpcCost9TBox, ih.hcpcDX9TBox, ih.hcpcDiagnosis9TBox, ih.hcpcLengthOfNeedYear9TBox, ih.hcpcLengthOfNeedMonth9TBox, ih.hcpcCode10TBox, ih.hcpcQty10TBox, ih.hcpcProduct10TBox, ih.hcpcCost10TBox, ih.hcpcDX10TBox, ih.hcpcDiagnosis10TBox, ih.hcpcLengthOfNeedYear10TBox, ih.hcpcLengthOfNeedMonth10TBox, ih.hcpcCode11TBox, ih.hcpcQty11TBox, ih.hcpcProduct11TBox, ih.hcpcCost11TBox, ih.hcpcDX11TBox, ih.hcpcDiagnosis11TBox, ih.hcpcLengthOfNeedYear11TBox, ih.hcpcLengthOfNeedMonth11TBox, ih.hcpcCode12TBox, ih.hcpcQty12TBox, ih.hcpcProduct12TBox, ih.hcpcCost12TBox, ih.hcpcDX12TBox, ih.hcpcDiagnosis12TBox, ih.hcpcLengthOfNeedYear12TBox, ih.hcpcLengthOfNeedMonth12TBox, ih.hcpcCode13TBox, ih.hcpcQty13TBox, ih.hcpcProduct13TBox, ih.hcpcCost13TBox, ih.hcpcDX13TBox, ih.hcpcDiagnosis13TBox, ih.hcpcLengthOfNeedYear13TBox, ih.hcpcLengthOfNeedMonth13TBox, ih.hcpcCode14TBox, ih.hcpcQty14TBox, ih.hcpcProduct14TBox, ih.hcpcCost14TBox, ih.hcpcDX14TBox, ih.hcpcDiagnosis14TBox, ih.hcpcLengthOfNeedYear14TBox, ih.hcpcLengthOfNeedMonth14TBox, ih.hcpcCode15TBox, ih.hcpcQty15TBox, ih.hcpcProduct15TBox, ih.hcpcCost15TBox, ih.hcpcDX15TBox, ih.hcpcDiagnosis15TBox, ih.hcpcLengthOfNeedYear15TBox, ih.hcpcLengthOfNeedMonth15TBox, ih.hcpcCode16TBox, ih.hcpcQty16TBox, ih.hcpcProduct16TBox, ih.hcpcCost16TBox, ih.hcpcDX16TBox, ih.hcpcDiagnosis16TBox, ih.hcpcLengthOfNeedYear16TBox, ih.hcpcLengthOfNeedMonth16TBox, ih.hcpcCode17TBox, ih.hcpcQty17TBox, ih.hcpcProduct17TBox, ih.hcpcCost17TBox, ih.hcpcDX17TBox, ih.hcpcDiagnosis17TBox, ih.hcpcLengthOfNeedYear17TBox, ih.hcpcLengthOfNeedMonth17TBox, ih.hcpcCode18TBox, ih.hcpcQty18TBox, ih.hcpcProduct18TBox, ih.hcpcCost18TBox, ih.hcpcDX18TBox, ih.hcpcDiagnosis18TBox, ih.hcpcLengthOfNeedYear18TBox, ih.hcpcLengthOfNeedMonth18TBox, ih.hcpcCode19TBox, ih.hcpcQty19TBox, ih.hcpcProduct19TBox, ih.hcpcCost19TBox, ih.hcpcDX19TBox, ih.hcpcDiagnosis19TBox, ih.hcpcLengthOfNeedYear19TBox, ih.hcpcLengthOfNeedMonth19TBox, ih.hcpcCode20TBox, ih.hcpcQty20TBox, ih.hcpcProduct20TBox, ih.hcpcCost20TBox, ih.hcpcDX20TBox, ih.hcpcDiagnosis20TBox, ih.hcpcLengthOfNeedYear20TBox, ih.hcpcLengthOfNeedMonth20TBox, ih.hcpcCode21TBox, ih.hcpcQty21TBox, ih.hcpcProduct21TBox, ih.hcpcCost21TBox, ih.hcpcDX21TBox, ih.hcpcDiagnosis21TBox, ih.hcpcLengthOfNeedYear21TBox, ih.hcpcLengthOfNeedMonth21TBox, ih.hcpcCode22TBox, ih.hcpcQty22TBox, ih.hcpcProduct22TBox, ih.hcpcCost22TBox, ih.hcpcDX22TBox, ih.hcpcDiagnosis22TBox, ih.hcpcLengthOfNeedYear22TBox, ih.hcpcLengthOfNeedMonth22TBox, ih.hcpcCode23TBox, ih.hcpcQty23TBox, ih.hcpcProduct23TBox, ih.hcpcCost23TBox, ih.hcpcDX23TBox, ih.hcpcDiagnosis23TBox, ih.hcpcLengthOfNeedYear23TBox, ih.hcpcLengthOfNeedMonth23TBox, ih.hcpcCode24TBox, ih.hcpcQty24TBox, ih.hcpcProduct24TBox, ih.hcpcCost24TBox, ih.hcpcDX24TBox, ih.hcpcDiagnosis24TBox, ih.hcpcLengthOfNeedYear24TBox, ih.hcpcLengthOfNeedMonth24TBox, ih.hcpcCode25TBox, ih.hcpcQty25TBox, ih.hcpcProduct25TBox, ih.hcpcCost25TBox, ih.hcpcDX25TBox, ih.hcpcDiagnosis25TBox, ih.hcpcLengthOfNeedYear25TBox, ih.hcpcLengthOfNeedMonth25TBox, ih.hcpcCode26TBox, ih.hcpcQty26TBox, ih.hcpcProduct26TBox, ih.hcpcCost26TBox, ih.hcpcDX26TBox, ih.hcpcDiagnosis26TBox, ih.hcpcLengthOfNeedYear26TBox, ih.hcpcLengthOfNeedMonth26TBox, ih.hcpcCode27TBox, ih.hcpcQty27TBox, ih.hcpcProduct27TBox, ih.hcpcCost27TBox, ih.hcpcDX27TBox, ih.hcpcDiagnosis27TBox, ih.hcpcLengthOfNeedYear27TBox, ih.hcpcLengthOfNeedMonth27TBox, ih.hcpcCode28TBox, ih.hcpcQty28TBox, ih.hcpcProduct28TBox, ih.hcpcCost28TBox, ih.hcpcDX28TBox, ih.hcpcDiagnosis28TBox, ih.hcpcLengthOfNeedYear28TBox, ih.hcpcLengthOfNeedMonth28TBox, ih.hcpcCode29TBox, ih.hcpcQty29TBox, ih.hcpcProduct29TBox, ih.hcpcCost29TBox, ih.hcpcDX29TBox, ih.hcpcDiagnosis29TBox, ih.hcpcLengthOfNeedYear29TBox, ih.hcpcLengthOfNeedMonth29TBox, ih.hcpcCode30TBox, ih.hcpcQty30TBox, ih.hcpcProduct30TBox, ih.hcpcCost30TBox, ih.hcpcDX30TBox, ih.hcpcDiagnosis30TBox, ih.hcpcLengthOfNeedYear30TBox, ih.hcpcLengthOfNeedMonth30TBox, ih.hcpcCode31TBox, ih.hcpcQty31TBox, ih.hcpcProduct31TBox, ih.hcpcCost31TBox, ih.hcpcDX31TBox, ih.hcpcDiagnosis31TBox, ih.hcpcLengthOfNeedYear31TBox, ih.hcpcLengthOfNeedMonth31TBox, ih.hcpcCode32TBox, ih.hcpcQty32TBox, ih.hcpcProduct32TBox, ih.hcpcCost32TBox, ih.hcpcDX32TBox, ih.hcpcDiagnosis32TBox, ih.hcpcLengthOfNeedYear32TBox, ih.hcpcLengthOfNeedMonth32TBox, ih.hcpcCode33TBox, ih.hcpcQty33TBox, ih.hcpcProduct33TBox, ih.hcpcCost33TBox, ih.hcpcDX33TBox, ih.hcpcDiagnosis33TBox, ih.hcpcLengthOfNeedYear33TBox, ih.hcpcLengthOfNeedMonth33TBox, ih.hcpcCode34TBox, ih.hcpcQty34TBox, ih.hcpcProduct34TBox, ih.hcpcCost34TBox, ih.hcpcDX34TBox, ih.hcpcDiagnosis34TBox, ih.hcpcLengthOfNeedYear34TBox, ih.hcpcLengthOfNeedMonth34TBox, ih.hcpcCode35TBox, ih.hcpcQty35TBox, ih.hcpcProduct35TBox, ih.hcpcCost35TBox, ih.hcpcDX35TBox, ih.hcpcDiagnosis35TBox, ih.hcpcLengthOfNeedYear35TBox, ih.hcpcLengthOfNeedMonth35TBox, ih.hcpcCode36TBox, ih.hcpcQty36TBox, ih.hcpcProduct36TBox, ih.hcpcCost36TBox, ih.hcpcDX36TBox, ih.hcpcDiagnosis36TBox, ih.hcpcLengthOfNeedYear36TBox, ih.hcpcLengthOfNeedMonth36TBox, ih.hcpcCode37TBox, ih.hcpcQty37TBox, ih.hcpcProduct37TBox, ih.hcpcCost37TBox, ih.hcpcDX37TBox, ih.hcpcDiagnosis37TBox, ih.hcpcLengthOfNeedYear37TBox, ih.hcpcLengthOfNeedMonth37TBox, ih.hcpcCode38TBox, ih.hcpcQty38TBox, ih.hcpcProduct38TBox, ih.hcpcCost38TBox, ih.hcpcDX38TBox, ih.hcpcDiagnosis38TBox, ih.hcpcLengthOfNeedYear38TBox, ih.hcpcLengthOfNeedMonth38TBox, ih.hcpcCode39TBox, ih.hcpcQty39TBox, ih.hcpcProduct39TBox, ih.hcpcCost39TBox, ih.hcpcDX39TBox, ih.hcpcDiagnosis39TBox, ih.hcpcLengthOfNeedYear39TBox, ih.hcpcLengthOfNeedMonth39TBox, ih.hcpcCode40TBox, ih.hcpcQty40TBox, ih.hcpcProduct40TBox, ih.hcpcCost40TBox, ih.hcpcDX40TBox, ih.hcpcDiagnosis40TBox, ih.hcpcLengthOfNeedYear40TBox, ih.hcpcLengthOfNeedMonth40TBox		
	





<cfquery name="qGetIntake" datasource="#request.datasource#">
	  		SELECT IntakeID,ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,primaryGroupNumberTBox,secondaryGroupNumberTBox,primaryPhoneNumberTBox,secondaryPhoneNumberTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,Printed,Active,InactiveCode,DateCreated,DateModified,primaryInsuranceNameTBox, primaryPolicyNumberTBox, primaryGroupNumberTBox, primaryPhoneNumberTBox, primaryFaxNumberTBox, primarySendToAddress1TBox, primarySendToAddress2TBox, primarySendToCityTBox, primarySendToStateTBox, primarySendToZipCodeTBox, primaryEffectiveDateMM, primaryEffectiveDateDD, primaryEffectiveDateYY, primaryPolicyHolderFNameTBox, primaryPolicyHolderMInitialTBox, primaryPolicyHolderLNameTBox, primaryHoldersDOBMM, primaryHoldersDOBDD, primaryHoldersDOBYY, primaryPolicyHolderEmployerTBox, primaryNoteTBox, primaryVerificationRepFNameTBox, primaryVerificationRepLNameTBox, primaryVerificationDateMM, primaryVerificationDateDD, primaryVerificationDateYY, primaryVerificationTimeTBox, primaryVerificationHaveInsFromMM, primaryVerificationHaveInsFromDD, primaryVerificationHaveInsFromYY, primaryVerificationHaveInsToMM, primaryVerificationHaveInsToDD, primaryVerificationHaveInsToYY, primaryCBox_VerificationHaveInsYes, primaryCBox_VerificationHaveInsNo, primaryCBox_VerificationHaveDMECovYes, primaryCBox_VerificationHaveDMECovNo, primaryCBox_VerificationDeductibleYes, primaryCBox_VerificationDeductibleNo, primaryVerificationDeductibleAmountTBox, primaryVerificationDeductibleAmountMetTBox, primaryVerificationPercentagePayAfterDeductibleTBox, primaryCBox_VerificationPPOPolicyYes, primaryCBox_VerificationPPOPolicyNo, primaryVerificationAuthNumberTBox, primaryCBox_VerificationPriorAuthYes, primaryCBox_VerificationPriorAuthNo, primaryVerificationAuthPhoneNumberTBox, primaryCBox_VerificationLifetimeBenefitMetYes, primaryCBox_VerificationLifetimeBenefitMetNo, primaryCBox_MedicareSupplementYes, primaryCBox_MedicareSupplementNo, primaryCBox_CoordinateBenefitsYes, primaryCBox_CoordinateBenefitsNo, primaryCBox_PaidMedicareDeductibleYes, primaryCBox_PaidMedicareDeductibleNo, primaryVerificationTypeBasePlanTBox, primaryCBox_VerificationMedicaidPlanMQMB, primaryCBox_VerificationMedicaidPlanQMB, primaryCBox_VerificationMedicaidPlanTraditional, secondaryInsuranceNameTBox, secondaryPolicyNumberTBox, secondaryGroupNumberTBox, secondaryPhoneNumberTBox, secondaryFaxNumberTBox, secondarySendToAddress1TBox, secondarySendToAddress2TBox, secondarySendToCityTBox, secondarySendToStateTBox, secondarySendToZipCodeTBox, secondaryEffectiveDateMM, secondaryEffectiveDateDD, secondaryEffectiveDateYY, secondaryPolicyHolderFNameTBox, secondaryPolicyHolderMInitialTBox, secondaryPolicyHolderLNameTBox, secondaryHoldersDOBMM, secondaryHoldersDOBDD, secondaryHoldersDOBYY, secondaryPolicyHolderEmployerTBox, secondaryNoteTBox, secondaryVerificationRepFNameTBox, secondaryVerificationRepLNameTBox, secondaryVerificationDateMM, secondaryVerificationDateDD, secondaryVerificationDateYY, secondaryVerificationTimeTBox, secondaryVerificationHaveInsFromMM, secondaryVerificationHaveInsFromDD, secondaryVerificationHaveInsFromYY, secondaryVerificationHaveInsToMM, secondaryVerificationHaveInsToDD, secondaryVerificationHaveInsToYY, secondaryCBox_VerificationHaveInsYes, secondaryCBox_VerificationHaveInsNo, secondaryCBox_VerificationHaveDMECovYes, secondaryCBox_VerificationHaveDMECovNo, secondaryCBox_VerificationDeductibleYes, secondaryCBox_VerificationDeductibleNo, secondaryVerificationDeductibleAmountTBox, secondaryVerificationDeductibleAmountMetTBox, secondaryVerificationPercentagePayAfterDeductibleTBox, secondaryCBox_VerificationPPOPolicyYes, secondaryCBox_VerificationPPOPolicyNo, secondaryVerificationAuthNumberTBox, secondaryCBox_VerificationPriorAuthYes, secondaryCBox_VerificationPriorAuthNo, secondaryVerificationAuthPhoneNumberTBox, secondaryCBox_VerificationLifetimeBenefitMetYes, secondaryCBox_VerificationLifetimeBenefitMetNo, secondaryCBox_MedicareSupplementYes, secondaryCBox_MedicareSupplementNo, secondaryCBox_CoordinateBenefitsYes, secondaryCBox_CoordinateBenefitsNo, secondaryCBox_PaidMedicareDeductibleYes, secondaryCBox_PaidMedicareDeductibleNo, secondaryVerificationTypeBasePlanTBox, secondaryCBox_VerificationMedicaidPlanMQMB, secondaryCBox_VerificationMedicaidPlanQMB, secondaryCBox_VerificationMedicaidPlanTraditional, tertiaryInsuranceNameTBox, tertiaryPolicyNumberTBox, tertiaryGroupNumberTBox, tertiaryPhoneNumberTBox, tertiaryFaxNumberTBox, tertiarySendToAddress1TBox, tertiarySendToAddress2TBox, tertiarySendToCityTBox, tertiarySendToStateTBox, tertiarySendToZipCodeTBox, tertiaryEffectiveDateMM, tertiaryEffectiveDateDD, tertiaryEffectiveDateYY, tertiaryPolicyHolderFNameTBox, tertiaryPolicyHolderMInitialTBox, tertiaryPolicyHolderLNameTBox, tertiaryHoldersDOBMM, tertiaryHoldersDOBDD, tertiaryHoldersDOBYY, tertiaryPolicyHolderEmployerTBox, tertiaryNoteTBox, tertiaryVerificationRepFNameTBox, tertiaryVerificationRepLNameTBox, tertiaryVerificationDateMM, tertiaryVerificationDateDD, tertiaryVerificationDateYY, tertiaryVerificationTimeTBox, tertiaryVerificationHaveInsFromMM, tertiaryVerificationHaveInsFromDD, tertiaryVerificationHaveInsFromYY, tertiaryVerificationHaveInsToMM, tertiaryVerificationHaveInsToDD, tertiaryVerificationHaveInsToYY, tertiaryCBox_VerificationHaveInsYes, tertiaryCBox_VerificationHaveInsNo, tertiaryCBox_VerificationHaveDMECovYes, tertiaryCBox_VerificationHaveDMECovNo, tertiaryCBox_VerificationDeductibleYes, tertiaryCBox_VerificationDeductibleNo, tertiaryVerificationDeductibleAmountTBox, tertiaryVerificationDeductibleAmountMetTBox, tertiaryVerificationPercentagePayAfterDeductibleTBox, tertiaryCBox_VerificationPPOPolicyYes, tertiaryCBox_VerificationPPOPolicyNo, tertiaryVerificationAuthNumberTBox, tertiaryCBox_VerificationPriorAuthYes, tertiaryCBox_VerificationPriorAuthNo, tertiaryVerificationAuthPhoneNumberTBox, tertiaryCBox_VerificationLifetimeBenefitMetYes, tertiaryCBox_VerificationLifetimeBenefitMetNo, tertiaryCBox_MedicareSupplementYes, tertiaryCBox_MedicareSupplementNo, tertiaryCBox_CoordinateBenefitsYes, tertiaryCBox_CoordinateBenefitsNo, tertiaryCBox_PaidMedicareDeductibleYes, tertiaryCBox_PaidMedicareDeductibleNo, tertiaryVerificationTypeBasePlanTBox, tertiaryCBox_VerificationMedicaidPlanMQMB, tertiaryCBox_VerificationMedicaidPlanQMB, tertiaryCBox_VerificationMedicaidPlanTraditional
			FROM intake  
			WHERE IntakeID = #trim(arguments.IntakeID)# 
		</cfquery>
		
		
		
		<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="Intake" output="No">
		
		<cfargument name="IntakeID" required="yes" type="numeric">		
		<cfset var qGetIntake = "">
			
		<cfquery name="qGetIntake" datasource="#request.datasource#">
		SELECT i.IntakeID, i.ClientID, i.InactiveCode, i.printed, i.AssignedTouserID,i.DateCreated, i.hidden_Step, i.otherTBox, i.hidden_UsersID, i.hidden_TimeStart, IFNULL(i.OPTION_1_CBox_Delivery, 0) AS OPTION_1_CBox_Delivery, 	IFNULL(i.OPTION_1_CBox_Pickup, 0) AS OPTION_1_CBox_Pickup, IFNULL(i.OPTION_1_CBox_Repair, 0) AS OPTION_1_CBox_Repair, 	IFNULL(i.OPTION_1_CBox_Switch, 0) AS OPTION_1_CBox_Switch, IFNULL(i.OPTION_1_CBox_Existing, 0) AS OPTION_1_CBox_Existing, 	IFNULL(i.OPTION_2_CBox_Other, 0) AS OPTION_2_CBox_Other, IFNULL(i.OPTION_2_CBox_Hospice, 0) AS OPTION_2_CBox_Hospice, 	IFNULL(i.OPTION_2_CBox_Hospital, 0) AS OPTION_2_CBox_Hospital, i.hospiceTBox, IFNULL(i.OPTION_3_CBox_Medicare, 0) AS 	OPTION_3_CBox_Medicare, IFNULL(i.OPTION_3_CBox_PrivateInsurance, 0) AS OPTION_3_CBox_PrivateInsurance, IFNULL(i.OPTION_3_CBox_Medicaid, 	0) AS OPTION_3_CBox_Medicaid, IFNULL(i.OPTION_3_CBox_PrivatePay, 0) AS OPTION_3_CBox_PrivatePay, i.hospitalTBox, i.DischargeDateMM, 	i.DischargeDateDD, i.DischargeDateYY, i.typeOfPay_Radio, i.callerFNameTBox, i.callerMInitialTBox, i.callerLNameTBox, i.callerPhoneTBox, i.roomNumberTBox,  i.bedNumberTBox,i.alternateContactFNameTBox, i.alternateContactMInitialTBox, i.alternateContactLNameTBox, i.alternateContactRelationshipTBox, i.alternateContactPhoneTBox, i.alternateContactWorkPhoneTBox, i.poNumberTBox, i.creditCardTypeTBox, i.creditCardNumberTBox, i.ccDateMM, i.ccDateDD, i.ccDateYY, i.orderingPhysicianFNameTBox, i.orderingPhysicianMInitialTBox, i.orderingPhysicianLNameTBox, i.orderingPhysicianPhoneTBox, i.orderingPhysicianUPINTBox, i.orderingPhysicianFaxTBox, i.orderingPhysicianAddressTBox, i.orderingPhysicianCityTBox, i.orderingPhysicianStateTBox, i.orderingPhysicianZipTBox, IFNULL(i.OPTION_13_CBox_PastEquipmentYes, 0) AS OPTION_13_CBox_PastEquipmentYes, IFNULL(i.OPTION_13_CBox_PastEquipmentNo, 0) AS OPTION_13_CBox_PastEquipmentNo, i.Equipment1TypeTBox, i.Equipment1RentPurchasedSelect, i.Equipment1FromMM, i.Equipment1FromDD, i.Equipment1FromYY, i.Equipment1ToMM, i.Equipment1ToDD, i.Equipment1ToYY, i.Equipment1SupplierNameTBox, i.Equipment1SupplierTelephoneTBox, i.Equipment2TypeTBox, i.Equipment2RentPurchasedSelect, i.Equipment2FromMM, i.Equipment2FromDD, i.Equipment2FromYY, i.Equipment2ToMM, i.Equipment2ToDD, i.Equipment2ToYY, i.Equipment2SupplierNameTBox, i.Equipment2SupplierTelephoneTBox, 	i.Equipment3TypeTBox, i.Equipment3RentPurchasedSelect, i.Equipment3FromMM, i.Equipment3FromDD, i.Equipment3FromYY, i.Equipment3ToMM, i.Equipment3ToDD, i.Equipment3ToYY, i.Equipment3SupplierNameTBox, i.Equipment3SupplierTelephoneTBox, i.Equipment4TypeTBox, i.Equipment4RentPurchasedSelect, i.Equipment4FromMM, i.Equipment4FromDD, i.Equipment4FromYY, i.Equipment4ToMM, i.Equipment4ToDD, i.Equipment4ToYY, i.Equipment4SupplierNameTBox, i.Equipment4SupplierTelephoneTBox, i.Equipment5TypeTBox, i.Equipment5RentPurchasedSelect, i.Equipment5FromMM, i.Equipment5FromDD, i.Equipment5FromYY, i.Equipment5ToMM, i.Equipment5ToDD, i.Equipment5ToYY, i.Equipment5SupplierNameTBox, i.Equipment5SupplierTelephoneTBox, IFNULL(i.OPTION_14_CBox_OxygenPAo2, 0) AS OPTION_14_CBox_OxygenPAo2, IFNULL(i.OPTION_14_CBox_OxygenSAo2, 0) AS OPTION_14_CBox_OxygenSAo2, IFNULL(i.OPTION_14_CBox_OxygenSPo2, 0) AS OPTION_14_CBox_OxygenSPo2, i.OxygenPAO2TBox, i.OxygenSAO2TBox, IFNULL(i.CPAPStudy_CBox, 0) AS CPAPStudy_CBox, i.CPAPStudyNote, i.OxygenSPO2TBox, IFNULL(i.CPAPStudyOnFile_CBox, 0) AS CPAPStudyOnFile_CBox, i.CPAPStudyOnFileNote, i.LabTestDateMM, i.LabTestDateDD, i.LabTestDateYY, i.CPAPStudyPerformedAt, i.LabTestFacilityTBox, i.CPAPStudyPerformedAt2, i.CPAPStudyPerformedAt3, i.Equipment1NoteTBox, i.Equipment2NoteTBox, i.Equipment3NoteTBox, i.Equipment4NoteTBox, i.Equipment5NoteTBox, i.active, i.closingInvoiceNumber			
		FROM intake i 
		WHERE i.intakeID = #trim(arguments.intakeID)#		
		</cfquery>	<!---INNER JOIN intakehcpc ih ON i.intakeID = ih.IntakeID		--->
		
		<cfif qGetIntake.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			 
			IF(qGetIntake.ACTIVE EQ "" OR qGetIntake.ACTIVE EQ "NULL")
			variables.instance.ACTIVE = "NULL";
			ELSE
			variables.instance.ACTIVE = qGetIntake.ACTIVE;
			
			IF(qGetIntake.ALTERNATECONTACTFNAMETBOX EQ "" OR qGetIntake.ALTERNATECONTACTFNAMETBOX EQ "NULL")
			variables.instance.ALTERNATECONTACTFNAMETBOX = "NULL";
			ELSE
			variables.instance.ALTERNATECONTACTFNAMETBOX = qGetIntake.ALTERNATECONTACTFNAMETBOX;
			
			IF(qGetIntake.ALTERNATECONTACTLNAMETBOX EQ "" OR qGetIntake.ALTERNATECONTACTLNAMETBOX EQ "NULL")
			variables.instance.ALTERNATECONTACTLNAMETBOX = "NULL";
			ELSE
			variables.instance.ALTERNATECONTACTLNAMETBOX = qGetIntake.ALTERNATECONTACTLNAMETBOX;
			
			IF(qGetIntake.ALTERNATECONTACTMINITIALTBOX EQ "" OR qGetIntake.ALTERNATECONTACTMINITIALTBOX EQ "NULL")
			variables.instance.ALTERNATECONTACTMINITIALTBOX = "NULL";
			ELSE
			variables.instance.ALTERNATECONTACTMINITIALTBOX = qGetIntake.ALTERNATECONTACTMINITIALTBOX;
			
			IF(qGetIntake.ALTERNATECONTACTPHONETBOX EQ "" OR qGetIntake.ALTERNATECONTACTPHONETBOX EQ "NULL")
			variables.instance.ALTERNATECONTACTPHONETBOX = "NULL";
			ELSE
			variables.instance.ALTERNATECONTACTPHONETBOX = qGetIntake.ALTERNATECONTACTPHONETBOX;
			
			IF(qGetIntake.ALTERNATECONTACTRELATIONSHIPTBOX EQ "" OR qGetIntake.ALTERNATECONTACTRELATIONSHIPTBOX EQ "NULL")
			variables.instance.ALTERNATECONTACTRELATIONSHIPTBOX = "NULL";
			ELSE
			variables.instance.ALTERNATECONTACTRELATIONSHIPTBOX = qGetIntake.ALTERNATECONTACTRELATIONSHIPTBOX;
			
			IF(qGetIntake.ALTERNATECONTACTWORKPHONETBOX EQ "" OR qGetIntake.ALTERNATECONTACTWORKPHONETBOX EQ "NULL")
			variables.instance.ALTERNATECONTACTWORKPHONETBOX = "NULL";
			ELSE
			variables.instance.ALTERNATECONTACTWORKPHONETBOX = qGetIntake.ALTERNATECONTACTWORKPHONETBOX;
			
			IF(qGetIntake.ASSIGNEDTOUSERID EQ "" OR qGetIntake.ASSIGNEDTOUSERID EQ "NULL")
			variables.instance.ASSIGNEDTOUSERID = "NULL";
			ELSE
			variables.instance.ASSIGNEDTOUSERID = qGetIntake.ASSIGNEDTOUSERID;
			
			IF(qGetIntake.BEDNUMBERTBOX EQ "" OR qGetIntake.BEDNUMBERTBOX EQ "NULL")
			variables.instance.BEDNUMBERTBOX = "NULL";
			ELSE
			variables.instance.BEDNUMBERTBOX = qGetIntake.BEDNUMBERTBOX;
			
			IF(qGetIntake.CALLERFNAMETBOX EQ "" OR qGetIntake.CALLERFNAMETBOX EQ "NULL")
			variables.instance.CALLERFNAMETBOX = "NULL";
			ELSE
			variables.instance.CALLERFNAMETBOX = qGetIntake.CALLERFNAMETBOX;
			
			IF(qGetIntake.CALLERLNAMETBOX EQ "" OR qGetIntake.CALLERLNAMETBOX EQ "NULL")
			variables.instance.CALLERLNAMETBOX = "NULL";
			ELSE
			variables.instance.CALLERLNAMETBOX = qGetIntake.CALLERLNAMETBOX;
			
			IF(qGetIntake.CALLERMINITIALTBOX EQ "" OR qGetIntake.CALLERMINITIALTBOX EQ "NULL")
			variables.instance.CALLERMINITIALTBOX = "NULL";
			ELSE
			variables.instance.CALLERMINITIALTBOX = qGetIntake.CALLERMINITIALTBOX;
			
			IF(qGetIntake.CALLERPHONETBOX EQ "" OR qGetIntake.CALLERPHONETBOX EQ "NULL")
			variables.instance.CALLERPHONETBOX = "NULL";
			ELSE
			variables.instance.CALLERPHONETBOX = qGetIntake.CALLERPHONETBOX;
			
			IF(qGetIntake.CCDATEDD EQ "" OR qGetIntake.CCDATEDD EQ "NULL")
			variables.instance.CCDATEDD = "NULL";
			ELSE
			variables.instance.CCDATEDD = qGetIntake.CCDATEDD;
			
			IF(qGetIntake.CCDATEMM EQ "" OR qGetIntake.CCDATEMM EQ "NULL")
			variables.instance.CCDATEMM = "NULL";
			ELSE
			variables.instance.CCDATEMM = qGetIntake.CCDATEMM;
			
			IF(qGetIntake.CCDATEYY EQ "" OR qGetIntake.CCDATEYY EQ "NULL")
			variables.instance.CCDATEYY = "NULL";
			ELSE
			variables.instance.CCDATEYY = qGetIntake.CCDATEYY;
			
			IF(qGetIntake.CLIENTID EQ "" OR qGetIntake.CLIENTID EQ "NULL")
			variables.instance.CLIENTID = "NULL";
			ELSE
			variables.instance.CLIENTID = qGetIntake.CLIENTID;
			
			IF(qGetIntake.CLOSINGINVOICENUMBER EQ "" OR qGetIntake.CLOSINGINVOICENUMBER EQ "NULL")
			variables.instance.CLOSINGINVOICENUMBER = "NULL";
			ELSE
			variables.instance.CLOSINGINVOICENUMBER = qGetIntake.CLOSINGINVOICENUMBER;
			
			IF(qGetIntake.CPAPSTUDYNOTE EQ "" OR qGetIntake.CPAPSTUDYNOTE EQ "NULL")
			variables.instance.CPAPSTUDYNOTE = "NULL";
			ELSE
			variables.instance.CPAPSTUDYNOTE = qGetIntake.CPAPSTUDYNOTE;
			
			IF(qGetIntake.CPAPSTUDYONFILENOTE EQ "" OR qGetIntake.CPAPSTUDYONFILENOTE EQ "NULL")
			variables.instance.CPAPSTUDYONFILENOTE = "NULL";
			ELSE
			variables.instance.CPAPSTUDYONFILENOTE = qGetIntake.CPAPSTUDYONFILENOTE;
			
			IF(qGetIntake.CPAPSTUDYONFILE_CBOX EQ "" OR qGetIntake.CPAPSTUDYONFILE_CBOX EQ "NULL")
			variables.instance.CPAPSTUDYONFILE_CBOX = "NULL";
			ELSE
			variables.instance.CPAPSTUDYONFILE_CBOX = qGetIntake.CPAPSTUDYONFILE_CBOX;
			
			IF(qGetIntake.CPAPSTUDYPERFORMEDAT EQ "" OR qGetIntake.CPAPSTUDYPERFORMEDAT EQ "NULL")
			variables.instance.CPAPSTUDYPERFORMEDAT = "NULL";
			ELSE
			variables.instance.CPAPSTUDYPERFORMEDAT = qGetIntake.CPAPSTUDYPERFORMEDAT;
			
			IF(qGetIntake.CPAPSTUDYPERFORMEDAT2 EQ "" OR qGetIntake.CPAPSTUDYPERFORMEDAT2 EQ "NULL")
			variables.instance.CPAPSTUDYPERFORMEDAT2 = "NULL";
			ELSE
			variables.instance.CPAPSTUDYPERFORMEDAT2 = qGetIntake.CPAPSTUDYPERFORMEDAT2;
			
			IF(qGetIntake.CPAPSTUDYPERFORMEDAT3 EQ "" OR qGetIntake.CPAPSTUDYPERFORMEDAT3 EQ "NULL")
			variables.instance.CPAPSTUDYPERFORMEDAT3 = "NULL";
			ELSE
			variables.instance.CPAPSTUDYPERFORMEDAT3 = qGetIntake.CPAPSTUDYPERFORMEDAT3;
			
			IF(qGetIntake.CPAPSTUDY_CBOX EQ "" OR qGetIntake.CPAPSTUDY_CBOX EQ "NULL")
			variables.instance.CPAPSTUDY_CBOX = "NULL";
			ELSE
			variables.instance.CPAPSTUDY_CBOX = qGetIntake.CPAPSTUDY_CBOX;
			
			IF(qGetIntake.CREDITCARDNUMBERTBOX EQ "" OR qGetIntake.CREDITCARDNUMBERTBOX EQ "NULL")
			variables.instance.CREDITCARDNUMBERTBOX = "NULL";
			ELSE
			variables.instance.CREDITCARDNUMBERTBOX = qGetIntake.CREDITCARDNUMBERTBOX;
			
			IF(qGetIntake.CREDITCARDTYPETBOX EQ "" OR qGetIntake.CREDITCARDTYPETBOX EQ "NULL")
			variables.instance.CREDITCARDTYPETBOX = "NULL";
			ELSE
			variables.instance.CREDITCARDTYPETBOX = qGetIntake.CREDITCARDTYPETBOX;
			
			IF(qGetIntake.DATECREATED EQ "" OR qGetIntake.DATECREATED EQ "NULL")
			variables.instance.DATECREATED = "NULL";
			ELSE
			variables.instance.DATECREATED = qGetIntake.DATECREATED;
			
			IF(qGetIntake.DISCHARGEDATEDD EQ "" OR qGetIntake.DISCHARGEDATEDD EQ "NULL")
			variables.instance.DISCHARGEDATEDD = "NULL";
			ELSE
			variables.instance.DISCHARGEDATEDD = qGetIntake.DISCHARGEDATEDD;
			
			IF(qGetIntake.DISCHARGEDATEMM EQ "" OR qGetIntake.DISCHARGEDATEMM EQ "NULL")
			variables.instance.DISCHARGEDATEMM = "NULL";
			ELSE
			variables.instance.DISCHARGEDATEMM = qGetIntake.DISCHARGEDATEMM;
			
			IF(qGetIntake.DISCHARGEDATEYY EQ "" OR qGetIntake.DISCHARGEDATEYY EQ "NULL")
			variables.instance.DISCHARGEDATEYY = "NULL";
			ELSE
			variables.instance.DISCHARGEDATEYY = qGetIntake.DISCHARGEDATEYY;
			
			IF(qGetIntake.EQUIPMENT1FROMDD EQ "" OR qGetIntake.EQUIPMENT1FROMDD EQ "NULL")
			variables.instance.EQUIPMENT1FROMDD = "NULL";
			ELSE
			variables.instance.EQUIPMENT1FROMDD = qGetIntake.EQUIPMENT1FROMDD;
			
			IF(qGetIntake.EQUIPMENT1FROMMM EQ "" OR qGetIntake.EQUIPMENT1FROMMM EQ "NULL")
			variables.instance.EQUIPMENT1FROMMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT1FROMMM = qGetIntake.EQUIPMENT1FROMMM;
			
			IF(qGetIntake.EQUIPMENT1FROMYY EQ "" OR qGetIntake.EQUIPMENT1FROMYY EQ "NULL")
			variables.instance.EQUIPMENT1FROMYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT1FROMYY = qGetIntake.EQUIPMENT1FROMYY;
			
			IF(qGetIntake.EQUIPMENT1NOTETBOX EQ "" OR qGetIntake.EQUIPMENT1NOTETBOX EQ "NULL")
			variables.instance.EQUIPMENT1NOTETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT1NOTETBOX = qGetIntake.EQUIPMENT1NOTETBOX;
			
			IF(qGetIntake.EQUIPMENT1RENTPURCHASEDSELECT EQ "" OR qGetIntake.EQUIPMENT1RENTPURCHASEDSELECT EQ "NULL")
			variables.instance.EQUIPMENT1RENTPURCHASEDSELECT = "NULL";
			ELSE
			variables.instance.EQUIPMENT1RENTPURCHASEDSELECT = qGetIntake.EQUIPMENT1RENTPURCHASEDSELECT;
			
			IF(qGetIntake.EQUIPMENT1SUPPLIERNAMETBOX EQ "" OR qGetIntake.EQUIPMENT1SUPPLIERNAMETBOX EQ "NULL")
			variables.instance.EQUIPMENT1SUPPLIERNAMETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT1SUPPLIERNAMETBOX = qGetIntake.EQUIPMENT1SUPPLIERNAMETBOX;
			
			IF(qGetIntake.EQUIPMENT1SUPPLIERTELEPHONETBOX EQ "" OR qGetIntake.EQUIPMENT1SUPPLIERTELEPHONETBOX EQ "NULL")
			variables.instance.EQUIPMENT1SUPPLIERTELEPHONETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT1SUPPLIERTELEPHONETBOX = qGetIntake.EQUIPMENT1SUPPLIERTELEPHONETBOX;
			
			IF(qGetIntake.EQUIPMENT1TODD EQ "" OR qGetIntake.EQUIPMENT1TODD EQ "NULL")
			variables.instance.EQUIPMENT1TODD = "NULL";
			ELSE
			variables.instance.EQUIPMENT1TODD = qGetIntake.EQUIPMENT1TODD;
			
			IF(qGetIntake.EQUIPMENT1TOMM EQ "" OR qGetIntake.EQUIPMENT1TOMM EQ "NULL")
			variables.instance.EQUIPMENT1TOMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT1TOMM = qGetIntake.EQUIPMENT1TOMM;
			
			IF(qGetIntake.EQUIPMENT1TOYY EQ "" OR qGetIntake.EQUIPMENT1TOYY EQ "NULL")
			variables.instance.EQUIPMENT1TOYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT1TOYY = qGetIntake.EQUIPMENT1TOYY;
			
			IF(qGetIntake.EQUIPMENT1TYPETBOX EQ "" OR qGetIntake.EQUIPMENT1TYPETBOX EQ "NULL")
			variables.instance.EQUIPMENT1TYPETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT1TYPETBOX = qGetIntake.EQUIPMENT1TYPETBOX;
			
			IF(qGetIntake.EQUIPMENT2FROMDD EQ "" OR qGetIntake.EQUIPMENT2FROMDD EQ "NULL")
			variables.instance.EQUIPMENT2FROMDD = "NULL";
			ELSE
			variables.instance.EQUIPMENT2FROMDD = qGetIntake.EQUIPMENT2FROMDD;
			
			IF(qGetIntake.EQUIPMENT2FROMMM EQ "" OR qGetIntake.EQUIPMENT2FROMMM EQ "NULL")
			variables.instance.EQUIPMENT2FROMMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT2FROMMM = qGetIntake.EQUIPMENT2FROMMM;
			
			IF(qGetIntake.EQUIPMENT2FROMYY EQ "" OR qGetIntake.EQUIPMENT2FROMYY EQ "NULL")
			variables.instance.EQUIPMENT2FROMYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT2FROMYY = qGetIntake.EQUIPMENT2FROMYY;
			
			IF(qGetIntake.EQUIPMENT2NOTETBOX EQ "" OR qGetIntake.EQUIPMENT2NOTETBOX EQ "NULL")
			variables.instance.EQUIPMENT2NOTETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT2NOTETBOX = qGetIntake.EQUIPMENT2NOTETBOX;
			
			IF(qGetIntake.EQUIPMENT2RENTPURCHASEDSELECT EQ "" OR qGetIntake.EQUIPMENT2RENTPURCHASEDSELECT EQ "NULL")
			variables.instance.EQUIPMENT2RENTPURCHASEDSELECT = "NULL";
			ELSE
			variables.instance.EQUIPMENT2RENTPURCHASEDSELECT = qGetIntake.EQUIPMENT2RENTPURCHASEDSELECT;
			
			IF(qGetIntake.EQUIPMENT2SUPPLIERNAMETBOX EQ "" OR qGetIntake.EQUIPMENT2SUPPLIERNAMETBOX EQ "NULL")
			variables.instance.EQUIPMENT2SUPPLIERNAMETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT2SUPPLIERNAMETBOX = qGetIntake.EQUIPMENT2SUPPLIERNAMETBOX;
			
			IF(qGetIntake.EQUIPMENT2SUPPLIERTELEPHONETBOX EQ "" OR qGetIntake.EQUIPMENT2SUPPLIERTELEPHONETBOX EQ "NULL")
			variables.instance.EQUIPMENT2SUPPLIERTELEPHONETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT2SUPPLIERTELEPHONETBOX = qGetIntake.EQUIPMENT2SUPPLIERTELEPHONETBOX;
			
			IF(qGetIntake.EQUIPMENT2TODD EQ "" OR qGetIntake.EQUIPMENT2TODD EQ "NULL")
			variables.instance.EQUIPMENT2TODD = "NULL";
			ELSE
			variables.instance.EQUIPMENT2TODD = qGetIntake.EQUIPMENT2TODD;
			
			IF(qGetIntake.EQUIPMENT2TOMM EQ "" OR qGetIntake.EQUIPMENT2TOMM EQ "NULL")
			variables.instance.EQUIPMENT2TOMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT2TOMM = qGetIntake.EQUIPMENT2TOMM;
			
			IF(qGetIntake.EQUIPMENT2TOYY EQ "" OR qGetIntake.EQUIPMENT2TOYY EQ "NULL")
			variables.instance.EQUIPMENT2TOYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT2TOYY = qGetIntake.EQUIPMENT2TOYY;
			
			IF(qGetIntake.EQUIPMENT2TYPETBOX EQ "" OR qGetIntake.EQUIPMENT2TYPETBOX EQ "NULL")
			variables.instance.EQUIPMENT2TYPETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT2TYPETBOX = qGetIntake.EQUIPMENT2TYPETBOX;
			
			IF(qGetIntake.EQUIPMENT3FROMDD EQ "" OR qGetIntake.EQUIPMENT3FROMDD EQ "NULL")
			variables.instance.EQUIPMENT3FROMDD = "NULL";
			ELSE
			variables.instance.EQUIPMENT3FROMDD = qGetIntake.EQUIPMENT3FROMDD;
			
			IF(qGetIntake.EQUIPMENT3FROMMM EQ "" OR qGetIntake.EQUIPMENT3FROMMM EQ "NULL")
			variables.instance.EQUIPMENT3FROMMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT3FROMMM = qGetIntake.EQUIPMENT3FROMMM;
			
			IF(qGetIntake.EQUIPMENT3FROMYY EQ "" OR qGetIntake.EQUIPMENT3FROMYY EQ "NULL")
			variables.instance.EQUIPMENT3FROMYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT3FROMYY = qGetIntake.EQUIPMENT3FROMYY;
			
			IF(qGetIntake.EQUIPMENT3NOTETBOX EQ "" OR qGetIntake.EQUIPMENT3NOTETBOX EQ "NULL")
			variables.instance.EQUIPMENT3NOTETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT3NOTETBOX = qGetIntake.EQUIPMENT3NOTETBOX;
			
			IF(qGetIntake.EQUIPMENT3RENTPURCHASEDSELECT EQ "" OR qGetIntake.EQUIPMENT3RENTPURCHASEDSELECT EQ "NULL")
			variables.instance.EQUIPMENT3RENTPURCHASEDSELECT = "NULL";
			ELSE
			variables.instance.EQUIPMENT3RENTPURCHASEDSELECT = qGetIntake.EQUIPMENT3RENTPURCHASEDSELECT;
			
			IF(qGetIntake.EQUIPMENT3SUPPLIERNAMETBOX EQ "" OR qGetIntake.EQUIPMENT3SUPPLIERNAMETBOX EQ "NULL")
			variables.instance.EQUIPMENT3SUPPLIERNAMETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT3SUPPLIERNAMETBOX = qGetIntake.EQUIPMENT3SUPPLIERNAMETBOX;
			
			IF(qGetIntake.EQUIPMENT3SUPPLIERTELEPHONETBOX EQ "" OR qGetIntake.EQUIPMENT3SUPPLIERTELEPHONETBOX EQ "NULL")
			variables.instance.EQUIPMENT3SUPPLIERTELEPHONETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT3SUPPLIERTELEPHONETBOX = qGetIntake.EQUIPMENT3SUPPLIERTELEPHONETBOX;
			
			IF(qGetIntake.EQUIPMENT3TODD EQ "" OR qGetIntake.EQUIPMENT3TODD EQ "NULL")
			variables.instance.EQUIPMENT3TODD = "NULL";
			ELSE
			variables.instance.EQUIPMENT3TODD = qGetIntake.EQUIPMENT3TODD;
			
			IF(qGetIntake.EQUIPMENT3TOMM EQ "" OR qGetIntake.EQUIPMENT3TOMM EQ "NULL")
			variables.instance.EQUIPMENT3TOMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT3TOMM = qGetIntake.EQUIPMENT3TOMM;
			
			IF(qGetIntake.EQUIPMENT3TOYY EQ "" OR qGetIntake.EQUIPMENT3TOYY EQ "NULL")
			variables.instance.EQUIPMENT3TOYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT3TOYY = qGetIntake.EQUIPMENT3TOYY;
			
			IF(qGetIntake.EQUIPMENT3TYPETBOX EQ "" OR qGetIntake.EQUIPMENT3TYPETBOX EQ "NULL")
			variables.instance.EQUIPMENT3TYPETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT3TYPETBOX = qGetIntake.EQUIPMENT3TYPETBOX;
			
			IF(qGetIntake.EQUIPMENT4FROMDD EQ "" OR qGetIntake.EQUIPMENT4FROMDD EQ "NULL")
			variables.instance.EQUIPMENT4FROMDD = "NULL";
			ELSE
			variables.instance.EQUIPMENT4FROMDD = qGetIntake.EQUIPMENT4FROMDD;
			
			IF(qGetIntake.EQUIPMENT4FROMMM EQ "" OR qGetIntake.EQUIPMENT4FROMMM EQ "NULL")
			variables.instance.EQUIPMENT4FROMMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT4FROMMM = qGetIntake.EQUIPMENT4FROMMM;
			
			IF(qGetIntake.EQUIPMENT4FROMYY EQ "" OR qGetIntake.EQUIPMENT4FROMYY EQ "NULL")
			variables.instance.EQUIPMENT4FROMYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT4FROMYY = qGetIntake.EQUIPMENT4FROMYY;
			
			IF(qGetIntake.EQUIPMENT4NOTETBOX EQ "" OR qGetIntake.EQUIPMENT4NOTETBOX EQ "NULL")
			variables.instance.EQUIPMENT4NOTETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT4NOTETBOX = qGetIntake.EQUIPMENT4NOTETBOX;
			
			IF(qGetIntake.EQUIPMENT4RENTPURCHASEDSELECT EQ "" OR qGetIntake.EQUIPMENT4RENTPURCHASEDSELECT EQ "NULL")
			variables.instance.EQUIPMENT4RENTPURCHASEDSELECT = "NULL";
			ELSE
			variables.instance.EQUIPMENT4RENTPURCHASEDSELECT = qGetIntake.EQUIPMENT4RENTPURCHASEDSELECT;
			
			IF(qGetIntake.EQUIPMENT4SUPPLIERNAMETBOX EQ "" OR qGetIntake.EQUIPMENT4SUPPLIERNAMETBOX EQ "NULL")
			variables.instance.EQUIPMENT4SUPPLIERNAMETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT4SUPPLIERNAMETBOX = qGetIntake.EQUIPMENT4SUPPLIERNAMETBOX;
			
			IF(qGetIntake.EQUIPMENT4SUPPLIERTELEPHONETBOX EQ "" OR qGetIntake.EQUIPMENT4SUPPLIERTELEPHONETBOX EQ "NULL")
			variables.instance.EQUIPMENT4SUPPLIERTELEPHONETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT4SUPPLIERTELEPHONETBOX = qGetIntake.EQUIPMENT4SUPPLIERTELEPHONETBOX;
			
			IF(qGetIntake.EQUIPMENT4TODD EQ "" OR qGetIntake.EQUIPMENT4TODD EQ "NULL")
			variables.instance.EQUIPMENT4TODD = "NULL";
			ELSE
			variables.instance.EQUIPMENT4TODD = qGetIntake.EQUIPMENT4TODD;
			
			IF(qGetIntake.EQUIPMENT4TOMM EQ "" OR qGetIntake.EQUIPMENT4TOMM EQ "NULL")
			variables.instance.EQUIPMENT4TOMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT4TOMM = qGetIntake.EQUIPMENT4TOMM;
			
			IF(qGetIntake.EQUIPMENT4TOYY EQ "" OR qGetIntake.EQUIPMENT4TOYY EQ "NULL")
			variables.instance.EQUIPMENT4TOYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT4TOYY = qGetIntake.EQUIPMENT4TOYY;
			
			IF(qGetIntake.EQUIPMENT4TYPETBOX EQ "" OR qGetIntake.EQUIPMENT4TYPETBOX EQ "NULL")
			variables.instance.EQUIPMENT4TYPETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT4TYPETBOX = qGetIntake.EQUIPMENT4TYPETBOX;
			
			IF(qGetIntake.EQUIPMENT5FROMDD EQ "" OR qGetIntake.EQUIPMENT5FROMDD EQ "NULL")
			variables.instance.EQUIPMENT5FROMDD = "NULL";
			ELSE
			variables.instance.EQUIPMENT5FROMDD = qGetIntake.EQUIPMENT5FROMDD;
			
			IF(qGetIntake.EQUIPMENT5FROMMM EQ "" OR qGetIntake.EQUIPMENT5FROMMM EQ "NULL")
			variables.instance.EQUIPMENT5FROMMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT5FROMMM = qGetIntake.EQUIPMENT5FROMMM;
			
			IF(qGetIntake.EQUIPMENT5FROMYY EQ "" OR qGetIntake.EQUIPMENT5FROMYY EQ "NULL")
			variables.instance.EQUIPMENT5FROMYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT5FROMYY = qGetIntake.EQUIPMENT5FROMYY;
			
			IF(qGetIntake.EQUIPMENT5NOTETBOX EQ "" OR qGetIntake.EQUIPMENT5NOTETBOX EQ "NULL")
			variables.instance.EQUIPMENT5NOTETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT5NOTETBOX = qGetIntake.EQUIPMENT5NOTETBOX;
			
			IF(qGetIntake.EQUIPMENT5RENTPURCHASEDSELECT EQ "" OR qGetIntake.EQUIPMENT5RENTPURCHASEDSELECT EQ "NULL")
			variables.instance.EQUIPMENT5RENTPURCHASEDSELECT = "NULL";
			ELSE
			variables.instance.EQUIPMENT5RENTPURCHASEDSELECT = qGetIntake.EQUIPMENT5RENTPURCHASEDSELECT;
			
			IF(qGetIntake.EQUIPMENT5SUPPLIERNAMETBOX EQ "" OR qGetIntake.EQUIPMENT5SUPPLIERNAMETBOX EQ "NULL")
			variables.instance.EQUIPMENT5SUPPLIERNAMETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT5SUPPLIERNAMETBOX = qGetIntake.EQUIPMENT5SUPPLIERNAMETBOX;
			
			IF(qGetIntake.EQUIPMENT5SUPPLIERTELEPHONETBOX EQ "" OR qGetIntake.EQUIPMENT5SUPPLIERTELEPHONETBOX EQ "NULL")
			variables.instance.EQUIPMENT5SUPPLIERTELEPHONETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT5SUPPLIERTELEPHONETBOX = qGetIntake.EQUIPMENT5SUPPLIERTELEPHONETBOX;
			
			IF(qGetIntake.EQUIPMENT5TODD EQ "" OR qGetIntake.EQUIPMENT5TODD EQ "NULL")
			variables.instance.EQUIPMENT5TODD = "NULL";
			ELSE
			variables.instance.EQUIPMENT5TODD = qGetIntake.EQUIPMENT5TODD;
			
			IF(qGetIntake.EQUIPMENT5TOMM EQ "" OR qGetIntake.EQUIPMENT5TOMM EQ "NULL")
			variables.instance.EQUIPMENT5TOMM = "NULL";
			ELSE
			variables.instance.EQUIPMENT5TOMM = qGetIntake.EQUIPMENT5TOMM;
			
			IF(qGetIntake.EQUIPMENT5TOYY EQ "" OR qGetIntake.EQUIPMENT5TOYY EQ "NULL")
			variables.instance.EQUIPMENT5TOYY = "NULL";
			ELSE
			variables.instance.EQUIPMENT5TOYY = qGetIntake.EQUIPMENT5TOYY;
			
			IF(qGetIntake.EQUIPMENT5TYPETBOX EQ "" OR qGetIntake.EQUIPMENT5TYPETBOX EQ "NULL")
			variables.instance.EQUIPMENT5TYPETBOX = "NULL";
			ELSE
			variables.instance.EQUIPMENT5TYPETBOX = qGetIntake.EQUIPMENT5TYPETBOX;
			
			IF(qGetIntake.HIDDEN_STEP EQ "" OR qGetIntake.HIDDEN_STEP EQ "NULL")
			variables.instance.HIDDEN_STEP = "NULL";
			ELSE
			variables.instance.HIDDEN_STEP = qGetIntake.HIDDEN_STEP;
			
			IF(qGetIntake.HIDDEN_TIMESTART EQ "" OR qGetIntake.HIDDEN_TIMESTART EQ "NULL")
			variables.instance.HIDDEN_TIMESTART = "NULL";
			ELSE
			variables.instance.HIDDEN_TIMESTART = qGetIntake.HIDDEN_TIMESTART;
			
			IF(qGetIntake.HIDDEN_USERSID EQ "" OR qGetIntake.HIDDEN_USERSID EQ "NULL")
			variables.instance.HIDDEN_USERSID = "NULL";
			ELSE
			variables.instance.HIDDEN_USERSID = qGetIntake.HIDDEN_USERSID;
			
			IF(qGetIntake.HOSPICETBOX EQ "" OR qGetIntake.HOSPICETBOX EQ "NULL")
			variables.instance.HOSPICETBOX = "NULL";
			ELSE
			variables.instance.HOSPICETBOX = qGetIntake.HOSPICETBOX;
			
			IF(qGetIntake.HOSPITALTBOX EQ "" OR qGetIntake.HOSPITALTBOX EQ "NULL")
			variables.instance.HOSPITALTBOX = "NULL";
			ELSE
			variables.instance.HOSPITALTBOX = qGetIntake.HOSPITALTBOX;
			
			IF(qGetIntake.INACTIVECODE EQ "" OR qGetIntake.INACTIVECODE EQ "NULL")
			variables.instance.INACTIVECODE = "NULL";
			ELSE
			variables.instance.INACTIVECODE = qGetIntake.INACTIVECODE;
			
			IF(qGetIntake.INTAKEID EQ "" OR qGetIntake.INTAKEID EQ "NULL")
			variables.instance.INTAKEID = "NULL";
			ELSE
			variables.instance.INTAKEID = qGetIntake.INTAKEID;
			
			IF(qGetIntake.LABTESTDATEDD EQ "" OR qGetIntake.LABTESTDATEDD EQ "NULL")
			variables.instance.LABTESTDATEDD = "NULL";
			ELSE
			variables.instance.LABTESTDATEDD = qGetIntake.LABTESTDATEDD;
			
			IF(qGetIntake.LABTESTDATEMM EQ "" OR qGetIntake.LABTESTDATEMM EQ "NULL")
			variables.instance.LABTESTDATEMM = "NULL";
			ELSE
			variables.instance.LABTESTDATEMM = qGetIntake.LABTESTDATEMM;
			
			IF(qGetIntake.LABTESTDATEYY EQ "" OR qGetIntake.LABTESTDATEYY EQ "NULL")
			variables.instance.LABTESTDATEYY = "NULL";
			ELSE
			variables.instance.LABTESTDATEYY = qGetIntake.LABTESTDATEYY;
			
			IF(qGetIntake.LABTESTFACILITYTBOX EQ "" OR qGetIntake.LABTESTFACILITYTBOX EQ "NULL")
			variables.instance.LABTESTFACILITYTBOX = "NULL";
			ELSE
			variables.instance.LABTESTFACILITYTBOX = qGetIntake.LABTESTFACILITYTBOX;
			
			IF(qGetIntake.OPTION_13_CBOX_PASTEQUIPMENTNO EQ "" OR qGetIntake.OPTION_13_CBOX_PASTEQUIPMENTNO EQ "NULL")
			variables.instance.OPTION_13_CBOX_PASTEQUIPMENTNO = "NULL";
			ELSE
			variables.instance.OPTION_13_CBOX_PASTEQUIPMENTNO = qGetIntake.OPTION_13_CBOX_PASTEQUIPMENTNO;
			
			IF(qGetIntake.OPTION_13_CBOX_PASTEQUIPMENTYES EQ "" OR qGetIntake.OPTION_13_CBOX_PASTEQUIPMENTYES EQ "NULL")
			variables.instance.OPTION_13_CBOX_PASTEQUIPMENTYES = "NULL";
			ELSE
			variables.instance.OPTION_13_CBOX_PASTEQUIPMENTYES = qGetIntake.OPTION_13_CBOX_PASTEQUIPMENTYES;
			
			IF(qGetIntake.OPTION_14_CBOX_OXYGENPAO2 EQ "" OR qGetIntake.OPTION_14_CBOX_OXYGENPAO2 EQ "NULL")
			variables.instance.OPTION_14_CBOX_OXYGENPAO2 = "NULL";
			ELSE
			variables.instance.OPTION_14_CBOX_OXYGENPAO2 = qGetIntake.OPTION_14_CBOX_OXYGENPAO2;
			
			IF(qGetIntake.OPTION_14_CBOX_OXYGENSAO2 EQ "" OR qGetIntake.OPTION_14_CBOX_OXYGENSAO2 EQ "NULL")
			variables.instance.OPTION_14_CBOX_OXYGENSAO2 = "NULL";
			ELSE
			variables.instance.OPTION_14_CBOX_OXYGENSAO2 = qGetIntake.OPTION_14_CBOX_OXYGENSAO2;
			
			IF(qGetIntake.OPTION_14_CBOX_OXYGENSPO2 EQ "" OR qGetIntake.OPTION_14_CBOX_OXYGENSPO2 EQ "NULL")
			variables.instance.OPTION_14_CBOX_OXYGENSPO2 = "NULL";
			ELSE
			variables.instance.OPTION_14_CBOX_OXYGENSPO2 = qGetIntake.OPTION_14_CBOX_OXYGENSPO2;
			
			IF(qGetIntake.OPTION_1_CBOX_DELIVERY EQ "" OR qGetIntake.OPTION_1_CBOX_DELIVERY EQ "NULL")
			variables.instance.OPTION_1_CBOX_DELIVERY = "NULL";
			ELSE
			variables.instance.OPTION_1_CBOX_DELIVERY = qGetIntake.OPTION_1_CBOX_DELIVERY;
			
			IF(qGetIntake.OPTION_1_CBOX_EXISTING EQ "" OR qGetIntake.OPTION_1_CBOX_EXISTING EQ "NULL")
			variables.instance.OPTION_1_CBOX_EXISTING = "NULL";
			ELSE
			variables.instance.OPTION_1_CBOX_EXISTING = qGetIntake.OPTION_1_CBOX_EXISTING;
			
			IF(qGetIntake.OPTION_1_CBOX_PICKUP EQ "" OR qGetIntake.OPTION_1_CBOX_PICKUP EQ "NULL")
			variables.instance.OPTION_1_CBOX_PICKUP = "NULL";
			ELSE
			variables.instance.OPTION_1_CBOX_PICKUP = qGetIntake.OPTION_1_CBOX_PICKUP;
			
			IF(qGetIntake.OPTION_1_CBOX_REPAIR EQ "" OR qGetIntake.OPTION_1_CBOX_REPAIR EQ "NULL")
			variables.instance.OPTION_1_CBOX_REPAIR = "NULL";
			ELSE
			variables.instance.OPTION_1_CBOX_REPAIR = qGetIntake.OPTION_1_CBOX_REPAIR;
			
			IF(qGetIntake.OPTION_1_CBOX_SWITCH EQ "" OR qGetIntake.OPTION_1_CBOX_SWITCH EQ "NULL")
			variables.instance.OPTION_1_CBOX_SWITCH = "NULL";
			ELSE
			variables.instance.OPTION_1_CBOX_SWITCH = qGetIntake.OPTION_1_CBOX_SWITCH;
			
			IF(qGetIntake.OPTION_2_CBOX_HOSPICE EQ "" OR qGetIntake.OPTION_2_CBOX_HOSPICE EQ "NULL")
			variables.instance.OPTION_2_CBOX_HOSPICE = "NULL";
			ELSE
			variables.instance.OPTION_2_CBOX_HOSPICE = qGetIntake.OPTION_2_CBOX_HOSPICE;
			
			IF(qGetIntake.OPTION_2_CBOX_HOSPITAL EQ "" OR qGetIntake.OPTION_2_CBOX_HOSPITAL EQ "NULL")
			variables.instance.OPTION_2_CBOX_HOSPITAL = "NULL";
			ELSE
			variables.instance.OPTION_2_CBOX_HOSPITAL = qGetIntake.OPTION_2_CBOX_HOSPITAL;
			
			IF(qGetIntake.OPTION_2_CBOX_OTHER EQ "" OR qGetIntake.OPTION_2_CBOX_OTHER EQ "NULL")
			variables.instance.OPTION_2_CBOX_OTHER = "NULL";
			ELSE
			variables.instance.OPTION_2_CBOX_OTHER = qGetIntake.OPTION_2_CBOX_OTHER;
						
			IF(qGetIntake.OPTION_3_CBOX_MEDICAID EQ "" OR qGetIntake.OPTION_3_CBOX_MEDICAID EQ "NULL")
			variables.instance.OPTION_3_CBOX_MEDICAID = "NULL";
			ELSE
			variables.instance.OPTION_3_CBOX_MEDICAID = qGetIntake.OPTION_3_CBOX_MEDICAID;
			
			IF(qGetIntake.OPTION_3_CBOX_MEDICARE EQ "" OR qGetIntake.OPTION_3_CBOX_MEDICARE EQ "NULL")
			variables.instance.OPTION_3_CBOX_MEDICARE = "NULL";
			ELSE
			variables.instance.OPTION_3_CBOX_MEDICARE = qGetIntake.OPTION_3_CBOX_MEDICARE;
			
			IF(qGetIntake.OPTION_3_CBOX_PRIVATEINSURANCE EQ "" OR qGetIntake.OPTION_3_CBOX_PRIVATEINSURANCE EQ "NULL")
			variables.instance.OPTION_3_CBOX_PRIVATEINSURANCE = "NULL";
			ELSE
			variables.instance.OPTION_3_CBOX_PRIVATEINSURANCE = qGetIntake.OPTION_3_CBOX_PRIVATEINSURANCE;
			
			IF(qGetIntake.OPTION_3_CBOX_PRIVATEPAY EQ "" OR qGetIntake.OPTION_3_CBOX_PRIVATEPAY EQ "NULL")
			variables.instance.OPTION_3_CBOX_PRIVATEPAY = "NULL";
			ELSE
			variables.instance.OPTION_3_CBOX_PRIVATEPAY = qGetIntake.OPTION_3_CBOX_PRIVATEPAY;
			
			IF(qGetIntake.ORDERINGPHYSICIANADDRESSTBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANADDRESSTBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANADDRESSTBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANADDRESSTBOX = qGetIntake.ORDERINGPHYSICIANADDRESSTBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANCITYTBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANCITYTBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANCITYTBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANCITYTBOX = qGetIntake.ORDERINGPHYSICIANCITYTBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANFAXTBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANFAXTBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANFAXTBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANFAXTBOX = qGetIntake.ORDERINGPHYSICIANFAXTBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANFNAMETBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANFNAMETBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANFNAMETBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANFNAMETBOX = qGetIntake.ORDERINGPHYSICIANFNAMETBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANLNAMETBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANLNAMETBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANLNAMETBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANLNAMETBOX = qGetIntake.ORDERINGPHYSICIANLNAMETBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANMINITIALTBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANMINITIALTBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANMINITIALTBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANMINITIALTBOX = qGetIntake.ORDERINGPHYSICIANMINITIALTBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANPHONETBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANPHONETBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANPHONETBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANPHONETBOX = qGetIntake.ORDERINGPHYSICIANPHONETBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANSTATETBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANSTATETBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANSTATETBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANSTATETBOX = qGetIntake.ORDERINGPHYSICIANSTATETBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANUPINTBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANUPINTBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANUPINTBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANUPINTBOX = qGetIntake.ORDERINGPHYSICIANUPINTBOX;
			
			IF(qGetIntake.ORDERINGPHYSICIANZIPTBOX EQ "" OR qGetIntake.ORDERINGPHYSICIANZIPTBOX EQ "NULL")
			variables.instance.ORDERINGPHYSICIANZIPTBOX = "NULL";
			ELSE
			variables.instance.ORDERINGPHYSICIANZIPTBOX = qGetIntake.ORDERINGPHYSICIANZIPTBOX;
			
			IF(qGetIntake.OTHERTBOX EQ "" OR qGetIntake.OTHERTBOX EQ "NULL")
			variables.instance.OTHERTBOX = "NULL";
			ELSE
			variables.instance.OTHERTBOX = qGetIntake.OTHERTBOX;
			
			IF(qGetIntake.OXYGENPAO2TBOX EQ "" OR qGetIntake.OXYGENPAO2TBOX EQ "NULL")
			variables.instance.OXYGENPAO2TBOX = "NULL";
			ELSE
			variables.instance.OXYGENPAO2TBOX = qGetIntake.OXYGENPAO2TBOX;
			
			IF(qGetIntake.OXYGENSAO2TBOX EQ "" OR qGetIntake.OXYGENSAO2TBOX EQ "NULL")
			variables.instance.OXYGENSAO2TBOX = "NULL";
			ELSE
			variables.instance.OXYGENSAO2TBOX = qGetIntake.OXYGENSAO2TBOX;
			
			IF(qGetIntake.OXYGENSPO2TBOX EQ "" OR qGetIntake.OXYGENSPO2TBOX EQ "NULL")
			variables.instance.OXYGENSPO2TBOX = "NULL";
			ELSE
			variables.instance.OXYGENSPO2TBOX = qGetIntake.OXYGENSPO2TBOX;
					
			IF(qGetIntake.PONUMBERTBOX EQ "" OR qGetIntake.PONUMBERTBOX EQ "NULL")
			variables.instance.PONUMBERTBOX = "NULL";
			ELSE
			variables.instance.PONUMBERTBOX = qGetIntake.PONUMBERTBOX;		
			
			IF(qGetIntake.PRINTED EQ "" OR qGetIntake.PRINTED EQ "NULL")
			variables.instance.PRINTED = "NULL";
			ELSE
			variables.instance.PRINTED = qGetIntake.PRINTED;
			
			IF(qGetIntake.ROOMNUMBERTBOX EQ "" OR qGetIntake.ROOMNUMBERTBOX EQ "NULL")
			variables.instance.ROOMNUMBERTBOX = "NULL";
			ELSE
			variables.instance.ROOMNUMBERTBOX = qGetIntake.ROOMNUMBERTBOX;
			
			IF(qGetIntake.TYPEOFPAY_RADIO EQ "" OR qGetIntake.TYPEOFPAY_RADIO EQ "NULL")
			variables.instance.TYPEOFPAY_RADIO = "NULL";
			ELSE
			variables.instance.TYPEOFPAY_RADIO = qGetIntake.TYPEOFPAY_RADIO;
				
		</cfscript>		
				
		<cfreturn this>
	 
	</cffunction>	
		
		
		
		
		
		
		--->

		







