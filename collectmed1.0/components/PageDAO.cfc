 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageBean" />
		
		<cfset var qCreatePage = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localCategoryID = arguments.bean.getCategoryID() />
		<cfset var localPageName = arguments.bean.getPageName() />
		<cfset var localTitle = arguments.bean.getTitle() />
		<cfset var localSecurity = arguments.bean.getSecurity() />
		<cfset var localShowPageLink = arguments.bean.getShowPageLink() />
		<cfset var localLinkName = arguments.bean.getLinkName() />
		<cfset var localLeftNavigation = arguments.bean.getLeftNavigation() />
		<cfset var localRightNavigation = arguments.bean.getRightNavigation() />
		<cfset var localHeader = arguments.bean.getHeader() />
		<cfset var localFooter = arguments.bean.getFooter() />
		<cfset var localImageOn = arguments.bean.getImageOn() />
		<cfset var localImageOff = arguments.bean.getImageOff() />
		<cfset var localSortOrder = arguments.bean.getSortOrder() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePage" datasource="#trim(arguments.ds)#">
				INSERT INTO page (SiteID,CategoryID,PageName,Title,Security,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,SortOrder,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localCategoryID))>						
						<cfqueryparam value="#trim(localCategoryID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localPageName) NEQ "" AND trim(localPageName) NEQ "@@" AND trim(localPageName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPageName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTitle) NEQ "" AND trim(localTitle) NEQ "@@" AND trim(localTitle) NEQ "NULL">						
						<cfqueryparam value="#trim(localTitle)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localSecurity))>						
						<cfqueryparam value="#trim(localSecurity)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localShowPageLink) NEQ "" AND trim(localShowPageLink) NEQ "@@" AND trim(localShowPageLink) NEQ "NULL">						
						<cfqueryparam value="#trim(localShowPageLink)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLinkName) NEQ "" AND trim(localLinkName) NEQ "@@" AND trim(localLinkName) NEQ "NULL">						
						<cfqueryparam value="#trim(localLinkName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLeftNavigation) NEQ "" AND trim(localLeftNavigation) NEQ "@@" AND trim(localLeftNavigation) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftNavigation)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localRightNavigation) NEQ "" AND trim(localRightNavigation) NEQ "@@" AND trim(localRightNavigation) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightNavigation)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localHeader) NEQ "" AND trim(localHeader) NEQ "@@" AND trim(localHeader) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeader)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFooter) NEQ "" AND trim(localFooter) NEQ "@@" AND trim(localFooter) NEQ "NULL">						
						<cfqueryparam value="#trim(localFooter)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localImageOn) NEQ "" AND trim(localImageOn) NEQ "@@" AND trim(localImageOn) NEQ "NULL">						
						<cfqueryparam value="#trim(localImageOn)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localImageOff) NEQ "" AND trim(localImageOff) NEQ "@@" AND trim(localImageOff) NEQ "NULL">						
						<cfqueryparam value="#trim(localImageOff)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localSortOrder))>						
						<cfqueryparam value="#trim(localSortOrder)#" cfsqltype="CF_SQL_INTEGER" />							
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
				SELECT LAST_INSERT_ID() AS PageID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setPageID(qCreatePage.PageID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PageBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PageID" required="yes" type="numeric" />		
		<cfset var qGetPage = "" />		
		
		<cfset qGetPage = getPage(trim(arguments.ds), trim(PageID)) />
				
		<cfif qGetPage.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objPage = createObject("component", "PageBean").init(arguments.ds);
			objPage.setPageID(qGetPage.PageID);
			objPage.setSiteID(qGetPage.SiteID);
			objPage.setCategoryID(qGetPage.CategoryID);
			objPage.setPageName(qGetPage.PageName);
			objPage.setTitle(qGetPage.Title);
			objPage.setSecurity(qGetPage.Security);
			objPage.setShowPageLink(qGetPage.ShowPageLink);
			objPage.setLinkName(qGetPage.LinkName);
			objPage.setLeftNavigation(qGetPage.LeftNavigation);
			objPage.setRightNavigation(qGetPage.RightNavigation);
			objPage.setHeader(qGetPage.Header);
			objPage.setFooter(qGetPage.Footer);
			objPage.setImageOn(qGetPage.ImageOn);
			objPage.setImageOff(qGetPage.ImageOff);
			objPage.setSortOrder(qGetPage.SortOrder);
			objPage.setActive(qGetPage.Active);
			objPage.setInactiveCode(qGetPage.InactiveCode);
			objPage.setDateCreated(qGetPage.DateCreated);
			objPage.setDateModified(qGetPage.DateModified);				
			return objPage;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageBean" />
		<cfset var qUpdatePage = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localCategoryID = arguments.bean.getCategoryID() />
		<cfset var localPageName = arguments.bean.getPageName() />
		<cfset var localTitle = arguments.bean.getTitle() />
		<cfset var localSecurity = arguments.bean.getSecurity() />
		<cfset var localShowPageLink = arguments.bean.getShowPageLink() />
		<cfset var localLinkName = arguments.bean.getLinkName() />
		<cfset var localLeftNavigation = arguments.bean.getLeftNavigation() />
		<cfset var localRightNavigation = arguments.bean.getRightNavigation() />
		<cfset var localHeader = arguments.bean.getHeader() />
		<cfset var localFooter = arguments.bean.getFooter() />
		<cfset var localImageOn = arguments.bean.getImageOn() />
		<cfset var localImageOff = arguments.bean.getImageOff() />
		<cfset var localSortOrder = arguments.bean.getSortOrder() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePage" datasource="#trim(arguments.ds)#">
				UPDATE page  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					CategoryID =				
					<cfif IsNumeric(trim(localCategoryID))>						
						<cfqueryparam value="#trim(localCategoryID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PageName =	
					<cfif trim(localPageName) NEQ "" AND trim(localPageName) NEQ "@@" AND trim(localPageName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPageName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Title =	
					<cfif trim(localTitle) NEQ "" AND trim(localTitle) NEQ "@@" AND trim(localTitle) NEQ "NULL">						
						<cfqueryparam value="#trim(localTitle)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Security =				
					<cfif IsNumeric(trim(localSecurity))>						
						<cfqueryparam value="#trim(localSecurity)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ShowPageLink =	
					<cfif trim(localShowPageLink) NEQ "" AND trim(localShowPageLink) NEQ "@@" AND trim(localShowPageLink) NEQ "NULL">						
						<cfqueryparam value="#trim(localShowPageLink)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LinkName =	
					<cfif trim(localLinkName) NEQ "" AND trim(localLinkName) NEQ "@@" AND trim(localLinkName) NEQ "NULL">						
						<cfqueryparam value="#trim(localLinkName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LeftNavigation =	
					<cfif trim(localLeftNavigation) NEQ "" AND trim(localLeftNavigation) NEQ "@@" AND trim(localLeftNavigation) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftNavigation)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					RightNavigation =	
					<cfif trim(localRightNavigation) NEQ "" AND trim(localRightNavigation) NEQ "@@" AND trim(localRightNavigation) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightNavigation)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Header =	
					<cfif trim(localHeader) NEQ "" AND trim(localHeader) NEQ "@@" AND trim(localHeader) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeader)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Footer =	
					<cfif trim(localFooter) NEQ "" AND trim(localFooter) NEQ "@@" AND trim(localFooter) NEQ "NULL">						
						<cfqueryparam value="#trim(localFooter)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ImageOn =	
					<cfif trim(localImageOn) NEQ "" AND trim(localImageOn) NEQ "@@" AND trim(localImageOn) NEQ "NULL">						
						<cfqueryparam value="#trim(localImageOn)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ImageOff =	
					<cfif trim(localImageOff) NEQ "" AND trim(localImageOff) NEQ "@@" AND trim(localImageOff) NEQ "NULL">						
						<cfqueryparam value="#trim(localImageOff)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SortOrder =				
					<cfif IsNumeric(trim(localSortOrder))>						
						<cfqueryparam value="#trim(localSortOrder)#" cfsqltype="CF_SQL_INTEGER" />	
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
				WHERE PageID = <cfqueryparam value="#trim(arguments.bean.getPageID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageBean" />
		<cfset var qDeletePage = "">

		<cfquery name="qDeletePage" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM page
			WHERE PageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getPageID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPage" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PageID" required="yes" type="numeric" />		
		<cfset var qGetPage = "" />		
	
		<cfquery name="qGetPage" datasource="#trim(arguments.ds)#">
	  		SELECT PageID,SiteID,CategoryID,PageName,Title,Security,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,SortOrder,Active,InactiveCode,DateCreated,DateModified
			FROM page  
			WHERE PageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PageID)#" /> 
		</cfquery>
		
		<cfreturn qGetPage>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





