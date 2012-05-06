 	


<cfcomponent name="quoteBean" output="false" alias="quoteBean" extends="QuoteDAO">

	<cfproperty name="QuoteID" type="numeric" default="0" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="AssignedToUserID" type="numeric" default="" />
	<cfproperty name="hidden_UsersID" type="string" default="" />
	<cfproperty name="hidden_TimeStart" type="string" default="" />
	<cfproperty name="callerFNameTBox" type="string" default="" />
	<cfproperty name="callerMInitialTBox" type="string" default="" />
	<cfproperty name="callerLNameTBox" type="string" default="" />
	<cfproperty name="callerPhoneTBox" type="string" default="" />
	<cfproperty name="patientFNameTBox" type="string" default="" />
	<cfproperty name="patientMInitialTBox" type="string" default="" />
	<cfproperty name="patientLNameTBox" type="string" default="" />
	<cfproperty name="roomNumberTBox" type="string" default="" />
	<cfproperty name="bedNumberTBox" type="string" default="" />
	<cfproperty name="patientAddressTBox" type="string" default="" />
	<cfproperty name="patientCityTBox" type="string" default="" />
	<cfproperty name="patientStateTBox" type="string" default="" />
	<cfproperty name="patientZipTBox" type="string" default="" />
	<cfproperty name="patientPhoneTBox" type="string" default="" />
	<cfproperty name="patientDOBMM" type="string" default="" />
	<cfproperty name="patientDOBDD" type="string" default="" />
	<cfproperty name="patientDOBYY" type="string" default="" />
	<cfproperty name="OPTION_3a_CBox_PatientSexMale" type="string" default="" />
	<cfproperty name="OPTION_3a_CBox_PatientSexFemale" type="string" default="" />
	<cfproperty name="patientSSNTBox" type="string" default="" />
	<cfproperty name="patientHeightFeet" type="string" default="" />
	<cfproperty name="patientHeightInches" type="string" default="" />
	<cfproperty name="patientWeightTBox" type="string" default="" />
	<cfproperty name="alternateContactFNameTBox" type="string" default="" />
	<cfproperty name="alternateContactMInitialTBox" type="string" default="" />
	<cfproperty name="alternateContactLNameTBox" type="string" default="" />
	<cfproperty name="alternateContactRelationshipTBox" type="string" default="" />
	<cfproperty name="alternateContactPhoneTBox" type="string" default="" />
	<cfproperty name="alternateContactWorkPhoneTBox" type="string" default="" />
	<cfproperty name="primaryInsuranceNameTBox" type="string" default="" />
	<cfproperty name="secondaryInsuranceNameTBox" type="string" default="" />
	<cfproperty name="primaryPolicyNumberTBox" type="string" default="" />
	<cfproperty name="secondaryPolicyNumberTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianFNameTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianMInitialTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianLNameTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianPhoneTBox" type="string" default="" />
	<cfproperty name="printed" type="string" default="" />
	<cfproperty name="Cancelled" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.QuoteID = 0;
		variables.ClientID = "";
		variables.AssignedToUserID = "";
		variables.hidden_UsersID = "";
		variables.hidden_TimeStart = "";
		variables.callerFNameTBox = "";
		variables.callerMInitialTBox = "";
		variables.callerLNameTBox = "";
		variables.callerPhoneTBox = "";
		variables.patientFNameTBox = "";
		variables.patientMInitialTBox = "";
		variables.patientLNameTBox = "";
		variables.roomNumberTBox = "";
		variables.bedNumberTBox = "";
		variables.patientAddressTBox = "";
		variables.patientCityTBox = "";
		variables.patientStateTBox = "";
		variables.patientZipTBox = "";
		variables.patientPhoneTBox = "";
		variables.patientDOBMM = "";
		variables.patientDOBDD = "";
		variables.patientDOBYY = "";
		variables.OPTION_3a_CBox_PatientSexMale = "";
		variables.OPTION_3a_CBox_PatientSexFemale = "";
		variables.patientSSNTBox = "";
		variables.patientHeightFeet = "";
		variables.patientHeightInches = "";
		variables.patientWeightTBox = "";
		variables.alternateContactFNameTBox = "";
		variables.alternateContactMInitialTBox = "";
		variables.alternateContactLNameTBox = "";
		variables.alternateContactRelationshipTBox = "";
		variables.alternateContactPhoneTBox = "";
		variables.alternateContactWorkPhoneTBox = "";
		variables.primaryInsuranceNameTBox = "";
		variables.secondaryInsuranceNameTBox = "";
		variables.primaryPolicyNumberTBox = "";
		variables.secondaryPolicyNumberTBox = "";
		variables.orderingPhysicianFNameTBox = "";
		variables.orderingPhysicianMInitialTBox = "";
		variables.orderingPhysicianLNameTBox = "";
		variables.orderingPhysicianPhoneTBox = "";
		variables.printed = "";
		variables.Cancelled = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="quoteBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "QuoteID") AND stValues.QuoteID NEQ 0>
				<cfquery name="qGetQuote" datasource="#trim(arguments.ds)#">
			  		SELECT QuoteID,ClientID,AssignedToUserID,hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active,InactiveCode,DateCreated,DateModified
					FROM Quote  
					WHERE QuoteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.QuoteID#" /> 
				</cfquery>		
				<cfif qGetQuote.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClientID = qGetQuote.ClientID;
					variables.AssignedToUserID = qGetQuote.AssignedToUserID;
					variables.hidden_UsersID = qGetQuote.hidden_UsersID;
					variables.hidden_TimeStart = qGetQuote.hidden_TimeStart;
					variables.callerFNameTBox = qGetQuote.callerFNameTBox;
					variables.callerMInitialTBox = qGetQuote.callerMInitialTBox;
					variables.callerLNameTBox = qGetQuote.callerLNameTBox;
					variables.callerPhoneTBox = qGetQuote.callerPhoneTBox;
					variables.patientFNameTBox = qGetQuote.patientFNameTBox;
					variables.patientMInitialTBox = qGetQuote.patientMInitialTBox;
					variables.patientLNameTBox = qGetQuote.patientLNameTBox;
					variables.roomNumberTBox = qGetQuote.roomNumberTBox;
					variables.bedNumberTBox = qGetQuote.bedNumberTBox;
					variables.patientAddressTBox = qGetQuote.patientAddressTBox;
					variables.patientCityTBox = qGetQuote.patientCityTBox;
					variables.patientStateTBox = qGetQuote.patientStateTBox;
					variables.patientZipTBox = qGetQuote.patientZipTBox;
					variables.patientPhoneTBox = qGetQuote.patientPhoneTBox;
					variables.patientDOBMM = qGetQuote.patientDOBMM;
					variables.patientDOBDD = qGetQuote.patientDOBDD;
					variables.patientDOBYY = qGetQuote.patientDOBYY;
					variables.OPTION_3a_CBox_PatientSexMale = qGetQuote.OPTION_3a_CBox_PatientSexMale;
					variables.OPTION_3a_CBox_PatientSexFemale = qGetQuote.OPTION_3a_CBox_PatientSexFemale;
					variables.patientSSNTBox = qGetQuote.patientSSNTBox;
					variables.patientHeightFeet = qGetQuote.patientHeightFeet;
					variables.patientHeightInches = qGetQuote.patientHeightInches;
					variables.patientWeightTBox = qGetQuote.patientWeightTBox;
					variables.alternateContactFNameTBox = qGetQuote.alternateContactFNameTBox;
					variables.alternateContactMInitialTBox = qGetQuote.alternateContactMInitialTBox;
					variables.alternateContactLNameTBox = qGetQuote.alternateContactLNameTBox;
					variables.alternateContactRelationshipTBox = qGetQuote.alternateContactRelationshipTBox;
					variables.alternateContactPhoneTBox = qGetQuote.alternateContactPhoneTBox;
					variables.alternateContactWorkPhoneTBox = qGetQuote.alternateContactWorkPhoneTBox;
					variables.primaryInsuranceNameTBox = qGetQuote.primaryInsuranceNameTBox;
					variables.secondaryInsuranceNameTBox = qGetQuote.secondaryInsuranceNameTBox;
					variables.primaryPolicyNumberTBox = qGetQuote.primaryPolicyNumberTBox;
					variables.secondaryPolicyNumberTBox = qGetQuote.secondaryPolicyNumberTBox;
					variables.orderingPhysicianFNameTBox = qGetQuote.orderingPhysicianFNameTBox;
					variables.orderingPhysicianMInitialTBox = qGetQuote.orderingPhysicianMInitialTBox;
					variables.orderingPhysicianLNameTBox = qGetQuote.orderingPhysicianLNameTBox;
					variables.orderingPhysicianPhoneTBox = qGetQuote.orderingPhysicianPhoneTBox;
					variables.printed = qGetQuote.printed;
					variables.Cancelled = qGetQuote.Cancelled;
					variables.Active = qGetQuote.Active;
					variables.InactiveCode = qGetQuote.InactiveCode;
					variables.DateModified = qGetQuote.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "QuoteID")><cfset variables.QuoteID = stValues.QuoteID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "AssignedToUserID")><cfset variables.AssignedToUserID = stValues.AssignedToUserID /></cfif>
			<cfif StructKeyExists(stValues, "hidden_UsersID")><cfset variables.hidden_UsersID = stValues.hidden_UsersID /></cfif>
			<cfif StructKeyExists(stValues, "hidden_TimeStart")><cfset variables.hidden_TimeStart = stValues.hidden_TimeStart /></cfif>
			<cfif StructKeyExists(stValues, "callerFNameTBox")><cfset variables.callerFNameTBox = stValues.callerFNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "callerMInitialTBox")><cfset variables.callerMInitialTBox = stValues.callerMInitialTBox /></cfif>
			<cfif StructKeyExists(stValues, "callerLNameTBox")><cfset variables.callerLNameTBox = stValues.callerLNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "callerPhoneTBox")><cfset variables.callerPhoneTBox = stValues.callerPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientFNameTBox")><cfset variables.patientFNameTBox = stValues.patientFNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientMInitialTBox")><cfset variables.patientMInitialTBox = stValues.patientMInitialTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientLNameTBox")><cfset variables.patientLNameTBox = stValues.patientLNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "roomNumberTBox")><cfset variables.roomNumberTBox = stValues.roomNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "bedNumberTBox")><cfset variables.bedNumberTBox = stValues.bedNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientAddressTBox")><cfset variables.patientAddressTBox = stValues.patientAddressTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientCityTBox")><cfset variables.patientCityTBox = stValues.patientCityTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientStateTBox")><cfset variables.patientStateTBox = stValues.patientStateTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientZipTBox")><cfset variables.patientZipTBox = stValues.patientZipTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientPhoneTBox")><cfset variables.patientPhoneTBox = stValues.patientPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientDOBMM")><cfset variables.patientDOBMM = stValues.patientDOBMM /></cfif>
			<cfif StructKeyExists(stValues, "patientDOBDD")><cfset variables.patientDOBDD = stValues.patientDOBDD /></cfif>
			<cfif StructKeyExists(stValues, "patientDOBYY")><cfset variables.patientDOBYY = stValues.patientDOBYY /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_3a_CBox_PatientSexMale")><cfset variables.OPTION_3a_CBox_PatientSexMale = stValues.OPTION_3a_CBox_PatientSexMale /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_3a_CBox_PatientSexFemale")><cfset variables.OPTION_3a_CBox_PatientSexFemale = stValues.OPTION_3a_CBox_PatientSexFemale /></cfif>
			<cfif StructKeyExists(stValues, "patientSSNTBox")><cfset variables.patientSSNTBox = stValues.patientSSNTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientHeightFeet")><cfset variables.patientHeightFeet = stValues.patientHeightFeet /></cfif>
			<cfif StructKeyExists(stValues, "patientHeightInches")><cfset variables.patientHeightInches = stValues.patientHeightInches /></cfif>
			<cfif StructKeyExists(stValues, "patientWeightTBox")><cfset variables.patientWeightTBox = stValues.patientWeightTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactFNameTBox")><cfset variables.alternateContactFNameTBox = stValues.alternateContactFNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactMInitialTBox")><cfset variables.alternateContactMInitialTBox = stValues.alternateContactMInitialTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactLNameTBox")><cfset variables.alternateContactLNameTBox = stValues.alternateContactLNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactRelationshipTBox")><cfset variables.alternateContactRelationshipTBox = stValues.alternateContactRelationshipTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactPhoneTBox")><cfset variables.alternateContactPhoneTBox = stValues.alternateContactPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactWorkPhoneTBox")><cfset variables.alternateContactWorkPhoneTBox = stValues.alternateContactWorkPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "primaryInsuranceNameTBox")><cfset variables.primaryInsuranceNameTBox = stValues.primaryInsuranceNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "secondaryInsuranceNameTBox")><cfset variables.secondaryInsuranceNameTBox = stValues.secondaryInsuranceNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "primaryPolicyNumberTBox")><cfset variables.primaryPolicyNumberTBox = stValues.primaryPolicyNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "secondaryPolicyNumberTBox")><cfset variables.secondaryPolicyNumberTBox = stValues.secondaryPolicyNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianFNameTBox")><cfset variables.orderingPhysicianFNameTBox = stValues.orderingPhysicianFNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianMInitialTBox")><cfset variables.orderingPhysicianMInitialTBox = stValues.orderingPhysicianMInitialTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianLNameTBox")><cfset variables.orderingPhysicianLNameTBox = stValues.orderingPhysicianLNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianPhoneTBox")><cfset variables.orderingPhysicianPhoneTBox = stValues.orderingPhysicianPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "printed")><cfset variables.printed = stValues.printed /></cfif>
			<cfif StructKeyExists(stValues, "Cancelled")><cfset variables.Cancelled = stValues.Cancelled /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for QuoteID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQuoteID" acess="public" output="false" returntype="any">
		<cfreturn variables.QuoteID>
	</cffunction>
	
	<cffunction name="setQuoteID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="QuoteID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.QuoteID)) OR trim(arguments.QuoteID) EQ "">
			<cfset variables.QuoteID = arguments.QuoteID />
		<cfelse>
			<cfthrow message="QuoteID (#arguments.QuoteID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "QuoteID") />		
		
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
	<!--- GET and SET methods for hidden_UsersID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gethidden_UsersID" acess="public" output="false" returntype="any">
		<cfreturn variables.hidden_UsersID>
	</cffunction>
	
	<cffunction name="sethidden_UsersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="hidden_UsersID" required="true" type="any" />
			
		<cfset variables.hidden_UsersID = arguments.hidden_UsersID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "hidden_UsersID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for hidden_TimeStart.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gethidden_TimeStart" acess="public" output="false" returntype="any">
		<cfreturn variables.hidden_TimeStart>
	</cffunction>
	
	<cffunction name="sethidden_TimeStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="hidden_TimeStart" required="true" type="any" />
			
		<cfset variables.hidden_TimeStart = arguments.hidden_TimeStart />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "hidden_TimeStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerFNameTBox.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerFNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerFNameTBox>
	</cffunction>
	
	<cffunction name="setcallerFNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerFNameTBox" required="true" type="any" />
			
		<cfset variables.callerFNameTBox = arguments.callerFNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerFNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerMInitialTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerMInitialTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerMInitialTBox>
	</cffunction>
	
	<cffunction name="setcallerMInitialTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerMInitialTBox" required="true" type="any" />
			
		<cfset variables.callerMInitialTBox = arguments.callerMInitialTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerMInitialTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerLNameTBox.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerLNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerLNameTBox>
	</cffunction>
	
	<cffunction name="setcallerLNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerLNameTBox" required="true" type="any" />
			
		<cfset variables.callerLNameTBox = arguments.callerLNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerLNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerPhoneTBox.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerPhoneTBox>
	</cffunction>
	
	<cffunction name="setcallerPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerPhoneTBox" required="true" type="any" />
			
		<cfset variables.callerPhoneTBox = arguments.callerPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientFNameTBox.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientFNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientFNameTBox>
	</cffunction>
	
	<cffunction name="setpatientFNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientFNameTBox" required="true" type="any" />
			
		<cfset variables.patientFNameTBox = arguments.patientFNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientFNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientMInitialTBox.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientMInitialTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientMInitialTBox>
	</cffunction>
	
	<cffunction name="setpatientMInitialTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientMInitialTBox" required="true" type="any" />
			
		<cfset variables.patientMInitialTBox = arguments.patientMInitialTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientMInitialTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientLNameTBox.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientLNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientLNameTBox>
	</cffunction>
	
	<cffunction name="setpatientLNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientLNameTBox" required="true" type="any" />
			
		<cfset variables.patientLNameTBox = arguments.patientLNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientLNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for roomNumberTBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getroomNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.roomNumberTBox>
	</cffunction>
	
	<cffunction name="setroomNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="roomNumberTBox" required="true" type="any" />
			
		<cfset variables.roomNumberTBox = arguments.roomNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "roomNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for bedNumberTBox.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getbedNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.bedNumberTBox>
	</cffunction>
	
	<cffunction name="setbedNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="bedNumberTBox" required="true" type="any" />
			
		<cfset variables.bedNumberTBox = arguments.bedNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "bedNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientAddressTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientAddressTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientAddressTBox>
	</cffunction>
	
	<cffunction name="setpatientAddressTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientAddressTBox" required="true" type="any" />
			
		<cfset variables.patientAddressTBox = arguments.patientAddressTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientAddressTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientCityTBox.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientCityTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientCityTBox>
	</cffunction>
	
	<cffunction name="setpatientCityTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientCityTBox" required="true" type="any" />
			
		<cfset variables.patientCityTBox = arguments.patientCityTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientCityTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientStateTBox.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientStateTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientStateTBox>
	</cffunction>
	
	<cffunction name="setpatientStateTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientStateTBox" required="true" type="any" />
			
		<cfset variables.patientStateTBox = arguments.patientStateTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientStateTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientZipTBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientZipTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientZipTBox>
	</cffunction>
	
	<cffunction name="setpatientZipTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientZipTBox" required="true" type="any" />
			
		<cfset variables.patientZipTBox = arguments.patientZipTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientZipTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientPhoneTBox.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientPhoneTBox>
	</cffunction>
	
	<cffunction name="setpatientPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientPhoneTBox" required="true" type="any" />
			
		<cfset variables.patientPhoneTBox = arguments.patientPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientDOBMM.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientDOBMM" acess="public" output="false" returntype="any">
		<cfreturn variables.patientDOBMM>
	</cffunction>
	
	<cffunction name="setpatientDOBMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientDOBMM" required="true" type="any" />
			
		<cfset variables.patientDOBMM = arguments.patientDOBMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientDOBMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientDOBDD.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientDOBDD" acess="public" output="false" returntype="any">
		<cfreturn variables.patientDOBDD>
	</cffunction>
	
	<cffunction name="setpatientDOBDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientDOBDD" required="true" type="any" />
			
		<cfset variables.patientDOBDD = arguments.patientDOBDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientDOBDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientDOBYY.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientDOBYY" acess="public" output="false" returntype="any">
		<cfreturn variables.patientDOBYY>
	</cffunction>
	
	<cffunction name="setpatientDOBYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientDOBYY" required="true" type="any" />
			
		<cfset variables.patientDOBYY = arguments.patientDOBYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientDOBYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_3a_CBox_PatientSexMale.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_3a_CBox_PatientSexMale" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_3a_CBox_PatientSexMale>
	</cffunction>
	
	<cffunction name="setOPTION_3a_CBox_PatientSexMale" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_3a_CBox_PatientSexMale" required="true" type="any" />
			
		<cfset variables.OPTION_3a_CBox_PatientSexMale = arguments.OPTION_3a_CBox_PatientSexMale />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_3a_CBox_PatientSexMale") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_3a_CBox_PatientSexFemale.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_3a_CBox_PatientSexFemale" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_3a_CBox_PatientSexFemale>
	</cffunction>
	
	<cffunction name="setOPTION_3a_CBox_PatientSexFemale" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_3a_CBox_PatientSexFemale" required="true" type="any" />
			
		<cfset variables.OPTION_3a_CBox_PatientSexFemale = arguments.OPTION_3a_CBox_PatientSexFemale />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_3a_CBox_PatientSexFemale") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientSSNTBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientSSNTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientSSNTBox>
	</cffunction>
	
	<cffunction name="setpatientSSNTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientSSNTBox" required="true" type="any" />
			
		<cfset variables.patientSSNTBox = arguments.patientSSNTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientSSNTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientHeightFeet.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientHeightFeet" acess="public" output="false" returntype="any">
		<cfreturn variables.patientHeightFeet>
	</cffunction>
	
	<cffunction name="setpatientHeightFeet" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientHeightFeet" required="true" type="any" />
			
		<cfset variables.patientHeightFeet = arguments.patientHeightFeet />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientHeightFeet") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientHeightInches.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientHeightInches" acess="public" output="false" returntype="any">
		<cfreturn variables.patientHeightInches>
	</cffunction>
	
	<cffunction name="setpatientHeightInches" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientHeightInches" required="true" type="any" />
			
		<cfset variables.patientHeightInches = arguments.patientHeightInches />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientHeightInches") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientWeightTBox.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientWeightTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.patientWeightTBox>
	</cffunction>
	
	<cffunction name="setpatientWeightTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientWeightTBox" required="true" type="any" />
			
		<cfset variables.patientWeightTBox = arguments.patientWeightTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientWeightTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactFNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactFNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactFNameTBox>
	</cffunction>
	
	<cffunction name="setalternateContactFNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactFNameTBox" required="true" type="any" />
			
		<cfset variables.alternateContactFNameTBox = arguments.alternateContactFNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactFNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactMInitialTBox.                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactMInitialTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactMInitialTBox>
	</cffunction>
	
	<cffunction name="setalternateContactMInitialTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactMInitialTBox" required="true" type="any" />
			
		<cfset variables.alternateContactMInitialTBox = arguments.alternateContactMInitialTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactMInitialTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactLNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactLNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactLNameTBox>
	</cffunction>
	
	<cffunction name="setalternateContactLNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactLNameTBox" required="true" type="any" />
			
		<cfset variables.alternateContactLNameTBox = arguments.alternateContactLNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactLNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactRelationshipTBox.                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactRelationshipTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactRelationshipTBox>
	</cffunction>
	
	<cffunction name="setalternateContactRelationshipTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactRelationshipTBox" required="true" type="any" />
			
		<cfset variables.alternateContactRelationshipTBox = arguments.alternateContactRelationshipTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactRelationshipTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactPhoneTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactPhoneTBox>
	</cffunction>
	
	<cffunction name="setalternateContactPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactPhoneTBox" required="true" type="any" />
			
		<cfset variables.alternateContactPhoneTBox = arguments.alternateContactPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactWorkPhoneTBox.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactWorkPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactWorkPhoneTBox>
	</cffunction>
	
	<cffunction name="setalternateContactWorkPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactWorkPhoneTBox" required="true" type="any" />
			
		<cfset variables.alternateContactWorkPhoneTBox = arguments.alternateContactWorkPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactWorkPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for primaryInsuranceNameTBox.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getprimaryInsuranceNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.primaryInsuranceNameTBox>
	</cffunction>
	
	<cffunction name="setprimaryInsuranceNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="primaryInsuranceNameTBox" required="true" type="any" />
			
		<cfset variables.primaryInsuranceNameTBox = arguments.primaryInsuranceNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "primaryInsuranceNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for secondaryInsuranceNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getsecondaryInsuranceNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.secondaryInsuranceNameTBox>
	</cffunction>
	
	<cffunction name="setsecondaryInsuranceNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="secondaryInsuranceNameTBox" required="true" type="any" />
			
		<cfset variables.secondaryInsuranceNameTBox = arguments.secondaryInsuranceNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "secondaryInsuranceNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for primaryPolicyNumberTBox.                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getprimaryPolicyNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.primaryPolicyNumberTBox>
	</cffunction>
	
	<cffunction name="setprimaryPolicyNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="primaryPolicyNumberTBox" required="true" type="any" />
			
		<cfset variables.primaryPolicyNumberTBox = arguments.primaryPolicyNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "primaryPolicyNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for secondaryPolicyNumberTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getsecondaryPolicyNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.secondaryPolicyNumberTBox>
	</cffunction>
	
	<cffunction name="setsecondaryPolicyNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="secondaryPolicyNumberTBox" required="true" type="any" />
			
		<cfset variables.secondaryPolicyNumberTBox = arguments.secondaryPolicyNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "secondaryPolicyNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianFNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianFNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianFNameTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianFNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianFNameTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianFNameTBox = arguments.orderingPhysicianFNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianFNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianMInitialTBox.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianMInitialTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianMInitialTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianMInitialTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianMInitialTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianMInitialTBox = arguments.orderingPhysicianMInitialTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianMInitialTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianLNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianLNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianLNameTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianLNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianLNameTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianLNameTBox = arguments.orderingPhysicianLNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianLNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianPhoneTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianPhoneTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianPhoneTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianPhoneTBox = arguments.orderingPhysicianPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for printed.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getprinted" acess="public" output="false" returntype="any">
		<cfreturn variables.printed>
	</cffunction>
	
	<cffunction name="setprinted" acess="public" output="false" returntype="boolean">
		
		<cfargument name="printed" required="true" type="any" />
			
		<cfset variables.printed = arguments.printed />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "printed") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Cancelled.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCancelled" acess="public" output="false" returntype="any">
		<cfreturn variables.Cancelled>
	</cffunction>
	
	<cffunction name="setCancelled" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Cancelled" required="true" type="any" />
			
		<cfset variables.Cancelled = arguments.Cancelled />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Cancelled") />		
		
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


