 	


<cfcomponent name="fileBean" output="false" alias="fileBean" extends="FileDAO">

	<cfproperty name="FileID" type="numeric" default="0" />
	<cfproperty name="FileType" type="numeric" default="" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="DisplayInGUID" type="numeric" default="" />
	<cfproperty name="ParentFileID" type="numeric" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="FilePlacementDirectory" type="string" default="" />
	<cfproperty name="AttemptedServerFile" type="string" default="" />
	<cfproperty name="ClientDirectory" type="string" default="" />
	<cfproperty name="ClientFile" type="string" default="" />
	<cfproperty name="ClientFileExt" type="string" default="" />
	<cfproperty name="ClientFileName" type="string" default="" />
	<cfproperty name="ContentSubType" type="string" default="" />
	<cfproperty name="ContentType" type="string" default="" />
	<cfproperty name="DateLastAccessed" type="datetime" default="" />
	<cfproperty name="FileExisted" type="string" default="" />
	<cfproperty name="FileSize" type="string" default="" />
	<cfproperty name="FileWasAppended" type="string" default="" />
	<cfproperty name="FileWasOverwritten" type="string" default="" />
	<cfproperty name="FileWasRenamed" type="string" default="" />
	<cfproperty name="FileWasSaved" type="string" default="" />
	<cfproperty name="OldFileSize" type="string" default="" />
	<cfproperty name="ServerDirectory" type="string" default="" />
	<cfproperty name="ServerFile" type="string" default="" />
	<cfproperty name="ServerFileExt" type="string" default="" />
	<cfproperty name="ServerFileName" type="string" default="" />
	<cfproperty name="TimeCreated" type="datetime" default="" />
	<cfproperty name="TimeLastModified" type="datetime" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.FileID = 0;
		variables.FileType = "";
		variables.ClientID = "";
		variables.DisplayInGUID = "";
		variables.ParentFileID = "";
		variables.UsersID = "";
		variables.FilePlacementDirectory = "";
		variables.AttemptedServerFile = "";
		variables.ClientDirectory = "";
		variables.ClientFile = "";
		variables.ClientFileExt = "";
		variables.ClientFileName = "";
		variables.ContentSubType = "";
		variables.ContentType = "";
		variables.DateLastAccessed = "";
		variables.FileExisted = "";
		variables.FileSize = "";
		variables.FileWasAppended = "";
		variables.FileWasOverwritten = "";
		variables.FileWasRenamed = "";
		variables.FileWasSaved = "";
		variables.OldFileSize = "";
		variables.ServerDirectory = "";
		variables.ServerFile = "";
		variables.ServerFileExt = "";
		variables.ServerFileName = "";
		variables.TimeCreated = "";
		variables.TimeLastModified = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="fileBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "FileID") AND stValues.FileID NEQ 0>
				<cfquery name="qGetFile" datasource="#trim(arguments.ds)#">
			  		SELECT FileID,FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,Active,InactiveCode,DateCreated,DateModified
					FROM File  
					WHERE FileID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.FileID#" /> 
				</cfquery>		
				<cfif qGetFile.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.FileType = qGetFile.FileType;
					variables.ClientID = qGetFile.ClientID;
					variables.DisplayInGUID = qGetFile.DisplayInGUID;
					variables.ParentFileID = qGetFile.ParentFileID;
					variables.UsersID = qGetFile.UsersID;
					variables.FilePlacementDirectory = qGetFile.FilePlacementDirectory;
					variables.AttemptedServerFile = qGetFile.AttemptedServerFile;
					variables.ClientDirectory = qGetFile.ClientDirectory;
					variables.ClientFile = qGetFile.ClientFile;
					variables.ClientFileExt = qGetFile.ClientFileExt;
					variables.ClientFileName = qGetFile.ClientFileName;
					variables.ContentSubType = qGetFile.ContentSubType;
					variables.ContentType = qGetFile.ContentType;
					variables.DateLastAccessed = qGetFile.DateLastAccessed;
					variables.FileExisted = qGetFile.FileExisted;
					variables.FileSize = qGetFile.FileSize;
					variables.FileWasAppended = qGetFile.FileWasAppended;
					variables.FileWasOverwritten = qGetFile.FileWasOverwritten;
					variables.FileWasRenamed = qGetFile.FileWasRenamed;
					variables.FileWasSaved = qGetFile.FileWasSaved;
					variables.OldFileSize = qGetFile.OldFileSize;
					variables.ServerDirectory = qGetFile.ServerDirectory;
					variables.ServerFile = qGetFile.ServerFile;
					variables.ServerFileExt = qGetFile.ServerFileExt;
					variables.ServerFileName = qGetFile.ServerFileName;
					variables.TimeCreated = qGetFile.TimeCreated;
					variables.TimeLastModified = qGetFile.TimeLastModified;
					variables.Active = qGetFile.Active;
					variables.InactiveCode = qGetFile.InactiveCode;
					variables.DateModified = qGetFile.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "FileID")><cfset variables.FileID = stValues.FileID /></cfif>
			<cfif StructKeyExists(stValues, "FileType")><cfset variables.FileType = stValues.FileType /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "DisplayInGUID")><cfset variables.DisplayInGUID = stValues.DisplayInGUID /></cfif>
			<cfif StructKeyExists(stValues, "ParentFileID")><cfset variables.ParentFileID = stValues.ParentFileID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "FilePlacementDirectory")><cfset variables.FilePlacementDirectory = stValues.FilePlacementDirectory /></cfif>
			<cfif StructKeyExists(stValues, "AttemptedServerFile")><cfset variables.AttemptedServerFile = stValues.AttemptedServerFile /></cfif>
			<cfif StructKeyExists(stValues, "ClientDirectory")><cfset variables.ClientDirectory = stValues.ClientDirectory /></cfif>
			<cfif StructKeyExists(stValues, "ClientFile")><cfset variables.ClientFile = stValues.ClientFile /></cfif>
			<cfif StructKeyExists(stValues, "ClientFileExt")><cfset variables.ClientFileExt = stValues.ClientFileExt /></cfif>
			<cfif StructKeyExists(stValues, "ClientFileName")><cfset variables.ClientFileName = stValues.ClientFileName /></cfif>
			<cfif StructKeyExists(stValues, "ContentSubType")><cfset variables.ContentSubType = stValues.ContentSubType /></cfif>
			<cfif StructKeyExists(stValues, "ContentType")><cfset variables.ContentType = stValues.ContentType /></cfif>
			<cfif StructKeyExists(stValues, "DateLastAccessed")><cfset variables.DateLastAccessed = stValues.DateLastAccessed /></cfif>
			<cfif StructKeyExists(stValues, "FileExisted")><cfset variables.FileExisted = stValues.FileExisted /></cfif>
			<cfif StructKeyExists(stValues, "FileSize")><cfset variables.FileSize = stValues.FileSize /></cfif>
			<cfif StructKeyExists(stValues, "FileWasAppended")><cfset variables.FileWasAppended = stValues.FileWasAppended /></cfif>
			<cfif StructKeyExists(stValues, "FileWasOverwritten")><cfset variables.FileWasOverwritten = stValues.FileWasOverwritten /></cfif>
			<cfif StructKeyExists(stValues, "FileWasRenamed")><cfset variables.FileWasRenamed = stValues.FileWasRenamed /></cfif>
			<cfif StructKeyExists(stValues, "FileWasSaved")><cfset variables.FileWasSaved = stValues.FileWasSaved /></cfif>
			<cfif StructKeyExists(stValues, "OldFileSize")><cfset variables.OldFileSize = stValues.OldFileSize /></cfif>
			<cfif StructKeyExists(stValues, "ServerDirectory")><cfset variables.ServerDirectory = stValues.ServerDirectory /></cfif>
			<cfif StructKeyExists(stValues, "ServerFile")><cfset variables.ServerFile = stValues.ServerFile /></cfif>
			<cfif StructKeyExists(stValues, "ServerFileExt")><cfset variables.ServerFileExt = stValues.ServerFileExt /></cfif>
			<cfif StructKeyExists(stValues, "ServerFileName")><cfset variables.ServerFileName = stValues.ServerFileName /></cfif>
			<cfif StructKeyExists(stValues, "TimeCreated")><cfset variables.TimeCreated = stValues.TimeCreated /></cfif>
			<cfif StructKeyExists(stValues, "TimeLastModified")><cfset variables.TimeLastModified = stValues.TimeLastModified /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileID" acess="public" output="false" returntype="any">
		<cfreturn variables.FileID>
	</cffunction>
	
	<cffunction name="setFileID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.FileID)) OR trim(arguments.FileID) EQ "">
			<cfset variables.FileID = arguments.FileID />
		<cfelse>
			<cfthrow message="FileID (#arguments.FileID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileType.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileType" acess="public" output="false" returntype="any">
		<cfreturn variables.FileType>
	</cffunction>
	
	<cffunction name="setFileType" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileType" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.FileType)) OR trim(arguments.FileType) EQ "">
			<cfset variables.FileType = arguments.FileType />
		<cfelse>
			<cfthrow message="FileType (#arguments.FileType#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileType") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DisplayInGUID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDisplayInGUID" acess="public" output="false" returntype="any">
		<cfreturn variables.DisplayInGUID>
	</cffunction>
	
	<cffunction name="setDisplayInGUID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DisplayInGUID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.DisplayInGUID)) OR trim(arguments.DisplayInGUID) EQ "">
			<cfset variables.DisplayInGUID = arguments.DisplayInGUID />
		<cfelse>
			<cfthrow message="DisplayInGUID (#arguments.DisplayInGUID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DisplayInGUID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ParentFileID.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getParentFileID" acess="public" output="false" returntype="any">
		<cfreturn variables.ParentFileID>
	</cffunction>
	
	<cffunction name="setParentFileID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ParentFileID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ParentFileID)) OR trim(arguments.ParentFileID) EQ "">
			<cfset variables.ParentFileID = arguments.ParentFileID />
		<cfelse>
			<cfthrow message="ParentFileID (#arguments.ParentFileID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ParentFileID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersID>
	</cffunction>
	
	<cffunction name="setUsersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersID)) OR trim(arguments.UsersID) EQ "">
			<cfset variables.UsersID = arguments.UsersID />
		<cfelse>
			<cfthrow message="UsersID (#arguments.UsersID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FilePlacementDirectory.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFilePlacementDirectory" acess="public" output="false" returntype="any">
		<cfreturn variables.FilePlacementDirectory>
	</cffunction>
	
	<cffunction name="setFilePlacementDirectory" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FilePlacementDirectory" required="true" type="any" />
			
		<cfset variables.FilePlacementDirectory = arguments.FilePlacementDirectory />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FilePlacementDirectory") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AttemptedServerFile.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAttemptedServerFile" acess="public" output="false" returntype="any">
		<cfreturn variables.AttemptedServerFile>
	</cffunction>
	
	<cffunction name="setAttemptedServerFile" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AttemptedServerFile" required="true" type="any" />
			
		<cfset variables.AttemptedServerFile = arguments.AttemptedServerFile />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AttemptedServerFile") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientDirectory.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientDirectory" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientDirectory>
	</cffunction>
	
	<cffunction name="setClientDirectory" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientDirectory" required="true" type="any" />
			
		<cfset variables.ClientDirectory = arguments.ClientDirectory />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientDirectory") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientFile.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientFile" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientFile>
	</cffunction>
	
	<cffunction name="setClientFile" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientFile" required="true" type="any" />
			
		<cfset variables.ClientFile = arguments.ClientFile />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientFile") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientFileExt.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientFileExt" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientFileExt>
	</cffunction>
	
	<cffunction name="setClientFileExt" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientFileExt" required="true" type="any" />
			
		<cfset variables.ClientFileExt = arguments.ClientFileExt />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientFileExt") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientFileName.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientFileName" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientFileName>
	</cffunction>
	
	<cffunction name="setClientFileName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientFileName" required="true" type="any" />
			
		<cfset variables.ClientFileName = arguments.ClientFileName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientFileName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ContentSubType.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getContentSubType" acess="public" output="false" returntype="any">
		<cfreturn variables.ContentSubType>
	</cffunction>
	
	<cffunction name="setContentSubType" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ContentSubType" required="true" type="any" />
			
		<cfset variables.ContentSubType = arguments.ContentSubType />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ContentSubType") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ContentType.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getContentType" acess="public" output="false" returntype="any">
		<cfreturn variables.ContentType>
	</cffunction>
	
	<cffunction name="setContentType" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ContentType" required="true" type="any" />
			
		<cfset variables.ContentType = arguments.ContentType />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ContentType") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateLastAccessed.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateLastAccessed" acess="public" output="false" returntype="any">
		<cfreturn variables.DateLastAccessed>
	</cffunction>
	
	<cffunction name="setDateLastAccessed" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateLastAccessed" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateLastAccessed)) OR trim(arguments.DateLastAccessed) EQ "">
			<cfset variables.DateLastAccessed = arguments.DateLastAccessed />
		<cfelse>
			<cfthrow message="DateLastAccessed (#arguments.DateLastAccessed#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateLastAccessed") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileExisted.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileExisted" acess="public" output="false" returntype="any">
		<cfreturn variables.FileExisted>
	</cffunction>
	
	<cffunction name="setFileExisted" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileExisted" required="true" type="any" />
			
		<cfset variables.FileExisted = arguments.FileExisted />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileExisted") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileSize.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileSize" acess="public" output="false" returntype="any">
		<cfreturn variables.FileSize>
	</cffunction>
	
	<cffunction name="setFileSize" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileSize" required="true" type="any" />
			
		<cfset variables.FileSize = arguments.FileSize />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileSize") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileWasAppended.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileWasAppended" acess="public" output="false" returntype="any">
		<cfreturn variables.FileWasAppended>
	</cffunction>
	
	<cffunction name="setFileWasAppended" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileWasAppended" required="true" type="any" />
			
		<cfset variables.FileWasAppended = arguments.FileWasAppended />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileWasAppended") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileWasOverwritten.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileWasOverwritten" acess="public" output="false" returntype="any">
		<cfreturn variables.FileWasOverwritten>
	</cffunction>
	
	<cffunction name="setFileWasOverwritten" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileWasOverwritten" required="true" type="any" />
			
		<cfset variables.FileWasOverwritten = arguments.FileWasOverwritten />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileWasOverwritten") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileWasRenamed.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileWasRenamed" acess="public" output="false" returntype="any">
		<cfreturn variables.FileWasRenamed>
	</cffunction>
	
	<cffunction name="setFileWasRenamed" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileWasRenamed" required="true" type="any" />
			
		<cfset variables.FileWasRenamed = arguments.FileWasRenamed />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileWasRenamed") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileWasSaved.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileWasSaved" acess="public" output="false" returntype="any">
		<cfreturn variables.FileWasSaved>
	</cffunction>
	
	<cffunction name="setFileWasSaved" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileWasSaved" required="true" type="any" />
			
		<cfset variables.FileWasSaved = arguments.FileWasSaved />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileWasSaved") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OldFileSize.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOldFileSize" acess="public" output="false" returntype="any">
		<cfreturn variables.OldFileSize>
	</cffunction>
	
	<cffunction name="setOldFileSize" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OldFileSize" required="true" type="any" />
			
		<cfset variables.OldFileSize = arguments.OldFileSize />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OldFileSize") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ServerDirectory.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getServerDirectory" acess="public" output="false" returntype="any">
		<cfreturn variables.ServerDirectory>
	</cffunction>
	
	<cffunction name="setServerDirectory" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ServerDirectory" required="true" type="any" />
			
		<cfset variables.ServerDirectory = arguments.ServerDirectory />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ServerDirectory") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ServerFile.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getServerFile" acess="public" output="false" returntype="any">
		<cfreturn variables.ServerFile>
	</cffunction>
	
	<cffunction name="setServerFile" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ServerFile" required="true" type="any" />
			
		<cfset variables.ServerFile = arguments.ServerFile />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ServerFile") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ServerFileExt.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getServerFileExt" acess="public" output="false" returntype="any">
		<cfreturn variables.ServerFileExt>
	</cffunction>
	
	<cffunction name="setServerFileExt" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ServerFileExt" required="true" type="any" />
			
		<cfset variables.ServerFileExt = arguments.ServerFileExt />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ServerFileExt") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ServerFileName.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getServerFileName" acess="public" output="false" returntype="any">
		<cfreturn variables.ServerFileName>
	</cffunction>
	
	<cffunction name="setServerFileName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ServerFileName" required="true" type="any" />
			
		<cfset variables.ServerFileName = arguments.ServerFileName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ServerFileName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TimeCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTimeCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.TimeCreated>
	</cffunction>
	
	<cffunction name="setTimeCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TimeCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.TimeCreated)) OR trim(arguments.TimeCreated) EQ "">
			<cfset variables.TimeCreated = arguments.TimeCreated />
		<cfelse>
			<cfthrow message="TimeCreated (#arguments.TimeCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TimeCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TimeLastModified.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTimeLastModified" acess="public" output="false" returntype="any">
		<cfreturn variables.TimeLastModified>
	</cffunction>
	
	<cffunction name="setTimeLastModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TimeLastModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.TimeLastModified)) OR trim(arguments.TimeLastModified) EQ "">
			<cfset variables.TimeLastModified = arguments.TimeLastModified />
		<cfelse>
			<cfthrow message="TimeLastModified (#arguments.TimeLastModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TimeLastModified") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


