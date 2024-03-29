<!-------------------------------------------------------------------------------------->
<!--- NAME: gcCreateDatabaseTableCFCFileBean.cfm                                     --->
<!-------------------------------------------------------------------------------------->
<!--- PURPOSE:                                                                       --->  
<!--- This tag is the tag that takes in a database table name                        --->
<!--- and will create a CFC file for that table.                                     --->
<!--- It takes the columns and writes a CFC file that will                           --->
<!--- allow you to Create an object based on the table record.                       --->
<!---                                                                                --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!---                                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY: Created 02/23/2005                                                    --->
<!---                                                                                --->
<!---                                                                                --->      
<!-------------------------------------------------------------------------------------->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileString" default="">
	<cfset fileString = attributes.fileString>
	
	<cfparam name="attributes.fileString2" default="">
	<cfset fileString2 = attributes.fileString2>
	
	<cfparam name="attributes.fileString3" default="">
	<cfset fileString3 = attributes.fileString3>
	
	<cfparam name="attributes.TableName" default="">
	<cfset TableName = attributes.TableName>
			
	<cfparam name="attributes.stringTypes" default="nvarchar,varchar,nchar,char,text">
	<cfset stringTypes = attributes.stringTypes>
	
	<cfparam name="attributes.dateTypes" default="smalldatetime,datetime">
	<cfset dateTypes = attributes.dateTypes>
	
	<cfparam name="attributes.nTypes" default="ntext">
	<cfset nTypes = attributes.nTypes>
	
	<cfparam name="attributes.SQLReservedKeywords" default="File,Procedure,User">
	<cfset SQLReservedKeywords = attributes.SQLReservedKeywords>
		
	<cfparam name="attributes.tableColumnsList" default="">
	<cfset tableColumnsList = attributes.tableColumnsList>
	
	<cfparam name="attributes.stringTableColumnsList" default="">
	<cfset stringTableColumnsList = attributes.stringTableColumnsList>
	
	<cfparam name="attributes.nTableColumnsList" default="">
	<cfset nTableColumnsList = attributes.nTableColumnsList>
	
	<cfparam name="attributes.primaryKeyColumnName" default="">
	<cfset primaryKeyColumnName = attributes.primaryKeyColumnName>
	
	<cfparam name="attributes.optionalColumnsList" default="">
	<cfset optionalColumnsList = attributes.optionalColumnsList>
	
	<cfparam name="attributes.columnsToRetrieve" default="">
	<cfset columnsToRetrieve = attributes.columnsToRetrieve>
	
	<cfparam name="attributes.primaryKeyToUse" default="">
	<cfset primaryKeyToUse = attributes.primaryKeyToUse>
	
	<cfparam name="attributes.tableColumnsListWOKey" default="">
	<cfset tableColumnsListWOKey = attributes.tableColumnsListWOKey>	
	
	<cfparam name="attributes.tableColumnsListWOKeyDateCreated" default="">
	<cfset tableColumnsListWOKeyDateCreated = attributes.tableColumnsListWOKeyDateCreated>				
			
	<cfparam name="attributes.dateColumnList" default="">
	<cfset dateColumnList = attributes.dateColumnList>			
	
	<cfparam name="attributes.tableColumnsListWOKeyDataTypes" default="">
	<cfset tableColumnsListWOKeyDataTypes = attributes.tableColumnsListWOKeyDataTypes>
	
	<cfparam name="attributes.dataTypesList" default="">
	<cfset dataTypesList = attributes.dataTypesList>
	
	<cfparam name="attributes.debug" default="no">
	<cfset debug = attributes.debug>
	
	<cfparam name="attributes.toSave" default="">
	<cfset toSave = attributes.toSave>
	
	<cfparam name="attributes.fileInDirectory" default="no">
	<cfset fileInDirectory = attributes.fileInDirectory>
	
	<cfparam name="attributes.optionalColumnsList" default="">
	<cfset optionalColumnsList = attributes.optionalColumnsList>
	
	<cfparam name="attributes.IsNullableListWOKey" default="">
	<cfset IsNullableListWOKey = attributes.IsNullableListWOKey>
   	
	<cfparam name="attributes.IsNullableColumnListWOKey" default="">
	<cfset IsNullableColumnListWOKey = attributes.IsNullableColumnListWOKey>
	   	
	<cfparam name="attributes.HasDefaultValueListWOKey" default="">
	<cfset HasDefaultValueListWOKey = attributes.HasDefaultValueListWOKey>
	
	<cfparam name="attributes.ds" default="">
	<cfset ds = attributes.ds>
	
	<cfparam name="attributes.tempName" default="Bean">
	<cfset tempName = attributes.tempName>
	
	<cfparam name="attributes.componentPath" default="collectmed1.0\components">
	<cfset componentPath = attributes.componentPath>
	 
		
		
