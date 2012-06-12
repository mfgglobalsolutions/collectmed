 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PhoneBean" />
		
		<cfset var qCreatePhone = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localPhoneTypeID = arguments.bean.getPhoneTypeID() />
		<cfset var localPhoneNumber = arguments.bean.getPhoneNumber() />
		<cfset var localPhoneExtension = arguments.bean.getPhoneExtension() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePhone" datasource="#trim(arguments.ds)#">
				INSERT INTO phone (SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localPhoneTypeID) NEQ "" AND trim(localPhoneTypeID) NEQ "@@" AND trim(localPhoneTypeID) NEQ "NULL">						
						<cfqueryparam value="#trim(localPhoneTypeID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPhoneNumber) NEQ "" AND trim(localPhoneNumber) NEQ "@@" AND trim(localPhoneNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localPhoneNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPhoneExtension) NEQ "" AND trim(localPhoneExtension) NEQ "@@" AND trim(localPhoneExtension) NEQ "NULL">						
						<cfqueryparam value="#trim(localPhoneExtension)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS PhoneID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setPhoneID(qCreatePhone.PhoneID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PhoneBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PhoneID" required="yes" type="numeric" />		
		<cfset var qGetPhone = "" />		
		
		<cfset qGetPhone = getPhone(trim(arguments.ds), trim(PhoneID)) />
				
		<cfif qGetPhone.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objPhone = createObject("component", "PhoneBean").init(arguments.ds);
			objPhone.setPhoneID(qGetPhone.PhoneID);
			objPhone.setSiteID(qGetPhone.SiteID);
			objPhone.setPhoneTypeID(qGetPhone.PhoneTypeID);
			objPhone.setPhoneNumber(qGetPhone.PhoneNumber);
			objPhone.setPhoneExtension(qGetPhone.PhoneExtension);
			objPhone.setActive(qGetPhone.Active);
			objPhone.setInactiveCode(qGetPhone.InactiveCode);
			objPhone.setDateCreated(qGetPhone.DateCreated);
			objPhone.setDateModified(qGetPhone.DateModified);				
			return objPhone;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PhoneBean" />
		<cfset var qUpdatePhone = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localPhoneTypeID = arguments.bean.getPhoneTypeID() />
		<cfset var localPhoneNumber = arguments.bean.getPhoneNumber() />
		<cfset var localPhoneExtension = arguments.bean.getPhoneExtension() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePhone" datasource="#trim(arguments.ds)#">
				UPDATE phone  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PhoneTypeID =	
					<cfif trim(localPhoneTypeID) NEQ "" AND trim(localPhoneTypeID) NEQ "@@" AND trim(localPhoneTypeID) NEQ "NULL">						
						<cfqueryparam value="#trim(localPhoneTypeID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PhoneNumber =	
					<cfif trim(localPhoneNumber) NEQ "" AND trim(localPhoneNumber) NEQ "@@" AND trim(localPhoneNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localPhoneNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PhoneExtension =	
					<cfif trim(localPhoneExtension) NEQ "" AND trim(localPhoneExtension) NEQ "@@" AND trim(localPhoneExtension) NEQ "NULL">						
						<cfqueryparam value="#trim(localPhoneExtension)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE PhoneID = <cfqueryparam value="#trim(arguments.bean.getPhoneID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PhoneBean" />
		<cfset var qDeletePhone = "">

		<cfquery name="qDeletePhone" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM phone
			WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getPhoneID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPhone" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PhoneID" required="yes" type="numeric" />		
		<cfset var qGetPhone = "" />		
	
		<cfquery name="qGetPhone" datasource="#trim(arguments.ds)#">
	  		SELECT PhoneID,SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode,DateCreated,DateModified
			FROM phone  
			WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PhoneID)#" /> 
		</cfquery>
		
		<cfreturn qGetPhone>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to get addresses belonging to an entity.          --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="getPhonesByEntityId">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="clientID" required="yes" type="numeric">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="Active" required="no" default="">
												
			<cftry>			
				
				<cfquery name="getPhones" datasource="#trim(arguments.ds)#">
					SELECT p.PhoneID, p.PhoneTypeID, p.PhoneNumber, p.PhoneExtension, p.PhoneID, p.SiteID, p.PhoneTypeID, p.PhoneNumber, p.PhoneExtension, p.Active, p.DateCreated, sli.ItemNameDisplay AS PhoneType, ep.IsDefault
					FROM entityphone ep INNER JOIN phone p ON ep.PhoneID = p.PhoneID						
					INNER JOIN pa_master.standardlistitem sli ON p.PhoneTypeID = sli.StandardListItemID 				
					WHERE ep.EntityID = <cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />  				
					<cfif IsNumeric(Active)>
						AND ep.Active = <cfqueryparam value="#trim(arguments.Active)#" cfsqltype="CF_SQL_INTEGER" /> 	
					</cfif>		
					Order BY ep.IsDefault DESC		
				</cfquery>
							
				<cfreturn getPhones>						
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
		
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to bind a phone to an entity.                     --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="bindPhoneEntity">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="PhoneID" required="yes" type="numeric">
			<cfargument name="IsDefault" required="no" type="numeric" default="0">
								
			<cftry>			
				
				<cfquery name="getEntityPhone" datasource="#trim(arguments.ds)#">
					SELECT * 
					FROM entityphone  
					WHERE EntityID = #trim(arguments.EntityID)# AND PhoneID = #trim(arguments.PhoneID)#					
				</cfquery>		
				<cfif getEntityPhone.recordCount LTE 0>
					<cfquery name="insertEntityPhone" datasource="#trim(arguments.ds)#">
						INSERT INTO entityphone  (EntityID, PhoneID, IsDefault)
						VALUES(
							<cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />, 
							<cfqueryparam value="#trim(arguments.PhoneID)#" cfsqltype="CF_SQL_INTEGER" />, 
							<cfqueryparam value="#trim(arguments.IsDefault)#" cfsqltype="CF_SQL_INTEGER" /> 	
						)					
					</cfquery>							
				</cfif>
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>	
		
		
			
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to ARCHIVE an Phone from the db.                  --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="archivePhone">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="PhoneID" required="yes" type="numeric">
								
			<cftry>
											
				<cfquery name="archiveEntityPhone" datasource="#trim(arguments.ds)#">
					UPDATE entityphone 
					SET Active = 0, InactiveCode = 68
					WHERE PhoneID = <cfqueryparam value="#trim(arguments.PhoneID)#" cfsqltype="CF_SQL_INTEGER" /> 		
				</cfquery>	
						
				<cfquery name="archivePhone" datasource="#trim(arguments.ds)#">
					UPDATE phone 
					SET Active = 0, InactiveCode = 68
					WHERE PhoneID = <cfqueryparam value="#trim(arguments.PhoneID)#" cfsqltype="CF_SQL_INTEGER" /> 	 	
				</cfquery>
				
															
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">										
				</cfcatch>
				
			</cftry>
			
		</cffunction>
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>






