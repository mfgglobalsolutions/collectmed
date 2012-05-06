<!--- gcLogUserOutClearScopes.cfm --->


<!-------------------------------------------------------------------------------------->
<!--- Clear the users session from the application structure.                        --->
<!-------------------------------------------------------------------------------------->	  
	<cfif IsDefined("request.structName")>
	<cfset StructDelete(evaluate(request.structName), session.user.getUsersID())>		
	</cfif>


<!-------------------------------------------------------------------------------------->
<!--- Once the user has chosen to logout this code will end the session variables    --->
<!--- on the server.                                                                 --->
<!-------------------------------------------------------------------------------------->	
	<cfset StructClear(session)>
	
	