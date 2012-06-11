 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTBean" />
		
		<cfset var qCreateClaim_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
		
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localQualifierCode = arguments.bean.getQualifierCode() />
		<cfset var localMonetaryAmount2 = arguments.bean.getMonetaryAmount2() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaim_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#">
				INSERT INTO claim_medicare_supplemental_amount (ClaimID,QualifierCode,MonetaryAmount2,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localMonetaryAmount2)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClaim_MEDICARE_SUPPLEMENTAL_AMOUNTID(qCreateClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="yes" type="numeric" />		
		<cfset var qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
		
		<cfset qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT = getClaim_MEDICARE_SUPPLEMENTAL_AMOUNT(trim(arguments.ds), trim(Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID)) />
				
		<cfif qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT = createObject("component", "Claim_MEDICARE_SUPPLEMENTAL_AMOUNTBean").init(arguments.ds);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setClaim_MEDICARE_SUPPLEMENTAL_AMOUNTID(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setClaimID(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.ClaimID);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setQualifierCode(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.QualifierCode);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setMonetaryAmount2(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.MonetaryAmount2);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setActive(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.Active);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setInactiveCode(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.InactiveCode);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setDateCreated(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.DateCreated);
			objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.setDateModified(qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT.DateModified);				
			return objClaim_MEDICARE_SUPPLEMENTAL_AMOUNT;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTBean" />
		<cfset var qUpdateClaim_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localQualifierCode = arguments.bean.getQualifierCode() />
		<cfset var localMonetaryAmount2 = arguments.bean.getMonetaryAmount2() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaim_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#">
				UPDATE claim_medicare_supplemental_amount  SET
					
					ClaimID =						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					QualifierCode =						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_INTEGER" />,
					
					MonetaryAmount2 =						
						<cfqueryparam value="#trim(localMonetaryAmount2)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam value="#trim(arguments.bean.getClaim_MEDICARE_SUPPLEMENTAL_AMOUNTID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTBean" />
		<cfset var qDeleteClaim_MEDICARE_SUPPLEMENTAL_AMOUNT = "">

		<cfquery name="qDeleteClaim_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM claim_medicare_supplemental_amount
			WHERE Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaim_MEDICARE_SUPPLEMENTAL_AMOUNTID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaim_MEDICARE_SUPPLEMENTAL_AMOUNT" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="yes" type="numeric" />		
		<cfset var qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
	
		<cfquery name="qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#">
	  		SELECT Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID,ClaimID,QualifierCode,MonetaryAmount2,Active,InactiveCode,DateCreated,DateModified
			FROM claim_medicare_supplemental_amount  
			WHERE Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaim_MEDICARE_SUPPLEMENTAL_AMOUNT>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


