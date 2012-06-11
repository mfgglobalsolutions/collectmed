 	


<cfcomponent name="pageBean" output="false" alias="pageBean" extends="PageDAO">

	<cfproperty name="PageID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="CategoryID" type="numeric" default="" />
	<cfproperty name="PageName" type="string" default="" />
	<cfproperty name="Title" type="string" default="" />
	<cfproperty name="Security" type="numeric" default="" />
	<cfproperty name="ShowPageLink" type="string" default="" />
	<cfproperty name="LinkName" type="string" default="" />
	<cfproperty name="LeftNavigation" type="string" default="" />
	<cfproperty name="RightNavigation" type="string" default="" />
	<cfproperty name="Header" type="string" default="" />
	<cfproperty name="Footer" type="string" default="" />
	<cfproperty name="ImageOn" type="string" default="" />
	<cfproperty name="ImageOff" type="string" default="" />
	<cfproperty name="SortOrder" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.PageID = 0;
		variables.SiteID = "";
		variables.CategoryID = "";
		variables.PageName = "";
		variables.Title = "";
		variables.Security = "";
		variables.ShowPageLink = "";
		variables.LinkName = "";
		variables.LeftNavigation = "";
		variables.RightNavigation = "";
		variables.Header = "";
		variables.Footer = "";
		variables.ImageOn = "";
		variables.ImageOff = "";
		variables.SortOrder = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="pageBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "PageID") AND stValues.PageID NEQ 0>
				<cfquery name="qGetPage" datasource="#trim(arguments.ds)#">
			  		SELECT PageID,SiteID,CategoryID,PageName,Title,Security,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,SortOrder,Active,InactiveCode,DateCreated,DateModified
					FROM page  
					WHERE PageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.PageID#" /> 
				</cfquery>		
				<cfif qGetPage.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetPage.SiteID;
					variables.CategoryID = qGetPage.CategoryID;
					variables.PageName = qGetPage.PageName;
					variables.Title = qGetPage.Title;
					variables.Security = qGetPage.Security;
					variables.ShowPageLink = qGetPage.ShowPageLink;
					variables.LinkName = qGetPage.LinkName;
					variables.LeftNavigation = qGetPage.LeftNavigation;
					variables.RightNavigation = qGetPage.RightNavigation;
					variables.Header = qGetPage.Header;
					variables.Footer = qGetPage.Footer;
					variables.ImageOn = qGetPage.ImageOn;
					variables.ImageOff = qGetPage.ImageOff;
					variables.SortOrder = qGetPage.SortOrder;
					variables.Active = qGetPage.Active;
					variables.InactiveCode = qGetPage.InactiveCode;
					variables.DateModified = qGetPage.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "PageID")><cfset variables.PageID = stValues.PageID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "CategoryID")><cfset variables.CategoryID = stValues.CategoryID /></cfif>
			<cfif StructKeyExists(stValues, "PageName")><cfset variables.PageName = stValues.PageName /></cfif>
			<cfif StructKeyExists(stValues, "Title")><cfset variables.Title = stValues.Title /></cfif>
			<cfif StructKeyExists(stValues, "Security")><cfset variables.Security = stValues.Security /></cfif>
			<cfif StructKeyExists(stValues, "ShowPageLink")><cfset variables.ShowPageLink = stValues.ShowPageLink /></cfif>
			<cfif StructKeyExists(stValues, "LinkName")><cfset variables.LinkName = stValues.LinkName /></cfif>
			<cfif StructKeyExists(stValues, "LeftNavigation")><cfset variables.LeftNavigation = stValues.LeftNavigation /></cfif>
			<cfif StructKeyExists(stValues, "RightNavigation")><cfset variables.RightNavigation = stValues.RightNavigation /></cfif>
			<cfif StructKeyExists(stValues, "Header")><cfset variables.Header = stValues.Header /></cfif>
			<cfif StructKeyExists(stValues, "Footer")><cfset variables.Footer = stValues.Footer /></cfif>
			<cfif StructKeyExists(stValues, "ImageOn")><cfset variables.ImageOn = stValues.ImageOn /></cfif>
			<cfif StructKeyExists(stValues, "ImageOff")><cfset variables.ImageOff = stValues.ImageOff /></cfif>
			<cfif StructKeyExists(stValues, "SortOrder")><cfset variables.SortOrder = stValues.SortOrder /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PageID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageID" acess="public" output="false" returntype="any">
		<cfreturn variables.PageID>
	</cffunction>
	
	<cffunction name="setPageID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PageID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PageID)) OR trim(arguments.PageID) EQ "">
			<cfset variables.PageID = arguments.PageID />
		<cfelse>
			<cfthrow message="PageID (#arguments.PageID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PageID") />		
		
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
	<!--- GET and SET methods for PageName.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageName" acess="public" output="false" returntype="any">
		<cfreturn variables.PageName>
	</cffunction>
	
	<cffunction name="setPageName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PageName" required="true" type="any" />
			
		<cfset variables.PageName = arguments.PageName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PageName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Title.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTitle" acess="public" output="false" returntype="any">
		<cfreturn variables.Title>
	</cffunction>
	
	<cffunction name="setTitle" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Title" required="true" type="any" />
			
		<cfset variables.Title = arguments.Title />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Title") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Security.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSecurity" acess="public" output="false" returntype="any">
		<cfreturn variables.Security>
	</cffunction>
	
	<cffunction name="setSecurity" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Security" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Security)) OR trim(arguments.Security) EQ "">
			<cfset variables.Security = arguments.Security />
		<cfelse>
			<cfthrow message="Security (#arguments.Security#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Security") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ShowPageLink.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getShowPageLink" acess="public" output="false" returntype="any">
		<cfreturn variables.ShowPageLink>
	</cffunction>
	
	<cffunction name="setShowPageLink" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ShowPageLink" required="true" type="any" />
			
		<cfset variables.ShowPageLink = arguments.ShowPageLink />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ShowPageLink") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LinkName.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLinkName" acess="public" output="false" returntype="any">
		<cfreturn variables.LinkName>
	</cffunction>
	
	<cffunction name="setLinkName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LinkName" required="true" type="any" />
			
		<cfset variables.LinkName = arguments.LinkName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LinkName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LeftNavigation.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLeftNavigation" acess="public" output="false" returntype="any">
		<cfreturn variables.LeftNavigation>
	</cffunction>
	
	<cffunction name="setLeftNavigation" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LeftNavigation" required="true" type="any" />
			
		<cfset variables.LeftNavigation = arguments.LeftNavigation />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LeftNavigation") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RightNavigation.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRightNavigation" acess="public" output="false" returntype="any">
		<cfreturn variables.RightNavigation>
	</cffunction>
	
	<cffunction name="setRightNavigation" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RightNavigation" required="true" type="any" />
			
		<cfset variables.RightNavigation = arguments.RightNavigation />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RightNavigation") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Header.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHeader" acess="public" output="false" returntype="any">
		<cfreturn variables.Header>
	</cffunction>
	
	<cffunction name="setHeader" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Header" required="true" type="any" />
			
		<cfset variables.Header = arguments.Header />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Header") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Footer.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFooter" acess="public" output="false" returntype="any">
		<cfreturn variables.Footer>
	</cffunction>
	
	<cffunction name="setFooter" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Footer" required="true" type="any" />
			
		<cfset variables.Footer = arguments.Footer />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Footer") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ImageOn.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getImageOn" acess="public" output="false" returntype="any">
		<cfreturn variables.ImageOn>
	</cffunction>
	
	<cffunction name="setImageOn" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ImageOn" required="true" type="any" />
			
		<cfset variables.ImageOn = arguments.ImageOn />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ImageOn") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ImageOff.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getImageOff" acess="public" output="false" returntype="any">
		<cfreturn variables.ImageOff>
	</cffunction>
	
	<cffunction name="setImageOff" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ImageOff" required="true" type="any" />
			
		<cfset variables.ImageOff = arguments.ImageOff />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ImageOff") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SortOrder.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSortOrder" acess="public" output="false" returntype="any">
		<cfreturn variables.SortOrder>
	</cffunction>
	
	<cffunction name="setSortOrder" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SortOrder" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SortOrder)) OR trim(arguments.SortOrder) EQ "">
			<cfset variables.SortOrder = arguments.SortOrder />
		<cfelse>
			<cfthrow message="SortOrder (#arguments.SortOrder#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SortOrder") />		
		
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



