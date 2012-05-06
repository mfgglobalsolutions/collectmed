 	


<cfcomponent name="claimBean" output="false" alias="claimBean" extends="ClaimDAO">

	<cfproperty name="ClaimID" type="numeric" default="0" />
	<cfproperty name="InterchangeClaimID" type="string" default="" />
	<cfproperty name="ClientAssignedClaimID" type="string" default="" />
	<cfproperty name="InterchangeID" type="numeric" default="" />
	<cfproperty name="ProviderID" type="string" default="" />
	<cfproperty name="ClaimType" type="numeric" default="" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="HICNumber" type="string" default="" />
	<cfproperty name="ClaimStatusCode" type="numeric" default="" />
	<cfproperty name="StatusID" type="numeric" default="" />
	<cfproperty name="ClaimPreviousPaidAmount" type="numeric" default="" />
	<cfproperty name="ClaimPaidAmount" type="numeric" default="" />
	<cfproperty name="PatientResponsibilityAmount" type="numeric" default="" />
	<cfproperty name="AssignedToUserID" type="numeric" default="" />
	<cfproperty name="DueDate" type="datetime" default="" />
	<cfproperty name="FacilityCode" type="string" default="" />
	<cfproperty name="CrossoverEntityTypeQualifier2" type="string" default="" />
	<cfproperty name="CrossoverNameLastorOrganizationName3" type="string" default="" />
	<cfproperty name="CrossoverIdentificationCode9" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.ClaimID = 0;
		variables.InterchangeClaimID = "";
		variables.ClientAssignedClaimID = "";
		variables.InterchangeID = "";
		variables.ProviderID = "";
		variables.ClaimType = "";
		variables.ClientID = "";
		variables.EntityID = "";
		variables.HICNumber = "";
		variables.ClaimStatusCode = "";
		variables.StatusID = "";
		variables.ClaimPreviousPaidAmount = "";
		variables.ClaimPaidAmount = "";
		variables.PatientResponsibilityAmount = "";
		variables.AssignedToUserID = "";
		variables.DueDate = "";
		variables.FacilityCode = "";
		variables.CrossoverEntityTypeQualifier2 = "";
		variables.CrossoverNameLastorOrganizationName3 = "";
		variables.CrossoverIdentificationCode9 = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="claimBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClaimID") AND stValues.ClaimID NEQ 0>
				<cfquery name="qGetClaim" datasource="#trim(arguments.ds)#">
			  		SELECT ClaimID,InterchangeClaimID,ClientAssignedClaimID,InterchangeID,ProviderID,ClaimType,ClientID,EntityID,HICNumber,ClaimStatusCode,StatusID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active,InactiveCode,DateCreated
					FROM Claim  
					WHERE ClaimID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClaimID#" /> 
				</cfquery>		
				<cfif qGetClaim.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.InterchangeClaimID = qGetClaim.InterchangeClaimID;
					variables.ClientAssignedClaimID = qGetClaim.ClientAssignedClaimID;
					variables.InterchangeID = qGetClaim.InterchangeID;
					variables.ProviderID = qGetClaim.ProviderID;
					variables.ClaimType = qGetClaim.ClaimType;
					variables.ClientID = qGetClaim.ClientID;
					variables.EntityID = qGetClaim.EntityID;
					variables.HICNumber = qGetClaim.HICNumber;
					variables.ClaimStatusCode = qGetClaim.ClaimStatusCode;
					variables.StatusID = qGetClaim.StatusID;
					variables.ClaimPreviousPaidAmount = qGetClaim.ClaimPreviousPaidAmount;
					variables.ClaimPaidAmount = qGetClaim.ClaimPaidAmount;
					variables.PatientResponsibilityAmount = qGetClaim.PatientResponsibilityAmount;
					variables.AssignedToUserID = qGetClaim.AssignedToUserID;
					variables.DueDate = qGetClaim.DueDate;
					variables.FacilityCode = qGetClaim.FacilityCode;
					variables.CrossoverEntityTypeQualifier2 = qGetClaim.CrossoverEntityTypeQualifier2;
					variables.CrossoverNameLastorOrganizationName3 = qGetClaim.CrossoverNameLastorOrganizationName3;
					variables.CrossoverIdentificationCode9 = qGetClaim.CrossoverIdentificationCode9;
					variables.Active = qGetClaim.Active;
					variables.InactiveCode = qGetClaim.InactiveCode;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClaimID")><cfset variables.ClaimID = stValues.ClaimID /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeClaimID")><cfset variables.InterchangeClaimID = stValues.InterchangeClaimID /></cfif>
			<cfif StructKeyExists(stValues, "ClientAssignedClaimID")><cfset variables.ClientAssignedClaimID = stValues.ClientAssignedClaimID /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeID")><cfset variables.InterchangeID = stValues.InterchangeID /></cfif>
			<cfif StructKeyExists(stValues, "ProviderID")><cfset variables.ProviderID = stValues.ProviderID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimType")><cfset variables.ClaimType = stValues.ClaimType /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "HICNumber")><cfset variables.HICNumber = stValues.HICNumber /></cfif>
			<cfif StructKeyExists(stValues, "ClaimStatusCode")><cfset variables.ClaimStatusCode = stValues.ClaimStatusCode /></cfif>
			<cfif StructKeyExists(stValues, "StatusID")><cfset variables.StatusID = stValues.StatusID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimPreviousPaidAmount")><cfset variables.ClaimPreviousPaidAmount = stValues.ClaimPreviousPaidAmount /></cfif>
			<cfif StructKeyExists(stValues, "ClaimPaidAmount")><cfset variables.ClaimPaidAmount = stValues.ClaimPaidAmount /></cfif>
			<cfif StructKeyExists(stValues, "PatientResponsibilityAmount")><cfset variables.PatientResponsibilityAmount = stValues.PatientResponsibilityAmount /></cfif>
			<cfif StructKeyExists(stValues, "AssignedToUserID")><cfset variables.AssignedToUserID = stValues.AssignedToUserID /></cfif>
			<cfif StructKeyExists(stValues, "DueDate")><cfset variables.DueDate = stValues.DueDate /></cfif>
			<cfif StructKeyExists(stValues, "FacilityCode")><cfset variables.FacilityCode = stValues.FacilityCode /></cfif>
			<cfif StructKeyExists(stValues, "CrossoverEntityTypeQualifier2")><cfset variables.CrossoverEntityTypeQualifier2 = stValues.CrossoverEntityTypeQualifier2 /></cfif>
			<cfif StructKeyExists(stValues, "CrossoverNameLastorOrganizationName3")><cfset variables.CrossoverNameLastorOrganizationName3 = stValues.CrossoverNameLastorOrganizationName3 /></cfif>
			<cfif StructKeyExists(stValues, "CrossoverIdentificationCode9")><cfset variables.CrossoverIdentificationCode9 = stValues.CrossoverIdentificationCode9 /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>		
		</cfif>
		<cfreturn this>
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
	<!--- GET and SET methods for InterchangeClaimID.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeClaimID" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeClaimID>
	</cffunction>
	
	<cffunction name="setInterchangeClaimID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeClaimID" required="true" type="any" />
			
		<cfset variables.InterchangeClaimID = arguments.InterchangeClaimID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeClaimID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientAssignedClaimID.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientAssignedClaimID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientAssignedClaimID>
	</cffunction>
	
	<cffunction name="setClientAssignedClaimID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientAssignedClaimID" required="true" type="any" />
			
		<cfset variables.ClientAssignedClaimID = arguments.ClientAssignedClaimID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientAssignedClaimID") />		
		
		<cfreturn true>
		
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
	<!--- GET and SET methods for ProviderID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProviderID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProviderID>
	</cffunction>
	
	<cffunction name="setProviderID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProviderID" required="true" type="any" />
			
		<cfset variables.ProviderID = arguments.ProviderID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProviderID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimType.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimType" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimType>
	</cffunction>
	
	<cffunction name="setClaimType" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimType" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimType)) OR trim(arguments.ClaimType) EQ "">
			<cfset variables.ClaimType = arguments.ClaimType />
		<cfelse>
			<cfthrow message="ClaimType (#arguments.ClaimType#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimType") />		
		
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
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HICNumber.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHICNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.HICNumber>
	</cffunction>
	
	<cffunction name="setHICNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HICNumber" required="true" type="any" />
			
		<cfset variables.HICNumber = arguments.HICNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HICNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimStatusCode.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimStatusCode" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimStatusCode>
	</cffunction>
	
	<cffunction name="setClaimStatusCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimStatusCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimStatusCode)) OR trim(arguments.ClaimStatusCode) EQ "">
			<cfset variables.ClaimStatusCode = arguments.ClaimStatusCode />
		<cfelse>
			<cfthrow message="ClaimStatusCode (#arguments.ClaimStatusCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimStatusCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for StatusID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStatusID" acess="public" output="false" returntype="any">
		<cfreturn variables.StatusID>
	</cffunction>
	
	<cffunction name="setStatusID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="StatusID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.StatusID)) OR trim(arguments.StatusID) EQ "">
			<cfset variables.StatusID = arguments.StatusID />
		<cfelse>
			<cfthrow message="StatusID (#arguments.StatusID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "StatusID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimPreviousPaidAmount.                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimPreviousPaidAmount" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimPreviousPaidAmount>
	</cffunction>
	
	<cffunction name="setClaimPreviousPaidAmount" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimPreviousPaidAmount" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimPreviousPaidAmount)) OR trim(arguments.ClaimPreviousPaidAmount) EQ "">
			<cfset variables.ClaimPreviousPaidAmount = arguments.ClaimPreviousPaidAmount />
		<cfelse>
			<cfthrow message="ClaimPreviousPaidAmount (#arguments.ClaimPreviousPaidAmount#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimPreviousPaidAmount") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimPaidAmount.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimPaidAmount" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimPaidAmount>
	</cffunction>
	
	<cffunction name="setClaimPaidAmount" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimPaidAmount" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimPaidAmount)) OR trim(arguments.ClaimPaidAmount) EQ "">
			<cfset variables.ClaimPaidAmount = arguments.ClaimPaidAmount />
		<cfelse>
			<cfthrow message="ClaimPaidAmount (#arguments.ClaimPaidAmount#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimPaidAmount") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PatientResponsibilityAmount.                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPatientResponsibilityAmount" acess="public" output="false" returntype="any">
		<cfreturn variables.PatientResponsibilityAmount>
	</cffunction>
	
	<cffunction name="setPatientResponsibilityAmount" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PatientResponsibilityAmount" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PatientResponsibilityAmount)) OR trim(arguments.PatientResponsibilityAmount) EQ "">
			<cfset variables.PatientResponsibilityAmount = arguments.PatientResponsibilityAmount />
		<cfelse>
			<cfthrow message="PatientResponsibilityAmount (#arguments.PatientResponsibilityAmount#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PatientResponsibilityAmount") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AssignedToUserID.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAssignedToUserID" acess="public" output="false" returntype="any">
		<cfreturn variables.AssignedToUserID>
	</cffunction>
	
	<cffunction name="setAssignedToUserID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AssignedToUserID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AssignedToUserID)) OR trim(arguments.AssignedToUserID) EQ "">
			<cfset variables.AssignedToUserID = arguments.AssignedToUserID />
		<cfelse>
			<cfthrow message="AssignedToUserID (#arguments.AssignedToUserID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AssignedToUserID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DueDate.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDueDate" acess="public" output="false" returntype="any">
		<cfreturn variables.DueDate>
	</cffunction>
	
	<cffunction name="setDueDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DueDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DueDate)) OR trim(arguments.DueDate) EQ "">
			<cfset variables.DueDate = arguments.DueDate />
		<cfelse>
			<cfthrow message="DueDate (#arguments.DueDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DueDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FacilityCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFacilityCode" acess="public" output="false" returntype="any">
		<cfreturn variables.FacilityCode>
	</cffunction>
	
	<cffunction name="setFacilityCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FacilityCode" required="true" type="any" />
			
		<cfset variables.FacilityCode = arguments.FacilityCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FacilityCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CrossoverEntityTypeQualifier2.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCrossoverEntityTypeQualifier2" acess="public" output="false" returntype="any">
		<cfreturn variables.CrossoverEntityTypeQualifier2>
	</cffunction>
	
	<cffunction name="setCrossoverEntityTypeQualifier2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CrossoverEntityTypeQualifier2" required="true" type="any" />
			
		<cfset variables.CrossoverEntityTypeQualifier2 = arguments.CrossoverEntityTypeQualifier2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CrossoverEntityTypeQualifier2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CrossoverNameLastorOrganizationName3.                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCrossoverNameLastorOrganizationName3" acess="public" output="false" returntype="any">
		<cfreturn variables.CrossoverNameLastorOrganizationName3>
	</cffunction>
	
	<cffunction name="setCrossoverNameLastorOrganizationName3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CrossoverNameLastorOrganizationName3" required="true" type="any" />
			
		<cfset variables.CrossoverNameLastorOrganizationName3 = arguments.CrossoverNameLastorOrganizationName3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CrossoverNameLastorOrganizationName3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CrossoverIdentificationCode9.                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCrossoverIdentificationCode9" acess="public" output="false" returntype="any">
		<cfreturn variables.CrossoverIdentificationCode9>
	</cffunction>
	
	<cffunction name="setCrossoverIdentificationCode9" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CrossoverIdentificationCode9" required="true" type="any" />
			
		<cfset variables.CrossoverIdentificationCode9 = arguments.CrossoverIdentificationCode9 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CrossoverIdentificationCode9") />		
		
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


