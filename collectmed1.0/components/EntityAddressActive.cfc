 	


<cfcomponent name="entityaddressActive" output="false" alias="entityaddressActive">

	<cfproperty name="recordID" type="numeric" default="0" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="AddressID" type="numeric" default="" />
	<cfproperty name="IsDefault" type="string" default="" />
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
		variables.EntityID = "";
		variables.AddressID = "";
		variables.IsDefault = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="entityaddressActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "recordID") AND stValues.recordID NEQ 0>
				<cfquery name="qGetEntityAddress" datasource="#trim(variables.ds)#">
			  		SELECT recordID,EntityID,AddressID,IsDefault,Active,InactiveCode,DateCreated,DateModified
					FROM EntityAddress  
					WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.recordID#" /> 
				</cfquery>		
				<cfif qGetEntityAddress.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.EntityID = qGetEntityAddress.EntityID;
					variables.AddressID = qGetEntityAddress.AddressID;
					variables.IsDefault = qGetEntityAddress.IsDefault;
					variables.Active = qGetEntityAddress.Active;
					variables.InactiveCode = qGetEntityAddress.InactiveCode;
					variables.DateModified = qGetEntityAddress.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "recordID")><cfset variables.recordID = stValues.recordID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "AddressID")><cfset variables.AddressID = stValues.AddressID /></cfif>
			<cfif StructKeyExists(stValues, "IsDefault")><cfset variables.IsDefault = stValues.IsDefault /></cfif>
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
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AddressID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressID" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressID>
	</cffunction>
	
	<cffunction name="setAddressID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AddressID)) OR trim(arguments.AddressID) EQ "">
			<cfset variables.AddressID = arguments.AddressID />
		<cfelse>
			<cfthrow message="AddressID (#arguments.AddressID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IsDefault.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIsDefault" acess="public" output="false" returntype="any">
		<cfreturn variables.IsDefault>
	</cffunction>
	
	<cffunction name="setIsDefault" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IsDefault" required="true" type="any" />
			
		<cfset variables.IsDefault = arguments.IsDefault />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IsDefault") />		
		
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
	<cffunction name="getEntityAddress" output="false" access="public" returntype="query">
				
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetEntityAddress = "" />		
	
		<cfquery name="qGetEntityAddress" datasource="#trim(variables.ds)#">
	  		SELECT recordID,EntityID,AddressID,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM EntityAddress  
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.recordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityAddress>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EntityAddressActive" />
		
		<cfset var qCreateEntityAddress = "" />		
		
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localAddressID = arguments.obj.getAddressID() />
		<cfset var localIsDefault = arguments.obj.getIsDefault() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityAddress" datasource="#trim(variables.ds)#">
				INSERT INTO EntityAddress (EntityID,AddressID,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localAddressID)#" cfsqltype="CF_SQL_INTEGER" />,				
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
			read(qCreateEntityAddress.recordID);
			arguments.obj.setrecordID(qCreateEntityAddress.recordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityAddressActive">
				
		<cfargument name="recordID" required="yes" type="numeric" />		
		<cfset var qGetEntityAddress = "" />		
		
		<cfset qGetEntityAddress = getEntityAddress(trim(recordID)) />
				
		<cfif qGetEntityAddress.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setrecordID(qGetEntityAddress.recordID);
			this.setEntityID(qGetEntityAddress.EntityID);
			this.setAddressID(qGetEntityAddress.AddressID);
			this.setIsDefault(qGetEntityAddress.IsDefault);
			this.setActive(qGetEntityAddress.Active);
			this.setInactiveCode(qGetEntityAddress.InactiveCode);
			this.setDateCreated(qGetEntityAddress.DateCreated);
			this.setDateModified(qGetEntityAddress.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EntityAddressActive" />
		<cfset var qUpdateEntityAddress = "" />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localAddressID = arguments.obj.getAddressID() />
		<cfset var localIsDefault = arguments.obj.getIsDefault() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntityAddress" datasource="#trim(variables.ds)#">
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
				WHERE recordID = <cfqueryparam value="#trim(arguments.obj.getrecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EntityAddressActive" />
		<cfset var qDeleteEntityAddress = "">

		<cfquery name="qDeleteEntityAddress" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM EntityAddress
			WHERE recordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getrecordID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!-------------------------------------------------------------------------------------->
		<!--- We are only allowing one address to be the default so we take the              --->
		<!--- entityID and clear all the defaults and then set the addressID that            --->
		<!--- was sent in to the default.                                                    --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="setEntityAddressDefault" output="false" access="public" returntype="boolean">		
			
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="AddressID" required="yes" type="numeric">
								
			<cftry>			
				
				<cfquery name="setDefaults" datasource="#trim(variables.ds)#">
					UPDATE EntityAddress 
					SET IsDefault = 0
					WHERE EntityID = <cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />   					
				</cfquery>		
				
				<cfquery name="setDefault" datasource="#trim(variables.ds)#">
					UPDATE EntityAddress 
					SET IsDefault = 1
					WHERE EntityID = <cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" /> 
					AND AddressID = <cfqueryparam value="#trim(arguments.AddressID)#" cfsqltype="CF_SQL_INTEGER" /> 					
				</cfquery>	
				
				<cfreturn true>
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


