<!--- tagSettingsIntakeDateModificationNotice.cfm --->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80">
 	<cfset wholeNumbers = attributes.wholeNumbers>
 
	<cfparam name="attributes.numberOfItemsPerRow" default="3">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>

		<table border="0" cellpadding="0" cellspacing="0">		
			<tr>
				<td>&nbsp;</td>
			</tr>			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Company Information Section                                                    --->
			<!-------------------------------------------------------------------------------------->				
			<tr>
				<td>
								
					<cf_gcBorderedTable titlesize="2" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Intake Notifications" tableWidth="100%">	
							
						<table style="border-width: thin; border-style: solid;" align="center">
							<tr>
								<td>
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										<strong>Check roles that will receive intake modification date notfications.</strong>
									</font>	
								</td>
							</tr>
							<tr>
								<td>
									<cf_tagRolesToAssociate checkRoleIDs="#trim(caller.checkroleids)#">
								</td>
							</tr>
							
							<tr>
								<td>&nbsp;</td>
							</tr>						
							
							<tr>
								<td>
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										<strong>Check users that will receive intake modification date notfications.</strong>
									</font>	
								</td>
							</tr>
							<tr>
								<td>
									
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										<table>								
											<tr>
											<cfset count = 1>
											<cfloop query="caller.getClientUsers">											
												<td class="SiteLabel" nowrap>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="Checkbox" value="#trim(UsersID)#" name="UserCheckbox_#trim(UsersID)#" <cfif ListFind(caller.checkuserIDs, UsersID) GT 0>checked</cfif>>&nbsp;#trim(FullName)#
												</td>
												<cfif ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>
			      								</tr>     
			     								</cfif>
												<cfset count = count + 1>											 
											</cfloop>
										</table>
									</font>		
									
								</td>
							</tr>
							
						</table>	
					
					</cf_gcBorderedTable>
			
				</td>
			</tr>			
			
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>	
			
		</table>	
		
	</cfoutput>
	
		