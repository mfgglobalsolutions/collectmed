 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SubCategoryBean" />
		
		<cfset var qCreateSubCategory = "" />		
		
		<cfset var localCategoryID = arguments.bean.getCategoryID() />
		<cfset var localSubCategoryName = arguments.bean.getSubCategoryName() />
		<cfset var localSubCategoryURL = arguments.bean.getSubCategoryURL() />
		<cfset var localSubCategorySortOrder = arguments.bean.getSubCategorySortOrder() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateSubCategory" datasource="#trim(arguments.ds)#">
				INSERT INTO subcategory (CategoryID,SubCategoryName,SubCategoryURL,SubCategorySortOrder,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localCategoryID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localSubCategoryName)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localSubCategoryURL) NEQ "" AND trim(localSubCategoryURL) NEQ "@@" AND trim(localSubCategoryURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localSubCategoryURL)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localSubCategorySortOrder))>						
						<cfqueryparam value="#trim(localSubCategorySortOrder)#" cfsqltype="CF_SQL_INTEGER" />							
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
				SELECT LAST_INSERT_ID() AS SubCategoryID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setSubCategoryID(qCreateSubCategory.SubCategoryID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="SubCategoryBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="SubCategoryID" required="yes" type="numeric" />		
		<cfset var qGetSubCategory = "" />		
		
		<cfset qGetSubCategory = getSubCategory(trim(arguments.ds), trim(SubCategoryID)) />
				
		<cfif qGetSubCategory.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objSubCategory = createObject("component", "SubCategoryBean").init(arguments.ds);
			objSubCategory.setSubCategoryID(qGetSubCategory.SubCategoryID);
			objSubCategory.setCategoryID(qGetSubCategory.CategoryID);
			objSubCategory.setSubCategoryName(qGetSubCategory.SubCategoryName);
			objSubCategory.setSubCategoryURL(qGetSubCategory.SubCategoryURL);
			objSubCategory.setSubCategorySortOrder(qGetSubCategory.SubCategorySortOrder);
			objSubCategory.setActive(qGetSubCategory.Active);
			objSubCategory.setInactiveCode(qGetSubCategory.InactiveCode);
			objSubCategory.setDateCreated(qGetSubCategory.DateCreated);
			objSubCategory.setDateModified(qGetSubCategory.DateModified);				
			return objSubCategory;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SubCategoryBean" />
		<cfset var qUpdateSubCategory = "" />
		<cfset var localCategoryID = arguments.bean.getCategoryID() />
		<cfset var localSubCategoryName = arguments.bean.getSubCategoryName() />
		<cfset var localSubCategoryURL = arguments.bean.getSubCategoryURL() />
		<cfset var localSubCategorySortOrder = arguments.bean.getSubCategorySortOrder() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateSubCategory" datasource="#trim(arguments.ds)#">
				UPDATE subcategory  SET
					
					CategoryID =						
						<cfqueryparam value="#trim(localCategoryID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					SubCategoryName =						
						<cfqueryparam value="#trim(localSubCategoryName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					SubCategoryURL =	
					<cfif trim(localSubCategoryURL) NEQ "" AND trim(localSubCategoryURL) NEQ "@@" AND trim(localSubCategoryURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localSubCategoryURL)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SubCategorySortOrder =				
					<cfif IsNumeric(trim(localSubCategorySortOrder))>						
						<cfqueryparam value="#trim(localSubCategorySortOrder)#" cfsqltype="CF_SQL_INTEGER" />	
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
				WHERE SubCategoryID = <cfqueryparam value="#trim(arguments.bean.getSubCategoryID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SubCategoryBean" />
		<cfset var qDeleteSubCategory = "">

		<cfquery name="qDeleteSubCategory" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM subcategory
			WHERE SubCategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getSubCategoryID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSubCategory" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="SubCategoryID" required="yes" type="numeric" />		
		<cfset var qGetSubCategory = "" />		
	
		<cfquery name="qGetSubCategory" datasource="#trim(arguments.ds)#">
	  		SELECT SubCategoryID,CategoryID,SubCategoryName,SubCategoryURL,SubCategorySortOrder,Active,InactiveCode,DateCreated,DateModified
			FROM subcategory  
			WHERE SubCategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.SubCategoryID)#" /> 
		</cfquery>
		
		<cfreturn qGetSubCategory>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





