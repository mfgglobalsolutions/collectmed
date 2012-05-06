 	


<cfcomponent name="claim_medicare_moaActive" output="false" alias="claim_medicare_moaActive">

	<cfproperty name="Claim_MEDICARE_MOAID" type="numeric" default="0" />
	<cfproperty name="ClaimID" type="numeric" default="" />
	<cfproperty name="ReimbursementRate" type="numeric" default="" />
	<cfproperty name="MOACode" type="string" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.Claim_MEDICARE_MOAID = 0;
		variables.ClaimID = "";
		variables.ReimbursementRate = "";
		variables.MOACode = "";
		variables.DateCreated = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="claim_medicare_moaActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "Claim_MEDICARE_MOAID") AND stValues.Claim_MEDICARE_MOAID NEQ 0>
				<cfquery name="qGetClaim_MEDICARE_MOA" datasource="#trim(variables.ds)#">
			  		SELECT Claim_MEDICARE_MOAID,ClaimID,ReimbursementRate,MOACode,DateCreated
					FROM Claim_MEDICARE_MOA  
					WHERE Claim_MEDICARE_MOAID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.Claim_MEDICARE_MOAID#" /> 
				</cfquery>		
				<cfif qGetClaim_MEDICARE_MOA.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClaimID = qGetClaim_MEDICARE_MOA.ClaimID;
					variables.ReimbursementRate = qGetClaim_MEDICARE_MOA.ReimbursementRate;
					variables.MOACode = qGetClaim_MEDICARE_MOA.MOACode;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "Claim_MEDICARE_MOAID")><cfset variables.Claim_MEDICARE_MOAID = stValues.Claim_MEDICARE_MOAID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimID")><cfset variables.ClaimID = stValues.ClaimID /></cfif>
			<cfif StructKeyExists(stValues, "ReimbursementRate")><cfset variables.ReimbursementRate = stValues.ReimbursementRate /></cfif>
			<cfif StructKeyExists(stValues, "MOACode")><cfset variables.MOACode = stValues.MOACode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Claim_MEDICARE_MOAID.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaim_MEDICARE_MOAID" acess="public" output="false" returntype="any">
		<cfreturn variables.Claim_MEDICARE_MOAID>
	</cffunction>
	
	<cffunction name="setClaim_MEDICARE_MOAID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Claim_MEDICARE_MOAID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Claim_MEDICARE_MOAID)) OR trim(arguments.Claim_MEDICARE_MOAID) EQ "">
			<cfset variables.Claim_MEDICARE_MOAID = arguments.Claim_MEDICARE_MOAID />
		<cfelse>
			<cfthrow message="Claim_MEDICARE_MOAID (#arguments.Claim_MEDICARE_MOAID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Claim_MEDICARE_MOAID") />		
		
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
	<!--- GET and SET methods for ReimbursementRate.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getReimbursementRate" acess="public" output="false" returntype="any">
		<cfreturn variables.ReimbursementRate>
	</cffunction>
	
	<cffunction name="setReimbursementRate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ReimbursementRate" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ReimbursementRate)) OR trim(arguments.ReimbursementRate) EQ "">
			<cfset variables.ReimbursementRate = arguments.ReimbursementRate />
		<cfelse>
			<cfthrow message="ReimbursementRate (#arguments.ReimbursementRate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ReimbursementRate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOACode.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOACode" acess="public" output="false" returntype="any">
		<cfreturn variables.MOACode>
	</cffunction>
	
	<cffunction name="setMOACode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOACode" required="true" type="any" />
			
		<cfset variables.MOACode = arguments.MOACode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOACode") />		
		
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
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getClaim_MEDICARE_MOAID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getClaim_MEDICARE_MOAID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaim_MEDICARE_MOA" output="false" access="public" returntype="query">
				
		<cfargument name="Claim_MEDICARE_MOAID" required="yes" type="numeric" />		
		<cfset var qGetClaim_MEDICARE_MOA = "" />		
	
		<cfquery name="qGetClaim_MEDICARE_MOA" datasource="#trim(variables.ds)#">
	  		SELECT Claim_MEDICARE_MOAID,ClaimID,ReimbursementRate,MOACode,DateCreated
			FROM Claim_MEDICARE_MOA  
			WHERE Claim_MEDICARE_MOAID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Claim_MEDICARE_MOAID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaim_MEDICARE_MOA>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Claim_MEDICARE_MOAActive" />
		
		<cfset var qCreateClaim_MEDICARE_MOA = "" />		
		
		<cfset var localClaimID = arguments.obj.getClaimID() />
		<cfset var localReimbursementRate = arguments.obj.getReimbursementRate() />
		<cfset var localMOACode = arguments.obj.getMOACode() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaim_MEDICARE_MOA" datasource="#trim(variables.ds)#">
				INSERT INTO Claim_MEDICARE_MOA (ClaimID,ReimbursementRate,MOACode)
				VALUES (						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localReimbursementRate))>						
						<cfqueryparam value="#trim(localReimbursementRate)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localMOACode) NEQ "" AND trim(localMOACode) NEQ "@@" AND trim(localMOACode) NEQ "NULL">						
						<cfqueryparam value="#trim(localMOACode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Claim_MEDICARE_MOAID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateClaim_MEDICARE_MOA.Claim_MEDICARE_MOAID);
			arguments.obj.setClaim_MEDICARE_MOAID(qCreateClaim_MEDICARE_MOA.Claim_MEDICARE_MOAID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Claim_MEDICARE_MOAActive">
				
		<cfargument name="Claim_MEDICARE_MOAID" required="yes" type="numeric" />		
		<cfset var qGetClaim_MEDICARE_MOA = "" />		
		
		<cfset qGetClaim_MEDICARE_MOA = getClaim_MEDICARE_MOA(trim(Claim_MEDICARE_MOAID)) />
				
		<cfif qGetClaim_MEDICARE_MOA.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setClaim_MEDICARE_MOAID(qGetClaim_MEDICARE_MOA.Claim_MEDICARE_MOAID);
			this.setClaimID(qGetClaim_MEDICARE_MOA.ClaimID);
			this.setReimbursementRate(qGetClaim_MEDICARE_MOA.ReimbursementRate);
			this.setMOACode(qGetClaim_MEDICARE_MOA.MOACode);
			this.setDateCreated(qGetClaim_MEDICARE_MOA.DateCreated);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Claim_MEDICARE_MOAActive" />
		<cfset var qUpdateClaim_MEDICARE_MOA = "" />
		<cfset var localClaimID = arguments.obj.getClaimID() />
		<cfset var localReimbursementRate = arguments.obj.getReimbursementRate() />
		<cfset var localMOACode = arguments.obj.getMOACode() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaim_MEDICARE_MOA" datasource="#trim(variables.ds)#">
				UPDATE Claim_MEDICARE_MOA  SET
					
					ClaimID =						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ReimbursementRate =				
					<cfif IsNumeric(trim(localReimbursementRate))>						
						<cfqueryparam value="#trim(localReimbursementRate)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MOACode =	
					<cfif trim(localMOACode) NEQ "" AND trim(localMOACode) NEQ "@@" AND trim(localMOACode) NEQ "NULL">						
						<cfqueryparam value="#trim(localMOACode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>					
				WHERE Claim_MEDICARE_MOAID = <cfqueryparam value="#trim(arguments.obj.getClaim_MEDICARE_MOAID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="Claim_MEDICARE_MOAActive" />
		<cfset var qDeleteClaim_MEDICARE_MOA = "">

		<cfquery name="qDeleteClaim_MEDICARE_MOA" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Claim_MEDICARE_MOA
			WHERE Claim_MEDICARE_MOAID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getClaim_MEDICARE_MOAID())#" /> 
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


