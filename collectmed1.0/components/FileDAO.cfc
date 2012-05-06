 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="FileBean" />
		
		<cfset var qCreateFile = "" />		
		
		<cfset var localFileType = arguments.bean.getFileType() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localDisplayInGUID = arguments.bean.getDisplayInGUID() />
		<cfset var localParentFileID = arguments.bean.getParentFileID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localFilePlacementDirectory = arguments.bean.getFilePlacementDirectory() />
		<cfset var localAttemptedServerFile = arguments.bean.getAttemptedServerFile() />
		<cfset var localClientDirectory = arguments.bean.getClientDirectory() />
		<cfset var localClientFile = arguments.bean.getClientFile() />
		<cfset var localClientFileExt = arguments.bean.getClientFileExt() />
		<cfset var localClientFileName = arguments.bean.getClientFileName() />
		<cfset var localContentSubType = arguments.bean.getContentSubType() />
		<cfset var localContentType = arguments.bean.getContentType() />
		<cfset var localDateLastAccessed = arguments.bean.getDateLastAccessed() />
		<cfset var localFileExisted = arguments.bean.getFileExisted() />
		<cfset var localFileSize = arguments.bean.getFileSize() />
		<cfset var localFileWasAppended = arguments.bean.getFileWasAppended() />
		<cfset var localFileWasOverwritten = arguments.bean.getFileWasOverwritten() />
		<cfset var localFileWasRenamed = arguments.bean.getFileWasRenamed() />
		<cfset var localFileWasSaved = arguments.bean.getFileWasSaved() />
		<cfset var localOldFileSize = arguments.bean.getOldFileSize() />
		<cfset var localServerDirectory = arguments.bean.getServerDirectory() />
		<cfset var localServerFile = arguments.bean.getServerFile() />
		<cfset var localServerFileExt = arguments.bean.getServerFileExt() />
		<cfset var localServerFileName = arguments.bean.getServerFileName() />
		<cfset var localTimeCreated = arguments.bean.getTimeCreated() />
		<cfset var localTimeLastModified = arguments.bean.getTimeLastModified() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateFile" datasource="#trim(arguments.ds)#">
				INSERT INTO File (FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localFileType))>						
						<cfqueryparam value="#trim(localFileType)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localDisplayInGUID))>						
						<cfqueryparam value="#trim(localDisplayInGUID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localParentFileID))>						
						<cfqueryparam value="#trim(localParentFileID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localUsersID))>						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localFilePlacementDirectory) NEQ "" AND trim(localFilePlacementDirectory) NEQ "@@" AND trim(localFilePlacementDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localFilePlacementDirectory)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAttemptedServerFile) NEQ "" AND trim(localAttemptedServerFile) NEQ "@@" AND trim(localAttemptedServerFile) NEQ "NULL">						
						<cfqueryparam value="#trim(localAttemptedServerFile)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localClientDirectory) NEQ "" AND trim(localClientDirectory) NEQ "@@" AND trim(localClientDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientDirectory)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localClientFile) NEQ "" AND trim(localClientFile) NEQ "@@" AND trim(localClientFile) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientFile)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localClientFileExt) NEQ "" AND trim(localClientFileExt) NEQ "@@" AND trim(localClientFileExt) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientFileExt)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localClientFileName) NEQ "" AND trim(localClientFileName) NEQ "@@" AND trim(localClientFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientFileName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localContentSubType) NEQ "" AND trim(localContentSubType) NEQ "@@" AND trim(localContentSubType) NEQ "NULL">						
						<cfqueryparam value="#trim(localContentSubType)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localContentType) NEQ "" AND trim(localContentType) NEQ "@@" AND trim(localContentType) NEQ "NULL">						
						<cfqueryparam value="#trim(localContentType)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localDateLastAccessed))>						
						<cfqueryparam value="#trim(localDateLastAccessed)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localFileExisted) NEQ "" AND trim(localFileExisted) NEQ "@@" AND trim(localFileExisted) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileExisted)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFileSize) NEQ "" AND trim(localFileSize) NEQ "@@" AND trim(localFileSize) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileSize)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFileWasAppended) NEQ "" AND trim(localFileWasAppended) NEQ "@@" AND trim(localFileWasAppended) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasAppended)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFileWasOverwritten) NEQ "" AND trim(localFileWasOverwritten) NEQ "@@" AND trim(localFileWasOverwritten) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasOverwritten)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFileWasRenamed) NEQ "" AND trim(localFileWasRenamed) NEQ "@@" AND trim(localFileWasRenamed) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasRenamed)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFileWasSaved) NEQ "" AND trim(localFileWasSaved) NEQ "@@" AND trim(localFileWasSaved) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasSaved)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOldFileSize) NEQ "" AND trim(localOldFileSize) NEQ "@@" AND trim(localOldFileSize) NEQ "NULL">						
						<cfqueryparam value="#trim(localOldFileSize)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localServerDirectory) NEQ "" AND trim(localServerDirectory) NEQ "@@" AND trim(localServerDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerDirectory)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localServerFile) NEQ "" AND trim(localServerFile) NEQ "@@" AND trim(localServerFile) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerFile)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localServerFileExt) NEQ "" AND trim(localServerFileExt) NEQ "@@" AND trim(localServerFileExt) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerFileExt)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localServerFileName) NEQ "" AND trim(localServerFileName) NEQ "@@" AND trim(localServerFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerFileName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localTimeCreated))>						
						<cfqueryparam value="#trim(localTimeCreated)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localTimeLastModified))>						
						<cfqueryparam value="#trim(localTimeLastModified)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS FileID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setFileID(qCreateFile.FileID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="FileBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="FileID" required="yes" type="numeric" />		
		<cfset var qGetFile = "" />		
		
		<cfset qGetFile = getFile(trim(arguments.ds), trim(FileID)) />
				
		<cfif qGetFile.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objFile = createObject("component", "FileBean").init(arguments.ds);
			objFile.setFileID(qGetFile.FileID);
			objFile.setFileType(qGetFile.FileType);
			objFile.setClientID(qGetFile.ClientID);
			objFile.setDisplayInGUID(qGetFile.DisplayInGUID);
			objFile.setParentFileID(qGetFile.ParentFileID);
			objFile.setUsersID(qGetFile.UsersID);
			objFile.setFilePlacementDirectory(qGetFile.FilePlacementDirectory);
			objFile.setAttemptedServerFile(qGetFile.AttemptedServerFile);
			objFile.setClientDirectory(qGetFile.ClientDirectory);
			objFile.setClientFile(qGetFile.ClientFile);
			objFile.setClientFileExt(qGetFile.ClientFileExt);
			objFile.setClientFileName(qGetFile.ClientFileName);
			objFile.setContentSubType(qGetFile.ContentSubType);
			objFile.setContentType(qGetFile.ContentType);
			objFile.setDateLastAccessed(qGetFile.DateLastAccessed);
			objFile.setFileExisted(qGetFile.FileExisted);
			objFile.setFileSize(qGetFile.FileSize);
			objFile.setFileWasAppended(qGetFile.FileWasAppended);
			objFile.setFileWasOverwritten(qGetFile.FileWasOverwritten);
			objFile.setFileWasRenamed(qGetFile.FileWasRenamed);
			objFile.setFileWasSaved(qGetFile.FileWasSaved);
			objFile.setOldFileSize(qGetFile.OldFileSize);
			objFile.setServerDirectory(qGetFile.ServerDirectory);
			objFile.setServerFile(qGetFile.ServerFile);
			objFile.setServerFileExt(qGetFile.ServerFileExt);
			objFile.setServerFileName(qGetFile.ServerFileName);
			objFile.setTimeCreated(qGetFile.TimeCreated);
			objFile.setTimeLastModified(qGetFile.TimeLastModified);
			objFile.setActive(qGetFile.Active);
			objFile.setInactiveCode(qGetFile.InactiveCode);
			objFile.setDateCreated(qGetFile.DateCreated);
			objFile.setDateModified(qGetFile.DateModified);				
			return objFile;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="FileBean" />
		<cfset var qUpdateFile = "" />
		<cfset var localFileType = arguments.bean.getFileType() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localDisplayInGUID = arguments.bean.getDisplayInGUID() />
		<cfset var localParentFileID = arguments.bean.getParentFileID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localFilePlacementDirectory = arguments.bean.getFilePlacementDirectory() />
		<cfset var localAttemptedServerFile = arguments.bean.getAttemptedServerFile() />
		<cfset var localClientDirectory = arguments.bean.getClientDirectory() />
		<cfset var localClientFile = arguments.bean.getClientFile() />
		<cfset var localClientFileExt = arguments.bean.getClientFileExt() />
		<cfset var localClientFileName = arguments.bean.getClientFileName() />
		<cfset var localContentSubType = arguments.bean.getContentSubType() />
		<cfset var localContentType = arguments.bean.getContentType() />
		<cfset var localDateLastAccessed = arguments.bean.getDateLastAccessed() />
		<cfset var localFileExisted = arguments.bean.getFileExisted() />
		<cfset var localFileSize = arguments.bean.getFileSize() />
		<cfset var localFileWasAppended = arguments.bean.getFileWasAppended() />
		<cfset var localFileWasOverwritten = arguments.bean.getFileWasOverwritten() />
		<cfset var localFileWasRenamed = arguments.bean.getFileWasRenamed() />
		<cfset var localFileWasSaved = arguments.bean.getFileWasSaved() />
		<cfset var localOldFileSize = arguments.bean.getOldFileSize() />
		<cfset var localServerDirectory = arguments.bean.getServerDirectory() />
		<cfset var localServerFile = arguments.bean.getServerFile() />
		<cfset var localServerFileExt = arguments.bean.getServerFileExt() />
		<cfset var localServerFileName = arguments.bean.getServerFileName() />
		<cfset var localTimeCreated = arguments.bean.getTimeCreated() />
		<cfset var localTimeLastModified = arguments.bean.getTimeLastModified() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateFile" datasource="#trim(arguments.ds)#">
				UPDATE File  SET
					
					FileType =				
					<cfif IsNumeric(trim(localFileType))>						
						<cfqueryparam value="#trim(localFileType)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					DisplayInGUID =				
					<cfif IsNumeric(trim(localDisplayInGUID))>						
						<cfqueryparam value="#trim(localDisplayInGUID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ParentFileID =				
					<cfif IsNumeric(trim(localParentFileID))>						
						<cfqueryparam value="#trim(localParentFileID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					UsersID =				
					<cfif IsNumeric(trim(localUsersID))>						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					FilePlacementDirectory =	
					<cfif trim(localFilePlacementDirectory) NEQ "" AND trim(localFilePlacementDirectory) NEQ "@@" AND trim(localFilePlacementDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localFilePlacementDirectory)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AttemptedServerFile =	
					<cfif trim(localAttemptedServerFile) NEQ "" AND trim(localAttemptedServerFile) NEQ "@@" AND trim(localAttemptedServerFile) NEQ "NULL">						
						<cfqueryparam value="#trim(localAttemptedServerFile)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientDirectory =	
					<cfif trim(localClientDirectory) NEQ "" AND trim(localClientDirectory) NEQ "@@" AND trim(localClientDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientDirectory)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientFile =	
					<cfif trim(localClientFile) NEQ "" AND trim(localClientFile) NEQ "@@" AND trim(localClientFile) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientFile)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientFileExt =	
					<cfif trim(localClientFileExt) NEQ "" AND trim(localClientFileExt) NEQ "@@" AND trim(localClientFileExt) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientFileExt)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientFileName =	
					<cfif trim(localClientFileName) NEQ "" AND trim(localClientFileName) NEQ "@@" AND trim(localClientFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientFileName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ContentSubType =	
					<cfif trim(localContentSubType) NEQ "" AND trim(localContentSubType) NEQ "@@" AND trim(localContentSubType) NEQ "NULL">						
						<cfqueryparam value="#trim(localContentSubType)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ContentType =	
					<cfif trim(localContentType) NEQ "" AND trim(localContentType) NEQ "@@" AND trim(localContentType) NEQ "NULL">						
						<cfqueryparam value="#trim(localContentType)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					DateLastAccessed =	
					<cfif IsDate(trim(localDateLastAccessed))>						
						<cfqueryparam value="#trim(localDateLastAccessed)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					FileExisted =	
					<cfif trim(localFileExisted) NEQ "" AND trim(localFileExisted) NEQ "@@" AND trim(localFileExisted) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileExisted)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileSize =	
					<cfif trim(localFileSize) NEQ "" AND trim(localFileSize) NEQ "@@" AND trim(localFileSize) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileSize)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasAppended =	
					<cfif trim(localFileWasAppended) NEQ "" AND trim(localFileWasAppended) NEQ "@@" AND trim(localFileWasAppended) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasAppended)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasOverwritten =	
					<cfif trim(localFileWasOverwritten) NEQ "" AND trim(localFileWasOverwritten) NEQ "@@" AND trim(localFileWasOverwritten) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasOverwritten)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasRenamed =	
					<cfif trim(localFileWasRenamed) NEQ "" AND trim(localFileWasRenamed) NEQ "@@" AND trim(localFileWasRenamed) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasRenamed)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasSaved =	
					<cfif trim(localFileWasSaved) NEQ "" AND trim(localFileWasSaved) NEQ "@@" AND trim(localFileWasSaved) NEQ "NULL">						
						<cfqueryparam value="#trim(localFileWasSaved)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OldFileSize =	
					<cfif trim(localOldFileSize) NEQ "" AND trim(localOldFileSize) NEQ "@@" AND trim(localOldFileSize) NEQ "NULL">						
						<cfqueryparam value="#trim(localOldFileSize)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerDirectory =	
					<cfif trim(localServerDirectory) NEQ "" AND trim(localServerDirectory) NEQ "@@" AND trim(localServerDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerDirectory)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerFile =	
					<cfif trim(localServerFile) NEQ "" AND trim(localServerFile) NEQ "@@" AND trim(localServerFile) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerFile)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerFileExt =	
					<cfif trim(localServerFileExt) NEQ "" AND trim(localServerFileExt) NEQ "@@" AND trim(localServerFileExt) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerFileExt)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerFileName =	
					<cfif trim(localServerFileName) NEQ "" AND trim(localServerFileName) NEQ "@@" AND trim(localServerFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localServerFileName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TimeCreated =	
					<cfif IsDate(trim(localTimeCreated))>						
						<cfqueryparam value="#trim(localTimeCreated)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					TimeLastModified =	
					<cfif IsDate(trim(localTimeLastModified))>						
						<cfqueryparam value="#trim(localTimeLastModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE FileID = <cfqueryparam value="#trim(arguments.bean.getFileID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="FileBean" />
		<cfset var qDeleteFile = "">

		<cfquery name="qDeleteFile" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM File
			WHERE FileID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getFileID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFile" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="FileID" required="yes" type="numeric" />		
		<cfset var qGetFile = "" />		
	
		<cfquery name="qGetFile" datasource="#trim(arguments.ds)#">
	  		SELECT FileID,FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,Active,InactiveCode,DateCreated,DateModified
			FROM File  
			WHERE FileID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.FileID)#" /> 
		</cfquery>
		
		<cfreturn qGetFile>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


