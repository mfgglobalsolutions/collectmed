 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureBean" />
		
		<cfset var qCreateProcedure = "" />		
		
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localProcedureCode = arguments.bean.getProcedureCode() />
		<cfset var localPriorProcedureCode = arguments.bean.getPriorProcedureCode() />
		<cfset var localServiceDateFrom = arguments.bean.getServiceDateFrom() />
		<cfset var localServiceDateTo = arguments.bean.getServiceDateTo() />
		<cfset var localBilledQuantity = arguments.bean.getBilledQuantity() />
		<cfset var localBilledAmount = arguments.bean.getBilledAmount() />
		<cfset var localPaidQuantity = arguments.bean.getPaidQuantity() />
		<cfset var localPaidAmount = arguments.bean.getPaidAmount() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure" datasource="#trim(arguments.ds)#">
				INSERT INTO Procedure (ClaimID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount)
				VALUES (						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localProcedureCode)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localPriorProcedureCode) NEQ "" AND trim(localPriorProcedureCode) NEQ "@@" AND trim(localPriorProcedureCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localPriorProcedureCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localServiceDateFrom))>						
						<cfqueryparam value="#trim(localServiceDateFrom)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localServiceDateTo))>						
						<cfqueryparam value="#trim(localServiceDateTo)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,				
					<cfif IsNumeric(trim(localBilledQuantity))>						
						<cfqueryparam value="#trim(localBilledQuantity)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localBilledAmount))>						
						<cfqueryparam value="#trim(localBilledAmount)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localPaidQuantity))>						
						<cfqueryparam value="#trim(localPaidQuantity)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localPaidAmount))>						
						<cfqueryparam value="#trim(localPaidAmount)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ProcedureID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setProcedureID(qCreateProcedure.ProcedureID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ProcedureBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ProcedureID" required="yes" type="numeric" />		
		<cfset var qGetProcedure = "" />		
		
		<cfset qGetProcedure = getProcedure(trim(arguments.ds), trim(ProcedureID)) />
				
		<cfif qGetProcedure.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedure = createObject("component", "ProcedureBean").init(arguments.ds);
			objProcedure.setProcedureID(qGetProcedure.ProcedureID);
			objProcedure.setClaimID(qGetProcedure.ClaimID);
			objProcedure.setProcedureCode(qGetProcedure.ProcedureCode);
			objProcedure.setPriorProcedureCode(qGetProcedure.PriorProcedureCode);
			objProcedure.setServiceDateFrom(qGetProcedure.ServiceDateFrom);
			objProcedure.setServiceDateTo(qGetProcedure.ServiceDateTo);
			objProcedure.setBilledQuantity(qGetProcedure.BilledQuantity);
			objProcedure.setBilledAmount(qGetProcedure.BilledAmount);
			objProcedure.setPaidQuantity(qGetProcedure.PaidQuantity);
			objProcedure.setPaidAmount(qGetProcedure.PaidAmount);				
			return objProcedure;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureBean" />
		<cfset var qUpdateProcedure = "" />
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localProcedureCode = arguments.bean.getProcedureCode() />
		<cfset var localPriorProcedureCode = arguments.bean.getPriorProcedureCode() />
		<cfset var localServiceDateFrom = arguments.bean.getServiceDateFrom() />
		<cfset var localServiceDateTo = arguments.bean.getServiceDateTo() />
		<cfset var localBilledQuantity = arguments.bean.getBilledQuantity() />
		<cfset var localBilledAmount = arguments.bean.getBilledAmount() />
		<cfset var localPaidQuantity = arguments.bean.getPaidQuantity() />
		<cfset var localPaidAmount = arguments.bean.getPaidAmount() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure" datasource="#trim(arguments.ds)#">
				UPDATE Procedure  SET
					
					ClaimID =						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ProcedureCode =						
						<cfqueryparam value="#trim(localProcedureCode)#" cfsqltype="CF_SQL_INTEGER" />,
					
					PriorProcedureCode =	
					<cfif trim(localPriorProcedureCode) NEQ "" AND trim(localPriorProcedureCode) NEQ "@@" AND trim(localPriorProcedureCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localPriorProcedureCode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ServiceDateFrom =	
					<cfif IsDate(trim(localServiceDateFrom))>						
						<cfqueryparam value="#trim(localServiceDateFrom)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					ServiceDateTo =	
					<cfif IsDate(trim(localServiceDateTo))>						
						<cfqueryparam value="#trim(localServiceDateTo)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					BilledQuantity =				
					<cfif IsNumeric(trim(localBilledQuantity))>						
						<cfqueryparam value="#trim(localBilledQuantity)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					BilledAmount =				
					<cfif IsNumeric(trim(localBilledAmount))>						
						<cfqueryparam value="#trim(localBilledAmount)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PaidQuantity =				
					<cfif IsNumeric(trim(localPaidQuantity))>						
						<cfqueryparam value="#trim(localPaidQuantity)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PaidAmount =				
					<cfif IsNumeric(trim(localPaidAmount))>						
						<cfqueryparam value="#trim(localPaidAmount)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE ProcedureID = <cfqueryparam value="#trim(arguments.bean.getProcedureID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureBean" />
		<cfset var qDeleteProcedure = "">

		<cfquery name="qDeleteProcedure" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Procedure
			WHERE ProcedureID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getProcedureID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ProcedureID" required="yes" type="numeric" />		
		<cfset var qGetProcedure = "" />		
	
		<cfquery name="qGetProcedure" datasource="#trim(arguments.ds)#">
	  		SELECT ProcedureID,ClaimID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount
			FROM [Procedure]  
			WHERE ProcedureID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ProcedureID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


