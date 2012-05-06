
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.fontFace" default="#request.Site.getFont()#">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="#request.Site.getFontSize()#">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="#request.Site.getFontColor()#">
	<cfset fontColor = attributes.fontColor>
	
	<cfparam name="attributes.allowNext" default="true">
	<cfset allowNext = attributes.allowNext>
	

				
<!-------------------------------------------------------------------------------------->
<!--- Save into a variable what the user will see and send to next page for email.   --->
<!-------------------------------------------------------------------------------------->
<cfsavecontent variable="session.receipt">	
	<cfoutput>			
			
			<table border="0" cellpadding="" cellspacing="0"><!--- align="center"--->					
				<tr>
					<td>
			
					<!------------------------------------------------------------------>
					<!--- Show an address on this page.                              --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company Information" tableWidth="100%">	
										
						<table border="0" cellpadding="1" cellspacing="0">															
							<tr>
								<td class="SiteLabel">
									Name:&nbsp;														
								</td>
								<td class="SiteRequiredLabel">		
									#form.clientName#											
								</td>
							</tr>
							<tr>
								<td class="SiteLabel">		
									DBA:&nbsp;											
								</td>
								<td class="SiteRequiredLabel">		
									#form.clientDBA#									
								</td>
							</tr>
															
							<tr>
								<td class="SiteLabel">		
									Main Phone ##:&nbsp;															
								</td>
								<td class="SiteRequiredLabel">		
									#request.formatPhoneUS(form.clientMainPhoneNumber)#&nbsp;&nbsp;<font size="1" color="000000">ext.</font> #form.clientMainPhoneNumberExtension#	
								</td>
							</tr>
							
							<tr>
								<td class="SiteLabel">		
									Provider&nbsp;ID:&nbsp;											
								</td>
								<td class="SiteRequiredLabel">		
									#form.medicareProviderID#									
								</td>
							</tr>
							
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>				
						</table>				
					
					</cf_gcBorderedTable>
				
				</td>
			</tr>
			
			<tr>
				<td>
								
					<!------------------------------------------------------------------>
					<!--- Show an address on this page.                              --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company Address" tableWidth="100%">	
												
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" standardlistitemID="#trim(form.AddressTypeID)#" active="1" returnvariable="getAddressType">
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" standardlistitemID="#trim(form.AddressStateID)#" listid="4" active="1" returnvariable="getState">
						
						<table border="0" cellpadding="1" cellspacing="0">		
							<tr>
								<td class="SiteLabel">			   
						   			Corporate&nbsp;Address:&nbsp;
								</td>
								<td valign="middle" class="SiteRequiredLabel">			   			
									#trim(form.AddressLine1)# #trim(form.AddressLine2)# #trim(form.AddressCity)#,&nbsp;#trim(getState.ItemNameDisplay)#&nbsp;#trim(form.AddressZipCode)#												
								</td>
							</tr>									
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>		
						</table>									
						
					</cf_gcBorderedTable>
				
				</td>
			</tr>
			
			<tr>
				<td>
			
					<!------------------------------------------------------------------>
					<!--- Show an Admin information on this page.                    --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Administrator Information" tableWidth="100%">	
						
						<!---start Admin information--->
						<table border="0" cellpadding="1" cellspacing="0">							
							<tr>
								<td class="SiteLabel">		
									Name:&nbsp;
								</td>
								<td class="SiteRequiredLabel">																						
									#form.AdministratorFName#&nbsp;																	
									#form.AdministratorMName#&nbsp;															
									#form.AdministratorLName#&nbsp;								
								</td>
							</tr>								
							<tr>
								<td class="SiteLabel">		
									Phone Number:&nbsp;
								</td>
								<td class="SiteRequiredLabel">		
									#request.formatPhoneUS(form.AdministratorPhoneNumber)#&nbsp;&nbsp;<font size="1" color="000000">ext.</font>&nbsp;#form.AdministratorPhoneNumberExtension#	
								</td>
							</tr>
							<tr>
								<td class="SiteLabel">		
									Email&nbsp;Address:&nbsp;
								</td>
								<td class="SiteRequiredLabel">
									#form.AdministratorEmailAddress#
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td valign="top"><font size="1" face="#trim(fontFace)#" color="000000">(username / password will be emailed)</font></td>
							</tr>									                
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
						</table>
							
					</cf_gcBorderedTable>
			
				</td>
			</tr>		
								
		</table>		
		
	</cfoutput>	
	
</cfsavecontent>

	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<table border="0" cellpadding="" cellspacing="0"><!--- align="center"--->		
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><font face="#trim(fontFace)#" size="3" color="990000"><strong>Please confirm all the submitted information.</strong><br><br></font></td>
			</tr>	
		</table>
		
		#session.receipt#
		
		<table border="0" cellpadding="" cellspacing="0">	
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center">			
					<form method="post" name="creatAccount" action="appCreateAccountProcess.cfm">						
						<input type="button" value="Previous Screen" onClick="history.go(-1)" class="SiteSubmitbox">&nbsp;&nbsp;
						<cfif allowNext EQ true><cf_gcSubmitButton value="Confirmed / Create Account"></cfif>	
						<cf_gcEmbedFields>  							
					</form>							
				</td>
			</tr>
		</table>		
	</cfoutput>
	
	