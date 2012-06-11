 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntitySSBean" />
		
		<cfset var qCreateEntitySS = "" />		
		
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localColM = arguments.bean.getColM() />
		<cfset var localColE = arguments.bean.getColE() />
		<cfset var localColR = arguments.bean.getColR() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntitySS" datasource="#trim(arguments.ds)#">
				INSERT INTO entityss (EntityID,ColM,ColE,ColR,IsDefault,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,	
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
				SELECT LAST_INSERT_ID() AS EntitySSID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setEntitySSID(qCreateEntitySS.EntitySSID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntitySSBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntitySSID" required="yes" type="numeric" />		
		<cfset var qGetEntitySS = "" />		
		
		<cfset qGetEntitySS = getEntitySS(trim(arguments.ds), trim(EntitySSID)) />
				
		<cfif qGetEntitySS.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEntitySS = createObject("component", "EntitySSBean").init(arguments.ds);
			objEntitySS.setEntitySSID(qGetEntitySS.EntitySSID);
			objEntitySS.setEntityID(qGetEntitySS.EntityID);
			objEntitySS.setColM(qGetEntitySS.ColM);
			objEntitySS.setColE(qGetEntitySS.ColE);
			objEntitySS.setColR(qGetEntitySS.ColR);
			objEntitySS.setIsDefault(qGetEntitySS.IsDefault);
			objEntitySS.setActive(qGetEntitySS.Active);
			objEntitySS.setInactiveCode(qGetEntitySS.InactiveCode);
			objEntitySS.setDateCreated(qGetEntitySS.DateCreated);
			objEntitySS.setDateModified(qGetEntitySS.DateModified);				
			return objEntitySS;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntitySSBean" />
		<cfset var qUpdateEntitySS = "" />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localColM = arguments.bean.getColM() />
		<cfset var localColE = arguments.bean.getColE() />
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
				
			<cfquery name="qUpdateEntitySS" datasource="#trim(arguments.ds)#">
				UPDATE entityss  SET
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE EntitySSID = <cfqueryparam value="#trim(arguments.bean.getEntitySSID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntitySSBean" />
		<cfset var qDeleteEntitySS = "">

		<cfquery name="qDeleteEntitySS" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM entityss
			WHERE EntitySSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getEntitySSID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntitySS" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntitySSID" required="yes" type="numeric" />		
		<cfset var qGetEntitySS = "" />		
	
		<cfquery name="qGetEntitySS" datasource="#trim(arguments.ds)#">
	  		SELECT EntitySSID,EntityID,ColM,ColE,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM entityss  
			WHERE EntitySSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntitySSID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntitySS>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





