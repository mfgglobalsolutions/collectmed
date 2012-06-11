
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="PasswordForm">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.fontFace" default="#request.Site.getFont()#">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="#request.Site.getFontSize()#">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="#request.Site.getFontColor()#">
	<cfset fontColor = attributes.fontColor>	

	<cfparam name="attributes.UserName" default="">
	<cfset UserName = attributes.UserName>
	
	<cfparam name="attributes.FName" default="">
	<cfset FName = attributes.FName>
	
	<cfparam name="attributes.LName" default="">
	<cfset LName = attributes.LName>
	
	
	<cfif IsDefined("form.UserName") AND form.UserName NEQ "">
		<cfset UserName = form.UserName>
	<cfelseif IsDefined("url.UserName") AND url.UserName NEQ "">
		<cfset UserName = url.UserName>	
	</cfif>
	
	<cfif IsDefined("form.FName") AND form.FName NEQ "">
		<cfset FName = form.FName>
	<cfelseif IsDefined("url.FName") AND url.FName NEQ "">
		<cfset FName = url.FName>	
	</cfif>
	
	<cfif IsDefined("form.LName") AND form.LName NEQ "">
		<cfset LName = form.LName>
	<cfelseif IsDefined("url.LName") AND url.LName NEQ "">
		<cfset LName = url.LName>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="UserName,FName,LName"
		fieldnames="Username,First Name, Last Name">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->			
		
	<!-------------------------------------------------------------------------------------->
	<!--- Create an global Footer varaible converted.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cfset entry = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(UserName))) />
			
		
	<!------------------------------------------------------------------>
	<!--- Query database for matching username and password          --->
	<!------------------------------------------------------------------>		
	<cfinvoke component="com.common.User" method="getUsersQuery" siteid="#trim(request.Site.getSiteID())#" entry="#trim(entry)#" Active="1" returnvariable="accesscontrol">
	
	<cfif accesscontrol.RecordCount LT 1>
		
		<cfset message ="The username and/or name you provided cannot be found.">
		<cflocation addtoken="No" url="appRetrieveUp.cfm?msg=#URLEncodedFormat(message)#">
	
	<cfelseif accesscontrol.entryResponse EQ "">
		
		<cfset message ="The account is not eligible for password retrieval.<br>Please contact your administrator.  78">
		<cflocation addtoken="No" url="appRetrieveUp.cfm?msg=#URLEncodedFormat(message)#">
		
	</cfif>		
	
						
	<!-------------------------------------------------------------------------------------->
	<!--- Find out if the name sent in matches the database.                             --->
	<!-------------------------------------------------------------------------------------->
	<cfquery name="getEntityRecord" datasource="#trim(request.datasource)#">
		SELECT EntityID
		FROM entity
		WHERE EntityID = #trim(accesscontrol.EntityID)# AND FName = '#trim(FName)#' AND LName = '#trim(LName)#'
	</cfquery>		
	
	<cfif getEntityRecord.RecordCount LT 1>
		
		<cfset message ="The username and/or name you provided cannot be found.">
		<cflocation addtoken="No" url="appRetrieveUp.cfm?msg=#URLEncodedFormat(message)#">
	
	</cfif>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<script language="JavaScript">			
			function validateRetrievePassForm(){
				if (document.RetrievePass.EntryResponse.value == ""){
					alert("You must type in an answer.");
					document.RetrievePass.EntryResponse.focus();
					return false;
				};					
							
				return true;
			};			
		</script>		
	
		
		<form method="post" action="appRetrievePasswordEnd.cfm" name="RetrievePass" onsubmit="return validateRetrievePassForm();">
			<input type="Hidden" name="UsersID" value="#trim(accesscontrol.UsersID)#"> 											
			<br><br>
			<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" backgroundColor="c0cddc" title="Password&nbsp;Retrieval" tableAlign="center" tableWidth="40%">
						
				<table cellspacing="0" cellpadding="0" border="0" align="center" width="75%">					
					<tr>
						<td align="center" colspan="2">					
														
							<table>							
								<tr>
									<td align="right" class="SiteLabel">		
										Password&nbsp;Retrieval&nbsp;Question:														
									</td>
									<td>
										<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="1" active="1" returnvariable="getAllQIDTypes">
										<select class="SiteSelectBox" name="EntryQID">											
											<option value=""> 
											<cfloop query="getAllQIDTypes">
												<option value="#StandardListItemID#" <cfif StandardListItemID EQ accesscontrol.EntryQID>SELECTED</cfif>> #ItemNameDisplay#
											</cfloop>
										</select>											
									</td>
								</tr>
								<tr>
									<td align="right" class="SiteLabel">		
										Password&nbsp;Retrieval&nbsp;Answer:												
									</td>
									<td>
										<input type="Text" name="EntryResponse" size="30" class="SiteTextBox" value="">
									</td>
								</tr>
							</table>					
							
						</td>
					</tr>			
					<tr>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td align="center">			
							<cf_gcSubmitButton value="Submit">							
						</td>
					</tr>
				</table>	
			
			</cf_gcBorderedTable>		
	
	</form>
	
	</cfoutput>		
