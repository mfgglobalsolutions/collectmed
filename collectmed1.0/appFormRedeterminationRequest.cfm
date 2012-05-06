

<cfoutput>	

	<style>
		.RedeterminationUnderlinedTextbox {
			padding-left:3px;
			height: 17px;
			border-right: ##ffffff 1px solid; 
			border-top: ##ffffff 1px solid; 
			font-size: .65em; 
			border-left: ##ffffff 1px solid; 
			color: ##000000;
			border-bottom: ##000000 1px solid; 
			font-family: "MS Sans Serif", Verdana, Geneva, sans-serif;
		}		
	</STYLE>


	<script language="JavaScript">
		function checkBoxRadio(elementName, checkValue){			
									
			for(var i = 0; i < document.images.length; i++){
				
				if(document.images[i].name == elementName && document.images[i].alt == checkValue){					
					array = eval('document.images['+ i +'].src.split("/")');					
					if(array[array.length-1] == 'Checkbox1.gif'){				
						document.images[i].src='images/Checkbox2.gif';		
						temp = eval('document.all.'+ checkValue +'.value = 1');											
					}
					else{
						document.images[i].src='images/Checkbox1.gif';	
						temp = eval('document.all.'+ checkValue +'.value = ""');								
					}
				}
				else if(document.images[i].name == elementName){					
					document.images[i].src='images/Checkbox1.gif';
					altName = document.images[i].alt;
					temp = eval('document.all.'+ altName +'.value = ""');									
				}			
			}				
		}		
	</script>


	<form name="trim(formName)">		
		<font face="Arial">
			<table width=750 border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" colspan="2"><strong><font face="Arial" size="2">APPEALS</font></strong></td>
				</tr>
				<tr>
					<td align="right" colspan="2"><hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;"></td>
				</tr>	
				<tr>
					<td align="center" colspan="2"><font face="Arial black" size="3">DMERC Redetermination Request Form</font></td>
				</tr>	
				<tr><td colspan="2">&nbsp;</td></tr>	
				<tr>
					<td align="center" colspan="2">
						<font size="2">
							Print legibly and complete all information. Only one form may be used per Medicare patient.<br>
							<strong>For claims processed on or after October 1, 2002, requests must be filed within 120 days of the<br>remittance date.</strong>
						</font>	
					</td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>	
				<tr>
					<td align="center" colspan="2">	
						<div style="border: 1px solid; border-color: 000000 000000 000000 000000; padding: 2px;">
							<table cellspacing="0" cellpadding="0" border="0" width="97%">
								<tr>
								    <td rowspan="3"><img src="images/StopSign.gif" width="97" height="103" border="0" alt=""></td>
								    <td colspan="2"><strong><font size="2">Does error message code MA130 appear on your remittance notice?</font></strong></td>
								</tr>
								<tr>						 
								   	<td colspan="2"><font size="2">
										<input type="Text" name="errorMessageCode_CBox_MA130Yes" class="RedeterminationUnderlinedTextbox" size="2" maxlength="1" value="">
									   	Yes. You must resubmit the services as a NEW claim. (Do not submit this form.)</font>
									</td>							   
								</tr>
								<tr>
								    <td colspan="2"><font size="2">
										<input type="Text" name="errorMessageCode_CBox_MA130No" class="RedeterminationUnderlinedTextbox" size="2" maxlength="1" value="X">
										No. Complete this form and attach any applicable documentation.</font>
									</td>							   
								</tr>
							</table>
						</div>
 					</td>
				</tr>	
				
				
				<tr><td colspan="2">&nbsp;</td></tr>	
				<tr>
					<td align="center" colspan="2">						
						<table cellspacing="0" cellpadding="0" style="border: 1px solid; border-color: 000000 000000 000000 000000; padding: 2px;" width="100%">								
							<tr>
							    <td colspan="2" align="center">
									<table cellspacing="2" cellpadding="2" border="0" width="100%">
										<tr>
										   <td colspan="4" align="center"><em><font size="1">Complete each entry.</font></em></td>										  
										</tr>
										<tr>
										   <td align="right"><font face="Arial" size="2"><strong>Date</strong></font></td>
										   <td colspan="3"><input type="Text" name="date" class="RedeterminationUnderlinedTextbox" size="40" maxlength="75" value="#DateFormat(NOW(), 'mm/dd/yyyy')#"></td>
										</tr>
										<tr>
										   	<td align="right"><font face="Arial" size="2"><strong>From</strong></font></td>
										   	<td><input type="Text" name="from" class="RedeterminationUnderlinedTextbox" size="40" maxlength="75" value=""></td>
											<td align="right"><font face="Arial" size="2"><strong>Patient&nbsp;Name</strong></font></td>
										   	<td><input type="Text" name="patientName" class="RedeterminationUnderlinedTextbox" size="40" maxlength="75" value=""></td>
										</tr>
										<tr>
										   <td>&nbsp;</td>
										   <td colspan="3" valign="top"><em><font size="1">(Company name)</font></em></td>										  
										</tr>
										<tr>
										   	<td align="right"><font face="Arial" size="2"><strong>NSC&nbsp;Supplier&nbsp;no.</strong></font></td>
										   	<td><input type="Text" name="nscSupplierNumber" class="RedeterminationUnderlinedTextbox" size="40" maxlength="75" value=""></td>
											<td align="right"><font face="Arial" size="2"><strong>HICN</strong></font></td>
										   	<td><input type="Text" name="HICN" class="RedeterminationUnderlinedTextbox" size="40" maxlength="75" value=""></td>
										</tr>
										<tr>
										   <td align="right"><font face="Arial" size="2"><strong>Contact&nbsp;Person</strong></font></td>
										   <td colspan="3"><input type="Text" name="contactPerson" class="RedeterminationUnderlinedTextbox" size="40" maxlength="75" value=""></td>
										</tr>
										<tr>
										   <td align="right"><font face="Arial" size="2"><strong>Telephone&nbsp;##</strong></font></td>
										   <td colspan="3"><input type="Text" name="telephoneNumber" class="RedeterminationUnderlinedTextbox" size="40" maxlength="75" value=""></td>
										</tr>										
									</table>

								</td>							   
							</tr>
							<tr bgcolor="000000">
							    <td colspan="2" align="center"><font color="ffffff" size="2"><strong>Reason&nbsp;For&nbsp;Request</strong></font></td>							   
							</tr>
							<tr>
							    <td colspan="2" align="center">
									
									<table cellspacing="2" cellpadding="2" border="0" width="100%">
										<tr>
										    <td colspan="8" align="center"><em><font size="1">Check&nbsp;only&nbsp;one.</font></em></td>
										</tr>
										 <input type="Hidden" name="reasonForRequest_CBox_ClaimDenied" value="">
										 <input type="Hidden" name="reasonForRequest_CBox_ClaimPaymentReduced" value="">
										 <input type="Hidden" name="reasonForRequest_CBox_ClaimCorrection" value="">
										 <input type="Hidden" name="reasonForRequest_CBox_ClaimReopened" value="">				
										<tr>
										    <td colspan="2" align="center">											
								                <img src="images/Checkbox1.gif" name="CheckUncheckPic_Claim" alt="reasonForRequest_CBox_ClaimDenied" onclick="checkBoxRadio('CheckUncheckPic_Claim', 'reasonForRequest_CBox_ClaimDenied')">&nbsp;Claim&nbsp;denied
											</td>	
											<td colspan="2" align="center">	
												<img src="images/Checkbox1.gif" name="CheckUncheckPic_Claim" alt="reasonForRequest_CBox_ClaimPaymentReduced" onclick="checkBoxRadio('CheckUncheckPic_Claim', 'reasonForRequest_CBox_ClaimPaymentReduced')">&nbsp;Claim&nbsp;payment&nbsp;reduced
											</td>	
											<td colspan="2" align="center">
											    <img src="images/Checkbox1.gif" name="CheckUncheckPic_Claim" alt="reasonForRequest_CBox_ClaimCorrection" onclick="checkBoxRadio('CheckUncheckPic_Claim', 'reasonForRequest_CBox_ClaimCorrection')">&nbsp;Claim&nbsp;correction
											</td>	
											<td colspan="2" align="center">
												<img src="images/Checkbox1.gif" name="CheckUncheckPic_Claim" alt="reasonForRequest_CBox_ClaimReopened" onclick="checkBoxRadio('CheckUncheckPic_Claim', 'reasonForRequest_CBox_ClaimReopened')">&nbsp;Reopen&nbsp;review&nbsp;decision								         	
											</td>										
										</tr>
										<tr>
										    <td colspan="8">&nbsp;</td>
										</tr>
										<tr>
										    <td colspan="8" align="center"><em><font size="1">Claim no(s). and remittance date(s) must be completed.</font></em></td>
										</tr>
										<tr>
										    <td>Claim</td>
										    <td>&nbsp;</td>
										    <td>Date(s)&nbsp;of</td>
										    <td>&nbsp;</td>
										    <td>HCPCS</td>
										    <td>&nbsp;</td>
										    <td>Remittance</td>
										    <td>&nbsp;</td>
										</tr>
										<tr>
										    <td>no(s).</td>
										    <td><input type="Text" name="ClaimNumber_TBox_Line1" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>service</td>
										    <td><input type="Text" name="ClaimDateOfService_TBox_Line1" class="RedeterminationUnderlinedTextbox" size="15" maxlength="12" value=""></td>
										    <td>code(s)</td>
										    <td><input type="Text" name="ClaimHCPCS_TBox_Line1" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>date(s)</td>
										    <td><input type="Text" name="ClaimRemittanceDate_TBox_Line1" class="RedeterminationUnderlinedTextbox" size="15" maxlength="25" value=""></td>
										</tr>
										<tr>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimNumber_TBox_Line2" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimDateOfService_TBox_Line2" class="RedeterminationUnderlinedTextbox" size="15" maxlength="12" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimHCPCS_TBox_Line2" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimRemittanceDate_TBox_Line2" class="RedeterminationUnderlinedTextbox" size="15" maxlength="25" value=""></td>
										</tr>
										<tr>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimNumber_TBox_Line3" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimDateOfService_TBox_Line3" class="RedeterminationUnderlinedTextbox" size="15" maxlength="12" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimHCPCS_TBox_Line3" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimRemittanceDate_TBox_Line3" class="RedeterminationUnderlinedTextbox" size="15" maxlength="25" value=""></td>
										</tr>
										<tr>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimNumber_TBox_Line4" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimDateOfService_TBox_Line4" class="RedeterminationUnderlinedTextbox" size="15" maxlength="12" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimHCPCS_TBox_Line4" class="RedeterminationUnderlinedTextbox" size="20" maxlength="25" value=""></td>
										    <td>&nbsp;</td>
										    <td><input type="Text" name="ClaimRemittanceDate_TBox_Line4" class="RedeterminationUnderlinedTextbox" size="15" maxlength="25" value=""></td>
										</tr>
										<tr>
										    <td colspan="8">&nbsp;</td>
										</tr>
									</table>
								
								</td>							   
							</tr>
							<tr bgcolor="000000">
							    <td colspan="2" align="center"><font color="ffffff" size="2"><strong>Explanation&nbsp;Of&nbsp;Request</strong></font></td>							   
							</tr>
							<tr>
							    <td colspan="8" align="center"><em><font size="1">This&nbsp;section&nbsp;must&nbsp;be&nbsp;completed.</font></em></td>
							</tr>
							<tr>							 
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Text" name="Explanation_TBox_Line1" class="RedeterminationUnderlinedTextbox" size="145" maxlength="200" value=""></td>
							</tr>
							<tr>							 
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Text" name="Explanation_TBox_Line2" class="RedeterminationUnderlinedTextbox" size="145" maxlength="200" value=""></td>
							</tr>
							<tr>							 
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Text" name="Explanation_TBox_Line3" class="RedeterminationUnderlinedTextbox" size="145" maxlength="200" value=""></td>
							</tr>
							<tr>							 
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Text" name="Explanation_TBox_Line4" class="RedeterminationUnderlinedTextbox" size="145" maxlength="200" value=""></td>
							</tr>
							<tr>							 
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Text" name="Explanation_TBox_Line5" class="RedeterminationUnderlinedTextbox" size="145" maxlength="200" value=""></td>
							</tr>
							<tr bgcolor="000000">
							    <td colspan="2" align="center"><font color="ffffff" size="2"><strong>Attachments</strong></font></td>							   
							</tr>	
							<tr>
							    <td colspan="2" align="center">									
									<table cellspacing="2" cellpadding="2" border="0" width="100%">
										<tr>
										    <td colspan="4" align="center"><em><font size="1">Check&nbsp;all&nbsp;that&nbsp;apply.</font></em></td>
										</tr>
										 <input type="Hidden" name="Attachment_CBox_ClaimCopy" value="">
										 <input type="Hidden" name="Attachment_CBox_RemittanceAdviceCopy" value="">
										 <input type="Hidden" name="Attachment_CBox_CMN" value="">
										 <input type="Hidden" name="Attachment_CBox_Medical" value="">		
										 <input type="Hidden" name="Attachment_CBox_PhysicianDocumentation" value="">
										 <input type="Hidden" name="Attachment_CBox_CheckCopies" value="">
										 <input type="Hidden" name="Attachment_CBox_OtherCarrier" value="">
										 <input type="Hidden" name="Attachment_CBox_Other" value="">				
										<tr>
										    <td>											
								                <img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_1" alt="Attachment_CBox_ClaimCopy" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_1', 'Attachment_CBox_ClaimCopy')">&nbsp;Claim&nbsp;copy
											</td>	
											<td>	
												<img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_2" alt="Attachment_CBox_RemittanceAdviceCopy" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_2', 'Attachment_CBox_RemittanceAdviceCopy')">&nbsp;Remittance&nbsp;advice&nbsp;copy
											</td>	
											<td>
											    <img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_3" alt="Attachment_CBox_CMN" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_3', 'Attachment_CBox_CMN')">&nbsp;CMN
											</td>	
											<td>
												<img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_4" alt="Attachment_CBox_Medical" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_4', 'Attachment_CBox_Medical')">&nbsp;Medical					         	
											</td>										
										</tr>
										<tr>
										    <td colspan="3">&nbsp;</td>	
											<td>records</td>										
										</tr>		
										<tr>
										    <td>											
								                <img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_5" alt="Attachment_CBox_PhysicianDocumentation" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_5', 'Attachment_CBox_PhysicianDocumentation')">&nbsp;Physician&nbsp;documentation
											</td>	
											<td>	
												<img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_6" alt="Attachment_CBox_CheckCopies" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_6', 'Attachment_CBox_CheckCopies')">&nbsp;Check&nbsp;copies
											</td>	
											<td>
											    <img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_7" alt="Attachment_CBox_OtherCarrier" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_7', 'Attachment_CBox_OtherCarrier')">&nbsp;Other&nbsp;carrier&nbsp;explanation(s)
											</td>	
											<td>&nbsp;</td>										
										</tr>	
										<tr>										    
											<td colspan="4">
												<img src="images/Checkbox1.gif" name="CheckUncheckPic_Attachment_CBox_8" alt="Attachment_CBox_Other" onclick="checkBoxRadio('CheckUncheckPic_Attachment_CBox_8', 'Attachment_CBox_Other')">&nbsp;Other&nbsp;(explain)&nbsp;<input type="Text" name="OtherExplanation_TBox" class="RedeterminationUnderlinedTextbox" size="120" maxlength="200" value="">
											</td>
																		
										</tr>										
									</table>								
								</td>							   
							</tr>												 
						</table>						
 					</td>
				</tr>	
				
				<tr>
					<td align="right" colspan="2">&nbsp;</td>
				</tr>	
				<tr>
					<td align="right" colspan="2"><hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;"></td>
				</tr>	
				
				<tr>
					<td><strong>Region C DMEPOS Supplier Manual (Winter 2005)</strong></td><td align="right"><strong>14.9</strong></td>
				</tr>	
			</table>	
		</font>			
	</form>
</cfoutput>

<cfsetting showdebugoutput="No">