<!-------------------------------------------------------------------------------------->
<!--- Verify that the tablename was sent in.                                         --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="TableName,ds"
		fieldnames="Table Name,datasource">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Check to make sure that the table that is being passed                         --->
<!--- in exists otherwise thorow an error. But if it does exist                      --->
<!--- get the name and set it to the correct letter case.                            --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="tableExists" datasource="#ds#">
		SELECT name
		FROM dbo.sysobjects  
		WHERE (type = 'U') AND (name = '#TableName#')
	</cfquery>	
	
	<cfif tableExists.RecordCount NEQ 1>
		<cf_gcGeneralErrorTemplate
			message="The table name (#TableName#) you sent in does not exist.">
	</cfif>
	
	<cfset TableName = tableExists.name>			
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Query for the tablenames columns to place in the custom                        --->
<!--- update tag.                                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getTableColumns" datasource="#ds#">
		SELECT c.name ColumnName, t.name DataType, c.length ColumnLength, c.isnullable IsNullableField, c.cdefault HasDefaultValue, c.colstat IdentityField 
		FROM syscolumns c   INNER JOIN systypes t   ON c.xusertype = t.xusertype 
		WHERE id=object_id('#TableName#')
	</cfquery>
	
	<cfif debug>
		<cfdump var="#getTableColumns#">
	</cfif>
	
<!-------------------------------------------------------------------------------------->
<!--- If the primary was sent in then use that column to set                         --->
<!--- the primary key otherwise use the key that is found in                         --->
<!--- the database.                                                                  --->
<!-------------------------------------------------------------------------------------->
<cfif primaryKeyToUse NEQ "">
	
	<cfset primaryKeyColumnName = primaryKeyToUse>

<cfelse>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Find the Primary key in the table if any and take it out.                      --->
	<!-------------------------------------------------------------------------------------->
		<cfquery name="findTablePrimaryKey" datasource="#ds#">
			SELECT column_name
			FROM information_schema.key_column_usage   
			WHERE constraint_catalog = db_name() AND table_name = '#TableName#' AND LOWER(constraint_name) like 'pk%'   
		</cfquery>	
		
		<cfif findTablePrimaryKey.RecordCount EQ 1>
			<cfset primaryKeyColumnName = findTablePrimaryKey.column_name>
		</cfif>
	
</cfif>	




