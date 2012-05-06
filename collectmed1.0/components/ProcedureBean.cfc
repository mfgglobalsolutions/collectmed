 	


<cfcomponent name="procedureBean" output="false" alias="procedureBean" extends="ProcedureDAO">

	<cfproperty name="ProcedureID" type="numeric" default="0" />
	<cfproperty name="ClaimID" type="numeric" default="" />
	<cfproperty name="ProcedureCode" type="numeric" default="" />
	<cfproperty name="PriorProcedureCode" type="string" default="" />
	<cfproperty name="ServiceDateFrom" type="datetime" default="" />
	<cfproperty name="ServiceDateTo" type="datetime" default="" />
	<cfproperty name="BilledQuantity" type="numeric" default="" />
	<cfproperty name="BilledAmount" type="numeric" default="" />
	<cfproperty name="PaidQuantity" type="numeric" default="" />
	<cfproperty name="PaidAmount" type="numeric" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.ProcedureID = 0;
		variables.ClaimID = "";
		variables.ProcedureCode = "";
		variables.PriorProcedureCode = "";
		variables.ServiceDateFrom = "";
		variables.ServiceDateTo = "";
		variables.BilledQuantity = "";
		variables.BilledAmount = "";
		variables.PaidQuantity = "";
		variables.PaidAmount = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedureBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ProcedureID") AND stValues.ProcedureID NEQ 0>
				<cfquery name="qGetProcedure" datasource="#trim(arguments.ds)#">
			  		SELECT ProcedureID,ClaimID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount
					FROM [Procedure]  
					WHERE ProcedureID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ProcedureID#" /> 
				</cfquery>		
				<cfif qGetProcedure.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClaimID = qGetProcedure.ClaimID;
					variables.ProcedureCode = qGetProcedure.ProcedureCode;
					variables.PriorProcedureCode = qGetProcedure.PriorProcedureCode;
					variables.ServiceDateFrom = qGetProcedure.ServiceDateFrom;
					variables.ServiceDateTo = qGetProcedure.ServiceDateTo;
					variables.BilledQuantity = qGetProcedure.BilledQuantity;
					variables.BilledAmount = qGetProcedure.BilledAmount;
					variables.PaidQuantity = qGetProcedure.PaidQuantity;
					variables.PaidAmount = qGetProcedure.PaidAmount;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimID")><cfset variables.ClaimID = stValues.ClaimID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureCode")><cfset variables.ProcedureCode = stValues.ProcedureCode /></cfif>
			<cfif StructKeyExists(stValues, "PriorProcedureCode")><cfset variables.PriorProcedureCode = stValues.PriorProcedureCode /></cfif>
			<cfif StructKeyExists(stValues, "ServiceDateFrom")><cfset variables.ServiceDateFrom = stValues.ServiceDateFrom /></cfif>
			<cfif StructKeyExists(stValues, "ServiceDateTo")><cfset variables.ServiceDateTo = stValues.ServiceDateTo /></cfif>
			<cfif StructKeyExists(stValues, "BilledQuantity")><cfset variables.BilledQuantity = stValues.BilledQuantity /></cfif>
			<cfif StructKeyExists(stValues, "BilledAmount")><cfset variables.BilledAmount = stValues.BilledAmount /></cfif>
			<cfif StructKeyExists(stValues, "PaidQuantity")><cfset variables.PaidQuantity = stValues.PaidQuantity /></cfif>
			<cfif StructKeyExists(stValues, "PaidAmount")><cfset variables.PaidAmount = stValues.PaidAmount /></cfif>		
		</cfif>
		<cfreturn this>
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
	<!--- GET and SET methods for ClaimID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimID>
	</cffunction>
	
	<cffunction name="setClaimID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimID)) OR trim(arguments.ClaimID) EQ "">
			<cfset variables.ClaimID = arguments.ClaimID />
		<cfelse>
			<cfthrow message="ClaimID (#arguments.ClaimID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProcedureCode.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedureCode" acess="public" output="false" returntype="any">
		<cfreturn variables.ProcedureCode>
	</cffunction>
	
	<cffunction name="setProcedureCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProcedureCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ProcedureCode)) OR trim(arguments.ProcedureCode) EQ "">
			<cfset variables.ProcedureCode = arguments.ProcedureCode />
		<cfelse>
			<cfthrow message="ProcedureCode (#arguments.ProcedureCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProcedureCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PriorProcedureCode.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPriorProcedureCode" acess="public" output="false" returntype="any">
		<cfreturn variables.PriorProcedureCode>
	</cffunction>
	
	<cffunction name="setPriorProcedureCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PriorProcedureCode" required="true" type="any" />
			
		<cfset variables.PriorProcedureCode = arguments.PriorProcedureCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PriorProcedureCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ServiceDateFrom.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getServiceDateFrom" acess="public" output="false" returntype="any">
		<cfreturn variables.ServiceDateFrom>
	</cffunction>
	
	<cffunction name="setServiceDateFrom" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ServiceDateFrom" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.ServiceDateFrom)) OR trim(arguments.ServiceDateFrom) EQ "">
			<cfset variables.ServiceDateFrom = arguments.ServiceDateFrom />
		<cfelse>
			<cfthrow message="ServiceDateFrom (#arguments.ServiceDateFrom#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ServiceDateFrom") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ServiceDateTo.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getServiceDateTo" acess="public" output="false" returntype="any">
		<cfreturn variables.ServiceDateTo>
	</cffunction>
	
	<cffunction name="setServiceDateTo" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ServiceDateTo" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.ServiceDateTo)) OR trim(arguments.ServiceDateTo) EQ "">
			<cfset variables.ServiceDateTo = arguments.ServiceDateTo />
		<cfelse>
			<cfthrow message="ServiceDateTo (#arguments.ServiceDateTo#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ServiceDateTo") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for BilledQuantity.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBilledQuantity" acess="public" output="false" returntype="any">
		<cfreturn variables.BilledQuantity>
	</cffunction>
	
	<cffunction name="setBilledQuantity" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BilledQuantity" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.BilledQuantity)) OR trim(arguments.BilledQuantity) EQ "">
			<cfset variables.BilledQuantity = arguments.BilledQuantity />
		<cfelse>
			<cfthrow message="BilledQuantity (#arguments.BilledQuantity#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BilledQuantity") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for BilledAmount.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBilledAmount" acess="public" output="false" returntype="any">
		<cfreturn variables.BilledAmount>
	</cffunction>
	
	<cffunction name="setBilledAmount" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BilledAmount" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.BilledAmount)) OR trim(arguments.BilledAmount) EQ "">
			<cfset variables.BilledAmount = arguments.BilledAmount />
		<cfelse>
			<cfthrow message="BilledAmount (#arguments.BilledAmount#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BilledAmount") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PaidQuantity.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPaidQuantity" acess="public" output="false" returntype="any">
		<cfreturn variables.PaidQuantity>
	</cffunction>
	
	<cffunction name="setPaidQuantity" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PaidQuantity" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PaidQuantity)) OR trim(arguments.PaidQuantity) EQ "">
			<cfset variables.PaidQuantity = arguments.PaidQuantity />
		<cfelse>
			<cfthrow message="PaidQuantity (#arguments.PaidQuantity#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PaidQuantity") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PaidAmount.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPaidAmount" acess="public" output="false" returntype="any">
		<cfreturn variables.PaidAmount>
	</cffunction>
	
	<cffunction name="setPaidAmount" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PaidAmount" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PaidAmount)) OR trim(arguments.PaidAmount) EQ "">
			<cfset variables.PaidAmount = arguments.PaidAmount />
		<cfelse>
			<cfthrow message="PaidAmount (#arguments.PaidAmount#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PaidAmount") />		
		
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


