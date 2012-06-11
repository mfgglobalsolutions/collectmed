 	


<cfcomponent name="eob_providerActive" output="false" alias="eob_providerActive">

	<cfproperty name="recordID" type="numeric" default="0" />
	<cfproperty name="ProviderID" type="string" default="" />
	<cfproperty name="ProviderName" type="string" default="" />
	<cfproperty name="ProviderMainAddressID" type="numeric" default="" />
	<cfproperty name="ProviderMainPhoneID" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.recordID = 0;
		variables.ProviderID = "";
		variables.ProviderName = "";
		variables.ProviderMainAddressID = "";
		variables.ProviderMainPhoneID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="eob_providerActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "recordID") AND stValues.recordID NEQ 0>
				<cfquery name="qGetEOB_Provider" datasource="#trim(variables.ds)#">
			  		SELECT recordID,ProviderID,ProviderName,ProviderMainAddressID,ProviderMainPhoneID,Active,InactiveCode,DateCreated,DateModified
					FROM eob_provider  
					WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.recordID#" /> 
				</cfquery>		
				<cfif qGetEOB_Provider.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProviderID = qGetEOB_Provider.ProviderID;
					variables.ProviderName = qGetEOB_Provider.ProviderName;
					variables.ProviderMainAddressID = qGetEOB_Provider.ProviderMainAddressID;
					variables.ProviderMainPhoneID = qGetEOB_Provider.ProviderMainPhoneID;
					variables.Active = qGetEOB_Provider.Active;
					variables.InactiveCode = qGetEOB_Provider.InactiveCode;
					variables.DateModified = qGetEOB_Provider.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "recordID")><cfset variables.recordID = stValues.recordID /></cfif>
			<cfif StructKeyExists(stValues, "ProviderID")><cfset variables.ProviderID = stValues.ProviderID /></cfif>
			<cfif StructKeyExists(stValues, "ProviderName")><cfset variables.ProviderName = stValues.ProviderName /></cfif>
			<cfif StructKeyExists(stValues, "ProviderMainAddressID")><cfset variables.ProviderMainAddressID = stValues.ProviderMainAddressID /></cfif>
			<cfif StructKeyExists(stValues, "ProviderMainPhoneID")><cfset variables.ProviderMainPhoneID = stValues.ProviderMainPhoneID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for recordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getrecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.recordID>
	</cffunction>
	
	<cffunction name="setrecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="recordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.recordID)) OR trim(arguments.recordID) EQ "">
			<cfset variables.recordID = arguments.recordID />
		<cfelse>
			<cfthrow message="recordID (#arguments.recordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "recordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProviderID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProviderID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProviderID>
	</cffunction>
	
	<cffunction name="setProviderID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProviderID" required="true" type="any" />
			
		<cfset variables.ProviderID = arguments.ProviderID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProviderID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProviderName.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProviderName" acess="public" output="false" returntype="any">
		<cfreturn variables.ProviderName>
	</cffunction>
	
	<cffunction name="setProviderName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProviderName" required="true" type="any" />
			
		<cfset variables.ProviderName = arguments.ProviderName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProviderName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProviderMainAddressID.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProviderMainAddressID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProviderMainAddressID>
	</cffunction>
	
	<cffunction name="setProviderMainAddressID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProviderMainAddressID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ProviderMainAddressID)) OR trim(arguments.ProviderMainAddressID) EQ "">
			<cfset variables.ProviderMainAddressID = arguments.ProviderMainAddressID />
		<cfelse>
			<cfthrow message="ProviderMainAddressID (#arguments.ProviderMainAddressID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProviderMainAddressID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProviderMainPhoneID.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProviderMainPhoneID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProviderMainPhoneID>
	</cffunction>
	
	<cffunction name="setProviderMainPhoneID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProviderMainPhoneID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ProviderMainPhoneID)) OR trim(arguments.ProviderMainPhoneID) EQ "">
			<cfset variables.ProviderMainPhoneID = arguments.ProviderMainPhoneID />
		<cfelse>
			<cfthrow message="ProviderMainPhoneID (#arguments.ProviderMainPhoneID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProviderMainPhoneID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getrecordID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getrecordID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_Provider" output="false" access="public" returntype="query">
				
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_Provider = "" />		
	
		<cfquery name="qGetEOB_Provider" datasource="#trim(variables.ds)#">
	  		SELECT recordID,ProviderID,ProviderName,ProviderMainAddressID,ProviderMainPhoneID,Active,InactiveCode,DateCreated,DateModified
			FROM eob_provider  
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_Provider>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_ProviderActive" />
		
		<cfset var qCreateEOB_Provider = "" />		
		
		<cfset var localProviderID = arguments.obj.getProviderID() />
		<cfset var localProviderName = arguments.obj.getProviderName() />
		<cfset var localProviderMainAddressID = arguments.obj.getProviderMainAddressID() />
		<cfset var localProviderMainPhoneID = arguments.obj.getProviderMainPhoneID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_Provider" datasource="#trim(variables.ds)#">
				INSERT INTO eob_provider (ProviderID,ProviderName,ProviderMainAddressID,ProviderMainPhoneID,InactiveCode)
				VALUES (	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localProviderName) NEQ "" AND trim(localProviderName) NEQ "@@" AND trim(localProviderName) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localProviderMainAddressID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localProviderMainPhoneID)#" cfsqltype="CF_SQL_INTEGER" />,				
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
			read(qCreateEOB_Provider.recordID);
			arguments.obj.setrecordID(qCreateEOB_Provider.recordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_ProviderActive">
				
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_Provider = "" />		
		
		<cfset qGetEOB_Provider = getEOB_Provider(trim(recordID)) />
				
		<cfif qGetEOB_Provider.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setrecordID(qGetEOB_Provider.recordID);
			this.setProviderID(qGetEOB_Provider.ProviderID);
			this.setProviderName(qGetEOB_Provider.ProviderName);
			this.setProviderMainAddressID(qGetEOB_Provider.ProviderMainAddressID);
			this.setProviderMainPhoneID(qGetEOB_Provider.ProviderMainPhoneID);
			this.setActive(qGetEOB_Provider.Active);
			this.setInactiveCode(qGetEOB_Provider.InactiveCode);
			this.setDateCreated(qGetEOB_Provider.DateCreated);
			this.setDateModified(qGetEOB_Provider.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_ProviderActive" />
		<cfset var qUpdateEOB_Provider = "" />
		<cfset var localProviderID = arguments.obj.getProviderID() />
		<cfset var localProviderName = arguments.obj.getProviderName() />
		<cfset var localProviderMainAddressID = arguments.obj.getProviderMainAddressID() />
		<cfset var localProviderMainPhoneID = arguments.obj.getProviderMainPhoneID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_Provider" datasource="#trim(variables.ds)#">
				UPDATE eob_provider  SET
					
					ProviderID =	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ProviderName =	
					<cfif trim(localProviderName) NEQ "" AND trim(localProviderName) NEQ "@@" AND trim(localProviderName) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ProviderMainAddressID =						
						<cfqueryparam value="#trim(localProviderMainAddressID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ProviderMainPhoneID =						
						<cfqueryparam value="#trim(localProviderMainPhoneID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE recordID = <cfqueryparam value="#trim(arguments.obj.getrecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EOB_ProviderActive" />
		<cfset var qDeleteEOB_Provider = "">

		<cfquery name="qDeleteEOB_Provider" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM eob_provider
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getrecordID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>





