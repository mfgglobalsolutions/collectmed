 	


<cfcomponent name="debugBean" output="false" alias="debugBean" extends="DebugDAO">

	<cfproperty name="DebugID" type="numeric" default="0" />
	<cfproperty name="referenceID" type="string" default="" />
	<cfproperty name="Note" type="string" default="" />
	<cfproperty name="TS" type="datetime" default="" />
	<cfproperty name="tesst" type="numeric" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.DebugID = 0;
		variables.referenceID = "";
		variables.Note = "";
		variables.TS = "";
		variables.tesst = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="debugBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "DebugID") AND stValues.DebugID NEQ 0>
				<cfquery name="qGetDebug" datasource="#trim(arguments.ds)#">
			  		SELECT DebugID,referenceID,Note,TS,tesst
					FROM Debug  
					WHERE DebugID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.DebugID#" /> 
				</cfquery>		
				<cfif qGetDebug.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.referenceID = qGetDebug.referenceID;
					variables.Note = qGetDebug.Note;
					variables.TS = qGetDebug.TS;
					variables.tesst = qGetDebug.tesst;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "DebugID")><cfset variables.DebugID = stValues.DebugID /></cfif>
			<cfif StructKeyExists(stValues, "referenceID")><cfset variables.referenceID = stValues.referenceID /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>
			<cfif StructKeyExists(stValues, "TS")><cfset variables.TS = stValues.TS /></cfif>
			<cfif StructKeyExists(stValues, "tesst")><cfset variables.tesst = stValues.tesst /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DebugID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDebugID" acess="public" output="false" returntype="any">
		<cfreturn variables.DebugID>
	</cffunction>
	
	<cffunction name="setDebugID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DebugID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.DebugID)) OR trim(arguments.DebugID) EQ "">
			<cfset variables.DebugID = arguments.DebugID />
		<cfelse>
			<cfthrow message="DebugID (#arguments.DebugID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DebugID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for referenceID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getreferenceID" acess="public" output="false" returntype="any">
		<cfreturn variables.referenceID>
	</cffunction>
	
	<cffunction name="setreferenceID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="referenceID" required="true" type="any" />
			
		<cfset variables.referenceID = arguments.referenceID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "referenceID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Note.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getNote" acess="public" output="false" returntype="any">
		<cfreturn variables.Note>
	</cffunction>
	
	<cffunction name="setNote" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Note" required="true" type="any" />
			
		<cfset variables.Note = arguments.Note />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Note") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TS.                                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTS" acess="public" output="false" returntype="any">
		<cfreturn variables.TS>
	</cffunction>
	
	<cffunction name="setTS" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TS" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.TS)) OR trim(arguments.TS) EQ "">
			<cfset variables.TS = arguments.TS />
		<cfelse>
			<cfthrow message="TS (#arguments.TS#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TS") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for tesst.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gettesst" acess="public" output="false" returntype="any">
		<cfreturn variables.tesst>
	</cffunction>
	
	<cffunction name="settesst" acess="public" output="false" returntype="boolean">
		
		<cfargument name="tesst" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.tesst)) OR trim(arguments.tesst) EQ "">
			<cfset variables.tesst = arguments.tesst />
		<cfelse>
			<cfthrow message="tesst (#arguments.tesst#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "tesst") />		
		
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


