<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
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
	<cfparam name="URL.definitionid" default="">
	<cfset definitionid = URL.definitionid>
	
	
		
<!------------------------------------------------------------------>
<!--- Get the definition for the word that was passed in and     --->
<!--- make sure you check the database first.                    --->
<!------------------------------------------------------------------>	
	<cfset tempDefinition = CreateObject("component","com.common.db.DefinitionIO")>		
	<cfset getDefinition = tempDefinition.getDefinitionQuery(recordID: trim(definitionid))>		
		
		
	<cfif getDefinition.RecordCount GTE 1>				
			
		<!------------------------------------------------------------------>
		<!--- Check too see if the definition has some kind of variable  --->
		<!--- that must be delayed evaluated.                            --->
		<!------------------------------------------------------------------>
		<cfset definition = #ReplaceNoCase(getDefinition.Definition, '@@', '##', 'ALL')#>		
				
				
		<!------------------------------------------------------------------>
		<!--- If the database shows a record then show this popue.       --->
		<!------------------------------------------------------------------>	
		<cfoutput>
			<table cellspacing="0" cellpadding="2" border="1" bordercolor="f1f1f1" width="490">
				<tr>
				    <td>								
						<table cellspacing="0" cellpadding="3" border="1" bordercolor="f1f1f1" width="100%">
							<tr>
							    <td>		
									<table cellspacing="0" cellpadding="2" border="0" width="100%">
										<tr>
										    <td>								
												<font face="#request.Site.getFont#" size="1" color="#request.Site.getFontColor()#">	
													<strong><font size="2">#getDefinition.Title#</font></strong>
												</font>	
											</td>										
										    <td align="right">								
												<a href="javascript:window.close();"><img src="images/closewindow_button.jpg" border=0></a>														
											</td>										
										</tr>	
										<tr>
										    <td colspan="2">								
												<font face="#request.Site.getFont#" size="1" color="#request.Site.getFontColor()#">												
													<ul>	
														<li>	
															#evaluate(de(definition))#
														</li>
													</ul>
												</font>	
											</td>
										</tr>																			
									</table>					
								</td>
							</tr>
						</table>	
					</td>
				</tr>
			</table>
		</cfoutput>
		
	<cfelse>
	
		<cfinvoke
			component="com.common.db.EmailAddressIO" 
			method="getEmailAddressQuery"
			returnVariable="EAQuery"
			fields="Email"
			EmailAddressID="#request.Site.getSupportEmailAddressID()#">
		
		<cfset errorMessage = "The following word was not found in the Definition table: #definitionid#.">
						
		<cf_gcGatewayLogger
			datasource="#trim(request.datasource)#" 
			code="115"
			logtext = "#trim(errorMessage)#">	
							
		<cf_gcSendEmail
			from="#trim(EAQuery.Email)#"
			to="#trim(EAQuery.Email)#"
			subject="Word definition for [#definitionid#] not found."
			message="#trim(errorMessage)#">
			
		<cfoutput>
			<table cellspacing="0" cellpadding="2" border="1" bordercolor="f1f1f1" width="490">
				<tr>
				    <td>								
						<table cellspacing="0" cellpadding="3" border="1" bordercolor="f1f1f1" width="100%">
							<tr>
							    <td>		
									<table cellspacing="0" cellpadding="2" border="0" width="100%">
										<tr>
										    <td>								
												<font face="#request.Site.getFont#" size="1" color="#request.Site.getFontColor()#">	
													The word "#definitionid#" you are trying to define was not found. An email has been sent to the site administrator.
												</font>	
											</td>
										</tr>
										<tr>
											<td>
												<br><a href="javascript:window.close();"><img src="images/closewindow_button.jpg" border=0></a>
											</td>
										</tr>
									</table>					
								</td>
							</tr>
						</table>	
					</td>
				</tr>
			</table>
		</cfoutput>	
		<cfexit method="EXITTEMPLATE">
		
	</cfif>	

<cfsetting showdebugoutput="No" enablecfoutputonly="no">	
