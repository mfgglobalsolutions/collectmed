<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@Name@@                                                   --->
<!--- db_Insert_DebugTable.cfm                                   --->
<!--- @@Name@@                                                   --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!--- Database                                                   --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!--- Guillermo Cruz                                             --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               ---> 
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag is an insert tag tied to the Debug table in the   --->
<!--- dB.                                                        --->  
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!--- &lt;cf_db_Insert_DebugTable                                --->  
<!---   <br>AColumn="SomeValue"&gt;                              --->
<!--- @@ExampleCall@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!--- [None]                                                     --->  
<!--- @@RequiredParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!--- Queryname<br>                                              --->
<!--- referenceID<br>                                            --->
<!--- Note<br>                                                   --->
<!--- TS<br>                                                     --->  
<!--- @@OptionalParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!--- recordID                                                   --->  
<!--- @@ReturnedParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                ---> 	
<!--- Created 07/04/2005                                         --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize common tag variables.                           --->      
<!------------------------------------------------------------------>
			
	<cfparam Name="attributes.DataSource" Default="#request.datasource#">
	<cfset DataSource = attributes.DataSource>
	
	<cfparam Name="attributes.QueryName" Default="InsertDebugTable">
	<cfset QueryName = attributes.QueryName>
	
	<cfparam Name="attributes.Count" Default="0">
	<cfset Count = attributes.Count>
	
	<cfparam name="attributes.columnValues" default="">
	<cfset columnValues = attributes.columnValues>
	
	<cfparam name="attributes.newRecordIdentity" default="recordID">
	<cfset newRecordIdentity = attributes.newRecordIdentity>
		
	<cfparam name="attributes.email" default="gcruz@eobmanager.net">
	<cfset email = attributes.email>
	
	
		
<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>

	<cfparam name="attributes.referenceID" default="">
	<cfset referenceID = attributes.referenceID>	
	
	<cfparam name="attributes.Note" default="">
	<cfset Note = attributes.Note>	
	
	<cfparam name="attributes.TS" default="">
	<cfset TS = attributes.TS>	
	

	
<!------------------------------------------------------------------>
<!--- At this point you need to find out what columns are        --->
<!--- restricted by size and program for them accordingly to     --->
<!--- not let the user place in values larger than what is       --->
<!--- allowed.                                                   --->
<!------------------------------------------------------------------>

	<cfif len(referenceID) GT 50>
		<cf_gcGeneralErrorTemplate
			message="The field (referenceID) cannot be greater than 50 character(s).">		
	</cfif>	
	
	<cfif len(Note) GT 8000>
		<cf_gcGeneralErrorTemplate
			message="The field (Note) cannot be greater than 400 character(s).">		
	</cfif>	
	


<!------------------------------------------------------------------>
<!--- List all the table columns.                                --->
<!------------------------------------------------------------------>	
	<cfset tableColumns = "referenceID,Note,TS">
	
	
	
<!------------------------------------------------------------------>
<!--- Denote the column names that need single quotes (strings). --->
<!------------------------------------------------------------------>
	<cfset stringTableColumns = "referenceID,Note">		
	
	

<!------------------------------------------------------------------>
<!--- What columns are Dates datatype.                           --->
<!------------------------------------------------------------------>
	<cfset dateColumnList = "TS">		
	
	
	
<!------------------------------------------------------------------>
<!--- You have to find out how many of the columns sent in       --->
<!--- have values in them in order to build the sqlStatement     --->
<!--- correctly.                                                 --->
<!------------------------------------------------------------------>
	<cfloop list="#tableColumns#" index="currentRecord">		
		<cfif evaluate(currentRecord) NEQ "">			
			<cfset Count = Count + 1> 
		</cfif>
	</cfloop>
	
	
	
