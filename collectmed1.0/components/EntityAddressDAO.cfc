 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityAddressBean" />
		
		<cfset var qCreateEntityAddress = "" />		
		
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localAddressID = arguments.bean.getAddressID() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityAddress" datasource="#trim(arguments.ds)#">
				INSERT INTO EntityAddress (EntityID,AddressID,IsDefault,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localAddressID)#" cfsqltype="CF_SQL_INTEGER" />,						
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
			arguments.bean.setrecordID(qCreateEntityAddress.recordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityAddressBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetEntityAddress = "" />		
		
		<cfset qGetEntityAddress = getEntityAddress(trim(arguments.ds), trim(EntityAddressID)) />
				
		<cfif qGetEntityAddress.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEntityAddress = createObject("component", "EntityAddressBean").init(arguments.ds);
			objEntityAddress.setrecordID(qGetEntityAddress.recordID);
			objEntityAddress.setEntityID(qGetEntityAddress.EntityID);
			objEntityAddress.setAddressID(qGetEntityAddress.AddressID);
			objEntityAddress.setIsDefault(qGetEntityAddress.IsDefault);
			objEntityAddress.setActive(qGetEntityAddress.Active);
			objEntityAddress.setInactiveCode(qGetEntityAddress.InactiveCode);
			objEntityAddress.setDateCreated(qGetEntityAddress.DateCreated);
			objEntityAddress.setDateModified(qGetEntityAddress.DateModified);				
			return objEntityAddress;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityAddressBean" />
		<cfset var qUpdateEntityAddress = "" />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localAddressID = arguments.bean.getAddressID() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntityAddress" datasource="#trim(arguments.ds)#">
				UPDATE EntityAddress  SET
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					AddressID =						
						<cfqueryparam value="#trim(localAddressID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
		<cfargument name="bean" required="true" type="EntityAddressBean" />
		<cfset var qDeleteEntityAddress = "">

		<cfquery name="qDeleteEntityAddress" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EntityAddress
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getrecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityAddress" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityAddressID" required="yes" type="numeric" />		
		<cfset var qGetEntityAddress = "" />		
	
		<cfquery name="qGetEntityAddress" datasource="#trim(arguments.ds)#">
	  		SELECT recordID,EntityID,AddressID,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM EntityAddress  
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityAddress>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


