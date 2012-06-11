<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- Claim_ProcessXMLToDBIO.cfc                                                     --->
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
<!--- This tag is a CFC tag tied to the Claim_ProcessXMLToDB table in the dB.        --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_Claim_ProcessXMLToDBTable                                        --->  
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
<!--- Claim_ProcessXMLToDBID<br>                                                     --->
<!--- InterchangeID<br>                                                              --->
<!--- ClaimXML<br>                                                                   --->
<!--- ProviderID<br>                                                                 --->
<!--- PatientID<br>                                                                  --->
<!--- interchangeClaimID<br>                                                         --->
<!--- PossiblePatientID<br>                                                          --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
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


<cfcomponent name="Claim_ProcessXMLToDBIO">

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
			variables.instance.Claim_ProcessXMLToDBID = "NULL";
			variables.instance.InterchangeID = "NULL";
			variables.instance.ClaimXML = "";
			variables.instance.ProviderID = "";
			variables.instance.PatientID = "NULL";
			variables.instance.interchangeClaimID = "";
			variables.instance.PossiblePatientID = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 11)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIM_PROCESSXMLTODBID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGEID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMXML", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "text", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROVIDERID", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTID", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLAIMID", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "POSSIBLEPATIENTID", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 11)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Claim_ProcessXMLToDBID.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaim_ProcessXMLToDBID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Claim_ProcessXMLToDBID>
	</cffunction>
	 
	<cffunction name="setClaim_ProcessXMLToDBID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Claim_ProcessXMLToDBID" required="Yes" type="String">
		
		<cfif Claim_ProcessXMLToDBID NEQ "NULL">	
			
			<cfif arguments.Claim_ProcessXMLToDBID EQ "@@" OR arguments.Claim_ProcessXMLToDBID EQ "">
				
				<cfset arguments.Claim_ProcessXMLToDBID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(Claim_ProcessXMLToDBID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Claim_ProcessXMLToDBID</strong> (#Claim_ProcessXMLToDBID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Claim_ProcessXMLToDBID = arguments.Claim_ProcessXMLToDBID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeID.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeID>
	</cffunction>
	 
	<cffunction name="setInterchangeID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeID" required="Yes" type="String">
		
		<cfif InterchangeID NEQ "NULL">	
			
			<cfif arguments.InterchangeID EQ "@@" OR arguments.InterchangeID EQ "">
				
				<cfset arguments.InterchangeID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InterchangeID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeID</strong> (#InterchangeID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeID = arguments.InterchangeID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimXML.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimXML" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimXML>
	</cffunction>
	 
	<cffunction name="setClaimXML" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimXML" required="Yes" type="String">
		
		<cfif ClaimXML NEQ "NULL">	
			
			<cfif arguments.ClaimXML EQ "@@" OR arguments.ClaimXML EQ "">
				
				<cfset arguments.ClaimXML = "NULL">
						
			<cfelseif NOT REQUEST.istextDataType(ClaimXML)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimXML</strong> (#ClaimXML#) is not of type <strong>text</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimXML = arguments.ClaimXML>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimXML")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ProviderID.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProviderID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ProviderID>
	</cffunction>
	 
	<cffunction name="setProviderID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ProviderID" required="Yes" type="String">
		
		<cfif ProviderID NEQ "NULL">	
			
			<cfif arguments.ProviderID EQ "@@" OR arguments.ProviderID EQ "">
				
				<cfset arguments.ProviderID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ProviderID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ProviderID</strong> (#ProviderID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ProviderID) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ProviderID</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ProviderID = arguments.ProviderID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ProviderID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PatientID.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientID>
	</cffunction>
	 
	<cffunction name="setPatientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientID" required="Yes" type="String">
		
		<cfif PatientID NEQ "NULL">	
			
			<cfif arguments.PatientID EQ "@@" OR arguments.PatientID EQ "">
				
				<cfset arguments.PatientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PatientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientID</strong> (#PatientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientID = arguments.PatientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for interchangeClaimID.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClaimID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClaimID>
	</cffunction>
	 
	<cffunction name="setInterchangeClaimID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClaimID" required="Yes" type="String">
		
		<cfif InterchangeClaimID NEQ "NULL">	
			
			<cfif arguments.interchangeClaimID EQ "@@" OR arguments.interchangeClaimID EQ "">
				
				<cfset arguments.interchangeClaimID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClaimID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClaimID</strong> (#InterchangeClaimID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(interchangeClaimID) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClaimID</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClaimID = arguments.InterchangeClaimID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClaimID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PossiblePatientID.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPossiblePatientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PossiblePatientID>
	</cffunction>
	 
	<cffunction name="setPossiblePatientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PossiblePatientID" required="Yes" type="String">
		
		<cfif PossiblePatientID NEQ "NULL">	
			
			<cfif arguments.PossiblePatientID EQ "@@" OR arguments.PossiblePatientID EQ "">
				
				<cfset arguments.PossiblePatientID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PossiblePatientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PossiblePatientID</strong> (#PossiblePatientID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PossiblePatientID) GT 75>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PossiblePatientID</strong> cannot be greater than 75 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PossiblePatientID = arguments.PossiblePatientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PossiblePatientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="InterchangeID" required="No" type="String" default="">
		<cfargument name="ClaimXML" required="No" type="String" default="">
		<cfargument name="ProviderID" required="No" type="String" default="">
		<cfargument name="PatientID" required="No" type="String" default="">
		<cfargument name="interchangeClaimID" required="No" type="String" default="">
		<cfargument name="PossiblePatientID" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.InterchangeID = arguments.InterchangeID>
		<cfset variables.instance.ClaimXML = arguments.ClaimXML>
		<cfset variables.instance.ProviderID = arguments.ProviderID>
		<cfset variables.instance.PatientID = arguments.PatientID>
		<cfset variables.instance.interchangeClaimID = arguments.interchangeClaimID>
		<cfset variables.instance.PossiblePatientID = arguments.PossiblePatientID>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="Claim_ProcessXMLToDBIO" output="No">
		
		<cfargument name="Claim_ProcessXMLToDBID" required="yes" type="numeric">		
		<cfset var qGetClaim_ProcessXMLToDB = "">
		
		<cfset preInit(Claim_ProcessXMLToDBID)>
	
		<cfquery name="qGetClaim_ProcessXMLToDB" datasource="#trim(request.datasource)#">
	  		SELECT Claim_ProcessXMLToDBID,InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode,DateCreated,DateModified
			FROM claim_processxmltodb  
			WHERE Claim_ProcessXMLToDBID = #trim(arguments.Claim_ProcessXMLToDBID)# 
		</cfquery>
		
		<cfif qGetClaim_ProcessXMLToDB.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID EQ "" OR qGetClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID EQ "NULL") 
				variables.instance.Claim_ProcessXMLToDBID = "NULL"; 
			ELSE 
				variables.instance.Claim_ProcessXMLToDBID = qGetClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID;
				
			IF(qGetClaim_ProcessXMLToDB.InterchangeID EQ "" OR qGetClaim_ProcessXMLToDB.InterchangeID EQ "NULL") 
				variables.instance.InterchangeID = "NULL"; 
			ELSE 
				variables.instance.InterchangeID = qGetClaim_ProcessXMLToDB.InterchangeID;
							
				variables.instance.ClaimXML = qGetClaim_ProcessXMLToDB.ClaimXML;
							
				variables.instance.ProviderID = qGetClaim_ProcessXMLToDB.ProviderID;
				
			IF(qGetClaim_ProcessXMLToDB.PatientID EQ "" OR qGetClaim_ProcessXMLToDB.PatientID EQ "NULL") 
				variables.instance.PatientID = "NULL"; 
			ELSE 
				variables.instance.PatientID = qGetClaim_ProcessXMLToDB.PatientID;
							
				variables.instance.interchangeClaimID = qGetClaim_ProcessXMLToDB.interchangeClaimID;
							
				variables.instance.PossiblePatientID = qGetClaim_ProcessXMLToDB.PossiblePatientID;
							
				variables.instance.Active = qGetClaim_ProcessXMLToDB.Active;
				
			IF(qGetClaim_ProcessXMLToDB.InactiveCode EQ "" OR qGetClaim_ProcessXMLToDB.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetClaim_ProcessXMLToDB.InactiveCode;
							
				variables.instance.DateCreated = qGetClaim_ProcessXMLToDB.DateCreated;
							
				variables.instance.DateModified = qGetClaim_ProcessXMLToDB.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(Claim_ProcessXMLToDBID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitClaim_ProcessXMLToDB = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.Claim_ProcessXMLToDBID) AND variables.instance.Claim_ProcessXMLToDBID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitClaim_ProcessXMLToDB" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitClaim_ProcessXMLToDB" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.Claim_ProcessXMLToDBID = qInsertCommitClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID>
				
				<cfreturn qInsertCommitClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID>
			
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
			<cfset tableColumns = "Claim_ProcessXMLToDBID,InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ClaimXML,ProviderID,interchangeClaimID,PossiblePatientID,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

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
				<cfset sqlStatement = "UPDATE claim_processxmltodb  SET #columnsToUpdate# WHERE Claim_ProcessXMLToDBID = #trim(variables.instance.Claim_ProcessXMLToDBID)#">
				
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
			<cfset stringTableColumns = "ClaimXML,ProviderID,interchangeClaimID,PossiblePatientID,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO claim_processxmltodb  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS Claim_ProcessXMLToDBID ">
				
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
	<cffunction name="getClaim_ProcessXMLToDBQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getClaim_ProcessXMLToDBQuery">						
		<cfargument name="Fields" required="No" type="String" default="Claim_ProcessXMLToDBID,InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="Claim_ProcessXMLToDBID" required="No" type="String" default="">
		<cfargument name="Claim_ProcessXMLToDBID_IN" required="No" type="String" default="">
		<cfargument name="Claim_ProcessXMLToDBID_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeID" required="No" type="String" default="">
		<cfargument name="InterchangeID_IN" required="No" type="String" default="">
		<cfargument name="InterchangeID_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimXML" required="No" type="String" default="">
		<cfargument name="ClaimXML_IN" required="No" type="String" default="">
		<cfargument name="ClaimXML_LIKE" required="No" type="String" default="">
		<cfargument name="ProviderID" required="No" type="String" default="">
		<cfargument name="ProviderID_IN" required="No" type="String" default="">
		<cfargument name="ProviderID_LIKE" required="No" type="String" default="">
		<cfargument name="PatientID" required="No" type="String" default="">
		<cfargument name="PatientID_IN" required="No" type="String" default="">
		<cfargument name="PatientID_LIKE" required="No" type="String" default="">
		<cfargument name="interchangeClaimID" required="No" type="String" default="">
		<cfargument name="interchangeClaimID_IN" required="No" type="String" default="">
		<cfargument name="interchangeClaimID_LIKE" required="No" type="String" default="">
		<cfargument name="PossiblePatientID" required="No" type="String" default="">
		<cfargument name="PossiblePatientID_IN" required="No" type="String" default="">
		<cfargument name="PossiblePatientID_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
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
			<cfset availableColumns = "Claim_ProcessXMLToDBID,Claim_ProcessXMLToDBID_IN,Claim_ProcessXMLToDBID_LIKE,InterchangeID,InterchangeID_IN,InterchangeID_LIKE,ClaimXML,ClaimXML_IN,ClaimXML_LIKE,ProviderID,ProviderID_IN,ProviderID_LIKE,PatientID,PatientID_IN,PatientID_LIKE,interchangeClaimID,interchangeClaimID_IN,interchangeClaimID_LIKE,PossiblePatientID,PossiblePatientID_IN,PossiblePatientID_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Claim_ProcessXMLToDB"
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
			<cfquery Name="getClaim_ProcessXMLToDBQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM claim_processxmltodb   
				WHERE 1=1
					<cfif Claim_ProcessXMLToDBID NEQ "" AND IsNumeric(Claim_ProcessXMLToDBID)>AND Claim_ProcessXMLToDBID = #Claim_ProcessXMLToDBID#</cfif>
					<cfif Claim_ProcessXMLToDBID_IN NEQ "">AND Claim_ProcessXMLToDBID IN(#trim(Claim_ProcessXMLToDBID_IN)#)</cfif>
					<cfif Claim_ProcessXMLToDBID_LIKE NEQ "">AND Claim_ProcessXMLToDBID LIKE '%#trim(Claim_ProcessXMLToDBID_LIKE)#%'</cfif>
					<cfif InterchangeID NEQ "" AND IsNumeric(InterchangeID)>AND InterchangeID = #InterchangeID#</cfif>
					<cfif InterchangeID_IN NEQ "">AND InterchangeID IN(#trim(InterchangeID_IN)#)</cfif>
					<cfif InterchangeID_LIKE NEQ "">AND InterchangeID LIKE '%#trim(InterchangeID_LIKE)#%'</cfif>
					<cfif ClaimXML NEQ "">AND ClaimXML = '#ClaimXML#'</cfif>
					<cfif ClaimXML_IN NEQ "">AND ClaimXML IN(#trim(ClaimXML_IN)#)</cfif>
					<cfif ClaimXML_LIKE NEQ "">AND ClaimXML LIKE '%#trim(ClaimXML_LIKE)#%'</cfif>
					<cfif ProviderID NEQ "">AND ProviderID = '#ProviderID#'</cfif>
					<cfif ProviderID_IN NEQ "">AND ProviderID IN(#trim(ProviderID_IN)#)</cfif>
					<cfif ProviderID_LIKE NEQ "">AND ProviderID LIKE '%#trim(ProviderID_LIKE)#%'</cfif>
					<cfif PatientID NEQ "" AND IsNumeric(PatientID)>AND PatientID = #PatientID#</cfif>
					<cfif PatientID_IN NEQ "">AND PatientID IN(#trim(PatientID_IN)#)</cfif>
					<cfif PatientID_LIKE NEQ "">AND PatientID LIKE '%#trim(PatientID_LIKE)#%'</cfif>
					<cfif interchangeClaimID NEQ "">AND interchangeClaimID = '#interchangeClaimID#'</cfif>
					<cfif interchangeClaimID_IN NEQ "">AND interchangeClaimID IN(#trim(interchangeClaimID_IN)#)</cfif>
					<cfif interchangeClaimID_LIKE NEQ "">AND interchangeClaimID LIKE '%#trim(interchangeClaimID_LIKE)#%'</cfif>
					<cfif PossiblePatientID NEQ "">AND PossiblePatientID = '#PossiblePatientID#'</cfif>
					<cfif PossiblePatientID_IN NEQ "">AND PossiblePatientID IN(#trim(PossiblePatientID_IN)#)</cfif>
					<cfif PossiblePatientID_LIKE NEQ "">AND PossiblePatientID LIKE '%#trim(PossiblePatientID_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getClaim_ProcessXMLToDBQuery>
		
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


