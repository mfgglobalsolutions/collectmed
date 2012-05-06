 	


<cfcomponent name="procedureeopscodeBean" output="false" alias="procedureeopscodeBean" extends="ProcedureEOPScodeDAO">

	<cfproperty name="ClaimEOPSCodeID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="EOPSCode" type="numeric" default="" />
	<cfproperty name="Status" type="string" default="" />
	<cfproperty name="ClosingUserID" type="numeric" default="" />
	<cfproperty name="CloseDate" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.ClaimEOPSCodeID = 0;
		variables.ProcedureID = "";
		variables.EOPSCode = "";
		variables.Status = "";
		variables.ClosingUserID = "";
		variables.CloseDate = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedureeopscodeBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClaimEOPSCodeID") AND stValues.ClaimEOPSCodeID NEQ 0>
				<cfquery name="qGetProcedureEOPScode" datasource="#trim(arguments.ds)#">
			  		SELECT ClaimEOPSCodeID,ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate
					FROM ProcedureEOPScode  
					WHERE ClaimEOPSCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClaimEOPSCodeID#" /> 
				</cfquery>		
				<cfif qGetProcedureEOPScode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedureEOPScode.ProcedureID;
					variables.EOPSCode = qGetProcedureEOPScode.EOPSCode;
					variables.Status = qGetProcedureEOPScode.Status;
					variables.ClosingUserID = qGetProcedureEOPScode.ClosingUserID;
					variables.CloseDate = qGetProcedureEOPScode.CloseDate;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClaimEOPSCodeID")><cfset variables.ClaimEOPSCodeID = stValues.ClaimEOPSCodeID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "EOPSCode")><cfset variables.EOPSCode = stValues.EOPSCode /></cfif>
			<cfif StructKeyExists(stValues, "Status")><cfset variables.Status = stValues.Status /></cfif>
			<cfif StructKeyExists(stValues, "ClosingUserID")><cfset variables.ClosingUserID = stValues.ClosingUserID /></cfif>
			<cfif StructKeyExists(stValues, "CloseDate")><cfset variables.CloseDate = stValues.CloseDate /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimEOPSCodeID.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimEOPSCodeID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimEOPSCodeID>
	</cffunction>
	
	<cffunction name="setClaimEOPSCodeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimEOPSCodeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimEOPSCodeID)) OR trim(arguments.ClaimEOPSCodeID) EQ "">
			<cfset variables.ClaimEOPSCodeID = arguments.ClaimEOPSCodeID />
		<cfelse>
			<cfthrow message="ClaimEOPSCodeID (#arguments.ClaimEOPSCodeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimEOPSCodeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProcedureID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedureID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProcedureID>
	</cffunction>
	
	<cffunction name="setProcedureID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProcedureID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ProcedureID)) OR trim(arguments.ProcedureID) EQ "">
			<cfset variables.ProcedureID = arguments.ProcedureID />
		<cfelse>
			<cfthrow message="ProcedureID (#arguments.ProcedureID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProcedureID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EOPSCode.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEOPSCode" acess="public" output="false" returntype="any">
		<cfreturn variables.EOPSCode>
	</cffunction>
	
	<cffunction name="setEOPSCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EOPSCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EOPSCode)) OR trim(arguments.EOPSCode) EQ "">
			<cfset variables.EOPSCode = arguments.EOPSCode />
		<cfelse>
			<cfthrow message="EOPSCode (#arguments.EOPSCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EOPSCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Status.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStatus" acess="public" output="false" returntype="any">
		<cfreturn variables.Status>
	</cffunction>
	
	<cffunction name="setStatus" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Status" required="true" type="any" />
			
		<cfset variables.Status = arguments.Status />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Status") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClosingUserID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClosingUserID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClosingUserID>
	</cffunction>
	
	<cffunction name="setClosingUserID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClosingUserID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClosingUserID)) OR trim(arguments.ClosingUserID) EQ "">
			<cfset variables.ClosingUserID = arguments.ClosingUserID />
		<cfelse>
			<cfthrow message="ClosingUserID (#arguments.ClosingUserID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClosingUserID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CloseDate.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCloseDate" acess="public" output="false" returntype="any">
		<cfreturn variables.CloseDate>
	</cffunction>
	
	<cffunction name="setCloseDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CloseDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.CloseDate)) OR trim(arguments.CloseDate) EQ "">
			<cfset variables.CloseDate = arguments.CloseDate />
		<cfelse>
			<cfthrow message="CloseDate (#arguments.CloseDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CloseDate") />		
		
		<cfreturn true>
		
	</cffunction>
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


