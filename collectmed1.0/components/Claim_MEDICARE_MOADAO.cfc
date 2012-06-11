 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_MEDICARE_MOABean" />
		
		<cfset var qCreateClaim_MEDICARE_MOA = "" />		
		
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localReimbursementRate = arguments.bean.getReimbursementRate() />
		<cfset var localMOACode = arguments.bean.getMOACode() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaim_MEDICARE_MOA" datasource="#trim(arguments.ds)#">
				INSERT INTO claim_medicare_moa (ClaimID,ReimbursementRate,MOACode)
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
			arguments.bean.setClaim_MEDICARE_MOAID(qCreateClaim_MEDICARE_MOA.Claim_MEDICARE_MOAID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Claim_MEDICARE_MOABean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_MOAID" required="yes" type="numeric" />		
		<cfset var qGetClaim_MEDICARE_MOA = "" />		
		
		<cfset qGetClaim_MEDICARE_MOA = getClaim_MEDICARE_MOA(trim(arguments.ds), trim(Claim_MEDICARE_MOAID)) />
				
		<cfif qGetClaim_MEDICARE_MOA.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClaim_MEDICARE_MOA = createObject("component", "Claim_MEDICARE_MOABean").init(arguments.ds);
			objClaim_MEDICARE_MOA.setClaim_MEDICARE_MOAID(qGetClaim_MEDICARE_MOA.Claim_MEDICARE_MOAID);
			objClaim_MEDICARE_MOA.setClaimID(qGetClaim_MEDICARE_MOA.ClaimID);
			objClaim_MEDICARE_MOA.setReimbursementRate(qGetClaim_MEDICARE_MOA.ReimbursementRate);
			objClaim_MEDICARE_MOA.setMOACode(qGetClaim_MEDICARE_MOA.MOACode);
			objClaim_MEDICARE_MOA.setDateCreated(qGetClaim_MEDICARE_MOA.DateCreated);				
			return objClaim_MEDICARE_MOA;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_MEDICARE_MOABean" />
		<cfset var qUpdateClaim_MEDICARE_MOA = "" />
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localReimbursementRate = arguments.bean.getReimbursementRate() />
		<cfset var localMOACode = arguments.bean.getMOACode() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaim_MEDICARE_MOA" datasource="#trim(arguments.ds)#">
				UPDATE claim_medicare_moa  SET
					
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
				WHERE Claim_MEDICARE_MOAID = <cfqueryparam value="#trim(arguments.bean.getClaim_MEDICARE_MOAID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_MEDICARE_MOABean" />
		<cfset var qDeleteClaim_MEDICARE_MOA = "">

		<cfquery name="qDeleteClaim_MEDICARE_MOA" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM claim_medicare_moa 
			WHERE Claim_MEDICARE_MOAID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaim_MEDICARE_MOAID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaim_MEDICARE_MOA" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_MOAID" required="yes" type="numeric" />		
		<cfset var qGetClaim_MEDICARE_MOA = "" />		
	
		<cfquery name="qGetClaim_MEDICARE_MOA" datasource="#trim(arguments.ds)#">
	  		SELECT Claim_MEDICARE_MOAID,ClaimID,ReimbursementRate,MOACode,DateCreated
			FROM claim_medicare_moa  
			WHERE Claim_MEDICARE_MOAID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Claim_MEDICARE_MOAID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaim_MEDICARE_MOA>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


