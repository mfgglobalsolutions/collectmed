 	


<cfcomponent name="categoryActive" output="false" alias="categoryActive">

	<cfproperty name="CategoryID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="CategoryName" type="string" default="" />
	<cfproperty name="CategoryURL" type="string" default="" />
	<cfproperty name="CategorySortOrder" type="numeric" default="" />
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
		variables.CategoryID = 0;
		variables.SiteID = "";
		variables.CategoryName = "";
		variables.CategoryURL = "";
		variables.CategorySortOrder = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="categoryActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "CategoryID") AND stValues.CategoryID NEQ 0>
				<cfquery name="qGetCategory" datasource="#trim(variables.ds)#">
			  		SELECT CategoryID,SiteID,CategoryName,CategoryURL,CategorySortOrder,Active,InactiveCode,DateCreated,DateModified
					FROM Category  
					WHERE CategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.CategoryID#" /> 
				</cfquery>		
				<cfif qGetCategory.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetCategory.SiteID;
					variables.CategoryName = qGetCategory.CategoryName;
					variables.CategoryURL = qGetCategory.CategoryURL;
					variables.CategorySortOrder = qGetCategory.CategorySortOrder;
					variables.Active = qGetCategory.Active;
					variables.InactiveCode = qGetCategory.InactiveCode;
					variables.DateModified = qGetCategory.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "CategoryID")><cfset variables.CategoryID = stValues.CategoryID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "CategoryName")><cfset variables.CategoryName = stValues.CategoryName /></cfif>
			<cfif StructKeyExists(stValues, "CategoryURL")><cfset variables.CategoryURL = stValues.CategoryURL /></cfif>
			<cfif StructKeyExists(stValues, "CategorySortOrder")><cfset variables.CategorySortOrder = stValues.CategorySortOrder /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CategoryID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCategoryID" acess="public" output="false" returntype="any">
		<cfreturn variables.CategoryID>
	</cffunction>
	
	<cffunction name="setCategoryID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CategoryID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.CategoryID)) OR trim(arguments.CategoryID) EQ "">
			<cfset variables.CategoryID = arguments.CategoryID />
		<cfelse>
			<cfthrow message="CategoryID (#arguments.CategoryID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CategoryID") />		
		
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
	<!--- GET and SET methods for CategoryName.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCategoryName" acess="public" output="false" returntype="any">
		<cfreturn variables.CategoryName>
	</cffunction>
	
	<cffunction name="setCategoryName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CategoryName" required="true" type="any" />
			
		<cfset variables.CategoryName = arguments.CategoryName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CategoryName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CategoryURL.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCategoryURL" acess="public" output="false" returntype="any">
		<cfreturn variables.CategoryURL>
	</cffunction>
	
	<cffunction name="setCategoryURL" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CategoryURL" required="true" type="any" />
			
		<cfset variables.CategoryURL = arguments.CategoryURL />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CategoryURL") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CategorySortOrder.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCategorySortOrder" acess="public" output="false" returntype="any">
		<cfreturn variables.CategorySortOrder>
	</cffunction>
	
	<cffunction name="setCategorySortOrder" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CategorySortOrder" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.CategorySortOrder)) OR trim(arguments.CategorySortOrder) EQ "">
			<cfset variables.CategorySortOrder = arguments.CategorySortOrder />
		<cfelse>
			<cfthrow message="CategorySortOrder (#arguments.CategorySortOrder#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CategorySortOrder") />		
		
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
				 		
		<cfif this.getCategoryID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getCategoryID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCategory" output="false" access="public" returntype="query">
				
		<cfargument name="CategoryID" required="yes" type="numeric" />		
		<cfset var qGetCategory = "" />		
	
		<cfquery name="qGetCategory" datasource="#trim(variables.ds)#">
	  		SELECT CategoryID,SiteID,CategoryName,CategoryURL,CategorySortOrder,Active,InactiveCode,DateCreated,DateModified
			FROM Category  
			WHERE CategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.CategoryID)#" /> 
		</cfquery>
		
		<cfreturn qGetCategory>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="CategoryActive" />
		
		<cfset var qCreateCategory = "" />		
		
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localCategoryName = arguments.obj.getCategoryName() />
		<cfset var localCategoryURL = arguments.obj.getCategoryURL() />
		<cfset var localCategorySortOrder = arguments.obj.getCategorySortOrder() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateCategory" datasource="#trim(variables.ds)#">
				INSERT INTO Category (SiteID,CategoryName,CategoryURL,CategorySortOrder,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localCategoryName)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localCategoryURL) NEQ "" AND trim(localCategoryURL) NEQ "@@" AND trim(localCategoryURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localCategoryURL)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localCategorySortOrder))>						
						<cfqueryparam value="#trim(localCategorySortOrder)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS CategoryID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateCategory.CategoryID);
			arguments.obj.setCategoryID(qCreateCategory.CategoryID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="CategoryActive">
				
		<cfargument name="CategoryID" required="yes" type="numeric" />		
		<cfset var qGetCategory = "" />		
		
		<cfset qGetCategory = getCategory(trim(CategoryID)) />
				
		<cfif qGetCategory.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setCategoryID(qGetCategory.CategoryID);
			this.setSiteID(qGetCategory.SiteID);
			this.setCategoryName(qGetCategory.CategoryName);
			this.setCategoryURL(qGetCategory.CategoryURL);
			this.setCategorySortOrder(qGetCategory.CategorySortOrder);
			this.setActive(qGetCategory.Active);
			this.setInactiveCode(qGetCategory.InactiveCode);
			this.setDateCreated(qGetCategory.DateCreated);
			this.setDateModified(qGetCategory.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="CategoryActive" />
		<cfset var qUpdateCategory = "" />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localCategoryName = arguments.obj.getCategoryName() />
		<cfset var localCategoryURL = arguments.obj.getCategoryURL() />
		<cfset var localCategorySortOrder = arguments.obj.getCategorySortOrder() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateCategory" datasource="#trim(variables.ds)#">
				UPDATE Category  SET
					
					SiteID =						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					CategoryName =						
						<cfqueryparam value="#trim(localCategoryName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					CategoryURL =	
					<cfif trim(localCategoryURL) NEQ "" AND trim(localCategoryURL) NEQ "@@" AND trim(localCategoryURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localCategoryURL)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CategorySortOrder =				
					<cfif IsNumeric(trim(localCategorySortOrder))>						
						<cfqueryparam value="#trim(localCategorySortOrder)#" cfsqltype="CF_SQL_INTEGER" />	
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
				WHERE CategoryID = <cfqueryparam value="#trim(arguments.obj.getCategoryID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="CategoryActive" />
		<cfset var qDeleteCategory = "">

		<cfquery name="qDeleteCategory" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Category
			WHERE CategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getCategoryID())#" /> 
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


