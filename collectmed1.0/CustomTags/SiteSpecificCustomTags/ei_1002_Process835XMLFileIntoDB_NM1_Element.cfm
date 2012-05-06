

					
	<cfloop from="1" to="#trim(ArrayLen(CLPsElements[CLPi].NM1))#" index="namei">
		
		<!-------------------------------------------------------------------------------------->
		<!--- PATIENT loop in the CLP Name Element.                                          --->
		<!-------------------------------------------------------------------------------------->		
		<cfif CLPsElements[CLPi].NM1[namei].EntityIdentifierCode1.XMLText EQ "QC" AND CLPsElements[CLPi].NM1[namei].EntityTypeQualifier2.XMLText EQ 1>
						
			<!--- Get the code that will let us know what type of Identification Code this is. i.e.(SSN, Medicare ID...) --->
			<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'IdentificationCodeQualifier8')>							
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="16" itemnamedisplay="#trim(CLPsElements[CLPi].NM1[namei].IdentificationCodeQualifier8.XMLText)#" active="1" returnvariable="getIdentificationCodeType">
				<cfset IdentificationCodeQualifier = getIdentificationCodeType.StandardListItemID>											
			</cfif>			
			
			<!--- The actual ID that the patient will be known as --->													
			<cfset NM1IdentificationCode9 = CLPsElements[CLPi].NM1[namei].IdentificationCode9.XMLText>
			
			<!--- Get the patients name out of this loop. --->				
			<cfset patientLName = CLPsElements[CLPi].NM1[namei].NameLastorOrganizationName3.XMLText>			
			<cfif patientLName NEQ "">
				<cfset patientLName = UCase(Mid(patientLName,1, 1)) & LCase(mid(patientLName, 2, len(patientLName)))>				
			</cfif>
			<cfset patientFName = CLPsElements[CLPi].NM1[namei].NameFirst4.XMLText>
			<cfif patientFName NEQ "">			
				<cfset patientFName = UCase(Mid(patientFName,1, 1)) & LCase(mid(patientFName, 2, len(patientFName)))>	
			</cfif>
			<cfset patientMiddleName = CLPsElements[CLPi].NM1[namei].NameMiddle5.XMLText>			
						
			<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'NameSuffix7')>
				<cfset patientSuffix = CLPsElements[CLPi].NM1[namei].NameSuffix7.XMLText>		
			<cfelse>
				<cfset patientSuffix = "">	
			</cfif>
					
			<cfif NM1IdentificationCode9 EQ "">
				<cfset message = "While processing the file this iteration (#i#) record did not have a correctly formatted Insurance ID.">
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" code="115" logtext="#trim(message)#">				
				<cfthrow message="#trim(message)#">					
			</cfif>			
				
				
		<!-------------------------------------------------------------------------------------->
		<!---  loop in the CLP Name Element looking for the corrected name.                  --->
		<!-------------------------------------------------------------------------------------->		
		<cfelseif CLPsElements[CLPi].NM1[namei].EntityIdentifierCode1.XMLText EQ "74" AND CLPsElements[CLPi].NM1[namei].EntityTypeQualifier2.XMLText EQ 1>
			
			
			<!---FLAG CODE--->
			<!---If this is run then we need to flag so that DEZIGN gets the updated INFO--->
				
			
			<!--- Get the code that will let us know what type of Identification Code this is. i.e.(SSN, Medicare ID...) --->
			<!---<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'IdentificationCodeQualifier8')>							
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="16" itemnamedisplay="#trim(CLPsElements[CLPi].NM1[namei].IdentificationCodeQualifier8.XMLText)#" active="1" returnvariable="getIdentificationCodeType">
				<cfset IdentificationCodeQualifier = getIdentificationCodeType.StandardListItemID>
																							
			</cfif>		--->	
						
			<!--- The actual ID that the patient will be known as --->													
			<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'IdentificationCode9') AND CLPsElements[CLPi].NM1[namei].IdentificationCode9.XMLText NEQ "">
				<cfset NM1IdentificationCode9 = CLPsElements[CLPi].NM1[namei].IdentificationCode9.XMLText>				
			</cfif>
			
			<!--- Get the patients Lname out of this loop. --->				
			<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'NameLastorOrganizationName3') AND CLPsElements[CLPi].NM1[namei].NameLastorOrganizationName3.XMLText NEQ "">				
				<cfset patientLName = CLPsElements[CLPi].NM1[namei].NameLastorOrganizationName3.XMLText>			
				<cfif patientLName NEQ "">
					<cfset patientLName = UCase(Mid(patientLName,1, 1)) & LCase(mid(patientLName, 2, len(patientLName)))>				
				</cfif>				
			</cfif>
			
			<!--- Get the patients Fname out of this loop. --->
			<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'NameFirst4') AND CLPsElements[CLPi].NM1[namei].NameFirst4.XMLText NEQ "">							
				<cfset patientFName = CLPsElements[CLPi].NM1[namei].NameFirst4.XMLText>
				<cfif patientFName NEQ "">			
					<cfset patientFName = UCase(Mid(patientFName,1, 1)) & LCase(mid(patientFName, 2, len(patientFName)))>	
				</cfif>				
			</cfif>
			
			<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'NameMiddle5') AND CLPsElements[CLPi].NM1[namei].NameMiddle5.XMLText NEQ "">
				<cfset patientMiddleName = CLPsElements[CLPi].NM1[namei].NameMiddle5.XMLText>							
			</cfif>
									
			<cfif StructKeyExists(CLPsElements[CLPi].NM1[namei], 'NameSuffix7') AND CLPsElements[CLPi].NM1[namei].NameSuffix7.XMLText NEQ "">
				<cfset patientSuffix = CLPsElements[CLPi].NM1[namei].NameSuffix7.XMLText>						
			</cfif>
											
		</cfif>
		
	</cfloop>
	
	
