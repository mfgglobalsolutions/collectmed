<!---- appPatientNoteProcess.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.noteID" default="">
	<cfset noteID = attributes.noteID>

	<cfif IsDefined("form.noteID") AND form.noteID NEQ "">
		<cfset noteID = form.noteID>
	<cfelseif IsDefined("url.noteID") AND url.noteID NEQ "">
		<cfset noteID = url.noteID>
	</cfif>

	<cfparam name="attributes.objectID" default="">
	<cfset objectID = attributes.objectID>

	<cfif IsDefined("form.objectID") AND form.objectID NEQ "">
		<cfset objectID = form.objectID>
	<cfelseif IsDefined("url.objectID") AND url.objectID NEQ "">
		<cfset objectID = url.objectID>
	</cfif>

	<cfparam name="attributes.instanceID" default="">
	<cfset instanceID = attributes.instanceID>

	<cfif IsDefined("form.instanceID") AND form.instanceID NEQ "">
		<cfset instanceID = form.instanceID>
	<cfelseif IsDefined("url.instanceID") AND url.instanceID NEQ "">
		<cfset instanceID = url.instanceID>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Create the note.                                                               --->
<!-------------------------------------------------------------------------------------->
	<cfset note1 = "form.note_#noteID#">

	<cfset note = evaluate(note1)>

	<cfset request.NoteXML = CreateObject("component","com.common.Note")>

	<cfif NOT IsNumeric(NoteID) OR NoteID EQ  0>
		<cfset noteID = request.NoteXML.addNote(clientID: trim(session.clientID), objectID: trim(objectID), instanceID: trim(instanceID))>
	</cfif>

	<cfset request.NoteXML.addNoteEntry(clientID: trim(session.clientID), NoteID: noteID, noteEntry: '#trim(note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>



<!-------------------------------------------------------------------------------------->
<!--- Locate the user to the patient note page.                                      --->
<!-------------------------------------------------------------------------------------->
	<cflocation addtoken="No" url="appPatientNote.cfm?objectid=#objectID#&instanceid=#instanceID#">

