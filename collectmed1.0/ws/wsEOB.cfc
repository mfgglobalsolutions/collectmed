

<cfcomponent>

	<cffunction name="wsMedicareProcStateFee" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Procedure Code" required="true">
		<cfargument name="Data2" type="string" hint="State" required="true">
		<cfargument name="Data3" type="date" hint="Date of Service" required="true">
		<cfargument name="Data4" type="string" hint="Modifier1" required="false" default="">
		<cfargument name="Data5" type="string" hint="Modifier2" required="false" default="">
		<cfargument name="Data6" type="string" hint="Modifier3" required="false" default="">
		<cfargument name="Data7" type="string" hint="Modifier4" required="false" default="">
		
		<cfset ProcedureCode = Data1>
		<cfset State = Data2>
		<cfset dos = Data3>
		<cfset Modifier1 = Data4>
		<cfset Modifier2 = Data5>
		<cfset Modifier3 = Data6>
		<cfset Modifier4 = Data7>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cf_ei_1002_GetmedicareProcedureFee senderrortocaller="yes" hcpc="#trim(ProcedureCode)#" state="#trim(State)#" dos="#trim(dos)#" modifier1="#trim(Modifier1)#" modifier2="#trim(Modifier2)#" modifier3="#trim(Modifier3)#" modifier4="#trim(Modifier4)#">			
				
			<cfreturn REQUEST.stripHTML(returnMessage)>	
											
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	
	<cffunction name="wsCheckQuoteExists" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="clientid" required="true">
		<cfargument name="Data2" type="string" hint="FName" required="true">
		<cfargument name="Data3" type="string" hint="LName" required="true">
		<cfargument name="Data5" type="string" hint="intake" required="false" default="0">
		<cfargument name="Data4" type="string" hint="Month" required="true">
		<cfargument name="Data6" type="string" hint="Day" required="true">
		<cfargument name="Data7" type="string" hint="Year" required="true">
		
		<cfset clientID = trim(Data1)>	
		<cfset FName = trim(Data2)>
		<cfset LName = trim(Data3)>		
		<cfset Month = trim(Data4)>
		<cfset checkIntake = trim(Data5)>
		<cfset Day = trim(Data6)>
		<cfset Year = trim(Data7)>
								
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset request.datasource = "PAClient_" & clientID>										
			<cfset returnString = "">
			
			<cfif checkIntake>				
				<cfset intakeString = wsCheckIntakeExists(clientid, FName, LName, Month, Day, Year)>				
				<cfif intakeString NEQ "true">					
					<cfset returnString = ListAppend(returnString, "intake", "|")>
					<cfset returnString = ListAppend(returnString, "#intakeString#", "|")>					
				</cfif>					
			</cfif>		
						
			<cfquery name="getQuote" datasource="#request.datasource#">
				SELECT QuoteID 
				FROM quote
				WHERE patientFnameTBox = '#trim(fname)#' 
				AND patientLnameTBox = '#trim(lname)#' 
				AND patientDOBMM = '#trim(month)#' 
				AND patientDOBDD = '#trim(day)#' 
				AND patientDOBYY = '#trim(year)#' 
				AND active = 1
			</cfquery>	
								
			<cfif getQuote.Recordcount GTE 1>
				<cfset returnString = ListAppend(returnString, "quote", "|")>		
				<cfset returnString = ListAppend(returnString, "#valuelist(getQuote.QuoteID)#", "|")>		
			</cfif>						
			
			<cfif returnString EQ "">
				<cfset returnString = "true">
			</cfif>	
			
			<cfreturn returnString>
											
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	
	
	
	<cffunction name="wsCheckIntakeExists" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="clientid" required="true">
		<cfargument name="Data2" type="string" hint="FName" required="true">
		<cfargument name="Data3" type="string" hint="LName" required="true">
		<cfargument name="Data4" type="string" hint="Month" required="true">
		<cfargument name="Data5" type="string" hint="Day" required="true">
		<cfargument name="Data6" type="string" hint="Year" required="true">
		<cfargument name="Data7" type="string" hint="ID not in" required="false" default="">
		
		<cfset clientID = trim(Data1)>	
		<cfset FName = trim(Data2)>
		<cfset LName = trim(Data3)>
		<cfset Month = trim(Data4)>
		<cfset Day = trim(Data5)>
		<cfset Year = trim(Data6)>
		<cfset IDNotIN = trim(Data7)>
								
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset request.datasource = "PAClient_" & clientID>		
			<cfset DOB = CreateDateTime(trim(Year), trim(Month), trim(Day), 0, 0, 0)>	
				
			<cfquery name="getIntake" datasource="#request.datasource#">
				SELECT i.IntakeID 
				FROM intake i
				LEFT JOIN Patient p ON i.PatientID = p.PatientID
				LEFT JOIN Entity e ON e.EntityID = p.EntityID
				LEFT JOIN ADDRESS a ON a.AddressID = i.patientAddressID
				WHERE e.Fname = '#trim(fname)#' 
				AND e.Lname = '#trim(lname)#' 
				<cfif DOB NEQ ""> AND e.DOB BETWEEN '#DateFormat(trim(DOB), "YYYY-MM-DD")#' AND '#DateFormat(trim(DOB), "YYYY-MM-DD")# 23:59:59.997'</cfif>						
			
				AND i.active = 1
				<cfif trim(IDNotIn) NEQ "">
					AND i.IntakeID NOT IN(#trim(IDNotIn)#)
				</cfif> 
				AND i.ClosingInvoiceNumber IS NULL 
			</cfquery>
						
			<cfif getIntake.Recordcount GTE 1>
				<cfreturn valuelist(getIntake.IntakeID)>	
			<cfelse>
				<cfreturn true>	
			</cfif>			
											
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create a record in the intake table to be used for the      --->
	<!--- autosave on the patientIntake page.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="wsGetNewIntakeID" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="clientid" required="true">
		<cfargument name="Data2" type="string" hint="FName" required="true">
		<cfargument name="Data3" type="string" hint="LName" required="true">
		<cfargument name="Data4" type="string" hint="Month" required="true">
		<cfargument name="Data5" type="string" hint="Day" required="true">
		<cfargument name="Data6" type="string" hint="Year" required="true">
		<cfargument name="Data7" type="string" hint="usersID" required="true">
		
		<cfset clientID = trim(Data1)>	
		<cfset FName = trim(Data2)>
		<cfset LName = trim(Data3)>
		<cfset Month = trim(Data4)>
		<cfset Day = trim(Data5)>
		<cfset Year = trim(Data6)>
		<cfset usersID = trim(Data7)>
								
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset request.datasource = "PAClient_" & clientID>		
			
			<cfquery name="getCreatorName" datasource="#trim(request.datasource)#">
				SELECT FName, LName
				FROM view_useraccountparameters 
				WHERE UsersID = #trim(UsersID)#
			</cfquery>
			
			
			<!---
			INSERT INTO Intake(inactiveCode, clientID, hidden_UsersID, AssignedToUserID, PatientFNameTBox, PatientLNameTBox, PatientDOBMM, PatientDOBDD, PatientDOBYY, hidden_Step) 
			VALUES(298, #trim(clientID)#, #trim(UsersID)#, #trim(UsersID)#, '#trim(FName)#', '#trim(LName)#', '#trim(Month)#', '#trim(Day)#', '#trim(Year)#', '1|#DateFormat(NOW(), 'mm/dd/yyyy')#|#TimeFormat(NOW(), 'hh:mm:ss tt')#|#trim(UsersID)#|#trim(getCreatorName.FName)# #trim(getCreatorName.LName)#~');
			SELECT LAST_INSERT_ID() AS intakeID 
			--->			
			<cfquery name="insertIntake" datasource="#trim(request.datasource)#">
				INSERT INTO Intake(inactiveCode, clientID, hidden_UsersID, AssignedToUserID, hidden_Step) 
				VALUES(298, #trim(clientID)#, #trim(UsersID)#, #trim(UsersID)#, '1|#DateFormat(NOW(), 'mm/dd/yyyy')#|#TimeFormat(NOW(), 'hh:mm:ss tt')#|#trim(UsersID)#|#trim(getCreatorName.FName)# #trim(getCreatorName.LName)#~');
				SELECT LAST_INSERT_ID() AS intakeID 
			</cfquery>	
			
			<cfquery name="insertIntakeHCPC" datasource="#trim(request.datasource)#">
				INSERT INTO IntakeHCPC(intakeID) 
				VALUES(#trim(insertIntake.intakeID)#)				
			</cfquery>				
			
			<cfreturn insertIntake.intakeID>
					
														
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will get an address from the DB.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="wsGetAddress" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="clientid" required="true">
		<cfargument name="Data2" type="string" hint="AddressID" required="true">
			
		<cfset clientID = trim(Data1)>	
		<cfset AddressID = trim(Data2)>
		
								
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			
			<cfset request.datasource = "PAClient_" & clientID>		
			
			<cfset AddressObj = CreateObject("component", "com.common.Address")>
			
			<cfreturn AddressObj.getAddress(AddressID)>				
					
														
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will get a phone number from the DB.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="wsGetPhone" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="clientid" required="true">
		<cfargument name="Data2" type="string" hint="PhoneID" required="true">
			
		<cfset clientID = trim(Data1)>	
		<cfset PhoneID = trim(Data2)>
		
								
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			
			<cfset request.datasource = "PAClient_" & clientID>		
			
			<cfset PhoneObj = CreateObject("component", "com.common.Phone")>
			
			<cfreturn PhoneObj.getPhone(clientID, PhoneID)>				
					
														
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
</cfcomponent>

	


