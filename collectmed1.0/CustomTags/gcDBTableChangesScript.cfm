<!-------------------------------------------------------------------------------------->
<!--- Find out if the tag already exists.                                            --->
<!-------------------------------------------------------------------------------------->			
<cfif FileExists("#trim(request.applicationPath)#\collectmed1.0\DBChanges.txt")>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Read the file into a variable.                                                 --->
	<!-------------------------------------------------------------------------------------->					
		<cffile 
			action="READ" 
			file="#trim(request.applicationPath)#\collectmed1.0\DBChanges.txt" 
			variable="FileContent">
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get the custom functions and place them in a variable.                         --->
	<!-------------------------------------------------------------------------------------->				
		<cfset toSave = request.midString(FileContent, '<!---AllTablesChangesStart--->', '<!---AllTablesChangesEnd--->')>
		
		<cfset toSave =  trim(toSave)>
		
		<cfset fileInDirectory = "yes">
			
</cfif>


<!-------------------------------------------------------------------------------------->
<!--- Get all the datasources in the CF server.                                      --->
<!-------------------------------------------------------------------------------------->
<cffile action="read" file="C:\JRun4\servers\cfusion\cfusion-ear\cfusion-war\WEB-INF\cfusion\lib\neo-query.xml" variable="wddxstr">
<CFWDDX action="WDDX2CFML" input="#wddxstr#" output="defaults">
<cfset DataSources = StructNew()>
<cfset DataSources = defaults[3]>
<cfset Sources = StructKeyList(DataSources)>
<Cfset datasourceList = "">
<cfloop index="i" from="1" to="#ListLen(Sources)#">
	<cfif FindNoCase("PAClient_", ListGetAt(Sources,i))>
		<cfset datasourceList = ListAppend(datasourceList, ListGetAt(Sources,i))>
	</cfif>
</cfloop>	    



<!-------------------------------------------------------------------------------------->
<!--- If no changes to the database are found then no further processing needs       --->
<!--- to be done.                                                                    --->
<!-------------------------------------------------------------------------------------->
<cfif IsDefined("toSave") AND toSave NEQ "" AND IsDefined("datasourceList") AND datasourceList NEQ "">
	
	<!-------------------------------------------------------------------------------------->
	<!--- Set the tablename that will be updated.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cfset count1 = 1>
	<cfloop list="#trim(toSave)#" delimiters="#chr(13)##chr(10)#" index="i">
		<cfif trim(i) NEQ "">
			<cfif FindNoCase("TABLE ", trim(i))>
				<cfset tableName = ListGetAt(trim(i), 2, " ")>
			</cfif>
			
			<cfif NOT FindNoCase("TABLE ", trim(i))>	
				
				<cfset ColumnName = ListGetAt(trim(i), 1, " ")>
				<cfset ColumnName = ReplaceNoCase(ColumnName, "[", "", "ALL")>
				<cfset ColumnName = ReplaceNoCase(ColumnName, "]", "", "ALL")>
				
				<cfset i = "ADD " & trim(i)> 	
				<cfif REQUEST.getAt(trim(i), LEN(trim(i))) EQ ",">
					<cfset i = trim(REQUEST.ReplaceAt(trim(i), "", LEN(i)))> 
				</cfif>	
											
				<cfloop list="#trim(datasourceList)#" index="j">
					
					<cfquery name="checkTableChange" datasource="pa_master">
						SELECT ChangeID 
						FROM TableChange 
						WHERE Datasource = '#trim(j)#' 
						AND TableName = '#trim(tableName)#'
						AND ColumnName = '#trim(ColumnName)#'
						AND ChangeScript = '#trim(i)#'
					</cfquery>
					
					<cfif checkTableChange.RecordCount LTE 0> 
						
						<cfquery name="insertTableChange" datasource="pa_master">
							INSERT INTO TableChange (Datasource, TableName, ColumnName, ChangeScript) 
							VALUES('#trim(j)#', '#trim(tableName)#', '#trim(ColumnName)#', '#trim(i)#')
						</cfquery>
					
					</cfif>	
					
				</cfloop>
				
			</cfif>
							
			<cfset count1 = count1 + 1>		
		</cfif>	
	</cfloop>
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- Now that everything is in the database we can update the file so that it       --->
	<!--- does not get put in the DB again.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cfset fileContent = ReplaceNoCase(fileContent, '<!---AllTablesChangesStart--->', '<!---AllTablesChangesStart_DONE--->', 'ALL')>		
	<cfset fileContent = ReplaceNoCase(fileContent, '<!---AllTablesChangesEnd--->', '<!---AllTablesChangesEnd_DONE--->', 'ALL')>		
	
	<cffile 
		action="write" 
		nameconflict="OVERWRITE" 
		file="#trim(request.applicationPath)#\collectmed1.0\DBChanges.txt" 
		output="#fileContent#">
		
