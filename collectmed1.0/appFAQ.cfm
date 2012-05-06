<!------------------------------------------------------------------>
<!--- NAME: appFAQ.cfm                                           --->
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




<!------------------------------------------------------------------>
<!--- Case-insensitive function for removing duplicate entries   --->
<!--- in a list.                                                 --->
<!------------------------------------------------------------------>
	<cfscript>	
		function ListDeleteDuplicatesNoCase(list){
		  var i = 1;
		  var delimiter = ',';
		  var returnValue = '';
		  if(ArrayLen(arguments) GTE 2)
		    delimiter = arguments[2];
		  list = ListToArray(list, delimiter);
		  for(i = 1; i LTE ArrayLen(list); i = i + 1)
		    if(NOT ListFindNoCase(returnValue, list[i], delimiter))
		      returnValue = ListAppend(returnValue, list[i], delimiter);
		  return returnValue;
		}
	</cfscript>




<!------------------------------------------------------------------>
<!--- Get all the available faqs in the database.                --->
<!------------------------------------------------------------------>

	<cf_ewFAQsGet
		queryname="allFaqs">

	<cfset FAQSectionIDs = ListDeleteDuplicatesNoCase(ValueList(allFaqs.FAQSectionID))>


	
	
<!------------------------------------------------------------------>
<!--- Start the display of the page.                             --->
<!------------------------------------------------------------------>
	
	<cfoutput>
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
			<tr>
			    <td>
					<br><font face="Arial Black" size="3">Frequently Asked Questions</font>
				</td>
			</tr>
			<tr>
			    <td valign="top">
					
					<table cellspacing="0" cellpadding="0" border="0" width="100%">					
						<tr>
							<td>
								<img src="images\transparent.gif" width="20" height="50" border="0" alt="">
							</td>
							<td>								
							</cfoutput>
							
							<cfoutput query="allFaqs" group="FAQSectionID">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td bgcolor="c0cddc">		
											<font face="#request.SiteVariable.SiteFont#" size="2" color="#request.SiteVariable.SiteFontColor#">
												<b>#SectionName#</b>						
											</font>					
										</td>
									</tr>
									<tr><td><img src="images/transparent.gif" width="2" height="8" border="0"></td></tr>
									<cfoutput>	
										<tr>
											<td>
												<font face="#request.SiteVariable.SiteFont#" size="2" color="#request.SiteVariable.SiteFontColor#">
													<div class="site-font">
														&nbsp;<a href="###FAQID#">#FAQQuestion#</a><br>				
													</div>	
												</font>
											</td>
										</tr>
									</cfoutput><br>	
								</table>								
							</cfoutput>					
								
							<cfoutput query="allFaqs" group="FAQSectionID">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">			
									<cfoutput>	
										<tr>
											<td>
												<font face="#request.SiteVariable.SiteFont#" size="2" color="#request.SiteVariable.SiteFontColor#">
													<div class="site-font">
														<ul>
															<li>
																<strong><a name="#FAQID#">#FAQQuestion#</a></strong>
																	<ul>
																		<li>#evaluate(de(FAQAnswer))#</li>																		
																	</ul>
															</li>															
														</ul>													
													</div>				
												</font>
											</td>
										</tr>
									</cfoutput>
								</table>		
							</cfoutput>			
									
							<cfoutput>								
							</td>
						</tr>
					</table>				
					
				</td>			
			</tr>
		</table><br><br>
	</cfoutput>
	
	

	