<!-------------------------------------------------------------------------------------->
<!--- NAME: gcCreateDatabaseTableCFCFileActive.cfm                                   --->
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
	
	<cfparam name="attributes.tempName" default="Active">
	<cfset tempName = attributes.tempName>
	
	<cfparam name="attributes.componentPath" default="eobmanager1.0\components">
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
		SELECT c.name ColumnName, t.name DataType, c.length ColumnLength, c.isnullable IsNullableField, c.cdefault HasDefaultValue, c.colstat IdentityField, 
		case c.cdefault when 0 then ' ' else (select d.Text from syscomments d where c.cdefault = d.id) end DefaultVal 
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
			<cfif trim(HasDefaultValue) gt 0>
				<cfset HasDefaultValueListWOKey = ListAppend(HasDefaultValueListWOKey, ColumnName)>
			</cfif>			                
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
	
<!---
<!-------------------------------------------------------------------------------------->
<!--- Find out if the tag already exists and take out of it                          --->
<!--- the functions that have been custom created.                                   --->
<!-------------------------------------------------------------------------------------->			
	<cfif FileExists("#trim(request.applicationPath)#\#trim(componentPath)#\#TableName#Bean.cfc")>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Read the file into a variable.                                                 --->
		<!-------------------------------------------------------------------------------------->					
			<cffile 
				action="READ" 
				file="#trim(request.applicationPath)#\#trim(componentPath)#\#TableName#Bean.cfc" 
				variable="FileContent">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the custom functions and place them in a variable.                         --->
		<!-------------------------------------------------------------------------------------->				
			<cfset toSaveBean = request.midString(FileContent, '<!---Start_Custom_Functions--->', '<!---End_Custom_Functions--->')>
			
			<cfset toSave =  trim(toSave) & toSaveBean>
			
			<cfset fileInDirectory = "yes">
				
	</cfif>
<!-------------------------------------------------------------------------------------->
<!--- Find out if the tag already exists and take out of it                          --->
<!--- the functions that have been custom created.                                   --->
<!-------------------------------------------------------------------------------------->			
	<cfif FileExists("#trim(request.applicationPath)#\#trim(componentPath)#\#TableName#DAO.cfc")>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Read the file into a variable.                                                 --->
		<!-------------------------------------------------------------------------------------->					
			<cffile 
				action="READ" 
				file="#trim(request.applicationPath)#\#trim(componentPath)#\#TableName#DAO.cfc" 
				variable="FileContent">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the custom functions and place them in a variable.                         --->
		<!-------------------------------------------------------------------------------------->				
			<cfset toSaveDAO = request.midString(FileContent, '<!---Start_Custom_Functions--->', '<!---End_Custom_Functions--->')>
			
			<cfset toSave =  trim(toSave) & toSaveDAO>
			
			<cfset fileInDirectory = "yes">
				
	</cfif>	
--->


<!-------------------------------------------------------------------------------------->
<!--- Start the tag.                                                                 --->
<!-------------------------------------------------------------------------------------->
<cfset end = mid(primaryKeyColumnName, 2, len(primaryKeyColumnName)) />
<cfset firstLetter = UCase(Mid(primaryKeyColumnName,1, 1)) />
<cfset primaryKeyColumnNameFormatted = firstLetter & end />


<cfset fileString = fileString & ' 	


<cfcomponent name="#LCASE(tablename)##trim(tempName)#" output="false" alias="#LCASE(tablename)##trim(tempName)#">
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
		variables.ds = "";
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
	<cffunction name="init" output="false" returntype="#LCASE(tablename)#Active">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "#trim(primaryKeyColumnName)#") AND stValues.#trim(primaryKeyColumnName)# NEQ 0>
				<cfquery name="qGet#trim(tableName)#" datasource="##trim(variables.ds)##">
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

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.get#trim(primaryKeyColumnName)#() EQ 0>
			<cfset create(this)>
		<cfelse>
			<cfset update(this)>
		</cfif>	
				
		<cfreturn this.get#trim(primaryKeyColumnName)#()>	
				
	</cffunction>'>
	
	

	

