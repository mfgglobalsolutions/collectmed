 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="InsuranceCompanyBean" />
		
		<cfset var qCreateInsuranceCompany = "" />		
		
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localOCNANumber = arguments.bean.getOCNANumber() />
		<cfset var localInsuranceCompanyName = arguments.bean.getInsuranceCompanyName() />
		<cfset var localInsuranceCompanyDBA = arguments.bean.getInsuranceCompanyDBA() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localInsuranceCompanyURL = arguments.bean.getInsuranceCompanyURL() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateInsuranceCompany" datasource="#trim(arguments.ds)#">
				INSERT INTO insurancecompany (ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localOCNANumber) NEQ "" AND trim(localOCNANumber) NEQ "@@" AND trim(localOCNANumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localOCNANumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInsuranceCompanyName) NEQ "" AND trim(localInsuranceCompanyName) NEQ "@@" AND trim(localInsuranceCompanyName) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInsuranceCompanyDBA) NEQ "" AND trim(localInsuranceCompanyDBA) NEQ "@@" AND trim(localInsuranceCompanyDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyDBA)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localInsuranceCompanyURL) NEQ "" AND trim(localInsuranceCompanyURL) NEQ "@@" AND trim(localInsuranceCompanyURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyURL)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS InsuranceCompanyID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setInsuranceCompanyID(qCreateInsuranceCompany.InsuranceCompanyID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="InsuranceCompanyBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="InsuranceCompanyID" required="yes" type="numeric" />		
		<cfset var qGetInsuranceCompany = "" />		
		
		<cfset qGetInsuranceCompany = getInsuranceCompany(trim(arguments.ds), trim(InsuranceCompanyID)) />
				
		<cfif qGetInsuranceCompany.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objInsuranceCompany = createObject("component", "InsuranceCompanyBean").init(arguments.ds);
			objInsuranceCompany.setInsuranceCompanyID(qGetInsuranceCompany.InsuranceCompanyID);
			objInsuranceCompany.setClientID(qGetInsuranceCompany.ClientID);
			objInsuranceCompany.setOCNANumber(qGetInsuranceCompany.OCNANumber);
			objInsuranceCompany.setInsuranceCompanyName(qGetInsuranceCompany.InsuranceCompanyName);
			objInsuranceCompany.setInsuranceCompanyDBA(qGetInsuranceCompany.InsuranceCompanyDBA);
			objInsuranceCompany.setEntityID(qGetInsuranceCompany.EntityID);
			objInsuranceCompany.setInsuranceCompanyURL(qGetInsuranceCompany.InsuranceCompanyURL);
			objInsuranceCompany.setActive(qGetInsuranceCompany.Active);
			objInsuranceCompany.setInactiveCode(qGetInsuranceCompany.InactiveCode);
			objInsuranceCompany.setDateCreated(qGetInsuranceCompany.DateCreated);
			objInsuranceCompany.setDateModified(qGetInsuranceCompany.DateModified);				
			return objInsuranceCompany;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="InsuranceCompanyBean" />
		<cfset var qUpdateInsuranceCompany = "" />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localOCNANumber = arguments.bean.getOCNANumber() />
		<cfset var localInsuranceCompanyName = arguments.bean.getInsuranceCompanyName() />
		<cfset var localInsuranceCompanyDBA = arguments.bean.getInsuranceCompanyDBA() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localInsuranceCompanyURL = arguments.bean.getInsuranceCompanyURL() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateInsuranceCompany" datasource="#trim(arguments.ds)#">
				UPDATE insurancecompany  SET
					
					ClientID =				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					OCNANumber =	
					<cfif trim(localOCNANumber) NEQ "" AND trim(localOCNANumber) NEQ "@@" AND trim(localOCNANumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localOCNANumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InsuranceCompanyName =	
					<cfif trim(localInsuranceCompanyName) NEQ "" AND trim(localInsuranceCompanyName) NEQ "@@" AND trim(localInsuranceCompanyName) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InsuranceCompanyDBA =	
					<cfif trim(localInsuranceCompanyDBA) NEQ "" AND trim(localInsuranceCompanyDBA) NEQ "@@" AND trim(localInsuranceCompanyDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyDBA)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntityID =				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					InsuranceCompanyURL =	
					<cfif trim(localInsuranceCompanyURL) NEQ "" AND trim(localInsuranceCompanyURL) NEQ "@@" AND trim(localInsuranceCompanyURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyURL)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE InsuranceCompanyID = <cfqueryparam value="#trim(arguments.bean.getInsuranceCompanyID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="InsuranceCompanyBean" />
		<cfset var qDeleteInsuranceCompany = "">

		<cfquery name="qDeleteInsuranceCompany" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM insurancecompany
			WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getInsuranceCompanyID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInsuranceCompany" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="InsuranceCompanyID" required="yes" type="numeric" />		
		<cfset var qGetInsuranceCompany = "" />		
	
		<cfquery name="qGetInsuranceCompany" datasource="#trim(arguments.ds)#">
	  		SELECT InsuranceCompanyID,ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,Active,InactiveCode,DateCreated,DateModified
			FROM insurancecompany  
			WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.InsuranceCompanyID)#" /> 
		</cfquery>
		
		<cfreturn qGetInsuranceCompany>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