</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get all the records in the table that need to be processed and process         --->
<!--- the changeScript.                                                              --->
<!-------------------------------------------------------------------------------------->
<cfquery name="getUpdatesTableChange" datasource="pa_master">
	SELECT * 
	FROM TableChange 
	WHERE Active = 1 AND InactiveCode IS NULL	
</cfquery>

<cfloop query="getUpdatesTableChange">
	
	<cftry>
		
		<cfquery name="UpdateTable" datasource="#trim(datasource)#">
			IF NOT EXISTS (
			    SELECT * FROM [information_schema].[columns] 
			    WHERE table_name = '#trim(tableName)#' 
			    AND table_schema = 'dbo'
			    AND column_name = '#trim(ColumnName)#'
			)
			BEGIN
			    ALTER TABLE [dbo].[#trim(tableName)#]
			    #trim(ChangeScript)#
			END
		</cfquery>
		
		<cfquery name="UpdateChangeTableActive" datasource="pa_master">
			UPDATE TableChange
			SET Active = 0, InactiveCode = 68, dateModified = now()
			WHERE ChangeID = #trim(ChangeID)#
		</cfquery>
	
		<cfcatch type="Any">
			
			<cfquery name="UpdateChangeTableError" datasource="pa_master">
				UPDATE TableChange
				SET Error = '#CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail# #DateFormat(NOW(), "mm/dd/yyyy")# #TimeFormat(NOW(), "hh:mm:ss tt")# | #trim(Error)#'      
				WHERE ChangeID = #trim(ChangeID)#
			</cfquery>
			
		</cfcatch>
	
	</cftry>
	
</cfloop>

<cfdump var="#getUpdatesTableChange#">



















<!---
IF NOT EXISTS 
(
    SELECT * FROM [information_schema].[columns] 
    WHERE   table_name = 'Customer' 
    AND table_schema = 'dbo'
    AND column_name = 'FavoriteColorId'
)
BEGIN
    ALTER TABLE [dbo].[Customer]
    ADD FavoriteColorId int
END
This script basically checks for the existence of the FavoriteColorId column on the table 
--->




<!---

<cfset colName = ListGetAt(i, 1, " ")>
				<cfset colName = ReplaceNoCase(colName, "[", "", "ALL")>
				<cfset colName = ReplaceNoCase(colName, "]", "", "ALL")>

<!-------------------------------------------------------------------------------------->
	<!--- Check to make sure the table exists.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cfquery name="tableExists" datasource="#request.datasource#">
		SELECT name
		FROM dbo.sysobjects  
		WHERE (type = 'U') AND (name = '#TableName#')
	</cfquery>		
	<cfif tableExists.RecordCount NEQ 1>
		<cf_gcGeneralErrorTemplate
			message="The table name (#TableName#) you sent in does not exist.">
	</cfif>	
	<cfset TableName = tableExists.name>
		
		
	<cfset count2 = 1>
	<cfloop list="#trim(toSave)#" delimiters="#chr(13)##chr(10)#" index="ii">
		<cfif count2 GTE 2>
			<cfoutput>
				<cfset colName = ListGetAt(ii, 1, " ")>
				<cfset colName = ReplaceNoCase(colName, "[", "", "ALL")>
				<cfset colName = ReplaceNoCase(colName, "]", "", "ALL")>
				*#colName#* #ii#<br>
			</cfoutput>
		</cfif>
		<cfset count2 = count2 + 1>
	</cfloop>

--->