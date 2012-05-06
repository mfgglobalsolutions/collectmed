<!---- appUpload835File.cfm ---->


<!------------------------------------------------------------------>
<!--- Check the Flash Player the user has on there computer.     --->
<!------------------------------------------------------------------>	
	<cfif ListGetAt(session.flashVersion, 1, "|") NEQ 8>
		
		<cf_gcGeneralErrorTemplate
			title="Invalid Flash Player for this site."
			subtitle="Your current version is: #ListGetAt(trim(session.flashVersion), 1, "|")#<br>Version 8 is the minimum version to use this site."
			back="no"
			message="You need to download the latest verision of Macromedia Flash Player<p>1) Click on the link below and then click on express install to download the latest version of flash player.<p>&nbsp;&nbsp;&nbsp; <a href='http://www.macromedia.com/software/studio/experience/' target='_blank'>Get Latest Flash Player</a><p>2) Click on the reload this page link below.<p>&nbsp;&nbsp;&nbsp;<script language='Javascript'>function rld(){document.location.reload()}</script><a href='javascript:rld()'>Reload this page</a>">
			
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">
			function validateForm(){					
				
				if(document.uploadForm.fileName.value == ""){
					alert("* Please choose a file to upload\n\n");
					return false;
				}
				else{
					document.uploadForm.filePath.value = document.uploadForm.fileName.value;
				};
				return true;
				
			};
		</script>
	</cfoutput>	
	
	
<!------------------------------------------------------------------>
<!--- Upload the file that will be processed.                    --->
<!------------------------------------------------------------------>
	<cfoutput>	
		
		<br><br>
		<cf_gcBorderedTable	title="Upload&nbsp;835&nbsp;File" tablealign="center">				
			<table border="0" width="100%">
				<tr>						
					<td class="SiteLabel">
						<p>
						<form action="appUpload835FileProcess.cfm" name="uploadForm" enctype="multipart/form-data" method="post" onsubmit="return validateForm();">
							<input type="Hidden" name="checkFileFor" value="ST*835*">
							<input type="Hidden" name="usersID" value="#trim(session.User.getUsersID())#">
							<input type="Hidden" name="siteID" value="#request.Site.getSiteID()#">
							<input type="Hidden" name="clientID" value="#trim(session.ClientID)#">
							<input type="Hidden" name="SupportEmailAddressID" value="#request.Site.getSupportEmailAddressID()#">
							<input type="Hidden" name="HIDDEN_State_Note" value="0">
							<input type="Hidden" name="filePath" value="">
							<input type="Hidden" name="fileType" value="101">
										
							<table align="center" cellspacing="0" cellpadding="4" border="0">
								<tr><td colspan="2" align="center"><input type="file" name="fileName" size="45" class="SiteTextBox"></td></tr>
								
								<tr id="tr_NoteSpan">
								    <td class="SiteLabel" valign="top" colspan="2"><span onclick="if (HIDDEN_State_Note.value==0) {HIDDEN_State_Note.value=1; tr_Note.style.display='inline'; tr_NoteSpan.style.display='none';};" style="cursor: hand;"><u>Add&nbsp;Note</u></span></td>						    
								</tr>
								<tr id="tr_Note" style="display: none">
								    <td class="SiteLabel" valign="top"><span onclick="if (HIDDEN_State_Note.value==0) {HIDDEN_State_Note.value=1; tr_Note.style.display='inline'; tr_NoteSpan.style.display='none';}else{HIDDEN_State_Note.value=0; tr_Note.style.display='none'; tr_NoteSpan.style.display='inline';};" style="cursor: hand;"><u>Add&nbsp;Note</u></td>
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
		
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Temp Code to handle reloading.                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfdirectory name="dirQuery" directory="#trim(request.applicationPath)#\EOBManagerFMS\Client\#trim(session.clientID)#\2006\#month(NOW())#\#day(NOW())#" action="LIST">

	<!---<cfloop query="dirQuery">
		<cfif dirQuery.type IS "dir">
		   <cfdirectory recurse="true" action="DELETE" directory="#trim(request.applicationPath)#\EOBManagerFMS\Client\#trim(session.clientID)#\2006\#month(NOW())#\#day(NOW())#">
		</cfif>
	</cfloop>--->
	
	<!---<cfquery name="delFile14" datasource="#request.datasource#">
		DELETE FROM Claim_MEDICARE_SUPPLEMENTAL_AMOUNT
	</cfquery>	
		
	<cfquery name="delFile13" datasource="#request.datasource#">
		DELETE FROM Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT
	</cfquery>		
	
	<cfquery name="delFile12" datasource="#request.datasource#">
		DELETE FROM Procedure_MEDICARE_REMARK_CODE
	</cfquery>	
	
	<cfquery name="delFile11" datasource="#request.datasource#">
		DELETE FROM ProcedureOpenClose
	</cfquery>
	
	<cfquery name="delFile9" datasource="#request.datasource#">
		DELETE FROM Procedure_MEDICARE_CLAIMADJUSTMENT
	</cfquery>
		
	<cfquery name="delFile9" datasource="#request.datasource#">
		DELETE FROM Procedure_MEDICARE_MODIFIER
	</cfquery>	

	<cfquery name="delFile8" datasource="#request.datasource#">
		DELETE FROM Claim_MEDICARE_MOA
	</cfquery>	
	
	<cfquery name="delFile7" datasource="#request.datasource#">
		DELETE FROM [Procedure]
	</cfquery>	
		
	<cfquery name="delFile6" datasource="#request.datasource#">
		DELETE FROM Claim WHERE ClaimID > 3
	</cfquery>	
	
	<cfquery name="delFile2" datasource="#request.datasource#">
		DELETE FROM Entity WHERE EntityID > 195
	</cfquery>	
	
	<cfquery name="delFile3" datasource="#request.datasource#">
		DELETE FROM Patient WHERE PatientID > 102
	</cfquery>	
	
	<cfquery name="delFile4" datasource="#request.datasource#">
		DELETE FROM Interchange
	</cfquery>	--->
	<!---
	<cfquery name="delFile" datasource="#request.datasource#">
		DELETE FROM File
	</cfquery>	
	
	<cfquery name="delFile5" datasource="#request.datasource#">
		DELETE FROM FileProcess
	</cfquery>	
	
	--->