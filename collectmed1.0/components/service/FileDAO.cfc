 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the File DAO Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a File, either by creating a new entry or updating an existing one.">
		<cfargument name="File" required="true" type="cmComponents.com.common.model.File" hint="I am the File bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.File)>
			<cfset success = update(arguments.File) />
		<cfelse>
			<cfset success = create(arguments.File) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific File exists within the database, using the ID as a check.">
		<cfargument name="File" required="true" type="cmComponents.com.common.model.File" hint="I am the File bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.datasource.getDSName()#" maxrows="1">
			SELECT count(1) as idexists
			FROM file
			WHERE FileID = <cfqueryparam value="#arguments.File.getFileID()#" CFSQLType="cf_sql_integer" />
		</cfquery>
		
		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
		
	</cffunction>


										
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="private">
				
		<cfargument name="File" required="true" type="cmComponents.com.common.model.File" />
		
		<cfset var qCreateFile = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateFile" datasource="#variables.instance.datasource.getDSName()#">
				INSERT INTO file (FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,attributesXML,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(arguments.File.getFileType()))>						
						<cfqueryparam value="#trim(arguments.File.getFileType())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.File.getClientID())#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(arguments.File.getDisplayInGUID()))>						
						<cfqueryparam value="#trim(arguments.File.getDisplayInGUID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.File.getParentFileID()))>						
						<cfqueryparam value="#trim(arguments.File.getParentFileID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.File.getUsersID()))>						
						<cfqueryparam value="#trim(arguments.File.getUsersID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.File.getFilePlacementDirectory()) NEQ "" AND trim(arguments.File.getFilePlacementDirectory()) NEQ "@@" AND trim(arguments.File.getFilePlacementDirectory()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFilePlacementDirectory())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getAttemptedServerFile()) NEQ "" AND trim(arguments.File.getAttemptedServerFile()) NEQ "@@" AND trim(arguments.File.getAttemptedServerFile()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getAttemptedServerFile())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getClientDirectory()) NEQ "" AND trim(arguments.File.getClientDirectory()) NEQ "@@" AND trim(arguments.File.getClientDirectory()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientDirectory())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getClientFile()) NEQ "" AND trim(arguments.File.getClientFile()) NEQ "@@" AND trim(arguments.File.getClientFile()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientFile())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getClientFileExt()) NEQ "" AND trim(arguments.File.getClientFileExt()) NEQ "@@" AND trim(arguments.File.getClientFileExt()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientFileExt())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getClientFileName()) NEQ "" AND trim(arguments.File.getClientFileName()) NEQ "@@" AND trim(arguments.File.getClientFileName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientFileName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getContentSubType()) NEQ "" AND trim(arguments.File.getContentSubType()) NEQ "@@" AND trim(arguments.File.getContentSubType()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getContentSubType())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getContentType()) NEQ "" AND trim(arguments.File.getContentType()) NEQ "@@" AND trim(arguments.File.getContentType()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getContentType())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(arguments.File.getDateLastAccessed()))>						
						<cfqueryparam value="#trim(arguments.File.getDateLastAccessed())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(arguments.File.getFileExisted()) NEQ "" AND trim(arguments.File.getFileExisted()) NEQ "@@" AND trim(arguments.File.getFileExisted()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileExisted())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getFileSize()) NEQ "" AND trim(arguments.File.getFileSize()) NEQ "@@" AND trim(arguments.File.getFileSize()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileSize())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getFileWasAppended()) NEQ "" AND trim(arguments.File.getFileWasAppended()) NEQ "@@" AND trim(arguments.File.getFileWasAppended()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasAppended())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getFileWasOverwritten()) NEQ "" AND trim(arguments.File.getFileWasOverwritten()) NEQ "@@" AND trim(arguments.File.getFileWasOverwritten()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasOverwritten())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getFileWasRenamed()) NEQ "" AND trim(arguments.File.getFileWasRenamed()) NEQ "@@" AND trim(arguments.File.getFileWasRenamed()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasRenamed())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getFileWasSaved()) NEQ "" AND trim(arguments.File.getFileWasSaved()) NEQ "@@" AND trim(arguments.File.getFileWasSaved()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasSaved())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getOldFileSize()) NEQ "" AND trim(arguments.File.getOldFileSize()) NEQ "@@" AND trim(arguments.File.getOldFileSize()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getOldFileSize())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getServerDirectory()) NEQ "" AND trim(arguments.File.getServerDirectory()) NEQ "@@" AND trim(arguments.File.getServerDirectory()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerDirectory())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getServerFile()) NEQ "" AND trim(arguments.File.getServerFile()) NEQ "@@" AND trim(arguments.File.getServerFile()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerFile())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getServerFileExt()) NEQ "" AND trim(arguments.File.getServerFileExt()) NEQ "@@" AND trim(arguments.File.getServerFileExt()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerFileExt())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.File.getServerFileName()) NEQ "" AND trim(arguments.File.getServerFileName()) NEQ "@@" AND trim(arguments.File.getServerFileName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerFileName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(arguments.File.getTimeCreated()))>						
						<cfqueryparam value="#trim(arguments.File.getTimeCreated())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(arguments.File.getTimeLastModified()))>						
						<cfqueryparam value="#trim(arguments.File.getTimeLastModified())#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(arguments.File.getattributesXML()) NEQ "" AND trim(arguments.File.getattributesXML()) NEQ "@@" AND trim(arguments.File.getattributesXML()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getattributesXML())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.File.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.File.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.File.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				)
				SELECT LAST_INSERT_ID() AS FileID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.File.setFileID(qCreateFile.FileID);
		</cfscript>
		
		<cfreturn arguments.File />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="File" type="cmComponents.com.common.model.File" required="true" />
				
		<cfset var qGetFile = "" />
				
		<cfset qGetFile = getFileByID(trim(arguments.File.getFileID())) />
				
		<cfif qGetFile.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetFile.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetFile, 1)>
				<cfset arguments.File.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="File" required="true" type="cmComponents.com.common.model.File" />
		<cfset var qUpdateFile = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdateFile" datasource="#variables.instance.datasource.getDSName()#">
				UPDATE file  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					FileType =				
					<cfif IsNumeric(trim(arguments.File.getFileType()))>						
						<cfqueryparam value="#trim(arguments.File.getFileType())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClientID =						
						<cfqueryparam value="#trim(arguments.File.getClientID())#" cfsqltype="CF_SQL_INTEGER" />,
					
					DisplayInGUID =				
					<cfif IsNumeric(trim(arguments.File.getDisplayInGUID()))>						
						<cfqueryparam value="#trim(arguments.File.getDisplayInGUID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ParentFileID =				
					<cfif IsNumeric(trim(arguments.File.getParentFileID()))>						
						<cfqueryparam value="#trim(arguments.File.getParentFileID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					UsersID =				
					<cfif IsNumeric(trim(arguments.File.getUsersID()))>						
						<cfqueryparam value="#trim(arguments.File.getUsersID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					FilePlacementDirectory =	
					<cfif trim(arguments.File.getFilePlacementDirectory()) NEQ "" AND trim(arguments.File.getFilePlacementDirectory()) NEQ "@@" AND trim(arguments.File.getFilePlacementDirectory()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFilePlacementDirectory())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AttemptedServerFile =	
					<cfif trim(arguments.File.getAttemptedServerFile()) NEQ "" AND trim(arguments.File.getAttemptedServerFile()) NEQ "@@" AND trim(arguments.File.getAttemptedServerFile()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getAttemptedServerFile())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientDirectory =	
					<cfif trim(arguments.File.getClientDirectory()) NEQ "" AND trim(arguments.File.getClientDirectory()) NEQ "@@" AND trim(arguments.File.getClientDirectory()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientDirectory())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientFile =	
					<cfif trim(arguments.File.getClientFile()) NEQ "" AND trim(arguments.File.getClientFile()) NEQ "@@" AND trim(arguments.File.getClientFile()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientFile())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientFileExt =	
					<cfif trim(arguments.File.getClientFileExt()) NEQ "" AND trim(arguments.File.getClientFileExt()) NEQ "@@" AND trim(arguments.File.getClientFileExt()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientFileExt())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClientFileName =	
					<cfif trim(arguments.File.getClientFileName()) NEQ "" AND trim(arguments.File.getClientFileName()) NEQ "@@" AND trim(arguments.File.getClientFileName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getClientFileName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ContentSubType =	
					<cfif trim(arguments.File.getContentSubType()) NEQ "" AND trim(arguments.File.getContentSubType()) NEQ "@@" AND trim(arguments.File.getContentSubType()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getContentSubType())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ContentType =	
					<cfif trim(arguments.File.getContentType()) NEQ "" AND trim(arguments.File.getContentType()) NEQ "@@" AND trim(arguments.File.getContentType()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getContentType())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					DateLastAccessed =	
					<cfif IsDate(trim(arguments.File.getDateLastAccessed()))>						
						<cfqueryparam value="#trim(arguments.File.getDateLastAccessed())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					FileExisted =	
					<cfif trim(arguments.File.getFileExisted()) NEQ "" AND trim(arguments.File.getFileExisted()) NEQ "@@" AND trim(arguments.File.getFileExisted()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileExisted())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileSize =	
					<cfif trim(arguments.File.getFileSize()) NEQ "" AND trim(arguments.File.getFileSize()) NEQ "@@" AND trim(arguments.File.getFileSize()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileSize())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasAppended =	
					<cfif trim(arguments.File.getFileWasAppended()) NEQ "" AND trim(arguments.File.getFileWasAppended()) NEQ "@@" AND trim(arguments.File.getFileWasAppended()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasAppended())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasOverwritten =	
					<cfif trim(arguments.File.getFileWasOverwritten()) NEQ "" AND trim(arguments.File.getFileWasOverwritten()) NEQ "@@" AND trim(arguments.File.getFileWasOverwritten()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasOverwritten())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasRenamed =	
					<cfif trim(arguments.File.getFileWasRenamed()) NEQ "" AND trim(arguments.File.getFileWasRenamed()) NEQ "@@" AND trim(arguments.File.getFileWasRenamed()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasRenamed())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FileWasSaved =	
					<cfif trim(arguments.File.getFileWasSaved()) NEQ "" AND trim(arguments.File.getFileWasSaved()) NEQ "@@" AND trim(arguments.File.getFileWasSaved()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getFileWasSaved())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OldFileSize =	
					<cfif trim(arguments.File.getOldFileSize()) NEQ "" AND trim(arguments.File.getOldFileSize()) NEQ "@@" AND trim(arguments.File.getOldFileSize()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getOldFileSize())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerDirectory =	
					<cfif trim(arguments.File.getServerDirectory()) NEQ "" AND trim(arguments.File.getServerDirectory()) NEQ "@@" AND trim(arguments.File.getServerDirectory()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerDirectory())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerFile =	
					<cfif trim(arguments.File.getServerFile()) NEQ "" AND trim(arguments.File.getServerFile()) NEQ "@@" AND trim(arguments.File.getServerFile()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerFile())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerFileExt =	
					<cfif trim(arguments.File.getServerFileExt()) NEQ "" AND trim(arguments.File.getServerFileExt()) NEQ "@@" AND trim(arguments.File.getServerFileExt()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerFileExt())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServerFileName =	
					<cfif trim(arguments.File.getServerFileName()) NEQ "" AND trim(arguments.File.getServerFileName()) NEQ "@@" AND trim(arguments.File.getServerFileName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getServerFileName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TimeCreated =	
					<cfif IsDate(trim(arguments.File.getTimeCreated()))>						
						<cfqueryparam value="#trim(arguments.File.getTimeCreated())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					TimeLastModified =	
					<cfif IsDate(trim(arguments.File.getTimeLastModified()))>						
						<cfqueryparam value="#trim(arguments.File.getTimeLastModified())#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					attributesXML =	
					<cfif trim(arguments.File.getattributesXML()) NEQ "" AND trim(arguments.File.getattributesXML()) NEQ "@@" AND trim(arguments.File.getattributesXML()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.File.getattributesXML())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.File.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.File.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.File.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE FileID = <cfqueryparam value="#trim(arguments.File.getFileID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="FileID" required="true" type="String" />
		
		<cfset var qDeleteFile = "">

		<cfquery name="qDeleteFile" datasource="#variables.instance.datasource.getDSName()#" result="status">
			DELETE
			FROM file
			WHERE FileID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.FileID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileByID" output="false" access="public" returntype="query">
		
		<cfargument name="FileID" required="yes" type="numeric" />		
		
		<cfset var qGetFile = "" />		
	
		<cfquery name="qGetFile" datasource="#variables.instance.datasource.getDSName()#">
	  		SELECT FileID,FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,attributesXML,Active,InactiveCode,DateCreated,DateModified
			FROM file  
			WHERE FileID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.FileID)#" /> 
		</cfquery>
		
		<cfreturn qGetFile>
		
	</cffunction>	
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="QueryToStruct" access="public" returntype="any" output="false" hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">
	
		<!--- Define arguments. --->
		<cfargument name="Query" type="query" required="true" />
		<cfargument name="Row" type="numeric" required="false" default="0" />
	
		<cfscript>
			
			// Define the local scope.
			var LOCAL = StructNew();
	
			// Determine the indexes that we will need to loop over. To do so, check to see if we are working with a given row, or the whole record set.
			if (ARGUMENTS.Row){				
				// We are only looping over one row.
				LOCAL.FromIndex = ARGUMENTS.Row;
				LOCAL.ToIndex = ARGUMENTS.Row;
			} 
			else{				
				// We are looping over the entire query.
				LOCAL.FromIndex = 1;
				LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;
			}
	
			// Get the list of columns as an array and the column count.
			LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
			LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );
			
			// Create an array to keep all the objects.
			LOCAL.DataArray = ArrayNew( 1 );
	
			// Loop over the rows to create a structure for each row.
			for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
	
				// Create a new structure for this row.
				ArrayAppend( LOCAL.DataArray, StructNew() );
		
				// Get the index of the current data array object.
				LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );
		
				// Loop over the columns to set the structure values.
				for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
		
					// Get the column value.
					LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
			
					// Set column value into the structure.
					LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
				}
		
			}
	
			// At this point, we have an array of structure objects that represent the rows in the query over the indexes that we wanted to convert. 
			// If we did not want to convert a specific record, return the array. If we wanted to convert a single row, then return the just that STRUCTURE, not the array.
			if (ARGUMENTS.Row){			
				// Return the first array item.
				return( LOCAL.DataArray[ 1 ] );			
			} 
			else{			
				// Return the entire array.
				return( LOCAL.DataArray );
			}
	
		</cfscript>
	
	</cffunction>	
	
	
	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





