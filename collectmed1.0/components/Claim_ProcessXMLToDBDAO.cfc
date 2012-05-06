 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_ProcessXMLToDBBean" />
		
		<cfset var qCreateClaim_ProcessXMLToDB = "" />		
		
		<cfset var localInterchangeID = arguments.bean.getInterchangeID() />
		<cfset var localClaimXML = arguments.bean.getClaimXML() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localPatientID = arguments.bean.getPatientID() />
		<cfset var localinterchangeClaimID = arguments.bean.getinterchangeClaimID() />
		<cfset var localPossiblePatientID = arguments.bean.getPossiblePatientID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaim_ProcessXMLToDB" datasource="#trim(arguments.ds)#">
				INSERT INTO Claim_ProcessXMLToDB (InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localInterchangeID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localClaimXML)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localPatientID))>						
						<cfqueryparam value="#trim(localPatientID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localinterchangeClaimID) NEQ "" AND trim(localinterchangeClaimID) NEQ "@@" AND trim(localinterchangeClaimID) NEQ "NULL">						
						<cfqueryparam value="#trim(localinterchangeClaimID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPossiblePatientID) NEQ "" AND trim(localPossiblePatientID) NEQ "@@" AND trim(localPossiblePatientID) NEQ "NULL">						
						<cfqueryparam value="#trim(localPossiblePatientID)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS Claim_ProcessXMLToDBID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClaim_ProcessXMLToDBID(qCreateClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Claim_ProcessXMLToDBBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_ProcessXMLToDBID" required="yes" type="numeric" />		
		<cfset var qGetClaim_ProcessXMLToDB = "" />		
		
		<cfset qGetClaim_ProcessXMLToDB = getClaim_ProcessXMLToDB(trim(arguments.ds), trim(Claim_ProcessXMLToDBID)) />
				
		<cfif qGetClaim_ProcessXMLToDB.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClaim_ProcessXMLToDB = createObject("component", "Claim_ProcessXMLToDBBean").init(arguments.ds);
			objClaim_ProcessXMLToDB.setClaim_ProcessXMLToDBID(qGetClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID);
			objClaim_ProcessXMLToDB.setInterchangeID(qGetClaim_ProcessXMLToDB.InterchangeID);
			objClaim_ProcessXMLToDB.setClaimXML(qGetClaim_ProcessXMLToDB.ClaimXML);
			objClaim_ProcessXMLToDB.setProviderID(qGetClaim_ProcessXMLToDB.ProviderID);
			objClaim_ProcessXMLToDB.setPatientID(qGetClaim_ProcessXMLToDB.PatientID);
			objClaim_ProcessXMLToDB.setinterchangeClaimID(qGetClaim_ProcessXMLToDB.interchangeClaimID);
			objClaim_ProcessXMLToDB.setPossiblePatientID(qGetClaim_ProcessXMLToDB.PossiblePatientID);
			objClaim_ProcessXMLToDB.setActive(qGetClaim_ProcessXMLToDB.Active);
			objClaim_ProcessXMLToDB.setInactiveCode(qGetClaim_ProcessXMLToDB.InactiveCode);
			objClaim_ProcessXMLToDB.setDateCreated(qGetClaim_ProcessXMLToDB.DateCreated);
			objClaim_ProcessXMLToDB.setDateModified(qGetClaim_ProcessXMLToDB.DateModified);				
			return objClaim_ProcessXMLToDB;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_ProcessXMLToDBBean" />
		<cfset var qUpdateClaim_ProcessXMLToDB = "" />
		<cfset var localInterchangeID = arguments.bean.getInterchangeID() />
		<cfset var localClaimXML = arguments.bean.getClaimXML() />
		<cfset var localProviderID = arguments.bean.getProviderID() />
		<cfset var localPatientID = arguments.bean.getPatientID() />
		<cfset var localinterchangeClaimID = arguments.bean.getinterchangeClaimID() />
		<cfset var localPossiblePatientID = arguments.bean.getPossiblePatientID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaim_ProcessXMLToDB" datasource="#trim(arguments.ds)#">
				UPDATE Claim_ProcessXMLToDB  SET
					
					InterchangeID =						
						<cfqueryparam value="#trim(localInterchangeID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ClaimXML =						
						<cfqueryparam value="#trim(localClaimXML)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ProviderID =	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PatientID =				
					<cfif IsNumeric(trim(localPatientID))>						
						<cfqueryparam value="#trim(localPatientID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					interchangeClaimID =	
					<cfif trim(localinterchangeClaimID) NEQ "" AND trim(localinterchangeClaimID) NEQ "@@" AND trim(localinterchangeClaimID) NEQ "NULL">						
						<cfqueryparam value="#trim(localinterchangeClaimID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PossiblePatientID =	
					<cfif trim(localPossiblePatientID) NEQ "" AND trim(localPossiblePatientID) NEQ "@@" AND trim(localPossiblePatientID) NEQ "NULL">						
						<cfqueryparam value="#trim(localPossiblePatientID)#" cfsqltype="CF_SQL_VARCHAR" />	
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
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE Claim_ProcessXMLToDBID = <cfqueryparam value="#trim(arguments.bean.getClaim_ProcessXMLToDBID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Claim_ProcessXMLToDBBean" />
		<cfset var qDeleteClaim_ProcessXMLToDB = "">

		<cfquery name="qDeleteClaim_ProcessXMLToDB" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Claim_ProcessXMLToDB
			WHERE Claim_ProcessXMLToDBID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaim_ProcessXMLToDBID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaim_ProcessXMLToDB" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_ProcessXMLToDBID" required="yes" type="numeric" />		
		<cfset var qGetClaim_ProcessXMLToDB = "" />		
	
		<cfquery name="qGetClaim_ProcessXMLToDB" datasource="#trim(arguments.ds)#">
	  		SELECT Claim_ProcessXMLToDBID,InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode,DateCreated,DateModified
			FROM Claim_ProcessXMLToDB  
			WHERE Claim_ProcessXMLToDBID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Claim_ProcessXMLToDBID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaim_ProcessXMLToDB>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


