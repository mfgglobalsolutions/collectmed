<!---- appChangePassword.cfm ---->

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
	
	<cfparam name="attributes.message" default="1">
	<cfset message = attributes.message>
	
	<cfparam name="attributes.verbiage" default="">
	<cfset verbiage = attributes.verbiage>
	
	
	<cfif IsDefined("form.message") AND form.message NEQ "">
		<cfset message = form.message>
	<cfelseif IsDefined("url.message") AND url.message NEQ "">
		<cfset message = url.message>	
	</cfif>
	
	<cfif IsDefined("form.verbiage") AND form.verbiage NEQ "">
		<cfset verbiage = form.verbiage>
	<cfelseif IsDefined("url.verbiage") AND url.verbiage NEQ "">
		<cfset verbiage = url.verbiage>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Depending on the message we need to display it will be defined by the          --->
<!--- message number.                                                                --->
<!-------------------------------------------------------------------------------------->
<cfif message EQ 1>
	<cfset verbiage = "<p><font face=Arial size=4><font color=800000>Welcome!</font> This is your first login. <p>You are required to change your password.</p></font></p>">
</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the javascript that will run.                                            --->
<!-------------------------------------------------------------------------------------->
<cfoutput>
	
	<script language="JavaScript">
			
			function checkUserInformation(){
				
				var msg  = "";
				
				if(document.#trim(formname)#.EntryQID.selectedIndex != 0 && document.#trim(formname)#.EntryResponse.value == ""){
					msg = msg + "* Please enter a response to your password retrieval question" + "\n\n";
					document.#trim(formname)#.EntryResponse.className = 'SiteTextboxALERT';		
				}
				else{
					document.#trim(formname)#.EntryResponse.className = 'SiteTextbox';
				};				
					
				if(document.#trim(formname)#.oldPassword.value == document.#trim(formname)#.password.value){
					msg = msg + "* Password cannot be the same as your old password" + "\n\n";
					document.#trim(formname)#.password.className = 'SiteTextboxALERT';		
					document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';		
				}
				else{
					document.#trim(formname)#.password.className = 'SiteTextbox';
					document.#trim(formname)#.passwordConfirm.className = 'SiteTextbox';
				};									
				
				if(document.#trim(formname)#.password.value != document.#trim(formname)#.oldPassword.value && document.#trim(formname)#.password.value != document.#trim(formname)#.passwordConfirm.value){
					document.#trim(formname)#.password.className = 'SiteTextboxALERT';
					document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Password and Confirm Password must match" + "\n\n";	
				};				
				
				else if(document.#trim(formname)#.password.value == "" || document.#trim(formname)#.passwordConfirm.value == ""){
					msg = msg + "* Password cannot be blank" + "\n\n";
			        document.#trim(formname)#.password.className = 'SiteTextboxALERT';
					document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
				} 
															
			    else if(document.#trim(formname)#.password.value != "" && document.#trim(formname)#.password.value == document.#trim(formname)#.passwordConfirm.value) {
					
					if(specialChars(document.#trim(formname)#.password.value) == true){
						msg = msg + "* Password cannot contain special characters. Only numbers, letters and @" + "\n\n";
			        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
						document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
					};
					
					if(document.#trim(formname)#.password.value.length < 6) {
			        	msg = msg + "* Password must contain at least six characters" + "\n\n";
			        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
						document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
			      	}
			      	
			      	re = /[0-9]/;
			      	if(!re.test(document.#trim(formname)#.password.value)) {
			        	msg = msg + "* Password must contain at least one number (0-9)" + "\n\n";
			        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
						document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
			      	}
			      	re = /[a-z]/;
			      	if(!re.test(document.#trim(formname)#.password.value)) {
			        	msg = msg + "* Password must contain at least one lowercase letter (a-z)" + "\n\n";
			        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
						document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
			      	}
			      	re = /[A-Z]/;
			      	if(!re.test(document.#trim(formname)#.password.value)) {
			        	msg = msg + "* Password must contain at least one uppercase letter (A-Z)" + "\n\n";
			        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
						document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
			      	}
			    }			
				else{
					document.#trim(formname)#.password.className = 'SiteTextbox';
				};	
																									
				return msg;
				
			};					
			
			function specialChars(string){				
				var spec="!##$%^&*()-+={}[]\|;:<>?,/\"";
				var contains = false;
			    for (var i = 0; i < spec.length; i++) {					
			       if(string.indexOf(spec.charAt(i)) != -1) {
			        	contains = true;
						break; 
					};
			    };
				return contains;    
			};
			
			
			function validateForm(){	
				
				var msg  = "";			
				
				msg = msg + checkUserInformation();		
													
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
<!--- Get the user account information                                               --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getUserAccountInformation" datasource="#trim(request.datasource)#">
		SELECT EntryPoint, EntryQID, EntryResponse
		FROM pa_master.users  
		WHERE UsersID = #trim(session.User.getUsersID())#
	</cfquery>		
	
	<cfset Password = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getUserAccountInformation.EntryPoint)) />
	<cfset EntryResponse = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getUserAccountInformation.EntryResponse)) />
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<br>
		<form method="post" name="#trim(formname)#" action="appChangePasswordProcess.cfm?data1=#trim(session.User.getUsersID())#" onsubmit="return validateForm();">				
			<input type="Hidden" name="oldPassword" value="#trim(password)#">					
			<table border="0" cellpadding="0" cellspacing="0">		
			
			<cfif verbiage NEQ "">
				<tr>
					<td><font face="Verdana" size="4" color="990000">#trim(verbiage)#</font></td>
				</tr>
			</cfif>
			
			<tr>
				<td class="med">Your new password must meet the following requirements:<ul><li>Password cannot contain special characters. Only numbers, letters and @</li><li>At least 6 characters in length</li><li>One upper case letter</li><li>One lower case letter</li><li>One Number</li></ul></td>
			</tr>	
									
			<tr>
				<td align="center" colspan="2">
					
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Password&nbsp;Change" Align="center" tableWidth="100%">
												
						<table>							
							<tr>
								<td align="right" class="SiteRequiredLabel">		
									New&nbsp;Password:														
								</td>
								<td>
									<input type="Text" name="password" size="30" class="SiteTextBox" value="">&nbsp;<font size="1" color="ff0000">(case&nbsp;sensitive)</font>
								</td>
							</tr>
							<tr>
								<td align="right" class="SiteRequiredLabel">		
									Confirm&nbsp;New&nbsp;Password:														
								</td>
								<td>
									<input type="Text" name="passwordConfirm" size="30" class="SiteTextBox" value="">&nbsp;<font size="1" color="ff0000">(case&nbsp;sensitive)</font>
								</td>
							</tr>
						</table>								
						
					</cf_gcBorderedTable>	
					
				</td>
			</tr>
			
			
			<tr>
				<td>&nbsp;</td>
			</tr>	
									
			<tr>
				<td align="center" colspan="2">
					
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Password&nbsp;Retrieval" Align="center" tableWidth="100%">
												
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
											<option value="#StandardListItemID#" <cfif StandardListItemID EQ getUserAccountInformation.EntryQID>SELECTED</cfif>> #ItemNameDisplay#
										</cfloop>
									</select>											
								</td>
							</tr>
							<tr>
								<td align="right" class="SiteLabel">		
									Password&nbsp;Retrieval&nbsp;Answer:												
								</td>
								<td>
									<input type="Text" name="EntryResponse" size="30" class="SiteTextBox" value="#trim(EntryResponse)#">
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
			<tr>
				<td align="center">			
					<cf_gcSubmitButton value="Save&nbsp;Changes">							
				</td>
			</tr>			
		</table>		
			
						
		</form>	
			
	
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
