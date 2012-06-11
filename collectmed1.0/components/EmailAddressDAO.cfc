 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EmailAddressBean" />
		
		<cfset var qCreateEmailAddress = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localEmailTypeID = arguments.bean.getEmailTypeID() />
		<cfset var localEmail = arguments.bean.getEmail() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEmailAddress" datasource="#trim(arguments.ds)#">
				INSERT INTO emailaddress (SiteID,EntityID,EmailTypeID,Email,IsDefault,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localEmailTypeID))>						
						<cfqueryparam value="#trim(localEmailTypeID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localEmail)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localIsDefault)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS EmailAddressID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setEmailAddressID(qCreateEmailAddress.EmailAddressID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EmailAddressBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EmailAddressID" required="yes" type="numeric" />		
		<cfset var qGetEmailAddress = "" />		
		
		<cfset qGetEmailAddress = getEmailAddress(trim(arguments.ds), trim(EmailAddressID)) />
				
		<cfif qGetEmailAddress.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEmailAddress = createObject("component", "EmailAddressBean").init(arguments.ds);
			objEmailAddress.setEmailAddressID(qGetEmailAddress.EmailAddressID);
			objEmailAddress.setSiteID(qGetEmailAddress.SiteID);
			objEmailAddress.setEntityID(qGetEmailAddress.EntityID);
			objEmailAddress.setEmailTypeID(qGetEmailAddress.EmailTypeID);
			objEmailAddress.setEmail(qGetEmailAddress.Email);
			objEmailAddress.setIsDefault(qGetEmailAddress.IsDefault);
			objEmailAddress.setActive(qGetEmailAddress.Active);
			objEmailAddress.setInactiveCode(qGetEmailAddress.InactiveCode);
			objEmailAddress.setDateCreated(qGetEmailAddress.DateCreated);
			objEmailAddress.setDateModified(qGetEmailAddress.DateModified);				
			return objEmailAddress;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EmailAddressBean" />
		<cfset var qUpdateEmailAddress = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localEmailTypeID = arguments.bean.getEmailTypeID() />
		<cfset var localEmail = arguments.bean.getEmail() />
		<cfset var localIsDefault = arguments.bean.getIsDefault() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEmailAddress" datasource="#trim(arguments.ds)#">
				UPDATE emailaddress  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					EmailTypeID =				
					<cfif IsNumeric(trim(localEmailTypeID))>						
						<cfqueryparam value="#trim(localEmailTypeID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Email =						
						<cfqueryparam value="#trim(localEmail)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
				WHERE EmailAddressID = <cfqueryparam value="#trim(arguments.bean.getEmailAddressID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EmailAddressBean" />
		<cfset var qDeleteEmailAddress = "">

		<cfquery name="qDeleteEmailAddress" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM emailaddress
			WHERE EmailAddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getEmailAddressID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEmailAddress" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EmailAddressID" required="yes" type="numeric" />		
		<cfset var qGetEmailAddress = "" />		
	
		<cfquery name="qGetEmailAddress" datasource="#trim(arguments.ds)#">
	  		SELECT EmailAddressID,SiteID,EntityID,EmailTypeID,Email,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM emailaddress  
			WHERE EmailAddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EmailAddressID)#" /> 
		</cfquery>
		
		<cfreturn qGetEmailAddress>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





