<!---- appClaimEditMedicarePrint.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="printDocs">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.claimID" default="">
	<cfset claimID = attributes.claimID>
	
	<cfif IsDefined("form.claimID") AND form.claimID NEQ "">
		<cfset claimID = form.claimID>
	<cfelseif IsDefined("url.claimID") AND url.claimID NEQ "">
		<cfset claimID = url.claimID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="claimID"
		fieldnames="Claim ID"
		datatypes="numeric">
		
		
				
<!-------------------------------------------------------------------------------------->
<!--- setup all the javascripts needed for this page.                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			function showHCFAIFRAME(){			
				trHCFAIFRAME.style.display='inline';					 
				tdHCFAIFRAME.innerHTML='<iframe name="hcfaFrame" src=appLoading.cfm?GoToPage=appFormHCFA1500.cfm?claimID=#trim(claimID)# width=940 height=300 scrolling=auto>Frame Missing</iframe>';
			};
			
			function showRedeterminationIFRAME(){			
				trRedeterminationIFRAME.style.display='inline';					 
				tdRedeterminationIFRAME.innerHTML='<iframe name="redeterminationFrame" src=appLoading.cfm?GoToPage=appFormRedeterminationRequest.cfm?claimID=#trim(claimID)# width=940 height=300 scrolling=auto>Frame Missing</iframe>';
			};
			
			function showHearingRequestIFRAME(){			
				trHearingRequestIFRAME.style.display='inline';					 
				tdHearingRequestIFRAME.innerHTML='<iframe name="hearingrequestFrame" src=appLoading.cfm?GoToPage=appFormHearingRequest.cfm?claimID=#trim(claimID)# width=940 height=300 scrolling=auto>Frame Missing</iframe>';
			};
			
			function attachIframeValues(){				
				
				if(document.#trim(formname)#.hcfa.checked){			
					for(var i=0; i < window.frames['hcfaFrame'].document.forms[0].elements.length; i++){
						name = window.frames['hcfaFrame'].document.forms[0].elements[i].name;
						value = window.frames['hcfaFrame'].document.forms[0].elements[i].value;
						if(name != ''){
							addField(printDocs, 'hidden', name, value);
						}
					}
				};
				
				if(document.#trim(formname)#.redetermination.checked){			
					for(var i=0; i < window.frames['redeterminationFrame'].document.forms[0].elements.length; i++){
						name = window.frames['redeterminationFrame'].document.forms[0].elements[i].name;
						value = window.frames['redeterminationFrame'].document.forms[0].elements[i].value;
						if(name != ''){
							addField(printDocs, 'hidden', name, value);
						}
					}
				};		
						
			};
						
			function addField(form, fieldType, fieldName, fieldValue){
			  if (document.getElementById) {
			    var input = document.createElement('INPUT');
			      if (document.all) { 
			        input.type = fieldType;
			        input.name = fieldName;
			        input.value = fieldValue;
			      }
			      else if (document.getElementById) { 			                                         
			        input.setAttribute('type', fieldType);
			        input.setAttribute('name', fieldName);
			        input.setAttribute('value', fieldValue);
			      }
				  				  
				
				/* var temp = "document." + form.name + "." + fieldName;
				 var tempVal = "document." + form.name + "." + fieldName + ".value";			
			     if(temp){
					 tempVal = '';					 
				 };*/
				<!--- This is the code that makes the print take about 6 seconds. Will have to look at GC 12/24/06 Code above would be better but does not work for whatever reason.---> 
				for(var i=0; i < document.forms[0].elements.length; i++){					
					if(document.forms[0].elements[i].type == 'hidden' && document.forms[0].elements[i].name == fieldName){							
						document.forms[0].elements[i].value = '';							
						//window.status = name;			
						break;
					}
				}				  
				  
			    form.appendChild(input);
				
			  }
			}		
									
		</script>
		
	</cfoutput>	


	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of  this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<table align="center" cellspacing="3" cellpadding="2" border="0">
		<tr>
			<td>
				
				&nbsp;<br>
				
				<cf_gcBorderedTable	title="Choose&nbsp;the&nbsp;documents&nbsp;you&nbsp;want&nbsp;to&nbsp;print.">	
				
					<cfoutput>
					
						<form name="#trim(formName)#" action="appClaimEditMedicarePrintProcess.cfm" target="_blank" method="post" onsubmit="resetSubmitButtons();">
							<input type="Hidden" name="claimid" value="#trim(claimID)#">
							<table cellspacing="2" cellpadding="2" border="0">								
								<tr>										
									<td>
										<input type="Checkbox" name="hcfa" onclick="if(this.checked == false){trHCFAIFRAMEText.style.display='none'; trHCFAIFRAME.style.display='none';} else{trHCFAIFRAMEText.style.display='block'; trHCFAIFRAME.style.display='block'; showHCFAIFRAME();};">											    										
									</td>
									<td class="siteRequiredLabel" nowrap><span id="trHCFAIFRAMEText" style="cursor:hand; display: 'none';" onclick="if(trHCFAIFRAME.style.display=='none') {trHCFAIFRAME.style.display='block'; trHCFAIFRAMEText.innerHTML = 'Close&nbsp;Form&nbsp;Keep&nbsp;Data&nbsp;To&nbsp;Print';} else {trHCFAIFRAME.style.display='none'; trHCFAIFRAMEText.innerHTML = 'Open&nbsp;Form&nbsp;With&nbsp;Current&nbsp;Data';};">Close&nbsp;Form&nbsp;Keep&nbsp;Data&nbsp;To&nbsp;Print</span></td>				
									<td class="siteLabel" nowrap>HCFA-1500</td>					    
								</tr>																																	
								<tr id="trHCFAIFRAME" style="display: 'none';">
									<td colspan="3" id="tdHCFAIFRAME" style="cursor: 'hand'; border-bottom: 1px black solid;">&nbsp;</td>			
								</tr>																
								<tr>
								    <td class="siteLabel"><input type="Checkbox" name="claimData"></td>
									<td class="siteLabel">&nbsp;</td>				
									<td class="siteLabel">Claim&nbsp;Data</td>
								</tr>								
								<tr>								   
								    <td class="siteLabel"><input type="Checkbox" name="redetermination" onclick="if(this.checked == false){trRedeterminationIFRAMEText.style.display='none'; trRedeterminationIFRAME.style.display='none';} else{trRedeterminationIFRAMEText.style.display='block'; trRedeterminationIFRAME.style.display='block'; showRedeterminationIFRAME();};"></td>
								    <td class="siteRequiredLabel" nowrap><span id="trRedeterminationIFRAMEText" style="cursor:hand; display: 'none';" onclick="if(trRedeterminationIFRAME.style.display=='none') {trRedeterminationIFRAME.style.display='block'; trRedeterminationIFRAMEText.innerHTML = 'Close&nbsp;Form&nbsp;Keep&nbsp;Data&nbsp;To&nbsp;Print';} else {trRedeterminationIFRAME.style.display='none'; trRedeterminationIFRAMEText.innerHTML = 'Open&nbsp;Form&nbsp;With&nbsp;Current&nbsp;Data';};">Close&nbsp;Form&nbsp;Keep&nbsp;Data&nbsp;To&nbsp;Print</span></td>				
									<td class="siteLabel" colspan="2">Redetermination&nbsp;Form</td>
								</tr>							
								<tr id="trRedeterminationIFRAME" style="display: 'none';">
									<td colspan="3" id="tdRedeterminationIFRAME" style="cursor: 'hand'; border-bottom: 1px black solid;">&nbsp;</td>			
								</tr>									
								
								<tr>								   
								    <td class="siteLabel"><input type="Checkbox" name="hearingRequest" onclick="if(this.checked == false){trHearingRequestIFRAMEText.style.display='none'; trHearingRequestIFRAME.style.display='none';} else{trHearingRequestIFRAMEText.style.display='block'; trHearingRequestIFRAME.style.display='block'; showHearingRequestIFRAME();};"></td>
								    <td class="siteRequiredLabel" nowrap><span id="trHearingRequestIFRAMEText" style="cursor:hand; display: 'none';" onclick="if(trHearingRequestIFRAME.style.display=='none') {trHearingRequestIFRAME.style.display='block'; trHearingRequestIFRAMEText.innerHTML = 'Close&nbsp;Form&nbsp;Keep&nbsp;Data&nbsp;To&nbsp;Print';} else {trHearingRequestIFRAME.style.display='none'; trHearingRequestIFRAMEText.innerHTML = 'Open&nbsp;Form&nbsp;With&nbsp;Current&nbsp;Data';};">Close&nbsp;Form&nbsp;Keep&nbsp;Data&nbsp;To&nbsp;Print</span></td>				
									<td class="siteLabel" colspan="2">Hearing&nbsp;Request&nbsp;Form</td>
								</tr>							
								<tr id="trHearingRequestIFRAME" style="display: 'none';">
									<td colspan="3" id="tdHearingRequestIFRAME" style="cursor: 'hand'; border-bottom: 1px black solid;">&nbsp;</td>			
								</tr>	
																														
								<tr><td colspan="8">&nbsp;</td></tr>
								<tr><td colspan="8" align="center"><cf_gcSubmitButton value="Print" onclick="attachIframeValues();"></td></tr>
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
				
				</cf_gcBorderedTable>	
		
			</td>
		</tr>
	</table>