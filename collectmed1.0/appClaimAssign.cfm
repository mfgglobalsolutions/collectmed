<!---- appClaimAssign.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="assignClaim">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.claimID" default="">
	<cfset claimID = attributes.claimID>
	
	<cfif IsDefined("form.claimID") AND form.claimID NEQ "">
		<cfset claimID = form.claimID>
	<cfelseif IsDefined("url.claimID") AND url.claimID NEQ "">
		<cfset claimID = url.claimID>	
	</cfif>
	
	<cfparam name="attributes.reassign" default="">
	<cfset reassign = attributes.reassign>
	
	<cfif IsDefined("form.reassign") AND form.reassign NEQ "">
		<cfset reassign = form.reassign>
	<cfelseif IsDefined("url.reassign") AND url.reassign NEQ "">
		<cfset reassign = url.reassign>	
	</cfif>
	
	<cfparam name="attributes.assignToUserID" default="">
	<cfset assignToUserID = attributes.assignToUserID>
	
	<cfif IsDefined("form.assignToUserID") AND form.assignToUserID NEQ "">
		<cfset assignToUserID = form.assignToUserID>
	<cfelseif IsDefined("url.assignToUserID") AND url.assignToUserID NEQ "">
		<cfset assignToUserID = url.assignToUserID>	
	</cfif>	
	
	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>
	
	<cfif IsDefined("form.note") AND form.note NEQ "">
		<cfset note = form.note>
	<cfelseif IsDefined("url.note") AND url.note NEQ "">
		<cfset note = url.note>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="claimID"
		fieldnames="Claim ID"
		datatypes="numeric">	
		
		

<!-------------------------------------------------------------------------------------->
<!--- Make sure that the userID is sent in.                                          --->
<!-------------------------------------------------------------------------------------->	
	<cfif isDefined("form.submitted")>
				
		<cf_gcVerifyFields
			fields="assignToUserID"
			fieldnames="Assign to User ID"
			datatypes="numeric">		
	
	</cfif>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Make sure that the Note is sent in.                                            --->
<!-------------------------------------------------------------------------------------->	
	<cfif isDefined("form.submitted") AND reassign EQ 1>
				
		<cf_gcVerifyFields
			fields="note"
			fieldnames="Note">		
	
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- get the assigned user.                                                         --->
<!-------------------------------------------------------------------------------------->
	<cfif reassign EQ 1 AND IsDefined("AssignedToUserID") AND IsNumeric(AssignedToUserID)>
											
		<cfset request.claimObject = CreateObject("component","com.common.Claim")>
		<cfset request.claimObject.init(claimID: trim(claimID))>	
		<cfset AssignedToUserID = request.claimObject.getAssignedToUserID()>		
				
		<cfset request.AssignedUser = CreateObject("component","com.common.User")>
		<cfset request.AssignedUser.InitUserIO(usersID: trim(AssignedToUserID))>	
		<cfset userFullName = request.AssignedUser.getFullName()>		
	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">
			
			function validateForm(){	
					
				var msg  = "";					
				
				if(document.#formName#.assignToUserID.value == ""){
					msg = msg + "Please choose an individual to assign claim to";		
				};
				
				<cfif reassign EQ 1>	
					if(document.#formName#.note.value == "" || document.#formName#.note.value.length <= 2){
						msg = msg + "\n\n Please enter a note (minimum 5 characters) on why this claim is being re-assigned.";		
					};
				</cfif>			
						
				if(msg.length >= 1){
					alert(msg);
					resetSubmitButtons();
					return false;
				}
				else{
					return true;
				};	
			};	
				
		</script>
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the entitys that are from this client.                                 --->
<!-------------------------------------------------------------------------------------->	
<cfif reassign EQ 1 AND IsDefined("AssignedToUserID") AND IsNumeric(AssignedToUserID)>
	<cfset NotInUsersID = trim(AssignedToUserID)>
<cfelse>
	<cfset NotInUsersID = "">	
</cfif>	
<cfset getClientsEntities = session.Client.getClientsUsers(ClientID: session.ClientID, NotInUsersIDList: trim(NotInUsersID))>


	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	
	<cfif NOT IsDefined("form.Submitted")>
		
		<cfoutput>
			
			<div align="left">
			<table border="0" width="248" cellpadding="0" cellspacing="10"><tr><td>
			<cf_gcBorderedTable	title="Assign Claim" tablealign="left">	
				<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
					<input type="Hidden" name="Submitted" value="yes">
					<input type="Hidden" name="reassgin" value="#trim(reassign)#">
					<input type="Hidden" name="ClaimID" value="#trim(ClaimID)#">
					<table border="0" width="100%" cellpadding="0" cellspacing="10">					
						
						<!---Last Assigned To--->
						<cfif reassign EQ 1 AND IsDefined("AssignedToUserID") AND IsNumeric(AssignedToUserID)>
													
							<tr>			
								<td colspan="2" class="SiteLabel" nowrap>
									<strong>Currently assigned to:</strong><br>#userFullName# on #DateFormat(now(), "mm/dd/yyyy")#
								</td>											
							</tr>	
							
						</cfif>	
							
															
						<!---Assign To--->
						<tr>			
							<td class="SiteRequiredLabel" nowrap align="right">
								Assign to:
							</td>	
							<td class="SiteLabel">						
								<select class="SiteSelectBox" name="assignToUserID">
									<option value="">
									<cfloop query="getClientsEntities">
										<option value="#trim(UsersID)#">#trim(Fullname)# 
									</cfloop>			
								</select>
							</td>			
						</tr>	
						
						<!--- Note --->
						<cfif reassign EQ 1>
							<cfset class = "SiteRequiredLabel">
						<cfelse>
							<cfset class = "SiteLabel">
						</cfif>
						
						<tr>
							<td bgcolor="FFFFFF" width="20%" class="#trim(class)#" valign="top">			   
					   			Note:								
							</td>
							<td>
								<textarea class="SiteTextArea" name="note" cols="40" rows="5"></textarea>								
							</td>
						</tr>
								
						
						<!---Submit Button--->
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>					
						<tr>
							<td align="center" colspan="2">			
								<cf_gcSubmitButton value="Assign & Close">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel" onclick="self.close();">							
							</td>
						</tr>
						
					</table>			
							
				</form>
				</cf_gcBorderedTable>
				</td></tr></table>	
			</div>
			
			
			<!--------------------------------------------------------------------------------------->
			<!--- When you have a validate form and the msg is not black this function will have  --->
			<!--- to be called below the gcSubmitButton custom tag. This tag will set             --->
			<!--- caller.submitButtonID allowing this code to work.                               --->
			<!--------------------------------------------------------------------------------------->		
			<script language="JavaScript">
				function resetSubmitButtons(){
					document.#formName#.SubmitButton#trim(submitButtonID)#.style.display='inline'; 
					spSubmitButton#trim(submitButtonID)#.innerText='';			
				};
			</script>
			
		
		</cfoutput>
	
	
	<cfelse>
	
		<cfset request.claimObject = CreateObject("component","com.common.Claim")>	
		<cfset request.claimObject.assignClaim(clientid: trim(session.ClientID), usersID: trim(assignToUserID), claimID: trim(claimID), assignorID: session.User.getUsersID(), note: trim(note))>		
				
		<script language="JavaScript">
			//window.opener.location.reload();
			var tempOpener = 'window.opener';		
			if (typeof(eval(tempOpener)) != "undefined"){						
				window.opener.location.href = window.opener.location.href;
			};		
			self.close();
		</script>
						
	</cfif>		