<!-------------------------------------------------------------------------------------->
<!--- Gather all the column names and what they will be                              --->
<!--- used for.                                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfloop query="getTableColumns">	
				
		<cfset tableColumnsList = ListAppend(tableColumnsList,ColumnName)>
		
		<cfset dataTypesList = ListAppend(dataTypesList, datatype)>
		
		<cfif trim(ColumnName) NEQ trim(primaryKeyColumnName)>
			<cfset tableColumnsListWOKey = ListAppend(tableColumnsListWOKey,ColumnName)>
			<cfif trim(ColumnName) NEQ "DateCreated">
				<cfset tableColumnsListWOKeyDateCreated = ListAppend(tableColumnsListWOKeyDateCreated,ColumnName)>
			</cfif>			
			<cfset tableColumnsListWOKeyDataTypes = ListAppend(tableColumnsListWOKeyDataTypes,datatype)>
			<cfset IsNullableListWOKey = ListAppend(IsNullableListWOKey, IsNullableField)>				
			<cfif IsNullableField>
				<cfset IsNullableColumnListWOKey = ListAppend(IsNullableColumnListWOKey, ColumnName)>	
			</cfif>			
			<cfset HasDefaultValueListWOKey = ListAppend(HasDefaultValueListWOKey, HasDefaultValue)>                
		</cfif>	
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the columns that are updatable and allow the user to                       --->
		<!--- see what those columns are that they can send in.                              --->
		<!-------------------------------------------------------------------------------------->							
		<cfif trim(primaryKeyColumnName) NEQ trim(ColumnName) AND IdentityField EQ 0>
			<cfset optionalColumnsList = ListAppend(optionalColumnsList,ColumnName)>
		</cfif>	
		
		<!-------------------------------------------------------------------------------------->
		<!--- Check to see if the current column is a string related                         --->
		<!--- column and add it to the stringTableColumnsList variable.                      --->
		<!-------------------------------------------------------------------------------------->
			<cfif ListFind(stringTypes,DataType)>
				<cfset stringTableColumnsList = ListAppend(stringTableColumnsList,ColumnName)>
			<cfelseif ListFind(nTypes,DataType)>
				<cfset nTableColumnsList = ListAppend(nTableColumnsList,ColumnName)>	
			</cfif>
			
		<!-------------------------------------------------------------------------------------->
		<!--- Find out if the current column is a date type to be able                       --->
		<!--- to add a specific format that will work with SQL and                           --->
		<!--- create a gc date Standard.                                                     --->
		<!-------------------------------------------------------------------------------------->			
			<cfif ListFindNoCase(dateTypes,DataType)>
				<cfset dateColumnList = ListAppend(dateColumnList,ColumnName)>				
			</cfif>			
			
	</cfloop>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Find out what kind of datatypes you are dealing with in                        --->
