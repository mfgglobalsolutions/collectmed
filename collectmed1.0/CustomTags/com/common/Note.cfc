

<cfcomponent name="Note" extends="cmComponents.com.common.db.NoteIO">	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Check to make sure the object and instance are valid.                          --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="checkObject" returntype="numeric" hint="Check to make sure the object and instance are valid.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="objectID" required="yes" type="numeric">
		<cfargument name="instanceID" required="yes" type="numeric">
				
		<cfquery name="checkObject" datasource="pa_master">
			Select objectName FROM object WHERE ObjectID = #trim(objectID)# AND ObjectID NOT IN(1)
		</cfquery>
		
		<cfif checkObject.RecordCount EQ 1>
				
			<cfset thisDatasource = "PAClient_#trim(ClientID)#">
						
			<cfswitch expression="#trim(checkObject.objectName)#">
				<cfcase value="Users">
					<cfset objectName= "#trim(checkObject.objectName)#">
					<cfset keyID = "UsersID">
					<cfset thisDatasource = "pa_master">
				</cfcase>
				<cfcase value="Patient">
					<cfset objectName= "#trim(checkObject.objectName)#">
					<cfset keyID = "PatientID">
				</cfcase>
				<cfcase value="Insurance Company">
					<cfset objectName= "InsuranceCompany">
					<cfset keyID = "InsuranceCompanyID">
				</cfcase>
				<cfcase value="Claim">
					<cfset objectName= "#trim(checkObject.objectName)#">
					<cfset keyID = "ClaimID">
				</cfcase>
				<cfcase value="Procedure">
					<cfset objectName= "[#trim(checkObject.objectName)#]">
					<cfset keyID = "ProcedureID">
				</cfcase>
				<cfcase value="File">
					<cfset objectName= "[#trim(checkObject.objectName)#]">
					<cfset keyID = "FileID">
				</cfcase>
				<cfcase value="Intake">
					<cfset objectName= "#trim(checkObject.objectName)#">
					<cfset keyID = "IntakeID">
				</cfcase>
				<cfcase value="Quote">
					<cfset objectName= "#trim(checkObject.objectName)#">
					<cfset keyID = "QuoteID">
				</cfcase>
				<cfcase value="Doctor">
					<cfset objectName= "#trim(checkObject.objectName)#">
					<cfset keyID = "DoctorID">
				</cfcase>
				<cfcase value="Insurance Verification">
					<cfset objectName= "VerificationPatientInsurance">
					<cfset keyID = "VerificationPatientInsuranceID">
				</cfcase>
			</cfswitch>		 

			<cfsavecontent variable="sqlStatement">			
				<cfoutput>
					SELECT #trim(keyID)#
					FROM #lcase(trim(objectName))#
					WHERE #trim(keyID)#	= #trim(instanceID)#	
				</cfoutput>		
			</cfsavecontent>	
			
			<cfquery name="checkInstance" datasource="#trim(thisDatasource)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>
			
			<cfif checkInstance.RecordCount EQ 1>
				<cfreturn true>
			<cfelse>
				<cfreturn false>	
			</cfif>
		
		</cfif>
		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to add a note record.                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="addNote" returntype="numeric" hint="Add a note to the database table and return the new noteID.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="objectID" required="yes" type="numeric">
		<cfargument name="instanceID" required="yes" type="numeric">

		<!-------------------------------------------------------------------------------------->
		<!--- Before adding the note we have to check that the object sent is is valid and   --->
		<!--- that the instance of that object is also valid.                                --->
		<!-------------------------------------------------------------------------------------->
		<cfset validObjectInstance = checkObject(clientID: trim(clientID), objectID: trim(objectID), instanceID: trim(instanceID))>
		
		
		<cfif validObjectInstance>
				
			<!-------------------------------------------------------------------------------------->
			<!--- Add the note into the Database.                                                --->
			<!-------------------------------------------------------------------------------------->	
			<cfquery name="addNote" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO note  (ClientID, ObjectID, InstanceID, Note)
				VALUES(#trim(ClientID)#, #trim(ObjectID)#, #trim(InstanceID)#, '<note><entry><UserID></UserID><UserFName></UserFName><UserLName></UserLName><EntryDate></EntryDate><EntryTime></EntryTime><EntryNote></EntryNote><NewClaimID></NewClaimID></entry></note>');	
				SELECT LAST_INSERT_ID() AS noteID 
			</cfquery>
				
			<!-------------------------------------------------------------------------------------->
			<!--- return the noteID.                                                             --->
			<!-------------------------------------------------------------------------------------->				
			<cfreturn addNote.noteID>	
		
		<cfelse>
			
			<cfreturn false>
			
		</cfif>		
		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Note parameters.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getNoteDB" returntype="query" hint="get the notes parameters from database.">		
		
		<cfargument name="noteID" required="yes" type="numeric">
		<cfargument name="clientID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Note parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getNoteQuery" datasource="PAClient_#trim(ClientID)#">
			SELECT NoteID, ClientID, ObjectID, InstanceID, Note, Active, DateCreated
			FROM note  
			WHERE NoteID = #trim(NoteID)#	
		</cfquery>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the note query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getNoteQuery>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Note parameters.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="addNoteEntry" hint="Add an entry to a note.">		
				
		<cfargument name="noteID" required="yes" type="numeric">
		<cfargument name="userID" required="yes" type="numeric">
		<cfargument name="userFName" required="yes" type="string">
		<cfargument name="userLName" required="yes" type="string">
		<cfargument name="noteEntry" required="yes" type="string">
		<cfargument name="newClaimID" required="No" type="string" default="">
		<cfargument name="clientID" required="yes" type="numeric">
		
		<cfset getNote = getNoteXML(noteID: trim(noteID), clientID: trim(clientID))>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Add the element to the XML structure.                                          --->
		<!-------------------------------------------------------------------------------------->	
		<cfscript>		  
			addNote = XmlElemNew(getNote, "entry");	  
		  	addNote["UserID"] = XmlElemNew(getNote, "UserID");
		  	addNote["UserID"].xmlText = "#trim(userID)#";
		  	addNote["UserFName"] = XmlElemNew(getNote, "UserFName");
		  	addNote["UserFName"].xmlText = "#trim(userFName)#";
		  	addNote["UserLName"] = XmlElemNew(getNote, "UserLName");
		  	addNote["UserLName"].xmlText = "#trim(userLName)#";
		  	addNote["EntryDate"] = XmlElemNew(getNote, "EntryDate");
		  	addNote["EntryDate"].xmlText = "#DateFormat(NOW(), 'mm/dd/yyyy')#";
		  	addNote["EntryTime"] = XmlElemNew(getNote, "EntryTime");
		  	addNote["EntryTime"].xmlText = "#TimeFormat(NOW(), 'hh:mm:ss tt')#"; 	  
		  	addNote["EntryNote"] = XmlElemNew(getNote, "EntryNote");
		  	addNote["EntryNote"].xmlText = "#trim(noteEntry)#"; 		
		  	addNote["NewClaimID"] = XmlElemNew(getNote, "NewClaimID");
		  	addNote["NewClaimID"].xmlText = "#trim(newClaimID)#"; 		
			ArrayAppend(getNote["Note"].xmlChildren, addNote);		   
		</cfscript>
			
		<cfquery name="updateNote" datasource="PAClient_#trim(ClientID)#">
			UPDATE note 
			SET NOTE = '#trim(getNote)#', DateModified = now()
			WHERE noteID = #trim(NoteID)#
		</cfquery>	
		
		<cfreturn true>
														
	</cffunction>	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to Replace the last entry of the note.            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="replaceLastNoteEntry" hint="Replace the last entry of the note. This should be used for things such as an autosave.">		
				
		<cfargument name="noteID" required="yes" type="numeric">
		<cfargument name="userID" required="yes" type="numeric">
		<cfargument name="userFName" required="yes" type="string">
		<cfargument name="userLName" required="yes" type="string">
		<cfargument name="noteEntry" required="yes" type="string">
		<cfargument name="newClaimID" required="No" type="string" default="">
		<cfargument name="clientID" required="yes" type="numeric">
				
		<cfset getNote = getNoteXML(noteID: trim(noteID), clientID: trim(clientID))>		
		
		<cfset noteXML = XMLParse(getNote.Note)>	
		<cfset numberOfNotes = Arraylen(noteXML.note.entry)>			
		<cfset lastEntryNote = noteXML.note.entry[numberOfNotes].EntryNote.xmlText>	
		
		<cfif numberOfNotes EQ 1 AND noteXML.note.entry[numberOfNotes].EntryNote.xmlText EQ "">
			<cfset request.NoteXML.addNoteEntry(clientID: trim(ClientID), NoteID: noteID, noteEntry: '#trim(noteEntry)#', userID: trim(UserID), userFName: '#trim(userFName)#', userLName: '#trim(userLName)#')>
		<cfelseif trim(lastEntryNote) NEQ trim(noteEntry)>
				
			<!-------------------------------------------------------------------------------------->
			<!--- change the element to the XML structure.                                       --->
			<!-------------------------------------------------------------------------------------->	
			<cfset noteXML.note.entry[numberOfNotes].EntryNote.xmlText = trim(noteEntry)>	
				
			<cfquery name="updateNote" datasource="PAClient_#trim(ClientID)#">
				UPDATE note 
				SET NOTE = '#trim(noteXML)#', DateModified = now()
				WHERE noteID = #trim(NoteID)#
			</cfquery>
			
		</cfif>		
														
	</cffunction>		
	
	
	
		 
		 
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called toget the Note in XML Format.                     --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getNoteXML" hint="Get the notes of this noteId in an CF XML object">		
		
		<cfargument name="noteID" required="yes" type="numeric">
		<cfargument name="clientID" required="yes" type="numeric">
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Note query.                                                            --->
		<!-------------------------------------------------------------------------------------->	
		<cfset thisNoteXML = getNoteDB(noteID: trim(noteID), clientID: trim(clientID))>
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create the full XML Node from the XML in Database.                             --->
		<!-------------------------------------------------------------------------------------->	
		<cfset noteXML = XMLParse(thisNoteXML.Note)>		
		
		<cfreturn noteXML>		
														
	</cffunction>
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the NoteID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getNoteID" hint="get the notes DBID database table.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="objectID" required="yes" type="numeric">
		<cfargument name="instanceID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Note parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getNote" datasource="PAClient_#trim(ClientID)#">
			SELECT NoteID
			FROM note  
			WHERE objectID = #trim(objectID)# AND instanceID = #trim(instanceID)#		
		</cfquery>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the note query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfif getNote.RecordCount LTE 0>
			
			<cfset noteID = addNote(clientID: trim(clientID), objectID: trim(objectID), instanceID: trim(instanceID))>
			<cfreturn noteID>		
			
		<cfelse>
			<cfreturn getNote.NoteID>		
		</cfif>	
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the NoteID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getNotes" hint="get the notes DBID database table.">		
		
		<cfargument name="objectID" required="yes" type="numeric">
		<cfargument name="instanceID" required="yes" type="numeric">
		<cfargument name="orderascdesc" required="No" default="asc">
		<cfargument name="clientID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Note parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getAllNotes" datasource="PAClient_#trim(ClientID)#">
			SELECT NoteID
			FROM note  
			WHERE objectID = #trim(objectID)# AND instanceID = #trim(instanceID)#
			Order by DateCreated #trim(orderascdesc)#		
		</cfquery>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the note query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getAllNotes>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will return a formatted string with all the notes.               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFormattedNotes" hint="get the notes formatted.">
		
		<cfargument name="noteID" required="yes" type="numeric">	
		<cfargument name="showTime" default="yes">	
		<cfargument name="clientID" required="yes" type="numeric">	
			
		<cfset getNoteXML = getNoteDB(noteID: trim(noteID), clientID: trim(clientID))>		
		<cfset noteXML = XMLParse(getNoteXML.Note)>	
		<cfset numberOfNotes = Arraylen(noteXML.note.entry)>
		<cfset returnNoteXML = "">		
				
		<cfoutput>
			<cfloop from="#trim(numberOfNotes)#" to="1" step="-1" index="i">
						
				<cfset thisUserID = noteXML.note.entry[i].UserID.xmlText>
				<cfset thisUserFName = noteXML.note.entry[i].UserFName.xmlText>
				<cfset thisUserLName = noteXML.note.entry[i].UserLName.xmlText>
				<cfset thisEntryDate = noteXML.note.entry[i].EntryDate.xmlText>
				<cfset thisEntryTime = noteXML.note.entry[i].EntryTime.xmlText>		
				<cfset thisEntryNote = noteXML.note.entry[i].EntryNote.xmlText>	
				
				<cfif thisEntryNote EQ "" AND trim(numberOfNotes) EQ 1>
					<cfset returnNoteXML = returnNoteXML & "<tr><td class=sitelabel><strong>No Notes to View</strong><br>" & thisEntryNote & "</td></tr>">					
				<cfelseif thisEntryNote NEQ "" AND showTime>
					<cfset returnNoteXML = returnNoteXML & "<tr><td class=sitelabel><span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "');"" onmouseout=""hideTip();""><strong>" & LEFT(trim(thisUserFName), 1) & ". " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & "</strong></span><br>" & thisEntryNote & "</td></tr>">
				<cfelseif thisEntryNote NEQ "">
					<cfset returnNoteXML = returnNoteXML & "<tr><td class=sitelabel><strong>" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "</strong><br>" & thisEntryNote & "</td></tr>">					
				</cfif>			
				
			</cfloop>
		</cfoutput>			
				
		<cfset returnNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnNoteXML & "</table>">				
		
		<cfreturn returnNoteXML>	
	
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will return the number of notes for an object.                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getNumberOfNotes" hint="get the number of notes for an object.">
		
		<cfargument name="clientID" required="yes" type="numeric">	
		<cfargument name="objectID" required="yes" type="numeric">	
		<cfargument name="instanceID" required="yes" type="numeric">	
		
		<cfset noteID = getNoteID(clientID: trim(clientID), objectID: trim(objectID), instanceID: trim(instanceID))>					
		
		<cfif NOT IsNumeric(noteID)>			
			<cfreturn 0>		
		</cfif>		
		
		<cfset getNoteXML = getNoteDB(noteID: trim(noteID), clientID: trim(clientID))>		
		<cfset noteXML = XMLParse(getNoteXML.Note)>	
		<cfset numberOfNotes = Arraylen(noteXML.note.entry) - 1> <!--- First note is always empty.--->
		
		<cfif IsNumeric(numberOfNotes)>
			<cfreturn numberOfNotes>
		<cfelse>
			<cfreturn 0>		
		</cfif>		
	
	</cffunction>
	
	
</cfcomponent>

	



