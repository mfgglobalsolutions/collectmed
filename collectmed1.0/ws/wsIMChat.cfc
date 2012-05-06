

<cfcomponent>

	<cffunction name="wsIMChat" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Users ID" required="true">
		
		<cfset clientID = Data1>		
		<cfset usersID = Data2>	
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
				
			<cfset request.datasource = "PAClient_" & clientID>				
			<cfset request.IM = application.beanFactory.getBean('IMChat') />
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check to see if this user is actively in conversation with someone.            --->
			<!-------------------------------------------------------------------------------------->			
			<cfset isUserInConversation = request.IM.getConversationID(trim(usersID))>
										
			<cfif IsNumeric(trim(isUserInConversation))>			
				<cfset recordID = isUserInConversation>				
				<cfset request.IM.Init(trim(recordID))>
				<cfreturn request.IM.getFormattedNoteEntries(request.IM.getIMChatXML())>				
			<cfelse>			
				<cfreturn false>	
			</cfif>
			
			
											
			<cfcatch type="Any">				
			
				<cf_gcGatewayLogger			
					datasource="#trim(request.datasource)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	<cffunction name="wsIMChatAddEntry" access="remote" returntype="string" output="no">
				
		<cfargument name="Data1" type="numeric" hint="Client ID" required="true">
		<cfargument name="Data2" type="numeric" hint="Users ID" required="true">
		<cfargument name="Data3" type="string" hint="Note" required="true">
		<cfargument name="Data4" type="numeric" hint="Talk To Users ID" required="false" default="0">
		
		<cfset returnMsg = true>
		<cfset clientID = Data1>		
		<cfset usersID = Data2>			
		<cfset note = Data3>	
		<cfset usersIDTo = Data4>	
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
				
			<cfset request.datasource = "PAClient_" & clientID>			
			<cfset request.IM = application.beanFactory.getBean('IMChat')>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check to see if this user is actively in conversation with someone.            --->
			<!-------------------------------------------------------------------------------------->			
			<cfset isUserInConversation = request.IM.getConversationID(trim(usersID))>
			
			<!-------------------------------------------------------------------------------------->
			<!--- If the user wants to talk to someone else are they in a conversation already.  --->
			<!-------------------------------------------------------------------------------------->
			<cfset isToUserInConversation = false>
			<cfif usersIDTo GT 0>
				<cfset isToUserInConversation = request.IM.getConversationID(trim(usersIDTo))>
				<cfif IsNumeric(trim(isToUserInConversation)) AND isUserInConversation NEQ isToUserInConversation>
					<cfset returnMsg = "<br><strong><font size=2 color=FF0000>The person you are trying to<br>reach is currently busy.</font></strong>">
					<cfreturn returnMsg>
				</cfif>	
			</cfif>
			

			<!--------------------------------------------------------------------------------------->
			<!--- This means the FROM is not busy and because we got this far the TO is           --->
			<!--- also not busy. We have to create a chat session and get the recordID.           --->
			<!--------------------------------------------------------------------------------------->						
			<cfif NOT IsNumeric(trim(isUserInConversation))>
				
				<cfset recordID = request.IM.addIMChat(trim(usersID), trim(usersIDTo))>
									
			<cfelse>
				
				<!-------------------------------------------------------------------------------------->
				<!--- TO is trying to contact a new person but is currently in a conversation we     --->
				<!--- have to ask them to EXIT their current conversation.                           --->
				<!-------------------------------------------------------------------------------------->
				<cfif usersIDTo GT 0>
					<cfset returnMsg = "<br><br><strong><font size=2 color=000000>You are currently involved in a chat.<br><br>In order to start a new chat you<br>must <font size=2 color=FF0000>EXIT</font> the one you are currently in.</font></strong>">
					<cfreturn returnMsg>					
				</cfif>				
				
				<cfset recordID = isUserInConversation>
					
			</cfif>			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Get the writers first and last name.                                           --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getUsersName" datasource="#trim(request.datasource)#">
				SELECT FName, LName 
				FROM view_UserAccountParameters 
				WHERE UsersID = #trim(UsersID)#
			</cfquery>			
						
			<cfset IM = application.beanFactory.getBean('IMChat')>
			<cfset IM.addIMNoteEntry(trim(recordID), trim(usersID), '#trim(getUsersName.FName)#', '#trim(getUsersName.LName)#', '#trim(Note)#')>	
			
			<cfreturn wsIMChat(trim(clientID), trim(usersID))>
											
			<cfcatch type="Any">				
			
				<cf_gcGatewayLogger			
					datasource="#trim(request.datasource)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	<cffunction name="wsExitChat" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Users ID" required="true">
		
		<cfset clientID = Data1>		
		<cfset usersID = Data2>	
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
				
			<cfset request.datasource = "PAClient_" & clientID>				
			<cfset request.IM = application.beanFactory.getBean('IMChat')>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check to see if this user is actively in conversation with someone.            --->
			<!-------------------------------------------------------------------------------------->			
			<cfset isUserInConversation = request.IM.getConversationID(trim(usersID))>
										
			<cfif IsNumeric(trim(isUserInConversation))>			
				
				<!-------------------------------------------------------------------------------------->
				<!--- Get the writers first and last name.                                           --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getUsersName" datasource="#trim(request.datasource)#">
					SELECT FName, LName 
					FROM view_UserAccountParameters 
					WHERE UsersID = #trim(UsersID)#
				</cfquery>
				
				<cfset role = request.IM.getParticipantsRole(trim(isUserInConversation), trim(usersID))>				
				<cfset request.IM.addIMNoteEntry(trim(isUserInConversation), trim(usersID), '<font color=c0c0c0>Administrator</font>', '<font color=c0c0c0>Administrator</font>', '<font color=c0c0c0>#Ucase(getUsersName.FName)# HAS EXITED CHAT.</font>')>	
				<cfset request.IM.exitChat(trim(usersID), trim(isUserInConversation), trim(role))>
				<cfreturn true>		
					
			<cfelse>			
				<cfreturn false>	
			</cfif>
			
											
			<cfcatch type="Any">				
			
				<cf_gcGatewayLogger			
					datasource="#trim(request.datasource)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
		
</cfcomponent>

	