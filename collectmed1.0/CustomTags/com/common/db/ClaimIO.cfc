<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- ClaimIO.cfc                                                                    --->
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
<!--- This tag is a CFC tag tied to the Claim table in the dB.                       --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_ClaimTable                                                       --->  
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
<!--- ClaimID<br>                                                                    --->
<!--- InterchangeClaimID<br>                                                         --->
<!--- ClientAssignedClaimID<br>                                                      --->
<!--- InterchangeID<br>                                                              --->
<!--- ProviderID<br>                                                                 --->
<!--- ClaimType<br>                                                                  --->
<!--- ClientID<br>                                                                   --->
<!--- EntityID<br>                                                                   --->
<!--- HICNumber<br>                                                                  --->
<!--- ClaimStatusCode<br>                                                            --->
<!--- StatusID<br>                                                                   --->
<!--- ClaimPreviousPaidAmount<br>                                                    --->
<!--- ClaimPaidAmount<br>                                                            --->
<!--- PatientResponsibilityAmount<br>                                                --->
<!--- AssignedToUserID<br>                                                           --->
<!--- DueDate<br>                                                                    --->
<!--- FacilityCode<br>                                                               --->
<!--- CrossoverEntityTypeQualifier2<br>                                              --->
<!--- CrossoverNameLastorOrganizationName3<br>                                       --->
<!--- CrossoverIdentificationCode9<br>                                               --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->  
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


