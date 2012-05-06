<!--- tagIntakeAssign.cfm --->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.clientid" default="">
	<cfset clientid = attributes.clientid>
	
	<cfparam name="attributes.assignToUserID" default="">
	<cfset assignToUserID = attributes.assignToUserID>
	
	<cfparam name="attributes.IntakeID" default="">
	<cfset IntakeID = attributes.IntakeID>
	
	<cfparam name="attributes.assignorID" default="">
	<cfset assignorID = attributes.assignorID>
	
	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>
	
	<cfparam name="attributes.userFName" default="">
	<cfset userFName = attributes.userFName>
	
	<cfparam name="attributes.userLName" default="">
	<cfset userLName = attributes.userLName>
	

	
<!-------------------------------------------------------------------------------------->
<!--- Reassign the intake                                                            --->
<!-------------------------------------------------------------------------------------->
	<cfset request.IntakeObject = CreateObject("component","com.common.Intake")>
	<cfset request.IntakeObject.assignIntake(clientid: trim(ClientID), usersID: trim(assignToUserID), IntakeID: trim(IntakeID), assignorID: trim(assignorID), note: trim(note))>


	
<!-------------------------------------------------------------------------------------->
<!--- Add the new Note.                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfif note NEQ "">
	
		<cfset request.intakeNote = CreateObject("component","com.common.Note")>
	
		<cfset intakeNoteID = request.intakeNote.getNoteID(clientid: trim(ClientID), objectID: 8, instanceID: trim(intakeID))>
	
		<!-------------------------------------------------------------------------------------->
		<!--- If at this point the noteID is not available it means that the instance does   --->
		<!--- not have a note attached to it. Go ahead and create the note for this          --->
		<!--- object instance.                                                               --->
		<!-------------------------------------------------------------------------------------->
		<cfif NOT IsNumeric(intakeNoteID) AND IsNumeric(intakeID)>
			<cfset intakeNoteID = request.intakeNote.addNote(clientID: trim(clientID), objectID: 8, instanceID: trim(intakeID))>
		</cfif>
	
		<cfset request.intakeNote.addNoteEntry(clientID: trim(clientID), NoteID: intakeNoteID, noteEntry: '#trim(note)#', userID: assignorID, userFName: '#trim(userFName)#', userLName: '#trim(userLName)#')>
	
	</cfif>
	
	