 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EmployerBean" />
		
		<cfset var qCreateEmployer = "" />		
		
		<cfset var localEmployerName = arguments.bean.getEmployerName() />
		<cfset var localEmployerDBA = arguments.bean.getEmployerDBA() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localEmployerURL = arguments.bean.getEmployerURL() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEmployer" datasource="#trim(arguments.ds)#">
				INSERT INTO Employer (EmployerName,EmployerDBA,EntityID,EmployerURL,Active,InactiveCode)
				VALUES (	
					<cfif trim(localEmployerName) NEQ "" AND trim(localEmployerName) NEQ "@@" AND trim(localEmployerName) NEQ "NULL">						
						<cfqueryparam value="#trim(localEmployerName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEmployerDBA) NEQ "" AND trim(localEmployerDBA) NEQ "@@" AND trim(localEmployerDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localEmployerDBA)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localEmployerURL) NEQ "" AND trim(localEmployerURL) NEQ "@@" AND trim(localEmployerURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localEmployerURL)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS EmployerID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setEmployerID(qCreateEmployer.EmployerID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EmployerBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EmployerID" required="yes" type="numeric" />		
		<cfset var qGetEmployer = "" />		
		
		<cfset qGetEmployer = getEmployer(trim(arguments.ds), trim(EmployerID)) />
				
		<cfif qGetEmployer.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEmployer = createObject("component", "EmployerBean").init(arguments.ds);
			objEmployer.setEmployerID(qGetEmployer.EmployerID);
			objEmployer.setEmployerName(qGetEmployer.EmployerName);
			objEmployer.setEmployerDBA(qGetEmployer.EmployerDBA);
			objEmployer.setEntityID(qGetEmployer.EntityID);
			objEmployer.setEmployerURL(qGetEmployer.EmployerURL);
			objEmployer.setActive(qGetEmployer.Active);
			objEmployer.setInactiveCode(qGetEmployer.InactiveCode);
			objEmployer.setDateCreated(qGetEmployer.DateCreated);
			objEmployer.setDateModified(qGetEmployer.DateModified);				
			return objEmployer;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EmployerBean" />
		<cfset var qUpdateEmployer = "" />
		<cfset var localEmployerName = arguments.bean.getEmployerName() />
		<cfset var localEmployerDBA = arguments.bean.getEmployerDBA() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localEmployerURL = arguments.bean.getEmployerURL() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEmployer" datasource="#trim(arguments.ds)#">
				UPDATE Employer  SET
					
					EmployerName =	
					<cfif trim(localEmployerName) NEQ "" AND trim(localEmployerName) NEQ "@@" AND trim(localEmployerName) NEQ "NULL">						
						<cfqueryparam value="#trim(localEmployerName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EmployerDBA =	
					<cfif trim(localEmployerDBA) NEQ "" AND trim(localEmployerDBA) NEQ "@@" AND trim(localEmployerDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localEmployerDBA)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntityID =				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					EmployerURL =	
					<cfif trim(localEmployerURL) NEQ "" AND trim(localEmployerURL) NEQ "@@" AND trim(localEmployerURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localEmployerURL)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE EmployerID = <cfqueryparam value="#trim(arguments.bean.getEmployerID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EmployerBean" />
		<cfset var qDeleteEmployer = "">

		<cfquery name="qDeleteEmployer" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Employer
			WHERE EmployerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getEmployerID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEmployer" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EmployerID" required="yes" type="numeric" />		
		<cfset var qGetEmployer = "" />		
	
		<cfquery name="qGetEmployer" datasource="#trim(arguments.ds)#">
	  		SELECT EmployerID,EmployerName,EmployerDBA,EntityID,EmployerURL,Active,InactiveCode,DateCreated,DateModified
			FROM Employer  
			WHERE EmployerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EmployerID)#" /> 
		</cfquery>
		
		<cfreturn qGetEmployer>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


