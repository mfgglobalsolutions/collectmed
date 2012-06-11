<cfcomponent output="false">


	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the VerificationFile DAO Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getParentVerificationFileByFileName" access="public"  hint="">		
		<cfargument name="fileName" required="true" type="String" hint="I am the filename to get group files from." />		
		
		<cfset var fileExtension = "">
		<cfset var batchID = "">
		<cfset var parentFileName = "">
		<cfset var parentFileID = "">
		<cfset var textParentFileID = "">
		
		<cfset fileExtension = ListLast(arguments.fileName, ".")>
		
		<cfswitch expression="#trim(fileExtension)#">
			<cfcase value="xml">
				<cfset parentFileName = ListFirst(arguments.fileName, ".") & ".xml">	
			</cfcase>
			<cfcase value="BID,997,ACC,EXT,REJ,271">
				<cfset batchID = ListGetAt(arguments.fileName, 2, ".")>			
			</cfcase>
		</cfswitch>
		
		<cfif LEN(trim(parentFileName)) gte 1>
			
			<cfset parentFileID = getParentFileID(parentFileName)>
			
		<cfelseif LEN(trim(batchID)) gte 1>
		
			<cfquery name="getBIDFileID" datasource="#variables.instance.datasource.getDSName()#">
				SELECT ClientFile
				FROM file
				WHERE ClientFileName LIKE (<cfqueryparam value="%#trim(batchID)#%" cfsqltype="CF_SQL_VARCHAR" />)
				AND ClientFileExt = <cfqueryparam value="BID" cfsqltype="CF_SQL_VARCHAR" />
			</cfquery>
		
			<cfif getBIDFileID.RecordCount EQ 1>
				
				<cfset parentFileName = ListGetAt(getBIDFileID.ClientFile, 3, ".")>
				<cfset textParentFileID = mid(trim(parentFileName), 11, 7)>		
				
				<cfquery name="getTextFileParentID" datasource="#variables.instance.datasource.getDSName()#">
					SELECT ParentFIleID
					FROM file
					WHERE FileID = <cfqueryparam value="#textParentFileID#" cfsqltype="CF_SQL_INTEGER" />
				</cfquery>
							
				<cfset parentFileID = getTextFileParentID.ParentFIleID>
				
			</cfif>
		
		</cfif>
		
		
		<cfreturn parentFileID>
			
	</cffunction>
	
	<cffunction name="getParentFileID" access="public" output="false" hint="">		
		<cfargument name="parentFileName" required="true" type="String" hint="I am the filename to get group files from." />		
		
		<cfset var parentFileID = "">
		<cfset var getParentFileID = "">
		
		<cfquery name="getParentFileID" datasource="#variables.instance.datasource.getDSName()#">
			SELECT FileID
			FROM file
			WHERE ClientFileName = <cfqueryparam value="#trim(arguments.parentFileName)#" cfsqltype="CF_SQL_VARCHAR" />
		</cfquery>
		
		<cfif getParentFileID.recordCount EQ 1>
			<cfset parentFileID = getParentFileID.FileID>
		</cfif>
		
		<cfreturn parentFileID>

	</cffunction>
	
		
</cfcomponent>



