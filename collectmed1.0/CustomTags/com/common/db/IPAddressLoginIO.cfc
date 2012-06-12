<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- IPAddressLoginIO.cfc                                                           --->
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->
<!--- This tag is a CFC tag tied to the IPAddressLogin table in the dB.              --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_IPAddressLoginTable                                              --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!--- Queryname<br>                                                                  --->
<!--- fields<br>                                                                     --->
<!--- orderby<br>                                                                    --->
<!--- groupby (same as fields contents maybe different order)<br>                    --->
<!--- andclause example.... (CN1= Column Name)                                       --->
<!--- [ andclause="RTRIM(CN1)+''+RTRIM(CN2)='#Var#'" ]<br>                           --->
<!--- IPAddressLoginID<br>                                                           --->
<!--- ClientID<br>                                                                   --->
<!--- StartRange<br>                                                                 --->
<!--- EndRange<br>                                                                   --->
<!--- UsersID<br>                                                                    --->
<!--- Note<br>                                                                       --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- recordID                                                                       --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 11/27/2006                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="IPAddressLoginIO">

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
			variables.instance.IPAddressLoginID = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.StartRange = "";
			variables.instance.EndRange = "";
			variables.instance.UsersID = "NULL";
			variables.instance.Note = "";
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
	<cfset temp = QueryAddRow(defaultsQuery, 10)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "IPADDRESSLOGINID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "STARTRANGE", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENDRANGE", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSID", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "NOTE", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 10)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for IPAddressLoginID.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIPAddressLoginID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IPAddressLoginID>
	</cffunction>
	 
	<cffunction name="setIPAddressLoginID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="IPAddressLoginID" required="Yes" type="String">
		
		<cfif IPAddressLoginID NEQ "NULL">	
			
			<cfif NOT REQUEST.isintDataType(IPAddressLoginID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>IPAddressLoginID</strong> (#IPAddressLoginID#) is not of type <strong>int</strong>.">
			</cfif>
						
			<cfif arguments.IPAddressLoginID EQ "@@">
				<cfset arguments.IPAddressLoginID = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.IPAddressLoginID = arguments.IPAddressLoginID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
			<cfif arguments.ClientID EQ "@@">
				<cfset arguments.ClientID = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for StartRange.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStartRange" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.StartRange>
	</cffunction>
	 
	<cffunction name="setStartRange" access="public" returntype="boolean" output="No">
 		
		<cfargument name="StartRange" required="Yes" type="String">
		
		<cfif StartRange NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(StartRange)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>StartRange</strong> (#StartRange#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(StartRange) GT 18>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>StartRange</strong> cannot be greater than 18 character(s).">
			</cfif>
						
			<cfif arguments.StartRange EQ "@@">
				<cfset arguments.StartRange = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.StartRange = arguments.StartRange>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "StartRange")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EndRange.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEndRange" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EndRange>
	</cffunction>
	 
	<cffunction name="setEndRange" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EndRange" required="Yes" type="String">
		
		<cfif EndRange NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(EndRange)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EndRange</strong> (#EndRange#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(EndRange) GT 18>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>EndRange</strong> cannot be greater than 18 character(s).">
			</cfif>
						
			<cfif arguments.EndRange EQ "@@">
				<cfset arguments.EndRange = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.EndRange = arguments.EndRange>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EndRange")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersID.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersID>
	</cffunction>
	 
	<cffunction name="setUsersID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersID" required="Yes" type="String">
		
		<cfif UsersID NEQ "NULL">	
			
			<cfif NOT REQUEST.isintDataType(UsersID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersID</strong> (#UsersID#) is not of type <strong>int</strong>.">
			</cfif>
						
			<cfif arguments.UsersID EQ "@@">
				<cfset arguments.UsersID = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.UsersID = arguments.UsersID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Note.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getNote" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Note>
	</cffunction>
	 
	<cffunction name="setNote" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Note" required="Yes" type="String">
		
		<cfif Note NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Note)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Note</strong> (#Note#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Note) GT 400>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Note</strong> cannot be greater than 400 character(s).">
			</cfif>
						
			<cfif arguments.Note EQ "@@">
				<cfset arguments.Note = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Note = arguments.Note>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Note")>			
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
			
			<cfif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
			<cfif arguments.Active EQ "@@">
				<cfset arguments.Active = "NULL">
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
			
			<cfif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
			<cfif arguments.InactiveCode EQ "@@">
				<cfset arguments.InactiveCode = "NULL">
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
			
			<cfif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
			<cfif arguments.DateCreated EQ "@@">
				<cfset arguments.DateCreated = "NULL">
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
			
			<cfif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
			<cfif arguments.DateModified EQ "@@">
				<cfset arguments.DateModified = "NULL">
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

		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="StartRange" required="No" type="String" default="">
		<cfargument name="EndRange" required="No" type="String" default="">
		<cfargument name="UsersID" required="No" type="String" default="">
		<cfargument name="Note" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.StartRange = arguments.StartRange>
		<cfset variables.instance.EndRange = arguments.EndRange>
		<cfset variables.instance.UsersID = arguments.UsersID>
		<cfset variables.instance.Note = arguments.Note>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="IPAddressLoginIO" output="No">
		
		<cfargument name="IPAddressLoginID" required="yes" type="numeric">		
		<cfset var qGetIPAddressLogin = "">
		
		<cfset preInit(IPAddressLoginID)>
	
		<cfquery name="qGetIPAddressLogin" datasource="#request.datasource#">
	  		SELECT IPAddressLoginID,ClientID,StartRange,EndRange,UsersID,Note,Active,InactiveCode,DateCreated,DateModified
			FROM IPAddressLogin  
			WHERE IPAddressLoginID = #trim(arguments.IPAddressLoginID)# 
		</cfquery>
		
		<cfif qGetIPAddressLogin.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetIPAddressLogin.IPAddressLoginID EQ "" OR qGetIPAddressLogin.IPAddressLoginID EQ "NULL") 
				variables.instance.IPAddressLoginID = "NULL"; 
			ELSE 
				variables.instance.IPAddressLoginID = qGetIPAddressLogin.IPAddressLoginID;
				
			IF(qGetIPAddressLogin.ClientID EQ "" OR qGetIPAddressLogin.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetIPAddressLogin.ClientID;
							
				variables.instance.StartRange = qGetIPAddressLogin.StartRange;
							
				variables.instance.EndRange = qGetIPAddressLogin.EndRange;
				
			IF(qGetIPAddressLogin.UsersID EQ "" OR qGetIPAddressLogin.UsersID EQ "NULL") 
				variables.instance.UsersID = "NULL"; 
			ELSE 
				variables.instance.UsersID = qGetIPAddressLogin.UsersID;
							
				variables.instance.Note = qGetIPAddressLogin.Note;
							
				variables.instance.Active = qGetIPAddressLogin.Active;
				
			IF(qGetIPAddressLogin.InactiveCode EQ "" OR qGetIPAddressLogin.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetIPAddressLogin.InactiveCode;
							
				variables.instance.DateCreated = qGetIPAddressLogin.DateCreated;
							
				variables.instance.DateModified = qGetIPAddressLogin.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(IPAddressLoginID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitIPAddressLogin = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.IPAddressLoginID) AND variables.instance.IPAddressLoginID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitIPAddressLogin" datasource="#request.datasource#">
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
			
				<cfquery name="qInsertCommitIPAddressLogin" datasource="#request.datasource#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.IPAddressLoginID = qInsertCommitIPAddressLogin.IPAddressLoginID>
				
				<cfreturn qInsertCommitIPAddressLogin.IPAddressLoginID>
			
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
			<cfset tableColumns = "IPAddressLoginID,ClientID,StartRange,EndRange,UsersID,Note,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "StartRange,EndRange,Note,Active">	
			
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
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(NOW()) & ":" & Minute(NOW()) & ":" & SECOND(NOW())>
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
				<cfset sqlStatement = "UPDATE ipaddresslogin  SET #columnsToUpdate# WHERE IPAddressLoginID = #trim(variables.instance.IPAddressLoginID)#">
				
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
			<cfset stringTableColumns = "StartRange,EndRange,Note,Active">	
			
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
			<cfloop list="ClientID,StartRange,EndRange,UsersID,Note,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(NOW()) & ":" & Minute(NOW()) & ":" & SECOND(NOW())>
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
				<cfset sqlStatement = "INSERT INTO ipaddresslogin  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS IPAddressLoginID ">
				
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
	<cffunction name="getIPAddressLoginQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getIPAddressLoginQuery">						
		<cfargument name="Fields" required="No" type="String" default="IPAddressLoginID,ClientID,StartRange,EndRange,UsersID,Note,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="IPAddressLoginID" required="No" type="String" default="">
		<cfargument name="IPAddressLoginID_IN" required="No" type="String" default="">
		<cfargument name="IPAddressLoginID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="StartRange" required="No" type="String" default="">
		<cfargument name="StartRange_IN" required="No" type="String" default="">
		<cfargument name="StartRange_LIKE" required="No" type="String" default="">
		<cfargument name="EndRange" required="No" type="String" default="">
		<cfargument name="EndRange_IN" required="No" type="String" default="">
		<cfargument name="EndRange_LIKE" required="No" type="String" default="">
		<cfargument name="UsersID" required="No" type="String" default="">
		<cfargument name="UsersID_IN" required="No" type="String" default="">
		<cfargument name="UsersID_LIKE" required="No" type="String" default="">
		<cfargument name="Note" required="No" type="String" default="">
		<cfargument name="Note_IN" required="No" type="String" default="">
		<cfargument name="Note_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "IPAddressLoginID,IPAddressLoginID_IN,IPAddressLoginID_LIKE,ClientID,ClientID_IN,ClientID_LIKE,StartRange,StartRange_IN,StartRange_LIKE,EndRange,EndRange_IN,EndRange_LIKE,UsersID,UsersID_IN,UsersID_LIKE,Note,Note_IN,Note_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
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
			<cfquery Name="getIPAddressLoginQuery" datasource="#trim(request.DataSource)#" cachedwithin="#CreateTimeSpan(0,0,0,0)#">
				SELECT #trim(Fields)#
				FROM IPAddressLogin  WHERE 1=1
					<cfif IPAddressLoginID NEQ "" AND IsNumeric(IPAddressLoginID)>AND IPAddressLoginID = #IPAddressLoginID#</cfif>
					<cfif IPAddressLoginID_IN NEQ "">AND IPAddressLoginID IN(#trim(IPAddressLoginID_IN)#)</cfif>
					<cfif IPAddressLoginID_LIKE NEQ "">AND IPAddressLoginID LIKE '%#trim(IPAddressLoginID_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif StartRange NEQ "">AND StartRange = '#StartRange#'</cfif>
					<cfif StartRange_IN NEQ "">AND StartRange IN(#trim(StartRange_IN)#)</cfif>
					<cfif StartRange_LIKE NEQ "">AND StartRange LIKE '%#trim(StartRange_LIKE)#%'</cfif>
					<cfif EndRange NEQ "">AND EndRange = '#EndRange#'</cfif>
					<cfif EndRange_IN NEQ "">AND EndRange IN(#trim(EndRange_IN)#)</cfif>
					<cfif EndRange_LIKE NEQ "">AND EndRange LIKE '%#trim(EndRange_LIKE)#%'</cfif>
					<cfif UsersID NEQ "" AND IsNumeric(UsersID)>AND UsersID = #UsersID#</cfif>
					<cfif UsersID_IN NEQ "">AND UsersID IN(#trim(UsersID_IN)#)</cfif>
					<cfif UsersID_LIKE NEQ "">AND UsersID LIKE '%#trim(UsersID_LIKE)#%'</cfif>
					<cfif Note NEQ "">AND Note = '#Note#'</cfif>
					<cfif Note_IN NEQ "">AND Note IN(#trim(Note_IN)#)</cfif>
					<cfif Note_LIKE NEQ "">AND Note LIKE '%#trim(Note_LIKE)#%'</cfif>
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
			
			<cfreturn getIPAddressLoginQuery>
		
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


