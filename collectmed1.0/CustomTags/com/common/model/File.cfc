 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.FileID = "";				
		variables.instance.FileType = "";				
		variables.instance.ClientID = "";				
		variables.instance.DisplayInGUID = "";				
		variables.instance.ParentFileID = "";				
		variables.instance.UsersID = "";				
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
		variables.instance.attributesXML = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="File" output="false">				
		<cfargument name="FileID" type="string" required="false" default="" hint="FileID" />				
		<cfargument name="FileType" type="string" required="false" default="" hint="FileType" />				
		<cfargument name="ClientID" type="string" required="false" default="" hint="ClientID" />				
		<cfargument name="DisplayInGUID" type="string" required="false" default="" hint="DisplayInGUID" />				
		<cfargument name="ParentFileID" type="string" required="false" default="" hint="ParentFileID" />				
		<cfargument name="UsersID" type="string" required="false" default="" hint="UsersID" />				
		<cfargument name="FilePlacementDirectory" type="string" required="false" default="" hint="FilePlacementDirectory" />				
		<cfargument name="AttemptedServerFile" type="string" required="false" default="" hint="AttemptedServerFile" />				
		<cfargument name="ClientDirectory" type="string" required="false" default="" hint="ClientDirectory" />				
		<cfargument name="ClientFile" type="string" required="false" default="" hint="ClientFile" />				
		<cfargument name="ClientFileExt" type="string" required="false" default="" hint="ClientFileExt" />				
		<cfargument name="ClientFileName" type="string" required="false" default="" hint="ClientFileName" />				
		<cfargument name="ContentSubType" type="string" required="false" default="" hint="ContentSubType" />				
		<cfargument name="ContentType" type="string" required="false" default="" hint="ContentType" />				
		<cfargument name="DateLastAccessed" type="string" required="false" default="" hint="DateLastAccessed" />				
		<cfargument name="FileExisted" type="string" required="false" default="" hint="FileExisted" />				
		<cfargument name="FileSize" type="string" required="false" default="" hint="FileSize" />				
		<cfargument name="FileWasAppended" type="string" required="false" default="" hint="FileWasAppended" />				
		<cfargument name="FileWasOverwritten" type="string" required="false" default="" hint="FileWasOverwritten" />				
		<cfargument name="FileWasRenamed" type="string" required="false" default="" hint="FileWasRenamed" />				
		<cfargument name="FileWasSaved" type="string" required="false" default="" hint="FileWasSaved" />				
		<cfargument name="OldFileSize" type="string" required="false" default="" hint="OldFileSize" />				
		<cfargument name="ServerDirectory" type="string" required="false" default="" hint="ServerDirectory" />				
		<cfargument name="ServerFile" type="string" required="false" default="" hint="ServerFile" />				
		<cfargument name="ServerFileExt" type="string" required="false" default="" hint="ServerFileExt" />				
		<cfargument name="ServerFileName" type="string" required="false" default="" hint="ServerFileName" />				
		<cfargument name="TimeCreated" type="string" required="false" default="" hint="TimeCreated" />				
		<cfargument name="TimeLastModified" type="string" required="false" default="" hint="TimeLastModified" />				
		<cfargument name="attributesXML" type="string" required="false" default="" hint="attributesXML" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setFileID(arguments.FileID);				
			setFileType(arguments.FileType);				
			setClientID(arguments.ClientID);				
			setDisplayInGUID(arguments.DisplayInGUID);				
			setParentFileID(arguments.ParentFileID);				
			setUsersID(arguments.UsersID);				
			setFilePlacementDirectory(arguments.FilePlacementDirectory);				
			setAttemptedServerFile(arguments.AttemptedServerFile);				
			setClientDirectory(arguments.ClientDirectory);				
			setClientFile(arguments.ClientFile);				
			setClientFileExt(arguments.ClientFileExt);				
			setClientFileName(arguments.ClientFileName);				
			setContentSubType(arguments.ContentSubType);				
			setContentType(arguments.ContentType);				
			setDateLastAccessed(arguments.DateLastAccessed);				
			setFileExisted(arguments.FileExisted);				
			setFileSize(arguments.FileSize);				
			setFileWasAppended(arguments.FileWasAppended);				
			setFileWasOverwritten(arguments.FileWasOverwritten);				
			setFileWasRenamed(arguments.FileWasRenamed);				
			setFileWasSaved(arguments.FileWasSaved);				
			setOldFileSize(arguments.OldFileSize);				
			setServerDirectory(arguments.ServerDirectory);				
			setServerFile(arguments.ServerFile);				
			setServerFileExt(arguments.ServerFileExt);				
			setServerFileName(arguments.ServerFileName);				
			setTimeCreated(arguments.TimeCreated);				
			setTimeLastModified(arguments.TimeLastModified);				
			setattributesXML(arguments.attributesXML);				
			setActive(arguments.Active);				
			setInactiveCode(arguments.InactiveCode);				
			setDateCreated(arguments.DateCreated);				
			setDateModified(arguments.DateModified);							
		</cfscript>							
		
		<cfreturn this />
			
	</cffunction>

	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!--- getters/setters --->	
	<cffunction name="getFileID" access="public" hint="Getter for FileID" output="false" returnType="any">
		<cfreturn variables.instance.FileID />
	</cffunction>
	
	<cffunction name="setFileID" access="public" hint="Setter for FileID" output="false" returnType="void">
		<cfargument name="FileID" hint="" required="yes" type="any" />
		<cfset variables.instance.FileID = arguments.FileID />
	</cffunction>				
	
	<cffunction name="getFileType" access="public" hint="Getter for FileType" output="false" returnType="any">
		<cfreturn variables.instance.FileType />
	</cffunction>
	
	<cffunction name="setFileType" access="public" hint="Setter for FileType" output="false" returnType="void">
		<cfargument name="FileType" hint="" required="yes" type="any" />
		<cfset variables.instance.FileType = arguments.FileType />
	</cffunction>				
	
	<cffunction name="getClientID" access="public" hint="Getter for ClientID" output="false" returnType="any">
		<cfreturn variables.instance.ClientID />
	</cffunction>
	
	<cffunction name="setClientID" access="public" hint="Setter for ClientID" output="false" returnType="void">
		<cfargument name="ClientID" hint="" required="yes" type="any" />
		<cfset variables.instance.ClientID = arguments.ClientID />
	</cffunction>				
	
	<cffunction name="getDisplayInGUID" access="public" hint="Getter for DisplayInGUID" output="false" returnType="any">
		<cfreturn variables.instance.DisplayInGUID />
	</cffunction>
	
	<cffunction name="setDisplayInGUID" access="public" hint="Setter for DisplayInGUID" output="false" returnType="void">
		<cfargument name="DisplayInGUID" hint="" required="yes" type="any" />
		<cfset variables.instance.DisplayInGUID = arguments.DisplayInGUID />
	</cffunction>				
	
	<cffunction name="getParentFileID" access="public" hint="Getter for ParentFileID" output="false" returnType="any">
		<cfreturn variables.instance.ParentFileID />
	</cffunction>
	
	<cffunction name="setParentFileID" access="public" hint="Setter for ParentFileID" output="false" returnType="void">
		<cfargument name="ParentFileID" hint="" required="yes" type="any" />
		<cfset variables.instance.ParentFileID = arguments.ParentFileID />
	</cffunction>				
	
	<cffunction name="getUsersID" access="public" hint="Getter for UsersID" output="false" returnType="any">
		<cfreturn variables.instance.UsersID />
	</cffunction>
	
	<cffunction name="setUsersID" access="public" hint="Setter for UsersID" output="false" returnType="void">
		<cfargument name="UsersID" hint="" required="yes" type="any" />
		<cfset variables.instance.UsersID = arguments.UsersID />
	</cffunction>				
	
	<cffunction name="getFilePlacementDirectory" access="public" hint="Getter for FilePlacementDirectory" output="false" returnType="any">
		<cfreturn variables.instance.FilePlacementDirectory />
	</cffunction>
	
	<cffunction name="setFilePlacementDirectory" access="public" hint="Setter for FilePlacementDirectory" output="false" returnType="void">
		<cfargument name="FilePlacementDirectory" hint="" required="yes" type="any" />
		<cfset variables.instance.FilePlacementDirectory = arguments.FilePlacementDirectory />
	</cffunction>				
	
	<cffunction name="getAttemptedServerFile" access="public" hint="Getter for AttemptedServerFile" output="false" returnType="any">
		<cfreturn variables.instance.AttemptedServerFile />
	</cffunction>
	
	<cffunction name="setAttemptedServerFile" access="public" hint="Setter for AttemptedServerFile" output="false" returnType="void">
		<cfargument name="AttemptedServerFile" hint="" required="yes" type="any" />
		<cfset variables.instance.AttemptedServerFile = arguments.AttemptedServerFile />
	</cffunction>				
	
	<cffunction name="getClientDirectory" access="public" hint="Getter for ClientDirectory" output="false" returnType="any">
		<cfreturn variables.instance.ClientDirectory />
	</cffunction>
	
	<cffunction name="setClientDirectory" access="public" hint="Setter for ClientDirectory" output="false" returnType="void">
		<cfargument name="ClientDirectory" hint="" required="yes" type="any" />
		<cfset variables.instance.ClientDirectory = arguments.ClientDirectory />
	</cffunction>				
	
	<cffunction name="getClientFile" access="public" hint="Getter for ClientFile" output="false" returnType="any">
		<cfreturn variables.instance.ClientFile />
	</cffunction>
	
	<cffunction name="setClientFile" access="public" hint="Setter for ClientFile" output="false" returnType="void">
		<cfargument name="ClientFile" hint="" required="yes" type="any" />
		<cfset variables.instance.ClientFile = arguments.ClientFile />
	</cffunction>				
	
	<cffunction name="getClientFileExt" access="public" hint="Getter for ClientFileExt" output="false" returnType="any">
		<cfreturn variables.instance.ClientFileExt />
	</cffunction>
	
	<cffunction name="setClientFileExt" access="public" hint="Setter for ClientFileExt" output="false" returnType="void">
		<cfargument name="ClientFileExt" hint="" required="yes" type="any" />
		<cfset variables.instance.ClientFileExt = arguments.ClientFileExt />
	</cffunction>				
	
	<cffunction name="getClientFileName" access="public" hint="Getter for ClientFileName" output="false" returnType="any">
		<cfreturn variables.instance.ClientFileName />
	</cffunction>
	
	<cffunction name="setClientFileName" access="public" hint="Setter for ClientFileName" output="false" returnType="void">
		<cfargument name="ClientFileName" hint="" required="yes" type="any" />
		<cfset variables.instance.ClientFileName = arguments.ClientFileName />
	</cffunction>				
	
	<cffunction name="getContentSubType" access="public" hint="Getter for ContentSubType" output="false" returnType="any">
		<cfreturn variables.instance.ContentSubType />
	</cffunction>
	
	<cffunction name="setContentSubType" access="public" hint="Setter for ContentSubType" output="false" returnType="void">
		<cfargument name="ContentSubType" hint="" required="yes" type="any" />
		<cfset variables.instance.ContentSubType = arguments.ContentSubType />
	</cffunction>				
	
	<cffunction name="getContentType" access="public" hint="Getter for ContentType" output="false" returnType="any">
		<cfreturn variables.instance.ContentType />
	</cffunction>
	
	<cffunction name="setContentType" access="public" hint="Setter for ContentType" output="false" returnType="void">
		<cfargument name="ContentType" hint="" required="yes" type="any" />
		<cfset variables.instance.ContentType = arguments.ContentType />
	</cffunction>				
	
	<cffunction name="getDateLastAccessed" access="public" hint="Getter for DateLastAccessed" output="false" returnType="any">
		<cfreturn variables.instance.DateLastAccessed />
	</cffunction>
	
	<cffunction name="setDateLastAccessed" access="public" hint="Setter for DateLastAccessed" output="false" returnType="void">
		<cfargument name="DateLastAccessed" hint="" required="yes" type="any" />
		<cfset variables.instance.DateLastAccessed = arguments.DateLastAccessed />
	</cffunction>				
	
	<cffunction name="getFileExisted" access="public" hint="Getter for FileExisted" output="false" returnType="any">
		<cfreturn variables.instance.FileExisted />
	</cffunction>
	
	<cffunction name="setFileExisted" access="public" hint="Setter for FileExisted" output="false" returnType="void">
		<cfargument name="FileExisted" hint="" required="yes" type="any" />
		<cfset variables.instance.FileExisted = arguments.FileExisted />
	</cffunction>				
	
	<cffunction name="getFileSize" access="public" hint="Getter for FileSize" output="false" returnType="any">
		<cfreturn variables.instance.FileSize />
	</cffunction>
	
	<cffunction name="setFileSize" access="public" hint="Setter for FileSize" output="false" returnType="void">
		<cfargument name="FileSize" hint="" required="yes" type="any" />
		<cfset variables.instance.FileSize = arguments.FileSize />
	</cffunction>				
	
	<cffunction name="getFileWasAppended" access="public" hint="Getter for FileWasAppended" output="false" returnType="any">
		<cfreturn variables.instance.FileWasAppended />
	</cffunction>
	
	<cffunction name="setFileWasAppended" access="public" hint="Setter for FileWasAppended" output="false" returnType="void">
		<cfargument name="FileWasAppended" hint="" required="yes" type="any" />
		<cfset variables.instance.FileWasAppended = arguments.FileWasAppended />
	</cffunction>				
	
	<cffunction name="getFileWasOverwritten" access="public" hint="Getter for FileWasOverwritten" output="false" returnType="any">
		<cfreturn variables.instance.FileWasOverwritten />
	</cffunction>
	
	<cffunction name="setFileWasOverwritten" access="public" hint="Setter for FileWasOverwritten" output="false" returnType="void">
		<cfargument name="FileWasOverwritten" hint="" required="yes" type="any" />
		<cfset variables.instance.FileWasOverwritten = arguments.FileWasOverwritten />
	</cffunction>				
	
	<cffunction name="getFileWasRenamed" access="public" hint="Getter for FileWasRenamed" output="false" returnType="any">
		<cfreturn variables.instance.FileWasRenamed />
	</cffunction>
	
	<cffunction name="setFileWasRenamed" access="public" hint="Setter for FileWasRenamed" output="false" returnType="void">
		<cfargument name="FileWasRenamed" hint="" required="yes" type="any" />
		<cfset variables.instance.FileWasRenamed = arguments.FileWasRenamed />
	</cffunction>				
	
	<cffunction name="getFileWasSaved" access="public" hint="Getter for FileWasSaved" output="false" returnType="any">
		<cfreturn variables.instance.FileWasSaved />
	</cffunction>
	
	<cffunction name="setFileWasSaved" access="public" hint="Setter for FileWasSaved" output="false" returnType="void">
		<cfargument name="FileWasSaved" hint="" required="yes" type="any" />
		<cfset variables.instance.FileWasSaved = arguments.FileWasSaved />
	</cffunction>				
	
	<cffunction name="getOldFileSize" access="public" hint="Getter for OldFileSize" output="false" returnType="any">
		<cfreturn variables.instance.OldFileSize />
	</cffunction>
	
	<cffunction name="setOldFileSize" access="public" hint="Setter for OldFileSize" output="false" returnType="void">
		<cfargument name="OldFileSize" hint="" required="yes" type="any" />
		<cfset variables.instance.OldFileSize = arguments.OldFileSize />
	</cffunction>				
	
	<cffunction name="getServerDirectory" access="public" hint="Getter for ServerDirectory" output="false" returnType="any">
		<cfreturn variables.instance.ServerDirectory />
	</cffunction>
	
	<cffunction name="setServerDirectory" access="public" hint="Setter for ServerDirectory" output="false" returnType="void">
		<cfargument name="ServerDirectory" hint="" required="yes" type="any" />
		<cfset variables.instance.ServerDirectory = arguments.ServerDirectory />
	</cffunction>				
	
	<cffunction name="getServerFile" access="public" hint="Getter for ServerFile" output="false" returnType="any">
		<cfreturn variables.instance.ServerFile />
	</cffunction>
	
	<cffunction name="setServerFile" access="public" hint="Setter for ServerFile" output="false" returnType="void">
		<cfargument name="ServerFile" hint="" required="yes" type="any" />
		<cfset variables.instance.ServerFile = arguments.ServerFile />
	</cffunction>				
	
	<cffunction name="getServerFileExt" access="public" hint="Getter for ServerFileExt" output="false" returnType="any">
		<cfreturn variables.instance.ServerFileExt />
	</cffunction>
	
	<cffunction name="setServerFileExt" access="public" hint="Setter for ServerFileExt" output="false" returnType="void">
		<cfargument name="ServerFileExt" hint="" required="yes" type="any" />
		<cfset variables.instance.ServerFileExt = arguments.ServerFileExt />
	</cffunction>				
	
	<cffunction name="getServerFileName" access="public" hint="Getter for ServerFileName" output="false" returnType="any">
		<cfreturn variables.instance.ServerFileName />
	</cffunction>
	
	<cffunction name="setServerFileName" access="public" hint="Setter for ServerFileName" output="false" returnType="void">
		<cfargument name="ServerFileName" hint="" required="yes" type="any" />
		<cfset variables.instance.ServerFileName = arguments.ServerFileName />
	</cffunction>				
	
	<cffunction name="getTimeCreated" access="public" hint="Getter for TimeCreated" output="false" returnType="any">
		<cfreturn variables.instance.TimeCreated />
	</cffunction>
	
	<cffunction name="setTimeCreated" access="public" hint="Setter for TimeCreated" output="false" returnType="void">
		<cfargument name="TimeCreated" hint="" required="yes" type="any" />
		<cfset variables.instance.TimeCreated = arguments.TimeCreated />
	</cffunction>				
	
	<cffunction name="getTimeLastModified" access="public" hint="Getter for TimeLastModified" output="false" returnType="any">
		<cfreturn variables.instance.TimeLastModified />
	</cffunction>
	
	<cffunction name="setTimeLastModified" access="public" hint="Setter for TimeLastModified" output="false" returnType="void">
		<cfargument name="TimeLastModified" hint="" required="yes" type="any" />
		<cfset variables.instance.TimeLastModified = arguments.TimeLastModified />
	</cffunction>				
	
	<cffunction name="getattributesXML" access="public" hint="Getter for attributesXML" output="false" returnType="any">
		<cfreturn variables.instance.attributesXML />
	</cffunction>
	
	<cffunction name="setattributesXML" access="public" hint="Setter for attributesXML" output="false" returnType="void">
		<cfargument name="attributesXML" hint="" required="yes" type="any" />
		<cfset variables.instance.attributesXML = arguments.attributesXML />
	</cffunction>				
	
	<cffunction name="getActive" access="public" hint="Getter for Active" output="false" returnType="any">
		<cfreturn variables.instance.Active />
	</cffunction>
	
	<cffunction name="setActive" access="public" hint="Setter for Active" output="false" returnType="void">
		<cfargument name="Active" hint="" required="yes" type="any" />
		<cfset variables.instance.Active = arguments.Active />
	</cffunction>				
	
	<cffunction name="getInactiveCode" access="public" hint="Getter for InactiveCode" output="false" returnType="any">
		<cfreturn variables.instance.InactiveCode />
	</cffunction>
	
	<cffunction name="setInactiveCode" access="public" hint="Setter for InactiveCode" output="false" returnType="void">
		<cfargument name="InactiveCode" hint="" required="yes" type="any" />
		<cfset variables.instance.InactiveCode = arguments.InactiveCode />
	</cffunction>				
	
	<cffunction name="getDateCreated" access="public" hint="Getter for DateCreated" output="false" returnType="any">
		<cfreturn variables.instance.DateCreated />
	</cffunction>
	
	<cffunction name="setDateCreated" access="public" hint="Setter for DateCreated" output="false" returnType="void">
		<cfargument name="DateCreated" hint="" required="yes" type="any" />
		<cfset variables.instance.DateCreated = arguments.DateCreated />
	</cffunction>				
	
	<cffunction name="getDateModified" access="public" hint="Getter for DateModified" output="false" returnType="any">
		<cfreturn variables.instance.DateModified />
	</cffunction>
	
	<cffunction name="setDateModified" access="public" hint="Setter for DateModified" output="false" returnType="void">
		<cfargument name="DateModified" hint="" required="yes" type="any" />
		<cfset variables.instance.DateModified = arguments.DateModified />
	</cffunction>				
	


