 	


<cfcomponent name="interchangeBean" output="false" alias="interchangeBean" extends="InterchangeDAO">

	<cfproperty name="InterchangeID" type="numeric" default="0" />
	<cfproperty name="FileID" type="numeric" default="" />
	<cfproperty name="InterchangeFileID" type="string" default="" />
	<cfproperty name="InterchangeDate" type="datetime" default="" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="InterchangeClientName" type="string" default="" />
	<cfproperty name="InterchangeClientAddressLine1" type="string" default="" />
	<cfproperty name="InterchangeClientAddressLine2" type="string" default="" />
	<cfproperty name="InterchangeClientCity" type="string" default="" />
	<cfproperty name="InterchangeClientState" type="string" default="" />
	<cfproperty name="InterchangeClientZipcode" type="string" default="" />
	<cfproperty name="LXAssignedNumber" type="string" default="" />
	<cfproperty name="ReassociationTraceNumber" type="string" default="" />
	<cfproperty name="InterchangeSenderIDQualifier" type="string" default="" />
	<cfproperty name="InterchangeSenderID" type="string" default="" />
	<cfproperty name="InterchangeReceiverIDQualifier" type="string" default="" />
	<cfproperty name="InterchangeReceiverID" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.InterchangeID = 0;
		variables.FileID = "";
		variables.InterchangeFileID = "";
		variables.InterchangeDate = "";
		variables.ClientID = "";
		variables.InterchangeClientName = "";
		variables.InterchangeClientAddressLine1 = "";
		variables.InterchangeClientAddressLine2 = "";
		variables.InterchangeClientCity = "";
		variables.InterchangeClientState = "";
		variables.InterchangeClientZipcode = "";
		variables.LXAssignedNumber = "";
		variables.ReassociationTraceNumber = "";
		variables.InterchangeSenderIDQualifier = "";
		variables.InterchangeSenderID = "";
		variables.InterchangeReceiverIDQualifier = "";
		variables.InterchangeReceiverID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="interchangeBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "InterchangeID") AND stValues.InterchangeID NEQ 0>
				<cfquery name="qGetInterchange" datasource="#trim(arguments.ds)#">
			  		SELECT InterchangeID,FileID,InterchangeFileID,InterchangeDate,ClientID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active,InactiveCode,DateCreated
					FROM Interchange  
					WHERE InterchangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.InterchangeID#" /> 
				</cfquery>		
				<cfif qGetInterchange.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.FileID = qGetInterchange.FileID;
					variables.InterchangeFileID = qGetInterchange.InterchangeFileID;
					variables.InterchangeDate = qGetInterchange.InterchangeDate;
					variables.ClientID = qGetInterchange.ClientID;
					variables.InterchangeClientName = qGetInterchange.InterchangeClientName;
					variables.InterchangeClientAddressLine1 = qGetInterchange.InterchangeClientAddressLine1;
					variables.InterchangeClientAddressLine2 = qGetInterchange.InterchangeClientAddressLine2;
					variables.InterchangeClientCity = qGetInterchange.InterchangeClientCity;
					variables.InterchangeClientState = qGetInterchange.InterchangeClientState;
					variables.InterchangeClientZipcode = qGetInterchange.InterchangeClientZipcode;
					variables.LXAssignedNumber = qGetInterchange.LXAssignedNumber;
					variables.ReassociationTraceNumber = qGetInterchange.ReassociationTraceNumber;
					variables.InterchangeSenderIDQualifier = qGetInterchange.InterchangeSenderIDQualifier;
					variables.InterchangeSenderID = qGetInterchange.InterchangeSenderID;
					variables.InterchangeReceiverIDQualifier = qGetInterchange.InterchangeReceiverIDQualifier;
					variables.InterchangeReceiverID = qGetInterchange.InterchangeReceiverID;
					variables.Active = qGetInterchange.Active;
					variables.InactiveCode = qGetInterchange.InactiveCode;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "InterchangeID")><cfset variables.InterchangeID = stValues.InterchangeID /></cfif>
			<cfif StructKeyExists(stValues, "FileID")><cfset variables.FileID = stValues.FileID /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeFileID")><cfset variables.InterchangeFileID = stValues.InterchangeFileID /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeDate")><cfset variables.InterchangeDate = stValues.InterchangeDate /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeClientName")><cfset variables.InterchangeClientName = stValues.InterchangeClientName /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeClientAddressLine1")><cfset variables.InterchangeClientAddressLine1 = stValues.InterchangeClientAddressLine1 /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeClientAddressLine2")><cfset variables.InterchangeClientAddressLine2 = stValues.InterchangeClientAddressLine2 /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeClientCity")><cfset variables.InterchangeClientCity = stValues.InterchangeClientCity /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeClientState")><cfset variables.InterchangeClientState = stValues.InterchangeClientState /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeClientZipcode")><cfset variables.InterchangeClientZipcode = stValues.InterchangeClientZipcode /></cfif>
			<cfif StructKeyExists(stValues, "LXAssignedNumber")><cfset variables.LXAssignedNumber = stValues.LXAssignedNumber /></cfif>
			<cfif StructKeyExists(stValues, "ReassociationTraceNumber")><cfset variables.ReassociationTraceNumber = stValues.ReassociationTraceNumber /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeSenderIDQualifier")><cfset variables.InterchangeSenderIDQualifier = stValues.InterchangeSenderIDQualifier /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeSenderID")><cfset variables.InterchangeSenderID = stValues.InterchangeSenderID /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeReceiverIDQualifier")><cfset variables.InterchangeReceiverIDQualifier = stValues.InterchangeReceiverIDQualifier /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeReceiverID")><cfset variables.InterchangeReceiverID = stValues.InterchangeReceiverID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeID" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeID>
	</cffunction>
	
	<cffunction name="setInterchangeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InterchangeID)) OR trim(arguments.InterchangeID) EQ "">
			<cfset variables.InterchangeID = arguments.InterchangeID />
		<cfelse>
			<cfthrow message="InterchangeID (#arguments.InterchangeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileID" acess="public" output="false" returntype="any">
		<cfreturn variables.FileID>
	</cffunction>
	
	<cffunction name="setFileID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.FileID)) OR trim(arguments.FileID) EQ "">
			<cfset variables.FileID = arguments.FileID />
		<cfelse>
			<cfthrow message="FileID (#arguments.FileID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeFileID.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeFileID" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeFileID>
	</cffunction>
	
	<cffunction name="setInterchangeFileID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeFileID" required="true" type="any" />
			
		<cfset variables.InterchangeFileID = arguments.InterchangeFileID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeFileID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeDate.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeDate" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeDate>
	</cffunction>
	
	<cffunction name="setInterchangeDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.InterchangeDate)) OR trim(arguments.InterchangeDate) EQ "">
			<cfset variables.InterchangeDate = arguments.InterchangeDate />
		<cfelse>
			<cfthrow message="InterchangeDate (#arguments.InterchangeDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeClientName.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeClientName" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeClientName>
	</cffunction>
	
	<cffunction name="setInterchangeClientName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeClientName" required="true" type="any" />
			
		<cfset variables.InterchangeClientName = arguments.InterchangeClientName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeClientName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeClientAddressLine1.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeClientAddressLine1" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeClientAddressLine1>
	</cffunction>
	
	<cffunction name="setInterchangeClientAddressLine1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeClientAddressLine1" required="true" type="any" />
			
		<cfset variables.InterchangeClientAddressLine1 = arguments.InterchangeClientAddressLine1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeClientAddressLine1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeClientAddressLine2.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeClientAddressLine2" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeClientAddressLine2>
	</cffunction>
	
	<cffunction name="setInterchangeClientAddressLine2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeClientAddressLine2" required="true" type="any" />
			
		<cfset variables.InterchangeClientAddressLine2 = arguments.InterchangeClientAddressLine2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeClientAddressLine2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeClientCity.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeClientCity" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeClientCity>
	</cffunction>
	
	<cffunction name="setInterchangeClientCity" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeClientCity" required="true" type="any" />
			
		<cfset variables.InterchangeClientCity = arguments.InterchangeClientCity />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeClientCity") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeClientState.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeClientState" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeClientState>
	</cffunction>
	
	<cffunction name="setInterchangeClientState" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeClientState" required="true" type="any" />
			
		<cfset variables.InterchangeClientState = arguments.InterchangeClientState />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeClientState") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeClientZipcode.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeClientZipcode" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeClientZipcode>
	</cffunction>
	
	<cffunction name="setInterchangeClientZipcode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeClientZipcode" required="true" type="any" />
			
		<cfset variables.InterchangeClientZipcode = arguments.InterchangeClientZipcode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeClientZipcode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LXAssignedNumber.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLXAssignedNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.LXAssignedNumber>
	</cffunction>
	
	<cffunction name="setLXAssignedNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LXAssignedNumber" required="true" type="any" />
			
		<cfset variables.LXAssignedNumber = arguments.LXAssignedNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LXAssignedNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ReassociationTraceNumber.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getReassociationTraceNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.ReassociationTraceNumber>
	</cffunction>
	
	<cffunction name="setReassociationTraceNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ReassociationTraceNumber" required="true" type="any" />
			
		<cfset variables.ReassociationTraceNumber = arguments.ReassociationTraceNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ReassociationTraceNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeSenderIDQualifier.                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeSenderIDQualifier" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeSenderIDQualifier>
	</cffunction>
	
	<cffunction name="setInterchangeSenderIDQualifier" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeSenderIDQualifier" required="true" type="any" />
			
		<cfset variables.InterchangeSenderIDQualifier = arguments.InterchangeSenderIDQualifier />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeSenderIDQualifier") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeSenderID.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeSenderID" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeSenderID>
	</cffunction>
	
	<cffunction name="setInterchangeSenderID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeSenderID" required="true" type="any" />
			
		<cfset variables.InterchangeSenderID = arguments.InterchangeSenderID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeSenderID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeReceiverIDQualifier.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeReceiverIDQualifier" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeReceiverIDQualifier>
	</cffunction>
	
	<cffunction name="setInterchangeReceiverIDQualifier" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeReceiverIDQualifier" required="true" type="any" />
			
		<cfset variables.InterchangeReceiverIDQualifier = arguments.InterchangeReceiverIDQualifier />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeReceiverIDQualifier") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeReceiverID.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeReceiverID" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeReceiverID>
	</cffunction>
	
	<cffunction name="setInterchangeReceiverID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeReceiverID" required="true" type="any" />
			
		<cfset variables.InterchangeReceiverID = arguments.InterchangeReceiverID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeReceiverID") />		
		
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


