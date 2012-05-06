 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="CategoryBean" />
		
		<cfset var qCreateCategory = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localCategoryName = arguments.bean.getCategoryName() />
		<cfset var localCategoryURL = arguments.bean.getCategoryURL() />
		<cfset var localCategorySortOrder = arguments.bean.getCategorySortOrder() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateCategory" datasource="#trim(arguments.ds)#">
				INSERT INTO Category (SiteID,CategoryName,CategoryURL,CategorySortOrder,Active,InactiveCode)
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
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
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
			arguments.bean.setCategoryID(qCreateCategory.CategoryID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="CategoryBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="CategoryID" required="yes" type="numeric" />		
		<cfset var qGetCategory = "" />		
		
		<cfset qGetCategory = getCategory(trim(arguments.ds), trim(CategoryID)) />
				
		<cfif qGetCategory.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objCategory = createObject("component", "CategoryBean").init(arguments.ds);
			objCategory.setCategoryID(qGetCategory.CategoryID);
			objCategory.setSiteID(qGetCategory.SiteID);
			objCategory.setCategoryName(qGetCategory.CategoryName);
			objCategory.setCategoryURL(qGetCategory.CategoryURL);
			objCategory.setCategorySortOrder(qGetCategory.CategorySortOrder);
			objCategory.setActive(qGetCategory.Active);
			objCategory.setInactiveCode(qGetCategory.InactiveCode);
			objCategory.setDateCreated(qGetCategory.DateCreated);
			objCategory.setDateModified(qGetCategory.DateModified);				
			return objCategory;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="CategoryBean" />
		<cfset var qUpdateCategory = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localCategoryName = arguments.bean.getCategoryName() />
		<cfset var localCategoryURL = arguments.bean.getCategoryURL() />
		<cfset var localCategorySortOrder = arguments.bean.getCategorySortOrder() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateCategory" datasource="#trim(arguments.ds)#">
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
				WHERE CategoryID = <cfqueryparam value="#trim(arguments.bean.getCategoryID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="CategoryBean" />
		<cfset var qDeleteCategory = "">

		<cfquery name="qDeleteCategory" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Category
			WHERE CategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getCategoryID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCategory" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="CategoryID" required="yes" type="numeric" />		
		<cfset var qGetCategory = "" />		
	
		<cfquery name="qGetCategory" datasource="#trim(arguments.ds)#">
	  		SELECT CategoryID,SiteID,CategoryName,CategoryURL,CategorySortOrder,Active,InactiveCode,DateCreated,DateModified
			FROM Category  
			WHERE CategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.CategoryID)#" /> 
		</cfquery>
		
		<cfreturn qGetCategory>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


