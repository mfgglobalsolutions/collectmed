<!-------------------------------------------------------------------------------------->
<!--- NOTE: PLACE ALL TAG INFO YOU WANT DISPLAYED BETWEEN THE DOUBLE @@ SYMBOLS.     --->
<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@NAME@@                                                                       --->
<!---    appAdminEditSitePage.cfm                                                    --->
<!--- @@NAME@@                                                                       --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   --->      
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@EXAMPLECALL@@                                                                --->
<!---   &lt;cf_&gt;                                                                  --->
<!--- @@EXAMPLECALL@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@REQUIREDPARAMETERS@@                                                         --->
<!---                                                                                --->  
<!--- @@REQUIREDPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OPTIONALPARAMETERS@@                                                         --->
<!---                                                                                --->  
<!--- @@OPTIONALPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@RETURNEDPARAMETERS@@                                                         --->
<!---                                                                                --->  
<!--- @@RETURNEDPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->      
<!-------------------------------------------------------------------------------------->  



<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>
	<cfparam name="Submitted" default="no">
	
	<cfparam name="attributes.pageID" default="">
	<cfset pageID = attributes.pageID>
	
	<cfif IsDefined("url.pageID") AND IsNumeric(url.pageID)>
		<cfset pageID = url.pageID>
	</cfif>

	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="pageID"
		fieldnames="Page ID"
		datatypes="numeric">	




<cfif Submitted AND Isdefined("PageID") AND IsNumeric(PageID)>
		
		<!------------------------------------------------------------------>
		<!--- Gather the information on this specific page.              --->
		<!------------------------------------------------------------------>		
		<cfset request.thisPageInfo = CreateObject("component","com.common.db.PageIO")>	
		<cfset request.thisPageInfo.Init(trim(PageID))>	
			
								
		<!------------------------------------------------------------------>
		<!--- Get all the Roles available for this site.                 --->
		<!------------------------------------------------------------------>			
			<cfset request.Role = CreateObject("component","com.common.Role")>	
			<cfset getRoles = request.Role.getRoles(clientID: trim(session.clientID))>
			
				
		<!------------------------------------------------------------------>
		<!--- Get the groups that this page is associated with.          --->
		<!------------------------------------------------------------------>					
			<cfquery name="getPageRoles" datasource="pa_master">
				SELECT RoleID
				FROM PageRole
				WHERE PageID=#pageID# AND SiteID=#request.Site.getSiteID()#
			</cfquery>	
			
			<cfset PageRoleIDs = valuelist(getPageRoles.RoleID)>
	
	
		<!------------------------------------------------------------------>
		<!--- Get the Categories that pages can belong to.               --->
		<!------------------------------------------------------------------> 
			<cfset request.Categories = CreateObject("component","com.common.db.CategoryIO")>	
			<cfset getCategories = request.Categories.getCategoryQuery(siteID: trim(request.Site.getSiteID()))>
					
		
		<!------------------------------------------------------------------>
		<!--- Set the header for this page.                              --->
		<!------------------------------------------------------------------>		
			&nbsp;<br>
			<cf_gcBorderedTable
				title="Edit Site Page - #request.thisPageInfo.getPageName()#" 
				subtitle="Edit a page on this site. Make sure there are no spaces in the name of page, and the page name ends with .cfm or .html" 
				tablealign="center"
				tablewidth="95%">		
					
		
		 
		<!------------------------------------------------------------------>
		<!--- Output the form that the admin will use to                 --->
		<!--- create the page.                                           --->
		<!------------------------------------------------------------------>
		<cfoutput>
			<form action="appAdminEditSitePageSave.cfm" method="post">
				<table border="0" cellpadding="2" cellspacing="2" width="100%">
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Page Name:								
							</font>		
						</td>
						<td>		
							<input type="Text" class="SiteTextbox" name="Pagename" size="35" maxlength="79" value="#request.thisPageInfo.getPageName()#">		
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Title:								
							</font>		
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="Title" size="20" maxlength="79" value="#request.thisPageInfo.getTitle()#">
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Category:								
							</font>		
						</td>
						<td>
							<select class="SiteSelectbox" name="CategoryID">
								<cfloop query="getCategories">									
									<cfif request.thisPageInfo.getCategoryID() EQ CategoryID>
										<option value="#CategoryID#" selected> #Categoryname#
									<cfelse>
										<option value="#CategoryID#"> #Categoryname#
									</cfif>									
								</cfloop>
							</select>	
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Image On:								
							</font>		
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="ImageOn" size="20" maxlength="80" value="#request.thisPageInfo.getImageOn()#"><font face="#request.Site.getFont#" size="1" color="navy"> (i.e. SearchOn.gif)</font>
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Image Off:								
							</font>		
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="ImageOff" size="20" maxlength="80" value="#request.thisPageInfo.getImageOff()#"> <font face="#request.Site.getFont#" size="1" color="navy"> (i.e. SearchOff.gif)</font>
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Link Name:								
							</font>		
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="LinkName" size="20" maxlength="80" value="#request.thisPageInfo.getLinkname()#">
						</td>
					</tr>					
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Secure:								
							</font>		
						</td>
						<td>
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
								<input type="Radio" name="Security" value="Y" <cfif request.thisPageInfo.getSecurity() EQ 1>checked</cfif>> Yes&nbsp;&nbsp; <input type="Radio" name="Security" value="N" <cfif request.thisPageInfo.getSecurity() EQ 0>checked</cfif>> No 
							</font>		
						</td>
					</tr>	
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Active:								
							</font>		
						</td>
						<td>
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
								<input type="Radio" name="Active" value="1" <cfif request.thisPageInfo.getActive() EQ 1>checked</cfif>> Yes&nbsp;&nbsp; <input type="Radio" name="Active" value="0" <cfif request.thisPageInfo.getActive() EQ 0>checked</cfif>> No 
							</font>		
						</td>
					</tr>					
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Show Page Link:								
							</font>		
						</td>
						<td>
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
								<input type="Radio" name="ShowPageLink" value="Y" <cfif trim(request.thisPageInfo.getShowpagelink()) EQ "Y">checked</cfif>> Yes&nbsp;&nbsp; <input type="Radio" name="ShowPageLink" value="N" <cfif trim(request.thisPageInfo.getShowpagelink()) EQ "N">checked</cfif>> No 
							</font>		
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Left Navigation:								
							</font>		
						</td>
						<td>
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
								<input type="Radio" name="LeftNavigation" value="Y" <cfif trim(request.thisPageInfo.getLeftnavigation()) EQ "Y">checked</cfif>> Yes&nbsp;&nbsp; <input type="Radio" name="LeftNavigation" value="N" <cfif trim(request.thisPageInfo.getLeftnavigation()) EQ "N">checked</cfif>> No 
							</font>		
						</td>
					</tr>	
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Right Navigation: 							
							</font>		
						</td>
						<td>
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
								<input type="Radio" name="RightNavigation" value="Y" <cfif trim(request.thisPageInfo.getRightnavigation()) EQ "Y">checked</cfif>>  Yes&nbsp;&nbsp; <input type="Radio" name="RightNavigation" value="N" <cfif trim(request.thisPageInfo.getRightnavigation()) EQ "N">checked</cfif>> No 
							</font>		
						</td>
					</tr>	
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Header:								
							</font>		
						</td>
						<td>
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
								<input type="Radio" name="Header" value="Y" <cfif trim(request.thisPageInfo.getHeader()) EQ "Y">checked</cfif>> Yes&nbsp;&nbsp; <input type="Radio" name="Header" value="N" <cfif trim(request.thisPageInfo.getHeader()) EQ "N">checked</cfif>> No 
							</font>		
						</td>
					</tr>	
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Footer:								
							</font>		
						</td>
						<td>
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
								<input type="Radio" name="Footer" value="Y" <cfif request.thisPageInfo.getFooter() EQ "Y">checked</cfif>> Yes&nbsp;&nbsp; <input type="Radio" name="Footer" value="N" <cfif request.thisPageInfo.getFooter() EQ "N">checked</cfif>> No 
							</font>							
						</td>
					</tr>																						
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Groups to <br>Associate:								
							</font>		
						</td>
						<td>
							<cfloop query="getRoles">								
								<cfif ListFind(PageRoleIDs, RoleID) GT 0>
									<input type="Checkbox" name="GroupsToAssociate" value="#RoleID#" checked> 
								<cfelse>
									<input type="Checkbox" name="GroupsToAssociate" value="#RoleID#"> 	
								</cfif> 								
								<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
									#RoleName#<br>								
								</font>	
							</cfloop>
						</td>
					</tr>		
					<tr>
						<td align="center" colspan="2">	<br><br>	
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								<cf_gcSubmitButton value="Save">
								<input type="Hidden" name="PageID" value="#pageID#">
								<input type="hidden" name="Submitted" value="yes">									
							</font>		
						</td>
					</tr>					
				</table>
			</form>
		</cfoutput>		
	
		</cf_gcBorderedTable>


