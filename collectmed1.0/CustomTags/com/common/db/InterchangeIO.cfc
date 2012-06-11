<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- InterchangeIO.cfc                                                              --->
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
<!--- This tag is a CFC tag tied to the Interchange table in the dB.                 --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_InterchangeTable                                                 --->  
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
<!--- InterchangeID<br>                                                              --->
<!--- FileID<br>                                                                     --->
<!--- InterchangeFileID<br>                                                          --->
<!--- InterchangeDate<br>                                                            --->
<!--- ClientID<br>                                                                   --->
<!--- InterchangeClientName<br>                                                      --->
<!--- InterchangeClientAddressLine1<br>                                              --->
<!--- InterchangeClientAddressLine2<br>                                              --->
<!--- InterchangeClientCity<br>                                                      --->
<!--- InterchangeClientState<br>                                                     --->
<!--- InterchangeClientZipcode<br>                                                   --->
<!--- LXAssignedNumber<br>                                                           --->
<!--- ReassociationTraceNumber<br>                                                   --->
<!--- InterchangeSenderIDQualifier<br>                                               --->
<!--- InterchangeSenderID<br>                                                        --->
<!--- InterchangeReceiverIDQualifier<br>                                             --->
<!--- InterchangeReceiverID<br>                                                      --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->  
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
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="InterchangeIO">

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
			variables.instance.InterchangeID = "NULL";
			variables.instance.FileID = "NULL";
			variables.instance.InterchangeFileID = "";
			variables.instance.InterchangeDate = "";
			variables.instance.ClientID = "NULL";
			variables.instance.InterchangeClientName = "";
			variables.instance.InterchangeClientAddressLine1 = "";
			variables.instance.InterchangeClientAddressLine2 = "";
			variables.instance.InterchangeClientCity = "";
			variables.instance.InterchangeClientState = "";
			variables.instance.InterchangeClientZipcode = "";
			variables.instance.LXAssignedNumber = "";
			variables.instance.ReassociationTraceNumber = "";
			variables.instance.InterchangeSenderIDQualifier = "";
			variables.instance.InterchangeSenderID = "";
			variables.instance.InterchangeReceiverIDQualifier = "";
			variables.instance.InterchangeReceiverID = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 20)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGEFILEID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGEDATE", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLIENTNAME", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLIENTADDRESSLINE1", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLIENTADDRESSLINE2", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLIENTCITY", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLIENTSTATE", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLIENTZIPCODE", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LXASSIGNEDNUMBER", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "REASSOCIATIONTRACENUMBER", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGESENDERIDQUALIFIER", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGESENDERID", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGERECEIVERIDQUALIFIER", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGERECEIVERID", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 20)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeID.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeID>
	</cffunction>
	 
	<cffunction name="setInterchangeID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeID" required="Yes" type="String">
		
		<cfif InterchangeID NEQ "NULL">	
			
			<cfif arguments.InterchangeID EQ "@@" OR arguments.InterchangeID EQ "">
				
				<cfset arguments.InterchangeID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InterchangeID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeID</strong> (#InterchangeID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeID = arguments.InterchangeID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileID.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileID>
	</cffunction>
	 
	<cffunction name="setFileID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileID" required="Yes" type="String">
		
		<cfif FileID NEQ "NULL">	
			
			<cfif arguments.FileID EQ "@@" OR arguments.FileID EQ "">
				
				<cfset arguments.FileID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(FileID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileID</strong> (#FileID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileID = arguments.FileID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeFileID.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeFileID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeFileID>
	</cffunction>
	 
	<cffunction name="setInterchangeFileID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeFileID" required="Yes" type="String">
		
		<cfif InterchangeFileID NEQ "NULL">	
			
			<cfif arguments.InterchangeFileID EQ "@@" OR arguments.InterchangeFileID EQ "">
				
				<cfset arguments.InterchangeFileID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeFileID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeFileID</strong> (#InterchangeFileID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeFileID) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeFileID</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeFileID = arguments.InterchangeFileID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeFileID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeDate.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeDate>
	</cffunction>
	 
	<cffunction name="setInterchangeDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeDate" required="Yes" type="String">
		
		<cfif InterchangeDate NEQ "NULL" AND InterchangeDate NEQ "NOW">	
			
			<cfif arguments.InterchangeDate EQ "@@" OR arguments.InterchangeDate EQ "">
				
				<cfset arguments.InterchangeDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(InterchangeDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeDate</strong> (#InterchangeDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeDate = arguments.InterchangeDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeDate")>			
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
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeClientName.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClientName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClientName>
	</cffunction>
	 
	<cffunction name="setInterchangeClientName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClientName" required="Yes" type="String">
		
		<cfif InterchangeClientName NEQ "NULL">	
			
			<cfif arguments.InterchangeClientName EQ "@@" OR arguments.InterchangeClientName EQ "">
				
				<cfset arguments.InterchangeClientName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClientName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClientName</strong> (#InterchangeClientName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeClientName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClientName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClientName = arguments.InterchangeClientName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClientName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeClientAddressLine1.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClientAddressLine1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClientAddressLine1>
	</cffunction>
	 
	<cffunction name="setInterchangeClientAddressLine1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClientAddressLine1" required="Yes" type="String">
		
		<cfif InterchangeClientAddressLine1 NEQ "NULL">	
			
			<cfif arguments.InterchangeClientAddressLine1 EQ "@@" OR arguments.InterchangeClientAddressLine1 EQ "">
				
				<cfset arguments.InterchangeClientAddressLine1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClientAddressLine1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClientAddressLine1</strong> (#InterchangeClientAddressLine1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeClientAddressLine1) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClientAddressLine1</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClientAddressLine1 = arguments.InterchangeClientAddressLine1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClientAddressLine1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeClientAddressLine2.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClientAddressLine2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClientAddressLine2>
	</cffunction>
	 
	<cffunction name="setInterchangeClientAddressLine2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClientAddressLine2" required="Yes" type="String">
		
		<cfif InterchangeClientAddressLine2 NEQ "NULL">	
			
			<cfif arguments.InterchangeClientAddressLine2 EQ "@@" OR arguments.InterchangeClientAddressLine2 EQ "">
				
				<cfset arguments.InterchangeClientAddressLine2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClientAddressLine2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClientAddressLine2</strong> (#InterchangeClientAddressLine2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeClientAddressLine2) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClientAddressLine2</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClientAddressLine2 = arguments.InterchangeClientAddressLine2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClientAddressLine2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeClientCity.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClientCity" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClientCity>
	</cffunction>
	 
	<cffunction name="setInterchangeClientCity" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClientCity" required="Yes" type="String">
		
		<cfif InterchangeClientCity NEQ "NULL">	
			
			<cfif arguments.InterchangeClientCity EQ "@@" OR arguments.InterchangeClientCity EQ "">
				
				<cfset arguments.InterchangeClientCity = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClientCity)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClientCity</strong> (#InterchangeClientCity#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeClientCity) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClientCity</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClientCity = arguments.InterchangeClientCity>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClientCity")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeClientState.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClientState" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClientState>
	</cffunction>
	 
	<cffunction name="setInterchangeClientState" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClientState" required="Yes" type="String">
		
		<cfif InterchangeClientState NEQ "NULL">	
			
			<cfif arguments.InterchangeClientState EQ "@@" OR arguments.InterchangeClientState EQ "">
				
				<cfset arguments.InterchangeClientState = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClientState)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClientState</strong> (#InterchangeClientState#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeClientState) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClientState</strong> cannot be greater than 25 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClientState = arguments.InterchangeClientState>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClientState")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeClientZipcode.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClientZipcode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClientZipcode>
	</cffunction>
	 
	<cffunction name="setInterchangeClientZipcode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClientZipcode" required="Yes" type="String">
		
		<cfif InterchangeClientZipcode NEQ "NULL">	
			
			<cfif arguments.InterchangeClientZipcode EQ "@@" OR arguments.InterchangeClientZipcode EQ "">
				
				<cfset arguments.InterchangeClientZipcode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClientZipcode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClientZipcode</strong> (#InterchangeClientZipcode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeClientZipcode) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClientZipcode</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClientZipcode = arguments.InterchangeClientZipcode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClientZipcode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LXAssignedNumber.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLXAssignedNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LXAssignedNumber>
	</cffunction>
	 
	<cffunction name="setLXAssignedNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LXAssignedNumber" required="Yes" type="String">
		
		<cfif LXAssignedNumber NEQ "NULL">	
			
			<cfif arguments.LXAssignedNumber EQ "@@" OR arguments.LXAssignedNumber EQ "">
				
				<cfset arguments.LXAssignedNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LXAssignedNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LXAssignedNumber</strong> (#LXAssignedNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LXAssignedNumber) GT 5>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LXAssignedNumber</strong> cannot be greater than 5 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LXAssignedNumber = arguments.LXAssignedNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LXAssignedNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ReassociationTraceNumber.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getReassociationTraceNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ReassociationTraceNumber>
	</cffunction>
	 
	<cffunction name="setReassociationTraceNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ReassociationTraceNumber" required="Yes" type="String">
		
		<cfif ReassociationTraceNumber NEQ "NULL">	
			
			<cfif arguments.ReassociationTraceNumber EQ "@@" OR arguments.ReassociationTraceNumber EQ "">
				
				<cfset arguments.ReassociationTraceNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ReassociationTraceNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ReassociationTraceNumber</strong> (#ReassociationTraceNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ReassociationTraceNumber) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ReassociationTraceNumber</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ReassociationTraceNumber = arguments.ReassociationTraceNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ReassociationTraceNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeSenderIDQualifier.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeSenderIDQualifier" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeSenderIDQualifier>
	</cffunction>
	 
	<cffunction name="setInterchangeSenderIDQualifier" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeSenderIDQualifier" required="Yes" type="String">
		
		<cfif InterchangeSenderIDQualifier NEQ "NULL">	
			
			<cfif arguments.InterchangeSenderIDQualifier EQ "@@" OR arguments.InterchangeSenderIDQualifier EQ "">
				
				<cfset arguments.InterchangeSenderIDQualifier = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeSenderIDQualifier)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeSenderIDQualifier</strong> (#InterchangeSenderIDQualifier#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeSenderIDQualifier) GT 2>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeSenderIDQualifier</strong> cannot be greater than 2 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeSenderIDQualifier = arguments.InterchangeSenderIDQualifier>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeSenderIDQualifier")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeSenderID.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeSenderID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeSenderID>
	</cffunction>
	 
	<cffunction name="setInterchangeSenderID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeSenderID" required="Yes" type="String">
		
		<cfif InterchangeSenderID NEQ "NULL">	
			
			<cfif arguments.InterchangeSenderID EQ "@@" OR arguments.InterchangeSenderID EQ "">
				
				<cfset arguments.InterchangeSenderID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeSenderID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeSenderID</strong> (#InterchangeSenderID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeSenderID) GT 15>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeSenderID</strong> cannot be greater than 15 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeSenderID = arguments.InterchangeSenderID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeSenderID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeReceiverIDQualifier.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeReceiverIDQualifier" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeReceiverIDQualifier>
	</cffunction>
	 
	<cffunction name="setInterchangeReceiverIDQualifier" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeReceiverIDQualifier" required="Yes" type="String">
		
		<cfif InterchangeReceiverIDQualifier NEQ "NULL">	
			
			<cfif arguments.InterchangeReceiverIDQualifier EQ "@@" OR arguments.InterchangeReceiverIDQualifier EQ "">
				
				<cfset arguments.InterchangeReceiverIDQualifier = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeReceiverIDQualifier)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeReceiverIDQualifier</strong> (#InterchangeReceiverIDQualifier#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeReceiverIDQualifier) GT 2>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeReceiverIDQualifier</strong> cannot be greater than 2 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeReceiverIDQualifier = arguments.InterchangeReceiverIDQualifier>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeReceiverIDQualifier")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeReceiverID.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeReceiverID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeReceiverID>
	</cffunction>
	 
	<cffunction name="setInterchangeReceiverID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeReceiverID" required="Yes" type="String">
		
		<cfif InterchangeReceiverID NEQ "NULL">	
			
			<cfif arguments.InterchangeReceiverID EQ "@@" OR arguments.InterchangeReceiverID EQ "">
				
				<cfset arguments.InterchangeReceiverID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeReceiverID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeReceiverID</strong> (#InterchangeReceiverID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeReceiverID) GT 15>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeReceiverID</strong> cannot be greater than 15 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeReceiverID = arguments.InterchangeReceiverID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeReceiverID")>			
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
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="FileID" required="No" type="String" default="">
		<cfargument name="InterchangeFileID" required="No" type="String" default="">
		<cfargument name="InterchangeDate" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="InterchangeClientName" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine1" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine2" required="No" type="String" default="">
		<cfargument name="InterchangeClientCity" required="No" type="String" default="">
		<cfargument name="InterchangeClientState" required="No" type="String" default="">
		<cfargument name="InterchangeClientZipcode" required="No" type="String" default="">
		<cfargument name="LXAssignedNumber" required="No" type="String" default="">
		<cfargument name="ReassociationTraceNumber" required="No" type="String" default="">
		<cfargument name="InterchangeSenderIDQualifier" required="No" type="String" default="">
		<cfargument name="InterchangeSenderID" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverIDQualifier" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverID" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">

		<cfset variables.instance.FileID = arguments.FileID>
		<cfset variables.instance.InterchangeFileID = arguments.InterchangeFileID>
		<cfset variables.instance.InterchangeDate = arguments.InterchangeDate>
		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.InterchangeClientName = arguments.InterchangeClientName>
		<cfset variables.instance.InterchangeClientAddressLine1 = arguments.InterchangeClientAddressLine1>
		<cfset variables.instance.InterchangeClientAddressLine2 = arguments.InterchangeClientAddressLine2>
		<cfset variables.instance.InterchangeClientCity = arguments.InterchangeClientCity>
		<cfset variables.instance.InterchangeClientState = arguments.InterchangeClientState>
		<cfset variables.instance.InterchangeClientZipcode = arguments.InterchangeClientZipcode>
		<cfset variables.instance.LXAssignedNumber = arguments.LXAssignedNumber>
		<cfset variables.instance.ReassociationTraceNumber = arguments.ReassociationTraceNumber>
		<cfset variables.instance.InterchangeSenderIDQualifier = arguments.InterchangeSenderIDQualifier>
		<cfset variables.instance.InterchangeSenderID = arguments.InterchangeSenderID>
		<cfset variables.instance.InterchangeReceiverIDQualifier = arguments.InterchangeReceiverIDQualifier>
		<cfset variables.instance.InterchangeReceiverID = arguments.InterchangeReceiverID>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="InterchangeIO" output="No">
		
		<cfargument name="InterchangeID" required="yes" type="numeric">		
		<cfset var qGetInterchange = "">
		
		<cfset preInit(InterchangeID)>
	
		<cfquery name="qGetInterchange" datasource="#trim(request.datasource)#">
	  		SELECT InterchangeID,FileID,InterchangeFileID,InterchangeDate,ClientID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active,InactiveCode,DateCreated
			FROM interchange  
			WHERE InterchangeID = #trim(arguments.InterchangeID)# 
		</cfquery>
		
		<cfif qGetInterchange.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetInterchange.InterchangeID EQ "" OR qGetInterchange.InterchangeID EQ "NULL") 
				variables.instance.InterchangeID = "NULL"; 
			ELSE 
				variables.instance.InterchangeID = qGetInterchange.InterchangeID;
				
			IF(qGetInterchange.FileID EQ "" OR qGetInterchange.FileID EQ "NULL") 
				variables.instance.FileID = "NULL"; 
			ELSE 
				variables.instance.FileID = qGetInterchange.FileID;
							
				variables.instance.InterchangeFileID = qGetInterchange.InterchangeFileID;
							
				variables.instance.InterchangeDate = qGetInterchange.InterchangeDate;
				
			IF(qGetInterchange.ClientID EQ "" OR qGetInterchange.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetInterchange.ClientID;
							
				variables.instance.InterchangeClientName = qGetInterchange.InterchangeClientName;
							
				variables.instance.InterchangeClientAddressLine1 = qGetInterchange.InterchangeClientAddressLine1;
							
				variables.instance.InterchangeClientAddressLine2 = qGetInterchange.InterchangeClientAddressLine2;
							
				variables.instance.InterchangeClientCity = qGetInterchange.InterchangeClientCity;
							
				variables.instance.InterchangeClientState = qGetInterchange.InterchangeClientState;
							
				variables.instance.InterchangeClientZipcode = qGetInterchange.InterchangeClientZipcode;
							
				variables.instance.LXAssignedNumber = qGetInterchange.LXAssignedNumber;
							
				variables.instance.ReassociationTraceNumber = qGetInterchange.ReassociationTraceNumber;
							
				variables.instance.InterchangeSenderIDQualifier = qGetInterchange.InterchangeSenderIDQualifier;
							
				variables.instance.InterchangeSenderID = qGetInterchange.InterchangeSenderID;
							
				variables.instance.InterchangeReceiverIDQualifier = qGetInterchange.InterchangeReceiverIDQualifier;
							
				variables.instance.InterchangeReceiverID = qGetInterchange.InterchangeReceiverID;
							
				variables.instance.Active = qGetInterchange.Active;
				
			IF(qGetInterchange.InactiveCode EQ "" OR qGetInterchange.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetInterchange.InactiveCode;
							
				variables.instance.DateCreated = qGetInterchange.DateCreated;
				
		</cfscript>		
		  
		<cfset postInit(InterchangeID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitInterchange = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.InterchangeID) AND variables.instance.InterchangeID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitInterchange" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitInterchange" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.InterchangeID = qInsertCommitInterchange.InterchangeID>
				
				<cfreturn qInsertCommitInterchange.InterchangeID>
			
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
			<cfset tableColumns = "InterchangeID,FileID,InterchangeFileID,InterchangeDate,ClientID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active,InactiveCode,DateCreated">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "InterchangeFileID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "InterchangeDate,DateCreated">

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
				<cfset sqlStatement = "UPDATE Interchange  SET #columnsToUpdate# WHERE InterchangeID = #trim(variables.instance.InterchangeID)#">
				
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
			<cfset stringTableColumns = "InterchangeFileID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "InterchangeDate,DateCreated">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="FileID,InterchangeFileID,InterchangeDate,ClientID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active,InactiveCode,DateCreated" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO interchange  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS InterchangeID ">
				
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
	<cffunction name="getInterchangeQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getInterchangeQuery">						
		<cfargument name="Fields" required="No" type="String" default="InterchangeID,FileID,InterchangeFileID,InterchangeDate,ClientID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active,InactiveCode,DateCreated">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="InterchangeID" required="No" type="String" default="">
		<cfargument name="InterchangeID_IN" required="No" type="String" default="">
		<cfargument name="InterchangeID_LIKE" required="No" type="String" default="">
		<cfargument name="FileID" required="No" type="String" default="">
		<cfargument name="FileID_IN" required="No" type="String" default="">
		<cfargument name="FileID_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeFileID" required="No" type="String" default="">
		<cfargument name="InterchangeFileID_IN" required="No" type="String" default="">
		<cfargument name="InterchangeFileID_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeDate" required="No" type="String" default="">
		<cfargument name="InterchangeDate_IN" required="No" type="String" default="">
		<cfargument name="InterchangeDate_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeClientName" required="No" type="String" default="">
		<cfargument name="InterchangeClientName_IN" required="No" type="String" default="">
		<cfargument name="InterchangeClientName_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine1" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine1_IN" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine1_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine2" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine2_IN" required="No" type="String" default="">
		<cfargument name="InterchangeClientAddressLine2_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeClientCity" required="No" type="String" default="">
		<cfargument name="InterchangeClientCity_IN" required="No" type="String" default="">
		<cfargument name="InterchangeClientCity_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeClientState" required="No" type="String" default="">
		<cfargument name="InterchangeClientState_IN" required="No" type="String" default="">
		<cfargument name="InterchangeClientState_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeClientZipcode" required="No" type="String" default="">
		<cfargument name="InterchangeClientZipcode_IN" required="No" type="String" default="">
		<cfargument name="InterchangeClientZipcode_LIKE" required="No" type="String" default="">
		<cfargument name="LXAssignedNumber" required="No" type="String" default="">
		<cfargument name="LXAssignedNumber_IN" required="No" type="String" default="">
		<cfargument name="LXAssignedNumber_LIKE" required="No" type="String" default="">
		<cfargument name="ReassociationTraceNumber" required="No" type="String" default="">
		<cfargument name="ReassociationTraceNumber_IN" required="No" type="String" default="">
		<cfargument name="ReassociationTraceNumber_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeSenderIDQualifier" required="No" type="String" default="">
		<cfargument name="InterchangeSenderIDQualifier_IN" required="No" type="String" default="">
		<cfargument name="InterchangeSenderIDQualifier_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeSenderID" required="No" type="String" default="">
		<cfargument name="InterchangeSenderID_IN" required="No" type="String" default="">
		<cfargument name="InterchangeSenderID_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverIDQualifier" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverIDQualifier_IN" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverIDQualifier_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverID" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverID_IN" required="No" type="String" default="">
		<cfargument name="InterchangeReceiverID_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">

		
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
			<cfset availableColumns = "InterchangeID,InterchangeID_IN,InterchangeID_LIKE,FileID,FileID_IN,FileID_LIKE,InterchangeFileID,InterchangeFileID_IN,InterchangeFileID_LIKE,InterchangeDate,InterchangeDate_IN,InterchangeDate_LIKE,ClientID,ClientID_IN,ClientID_LIKE,InterchangeClientName,InterchangeClientName_IN,InterchangeClientName_LIKE,InterchangeClientAddressLine1,InterchangeClientAddressLine1_IN,InterchangeClientAddressLine1_LIKE,InterchangeClientAddressLine2,InterchangeClientAddressLine2_IN,InterchangeClientAddressLine2_LIKE,InterchangeClientCity,InterchangeClientCity_IN,InterchangeClientCity_LIKE,InterchangeClientState,InterchangeClientState_IN,InterchangeClientState_LIKE,InterchangeClientZipcode,InterchangeClientZipcode_IN,InterchangeClientZipcode_LIKE,LXAssignedNumber,LXAssignedNumber_IN,LXAssignedNumber_LIKE,ReassociationTraceNumber,ReassociationTraceNumber_IN,ReassociationTraceNumber_LIKE,InterchangeSenderIDQualifier,InterchangeSenderIDQualifier_IN,InterchangeSenderIDQualifier_LIKE,InterchangeSenderID,InterchangeSenderID_IN,InterchangeSenderID_LIKE,InterchangeReceiverIDQualifier,InterchangeReceiverIDQualifier_IN,InterchangeReceiverIDQualifier_LIKE,InterchangeReceiverID,InterchangeReceiverID_IN,InterchangeReceiverID_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Interchange"
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
			<cfquery Name="getInterchangeQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM interchange   
				WHERE 1=1
					<cfif InterchangeID NEQ "" AND IsNumeric(InterchangeID)>AND InterchangeID = #InterchangeID#</cfif>
					<cfif InterchangeID_IN NEQ "">AND InterchangeID IN(#trim(InterchangeID_IN)#)</cfif>
					<cfif InterchangeID_LIKE NEQ "">AND InterchangeID LIKE '%#trim(InterchangeID_LIKE)#%'</cfif>
					<cfif FileID NEQ "" AND IsNumeric(FileID)>AND FileID = #FileID#</cfif>
					<cfif FileID_IN NEQ "">AND FileID IN(#trim(FileID_IN)#)</cfif>
					<cfif FileID_LIKE NEQ "">AND FileID LIKE '%#trim(FileID_LIKE)#%'</cfif>
					<cfif InterchangeFileID NEQ "">AND InterchangeFileID = '#InterchangeFileID#'</cfif>
					<cfif InterchangeFileID_IN NEQ "">AND InterchangeFileID IN(#trim(InterchangeFileID_IN)#)</cfif>
					<cfif InterchangeFileID_LIKE NEQ "">AND InterchangeFileID LIKE '%#trim(InterchangeFileID_LIKE)#%'</cfif>
					<cfif InterchangeDate NEQ "">AND InterchangeDate = '#InterchangeDate#'</cfif>
					<cfif InterchangeDate_IN NEQ "">AND InterchangeDate IN(#trim(InterchangeDate_IN)#)</cfif>
					<cfif InterchangeDate_LIKE NEQ "">AND InterchangeDate LIKE '%#trim(InterchangeDate_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif InterchangeClientName NEQ "">AND InterchangeClientName = '#InterchangeClientName#'</cfif>
					<cfif InterchangeClientName_IN NEQ "">AND InterchangeClientName IN(#trim(InterchangeClientName_IN)#)</cfif>
					<cfif InterchangeClientName_LIKE NEQ "">AND InterchangeClientName LIKE '%#trim(InterchangeClientName_LIKE)#%'</cfif>
					<cfif InterchangeClientAddressLine1 NEQ "">AND InterchangeClientAddressLine1 = '#InterchangeClientAddressLine1#'</cfif>
					<cfif InterchangeClientAddressLine1_IN NEQ "">AND InterchangeClientAddressLine1 IN(#trim(InterchangeClientAddressLine1_IN)#)</cfif>
					<cfif InterchangeClientAddressLine1_LIKE NEQ "">AND InterchangeClientAddressLine1 LIKE '%#trim(InterchangeClientAddressLine1_LIKE)#%'</cfif>
					<cfif InterchangeClientAddressLine2 NEQ "">AND InterchangeClientAddressLine2 = '#InterchangeClientAddressLine2#'</cfif>
					<cfif InterchangeClientAddressLine2_IN NEQ "">AND InterchangeClientAddressLine2 IN(#trim(InterchangeClientAddressLine2_IN)#)</cfif>
					<cfif InterchangeClientAddressLine2_LIKE NEQ "">AND InterchangeClientAddressLine2 LIKE '%#trim(InterchangeClientAddressLine2_LIKE)#%'</cfif>
					<cfif InterchangeClientCity NEQ "">AND InterchangeClientCity = '#InterchangeClientCity#'</cfif>
					<cfif InterchangeClientCity_IN NEQ "">AND InterchangeClientCity IN(#trim(InterchangeClientCity_IN)#)</cfif>
					<cfif InterchangeClientCity_LIKE NEQ "">AND InterchangeClientCity LIKE '%#trim(InterchangeClientCity_LIKE)#%'</cfif>
					<cfif InterchangeClientState NEQ "">AND InterchangeClientState = '#InterchangeClientState#'</cfif>
					<cfif InterchangeClientState_IN NEQ "">AND InterchangeClientState IN(#trim(InterchangeClientState_IN)#)</cfif>
					<cfif InterchangeClientState_LIKE NEQ "">AND InterchangeClientState LIKE '%#trim(InterchangeClientState_LIKE)#%'</cfif>
					<cfif InterchangeClientZipcode NEQ "">AND InterchangeClientZipcode = '#InterchangeClientZipcode#'</cfif>
					<cfif InterchangeClientZipcode_IN NEQ "">AND InterchangeClientZipcode IN(#trim(InterchangeClientZipcode_IN)#)</cfif>
					<cfif InterchangeClientZipcode_LIKE NEQ "">AND InterchangeClientZipcode LIKE '%#trim(InterchangeClientZipcode_LIKE)#%'</cfif>
					<cfif LXAssignedNumber NEQ "">AND LXAssignedNumber = '#LXAssignedNumber#'</cfif>
					<cfif LXAssignedNumber_IN NEQ "">AND LXAssignedNumber IN(#trim(LXAssignedNumber_IN)#)</cfif>
					<cfif LXAssignedNumber_LIKE NEQ "">AND LXAssignedNumber LIKE '%#trim(LXAssignedNumber_LIKE)#%'</cfif>
					<cfif ReassociationTraceNumber NEQ "">AND ReassociationTraceNumber = '#ReassociationTraceNumber#'</cfif>
					<cfif ReassociationTraceNumber_IN NEQ "">AND ReassociationTraceNumber IN(#trim(ReassociationTraceNumber_IN)#)</cfif>
					<cfif ReassociationTraceNumber_LIKE NEQ "">AND ReassociationTraceNumber LIKE '%#trim(ReassociationTraceNumber_LIKE)#%'</cfif>
					<cfif InterchangeSenderIDQualifier NEQ "">AND InterchangeSenderIDQualifier = '#InterchangeSenderIDQualifier#'</cfif>
					<cfif InterchangeSenderIDQualifier_IN NEQ "">AND InterchangeSenderIDQualifier IN(#trim(InterchangeSenderIDQualifier_IN)#)</cfif>
					<cfif InterchangeSenderIDQualifier_LIKE NEQ "">AND InterchangeSenderIDQualifier LIKE '%#trim(InterchangeSenderIDQualifier_LIKE)#%'</cfif>
					<cfif InterchangeSenderID NEQ "">AND InterchangeSenderID = '#InterchangeSenderID#'</cfif>
					<cfif InterchangeSenderID_IN NEQ "">AND InterchangeSenderID IN(#trim(InterchangeSenderID_IN)#)</cfif>
					<cfif InterchangeSenderID_LIKE NEQ "">AND InterchangeSenderID LIKE '%#trim(InterchangeSenderID_LIKE)#%'</cfif>
					<cfif InterchangeReceiverIDQualifier NEQ "">AND InterchangeReceiverIDQualifier = '#InterchangeReceiverIDQualifier#'</cfif>
					<cfif InterchangeReceiverIDQualifier_IN NEQ "">AND InterchangeReceiverIDQualifier IN(#trim(InterchangeReceiverIDQualifier_IN)#)</cfif>
					<cfif InterchangeReceiverIDQualifier_LIKE NEQ "">AND InterchangeReceiverIDQualifier LIKE '%#trim(InterchangeReceiverIDQualifier_LIKE)#%'</cfif>
					<cfif InterchangeReceiverID NEQ "">AND InterchangeReceiverID = '#InterchangeReceiverID#'</cfif>
					<cfif InterchangeReceiverID_IN NEQ "">AND InterchangeReceiverID IN(#trim(InterchangeReceiverID_IN)#)</cfif>
					<cfif InterchangeReceiverID_LIKE NEQ "">AND InterchangeReceiverID LIKE '%#trim(InterchangeReceiverID_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getInterchangeQuery>
		
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




