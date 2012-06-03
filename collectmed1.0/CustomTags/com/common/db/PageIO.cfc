

<cfcomponent name="PageIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.PageID = "NULL";
			variables.instance.SiteID = "NULL";
			variables.instance.CategoryID = "NULL";
			variables.instance.PageName = "";
			variables.instance.Title = "";
			variables.instance.Security = "NULL";
			variables.instance.ShowPageLink = "";
			variables.instance.LinkName = "";
			variables.instance.LeftNavigation = "";
			variables.instance.RightNavigation = "";
			variables.instance.Header = "";
			variables.instance.Footer = "";
			variables.instance.ImageOn = "";
			variables.instance.ImageOff = "";
			variables.instance.SortOrder = "NULL";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 19)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PAGEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SITEID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CATEGORYID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PAGENAME", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TITLE", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECURITY", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SHOWPAGELINK", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LINKNAME", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LEFTNAVIGATION", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RIGHTNAVIGATION", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HEADER", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FOOTER", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "IMAGEON", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "IMAGEOFF", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SORTORDER", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 19)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PageID.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPageID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PageID>
	</cffunction>
	 
	<cffunction name="setPageID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PageID" required="Yes" type="String">
		
		<cfif PageID NEQ "NULL">	
			
			<cfif arguments.PageID EQ "@@" OR arguments.PageID EQ "">
				
				<cfset arguments.PageID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PageID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PageID</strong> (#PageID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PageID = arguments.PageID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SiteID.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSiteID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SiteID>
	</cffunction>
	 
	<cffunction name="setSiteID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SiteID" required="Yes" type="String">
		
		<cfif SiteID NEQ "NULL">	
			
			<cfif arguments.SiteID EQ "@@" OR arguments.SiteID EQ "">
				
				<cfset arguments.SiteID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(SiteID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SiteID</strong> (#SiteID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SiteID = arguments.SiteID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SiteID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CategoryID.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCategoryID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CategoryID>
	</cffunction>
	 
	<cffunction name="setCategoryID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CategoryID" required="Yes" type="String">
		
		<cfif CategoryID NEQ "NULL">	
			
			<cfif arguments.CategoryID EQ "@@" OR arguments.CategoryID EQ "">
				
				<cfset arguments.CategoryID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(CategoryID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CategoryID</strong> (#CategoryID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CategoryID = arguments.CategoryID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CategoryID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PageName.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPageName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PageName>
	</cffunction>
	 
	<cffunction name="setPageName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PageName" required="Yes" type="String">
		
		<cfif PageName NEQ "NULL">	
			
			<cfif arguments.PageName EQ "@@" OR arguments.PageName EQ "">
				
				<cfset arguments.PageName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PageName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PageName</strong> (#PageName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PageName) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PageName</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PageName = arguments.PageName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PageName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Title.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTitle" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Title>
	</cffunction>
	 
	<cffunction name="setTitle" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Title" required="Yes" type="String">
		
		<cfif Title NEQ "NULL">	
			
			<cfif arguments.Title EQ "@@" OR arguments.Title EQ "">
				
				<cfset arguments.Title = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Title)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Title</strong> (#Title#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Title) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Title</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Title = arguments.Title>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Title")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Security.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecurity" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Security>
	</cffunction>
	 
	<cffunction name="setSecurity" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Security" required="Yes" type="String">
		
		<cfif Security NEQ "NULL">	
			
			<cfif arguments.Security EQ "@@" OR arguments.Security EQ "">
				
				<cfset arguments.Security = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(Security)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Security</strong> (#Security#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Security = arguments.Security>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Security")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ShowPageLink.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getShowPageLink" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ShowPageLink>
	</cffunction>
	 
	<cffunction name="setShowPageLink" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ShowPageLink" required="Yes" type="String">
		
		<cfif ShowPageLink NEQ "NULL">	
			
			<cfif arguments.ShowPageLink EQ "@@" OR arguments.ShowPageLink EQ "">
				
				<cfset arguments.ShowPageLink = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(ShowPageLink)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ShowPageLink</strong> (#ShowPageLink#) is not of type <strong>char</strong>.">	
			<cfelseif len(ShowPageLink) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ShowPageLink</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ShowPageLink = arguments.ShowPageLink>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ShowPageLink")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LinkName.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLinkName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LinkName>
	</cffunction>
	 
	<cffunction name="setLinkName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LinkName" required="Yes" type="String">
		
		<cfif LinkName NEQ "NULL">	
			
			<cfif arguments.LinkName EQ "@@" OR arguments.LinkName EQ "">
				
				<cfset arguments.LinkName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LinkName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LinkName</strong> (#LinkName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LinkName) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LinkName</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LinkName = arguments.LinkName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LinkName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LeftNavigation.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLeftNavigation" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LeftNavigation>
	</cffunction>
	 
	<cffunction name="setLeftNavigation" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LeftNavigation" required="Yes" type="String">
		
		<cfif LeftNavigation NEQ "NULL">	
			
			<cfif arguments.LeftNavigation EQ "@@" OR arguments.LeftNavigation EQ "">
				
				<cfset arguments.LeftNavigation = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(LeftNavigation)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LeftNavigation</strong> (#LeftNavigation#) is not of type <strong>char</strong>.">	
			<cfelseif len(LeftNavigation) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LeftNavigation</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LeftNavigation = arguments.LeftNavigation>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LeftNavigation")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RightNavigation.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRightNavigation" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RightNavigation>
	</cffunction>
	 
	<cffunction name="setRightNavigation" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RightNavigation" required="Yes" type="String">
		
		<cfif RightNavigation NEQ "NULL">	
			
			<cfif arguments.RightNavigation EQ "@@" OR arguments.RightNavigation EQ "">
				
				<cfset arguments.RightNavigation = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(RightNavigation)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RightNavigation</strong> (#RightNavigation#) is not of type <strong>char</strong>.">	
			<cfelseif len(RightNavigation) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RightNavigation</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RightNavigation = arguments.RightNavigation>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RightNavigation")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Header.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHeader" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Header>
	</cffunction>
	 
	<cffunction name="setHeader" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Header" required="Yes" type="String">
		
		<cfif Header NEQ "NULL">	
			
			<cfif arguments.Header EQ "@@" OR arguments.Header EQ "">
				
				<cfset arguments.Header = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Header)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Header</strong> (#Header#) is not of type <strong>char</strong>.">	
			<cfelseif len(Header) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Header</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Header = arguments.Header>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Header")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Footer.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFooter" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Footer>
	</cffunction>
	 
	<cffunction name="setFooter" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Footer" required="Yes" type="String">
		
		<cfif Footer NEQ "NULL">	
			
			<cfif arguments.Footer EQ "@@" OR arguments.Footer EQ "">
				
				<cfset arguments.Footer = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Footer)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Footer</strong> (#Footer#) is not of type <strong>char</strong>.">	
			<cfelseif len(Footer) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Footer</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Footer = arguments.Footer>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Footer")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ImageOn.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getImageOn" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ImageOn>
	</cffunction>
	 
	<cffunction name="setImageOn" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ImageOn" required="Yes" type="String">
		
		<cfif ImageOn NEQ "NULL">	
			
			<cfif arguments.ImageOn EQ "@@" OR arguments.ImageOn EQ "">
				
				<cfset arguments.ImageOn = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ImageOn)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ImageOn</strong> (#ImageOn#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ImageOn) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ImageOn</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ImageOn = arguments.ImageOn>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ImageOn")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ImageOff.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getImageOff" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ImageOff>
	</cffunction>
	 
	<cffunction name="setImageOff" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ImageOff" required="Yes" type="String">
		
		<cfif ImageOff NEQ "NULL">	
			
			<cfif arguments.ImageOff EQ "@@" OR arguments.ImageOff EQ "">
				
				<cfset arguments.ImageOff = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ImageOff)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ImageOff</strong> (#ImageOff#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ImageOff) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ImageOff</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ImageOff = arguments.ImageOff>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ImageOff")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SortOrder.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSortOrder" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SortOrder>
	</cffunction>
	 
	<cffunction name="setSortOrder" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SortOrder" required="Yes" type="String">
		
		<cfif SortOrder NEQ "NULL">	
			
			<cfif arguments.SortOrder EQ "@@" OR arguments.SortOrder EQ "">
				
				<cfset arguments.SortOrder = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(SortOrder)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SortOrder</strong> (#SortOrder#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SortOrder = arguments.SortOrder>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SortOrder")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="CategoryID" required="No" type="String" default="">
		<cfargument name="PageName" required="No" type="String" default="">
		<cfargument name="Title" required="No" type="String" default="">
		<cfargument name="Security" required="No" type="String" default="">
		<cfargument name="ShowPageLink" required="No" type="String" default="">
		<cfargument name="LinkName" required="No" type="String" default="">
		<cfargument name="LeftNavigation" required="No" type="String" default="">
		<cfargument name="RightNavigation" required="No" type="String" default="">
		<cfargument name="Header" required="No" type="String" default="">
		<cfargument name="Footer" required="No" type="String" default="">
		<cfargument name="ImageOn" required="No" type="String" default="">
		<cfargument name="ImageOff" required="No" type="String" default="">
		<cfargument name="SortOrder" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.SiteID = arguments.SiteID>
		<cfset variables.instance.CategoryID = arguments.CategoryID>
		<cfset variables.instance.PageName = arguments.PageName>
		<cfset variables.instance.Title = arguments.Title>
		<cfset variables.instance.Security = arguments.Security>
		<cfset variables.instance.ShowPageLink = arguments.ShowPageLink>
		<cfset variables.instance.LinkName = arguments.LinkName>
		<cfset variables.instance.LeftNavigation = arguments.LeftNavigation>
		<cfset variables.instance.RightNavigation = arguments.RightNavigation>
		<cfset variables.instance.Header = arguments.Header>
		<cfset variables.instance.Footer = arguments.Footer>
		<cfset variables.instance.ImageOn = arguments.ImageOn>
		<cfset variables.instance.ImageOff = arguments.ImageOff>
		<cfset variables.instance.SortOrder = arguments.SortOrder>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitPage" access="public" returntype="PageIO" output="No">
		
		<cfargument name="PageID" required="yes" type="numeric">		
		<cfset var qGetPage = "">
		
		<cfset preInit(PageID)>
	
		<cfquery name="qGetPage" datasource="pa_master">
	  		SELECT PageID,SiteID,CategoryID,PageName,Title,Security,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,SortOrder,Active,InactiveCode,DateCreated,DateModified
			FROM Page  
			WHERE PageID = #trim(arguments.PageID)# 
		</cfquery>
		
		<cfif qGetPage.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetPage.PageID EQ "" OR qGetPage.PageID EQ "NULL") 
				variables.instance.PageID = "NULL"; 
			ELSE 
				variables.instance.PageID = qGetPage.PageID;
				
			IF(qGetPage.SiteID EQ "" OR qGetPage.SiteID EQ "NULL") 
				variables.instance.SiteID = "NULL"; 
			ELSE 
				variables.instance.SiteID = qGetPage.SiteID;
				
			IF(qGetPage.CategoryID EQ "" OR qGetPage.CategoryID EQ "NULL") 
				variables.instance.CategoryID = "NULL"; 
			ELSE 
				variables.instance.CategoryID = qGetPage.CategoryID;
							
				variables.instance.PageName = qGetPage.PageName;
							
				variables.instance.Title = qGetPage.Title;
				
			IF(qGetPage.Security EQ "" OR qGetPage.Security EQ "NULL") 
				variables.instance.Security = "NULL"; 
			ELSE 
				variables.instance.Security = qGetPage.Security;
							
				variables.instance.ShowPageLink = qGetPage.ShowPageLink;
							
				variables.instance.LinkName = qGetPage.LinkName;
							
				variables.instance.LeftNavigation = qGetPage.LeftNavigation;
							
				variables.instance.RightNavigation = qGetPage.RightNavigation;
							
				variables.instance.Header = qGetPage.Header;
							
				variables.instance.Footer = qGetPage.Footer;
							
				variables.instance.ImageOn = qGetPage.ImageOn;
							
				variables.instance.ImageOff = qGetPage.ImageOff;
				
			IF(qGetPage.SortOrder EQ "" OR qGetPage.SortOrder EQ "NULL") 
				variables.instance.SortOrder = "NULL"; 
			ELSE 
				variables.instance.SortOrder = qGetPage.SortOrder;
							
				variables.instance.Active = qGetPage.Active;
				
			IF(qGetPage.InactiveCode EQ "" OR qGetPage.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetPage.InactiveCode;
							
				variables.instance.DateCreated = qGetPage.DateCreated;
							
				variables.instance.DateModified = qGetPage.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(PageID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitPage = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.PageID) AND variables.instance.PageID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitPage" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitPage" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.PageID = qInsertCommitPage.PageID>
				
				<cfreturn qInsertCommitPage.PageID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "PageID,SiteID,CategoryID,PageName,Title,Security,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,SortOrder,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "PageName,Title,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE Page  SET #columnsToUpdate# WHERE PageID = #trim(variables.instance.PageID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "PageName,Title,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="SiteID,CategoryID,PageName,Title,Security,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,SortOrder,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO Page  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS PageID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getPageQuery">						
		<cfargument name="Fields" required="No" type="String" default="PageID,SiteID,CategoryID,PageName,Title,Security,ShowPageLink,LinkName,LeftNavigation,RightNavigation,Header,Footer,ImageOn,ImageOff,SortOrder,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="PageID" required="No" type="String" default="">
		<cfargument name="PageID_IN" required="No" type="String" default="">
		<cfargument name="PageID_LIKE" required="No" type="String" default="">
		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="SiteID_IN" required="No" type="String" default="">
		<cfargument name="SiteID_LIKE" required="No" type="String" default="">
		<cfargument name="CategoryID" required="No" type="String" default="">
		<cfargument name="CategoryID_IN" required="No" type="String" default="">
		<cfargument name="CategoryID_LIKE" required="No" type="String" default="">
		<cfargument name="PageName" required="No" type="String" default="">
		<cfargument name="PageName_IN" required="No" type="String" default="">
		<cfargument name="PageName_LIKE" required="No" type="String" default="">
		<cfargument name="Title" required="No" type="String" default="">
		<cfargument name="Title_IN" required="No" type="String" default="">
		<cfargument name="Title_LIKE" required="No" type="String" default="">
		<cfargument name="Security" required="No" type="String" default="">
		<cfargument name="Security_IN" required="No" type="String" default="">
		<cfargument name="Security_LIKE" required="No" type="String" default="">
		<cfargument name="ShowPageLink" required="No" type="String" default="">
		<cfargument name="ShowPageLink_IN" required="No" type="String" default="">
		<cfargument name="ShowPageLink_LIKE" required="No" type="String" default="">
		<cfargument name="LinkName" required="No" type="String" default="">
		<cfargument name="LinkName_IN" required="No" type="String" default="">
		<cfargument name="LinkName_LIKE" required="No" type="String" default="">
		<cfargument name="LeftNavigation" required="No" type="String" default="">
		<cfargument name="LeftNavigation_IN" required="No" type="String" default="">
		<cfargument name="LeftNavigation_LIKE" required="No" type="String" default="">
		<cfargument name="RightNavigation" required="No" type="String" default="">
		<cfargument name="RightNavigation_IN" required="No" type="String" default="">
		<cfargument name="RightNavigation_LIKE" required="No" type="String" default="">
		<cfargument name="Header" required="No" type="String" default="">
		<cfargument name="Header_IN" required="No" type="String" default="">
		<cfargument name="Header_LIKE" required="No" type="String" default="">
		<cfargument name="Footer" required="No" type="String" default="">
		<cfargument name="Footer_IN" required="No" type="String" default="">
		<cfargument name="Footer_LIKE" required="No" type="String" default="">
		<cfargument name="ImageOn" required="No" type="String" default="">
		<cfargument name="ImageOn_IN" required="No" type="String" default="">
		<cfargument name="ImageOn_LIKE" required="No" type="String" default="">
		<cfargument name="ImageOff" required="No" type="String" default="">
		<cfargument name="ImageOff_IN" required="No" type="String" default="">
		<cfargument name="ImageOff_LIKE" required="No" type="String" default="">
		<cfargument name="SortOrder" required="No" type="String" default="">
		<cfargument name="SortOrder_IN" required="No" type="String" default="">
		<cfargument name="SortOrder_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "PageID,PageID_IN,PageID_LIKE,SiteID,SiteID_IN,SiteID_LIKE,CategoryID,CategoryID_IN,CategoryID_LIKE,PageName,PageName_IN,PageName_LIKE,Title,Title_IN,Title_LIKE,Security,Security_IN,Security_LIKE,ShowPageLink,ShowPageLink_IN,ShowPageLink_LIKE,LinkName,LinkName_IN,LinkName_LIKE,LeftNavigation,LeftNavigation_IN,LeftNavigation_LIKE,RightNavigation,RightNavigation_IN,RightNavigation_LIKE,Header,Header_IN,Header_LIKE,Footer,Footer_IN,Footer_LIKE,ImageOn,ImageOn_IN,ImageOn_LIKE,ImageOff,ImageOff_IN,ImageOff_LIKE,SortOrder,SortOrder_IN,SortOrder_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Page"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getPageQuery" datasource="pa_master">
				SELECT #trim(Fields)#
				FROM page   
				WHERE 1=1
					<cfif PageID NEQ "" AND IsNumeric(PageID)>AND PageID = #PageID#</cfif>
					<cfif PageID_IN NEQ "">AND PageID IN(#trim(PageID_IN)#)</cfif>
					<cfif PageID_LIKE NEQ "">AND PageID LIKE '%#trim(PageID_LIKE)#%'</cfif>
					<cfif SiteID NEQ "" AND IsNumeric(SiteID)>AND SiteID = #SiteID#</cfif>
					<cfif SiteID_IN NEQ "">AND SiteID IN(#trim(SiteID_IN)#)</cfif>
					<cfif SiteID_LIKE NEQ "">AND SiteID LIKE '%#trim(SiteID_LIKE)#%'</cfif>
					<cfif CategoryID NEQ "" AND IsNumeric(CategoryID)>AND CategoryID = #CategoryID#</cfif>
					<cfif CategoryID_IN NEQ "">AND CategoryID IN(#trim(CategoryID_IN)#)</cfif>
					<cfif CategoryID_LIKE NEQ "">AND CategoryID LIKE '%#trim(CategoryID_LIKE)#%'</cfif>
					<cfif PageName NEQ "">AND PageName = '#PageName#'</cfif>
					<cfif PageName_IN NEQ "">AND PageName IN(#trim(PageName_IN)#)</cfif>
					<cfif PageName_LIKE NEQ "">AND PageName LIKE '%#trim(PageName_LIKE)#%'</cfif>
					<cfif Title NEQ "">AND Title = '#Title#'</cfif>
					<cfif Title_IN NEQ "">AND Title IN(#trim(Title_IN)#)</cfif>
					<cfif Title_LIKE NEQ "">AND Title LIKE '%#trim(Title_LIKE)#%'</cfif>
					<cfif Security NEQ "" AND IsNumeric(Security)>AND Security = #Security#</cfif>
					<cfif Security_IN NEQ "">AND Security IN(#trim(Security_IN)#)</cfif>
					<cfif Security_LIKE NEQ "">AND Security LIKE '%#trim(Security_LIKE)#%'</cfif>
					<cfif ShowPageLink NEQ "">AND ShowPageLink = '#ShowPageLink#'</cfif>
					<cfif ShowPageLink_IN NEQ "">AND ShowPageLink IN(#trim(ShowPageLink_IN)#)</cfif>
					<cfif ShowPageLink_LIKE NEQ "">AND ShowPageLink LIKE '%#trim(ShowPageLink_LIKE)#%'</cfif>
					<cfif LinkName NEQ "">AND LinkName = '#LinkName#'</cfif>
					<cfif LinkName_IN NEQ "">AND LinkName IN(#trim(LinkName_IN)#)</cfif>
					<cfif LinkName_LIKE NEQ "">AND LinkName LIKE '%#trim(LinkName_LIKE)#%'</cfif>
					<cfif LeftNavigation NEQ "">AND LeftNavigation = '#LeftNavigation#'</cfif>
					<cfif LeftNavigation_IN NEQ "">AND LeftNavigation IN(#trim(LeftNavigation_IN)#)</cfif>
					<cfif LeftNavigation_LIKE NEQ "">AND LeftNavigation LIKE '%#trim(LeftNavigation_LIKE)#%'</cfif>
					<cfif RightNavigation NEQ "">AND RightNavigation = '#RightNavigation#'</cfif>
					<cfif RightNavigation_IN NEQ "">AND RightNavigation IN(#trim(RightNavigation_IN)#)</cfif>
					<cfif RightNavigation_LIKE NEQ "">AND RightNavigation LIKE '%#trim(RightNavigation_LIKE)#%'</cfif>
					<cfif Header NEQ "">AND Header = '#Header#'</cfif>
					<cfif Header_IN NEQ "">AND Header IN(#trim(Header_IN)#)</cfif>
					<cfif Header_LIKE NEQ "">AND Header LIKE '%#trim(Header_LIKE)#%'</cfif>
					<cfif Footer NEQ "">AND Footer = '#Footer#'</cfif>
					<cfif Footer_IN NEQ "">AND Footer IN(#trim(Footer_IN)#)</cfif>
					<cfif Footer_LIKE NEQ "">AND Footer LIKE '%#trim(Footer_LIKE)#%'</cfif>
					<cfif ImageOn NEQ "">AND ImageOn = '#ImageOn#'</cfif>
					<cfif ImageOn_IN NEQ "">AND ImageOn IN(#trim(ImageOn_IN)#)</cfif>
					<cfif ImageOn_LIKE NEQ "">AND ImageOn LIKE '%#trim(ImageOn_LIKE)#%'</cfif>
					<cfif ImageOff NEQ "">AND ImageOff = '#ImageOff#'</cfif>
					<cfif ImageOff_IN NEQ "">AND ImageOff IN(#trim(ImageOff_IN)#)</cfif>
					<cfif ImageOff_LIKE NEQ "">AND ImageOff LIKE '%#trim(ImageOff_LIKE)#%'</cfif>
					<cfif SortOrder NEQ "" AND IsNumeric(SortOrder)>AND SortOrder = #SortOrder#</cfif>
					<cfif SortOrder_IN NEQ "">AND SortOrder IN(#trim(SortOrder_IN)#)</cfif>
					<cfif SortOrder_LIKE NEQ "">AND SortOrder LIKE '%#trim(SortOrder_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getPageQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>	
		
		<!------------------------------------------------------------------>
		<!--- This function will search for the Id of the Page based     --->
		<!--- on the Page Name.                                          --->
		<!------------------------------------------------------------------>
		<cffunction name="getPageIDByName" returntype="string" hint="This function will search for the Id of the Page based on the Page Name.">		
			
			<cfargument name="pageName" required="Yes" type="String">
			
			<cfset getPageID = getPageQuery(pagename: '#trim(pageName)#', active: 1, Fields: 'PageID')>		
				
			<cfif getPageID.RecordCount NEQ 1>
				<cfreturn "No Page Exists">
			<cfelse>
				<cfreturn getPageID.PageID>
			</cfif>	
		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>


