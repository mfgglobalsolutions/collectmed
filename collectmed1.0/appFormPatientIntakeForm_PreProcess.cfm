<!---- appFormPatientIntakeForm_PreProcess.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfset clearedStepList = "">
	
	<cfset intakeClearedBy = "">
	<cfset equipmentClearedBy = "">
	<cfset verifyClearedBy = "">
	<cfset physicianClearedBy = "">
	<cfset hcpcClearedBy = "">
	
	<cfset intakeLine = "grey">
	<cfset intakeText = "dkGreyText">
	<cfset intakeSpacer = "ltGrey">
	<cfset intakeDiv = "gtd">															

	<cfset equipmentLine = "grey">
	<cfset equipmentText = "dkGreyText">	
	<cfset equipmentSpacer = "ltGrey">
	<cfset equipmentDiv = "gtd">															

	<cfset verifyLine = "grey">
	<cfset verifyText = "dkGreyText">	
	<cfset verifySpacer = "ltGrey">
	<cfset verifyDiv = "gtd">												

	<cfset physicianLine = "grey">
	<cfset physicianText = "dkGreyText">	
	<cfset physicianSpacer = "ltGrey">
	<cfset physicianDiv = "gtd">													

	<cfset hcpcLine = "grey">
	<cfset hcpcText = "dkGreyText">		
	<cfset hcpcSpacer = "ltGrey">
	<cfset hcpcDiv = "gtd">
	

	
