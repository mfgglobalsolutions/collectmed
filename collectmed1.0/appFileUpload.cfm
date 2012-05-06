<!---- appUploadFile.cfm ---->


<!------------------------------------------------------------------>
<!--- Check the Flash Player the user has on there computer.     --->
<!------------------------------------------------------------------>	
	<!---<cfif ListGetAt(session.flashVersion, 1, "|") LT 8>
		
		<cf_gcGeneralErrorTemplate
			title="Invalid Flash Player for this site."
			subtitle="Your current version is: #ListGetAt(trim(session.flashVersion), 1, "|")#<br>Version 8 is the minimum version to use this site."
			back="no"
			message="You need to download the latest verision of Macromedia Flash Player<p>1) Click on the link below and then click on express install to download the latest version of flash player.<p>&nbsp;&nbsp;&nbsp; <a href='http://www.macromedia.com/software/studio/experience/' target='_blank'>Get Latest Flash Player</a><p>2) Click on the reload this page link below.<p>&nbsp;&nbsp;&nbsp;<script language='Javascript'>function rld(){document.location.reload()}</script><a href='javascript:rld()'>Reload this page</a>">
			
	</cfif>
	--->
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.formName" default="uploadForm">
	<cfset formName = attributes.formName>	
	
	<cfparam name="attributes.filetype" default="">
	<cfset filetype = attributes.filetype>
	
	<cfif IsDefined("form.filetype") AND form.filetype NEQ "">
		<cfset filetype = form.filetype>
	<cfelseif IsDefined("url.filetype") AND url.filetype NEQ "">
		<cfset filetype = url.filetype>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="filetype"
		fieldnames="File Type"
		datatypes="numeric">	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">
			function validateForm(){					
								
				var msg  = "";					
				var invalid = " ";
															
				if(document.#formName#.fileName.value == ""){
					msg = msg + "* Please choose a file to upload\n\n";		
				};			
				
				var fileNameArray = document.#formName#.fileName.value.split("\\");										
				if(fileNameArray[fileNameArray.length - 1].indexOf(invalid) > -1){
					msg = msg + "* File name cannot contain spaces.\n\n";
				};			
					
						
				if(msg.length >= 1){
					alert(msg);
					document.#formName#.filePath.value = "";
					resetSubmitButtons();
					return false;
				}
				else{
					document.#formName#.filePath.value = document.#formName#.fileName.value;
					return true;
				};
			};
		</script>
	</cfoutput>	
	
	
	
<!------------------------------------------------------------------>
<!--- Upload the file that will be processed.                    --->
<!------------------------------------------------------------------>
	<cfoutput>	
		
		<br><br>
		<cf_gcBorderedTable	title="Upload&nbsp;File" tablealign="center">				
			<table border="0" width="50%">
				<tr>						
					<td class="SiteLabel">
						<p>
						<form action="appFileUploadProcess.cfm" name="#formName#" enctype="multipart/form-data" method="post" onsubmit="return validateForm();">
							<input type="Hidden" name="checkFileFor" value="ST*835*">
							<input type="Hidden" name="usersID" value="#trim(session.User.getUsersID())#">
							<input type="Hidden" name="siteID" value="#request.Site.getSiteID()#">
							<input type="Hidden" name="clientID" value="#trim(session.ClientID)#">
							<input type="Hidden" name="SupportEmailAddressID" value="#session.Client.getSupportEmailID()#">
							<input type="Hidden" name="HIDDEN_State_Note" value="0">
							<input type="Hidden" name="filePath" value="">
							<input type="Hidden" name="fileType" value="#trim(filetype)#">
										
							<table align="center" cellspacing="2" cellpadding="4" border="0">
								<tr><td colspan="2" align="center"><input type="file" name="fileName" size="45" class="SiteTextBox"></td></tr>								
								<tr id="tr_Note">
								    <td class="SiteLabel" valign="top">Add&nbsp;Note<br><span class="copyGreySmall">(if any)</span></td>
								    <td class="SiteLabel"><textarea class="SiteTextArea" name="note" cols="45" rows="3"></textarea></td>
								</tr>
																
								<tr><td align="center" colspan="2"><cf_gcSubmitButton value="Upload"></td></tr>
							</table>
							
						</form>		
						</p>
					</td>								
				</tr>
			</table>			
		</cf_gcBorderedTable>
		
		
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
	
	
	