<cfset fileString = fileString & '


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="get#trim(TableName)#" output="false" access="public" returntype="query">
				
		<cfargument name="#trim(primaryKeyColumnName)#" required="yes" type="numeric" />		
		<cfset var qGet#trim(TableName)# = "" />		
	
		<cfquery name="qGet#trim(tableName)#" datasource="##trim(variables.ds)##">
	  		SELECT #trim(tableColumnsList)#'>
	  		<cfif ListFindNoCase(SQLReservedKeywords, trim(tableName))>
				<cfset fileString = fileString & '
			FROM [#trim(tableName)#]  '>
			<cfelse>
				<cfset fileString = fileString & '
			FROM #trim(tableName)#  '>
			</cfif>
			<cfset fileString = fileString & '
			WHERE #trim(primaryKeyColumnName)# = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="##trim(arguments.#trim(primaryKeyColumnName)#)##" /> 
		</cfquery>
		
		<cfreturn qGet#trim(TableName)#>
		
	</cffunction>	
'>		
	
	
	
	
	
	
	
<!------>

<!-------------------------------------------------------------------------------------->
<!--- Start the Create function                                                      --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="#trim(TableName)#Active" />
		
		<cfset var qCreate#trim(tablename)# = "" />		
		'>
		
<cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">		
	<cfset fileString = fileString & '
		<cfset var local#trim(ColumnName)# = arguments.obj.get#trim(ColumnName)#() />'>		
</cfloop>		
	
<cfset insertColumns = "">		
<cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">		
	<cfif ColumnName NEQ "datemodified" AND ListFindNoCase(HasDefaultValueListWOKey, ColumnName) EQ 0>
		<cfset insertColumns = ListAppend(insertColumns, trim(ColumnName))>
	</cfif>		
</cfloop>	
		
<cfset fileString = fileString & '	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreate#trim(tablename)#" datasource="##trim(variables.ds)##">
				INSERT INTO #trim(tablename)# (#trim(insertColumns)#)
				VALUES ('>

<cfset comma = ",">				
<cfif ListLast(tableColumnsListWOKeyDateCreated) EQ "DateModified">
	<cfset last = ListGetAt(tableColumnsListWOKeyDateCreated, ListLen(tableColumnsListWOKeyDateCreated)-1)>		
<cfelse>	
	<cfset last = ListLast(tableColumnsListWOKeyDateCreated)>		
</cfif> 
		
<cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">	
	
	<cfif ColumnName NEQ "datemodified" AND ListFindNoCase(HasDefaultValueListWOKey, ColumnName) EQ 0>
	
	<cfset datatype = ListGetAt(dataTypesList, ListFindNoCase(tableColumnsList, ColumnName))>
	
	<cfswitch expression="#trim(datatype)#">	
		<cfcase value="char,varchar,nchar,nvarchar,ntext,binary,varbinary,image">
			<cfset columnDataType = "string">
			<cfset CF_SQL_TYPE = "CF_SQL_VARCHAR">
		</cfcase>
		<cfcase value="datetime,smalldatetime">
			<cfset columnDataType = "datetime">
			<cfset CF_SQL_TYPE = "CF_SQL_TIMESTAMP">
		</cfcase>   
	    <cfcase value="bigint,Int,smallint,tinyint,bit,numeric,decimal,money,smallmoney,float,real">
			<cfset columnDataType = "numeric">
			<cfset CF_SQL_TYPE = "CF_SQL_INTEGER">
		</cfcase>	
	    <cfdefaultcase>
			<cfset columnDataType = "string">
			<cfset CF_SQL_TYPE = "CF_SQL_VARCHAR">
	    </cfdefaultcase>
	</cfswitch>
	
	<cfif ColumnName EQ last>
		<cfset comma = "">
	</cfif>	
	
				<cfif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName)) AND columnDataType EQ "numeric">
	<cfset fileString = fileString & '				
					<cfif IsNumeric(trim(local#trim(ColumnName)#))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName)) AND columnDataType EQ "datetime">
	<cfset fileString = fileString & '	
					<cfif IsDate(trim(local#trim(ColumnName)#))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName))>
	<cfset fileString = fileString & '	
					<cfif trim(local#trim(ColumnName)#) NEQ "" AND trim(local#trim(ColumnName)#) NEQ "@@" AND trim(local#trim(ColumnName)#) NEQ "NULL">'>
				</cfif>
	<cfset fileString = fileString & '						
						<cfqueryparam value="##trim(local#trim(ColumnName)#)##" cfsqltype="#trim(CF_SQL_TYPE)#" />'>
	
				<cfif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName))>
	<cfset fileString = fileString & '							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="#trim(CF_SQL_TYPE)#" />
					</cfif>'>				
				</cfif>	
					
	<cfset fileString = fileString & '#comma#'>			
	

					
					
	</cfif>				
					
</cfloop>	
										
					
<cfset fileString = fileString & '	
				);
				SELECT LAST_INSERT_ID() AS #trim(primaryKeyColumnName)# 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreate#trim(tablename)#.#trim(primaryKeyColumnName)#);
			arguments.obj.set#trim(primaryKeyColumnName)#(qCreate#trim(tablename)#.#trim(primaryKeyColumnName)#);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
'>







<!-------------------------------------------------------------------------------------->
<!--- Start the read function                                                        --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="#trim(TableName)#Active">
				
		<cfargument name="#trim(primaryKeyColumnName)#" required="yes" type="numeric" />		
		<cfset var qGet#trim(tablename)# = "" />		
		
		<cfset qGet#trim(TableName)# = get#trim(TableName)#(trim(#trim(primaryKeyColumnName)#)) />
				
		<cfif qGet#trim(tableName)#.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>'>
			
		
<cfloop query="getTableColumns">		
	<cfset fileString = fileString & '
			this.set#trim(ColumnName)#(qGet#trim(tablename)#.#trim(ColumnName)#);'>		
</cfloop>

	

<cfset fileString = fileString & '				
			return this;
		</cfscript>
	 
	</cffunction>		
	
'>





<!-------------------------------------------------------------------------------------->
<!--- Start the update function                                                      --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="#trim(TableName)#Active" />
		<cfset var qUpdate#trim(tablename)# = "" />'>

<cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">		
	<cfset fileString = fileString & '
		<cfset var local#trim(ColumnName)# = arguments.obj.get#trim(ColumnName)#() />'>		
</cfloop>	

	<cfset fileString = fileString & '
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdate#trim(tablename)#" datasource="##trim(variables.ds)##">
				UPDATE #trim(tablename)#  SET'>
				
				

<cfset comma = ",">				
<cfset last = ListGetAt(tableColumnsListWOKeyDateCreated, ListLen(tableColumnsListWOKeyDateCreated))>				
<cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">	
	
	<cfset datatype = ListGetAt(dataTypesList, ListFindNoCase(tableColumnsList, ColumnName))>
	
	<cfswitch expression="#trim(datatype)#">	
		<cfcase value="char,varchar,nchar,nvarchar,ntext,binary,varbinary,image">
			<cfset columnDataType = "string">
			<cfset CF_SQL_TYPE = "CF_SQL_VARCHAR">
		</cfcase>
		<cfcase value="datetime,smalldatetime">
			<cfset columnDataType = "datetime">
			<cfset CF_SQL_TYPE = "CF_SQL_TIMESTAMP">
		</cfcase>   
	    <cfcase value="bigint,Int,smallint,tinyint,bit,numeric,decimal,money,smallmoney,float,real">
			<cfset columnDataType = "numeric">
			<cfset CF_SQL_TYPE = "CF_SQL_INTEGER">
		</cfcase>	
	    <cfdefaultcase>
			<cfset columnDataType = "string">
			<cfset CF_SQL_TYPE = "CF_SQL_VARCHAR">
	    </cfdefaultcase>
	</cfswitch>
	
	<cfif ColumnName EQ last>
		<cfset comma = "">
	</cfif>	



	
	<cfset fileString = fileString & '
					
					#trim(ColumnName)# ='>					
				<cfif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName)) AND columnDataType EQ "numeric">
	<cfset fileString = fileString & '				
					<cfif IsNumeric(trim(local#trim(ColumnName)#))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName)) AND columnDataType EQ "datetime">
	<cfset fileString = fileString & '	
					<cfif IsDate(trim(local#trim(ColumnName)#))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName))>
	<cfset fileString = fileString & '	
					<cfif trim(local#trim(ColumnName)#) NEQ "" AND trim(local#trim(ColumnName)#) NEQ "@@" AND trim(local#trim(ColumnName)#) NEQ "NULL">'>
				</cfif>						
				
	<cfset fileString = fileString & '						
						<cfqueryparam value="##trim(local#trim(ColumnName)#)##" cfsqltype="#trim(CF_SQL_TYPE)#" />'>
				
				
				<cfif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName))>
	<cfset fileString = fileString & '	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="#trim(CF_SQL_TYPE)#" />
					</cfif>'>
				</cfif>	
	<cfset fileString = fileString & '#comma#'>			



</cfloop>										
			
			
<cfset fileString = fileString & '					
				WHERE #trim(primaryKeyColumnName)# = <cfqueryparam value="##trim(arguments.obj.get#primaryKeyColumnName#())##" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: ##cfcatch.type##] [message: ##cfcatch.message##] [detail: ##cfcatch.detail##">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


'>







<!-------------------------------------------------------------------------------------->
<!--- Start the delete function                                                      --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="#trim(TableName)#Active" />
		<cfset var qDelete#trim(TableName)# = "">

		<cfquery name="qDelete#trim(TableName)#" datasource="##trim(variables.ds)##" result="status">
			DELETE
			FROM #trim(TableName)#
			WHERE #trim(primaryKeyColumnName)# = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="##trim(obj.get#trim(primaryKeyColumnName)#())##" /> 
		</cfquery>

	</cffunction>

'>

<!------>




	


	
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
					An error was detected while creating the #TableName# Active CFC.
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
	
	
	
	
	
	
	