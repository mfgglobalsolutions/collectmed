<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- ProcedureEOPScodeIO.cfc                                                        --->
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
<!--- @@DESCRIPTION@@                                                                --->
<!--- This tag is a CFC tag tied to the ProcedureEOPScode table in the dB.           --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_ProcedureEOPScodeTable                                           --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
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
<!--- [ andclause="RTRIM(CN1)+''+RTRIM(CN2)='#Var#'" ]<br>                           --->
<!--- ClaimEOPSCodeID<br>                                                            --->
<!--- ProcedureID<br>                                                                --->
<!--- EOPSCode<br>                                                                   --->
<!--- Status<br>                                                                     --->
<!--- ClosingUserID<br>                                                              --->
<!--- CloseDate<br>                                                                  --->  
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
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="ProcedureEOPScodeIO">

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
			variables.instance.changedVariables = "";
			variables.instance.ClaimEOPSCodeID = "NULL";
			variables.instance.ProcedureID = "NULL";
			variables.instance.EOPSCode = "NULL";
			variables.instance.Status = "";
			variables.instance.ClosingUserID = "NULL";
			variables.instance.CloseDate = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 6)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMEOPSCODEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROCEDUREID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EOPSCODE", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "STATUS", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLOSINGUSERID", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLOSEDATE", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 6)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimEOPSCodeID.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimEOPSCodeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimEOPSCodeID>
	</cffunction>
	 
	<cffunction name="setClaimEOPSCodeID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimEOPSCodeID" required="Yes" type="String">
		
		<cfif ClaimEOPSCodeID NEQ "NULL">	
			
			<cfif arguments.ClaimEOPSCodeID EQ "@@" OR arguments.ClaimEOPSCodeID EQ "">
				
				<cfset arguments.ClaimEOPSCodeID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimEOPSCodeID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimEOPSCodeID</strong> (#ClaimEOPSCodeID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimEOPSCodeID = arguments.ClaimEOPSCodeID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ProcedureID.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ProcedureID>
	</cffunction>
	 
	<cffunction name="setProcedureID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ProcedureID" required="Yes" type="String">
		
		<cfif ProcedureID NEQ "NULL">	
			
			<cfif arguments.ProcedureID EQ "@@" OR arguments.ProcedureID EQ "">
				
				<cfset arguments.ProcedureID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ProcedureID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ProcedureID</strong> (#ProcedureID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ProcedureID = arguments.ProcedureID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ProcedureID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EOPSCode.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOPSCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EOPSCode>
	</cffunction>
	 
	<cffunction name="setEOPSCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EOPSCode" required="Yes" type="String">
		
		<cfif EOPSCode NEQ "NULL">	
			
			<cfif arguments.EOPSCode EQ "@@" OR arguments.EOPSCode EQ "">
				
				<cfset arguments.EOPSCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EOPSCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EOPSCode</strong> (#EOPSCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EOPSCode = arguments.EOPSCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EOPSCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Status.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStatus" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Status>
	</cffunction>
	 
	<cffunction name="setStatus" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Status" required="Yes" type="String">
		
		<cfif Status NEQ "NULL">	
			
			<cfif arguments.Status EQ "@@" OR arguments.Status EQ "">
				
				<cfset arguments.Status = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Status)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Status</strong> (#Status#) is not of type <strong>char</strong>.">	
			<cfelseif len(Status) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Status</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Status = arguments.Status>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Status")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClosingUserID.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClosingUserID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClosingUserID>
	</cffunction>
	 
	<cffunction name="setClosingUserID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClosingUserID" required="Yes" type="String">
		
		<cfif ClosingUserID NEQ "NULL">	
			
			<cfif arguments.ClosingUserID EQ "@@" OR arguments.ClosingUserID EQ "">
				
				<cfset arguments.ClosingUserID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClosingUserID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClosingUserID</strong> (#ClosingUserID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClosingUserID = arguments.ClosingUserID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClosingUserID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CloseDate.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCloseDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CloseDate>
	</cffunction>
	 
	<cffunction name="setCloseDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CloseDate" required="Yes" type="String">
		
		<cfif CloseDate NEQ "NULL" AND CloseDate NEQ "NOW">	
			
			<cfif arguments.CloseDate EQ "@@" OR arguments.CloseDate EQ "">
				
				<cfset arguments.CloseDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(CloseDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CloseDate</strong> (#CloseDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CloseDate = arguments.CloseDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CloseDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="ProcedureID" required="No" type="String" default="">
		<cfargument name="EOPSCode" required="No" type="String" default="">
		<cfargument name="Status" required="No" type="String" default="">
		<cfargument name="ClosingUserID" required="No" type="String" default="">
		<cfargument name="CloseDate" required="No" type="String" default="">

		<cfset variables.instance.ProcedureID = arguments.ProcedureID>
		<cfset variables.instance.EOPSCode = arguments.EOPSCode>
		<cfset variables.instance.Status = arguments.Status>
		<cfset variables.instance.ClosingUserID = arguments.ClosingUserID>
		<cfset variables.instance.CloseDate = arguments.CloseDate>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="ProcedureEOPScodeIO" output="No">
		
		<cfargument name="ClaimEOPSCodeID" required="yes" type="numeric">		
		<cfset var qGetProcedureEOPScode = "">
		
		<cfset preInit(ClaimEOPSCodeID)>
	
		<cfquery name="qGetProcedureEOPScode" datasource="#trim(request.datasource)#">
	  		SELECT ClaimEOPSCodeID,ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate
			FROM procedureeopscode  
			WHERE ClaimEOPSCodeID = #trim(arguments.ClaimEOPSCodeID)# 
		</cfquery>
		
		<cfif qGetProcedureEOPScode.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetProcedureEOPScode.ClaimEOPSCodeID EQ "" OR qGetProcedureEOPScode.ClaimEOPSCodeID EQ "NULL") 
				variables.instance.ClaimEOPSCodeID = "NULL"; 
			ELSE 
				variables.instance.ClaimEOPSCodeID = qGetProcedureEOPScode.ClaimEOPSCodeID;
				
			IF(qGetProcedureEOPScode.ProcedureID EQ "" OR qGetProcedureEOPScode.ProcedureID EQ "NULL") 
				variables.instance.ProcedureID = "NULL"; 
			ELSE 
				variables.instance.ProcedureID = qGetProcedureEOPScode.ProcedureID;
				
			IF(qGetProcedureEOPScode.EOPSCode EQ "" OR qGetProcedureEOPScode.EOPSCode EQ "NULL") 
				variables.instance.EOPSCode = "NULL"; 
			ELSE 
				variables.instance.EOPSCode = qGetProcedureEOPScode.EOPSCode;
							
				variables.instance.Status = qGetProcedureEOPScode.Status;
				
			IF(qGetProcedureEOPScode.ClosingUserID EQ "" OR qGetProcedureEOPScode.ClosingUserID EQ "NULL") 
				variables.instance.ClosingUserID = "NULL"; 
			ELSE 
				variables.instance.ClosingUserID = qGetProcedureEOPScode.ClosingUserID;
							
				variables.instance.CloseDate = qGetProcedureEOPScode.CloseDate;
				
		</cfscript>		
		  
		<cfset postInit(ClaimEOPSCodeID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitProcedureEOPScode = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.ClaimEOPSCodeID) AND variables.instance.ClaimEOPSCodeID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitProcedureEOPScode" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitProcedureEOPScode" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.ClaimEOPSCodeID = qInsertCommitProcedureEOPScode.ClaimEOPSCodeID>
				
				<cfreturn qInsertCommitProcedureEOPScode.ClaimEOPSCodeID>
			
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
			<cfset tableColumns = "ClaimEOPSCodeID,ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "Status">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "CloseDate">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
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
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
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
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE ProcedureEOPScode  SET #columnsToUpdate# WHERE ClaimEOPSCodeID = #trim(variables.instance.ClaimEOPSCodeID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
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
			<cfset stringTableColumns = "Status">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "CloseDate">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
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
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
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
				<cfset sqlStatement = "INSERT INTO procedureeopscode  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS ClaimEOPSCodeID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
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
	<cffunction name="getProcedureEOPScodeQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getProcedureEOPScodeQuery">						
		<cfargument name="Fields" required="No" type="String" default="ClaimEOPSCodeID,ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="ClaimEOPSCodeID" required="No" type="String" default="">
		<cfargument name="ClaimEOPSCodeID_IN" required="No" type="String" default="">
		<cfargument name="ClaimEOPSCodeID_LIKE" required="No" type="String" default="">
		<cfargument name="ProcedureID" required="No" type="String" default="">
		<cfargument name="ProcedureID_IN" required="No" type="String" default="">
		<cfargument name="ProcedureID_LIKE" required="No" type="String" default="">
		<cfargument name="EOPSCode" required="No" type="String" default="">
		<cfargument name="EOPSCode_IN" required="No" type="String" default="">
		<cfargument name="EOPSCode_LIKE" required="No" type="String" default="">
		<cfargument name="Status" required="No" type="String" default="">
		<cfargument name="Status_IN" required="No" type="String" default="">
		<cfargument name="Status_LIKE" required="No" type="String" default="">
		<cfargument name="ClosingUserID" required="No" type="String" default="">
		<cfargument name="ClosingUserID_IN" required="No" type="String" default="">
		<cfargument name="ClosingUserID_LIKE" required="No" type="String" default="">
		<cfargument name="CloseDate" required="No" type="String" default="">
		<cfargument name="CloseDate_IN" required="No" type="String" default="">
		<cfargument name="CloseDate_LIKE" required="No" type="String" default="">

		
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
			<cfset availableColumns = "ClaimEOPSCodeID,ClaimEOPSCodeID_IN,ClaimEOPSCodeID_LIKE,ProcedureID,ProcedureID_IN,ProcedureID_LIKE,EOPSCode,EOPSCode_IN,EOPSCode_LIKE,Status,Status_IN,Status_LIKE,ClosingUserID,ClosingUserID_IN,ClosingUserID_LIKE,CloseDate,CloseDate_IN,CloseDate_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="ProcedureEOPScode"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
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
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
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
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getProcedureEOPScodeQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM procedureeopscode   
				WHERE 1=1
					<cfif ClaimEOPSCodeID NEQ "" AND IsNumeric(ClaimEOPSCodeID)>AND ClaimEOPSCodeID = #ClaimEOPSCodeID#</cfif>
					<cfif ClaimEOPSCodeID_IN NEQ "">AND ClaimEOPSCodeID IN(#trim(ClaimEOPSCodeID_IN)#)</cfif>
					<cfif ClaimEOPSCodeID_LIKE NEQ "">AND ClaimEOPSCodeID LIKE '%#trim(ClaimEOPSCodeID_LIKE)#%'</cfif>
					<cfif ProcedureID NEQ "" AND IsNumeric(ProcedureID)>AND ProcedureID = #ProcedureID#</cfif>
					<cfif ProcedureID_IN NEQ "">AND ProcedureID IN(#trim(ProcedureID_IN)#)</cfif>
					<cfif ProcedureID_LIKE NEQ "">AND ProcedureID LIKE '%#trim(ProcedureID_LIKE)#%'</cfif>
					<cfif EOPSCode NEQ "" AND IsNumeric(EOPSCode)>AND EOPSCode = #EOPSCode#</cfif>
					<cfif EOPSCode_IN NEQ "">AND EOPSCode IN(#trim(EOPSCode_IN)#)</cfif>
					<cfif EOPSCode_LIKE NEQ "">AND EOPSCode LIKE '%#trim(EOPSCode_LIKE)#%'</cfif>
					<cfif Status NEQ "">AND Status = '#Status#'</cfif>
					<cfif Status_IN NEQ "">AND Status IN(#trim(Status_IN)#)</cfif>
					<cfif Status_LIKE NEQ "">AND Status LIKE '%#trim(Status_LIKE)#%'</cfif>
					<cfif ClosingUserID NEQ "" AND IsNumeric(ClosingUserID)>AND ClosingUserID = #ClosingUserID#</cfif>
					<cfif ClosingUserID_IN NEQ "">AND ClosingUserID IN(#trim(ClosingUserID_IN)#)</cfif>
					<cfif ClosingUserID_LIKE NEQ "">AND ClosingUserID LIKE '%#trim(ClosingUserID_LIKE)#%'</cfif>
					<cfif CloseDate NEQ "">AND CloseDate = '#CloseDate#'</cfif>
					<cfif CloseDate_IN NEQ "">AND CloseDate IN(#trim(CloseDate_IN)#)</cfif>
					<cfif CloseDate_LIKE NEQ "">AND CloseDate LIKE '%#trim(CloseDate_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getProcedureEOPScodeQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
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
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