<!--- this tag.                                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cf_gcListRemoveDuplicates 
		list="#dataTypesList#"
		name="DataTypes">

	<cfif debug>
		<cfoutput>
			<p>
				DISTINCT Column data types for this table (#trim(tableName)#):<br>
				#DataTypes#
			</p>
			<p>
				These are the columns that are NULLABLE (does not containf the PK column)<br>
				[#trim(IsNullableListWOKey)#]
			</p>
		</cfoutput>
	</cfif>
	


<!-------------------------------------------------------------------------------------->
<!--- Set the datasource based on where we are reading from.                         --->
<!-------------------------------------------------------------------------------------->
	<cfif trim(ds) EQ "pa_master">
		<cfset thisDS = "pa_master">
	<cfelse>
		<cfset thisDS = "##trim(request.datasource)##">
	</cfif> 


	
	
<!-------------------------------------------------------------------------------------->
<!--- Find out if the tag already exists and take out of it                          --->
<!--- the functions that have been custom created.                                   --->
<!-------------------------------------------------------------------------------------->			
	<cfif FileExists("#trim(request.applicationPath)#\#trim(componentPath)#\#TableName##trim(tempName)#.cfc")>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Read the file into a variable.                                                 --->
		<!-------------------------------------------------------------------------------------->					
			<cffile 
				action="READ" 
				file="#trim(request.applicationPath)#\#trim(componentPath)#\#TableName##trim(tempName)#.cfc" 
				variable="FileContent">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the custom functions and place them in a variable.                         --->
		<!-------------------------------------------------------------------------------------->				
			<cfset toSave = request.midString(FileContent, '<!---Start_Custom_Functions--->', '<!---End_Custom_Functions--->')>
			
			<cfset toSave =  trim(toSave)>
			
			<cfset fileInDirectory = "yes">
				
	</cfif>
	


<!-------------------------------------------------------------------------------------->
<!--- Start the tag.                                                                 --->
<!-------------------------------------------------------------------------------------->
<cfset end = mid(primaryKeyColumnName, 2, len(primaryKeyColumnName)) />
<cfset firstLetter = UCase(Mid(primaryKeyColumnName,1, 1)) />
<cfset primaryKeyColumnNameFormatted = firstLetter & end />	


<cfset fileString = fileString & ' 	


<cfcomponent name="#LCASE(tablename)##trim(tempName)#" output="false" alias="#LCASE(tablename)##trim(tempName)#" extends="#tablename#DAO">
'>


<cfloop query="getTableColumns">	
	
	<cfswitch expression="#trim(datatype)#">	
		<cfcase value="char,varchar,nchar,nvarchar,ntext,binary,varbinary,image">
			<cfset columnDataType = "string">
		</cfcase>   
		<cfcase value="datetime,smalldatetime">
			<cfset columnDataType = "datetime">
		</cfcase>   
	    <cfcase value="bigint,Int,smallint,tinyint,bit,numeric,decimal,money,smallmoney,float,real">
			<cfset columnDataType = "numeric">
		</cfcase>	
	    <cfdefaultcase>
			<cfset columnDataType = "string">
	    </cfdefaultcase>
	</cfswitch>
	
	<cfif trim(ColumnName) EQ trim(primaryKeyColumnName)>
		<cfset thisDefault = "0">
	<cfelse>
		<cfset thisDefault = "">
	</cfif>
	
	
	<cfset fileString = fileString & '
	<cfproperty name="#ColumnName#" type="#trim(columnDataType)#" default="#thisDefault#" />'>		
</cfloop>




<cfset fileString = fileString & ' 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";'>
		
		
<cfloop query="getTableColumns">	
	
	<cfif trim(ColumnName) EQ trim(primaryKeyColumnName)>
		<cfset thisDefault = "0">
	<cfelse>
		<cfset thisDefault = """""">
	</cfif>
	
	
	<cfset fileString = fileString & '
		variables.#ColumnName# = #thisDefault#;'>		
</cfloop>

<cfset fileString = fileString & ' 	
	</cfscript>'>

	
<cfset fileString = fileString & ' 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="#LCASE(tablename)#Bean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "#trim(primaryKeyColumnName)#") AND stValues.#trim(primaryKeyColumnName)# NEQ 0>
				<cfquery name="qGet#trim(tableName)#" datasource="##trim(arguments.ds)##">
			  		SELECT #trim(tableColumnsList)#'>
			  		<cfif ListFindNoCase(SQLReservedKeywords, trim(tableName))>
						<cfset fileString = fileString & '
					FROM [#trim(tableName)#]  '>
					<cfelse>
						<cfset fileString = fileString & '
					FROM #trim(tableName)#  '>
					</cfif>
					<cfset fileString = fileString & '
					WHERE #trim(primaryKeyColumnName)# = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="##stValues.#trim(primaryKeyColumnName)###" /> 
				</cfquery>		
				<cfif qGet#trim(tableName)#.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>'>
				
				<cfloop query="getTableColumns">		
					<cfif NOT ListFindNoCase("#trim(primaryKeyColumnName)#,DateCreated", trim(ColumnName))>						
						<cfset fileString = fileString & '
					variables.#ColumnName# = qGet#trim(tableName)#.#ColumnName#;'>								
					</cfif>	
				</cfloop>
		
	<cfset fileString = fileString & '
				</cfscript>
			</cfif>'>
		
<cfloop query="getTableColumns">	
	<cfset fileString = fileString & '
			<cfif StructKeyExists(stValues, "#trim(ColumnName)#")><cfset variables.#trim(ColumnName)# = stValues.#trim(ColumnName)# /></cfif>'>		
</cfloop>		
			
			
			
<cfset fileString = fileString & '		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	'>	


<cfloop query="getTableColumns">	
	
	<cfswitch expression="#trim(datatype)#">	
		<cfcase value="char,varchar,nchar,nvarchar,ntext,binary,varbinary,image">
			<cfset columnDataType = "string">
		</cfcase>
		<cfcase value="datetime,smalldatetime">
			<cfset columnDataType = "datetime">
		</cfcase>   
	    <cfcase value="bigint,Int,smallint,tinyint,bit,numeric,decimal,money,smallmoney,float,real">
			<cfset columnDataType = "numeric">
		</cfcase>	
	    <cfdefaultcase>
			<cfset columnDataType = "string">
	    </cfdefaultcase>
	</cfswitch>
	
	<cf_gcBlockComment 
	text="GET and SET methods for #ColumnName#." 
	returnVarName="formattedColumnName">	
		
<cfset fileString = fileString & '
	<!-------------------------------------------------------------------------------------->
	#formattedColumnName#
	<!-------------------------------------------------------------------------------------->
	<cffunction name="get#trim(ColumnName)#" acess="public" output="false" returntype="any">
		<cfreturn variables.#trim(ColumnName)#>
	</cffunction>
	
	<cffunction name="set#trim(ColumnName)#" acess="public" output="false" returntype="boolean">
		
		<cfargument name="#trim(ColumnName)#" required="true" type="any" />
		'>
		
<cfif columnDataType EQ "datetime">
<cfset fileString = fileString & '	
		<cfif IsDate(trim(arguments.#trim(ColumnName)#)) OR trim(arguments.#trim(ColumnName)#) EQ "">
			<cfset variables.#trim(ColumnName)# = arguments.#trim(ColumnName)# />
		<cfelse>
			<cfthrow message="#trim(ColumnName)# (##arguments.#trim(ColumnName)###) is not a valid data type" />
		</cfif>'>
<cfelseif columnDataType EQ "numeric">
<cfset fileString = fileString & '	
		<cfif IsNumeric(trim(arguments.#trim(ColumnName)#)) OR trim(arguments.#trim(ColumnName)#) EQ "">
			<cfset variables.#trim(ColumnName)# = arguments.#trim(ColumnName)# />
		<cfelse>
			<cfthrow message="#trim(ColumnName)# (##arguments.#trim(ColumnName)###) is not a valid data type" />
		</cfif>'>
<cfelse>
<cfset fileString = fileString & '	
		<cfset variables.#trim(ColumnName)# = arguments.#trim(ColumnName)# />'>
		</cfif>
		
<cfset fileString = fileString & '					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "#trim(ColumnName)#") />		
		
		<cfreturn true>
		
	</cffunction>
	'>	
		
</cfloop>



<cfset fileString = fileString & '	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		#toSave#
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>

'>			


		
		
<!-------------------------------------------------------------------------------------->
<!--- Once everything is set for the fileString Save the new                         --->
<!--- Custom Tag in the Custom Tags directory.                                       --->
<!-------------------------------------------------------------------------------------->	
	<cftry>
		
		<cffile 
			action="write" 
			nameconflict="OVERWRITE" 
			file="#trim(request.applicationPath)#\#trim(componentPath)#\#TableName##trim(tempName)#.cfc"
			output="#fileString#">		
		
		<cfset caller.tempVar = tableColumnsListWOKey>
		
		<cfcatch type="any">		
			
			<cfoutput>				
				<font size=2 face="ms sans serif">
					An error was detected while creating the #TableName# bean CFC.
				</font>
				<p>				
				<hr>
				<p>The error that occurred was <font face="Arial Black" size="3" color="800000">(This is a caught error)</font>:
				<p><strong>#cfcatch.type#</strong><br>
				#cfcatch.message# #cfcatch.detail#<br>
				<hr>				
			</cfoutput>
			
		</cfcatch>
	
	</cftry>
	
	
	
	
	
	
	