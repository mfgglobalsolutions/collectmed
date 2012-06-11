 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_CLAIMMODIFIERCodeBean" />
		
		<cfset var qCreateEOB_MEDICARE_CLAIMMODIFIERCode = "" />		
		
		<cfset var localStandardListItemID = arguments.bean.getStandardListItemID() />
		<cfset var localModifier = arguments.bean.getModifier() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(arguments.ds)#">
				INSERT INTO eob_medicare_claimmodifiercode (StandardListItemID,Modifier,Description,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localStandardListItemID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localModifier)#" cfsqltype="CF_SQL_VARCHAR" />,	
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
			arguments.bean.setRecordID(qCreateEOB_MEDICARE_CLAIMMODIFIERCode.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_MEDICARE_CLAIMMODIFIERCodeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_CLAIMMODIFIERCode = "" />		
		
		<cfset qGetEOB_MEDICARE_CLAIMMODIFIERCode = getEOB_MEDICARE_CLAIMMODIFIERCode(trim(arguments.ds), trim(EOB_MEDICARE_CLAIMMODIFIERCodeID)) />
				
		<cfif qGetEOB_MEDICARE_CLAIMMODIFIERCode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEOB_MEDICARE_CLAIMMODIFIERCode = createObject("component", "EOB_MEDICARE_CLAIMMODIFIERCodeBean").init(arguments.ds);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setRecordID(qGetEOB_MEDICARE_CLAIMMODIFIERCode.RecordID);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setStandardListItemID(qGetEOB_MEDICARE_CLAIMMODIFIERCode.StandardListItemID);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setModifier(qGetEOB_MEDICARE_CLAIMMODIFIERCode.Modifier);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setDescription(qGetEOB_MEDICARE_CLAIMMODIFIERCode.Description);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setActive(qGetEOB_MEDICARE_CLAIMMODIFIERCode.Active);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setInactiveCode(qGetEOB_MEDICARE_CLAIMMODIFIERCode.InactiveCode);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setDateCreated(qGetEOB_MEDICARE_CLAIMMODIFIERCode.DateCreated);
			objEOB_MEDICARE_CLAIMMODIFIERCode.setDateModified(qGetEOB_MEDICARE_CLAIMMODIFIERCode.DateModified);				
			return objEOB_MEDICARE_CLAIMMODIFIERCode;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_CLAIMMODIFIERCodeBean" />
		<cfset var qUpdateEOB_MEDICARE_CLAIMMODIFIERCode = "" />
		<cfset var localStandardListItemID = arguments.bean.getStandardListItemID() />
		<cfset var localModifier = arguments.bean.getModifier() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(arguments.ds)#">
				UPDATE eob_medicare_claimmodifiercode  SET
					
					StandardListItemID =						
						<cfqueryparam value="#trim(localStandardListItemID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Modifier =						
						<cfqueryparam value="#trim(localModifier)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
		<cfargument name="bean" required="true" type="EOB_MEDICARE_CLAIMMODIFIERCodeBean" />
		<cfset var qDeleteEOB_MEDICARE_CLAIMMODIFIERCode = "">

		<cfquery name="qDeleteEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM eob_medicare_claimmodifiercode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_MEDICARE_CLAIMMODIFIERCode" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EOB_MEDICARE_CLAIMMODIFIERCodeID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_CLAIMMODIFIERCode = "" />		
	
		<cfquery name="qGetEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,StandardListItemID,Modifier,Description,Active,InactiveCode,DateCreated,DateModified
			FROM eob_medicare_claimmodifiercode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_MEDICARE_CLAIMMODIFIERCode>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





