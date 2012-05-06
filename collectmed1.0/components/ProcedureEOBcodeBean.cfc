 	


<cfcomponent name="procedureeobcodeBean" output="false" alias="procedureeobcodeBean" extends="ProcedureEOBcodeDAO">

	<cfproperty name="ClaimEOBCodeID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="EOBCode" type="numeric" default="" />
	<cfproperty name="Status" type="string" default="" />
	<cfproperty name="ClosingUserID" type="numeric" default="" />
	<cfproperty name="CloseDate" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.ClaimEOBCodeID = 0;
		variables.ProcedureID = "";
		variables.EOBCode = "";
		variables.Status = "";
		variables.ClosingUserID = "";
		variables.CloseDate = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedureeobcodeBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClaimEOBCodeID") AND stValues.ClaimEOBCodeID NEQ 0>
				<cfquery name="qGetProcedureEOBcode" datasource="#trim(arguments.ds)#">
			  		SELECT ClaimEOBCodeID,ProcedureID,EOBCode,Status,ClosingUserID,CloseDate
					FROM ProcedureEOBcode  
					WHERE ClaimEOBCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClaimEOBCodeID#" /> 
				</cfquery>		
				<cfif qGetProcedureEOBcode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedureEOBcode.ProcedureID;
					variables.EOBCode = qGetProcedureEOBcode.EOBCode;
					variables.Status = qGetProcedureEOBcode.Status;
					variables.ClosingUserID = qGetProcedureEOBcode.ClosingUserID;
					variables.CloseDate = qGetProcedureEOBcode.CloseDate;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClaimEOBCodeID")><cfset variables.ClaimEOBCodeID = stValues.ClaimEOBCodeID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "EOBCode")><cfset variables.EOBCode = stValues.EOBCode /></cfif>
			<cfif StructKeyExists(stValues, "Status")><cfset variables.Status = stValues.Status /></cfif>
			<cfif StructKeyExists(stValues, "ClosingUserID")><cfset variables.ClosingUserID = stValues.ClosingUserID /></cfif>
			<cfif StructKeyExists(stValues, "CloseDate")><cfset variables.CloseDate = stValues.CloseDate /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimEOBCodeID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimEOBCodeID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimEOBCodeID>
	</cffunction>
	
	<cffunction name="setClaimEOBCodeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimEOBCodeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimEOBCodeID)) OR trim(arguments.ClaimEOBCodeID) EQ "">
			<cfset variables.ClaimEOBCodeID = arguments.ClaimEOBCodeID />
		<cfelse>
			<cfthrow message="ClaimEOBCodeID (#arguments.ClaimEOBCodeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimEOBCodeID") />		
		
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
	<!--- GET and SET methods for EOBCode.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEOBCode" acess="public" output="false" returntype="any">
		<cfreturn variables.EOBCode>
	</cffunction>
	
	<cffunction name="setEOBCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EOBCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EOBCode)) OR trim(arguments.EOBCode) EQ "">
			<cfset variables.EOBCode = arguments.EOBCode />
		<cfelse>
			<cfthrow message="EOBCode (#arguments.EOBCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EOBCode") />		
		
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


