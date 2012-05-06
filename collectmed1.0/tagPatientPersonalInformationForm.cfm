<!--- tagPatientPersonalInformationForm.cfm --->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="PerosnalInformationForm">
	<cfset formName = attributes.formName>

	
						
<!-------------------------------------------------------------------------------------->
<!--- Insurance section of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
	
		<script language="JavaScript">		
			
			function validateForm(){
				
				var msg  = "";
				
				/*
				if(document.#formName#.primPatientInsCom.value == ""){
					msg = msg + "* The Primary Insurance cannot be blank." + "\n\n";					
				} 	
				*/							
				
				if(msg.length >= 1){
					alert(msg);
					return false;
				}
				else{					
					return true;
				};	
				
			}	
				
		</script>
	
	</cfoutput>
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->		
	<cfoutput>
			
		<cf_gcBorderedTable title="Patients'&nbsp;Personal&nbsp;Information" tablealign="left">	
				
			<form method="post" name="#trim(formName)#" action="appPatientProcess.cfm" onsubmit="return validateForm();reloadMain();">
				
				<input type="Hidden" name="formname" value="#formName#">							
				<input type="Hidden" name="PatientID" value="#trim(PatientID)#">			
														
				<table cellpadding="2" cellspacing="0" border="0">																
					<tr>
					    <td class="SiteLabel" align="right">Patient&nbsp;ID:&nbsp;</td>
					    <td class="SiteLabel">
							#trim(request.Patient.getPatientID())#								
						</td>
					</tr>		
					
					<!--- First Name --->
					<tr>
					    <td class="SiteLabel" align="right" style="cursor:hand;" onclick="if(document.all.fNameEdit.style.display == 'block'){sp_fNameDisplay.innerHTML = document.all.EntityFName.value; document.all.fNameEdit.style.display = 'none'; document.all.fNameDisplay.style.display = 'block'} else{document.all.fNameEdit.style.display = 'block', document.all.fNameDisplay.style.display = 'none'}">
							<u>First:</u>&nbsp;
						</td>
					    <td id="fNameDisplay" class="SiteLabel" style="display:block">
							<span id="sp_fNameDisplay">#trim(request.Entity.getFName())#</span>								
						</td>
						 <td id="fNameEdit" class="SiteLabel" style="display:none">
							<input class="SiteTextBox" type="Text" name="EntityFName" value="#trim(request.Entity.getFName())#">								
						</td>
					</tr>	
					
					<!--- Middle Name --->
					<tr>
					    <td class="SiteLabel" align="right" style="cursor:hand;" onclick="if(document.all.mNameEdit.style.display == 'block'){sp_mNameDisplay.innerHTML = document.all.EntitymName.value; document.all.mNameEdit.style.display = 'none'; document.all.mNameDisplay.style.display = 'block'} else{document.all.mNameEdit.style.display = 'block', document.all.mNameDisplay.style.display = 'none'}">
							<u>Middle:</u>&nbsp;
						</td>
					    <td id="mNameDisplay" class="SiteLabel" style="display:block">
							<span id="sp_mNameDisplay">#trim(request.Entity.getmName())#</span>								
						</td>
						 <td id="mNameEdit" class="SiteLabel" style="display:none">
							<input class="SiteTextBox" type="Text" name="EntitymName" value="#trim(request.Entity.getmName())#">								
						</td>
					</tr>	
					
					<!--- Last Name --->
					<tr>
					    <td class="SiteLabel" align="right" style="cursor:hand;" onclick="if(document.all.lNameEdit.style.display == 'block'){sp_lNameDisplay.innerHTML = document.all.EntitylName.value; document.all.lNameEdit.style.display = 'none'; document.all.lNameDisplay.style.display = 'block'} else{document.all.lNameEdit.style.display = 'block', document.all.lNameDisplay.style.display = 'none'}">
							<u>Last:</u>&nbsp;
						</td>
					    <td id="lNameDisplay" class="SiteLabel" style="display:block">
							<span id="sp_lNameDisplay">#trim(request.Entity.getlName())#</span>								
						</td>
						 <td id="lNameEdit" class="SiteLabel" style="display:none">
							<input class="SiteTextBox" type="Text" name="EntitylName" value="#trim(request.Entity.getlName())#">								
						</td>
					</tr>									
					
					<!--- DOB --->
					<tr>
					    <td class="SiteLabel" align="right" valign="top" style="cursor:hand;" onclick="if(document.all.dobEdit.style.display == 'block'){sp_dobDisplay.innerHTML = document.all.Entitydob.value; document.all.dobEdit.style.display = 'none'; document.all.dobDisplay.style.display = 'block'} else{document.all.dobEdit.style.display = 'block', document.all.dobDisplay.style.display = 'none'}">
							<u>DOB:</u>&nbsp;
						</td>
					    <td id="dobDisplay" class="SiteLabel" style="display:block">
							<span id="sp_dobDisplay">#DateFormat(trim(request.Entity.getDOB()), 'mm/dd/yyyy')#</span>								
						</td>
						 <td id="dobEdit" class="SiteLabel" style="display:none">							
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
								    <td><input class="SiteTextBox" type="Text" name="Entitydob" value="#DateFormat(trim(request.Entity.getDOB()), 'mm/dd/yyyy')#" onblur="checkIsDate('#trim(formname)#', 'Entitydob',this.value);"></td>
								</tr>
								<tr>
								    <td><span class="CopyGrey">&nbsp;(ex.&nbsp;01/31/1972)</span></td>
								</tr>
							</table>												
						</td>
					</tr>		
					
					<tr>
						<td colspan="2" align="center" nowrap>			
							&nbsp;
						</td>
					</tr>	
					
					<tr>
						<td colspan="2" align="center" nowrap>			
							<div align="center"><cf_gcSubmitButton value="Save&nbsp;Changes"></div>							
						</td>
					</tr>	
					
				</table>	
			
			</form>								
		
		</cf_gcBorderedTable>		
		
	</cfoutput>	
		
	