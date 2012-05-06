 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityRSBean" />
		
		<cfset var qCreateEntityRS = "" />		
		
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localColM = arguments.bean.getColM() />
		<cfset var localColE = arguments.bean.getColE() />
		<cfset var localColL = arguments.bean.getColL() />
		<cfset var localColI = arguments.bean.getColI() />
		<cfset var localColA = arguments.bean.getColA() />
		<cfset var localColC = arguments.bean.getColC() />
		<cfset var localColR = arguments.bean.getColR() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityRS" datasource="#trim(arguments.ds)#">
				INSERT INTO EntityRS (EntityID,ColM,ColE,ColL,ColI,ColA,ColC,ColR,IsDefault,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />,	
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
					<cfif trim(localColR) NEQ "" AND trim(localColR) NEQ "@@" AND trim(localColR) NEQ "NULL">						
						<cfqueryparam value="#trim(localColR)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localIsDefault)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS EntityRSID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setEntityRSID(qCreateEntityRS.EntityRSID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityRSBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityRSID" required="yes" type="numeric" />		
		<cfset var qGetEntityRS = "" />		
		
		<cfset qGetEntityRS = getEntityRS(trim(arguments.ds), trim(EntityRSID)) />
				
		<cfif qGetEntityRS.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEntityRS = createObject("component", "EntityRSBean").init(arguments.ds);
			objEntityRS.setEntityRSID(qGetEntityRS.EntityRSID);
			objEntityRS.setEntityID(qGetEntityRS.EntityID);
			objEntityRS.setColM(qGetEntityRS.ColM);
			objEntityRS.setColE(qGetEntityRS.ColE);
			objEntityRS.setColL(qGetEntityRS.ColL);
			objEntityRS.setColI(qGetEntityRS.ColI);
			objEntityRS.setColA(qGetEntityRS.ColA);
			objEntityRS.setColC(qGetEntityRS.ColC);
			objEntityRS.setColR(qGetEntityRS.ColR);
			objEntityRS.setIsDefault(qGetEntityRS.IsDefault);
			objEntityRS.setActive(qGetEntityRS.Active);
			objEntityRS.setInactiveCode(qGetEntityRS.InactiveCode);
			objEntityRS.setDateCreated(qGetEntityRS.DateCreated);
			objEntityRS.setDateModified(qGetEntityRS.DateModified);				
			return objEntityRS;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityRSBean" />
		<cfset var qUpdateEntityRS = "" />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localColM = arguments.bean.getColM() />
		<cfset var localColE = arguments.bean.getColE() />
		<cfset var localColL = arguments.bean.getColL() />
		<cfset var localColI = arguments.bean.getColI() />
		<cfset var localColA = arguments.bean.getColA() />
		<cfset var localColC = arguments.bean.getColC() />
		<cfset var localColR = arguments.bean.getColR() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntityRS" datasource="#trim(arguments.ds)#">
				UPDATE EntityRS  SET
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ColM =						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
					
					ColR =	
					<cfif trim(localColR) NEQ "" AND trim(localColR) NEQ "@@" AND trim(localColR) NEQ "NULL">						
						<cfqueryparam value="#trim(localColR)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					IsDefault =						
						<cfqueryparam value="#trim(localIsDefault)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE EntityRSID = <cfqueryparam value="#trim(arguments.bean.getEntityRSID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityRSBean" />
		<cfset var qDeleteEntityRS = "">

		<cfquery name="qDeleteEntityRS" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EntityRS
			WHERE EntityRSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getEntityRSID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityRS" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityRSID" required="yes" type="numeric" />		
		<cfset var qGetEntityRS = "" />		
	
		<cfquery name="qGetEntityRS" datasource="#trim(arguments.ds)#">
	  		SELECT EntityRSID,EntityID,ColM,ColE,ColL,ColI,ColA,ColC,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM EntityRS  
			WHERE EntityRSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntityRSID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityRS>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


