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
	
	<cfparam name="attributes.tempName" default="DAO">
	<cfset tempName = attributes.tempName>
	
	<cfparam name="attributes.componentPath" default="eobmanager1.0\com\persistence\daos">
	<cfset componentPath = attributes.componentPath>
	 
	 
	 
<!-------------------------------------------------------------------------------------->
<!--- Function to use.                                                               --->
<!-------------------------------------------------------------------------------------->
<cfscript>
	function capitalizeFirstLetter(word) {			
		return UCase(Mid(word,1, 1)) & mid(word, 2, len(word));			
	}	
</cfscript>
			
		
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
			<cfif trim(ColumnName) NEQ "DateCreated" AND trim(ColumnName) NEQ "DateModified">
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

<cfcomponent output="false">

'>



<!-------------------------------------------------------------------------------------->
<!--- Query to create the new query.                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getDefaults" datasource="#ds#">
		SELECT COLUMN_NAME, IS_NULLABLE, COLUMN_DEFAULT, DATA_TYPE
		FROM INFORMATION_SCHEMA.Columns  
		WHERE (TABLE_NAME = N'#tablename#')
	</cfquery>		
	
<!---<cfset fileString = fileString & '
	<!-------------------------------------------------------------------------------------->
	<!--- Create a query that will hold the defualt values of the                        --->
	<!--- columns in the table.                                                          --->
	<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE") />
	<cfset temp = QueryAddRow(defaultsQuery, #trim(getDefaults.RecordCount)#) />
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Set the cells in the query.                                                    --->
	<!-------------------------------------------------------------------------------------->'>--->


<!-------------------------------------------------------------------------------------->
<!--- The defaults that MS SQL Return are not in proper format                       --->
<!--- so we have to message them by taking the extreneous                            --->
<!--- characters out.                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfset count  = 0>
	
	<cfloop query="getDefaults">	
	
		<cfset count = count + 1>
		
		<cfif FindNoCase("())", COLUMN_DEFAULT)>
			<cfset thisCOLUMN_DEFAULT = MID(COLUMN_DEFAULT, 2, LEN(COLUMN_DEFAULT) - 2) />
		<cfelseif FindNoCase("('", COLUMN_DEFAULT) AND FindNoCase("')", COLUMN_DEFAULT)>
			<cfset thisCOLUMN_DEFAULT = MID(COLUMN_DEFAULT, 3, LEN(COLUMN_DEFAULT) - 4) />
		<cfelseif MID(COLUMN_DEFAULT, 1, 1) EQ "(" AND MID(COLUMN_DEFAULT, LEN(COLUMN_DEFAULT), 1) EQ ")" AND FindNoCase("(", COLUMN_DEFAULT)>
			<cfset thisCOLUMN_DEFAULT = MID(COLUMN_DEFAULT, 2, LEN(COLUMN_DEFAULT) - 2) />											
		<cfelse>
			<cfset thisCOLUMN_DEFAULT = COLUMN_DEFAULT />			
		</cfif>	
	
	</cfloop>



<!-------------------------------------------------------------------------------------->
<!--- Start the Create function                                                      --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '''' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the #trim(TableName)# DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
			<cfscript>
				variables.instance.configBean = arguments.configBean;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a #trim(TableName)#, either by creating a new entry or updating an existing one.">
		<cfargument name="#trim(TableName)#" required="true" type="com.model.#trim(TableName)#" hint="I am the #trim(TableName)# bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.#trim(TableName)#)>
			<cfset success = update(arguments.#trim(TableName)#) />
		<cfelse>
			<cfset success = create(arguments.#trim(TableName)#) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific #trim(TableName)# exists within the database, using the ID as a check.">
		<cfargument name="#trim(TableName)#" required="true" type="com.model.#trim(TableName)#" hint="I am the #trim(TableName)# bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="##variables.instance.configBean.getDSN().client##" maxrows="1">
			SELECT count(1) as idexists
			FROM #trim(TableName)#
			WHERE #trim(primaryKeyColumnName)# = <cfqueryparam value="##arguments.#trim(TableName)#.get#capitalizeFirstLetter(trim(primaryKeyColumnName))#()##" CFSQLType="cf_sql_integer" />
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
				
		<cfargument name="#trim(TableName)#" required="true" type="com.model.#trim(TableName)#" />
		
		<cfset var qCreate#trim(tablename)# = "" />		
		'>
		
<!--- <cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">		
	<cfset fileString = fileString & '
		<cfset var local#trim(ColumnName)# = arguments.#trim(TableName)#.get#trim(ColumnName)#() />'>		
</cfloop> --->		
	
<cfset insertColumns = "">		
<cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">		
	<cfif ColumnName NEQ "datemodified">
		<cfset insertColumns = ListAppend(insertColumns, trim(ColumnName))>
	</cfif>		
</cfloop>	
		
<cfset fileString = fileString & '							
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreate#trim(tablename)#" datasource="##variables.instance.configBean.getDSN().client##">
				INSERT INTO #trim(tablename)# (#trim(insertColumns)#)
				VALUES ('>

<cfset comma = ",">				
<cfif ListLast(tableColumnsListWOKeyDateCreated) EQ "DateModified">
<cfset last = ListGetAt(tableColumnsListWOKeyDateCreated, ListLen(tableColumnsListWOKeyDateCreated)-1)>				
<cfelse>	
	<cfset last = ListLast(tableColumnsListWOKeyDateCreated)>		
</cfif> 
		
<cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">	
	
	<cfif ColumnName NEQ "datemodified">
	
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
					<cfif IsNumeric(trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName)) AND columnDataType EQ "datetime">
	<cfset fileString = fileString & '	
					<cfif IsDate(trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName))>
	<cfset fileString = fileString & '	
					<cfif trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()) NEQ "" AND trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()) NEQ "@@" AND trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()) NEQ "NULL">'>
				</cfif>
	<cfset fileString = fileString & '						
						<cfqueryparam value="##trim(arguments.#trim(TableName)#.get#trim(ColumnName)#())##" cfsqltype="#trim(CF_SQL_TYPE)#" />'>
	
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
			arguments.#trim(TableName)#.set#trim(primaryKeyColumnName)#(qCreate#trim(tablename)#.#trim(primaryKeyColumnName)#);
		</cfscript>
		
		<cfreturn arguments.#trim(TableName)# />
		
	</cffunction>		
'>







<!-------------------------------------------------------------------------------------->
<!--- Start the read function                                                        --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="#trim(TableName)#" type="com.model.#trim(TableName)#" required="true" />
				
		<cfset var qGet#trim(tablename)# = "" />
				
		<cfset qGet#trim(TableName)# = get#trim(TableName)#ByID(trim(arguments.#trim(TableName)#.get#capitalizeFirstLetter(trim(primaryKeyColumnName))#())) />
				
		<cfif qGet#trim(tableName)#.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGet#trim(TableName)#.recordCount>
				<cfset variables.qRow = QueryToStruct(qGet#trim(TableName)#, 1)>
				<cfset arguments.#trim(TableName)#.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
'>





<!-------------------------------------------------------------------------------------->
<!--- Start the update function        -private use save                             --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="#trim(TableName)#" required="true" type="com.model.#trim(TableName)#" />
		<cfset var qUpdate#trim(tablename)# = "" />
		<cfset var boolSuccess = true />'>

<!--- <cfloop list="#trim(tableColumnsListWOKeyDateCreated)#" index="ColumnName">		
	<cfset fileString = fileString & '
		<cfset var local#trim(ColumnName)# = arguments.#trim(TableName)#.get#trim(ColumnName)#() />'>		
</cfloop> --->	

	<cfset fileString = fileString & '
			
		<cftry>
		
			<cfquery name="qUpdate#trim(tablename)#" datasource="##variables.instance.configBean.getDSN().client##">
				UPDATE #trim(tablename)#  SET'>
				
				

<cfset comma = ",">				
<cfset last = ListGetAt(tableColumnsListWOKeyDateCreated, ListLen(tableColumnsListWOKeyDateCreated))>				

	<cfset fileString = fileString & '
					DateModified =	<cfqueryparam value="##trim(CreateODBCDateTIME(NOW()))##" cfsqltype="CF_SQL_TIMESTAMP" />,'>

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
					<cfif IsNumeric(trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName)) AND columnDataType EQ "datetime">
	<cfset fileString = fileString & '	
					<cfif IsDate(trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()))>'>
				<cfelseif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName))>
	<cfset fileString = fileString & '	
					<cfif trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()) NEQ "" AND trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()) NEQ "@@" AND trim(arguments.#trim(TableName)#.get#trim(ColumnName)#()) NEQ "NULL">'>
				</cfif>						
				
	<cfset fileString = fileString & '						
						<cfqueryparam value="##trim(arguments.#trim(TableName)#.get#trim(ColumnName)#())##" cfsqltype="#trim(CF_SQL_TYPE)#" />'>
				
				
				<cfif ListFindNoCase(IsNullableColumnListWOKey, trim(ColumnName))>
	<cfset fileString = fileString & '	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="#trim(CF_SQL_TYPE)#" />
					</cfif>'>
				</cfif>	
	<cfset fileString = fileString & '#comma#'>			


</cfloop>										
			
			
<cfset fileString = fileString & '					
				WHERE #trim(primaryKeyColumnName)# = <cfqueryparam value="##trim(arguments.#trim(TableName)#.get#primaryKeyColumnName#())##" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>


'>




<!-------------------------------------------------------------------------------------->
<!--- Start the delete function                                                      --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '
	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="#trim(primaryKeyColumnName)#" required="true" type="String" />
		
		<cfset var qDelete#trim(TableName)# = "">

		<cfquery name="qDelete#trim(TableName)#" datasource="##variables.instance.configBean.getDSN().client##" result="status">
			DELETE
			FROM #trim(TableName)#
			WHERE #trim(primaryKeyColumnName)# = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="##trim(arguments.#trim(primaryKeyColumnName)#)##" /> 
		</cfquery>

	</cffunction>
'>





<cfset fileString = fileString & '


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="get#trim(TableName)#ByID" output="false" access="public" returntype="query">
		
		<cfargument name="#trim(primaryKeyColumnName)#" required="yes" type="numeric" />		
		
		<cfset var qGet#trim(TableName)# = "" />		
	
		<cfquery name="qGet#trim(tableName)#" datasource="##variables.instance.configBean.getDSN().client##">
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







<cfset fileString = fileString & '	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PUBLIC METHODS                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAll#trim(TableName)#s" access="public" output="false" hint="I run a query of all #trim(TableName)#s within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="##structNew()##" hint="I am a structure used to filter the query." />							
		<cfreturn filterAll#trim(TableName)#s(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PRIVATE METHODS                                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAll#trim(TableName)#s" returntype="any" access="public" output="false" hint="I run a query and will return all #trim(TableName)# records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="##structNew()##" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="##variables.instance.configBean.getDSN().client##">
				SELECT #trim(tableColumnsList)#
				FROM '><cfif ListFindNoCase(SQLReservedKeywords, trim(tableName))><cfset fileString = fileString & '[#trim(TableName)#]'><cfelse><cfset fileString = fileString & '#trim(TableName)#'></cfif><cfset fileString = fileString & '
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>'>
				


<cfset comma = ",">				
<cfif ListLast(tableColumnsListWOKeyDateCreated) EQ "DateModified">
<cfset last = ListGetAt(tableColumnsListWOKeyDateCreated, ListLen(tableColumnsListWOKeyDateCreated)-1)>				
<cfelse>	
	<cfset last = ListLast(tableColumnsListWOKeyDateCreated)>		
</cfif> 
		
<cfloop list="#trim(tableColumnsList)#" index="ColumnName">	
	
	<cfif ColumnName NEQ "datemodified">
	
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
	
	
	<cfif ColumnName NEQ primaryKeyColumnName>
				
	<cfset fileString = fileString & '				
					<cfif structKeyExists(arguments.filter, "#trim(ColumnName)#")>				
						AND #trim(ColumnName)# = <cfqueryparam value="##arguments.filter.#trim(ColumnName)###" cfsqltype="#trim(CF_SQL_TYPE)#" />
					</cfif>'>
	<cfelse>
	
	<cfset fileString = fileString & '				
					<cfif structKeyExists(arguments.filter, "#trim(ColumnName)#")>				
						AND #trim(ColumnName)# IN(##arguments.filter.#trim(ColumnName)###)
					</cfif>'>		
	</cfif>
							
					
	</cfif>
					
</cfloop>

<cfset fileString = fileString & '
					<cfif structKeyExists(arguments.filter, "orderBy")>
						ORDER BY ##arguments.filter.orderBy##		
					</cfif>
				</cfif>		
			</cfquery>
				
		<cfreturn qSearch />
		
	</cffunction>
		
		
'>



		

<cfset fileString = fileString & '	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
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
			output="#fileString#" />		
		
		<cfset caller.tempVar = tableColumnsListWOKey />
		
		<cfcatch type="any">		
			
			<cfoutput>				
				<font size=2 face="ms sans serif">
					An error was detected while creating the #TableName# DAO CFC.
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
	
	
	
	
	
	