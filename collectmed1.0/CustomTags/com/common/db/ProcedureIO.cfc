<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- ProcedureIO.cfc                                                                --->
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
<!--- This tag is a CFC tag tied to the Procedure table in the dB.                   --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_ProcedureTable                                                   --->  
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
<!--- ProcedureID<br>                                                                --->
<!--- ClaimID<br>                                                                    --->
<!--- ProcedureCode<br>                                                              --->
<!--- PriorProcedureCode<br>                                                         --->
<!--- ServiceDateFrom<br>                                                            --->
<!--- ServiceDateTo<br>                                                              --->
<!--- BilledQuantity<br>                                                             --->
<!--- BilledAmount<br>                                                               --->
<!--- PaidQuantity<br>                                                               --->
<!--- PaidAmount<br>                                                                 --->  
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


<cfcomponent name="ProcedureIO">

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
			variables.instance.ProcedureID = "NULL";
			variables.instance.ClaimID = "NULL";
			variables.instance.ProcedureCode = "NULL";
			variables.instance.PriorProcedureCode = "";
			variables.instance.ServiceDateFrom = "";
			variables.instance.ServiceDateTo = "";
			variables.instance.BilledQuantity = "NULL";
			variables.instance.BilledAmount = "NULL";
			variables.instance.PaidQuantity = "NULL";
			variables.instance.PaidAmount = "NULL";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 10)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROCEDUREID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROCEDURECODE", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIORPROCEDURECODE", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SERVICEDATEFROM", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SERVICEDATETO", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "BILLEDQUANTITY", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "BILLEDAMOUNT", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PAIDQUANTITY", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PAIDAMOUNT", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 10)>
	

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
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimID.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimID>
	</cffunction>
	 
	<cffunction name="setClaimID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimID" required="Yes" type="String">
		
		<cfif ClaimID NEQ "NULL">	
			
			<cfif arguments.ClaimID EQ "@@" OR arguments.ClaimID EQ "">
				
				<cfset arguments.ClaimID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimID</strong> (#ClaimID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimID = arguments.ClaimID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ProcedureCode.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ProcedureCode>
	</cffunction>
	 
	<cffunction name="setProcedureCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ProcedureCode" required="Yes" type="String">
		
		<cfif ProcedureCode NEQ "NULL">	
			
			<cfif arguments.ProcedureCode EQ "@@" OR arguments.ProcedureCode EQ "">
				
				<cfset arguments.ProcedureCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ProcedureCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ProcedureCode</strong> (#ProcedureCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ProcedureCode = arguments.ProcedureCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ProcedureCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PriorProcedureCode.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriorProcedureCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriorProcedureCode>
	</cffunction>
	 
	<cffunction name="setPriorProcedureCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriorProcedureCode" required="Yes" type="String">
		
		<cfif PriorProcedureCode NEQ "NULL">	
			
			<cfif arguments.PriorProcedureCode EQ "@@" OR arguments.PriorProcedureCode EQ "">
				
				<cfset arguments.PriorProcedureCode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PriorProcedureCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriorProcedureCode</strong> (#PriorProcedureCode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PriorProcedureCode) GT 75>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriorProcedureCode</strong> cannot be greater than 75 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PriorProcedureCode = arguments.PriorProcedureCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriorProcedureCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ServiceDateFrom.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getServiceDateFrom" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ServiceDateFrom>
	</cffunction>
	 
	<cffunction name="setServiceDateFrom" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ServiceDateFrom" required="Yes" type="String">
		
		<cfif ServiceDateFrom NEQ "NULL" AND ServiceDateFrom NEQ "NOW">	
			
			<cfif arguments.ServiceDateFrom EQ "@@" OR arguments.ServiceDateFrom EQ "">
				
				<cfset arguments.ServiceDateFrom = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(ServiceDateFrom)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ServiceDateFrom</strong> (#ServiceDateFrom#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ServiceDateFrom = arguments.ServiceDateFrom>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ServiceDateFrom")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ServiceDateTo.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getServiceDateTo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ServiceDateTo>
	</cffunction>
	 
	<cffunction name="setServiceDateTo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ServiceDateTo" required="Yes" type="String">
		
		<cfif ServiceDateTo NEQ "NULL" AND ServiceDateTo NEQ "NOW">	
			
			<cfif arguments.ServiceDateTo EQ "@@" OR arguments.ServiceDateTo EQ "">
				
				<cfset arguments.ServiceDateTo = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(ServiceDateTo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ServiceDateTo</strong> (#ServiceDateTo#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ServiceDateTo = arguments.ServiceDateTo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ServiceDateTo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for BilledQuantity.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getBilledQuantity" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.BilledQuantity>
	</cffunction>
	 
	<cffunction name="setBilledQuantity" access="public" returntype="boolean" output="No">
 		
		<cfargument name="BilledQuantity" required="Yes" type="String">
		
		<cfif BilledQuantity NEQ "NULL">	
			
			<cfif arguments.BilledQuantity EQ "@@" OR arguments.BilledQuantity EQ "">
				
				<cfset arguments.BilledQuantity = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(BilledQuantity)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>BilledQuantity</strong> (#BilledQuantity#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.BilledQuantity = arguments.BilledQuantity>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "BilledQuantity")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for BilledAmount.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getBilledAmount" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.BilledAmount>
	</cffunction>
	 
	<cffunction name="setBilledAmount" access="public" returntype="boolean" output="No">
 		
		<cfargument name="BilledAmount" required="Yes" type="String">
		
		<cfif BilledAmount NEQ "NULL">	
			
			<cfif arguments.BilledAmount EQ "@@" OR arguments.BilledAmount EQ "">
				
				<cfset arguments.BilledAmount = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(BilledAmount)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>BilledAmount</strong> (#BilledAmount#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.BilledAmount = arguments.BilledAmount>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "BilledAmount")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PaidQuantity.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPaidQuantity" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PaidQuantity>
	</cffunction>
	 
	<cffunction name="setPaidQuantity" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PaidQuantity" required="Yes" type="String">
		
		<cfif PaidQuantity NEQ "NULL">	
			
			<cfif arguments.PaidQuantity EQ "@@" OR arguments.PaidQuantity EQ "">
				
				<cfset arguments.PaidQuantity = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(PaidQuantity)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PaidQuantity</strong> (#PaidQuantity#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PaidQuantity = arguments.PaidQuantity>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PaidQuantity")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PaidAmount.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPaidAmount" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PaidAmount>
	</cffunction>
	 
	<cffunction name="setPaidAmount" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PaidAmount" required="Yes" type="String">
		
		<cfif PaidAmount NEQ "NULL">	
			
			<cfif arguments.PaidAmount EQ "@@" OR arguments.PaidAmount EQ "">
				
				<cfset arguments.PaidAmount = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(PaidAmount)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PaidAmount</strong> (#PaidAmount#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PaidAmount = arguments.PaidAmount>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PaidAmount")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="ClaimID" required="No" type="String" default="">
		<cfargument name="ProcedureCode" required="No" type="String" default="">
		<cfargument name="PriorProcedureCode" required="No" type="String" default="">
		<cfargument name="ServiceDateFrom" required="No" type="String" default="">
		<cfargument name="ServiceDateTo" required="No" type="String" default="">
		<cfargument name="BilledQuantity" required="No" type="String" default="">
		<cfargument name="BilledAmount" required="No" type="String" default="">
		<cfargument name="PaidQuantity" required="No" type="String" default="">
		<cfargument name="PaidAmount" required="No" type="String" default="">

		<cfset variables.instance.ClaimID = arguments.ClaimID>
		<cfset variables.instance.ProcedureCode = arguments.ProcedureCode>
		<cfset variables.instance.PriorProcedureCode = arguments.PriorProcedureCode>
		<cfset variables.instance.ServiceDateFrom = arguments.ServiceDateFrom>
		<cfset variables.instance.ServiceDateTo = arguments.ServiceDateTo>
		<cfset variables.instance.BilledQuantity = arguments.BilledQuantity>
		<cfset variables.instance.BilledAmount = arguments.BilledAmount>
		<cfset variables.instance.PaidQuantity = arguments.PaidQuantity>
		<cfset variables.instance.PaidAmount = arguments.PaidAmount>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="ProcedureIO" output="No">
		
		<cfargument name="ProcedureID" required="yes" type="numeric">		
		<cfset var qGetProcedure = "">
		
		<cfset preInit(ProcedureID)>
	
		<cfquery name="qGetProcedure" datasource="#trim(request.datasource)#">
	  		SELECT ProcedureID,ClaimID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount
			FROM [Procedure]  
			WHERE ProcedureID = #trim(arguments.ProcedureID)# 
		</cfquery>
		
		<cfif qGetProcedure.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetProcedure.ProcedureID EQ "" OR qGetProcedure.ProcedureID EQ "NULL") 
				variables.instance.ProcedureID = "NULL"; 
			ELSE 
				variables.instance.ProcedureID = qGetProcedure.ProcedureID;
				
			IF(qGetProcedure.ClaimID EQ "" OR qGetProcedure.ClaimID EQ "NULL") 
				variables.instance.ClaimID = "NULL"; 
			ELSE 
				variables.instance.ClaimID = qGetProcedure.ClaimID;
				
			IF(qGetProcedure.ProcedureCode EQ "" OR qGetProcedure.ProcedureCode EQ "NULL") 
				variables.instance.ProcedureCode = "NULL"; 
			ELSE 
				variables.instance.ProcedureCode = qGetProcedure.ProcedureCode;
							
				variables.instance.PriorProcedureCode = qGetProcedure.PriorProcedureCode;
							
				variables.instance.ServiceDateFrom = qGetProcedure.ServiceDateFrom;
							
				variables.instance.ServiceDateTo = qGetProcedure.ServiceDateTo;
				
			IF(qGetProcedure.BilledQuantity EQ "" OR qGetProcedure.BilledQuantity EQ "NULL") 
				variables.instance.BilledQuantity = "NULL"; 
			ELSE 
				variables.instance.BilledQuantity = qGetProcedure.BilledQuantity;
				
			IF(qGetProcedure.BilledAmount EQ "" OR qGetProcedure.BilledAmount EQ "NULL") 
				variables.instance.BilledAmount = "NULL"; 
			ELSE 
				variables.instance.BilledAmount = qGetProcedure.BilledAmount;
				
			IF(qGetProcedure.PaidQuantity EQ "" OR qGetProcedure.PaidQuantity EQ "NULL") 
				variables.instance.PaidQuantity = "NULL"; 
			ELSE 
				variables.instance.PaidQuantity = qGetProcedure.PaidQuantity;
				
			IF(qGetProcedure.PaidAmount EQ "" OR qGetProcedure.PaidAmount EQ "NULL") 
				variables.instance.PaidAmount = "NULL"; 
			ELSE 
				variables.instance.PaidAmount = qGetProcedure.PaidAmount;
				
		</cfscript>		
		  
		<cfset postInit(ProcedureID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitProcedure = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.ProcedureID) AND variables.instance.ProcedureID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitProcedure" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitProcedure" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.ProcedureID = qInsertCommitProcedure.ProcedureID>
				
				<cfreturn qInsertCommitProcedure.ProcedureID>
			
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
			<cfset tableColumns = "ProcedureID,ClaimID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "PriorProcedureCode">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "ServiceDateFrom,ServiceDateTo">

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
				<cfset sqlStatement = "UPDATE [procedure]  SET #columnsToUpdate# WHERE ProcedureID = #trim(variables.instance.ProcedureID)#">
				
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
			<cfset stringTableColumns = "PriorProcedureCode">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "ServiceDateFrom,ServiceDateTo">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="ClaimID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO [procedure]  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS ProcedureID ">
				
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
	<cffunction name="getProcedureQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getProcedureQuery">						
		<cfargument name="Fields" required="No" type="String" default="ProcedureID,ClaimID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="ProcedureID" required="No" type="String" default="">
		<cfargument name="ProcedureID_IN" required="No" type="String" default="">
		<cfargument name="ProcedureID_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimID" required="No" type="String" default="">
		<cfargument name="ClaimID_IN" required="No" type="String" default="">
		<cfargument name="ClaimID_LIKE" required="No" type="String" default="">
		<cfargument name="ProcedureCode" required="No" type="String" default="">
		<cfargument name="ProcedureCode_IN" required="No" type="String" default="">
		<cfargument name="ProcedureCode_LIKE" required="No" type="String" default="">
		<cfargument name="PriorProcedureCode" required="No" type="String" default="">
		<cfargument name="PriorProcedureCode_IN" required="No" type="String" default="">
		<cfargument name="PriorProcedureCode_LIKE" required="No" type="String" default="">
		<cfargument name="ServiceDateFrom" required="No" type="String" default="">
		<cfargument name="ServiceDateFrom_IN" required="No" type="String" default="">
		<cfargument name="ServiceDateFrom_LIKE" required="No" type="String" default="">
		<cfargument name="ServiceDateTo" required="No" type="String" default="">
		<cfargument name="ServiceDateTo_IN" required="No" type="String" default="">
		<cfargument name="ServiceDateTo_LIKE" required="No" type="String" default="">
		<cfargument name="BilledQuantity" required="No" type="String" default="">
		<cfargument name="BilledQuantity_IN" required="No" type="String" default="">
		<cfargument name="BilledQuantity_LIKE" required="No" type="String" default="">
		<cfargument name="BilledAmount" required="No" type="String" default="">
		<cfargument name="BilledAmount_IN" required="No" type="String" default="">
		<cfargument name="BilledAmount_LIKE" required="No" type="String" default="">
		<cfargument name="PaidQuantity" required="No" type="String" default="">
		<cfargument name="PaidQuantity_IN" required="No" type="String" default="">
		<cfargument name="PaidQuantity_LIKE" required="No" type="String" default="">
		<cfargument name="PaidAmount" required="No" type="String" default="">
		<cfargument name="PaidAmount_IN" required="No" type="String" default="">
		<cfargument name="PaidAmount_LIKE" required="No" type="String" default="">

		
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
			<cfset availableColumns = "ProcedureID,ProcedureID_IN,ProcedureID_LIKE,ClaimID,ClaimID_IN,ClaimID_LIKE,ProcedureCode,ProcedureCode_IN,ProcedureCode_LIKE,PriorProcedureCode,PriorProcedureCode_IN,PriorProcedureCode_LIKE,ServiceDateFrom,ServiceDateFrom_IN,ServiceDateFrom_LIKE,ServiceDateTo,ServiceDateTo_IN,ServiceDateTo_LIKE,BilledQuantity,BilledQuantity_IN,BilledQuantity_LIKE,BilledAmount,BilledAmount_IN,BilledAmount_LIKE,PaidQuantity,PaidQuantity_IN,PaidQuantity_LIKE,PaidAmount,PaidAmount_IN,PaidAmount_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Procedure"
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
			<cfquery Name="getProcedureQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM [Procedure]   
				WHERE 1=1
					<cfif ProcedureID NEQ "" AND IsNumeric(ProcedureID)>AND ProcedureID = #ProcedureID#</cfif>
					<cfif ProcedureID_IN NEQ "">AND ProcedureID IN(#trim(ProcedureID_IN)#)</cfif>
					<cfif ProcedureID_LIKE NEQ "">AND ProcedureID LIKE '%#trim(ProcedureID_LIKE)#%'</cfif>
					<cfif ClaimID NEQ "" AND IsNumeric(ClaimID)>AND ClaimID = #ClaimID#</cfif>
					<cfif ClaimID_IN NEQ "">AND ClaimID IN(#trim(ClaimID_IN)#)</cfif>
					<cfif ClaimID_LIKE NEQ "">AND ClaimID LIKE '%#trim(ClaimID_LIKE)#%'</cfif>
					<cfif ProcedureCode NEQ "" AND IsNumeric(ProcedureCode)>AND ProcedureCode = #ProcedureCode#</cfif>
					<cfif ProcedureCode_IN NEQ "">AND ProcedureCode IN(#trim(ProcedureCode_IN)#)</cfif>
					<cfif ProcedureCode_LIKE NEQ "">AND ProcedureCode LIKE '%#trim(ProcedureCode_LIKE)#%'</cfif>
					<cfif PriorProcedureCode NEQ "">AND PriorProcedureCode = '#PriorProcedureCode#'</cfif>
					<cfif PriorProcedureCode_IN NEQ "">AND PriorProcedureCode IN(#trim(PriorProcedureCode_IN)#)</cfif>
					<cfif PriorProcedureCode_LIKE NEQ "">AND PriorProcedureCode LIKE '%#trim(PriorProcedureCode_LIKE)#%'</cfif>
					<cfif ServiceDateFrom NEQ "">AND ServiceDateFrom = '#ServiceDateFrom#'</cfif>
					<cfif ServiceDateFrom_IN NEQ "">AND ServiceDateFrom IN(#trim(ServiceDateFrom_IN)#)</cfif>
					<cfif ServiceDateFrom_LIKE NEQ "">AND ServiceDateFrom LIKE '%#trim(ServiceDateFrom_LIKE)#%'</cfif>
					<cfif ServiceDateTo NEQ "">AND ServiceDateTo = '#ServiceDateTo#'</cfif>
					<cfif ServiceDateTo_IN NEQ "">AND ServiceDateTo IN(#trim(ServiceDateTo_IN)#)</cfif>
					<cfif ServiceDateTo_LIKE NEQ "">AND ServiceDateTo LIKE '%#trim(ServiceDateTo_LIKE)#%'</cfif>
					<cfif BilledQuantity NEQ "" AND IsNumeric(BilledQuantity)>AND BilledQuantity = #BilledQuantity#</cfif>
					<cfif BilledQuantity_IN NEQ "">AND BilledQuantity IN(#trim(BilledQuantity_IN)#)</cfif>
					<cfif BilledQuantity_LIKE NEQ "">AND BilledQuantity LIKE '%#trim(BilledQuantity_LIKE)#%'</cfif>
					<cfif BilledAmount NEQ "" AND IsNumeric(BilledAmount)>AND BilledAmount = #BilledAmount#</cfif>
					<cfif BilledAmount_IN NEQ "">AND BilledAmount IN(#trim(BilledAmount_IN)#)</cfif>
					<cfif BilledAmount_LIKE NEQ "">AND BilledAmount LIKE '%#trim(BilledAmount_LIKE)#%'</cfif>
					<cfif PaidQuantity NEQ "" AND IsNumeric(PaidQuantity)>AND PaidQuantity = #PaidQuantity#</cfif>
					<cfif PaidQuantity_IN NEQ "">AND PaidQuantity IN(#trim(PaidQuantity_IN)#)</cfif>
					<cfif PaidQuantity_LIKE NEQ "">AND PaidQuantity LIKE '%#trim(PaidQuantity_LIKE)#%'</cfif>
					<cfif PaidAmount NEQ "" AND IsNumeric(PaidAmount)>AND PaidAmount = #PaidAmount#</cfif>
					<cfif PaidAmount_IN NEQ "">AND PaidAmount IN(#trim(PaidAmount_IN)#)</cfif>
					<cfif PaidAmount_LIKE NEQ "">AND PaidAmount LIKE '%#trim(PaidAmount_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getProcedureQuery>
		
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