<!-------------------------------------------------------------------------------------->
<!--- Style needed for tables.                                                       --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<style>					
			.spacer {width:1px; font-size:1px; height:1px; line-height:1px;}	
			table.tableIntake {font-family:arial; width:234px; font-size:10px;}
			table.tableIntake tr.title td {color:##ccc; background-color:##F4F4F4;}
			table.tableIntake tr.title .blue {background-color:##DCE3EB;}
			table.tableIntake tr.title .blackText {color:##000000; padding-left:2px;}
			table.tableIntake tr.title .dkGreyText {color:##999; padding-left:2px;}
			table.tableIntake tr.title .ltGrey {background-color:##F4F4F4;}
			table.tableIntake tr.title .grey {background-color:##ccc;}
			table.tableIntake tr.title .gtd {background-color:##ccc;}	
			table.tableIntake .percent {font-size:1px; background-color:##DCE3EB;}
							
			##yellowAlert{
				background-color:ffffcc; 
				display:none; 
				width:540; 
				border:1px solid ccc889; 
				color:616161; 
				padding:10px; 
				margin-bottom:1em; 
			}
			
			.txt11{font-family:Arial,Helvetica,sans-serif;font-size:10px;color:##000000}
			
		</style>	
		
		<script language="JavaScript">
			
			function alertSubmission(){
				var confirmChanges = confirm("I have read the statement above and verify that I want to create a new Intake.");			
				if(confirmChanges){	
					document.subInt.submitIntake.disabled = false;
				}
				else{
					document.subInt.verifySubmit.checked = false;		
				};
			};
		
		</script>
	
	</cfoutput>
	
		



<!-------------------------------------------------------------------------------------->
<!--- Create the form that will be pushed forward to the process page after          --->
<!--- verification by the user.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form name="PatientIntakeForm" action="appFormPatientIntakeForm_Process.cfm" method="post">			
			<cf_gcEmbedFields>
		</form>
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Find out if this patient already has an intake in the system.                  --->
<!-------------------------------------------------------------------------------------->
	<cfif (NOT IsDefined("form.patientID") OR NOT IsNumeric(form.patientID)) AND IsDefined("form.patientDOBMM") AND IsNumeric(form.patientDOBMM)>
		<cfset DOB = CreateDateTime(trim(form.patientDOBYY), trim(form.patientDOBMM), trim(form.patientDOBDD), 0, 0, 0)>			
	</cfif>	
	
	
	
	<cfquery name="getPatientIntakes" datasource="#request.datasource#">
		SELECT i.IntakeID,i.AssignedToUserID,i.hidden_Step,hidden_UsersID, i.orderingPhysicianFNameTBox, i.orderingPhysicianLNameTBox, i.orderingPhysicianPhoneTBox, i.DateCreated, 
		e.LName AS patientLNameTBox, e.FName AS patientFNameTBox,		
		ih.*
		FROM intake i 
		INNER JOIN intakehcpc ih ON i.intakeID = ih.IntakeID
		LEFT JOIN patient p ON i.PatientID = p.PatientID
		LEFT JOIN entity e ON e.EntityID = p.EntityID
		LEFT JOIN address a ON a.AddressID = i.patientAddressID		
		WHERE 
		<cfif NOT IsDefined("form.patientID") OR NOT IsNumeric(form.patientID)> 
			e.LName = '#form.PatientLNameTBox#' 
			AND e.FName = '#form.PatientFNameTBox#'
		<cfelse>
			i.PatientID = #form.patientID#	
		</cfif> 
		<cfif IsDefined("DOB") AND IsDate(DOB)> AND e.DOB BETWEEN '#DateFormat(trim(DOB), "YYYY-MM-DD")#' AND '#DateFormat(trim(DOB), "YYYY-MM-DD")# 23:59:59.997'</cfif>						
		AND i.ClosingInvoiceNumber IS NULL <!--- we only want to make sure we check the intakes that are active if they have a closing number then they are closed. --->
		<cfif IsDefined("form.IntakeId") AND IsNumeric(form.IntakeID)>
			AND i.IntakeID NOT IN(#trim(form.IntakeID)#)
		</cfif> 
	</cfquery>	


	
<!-------------------------------------------------------------------------------------->
<!--- This means the patient is not in the dB so go ahead and let thru.              --->
<!-------------------------------------------------------------------------------------->	
	<cfif getPatientIntakes.RecordCount LT 1>				
		<cfoutput>				
			<script language="JavaScript">
				PatientIntakeForm.submit();
			</script>
		</cfoutput>			
	</cfif>
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the patient has records we must display them and ask the agent if they      --->
<!--- want to go forward.                                                            --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>			
		<br><div align="center">
			<table cellspacing="2" cellpadding="2" border="0">
				<tr>
				    <td>
						<font face="Verdana" size="3" color="FF0000">
							The intake you are submitting already exists in the system. 
							If you are making a change please click on the intake id below and make the changes directly.
							<br><br>
							If you feel that your submission is not a duplicate click on the "Submit Intake" button below to continue creating a new intake.
						</font>
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>
		</div>						
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Loop the query that shows the patient intakes.                                 --->
<!-------------------------------------------------------------------------------------->	
	<cfloop query="getPatientIntakes">
		
		<cfset clearedStepList = "">
		
		<!---SELECT IntakeID,AssignedToUserID,hidden_Step,hidden_UsersID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,orderingPhysicianFNameTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,DateCreated
		--->		
		
		<cfloop list="#trim(hidden_Step)#" index="i" delimiters="~">
								
			<cfset stepNumber = ListGetAt(i, 1, "|")>								
			
			<cfset clearedStepList = ListAppend(clearedStepList, stepNumber)> 
			
			<cfif stepNumber EQ 1>
				<cfset intakeClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset intakeLine = "blue">
				<cfset intakeText = "blackText">
				<cfset intakeSpacer = "grey">
				<cfset intakeDiv = "percent">
			<cfelseif stepNumber EQ 2>
				<cfset equipmentClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset equipmentLine = "blue">
				<cfset equipmentText = "blackText">
				<cfset equipmentSpacer = "grey">
				<cfset equipmentDiv = "percent">
			<cfelseif stepNumber EQ 3>
				<cfset verifyClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset verifyLine = "blue">
				<cfset verifyText = "blackText">
				<cfset verifySpacer = "grey">
				<cfset verifyDiv = "percent">
			<cfelseif stepNumber EQ 4>
				<cfset physicianClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset physicianLine = "blue">
				<cfset physicianText = "blackText">
				<cfset physicianSpacer = "grey">
				<cfset physicianDiv = "percent">
			<cfelseif stepNumber EQ 5>									
				<cfset hcpcClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset hcpcLine = "blue">
				<cfset hcpcText = "blackText">
				<cfset hcpcSpacer = "grey">
				<cfset hcpcDiv = "percent">
			</cfif>							
			
		</cfloop>
		
		<cfquery name="getCreatedByName" datasource="#trim(request.datasource)#">
			SELECT CONCAT(FName, ' ', LName) AS creatorFullname 
			FROM view_useraccountparameters 
			WHERE UsersID = #trim(hidden_UsersID)#
		</cfquery>
		
		<cfoutput>
			<table border="0" cellspacing="0" cellpadding="0" width="95%" style="display: block; border: 1px solid; border-color: DCE3EB DCE3EB DCE3EB DCE3EB; padding: 4px; text-align: left;">				
				<tr bgcolor="DCE3EB" style="cursor:hand" onclick="location.href='appPatientIntakeEdit.cfm?intakeID=#trim(intakeID)#'"><td colspan="2" class="SiteLabel"><strong><u>Intake&nbsp;ID:&nbsp;#trim(IntakeID)#</u></strong></td></tr>
				<tr>
					<td class="siteLabel">
						<strong>Created&nbsp;On:</strong>&nbsp;#DateFormat(trim(DateCreated), 'mm/dd/yyyy')#&nbsp;#TimeFormat(trim(DateCreated), 'h:mm:ss tt')#
						<br>
						<strong>Created&nbsp;by:</strong>&nbsp;#trim(getCreatedByName.CreatorFullName)#
						<br>
						<strong>Patient&nbsp;Name:</strong>&nbsp;#REQUEST.capitalizeEveryFirstLetter(trim(PatientFNameTBox))#&nbsp;#REQUEST.capitalizeEveryFirstLetter(trim(PatientLNameTBox))#
						<br>
						<strong>Ordering Physician:</strong> Dr. #REQUEST.capitalizeEveryFirstLetter(trim(orderingPhysicianFNameTBox))# #REQUEST.capitalizeEveryFirstLetter(trim(orderingPhysicianLNameTBox))#&nbsp;&nbsp;&nbsp;Phone: #request.formatPhoneUS(trim(orderingPhysicianPhoneTBox))#	
					</td>
					<td nowrap align="right">
				
						<table border="0" cellspacing="0" cellpadding="0" class="tableIntake" width="100%">
							<tr>
								<td align="right" style="padding-top:10px;padding-right:15px;">
									<table border="0" cellspacing="0" cellpadding="0" class="tableIntake">
										<tr class="title">											
											
											<td class="#trim(intakeLine)#"><div class="spacer">&nbsp;</div></td>
											<td class="#trim(intakeText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when an initial intake entry is submitted to be saved.');" onmouseout="hideTip(this);">Intake</span>&nbsp;</td>												
											
											<td class="#trim(equipmentLine)#"><div class="spacer">&nbsp;</div></td>
											<td class="#trim(equipmentText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when pateint has been asked of prior equipment and prior equipment fields are completed as necessary.');" onmouseout="hideTip(this);">Equipment</span>&nbsp;</td>
											
											<td class="#trim(verifyLine)#"><div class="spacer">&nbsp;</div></td>
											<td class="#trim(verifyText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when insurance has been verified.');" onmouseout="hideTip(this);">Verify</span>&nbsp;</td>
											
											<td class="#trim(physicianLine)#"><div class="spacer">&nbsp;</div></td>
											<td class="#trim(physicianText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when the patient\'s doctor has been contacted to complete a Certificate of Medical Necessity.');" onmouseout="hideTip(this);">Physician</span>&nbsp;</td>									
											
											<td class="#trim(hcpcLine)#"><div class="spacer">&nbsp;</div></td>
											<td class="#trim(hcpcText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when the accurate HCPC codes have been entered for each procedure.');" onmouseout="hideTip(this);">HCPC</span>&nbsp;</td>														
											
										</tr>
										<tr class="title">
											
											<td class="#trim(intakeSpacer)#"><div class="spacer">&nbsp;</div></td>
											<td><div style="width:100%; height:13px;" class="#trim(intakeDiv)#" <cfif trim(intakeClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(intakeClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
											
											<td class="#trim(equipmentSpacer)#"><div class="spacer">&nbsp;</div></td>
											<td><div style="width:100%; height:13px;" class="#trim(equipmentDiv)#" <cfif trim(equipmentClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(equipmentClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
																							
											<td class="#trim(verifySpacer)#"><div class="spacer">&nbsp;</div></td>
											<td><div style="width:100%; height:13px;" class="#trim(verifyDiv)#" <cfif trim(verifyClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(verifyClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>		
											
											<td class="#trim(physicianSpacer)#"><div class="spacer">&nbsp;</div></td>
											<td><div style="width:100%; height:13px;" class="#trim(physicianDiv)#" <cfif trim(physicianClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(physicianClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
											
											<td class="#trim(hcpcSpacer)#"><div class="spacer">&nbsp;</div></td>
											<td><div style="width:100%; height:13px;" class="#trim(hcpcDiv)#" <cfif trim(hcpcClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(hcpcClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
																							
										</tr>										
										
									</table>
								</td>
							</tr>
						</table>	
						
					</td>
				</tr>
				<tr>
					<td colspan="2" nowrap align="center">
						
						<table cellspacing="0" cellpadding="0" border="0" style="display: block; border: 1px solid; border-color: DCE3EB DCE3EB DCE3EB DCE3EB; padding: 4px; text-align: left;">
							<tr>
							    <td colspan="3" bgcolor="DCE3EB" class="sitelabel">Requested Equipment</td>
							</tr>
							<tr>
							    <td class="sitelabel" style="display: block; border: 1px solid; border-color: ffffff DCE3EB DCE3EB ffffff;">Code</td>
							    <td class="sitelabel" style="display: block; border: 1px solid; border-color: ffffff DCE3EB DCE3EB ffffff;">Qty</td>
							    <td class="sitelabel" style="display: block; border: 1px solid; border-color: ffffff ffffff DCE3EB ffffff;">Product</td>
							</tr>
							
							<cfloop from="1" to="10" index="i">
								<cfset code = "hcpcCode#trim(i)#TBox">
								<cfset qty = "hcpcQty#trim(i)#TBox">
								<cfset product = "hcpcProduct#trim(i)#TBox">
								<cfif evaluate(product) NEQ "">
									<tr>
									    <td class="sitelabel" style="display: block; border: 1px solid; border-color: ffffff DCE3EB DCE3EB ffffff;">#evaluate(code)#&nbsp;</td>
									    <td class="sitelabel" align="center" style="display: block; border: 1px solid; border-color: ffffff DCE3EB DCE3EB ffffff;">#evaluate(qty)#&nbsp;</td>
									    <td class="sitelabel" style="display: block; border: 1px solid; border-color: ffffff ffffff DCE3EB ffffff;">#evaluate(product)#&nbsp;</td>
									</tr>
								</cfif>
							</cfloop>					
							
						</table>
												
					</td>
				</tr>		
				<tr>
					<td colspan="2" nowrap align="center"><br></td>
				</tr>				
			</table><br>	
		</cfoutput>		
		
	</cfloop>

	<cfoutput>
		<form name="subInt"> 
			<table align="center">		
				<tr>
					<td colspan="2" nowrap align="center"><span class="siteLabel">(Click checkbox to submit)</span>&nbsp;<input type="Checkbox" name="verifySubmit" onclick="alertSubmission();">&nbsp;&nbsp;<input disabled type="Button" class="siteSubmitBox" name="submitIntake" value="Submit Intake" onclick="javascript:PatientIntakeForm.submit();">&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" onclick="history.back()" class="siteSubmitBox"></td>
				</tr>			
			</table>	
		</form>
	</cfoutput>