<!------------------------------------------------------------------>
<!--- Your sql statement for inserts depends on the number of    --->
<!--- parameters that are to be inserted.                        --->
<!------------------------------------------------------------------>
	
	
	
	<!------------------------------------------------------------------>
	<!--- If the Count of columns with values in them is greater     --->
	<!--- than one then parse out the first column and any           --->
	<!--- subsequent columns will need a comma preceeding them to    --->
	<!--- be added to the sqlStatement                               --->
	<!------------------------------------------------------------------>			
		<cfloop list="#tableColumns#" index="currentRecord">			
			<cfif evaluate(currentRecord) NEQ "">
			
				<cfset firstColumn = #currentRecord#>
				<cfset columnsToInsert = #currentRecord#>
				
				<cfif ListFindNoCase(stringTableColumns,currentRecord)>
					<cfset columnValues = columnValues & "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
				<cfelse>
					<cfset columnValues = columnValues & "#evaluate(currentRecord)#">
				</cfif>				
				
				<cfbreak> 
			
			</cfif>			
		</cfloop>		
	
	<!------------------------------------------------------------------>
	<!--- After the first column has been parsed out then delete     --->
	<!--- that column from the list of column names.                 --->
	<!------------------------------------------------------------------>	
		<cfset tableColumns = ListDeleteAt(tableColumns, ListFindNoCase(tableColumns, #firstColumn#))>
		
	<!------------------------------------------------------------------>
	<!--- If there are still columns to be put into the insert       --->
	<!--- statement add a comma in from of them.                     --->
	<!------------------------------------------------------------------>	
		<cfif Len(tableColumns) GTE 1>
		
			<cfloop list="#tableColumns#" index="currentRecord">
				
				<cfif evaluate(currentRecord) NEQ "">
					
					<cfset columnsToInsert = columnsToInsert & ", " & #currentRecord#>
					
					<!------------------------------------------------------------------>
					<!--- If the column is a datetime datatype then we must give     --->
					<!--- it a format that will safely go into the db.               --->
					<!------------------------------------------------------------------>	
					<cfif ListFindNoCase(dateColumnList,currentRecord) AND evaluate(currentRecord) NEQ "NOW">	

						<!------------------------------------------------------------------>
						<!--- If the value cannot be evaluated to a date error out.      --->
						<!------------------------------------------------------------------>					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentRecord)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(NOW()) & ":" & Minute(NOW()) & ":" & SECOND(NOW())>
						<cfset columnValues = columnValues & ", #CreateODBCDateTime(currentDate)#">			
					
					<!------------------------------------------------------------------>
					<!--- If the column is a datetime datatype then we must give     --->
					<!--- it a format that will safely go into the db.               --->
					<!------------------------------------------------------------------>				
					<cfelseif ListFindNoCase(dateColumnList,currentRecord) AND evaluate(currentRecord) EQ "NOW">
					
						<cfset columnValues = columnValues & ", NOW()">
															
					<cfelseif ListFindNoCase(stringTableColumns,currentRecord)>
						<cfset columnValues = columnValues & ", '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
					<cfelse>
						<cfset columnValues = columnValues & ", #evaluate(currentRecord)#">
					</cfif>
					  
				</cfif>
				
			</cfloop>	
			
		</cfif>	 			
			
	
		
<!------------------------------------------------------------------>
<!--- Build the SQL statement.                                   --->
<!------------------------------------------------------------------>	
	<cfset sqlStatement = "INSERT INTO debug  (#columnsToInsert#) VALUES(#columnValues#)">	

	
		
<!------------------------------------------------------------------>
<!--- Because there will be a couple of different things that    --->
<!--- this tag must do then the whole thing will go inside a     --->
<!--- cftry catch block emailing support automatically.          --->
<!------------------------------------------------------------------>	
	<cftry>		
		
		<!------------------------------------------------------------------>
		<!--- If the application variable "analyzeDB" exists then        --->
		<!--- place the final query to run into the database for         --->
		<!--- further review. This can be used in optimizing the dB.     --->
		<!------------------------------------------------------------------>
		<cfif IsDefined("application.analyzeDB") AND application.analyzeDB NEQ "">
			<cf_gcAnalyzeDB
				queryrun="#PreserveSingleQuotes(sqlStatement)#">			
		</cfif>
		
		
		<!------------------------------------------------------------------>
		<!--- Start the query process.                                   --->
		<!------------------------------------------------------------------>		
			<cfquery name="caller.#QueryName#" datasource="#datasource#">		
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>
			
		<!------------------------------------------------------------------>
		<!--- Once the record has been inserted set the caller scope     --->
		<!--- of the new record ID.                                      --->
		<!------------------------------------------------------------------>	
			<cfquery name="getNewRecordID" datasource="#datasource#">
				SELECT @@IDENTITY AS Ident
			</cfquery>
			
			<cfset "caller.#newRecordIdentity#" = getNewRecordID.Ident>
	
			
	<cfcatch type="any">
					
			<cfsavecontent variable="erroroutput">
				<cfoutput>
					<html>
					<font face=arial size=2 color="000000">
						An error was detected while inserting a record in the Debug table. 				
						<p>				
						<hr>
						<p><strong>The error that occurred was:</strong>
						<p><strong>#cfcatch.type#</strong><br>
						#cfcatch.message# #cfcatch.detail#<br>
						<hr>
						<p>
						<strong>Time of occurance:</strong> #DateFormat( now(), "mm/dd/yyyy" )# #TimeFormat( now() )#
						<p>
					</font>
					</html>
				</cfoutput>
						
			</cfsavecontent>
			
			<cfmail 
				to="#email#" 
				from="#email#" 
				subject="An error was detected inserting into the database table - Debug"
				type="html">
				#erroroutput#<p>
				------------------ Query Attempted ----------------------<br>
				#PreserveSingleQuotes(sqlStatement)#<br>
				---------------------------------------------------------
			</cfmail>
			
			
			<cf_gcGeneralErrorTemplate
				message="<font size=2 face=Arial><strong>Email sent to:</strong> #email#<br><br><font face=Arial color=ffffff>#erroroutput#</font></font>">						
				
			
		</cfcatch>
	</cftry>
	
	