<cfcomponent name="ClaimIO">

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
			variables.instance.ClaimID = "NULL";
			variables.instance.InterchangeClaimID = "";
			variables.instance.ClientAssignedClaimID = "";
			variables.instance.InterchangeID = "NULL";
			variables.instance.ProviderID = "";
			variables.instance.ClaimType = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.EntityID = "NULL";
			variables.instance.HICNumber = "";
			variables.instance.ClaimStatusCode = "NULL";
			variables.instance.StatusID = "NULL";
			variables.instance.ClaimPreviousPaidAmount = "NULL";
			variables.instance.ClaimPaidAmount = "NULL";
			variables.instance.PatientResponsibilityAmount = "NULL";
			variables.instance.AssignedToUserID = "NULL";
			variables.instance.DueDate = "";
			variables.instance.FacilityCode = "";
			variables.instance.CrossoverEntityTypeQualifier2 = "";
			variables.instance.CrossoverNameLastorOrganizationName3 = "";
			variables.instance.CrossoverIdentificationCode9 = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 23)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGECLAIMID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTASSIGNEDCLAIMID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTERCHANGEID", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROVIDERID", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMTYPE", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTITYID", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HICNUMBER", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMSTATUSCODE", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "STATUSID", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMPREVIOUSPAIDAMOUNT", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMPAIDAMOUNT", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTRESPONSIBILITYAMOUNT", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ASSIGNEDTOUSERID", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DUEDATE", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FACILITYCODE", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CROSSOVERENTITYTYPEQUALIFIER2", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CROSSOVERNAMELASTORORGANIZATIONNAME3", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CROSSOVERIDENTIFICATIONCODE9", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 23)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimID.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimID>
	</cffunction>
	 
	<cffunction name="setClaimID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimID" required="Yes" type="String">
		
		<cfif ClaimID NEQ "NULL">	
			
			<cfif arguments.ClaimID EQ "@@" OR arguments.ClaimID EQ "">
				
				<cfset arguments.ClaimID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimID</strong> (#ClaimID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimID = arguments.ClaimID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InterchangeClaimID.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchangeClaimID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InterchangeClaimID>
	</cffunction>
	 
	<cffunction name="setInterchangeClaimID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InterchangeClaimID" required="Yes" type="String">
		
		<cfif InterchangeClaimID NEQ "NULL">	
			
			<cfif arguments.InterchangeClaimID EQ "@@" OR arguments.InterchangeClaimID EQ "">
				
				<cfset arguments.InterchangeClaimID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(InterchangeClaimID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InterchangeClaimID</strong> (#InterchangeClaimID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(InterchangeClaimID) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>InterchangeClaimID</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InterchangeClaimID = arguments.InterchangeClaimID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InterchangeClaimID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientAssignedClaimID.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientAssignedClaimID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientAssignedClaimID>
	</cffunction>
	 
	<cffunction name="setClientAssignedClaimID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientAssignedClaimID" required="Yes" type="String">
		
		<cfif ClientAssignedClaimID NEQ "NULL">	
			
			<cfif arguments.ClientAssignedClaimID EQ "@@" OR arguments.ClientAssignedClaimID EQ "">
				
				<cfset arguments.ClientAssignedClaimID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientAssignedClaimID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientAssignedClaimID</strong> (#ClientAssignedClaimID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientAssignedClaimID) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientAssignedClaimID</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientAssignedClaimID = arguments.ClientAssignedClaimID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientAssignedClaimID")>			
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
	<!--- GET and SET method for ClaimType.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimType" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimType>
	</cffunction>
	 
	<cffunction name="setClaimType" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimType" required="Yes" type="String">
		
		<cfif ClaimType NEQ "NULL">	
			
			<cfif arguments.ClaimType EQ "@@" OR arguments.ClaimType EQ "">
				
				<cfset arguments.ClaimType = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimType)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimType</strong> (#ClaimType#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimType = arguments.ClaimType>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimType")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntityID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntityID>
	</cffunction>
	 
	<cffunction name="setEntityID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntityID" required="Yes" type="String">
		
		<cfif EntityID NEQ "NULL">	
			
			<cfif arguments.EntityID EQ "@@" OR arguments.EntityID EQ "">
				
				<cfset arguments.EntityID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EntityID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntityID</strong> (#EntityID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntityID = arguments.EntityID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EntityID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HICNumber.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHICNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HICNumber>
	</cffunction>
	 
	<cffunction name="setHICNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HICNumber" required="Yes" type="String">
		
		<cfif HICNumber NEQ "NULL">	
			
			<cfif arguments.HICNumber EQ "@@" OR arguments.HICNumber EQ "">
				
				<cfset arguments.HICNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HICNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HICNumber</strong> (#HICNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(HICNumber) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HICNumber</strong> cannot be greater than 25 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HICNumber = arguments.HICNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HICNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimStatusCode.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimStatusCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimStatusCode>
	</cffunction>
	 
	<cffunction name="setClaimStatusCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimStatusCode" required="Yes" type="String">
		
		<cfif ClaimStatusCode NEQ "NULL">	
			
			<cfif arguments.ClaimStatusCode EQ "@@" OR arguments.ClaimStatusCode EQ "">
				
				<cfset arguments.ClaimStatusCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimStatusCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimStatusCode</strong> (#ClaimStatusCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimStatusCode = arguments.ClaimStatusCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimStatusCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for StatusID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStatusID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.StatusID>
	</cffunction>
	 
	<cffunction name="setStatusID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="StatusID" required="Yes" type="String">
		
		<cfif StatusID NEQ "NULL">	
			
			<cfif arguments.StatusID EQ "@@" OR arguments.StatusID EQ "">
				
				<cfset arguments.StatusID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(StatusID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>StatusID</strong> (#StatusID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.StatusID = arguments.StatusID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "StatusID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimPreviousPaidAmount.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimPreviousPaidAmount" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimPreviousPaidAmount>
	</cffunction>
	 
	<cffunction name="setClaimPreviousPaidAmount" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimPreviousPaidAmount" required="Yes" type="String">
		
		<cfif ClaimPreviousPaidAmount NEQ "NULL">	
			
			<cfif arguments.ClaimPreviousPaidAmount EQ "@@" OR arguments.ClaimPreviousPaidAmount EQ "">
				
				<cfset arguments.ClaimPreviousPaidAmount = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(ClaimPreviousPaidAmount)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimPreviousPaidAmount</strong> (#ClaimPreviousPaidAmount#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimPreviousPaidAmount = arguments.ClaimPreviousPaidAmount>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimPreviousPaidAmount")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimPaidAmount.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimPaidAmount" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimPaidAmount>
	</cffunction>
	 
	<cffunction name="setClaimPaidAmount" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimPaidAmount" required="Yes" type="String">
		
		<cfif ClaimPaidAmount NEQ "NULL">	
			
			<cfif arguments.ClaimPaidAmount EQ "@@" OR arguments.ClaimPaidAmount EQ "">
				
				<cfset arguments.ClaimPaidAmount = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(ClaimPaidAmount)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimPaidAmount</strong> (#ClaimPaidAmount#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimPaidAmount = arguments.ClaimPaidAmount>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimPaidAmount")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PatientResponsibilityAmount.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientResponsibilityAmount" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientResponsibilityAmount>
	</cffunction>
	 
	<cffunction name="setPatientResponsibilityAmount" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientResponsibilityAmount" required="Yes" type="String">
		
		<cfif PatientResponsibilityAmount NEQ "NULL">	
			
			<cfif arguments.PatientResponsibilityAmount EQ "@@" OR arguments.PatientResponsibilityAmount EQ "">
				
				<cfset arguments.PatientResponsibilityAmount = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(PatientResponsibilityAmount)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientResponsibilityAmount</strong> (#PatientResponsibilityAmount#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientResponsibilityAmount = arguments.PatientResponsibilityAmount>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientResponsibilityAmount")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AssignedToUserID.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAssignedToUserID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AssignedToUserID>
	</cffunction>
	 
	<cffunction name="setAssignedToUserID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AssignedToUserID" required="Yes" type="String">
		
		<cfif AssignedToUserID NEQ "NULL">	
			
			<cfif arguments.AssignedToUserID EQ "@@" OR arguments.AssignedToUserID EQ "">
				
				<cfset arguments.AssignedToUserID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AssignedToUserID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AssignedToUserID</strong> (#AssignedToUserID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AssignedToUserID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DueDate.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDueDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DueDate>
	</cffunction>
	 
	<cffunction name="setDueDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DueDate" required="Yes" type="String">
		
		<cfif DueDate NEQ "NULL" AND DueDate NEQ "NOW">	
			
			<cfif arguments.DueDate EQ "@@" OR arguments.DueDate EQ "">
				
				<cfset arguments.DueDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DueDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DueDate</strong> (#DueDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DueDate = arguments.DueDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DueDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FacilityCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFacilityCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FacilityCode>
	</cffunction>
	 
	<cffunction name="setFacilityCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FacilityCode" required="Yes" type="String">
		
		<cfif FacilityCode NEQ "NULL">	
			
			<cfif arguments.FacilityCode EQ "@@" OR arguments.FacilityCode EQ "">
				
				<cfset arguments.FacilityCode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FacilityCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FacilityCode</strong> (#FacilityCode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FacilityCode) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FacilityCode</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FacilityCode = arguments.FacilityCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FacilityCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CrossoverEntityTypeQualifier2.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCrossoverEntityTypeQualifier2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CrossoverEntityTypeQualifier2>
	</cffunction>
	 
	<cffunction name="setCrossoverEntityTypeQualifier2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CrossoverEntityTypeQualifier2" required="Yes" type="String">
		
		<cfif CrossoverEntityTypeQualifier2 NEQ "NULL">	
			
			<cfif arguments.CrossoverEntityTypeQualifier2 EQ "@@" OR arguments.CrossoverEntityTypeQualifier2 EQ "">
				
				<cfset arguments.CrossoverEntityTypeQualifier2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CrossoverEntityTypeQualifier2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CrossoverEntityTypeQualifier2</strong> (#CrossoverEntityTypeQualifier2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CrossoverEntityTypeQualifier2) GT 2>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CrossoverEntityTypeQualifier2</strong> cannot be greater than 2 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CrossoverEntityTypeQualifier2 = arguments.CrossoverEntityTypeQualifier2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CrossoverEntityTypeQualifier2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CrossoverNameLastorOrganizationName3.                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCrossoverNameLastorOrganizationName3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CrossoverNameLastorOrganizationName3>
	</cffunction>
	 
	<cffunction name="setCrossoverNameLastorOrganizationName3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CrossoverNameLastorOrganizationName3" required="Yes" type="String">
		
		<cfif CrossoverNameLastorOrganizationName3 NEQ "NULL">	
			
			<cfif arguments.CrossoverNameLastorOrganizationName3 EQ "@@" OR arguments.CrossoverNameLastorOrganizationName3 EQ "">
				
				<cfset arguments.CrossoverNameLastorOrganizationName3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CrossoverNameLastorOrganizationName3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CrossoverNameLastorOrganizationName3</strong> (#CrossoverNameLastorOrganizationName3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CrossoverNameLastorOrganizationName3) GT 36>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CrossoverNameLastorOrganizationName3</strong> cannot be greater than 36 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CrossoverNameLastorOrganizationName3 = arguments.CrossoverNameLastorOrganizationName3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CrossoverNameLastorOrganizationName3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CrossoverIdentificationCode9.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCrossoverIdentificationCode9" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CrossoverIdentificationCode9>
	</cffunction>
	 
	<cffunction name="setCrossoverIdentificationCode9" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CrossoverIdentificationCode9" required="Yes" type="String">
		
		<cfif CrossoverIdentificationCode9 NEQ "NULL">	
			
			<cfif arguments.CrossoverIdentificationCode9 EQ "@@" OR arguments.CrossoverIdentificationCode9 EQ "">
				
				<cfset arguments.CrossoverIdentificationCode9 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CrossoverIdentificationCode9)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CrossoverIdentificationCode9</strong> (#CrossoverIdentificationCode9#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CrossoverIdentificationCode9) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CrossoverIdentificationCode9</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CrossoverIdentificationCode9 = arguments.CrossoverIdentificationCode9>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CrossoverIdentificationCode9")>			
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
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="InterchangeClaimID" required="No" type="String" default="">
		<cfargument name="ClientAssignedClaimID" required="No" type="String" default="">
		<cfargument name="InterchangeID" required="No" type="String" default="">
		<cfargument name="ProviderID" required="No" type="String" default="">
		<cfargument name="ClaimType" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="HICNumber" required="No" type="String" default="">
		<cfargument name="ClaimStatusCode" required="No" type="String" default="">
		<cfargument name="StatusID" required="No" type="String" default="">
		<cfargument name="ClaimPreviousPaidAmount" required="No" type="String" default="">
		<cfargument name="ClaimPaidAmount" required="No" type="String" default="">
		<cfargument name="PatientResponsibilityAmount" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="DueDate" required="No" type="String" default="">
		<cfargument name="FacilityCode" required="No" type="String" default="">
		<cfargument name="CrossoverEntityTypeQualifier2" required="No" type="String" default="">
		<cfargument name="CrossoverNameLastorOrganizationName3" required="No" type="String" default="">
		<cfargument name="CrossoverIdentificationCode9" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">

		<cfset variables.instance.InterchangeClaimID = arguments.InterchangeClaimID>
		<cfset variables.instance.ClientAssignedClaimID = arguments.ClientAssignedClaimID>
		<cfset variables.instance.InterchangeID = arguments.InterchangeID>
		<cfset variables.instance.ProviderID = arguments.ProviderID>
		<cfset variables.instance.ClaimType = arguments.ClaimType>
		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.EntityID = arguments.EntityID>
		<cfset variables.instance.HICNumber = arguments.HICNumber>
		<cfset variables.instance.ClaimStatusCode = arguments.ClaimStatusCode>
		<cfset variables.instance.StatusID = arguments.StatusID>
		<cfset variables.instance.ClaimPreviousPaidAmount = arguments.ClaimPreviousPaidAmount>
		<cfset variables.instance.ClaimPaidAmount = arguments.ClaimPaidAmount>
		<cfset variables.instance.PatientResponsibilityAmount = arguments.PatientResponsibilityAmount>
		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>
		<cfset variables.instance.DueDate = arguments.DueDate>
		<cfset variables.instance.FacilityCode = arguments.FacilityCode>
		<cfset variables.instance.CrossoverEntityTypeQualifier2 = arguments.CrossoverEntityTypeQualifier2>
		<cfset variables.instance.CrossoverNameLastorOrganizationName3 = arguments.CrossoverNameLastorOrganizationName3>
		<cfset variables.instance.CrossoverIdentificationCode9 = arguments.CrossoverIdentificationCode9>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="ClaimIO" output="No">
		
		<cfargument name="ClaimID" required="yes" type="numeric">		
		<cfset var qGetClaim = "">
		
		<cfset preInit(ClaimID)>
	
		<cfquery name="qGetClaim" datasource="#trim(request.datasource)#">
	  		SELECT ClaimID,InterchangeClaimID,ClientAssignedClaimID,InterchangeID,ProviderID,ClaimType,ClientID,EntityID,HICNumber,ClaimStatusCode,StatusID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active,InactiveCode,DateCreated
			FROM claim  
			WHERE ClaimID = #trim(arguments.ClaimID)# 
		</cfquery>
		
		<cfif qGetClaim.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetClaim.ClaimID EQ "" OR qGetClaim.ClaimID EQ "NULL") 
				variables.instance.ClaimID = "NULL"; 
			ELSE 
				variables.instance.ClaimID = qGetClaim.ClaimID;
							
				variables.instance.InterchangeClaimID = qGetClaim.InterchangeClaimID;
							
				variables.instance.ClientAssignedClaimID = qGetClaim.ClientAssignedClaimID;
				
			IF(qGetClaim.InterchangeID EQ "" OR qGetClaim.InterchangeID EQ "NULL") 
				variables.instance.InterchangeID = "NULL"; 
			ELSE 
				variables.instance.InterchangeID = qGetClaim.InterchangeID;
							
				variables.instance.ProviderID = qGetClaim.ProviderID;
				
			IF(qGetClaim.ClaimType EQ "" OR qGetClaim.ClaimType EQ "NULL") 
				variables.instance.ClaimType = "NULL"; 
			ELSE 
				variables.instance.ClaimType = qGetClaim.ClaimType;
				
			IF(qGetClaim.ClientID EQ "" OR qGetClaim.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetClaim.ClientID;
				
			IF(qGetClaim.EntityID EQ "" OR qGetClaim.EntityID EQ "NULL") 
				variables.instance.EntityID = "NULL"; 
			ELSE 
				variables.instance.EntityID = qGetClaim.EntityID;
							
				variables.instance.HICNumber = qGetClaim.HICNumber;
				
			IF(qGetClaim.ClaimStatusCode EQ "" OR qGetClaim.ClaimStatusCode EQ "NULL") 
				variables.instance.ClaimStatusCode = "NULL"; 
			ELSE 
				variables.instance.ClaimStatusCode = qGetClaim.ClaimStatusCode;
				
			IF(qGetClaim.StatusID EQ "" OR qGetClaim.StatusID EQ "NULL") 
				variables.instance.StatusID = "NULL"; 
			ELSE 
				variables.instance.StatusID = qGetClaim.StatusID;
				
			IF(qGetClaim.ClaimPreviousPaidAmount EQ "" OR qGetClaim.ClaimPreviousPaidAmount EQ "NULL") 
				variables.instance.ClaimPreviousPaidAmount = "NULL"; 
			ELSE 
				variables.instance.ClaimPreviousPaidAmount = qGetClaim.ClaimPreviousPaidAmount;
				
			IF(qGetClaim.ClaimPaidAmount EQ "" OR qGetClaim.ClaimPaidAmount EQ "NULL") 
				variables.instance.ClaimPaidAmount = "NULL"; 
			ELSE 
				variables.instance.ClaimPaidAmount = qGetClaim.ClaimPaidAmount;
				
			IF(qGetClaim.PatientResponsibilityAmount EQ "" OR qGetClaim.PatientResponsibilityAmount EQ "NULL") 
				variables.instance.PatientResponsibilityAmount = "NULL"; 
			ELSE 
				variables.instance.PatientResponsibilityAmount = qGetClaim.PatientResponsibilityAmount;
				
			IF(qGetClaim.AssignedToUserID EQ "" OR qGetClaim.AssignedToUserID EQ "NULL") 
				variables.instance.AssignedToUserID = "NULL"; 
			ELSE 
				variables.instance.AssignedToUserID = qGetClaim.AssignedToUserID;
							
				variables.instance.DueDate = qGetClaim.DueDate;
							
				variables.instance.FacilityCode = qGetClaim.FacilityCode;
							
				variables.instance.CrossoverEntityTypeQualifier2 = qGetClaim.CrossoverEntityTypeQualifier2;
							
				variables.instance.CrossoverNameLastorOrganizationName3 = qGetClaim.CrossoverNameLastorOrganizationName3;
							
				variables.instance.CrossoverIdentificationCode9 = qGetClaim.CrossoverIdentificationCode9;
							
				variables.instance.Active = qGetClaim.Active;
				
			IF(qGetClaim.InactiveCode EQ "" OR qGetClaim.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetClaim.InactiveCode;
							
				variables.instance.DateCreated = qGetClaim.DateCreated;
				
		</cfscript>		
		  
		<cfset postInit(ClaimID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitClaim = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.ClaimID) AND variables.instance.ClaimID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitClaim" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitClaim" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.ClaimID = qInsertCommitClaim.ClaimID>
				
				<cfreturn qInsertCommitClaim.ClaimID>
			
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
			<cfset tableColumns = "ClaimID,InterchangeClaimID,ClientAssignedClaimID,InterchangeID,ProviderID,ClaimType,ClientID,EntityID,HICNumber,ClaimStatusCode,StatusID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active,InactiveCode,DateCreated">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "InterchangeClaimID,ClientAssignedClaimID,ProviderID,HICNumber,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DueDate,DateCreated">

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
				<cfset sqlStatement = "UPDATE claim  SET #columnsToUpdate# WHERE ClaimID = #trim(variables.instance.ClaimID)#">
				
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
			<cfset stringTableColumns = "InterchangeClaimID,ClientAssignedClaimID,ProviderID,HICNumber,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DueDate,DateCreated">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="InterchangeClaimID,ClientAssignedClaimID,InterchangeID,ProviderID,ClaimType,ClientID,EntityID,HICNumber,ClaimStatusCode,StatusID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active,InactiveCode,DateCreated" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO claim  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS ClaimID ">
				
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
	<cffunction name="getClaimQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getClaimQuery">						
		<cfargument name="Fields" required="No" type="String" default="ClaimID,InterchangeClaimID,ClientAssignedClaimID,InterchangeID,ProviderID,ClaimType,ClientID,EntityID,HICNumber,ClaimStatusCode,StatusID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active,InactiveCode,DateCreated">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="ClaimID" required="No" type="String" default="">
		<cfargument name="ClaimID_IN" required="No" type="String" default="">
		<cfargument name="ClaimID_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeClaimID" required="No" type="String" default="">
		<cfargument name="InterchangeClaimID_IN" required="No" type="String" default="">
		<cfargument name="InterchangeClaimID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientAssignedClaimID" required="No" type="String" default="">
		<cfargument name="ClientAssignedClaimID_IN" required="No" type="String" default="">
		<cfargument name="ClientAssignedClaimID_LIKE" required="No" type="String" default="">
		<cfargument name="InterchangeID" required="No" type="String" default="">
		<cfargument name="InterchangeID_IN" required="No" type="String" default="">
		<cfargument name="InterchangeID_LIKE" required="No" type="String" default="">
		<cfargument name="ProviderID" required="No" type="String" default="">
		<cfargument name="ProviderID_IN" required="No" type="String" default="">
		<cfargument name="ProviderID_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimType" required="No" type="String" default="">
		<cfargument name="ClaimType_IN" required="No" type="String" default="">
		<cfargument name="ClaimType_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="EntityID_IN" required="No" type="String" default="">
		<cfargument name="EntityID_LIKE" required="No" type="String" default="">
		<cfargument name="HICNumber" required="No" type="String" default="">
		<cfargument name="HICNumber_IN" required="No" type="String" default="">
		<cfargument name="HICNumber_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimStatusCode" required="No" type="String" default="">
		<cfargument name="ClaimStatusCode_IN" required="No" type="String" default="">
		<cfargument name="ClaimStatusCode_LIKE" required="No" type="String" default="">
		<cfargument name="StatusID" required="No" type="String" default="">
		<cfargument name="StatusID_IN" required="No" type="String" default="">
		<cfargument name="StatusID_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimPreviousPaidAmount" required="No" type="String" default="">
		<cfargument name="ClaimPreviousPaidAmount_IN" required="No" type="String" default="">
		<cfargument name="ClaimPreviousPaidAmount_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimPaidAmount" required="No" type="String" default="">
		<cfargument name="ClaimPaidAmount_IN" required="No" type="String" default="">
		<cfargument name="ClaimPaidAmount_LIKE" required="No" type="String" default="">
		<cfargument name="PatientResponsibilityAmount" required="No" type="String" default="">
		<cfargument name="PatientResponsibilityAmount_IN" required="No" type="String" default="">
		<cfargument name="PatientResponsibilityAmount_LIKE" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_IN" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_LIKE" required="No" type="String" default="">
		<cfargument name="DueDate" required="No" type="String" default="">
		<cfargument name="DueDate_IN" required="No" type="String" default="">
		<cfargument name="DueDate_LIKE" required="No" type="String" default="">
		<cfargument name="FacilityCode" required="No" type="String" default="">
		<cfargument name="FacilityCode_IN" required="No" type="String" default="">
		<cfargument name="FacilityCode_LIKE" required="No" type="String" default="">
		<cfargument name="CrossoverEntityTypeQualifier2" required="No" type="String" default="">
		<cfargument name="CrossoverEntityTypeQualifier2_IN" required="No" type="String" default="">
		<cfargument name="CrossoverEntityTypeQualifier2_LIKE" required="No" type="String" default="">
		<cfargument name="CrossoverNameLastorOrganizationName3" required="No" type="String" default="">
		<cfargument name="CrossoverNameLastorOrganizationName3_IN" required="No" type="String" default="">
		<cfargument name="CrossoverNameLastorOrganizationName3_LIKE" required="No" type="String" default="">
		<cfargument name="CrossoverIdentificationCode9" required="No" type="String" default="">
		<cfargument name="CrossoverIdentificationCode9_IN" required="No" type="String" default="">
		<cfargument name="CrossoverIdentificationCode9_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">

		
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
			<cfset availableColumns = "ClaimID,ClaimID_IN,ClaimID_LIKE,InterchangeClaimID,InterchangeClaimID_IN,InterchangeClaimID_LIKE,ClientAssignedClaimID,ClientAssignedClaimID_IN,ClientAssignedClaimID_LIKE,InterchangeID,InterchangeID_IN,InterchangeID_LIKE,ProviderID,ProviderID_IN,ProviderID_LIKE,ClaimType,ClaimType_IN,ClaimType_LIKE,ClientID,ClientID_IN,ClientID_LIKE,EntityID,EntityID_IN,EntityID_LIKE,HICNumber,HICNumber_IN,HICNumber_LIKE,ClaimStatusCode,ClaimStatusCode_IN,ClaimStatusCode_LIKE,StatusID,StatusID_IN,StatusID_LIKE,ClaimPreviousPaidAmount,ClaimPreviousPaidAmount_IN,ClaimPreviousPaidAmount_LIKE,ClaimPaidAmount,ClaimPaidAmount_IN,ClaimPaidAmount_LIKE,PatientResponsibilityAmount,PatientResponsibilityAmount_IN,PatientResponsibilityAmount_LIKE,AssignedToUserID,AssignedToUserID_IN,AssignedToUserID_LIKE,DueDate,DueDate_IN,DueDate_LIKE,FacilityCode,FacilityCode_IN,FacilityCode_LIKE,CrossoverEntityTypeQualifier2,CrossoverEntityTypeQualifier2_IN,CrossoverEntityTypeQualifier2_LIKE,CrossoverNameLastorOrganizationName3,CrossoverNameLastorOrganizationName3_IN,CrossoverNameLastorOrganizationName3_LIKE,CrossoverIdentificationCode9,CrossoverIdentificationCode9_IN,CrossoverIdentificationCode9_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Claim"
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
			<cfquery Name="getClaimQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM claim   
				WHERE 1=1
					<cfif ClaimID NEQ "" AND IsNumeric(ClaimID)>AND ClaimID = #ClaimID#</cfif>
					<cfif ClaimID_IN NEQ "">AND ClaimID IN(#trim(ClaimID_IN)#)</cfif>
					<cfif ClaimID_LIKE NEQ "">AND ClaimID LIKE '%#trim(ClaimID_LIKE)#%'</cfif>
					<cfif InterchangeClaimID NEQ "">AND InterchangeClaimID = '#InterchangeClaimID#'</cfif>
					<cfif InterchangeClaimID_IN NEQ "">AND InterchangeClaimID IN(#trim(InterchangeClaimID_IN)#)</cfif>
					<cfif InterchangeClaimID_LIKE NEQ "">AND InterchangeClaimID LIKE '%#trim(InterchangeClaimID_LIKE)#%'</cfif>
					<cfif ClientAssignedClaimID NEQ "">AND ClientAssignedClaimID = '#ClientAssignedClaimID#'</cfif>
					<cfif ClientAssignedClaimID_IN NEQ "">AND ClientAssignedClaimID IN(#trim(ClientAssignedClaimID_IN)#)</cfif>
					<cfif ClientAssignedClaimID_LIKE NEQ "">AND ClientAssignedClaimID LIKE '%#trim(ClientAssignedClaimID_LIKE)#%'</cfif>
					<cfif InterchangeID NEQ "" AND IsNumeric(InterchangeID)>AND InterchangeID = #InterchangeID#</cfif>
					<cfif InterchangeID_IN NEQ "">AND InterchangeID IN(#trim(InterchangeID_IN)#)</cfif>
					<cfif InterchangeID_LIKE NEQ "">AND InterchangeID LIKE '%#trim(InterchangeID_LIKE)#%'</cfif>
					<cfif ProviderID NEQ "">AND ProviderID = '#ProviderID#'</cfif>
					<cfif ProviderID_IN NEQ "">AND ProviderID IN(#trim(ProviderID_IN)#)</cfif>
					<cfif ProviderID_LIKE NEQ "">AND ProviderID LIKE '%#trim(ProviderID_LIKE)#%'</cfif>
					<cfif ClaimType NEQ "" AND IsNumeric(ClaimType)>AND ClaimType = #ClaimType#</cfif>
					<cfif ClaimType_IN NEQ "">AND ClaimType IN(#trim(ClaimType_IN)#)</cfif>
					<cfif ClaimType_LIKE NEQ "">AND ClaimType LIKE '%#trim(ClaimType_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif EntityID NEQ "" AND IsNumeric(EntityID)>AND EntityID = #EntityID#</cfif>
					<cfif EntityID_IN NEQ "">AND EntityID IN(#trim(EntityID_IN)#)</cfif>
					<cfif EntityID_LIKE NEQ "">AND EntityID LIKE '%#trim(EntityID_LIKE)#%'</cfif>
					<cfif HICNumber NEQ "">AND HICNumber = '#HICNumber#'</cfif>
					<cfif HICNumber_IN NEQ "">AND HICNumber IN(#trim(HICNumber_IN)#)</cfif>
					<cfif HICNumber_LIKE NEQ "">AND HICNumber LIKE '%#trim(HICNumber_LIKE)#%'</cfif>
					<cfif ClaimStatusCode NEQ "" AND IsNumeric(ClaimStatusCode)>AND ClaimStatusCode = #ClaimStatusCode#</cfif>
					<cfif ClaimStatusCode_IN NEQ "">AND ClaimStatusCode IN(#trim(ClaimStatusCode_IN)#)</cfif>
					<cfif ClaimStatusCode_LIKE NEQ "">AND ClaimStatusCode LIKE '%#trim(ClaimStatusCode_LIKE)#%'</cfif>
					<cfif StatusID NEQ "" AND IsNumeric(StatusID)>AND StatusID = #StatusID#</cfif>
					<cfif StatusID_IN NEQ "">AND StatusID IN(#trim(StatusID_IN)#)</cfif>
					<cfif StatusID_LIKE NEQ "">AND StatusID LIKE '%#trim(StatusID_LIKE)#%'</cfif>
					<cfif ClaimPreviousPaidAmount NEQ "" AND IsNumeric(ClaimPreviousPaidAmount)>AND ClaimPreviousPaidAmount = #ClaimPreviousPaidAmount#</cfif>
					<cfif ClaimPreviousPaidAmount_IN NEQ "">AND ClaimPreviousPaidAmount IN(#trim(ClaimPreviousPaidAmount_IN)#)</cfif>
					<cfif ClaimPreviousPaidAmount_LIKE NEQ "">AND ClaimPreviousPaidAmount LIKE '%#trim(ClaimPreviousPaidAmount_LIKE)#%'</cfif>
					<cfif ClaimPaidAmount NEQ "" AND IsNumeric(ClaimPaidAmount)>AND ClaimPaidAmount = #ClaimPaidAmount#</cfif>
					<cfif ClaimPaidAmount_IN NEQ "">AND ClaimPaidAmount IN(#trim(ClaimPaidAmount_IN)#)</cfif>
					<cfif ClaimPaidAmount_LIKE NEQ "">AND ClaimPaidAmount LIKE '%#trim(ClaimPaidAmount_LIKE)#%'</cfif>
					<cfif PatientResponsibilityAmount NEQ "" AND IsNumeric(PatientResponsibilityAmount)>AND PatientResponsibilityAmount = #PatientResponsibilityAmount#</cfif>
					<cfif PatientResponsibilityAmount_IN NEQ "">AND PatientResponsibilityAmount IN(#trim(PatientResponsibilityAmount_IN)#)</cfif>
					<cfif PatientResponsibilityAmount_LIKE NEQ "">AND PatientResponsibilityAmount LIKE '%#trim(PatientResponsibilityAmount_LIKE)#%'</cfif>
					<cfif AssignedToUserID NEQ "" AND IsNumeric(AssignedToUserID)>AND AssignedToUserID = #AssignedToUserID#</cfif>
					<cfif AssignedToUserID_IN NEQ "">AND AssignedToUserID IN(#trim(AssignedToUserID_IN)#)</cfif>
					<cfif AssignedToUserID_LIKE NEQ "">AND AssignedToUserID LIKE '%#trim(AssignedToUserID_LIKE)#%'</cfif>
					<cfif DueDate NEQ "">AND DueDate = '#DueDate#'</cfif>
					<cfif DueDate_IN NEQ "">AND DueDate IN(#trim(DueDate_IN)#)</cfif>
					<cfif DueDate_LIKE NEQ "">AND DueDate LIKE '%#trim(DueDate_LIKE)#%'</cfif>
					<cfif FacilityCode NEQ "">AND FacilityCode = '#FacilityCode#'</cfif>
					<cfif FacilityCode_IN NEQ "">AND FacilityCode IN(#trim(FacilityCode_IN)#)</cfif>
					<cfif FacilityCode_LIKE NEQ "">AND FacilityCode LIKE '%#trim(FacilityCode_LIKE)#%'</cfif>
					<cfif CrossoverEntityTypeQualifier2 NEQ "">AND CrossoverEntityTypeQualifier2 = '#CrossoverEntityTypeQualifier2#'</cfif>
					<cfif CrossoverEntityTypeQualifier2_IN NEQ "">AND CrossoverEntityTypeQualifier2 IN(#trim(CrossoverEntityTypeQualifier2_IN)#)</cfif>
					<cfif CrossoverEntityTypeQualifier2_LIKE NEQ "">AND CrossoverEntityTypeQualifier2 LIKE '%#trim(CrossoverEntityTypeQualifier2_LIKE)#%'</cfif>
					<cfif CrossoverNameLastorOrganizationName3 NEQ "">AND CrossoverNameLastorOrganizationName3 = '#CrossoverNameLastorOrganizationName3#'</cfif>
					<cfif CrossoverNameLastorOrganizationName3_IN NEQ "">AND CrossoverNameLastorOrganizationName3 IN(#trim(CrossoverNameLastorOrganizationName3_IN)#)</cfif>
					<cfif CrossoverNameLastorOrganizationName3_LIKE NEQ "">AND CrossoverNameLastorOrganizationName3 LIKE '%#trim(CrossoverNameLastorOrganizationName3_LIKE)#%'</cfif>
					<cfif CrossoverIdentificationCode9 NEQ "">AND CrossoverIdentificationCode9 = '#CrossoverIdentificationCode9#'</cfif>
					<cfif CrossoverIdentificationCode9_IN NEQ "">AND CrossoverIdentificationCode9 IN(#trim(CrossoverIdentificationCode9_IN)#)</cfif>
					<cfif CrossoverIdentificationCode9_LIKE NEQ "">AND CrossoverIdentificationCode9 LIKE '%#trim(CrossoverIdentificationCode9_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getClaimQuery>
		
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



