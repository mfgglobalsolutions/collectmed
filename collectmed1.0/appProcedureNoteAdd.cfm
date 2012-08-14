<!---- appNoteAdd.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.reloadp" default="">
	<cfset reloadp = attributes.reloadp>

	<cfif IsDefined("form.reloadp") AND form.reloadp NEQ "">
		<cfset reloadp = form.reloadp>
	<cfelseif IsDefined("url.reloadp") AND url.reloadp NEQ "">
		<cfset reloadp = url.reloadp>
	</cfif>

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

	<cfparam name="attributes.trtdID" default="">
	<cfset trtdID = attributes.trtdID>

	<cfif IsDefined("form.trtdID") AND form.trtdID NEQ "">
		<cfset trtdID = form.trtdID>
	<cfelseif IsDefined("url.trtdID") AND url.trtdID NEQ "">
		<cfset trtdID = url.trtdID>
	</cfif>

	<cfparam name="attributes.newClaimID" default="">
	<cfset newClaimID = attributes.newClaimID>

	<cfif IsDefined("form.newClaimID") AND form.newClaimID NEQ "">
		<cfset newClaimID = form.newClaimID>
	<cfelseif IsDefined("url.newClaimID") AND url.newClaimID NEQ "">
		<cfset newClaimID = url.newClaimID>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Add the new Note.                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfif note NEQ "">

		<!-------------------------------------------------------------------------------------->
		<!--- Create the object and get the XML.                                             --->
		<!-------------------------------------------------------------------------------------->
		<!--- <cfset request.NoteXML = CreateObject("component","com.common.Note")> --->
		<cfset request.NoteXML = application.beanFactory.getBean("Note")>

		<!-------------------------------------------------------------------------------------->
		<!--- If at this point the noteID is not available it means that the instance does   --->
		<!--- not have a note attached to it. Go ahead and create the note for this          --->
		<!--- object instance.                                                               --->
		<!-------------------------------------------------------------------------------------->
		<cfif NOT IsNumeric(NoteID) AND IsNumeric(objectID) AND IsNumeric(instanceID)>
			<cfset noteID = request.NoteXML.addNote(clientID: trim(session.clientID), objectID: trim(objectID), instanceID: trim(instanceID))>
		</cfif>

		<cfset request.NoteXML.addNoteEntry(clientID: trim(session.clientID), NoteID: noteID, noteEntry: '#trim(note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#', newClaimID: '#trim(newClaimID)#')>

	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- setup the URL to send the user to.                                             --->
<!-------------------------------------------------------------------------------------->
	<cfset urlString = "appProcedureNote.cfm?noteID=#trim(NoteID)#">

	<cfif trtdID NEQ "">
		<cfset urlString = urlString & "&trtdID=#trim(trtdID)#">
	</cfif>

	<cfif reloadp NEQ "">
		<cfset urlString = urlString & "&reloadp=yes&added=yes">
	</cfif>

<!-------------------------------------------------------------------------------------->
<!--- Locate the user back to the note page.                                         --->
<!-------------------------------------------------------------------------------------->
	<cflocation addtoken="No" url="#trim(urlString)#">

