 	

<cfcomponent displayname="FileGateway" output="false" hint="I am the File Gateway Class.">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the File Gateway Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- PUBLIC METHODS                                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllFiles" access="public" output="false" hint="I run a query of all Files within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllFiles(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- PRIVATE METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllFiles" access="package" output="false" hint="I run a query and will return all File records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.datasource.getDSName()#">
				SELECT FileID,FileType,ClientID,DisplayInGUID,ParentFileID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified,attributesXML,Active,InactiveCode,DateCreated,DateModified
				FROM file
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "FileID")>				
						AND FileID IN(#arguments.filter.FileID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FileType")>				
						AND FileType = <cfqueryparam value="#arguments.filter.FileType#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ClientID")>				
						AND ClientID = <cfqueryparam value="#arguments.filter.ClientID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "DisplayInGUID")>				
						AND DisplayInGUID = <cfqueryparam value="#arguments.filter.DisplayInGUID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ParentFileID")>				
						AND ParentFileID = <cfqueryparam value="#arguments.filter.ParentFileID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "UsersID")>				
						AND UsersID = <cfqueryparam value="#arguments.filter.UsersID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FilePlacementDirectory")>				
						AND FilePlacementDirectory = <cfqueryparam value="#arguments.filter.FilePlacementDirectory#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "AttemptedServerFile")>				
						AND AttemptedServerFile = <cfqueryparam value="#arguments.filter.AttemptedServerFile#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ClientDirectory")>				
						AND ClientDirectory = <cfqueryparam value="#arguments.filter.ClientDirectory#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ClientFile")>				
						AND ClientFile = <cfqueryparam value="#arguments.filter.ClientFile#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ClientFileExt")>				
						AND ClientFileExt = <cfqueryparam value="#arguments.filter.ClientFileExt#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ClientFileName")>				
						AND ClientFileName = <cfqueryparam value="#arguments.filter.ClientFileName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ContentSubType")>				
						AND ContentSubType = <cfqueryparam value="#arguments.filter.ContentSubType#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ContentType")>				
						AND ContentType = <cfqueryparam value="#arguments.filter.ContentType#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "DateLastAccessed")>				
						AND DateLastAccessed = <cfqueryparam value="#arguments.filter.DateLastAccessed#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FileExisted")>				
						AND FileExisted = <cfqueryparam value="#arguments.filter.FileExisted#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FileSize")>				
						AND FileSize = <cfqueryparam value="#arguments.filter.FileSize#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FileWasAppended")>				
						AND FileWasAppended = <cfqueryparam value="#arguments.filter.FileWasAppended#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FileWasOverwritten")>				
						AND FileWasOverwritten = <cfqueryparam value="#arguments.filter.FileWasOverwritten#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FileWasRenamed")>				
						AND FileWasRenamed = <cfqueryparam value="#arguments.filter.FileWasRenamed#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "FileWasSaved")>				
						AND FileWasSaved = <cfqueryparam value="#arguments.filter.FileWasSaved#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "OldFileSize")>				
						AND OldFileSize = <cfqueryparam value="#arguments.filter.OldFileSize#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ServerDirectory")>				
						AND ServerDirectory = <cfqueryparam value="#arguments.filter.ServerDirectory#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ServerFile")>				
						AND ServerFile = <cfqueryparam value="#arguments.filter.ServerFile#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ServerFileExt")>				
						AND ServerFileExt = <cfqueryparam value="#arguments.filter.ServerFileExt#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ServerFileName")>				
						AND ServerFileName = <cfqueryparam value="#arguments.filter.ServerFileName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "TimeCreated")>				
						AND TimeCreated = <cfqueryparam value="#arguments.filter.TimeCreated#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "TimeLastModified")>				
						AND TimeLastModified = <cfqueryparam value="#arguments.filter.TimeLastModified#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "attributesXML")>				
						AND attributesXML = <cfqueryparam value="#arguments.filter.attributesXML#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "Active")>				
						AND Active = <cfqueryparam value="#arguments.filter.Active#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InactiveCode")>				
						AND InactiveCode = <cfqueryparam value="#arguments.filter.InactiveCode#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "DateCreated")>				
						AND DateCreated = <cfqueryparam value="#arguments.filter.DateCreated#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>
					<cfif structKeyExists(arguments.filter, "orderBy")>
						ORDER BY #arguments.filter.orderBy#		
					</cfif>
				</cfif>		
			</cfquery>
				
		<cfreturn qSearch />
		
	</cffunction>
		
		
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>



