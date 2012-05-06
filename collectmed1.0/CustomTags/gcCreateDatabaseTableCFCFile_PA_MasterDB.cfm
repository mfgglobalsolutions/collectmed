<!-------------------------------------------------------------------------------------->
<!--- NAME: gcCreateDatabaseTableCFCFile.cfm                                         --->
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
   	
	<cfparam name="attributes.HasDefaultValueListWOKey" default="">
	<cfset HasDefaultValueListWOKey = attributes.HasDefaultValueListWOKey>
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Verify that the tablename was sent in.                                         --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="TableName"
		fieldnames="Table Name">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Check to make sure that the table that is being passed                         --->
<!--- in exists otherwise thorow an error. But if it does exist                      --->
<!--- get the name and set it to the correct letter case.                            --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="tableExists" datasource="PA_Master">
		SELECT name
		FROM sysobjects
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
	<cfquery name="getTableColumns" datasource="PA_Master">
		SELECT c.name ColumnName, t.name DataType, c.length ColumnLength, c.isnullable IsNullableField, c.cdefault HasDefaultValue, c.colstat IdentityField 
		FROM syscolumns c 
		INNER JOIN systypes t ON c.xusertype = t.xusertype 
		WHERE id=object_id('#TableName#')
	</cfquery>
	
	
	
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
		<cfquery name="findTablePrimaryKey" datasource="PA_Master">
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
			<cfset tableColumnsListWOKeyDataTypes = ListAppend(tableColumnsListWOKeyDataTypes,datatype)>
			<cfset IsNullableListWOKey = ListAppend(IsNullableListWOKey, IsNullableField)>				
			<cfset HasDefaultValueListWOKey = ListAppend(HasDefaultValueListWOKey, HasDefaultValue)>                
		</cfif>	
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the columns that are updatable and allow the user to                       --->
		<!--- see what those columns are that they can send in.                              --->
		<!-------------------------------------------------------------------------------------->							
			<cfif primaryKeyColumnName NEQ ColumnName AND IdentityField EQ 0>
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
			DISTINCT Column data types for this table (#trim(tableName)#):<br>
			#DataTypes#<p>
		</cfoutput>
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Find out if the tag already exists and take out of it                          --->
<!--- the functions that have been custom created.                                   --->
<!-------------------------------------------------------------------------------------->			
	<cfif FileExists("#trim(request.applicationPath)#\eobmanager1.0\CustomTags\com\common\db\#TableName#IO.cfc")>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Read the file into a variable.                                                 --->
		<!-------------------------------------------------------------------------------------->					
			<cffile 
				action="READ" 
				file="#trim(request.applicationPath)#\eobmanager1.0\CustomTags\com\common\db\#TableName#IO.cfc" 
				variable="FileContent">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the custom functions and place them in a variable.                         --->
		<!-------------------------------------------------------------------------------------->				
			<cfset toSave = request.midString(FileContent, '<!---Start_Custom_Functions--->', '<!---End_Custom_Functions--->')>
			
			<cfset toSave =  trim(toSave)>
			
			<cfset fileInDirectory = "yes">
				
	</cfif>
	


<!-------------------------------------------------------------------------------------->
<!--- Set the tag header with the name of the tag.                                   --->
<!-------------------------------------------------------------------------------------->
<cfset fileString = fileString & '<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->'>

<cf_gcBlockComment 
	text="#TableName#IO.cfc" 
	returnVarName="formattedTagName">	

<cfset fileString = fileString & '
#formattedTagName#
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->'>

<cf_gcBlockComment 
	text="This tag is a CFC tag tied to the #TableName# table in the dB." 
	returnVarName="formattedTagDescription">	
	
<cfset fileString = fileString & '
#formattedTagDescription#  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->'>

<cf_gcBlockComment 
	text="&lt;cf_db_Get_#TableName#Table" 
	returnVarName="formattedExampleCall">	
	
<cfset fileString = fileString & '
#formattedExampleCall#  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->'>

	
	<cf_gcBlockComment 
		text="[None]" 
		returnVarName="formattedRequiredParameter">	
<cfset fileString = fileString & '
#formattedRequiredParameter#'>  


<cfset fileString = fileString & '  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!--- Queryname<br>                                                                  --->
<!--- fields<br>                                                                     --->
<!--- orderby<br>                                                                    --->
<!--- groupby (same as fields contents maybe different order)<br>                    --->
<!--- andclause example.... (CN1= Column Name)                                       --->
<!--- [ andclause="RTRIM(CN1)+''''+RTRIM(CN2)=''##Var##''" ]<br>                           --->'>

<cfloop list="#tableColumnsList#" index="i">
	<cf_gcBlockComment 
	text="#i#<br>" 
	returnVarName="formattedOptionalParameter">	
	
<cfset fileString = fileString & '
#formattedOptionalParameter#'>  
</cfloop>
                     
<cfset fileString = fileString & '  
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- recordID                                                                       --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    --->'>

<cf_gcBlockComment 
	text="Created #dateFormat(NOW(), "mm/dd/yyyy")#" 
	returnVarName="formattedHistory">	

<cfset fileString = fileString & ' 	
#formattedHistory#
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="#tablename#IO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";'>	
<cfloop query="getTableColumns">

<!-------------------------------------------------------------------------------------->
<!--- Find out what the return type will be based on the                             --->
<!--- datatype of this column.                                                       --->
<!-------------------------------------------------------------------------------------->
<cfswitch expression="#trim(datatype)#">	
	<cfcase value="char,varchar,nchar,nvarchar,ntext,datetime,smalldatetime,binary,varbinary,image">
		<cfset returnDataType = """""">
	</cfcase>   
    <cfcase value="bigint,Int,smallint,tinyint,bit,numeric,decimal,money,smallmoney,float,real">
		<cfset returnDataType = """NULL""">
	</cfcase>	
    <cfdefaultcase>
		<cfset returnDataType = """""">
    </cfdefaultcase>
</cfswitch>

	
	<cfset fileString = fileString & '
			variables.instance.#ColumnName# = #returnDataType#;'>		
</cfloop>

<cfset fileString = fileString & '		
		</cfscript>
		
	</cffunction>	
	
	'>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Query to create the new query.                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getDefaults" datasource="PA_Master">
		SELECT COLUMN_NAME, IS_NULLABLE, COLUMN_DEFAULT, DATA_TYPE
		FROM INFORMATION_SCHEMA.Columns
		WHERE (TABLE_NAME = N'#tablename#')
	</cfquery>		
	
<cfset fileString = fileString & '
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the default values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, #trim(getDefaults.RecordCount)#)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->'>


<!-------------------------------------------------------------------------------------->
<!--- The defaults that MS SQL Return are not in proper format                       --->
<!--- so we have to message them by taking the extreneous                            --->
<!--- characters out.                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfset count  = 0>
	
	<cfloop query="getDefaults">	
	
		<cfset count = count + 1>
		
		<cfif FindNoCase("())", COLUMN_DEFAULT)>
			<cfset thisCOLUMN_DEFAULT = MID(COLUMN_DEFAULT, 2, LEN(COLUMN_DEFAULT) - 2)>
		<cfelseif FindNoCase("('", COLUMN_DEFAULT) AND FindNoCase("')", COLUMN_DEFAULT)>
			<cfset thisCOLUMN_DEFAULT = MID(COLUMN_DEFAULT, 3, LEN(COLUMN_DEFAULT) - 4)>
		<cfelseif MID(COLUMN_DEFAULT, 1, 1) EQ "(" AND MID(COLUMN_DEFAULT, LEN(COLUMN_DEFAULT), 1) EQ ")" AND FindNoCase("(", COLUMN_DEFAULT)>
			<cfset thisCOLUMN_DEFAULT = MID(COLUMN_DEFAULT, 2, LEN(COLUMN_DEFAULT) - 2)>											
		<cfelse>
			<cfset thisCOLUMN_DEFAULT = COLUMN_DEFAULT>			
		</cfif>	
		
	<cfset fileString = fileString & '
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "#UCASE(trim(COLUMN_NAME))#", #trim(count)#)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "#trim(IS_NULLABLE)#", #trim(count)#)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "#trim(thisCOLUMN_DEFAULT)#", #trim(count)#)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "#trim(DATA_TYPE)#", #trim(count)#)>
	'>
	
	</cfloop>

	
<cfloop query="getTableColumns">	
<cfset fileString = fileString & '

	<!-------------------------------------------------------------------------------------->'>


<cfset end = mid(ColumnName, 2, len(ColumnName))>
<cfset firstLetter = UCase(Mid(ColumnName,1, 1))>
<cfset ColumnNameFormatted = firstLetter & end>	

<!-------------------------------------------------------------------------------------->
<!--- Create the method header.                                                      --->
<!-------------------------------------------------------------------------------------->
<cf_gcBlockComment 
	text="GET and SET method for #ColumnName#." 
	returnVarName="formattedColumnName">		
	

<!-------------------------------------------------------------------------------------->
<!--- Find out what the return type will be based on the                             --->
<!--- datatype of this column.                                                       --->
<!-------------------------------------------------------------------------------------->
<cfswitch expression="#trim(datatype)#">
	<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar,ntextdatetime,smalldatetime,datetime">
		<cfset returnDataType = "string">
	</cfcase> 				
	<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
		<cfset returnDataType = "numeric">
	</cfcase>	
    <cfdefaultcase>
		<cfset returnDataType = "string">
    </cfdefaultcase>
</cfswitch>		
	
	
<cfif debug>
	<cfoutput>
		[#datatype#]#ColumnName#: #returnDataType#<br>
	</cfoutput>
</cfif>

	
<cfset fileString = fileString & ' 	
	#formattedColumnName#
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="get#ColumnNameFormatted#" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.#ColumnNameFormatted#>
	</cffunction>
	'>
	
	

<cfset fileString = fileString & ' 
	<cffunction name="set#trim(ColumnNameFormatted)#" access="public" returntype="boolean" output="No">
 		
		<cfargument name="#trim(ColumnNameFormatted)#" required="Yes" type="String">'>
		
		
		<cfswitch expression="#trim(datatype)#">
			<cfcase value="text,ntext">
				<cfset VFDataType = "LongValues">
			</cfcase>
			<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar,ntextdatetime">
				<cfset VFDataType = "string">
			</cfcase>
			<cfcase value="smalldatetime,datetime">
				<cfset VFDataType = "date">
			</cfcase> 				
			<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
				<cfset VFDataType = "numeric">
			</cfcase>	
		    <cfdefaultcase>
				<cfset VFDataType = "string">
		    </cfdefaultcase>
		</cfswitch>
	
		<cfif VFDataType EQ "date">
		
		<cfset fileString = fileString & '
		
		<cfif #trim(ColumnNameFormatted)# NEQ "NULL" AND #trim(ColumnNameFormatted)# NEQ "NOW">'>
		
		<cfelse>
		
		<cfset fileString = fileString & '
		
		<cfif #trim(ColumnNameFormatted)# NEQ "NULL">'>
		
		</cfif>
		
		<cfset fileString = fileString & '	
			
			<cfif arguments.#ColumnName# EQ "@@">
				
				<cfset arguments.#ColumnName# = "NULL">
						
			<cfelseif NOT REQUEST.is#trim(DataType)#DataType(#trim(ColumnNameFormatted)#)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>#trim(ColumnNameFormatted)#</strong> (###trim(ColumnNameFormatted)###) is not of type <strong>#trim(DataType)#</strong>.">'>		
		
		<cfif VFDataType EQ "string">		
			<cfset fileString = fileString & '	
			<cfelseif len(#ColumnName#) GT #ColumnLength#>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>#trim(ColumnNameFormatted)#</strong> cannot be greater than #ColumnLength# character(s).">'>			
		</cfif>	
			
		<cfset fileString = fileString & '
			</cfif>
						
		</cfif>	
		'>
	
			
	<cfset fileString = fileString & '	
 		<cfset variables.instance.#ColumnNameFormatted# = arguments.#ColumnNameFormatted#>'>
	<cfif primaryKeyColumnName NEQ ColumnName>
	<cfset fileString = fileString & '					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "#trim(ColumnNameFormatted)#")>'>
	</cfif>
	<cfset fileString = fileString & '			
		<cfreturn true>
		
	</cffunction>
	
	'>
<cfset VFDataType = "">				
</cfloop>







<cfset fileString = fileString & '

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">
'>

<cfloop list="#trim(tableColumnsListWOKey)#" index="i">							
<cfset fileString = fileString & '
		<cfargument name="#trim(i)#" required="No" type="String" default="">'>	
</cfloop>

<cfset fileString = fileString & '
'>
		
<cfloop list="#trim(tableColumnsListWOKey)#" index="i">							
<cfset fileString = fileString & '
		<cfset variables.instance.#trim(i)# = arguments.#trim(i)#>'>	
</cfloop>

<cfset fileString = fileString & '

	</cffunction>
	
'>






<cfset end = mid(primaryKeyColumnName, 2, len(primaryKeyColumnName))>
<cfset firstLetter = UCase(Mid(primaryKeyColumnName,1, 1))>
<cfset primaryKeyColumnNameFormatted = firstLetter & end>	


<cfset fileString = fileString & '	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="#trim(tableName)#IO" output="No">
		
		<cfargument name="#trim(primaryKeyColumnName)#" required="yes" type="numeric">		
		<cfset var qGet#trim(tablename)# = "">
		
		<cfset preInit(#trim(primaryKeyColumnName)#)>
	
		<cfquery name="qGet#trim(tableName)#" datasource="PA_Master">
	  		SELECT #trim(tableColumnsList)#'>
	  		<cfif ListFindNoCase(SQLReservedKeywords, trim(tableName))>
				<cfset fileString = fileString & '
			FROM [#trim(tableName)#]'>
			<cfelse>
				<cfset fileString = fileString & '
			FROM #trim(tableName)#'>
			</cfif>
			<cfset fileString = fileString & '
			WHERE #trim(primaryKeyColumnName)# = ##trim(arguments.#trim(primaryKeyColumnName)#)## 
		</cfquery>
		
		<cfif qGet#trim(tableName)#.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>'>


<cfloop query="getTableColumns">

<!-------------------------------------------------------------------------------------->
<!--- Find out what the return type will be based on the                             --->
<!--- datatype of this column.                                                       --->
<!-------------------------------------------------------------------------------------->
<cfswitch expression="#trim(datatype)#">
	<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar,ntextdatetime,smalldatetime,datetime">
		<cfset returnDataType = "StringType">
	</cfcase> 				
	<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
		<cfset returnDataType = "NULLABLE">
	</cfcase>	
    <cfdefaultcase>
		<cfset returnDataType = "StringType">
    </cfdefaultcase>
</cfswitch>			
	
	
	<cfif returnDataType EQ "NULLABLE">
		<cfset fileString = fileString & '
			IF(qGet#trim(tableName)#.#ColumnName# EQ "" OR qGet#trim(tableName)#.#ColumnName# EQ "NULL") 
				variables.instance.#ColumnName# = "NULL"; 
			ELSE 
				variables.instance.#ColumnName# = qGet#trim(tableName)#.#ColumnName#;
				'>
	<cfelse>
		<cfset fileString = fileString & '			
				variables.instance.#ColumnName# = qGet#trim(tableName)#.#ColumnName#;
				'>
	</cfif>
		
	
</cfloop>

<cfset fileString = fileString & '
		</cfscript>		
	'>

	 
<cfset fileString = fileString & '	  
		<cfset postInit(#trim(primaryKeyColumnName)#)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommit#trim(tablename)# = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.#trim(primaryKeyColumnName)#) AND variables.instance.#trim(primaryKeyColumnName)#  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommit#trim(tablename)#" datasource="PA_Master">
		   			##PreserveSingleQuotes(sqlStatement)##
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="##trim(sqlStatement)##">
			
			<cfelse>
			
				<cfquery name="qInsertCommit#trim(tablename)#" datasource="PA_Master">
		   			##PreserveSingleQuotes(sqlStatement)##
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.#trim(primaryKeyColumnName)# = qInsertCommit#trim(tablename)#.#trim(primaryKeyColumnName)#>
				
				<cfreturn qInsertCommit#trim(tablename)#.#trim(primaryKeyColumnName)#>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "#trim(tableColumnsList)#">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "#trim(stringTableColumnsList)#">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "#trim(nTableColumnsList)#">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "#trim(dateColumnList)#">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="##variables.instance.changedVariables##" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("##currentVar## =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.##currentVar##">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = ''##UCASE(trim(currentVar))##''
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (##evaluate(currentVar)##) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", ##currentVar## = ##CreateODBCDateTime(currentDate)##">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", ##currentVar## = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", ##currentVar## = ''##Replace(evaluate(currentRecord), "''", "''''", "ALL")##''">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", ##currentVar## = ##getColumnDefault.COLUMN_DEFAULT##">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", ##currentVar## = ##evaluate(currentRecord)##">						
						</cfif>				  
					
					</cfif>
			
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE '><cfif ListFindNoCase(SQLReservedKeywords, trim(tableName))><cfset fileString = fileString & '[#trim(tableName)#]'><cfelse><cfset fileString = fileString & '[#trim(tableName)#]'></cfif><cfset fileString = fileString & ' SET ##columnsToUpdate## WHERE #trim(primaryKeyColumnName)# = ##trim(variables.instance.#primaryKeyColumnName#)##">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("##sqlStatement##", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "#trim(stringTableColumnsList)#">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "#trim(nTableColumnsList)#">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "#trim(dateColumnList)#">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#trim(tableColumnsListWOKey)#" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.##currentVar##">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = ''##UCASE(trim(currentVar))##''
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""##CurrentVar##"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (##evaluate(currentVar)##) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "##currentVar##")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "##CreateODBCDateTime(currentDate)##")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "##currentVar##")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "##currentVar##")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "''##Replace(evaluate(currentRecord), "''", "''''", "ALL")##''")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "##currentVar##")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "##evaluate(currentRecord)##")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO '><cfif ListFindNoCase(SQLReservedKeywords, trim(tableName))><cfset fileString = fileString & '[#trim(tableName)#]'><cfelse><cfset fileString = fileString & '[#trim(tableName)#]'></cfif><cfset fileString = fileString & ' (##trim(columnsToInsert)##) VALUES(##trim(columnsToInsertValues)##); SELECT LAST_INSERT_ID() AS #trim(primaryKeyColumnName)# ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("(,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("##sqlStatement##", "(,", "(", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="get#trim(tablename)#Query" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="get#trim(tablename)#Query">						
		<cfargument name="Fields" required="No" type="String" default="#trim(tableColumnsList)#">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">'>
		
	<cfloop list="#trim(tableColumnsList)#" index="i">
	<cfset fileString = fileString & '
		<cfargument name="#trim(i)#" required="No" type="String" default="">
		<cfargument name="#trim(i)#_IN" required="No" type="String" default="">
		<cfargument name="#trim(i)#_LIKE" required="No" type="String" default="">'>
	</cfloop>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Create the list of all columns including the LIKE and IN                       --->
	<!--- columns.                                                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cfparam name="getQueryColumnsList" default="">
	
	<cfloop list="#trim(tableColumnsList)#" index="i">
		<cfset getQueryColumnsList = ListAppend(getQueryColumnsList, trim(i))>
		<cfset tempVar = trim(i) & "_IN">
		<cfset getQueryColumnsList = ListAppend(getQueryColumnsList, trim(tempVar))>
		<cfset tempVar = trim(i) & "_LIKE">
		<cfset getQueryColumnsList = ListAppend(getQueryColumnsList, trim(tempVar))>
	</cfloop>
	
		
		<cfset fileString = fileString & '

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "#trim(getQueryColumnsList)#,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="##ArrayLen(keysToStruct)##" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="#tablename#"
							message="The parameter ""##keysToStruct[i]##"" used is not valid. The value of the parameter is ""##arguments[keysToStruct[i]]##"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = ''##keysToStruct[i]##''
						</cfquery>						
						
						<cfswitch expression="##trim(getThisDataType.DATA_TYPE)##">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""##keysToStruct[i]##"" must be a date. The value of the parameter currently is ""##arguments[keysToStruct[i]]##"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""##keysToStruct[i]##"" must be numeric. The value of the parameter currently is ""##arguments[keysToStruct[i]]##"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="##trim(GroupBy)##" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="##trim(fields)##" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="get#trim(tablename)#Query" datasource="PA_Master">
				SELECT ##trim(Fields)##'>
				<cfif ListFindNoCase(SQLReservedKeywords, trim(tableName))>
					<cfset fileString = fileString & '
				FROM [#trim(tableName)#]'>
				<cfelse>
					<cfset fileString = fileString & '
				FROM #trim(tableName)#'>
				</cfif>
				<cfset fileString = fileString & ' WHERE 1=1'>
				<cfset count = 0>
				<cfloop list="#tableColumnsList#" index="i">
					
					<cfset count = count + 1>
					<cfset thisDataType = ListGetAt(dataTypesList, count)>
					
					<!-------------------------------------------------------------------------------------->
					<!--- Find out what the return type will be based on the                             --->
					<!--- datatype of this column.                                                       --->
					<!-------------------------------------------------------------------------------------->
					<cfswitch expression="#trim(thisDataType)#">
						<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar,ntextdatetime,smalldatetime,datetime">
							<cfset thisParameter = "<cfif #trim(i)# NEQ """">AND #trim(i)# = '###trim(i)###'</cfif>">
						</cfcase> 				
						<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
							<cfset thisParameter = "<cfif #trim(i)# NEQ """" AND IsNumeric(#trim(i)#)>AND #trim(i)# = ###trim(i)###</cfif>">
						</cfcase>	
					    <cfdefaultcase>
							<cfset thisParameter = "<cfif #trim(i)# NEQ """">AND #trim(i)# = '###trim(i)###'</cfif>">
					    </cfdefaultcase>
					</cfswitch>	

				
				<cfset fileString = fileString & '
					#thisParameter#
					<cfif #i#_IN NEQ "">AND #i# IN(##trim(#i#_IN)##)</cfif>
					<cfif #i#_LIKE NEQ "">AND #i# LIKE ''%##trim(#i#_LIKE)##%''</cfif>'>
				</cfloop>					
			
			<cfset fileString = fileString & '	
				<cfif OrderBy NEQ "">
					ORDER BY ##trim(OrderBy)##
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY ##trim(GroupBy1)##
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn get#trim(tablename)#Query>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->'>		
	
	
	<cfif NOT fileInDirectory>
	
	<cfset fileString = fileString & '
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>'>	
	
	</cfif>	
	<cfset fileString = fileString & '	
		#toSave#
	
	<!---End_Custom_Functions--->


	
</cfcomponent>

'>			








<cfset fileString2 = fileString2 & '<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->'>

<cf_gcBlockComment 
	text="#TableName#IO_Methods.cfm" 
	returnVarName="formattedTagName">	

<cfset fileString2 = fileString2 & '
#formattedTagName#
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->'>

<cf_gcBlockComment 
	text="Include this tag in any page that needs access the methods for the table #TableName#" 
	returnVarName="formattedTagDescription">	
	
<cfset fileString2 = fileString2 & '
#formattedTagDescription#  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->'>

<cf_gcBlockComment 
	text="&lt;cfinclude template=""#TableName#IO_Methods.cfm""&gt;" 
	returnVarName="formattedExampleCall">	
	
<cfset fileString2 = fileString2 & '
#formattedExampleCall#  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->'>

	
<cf_gcBlockComment 
	text="[None]" 
	returnVarName="formattedRequiredParameter">	
<cfset fileString2 = fileString2 & '
#formattedRequiredParameter#'>  


<cfset fileString2 = fileString2 & '  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!---  [None]                                                                        --->
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    --->'>

<cf_gcBlockComment 
	text="Created #dateFormat(NOW(), "mm/dd/yyyy")#" 
	returnVarName="formattedHistory">	

<cfset fileString2 = fileString2 & ' 	
#formattedHistory#
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


'>

<cfloop query="getTableColumns">	

<cfset end = mid(ColumnName, 2, len(ColumnName))>
<cfset firstLetter = UCase(Mid(ColumnName,1, 1))>
<cfset ColumnNameFormatted = firstLetter & end>	

<cf_gcBlockComment 
	text="GET and SET method for #tablename# #trim(ColumnNameFormatted)#." 
	returnVarName="formattedColumnDescription">		

<cfset fileString2 = fileString2 & ' 	
	<!-------------------------------------------------------------------------------------->
	#formattedColumnDescription#
	<!-------------------------------------------------------------------------------------->
	<cffunction name="get#trim(ColumnNameFormatted)#" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.#trim(ColumnNameFormatted)#>
	</cffunction>
	
	<cffunction name="set#trim(ColumnNameFormatted)#" access="public" output="No"> 		
		<cfargument name="#trim(ColumnNameFormatted)#" required="Yes" type="String">			
		<cfset variables.instance.#trim(ColumnName)# = arguments.#trim(ColumnName)#>			
	</cffunction>	
'>

</cfloop>		
		
		

		









<cfset fileString3 = fileString3 & '<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->'>

<cf_gcBlockComment 
	text="#Tablename#IOCollection.cfc" 
	returnVarName="formattedTagName">	

<cfset fileString3 = fileString3 & '
#formattedTagName#
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->'>

<cf_gcBlockComment 
	text="Creates access to a collection of rows from #TableName# (dbtable)"
	returnVarName="formattedTagDescription">	
	
<cfset fileString3 = fileString3 & '
#formattedTagDescription#  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->'>

<cf_gcBlockComment 
	text="&lt;#Tablename#IOCollection.cfc""&gt;" 
	returnVarName="formattedExampleCall">	
	
<cfset fileString3 = fileString3 & '
#formattedExampleCall#  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->'>

	
<cf_gcBlockComment 
	text="[None]" 
	returnVarName="formattedRequiredParameter">	
<cfset fileString3 = fileString3 & '
#formattedRequiredParameter#'>  


<cfset fileString3 = fileString3 & '  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!---  [ID]                                                                        --->
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    --->'>

<cf_gcBlockComment 
	text="Created #dateFormat(NOW(), "mm/dd/yyyy")#" 
	returnVarName="formattedHistory">	

<cfset fileString3 = fileString3 & ' 	
#formattedHistory#
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->



<!-------------------------------------------------------------------------------------->
<!--- This tag is a Collection of items. You may use the following methods to gain   --->
<!--- access to the collection.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfcomponent name="#Tablename#IOCollection" hint="This tag is a Collection of #Tablename# rows. You may use the following methods to gain access to the collection.">
		
		
		<cfset this.#Tablename#s = ArrayNew(1)>
	
		<!-------------------------------------------------------------------------------------->
		<!--- Initializes the component. Use this when creating an instance of this          --->
		<!--- component.                                                                     --->
		<!-------------------------------------------------------------------------------------->
		<cffunction name="init" output="no" hint="Initializes the component. Use this when creating an instance of this component." returntype="#Tablename#IOCollection">
		
			<cfreturn this>
			
		</cffunction>
		

		
		<!-------------------------------------------------------------------------------------->
		<!--- Check to see if the row exists by sending in an ID.                            --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction output="no" name="collection#Tablename#Exists" hint="Check to see if the #Tablename# exists by sending in an ID.">
			
			<cfargument name="#primaryKeyColumnName#" required="yes" type="numeric">
			
			<cfset var #Tablename#Index = "0">				

			<cfloop from="1" to="##Arraylen(this.#Tablename#s)##" index="i">					
				<cfif this.#Tablename#s[i].get#primaryKeyColumnName#() EQ trim(arguments.#primaryKeyColumnName#)>				
					<cfset #Tablename#Index = i>
					<cfbreak>
				</cfif>
			</cfloop>				
			
			<cfreturn #Tablename#Index>				
		
		</cffunction>
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Add an item to the collection.                                                 --->
		<!-------------------------------------------------------------------------------------->          
		<cffunction output="no" name="collection#Tablename#Add" hint="Add an item to the collection.">
		
			<cfargument name="#primaryKeyColumnName#" required="yes" type="numeric">					
					
			<cfif this.collection#Tablename#Exists(#primaryKeyColumnName#) LTE 0>				
				
				<cfset #Tablename# = CreateObject(''component'', ''com.common.db.#Tablename#IO'')>
				<cfset #Tablename#.init(#primaryKeyColumnName#)>
				
				<cfset ArrayAppend(this.#Tablename#s, #Tablename#)>
				
				<cfreturn #Tablename#>
				
			</cfif>			
					
		</cffunction> 
		
	
	
		<!-------------------------------------------------------------------------------------->
		<!--- Method to get an item in the collection.                                       --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction output="no" name="collection#Tablename#Get"  hint="Method to get an item in the collection.">
			
			<cfargument name="#primaryKeyColumnName#" required="yes" type="numeric">			
						
			<cfif this.collection#Tablename#Exists(#primaryKeyColumnName#) GT 0>			
				<cfreturn this.#Tablename#s[this.collection#Tablename#Exists(#primaryKeyColumnName#)]>
			<cfelse>
				<cfreturn this.collection#Tablename#Add(arguments.#primaryKeyColumnName#)>	
			</cfif>					
			
		</cffunction>		
		
		
				
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
			file="#trim(request.applicationPath)#\eobmanager1.0\CustomTags\com\common\db\#TableName#IO.cfc" 
			output="#fileString#">
		
		<!--- <cffile 
			action="write" 
			nameconflict="OVERWRITE" 
			file="#trim(request.applicationPath)#\eobmanager1.0\CustomTags\com\common\db\#TableName#IO_Methods.cfm" 
			output="#fileString2#">		
		
		<cffile 
			action="write" 
			nameconflict="OVERWRITE" 
			file="#trim(request.applicationPath)#\eobmanager1.0\CustomTags\com\common\db\#Tablename#IOCollection.cfc" 
			output="#fileString3#">		 --->
		
		<cfset caller.tempVar = tableColumnsListWOKey>
		
		<cfcatch type="any">		
			
			<cfoutput>				
				<font size=2 face="ms sans serif">
					An error was detected while creating the #TableName# get tag.
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
	
	
	
	
	
	
<!--- Test Scripts

<cfset tablename = "debug">
	
<cf_gcCreateDatabaseTableCFCFile
	tablename="#tablename#">

<cfset debugs = CreateObject("component","com.common.db.DebugIOCollection").Init()>							
<cfset debugs.collectionDebugAdd(1496)>		
<cfset debugs.collectionDebugAdd(1497)>

<cfset tempo = debugs.collectionDebugGet(1496)>
<cfoutput>
	tempo.getNote: #tempo.getNote()#<br>
	tempo.getTS: #dateformat(trim(tempo.getTS()), "mm/dd/yyyy")#<br>
</cfoutput>

--->
