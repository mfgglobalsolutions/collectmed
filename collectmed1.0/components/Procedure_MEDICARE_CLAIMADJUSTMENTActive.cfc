 	


<cfcomponent name="procedure_medicare_claimadjustmentActive" output="false" alias="procedure_medicare_claimadjustmentActive">

	<cfproperty name="Procedure_MEDICARE_CLAIMADJUSTMENTID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="ClaimAdjustmentGroupCode1" type="numeric" default="" />
	<cfproperty name="ClaimAdjustmentReasonCode2" type="numeric" default="" />
	<cfproperty name="MonetaryAmount3" type="numeric" default="" />
	<cfproperty name="Quantity4" type="numeric" default="" />
	<cfproperty name="ClaimAdjustmentReasonCode5" type="numeric" default="" />
	<cfproperty name="MonetaryAmount6" type="numeric" default="" />
	<cfproperty name="Quantity7" type="numeric" default="" />
	<cfproperty name="ClaimAdjustmentReasonCode8" type="string" default="" />
	<cfproperty name="MonetaryAmount9" type="numeric" default="" />
	<cfproperty name="Quantity10" type="numeric" default="" />
	<cfproperty name="ClaimAdjustmentReasonCode11" type="numeric" default="" />
	<cfproperty name="MonetaryAmount12" type="numeric" default="" />
	<cfproperty name="Quantity13" type="numeric" default="" />
	<cfproperty name="ClaimAdjustmentReasonCode14" type="numeric" default="" />
	<cfproperty name="MonetaryAmount15" type="numeric" default="" />
	<cfproperty name="Quantity16" type="numeric" default="" />
	<cfproperty name="ClaimAdjustmentReasonCode17" type="numeric" default="" />
	<cfproperty name="MonetaryAmount18" type="numeric" default="" />
	<cfproperty name="Quantity19" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.Procedure_MEDICARE_CLAIMADJUSTMENTID = 0;
		variables.ProcedureID = "";
		variables.ClaimAdjustmentGroupCode1 = "";
		variables.ClaimAdjustmentReasonCode2 = "";
		variables.MonetaryAmount3 = "";
		variables.Quantity4 = "";
		variables.ClaimAdjustmentReasonCode5 = "";
		variables.MonetaryAmount6 = "";
		variables.Quantity7 = "";
		variables.ClaimAdjustmentReasonCode8 = "";
		variables.MonetaryAmount9 = "";
		variables.Quantity10 = "";
		variables.ClaimAdjustmentReasonCode11 = "";
		variables.MonetaryAmount12 = "";
		variables.Quantity13 = "";
		variables.ClaimAdjustmentReasonCode14 = "";
		variables.MonetaryAmount15 = "";
		variables.Quantity16 = "";
		variables.ClaimAdjustmentReasonCode17 = "";
		variables.MonetaryAmount18 = "";
		variables.Quantity19 = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedure_medicare_claimadjustmentActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_CLAIMADJUSTMENTID") AND stValues.Procedure_MEDICARE_CLAIMADJUSTMENTID NEQ 0>
				<cfquery name="qGetProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(variables.ds)#">
			  		SELECT Procedure_MEDICARE_CLAIMADJUSTMENTID,ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode,DateCreated,DateModified
					FROM procedure_medicare_claimadjustment  
					WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.Procedure_MEDICARE_CLAIMADJUSTMENTID#" /> 
				</cfquery>		
				<cfif qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ProcedureID;
					variables.ClaimAdjustmentGroupCode1 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentGroupCode1;
					variables.ClaimAdjustmentReasonCode2 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode2;
					variables.MonetaryAmount3 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount3;
					variables.Quantity4 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity4;
					variables.ClaimAdjustmentReasonCode5 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode5;
					variables.MonetaryAmount6 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount6;
					variables.Quantity7 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity7;
					variables.ClaimAdjustmentReasonCode8 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode8;
					variables.MonetaryAmount9 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount9;
					variables.Quantity10 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity10;
					variables.ClaimAdjustmentReasonCode11 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode11;
					variables.MonetaryAmount12 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount12;
					variables.Quantity13 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity13;
					variables.ClaimAdjustmentReasonCode14 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode14;
					variables.MonetaryAmount15 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount15;
					variables.Quantity16 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity16;
					variables.ClaimAdjustmentReasonCode17 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode17;
					variables.MonetaryAmount18 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount18;
					variables.Quantity19 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity19;
					variables.Active = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Active;
					variables.InactiveCode = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.InactiveCode;
					variables.DateModified = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_CLAIMADJUSTMENTID")><cfset variables.Procedure_MEDICARE_CLAIMADJUSTMENTID = stValues.Procedure_MEDICARE_CLAIMADJUSTMENTID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimAdjustmentGroupCode1")><cfset variables.ClaimAdjustmentGroupCode1 = stValues.ClaimAdjustmentGroupCode1 /></cfif>
			<cfif StructKeyExists(stValues, "ClaimAdjustmentReasonCode2")><cfset variables.ClaimAdjustmentReasonCode2 = stValues.ClaimAdjustmentReasonCode2 /></cfif>
			<cfif StructKeyExists(stValues, "MonetaryAmount3")><cfset variables.MonetaryAmount3 = stValues.MonetaryAmount3 /></cfif>
			<cfif StructKeyExists(stValues, "Quantity4")><cfset variables.Quantity4 = stValues.Quantity4 /></cfif>
			<cfif StructKeyExists(stValues, "ClaimAdjustmentReasonCode5")><cfset variables.ClaimAdjustmentReasonCode5 = stValues.ClaimAdjustmentReasonCode5 /></cfif>
			<cfif StructKeyExists(stValues, "MonetaryAmount6")><cfset variables.MonetaryAmount6 = stValues.MonetaryAmount6 /></cfif>
			<cfif StructKeyExists(stValues, "Quantity7")><cfset variables.Quantity7 = stValues.Quantity7 /></cfif>
			<cfif StructKeyExists(stValues, "ClaimAdjustmentReasonCode8")><cfset variables.ClaimAdjustmentReasonCode8 = stValues.ClaimAdjustmentReasonCode8 /></cfif>
			<cfif StructKeyExists(stValues, "MonetaryAmount9")><cfset variables.MonetaryAmount9 = stValues.MonetaryAmount9 /></cfif>
			<cfif StructKeyExists(stValues, "Quantity10")><cfset variables.Quantity10 = stValues.Quantity10 /></cfif>
			<cfif StructKeyExists(stValues, "ClaimAdjustmentReasonCode11")><cfset variables.ClaimAdjustmentReasonCode11 = stValues.ClaimAdjustmentReasonCode11 /></cfif>
			<cfif StructKeyExists(stValues, "MonetaryAmount12")><cfset variables.MonetaryAmount12 = stValues.MonetaryAmount12 /></cfif>
			<cfif StructKeyExists(stValues, "Quantity13")><cfset variables.Quantity13 = stValues.Quantity13 /></cfif>
			<cfif StructKeyExists(stValues, "ClaimAdjustmentReasonCode14")><cfset variables.ClaimAdjustmentReasonCode14 = stValues.ClaimAdjustmentReasonCode14 /></cfif>
			<cfif StructKeyExists(stValues, "MonetaryAmount15")><cfset variables.MonetaryAmount15 = stValues.MonetaryAmount15 /></cfif>
			<cfif StructKeyExists(stValues, "Quantity16")><cfset variables.Quantity16 = stValues.Quantity16 /></cfif>
			<cfif StructKeyExists(stValues, "ClaimAdjustmentReasonCode17")><cfset variables.ClaimAdjustmentReasonCode17 = stValues.ClaimAdjustmentReasonCode17 /></cfif>
			<cfif StructKeyExists(stValues, "MonetaryAmount18")><cfset variables.MonetaryAmount18 = stValues.MonetaryAmount18 /></cfif>
			<cfif StructKeyExists(stValues, "Quantity19")><cfset variables.Quantity19 = stValues.Quantity19 /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Procedure_MEDICARE_CLAIMADJUSTMENTID.                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedure_MEDICARE_CLAIMADJUSTMENTID" acess="public" output="false" returntype="any">
		<cfreturn variables.Procedure_MEDICARE_CLAIMADJUSTMENTID>
	</cffunction>
	
	<cffunction name="setProcedure_MEDICARE_CLAIMADJUSTMENTID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID)) OR trim(arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID) EQ "">
			<cfset variables.Procedure_MEDICARE_CLAIMADJUSTMENTID = arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID />
		<cfelse>
			<cfthrow message="Procedure_MEDICARE_CLAIMADJUSTMENTID (#arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Procedure_MEDICARE_CLAIMADJUSTMENTID") />		
		
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
	<!--- GET and SET methods for ClaimAdjustmentGroupCode1.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAdjustmentGroupCode1" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAdjustmentGroupCode1>
	</cffunction>
	
	<cffunction name="setClaimAdjustmentGroupCode1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAdjustmentGroupCode1" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimAdjustmentGroupCode1)) OR trim(arguments.ClaimAdjustmentGroupCode1) EQ "">
			<cfset variables.ClaimAdjustmentGroupCode1 = arguments.ClaimAdjustmentGroupCode1 />
		<cfelse>
			<cfthrow message="ClaimAdjustmentGroupCode1 (#arguments.ClaimAdjustmentGroupCode1#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAdjustmentGroupCode1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimAdjustmentReasonCode2.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAdjustmentReasonCode2" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAdjustmentReasonCode2>
	</cffunction>
	
	<cffunction name="setClaimAdjustmentReasonCode2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAdjustmentReasonCode2" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimAdjustmentReasonCode2)) OR trim(arguments.ClaimAdjustmentReasonCode2) EQ "">
			<cfset variables.ClaimAdjustmentReasonCode2 = arguments.ClaimAdjustmentReasonCode2 />
		<cfelse>
			<cfthrow message="ClaimAdjustmentReasonCode2 (#arguments.ClaimAdjustmentReasonCode2#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAdjustmentReasonCode2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MonetaryAmount3.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMonetaryAmount3" acess="public" output="false" returntype="any">
		<cfreturn variables.MonetaryAmount3>
	</cffunction>
	
	<cffunction name="setMonetaryAmount3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MonetaryAmount3" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MonetaryAmount3)) OR trim(arguments.MonetaryAmount3) EQ "">
			<cfset variables.MonetaryAmount3 = arguments.MonetaryAmount3 />
		<cfelse>
			<cfthrow message="MonetaryAmount3 (#arguments.MonetaryAmount3#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MonetaryAmount3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Quantity4.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQuantity4" acess="public" output="false" returntype="any">
		<cfreturn variables.Quantity4>
	</cffunction>
	
	<cffunction name="setQuantity4" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Quantity4" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Quantity4)) OR trim(arguments.Quantity4) EQ "">
			<cfset variables.Quantity4 = arguments.Quantity4 />
		<cfelse>
			<cfthrow message="Quantity4 (#arguments.Quantity4#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Quantity4") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimAdjustmentReasonCode5.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAdjustmentReasonCode5" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAdjustmentReasonCode5>
	</cffunction>
	
	<cffunction name="setClaimAdjustmentReasonCode5" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAdjustmentReasonCode5" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimAdjustmentReasonCode5)) OR trim(arguments.ClaimAdjustmentReasonCode5) EQ "">
			<cfset variables.ClaimAdjustmentReasonCode5 = arguments.ClaimAdjustmentReasonCode5 />
		<cfelse>
			<cfthrow message="ClaimAdjustmentReasonCode5 (#arguments.ClaimAdjustmentReasonCode5#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAdjustmentReasonCode5") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MonetaryAmount6.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMonetaryAmount6" acess="public" output="false" returntype="any">
		<cfreturn variables.MonetaryAmount6>
	</cffunction>
	
	<cffunction name="setMonetaryAmount6" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MonetaryAmount6" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MonetaryAmount6)) OR trim(arguments.MonetaryAmount6) EQ "">
			<cfset variables.MonetaryAmount6 = arguments.MonetaryAmount6 />
		<cfelse>
			<cfthrow message="MonetaryAmount6 (#arguments.MonetaryAmount6#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MonetaryAmount6") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Quantity7.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQuantity7" acess="public" output="false" returntype="any">
		<cfreturn variables.Quantity7>
	</cffunction>
	
	<cffunction name="setQuantity7" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Quantity7" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Quantity7)) OR trim(arguments.Quantity7) EQ "">
			<cfset variables.Quantity7 = arguments.Quantity7 />
		<cfelse>
			<cfthrow message="Quantity7 (#arguments.Quantity7#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Quantity7") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimAdjustmentReasonCode8.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAdjustmentReasonCode8" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAdjustmentReasonCode8>
	</cffunction>
	
	<cffunction name="setClaimAdjustmentReasonCode8" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAdjustmentReasonCode8" required="true" type="any" />
			
		<cfset variables.ClaimAdjustmentReasonCode8 = arguments.ClaimAdjustmentReasonCode8 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAdjustmentReasonCode8") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MonetaryAmount9.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMonetaryAmount9" acess="public" output="false" returntype="any">
		<cfreturn variables.MonetaryAmount9>
	</cffunction>
	
	<cffunction name="setMonetaryAmount9" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MonetaryAmount9" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MonetaryAmount9)) OR trim(arguments.MonetaryAmount9) EQ "">
			<cfset variables.MonetaryAmount9 = arguments.MonetaryAmount9 />
		<cfelse>
			<cfthrow message="MonetaryAmount9 (#arguments.MonetaryAmount9#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MonetaryAmount9") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Quantity10.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQuantity10" acess="public" output="false" returntype="any">
		<cfreturn variables.Quantity10>
	</cffunction>
	
	<cffunction name="setQuantity10" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Quantity10" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Quantity10)) OR trim(arguments.Quantity10) EQ "">
			<cfset variables.Quantity10 = arguments.Quantity10 />
		<cfelse>
			<cfthrow message="Quantity10 (#arguments.Quantity10#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Quantity10") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimAdjustmentReasonCode11.                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAdjustmentReasonCode11" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAdjustmentReasonCode11>
	</cffunction>
	
	<cffunction name="setClaimAdjustmentReasonCode11" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAdjustmentReasonCode11" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimAdjustmentReasonCode11)) OR trim(arguments.ClaimAdjustmentReasonCode11) EQ "">
			<cfset variables.ClaimAdjustmentReasonCode11 = arguments.ClaimAdjustmentReasonCode11 />
		<cfelse>
			<cfthrow message="ClaimAdjustmentReasonCode11 (#arguments.ClaimAdjustmentReasonCode11#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAdjustmentReasonCode11") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MonetaryAmount12.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMonetaryAmount12" acess="public" output="false" returntype="any">
		<cfreturn variables.MonetaryAmount12>
	</cffunction>
	
	<cffunction name="setMonetaryAmount12" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MonetaryAmount12" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MonetaryAmount12)) OR trim(arguments.MonetaryAmount12) EQ "">
			<cfset variables.MonetaryAmount12 = arguments.MonetaryAmount12 />
		<cfelse>
			<cfthrow message="MonetaryAmount12 (#arguments.MonetaryAmount12#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MonetaryAmount12") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Quantity13.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQuantity13" acess="public" output="false" returntype="any">
		<cfreturn variables.Quantity13>
	</cffunction>
	
	<cffunction name="setQuantity13" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Quantity13" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Quantity13)) OR trim(arguments.Quantity13) EQ "">
			<cfset variables.Quantity13 = arguments.Quantity13 />
		<cfelse>
			<cfthrow message="Quantity13 (#arguments.Quantity13#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Quantity13") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimAdjustmentReasonCode14.                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAdjustmentReasonCode14" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAdjustmentReasonCode14>
	</cffunction>
	
	<cffunction name="setClaimAdjustmentReasonCode14" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAdjustmentReasonCode14" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimAdjustmentReasonCode14)) OR trim(arguments.ClaimAdjustmentReasonCode14) EQ "">
			<cfset variables.ClaimAdjustmentReasonCode14 = arguments.ClaimAdjustmentReasonCode14 />
		<cfelse>
			<cfthrow message="ClaimAdjustmentReasonCode14 (#arguments.ClaimAdjustmentReasonCode14#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAdjustmentReasonCode14") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MonetaryAmount15.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMonetaryAmount15" acess="public" output="false" returntype="any">
		<cfreturn variables.MonetaryAmount15>
	</cffunction>
	
	<cffunction name="setMonetaryAmount15" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MonetaryAmount15" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MonetaryAmount15)) OR trim(arguments.MonetaryAmount15) EQ "">
			<cfset variables.MonetaryAmount15 = arguments.MonetaryAmount15 />
		<cfelse>
			<cfthrow message="MonetaryAmount15 (#arguments.MonetaryAmount15#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MonetaryAmount15") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Quantity16.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQuantity16" acess="public" output="false" returntype="any">
		<cfreturn variables.Quantity16>
	</cffunction>
	
	<cffunction name="setQuantity16" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Quantity16" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Quantity16)) OR trim(arguments.Quantity16) EQ "">
			<cfset variables.Quantity16 = arguments.Quantity16 />
		<cfelse>
			<cfthrow message="Quantity16 (#arguments.Quantity16#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Quantity16") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimAdjustmentReasonCode17.                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAdjustmentReasonCode17" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAdjustmentReasonCode17>
	</cffunction>
	
	<cffunction name="setClaimAdjustmentReasonCode17" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAdjustmentReasonCode17" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimAdjustmentReasonCode17)) OR trim(arguments.ClaimAdjustmentReasonCode17) EQ "">
			<cfset variables.ClaimAdjustmentReasonCode17 = arguments.ClaimAdjustmentReasonCode17 />
		<cfelse>
			<cfthrow message="ClaimAdjustmentReasonCode17 (#arguments.ClaimAdjustmentReasonCode17#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAdjustmentReasonCode17") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MonetaryAmount18.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMonetaryAmount18" acess="public" output="false" returntype="any">
		<cfreturn variables.MonetaryAmount18>
	</cffunction>
	
	<cffunction name="setMonetaryAmount18" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MonetaryAmount18" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MonetaryAmount18)) OR trim(arguments.MonetaryAmount18) EQ "">
			<cfset variables.MonetaryAmount18 = arguments.MonetaryAmount18 />
		<cfelse>
			<cfthrow message="MonetaryAmount18 (#arguments.MonetaryAmount18#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MonetaryAmount18") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Quantity19.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQuantity19" acess="public" output="false" returntype="any">
		<cfreturn variables.Quantity19>
	</cffunction>
	
	<cffunction name="setQuantity19" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Quantity19" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Quantity19)) OR trim(arguments.Quantity19) EQ "">
			<cfset variables.Quantity19 = arguments.Quantity19 />
		<cfelse>
			<cfthrow message="Quantity19 (#arguments.Quantity19#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Quantity19") />		
		
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
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getProcedure_MEDICARE_CLAIMADJUSTMENTID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getProcedure_MEDICARE_CLAIMADJUSTMENTID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_CLAIMADJUSTMENT" output="false" access="public" returntype="query">
				
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_CLAIMADJUSTMENT = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(variables.ds)#">
	  		SELECT Procedure_MEDICARE_CLAIMADJUSTMENTID,ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode,DateCreated,DateModified
			FROM procedure_medicare_claimadjustment  
			WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_CLAIMADJUSTMENT>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_CLAIMADJUSTMENTActive" />
		
		<cfset var qCreateProcedure_MEDICARE_CLAIMADJUSTMENT = "" />		
		
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localClaimAdjustmentGroupCode1 = arguments.obj.getClaimAdjustmentGroupCode1() />
		<cfset var localClaimAdjustmentReasonCode2 = arguments.obj.getClaimAdjustmentReasonCode2() />
		<cfset var localMonetaryAmount3 = arguments.obj.getMonetaryAmount3() />
		<cfset var localQuantity4 = arguments.obj.getQuantity4() />
		<cfset var localClaimAdjustmentReasonCode5 = arguments.obj.getClaimAdjustmentReasonCode5() />
		<cfset var localMonetaryAmount6 = arguments.obj.getMonetaryAmount6() />
		<cfset var localQuantity7 = arguments.obj.getQuantity7() />
		<cfset var localClaimAdjustmentReasonCode8 = arguments.obj.getClaimAdjustmentReasonCode8() />
		<cfset var localMonetaryAmount9 = arguments.obj.getMonetaryAmount9() />
		<cfset var localQuantity10 = arguments.obj.getQuantity10() />
		<cfset var localClaimAdjustmentReasonCode11 = arguments.obj.getClaimAdjustmentReasonCode11() />
		<cfset var localMonetaryAmount12 = arguments.obj.getMonetaryAmount12() />
		<cfset var localQuantity13 = arguments.obj.getQuantity13() />
		<cfset var localClaimAdjustmentReasonCode14 = arguments.obj.getClaimAdjustmentReasonCode14() />
		<cfset var localMonetaryAmount15 = arguments.obj.getMonetaryAmount15() />
		<cfset var localQuantity16 = arguments.obj.getQuantity16() />
		<cfset var localClaimAdjustmentReasonCode17 = arguments.obj.getClaimAdjustmentReasonCode17() />
		<cfset var localMonetaryAmount18 = arguments.obj.getMonetaryAmount18() />
		<cfset var localQuantity19 = arguments.obj.getQuantity19() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(variables.ds)#">
				INSERT INTO procedure_medicare_claimadjustment (ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localClaimAdjustmentGroupCode1)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode2)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localMonetaryAmount3)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localQuantity4))>						
						<cfqueryparam value="#trim(localQuantity4)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode5))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode5)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount6))>						
						<cfqueryparam value="#trim(localMonetaryAmount6)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity7))>						
						<cfqueryparam value="#trim(localQuantity7)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localClaimAdjustmentReasonCode8) NEQ "" AND trim(localClaimAdjustmentReasonCode8) NEQ "@@" AND trim(localClaimAdjustmentReasonCode8) NEQ "NULL">						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode8)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount9))>						
						<cfqueryparam value="#trim(localMonetaryAmount9)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity10))>						
						<cfqueryparam value="#trim(localQuantity10)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode11))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode11)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount12))>						
						<cfqueryparam value="#trim(localMonetaryAmount12)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity13))>						
						<cfqueryparam value="#trim(localQuantity13)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode14))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode14)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount15))>						
						<cfqueryparam value="#trim(localMonetaryAmount15)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity16))>						
						<cfqueryparam value="#trim(localQuantity16)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode17))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode17)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount18))>						
						<cfqueryparam value="#trim(localMonetaryAmount18)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity19))>						
						<cfqueryparam value="#trim(localQuantity19)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_CLAIMADJUSTMENTID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID);
			arguments.obj.setProcedure_MEDICARE_CLAIMADJUSTMENTID(qCreateProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_CLAIMADJUSTMENTActive">
				
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_CLAIMADJUSTMENT = "" />		
		
		<cfset qGetProcedure_MEDICARE_CLAIMADJUSTMENT = getProcedure_MEDICARE_CLAIMADJUSTMENT(trim(Procedure_MEDICARE_CLAIMADJUSTMENTID)) />
				
		<cfif qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setProcedure_MEDICARE_CLAIMADJUSTMENTID(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID);
			this.setProcedureID(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ProcedureID);
			this.setClaimAdjustmentGroupCode1(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentGroupCode1);
			this.setClaimAdjustmentReasonCode2(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode2);
			this.setMonetaryAmount3(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount3);
			this.setQuantity4(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity4);
			this.setClaimAdjustmentReasonCode5(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode5);
			this.setMonetaryAmount6(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount6);
			this.setQuantity7(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity7);
			this.setClaimAdjustmentReasonCode8(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode8);
			this.setMonetaryAmount9(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount9);
			this.setQuantity10(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity10);
			this.setClaimAdjustmentReasonCode11(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode11);
			this.setMonetaryAmount12(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount12);
			this.setQuantity13(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity13);
			this.setClaimAdjustmentReasonCode14(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode14);
			this.setMonetaryAmount15(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount15);
			this.setQuantity16(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity16);
			this.setClaimAdjustmentReasonCode17(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode17);
			this.setMonetaryAmount18(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount18);
			this.setQuantity19(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity19);
			this.setActive(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Active);
			this.setInactiveCode(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.InactiveCode);
			this.setDateCreated(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.DateCreated);
			this.setDateModified(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_CLAIMADJUSTMENTActive" />
		<cfset var qUpdateProcedure_MEDICARE_CLAIMADJUSTMENT = "" />
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localClaimAdjustmentGroupCode1 = arguments.obj.getClaimAdjustmentGroupCode1() />
		<cfset var localClaimAdjustmentReasonCode2 = arguments.obj.getClaimAdjustmentReasonCode2() />
		<cfset var localMonetaryAmount3 = arguments.obj.getMonetaryAmount3() />
		<cfset var localQuantity4 = arguments.obj.getQuantity4() />
		<cfset var localClaimAdjustmentReasonCode5 = arguments.obj.getClaimAdjustmentReasonCode5() />
		<cfset var localMonetaryAmount6 = arguments.obj.getMonetaryAmount6() />
		<cfset var localQuantity7 = arguments.obj.getQuantity7() />
		<cfset var localClaimAdjustmentReasonCode8 = arguments.obj.getClaimAdjustmentReasonCode8() />
		<cfset var localMonetaryAmount9 = arguments.obj.getMonetaryAmount9() />
		<cfset var localQuantity10 = arguments.obj.getQuantity10() />
		<cfset var localClaimAdjustmentReasonCode11 = arguments.obj.getClaimAdjustmentReasonCode11() />
		<cfset var localMonetaryAmount12 = arguments.obj.getMonetaryAmount12() />
		<cfset var localQuantity13 = arguments.obj.getQuantity13() />
		<cfset var localClaimAdjustmentReasonCode14 = arguments.obj.getClaimAdjustmentReasonCode14() />
		<cfset var localMonetaryAmount15 = arguments.obj.getMonetaryAmount15() />
		<cfset var localQuantity16 = arguments.obj.getQuantity16() />
		<cfset var localClaimAdjustmentReasonCode17 = arguments.obj.getClaimAdjustmentReasonCode17() />
		<cfset var localMonetaryAmount18 = arguments.obj.getMonetaryAmount18() />
		<cfset var localQuantity19 = arguments.obj.getQuantity19() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(variables.ds)#">
				UPDATE procedure_medicare_claimadjustment  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ClaimAdjustmentGroupCode1 =						
						<cfqueryparam value="#trim(localClaimAdjustmentGroupCode1)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ClaimAdjustmentReasonCode2 =						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode2)#" cfsqltype="CF_SQL_INTEGER" />,
					
					MonetaryAmount3 =						
						<cfqueryparam value="#trim(localMonetaryAmount3)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Quantity4 =				
					<cfif IsNumeric(trim(localQuantity4))>						
						<cfqueryparam value="#trim(localQuantity4)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode5 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode5))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode5)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount6 =				
					<cfif IsNumeric(trim(localMonetaryAmount6))>						
						<cfqueryparam value="#trim(localMonetaryAmount6)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity7 =				
					<cfif IsNumeric(trim(localQuantity7))>						
						<cfqueryparam value="#trim(localQuantity7)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode8 =	
					<cfif trim(localClaimAdjustmentReasonCode8) NEQ "" AND trim(localClaimAdjustmentReasonCode8) NEQ "@@" AND trim(localClaimAdjustmentReasonCode8) NEQ "NULL">						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode8)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MonetaryAmount9 =				
					<cfif IsNumeric(trim(localMonetaryAmount9))>						
						<cfqueryparam value="#trim(localMonetaryAmount9)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity10 =				
					<cfif IsNumeric(trim(localQuantity10))>						
						<cfqueryparam value="#trim(localQuantity10)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode11 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode11))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode11)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount12 =				
					<cfif IsNumeric(trim(localMonetaryAmount12))>						
						<cfqueryparam value="#trim(localMonetaryAmount12)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity13 =				
					<cfif IsNumeric(trim(localQuantity13))>						
						<cfqueryparam value="#trim(localQuantity13)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode14 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode14))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode14)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount15 =				
					<cfif IsNumeric(trim(localMonetaryAmount15))>						
						<cfqueryparam value="#trim(localMonetaryAmount15)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity16 =				
					<cfif IsNumeric(trim(localQuantity16))>						
						<cfqueryparam value="#trim(localQuantity16)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode17 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode17))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode17)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount18 =				
					<cfif IsNumeric(trim(localMonetaryAmount18))>						
						<cfqueryparam value="#trim(localMonetaryAmount18)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity19 =				
					<cfif IsNumeric(trim(localQuantity19))>						
						<cfqueryparam value="#trim(localQuantity19)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = <cfqueryparam value="#trim(arguments.obj.getProcedure_MEDICARE_CLAIMADJUSTMENTID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_CLAIMADJUSTMENTActive" />
		<cfset var qDeleteProcedure_MEDICARE_CLAIMADJUSTMENT = "">

		<cfquery name="qDeleteProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM procedure_medicare_claimadjustment
			WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getProcedure_MEDICARE_CLAIMADJUSTMENTID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>





