 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimBean" />
		
		<cfset var qCreateClaim = "" />		
		
		<cfset var localInterchangeClaimID = arguments.bean.getInterchangeClaimID() />
		<cfset var localClientAssignedClaimID = arguments.bean.getClientAssignedClaimID() />
		<cfset var localInterchangeID = arguments.bean.getInterchangeID() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localClaimType = arguments.bean.getClaimType() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localHICNumber = arguments.bean.getHICNumber() />
		<cfset var localClaimStatusCode = arguments.bean.getClaimStatusCode() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localClaimPreviousPaidAmount = arguments.bean.getClaimPreviousPaidAmount() />
		<cfset var localClaimPaidAmount = arguments.bean.getClaimPaidAmount() />
		<cfset var localPatientResponsibilityAmount = arguments.bean.getPatientResponsibilityAmount() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localDueDate = arguments.bean.getDueDate() />
		<cfset var localFacilityCode = arguments.bean.getFacilityCode() />
		<cfset var localCrossoverEntityTypeQualifier2 = arguments.bean.getCrossoverEntityTypeQualifier2() />
		<cfset var localCrossoverNameLastorOrganizationName3 = arguments.bean.getCrossoverNameLastorOrganizationName3() />
		<cfset var localCrossoverIdentificationCode9 = arguments.bean.getCrossoverIdentificationCode9() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaim" datasource="#trim(arguments.ds)#">
				INSERT INTO Claim (InterchangeClaimID,ClientAssignedClaimID,InterchangeID,ProviderID,ClaimType,ClientID,EntityID,HICNumber,ClaimStatusCode,StatusID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localInterchangeClaimID)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localClientAssignedClaimID) NEQ "" AND trim(localClientAssignedClaimID) NEQ "@@" AND trim(localClientAssignedClaimID) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientAssignedClaimID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localInterchangeID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localClaimType)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localHICNumber) NEQ "" AND trim(localHICNumber) NEQ "@@" AND trim(localHICNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localHICNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimStatusCode))>						
						<cfqueryparam value="#trim(localClaimStatusCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localStatusID))>						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimPreviousPaidAmount))>						
						<cfqueryparam value="#trim(localClaimPreviousPaidAmount)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimPaidAmount))>						
						<cfqueryparam value="#trim(localClaimPaidAmount)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localPatientResponsibilityAmount))>						
						<cfqueryparam value="#trim(localPatientResponsibilityAmount)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif IsDate(trim(localDueDate))>						
						<cfqueryparam value="#trim(localDueDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localFacilityCode) NEQ "" AND trim(localFacilityCode) NEQ "@@" AND trim(localFacilityCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localFacilityCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCrossoverEntityTypeQualifier2) NEQ "" AND trim(localCrossoverEntityTypeQualifier2) NEQ "@@" AND trim(localCrossoverEntityTypeQualifier2) NEQ "NULL">						
						<cfqueryparam value="#trim(localCrossoverEntityTypeQualifier2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCrossoverNameLastorOrganizationName3) NEQ "" AND trim(localCrossoverNameLastorOrganizationName3) NEQ "@@" AND trim(localCrossoverNameLastorOrganizationName3) NEQ "NULL">						
						<cfqueryparam value="#trim(localCrossoverNameLastorOrganizationName3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCrossoverIdentificationCode9) NEQ "" AND trim(localCrossoverIdentificationCode9) NEQ "@@" AND trim(localCrossoverIdentificationCode9) NEQ "NULL">						
						<cfqueryparam value="#trim(localCrossoverIdentificationCode9)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ClaimID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClaimID(qCreateClaim.ClaimID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ClaimBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimID" required="yes" type="numeric" />		
		<cfset var qGetClaim = "" />		
		
		<cfset qGetClaim = getClaim(trim(arguments.ds), trim(ClaimID)) />
				
		<cfif qGetClaim.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClaim = createObject("component", "ClaimBean").init(arguments.ds);
			objClaim.setClaimID(qGetClaim.ClaimID);
			objClaim.setInterchangeClaimID(qGetClaim.InterchangeClaimID);
			objClaim.setClientAssignedClaimID(qGetClaim.ClientAssignedClaimID);
			objClaim.setInterchangeID(qGetClaim.InterchangeID);
			objClaim.setProviderID(qGetClaim.ProviderID);
			objClaim.setClaimType(qGetClaim.ClaimType);
			objClaim.setClientID(qGetClaim.ClientID);
			objClaim.setEntityID(qGetClaim.EntityID);
			objClaim.setHICNumber(qGetClaim.HICNumber);
			objClaim.setClaimStatusCode(qGetClaim.ClaimStatusCode);
			objClaim.setStatusID(qGetClaim.StatusID);
			objClaim.setClaimPreviousPaidAmount(qGetClaim.ClaimPreviousPaidAmount);
			objClaim.setClaimPaidAmount(qGetClaim.ClaimPaidAmount);
			objClaim.setPatientResponsibilityAmount(qGetClaim.PatientResponsibilityAmount);
			objClaim.setAssignedToUserID(qGetClaim.AssignedToUserID);
			objClaim.setDueDate(qGetClaim.DueDate);
			objClaim.setFacilityCode(qGetClaim.FacilityCode);
			objClaim.setCrossoverEntityTypeQualifier2(qGetClaim.CrossoverEntityTypeQualifier2);
			objClaim.setCrossoverNameLastorOrganizationName3(qGetClaim.CrossoverNameLastorOrganizationName3);
			objClaim.setCrossoverIdentificationCode9(qGetClaim.CrossoverIdentificationCode9);
			objClaim.setActive(qGetClaim.Active);
			objClaim.setInactiveCode(qGetClaim.InactiveCode);
			objClaim.setDateCreated(qGetClaim.DateCreated);				
			return objClaim;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimBean" />
		<cfset var qUpdateClaim = "" />
		<cfset var localInterchangeClaimID = arguments.bean.getInterchangeClaimID() />
		<cfset var localClientAssignedClaimID = arguments.bean.getClientAssignedClaimID() />
		<cfset var localInterchangeID = arguments.bean.getInterchangeID() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localClaimType = arguments.bean.getClaimType() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localHICNumber = arguments.bean.getHICNumber() />
		<cfset var localClaimStatusCode = arguments.bean.getClaimStatusCode() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localClaimPreviousPaidAmount = arguments.bean.getClaimPreviousPaidAmount() />
		<cfset var localClaimPaidAmount = arguments.bean.getClaimPaidAmount() />
		<cfset var localPatientResponsibilityAmount = arguments.bean.getPatientResponsibilityAmount() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localDueDate = arguments.bean.getDueDate() />
		<cfset var localFacilityCode = arguments.bean.getFacilityCode() />
		<cfset var localCrossoverEntityTypeQualifier2 = arguments.bean.getCrossoverEntityTypeQualifier2() />
		<cfset var localCrossoverNameLastorOrganizationName3 = arguments.bean.getCrossoverNameLastorOrganizationName3() />
		<cfset var localCrossoverIdentificationCode9 = arguments.bean.getCrossoverIdentificationCode9() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaim" datasource="#trim(arguments.ds)#">
				UPDATE Claim  SET
					
					InterchangeClaimID =						
						<cfqueryparam value="#trim(localInterchangeClaimID)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ClientAssignedClaimID =	
					<cfif trim(localClientAssignedClaimID) NEQ "" AND trim(localClientAssignedClaimID) NEQ "@@" AND trim(localClientAssignedClaimID) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientAssignedClaimID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeID =						
						<cfqueryparam value="#trim(localInterchangeID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ProviderID =	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClaimType =						
						<cfqueryparam value="#trim(localClaimType)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					EntityID =				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					HICNumber =	
					<cfif trim(localHICNumber) NEQ "" AND trim(localHICNumber) NEQ "@@" AND trim(localHICNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localHICNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClaimStatusCode =				
					<cfif IsNumeric(trim(localClaimStatusCode))>						
						<cfqueryparam value="#trim(localClaimStatusCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					StatusID =				
					<cfif IsNumeric(trim(localStatusID))>						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimPreviousPaidAmount =				
					<cfif IsNumeric(trim(localClaimPreviousPaidAmount))>						
						<cfqueryparam value="#trim(localClaimPreviousPaidAmount)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimPaidAmount =				
					<cfif IsNumeric(trim(localClaimPaidAmount))>						
						<cfqueryparam value="#trim(localClaimPaidAmount)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PatientResponsibilityAmount =				
					<cfif IsNumeric(trim(localPatientResponsibilityAmount))>						
						<cfqueryparam value="#trim(localPatientResponsibilityAmount)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AssignedToUserID =				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DueDate =	
					<cfif IsDate(trim(localDueDate))>						
						<cfqueryparam value="#trim(localDueDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					FacilityCode =	
					<cfif trim(localFacilityCode) NEQ "" AND trim(localFacilityCode) NEQ "@@" AND trim(localFacilityCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localFacilityCode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CrossoverEntityTypeQualifier2 =	
					<cfif trim(localCrossoverEntityTypeQualifier2) NEQ "" AND trim(localCrossoverEntityTypeQualifier2) NEQ "@@" AND trim(localCrossoverEntityTypeQualifier2) NEQ "NULL">						
						<cfqueryparam value="#trim(localCrossoverEntityTypeQualifier2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CrossoverNameLastorOrganizationName3 =	
					<cfif trim(localCrossoverNameLastorOrganizationName3) NEQ "" AND trim(localCrossoverNameLastorOrganizationName3) NEQ "@@" AND trim(localCrossoverNameLastorOrganizationName3) NEQ "NULL">						
						<cfqueryparam value="#trim(localCrossoverNameLastorOrganizationName3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CrossoverIdentificationCode9 =	
					<cfif trim(localCrossoverIdentificationCode9) NEQ "" AND trim(localCrossoverIdentificationCode9) NEQ "@@" AND trim(localCrossoverIdentificationCode9) NEQ "NULL">						
						<cfqueryparam value="#trim(localCrossoverIdentificationCode9)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE ClaimID = <cfqueryparam value="#trim(arguments.bean.getClaimID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimBean" />
		<cfset var qDeleteClaim = "">

		<cfquery name="qDeleteClaim" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Claim
			WHERE ClaimID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaimID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaim" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimID" required="yes" type="numeric" />		
		<cfset var qGetClaim = "" />		
	
		<cfquery name="qGetClaim" datasource="#trim(arguments.ds)#">
	  		SELECT ClaimID,InterchangeClaimID,ClientAssignedClaimID,InterchangeID,ProviderID,ClaimType,ClientID,EntityID,HICNumber,ClaimStatusCode,StatusID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3,CrossoverIdentificationCode9,Active,InactiveCode,DateCreated
			FROM Claim  
			WHERE ClaimID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaim>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


