 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityPhoneBean" />
		
		<cfset var qCreateEntityPhone = "" />		
		
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localPhoneID = arguments.bean.getPhoneID() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityPhone" datasource="#trim(arguments.ds)#">
				INSERT INTO EntityPhone (EntityID,PhoneID,IsDefault,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localPhoneID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localIsDefault)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS recordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setrecordID(qCreateEntityPhone.recordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityPhoneBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetEntityPhone = "" />		
		
		<cfset qGetEntityPhone = getEntityPhone(trim(arguments.ds), trim(EntityPhoneID)) />
				
		<cfif qGetEntityPhone.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEntityPhone = createObject("component", "EntityPhoneBean").init(arguments.ds);
			objEntityPhone.setrecordID(qGetEntityPhone.recordID);
			objEntityPhone.setEntityID(qGetEntityPhone.EntityID);
			objEntityPhone.setPhoneID(qGetEntityPhone.PhoneID);
			objEntityPhone.setIsDefault(qGetEntityPhone.IsDefault);
			objEntityPhone.setActive(qGetEntityPhone.Active);
			objEntityPhone.setInactiveCode(qGetEntityPhone.InactiveCode);
			objEntityPhone.setDateCreated(qGetEntityPhone.DateCreated);
			objEntityPhone.setDateModified(qGetEntityPhone.DateModified);				
			return objEntityPhone;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityPhoneBean" />
		<cfset var qUpdateEntityPhone = "" />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localPhoneID = arguments.bean.getPhoneID() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntityPhone" datasource="#trim(arguments.ds)#">
				UPDATE EntityPhone  SET
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					PhoneID =						
						<cfqueryparam value="#trim(localPhoneID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					IsDefault =						
						<cfqueryparam value="#trim(localIsDefault)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
				WHERE recordID = <cfqueryparam value="#trim(arguments.bean.getrecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityPhoneBean" />
		<cfset var qDeleteEntityPhone = "">

		<cfquery name="qDeleteEntityPhone" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EntityPhone
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getrecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityPhone" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityPhoneID" required="yes" type="numeric" />		
		<cfset var qGetEntityPhone = "" />		
	
		<cfquery name="qGetEntityPhone" datasource="#trim(arguments.ds)#">
	  		SELECT recordID,EntityID,PhoneID,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM EntityPhone  
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityPhone>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


