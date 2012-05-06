<!---- appSystemUserMessage.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.SystemUserMessageID" default="">
	<cfset SystemUserMessageID = attributes.SystemUserMessageID>
	
	<cfif IsDefined("form.SystemUserMessageID") AND form.SystemUserMessageID NEQ "">
		<cfset SystemUserMessageID = form.SystemUserMessageID>
	<cfelseif IsDefined("url.SystemUserMessageID") AND url.SystemUserMessageID NEQ "">
		<cfset SystemUserMessageID = url.SystemUserMessageID>	
	</cfif>
	
	<cfparam name="attributes.action" default="">
	<cfset action = attributes.action>
	
	<cfif IsDefined("form.action") AND form.action NEQ "">
		<cfset action = form.action>
	<cfelseif IsDefined("url.action") AND url.action NEQ "">
		<cfset action = url.action>	
	</cfif>
	
	<cfparam name="attributes.height" default="175">
	<cfset height = attributes.height>
	
	
	

<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>		
		<script language="JavaScript">										
			function submitSystemUserMessageDismiss(id){				
				document.SystemUserMessageDismiss.dismissSystemUserMessageID.value = id; 
				SystemUserMessageDismiss.submit();				
			};					
		</script>		
	</cfoutput>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the url contains a dismiss remindderID then go ahead and process.           --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.dismissSystemUserMessageID") AND IsNumeric(form.dismissSystemUserMessageID)>
		
		<cfquery name="getSystemUserMessageUsersID" datasource="#trim(request.datasource)#">
			SELECT UsersID 
			FROM SystemUserMessage 
			WHERE SystemUserMessageID = #trim(form.dismissSystemUserMessageID)#			 
		</cfquery>
		
		<cfif getSystemUserMessageUsersID.RecordCount EQ 1 AND getSystemUserMessageUsersID.UsersID EQ session.User.getUsersID()>
			
			<cfquery name="updateSystemUserMessage" datasource="#trim(request.datasource)#">
				UPDATE SystemUserMessage
				SET Dismissed = 1 
				WHERE SystemUserMessageID = #trim(form.dismissSystemUserMessageID)#			 
			</cfquery>
			
		</cfif>
		
		<cfoutput>
			<script language="JavaScript">
				var tempOpener = 'window.opener';		
				if (typeof(eval(tempOpener)) != "undefined"){						
					window.opener.location.href = window.opener.location.href;
				};		
				self.close();
			</script>
		</cfoutput>
	
	</cfif>	
		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- if the message ID is Available and the user wishes to view.                    --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsNumeric(SystemUserMessageID) AND action EQ "view">
		
		<cfset request.SystemUserMesssage = Createobject("component", "com.common.db.SystemUserMessageIO")>
		<cfset request.SystemUserMesssage.init(trim(SystemUserMessageID))>
		
		<cfset numtoAdd = len(request.SystemUserMesssage.getNote()) / 67>
		
		<cfif round(numtoAdd) EQ 0>
			<cfset height = height + 13>
		<cfelse>
			<cfset height = height + (ceiling(numtoAdd) * 13)>				
		</cfif>

		<cfoutput>			
			<div align="left">
				<table border="0" width="400" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="System Message - ID: #trim(SystemUserMessageID)#" tablealign="left">	
								<table border="0" cellpadding="2" cellspacing="2" width="370">
									<tr>
										<td class="siteLabel" align="right">
											Created: #DateFormat(request.SystemUserMesssage.getDateCreated(), 'mm/dd/yyyy')# #TimeFormat(request.SystemUserMesssage.getDateCreated(), 'h:mm:ss tt')#<!--- [#len(request.SystemUserMesssage.getNote())#] [#height#]	--->
										</td>
									</tr>
									<tr>
										<td class="siteLabel">
											#trim(request.SystemUserMesssage.getNote())#
										</td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td align="center" nowrap>			
											<cf_gcSubmitButton value="Dismiss&nbsp;Message" onclick="submitSystemUserMessageDismiss(#trim(SystemUserMessageID)#);">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close&nbsp;Window" onclick="self.close();">							
										</td>
									</tr>
								</table>									
							</cf_gcBorderedTable>
						</td>
					</tr>
				</table>	
			</div>				
		</cfoutput>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Form needed for dismissing.                                                    --->
		<!-------------------------------------------------------------------------------------->
		<span id="sp_SystemUserMessageDismiss" style="display:'none';">
			<cfoutput>
				<form name="SystemUserMessageDismiss" method="post">
					<input type="Hidden" name="dismissSystemUserMessageID" value="">			
					<cf_gcEmbedFields except="dismissSystemUserMessageID">
				</form>
			</cfoutput>	
		</span>
			
		
		<cfoutput>
			<script language="JavaScript">
				self.resizeTo(435,#trim(height)#);
			</script>
		</cfoutput>
	
	
	
	
	</cfif>	
	
		