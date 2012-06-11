 	


<cfcomponent name="addressActive" output="false" alias="addressActive">

	<cfproperty name="AddressID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="AddressTypeID" type="string" default="" />
	<cfproperty name="Attention" type="string" default="" />
	<cfproperty name="AddressLine1" type="string" default="" />
	<cfproperty name="AddressLine2" type="string" default="" />
	<cfproperty name="City" type="string" default="" />
	<cfproperty name="StateID" type="numeric" default="" />
	<cfproperty name="ZipCode" type="string" default="" />
	<cfproperty name="CountryID" type="numeric" default="" />
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
		variables.AddressID = 0;
		variables.SiteID = "";
		variables.AddressTypeID = "";
		variables.Attention = "";
		variables.AddressLine1 = "";
		variables.AddressLine2 = "";
		variables.City = "";
		variables.StateID = "";
		variables.ZipCode = "";
		variables.CountryID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="addressActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "AddressID") AND stValues.AddressID NEQ 0>
				<cfquery name="qGetAddress" datasource="#trim(variables.ds)#">
			  		SELECT AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified
					FROM address  
					WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.AddressID#" /> 
				</cfquery>		
				<cfif qGetAddress.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetAddress.SiteID;
					variables.AddressTypeID = qGetAddress.AddressTypeID;
					variables.Attention = qGetAddress.Attention;
					variables.AddressLine1 = qGetAddress.AddressLine1;
					variables.AddressLine2 = qGetAddress.AddressLine2;
					variables.City = qGetAddress.City;
					variables.StateID = qGetAddress.StateID;
					variables.ZipCode = qGetAddress.ZipCode;
					variables.CountryID = qGetAddress.CountryID;
					variables.Active = qGetAddress.Active;
					variables.InactiveCode = qGetAddress.InactiveCode;
					variables.DateModified = qGetAddress.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "AddressID")><cfset variables.AddressID = stValues.AddressID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "AddressTypeID")><cfset variables.AddressTypeID = stValues.AddressTypeID /></cfif>
			<cfif StructKeyExists(stValues, "Attention")><cfset variables.Attention = stValues.Attention /></cfif>
			<cfif StructKeyExists(stValues, "AddressLine1")><cfset variables.AddressLine1 = stValues.AddressLine1 /></cfif>
			<cfif StructKeyExists(stValues, "AddressLine2")><cfset variables.AddressLine2 = stValues.AddressLine2 /></cfif>
			<cfif StructKeyExists(stValues, "City")><cfset variables.City = stValues.City /></cfif>
			<cfif StructKeyExists(stValues, "StateID")><cfset variables.StateID = stValues.StateID /></cfif>
			<cfif StructKeyExists(stValues, "ZipCode")><cfset variables.ZipCode = stValues.ZipCode /></cfif>
			<cfif StructKeyExists(stValues, "CountryID")><cfset variables.CountryID = stValues.CountryID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
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
	<!--- GET and SET methods for SiteID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSiteID" acess="public" output="false" returntype="any">
		<cfreturn variables.SiteID>
	</cffunction>
	
	<cffunction name="setSiteID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SiteID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SiteID)) OR trim(arguments.SiteID) EQ "">
			<cfset variables.SiteID = arguments.SiteID />
		<cfelse>
			<cfthrow message="SiteID (#arguments.SiteID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SiteID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AddressTypeID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressTypeID" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressTypeID>
	</cffunction>
	
	<cffunction name="setAddressTypeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressTypeID" required="true" type="any" />
			
		<cfset variables.AddressTypeID = arguments.AddressTypeID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressTypeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Attention.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAttention" acess="public" output="false" returntype="any">
		<cfreturn variables.Attention>
	</cffunction>
	
	<cffunction name="setAttention" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Attention" required="true" type="any" />
			
		<cfset variables.Attention = arguments.Attention />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Attention") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AddressLine1.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressLine1" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressLine1>
	</cffunction>
	
	<cffunction name="setAddressLine1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressLine1" required="true" type="any" />
			
		<cfset variables.AddressLine1 = arguments.AddressLine1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressLine1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AddressLine2.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressLine2" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressLine2>
	</cffunction>
	
	<cffunction name="setAddressLine2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressLine2" required="true" type="any" />
			
		<cfset variables.AddressLine2 = arguments.AddressLine2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressLine2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for City.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCity" acess="public" output="false" returntype="any">
		<cfreturn variables.City>
	</cffunction>
	
	<cffunction name="setCity" acess="public" output="false" returntype="boolean">
		
		<cfargument name="City" required="true" type="any" />
			
		<cfset variables.City = arguments.City />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "City") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for StateID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStateID" acess="public" output="false" returntype="any">
		<cfreturn variables.StateID>
	</cffunction>
	
	<cffunction name="setStateID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="StateID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.StateID)) OR trim(arguments.StateID) EQ "">
			<cfset variables.StateID = arguments.StateID />
		<cfelse>
			<cfthrow message="StateID (#arguments.StateID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "StateID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ZipCode.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getZipCode" acess="public" output="false" returntype="any">
		<cfreturn variables.ZipCode>
	</cffunction>
	
	<cffunction name="setZipCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ZipCode" required="true" type="any" />
			
		<cfset variables.ZipCode = arguments.ZipCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ZipCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CountryID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCountryID" acess="public" output="false" returntype="any">
		<cfreturn variables.CountryID>
	</cffunction>
	
	<cffunction name="setCountryID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CountryID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.CountryID)) OR trim(arguments.CountryID) EQ "">
			<cfset variables.CountryID = arguments.CountryID />
		<cfelse>
			<cfthrow message="CountryID (#arguments.CountryID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CountryID") />		
		
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
				 		
		<cfif this.getAddressID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getAddressID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAddress" output="false" access="public" returntype="query">
				
		<cfargument name="AddressID" required="yes" type="numeric" />		
		<cfset var qGetAddress = "" />		
	
		<cfquery name="qGetAddress" datasource="#trim(variables.ds)#">
	  		SELECT AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified
			FROM address  
			WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.AddressID)#" /> 
		</cfquery>
		
		<cfreturn qGetAddress>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="AddressActive" />
		
		<cfset var qCreateAddress = "" />		
		
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localAddressTypeID = arguments.obj.getAddressTypeID() />
		<cfset var localAttention = arguments.obj.getAttention() />
		<cfset var localAddressLine1 = arguments.obj.getAddressLine1() />
		<cfset var localAddressLine2 = arguments.obj.getAddressLine2() />
		<cfset var localCity = arguments.obj.getCity() />
		<cfset var localStateID = arguments.obj.getStateID() />
		<cfset var localZipCode = arguments.obj.getZipCode() />
		<cfset var localCountryID = arguments.obj.getCountryID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateAddress" datasource="#trim(variables.ds)#">
				INSERT INTO address (SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localAddressTypeID) NEQ "" AND trim(localAddressTypeID) NEQ "@@" AND trim(localAddressTypeID) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressTypeID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAttention) NEQ "" AND trim(localAttention) NEQ "@@" AND trim(localAttention) NEQ "NULL">						
						<cfqueryparam value="#trim(localAttention)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAddressLine1) NEQ "" AND trim(localAddressLine1) NEQ "@@" AND trim(localAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAddressLine2) NEQ "" AND trim(localAddressLine2) NEQ "@@" AND trim(localAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCity) NEQ "" AND trim(localCity) NEQ "@@" AND trim(localCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localCity)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localStateID))>						
						<cfqueryparam value="#trim(localStateID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localZipCode) NEQ "" AND trim(localZipCode) NEQ "@@" AND trim(localZipCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localZipCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localCountryID))>						
						<cfqueryparam value="#trim(localCountryID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS AddressID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateAddress.AddressID);
			arguments.obj.setAddressID(qCreateAddress.AddressID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="AddressActive">
				
		<cfargument name="AddressID" required="yes" type="numeric" />		
		<cfset var qGetAddress = "" />		
		
		<cfset qGetAddress = getAddress(trim(AddressID)) />
				
		<cfif qGetAddress.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setAddressID(qGetAddress.AddressID);
			this.setSiteID(qGetAddress.SiteID);
			this.setAddressTypeID(qGetAddress.AddressTypeID);
			this.setAttention(qGetAddress.Attention);
			this.setAddressLine1(qGetAddress.AddressLine1);
			this.setAddressLine2(qGetAddress.AddressLine2);
			this.setCity(qGetAddress.City);
			this.setStateID(qGetAddress.StateID);
			this.setZipCode(qGetAddress.ZipCode);
			this.setCountryID(qGetAddress.CountryID);
			this.setActive(qGetAddress.Active);
			this.setInactiveCode(qGetAddress.InactiveCode);
			this.setDateCreated(qGetAddress.DateCreated);
			this.setDateModified(qGetAddress.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="AddressActive" />
		<cfset var qUpdateAddress = "" />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localAddressTypeID = arguments.obj.getAddressTypeID() />
		<cfset var localAttention = arguments.obj.getAttention() />
		<cfset var localAddressLine1 = arguments.obj.getAddressLine1() />
		<cfset var localAddressLine2 = arguments.obj.getAddressLine2() />
		<cfset var localCity = arguments.obj.getCity() />
		<cfset var localStateID = arguments.obj.getStateID() />
		<cfset var localZipCode = arguments.obj.getZipCode() />
		<cfset var localCountryID = arguments.obj.getCountryID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateAddress" datasource="#trim(variables.ds)#">
				UPDATE address  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AddressTypeID =	
					<cfif trim(localAddressTypeID) NEQ "" AND trim(localAddressTypeID) NEQ "@@" AND trim(localAddressTypeID) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressTypeID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Attention =	
					<cfif trim(localAttention) NEQ "" AND trim(localAttention) NEQ "@@" AND trim(localAttention) NEQ "NULL">						
						<cfqueryparam value="#trim(localAttention)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AddressLine1 =	
					<cfif trim(localAddressLine1) NEQ "" AND trim(localAddressLine1) NEQ "@@" AND trim(localAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AddressLine2 =	
					<cfif trim(localAddressLine2) NEQ "" AND trim(localAddressLine2) NEQ "@@" AND trim(localAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					City =	
					<cfif trim(localCity) NEQ "" AND trim(localCity) NEQ "@@" AND trim(localCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localCity)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					StateID =				
					<cfif IsNumeric(trim(localStateID))>						
						<cfqueryparam value="#trim(localStateID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ZipCode =	
					<cfif trim(localZipCode) NEQ "" AND trim(localZipCode) NEQ "@@" AND trim(localZipCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localZipCode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CountryID =				
					<cfif IsNumeric(trim(localCountryID))>						
						<cfqueryparam value="#trim(localCountryID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
				WHERE AddressID = <cfqueryparam value="#trim(arguments.obj.getAddressID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="AddressActive" />
		<cfset var qDeleteAddress = "">

		<cfquery name="qDeleteAddress" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM address
			WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getAddressID())#" /> 
		</cfquery>

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
		<cffunction name="getAddressesByEntityId">		
			
			<cfargument name="clientID" required="yes" type="numeric">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="Active" required="no" default="">
												
			<cftry>			
				
				<cfquery name="getAddresses" datasource="#trim(variables.ds)#">
					SELECT a.AddressID, a.SiteID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, a.CountryID, a.Active, a.DateCreated, a.Attention,  
					sli2.ItemNameDisplay AS AddressType, sli.ItemNameDisplay AS StateFull, sli.ItemDescription AS StateAbbr,
					ea.IsDefault
					FROM entityaddress ea INNER JOIN address a ON ea.AddressID = a.AddressID
					INNER JOIN pa_master.StandardListItem sli ON a.stateID = sli.StandardListItemID		
					INNER JOIN pa_master.StandardListItem sli2 ON a.AddressTypeID = sli2.StandardListItemID 				
					WHERE ea.EntityID = <cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />  				
					<cfif IsNumeric(Active)>
						AND ea.Active = <cfqueryparam value="#trim(arguments.Active)#" cfsqltype="CF_SQL_INTEGER" /> 	
					</cfif>		
					Order BY ea.IsDefault DESC, a.AddressID		
				</cfquery>
					
				<cfreturn getAddresses>						
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to bind an Address to an entity.                  --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="bindAddressEntity">		
			
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="AddressID" required="yes" type="numeric">
								
			<cftry>			
				
				<cfquery name="getEntityAddress" datasource="#trim(variables.ds)#">
					SELECT * 
					FROM entityaddress  
					WHERE EntityID = <cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" /> 
					AND AddressID = <cfqueryparam value="#trim(arguments.AddressID)#" cfsqltype="CF_SQL_INTEGER" />			
				</cfquery>		
				<cfif getEntityAddress.recordCount LTE 0>
					<cfquery name="insertEntityAddress" datasource="#trim(variables.ds)#">
						INSERT INTO entityaddress  (EntityID, AddressID)
						VALUES(
							<cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />, 
							<cfqueryparam value="#trim(arguments.AddressID)#" cfsqltype="CF_SQL_INTEGER" />
						)					
					</cfquery>							
				</cfif>
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to ARCHIVE an address from the db.                --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="archiveAddress">		
			
			<cfargument name="AddressID" required="yes" type="numeric">
								
			<cftry>			
							
				<cfquery name="archiveEntityAddress" datasource="#trim(variables.ds)#">
					UPDATE entityaddress 
					SET Active = 0, InactiveCode = 68
					WHERE AddressID = <cfqueryparam value="#trim(arguments.AddressID)#" cfsqltype="CF_SQL_INTEGER" />	
				</cfquery>	
						
				<cfquery name="archiveAddress" datasource="#trim(variables.ds)#">
					UPDATE address 
					SET Active = 0, InactiveCode = 68
					WHERE AddressID = <cfqueryparam value="#trim(arguments.AddressID)#" cfsqltype="CF_SQL_INTEGER" />
				</cfquery>
									
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>







