<!---- appObjectNoteAdd.cfm ---->


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

	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>

	<cfif IsDefined("form.note") AND form.note NEQ "">
		<cfset note = form.note>
	<cfelseif IsDefined("url.note") AND url.note NEQ "">
		<cfset note = url.note>
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
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="objectID,instanceID"
		fieldnames="Object ID,Instance ID"
		datatypes="numeric,numeric">



<!-------------------------------------------------------------------------------------->
<!--- Add the new Note.                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfif note NEQ "">

		<!-------------------------------------------------------------------------------------->
		<!--- Create the object and get the XML.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfset request.NoteXML = application.beanFactory.getBean("Note") />

		<!-------------------------------------------------------------------------------------->
		<!--- If at this point the noteID is not available it means that the instance does   --->
		<!--- not have a note attached to it. Go ahead and create the note for this          --->
		<!--- object instance.                                                               --->
		<!-------------------------------------------------------------------------------------->
		<cfif NOT IsNumeric(NoteID) AND IsNumeric(objectID) AND IsNumeric(instanceID)>
			<cfset noteID = request.NoteXML.addNote(clientID: trim(session.clientID), objectID: trim(objectID), instanceID: trim(instanceID))>
		</cfif>

		<cfset request.NoteXML.addNoteEntry(clientID: trim(session.clientID), NoteID: noteID, noteEntry: '#trim(note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>

	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- setup the URL to send the user to.                                             --->
<!-------------------------------------------------------------------------------------->
	<cfset urlString = "appObjectNote.cfm?objectID=#trim(objectID)#&instanceID=#trim(instanceID)#">



<!-------------------------------------------------------------------------------------->
<!--- Locate the user back to the note page.                                         --->
<!-------------------------------------------------------------------------------------->
	<cflocation addtoken="No" url="#trim(urlString)#">

