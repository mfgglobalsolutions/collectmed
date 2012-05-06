 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityTSBean" />
		
		<cfset var qCreateEntityTS = "" />		
		
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localColM = arguments.bean.getColM() />
		<cfset var localColR = arguments.bean.getColR() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityTS" datasource="#trim(arguments.ds)#">
				INSERT INTO EntityTS (EntityID,ColM,ColR,IsDefault,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localColM) NEQ "" AND trim(localColM) NEQ "@@" AND trim(localColM) NEQ "NULL">						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS EntityTSID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setEntityTSID(qCreateEntityTS.EntityTSID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityTSBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityTSID" required="yes" type="numeric" />		
		<cfset var qGetEntityTS = "" />		
		
		<cfset qGetEntityTS = getEntityTS(trim(arguments.ds), trim(EntityTSID)) />
				
		<cfif qGetEntityTS.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEntityTS = createObject("component", "EntityTSBean").init(arguments.ds);
			objEntityTS.setEntityTSID(qGetEntityTS.EntityTSID);
			objEntityTS.setEntityID(qGetEntityTS.EntityID);
			objEntityTS.setColM(qGetEntityTS.ColM);
			objEntityTS.setColR(qGetEntityTS.ColR);
			objEntityTS.setIsDefault(qGetEntityTS.IsDefault);
			objEntityTS.setActive(qGetEntityTS.Active);
			objEntityTS.setInactiveCode(qGetEntityTS.InactiveCode);
			objEntityTS.setDateCreated(qGetEntityTS.DateCreated);
			objEntityTS.setDateModified(qGetEntityTS.DateModified);				
			return objEntityTS;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityTSBean" />
		<cfset var qUpdateEntityTS = "" />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localColM = arguments.bean.getColM() />
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
				
			<cfquery name="qUpdateEntityTS" datasource="#trim(arguments.ds)#">
				UPDATE EntityTS  SET
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ColM =	
					<cfif trim(localColM) NEQ "" AND trim(localColM) NEQ "@@" AND trim(localColM) NEQ "NULL">						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE EntityTSID = <cfqueryparam value="#trim(arguments.bean.getEntityTSID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityTSBean" />
		<cfset var qDeleteEntityTS = "">

		<cfquery name="qDeleteEntityTS" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EntityTS
			WHERE EntityTSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getEntityTSID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityTS" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityTSID" required="yes" type="numeric" />		
		<cfset var qGetEntityTS = "" />		
	
		<cfquery name="qGetEntityTS" datasource="#trim(arguments.ds)#">
	  		SELECT EntityTSID,EntityID,ColM,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM EntityTS  
			WHERE EntityTSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntityTSID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityTS>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


