 	


<cfcomponent name="eob_procedurecodeBean" output="false" alias="eob_procedurecodeBean" extends="EOB_PROCEDURECodeDAO">

	<cfproperty name="RecordID" type="numeric" default="0" />
	<cfproperty name="TOSCode" type="string" default="" />
	<cfproperty name="Code" type="string" default="" />
	<cfproperty name="Description" type="string" default="" />
	<cfproperty name="TMRMPayable" type="numeric" default="" />
	<cfproperty name="TotalRVUs" type="numeric" default="" />
	<cfproperty name="ConversionFactor" type="numeric" default="" />
	<cfproperty name="AccessBasedOrMaxFee" type="numeric" default="" />
	<cfproperty name="NoteCode" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.RecordID = 0;
		variables.TOSCode = "";
		variables.Code = "";
		variables.Description = "";
		variables.TMRMPayable = "";
		variables.TotalRVUs = "";
		variables.ConversionFactor = "";
		variables.AccessBasedOrMaxFee = "";
		variables.NoteCode = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="eob_procedurecodeBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RecordID") AND stValues.RecordID NEQ 0>
				<cfquery name="qGetEOB_PROCEDURECode" datasource="#trim(arguments.ds)#">
			  		SELECT RecordID,TOSCode,Code,Description,TMRMPayable,TotalRVUs,ConversionFactor,AccessBasedOrMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified
					FROM eob_procedurecode  
					WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RecordID#" /> 
				</cfquery>		
				<cfif qGetEOB_PROCEDURECode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.TOSCode = qGetEOB_PROCEDURECode.TOSCode;
					variables.Code = qGetEOB_PROCEDURECode.Code;
					variables.Description = qGetEOB_PROCEDURECode.Description;
					variables.TMRMPayable = qGetEOB_PROCEDURECode.TMRMPayable;
					variables.TotalRVUs = qGetEOB_PROCEDURECode.TotalRVUs;
					variables.ConversionFactor = qGetEOB_PROCEDURECode.ConversionFactor;
					variables.AccessBasedOrMaxFee = qGetEOB_PROCEDURECode.AccessBasedOrMaxFee;
					variables.NoteCode = qGetEOB_PROCEDURECode.NoteCode;
					variables.Active = qGetEOB_PROCEDURECode.Active;
					variables.InactiveCode = qGetEOB_PROCEDURECode.InactiveCode;
					variables.DateModified = qGetEOB_PROCEDURECode.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RecordID")><cfset variables.RecordID = stValues.RecordID /></cfif>
			<cfif StructKeyExists(stValues, "TOSCode")><cfset variables.TOSCode = stValues.TOSCode /></cfif>
			<cfif StructKeyExists(stValues, "Code")><cfset variables.Code = stValues.Code /></cfif>
			<cfif StructKeyExists(stValues, "Description")><cfset variables.Description = stValues.Description /></cfif>
			<cfif StructKeyExists(stValues, "TMRMPayable")><cfset variables.TMRMPayable = stValues.TMRMPayable /></cfif>
			<cfif StructKeyExists(stValues, "TotalRVUs")><cfset variables.TotalRVUs = stValues.TotalRVUs /></cfif>
			<cfif StructKeyExists(stValues, "ConversionFactor")><cfset variables.ConversionFactor = stValues.ConversionFactor /></cfif>
			<cfif StructKeyExists(stValues, "AccessBasedOrMaxFee")><cfset variables.AccessBasedOrMaxFee = stValues.AccessBasedOrMaxFee /></cfif>
			<cfif StructKeyExists(stValues, "NoteCode")><cfset variables.NoteCode = stValues.NoteCode /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RecordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.RecordID>
	</cffunction>
	
	<cffunction name="setRecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RecordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RecordID)) OR trim(arguments.RecordID) EQ "">
			<cfset variables.RecordID = arguments.RecordID />
		<cfelse>
			<cfthrow message="RecordID (#arguments.RecordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RecordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TOSCode.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTOSCode" acess="public" output="false" returntype="any">
		<cfreturn variables.TOSCode>
	</cffunction>
	
	<cffunction name="setTOSCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TOSCode" required="true" type="any" />
			
		<cfset variables.TOSCode = arguments.TOSCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TOSCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Code.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCode" acess="public" output="false" returntype="any">
		<cfreturn variables.Code>
	</cffunction>
	
	<cffunction name="setCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Code" required="true" type="any" />
			
		<cfset variables.Code = arguments.Code />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Code") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Description.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.Description>
	</cffunction>
	
	<cffunction name="setDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Description" required="true" type="any" />
			
		<cfset variables.Description = arguments.Description />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Description") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TMRMPayable.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTMRMPayable" acess="public" output="false" returntype="any">
		<cfreturn variables.TMRMPayable>
	</cffunction>
	
	<cffunction name="setTMRMPayable" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TMRMPayable" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.TMRMPayable)) OR trim(arguments.TMRMPayable) EQ "">
			<cfset variables.TMRMPayable = arguments.TMRMPayable />
		<cfelse>
			<cfthrow message="TMRMPayable (#arguments.TMRMPayable#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TMRMPayable") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TotalRVUs.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTotalRVUs" acess="public" output="false" returntype="any">
		<cfreturn variables.TotalRVUs>
	</cffunction>
	
	<cffunction name="setTotalRVUs" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TotalRVUs" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.TotalRVUs)) OR trim(arguments.TotalRVUs) EQ "">
			<cfset variables.TotalRVUs = arguments.TotalRVUs />
		<cfelse>
			<cfthrow message="TotalRVUs (#arguments.TotalRVUs#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TotalRVUs") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ConversionFactor.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getConversionFactor" acess="public" output="false" returntype="any">
		<cfreturn variables.ConversionFactor>
	</cffunction>
	
	<cffunction name="setConversionFactor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ConversionFactor" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ConversionFactor)) OR trim(arguments.ConversionFactor) EQ "">
			<cfset variables.ConversionFactor = arguments.ConversionFactor />
		<cfelse>
			<cfthrow message="ConversionFactor (#arguments.ConversionFactor#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ConversionFactor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AccessBasedOrMaxFee.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAccessBasedOrMaxFee" acess="public" output="false" returntype="any">
		<cfreturn variables.AccessBasedOrMaxFee>
	</cffunction>
	
	<cffunction name="setAccessBasedOrMaxFee" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AccessBasedOrMaxFee" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AccessBasedOrMaxFee)) OR trim(arguments.AccessBasedOrMaxFee) EQ "">
			<cfset variables.AccessBasedOrMaxFee = arguments.AccessBasedOrMaxFee />
		<cfelse>
			<cfthrow message="AccessBasedOrMaxFee (#arguments.AccessBasedOrMaxFee#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AccessBasedOrMaxFee") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for NoteCode.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getNoteCode" acess="public" output="false" returntype="any">
		<cfreturn variables.NoteCode>
	</cffunction>
	
	<cffunction name="setNoteCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="NoteCode" required="true" type="any" />
			
		<cfset variables.NoteCode = arguments.NoteCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "NoteCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
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



