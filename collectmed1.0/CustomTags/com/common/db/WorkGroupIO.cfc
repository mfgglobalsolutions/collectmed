<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- WorkGroupIO.cfc                                                                --->
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
<!--- This tag is a CFC tag tied to the WorkGroup table in the dB.                   --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_WorkGroupTable                                                   --->  
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
<!--- WorkGroupID<br>                                                                --->
<!--- ClientID<br>                                                                   --->
<!--- WorkGroupName<br>                                                              --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->
<!--- Description<br>                                                                --->
<!--- MondayStart<br>                                                                --->
<!--- MondayEnd<br>                                                                  --->
<!--- TuesdayStart<br>                                                               --->
<!--- TuesdayEnd<br>                                                                 --->
<!--- WednesdayStart<br>                                                             --->
<!--- WednesdayEnd<br>                                                               --->
<!--- ThursdayStart<br>                                                              --->
<!--- ThursdayEnd<br>                                                                --->
<!--- FridayStart<br>                                                                --->
<!--- FridayEnd<br>                                                                  --->
<!--- SaturdayStart<br>                                                              --->
<!--- SaturdayEnd<br>                                                                --->
<!--- SundayStart<br>                                                                --->
<!--- SundayEnd<br>                                                                  --->  
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


<cfcomponent name="WorkGroupIO">

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
			variables.instance.WorkGroupID = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.WorkGroupName = "";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";
			variables.instance.Description = "";
			variables.instance.MondayStart = "";
			variables.instance.MondayEnd = "";
			variables.instance.TuesdayStart = "";
			variables.instance.TuesdayEnd = "";
			variables.instance.WednesdayStart = "";
			variables.instance.WednesdayEnd = "";
			variables.instance.ThursdayStart = "";
			variables.instance.ThursdayEnd = "";
			variables.instance.FridayStart = "";
			variables.instance.FridayEnd = "";
			variables.instance.SaturdayStart = "";
			variables.instance.SaturdayEnd = "";
			variables.instance.SundayStart = "";
			variables.instance.SundayEnd = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 20)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "WORKGROUPID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "WORKGROUPNAME", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DESCRIPTION", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONDAYSTART", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONDAYEND", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TUESDAYSTART", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TUESDAYEND", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "WEDNESDAYSTART", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "WEDNESDAYEND", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "THURSDAYSTART", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "THURSDAYEND", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FRIDAYSTART", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FRIDAYEND", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SATURDAYSTART", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SATURDAYEND", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SUNDAYSTART", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SUNDAYEND", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 20)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for WorkGroupID.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getWorkGroupID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.WorkGroupID>
	</cffunction>
	 
	<cffunction name="setWorkGroupID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="WorkGroupID" required="Yes" type="String">
		
		<cfif WorkGroupID NEQ "NULL">	
			
			<cfif arguments.WorkGroupID EQ "@@" OR arguments.WorkGroupID EQ "">
				
				<cfset arguments.WorkGroupID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(WorkGroupID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>WorkGroupID</strong> (#WorkGroupID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.WorkGroupID = arguments.WorkGroupID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for WorkGroupName.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getWorkGroupName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.WorkGroupName>
	</cffunction>
	 
	<cffunction name="setWorkGroupName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="WorkGroupName" required="Yes" type="String">
		
		<cfif WorkGroupName NEQ "NULL">	
			
			<cfif arguments.WorkGroupName EQ "@@" OR arguments.WorkGroupName EQ "">
				
				<cfset arguments.WorkGroupName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(WorkGroupName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>WorkGroupName</strong> (#WorkGroupName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(WorkGroupName) GT 120>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>WorkGroupName</strong> cannot be greater than 120 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.WorkGroupName = arguments.WorkGroupName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "WorkGroupName")>			
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
						
			<cfelseif NOT REQUEST.isvarcharDataType(Description)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Description</strong> (#Description#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Description) GT 750>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Description</strong> cannot be greater than 750 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Description = arguments.Description>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Description")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MondayStart.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMondayStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MondayStart>
	</cffunction>
	 
	<cffunction name="setMondayStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MondayStart" required="Yes" type="String">
		
		<cfif MondayStart NEQ "NULL" AND MondayStart NEQ "NOW">	
			
			<cfif arguments.MondayStart EQ "@@" OR arguments.MondayStart EQ "">
				
				<cfset arguments.MondayStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(MondayStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MondayStart</strong> (#MondayStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MondayStart = arguments.MondayStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MondayStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MondayEnd.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMondayEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MondayEnd>
	</cffunction>
	 
	<cffunction name="setMondayEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MondayEnd" required="Yes" type="String">
		
		<cfif MondayEnd NEQ "NULL" AND MondayEnd NEQ "NOW">	
			
			<cfif arguments.MondayEnd EQ "@@" OR arguments.MondayEnd EQ "">
				
				<cfset arguments.MondayEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(MondayEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MondayEnd</strong> (#MondayEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MondayEnd = arguments.MondayEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MondayEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TuesdayStart.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTuesdayStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TuesdayStart>
	</cffunction>
	 
	<cffunction name="setTuesdayStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TuesdayStart" required="Yes" type="String">
		
		<cfif TuesdayStart NEQ "NULL" AND TuesdayStart NEQ "NOW">	
			
			<cfif arguments.TuesdayStart EQ "@@" OR arguments.TuesdayStart EQ "">
				
				<cfset arguments.TuesdayStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(TuesdayStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TuesdayStart</strong> (#TuesdayStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TuesdayStart = arguments.TuesdayStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TuesdayStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TuesdayEnd.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTuesdayEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TuesdayEnd>
	</cffunction>
	 
	<cffunction name="setTuesdayEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TuesdayEnd" required="Yes" type="String">
		
		<cfif TuesdayEnd NEQ "NULL" AND TuesdayEnd NEQ "NOW">	
			
			<cfif arguments.TuesdayEnd EQ "@@" OR arguments.TuesdayEnd EQ "">
				
				<cfset arguments.TuesdayEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(TuesdayEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TuesdayEnd</strong> (#TuesdayEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TuesdayEnd = arguments.TuesdayEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TuesdayEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for WednesdayStart.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getWednesdayStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.WednesdayStart>
	</cffunction>
	 
	<cffunction name="setWednesdayStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="WednesdayStart" required="Yes" type="String">
		
		<cfif WednesdayStart NEQ "NULL" AND WednesdayStart NEQ "NOW">	
			
			<cfif arguments.WednesdayStart EQ "@@" OR arguments.WednesdayStart EQ "">
				
				<cfset arguments.WednesdayStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(WednesdayStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>WednesdayStart</strong> (#WednesdayStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.WednesdayStart = arguments.WednesdayStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "WednesdayStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for WednesdayEnd.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getWednesdayEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.WednesdayEnd>
	</cffunction>
	 
	<cffunction name="setWednesdayEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="WednesdayEnd" required="Yes" type="String">
		
		<cfif WednesdayEnd NEQ "NULL" AND WednesdayEnd NEQ "NOW">	
			
			<cfif arguments.WednesdayEnd EQ "@@" OR arguments.WednesdayEnd EQ "">
				
				<cfset arguments.WednesdayEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(WednesdayEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>WednesdayEnd</strong> (#WednesdayEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.WednesdayEnd = arguments.WednesdayEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "WednesdayEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ThursdayStart.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getThursdayStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ThursdayStart>
	</cffunction>
	 
	<cffunction name="setThursdayStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ThursdayStart" required="Yes" type="String">
		
		<cfif ThursdayStart NEQ "NULL" AND ThursdayStart NEQ "NOW">	
			
			<cfif arguments.ThursdayStart EQ "@@" OR arguments.ThursdayStart EQ "">
				
				<cfset arguments.ThursdayStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(ThursdayStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ThursdayStart</strong> (#ThursdayStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ThursdayStart = arguments.ThursdayStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ThursdayStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ThursdayEnd.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getThursdayEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ThursdayEnd>
	</cffunction>
	 
	<cffunction name="setThursdayEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ThursdayEnd" required="Yes" type="String">
		
		<cfif ThursdayEnd NEQ "NULL" AND ThursdayEnd NEQ "NOW">	
			
			<cfif arguments.ThursdayEnd EQ "@@" OR arguments.ThursdayEnd EQ "">
				
				<cfset arguments.ThursdayEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(ThursdayEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ThursdayEnd</strong> (#ThursdayEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ThursdayEnd = arguments.ThursdayEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ThursdayEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FridayStart.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFridayStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FridayStart>
	</cffunction>
	 
	<cffunction name="setFridayStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FridayStart" required="Yes" type="String">
		
		<cfif FridayStart NEQ "NULL" AND FridayStart NEQ "NOW">	
			
			<cfif arguments.FridayStart EQ "@@" OR arguments.FridayStart EQ "">
				
				<cfset arguments.FridayStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(FridayStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FridayStart</strong> (#FridayStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FridayStart = arguments.FridayStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FridayStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FridayEnd.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFridayEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FridayEnd>
	</cffunction>
	 
	<cffunction name="setFridayEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FridayEnd" required="Yes" type="String">
		
		<cfif FridayEnd NEQ "NULL" AND FridayEnd NEQ "NOW">	
			
			<cfif arguments.FridayEnd EQ "@@" OR arguments.FridayEnd EQ "">
				
				<cfset arguments.FridayEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(FridayEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FridayEnd</strong> (#FridayEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FridayEnd = arguments.FridayEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FridayEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SaturdayStart.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSaturdayStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SaturdayStart>
	</cffunction>
	 
	<cffunction name="setSaturdayStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SaturdayStart" required="Yes" type="String">
		
		<cfif SaturdayStart NEQ "NULL" AND SaturdayStart NEQ "NOW">	
			
			<cfif arguments.SaturdayStart EQ "@@" OR arguments.SaturdayStart EQ "">
				
				<cfset arguments.SaturdayStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(SaturdayStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SaturdayStart</strong> (#SaturdayStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SaturdayStart = arguments.SaturdayStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SaturdayStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SaturdayEnd.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSaturdayEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SaturdayEnd>
	</cffunction>
	 
	<cffunction name="setSaturdayEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SaturdayEnd" required="Yes" type="String">
		
		<cfif SaturdayEnd NEQ "NULL" AND SaturdayEnd NEQ "NOW">	
			
			<cfif arguments.SaturdayEnd EQ "@@" OR arguments.SaturdayEnd EQ "">
				
				<cfset arguments.SaturdayEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(SaturdayEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SaturdayEnd</strong> (#SaturdayEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SaturdayEnd = arguments.SaturdayEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SaturdayEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SundayStart.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSundayStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SundayStart>
	</cffunction>
	 
	<cffunction name="setSundayStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SundayStart" required="Yes" type="String">
		
		<cfif SundayStart NEQ "NULL" AND SundayStart NEQ "NOW">	
			
			<cfif arguments.SundayStart EQ "@@" OR arguments.SundayStart EQ "">
				
				<cfset arguments.SundayStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(SundayStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SundayStart</strong> (#SundayStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SundayStart = arguments.SundayStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SundayStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SundayEnd.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSundayEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SundayEnd>
	</cffunction>
	 
	<cffunction name="setSundayEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SundayEnd" required="Yes" type="String">
		
		<cfif SundayEnd NEQ "NULL" AND SundayEnd NEQ "NOW">	
			
			<cfif arguments.SundayEnd EQ "@@" OR arguments.SundayEnd EQ "">
				
				<cfset arguments.SundayEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(SundayEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SundayEnd</strong> (#SundayEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SundayEnd = arguments.SundayEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SundayEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="WorkGroupName" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="Description" required="No" type="String" default="">
		<cfargument name="MondayStart" required="No" type="String" default="">
		<cfargument name="MondayEnd" required="No" type="String" default="">
		<cfargument name="TuesdayStart" required="No" type="String" default="">
		<cfargument name="TuesdayEnd" required="No" type="String" default="">
		<cfargument name="WednesdayStart" required="No" type="String" default="">
		<cfargument name="WednesdayEnd" required="No" type="String" default="">
		<cfargument name="ThursdayStart" required="No" type="String" default="">
		<cfargument name="ThursdayEnd" required="No" type="String" default="">
		<cfargument name="FridayStart" required="No" type="String" default="">
		<cfargument name="FridayEnd" required="No" type="String" default="">
		<cfargument name="SaturdayStart" required="No" type="String" default="">
		<cfargument name="SaturdayEnd" required="No" type="String" default="">
		<cfargument name="SundayStart" required="No" type="String" default="">
		<cfargument name="SundayEnd" required="No" type="String" default="">

		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.WorkGroupName = arguments.WorkGroupName>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>
		<cfset variables.instance.Description = arguments.Description>
		<cfset variables.instance.MondayStart = arguments.MondayStart>
		<cfset variables.instance.MondayEnd = arguments.MondayEnd>
		<cfset variables.instance.TuesdayStart = arguments.TuesdayStart>
		<cfset variables.instance.TuesdayEnd = arguments.TuesdayEnd>
		<cfset variables.instance.WednesdayStart = arguments.WednesdayStart>
		<cfset variables.instance.WednesdayEnd = arguments.WednesdayEnd>
		<cfset variables.instance.ThursdayStart = arguments.ThursdayStart>
		<cfset variables.instance.ThursdayEnd = arguments.ThursdayEnd>
		<cfset variables.instance.FridayStart = arguments.FridayStart>
		<cfset variables.instance.FridayEnd = arguments.FridayEnd>
		<cfset variables.instance.SaturdayStart = arguments.SaturdayStart>
		<cfset variables.instance.SaturdayEnd = arguments.SaturdayEnd>
		<cfset variables.instance.SundayStart = arguments.SundayStart>
		<cfset variables.instance.SundayEnd = arguments.SundayEnd>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="WorkGroupIO" output="No">
		
		<cfargument name="WorkGroupID" required="yes" type="numeric">		
		<cfset var qGetWorkGroup = "">
		
		<cfset preInit(WorkGroupID)>
	
		<cfquery name="qGetWorkGroup" datasource="#trim(request.datasource)#">
	  		SELECT WorkGroupID,ClientID,WorkGroupName,DateCreated,DateModified,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd
			FROM WorkGroup  
			WHERE WorkGroupID = #trim(arguments.WorkGroupID)# 
		</cfquery>
		
		<cfif qGetWorkGroup.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetWorkGroup.WorkGroupID EQ "" OR qGetWorkGroup.WorkGroupID EQ "NULL") 
				variables.instance.WorkGroupID = "NULL"; 
			ELSE 
				variables.instance.WorkGroupID = qGetWorkGroup.WorkGroupID;
				
			IF(qGetWorkGroup.ClientID EQ "" OR qGetWorkGroup.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetWorkGroup.ClientID;
							
				variables.instance.WorkGroupName = qGetWorkGroup.WorkGroupName;
							
				variables.instance.DateCreated = qGetWorkGroup.DateCreated;
							
				variables.instance.DateModified = qGetWorkGroup.DateModified;
							
				variables.instance.Description = qGetWorkGroup.Description;
							
				variables.instance.MondayStart = qGetWorkGroup.MondayStart;
							
				variables.instance.MondayEnd = qGetWorkGroup.MondayEnd;
							
				variables.instance.TuesdayStart = qGetWorkGroup.TuesdayStart;
							
				variables.instance.TuesdayEnd = qGetWorkGroup.TuesdayEnd;
							
				variables.instance.WednesdayStart = qGetWorkGroup.WednesdayStart;
							
				variables.instance.WednesdayEnd = qGetWorkGroup.WednesdayEnd;
							
				variables.instance.ThursdayStart = qGetWorkGroup.ThursdayStart;
							
				variables.instance.ThursdayEnd = qGetWorkGroup.ThursdayEnd;
							
				variables.instance.FridayStart = qGetWorkGroup.FridayStart;
							
				variables.instance.FridayEnd = qGetWorkGroup.FridayEnd;
							
				variables.instance.SaturdayStart = qGetWorkGroup.SaturdayStart;
							
				variables.instance.SaturdayEnd = qGetWorkGroup.SaturdayEnd;
							
				variables.instance.SundayStart = qGetWorkGroup.SundayStart;
							
				variables.instance.SundayEnd = qGetWorkGroup.SundayEnd;
				
		</cfscript>		
		  
		<cfset postInit(WorkGroupID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitWorkGroup = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.WorkGroupID) AND variables.instance.WorkGroupID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitWorkGroup" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitWorkGroup" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.WorkGroupID = qInsertCommitWorkGroup.WorkGroupID>
				
				<cfreturn qInsertCommitWorkGroup.WorkGroupID>
			
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
			<cfset tableColumns = "WorkGroupID,ClientID,WorkGroupName,DateCreated,DateModified,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "WorkGroupName,Description">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd">

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
				<cfset sqlStatement = "UPDATE WorkGroup  SET #columnsToUpdate# WHERE WorkGroupID = #trim(variables.instance.WorkGroupID)#">
				
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
			<cfset stringTableColumns = "WorkGroupName,Description">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="ClientID,WorkGroupName,DateCreated,DateModified,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO WorkGroup  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS WorkGroupID ">
				
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
	<cffunction name="getWorkGroupQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getWorkGroupQuery">						
		<cfargument name="Fields" required="No" type="String" default="WorkGroupID,ClientID,WorkGroupName,DateCreated,DateModified,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="WorkGroupID" required="No" type="String" default="">
		<cfargument name="WorkGroupID_IN" required="No" type="String" default="">
		<cfargument name="WorkGroupID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="WorkGroupName" required="No" type="String" default="">
		<cfargument name="WorkGroupName_IN" required="No" type="String" default="">
		<cfargument name="WorkGroupName_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">
		<cfargument name="Description" required="No" type="String" default="">
		<cfargument name="Description_IN" required="No" type="String" default="">
		<cfargument name="Description_LIKE" required="No" type="String" default="">
		<cfargument name="MondayStart" required="No" type="String" default="">
		<cfargument name="MondayStart_IN" required="No" type="String" default="">
		<cfargument name="MondayStart_LIKE" required="No" type="String" default="">
		<cfargument name="MondayEnd" required="No" type="String" default="">
		<cfargument name="MondayEnd_IN" required="No" type="String" default="">
		<cfargument name="MondayEnd_LIKE" required="No" type="String" default="">
		<cfargument name="TuesdayStart" required="No" type="String" default="">
		<cfargument name="TuesdayStart_IN" required="No" type="String" default="">
		<cfargument name="TuesdayStart_LIKE" required="No" type="String" default="">
		<cfargument name="TuesdayEnd" required="No" type="String" default="">
		<cfargument name="TuesdayEnd_IN" required="No" type="String" default="">
		<cfargument name="TuesdayEnd_LIKE" required="No" type="String" default="">
		<cfargument name="WednesdayStart" required="No" type="String" default="">
		<cfargument name="WednesdayStart_IN" required="No" type="String" default="">
		<cfargument name="WednesdayStart_LIKE" required="No" type="String" default="">
		<cfargument name="WednesdayEnd" required="No" type="String" default="">
		<cfargument name="WednesdayEnd_IN" required="No" type="String" default="">
		<cfargument name="WednesdayEnd_LIKE" required="No" type="String" default="">
		<cfargument name="ThursdayStart" required="No" type="String" default="">
		<cfargument name="ThursdayStart_IN" required="No" type="String" default="">
		<cfargument name="ThursdayStart_LIKE" required="No" type="String" default="">
		<cfargument name="ThursdayEnd" required="No" type="String" default="">
		<cfargument name="ThursdayEnd_IN" required="No" type="String" default="">
		<cfargument name="ThursdayEnd_LIKE" required="No" type="String" default="">
		<cfargument name="FridayStart" required="No" type="String" default="">
		<cfargument name="FridayStart_IN" required="No" type="String" default="">
		<cfargument name="FridayStart_LIKE" required="No" type="String" default="">
		<cfargument name="FridayEnd" required="No" type="String" default="">
		<cfargument name="FridayEnd_IN" required="No" type="String" default="">
		<cfargument name="FridayEnd_LIKE" required="No" type="String" default="">
		<cfargument name="SaturdayStart" required="No" type="String" default="">
		<cfargument name="SaturdayStart_IN" required="No" type="String" default="">
		<cfargument name="SaturdayStart_LIKE" required="No" type="String" default="">
		<cfargument name="SaturdayEnd" required="No" type="String" default="">
		<cfargument name="SaturdayEnd_IN" required="No" type="String" default="">
		<cfargument name="SaturdayEnd_LIKE" required="No" type="String" default="">
		<cfargument name="SundayStart" required="No" type="String" default="">
		<cfargument name="SundayStart_IN" required="No" type="String" default="">
		<cfargument name="SundayStart_LIKE" required="No" type="String" default="">
		<cfargument name="SundayEnd" required="No" type="String" default="">
		<cfargument name="SundayEnd_IN" required="No" type="String" default="">
		<cfargument name="SundayEnd_LIKE" required="No" type="String" default="">

		
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
			<cfset availableColumns = "WorkGroupID,WorkGroupID_IN,WorkGroupID_LIKE,ClientID,ClientID_IN,ClientID_LIKE,WorkGroupName,WorkGroupName_IN,WorkGroupName_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,Description,Description_IN,Description_LIKE,MondayStart,MondayStart_IN,MondayStart_LIKE,MondayEnd,MondayEnd_IN,MondayEnd_LIKE,TuesdayStart,TuesdayStart_IN,TuesdayStart_LIKE,TuesdayEnd,TuesdayEnd_IN,TuesdayEnd_LIKE,WednesdayStart,WednesdayStart_IN,WednesdayStart_LIKE,WednesdayEnd,WednesdayEnd_IN,WednesdayEnd_LIKE,ThursdayStart,ThursdayStart_IN,ThursdayStart_LIKE,ThursdayEnd,ThursdayEnd_IN,ThursdayEnd_LIKE,FridayStart,FridayStart_IN,FridayStart_LIKE,FridayEnd,FridayEnd_IN,FridayEnd_LIKE,SaturdayStart,SaturdayStart_IN,SaturdayStart_LIKE,SaturdayEnd,SaturdayEnd_IN,SaturdayEnd_LIKE,SundayStart,SundayStart_IN,SundayStart_LIKE,SundayEnd,SundayEnd_IN,SundayEnd_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="WorkGroup"
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
			<cfquery Name="getWorkGroupQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM WorkGroup   
				WHERE 1=1
					<cfif WorkGroupID NEQ "" AND IsNumeric(WorkGroupID)>AND WorkGroupID = #WorkGroupID#</cfif>
					<cfif WorkGroupID_IN NEQ "">AND WorkGroupID IN(#trim(WorkGroupID_IN)#)</cfif>
					<cfif WorkGroupID_LIKE NEQ "">AND WorkGroupID LIKE '%#trim(WorkGroupID_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif WorkGroupName NEQ "">AND WorkGroupName = '#WorkGroupName#'</cfif>
					<cfif WorkGroupName_IN NEQ "">AND WorkGroupName IN(#trim(WorkGroupName_IN)#)</cfif>
					<cfif WorkGroupName_LIKE NEQ "">AND WorkGroupName LIKE '%#trim(WorkGroupName_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>
					<cfif Description NEQ "">AND Description = '#Description#'</cfif>
					<cfif Description_IN NEQ "">AND Description IN(#trim(Description_IN)#)</cfif>
					<cfif Description_LIKE NEQ "">AND Description LIKE '%#trim(Description_LIKE)#%'</cfif>
					<cfif MondayStart NEQ "">AND MondayStart = '#MondayStart#'</cfif>
					<cfif MondayStart_IN NEQ "">AND MondayStart IN(#trim(MondayStart_IN)#)</cfif>
					<cfif MondayStart_LIKE NEQ "">AND MondayStart LIKE '%#trim(MondayStart_LIKE)#%'</cfif>
					<cfif MondayEnd NEQ "">AND MondayEnd = '#MondayEnd#'</cfif>
					<cfif MondayEnd_IN NEQ "">AND MondayEnd IN(#trim(MondayEnd_IN)#)</cfif>
					<cfif MondayEnd_LIKE NEQ "">AND MondayEnd LIKE '%#trim(MondayEnd_LIKE)#%'</cfif>
					<cfif TuesdayStart NEQ "">AND TuesdayStart = '#TuesdayStart#'</cfif>
					<cfif TuesdayStart_IN NEQ "">AND TuesdayStart IN(#trim(TuesdayStart_IN)#)</cfif>
					<cfif TuesdayStart_LIKE NEQ "">AND TuesdayStart LIKE '%#trim(TuesdayStart_LIKE)#%'</cfif>
					<cfif TuesdayEnd NEQ "">AND TuesdayEnd = '#TuesdayEnd#'</cfif>
					<cfif TuesdayEnd_IN NEQ "">AND TuesdayEnd IN(#trim(TuesdayEnd_IN)#)</cfif>
					<cfif TuesdayEnd_LIKE NEQ "">AND TuesdayEnd LIKE '%#trim(TuesdayEnd_LIKE)#%'</cfif>
					<cfif WednesdayStart NEQ "">AND WednesdayStart = '#WednesdayStart#'</cfif>
					<cfif WednesdayStart_IN NEQ "">AND WednesdayStart IN(#trim(WednesdayStart_IN)#)</cfif>
					<cfif WednesdayStart_LIKE NEQ "">AND WednesdayStart LIKE '%#trim(WednesdayStart_LIKE)#%'</cfif>
					<cfif WednesdayEnd NEQ "">AND WednesdayEnd = '#WednesdayEnd#'</cfif>
					<cfif WednesdayEnd_IN NEQ "">AND WednesdayEnd IN(#trim(WednesdayEnd_IN)#)</cfif>
					<cfif WednesdayEnd_LIKE NEQ "">AND WednesdayEnd LIKE '%#trim(WednesdayEnd_LIKE)#%'</cfif>
					<cfif ThursdayStart NEQ "">AND ThursdayStart = '#ThursdayStart#'</cfif>
					<cfif ThursdayStart_IN NEQ "">AND ThursdayStart IN(#trim(ThursdayStart_IN)#)</cfif>
					<cfif ThursdayStart_LIKE NEQ "">AND ThursdayStart LIKE '%#trim(ThursdayStart_LIKE)#%'</cfif>
					<cfif ThursdayEnd NEQ "">AND ThursdayEnd = '#ThursdayEnd#'</cfif>
					<cfif ThursdayEnd_IN NEQ "">AND ThursdayEnd IN(#trim(ThursdayEnd_IN)#)</cfif>
					<cfif ThursdayEnd_LIKE NEQ "">AND ThursdayEnd LIKE '%#trim(ThursdayEnd_LIKE)#%'</cfif>
					<cfif FridayStart NEQ "">AND FridayStart = '#FridayStart#'</cfif>
					<cfif FridayStart_IN NEQ "">AND FridayStart IN(#trim(FridayStart_IN)#)</cfif>
					<cfif FridayStart_LIKE NEQ "">AND FridayStart LIKE '%#trim(FridayStart_LIKE)#%'</cfif>
					<cfif FridayEnd NEQ "">AND FridayEnd = '#FridayEnd#'</cfif>
					<cfif FridayEnd_IN NEQ "">AND FridayEnd IN(#trim(FridayEnd_IN)#)</cfif>
					<cfif FridayEnd_LIKE NEQ "">AND FridayEnd LIKE '%#trim(FridayEnd_LIKE)#%'</cfif>
					<cfif SaturdayStart NEQ "">AND SaturdayStart = '#SaturdayStart#'</cfif>
					<cfif SaturdayStart_IN NEQ "">AND SaturdayStart IN(#trim(SaturdayStart_IN)#)</cfif>
					<cfif SaturdayStart_LIKE NEQ "">AND SaturdayStart LIKE '%#trim(SaturdayStart_LIKE)#%'</cfif>
					<cfif SaturdayEnd NEQ "">AND SaturdayEnd = '#SaturdayEnd#'</cfif>
					<cfif SaturdayEnd_IN NEQ "">AND SaturdayEnd IN(#trim(SaturdayEnd_IN)#)</cfif>
					<cfif SaturdayEnd_LIKE NEQ "">AND SaturdayEnd LIKE '%#trim(SaturdayEnd_LIKE)#%'</cfif>
					<cfif SundayStart NEQ "">AND SundayStart = '#SundayStart#'</cfif>
					<cfif SundayStart_IN NEQ "">AND SundayStart IN(#trim(SundayStart_IN)#)</cfif>
					<cfif SundayStart_LIKE NEQ "">AND SundayStart LIKE '%#trim(SundayStart_LIKE)#%'</cfif>
					<cfif SundayEnd NEQ "">AND SundayEnd = '#SundayEnd#'</cfif>
					<cfif SundayEnd_IN NEQ "">AND SundayEnd IN(#trim(SundayEnd_IN)#)</cfif>
					<cfif SundayEnd_LIKE NEQ "">AND SundayEnd LIKE '%#trim(SundayEnd_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getWorkGroupQuery>
		
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


