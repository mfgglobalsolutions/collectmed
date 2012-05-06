<!---- appClaimEdit.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.claimID" default="">
	<cfset claimID = attributes.claimID>
	
	<cfif IsDefined("form.claimID") AND form.claimID NEQ "">
		<cfset claimID = form.claimID>
	<cfelseif IsDefined("url.claimID") AND url.claimID NEQ "">
		<cfset claimID = url.claimID>	
	</cfif>
	
	<cfparam name="attributes.formName" default="updateClaim">
	<cfset formName = attributes.formName>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the ClaimID parameters.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cftry>
		
		<cfset request.thisClaim = CreateObject("component","com.common.Claim")>	
		<cfset request.thisClaim.Init(trim(claimID))>	
		
		<cfcatch type="Any">
			<cf_gcGeneralErrorTemplate
				message="There was an issue processing the page. If you continue to see this message please contact your site administrator. <p>Claim ID: 2</p><p> Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">
			<cfabort>
		</cfcatch>
		
	</cftry>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
	
		<script language="JavaScript">
			
			function validateForm(){
				
				///checks go here.
				
				
				var confirmChanges = confirm("Are you sure you want to save these changes?");
			
				if(confirmChanges){	
					return true;
				}
				else{
					return false;				
				};
					
			};			
			
			function showNoteIFrame(ProcedureID, NoteID, required){			
				eval('tr'+ProcedureID).style.display='inline';					 
				eval('td'+ProcedureID).innerHTML='<iframe src=appLoading.cfm?GoToPage=appProcedureNote.cfm?reloadp=yes%26clientID=#trim(session.clientID)#%26objectid=6%26noteid='+NoteID +'%26noteRequired='+required +'%26trtdID='+ProcedureID +'%26instanceID='+ProcedureID +'  width=100% height=150 scrolling=auto>Frame Missing</iframe>';
			};
			
			function checkClose(val, ProcedureID, NoteID, required){
				if(eval('document.#trim(formName)#.HIDDEN_CloseProc_'+ val + '.value') == 0){
					var thisCheckbox = 'document.#trim(formName)#.Checkbox_CloseProc_' + val;											
					eval(thisCheckbox).checked = false;
					alert("In order to Close this procedure you must add a note to it.");
					showNoteIFrame(ProcedureID, NoteID, required);
				};															
			};	
			
			function createReminder(){
				reminder=window.open('appReminder.cfm?objectid=5&instanceid=#trim(claimID)#', 'reminder', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=330,height=295'); reminder.focus(0);
			};	
			
			
			function createViewNotes(){
				claimnote=window.open('appClaimNote.cfm?objectid=5&instanceid=#trim(claimID)#', 'claimnote', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=600,height=350'); claimnote.focus(0);
			};	
										
		</script>	
		
		<style>	
		
			table.EOBList {
				border-collapse: collapse;
				font: x-small verdana, helvetica, sans-serif;
				margin: 10px;
			}
			table.EOBList caption {
				background-color: ##DCE3EB;
				color: ##003399;
				font-weight: bold;
				padding: 3px 10px 3px 10px;				
			}
			table.EOBList td {
				border: 1px solid ##DCE3EB;
				font-size: 90%;
				padding: 2px 10px 1px 5px;				
				vertical-align: top;				
			}
			table.EOBList th {
				border: 1px solid ##DCE3EB;
				color: ##606060;
				font-weight: normal;
				padding: 2px 10px 1px 5px;				
			}
			
			.EOBclaimTableBody TABLE{
			    font-size: 1em; 
			}
			.EOBclaimTableBody A:link, .EOBclaimTableBody A:visited{
			    color:##003399;
			    text-decoration:underline; 
			}
			.EOBclaimTableBody A:hover{
			    color:red;
			    text-decoration:none; 
			}
			.EOBclaimTableBody th{
			    font-weight:bold; 
			}
			.EOBclaimTableBody td {
			    font-size: 8pt; 
			    font-family: verdana, arial, helvetica, sans-serif; 
			}
			
		</style>
		
	</cfoutput>
	
	
	
<!---------------------------------------------------------------------------------------->
<!--- Get all the Procedures for this Claim and put them in the query to loop through. --->
<!---------------------------------------------------------------------------------------->			
	<cfquery name="getProcedureCodes" datasource="#trim(request.datasource)#">
		SELECT cp.ProcedureID, cp.ProcedureCode, cp.ServiceDateFrom, cp.ServiceDateTo, cp.BilledQuantity, cp.BilledAmount, cp.PaidQuantity, cp.PaidAmount, pc.TOSCode, pc.Code, pc.Description, pc.TMRMPayable, pc.TotalRVUs, pc.ConversionFactor, pc.AccessBasedOrMaxFee, pc.NoteCode, IFNULL(n.noteID, 0) AS noteID							
		FROM [Procedure] cp
		LEFT JOIN pa_master.EOB_ProcedureCode pc ON cp.ProcedureCode = pc.RecordID
		LEFT JOIN Note n ON cp.ProcedureID = n.instanceID AND n.objectID = 6
		WHERE cp.ClaimID = #trim(ClaimID)#		
	</cfquery>							
	
		
	<cfset qShowCodes = querynew("ProcedureID,Type,Code,Description")>
					
	<cfloop query="getProcedureCodes">
																									
		<!---Query for information on the EOB codes--->						
		<cfquery name="getEOBCodes" datasource="#trim(request.datasource)#">
			SELECT cp.ProcedureID, ce.EOBCode, eob.Code, eob.Description
			FROM [Procedure] cp
			LEFT JOIN ProcedureEOBCode ce ON cp.ProcedureID = ce.ProcedureID
			LEFT JOIN pa_master.EOB_EOBCode eob ON ce.EOBCode = eob.RecordID
			WHERE cp.ProcedureID = #trim(ProcedureID)#
		</cfquery>
		
		<cfloop query="getEOBCodes">
			<cfif Code NEQ "">
				<cfset newRow  = QueryAddRow(qShowCodes, 1)>
				<cfset temp = QuerySetCell(qShowCodes, "ProcedureID", "#trim(ProcedureID)#", qShowCodes.getRowcount())>
				<cfset temp = QuerySetCell(qShowCodes, "Type", "EOB", qShowCodes.getRowcount())>
				<cfset temp = QuerySetCell(qShowCodes, "Code", "#trim(Code)#", qShowCodes.getRowcount())>
				<cfset temp = QuerySetCell(qShowCodes, "Description", "#trim(Description)#", qShowCodes.getRowcount())>	
			</cfif>
		</cfloop>	
		
		<!---Query for information on the EOPS codes--->						
		<cfquery name="getEOPSCodes" datasource="#trim(request.datasource)#">
			SELECT cp.ProcedureID, ce.EOPSCode, eops.Code, eops.Description
			FROM [Procedure] cp
			LEFT JOIN ProcedureEOPSCode ce ON cp.ProcedureID = ce.ProcedureID
			LEFT JOIN pa_master.EOB_EOPSCode eops ON ce.EOPSCode = eops.RecordID
			WHERE cp.ProcedureID = #trim(ProcedureID)#
		</cfquery>
		
		<cfloop query="getEOPSCodes">
			<cfif Code NEQ "">
				<cfset newRow  = QueryAddRow(qShowCodes, 1)>
				<cfset temp = QuerySetCell(qShowCodes, "ProcedureID", "#trim(ProcedureID)#", qShowCodes.getRowcount())>
				<cfset temp = QuerySetCell(qShowCodes, "Type", "EOPS", qShowCodes.getRowcount())>
				<cfset temp = QuerySetCell(qShowCodes, "Code", "#trim(Code)#", qShowCodes.getRowcount())>
				<cfset temp = QuerySetCell(qShowCodes, "Description", "#trim(Description)#", qShowCodes.getRowcount())>	
			</cfif>
		</cfloop>	
								
	</cfloop>	
		
	<!-------------------------------------------------------------------------------------->
	<!--- We output the qShowCodes query for the DISTINCT codes to show in the legend.   --->
	<!--------------------------------------------------------------------------------------> 		
	<cfset showCodes = "">	
	<cfset codesList = "">	
	
	<cfloop query="qShowCodes">
		<cfif NOT ListFind(codesList, Code)> 
			<cfset showCodes = showCodes & "<tr><td>#trim(Type)#</td><td>#trim(Code)#</td><td>#trim(Description)#</td></tr></cfoutput>">
			<cfset codesList = ListAppend(codesList, Code)>
		</cfif>	
	</cfloop>	
	


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>		
				
		<span width="100%" class="EOBclaimTableBody">
		
			<form name="#trim(formName)#" action="appClaimEdit_Process.cfm" method="post" onsubmit="return validateForm();">
				<input type="Hidden" name="claimID" value="#trim(claimID)#">
										
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="center">
							<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
								<tr><td colspan="6" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">Claim&nbsp;Details</td><td colspan=6 align="right" style="background-color: ##DCE3EB;color: ##003399; padding: 3px 10px 3px 4px;"><span style="cursor:hand" onclick="createViewNotes();"><u>View/Add&nbsp;Claim&nbsp;Notes</u></span>&nbsp;|&nbsp;<span style="cursor:hand" onclick="createReminder();"><u>Reminder</u></span></td></tr>	
								<!---<caption>Claim Details</caption>--->
								<tr>
									<th colspan="2" style="text-align:center;">Service Dates</th>
									<th rowspan="2">TOS</th>
									<th rowspan="2" style="text-align:center;">Proc</th>																
									<th colspan="2" style="text-align:center">Billed</th>
									<th colspan="2" style="text-align:center">Paid</th>
									<th rowspan="2">EOB/EOPS</th>					
									<th rowspan="2">Diag</th>	
									
									<th rowspan="2">Close</th>
									<th rowspan="2"><div align="center">Note</div></th>			
								</tr>
								<tr>
									<th style="text-align:center">From</th>
									<th style="text-align:center">To</th>
									<th style="text-align:center">Qty</th>
									<th style="text-align:right;">Amount</th>
									<th style="text-align:center">Qty</th>
									<th style="text-align:right;">Amount</th>
								</tr>
								
																
								<!---Procedure Codes Loop will go here--->
								<cfloop query="getProcedureCodes">						
									
									<!-------------------------------------------------------------------------------------->
									<!--- Get the OpenCloseures for this Procedure.                                      --->
									<!-------------------------------------------------------------------------------------->									
									<cfquery name="getOpenClose" datasource="#trim(request.Datasource)#">
										SELECT OpenOrClose, UsersID, DateCreated, Note 	
										FROM ProcedureOpenClose  
										WHERE ProcedureID = #trim(ProcedureID)#
										Order BY DateCreated DESC
									</cfquery>
									
									<cfif getOpenClose.RecordCount GTE 1>		
										<cfset showOpenClose = "">								
										<cfloop query="getOpenClose">
											
											<cfquery name="getByAssignmentName" datasource="#trim(request.datasource)#">
												SELECT CONCAT(FName, ' ', LName) AS OpenCloseFullname 
												FROM view_UserAccountParameters 
												WHERE UsersID = #trim(UsersID)#
											</cfquery>
											
											<cfif currentRow EQ 1>	
												<cfset statusOpenedOrClosed = OpenOrClose>
											</cfif>
											<cfif OpenOrClose EQ 0>
												<cfset showOpenClose = showOpenClose & "<strong>Closed By:</strong> " & getByAssignmentName.OpenCloseFullname & " <strong>on</strong> " & DateFormat(DateCreated, 'mm/dd/yyyy') & " " & TimeFormat(DateCreated, 'hh:mm:ss tt')>
											<cfelse>
												<cfset showOpenClose = showOpenClose & "<strong>Re-Opened By:</strong> " & getByAssignmentName.OpenCloseFullname & " <strong>on</strong> " & DateFormat(DateCreated, 'mm/dd/yyyy') & " " & TimeFormat(DateCreated, 'hh:mm:ss tt')>
											</cfif>
											<cfif Note NEQ "">
												<cfset showOpenClose = showOpenClose & "<br> <strong>Note:</strong> " & note>	
											 </cfif>
											 <cfset showOpenClose = showOpenClose & "<p>">	
										</cfloop>										
									<cfelse>										
										<cfset statusOpenedOrClosed = "">
									</cfif>									
									
									
									<cfquery name="getProcCodes" dbtype="query">
										SELECT DISTINCT Code 
										FROM qShowCodes
										WHERE ProcedureID = #trim(ProcedureID)#
									</cfquery>
									
									<cfset codes = valuelist(getProcCodes.Code, ", ")>
									
									<cfif noteID EQ 0>
										<cfset noteRequired = 1>
										<cfset HIDDEN_CloseProc = 0>
									<cfelse>
										<cfset noteRequired = 0>	
										<cfset HIDDEN_CloseProc = 1>										
									</cfif>
									
									<cfset procDescription = "<table border=1 bordercolor=000000 cellpadding=2 cellspacing=0><th class=SiteLabel align=center><strong>TMRM Payable</strong></th><th class=SiteLabel align=center><strong>Total RVUs</strong></th><th class=SiteLabel align=center><strong>Conversion Factor</strong></th><th class=SiteLabel align=center><strong>Access Based Or Max Fee</strong></th><th class=SiteLabel align=center><strong>Note&nbsp;Code</strong></th><tr><td class=SiteLabel align=center>#NumberFormat(trim(TMRMPayable), "_$___.__")#</td><td class=SiteLabel align=center>#NumberFormat(trim(TotalRVUs), "_$___.__")#</td><td class=SiteLabel align=center>#NumberFormat(trim(ConversionFactor), "_$___.__")#</td><td class=SiteLabel align=center>#NumberFormat(trim(AccessBasedOrMaxFee), "_$___.__")#</td><td class=SiteLabel align=center>#trim(NoteCode)#</td></tr><tr><td class=SiteLabel colspan=5><strong>Description:</strong> #trim(Description)#</td></tr></table>">							
									
									<input type="Hidden" name="HIDDEN_CloseProc_#trim(ProcedureID)#" value="#trim(HIDDEN_CloseProc)#">
									<input type="Hidden" name="HIDDEN_State_#trim(ProcedureID)#" value="0">
									<tr>
										<td>#DateFormat(trim(ServiceDateFrom), "MM/DD/YY")#</td>
										<td>#DateFormat(trim(ServiceDateTo), "MM/DD/YY")#</td>
										<td style="text-align:center;">#trim(TOSCode)#</td>
										<td style="text-align:center;"><span class="SiteLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(procDescription)#');" onmouseout="hideTip(this);">#trim(Code)#</span></td>
										<td style="text-align:right;">#trim(BilledQuantity)#</td>
										<td style="text-align:right;">#NumberFormat(trim(BilledAmount), "_$___.__")#</td>
										<td style="text-align:right;">#trim(PaidQuantity)#</td>
										<td style="text-align:right; <cfif trim(PaidAmount) LT trim(BilledAmount)>color: red;</cfif>">#NumberFormat(trim(PaidAmount), "_$___.__")#</td>
										<td style="text-align:center;">#trim(codes)#</td>						
										<td>&nbsp;</td>		
																													
										<td align="center" valign="middle">											
											<div align="center">
												<cfset disabled = "">
												<cfset checked = "">
													
												<cfif (request.thisClaim.getAssignedToUserID() NEQ session.User.getUsersID()) OR (statusOpenedOrClosed EQ 0)>
													<cfset disabled = "disabled">
												</cfif> 
												
												<cfif statusOpenedOrClosed EQ 0>
													<cfset checked = "checked">
												</cfif>	
											
												<cfif statusOpenedOrClosed EQ 0 OR statusOpenedOrClosed EQ 1>
																																			
													<span onmouseover="doTooltip(1, this, event, '#trim(showOpenClose)#');" onmouseout="hideTip(this);">
														<input type="Checkbox" name="Checkbox_CloseProc_#trim(ProcedureID)#" onclick="checkClose(#trim(ProcedureID)#, #trim(ProcedureID)#, #trim(noteID)#, #trim(noteRequired)#);" #trim(disabled)# #trim(checked)#>		
													</span>												
												
												<cfelse>
													
													<input type="Checkbox" name="Checkbox_CloseProc_#trim(ProcedureID)#" onclick="checkClose(#trim(ProcedureID)#, #trim(ProcedureID)#, #trim(noteID)#, #trim(noteRequired)#);" #trim(disabled)# #trim(checked)#>
												
												</cfif>
												
											</div>
										</td>
										<td>
											<span onclick="if (HIDDEN_State_#trim(ProcedureID)#.value==0) {HIDDEN_State_#trim(ProcedureID)#.value=1; showNoteIFrame(#trim(ProcedureID)#, #trim(noteID)#, #trim(noteRequired)#);} else {HIDDEN_State_#trim(ProcedureID)#.value=0; tr#trim(ProcedureID)#.style.display='none';};" class="SiteLabel" style="cursor: hand"><u>Procedure&nbsp;Note</u></span>
										</td>				
									</tr>
									
									<tr id="tr#trim(ProcedureID)#" style="display: 'none';">
										<td colspan="12" id="td#trim(ProcedureID)#" style="cursor: 'hand'; border-bottom: 1px black solid;">&nbsp;</td>			
									</tr>	
									
								</cfloop>
									
								<cfquery name="getQuantities" dbtype="query">
									SELECT SUM(BilledQuantity) AS totalBilledQuantity, SUM(BilledAmount) AS totalBilledAmount, SUM(PaidQuantity) AS totalPaidQuantity, SUM(PaidAmount) AS totalPaidAmount
									FROM getProcedureCodes
								</cfquery>
								
								<!---Totals--->
								<tr>
									<td colspan="5">&nbsp;</td>									
									<td style="text-align:right;">#NumberFormat(trim(getQuantities.totalBilledAmount), "_$___.__")#</td>
									<td style="text-align:right;">&nbsp;</td>
									<td style="text-align:right;<cfif trim(getQuantities.totalPaidAmount) LT trim(getQuantities.totalBilledAmount)>color: red;</cfif>">#NumberFormat(trim(getQuantities.totalPaidAmount), "_$___.__")#</td>
									<td colspan="4">&nbsp;</td>						
								</tr>
								
								
								
								<!---Submit Button--->
								<tr>
									<td colspan="12">&nbsp;</td>
								</tr>					
								<tr>
									<td align="center" colspan="12">			
										<div align="center"><cf_gcSubmitButton value="Save&nbsp;Changes">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close&nbsp;Claim" onclick="self.close();"></div>							
									</td>
								</tr>
											
							</table>
						</td>
					</tr>				
									
					<!---EOB / EOPS Codes--->
					<cfset showCodeDesc = "The following are the descriptions of the EOB (Explanation of Benefits) / EOPS (Explanation of Pending Status) codes that appear on this claim.">
					<tr>
						<td>
							<table class="EOBList" cellpadding="0" cellspacing="0">						
								<caption><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#showCodeDesc#');" onmouseout="hideTip(this);">EOB / EOPS codes messages</span></caption>
								#showCodes#					
							</table>
						</td>
					</tr>		
					
				</table>
				
			</form>
			
		</span>
		
	</cfoutput>




	
	









<!---



									
<cfoutput>						
				#trim(ClaimID)#
				#InterchangeClaimID# 
				#patientLName#
				#patientFName#
				AssignedToUserID() 
				DueDate
				#DateFormat(trim(DateCreated), 'MMM d, yyyy')#">
				#trim(days)#
</cfoutput>
						






<table class="ms-main" cellpadding="0" cellspacing="0" border="0" width="750" height="100%">
    

	  <tr ID="TopRow" > <td valign="top" ID="TopCell" width="100%" colspan="2" class="ms-tztop"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td id="MSOZoneCell_WebPartWPQ4" vAlign="top"><table TOPLEVEL border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td class="EOBclaimTableBorder" valign="top">

<div WebPartID="1780845f9-63d5-490b-8b38-9692cf9eefb8" HasPers="false" id="WebPartWPQ4" width="100%" class="EOBclaimTableBody" allowDelete="false" style="" >


	<table id="claimView">
		<tr>
			<td style="VERTICAL-ALIGN:top">
			<table class="EOBList EOBList-vertical" style="width:95%;">
				<caption>Claim Information</caption>
				<tr>
					<th>Claim ##</th>
					<td style="white-space: nowrap;">					<span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_claimNumber">100 020 020 200533325534390</span></td>
				</tr>
				<tr>
					<th>Previous Claim ##</th>
					<td><a id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_motherClaimLink"></a></td>
				</tr>
				<tr>
					<th>Dates of Service</th>
					<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_claimDatesOfService">11/28/2005 - 11/28/2005</span></td>
				</tr>
				<tr>
					<th>Status</th>
					<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_claimStatus">Paid</span></td>
				</tr>
				<tr>
					<th>Status Date</th>
					<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_claimStatusDate">12/3/2005</span></td>
				</tr>
				<tr>
					<th>EOB / EOPS</th>
					<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_claimEobEops">01147</span></td>
				</tr>
			</table>
			</td>
			
			<td style="VERTICAL-ALIGN:top">
					<table class="EOBList EOBList-vertical" style="width:95%;">
						<caption>Financial Information</caption>
						<tr>
							<th>Billed Amount</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialBilledAmount">$1,872.00</span></td>
						</tr>
						<tr>
							<th>Paid Amount</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialPaidAmount">$780.48</span></td>
						</tr>
						<tr>
							<th>R&amp;S Date</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialPaidDate">12/9/2005</span></td>
						</tr>
						<tr>
							<th>R&amp;S Number</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialRandSNumber">030197743</span></td>
						</tr>
						<tr>
							<th>Check Number</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialCheckNumber">000000025648925</span></td>
						</tr>
					</table>
			</td>
			<!---<td style="VERTICAL-ALIGN:top">
				<table class="EOBList EOBList-vertical" style="width:95%;">
					<caption>Patient Information</caption>
					<tr>
						<th>Medicaid/CSHCN ID</th>
						<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_clientPCN">518454091</span></td>
					</tr>
					<tr>
						<th>Name</th>
						<td style="white-space: nowrap;"><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_clientName">EDWARDS, HEATHER J</span></td>
					</tr>
					<tr>
						<th>Date of Birth</th>
						<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_clientDateOfBirth">5/13/1983</span></td>
					</tr>
					<tr>
						<th>Patient Account ##</th>
						<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_clientPatientAccountNumber">518454091</span></td>
					</tr>
					<tr>
						<th>Medical Record ##</th>
						<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_clientMedicalRecordNumber"></span></td>
					</tr>
				</table>
			</td>--->
		</tr>
		<!---<tr>
			<!---<td style="VERTICAL-ALIGN:top">
					<table class="EOBList EOBList-vertical" style="width:95%;">
						<caption>Financial Information</caption>
						<tr>
							<th>Billed Amount</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialBilledAmount">$1,872.00</span></td>
						</tr>
						<tr>
							<th>Paid Amount</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialPaidAmount">$780.48</span></td>
						</tr>
						<tr>
							<th>R&amp;S Date</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialPaidDate">12/9/2005</span></td>
						</tr>
						<tr>
							<th>R&amp;S Number</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialRandSNumber">030197743</span></td>
						</tr>
						<tr>
							<th>Check Number</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_financialCheckNumber">000000025648925</span></td>
						</tr>
					</table>
			</td>--->
			<!---<td style="VERTICAL-ALIGN:top">
					<table class="EOBList EOBList-vertical" style="width:95%;">
						<caption>Provider Information</caption>
						<tr>
							<th>Billing ID</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_billingProviderID">0114696-01</span></td>
						</tr>
						<tr>
							<th>Billing Name</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_billingProviderName">PHYSICIANS HOME MEDICALEQUPM</span></td>
						</tr>
						<tr>
							<th>Referring ID</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_referringProviderID"></span></td>
						</tr>
						<tr>
							<th>Referring Name</th>
							<td><span id="TopZone_g_780845f9_63d5_490b_8b38_9692cf9eefb8__ctl0_referringProviderName"></span></td>
						</tr>
					</table>
			</td>--->
		</tr>--->	
		
	</table>
	
</div>
</td>
			</tr>
		</table></td>
	</tr>
</table> 
</td> </tr> 
  
 </table>
 --->
 