

<cfcomponent hint="">

		
	<cffunction name="process" access="public" output="No">	
		
		<!------------------------------------------------------------------>
		<!--- Initialize tag variables and verify required fields        --->      
		<!------------------------------------------------------------------>
			<cfargument name="usersID" default="" required="true">
			<cfargument name="UsersSessionIdentification" default="" required="true">
			<cfargument name="IPAddress" default="" required="true">		
			
							
		<!-------------------------------------------------------------------------------------->
		<!--- Check to see if the Session.SID is in the database already. The active code    --->
		<!--- must set to 1 because once a user logs in all session records get set to 0     --->
		<!--- which means they are inactive.                                                 --->
		<!-------------------------------------------------------------------------------------->
			<cfset variables.UsersSession = application.beanFactory.getBean('UsersSessionIO')>			
			<cfset PriorUserSIDExists = variables.UsersSession.getUsersSessionQuery(active: 1, usersID: '#trim(usersID)#', UsersSessionIdentification: '#UsersSessionIdentification#')>
				
					
		<!------------------------------------------------------------------>
		<!--- Insert the session variables information into the          --->
		<!--- eiUserSession Table when the user logs in.                 --->
		<!------------------------------------------------------------------>			
			<cfif PriorUserSIDExists.RecordCount LT 1>
						
				<cfset variables.UsersSession.setUsersSessionIdentification('#trim(UsersSessionIdentification)#')>
				<cfset variables.UsersSession.setUsersID('#trim(usersID)#')>		
				<cfset variables.UsersSession.setIPAddress('#trim(IPAddress)#')>
				
			<cfelseif PriorUserSIDExists.RecordCount EQ 1>		
						
				<cfset variables.UsersSession.setUsersSessionID('#trim(PriorUserSIDExists.UsersSessionID)#')>	
				<cfset variables.UsersSession.setUsersSessionIdentification('#trim(PriorUserSIDExists.UsersSessionIdentification)#')>
				<cfset variables.UsersSession.setDateModified('NOW')>
				<cfset variables.UsersSession.setIPAddress('#trim(IPAddress)#')>
				<cfset variables.UsersSession.setUsersID('#trim(usersID)#')>							
						
			</cfif>		
						
		
		<!------------------------------------------------------------------>
		<!--- Commit the changers in either case.                        --->
		<!------------------------------------------------------------------>
			<cfset variables.UsersSession.Commit()>	
	
	
	</cffunction>	
		

</cfcomponent>


