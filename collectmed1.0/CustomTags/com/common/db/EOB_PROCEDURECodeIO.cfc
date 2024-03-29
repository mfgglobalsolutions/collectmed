<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- EOB_PROCEDURECodeIO.cfc                                                        --->
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
<!--- This tag is a CFC tag tied to the EOB_PROCEDURECode table in the dB.           --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_EOB_PROCEDURECodeTable                                           --->  
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
<!--- RecordID<br>                                                                   --->
<!--- TOSCode<br>                                                                    --->
<!--- Code<br>                                                                       --->
<!--- Description<br>                                                                --->
<!--- TMRMPayable<br>                                                                --->
<!--- TotalRVUs<br>                                                                  --->
<!--- ConversionFactor<br>                                                           --->
<!--- AccessBasedOrMaxFee<br>                                                        --->
<!--- NoteCode<br>                                                                   --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
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


<cfcomponent name="EOB_PROCEDURECodeIO">

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
			variables.instance.RecordID = "NULL";
			variables.instance.TOSCode = "";
			variables.instance.Code = "";
			variables.instance.Description = "";
			variables.instance.TMRMPayable = "NULL";
			variables.instance.TotalRVUs = "NULL";
			variables.instance.ConversionFactor = "NULL";
			variables.instance.AccessBasedOrMaxFee = "NULL";
			variables.instance.NoteCode = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 13)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RECORDID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOSCODE", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CODE", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DESCRIPTION", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "text", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TMRMPAYABLE", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOTALRVUS", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CONVERSIONFACTOR", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACCESSBASEDORMAXFEE", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "NOTECODE", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RecordID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRecordID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RecordID>
	</cffunction>
	 
	<cffunction name="setRecordID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RecordID" required="Yes" type="String">
		
		<cfif RecordID NEQ "NULL">	
			
			<cfif arguments.RecordID EQ "@@" OR arguments.RecordID EQ "">
				
				<cfset arguments.RecordID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(RecordID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RecordID</strong> (#RecordID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RecordID = arguments.RecordID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TOSCode.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTOSCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TOSCode>
	</cffunction>
	 
	<cffunction name="setTOSCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TOSCode" required="Yes" type="String">
		
		<cfif TOSCode NEQ "NULL">	
			
			<cfif arguments.TOSCode EQ "@@" OR arguments.TOSCode EQ "">
				
				<cfset arguments.TOSCode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TOSCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TOSCode</strong> (#TOSCode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TOSCode) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TOSCode</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TOSCode = arguments.TOSCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TOSCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Code.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Code>
	</cffunction>
	 
	<cffunction name="setCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Code" required="Yes" type="String">
		
		<cfif Code NEQ "NULL">	
			
			<cfif arguments.Code EQ "@@" OR arguments.Code EQ "">
				
				<cfset arguments.Code = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Code)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Code</strong> (#Code#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Code) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Code</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Code = arguments.Code>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Code")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Description.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDescription" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Description>
	</cffunction>
	 
	<cffunction name="setDescription" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Description" required="Yes" type="String">
		
		<cfif Description NEQ "NULL">	
			
			<cfif arguments.Description EQ "@@" OR arguments.Description EQ "">
				
				<cfset arguments.Description = "NULL">
						
			<cfelseif NOT REQUEST.istextDataType(Description)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Description</strong> (#Description#) is not of type <strong>text</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Description = arguments.Description>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Description")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TMRMPayable.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTMRMPayable" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TMRMPayable>
	</cffunction>
	 
	<cffunction name="setTMRMPayable" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TMRMPayable" required="Yes" type="String">
		
		<cfif TMRMPayable NEQ "NULL">	
			
			<cfif arguments.TMRMPayable EQ "@@" OR arguments.TMRMPayable EQ "">
				
				<cfset arguments.TMRMPayable = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(TMRMPayable)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TMRMPayable</strong> (#TMRMPayable#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TMRMPayable = arguments.TMRMPayable>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TMRMPayable")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TotalRVUs.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTotalRVUs" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TotalRVUs>
	</cffunction>
	 
	<cffunction name="setTotalRVUs" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TotalRVUs" required="Yes" type="String">
		
		<cfif TotalRVUs NEQ "NULL">	
			
			<cfif arguments.TotalRVUs EQ "@@" OR arguments.TotalRVUs EQ "">
				
				<cfset arguments.TotalRVUs = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(TotalRVUs)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TotalRVUs</strong> (#TotalRVUs#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TotalRVUs = arguments.TotalRVUs>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TotalRVUs")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ConversionFactor.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getConversionFactor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ConversionFactor>
	</cffunction>
	 
	<cffunction name="setConversionFactor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ConversionFactor" required="Yes" type="String">
		
		<cfif ConversionFactor NEQ "NULL">	
			
			<cfif arguments.ConversionFactor EQ "@@" OR arguments.ConversionFactor EQ "">
				
				<cfset arguments.ConversionFactor = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(ConversionFactor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ConversionFactor</strong> (#ConversionFactor#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ConversionFactor = arguments.ConversionFactor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ConversionFactor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AccessBasedOrMaxFee.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAccessBasedOrMaxFee" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AccessBasedOrMaxFee>
	</cffunction>
	 
	<cffunction name="setAccessBasedOrMaxFee" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AccessBasedOrMaxFee" required="Yes" type="String">
		
		<cfif AccessBasedOrMaxFee NEQ "NULL">	
			
			<cfif arguments.AccessBasedOrMaxFee EQ "@@" OR arguments.AccessBasedOrMaxFee EQ "">
				
				<cfset arguments.AccessBasedOrMaxFee = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(AccessBasedOrMaxFee)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AccessBasedOrMaxFee</strong> (#AccessBasedOrMaxFee#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AccessBasedOrMaxFee = arguments.AccessBasedOrMaxFee>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AccessBasedOrMaxFee")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for NoteCode.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getNoteCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.NoteCode>
	</cffunction>
	 
	<cffunction name="setNoteCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="NoteCode" required="Yes" type="String">
		
		<cfif NoteCode NEQ "NULL">	
			
			<cfif arguments.NoteCode EQ "@@" OR arguments.NoteCode EQ "">
				
				<cfset arguments.NoteCode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(NoteCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>NoteCode</strong> (#NoteCode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(NoteCode) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>NoteCode</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.NoteCode = arguments.NoteCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "NoteCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="TOSCode" required="No" type="String" default="">
		<cfargument name="Code" required="No" type="String" default="">
		<cfargument name="Description" required="No" type="String" default="">
		<cfargument name="TMRMPayable" required="No" type="String" default="">
		<cfargument name="TotalRVUs" required="No" type="String" default="">
		<cfargument name="ConversionFactor" required="No" type="String" default="">
		<cfargument name="AccessBasedOrMaxFee" required="No" type="String" default="">
		<cfargument name="NoteCode" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.TOSCode = arguments.TOSCode>
		<cfset variables.instance.Code = arguments.Code>
		<cfset variables.instance.Description = arguments.Description>
		<cfset variables.instance.TMRMPayable = arguments.TMRMPayable>
		<cfset variables.instance.TotalRVUs = arguments.TotalRVUs>
		<cfset variables.instance.ConversionFactor = arguments.ConversionFactor>
		<cfset variables.instance.AccessBasedOrMaxFee = arguments.AccessBasedOrMaxFee>
		<cfset variables.instance.NoteCode = arguments.NoteCode>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="EOB_PROCEDURECodeIO" output="No">
		
		<cfargument name="RecordID" required="yes" type="numeric">		
		<cfset var qGetEOB_PROCEDURECode = "">
		
		<cfset preInit(RecordID)>
	
		<cfquery name="qGetEOB_PROCEDURECode" datasource="pa_master">
	  		SELECT RecordID,TOSCode,Code,Description,TMRMPayable,TotalRVUs,ConversionFactor,AccessBasedOrMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified
			FROM eob_procedurecode  
			WHERE RecordID = #trim(arguments.RecordID)# 
		</cfquery>
		
		<cfif qGetEOB_PROCEDURECode.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetEOB_PROCEDURECode.RecordID EQ "" OR qGetEOB_PROCEDURECode.RecordID EQ "NULL") 
				variables.instance.RecordID = "NULL"; 
			ELSE 
				variables.instance.RecordID = qGetEOB_PROCEDURECode.RecordID;
							
				variables.instance.TOSCode = qGetEOB_PROCEDURECode.TOSCode;
							
				variables.instance.Code = qGetEOB_PROCEDURECode.Code;
							
				variables.instance.Description = qGetEOB_PROCEDURECode.Description;
				
			IF(qGetEOB_PROCEDURECode.TMRMPayable EQ "" OR qGetEOB_PROCEDURECode.TMRMPayable EQ "NULL") 
				variables.instance.TMRMPayable = "NULL"; 
			ELSE 
				variables.instance.TMRMPayable = qGetEOB_PROCEDURECode.TMRMPayable;
				
			IF(qGetEOB_PROCEDURECode.TotalRVUs EQ "" OR qGetEOB_PROCEDURECode.TotalRVUs EQ "NULL") 
				variables.instance.TotalRVUs = "NULL"; 
			ELSE 
				variables.instance.TotalRVUs = qGetEOB_PROCEDURECode.TotalRVUs;
				
			IF(qGetEOB_PROCEDURECode.ConversionFactor EQ "" OR qGetEOB_PROCEDURECode.ConversionFactor EQ "NULL") 
				variables.instance.ConversionFactor = "NULL"; 
			ELSE 
				variables.instance.ConversionFactor = qGetEOB_PROCEDURECode.ConversionFactor;
				
			IF(qGetEOB_PROCEDURECode.AccessBasedOrMaxFee EQ "" OR qGetEOB_PROCEDURECode.AccessBasedOrMaxFee EQ "NULL") 
				variables.instance.AccessBasedOrMaxFee = "NULL"; 
			ELSE 
				variables.instance.AccessBasedOrMaxFee = qGetEOB_PROCEDURECode.AccessBasedOrMaxFee;
							
				variables.instance.NoteCode = qGetEOB_PROCEDURECode.NoteCode;
							
				variables.instance.Active = qGetEOB_PROCEDURECode.Active;
				
			IF(qGetEOB_PROCEDURECode.InactiveCode EQ "" OR qGetEOB_PROCEDURECode.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetEOB_PROCEDURECode.InactiveCode;
							
				variables.instance.DateCreated = qGetEOB_PROCEDURECode.DateCreated;
							
				variables.instance.DateModified = qGetEOB_PROCEDURECode.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(RecordID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitEOB_PROCEDURECode = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.RecordID) AND variables.instance.RecordID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitEOB_PROCEDURECode" datasource="pa_master">
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
			
				<cfquery name="qInsertCommitEOB_PROCEDURECode" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.RecordID = qInsertCommitEOB_PROCEDURECode.RecordID>
				
				<cfreturn qInsertCommitEOB_PROCEDURECode.RecordID>
			
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
			<cfset tableColumns = "RecordID,TOSCode,Code,Description,TMRMPayable,TotalRVUs,ConversionFactor,AccessBasedOrMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "TOSCode,Code,Description,NoteCode,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

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
				<cfset sqlStatement = "UPDATE eob_procedurecode  SET #columnsToUpdate# WHERE RecordID = #trim(variables.instance.RecordID)#">
				
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
			<cfset stringTableColumns = "TOSCode,Code,Description,NoteCode,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="TOSCode,Code,Description,TMRMPayable,TotalRVUs,ConversionFactor,AccessBasedOrMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO eob_procedurecode  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS RecordID ">
				
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
	<cffunction name="getEOB_PROCEDURECodeQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getEOB_PROCEDURECodeQuery">						
		<cfargument name="Fields" required="No" type="String" default="RecordID,TOSCode,Code,Description,TMRMPayable,TotalRVUs,ConversionFactor,AccessBasedOrMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="RecordID" required="No" type="String" default="">
		<cfargument name="RecordID_IN" required="No" type="String" default="">
		<cfargument name="RecordID_LIKE" required="No" type="String" default="">
		<cfargument name="TOSCode" required="No" type="String" default="">
		<cfargument name="TOSCode_IN" required="No" type="String" default="">
		<cfargument name="TOSCode_LIKE" required="No" type="String" default="">
		<cfargument name="Code" required="No" type="String" default="">
		<cfargument name="Code_IN" required="No" type="String" default="">
		<cfargument name="Code_LIKE" required="No" type="String" default="">
		<cfargument name="Description" required="No" type="String" default="">
		<cfargument name="Description_IN" required="No" type="String" default="">
		<cfargument name="Description_LIKE" required="No" type="String" default="">
		<cfargument name="TMRMPayable" required="No" type="String" default="">
		<cfargument name="TMRMPayable_IN" required="No" type="String" default="">
		<cfargument name="TMRMPayable_LIKE" required="No" type="String" default="">
		<cfargument name="TotalRVUs" required="No" type="String" default="">
		<cfargument name="TotalRVUs_IN" required="No" type="String" default="">
		<cfargument name="TotalRVUs_LIKE" required="No" type="String" default="">
		<cfargument name="ConversionFactor" required="No" type="String" default="">
		<cfargument name="ConversionFactor_IN" required="No" type="String" default="">
		<cfargument name="ConversionFactor_LIKE" required="No" type="String" default="">
		<cfargument name="AccessBasedOrMaxFee" required="No" type="String" default="">
		<cfargument name="AccessBasedOrMaxFee_IN" required="No" type="String" default="">
		<cfargument name="AccessBasedOrMaxFee_LIKE" required="No" type="String" default="">
		<cfargument name="NoteCode" required="No" type="String" default="">
		<cfargument name="NoteCode_IN" required="No" type="String" default="">
		<cfargument name="NoteCode_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
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
			<cfset availableColumns = "RecordID,RecordID_IN,RecordID_LIKE,TOSCode,TOSCode_IN,TOSCode_LIKE,Code,Code_IN,Code_LIKE,Description,Description_IN,Description_LIKE,TMRMPayable,TMRMPayable_IN,TMRMPayable_LIKE,TotalRVUs,TotalRVUs_IN,TotalRVUs_LIKE,ConversionFactor,ConversionFactor_IN,ConversionFactor_LIKE,AccessBasedOrMaxFee,AccessBasedOrMaxFee_IN,AccessBasedOrMaxFee_LIKE,NoteCode,NoteCode_IN,NoteCode_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="EOB_PROCEDURECode"
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
			<cfquery Name="getEOB_PROCEDURECodeQuery" datasource="pa_master">
				SELECT #trim(Fields)#
				FROM eob_procedurecode   
				WHERE 1=1
					<cfif RecordID NEQ "" AND IsNumeric(RecordID)>AND RecordID = #RecordID#</cfif>
					<cfif RecordID_IN NEQ "">AND RecordID IN(#trim(RecordID_IN)#)</cfif>
					<cfif RecordID_LIKE NEQ "">AND RecordID LIKE '%#trim(RecordID_LIKE)#%'</cfif>
					<cfif TOSCode NEQ "">AND TOSCode = '#TOSCode#'</cfif>
					<cfif TOSCode_IN NEQ "">AND TOSCode IN(#trim(TOSCode_IN)#)</cfif>
					<cfif TOSCode_LIKE NEQ "">AND TOSCode LIKE '%#trim(TOSCode_LIKE)#%'</cfif>
					<cfif Code NEQ "">AND Code = '#Code#'</cfif>
					<cfif Code_IN NEQ "">AND Code IN(#trim(Code_IN)#)</cfif>
					<cfif Code_LIKE NEQ "">AND Code LIKE '%#trim(Code_LIKE)#%'</cfif>
					<cfif Description NEQ "">AND Description = '#Description#'</cfif>
					<cfif Description_IN NEQ "">AND Description IN(#trim(Description_IN)#)</cfif>
					<cfif Description_LIKE NEQ "">AND Description LIKE '%#trim(Description_LIKE)#%'</cfif>
					<cfif TMRMPayable NEQ "" AND IsNumeric(TMRMPayable)>AND TMRMPayable = #TMRMPayable#</cfif>
					<cfif TMRMPayable_IN NEQ "">AND TMRMPayable IN(#trim(TMRMPayable_IN)#)</cfif>
					<cfif TMRMPayable_LIKE NEQ "">AND TMRMPayable LIKE '%#trim(TMRMPayable_LIKE)#%'</cfif>
					<cfif TotalRVUs NEQ "" AND IsNumeric(TotalRVUs)>AND TotalRVUs = #TotalRVUs#</cfif>
					<cfif TotalRVUs_IN NEQ "">AND TotalRVUs IN(#trim(TotalRVUs_IN)#)</cfif>
					<cfif TotalRVUs_LIKE NEQ "">AND TotalRVUs LIKE '%#trim(TotalRVUs_LIKE)#%'</cfif>
					<cfif ConversionFactor NEQ "" AND IsNumeric(ConversionFactor)>AND ConversionFactor = #ConversionFactor#</cfif>
					<cfif ConversionFactor_IN NEQ "">AND ConversionFactor IN(#trim(ConversionFactor_IN)#)</cfif>
					<cfif ConversionFactor_LIKE NEQ "">AND ConversionFactor LIKE '%#trim(ConversionFactor_LIKE)#%'</cfif>
					<cfif AccessBasedOrMaxFee NEQ "" AND IsNumeric(AccessBasedOrMaxFee)>AND AccessBasedOrMaxFee = #AccessBasedOrMaxFee#</cfif>
					<cfif AccessBasedOrMaxFee_IN NEQ "">AND AccessBasedOrMaxFee IN(#trim(AccessBasedOrMaxFee_IN)#)</cfif>
					<cfif AccessBasedOrMaxFee_LIKE NEQ "">AND AccessBasedOrMaxFee LIKE '%#trim(AccessBasedOrMaxFee_LIKE)#%'</cfif>
					<cfif NoteCode NEQ "">AND NoteCode = '#NoteCode#'</cfif>
					<cfif NoteCode_IN NEQ "">AND NoteCode IN(#trim(NoteCode_IN)#)</cfif>
					<cfif NoteCode_LIKE NEQ "">AND NoteCode LIKE '%#trim(NoteCode_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getEOB_PROCEDURECodeQuery>
		
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




