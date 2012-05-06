<!---<!------------------------------------------------------------------>
<!--- NAME: appSiteLeftNavigation.cfm                            --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->
<!------------------------------------------------------------------>

	<cfparam name="currentCategoryID" default="0">

	<cfif IsDefined("session.usersID")>
		<cfset AvailableCategorys = request.CategoryIDs>
	<cfelse>
		<cfset AvailableCategorys = 0>
	</cfif>



<!------------------------------------------------------------------>
<!--- Get all the pages that have the page links = to yes.       --->
<!------------------------------------------------------------------>
	<cftry>
		
		<cfset getUsersPageLinks = request.Page.getPageQuery(Fields: 'CategoryID,PageName,LinkName,ImageOn,Imageoff', ShowPageLink: 'Y', CategoryID: '#trim(AvailableCategorys)#', OrderBy: 'CategoryID,SortOrder')>		
		
		<cfcatch type="Any">
			<cfthrow type="LeftNav.Error" message="Could not retrieve the users page links.">
		</cfcatch>
		
	</cftry>	



<!------------------------------------------------------------------>
<!--- Get all the Categorys for the inventory on hand.          --->
<!------------------------------------------------------------------>
	<cfset tempCat = CreateObject("component","com.common.db.CategoryIO")>	
	<cfset getCategorys = tempCat.getCategoryQuery(SiteID: '#request.Site.getSiteID()#', Active: '1')>		
	<cfset CategoryIDS = valuelist(getCategorys.CategoryID)>	


<!------------------------------------------------------------------>
<!--- Get the Sub Categorys pertaining to the Categorys that   --->
<!--- will be looped through and grouped.                        --->
<!------------------------------------------------------------------>
	<cfset tempSubCategorys = CreateObject("component","com.common.db.SubCategoryIO")>	
	<cfset getSubCategorys = tempSubCategorys.getSubCategoryQuery(CategoryID_IN: '#trim(CategoryIDS)#', Active: '1')>
	
	
	
<!------------------------------------------------------------------>
<!--- Start the display of this page.                            --->
<!------------------------------------------------------------------>
	<cfoutput>
					
		<table border="0" bordercolor="#request.Site.getRightNavigationBorderColor()#" cellspacing="0" cellpadding="2" width="100%">
								
			<cfif NOT IsDefined("session.User")>
				<tr valign="top">
					<td valign="top">
						<cf_gcBorderedTableOutline label="Log In">
							<cf_appSiteLogin cancel="no">
						</cf_gcBorderedTableOutline>	
					</td>
				</tr>							
			</cfif>
						
			<!------------------------------------------------------------------>
			<!--- Add links ABOVE the database links. For future use.        --->
			<!------------------------------------------------------------------>						
			<!---
			<tr>
				<td>
					<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
						&nbsp;<a href="YourLinkPage.cfm">Link Display</a>
					</font>	
				</td>
			</tr>					
			--->
			
			
		<!---	
			<tr valign="top">
				<td valign="top">
					<table align="left" cellpadding="0" cellspacing="0" border="0" rules="all">
						<cfif getUsersPageLinks.RecordCount GTE 1>

							<tr align="left" valign="top">
								<td align="left" valign="top">
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
										<cfloop query="getUsersPageLinks">

											<cfif currentCategoryID NEQ "#trim(CategoryID)#">
												
												<cfinvoke
													component="com.common.db.Categor"<!---WTF---> 
													method="getCategoryQuery"
													returnVariable="getCategoryName"
													categoryid="#trim(CategoryID)#">		

												<cfif CategoryID NEQ 1>
													<p>
													<b>#getCategoryName.CategoryName#</b><br>
												</cfif>

											</cfif>

											<cfif CategoryID NEQ 1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#PageName#" class="leftnavsubcategory">#LinkName#</a><br></cfif>
											<cfset currentCategoryID = trim(CategoryID)>
										</cfloop>
									</font><br>
								</td>
							</tr>

						</cfif>

						<tr align="left" valign="top">
							<td align="left" valign="top">
								<img src="images/transparent.gif" width="1" height="10" border="0" alt=""><font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#"><cfloop query="getCategorys">&nbsp;<b>#trim(CategoryName)#</b><br>			

										<cfquery name="SubCategorys" dbtype="query">
											SELECT SubCategoryID, SubCategoryName
											FROM getSubCategorys
											WHERE CategoryID = #trim(CategoryID)#
										</cfquery>			

											<cfloop query="SubCategorys">
												&nbsp;&nbsp;&nbsp;&nbsp;<a href="appSubCategoryDisplayPage.cfm?SubCategoryID=#trim(SubCategoryID)#" class="leftnavsubcategory">#trim(SubCategoryName)#</a><br>
											</cfloop>
									</cfloop>
								</font><br>
							</td>
						</tr>

					</table>
				</td>
			</tr>
			
--->			
			<!------------------------------------------------------------------>
			<!--- Add links BELOW the database links. For future use.        --->
			<!------------------------------------------------------------------>						
			<!---
			<tr>
				<td>
					<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
						&nbsp;<a href="YourLinkPage.cfm">Link Display</a>
					</font>	
				</td>
			</tr>					
			--->
			
			
		</table>	
					
	</cfoutput>
	
	
--->