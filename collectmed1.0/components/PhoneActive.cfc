 	


<cfcomponent name="phoneActive" output="false" alias="phoneActive">

	<cfproperty name="PhoneID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="PhoneTypeID" type="string" default="" />
	<cfproperty name="PhoneNumber" type="string" default="" />
	<cfproperty name="PhoneExtension" type="string" default="" />
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
		variables.PhoneID = 0;
		variables.SiteID = "";
		variables.PhoneTypeID = "";
		variables.PhoneNumber = "";
		variables.PhoneExtension = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="phoneActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "PhoneID") AND stValues.PhoneID NEQ 0>
				<cfquery name="qGetPhone" datasource="#trim(variables.ds)#">
			  		SELECT PhoneID,SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode,DateCreated,DateModified
					FROM phone  
					WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.PhoneID#" /> 
				</cfquery>		
				<cfif qGetPhone.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetPhone.SiteID;
					variables.PhoneTypeID = qGetPhone.PhoneTypeID;
					variables.PhoneNumber = qGetPhone.PhoneNumber;
					variables.PhoneExtension = qGetPhone.PhoneExtension;
					variables.Active = qGetPhone.Active;
					variables.InactiveCode = qGetPhone.InactiveCode;
					variables.DateModified = qGetPhone.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "PhoneID")><cfset variables.PhoneID = stValues.PhoneID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "PhoneTypeID")><cfset variables.PhoneTypeID = stValues.PhoneTypeID /></cfif>
			<cfif StructKeyExists(stValues, "PhoneNumber")><cfset variables.PhoneNumber = stValues.PhoneNumber /></cfif>
			<cfif StructKeyExists(stValues, "PhoneExtension")><cfset variables.PhoneExtension = stValues.PhoneExtension /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PhoneID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneID" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneID>
	</cffunction>
	
	<cffunction name="setPhoneID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PhoneID)) OR trim(arguments.PhoneID) EQ "">
			<cfset variables.PhoneID = arguments.PhoneID />
		<cfelse>
			<cfthrow message="PhoneID (#arguments.PhoneID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneID") />		
		
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
	<!--- GET and SET methods for PhoneTypeID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneTypeID" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneTypeID>
	</cffunction>
	
	<cffunction name="setPhoneTypeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneTypeID" required="true" type="any" />
			
		<cfset variables.PhoneTypeID = arguments.PhoneTypeID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneTypeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PhoneNumber.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneNumber>
	</cffunction>
	
	<cffunction name="setPhoneNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneNumber" required="true" type="any" />
			
		<cfset variables.PhoneNumber = arguments.PhoneNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PhoneExtension.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneExtension" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneExtension>
	</cffunction>
	
	<cffunction name="setPhoneExtension" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneExtension" required="true" type="any" />
			
		<cfset variables.PhoneExtension = arguments.PhoneExtension />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneExtension") />		
		
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
				 		
		<cfif this.getPhoneID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getPhoneID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPhone" output="false" access="public" returntype="query">
				
		<cfargument name="PhoneID" required="yes" type="numeric" />		
		<cfset var qGetPhone = "" />		
	
		<cfquery name="qGetPhone" datasource="#trim(variables.ds)#">
	  		SELECT PhoneID,SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode,DateCreated,DateModified
			FROM phone  
			WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PhoneID)#" /> 
		</cfquery>
		
		<cfreturn qGetPhone>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="PhoneActive" />
		
		<cfset var qCreatePhone = "" />		
		
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localPhoneTypeID = arguments.obj.getPhoneTypeID() />
		<cfset var localPhoneNumber = arguments.obj.getPhoneNumber() />
		<cfset var localPhoneExtension = arguments.obj.getPhoneExtension() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePhone" datasource="#trim(variables.ds)#">
				INSERT INTO phone (SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,InactiveCode)
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
			read(qCreatePhone.PhoneID);
			arguments.obj.setPhoneID(qCreatePhone.PhoneID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PhoneActive">
				
		<cfargument name="PhoneID" required="yes" type="numeric" />		
		<cfset var qGetPhone = "" />		
		
		<cfset qGetPhone = getPhone(trim(PhoneID)) />
				
		<cfif qGetPhone.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setPhoneID(qGetPhone.PhoneID);
			this.setSiteID(qGetPhone.SiteID);
			this.setPhoneTypeID(qGetPhone.PhoneTypeID);
			this.setPhoneNumber(qGetPhone.PhoneNumber);
			this.setPhoneExtension(qGetPhone.PhoneExtension);
			this.setActive(qGetPhone.Active);
			this.setInactiveCode(qGetPhone.InactiveCode);
			this.setDateCreated(qGetPhone.DateCreated);
			this.setDateModified(qGetPhone.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="PhoneActive" />
		<cfset var qUpdatePhone = "" />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localPhoneTypeID = arguments.obj.getPhoneTypeID() />
		<cfset var localPhoneNumber = arguments.obj.getPhoneNumber() />
		<cfset var localPhoneExtension = arguments.obj.getPhoneExtension() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePhone" datasource="#trim(variables.ds)#">
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
				WHERE PhoneID = <cfqueryparam value="#trim(arguments.obj.getPhoneID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="PhoneActive" />
		<cfset var qDeletePhone = "">

		<cfquery name="qDeletePhone" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM phone
			WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getPhoneID())#" /> 
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
		<cffunction name="getPhonesByEntityId">		
			
			<cfargument name="clientID" required="yes" type="numeric">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="Active" required="no" default="">
												
			<cftry>			
				
				<cfquery name="getPhones" datasource="#trim(variables.ds)#">
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
			
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="PhoneID" required="yes" type="numeric">
			<cfargument name="IsDefault" required="no" type="numeric" default="0">
								
			<cftry>			
				
				<cfquery name="getEntityPhone" datasource="#trim(variables.ds)#">
					SELECT * 
					FROM entityphone  
					WHERE EntityID = #trim(arguments.EntityID)# AND PhoneID = #trim(arguments.PhoneID)#					
				</cfquery>		
				<cfif getEntityPhone.recordCount LTE 0>
					<cfquery name="insertEntityPhone" datasource="#trim(variables.ds)#">
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
			
			<cfargument name="PhoneID" required="yes" type="numeric">
								
			<cftry>
											
				<cfquery name="archiveEntityPhone" datasource="#trim(variables.ds)#">
					UPDATE entityphone 
					SET Active = 0, InactiveCode = 68
					WHERE PhoneID = <cfqueryparam value="#trim(arguments.PhoneID)#" cfsqltype="CF_SQL_INTEGER" /> 		
				</cfquery>	
						
				<cfquery name="archivePhone" datasource="#trim(variables.ds)#">
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





