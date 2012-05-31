<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->
<!--- The purpose of this page is for the admin to create        --->
<!--- a page for the site that will be copied to all sites       --->
<!--- that exist this facilitates the application growing.       --->
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>




<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>
	<cfparam name="request.datasource" default="#request.datasource#">
	<cfset datasource = request.datasource>
	
	<cfparam name="Submitted" default="no">
	
	
		
<!------------------------------------------------------------------>
<!--- Get all the Roles available for this site.                 --->
<!------------------------------------------------------------------>		
	<cfset request.Role = CreateObject("component","com.common.Role")>	
	<cfset getRoles = request.Role.getRoles(clientID: trim(session.clientID))>

		
		
<!------------------------------------------------------------------>
<!--- The page starts here with the page not being submitted     --->
<!--- so it is the first screen that the user will see.          --->
<!------------------------------------------------------------------>	
	<cfif NOT IsDefined("form.Submitted")>	
				
				
		<!------------------------------------------------------------------>
		<!--- Get the Categories that pages can belong to.               --->
		<!------------------------------------------------------------------> 
			<cfset request.Categories = CreateObject("component","com.common.db.CategoryIO")>	
			<cfset getCategories = request.Categories.getCategoryQuery(siteID: trim(request.Site.getSiteID()))>
				
		
						
		<!------------------------------------------------------------------>
		<!--- Set the header for this page.                              --->
		<!------------------------------------------------------------------>		
			<cf_gcBorderedTable
				title="Create a Site Page" 
				subtitle="<ul><li>Create a page for this site. Make sure there are no spaces in the name of page, and the page name ends with .cfm or .html</li></ul>" 
				width="100%">		
					
		
		 
		<!------------------------------------------------------------------>
		<!--- Output the form that the admin will use to                 --->
		<!--- create the page.                                           --->
		<!------------------------------------------------------------------>
		<cfoutput>
			<form method="post">
				<table border="0" cellpadding="2" cellspacing="2" align="center">
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Page Name:
							</font>								
						</td>
						<td>		
							<input type="Text" class="SiteTextbox" name="NewPagename" size="40" maxlength="79">		
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
								Title:
							</font>									
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="Title" size="40" maxlength="79">
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Category:								
							</font>		
						</td>
						<td>
							<select class="SiteSelectbox" name="CategoryID"><cfloop query="getCategories"><option value="#CategoryID#"> #Categoryname#</cfloop></select>
							<!---<cf_gcModal gcModalLink="Category" gcModalVerbiage="You must place this page in a category you can later change the category.">--->
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Image On:								
							</font>		
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="ImageOn" size="40" maxlength="80"><font face="#request.Site.getFont#" size="1" color="navy"> (i.e. SearchOn.gif)</font>
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Image Off:								
							</font>		
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="ImageOff" size="40" maxlength="80"> <font face="#request.Site.getFont#" size="1" color="navy"> (i.e. SearchOff.gif)</font>
						</td>
					</tr>
					<tr>
						<td align="right">		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								Link Name:								
							</font>		
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="LinkName" size="40" maxlength="80">
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
								<input type="Radio" name="Security" value="1" checked> Yes&nbsp;&nbsp; <input type="Radio" name="Security" value="0"> No 
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
								<input type="Radio" name="Active" value="1" checked> Yes&nbsp;&nbsp; <input type="Radio" name="Active" value="0"> No 
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
								<input type="Radio" name="ShowPageLink" value="Y"> Yes&nbsp;&nbsp; <input type="Radio" name="ShowPageLink" value="N" checked> No 
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
								<input type="Radio" name="LeftNavigation" value="Y"> Yes&nbsp;&nbsp; <input type="Radio" name="LeftNavigation" value="N" checked> No 
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
								<input type="Radio" name="RightNavigation" value="Y"> Yes&nbsp;&nbsp; <input type="Radio" name="RightNavigation" value="N" checked> No 
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
								<input type="Radio" name="Header" value="Y" checked> Yes&nbsp;&nbsp; <input type="Radio" name="Header" value="N"> No 
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
								<input type="Radio" name="Footer" value="Y" checked> Yes&nbsp;&nbsp; <input type="Radio" name="Footer" value="N"> No 
							</font>							
						</td>
					</tr>					
					<tr>
						<td align="center" colspan="2">
							<table style="border-width: thin; border-style: solid;">
								<tr>
									<td>
										<table>
											<tr>
												<td align="right">		
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
														Roles to associate to:								
													</font>		
												</td>
												<td>
													<cfloop query="getRoles">
														<input type="Checkbox" name="RolesToAssociate" value="#RoleID#"> 
														<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
															#RoleName#<cfif Active NEQ 1><font face="#request.Site.getFont#" size="1" color="red"> (currently not active)</font></cfif><br>								
														</font>	
													</cfloop>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>							
					<tr>
						<td align="center" colspan="2">	<br><br>	
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								<cf_gcSubmitButton value="Save">
								<input type="hidden" name="Submitted" value="yes">									
							</font>		
						</td>
					</tr>														
				</table>
			</form>
		</cfoutput>		
	
		</cf_gcBorderedTable>
		
		
	<!------------------------------------------------------------------>
	<!--- This else will save the pages properties that the          --->
	<!---    admin just input.                                       --->
	<!------------------------------------------------------------------>
	<cfelse>
	
				
		<!------------------------------------------------------------------>
		<!--- You must supply atleast a pagename to the page             --->
		<!--- creation script.                                           --->
		<!------------------------------------------------------------------>	
		
			<cfif NOT IsDefined("form.newPageName") OR form.newPageName EQ "">

				<cf_gcBorderedTable title="Page Name cannot be left blank">				
					<cfoutput>
						<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
							The Page Name cannot be left blank. Press the back button and change your input.<p>
							<div align="center"><input type="button" value="Back" onclick="history.back()"></div>
						</font>			
					</cfoutput>
				</cf_gcBorderedTable>
				
				<cfexit method="EXITTEMPLATE">
				
			</cfif>	
		
		<!------------------------------------------------------------------>
		<!--- Check the page name provided, make sure that the name      --->
		<!--- has a valid page extension.                                --->
		<!------------------------------------------------------------------> 		
			<cfparam name="IsValidPageName" default="0">			
			<cfparam name="validExtensions" default="cfm,html">				
			<cfloop list="#validExtensions#" index="i">
				<cfif ListLast(form.newPageName,".") EQ i>
					<cfset IsValidPageName = 1>			
				</cfif>
			</cfloop>	
				
			<cfif IsValidPageName LT 1>
				
				<cf_gcBorderedTable title="Page Name Error">				
					<cfoutput>
						<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
							There was an error in the page name. Press the back button and check your input. The page name must end in ".cfm" or ".html"<p>
							<div align="center"><input type="button" value="Back" onclick="history.back()"></div>
						</font>			
					</cfoutput>
				</cf_gcBorderedTable>
				
				<cfexit method="EXITTEMPLATE">
				
			</cfif>
	
	
		<!------------------------------------------------------------------>
		<!--- Check to make sure that the page being created is not      --->
		<!--- in the database already so that it does not                --->
		<!--- overwrite anything.                                        --->
		<!------------------------------------------------------------------>
			<cfinvoke 
				component="PageIO"
				method="getPageIDByName"
				pagename="#trim(form.newPageName)#"
				returnvariable="pageExists">
			
			<cfif IsNumeric(pageExists)>
				
				<cf_gcBorderedTable title="Page Name Duplication Not Allowed">				
					<cfoutput>
						<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
							The page [#pageExists#] you are trying to create already exists in this site. You must choose another name for this page. Press the back button and change your input.<p>
							<div align="center"><input type="button" value="Back" onclick="history.back()"></div>
						</font>			
					</cfoutput>
				</cf_gcBorderedTable>
				
				<cfexit method="EXITTEMPLATE">
			</cfif>
			
						
			<cfif form.newPageName NEQ "" AND FileExists(ExpandPath("#form.newPageName#")) EQ "YES">

				<cf_gcBorderedTable title="Page Name Duplication In Directory Not Allowed">				
					<cfoutput>
						<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
							The page you are trying to create (#form.newPageName#) already exists in the directory. You must choose another name for this page. Press the back button and change your input.<p>
							<div align="center"><input type="button" value="Back" onclick="history.back()"></div>
						</font>			
					</cfoutput>
				</cf_gcBorderedTable>
				
				<cfexit method="EXITTEMPLATE">				
				
			<cfelse>
				
				<cffile 
					action="write" 
					file="#ExpandPath(".\#form.newPageName#")#" 
					output="<!---- #form.newPageName# ---->" 
					addnewline="no">	
					
			</cfif>			
					
		
		
		<!------------------------------------------------------------------>
		<!--- Place this whole set of code in a transaction to keep      --->
		<!--- your database integrity.                                   --->
		<!------------------------------------------------------------------>
		
			<!---<cftransaction>--->
		
				
			<!------------------------------------------------------------------>
			<!--- The user did not place a title for the page so just        --->
			<!--- make the page name the title.                              --->
			<!------------------------------------------------------------------>			
			<cfif NOT IsDefined("form.Title") OR form.Title EQ "">
				<cfset form.Title = form.newPageName>
			</cfif> 
				
			
			<!------------------------------------------------------------------>
			<!--- Insert the page properties into the pages table.           --->
			<!------------------------------------------------------------------>
			<cfset newPage = CreateObject("component","com.common.db.PageIO")>				
			<cfset newPage.setSiteID('#trim(request.Site.getSiteID())#')>
			<cfset newPage.setCategoryID('#trim(form.CategoryID)#')>
			<cfset newPage.setPageName('#trim(form.newPageName)#')>
			<cfset newPage.setTitle('#trim(form.Title)#')>
			<cfset newPage.setSecurity('#trim(form.Security)#')>
			<cfset newPage.setShowPageLink('#trim(form.ShowpageLink)#')>
			<cfset newPage.setLinkName('#trim(form.LinkName)#')>
			<cfset newPage.setLeftNavigation('#trim(form.LeftNavigation)#')>
			<cfset newPage.setRightNavigation('#trim(form.RightNavigation)#')>
			<cfset newPage.setHeader('#trim(form.Header)#')>
			<cfset newPage.setFooter('#trim(form.Footer)#')>
			<cfset newPage.setImageOn('#trim(form.ImageOn)#')>
			<cfset newPage.setImageOff('#trim(form.ImageOff)#')>
			<cfset newPage.setActive('#trim(form.Active)#')>
			
			<!------------------------------------------------------------------>
			<!--- Select the page ID of the page you just created so         --->
			<!--- you can add the ID to other tables that need it.           --->
			<!------------------------------------------------------------------>
			<cfset pageID = newPage.Commit()>			
										
			
			
			<!------------------------------------------------------------------>
			<!--- If the user chose to add groups to the page that can       --->
			<!--- access it then go ahead place those groups in the          --->
			<!--- page access table.                                         --->
			<!------------------------------------------------------------------>
				<cfif IsDefined("form.RolesToAssociate") AND ListLen(trim(form.RolesToAssociate)) GTE 1>
					<cfloop list="#trim(form.RolesToAssociate)#" index="i">
						<cfquery name="insertPageGroups" datasource="pa_master">
							INSERT INTO PageRole(PageID, RoleID, SiteID)
							VALUES(#trim(pageID)#, #trim(i)#, #trim(request.Site.getSiteID())#)
						</cfquery>
					</cfloop>
				</cfif>		
				
				
				
			<!------------------------------------------------------------------>
			<!--- Query the getGroups Query to find the names of the         --->
			<!--- GroupID that the page has been associated to.              --->
			<!------------------------------------------------------------------>		
				<cfif IsDefined("form.RolesToAssociate") AND ListLen(form.RolesToAssociate) GTE 1>
					<cfquery name="RoleNames" dbtype="query">
						SELECT RoleName 
						FROM getRoles 
						WHERE RoleID IN(#form.RolesToAssociate#) 
					</cfquery>
				</cfif>
						
				
				&nbsp;<br><br>		
				<cf_gcBorderedTable tablealign="center" title="Page Inserted Successfully" subtitle="Below are the details of the page that was just created look over your settings and click edit if necessary.">
					<cfoutput>
						<table align="center" border="1" cellpadding="4" cellspacing="0" width="95%" rules="all" bordercolor="000000">
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
										Page Name:								
									</font>		
								</td>
								<td>		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										#form.newPageName#
									</font>			
								</td>
							</tr>
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Title:								
									</font>		
								</td>
								<td>
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										<cfif form.Title NEQ "">#form.Title#<cfelse>&nbsp;</cfif>
									</font>	
								</td>
							</tr>
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Category:								
									</font>		
								</td>
								<td>
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
										#form.CategoryID#
									</font>	
								</td>
							</tr>
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Image On:								
									</font>		
								</td>
								<td>
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
										<cfif form.ImageOn NEQ "">#form.ImageOn#<cfelse>&nbsp;</cfif>
									</font>	
								</td>
							</tr>
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Image Off:								
									</font>		
								</td>
								<td>
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
										<cfif form.ImageOff NEQ "">#form.ImageOff#<cfelse>&nbsp;</cfif>
									</font>	
								</td>
							</tr>
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Link Name:								
									</font>		
								</td>
								<td>
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
										<cfif form.LinkName NEQ "">#form.LinkName#<cfelse>&nbsp;</cfif>
									</font>	
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
										#form.Security#
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
										#form.Active#
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
										#form.ShowPageLink#
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
										#form.LeftNavigation#
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
										#form.RightNavigation#
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
										#form.Header# 
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
										#form.footer# 
									</font>							
								</td>
							</tr>																						
							<cfif IsDefined("form.RolesToAssociate") AND ListLen(form.RolesToAssociate) GTE 1>
								<tr>
									<td align="right">		
										<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
											Groups to <br>Associate:								
										</font>		
									</td>
									<td>								
										<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
											<cfloop query="RoleNames">
												#RoleName#<br>
											</cfloop>
										</font>							
									</td>
								</tr>	
							</cfif>	
							<tr>
								<td colspan="2" align="center">
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">								
										<a href="appAdminEditSitePage.cfm?PageID=#PageID#&Submitted=yes">Edit Page Properties</a>
									</font>
								</td>
							</tr>								
						</table>
					</cfoutput>
					
				</cf_gcBorderedTable>
				
			
			<!---</cftransaction>--->
	
	</cfif>
	
	

