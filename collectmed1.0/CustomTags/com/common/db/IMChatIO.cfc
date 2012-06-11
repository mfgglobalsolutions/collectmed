
<cfcomponent name="IMChatIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.RecordID = "NULL";
			variables.instance.UsersIDFrom = "NULL";
			variables.instance.FromActive = "";
			variables.instance.UsersIDTo = "NULL";
			variables.instance.ToActive = "";
			variables.instance.UsersIDJoined1 = "NULL";
			variables.instance.Joined1Active = "";
			variables.instance.UsersIDJoined2 = "NULL";
			variables.instance.Joined2Active = "";
			variables.instance.UsersIDJoined3 = "NULL";
			variables.instance.Joined3Active = "";
			variables.instance.IMChatXML = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 16)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RECORDID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSIDFROM", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FROMACTIVE", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSIDTO", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOACTIVE", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSIDJOINED1", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "JOINED1ACTIVE", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSIDJOINED2", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "JOINED2ACTIVE", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSIDJOINED3", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "JOINED3ACTIVE", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "IMCHATXML", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "text", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 16)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RecordID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRecordID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RecordID>
	</cffunction>
	 
	<cffunction name="setRecordID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RecordID" required="Yes" type="String">
		
		<cfif RecordID NEQ "NULL">	
			
			<cfif arguments.RecordID EQ "@@" OR arguments.RecordID EQ "">
				
				<cfset arguments.RecordID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(RecordID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RecordID</strong> (#RecordID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RecordID = arguments.RecordID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersIDFrom.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersIDFrom" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersIDFrom>
	</cffunction>
	 
	<cffunction name="setUsersIDFrom" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersIDFrom" required="Yes" type="String">
		
		<cfif UsersIDFrom NEQ "NULL">	
			
			<cfif arguments.UsersIDFrom EQ "@@" OR arguments.UsersIDFrom EQ "">
				
				<cfset arguments.UsersIDFrom = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersIDFrom)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersIDFrom</strong> (#UsersIDFrom#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersIDFrom = arguments.UsersIDFrom>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersIDFrom")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FromActive.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFromActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FromActive>
	</cffunction>
	 
	<cffunction name="setFromActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FromActive" required="Yes" type="String">
		
		<cfif FromActive NEQ "NULL">	
			
			<cfif arguments.FromActive EQ "@@" OR arguments.FromActive EQ "">
				
				<cfset arguments.FromActive = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(FromActive)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FromActive</strong> (#FromActive#) is not of type <strong>char</strong>.">	
			<cfelseif len(FromActive) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FromActive</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FromActive = arguments.FromActive>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FromActive")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersIDTo.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersIDTo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersIDTo>
	</cffunction>
	 
	<cffunction name="setUsersIDTo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersIDTo" required="Yes" type="String">
		
		<cfif UsersIDTo NEQ "NULL">	
			
			<cfif arguments.UsersIDTo EQ "@@" OR arguments.UsersIDTo EQ "">
				
				<cfset arguments.UsersIDTo = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersIDTo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersIDTo</strong> (#UsersIDTo#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersIDTo = arguments.UsersIDTo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersIDTo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ToActive.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getToActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ToActive>
	</cffunction>
	 
	<cffunction name="setToActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ToActive" required="Yes" type="String">
		
		<cfif ToActive NEQ "NULL">	
			
			<cfif arguments.ToActive EQ "@@" OR arguments.ToActive EQ "">
				
				<cfset arguments.ToActive = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(ToActive)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ToActive</strong> (#ToActive#) is not of type <strong>char</strong>.">	
			<cfelseif len(ToActive) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ToActive</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ToActive = arguments.ToActive>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ToActive")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersIDJoined1.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersIDJoined1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersIDJoined1>
	</cffunction>
	 
	<cffunction name="setUsersIDJoined1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersIDJoined1" required="Yes" type="String">
		
		<cfif UsersIDJoined1 NEQ "NULL">	
			
			<cfif arguments.UsersIDJoined1 EQ "@@" OR arguments.UsersIDJoined1 EQ "">
				
				<cfset arguments.UsersIDJoined1 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersIDJoined1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersIDJoined1</strong> (#UsersIDJoined1#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersIDJoined1 = arguments.UsersIDJoined1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersIDJoined1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Joined1Active.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getJoined1Active" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Joined1Active>
	</cffunction>
	 
	<cffunction name="setJoined1Active" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Joined1Active" required="Yes" type="String">
		
		<cfif Joined1Active NEQ "NULL">	
			
			<cfif arguments.Joined1Active EQ "@@" OR arguments.Joined1Active EQ "">
				
				<cfset arguments.Joined1Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Joined1Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Joined1Active</strong> (#Joined1Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Joined1Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Joined1Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Joined1Active = arguments.Joined1Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Joined1Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersIDJoined2.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersIDJoined2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersIDJoined2>
	</cffunction>
	 
	<cffunction name="setUsersIDJoined2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersIDJoined2" required="Yes" type="String">
		
		<cfif UsersIDJoined2 NEQ "NULL">	
			
			<cfif arguments.UsersIDJoined2 EQ "@@" OR arguments.UsersIDJoined2 EQ "">
				
				<cfset arguments.UsersIDJoined2 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersIDJoined2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersIDJoined2</strong> (#UsersIDJoined2#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersIDJoined2 = arguments.UsersIDJoined2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersIDJoined2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Joined2Active.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getJoined2Active" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Joined2Active>
	</cffunction>
	 
	<cffunction name="setJoined2Active" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Joined2Active" required="Yes" type="String">
		
		<cfif Joined2Active NEQ "NULL">	
			
			<cfif arguments.Joined2Active EQ "@@" OR arguments.Joined2Active EQ "">
				
				<cfset arguments.Joined2Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Joined2Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Joined2Active</strong> (#Joined2Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Joined2Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Joined2Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Joined2Active = arguments.Joined2Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Joined2Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersIDJoined3.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersIDJoined3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersIDJoined3>
	</cffunction>
	 
	<cffunction name="setUsersIDJoined3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersIDJoined3" required="Yes" type="String">
		
		<cfif UsersIDJoined3 NEQ "NULL">	
			
			<cfif arguments.UsersIDJoined3 EQ "@@" OR arguments.UsersIDJoined3 EQ "">
				
				<cfset arguments.UsersIDJoined3 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersIDJoined3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersIDJoined3</strong> (#UsersIDJoined3#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersIDJoined3 = arguments.UsersIDJoined3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersIDJoined3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Joined3Active.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getJoined3Active" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Joined3Active>
	</cffunction>
	 
	<cffunction name="setJoined3Active" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Joined3Active" required="Yes" type="String">
		
		<cfif Joined3Active NEQ "NULL">	
			
			<cfif arguments.Joined3Active EQ "@@" OR arguments.Joined3Active EQ "">
				
				<cfset arguments.Joined3Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Joined3Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Joined3Active</strong> (#Joined3Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Joined3Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Joined3Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Joined3Active = arguments.Joined3Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Joined3Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for IMChatXML.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIMChatXML" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IMChatXML>
	</cffunction>
	 
	<cffunction name="setIMChatXML" access="public" returntype="boolean" output="No">
 		
		<cfargument name="IMChatXML" required="Yes" type="String">
		
		<cfif IMChatXML NEQ "NULL">	
			
			<cfif arguments.IMChatXML EQ "@@" OR arguments.IMChatXML EQ "">
				
				<cfset arguments.IMChatXML = "NULL">
						
			<cfelseif NOT REQUEST.istextDataType(IMChatXML)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>IMChatXML</strong> (#IMChatXML#) is not of type <strong>text</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.IMChatXML = arguments.IMChatXML>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "IMChatXML")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="UsersIDFrom" required="No" type="String" default="">
		<cfargument name="FromActive" required="No" type="String" default="">
		<cfargument name="UsersIDTo" required="No" type="String" default="">
		<cfargument name="ToActive" required="No" type="String" default="">
		<cfargument name="UsersIDJoined1" required="No" type="String" default="">
		<cfargument name="Joined1Active" required="No" type="String" default="">
		<cfargument name="UsersIDJoined2" required="No" type="String" default="">
		<cfargument name="Joined2Active" required="No" type="String" default="">
		<cfargument name="UsersIDJoined3" required="No" type="String" default="">
		<cfargument name="Joined3Active" required="No" type="String" default="">
		<cfargument name="IMChatXML" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.UsersIDFrom = arguments.UsersIDFrom>
		<cfset variables.instance.FromActive = arguments.FromActive>
		<cfset variables.instance.UsersIDTo = arguments.UsersIDTo>
		<cfset variables.instance.ToActive = arguments.ToActive>
		<cfset variables.instance.UsersIDJoined1 = arguments.UsersIDJoined1>
		<cfset variables.instance.Joined1Active = arguments.Joined1Active>
		<cfset variables.instance.UsersIDJoined2 = arguments.UsersIDJoined2>
		<cfset variables.instance.Joined2Active = arguments.Joined2Active>
		<cfset variables.instance.UsersIDJoined3 = arguments.UsersIDJoined3>
		<cfset variables.instance.Joined3Active = arguments.Joined3Active>
		<cfset variables.instance.IMChatXML = arguments.IMChatXML>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitIMChatIO" access="public" returntype="IMChatIO" output="No">
		
		<cfargument name="RecordID" required="yes" type="numeric">		
		<cfset var qGetIMChat = "">
		
		<cfset preInit(RecordID)>
	
		<cfquery name="qGetIMChat" datasource="#trim(request.datasource)#">
	  		SELECT RecordID,UsersIDFrom,FromActive,UsersIDTo,ToActive,UsersIDJoined1,Joined1Active,UsersIDJoined2,Joined2Active,UsersIDJoined3,Joined3Active,IMChatXML,Active,InactiveCode,DateCreated,DateModified
			FROM imchat  
			WHERE RecordID = #trim(arguments.RecordID)# 
		</cfquery>
		
		<cfif qGetIMChat.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetIMChat.RecordID EQ "" OR qGetIMChat.RecordID EQ "NULL") 
				variables.instance.RecordID = "NULL"; 
			ELSE 
				variables.instance.RecordID = qGetIMChat.RecordID;
				
			IF(qGetIMChat.UsersIDFrom EQ "" OR qGetIMChat.UsersIDFrom EQ "NULL") 
				variables.instance.UsersIDFrom = "NULL"; 
			ELSE 
				variables.instance.UsersIDFrom = qGetIMChat.UsersIDFrom;
							
				variables.instance.FromActive = qGetIMChat.FromActive;
				
			IF(qGetIMChat.UsersIDTo EQ "" OR qGetIMChat.UsersIDTo EQ "NULL") 
				variables.instance.UsersIDTo = "NULL"; 
			ELSE 
				variables.instance.UsersIDTo = qGetIMChat.UsersIDTo;
							
				variables.instance.ToActive = qGetIMChat.ToActive;
				
			IF(qGetIMChat.UsersIDJoined1 EQ "" OR qGetIMChat.UsersIDJoined1 EQ "NULL") 
				variables.instance.UsersIDJoined1 = "NULL"; 
			ELSE 
				variables.instance.UsersIDJoined1 = qGetIMChat.UsersIDJoined1;
							
				variables.instance.Joined1Active = qGetIMChat.Joined1Active;
				
			IF(qGetIMChat.UsersIDJoined2 EQ "" OR qGetIMChat.UsersIDJoined2 EQ "NULL") 
				variables.instance.UsersIDJoined2 = "NULL"; 
			ELSE 
				variables.instance.UsersIDJoined2 = qGetIMChat.UsersIDJoined2;
							
				variables.instance.Joined2Active = qGetIMChat.Joined2Active;
				
			IF(qGetIMChat.UsersIDJoined3 EQ "" OR qGetIMChat.UsersIDJoined3 EQ "NULL") 
				variables.instance.UsersIDJoined3 = "NULL"; 
			ELSE 
				variables.instance.UsersIDJoined3 = qGetIMChat.UsersIDJoined3;
							
				variables.instance.Joined3Active = qGetIMChat.Joined3Active;
							
				variables.instance.IMChatXML = qGetIMChat.IMChatXML;
							
				variables.instance.Active = qGetIMChat.Active;
				
			IF(qGetIMChat.InactiveCode EQ "" OR qGetIMChat.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetIMChat.InactiveCode;
							
				variables.instance.DateCreated = qGetIMChat.DateCreated;
							
				variables.instance.DateModified = qGetIMChat.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(RecordID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitIMChat = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.RecordID) AND variables.instance.RecordID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitIMChat" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitIMChat" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.RecordID = qInsertCommitIMChat.RecordID>
				
				<cfreturn qInsertCommitIMChat.RecordID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "RecordID,UsersIDFrom,FromActive,UsersIDTo,ToActive,UsersIDJoined1,Joined1Active,UsersIDJoined2,Joined2Active,UsersIDJoined3,Joined3Active,IMChatXML,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "FromActive,ToActive,Joined1Active,Joined2Active,Joined3Active,IMChatXML,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE IMChat  SET #columnsToUpdate# WHERE RecordID = #trim(variables.instance.RecordID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "FromActive,ToActive,Joined1Active,Joined2Active,Joined3Active,IMChatXML,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="UsersIDFrom,FromActive,UsersIDTo,ToActive,UsersIDJoined1,Joined1Active,UsersIDJoined2,Joined2Active,UsersIDJoined3,Joined3Active,IMChatXML,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO imchat  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS RecordID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIMChatQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getIMChatQuery">						
		<cfargument name="Fields" required="No" type="String" default="RecordID,UsersIDFrom,FromActive,UsersIDTo,ToActive,UsersIDJoined1,Joined1Active,UsersIDJoined2,Joined2Active,UsersIDJoined3,Joined3Active,IMChatXML,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="RecordID" required="No" type="String" default="">
		<cfargument name="RecordID_IN" required="No" type="String" default="">
		<cfargument name="RecordID_LIKE" required="No" type="String" default="">
		<cfargument name="UsersIDFrom" required="No" type="String" default="">
		<cfargument name="UsersIDFrom_IN" required="No" type="String" default="">
		<cfargument name="UsersIDFrom_LIKE" required="No" type="String" default="">
		<cfargument name="FromActive" required="No" type="String" default="">
		<cfargument name="FromActive_IN" required="No" type="String" default="">
		<cfargument name="FromActive_LIKE" required="No" type="String" default="">
		<cfargument name="UsersIDTo" required="No" type="String" default="">
		<cfargument name="UsersIDTo_IN" required="No" type="String" default="">
		<cfargument name="UsersIDTo_LIKE" required="No" type="String" default="">
		<cfargument name="ToActive" required="No" type="String" default="">
		<cfargument name="ToActive_IN" required="No" type="String" default="">
		<cfargument name="ToActive_LIKE" required="No" type="String" default="">
		<cfargument name="UsersIDJoined1" required="No" type="String" default="">
		<cfargument name="UsersIDJoined1_IN" required="No" type="String" default="">
		<cfargument name="UsersIDJoined1_LIKE" required="No" type="String" default="">
		<cfargument name="Joined1Active" required="No" type="String" default="">
		<cfargument name="Joined1Active_IN" required="No" type="String" default="">
		<cfargument name="Joined1Active_LIKE" required="No" type="String" default="">
		<cfargument name="UsersIDJoined2" required="No" type="String" default="">
		<cfargument name="UsersIDJoined2_IN" required="No" type="String" default="">
		<cfargument name="UsersIDJoined2_LIKE" required="No" type="String" default="">
		<cfargument name="Joined2Active" required="No" type="String" default="">
		<cfargument name="Joined2Active_IN" required="No" type="String" default="">
		<cfargument name="Joined2Active_LIKE" required="No" type="String" default="">
		<cfargument name="UsersIDJoined3" required="No" type="String" default="">
		<cfargument name="UsersIDJoined3_IN" required="No" type="String" default="">
		<cfargument name="UsersIDJoined3_LIKE" required="No" type="String" default="">
		<cfargument name="Joined3Active" required="No" type="String" default="">
		<cfargument name="Joined3Active_IN" required="No" type="String" default="">
		<cfargument name="Joined3Active_LIKE" required="No" type="String" default="">
		<cfargument name="IMChatXML" required="No" type="String" default="">
		<cfargument name="IMChatXML_IN" required="No" type="String" default="">
		<cfargument name="IMChatXML_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "RecordID,RecordID_IN,RecordID_LIKE,UsersIDFrom,UsersIDFrom_IN,UsersIDFrom_LIKE,FromActive,FromActive_IN,FromActive_LIKE,UsersIDTo,UsersIDTo_IN,UsersIDTo_LIKE,ToActive,ToActive_IN,ToActive_LIKE,UsersIDJoined1,UsersIDJoined1_IN,UsersIDJoined1_LIKE,Joined1Active,Joined1Active_IN,Joined1Active_LIKE,UsersIDJoined2,UsersIDJoined2_IN,UsersIDJoined2_LIKE,Joined2Active,Joined2Active_IN,Joined2Active_LIKE,UsersIDJoined3,UsersIDJoined3_IN,UsersIDJoined3_LIKE,Joined3Active,Joined3Active_IN,Joined3Active_LIKE,IMChatXML,IMChatXML_IN,IMChatXML_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="IMChat"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getIMChatQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM imchat   
				WHERE 1=1
					<cfif RecordID NEQ "" AND IsNumeric(RecordID)>AND RecordID = #RecordID#</cfif>
					<cfif RecordID_IN NEQ "">AND RecordID IN(#trim(RecordID_IN)#)</cfif>
					<cfif RecordID_LIKE NEQ "">AND RecordID LIKE '%#trim(RecordID_LIKE)#%'</cfif>
					<cfif UsersIDFrom NEQ "" AND IsNumeric(UsersIDFrom)>AND UsersIDFrom = #UsersIDFrom#</cfif>
					<cfif UsersIDFrom_IN NEQ "">AND UsersIDFrom IN(#trim(UsersIDFrom_IN)#)</cfif>
					<cfif UsersIDFrom_LIKE NEQ "">AND UsersIDFrom LIKE '%#trim(UsersIDFrom_LIKE)#%'</cfif>
					<cfif FromActive NEQ "">AND FromActive = '#FromActive#'</cfif>
					<cfif FromActive_IN NEQ "">AND FromActive IN(#trim(FromActive_IN)#)</cfif>
					<cfif FromActive_LIKE NEQ "">AND FromActive LIKE '%#trim(FromActive_LIKE)#%'</cfif>
					<cfif UsersIDTo NEQ "" AND IsNumeric(UsersIDTo)>AND UsersIDTo = #UsersIDTo#</cfif>
					<cfif UsersIDTo_IN NEQ "">AND UsersIDTo IN(#trim(UsersIDTo_IN)#)</cfif>
					<cfif UsersIDTo_LIKE NEQ "">AND UsersIDTo LIKE '%#trim(UsersIDTo_LIKE)#%'</cfif>
					<cfif ToActive NEQ "">AND ToActive = '#ToActive#'</cfif>
					<cfif ToActive_IN NEQ "">AND ToActive IN(#trim(ToActive_IN)#)</cfif>
					<cfif ToActive_LIKE NEQ "">AND ToActive LIKE '%#trim(ToActive_LIKE)#%'</cfif>
					<cfif UsersIDJoined1 NEQ "" AND IsNumeric(UsersIDJoined1)>AND UsersIDJoined1 = #UsersIDJoined1#</cfif>
					<cfif UsersIDJoined1_IN NEQ "">AND UsersIDJoined1 IN(#trim(UsersIDJoined1_IN)#)</cfif>
					<cfif UsersIDJoined1_LIKE NEQ "">AND UsersIDJoined1 LIKE '%#trim(UsersIDJoined1_LIKE)#%'</cfif>
					<cfif Joined1Active NEQ "">AND Joined1Active = '#Joined1Active#'</cfif>
					<cfif Joined1Active_IN NEQ "">AND Joined1Active IN(#trim(Joined1Active_IN)#)</cfif>
					<cfif Joined1Active_LIKE NEQ "">AND Joined1Active LIKE '%#trim(Joined1Active_LIKE)#%'</cfif>
					<cfif UsersIDJoined2 NEQ "" AND IsNumeric(UsersIDJoined2)>AND UsersIDJoined2 = #UsersIDJoined2#</cfif>
					<cfif UsersIDJoined2_IN NEQ "">AND UsersIDJoined2 IN(#trim(UsersIDJoined2_IN)#)</cfif>
					<cfif UsersIDJoined2_LIKE NEQ "">AND UsersIDJoined2 LIKE '%#trim(UsersIDJoined2_LIKE)#%'</cfif>
					<cfif Joined2Active NEQ "">AND Joined2Active = '#Joined2Active#'</cfif>
					<cfif Joined2Active_IN NEQ "">AND Joined2Active IN(#trim(Joined2Active_IN)#)</cfif>
					<cfif Joined2Active_LIKE NEQ "">AND Joined2Active LIKE '%#trim(Joined2Active_LIKE)#%'</cfif>
					<cfif UsersIDJoined3 NEQ "" AND IsNumeric(UsersIDJoined3)>AND UsersIDJoined3 = #UsersIDJoined3#</cfif>
					<cfif UsersIDJoined3_IN NEQ "">AND UsersIDJoined3 IN(#trim(UsersIDJoined3_IN)#)</cfif>
					<cfif UsersIDJoined3_LIKE NEQ "">AND UsersIDJoined3 LIKE '%#trim(UsersIDJoined3_LIKE)#%'</cfif>
					<cfif Joined3Active NEQ "">AND Joined3Active = '#Joined3Active#'</cfif>
					<cfif Joined3Active_IN NEQ "">AND Joined3Active IN(#trim(Joined3Active_IN)#)</cfif>
					<cfif Joined3Active_LIKE NEQ "">AND Joined3Active LIKE '%#trim(Joined3Active_LIKE)#%'</cfif>
					<cfif IMChatXML NEQ "">AND IMChatXML = '#IMChatXML#'</cfif>
					<cfif IMChatXML_IN NEQ "">AND IMChatXML IN(#trim(IMChatXML_IN)#)</cfif>
					<cfif IMChatXML_LIKE NEQ "">AND IMChatXML LIKE '%#trim(IMChatXML_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getIMChatQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




