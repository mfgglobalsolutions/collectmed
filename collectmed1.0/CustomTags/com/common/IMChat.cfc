

<cfcomponent name="IMChat" extends="cmComponents.com.common.db.IMChatIO">	


	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to add an IMChat.                                 --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="addIMChat" returntype="numeric" hint="Add an IMChat to the database table and return the new recordID.">		
				
		<cfargument name="UsersIDFrom" required="yes" type="numeric">
		<cfargument name="UsersIDTo" required="yes" type="numeric">
						
		<!-------------------------------------------------------------------------------------->
		<!--- Add IMChat into the Database.                                                  --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="addIMChat" datasource="#trim(request.datasource)#">
			INSERT INTO IMChat  (UsersIDFrom, UsersIDTo, IMChatXML)
			VALUES(#trim(UsersIDFrom)#, #trim(UsersIDTo)#, '<chat><entry><UserID></UserID><UserFName></UserFName><UserLName></UserLName><EntryDate></EntryDate><EntryTime></EntryTime><EntryNote></EntryNote></entry></chat>');	
			SELECT LAST_INSERT_ID() AS recordID 
		</cfquery>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the noteID.                                                             --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn addIMChat.recordID>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the IMChat parameters.                     --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getIMChatDB" returntype="query" hint="get the IMChat parameters from database.">		
		
		<cfargument name="recordID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the IMChat parameters from the Database.                                   --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getIMChatQuery" datasource="#trim(request.datasource)#">
			SELECT recordID, IMChatXML, Active, DateCreated
			FROM IMChat  
			WHERE recordID = #trim(recordID)#	
		</cfquery>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the IMChat query.                                                       --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getIMChatQuery>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Note parameters.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="addIMNoteEntry" hint="Add an entry to a chat.">		
				
		<cfargument name="recordID" required="yes" type="numeric">
		<cfargument name="userID" required="yes" type="numeric">
		<cfargument name="userFName" required="yes" type="string">
		<cfargument name="userLName" required="yes" type="string">
		<cfargument name="noteEntry" required="yes" type="string">		
		
		<cfif noteEntry NEQ "">
		
			<cfset getIMChat = getChatXML(recordID)>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Get the Note parameters form the Database.                                     --->
			<!-------------------------------------------------------------------------------------->	
			<cfscript>		  
				addIMNote = XmlElemNew(getIMChat, "entry");	  
			  	addIMNote["UserID"] = XmlElemNew(getIMChat, "UserID");
			  	addIMNote["UserID"].xmlText = "#trim(userID)#";
			  	addIMNote["UserFName"] = XmlElemNew(getIMChat, "UserFName");
			  	addIMNote["UserFName"].xmlText = "#trim(userFName)#";
			  	addIMNote["UserLName"] = XmlElemNew(getIMChat, "UserLName");
			  	addIMNote["UserLName"].xmlText = "#trim(userLName)#";
			  	addIMNote["EntryDate"] = XmlElemNew(getIMChat, "EntryDate");
			  	addIMNote["EntryDate"].xmlText = "#DateFormat(NOW(), 'mm/dd/yyyy')#";
			  	addIMNote["EntryTime"] = XmlElemNew(getIMChat, "EntryTime");
			  	addIMNote["EntryTime"].xmlText = "#TimeFormat(NOW(), 'hh:mm:ss tt')#"; 	  
			  	addIMNote["EntryNote"] = XmlElemNew(getIMChat, "EntryNote");
			  	addIMNote["EntryNote"].xmlText = "#trim(noteEntry)#"; 		  	
				ArrayAppend(getIMChat["chat"].xmlChildren, addIMNote);		   
			</cfscript>
				
			<cfquery name="updateNote" datasource="#trim(request.datasource)#">
				UPDATE IMChat SET IMChatXML = '#trim(getIMChat)#'
				WHERE recordID = #trim(recordID)#
			</cfquery>
				
		</cfif>		
												
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called toget the Note in XML Format.                     --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getChatXML" hint="Get the notes of this recordId in an CF XML object">		
		
		<cfargument name="recordID" required="yes" type="numeric">
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Note query.                                                            --->
		<!-------------------------------------------------------------------------------------->	
		<cfset thisNoteXML = getIMChatDB(recordID)>
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create the full XML Node from the XML in Database.                             --->
		<!-------------------------------------------------------------------------------------->	
		<cfset noteXML = XMLParse(thisNoteXML.IMChatXML)>		
		
		<cfreturn noteXML>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will return a formatted string with all the note entries.        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFormattedNoteEntries" hint="get the note entries formatted.">
		
		<cfargument name="IMChatXML" required="yes" type="string">	
		<cfargument name="showTime" default="yes">	
			
		<cfset noteXML = XMLParse(IMChatXML)>	
		<cfset numberOfNotes = Arraylen(noteXML.chat.entry)>
		<cfset returnNoteXML = "">		
		<cfset colorList = "ff0000,0000ff,000000,008000,ffff00">
		<cfset usersIDs = "">	
		<cfset qIMChatLog = querynew("thisColor,thisUserID,thisUserFName,thisUserLName,thisEntryDate,thisEntryTime,thisEntryNote")>
						
		<cfloop to="#trim(numberOfNotes)#" from="1" index="i">			
			<cfif IsNumeric(noteXML.chat.entry[i].UserID.xmlText)>				
				<cfif ListFindNoCase(usersIDs, noteXML.chat.entry[i].UserID.xmlText)>
					<cfset color = ListGetAt(colorList, ListFindNoCase(usersIDs, noteXML.chat.entry[i].UserID.xmlText))>
				<cfelse>
					<cfset usersIDs = ListAppend(usersIDs, noteXML.chat.entry[i].UserID.xmlText)>
					<cfset color = ListGetAt(colorList, ListLen(usersIDs))>  	
				</cfif>
				<cfset newRow  = QueryAddRow(qIMChatLog, 1)>
				<cfset temp = QuerySetCell(qIMChatLog, "thisColor", "#trim(color)#", qIMChatLog.getRowcount())>		
				<cfset temp = QuerySetCell(qIMChatLog, "thisUserID", "#noteXML.chat.entry[i].UserID.xmlText#", qIMChatLog.getRowcount())>		
				<cfset temp = QuerySetCell(qIMChatLog, "thisUserFName", "#noteXML.chat.entry[i].UserFName.xmlText#", qIMChatLog.getRowcount())>		
				<cfset temp = QuerySetCell(qIMChatLog, "thisUserLName", "#noteXML.chat.entry[i].UserLName.xmlText#", qIMChatLog.getRowcount())>		
				<cfset temp = QuerySetCell(qIMChatLog, "thisEntryDate", "#noteXML.chat.entry[i].EntryDate.xmlText#", qIMChatLog.getRowcount())>		
				<cfset temp = QuerySetCell(qIMChatLog, "thisEntryTime", "#noteXML.chat.entry[i].EntryTime.xmlText#", qIMChatLog.getRowcount())>		
				<cfset temp = QuerySetCell(qIMChatLog, "thisEntryNote", "#noteXML.chat.entry[i].EntryNote.xmlText#", qIMChatLog.getRowcount())>		
			</cfif>
		</cfloop>
				
		<cfloop from="#trim(qIMChatLog.RecordCount)#" to="1" step="-1" index="i">						
			<cfset returnNoteXML = returnNoteXML & "<tr><td class=siteLabel nowrap valign=top><strong><font color=#trim(qIMChatLog.thisColor[i])#>" & LEFT(trim(qIMChatLog.thisUserFName[i]),9) & ":</font></strong></td><td class=siteLabel>" & qIMChatLog.thisEntryNote[i] & "</td></tr>">
		</cfloop>			
				
		<cfset returnNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnNoteXML & "</table>">				
		
		<cfreturn returnNoteXML>	
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------------->
	<!--- This function will return the RecordID of the current chat that the user is in.      --->
	<!-------------------------------------------------------------------------------------------->	
	<cffunction name="getConversationID" returntype="string" hint="This function will return the RecordID of the current chat that the user is in.">
	
		<cfargument name="usersID" required="yes" type="numeric">
		
		<cfquery name="getConversation" datasource="#trim(request.datasource)#">
			SELECT RecordID
			FROM IMChat
			WHERE Active = 1 AND ((UsersIDFrom = #trim(usersID)# AND FromActive = 1) OR (UsersIDTo = #trim(usersID)# AND ToActive = 1) OR (UsersIDJoined1 = #trim(usersID)# AND Joined1Active = 1) OR (UsersIDJoined2 = #trim(usersID)# AND Joined2Active = 1) OR (UsersIDJoined3 = #trim(usersID)# AND Joined3Active = 1))
		</cfquery>
		
		<cfif getConversation.recordCount GT 0>
			<cfreturn getConversation.RecordID>
		<cfelse>
			<cfreturn false>	
		</cfif>
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------------->
	<!--- This function will return the current participants of a conversation.                --->
	<!-------------------------------------------------------------------------------------------->	
	<cffunction name="getActiveChatParticipants" returntype="string" hint="This function will return the current participants of a conversation.">
	
		<cfargument name="recordID" required="yes" type="numeric">
		<cfset IDList = ""> 
		
		<cfquery name="getConversation" datasource="#trim(request.datasource)#">
			SELECT UsersIDFrom, FromActive, UsersIDTo, ToActive, UsersIDJoined1, Joined1Active, UsersIDJoined2, Joined2Active, UsersIDJoined3, Joined3Active
			FROM IMChat
			WHERE Active = 1 AND recordID = #trim(recordID)#
		</cfquery>
		
		<cfif getConversation.recordCount GT 0>
			<cfif trim(getConversation.FromActive) EQ 1>
				<cfset IDList = ListAppend(IDList, trim(getConversation.UsersIDFrom))>
			</cfif>		
			<cfif trim(getConversation.ToActive) EQ 1>
				<cfset IDList = ListAppend(IDList, trim(getConversation.UsersIDTo))>
			</cfif>				
			<cfif trim(getConversation.Joined1Active) EQ 1>
				<cfset IDList = ListAppend(IDList, trim(getConversation.UsersIDJoined1))>
			</cfif>		
			<cfif trim(getConversation.Joined2Active) EQ 1>
				<cfset IDList = ListAppend(IDList, trim(getConversation.UsersIDJoined2))>
			</cfif>		
			<cfif trim(getConversation.Joined3Active) EQ 1>
				<cfset IDList = ListAppend(IDList, trim(getConversation.UsersIDJoined3))>	
			</cfif>				
		</cfif>		
		
		<cfreturn IDList>	
	
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------------->
	<!--- This function will return the role of the user in the conversation.                  --->
	<!-------------------------------------------------------------------------------------------->	
	<cffunction name="getParticipantsRole" returntype="string" hint="This function will return the role of the user in the conversation.">
	
		<cfargument name="recordID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">
		<cfset Role = ""> 
		
		<cfquery name="getConversation" datasource="#trim(request.datasource)#">
			SELECT UsersIDFrom, FromActive, UsersIDTo, ToActive, UsersIDJoined1, Joined1Active, UsersIDJoined2, Joined2Active, UsersIDJoined3, Joined3Active
			FROM IMChat
			WHERE Active = 1 AND recordID = #trim(recordID)#
		</cfquery>
		
		<cfif getConversation.recordCount GT 0>
			<cfif getConversation.UsersIDFrom EQ trim(usersID) AND trim(getConversation.FromActive) EQ 1>
				<cfset Role = "UsersIDFrom">
			</cfif>		
			<cfif getConversation.UsersIDTo EQ trim(usersID) AND trim(getConversation.ToActive) EQ 1>
				<cfset Role = "UsersIDTo">
			</cfif>				
			<cfif getConversation.UsersIDJoined1 EQ trim(usersID) AND trim(getConversation.Joined1Active) EQ 1>
				<cfset Role = "UsersIDJoined1">
			</cfif>		
			<cfif getConversation.UsersIDJoined2 EQ trim(usersID) AND trim(getConversation.Joined2Active) EQ 1>
				<cfset Role = "UsersIDJoined2">
			</cfif>		
			<cfif getConversation.UsersIDJoined3 EQ trim(usersID) AND trim(getConversation.Joined3Active) EQ 1>
				<cfset Role = "UsersIDJoined3">
			</cfif>	
		</cfif>	
				
		<cfreturn Role>			
	
	</cffunction>
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will exit a user from a conversation allowing the conversation   --->
	<!--- to continue.                                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exitChat" returntype="string" hint="This function will return the role of the user in the conversation.">
			
		<cfargument name="usersID" required="yes" type="numeric">
		<cfargument name="recordID" required="yes" type="numeric">
		<cfargument name="role" required="yes" type="string">
			
		<cfswitch expression="#trim(role)#">
			<cfcase value="UsersIDFrom">
		    	<cfset activeRole = "FromActive">
		    </cfcase>
		    <cfcase value="UsersIDTo">
		    	<cfset activeRole = "ToActive">
		    </cfcase>
		    <cfcase value="UsersIDJoined1">
		    	<cfset activeRole = "Joined1Active">
		    </cfcase>		
			<cfcase value="UsersIDJoined2">
		    	<cfset activeRole = "Joined2Active">
		    </cfcase>		
			<cfcase value="UsersIDJoined3">
		    	<cfset activeRole = "Joined3Active">
		    </cfcase>				   
		</cfswitch>		
			
		<cfsavecontent variable="sqlStatement">
			<cfoutput>
				UPDATE IMChat
				SET #trim(activeRole)# = 0
				WHERE recordID = #trim(recordID)#
			</cfoutput>
		</cfsavecontent>	
		
		<cfquery name="updateIMChat" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
						
		<cfreturn true>			
	
	</cffunction>	
	
	
</cfcomponent>


