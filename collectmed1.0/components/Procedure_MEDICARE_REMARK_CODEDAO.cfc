 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_REMARK_CODEBean" />
		
		<cfset var qCreateProcedure_MEDICARE_REMARK_CODE = "" />		
		
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localQualifierCode = arguments.bean.getQualifierCode() />
		<cfset var localIndustryCode = arguments.bean.getIndustryCode() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_REMARK_CODE" datasource="#trim(arguments.ds)#">
				INSERT INTO Procedure_MEDICARE_REMARK_CODE (ProcedureID,QualifierCode,IndustryCode,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localIndustryCode)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_REMARK_CODEID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setProcedure_MEDICARE_REMARK_CODEID(qCreateProcedure_MEDICARE_REMARK_CODE.Procedure_MEDICARE_REMARK_CODEID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_REMARK_CODEBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_REMARK_CODEID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_REMARK_CODE = "" />		
		
		<cfset qGetProcedure_MEDICARE_REMARK_CODE = getProcedure_MEDICARE_REMARK_CODE(trim(arguments.ds), trim(Procedure_MEDICARE_REMARK_CODEID)) />
				
		<cfif qGetProcedure_MEDICARE_REMARK_CODE.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedure_MEDICARE_REMARK_CODE = createObject("component", "Procedure_MEDICARE_REMARK_CODEBean").init(arguments.ds);
			objProcedure_MEDICARE_REMARK_CODE.setProcedure_MEDICARE_REMARK_CODEID(qGetProcedure_MEDICARE_REMARK_CODE.Procedure_MEDICARE_REMARK_CODEID);
			objProcedure_MEDICARE_REMARK_CODE.setProcedureID(qGetProcedure_MEDICARE_REMARK_CODE.ProcedureID);
			objProcedure_MEDICARE_REMARK_CODE.setQualifierCode(qGetProcedure_MEDICARE_REMARK_CODE.QualifierCode);
			objProcedure_MEDICARE_REMARK_CODE.setIndustryCode(qGetProcedure_MEDICARE_REMARK_CODE.IndustryCode);
			objProcedure_MEDICARE_REMARK_CODE.setActive(qGetProcedure_MEDICARE_REMARK_CODE.Active);
			objProcedure_MEDICARE_REMARK_CODE.setInactiveCode(qGetProcedure_MEDICARE_REMARK_CODE.InactiveCode);
			objProcedure_MEDICARE_REMARK_CODE.setDateCreated(qGetProcedure_MEDICARE_REMARK_CODE.DateCreated);
			objProcedure_MEDICARE_REMARK_CODE.setDateModified(qGetProcedure_MEDICARE_REMARK_CODE.DateModified);				
			return objProcedure_MEDICARE_REMARK_CODE;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_REMARK_CODEBean" />
		<cfset var qUpdateProcedure_MEDICARE_REMARK_CODE = "" />
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localQualifierCode = arguments.bean.getQualifierCode() />
		<cfset var localIndustryCode = arguments.bean.getIndustryCode() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure_MEDICARE_REMARK_CODE" datasource="#trim(arguments.ds)#">
				UPDATE Procedure_MEDICARE_REMARK_CODE  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					QualifierCode =						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					IndustryCode =						
						<cfqueryparam value="#trim(localIndustryCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
				WHERE Procedure_MEDICARE_REMARK_CODEID = <cfqueryparam value="#trim(arguments.bean.getProcedure_MEDICARE_REMARK_CODEID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_REMARK_CODEBean" />
		<cfset var qDeleteProcedure_MEDICARE_REMARK_CODE = "">

		<cfquery name="qDeleteProcedure_MEDICARE_REMARK_CODE" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Procedure_MEDICARE_REMARK_CODE
			WHERE Procedure_MEDICARE_REMARK_CODEID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getProcedure_MEDICARE_REMARK_CODEID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_REMARK_CODE" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_REMARK_CODEID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_REMARK_CODE = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_REMARK_CODE" datasource="#trim(arguments.ds)#">
	  		SELECT Procedure_MEDICARE_REMARK_CODEID,ProcedureID,QualifierCode,IndustryCode,Active,InactiveCode,DateCreated,DateModified
			FROM Procedure_MEDICARE_REMARK_CODE  
			WHERE Procedure_MEDICARE_REMARK_CODEID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_REMARK_CODEID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_REMARK_CODE>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


