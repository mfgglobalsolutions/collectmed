 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityKSBean" />
		
		<cfset var qCreateEntityKS = "" />		
		
		<cfset var localColM = arguments.bean.getColM() />
		<cfset var localColE = arguments.bean.getColE() />
		<cfset var localColL = arguments.bean.getColL() />
		<cfset var localColI = arguments.bean.getColI() />
		<cfset var localColA = arguments.bean.getColA() />
		<cfset var localColC = arguments.bean.getColC() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityKS" datasource="#trim(arguments.ds)#">
				INSERT INTO entityks (ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode)
				VALUES (	
					<cfif trim(localColM) NEQ "" AND trim(localColM) NEQ "@@" AND trim(localColM) NEQ "NULL">						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColE) NEQ "" AND trim(localColE) NEQ "@@" AND trim(localColE) NEQ "NULL">						
						<cfqueryparam value="#trim(localColE)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColL) NEQ "" AND trim(localColL) NEQ "@@" AND trim(localColL) NEQ "NULL">						
						<cfqueryparam value="#trim(localColL)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColI) NEQ "" AND trim(localColI) NEQ "@@" AND trim(localColI) NEQ "NULL">						
						<cfqueryparam value="#trim(localColI)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColA) NEQ "" AND trim(localColA) NEQ "@@" AND trim(localColA) NEQ "NULL">						
						<cfqueryparam value="#trim(localColA)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColC) NEQ "" AND trim(localColC) NEQ "@@" AND trim(localColC) NEQ "NULL">						
						<cfqueryparam value="#trim(localColC)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS EntityKSID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setEntityKSID(qCreateEntityKS.EntityKSID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityKSBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityKSID" required="yes" type="numeric" />		
		<cfset var qGetEntityKS = "" />		
		
		<cfset qGetEntityKS = getEntityKS(trim(arguments.ds), trim(EntityKSID)) />
				
		<cfif qGetEntityKS.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEntityKS = createObject("component", "EntityKSBean").init(arguments.ds);
			objEntityKS.setEntityKSID(qGetEntityKS.EntityKSID);
			objEntityKS.setColM(qGetEntityKS.ColM);
			objEntityKS.setColE(qGetEntityKS.ColE);
			objEntityKS.setColL(qGetEntityKS.ColL);
			objEntityKS.setColI(qGetEntityKS.ColI);
			objEntityKS.setColA(qGetEntityKS.ColA);
			objEntityKS.setColC(qGetEntityKS.ColC);
			objEntityKS.setActive(qGetEntityKS.Active);
			objEntityKS.setInactiveCode(qGetEntityKS.InactiveCode);
			objEntityKS.setDateCreated(qGetEntityKS.DateCreated);
			objEntityKS.setDateModified(qGetEntityKS.DateModified);				
			return objEntityKS;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityKSBean" />
		<cfset var qUpdateEntityKS = "" />
		<cfset var localColM = arguments.bean.getColM() />
		<cfset var localColE = arguments.bean.getColE() />
		<cfset var localColL = arguments.bean.getColL() />
		<cfset var localColI = arguments.bean.getColI() />
		<cfset var localColA = arguments.bean.getColA() />
		<cfset var localColC = arguments.bean.getColC() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntityKS" datasource="#trim(arguments.ds)#">
				UPDATE entityks  SET
					
					ColM =	
					<cfif trim(localColM) NEQ "" AND trim(localColM) NEQ "@@" AND trim(localColM) NEQ "NULL">						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColE =	
					<cfif trim(localColE) NEQ "" AND trim(localColE) NEQ "@@" AND trim(localColE) NEQ "NULL">						
						<cfqueryparam value="#trim(localColE)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColL =	
					<cfif trim(localColL) NEQ "" AND trim(localColL) NEQ "@@" AND trim(localColL) NEQ "NULL">						
						<cfqueryparam value="#trim(localColL)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColI =	
					<cfif trim(localColI) NEQ "" AND trim(localColI) NEQ "@@" AND trim(localColI) NEQ "NULL">						
						<cfqueryparam value="#trim(localColI)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColA =	
					<cfif trim(localColA) NEQ "" AND trim(localColA) NEQ "@@" AND trim(localColA) NEQ "NULL">						
						<cfqueryparam value="#trim(localColA)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColC =	
					<cfif trim(localColC) NEQ "" AND trim(localColC) NEQ "@@" AND trim(localColC) NEQ "NULL">						
						<cfqueryparam value="#trim(localColC)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE EntityKSID = <cfqueryparam value="#trim(arguments.bean.getEntityKSID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityKSBean" />
		<cfset var qDeleteEntityKS = "">

		<cfquery name="qDeleteEntityKS" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM entityks
			WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getEntityKSID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityKS" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityKSID" required="yes" type="numeric" />		
		<cfset var qGetEntityKS = "" />		
	
		<cfquery name="qGetEntityKS" datasource="#trim(arguments.ds)#">
	  		SELECT EntityKSID,ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode,DateCreated,DateModified
			FROM entityks  
			WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntityKSID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityKS>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





