 	


<cfcomponent name="subcategoryBean" output="false" alias="subcategoryBean" extends="SubCategoryDAO">

	<cfproperty name="SubCategoryID" type="numeric" default="0" />
	<cfproperty name="CategoryID" type="numeric" default="" />
	<cfproperty name="SubCategoryName" type="string" default="" />
	<cfproperty name="SubCategoryURL" type="string" default="" />
	<cfproperty name="SubCategorySortOrder" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.SubCategoryID = 0;
		variables.CategoryID = "";
		variables.SubCategoryName = "";
		variables.SubCategoryURL = "";
		variables.SubCategorySortOrder = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="subcategoryBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "SubCategoryID") AND stValues.SubCategoryID NEQ 0>
				<cfquery name="qGetSubCategory" datasource="#trim(arguments.ds)#">
			  		SELECT SubCategoryID,CategoryID,SubCategoryName,SubCategoryURL,SubCategorySortOrder,Active,InactiveCode,DateCreated,DateModified
					FROM subcategory  
					WHERE SubCategoryID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.SubCategoryID#" /> 
				</cfquery>		
				<cfif qGetSubCategory.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.CategoryID = qGetSubCategory.CategoryID;
					variables.SubCategoryName = qGetSubCategory.SubCategoryName;
					variables.SubCategoryURL = qGetSubCategory.SubCategoryURL;
					variables.SubCategorySortOrder = qGetSubCategory.SubCategorySortOrder;
					variables.Active = qGetSubCategory.Active;
					variables.InactiveCode = qGetSubCategory.InactiveCode;
					variables.DateModified = qGetSubCategory.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "SubCategoryID")><cfset variables.SubCategoryID = stValues.SubCategoryID /></cfif>
			<cfif StructKeyExists(stValues, "CategoryID")><cfset variables.CategoryID = stValues.CategoryID /></cfif>
			<cfif StructKeyExists(stValues, "SubCategoryName")><cfset variables.SubCategoryName = stValues.SubCategoryName /></cfif>
			<cfif StructKeyExists(stValues, "SubCategoryURL")><cfset variables.SubCategoryURL = stValues.SubCategoryURL /></cfif>
			<cfif StructKeyExists(stValues, "SubCategorySortOrder")><cfset variables.SubCategorySortOrder = stValues.SubCategorySortOrder /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SubCategoryID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSubCategoryID" acess="public" output="false" returntype="any">
		<cfreturn variables.SubCategoryID>
	</cffunction>
	
	<cffunction name="setSubCategoryID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SubCategoryID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SubCategoryID)) OR trim(arguments.SubCategoryID) EQ "">
			<cfset variables.SubCategoryID = arguments.SubCategoryID />
		<cfelse>
			<cfthrow message="SubCategoryID (#arguments.SubCategoryID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SubCategoryID") />		
		
		<cfreturn true>
		
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
	<!--- GET and SET methods for SubCategoryName.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSubCategoryName" acess="public" output="false" returntype="any">
		<cfreturn variables.SubCategoryName>
	</cffunction>
	
	<cffunction name="setSubCategoryName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SubCategoryName" required="true" type="any" />
			
		<cfset variables.SubCategoryName = arguments.SubCategoryName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SubCategoryName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SubCategoryURL.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSubCategoryURL" acess="public" output="false" returntype="any">
		<cfreturn variables.SubCategoryURL>
	</cffunction>
	
	<cffunction name="setSubCategoryURL" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SubCategoryURL" required="true" type="any" />
			
		<cfset variables.SubCategoryURL = arguments.SubCategoryURL />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SubCategoryURL") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SubCategorySortOrder.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSubCategorySortOrder" acess="public" output="false" returntype="any">
		<cfreturn variables.SubCategorySortOrder>
	</cffunction>
	
	<cffunction name="setSubCategorySortOrder" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SubCategorySortOrder" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SubCategorySortOrder)) OR trim(arguments.SubCategorySortOrder) EQ "">
			<cfset variables.SubCategorySortOrder = arguments.SubCategorySortOrder />
		<cfelse>
			<cfthrow message="SubCategorySortOrder (#arguments.SubCategorySortOrder#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SubCategorySortOrder") />		
		
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>