<cfelse>
	
	
	<!--- Query for all the pages in the site you are looking for --->
	<cf_gcPagesGet 
		queryname="getPages" 
		SiteID="#request.SiteID#"
		orderby="PageName">	
		
	<br><br>
	<cf_gcBorderedTable tablealign="center" 
		title="Manage Site Pages" 
		subtitle="<li>Edit - Change the properties of the page.</li><li>Delete - delete the page from the site but not the directory.</li>">
			
		<cfoutput>
			<table cellpadding="2" cellspacing="2">
					
					<!------------------------------------------------------------------>
					<!--- If a page has been deleted the delete tag will relocate    --->
					<!--- back here with the url variable to display this message.   --->
					<!------------------------------------------------------------------>
					<cfif IsDefined("URL.Delete") AND URL.Delete EQ "Successful">
						<tr>
							<td colspan="4">								
								<p><strong>You have succesfully deleted the site page.</strong><p>							
							</td>
						</tr>
					</cfif>
										
					<tr>						   
					    <td><font face="Arial" size="1">Page Name</font></td>
						<td><font face="Arial" size="1">Title</font></td>
					    <td align="center"><font face="Arial" size="1">Active</font></td>										
					    <td align="center" nowrap><font face="Arial" size="1">Action To take</font></td>				   
					</tr>	
				<cfloop query="getPages">						
					<tr bgcolor="#IIF(getPages.CurrentRow MOD 2, DE("F4F2F2"), DE("ffffff"))#">						   
					    <td><font face="Arial" size="1">#PageName#</font></td>
						<td><font face="Arial" size="1">#Title#</font></td>
					    <td align="center"><font face="Arial" size="1">#Active#</font></td>										
					    <td align="center" nowrap><font face="Arial" size="1"><a href="appAdminEditSitePage.cfm?PageID=#PageID#&Submitted=yes">Edit</a> <a href="javascript:VerifyDeleteAction('appAdminDeleteSitePage.cfm?PageID=#PageID#');">Delete</a></font></td>				   
					</tr>			
				</cfloop>			
			</table>	
		</cfoutput>

	</cf_gcBorderedTable>
	
</cfif>


