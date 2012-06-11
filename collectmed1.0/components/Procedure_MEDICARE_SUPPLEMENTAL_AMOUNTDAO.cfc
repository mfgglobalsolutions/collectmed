 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTBean" />
		
		<cfset var qCreateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
		
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localQualifierCode = arguments.bean.getQualifierCode() />
		<cfset var localMonetaryAmount2 = arguments.bean.getMonetaryAmount2() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#">
				INSERT INTO procedure_medicare_supplemental_amount (ProcedureID,QualifierCode,MonetaryAmount2,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localMonetaryAmount2)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID(qCreateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
		
		<cfset qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT(trim(arguments.ds), trim(Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID)) />
				
		<cfif qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = createObject("component", "Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTBean").init(arguments.ds);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setProcedureID(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.ProcedureID);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setQualifierCode(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.QualifierCode);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setMonetaryAmount2(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.MonetaryAmount2);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setActive(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Active);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setInactiveCode(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.InactiveCode);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setDateCreated(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.DateCreated);
			objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setDateModified(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.DateModified);				
			return objProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTBean" />
		<cfset var qUpdateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
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
				
			<cfquery name="qUpdateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#">
				UPDATE procedure_medicare_supplemental_amount  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam value="#trim(arguments.bean.getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTBean" />
		<cfset var qDeleteProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "">

		<cfquery name="qDeleteProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM procedure_medicare_supplemental_amount
			WHERE Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(arguments.ds)#">
	  		SELECT Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID,ProcedureID,QualifierCode,MonetaryAmount2,Active,InactiveCode,DateCreated,DateModified
			FROM procedure_medicare_supplemental_amount  
			WHERE Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





