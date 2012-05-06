




<cfquery name="getIntakes" datasource="#trim(request.datasource)#">
	SELECT IntakeID, PatientSSNTBox
	FROM Intake
</cfquery>

<cfoutput>

	<cfloop query="getIntakes">
		
		<cfset newSSN = "">
				
		<cfif trim(PatientSSNTBox) EQ "000-00-0000">
			<cfset newSSN = "PENDING"> 
		<cfelseif trim(PatientSSNTBox) EQ "111-11-1111">
			<cfset newSSN = "PENDING"> 	
		<cfelseif IsNumeric(trim(PatientSSNTBox)) AND Len(trim(PatientSSNTBox)) EQ 9 AND NOT FindNoCase("000", trim(PatientSSNTBox))>
			<cfset newSSN = REQUEST.formatSSN(trim(PatientSSNTBox))> 
		<cfelseif FindNoCase("-", trim(PatientSSNTBox)) AND LEN(ListGetAt(trim(PatientSSNTBox), 1, "-")) EQ 3 AND LEN(ListGetAt(trim(PatientSSNTBox), 2, "-")) EQ 2 AND LEN(ListGetAt(trim(PatientSSNTBox), 3, "-")) EQ 4>
			<cfset newSSN = REQUEST.formatSSN(request.CleanNumericString(trim(PatientSSNTBox)))> 		
		<cfelse>
			<cfset newSSN = "PENDING"> 
		</cfif>
		
		
		<cfif trim(newSSN) NEQ trim(PatientSSNTBox)>
		
			<cfquery name="updateSSN" datasource="#trim(request.datasource)#">
				UPDATE intake 
				SET patientSSNTBox = '#trim(newSSN)#'
				WHERE intakeID = #trim(intakeID)#
			</cfquery>
				
			<font color="FF0000">#trim(newSSN)#</font><br>
		
		</cfif>
		
	</cfloop>

</cfoutput>

