<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- FileIO.cfc                                                                     --->
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
<!--- This tag is a CFC tag tied to the File table in the dB.                        --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_FileTable                                                        --->  
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
<!--- FileID<br>                                                                     --->
<!--- FileType<br>                                                                   --->
<!--- ClientID<br>                                                                   --->
<!--- DisplayInGUID<br>                                                              --->
<!--- ParentFileID<br>                                                               --->
<!--- UsersID<br>                                                                    --->
<!--- FilePlacementDirectory<br>                                                     --->
<!--- AttemptedServerFile<br>                                                        --->
<!--- ClientDirectory<br>                                                            --->
<!--- ClientFile<br>                                                                 --->
<!--- ClientFileExt<br>                                                              --->
<!--- ClientFileName<br>                                                             --->
<!--- ContentSubType<br>                                                             --->
<!--- ContentType<br>                                                                --->
<!--- DateLastAccessed<br>                                                           --->
<!--- FileExisted<br>                                                                --->
<!--- FileSize<br>                                                                   --->
<!--- FileWasAppended<br>                                                            --->
<!--- FileWasOverwritten<br>                                                         --->
<!--- FileWasRenamed<br>                                                             --->
<!--- FileWasSaved<br>                                                               --->
<!--- OldFileSize<br>                                                                --->
<!--- ServerDirectory<br>                                                            --->
<!--- ServerFile<br>                                                                 --->
<!--- ServerFileExt<br>                                                              --->
<!--- ServerFileName<br>                                                             --->
<!--- TimeCreated<br>                                                                --->
<!--- TimeLastModified<br>                                                           --->
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
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="FileIO">

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
			variables.instance.FileID = "NULL";
			variables.instance.FileType = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.DisplayInGUID = "NULL";
			variables.instance.ParentFileID = "NULL";
			variables.instance.UsersID = "NULL";
			variables.instance.FilePlacementDirectory = "";
			variables.instance.AttemptedServerFile = "";
			variables.instance.ClientDirectory = "";
			variables.instance.ClientFile = "";
			variables.instance.ClientFileExt = "";
			variables.instance.ClientFileName = "";
			variables.instance.ContentSubType = "";
			variables.instance.ContentType = "";
			variables.instance.DateLastAccessed = "";
			variables.instance.FileExisted = "";
			variables.instance.FileSize = "";
			variables.instance.FileWasAppended = "";
			variables.instance.FileWasOverwritten = "";
			variables.instance.FileWasRenamed = "";
			variables.instance.FileWasSaved = "";
			variables.instance.OldFileSize = "";
			variables.instance.ServerDirectory = "";
			variables.instance.ServerFile = "";
			variables.instance.ServerFileExt = "";
			variables.instance.ServerFileName = "";
			variables.instance.TimeCreated = "";
			variables.instance.TimeLastModified = "";
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
	<cfset temp = QueryAddRow(defaultsQuery, 32)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILETYPE", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TIMECREATED", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TIMELASTMODIFIED", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DISPLAYINGUID", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PARENTFILEID", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSID", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEPLACEMENTDIRECTORY", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ATTEMPTEDSERVERFILE", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTDIRECTORY", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTFILE", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTFILEEXT", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTFILENAME", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CONTENTSUBTYPE", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CONTENTTYPE", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATELASTACCESSED", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEEXISTED", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILESIZE", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEWASAPPENDED", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEWASOVERWRITTEN", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEWASRENAMED", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILEWASSAVED", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OLDFILESIZE", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SERVERDIRECTORY", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SERVERFILE", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SERVERFILEEXT", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SERVERFILENAME", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 32)>
	

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
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileType.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileType" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileType>
	</cffunction>
	 
	<cffunction name="setFileType" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileType" required="Yes" type="String">
		
		<cfif FileType NEQ "NULL">	
			
			<cfif arguments.FileType EQ "@@" OR arguments.FileType EQ "">
				
				<cfset arguments.FileType = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(FileType)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileType</strong> (#FileType#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileType = arguments.FileType>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileType")>			
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
	<!--- GET and SET method for DisplayInGUID.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDisplayInGUID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DisplayInGUID>
	</cffunction>
	 
	<cffunction name="setDisplayInGUID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DisplayInGUID" required="Yes" type="String">
		
		<cfif DisplayInGUID NEQ "NULL">	
			
			<cfif arguments.DisplayInGUID EQ "@@" OR arguments.DisplayInGUID EQ "">
				
				<cfset arguments.DisplayInGUID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(DisplayInGUID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DisplayInGUID</strong> (#DisplayInGUID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DisplayInGUID = arguments.DisplayInGUID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DisplayInGUID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ParentFileID.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getParentFileID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ParentFileID>
	</cffunction>
	 
	<cffunction name="setParentFileID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ParentFileID" required="Yes" type="String">
		
		<cfif ParentFileID NEQ "NULL">	
			
			<cfif arguments.ParentFileID EQ "@@" OR arguments.ParentFileID EQ "">
				
				<cfset arguments.ParentFileID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ParentFileID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ParentFileID</strong> (#ParentFileID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ParentFileID = arguments.ParentFileID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ParentFileID")>			
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
			
			<cfif arguments.UsersID EQ "@@" OR arguments.UsersID EQ "">
				
				<cfset arguments.UsersID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersID</strong> (#UsersID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersID = arguments.UsersID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UsersID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FilePlacementDirectory.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFilePlacementDirectory" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FilePlacementDirectory>
	</cffunction>
	 
	<cffunction name="setFilePlacementDirectory" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FilePlacementDirectory" required="Yes" type="String">
		
		<cfif FilePlacementDirectory NEQ "NULL">	
			
			<cfif arguments.FilePlacementDirectory EQ "@@" OR arguments.FilePlacementDirectory EQ "">
				
				<cfset arguments.FilePlacementDirectory = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FilePlacementDirectory)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FilePlacementDirectory</strong> (#FilePlacementDirectory#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FilePlacementDirectory) GT 400>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FilePlacementDirectory</strong> cannot be greater than 400 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FilePlacementDirectory = arguments.FilePlacementDirectory>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FilePlacementDirectory")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AttemptedServerFile.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAttemptedServerFile" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AttemptedServerFile>
	</cffunction>
	 
	<cffunction name="setAttemptedServerFile" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AttemptedServerFile" required="Yes" type="String">
		
		<cfif AttemptedServerFile NEQ "NULL">	
			
			<cfif arguments.AttemptedServerFile EQ "@@" OR arguments.AttemptedServerFile EQ "">
				
				<cfset arguments.AttemptedServerFile = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AttemptedServerFile)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AttemptedServerFile</strong> (#AttemptedServerFile#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(AttemptedServerFile) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AttemptedServerFile</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AttemptedServerFile = arguments.AttemptedServerFile>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AttemptedServerFile")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientDirectory.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientDirectory" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientDirectory>
	</cffunction>
	 
	<cffunction name="setClientDirectory" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientDirectory" required="Yes" type="String">
		
		<cfif ClientDirectory NEQ "NULL">	
			
			<cfif arguments.ClientDirectory EQ "@@" OR arguments.ClientDirectory EQ "">
				
				<cfset arguments.ClientDirectory = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientDirectory)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientDirectory</strong> (#ClientDirectory#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientDirectory) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientDirectory</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientDirectory = arguments.ClientDirectory>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientDirectory")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientFile.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientFile" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientFile>
	</cffunction>
	 
	<cffunction name="setClientFile" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientFile" required="Yes" type="String">
		
		<cfif ClientFile NEQ "NULL">	
			
			<cfif arguments.ClientFile EQ "@@" OR arguments.ClientFile EQ "">
				
				<cfset arguments.ClientFile = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientFile)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientFile</strong> (#ClientFile#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientFile) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientFile</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientFile = arguments.ClientFile>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientFile")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientFileExt.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientFileExt" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientFileExt>
	</cffunction>
	 
	<cffunction name="setClientFileExt" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientFileExt" required="Yes" type="String">
		
		<cfif ClientFileExt NEQ "NULL">	
			
			<cfif arguments.ClientFileExt EQ "@@" OR arguments.ClientFileExt EQ "">
				
				<cfset arguments.ClientFileExt = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientFileExt)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientFileExt</strong> (#ClientFileExt#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientFileExt) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientFileExt</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientFileExt = arguments.ClientFileExt>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientFileExt")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientFileName.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientFileName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientFileName>
	</cffunction>
	 
	<cffunction name="setClientFileName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientFileName" required="Yes" type="String">
		
		<cfif ClientFileName NEQ "NULL">	
			
			<cfif arguments.ClientFileName EQ "@@" OR arguments.ClientFileName EQ "">
				
				<cfset arguments.ClientFileName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientFileName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientFileName</strong> (#ClientFileName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientFileName) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientFileName</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientFileName = arguments.ClientFileName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientFileName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ContentSubType.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getContentSubType" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ContentSubType>
	</cffunction>
	 
	<cffunction name="setContentSubType" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ContentSubType" required="Yes" type="String">
		
		<cfif ContentSubType NEQ "NULL">	
			
			<cfif arguments.ContentSubType EQ "@@" OR arguments.ContentSubType EQ "">
				
				<cfset arguments.ContentSubType = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ContentSubType)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ContentSubType</strong> (#ContentSubType#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ContentSubType) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ContentSubType</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ContentSubType = arguments.ContentSubType>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ContentSubType")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ContentType.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getContentType" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ContentType>
	</cffunction>
	 
	<cffunction name="setContentType" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ContentType" required="Yes" type="String">
		
		<cfif ContentType NEQ "NULL">	
			
			<cfif arguments.ContentType EQ "@@" OR arguments.ContentType EQ "">
				
				<cfset arguments.ContentType = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ContentType)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ContentType</strong> (#ContentType#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ContentType) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ContentType</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ContentType = arguments.ContentType>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ContentType")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateLastAccessed.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateLastAccessed" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateLastAccessed>
	</cffunction>
	 
	<cffunction name="setDateLastAccessed" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateLastAccessed" required="Yes" type="String">
		
		<cfif DateLastAccessed NEQ "NULL" AND DateLastAccessed NEQ "NOW">	
			
			<cfif arguments.DateLastAccessed EQ "@@" OR arguments.DateLastAccessed EQ "">
				
				<cfset arguments.DateLastAccessed = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateLastAccessed)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateLastAccessed</strong> (#DateLastAccessed#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateLastAccessed = arguments.DateLastAccessed>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateLastAccessed")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileExisted.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileExisted" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileExisted>
	</cffunction>
	 
	<cffunction name="setFileExisted" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileExisted" required="Yes" type="String">
		
		<cfif FileExisted NEQ "NULL">	
			
			<cfif arguments.FileExisted EQ "@@" OR arguments.FileExisted EQ "">
				
				<cfset arguments.FileExisted = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FileExisted)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileExisted</strong> (#FileExisted#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FileExisted) GT 5>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FileExisted</strong> cannot be greater than 5 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileExisted = arguments.FileExisted>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileExisted")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileSize.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileSize" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileSize>
	</cffunction>
	 
	<cffunction name="setFileSize" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileSize" required="Yes" type="String">
		
		<cfif FileSize NEQ "NULL">	
			
			<cfif arguments.FileSize EQ "@@" OR arguments.FileSize EQ "">
				
				<cfset arguments.FileSize = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FileSize)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileSize</strong> (#FileSize#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FileSize) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FileSize</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileSize = arguments.FileSize>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileSize")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileWasAppended.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileWasAppended" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileWasAppended>
	</cffunction>
	 
	<cffunction name="setFileWasAppended" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileWasAppended" required="Yes" type="String">
		
		<cfif FileWasAppended NEQ "NULL">	
			
			<cfif arguments.FileWasAppended EQ "@@" OR arguments.FileWasAppended EQ "">
				
				<cfset arguments.FileWasAppended = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FileWasAppended)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileWasAppended</strong> (#FileWasAppended#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FileWasAppended) GT 5>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FileWasAppended</strong> cannot be greater than 5 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileWasAppended = arguments.FileWasAppended>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileWasAppended")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileWasOverwritten.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileWasOverwritten" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileWasOverwritten>
	</cffunction>
	 
	<cffunction name="setFileWasOverwritten" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileWasOverwritten" required="Yes" type="String">
		
		<cfif FileWasOverwritten NEQ "NULL">	
			
			<cfif arguments.FileWasOverwritten EQ "@@" OR arguments.FileWasOverwritten EQ "">
				
				<cfset arguments.FileWasOverwritten = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FileWasOverwritten)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileWasOverwritten</strong> (#FileWasOverwritten#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FileWasOverwritten) GT 5>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FileWasOverwritten</strong> cannot be greater than 5 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileWasOverwritten = arguments.FileWasOverwritten>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileWasOverwritten")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileWasRenamed.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileWasRenamed" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileWasRenamed>
	</cffunction>
	 
	<cffunction name="setFileWasRenamed" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileWasRenamed" required="Yes" type="String">
		
		<cfif FileWasRenamed NEQ "NULL">	
			
			<cfif arguments.FileWasRenamed EQ "@@" OR arguments.FileWasRenamed EQ "">
				
				<cfset arguments.FileWasRenamed = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FileWasRenamed)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileWasRenamed</strong> (#FileWasRenamed#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FileWasRenamed) GT 5>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FileWasRenamed</strong> cannot be greater than 5 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileWasRenamed = arguments.FileWasRenamed>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileWasRenamed")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FileWasSaved.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileWasSaved" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FileWasSaved>
	</cffunction>
	 
	<cffunction name="setFileWasSaved" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FileWasSaved" required="Yes" type="String">
		
		<cfif FileWasSaved NEQ "NULL">	
			
			<cfif arguments.FileWasSaved EQ "@@" OR arguments.FileWasSaved EQ "">
				
				<cfset arguments.FileWasSaved = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FileWasSaved)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FileWasSaved</strong> (#FileWasSaved#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FileWasSaved) GT 5>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FileWasSaved</strong> cannot be greater than 5 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FileWasSaved = arguments.FileWasSaved>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FileWasSaved")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OldFileSize.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOldFileSize" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OldFileSize>
	</cffunction>
	 
	<cffunction name="setOldFileSize" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OldFileSize" required="Yes" type="String">
		
		<cfif OldFileSize NEQ "NULL">	
			
			<cfif arguments.OldFileSize EQ "@@" OR arguments.OldFileSize EQ "">
				
				<cfset arguments.OldFileSize = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OldFileSize)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OldFileSize</strong> (#OldFileSize#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OldFileSize) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OldFileSize</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OldFileSize = arguments.OldFileSize>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OldFileSize")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ServerDirectory.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getServerDirectory" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ServerDirectory>
	</cffunction>
	 
	<cffunction name="setServerDirectory" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ServerDirectory" required="Yes" type="String">
		
		<cfif ServerDirectory NEQ "NULL">	
			
			<cfif arguments.ServerDirectory EQ "@@" OR arguments.ServerDirectory EQ "">
				
				<cfset arguments.ServerDirectory = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ServerDirectory)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ServerDirectory</strong> (#ServerDirectory#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ServerDirectory) GT 400>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ServerDirectory</strong> cannot be greater than 400 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ServerDirectory = arguments.ServerDirectory>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ServerDirectory")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ServerFile.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getServerFile" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ServerFile>
	</cffunction>
	 
	<cffunction name="setServerFile" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ServerFile" required="Yes" type="String">
		
		<cfif ServerFile NEQ "NULL">	
			
			<cfif arguments.ServerFile EQ "@@" OR arguments.ServerFile EQ "">
				
				<cfset arguments.ServerFile = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ServerFile)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ServerFile</strong> (#ServerFile#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ServerFile) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ServerFile</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ServerFile = arguments.ServerFile>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ServerFile")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ServerFileExt.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getServerFileExt" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ServerFileExt>
	</cffunction>
	 
	<cffunction name="setServerFileExt" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ServerFileExt" required="Yes" type="String">
		
		<cfif ServerFileExt NEQ "NULL">	
			
			<cfif arguments.ServerFileExt EQ "@@" OR arguments.ServerFileExt EQ "">
				
				<cfset arguments.ServerFileExt = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ServerFileExt)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ServerFileExt</strong> (#ServerFileExt#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ServerFileExt) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ServerFileExt</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ServerFileExt = arguments.ServerFileExt>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ServerFileExt")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ServerFileName.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getServerFileName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ServerFileName>
	</cffunction>
	 
	<cffunction name="setServerFileName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ServerFileName" required="Yes" type="String">
		
		<cfif ServerFileName NEQ "NULL">	
			
			<cfif arguments.ServerFileName EQ "@@" OR arguments.ServerFileName EQ "">
				
				<cfset arguments.ServerFileName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ServerFileName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ServerFileName</strong> (#ServerFileName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ServerFileName) GT 400>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ServerFileName</strong> cannot be greater than 400 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ServerFileName = arguments.ServerFileName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ServerFileName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TimeCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTimeCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TimeCreated>
	</cffunction>
	 
	<cffunction name="setTimeCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TimeCreated" required="Yes" type="String">
		
		<cfif TimeCreated NEQ "NULL" AND TimeCreated NEQ "NOW">	
			
			<cfif arguments.TimeCreated EQ "@@" OR arguments.TimeCreated EQ "">
				
				<cfset arguments.TimeCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(TimeCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TimeCreated</strong> (#TimeCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TimeCreated = arguments.TimeCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TimeCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TimeLastModified.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTimeLastModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TimeLastModified>
	</cffunction>
	 
	<cffunction name="setTimeLastModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TimeLastModified" required="Yes" type="String">
		
		<cfif TimeLastModified NEQ "NULL" AND TimeLastModified NEQ "NOW">	
			
			<cfif arguments.TimeLastModified EQ "@@" OR arguments.TimeLastModified EQ "">
				
				<cfset arguments.TimeLastModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(TimeLastModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TimeLastModified</strong> (#TimeLastModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TimeLastModified = arguments.TimeLastModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TimeLastModified")>			
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

		<cfargument name="FileType" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="DisplayInGUID" required="No" type="String" default="">
		<cfargument name="ParentFileID" required="No" type="String" default="">
		<cfargument name="UsersID" required="No" type="String" default="">
		<cfargument name="FilePlacementDirectory" required="No" type="String" default="">
		<cfargument name="AttemptedServerFile" required="No" type="String" default="">
		<cfargument name="ClientDirectory" required="No" type="String" default="">
		<cfargument name="ClientFile" required="No" type="String" default="">
		<cfargument name="ClientFileExt" required="No" type="String" default="">
		<cfargument name="ClientFileName" required="No" type="String" default="">
		<cfargument name="ContentSubType" required="No" type="String" default="">
		<cfargument name="ContentType" required="No" type="String" default="">
		<cfargument name="DateLastAccessed" required="No" type="String" default="">
		<cfargument name="FileExisted" required="No" type="String" default="">
		<cfargument name="FileSize" required="No" type="String" default="">
		<cfargument name="FileWasAppended" required="No" type="String" default="">
		<cfargument name="FileWasOverwritten" required="No" type="String" default="">
		<cfargument name="FileWasRenamed" required="No" type="String" default="">
		<cfargument name="FileWasSaved" required="No" type="String" default="">
		<cfargument name="OldFileSize" required="No" type="String" default="">
		<cfargument name="ServerDirectory" required="No" type="String" default="">
		<cfargument name="ServerFile" required="No" type="String" default="">
		<cfargument name="ServerFileExt" required="No" type="String" default="">
		<cfargument name="ServerFileName" required="No" type="String" default="">
		<cfargument name="TimeCreated" required="No" type="String" default="">
		<cfargument name="TimeLastModified" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.FileType = arguments.FileType>
		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.DisplayInGUID = arguments.DisplayInGUID>
		<cfset variables.instance.ParentFileID = arguments.ParentFileID>
		<cfset variables.instance.UsersID = arguments.UsersID>
		<cfset variables.instance.FilePlacementDirectory = arguments.FilePlacementDirectory>
		<cfset variables.instance.AttemptedServerFile = arguments.AttemptedServerFile>
		<cfset variables.instance.ClientDirectory = arguments.ClientDirectory>
		<cfset variables.instance.ClientFile = arguments.ClientFile>
		<cfset variables.instance.ClientFileExt = arguments.ClientFileExt>
		<cfset variables.instance.ClientFileName = arguments.ClientFileName>
		<cfset variables.instance.ContentSubType = arguments.ContentSubType>
		<cfset variables.instance.ContentType = arguments.ContentType>
		<cfset variables.instance.DateLastAccessed = arguments.DateLastAccessed>
		<cfset variables.instance.FileExisted = arguments.FileExisted>
		<cfset variables.instance.FileSize = arguments.FileSize>
		<cfset variables.instance.FileWasAppended = arguments.FileWasAppended>
		<cfset variables.instance.FileWasOverwritten = arguments.FileWasOverwritten>
		<cfset variables.instance.FileWasRenamed = arguments.FileWasRenamed>
		<cfset variables.instance.FileWasSaved = arguments.FileWasSaved>
		<cfset variables.instance.OldFileSize = arguments.OldFileSize>
		<cfset variables.instance.ServerDirectory = arguments.ServerDirectory>
		<cfset variables.instance.ServerFile = arguments.ServerFile>
		<cfset variables.instance.ServerFileExt = arguments.ServerFileExt>
		<cfset variables.instance.ServerFileName = arguments.ServerFileName>
		<cfset variables.instance.TimeCreated = arguments.TimeCreated>
		<cfset variables.instance.TimeLastModified = arguments.TimeLastModified>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="FileIO" output="No">
		
		<cfargument name="FileID" required="yes" type="numeric">		
		<cfset var qGetFile = "">
		
		<cfset preInit(FileID)>
	
		<cfquery name="qGetFile" datasource="#trim(request.datasource)#">
	  		SELECT FileID,FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,Active,InactiveCode,DateCreated,DateModified
			FROM file  
			WHERE FileID = #trim(arguments.FileID)# 
		</cfquery>
		
		<cfif qGetFile.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetFile.FileID EQ "" OR qGetFile.FileID EQ "NULL") 
				variables.instance.FileID = "NULL"; 
			ELSE 
				variables.instance.FileID = qGetFile.FileID;
				
			IF(qGetFile.FileType EQ "" OR qGetFile.FileType EQ "NULL") 
				variables.instance.FileType = "NULL"; 
			ELSE 
				variables.instance.FileType = qGetFile.FileType;
				
			IF(qGetFile.ClientID EQ "" OR qGetFile.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetFile.ClientID;
				
			IF(qGetFile.DisplayInGUID EQ "" OR qGetFile.DisplayInGUID EQ "NULL") 
				variables.instance.DisplayInGUID = "NULL"; 
			ELSE 
				variables.instance.DisplayInGUID = qGetFile.DisplayInGUID;
				
			IF(qGetFile.ParentFileID EQ "" OR qGetFile.ParentFileID EQ "NULL") 
				variables.instance.ParentFileID = "NULL"; 
			ELSE 
				variables.instance.ParentFileID = qGetFile.ParentFileID;
				
			IF(qGetFile.UsersID EQ "" OR qGetFile.UsersID EQ "NULL") 
				variables.instance.UsersID = "NULL"; 
			ELSE 
				variables.instance.UsersID = qGetFile.UsersID;
							
				variables.instance.FilePlacementDirectory = qGetFile.FilePlacementDirectory;
							
				variables.instance.AttemptedServerFile = qGetFile.AttemptedServerFile;
							
				variables.instance.ClientDirectory = qGetFile.ClientDirectory;
							
				variables.instance.ClientFile = qGetFile.ClientFile;
							
				variables.instance.ClientFileExt = qGetFile.ClientFileExt;
							
				variables.instance.ClientFileName = qGetFile.ClientFileName;
							
				variables.instance.ContentSubType = qGetFile.ContentSubType;
							
				variables.instance.ContentType = qGetFile.ContentType;
							
				variables.instance.DateLastAccessed = qGetFile.DateLastAccessed;
							
				variables.instance.FileExisted = qGetFile.FileExisted;
							
				variables.instance.FileSize = qGetFile.FileSize;
							
				variables.instance.FileWasAppended = qGetFile.FileWasAppended;
							
				variables.instance.FileWasOverwritten = qGetFile.FileWasOverwritten;
							
				variables.instance.FileWasRenamed = qGetFile.FileWasRenamed;
							
				variables.instance.FileWasSaved = qGetFile.FileWasSaved;
							
				variables.instance.OldFileSize = qGetFile.OldFileSize;
							
				variables.instance.ServerDirectory = qGetFile.ServerDirectory;
							
				variables.instance.ServerFile = qGetFile.ServerFile;
							
				variables.instance.ServerFileExt = qGetFile.ServerFileExt;
							
				variables.instance.ServerFileName = qGetFile.ServerFileName;
							
				variables.instance.TimeCreated = qGetFile.TimeCreated;
							
				variables.instance.TimeLastModified = qGetFile.TimeLastModified;
							
				variables.instance.Active = qGetFile.Active;
				
			IF(qGetFile.InactiveCode EQ "" OR qGetFile.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetFile.InactiveCode;
							
				variables.instance.DateCreated = qGetFile.DateCreated;
							
				variables.instance.DateModified = qGetFile.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(FileID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitFile = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.FileID) AND variables.instance.FileID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitFile" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitFile" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.FileID = qInsertCommitFile.FileID>
				
				<cfreturn qInsertCommitFile.FileID>
			
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
			<cfset tableColumns = "FileID,FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateLastAccessed,TimeCreated,TimeLastModified,DateCreated,DateModified">

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
				<cfset sqlStatement = "UPDATE File  SET #columnsToUpdate# WHERE FileID = #trim(variables.instance.FileID)#">
				
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
			<cfset stringTableColumns = "FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateLastAccessed,TimeCreated,TimeLastModified,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO file  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS FileID ">
				
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
	<cffunction name="getFileQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getFileQuery">						
		<cfargument name="Fields" required="No" type="String" default="FileID,FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="FileID" required="No" type="String" default="">
		<cfargument name="FileID_IN" required="No" type="String" default="">
		<cfargument name="FileID_LIKE" required="No" type="String" default="">
		<cfargument name="FileType" required="No" type="String" default="">
		<cfargument name="FileType_IN" required="No" type="String" default="">
		<cfargument name="FileType_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="DisplayInGUID" required="No" type="String" default="">
		<cfargument name="DisplayInGUID_IN" required="No" type="String" default="">
		<cfargument name="DisplayInGUID_LIKE" required="No" type="String" default="">
		<cfargument name="ParentFileID" required="No" type="String" default="">
		<cfargument name="ParentFileID_IN" required="No" type="String" default="">
		<cfargument name="ParentFileID_LIKE" required="No" type="String" default="">
		<cfargument name="UsersID" required="No" type="String" default="">
		<cfargument name="UsersID_IN" required="No" type="String" default="">
		<cfargument name="UsersID_LIKE" required="No" type="String" default="">
		<cfargument name="FilePlacementDirectory" required="No" type="String" default="">
		<cfargument name="FilePlacementDirectory_IN" required="No" type="String" default="">
		<cfargument name="FilePlacementDirectory_LIKE" required="No" type="String" default="">
		<cfargument name="AttemptedServerFile" required="No" type="String" default="">
		<cfargument name="AttemptedServerFile_IN" required="No" type="String" default="">
		<cfargument name="AttemptedServerFile_LIKE" required="No" type="String" default="">
		<cfargument name="ClientDirectory" required="No" type="String" default="">
		<cfargument name="ClientDirectory_IN" required="No" type="String" default="">
		<cfargument name="ClientDirectory_LIKE" required="No" type="String" default="">
		<cfargument name="ClientFile" required="No" type="String" default="">
		<cfargument name="ClientFile_IN" required="No" type="String" default="">
		<cfargument name="ClientFile_LIKE" required="No" type="String" default="">
		<cfargument name="ClientFileExt" required="No" type="String" default="">
		<cfargument name="ClientFileExt_IN" required="No" type="String" default="">
		<cfargument name="ClientFileExt_LIKE" required="No" type="String" default="">
		<cfargument name="ClientFileName" required="No" type="String" default="">
		<cfargument name="ClientFileName_IN" required="No" type="String" default="">
		<cfargument name="ClientFileName_LIKE" required="No" type="String" default="">
		<cfargument name="ContentSubType" required="No" type="String" default="">
		<cfargument name="ContentSubType_IN" required="No" type="String" default="">
		<cfargument name="ContentSubType_LIKE" required="No" type="String" default="">
		<cfargument name="ContentType" required="No" type="String" default="">
		<cfargument name="ContentType_IN" required="No" type="String" default="">
		<cfargument name="ContentType_LIKE" required="No" type="String" default="">
		<cfargument name="DateLastAccessed" required="No" type="String" default="">
		<cfargument name="DateLastAccessed_IN" required="No" type="String" default="">
		<cfargument name="DateLastAccessed_LIKE" required="No" type="String" default="">
		<cfargument name="FileExisted" required="No" type="String" default="">
		<cfargument name="FileExisted_IN" required="No" type="String" default="">
		<cfargument name="FileExisted_LIKE" required="No" type="String" default="">
		<cfargument name="FileSize" required="No" type="String" default="">
		<cfargument name="FileSize_IN" required="No" type="String" default="">
		<cfargument name="FileSize_LIKE" required="No" type="String" default="">
		<cfargument name="FileWasAppended" required="No" type="String" default="">
		<cfargument name="FileWasAppended_IN" required="No" type="String" default="">
		<cfargument name="FileWasAppended_LIKE" required="No" type="String" default="">
		<cfargument name="FileWasOverwritten" required="No" type="String" default="">
		<cfargument name="FileWasOverwritten_IN" required="No" type="String" default="">
		<cfargument name="FileWasOverwritten_LIKE" required="No" type="String" default="">
		<cfargument name="FileWasRenamed" required="No" type="String" default="">
		<cfargument name="FileWasRenamed_IN" required="No" type="String" default="">
		<cfargument name="FileWasRenamed_LIKE" required="No" type="String" default="">
		<cfargument name="FileWasSaved" required="No" type="String" default="">
		<cfargument name="FileWasSaved_IN" required="No" type="String" default="">
		<cfargument name="FileWasSaved_LIKE" required="No" type="String" default="">
		<cfargument name="OldFileSize" required="No" type="String" default="">
		<cfargument name="OldFileSize_IN" required="No" type="String" default="">
		<cfargument name="OldFileSize_LIKE" required="No" type="String" default="">
		<cfargument name="ServerDirectory" required="No" type="String" default="">
		<cfargument name="ServerDirectory_IN" required="No" type="String" default="">
		<cfargument name="ServerDirectory_LIKE" required="No" type="String" default="">
		<cfargument name="ServerFile" required="No" type="String" default="">
		<cfargument name="ServerFile_IN" required="No" type="String" default="">
		<cfargument name="ServerFile_LIKE" required="No" type="String" default="">
		<cfargument name="ServerFileExt" required="No" type="String" default="">
		<cfargument name="ServerFileExt_IN" required="No" type="String" default="">
		<cfargument name="ServerFileExt_LIKE" required="No" type="String" default="">
		<cfargument name="ServerFileName" required="No" type="String" default="">
		<cfargument name="ServerFileName_IN" required="No" type="String" default="">
		<cfargument name="ServerFileName_LIKE" required="No" type="String" default="">
		<cfargument name="TimeCreated" required="No" type="String" default="">
		<cfargument name="TimeCreated_IN" required="No" type="String" default="">
		<cfargument name="TimeCreated_LIKE" required="No" type="String" default="">
		<cfargument name="TimeLastModified" required="No" type="String" default="">
		<cfargument name="TimeLastModified_IN" required="No" type="String" default="">
		<cfargument name="TimeLastModified_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "FileID,FileID_IN,FileID_LIKE,FileType,FileType_IN,FileType_LIKE,ClientID,ClientID_IN,ClientID_LIKE,DisplayInGUID,DisplayInGUID_IN,DisplayInGUID_LIKE,ParentFileID,ParentFileID_IN,ParentFileID_LIKE,UsersID,UsersID_IN,UsersID_LIKE,FilePlacementDirectory,FilePlacementDirectory_IN,FilePlacementDirectory_LIKE,AttemptedServerFile,AttemptedServerFile_IN,AttemptedServerFile_LIKE,ClientDirectory,ClientDirectory_IN,ClientDirectory_LIKE,ClientFile,ClientFile_IN,ClientFile_LIKE,ClientFileExt,ClientFileExt_IN,ClientFileExt_LIKE,ClientFileName,ClientFileName_IN,ClientFileName_LIKE,ContentSubType,ContentSubType_IN,ContentSubType_LIKE,ContentType,ContentType_IN,ContentType_LIKE,DateLastAccessed,DateLastAccessed_IN,DateLastAccessed_LIKE,FileExisted,FileExisted_IN,FileExisted_LIKE,FileSize,FileSize_IN,FileSize_LIKE,FileWasAppended,FileWasAppended_IN,FileWasAppended_LIKE,FileWasOverwritten,FileWasOverwritten_IN,FileWasOverwritten_LIKE,FileWasRenamed,FileWasRenamed_IN,FileWasRenamed_LIKE,FileWasSaved,FileWasSaved_IN,FileWasSaved_LIKE,OldFileSize,OldFileSize_IN,OldFileSize_LIKE,ServerDirectory,ServerDirectory_IN,ServerDirectory_LIKE,ServerFile,ServerFile_IN,ServerFile_LIKE,ServerFileExt,ServerFileExt_IN,ServerFileExt_LIKE,ServerFileName,ServerFileName_IN,ServerFileName_LIKE,TimeCreated,TimeCreated_IN,TimeCreated_LIKE,TimeLastModified,TimeLastModified_IN,TimeLastModified_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="File"
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
			<cfquery Name="getFileQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM file   
				WHERE 1=1
					<cfif FileID NEQ "" AND IsNumeric(FileID)>AND FileID = #FileID#</cfif>
					<cfif FileID_IN NEQ "">AND FileID IN(#trim(FileID_IN)#)</cfif>
					<cfif FileID_LIKE NEQ "">AND FileID LIKE '%#trim(FileID_LIKE)#%'</cfif>
					<cfif FileType NEQ "" AND IsNumeric(FileType)>AND FileType = #FileType#</cfif>
					<cfif FileType_IN NEQ "">AND FileType IN(#trim(FileType_IN)#)</cfif>
					<cfif FileType_LIKE NEQ "">AND FileType LIKE '%#trim(FileType_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif DisplayInGUID NEQ "" AND IsNumeric(DisplayInGUID)>AND DisplayInGUID = #DisplayInGUID#</cfif>
					<cfif DisplayInGUID_IN NEQ "">AND DisplayInGUID IN(#trim(DisplayInGUID_IN)#)</cfif>
					<cfif DisplayInGUID_LIKE NEQ "">AND DisplayInGUID LIKE '%#trim(DisplayInGUID_LIKE)#%'</cfif>
					<cfif ParentFileID NEQ "" AND IsNumeric(ParentFileID)>AND ParentFileID = #ParentFileID#</cfif>
					<cfif ParentFileID_IN NEQ "">AND ParentFileID IN(#trim(ParentFileID_IN)#)</cfif>
					<cfif ParentFileID_LIKE NEQ "">AND ParentFileID LIKE '%#trim(ParentFileID_LIKE)#%'</cfif>
					<cfif UsersID NEQ "" AND IsNumeric(UsersID)>AND UsersID = #UsersID#</cfif>
					<cfif UsersID_IN NEQ "">AND UsersID IN(#trim(UsersID_IN)#)</cfif>
					<cfif UsersID_LIKE NEQ "">AND UsersID LIKE '%#trim(UsersID_LIKE)#%'</cfif>
					<cfif FilePlacementDirectory NEQ "">AND FilePlacementDirectory = '#FilePlacementDirectory#'</cfif>
					<cfif FilePlacementDirectory_IN NEQ "">AND FilePlacementDirectory IN(#trim(FilePlacementDirectory_IN)#)</cfif>
					<cfif FilePlacementDirectory_LIKE NEQ "">AND FilePlacementDirectory LIKE '%#trim(FilePlacementDirectory_LIKE)#%'</cfif>
					<cfif AttemptedServerFile NEQ "">AND AttemptedServerFile = '#AttemptedServerFile#'</cfif>
					<cfif AttemptedServerFile_IN NEQ "">AND AttemptedServerFile IN(#trim(AttemptedServerFile_IN)#)</cfif>
					<cfif AttemptedServerFile_LIKE NEQ "">AND AttemptedServerFile LIKE '%#trim(AttemptedServerFile_LIKE)#%'</cfif>
					<cfif ClientDirectory NEQ "">AND ClientDirectory = '#ClientDirectory#'</cfif>
					<cfif ClientDirectory_IN NEQ "">AND ClientDirectory IN(#trim(ClientDirectory_IN)#)</cfif>
					<cfif ClientDirectory_LIKE NEQ "">AND ClientDirectory LIKE '%#trim(ClientDirectory_LIKE)#%'</cfif>
					<cfif ClientFile NEQ "">AND ClientFile = '#ClientFile#'</cfif>
					<cfif ClientFile_IN NEQ "">AND ClientFile IN(#trim(ClientFile_IN)#)</cfif>
					<cfif ClientFile_LIKE NEQ "">AND ClientFile LIKE '%#trim(ClientFile_LIKE)#%'</cfif>
					<cfif ClientFileExt NEQ "">AND ClientFileExt = '#ClientFileExt#'</cfif>
					<cfif ClientFileExt_IN NEQ "">AND ClientFileExt IN(#trim(ClientFileExt_IN)#)</cfif>
					<cfif ClientFileExt_LIKE NEQ "">AND ClientFileExt LIKE '%#trim(ClientFileExt_LIKE)#%'</cfif>
					<cfif ClientFileName NEQ "">AND ClientFileName = '#ClientFileName#'</cfif>
					<cfif ClientFileName_IN NEQ "">AND ClientFileName IN(#trim(ClientFileName_IN)#)</cfif>
					<cfif ClientFileName_LIKE NEQ "">AND ClientFileName LIKE '%#trim(ClientFileName_LIKE)#%'</cfif>
					<cfif ContentSubType NEQ "">AND ContentSubType = '#ContentSubType#'</cfif>
					<cfif ContentSubType_IN NEQ "">AND ContentSubType IN(#trim(ContentSubType_IN)#)</cfif>
					<cfif ContentSubType_LIKE NEQ "">AND ContentSubType LIKE '%#trim(ContentSubType_LIKE)#%'</cfif>
					<cfif ContentType NEQ "">AND ContentType = '#ContentType#'</cfif>
					<cfif ContentType_IN NEQ "">AND ContentType IN(#trim(ContentType_IN)#)</cfif>
					<cfif ContentType_LIKE NEQ "">AND ContentType LIKE '%#trim(ContentType_LIKE)#%'</cfif>
					<cfif DateLastAccessed NEQ "">AND DateLastAccessed = '#DateLastAccessed#'</cfif>
					<cfif DateLastAccessed_IN NEQ "">AND DateLastAccessed IN(#trim(DateLastAccessed_IN)#)</cfif>
					<cfif DateLastAccessed_LIKE NEQ "">AND DateLastAccessed LIKE '%#trim(DateLastAccessed_LIKE)#%'</cfif>
					<cfif FileExisted NEQ "">AND FileExisted = '#FileExisted#'</cfif>
					<cfif FileExisted_IN NEQ "">AND FileExisted IN(#trim(FileExisted_IN)#)</cfif>
					<cfif FileExisted_LIKE NEQ "">AND FileExisted LIKE '%#trim(FileExisted_LIKE)#%'</cfif>
					<cfif FileSize NEQ "">AND FileSize = '#FileSize#'</cfif>
					<cfif FileSize_IN NEQ "">AND FileSize IN(#trim(FileSize_IN)#)</cfif>
					<cfif FileSize_LIKE NEQ "">AND FileSize LIKE '%#trim(FileSize_LIKE)#%'</cfif>
					<cfif FileWasAppended NEQ "">AND FileWasAppended = '#FileWasAppended#'</cfif>
					<cfif FileWasAppended_IN NEQ "">AND FileWasAppended IN(#trim(FileWasAppended_IN)#)</cfif>
					<cfif FileWasAppended_LIKE NEQ "">AND FileWasAppended LIKE '%#trim(FileWasAppended_LIKE)#%'</cfif>
					<cfif FileWasOverwritten NEQ "">AND FileWasOverwritten = '#FileWasOverwritten#'</cfif>
					<cfif FileWasOverwritten_IN NEQ "">AND FileWasOverwritten IN(#trim(FileWasOverwritten_IN)#)</cfif>
					<cfif FileWasOverwritten_LIKE NEQ "">AND FileWasOverwritten LIKE '%#trim(FileWasOverwritten_LIKE)#%'</cfif>
					<cfif FileWasRenamed NEQ "">AND FileWasRenamed = '#FileWasRenamed#'</cfif>
					<cfif FileWasRenamed_IN NEQ "">AND FileWasRenamed IN(#trim(FileWasRenamed_IN)#)</cfif>
					<cfif FileWasRenamed_LIKE NEQ "">AND FileWasRenamed LIKE '%#trim(FileWasRenamed_LIKE)#%'</cfif>
					<cfif FileWasSaved NEQ "">AND FileWasSaved = '#FileWasSaved#'</cfif>
					<cfif FileWasSaved_IN NEQ "">AND FileWasSaved IN(#trim(FileWasSaved_IN)#)</cfif>
					<cfif FileWasSaved_LIKE NEQ "">AND FileWasSaved LIKE '%#trim(FileWasSaved_LIKE)#%'</cfif>
					<cfif OldFileSize NEQ "">AND OldFileSize = '#OldFileSize#'</cfif>
					<cfif OldFileSize_IN NEQ "">AND OldFileSize IN(#trim(OldFileSize_IN)#)</cfif>
					<cfif OldFileSize_LIKE NEQ "">AND OldFileSize LIKE '%#trim(OldFileSize_LIKE)#%'</cfif>
					<cfif ServerDirectory NEQ "">AND ServerDirectory = '#ServerDirectory#'</cfif>
					<cfif ServerDirectory_IN NEQ "">AND ServerDirectory IN(#trim(ServerDirectory_IN)#)</cfif>
					<cfif ServerDirectory_LIKE NEQ "">AND ServerDirectory LIKE '%#trim(ServerDirectory_LIKE)#%'</cfif>
					<cfif ServerFile NEQ "">AND ServerFile = '#ServerFile#'</cfif>
					<cfif ServerFile_IN NEQ "">AND ServerFile IN(#trim(ServerFile_IN)#)</cfif>
					<cfif ServerFile_LIKE NEQ "">AND ServerFile LIKE '%#trim(ServerFile_LIKE)#%'</cfif>
					<cfif ServerFileExt NEQ "">AND ServerFileExt = '#ServerFileExt#'</cfif>
					<cfif ServerFileExt_IN NEQ "">AND ServerFileExt IN(#trim(ServerFileExt_IN)#)</cfif>
					<cfif ServerFileExt_LIKE NEQ "">AND ServerFileExt LIKE '%#trim(ServerFileExt_LIKE)#%'</cfif>
					<cfif ServerFileName NEQ "">AND ServerFileName = '#ServerFileName#'</cfif>
					<cfif ServerFileName_IN NEQ "">AND ServerFileName IN(#trim(ServerFileName_IN)#)</cfif>
					<cfif ServerFileName_LIKE NEQ "">AND ServerFileName LIKE '%#trim(ServerFileName_LIKE)#%'</cfif>
					<cfif TimeCreated NEQ "">AND TimeCreated = '#TimeCreated#'</cfif>
					<cfif TimeCreated_IN NEQ "">AND TimeCreated IN(#trim(TimeCreated_IN)#)</cfif>
					<cfif TimeCreated_LIKE NEQ "">AND TimeCreated LIKE '%#trim(TimeCreated_LIKE)#%'</cfif>
					<cfif TimeLastModified NEQ "">AND TimeLastModified = '#TimeLastModified#'</cfif>
					<cfif TimeLastModified_IN NEQ "">AND TimeLastModified IN(#trim(TimeLastModified_IN)#)</cfif>
					<cfif TimeLastModified_LIKE NEQ "">AND TimeLastModified LIKE '%#trim(TimeLastModified_LIKE)#%'</cfif>
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
			
			<cfreturn getFileQuery>
		
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




