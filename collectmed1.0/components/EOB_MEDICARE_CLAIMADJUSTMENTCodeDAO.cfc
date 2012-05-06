 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_CLAIMADJUSTMENTCodeBean" />
		
		<cfset var qCreateEOB_MEDICARE_CLAIMADJUSTMENTCode = "" />		
		
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_MEDICARE_CLAIMADJUSTMENTCode" datasource="#trim(arguments.ds)#">
				INSERT INTO EOB_MEDICARE_CLAIMADJUSTMENTCode (Code,Description,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS RecordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setRecordID(qCreateEOB_MEDICARE_CLAIMADJUSTMENTCode.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_MEDICARE_CLAIMADJUSTMENTCodeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_CLAIMADJUSTMENTCode = "" />		
		
		<cfset qGetEOB_MEDICARE_CLAIMADJUSTMENTCode = getEOB_MEDICARE_CLAIMADJUSTMENTCode(trim(arguments.ds), trim(EOB_MEDICARE_CLAIMADJUSTMENTCodeID)) />
				
		<cfif qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEOB_MEDICARE_CLAIMADJUSTMENTCode = createObject("component", "EOB_MEDICARE_CLAIMADJUSTMENTCodeBean").init(arguments.ds);
			objEOB_MEDICARE_CLAIMADJUSTMENTCode.setRecordID(qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.RecordID);
			objEOB_MEDICARE_CLAIMADJUSTMENTCode.setCode(qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.Code);
			objEOB_MEDICARE_CLAIMADJUSTMENTCode.setDescription(qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.Description);
			objEOB_MEDICARE_CLAIMADJUSTMENTCode.setActive(qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.Active);
			objEOB_MEDICARE_CLAIMADJUSTMENTCode.setInactiveCode(qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.InactiveCode);
			objEOB_MEDICARE_CLAIMADJUSTMENTCode.setDateCreated(qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.DateCreated);
			objEOB_MEDICARE_CLAIMADJUSTMENTCode.setDateModified(qGetEOB_MEDICARE_CLAIMADJUSTMENTCode.DateModified);				
			return objEOB_MEDICARE_CLAIMADJUSTMENTCode;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_CLAIMADJUSTMENTCodeBean" />
		<cfset var qUpdateEOB_MEDICARE_CLAIMADJUSTMENTCode = "" />
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_MEDICARE_CLAIMADJUSTMENTCode" datasource="#trim(arguments.ds)#">
				UPDATE EOB_MEDICARE_CLAIMADJUSTMENTCode  SET
					
					Code =						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Description =	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.bean.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_CLAIMADJUSTMENTCodeBean" />
		<cfset var qDeleteEOB_MEDICARE_CLAIMADJUSTMENTCode = "">

		<cfquery name="qDeleteEOB_MEDICARE_CLAIMADJUSTMENTCode" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EOB_MEDICARE_CLAIMADJUSTMENTCode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_MEDICARE_CLAIMADJUSTMENTCode" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EOB_MEDICARE_CLAIMADJUSTMENTCodeID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_CLAIMADJUSTMENTCode = "" />		
	
		<cfquery name="qGetEOB_MEDICARE_CLAIMADJUSTMENTCode" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,Code,Description,Active,InactiveCode,DateCreated,DateModified
			FROM EOB_MEDICARE_CLAIMADJUSTMENTCode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_MEDICARE_CLAIMADJUSTMENTCode>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