<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the file status.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="FileUpload" output="yes" hint="This function will be called to upload a file.">		

		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="datasource" required="yes" type="string">
		<cfargument name="filePath" required="yes" type="string">
		<cfargument name="SupportEmailAddressID" required="yes" type="numeric">
		<cfargument name="checkFilefor" type="string" required="no">
		<cfargument name="note" type="string" required="no">
		<cfargument name="fileType" type="string" required="no">
		<cfargument name="foldersToSkip" type="string" required="no">
		<cfargument name="movefile" type="string" required="no">
		<cfargument name="debug" type="string" required="no" default="false">
		<cfargument name="usersID" type="numeric" required="no">
						
		<cftry>
								
			<cfif FindNoCase(arguments.filePath, '.exe') GTE 1>
				<cfthrow type="application" detail="" message="The file you are trying to upload has an invalid extension.<p>#ListLast(trim(arguments.filePath), '\')#</p>">
			</cfif>
						
			<cfreturn true>	
				
			<cfcatch type="Any">											
				<cfreturn "<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check if a file exists in the DB.              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="checkFileExistsInDBByName" output="no" returntype="numeric" hint="This function will be called to find out if the file sent in exists in the database.">		
		
		<cfargument name="datasource" required="yes" type="string">
		<cfargument name="fileName" required="yes" type="string">
		
		<cfset var fileID = 0>
						
		<cftry>
		
			<cfquery name="getFileFromDBByName" datasource="#trim(arguments.datasource)#">
				SELECT FileID
				FROM file  
				WHERE ServerFile = '#trim(fileName)#'
			</cfquery>
			
			<cfif getFileFromDBByName.RecordCount gte 1>
				<cfset fileID = getFileFromDBByName.FileID[1]>
			</cfif>
			
			<cfreturn fileID>			
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>



