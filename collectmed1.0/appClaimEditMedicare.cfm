<!---- appClaimEditMedicare.cfm ---->





<!---------------------------------------------------------------------------------------------------->
<!--- IMPORTANT NOTE!!!!!!!                                                                        --->
<!--- ANYTHING DONE TO THIS PAGE MUST ALSO BE PLACED IN THIS PAGE "appClaimEditMedicarePrint.cfm"  --->
<!--- IT IS THE PAGE THAT PRINTS THIS CLAIM.                                                       --->
<!---------------------------------------------------------------------------------------------------->














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
	
	<cfparam name="attributes.interchangeclaimID" default="">
	<cfset interchangeclaimID = attributes.interchangeclaimID>
	
	<cfif IsDefined("form.interchangeclaimID") AND form.interchangeclaimID NEQ "">
		<cfset interchangeclaimID = form.interchangeclaimID>
	<cfelseif IsDefined("url.interchangeclaimID") AND url.interchangeclaimID NEQ "">
		<cfset interchangeclaimID = url.interchangeclaimID>	
	</cfif>
	
	
	<cfparam name="attributes.reset" default="yes">
	<cfset reset = attributes.reset>
	
	<cfif IsDefined("form.reset") AND form.reset NEQ "">
		<cfset reset = form.reset>
	<cfelseif IsDefined("url.reset") AND url.reset NEQ "">
		<cfset reset = url.reset>	
	</cfif>
	
	<cfparam name="attributes.formName" default="updateClaim">
	<cfset formName = attributes.formName>
	
	<cfset allowedTotal = "0.00">
	
	<cfset deductTotal = "0.00">
	
	<cfset coinsTotal = "0.00">
	
	<cfset grprcTotal = "0.00">
	
	<cfset lateFilingFee = "0.00">
	
	<cfset interestAmount = "0.00">
	
	<cfset netAmount = "0.00">
	
	<cfset disable = "disabled">	
	
	<cfset monetaryColumns = "MonetaryAmount3,MonetaryAmount6,MonetaryAmount9,MonetaryAmount12,MonetaryAmount15,MonetaryAmount18">
	
	<cfset firstPlaceModifiers = "NU,RR,UE,KM,KN,AU,AV,AW,KF">
	
	<cfset secondPlaceModifiers = "KJ">
	
		
<!-------------------------------------------------------------------------------------->
<!--- If this variable is available the user has pressed save changes and the        --->
<!--- changes were saved in the processing page redirected here and we must          --->
<!--- refresh the opener window.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<!---
			var thelink = new Object;
			thelink.thelocation = window.opener.location.href;
			alert(thelink.thelocation);
			function reloadMain(){				
				
				var tempOpener = 'window.opener';		
				var loc = window.opener.location.href;
				
				alert(loc);
				
				if (typeof(eval(tempOpener)) != "undefined" && loc == thelink.thelocation){						
					
				};	
			};		
		--->
		<script language="JavaScript">
				
			function reloadMain(){				
				var tempOpener = 'window.opener';		
				if (typeof(eval(tempOpener)) != "undefined"){	
					//window.opener.location.reload();
					window.opener.location.href = window.opener.location.href;
				};		
			}		
			
			<cfif IsDefined("url.relo")>		
				reloadMain();			
			</cfif>		
			
			<cfif IsDefined("url.close")>
				self.close();		
			</cfif>	
				
		</script>	
		
		<style>	
			body{ 
				font-family:arial, helvetica, sans-serif;
				background-color:##FFFFFF;					
			} 
		</style>			
		
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a Claim Object to be used.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfset request.thisClaim = CreateObject("component","com.common.Claim")>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the user has sent in the interchange claimID query for the EOBClaimID.      --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("interchangeclaimID") AND IsNumeric(interchangeclaimID)>
		
		<cfset claimIDQuery = request.thisClaim.getClaimQuery(InterchangeClaimID: trim(InterchangeClaimID), fields: "claimID")>
		<cfset claimID = claimIDQuery.ClaimID>
		
	</cfif>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Get the ClaimID parameters.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cftry>
				
		<cfset request.thisClaim.Init(trim(claimID))>	
		
		<cfcatch type="Any">
			<cf_gcGeneralErrorTemplate
				message="There was an issue processing the page. If you continue to see this message please contact your site administrator. <p>Claim ID: 2</p><p> Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">
			<cfabort>
		</cfcatch>
		
	</cftry>
		
	
		
<!-------------------------------------------------------------------------------------->
<!--- Check to make sure that the user that is attempting to view this claim is      --->
<!--- allowed to. If they are not then log it and log out there account and disable  --->
<!--- them from their account. They will have to call Collect Med Management to get  --->
<!--- the account reinstated.                                                        --->
<!-------------------------------------------------------------------------------------->
	<cfif request.thisClaim.getClientID() NEQ trim(session.ClientID)>
		
		<cfset message="You have attempted to view a claim that does not belong to your organization.<br>Your account has been suspended and your IP Address has been logged. <br><br>Your administrator must contact the Collect Med administrator in order to un-block your account.">
		
		<cfquery name="getAttemptedClient" datasource="#request.datasource#">
			SELECT ClientName 
			FROM pa_master.client
			WHERE ClientID = #request.thisClaim.getClientID()#
		</cfquery>
		
		<cfquery name="UPdateUserAccount" datasource="#request.datasource#">
			UPDATE users
			SET Active = 0
			WHERE UsersID = #session.User.getusersID()#
		</cfquery>	
		
		<cfset adminNote = "<p><strong>Claim ID Attempted:</strong> #trim(ClaimID)#<br><strong>Claim Client Name:</strong> #getAttemptedClient.ClientName#<br><br><strong>Users Client Name:</strong> #trim(session.Client.getClientName())#<br><strong>User ID:</strong> #trim(session.User.getUsersID())#<br><strong>User Name:</strong> #trim(session.Entity.getFName())# #trim(session.Entity.getLName())#<br><strong>IP:</strong> #CGI.REMOTE_ADDR#<br><strong>Date Stamp:</strong> #DateFormat(NOW(), 'mm/dd/yyyy')# #TimeFormat(NOW())#<br></p>">
		
		<cf_gcGatewayLogger datasource="#trim(request.datasource)#" code="115" logtext="#trim(message)#<br>#trim(adminNote)#">				
				
		<cf_gcSendEmail	from="support@eobmanager.net" to="support@eobmanager.net" 
			subject="IMMEDIATE ATTENTION REQUIRED. User attempted to view claim not belonging to Org." 
			message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong>#trim(adminNote)#</p>">	
		
		<cfset temp = StructClear(session)>		
									
		<cf_gcGeneralErrorTemplate
			message="#trim(message)#"
			back="no">				
			
		<cfabort>
		
	</cfif>
	
	
			
<!-------------------------------------------------------------------------------------->
<!--- Set the last opened claim to this one and reset the value in the object.       --->
<!-------------------------------------------------------------------------------------->		
	<cfset session.User.setUsersLastOpenedClaimID(session.user.getUsersID(), claimID)>	
	<cfset session.User.InitUserIO(session.user.getUsersID())>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Find out if this user has viewed this claim if not add the record that they    --->
<!--- have opened it.                                                                --->
<!-------------------------------------------------------------------------------------->		
	<cfif request.thisClaim.ClaimHasBeenViewed(usersID: trim(session.User.getUsersID()), claimID: trim(claimID)) EQ 0>
		<cfset request.thisClaim.updateClaimStatus(claimID, 196, trim(session.user.getUsersID()))>			
	</cfif>	
	
	
		
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
					resetSubmitButtons();
					return false;				
				};
					
			};	
							
						
			function showNoteIFrame(ProcedureID, NoteID, required){			
				eval('tr'+ProcedureID).style.display='inline';					 
				eval('td'+ProcedureID).innerHTML='<iframe src=appLoading.cfm?GoToPage=appProcedureNote.cfm?reloadp=yes%26clientID=#trim(session.clientID)#%26objectid=6%26noteid='+NoteID +'%26noteRequired='+required +'%26trtdID='+ProcedureID +'%26instanceID='+ProcedureID +'  width=100% height=150 scrolling=auto>Frame Missing</iframe>';
			};
			
			function checkComplete(val, ProcedureID, NoteID, required){
				if(eval('document.#trim(formName)#.HIDDEN_CloseProc_'+ val + '.value') == 0){
					var thisCheckbox = 'document.#trim(formName)#.Checkbox_CloseProc_' + val;											
					eval(thisCheckbox).checked = false;
					alert("In order to mark this procedure as \"Complete\" you must Add and Save a note to it.");
					showNoteIFrame(ProcedureID, NoteID, required);
				};																			
			};	
						
			
			function allowClaimCheckComplete(procLists){					
				var procArray = procLists.split(",");	
				var eligible = true;	
				for ( i=0; i<procArray.length; i++){					
					var thisCheckbox = document.getElementById('Checkbox_CloseProc_'+procArray[i]);						
					if(thisCheckbox.checked == false){
						eligible = false;
					}						  
				}
		
				if(eligible){
					markAsVerbage.style.color = '000000'; 
					document.#formName#.completeCheck.disabled = false;
				}
				else{		
					document.#formName#.completeCheck.checked = false;
					markAsVerbage.style.color = 'c0c0c0'; 
					document.#formName#.completeCheck.disabled = true;
				}
				
			};	
								
			function createTask(){				
				leftVal = (screen.width - 640) / 2;
				topVal = (screen.height - 425) / 2;				
				assign=window.open('appTaskCreate.cfm?objectid=5&instanceid=#trim(claimID)#','create','dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=425,left='+leftVal+',top='+topVal);
			};	
			
			function createReminder(){
				leftVal = (screen.width - 330) / 2;
				topVal = (screen.height - 295) / 2;
				reminder=window.open('appReminder.cfm?objectid=5&instanceid=#trim(claimID)#', 'reminder', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=415,height=295,left='+leftVal+',top='+topVal); reminder.focus(0);
			};	
						
			function createViewNotes(){
				leftVal = (screen.width - 600) / 2;
				topVal = (screen.height - 350) / 2;
				claimnote=window.open('appClaimNote.cfm?objectid=5&instanceid=#trim(claimID)#', 'claimnote', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=600,height=350,left='+leftVal+',top='+topVal); claimnote.focus(0);
			};	
				
			function printClaim(){						
				launchPrintPage('appClaimEditMedicarePrint.cfm?claimid=#trim(claimID)#');
			};	
			
			function launchPrintPage(linkToGoTo){			
				<!-------------------------------------------------------------------------------------->
				<!--- Issue with multiple windows for login is right here. while this script will    --->
				<!--- work fine it opens another window while the is two other windows open. when    --->
				<!--- you get back to this script all windows should probably close and only the     --->
				<!--- login window stay open. Quasi fixed 3/1/06 GC COPIED FROM appHeader.cfm        --->
				<!-------------------------------------------------------------------------------------->				
				var rand_no = Math.floor(Math.random()*101)
				var winName = 'loginwindow_' + rand_no;  			
				f_open_printwindow_max(linkToGoTo, winName);
			};
			
			function f_open_printwindow_max(aURL, aWinName){
			   var wOpen;
			   var sOptions;			   		
			   sOptions = 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#,left=0,top=0';
			   wOpen = window.open( '', aWinName, sOptions );
			   wOpen.location = aURL;
			   wOpen.focus();			  
			   return wOpen;
			}
								
									
			function markAsComplete(){
								
				/*var confirmChanges = confirm("Are you sure you want to mark this claim as \"Completed\" ?\n\nNOTE: If you choose not to mark this claim as \"Completed\" it will automatically be marked during System-Maintenance tonight.\n\n");
			
				if(confirmChanges){	*/
					return true;
				/*}
				else{
					document.#formname#.completeCheck.checked = false;
					return false;				
				};*/
					
			};	
			
			function assignClaim(claimid,reassign){
				assign=window.open('appClaimAssign.cfm?claimid='+claimid+'&reassign='+reassign,'assign','top=15,left=15,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=340,height=295'); assign.focus(0);
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
				/*vertical-align: top;	*/			
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
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Get the information on this specific patient.                                  --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getClaimDetails" datasource="#trim(request.datasource)#">
		SELECT i.LXAssignedNumber, c.ClaimID, c.InterchangeClaimID, c.InterchangeID, c.clientAssignedClaimID, c.claimType, c.EntityID, 
		c.PatientResponsibilityAmount, c.claimpreviousPaidAmount, c.InterchangeID, c.assignedToUserID, c.Active, c.InactiveCode, c.DateCreated, 
		c.DueDate, c.FacilityCode, c.CrossoverNameLastorOrganizationName3, 		
		u.usersID, e.FName As userFName, e.LName AS userLName, TIMESTAMPDIFF(day, c.DateCreated, now()) AS days, 
		p.PatientID, patientEntity.FName AS patientFName, patientEntity.LName AS patientLName, c.HICNumber
		FROM claim c 
		LEFT JOIN pa_master.Users u ON c.AssignedToUserID = u.UsersID 
		LEFT JOIN Entity e ON u.EntityID = e.EntityID
		LEFT JOIN [Procedure] cp ON c.ClaimID = cp.ClaimID
		LEFT JOIN Entity patientEntity ON c.entityID = patientEntity.EntityID				
		LEFT JOIN Patient p ON c.entityID = p.EntityID
		LEFT JOIN Interchange i ON c.InterchangeID = i.InterchangeID						
		WHERE c.ClientID = #trim(session.ClientID)# AND c.Active = 1 AND c.claimID = #trim(claimID)#
	</cfquery>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the Claim MOA information.                                                 --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getMOA" datasource="#trim(request.datasource)#">
		SELECT e.Code AS MOACode, e.Description AS MOADescription
		FROM claim_medicare_moa cmm INNER JOIN pa_master.eob_medicare_remittanceadviceremarkcode e ON cmm.MOACode = e.RecordID
		WHERE cmm.ClaimID = #trim(claimID)# AND cmm.MOACode IS NOT NULL
		ORDER BY cmm.DateCreated ASC
	</cfquery>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Gather all the interest fees charged for this claim.                           --->
<!-------------------------------------------------------------------------------------->																		
	<cfquery name="getClaimInterestAmount" datasource="#trim(request.datasource)#">
		SELECT s.ItemNameDisplay, c.* 
		FROM claim_medicare_supplemental_amount c INNER JOIN pa_master.standardlistitem s ON c.QualifierCode = s.StandardListItemID
		WHERE c.QualifierCode = 158 AND c.ClaimID = #trim(claimID)#
	</cfquery>
	
	<cfif getClaimInterestAmount.Recordcount GTE 1>
		<cfloop query="getClaimInterestAmount">
			<cfset interestAmount = interestAmount + getClaimInterestAmount.MonetaryAmount2>
		</cfloop>
	</cfif>	

	
	
<!---------------------------------------------------------------------------------------->
<!--- Get all the Procedures for this Claim and put them in the query to loop through. --->
<!---------------------------------------------------------------------------------------->			
	<cfquery name="getProcedures" datasource="#trim(request.datasource)#">
		SELECT cp.ProcedureID, cp.ProcedureCode, cp.PriorProcedureCode, cp.ServiceDateFrom, cp.ServiceDateTo, cp.BilledQuantity, cp.BilledAmount, 
		cp.PaidQuantity, cp.PaidAmount, 
		pc.HCPC, pc.LongDescription, pc.ShortDescription,  
		IFNULL(n.noteID, 0) AS noteID							
		FROM [procedure] cp
		LEFT JOIN pa_master.EOB_MEDICARE_PROCEDURECode pc ON cp.ProcedureCode = pc.RecordID
		LEFT JOIN Note n ON cp.ProcedureID = n.instanceID AND n.objectID = 6
		WHERE cp.ClaimID = #trim(ClaimID)#		
	</cfquery>							
	
	<cfquery name="getClaimProceduresTotals" datasource="#trim(request.datasource)#">
		SELECT SUM(BilledAmount) AS ClaimTotalBilled, SUM(PaidAmount) AS ClaimTotalPaid					
		FROM [procedure] 
		WHERE ClaimID = #trim(ClaimID)#		
	</cfquery>	
	
	
	
<!--------------------------------------------------------------------------------------->
<!--- when you have the procedures for this claim we need to valuelist them to check  --->
<!--- against the eligibility to claose this cliam. This list will be sent to a       --->
<!--- javascript function to check all procs have been closed to send to close.       --->
<!--------------------------------------------------------------------------------------->	
	<cfset proceduresList = valueList(getProcedures.ProcedureID)>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the patient information.                                                    --->
<!-------------------------------------------------------------------------------------->							
	<cfset request.Patient = CreateObject("component", "com.common.Patient").init(getClaimDetails.PatientID)>
	<cfset request.Entity = CreateObject("component", "com.common.db.EntityIO").init(request.Patient.getEntityID())>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create an Interchange Object.                                                  --->
<!-------------------------------------------------------------------------------------->	
	<cfset request.Interchange = CreateObject("component", "com.common.Interchange").init(getClaimDetails.InterchangeID)>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
			
		<table>
			<tr>
				<td valign="top">		
					<span width="100%" class="EOBclaimTableBody">	
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="center">	
									
									<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
										<tr><td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">Patient&nbsp;Details</td></tr>	
										<tr>
											<td><span class="sitelabel">Patient&nbsp;Name:</span></td>	
											<cfset top = (session.screenHeight - 480) / 2>
											<cfset left = (session.screenWidth - 900) / 2>
											<cfset patientOnclick = "editPatient=window.open('appPatient.cfm?patientid=#trim(getClaimDetails.patientID)#','editPatient','top=15,left=0,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#'); editPatient.focus(0);"> 
											<td><span class="sitelabel" style="cursor:hand" onclick="#patientOnclick#"><u>#trim(getClaimDetails.patientLname)#, #trim(getClaimDetails.patientFname)#</u></span></td>							
										</tr>	
										<tr>
											<td><span class="sitelabel">DOB:</span></td>	
											<td><span class="sitelabel">#DateFormat(trim(request.Entity.getDOB()), 'mm/dd/yyyy')#</span></td>							
										</tr>		
																				
										<cfset InsQuery = request.patient.getPatientInsCom(request.Patient.getPatientID())> 
										<cfset request.InsuranceCompany = CreateObject("component", "com.common.db.InsuranceCompanyIO")>	
										
										<tr>
											<td valign="top"><span class="sitelabel">Insurance&nbsp;<cfif InsQuery.RecordCount GT 1>Companies<cfelse>Company</cfif>:</span></td>	
											<td>
												
												<table cellspacing="0" cellpadding="0" border="0">
													<cfloop query="InsQuery">		
														<cfset getInsuranceCompanyName = request.InsuranceCompany.getInsuranceCompanyQuery(fields: "InsuranceCompanyName", InsuranceCompanyID: InsuranceCompanyID)>
														<tr>
														    <td nowrap style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;"><span class="sitelabel">#currentRow#) #getInsuranceCompanyName.InsuranceCompanyName#</span></td>
														</tr>
													</cfloop>														
												</table>

											</td>							
										</tr>																				
									</table>
																						
								</td>
							</tr>					
						</table>				
					</span>
				</td>
				
				
				
				<!---Show Claim Assignments--->
				<cfquery name="getAssignments" datasource="#trim(request.datasource)#">
					SELECT ca.UserID, ca.AssignorID, ca.DateCreated AS AssignmentDateCreated, ca.Note, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname 
					FROM claimassignment ca 
					JOIN view_UserAccountParameters vuap ON ca.UserID = vuap.UsersID
					WHERE ca.ClaimID = #trim(request.thisClaim.getClaimID())#
					ORDER BY ca.DateCreated DESC
				</cfquery>
				
				<cfset showAssignments = "">
				
				<cfloop query="getAssignments">
					
					<cfquery name="getByAssignmentName" datasource="#trim(request.datasource)#">
						SELECT CONCAT(FName, ' ', LName) AS AssignorFullname 
						FROM view_useraccountparameters 
						WHERE UsersID = #trim(AssignorID)#
					</cfquery>
					
					<cfset showAssignments = showAssignments & "<strong>Assigned to:</strong> " & Fullname & " <strong>by</strong> " & getByAssignmentName.AssignorFullname & " <strong>on</strong> " & DateFormat(AssignmentDateCreated, 'm/d/yy') & " " & TimeFormat(AssignmentDateCreated, 'hh:mm:ss tt') & "<br> <strong>Note:</strong> " & note & "<p>">
				
				</cfloop>
				
				<td valign="top">		
					<span width="100%" class="EOBclaimTableBody">	
						<table cellpadding="0" cellspacing="0" border="0" align="right">
							<tr>
								<td align="center">	
									
									<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
										<tr><td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">EOB&nbsp;Claim&nbsp;Assignment</td></tr>	
										<cfset showAssignments = Replace(showAssignments, "'", "\'", "ALL")>
										<tr>
											<td><span class="sitelabel">Assigend&nbsp;To:</span></td>	
											<td class="sitelabel"><cfif trim(request.thisClaim.getAssignedToUserID()) EQ ""><font color="990000"><span style="cursor: hand;" onclick="assignClaim(#ClaimID#,0);"><u>Unassigned</u></span></font><cfelse><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, ' <span style=cursor:hand onclick=assignClaim(#trim(ClaimID)#,1);><u><strong>Re-Assign Claim</strong></u></span><p>#showAssignments#');" onmouseout="hideTip(this);">#LEFT(trim(getClaimDetails.userFName), 1)#<cfif getClaimDetails.userLName NEQ "">.</cfif> #trim(getClaimDetails.userLName)#</span></cfif></td>							
										</tr>	
										<tr>
											<td><span class="sitelabel">Re-Assign:</span></td>	
											<td nowrap><span class="sitelabel" style=cursor:hand onclick=assignClaim(#trim(ClaimID)#,1);><u><strong>Re-Assign&nbsp;Claim</strong></u></span></td>							
										</tr>		
																				
									</table>
																						
								</td>
							</tr>					
						</table>				
					</span>
				</td>
				
				
				<!------>
				
				
				
				<td valign="top">		
					<span width="100%" class="EOBclaimTableBody">	
						<table cellpadding="0" cellspacing="0" border="0" align="right">
							<tr>
								<td align="center">	
									
									<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
										<tr><td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">EOB&nbsp;Report&nbsp;Details</td></tr>	
										<tr>
											<td><span class="sitelabel">Provider&nbsp;##:</span></td>	
											<td><span class="sitelabel">#trim(request.thisClaim.GetProviderID())#</span></td>							
										</tr>	
										<tr>
											<td><span class="sitelabel">Date:</span></td>	
											<td><span class="sitelabel">#DateFormat(trim(request.Interchange.getInterchangeDate()), 'mm/dd/yy')#</span></td>							
										</tr>		
										<tr>
											<td><span class="sitelabel">Check/EFT&nbsp;##:</span></td>	
											<td><span class="sitelabel">#trim(request.Interchange.getReassociationTraceNumber())#</span></td>							
										</tr>											
									</table>
																						
								</td>
							</tr>					
						</table>				
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="3" valign="top">
				
					<span width="100%" class="EOBclaimTableBody">
					
						<form name="#trim(formName)#" action="appClaimEditMedicare_Process.cfm" method="post" onsubmit="return validateForm();">
							<input type="Hidden" name="claimID" value="#trim(claimID)#">
													
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="center">							
										<!------>
										<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
											<cfinvoke component="com.common.note" method="getNumberOfNotes" clientID="#trim(session.ClientID)#" objectID="5" instanceID="#trim(claimID)#" returnvariable="numOfNotes">  
											<tr><td colspan="6" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">Claim&nbsp;Details</td><td colspan="9" align="right" style="background-color: ##DCE3EB;color: ##003399; padding: 3px 10px 3px 4px;"><span style="cursor:hand;" onclick="createTask();"><u>Create&nbsp;Task</u></span>&nbsp;|&nbsp;<span style="cursor:hand" onclick="createViewNotes();"><u>View/Add&nbsp;Claim&nbsp;Notes</u>&nbsp;(#trim(numOfNotes)#)</span>&nbsp;|&nbsp;<span style="cursor:hand" onclick="createReminder();"><u>Create&nbsp;Reminder</u></span></td></tr>	
											
											
											<tr>
												<td><span class="xsm"><u>PERF&nbsp;PROV</u></span></td>
												<td><span class="xsm"><u>SERV&nbsp;DATE</u></span></td>
												<td><span class="xsm"><u>POS</u></span></td>
												<td><span class="xsm"><u>NOS</u></span></td>
												<td align="center"><span class="xsm"><u>PROC</u></span></td>
												<td><span class="xsm"><u>MODS</u></span></td>
												<td><span class="xsm"><u>BILLED</u></span></td>
												<td><span class="xsm"><u>ALLOWED</u></span></td>
												<td><span class="xsm"><u>DEDUCT</u></span></td>
												<td><span class="xsm"><u>COINS</u></span></td>
												<td><span class="xsm"><u>GRP/RC&middot;AMT</u></span></td>
												<td><span class="xsm">&nbsp;</span></td>
												<td><span class="xsm"><u>PROV&nbsp;PD</u></span></td>
												<td align="center"><span class="sm">COMPLETE</span></td>
												<td align="center"><span class="sm">NOTE</span></td>
											</tr>	
																						
											<cfquery name="getSimiliarClaims" datasource="#request.datasource#">
												SELECT ClaimID AS simClaimID, interchangeClaimID
												FROM claim 
												WHERE InterchangeClaimID LIKE '#MID(trim(getClaimDetails.InterchangeClaimID), 1, evaluate(len(trim(getClaimDetails.InterchangeClaimID)) - 1))#%'											
											</cfquery>
																					
											<tr>
												<td colspan="15">
													<span class="SiteLabel">
														NAME&nbsp;&nbsp;#UCASE(trim(getClaimDetails.patientLname))#, #UCASE(trim(getClaimDetails.patientFname))#
														&nbsp;
														HIC #trim(getClaimDetails.HICNumber)#
														&nbsp;
														ACNT #trim(getClaimDetails.clientAssignedClaimID)#
														&nbsp;												
														ICN
														<cfif getSimiliarClaims.RecordCount GTE 2>
															<select name="listID" class="SiteSelectBox" onchange="location='#CGI.script_name#?claimid='+this.options.value;">
																<cfloop query="getSimiliarClaims">
																	<option value="#simClaimID#" <cfif claimID EQ simClaimID>SELECTED</cfif>>#getSimiliarClaims.InterchangeClaimID#
																</cfloop>
															</select>
														<cfelse>
															#trim(getClaimDetails.InterchangeClaimID)#														
														</cfif>															
														&nbsp;
														ASG <cfif getClaimDetails.LXAssignedNumber EQ 1>Y<cfelseif getClaimDetails.LXAssignedNumber EQ 0>N<cfelse> - </cfif>
														
														&nbsp;
														MOA 	
														<cfloop query="getMOA">
															<cfset thisDescription = Replace(MOADescription, "'", "\'", "ALL")>
															&nbsp;<span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(thisDescription)#');" onmouseout="hideTip(this);">#trim(MOACode)#</span>
														</cfloop>									
													</span>
												</td>
											</tr>								
											
											
											<cfloop query="getProcedures">											
			
												<!-------------------------------------------------------------------------------------->
												<!--- Get the OpenCloseures for this Procedure.                                      --->
												<!-------------------------------------------------------------------------------------->									
												<cfquery name="getOpenClose" datasource="#trim(request.Datasource)#">
													SELECT OpenOrClose, UsersID, DateCreated, Note 	
													FROM procedureopenclose  
													WHERE ProcedureID = #trim(ProcedureID)#
													Order BY DateCreated DESC
												</cfquery>
												
												<cfif getOpenClose.RecordCount GTE 1>		
													<cfset showOpenClose = "">								
													<cfloop query="getOpenClose">
														
														<cfquery name="getByAssignmentName" datasource="#trim(request.datasource)#">
															SELECT CONCAT(FName, ' ', LName) AS OpenCloseFullname 
															FROM view_useraccountparameters 
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
																					
												<cfif noteID EQ 0>
													<cfset noteRequired = 1>
													<cfset HIDDEN_CloseProc = 0>
												<cfelse>
													<cfset noteRequired = 0>	
													<cfset HIDDEN_CloseProc = 1>										
												</cfif>
																				
												<input type="Hidden" name="HIDDEN_CloseProc_#trim(ProcedureID)#" value="#trim(HIDDEN_CloseProc)#">
												<input type="Hidden" name="HIDDEN_State_#trim(ProcedureID)#" value="0">
												
																															
												<!-------------------------------------------------------------------------------------->
												<!--- Gather all the late filing fees charged for this claim.                        --->
												<!-------------------------------------------------------------------------------------->																		
												<cfquery name="getProcedureDeductLateFee" datasource="#trim(request.datasource)#">
													SELECT s.ItemNameDisplay, p.* 
													FROM procedure_medicare_supplemental_amount p INNER JOIN pa_master.standardlistitem s ON p.QualifierCode = s.StandardListItemID
													WHERE p.QualifierCode = 144 AND p.ProcedureID = #trim(ProcedureID)# 
												</cfquery>
												
												<cfif getProcedureDeductLateFee.Recordcount GTE 1>
													<cfloop query="getProcedureDeductLateFee">
														<cfset lateFilingFee = lateFilingFee + getProcedureDeductLateFee.MonetaryAmount2>
													</cfloop>
												</cfif>
												
																					
																					
												<!-------------------------------------------------------------------------------------->
												<!--- Get all the ContractualObligations (CO) for this procedure that will be broken --->
												<!--- up into multiple lines.                                                        --->
												<!-------------------------------------------------------------------------------------->
												<cfset arrayProcedureRows = ArrayNew(1)>
																													
												<cfquery name="getProcedureCOs" datasource="#trim(request.datasource)#">
													SELECT s.ItemNameDisplay, p.* 
													FROM procedure_medicare_claimadjustment p INNER JOIN pa_master.standardlistitem s ON p.ClaimAdjustmentGroupCode1 = s.StandardListItemID
													WHERE p.ClaimAdjustmentGroupCode1 = 103 AND p.ProcedureID = #trim(ProcedureID)# 
												</cfquery>
																			
												
												<cfif getProcedureCOs.RecordCount EQ 1>
													
													<cfloop list="#getProcedureCOs.ColumnList#" index="i_col">
														<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
															<cfset column = "getProcedureCOs.#i_col#">																										
															<cfif evaluate(column) NEQ "">														
																<cfset numCol = "getProcedureCOs.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>																								 	
																<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" fields="Code,Description" RecordID="#evaluate(column)#" active="1" returnvariable="getAdjustmentCode">
																<cfset currentArrayLen = Arraylen(arrayProcedureRows) + 1>													
																<cfset arrayProcedureRows[currentArrayLen] = StructNew()>
																<cfset arrayProcedureRows[currentArrayLen].Remarks = "">
																<cfset arrayProcedureRows[currentArrayLen].PriorProcedureCode = "">
																<cfset arrayProcedureRows[currentArrayLen].AdjustmentGroupCode = "#trim(getProcedureCOs.ItemNameDisplay)#">			
																<cfset arrayProcedureRows[currentArrayLen].AdjustmentCode = "#trim(getAdjustmentCode.Code)#">													
																<cfset arrayProcedureRows[currentArrayLen].AdjustmentDescription = "#trim(getAdjustmentCode.Description)#">
																<cfif ListFindNoCase(monetaryColumns, ListLast(numCol, "."))> 
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = evaluate(numCol)>
																<cfelse>
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = "">
																</cfif>																																																										
															</cfif>													
														</cfif>												
													</cfloop>
																					
												</cfif>		
												
			
												
												<cfquery name="getProcedurePRs" datasource="#trim(request.datasource)#">
													SELECT s.ItemNameDisplay, p.* 
													FROM procedure_medicare_claimadjustment p INNER JOIN pa_master.standardlistitem s ON p.ClaimAdjustmentGroupCode1 = s.StandardListItemID
													WHERE p.ClaimAdjustmentGroupCode1 = 107 AND p.ProcedureID = #trim(ProcedureID)# 
												</cfquery>
												
												<cfif getProcedurePRs.RecordCount EQ 1>
													
													<cfloop list="#getProcedurePRs.ColumnList#" index="i_col">
														<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
															<cfset column = "getProcedurePRs.#i_col#">																										
															<cfif evaluate(column) NEQ "" AND evaluate(column) NEQ 1 AND evaluate(column) NEQ 2><!---Do not show the reason code 2 because it is being shown in the COINS Column already.--->														
																<cfset numCol = "getProcedurePRs.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>																								 	
																<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" fields="Code,Description" RecordID="#evaluate(column)#" active="1" returnvariable="getAdjustmentCode">
																<cfset currentArrayLen = Arraylen(arrayProcedureRows) + 1>													
																<cfset arrayProcedureRows[currentArrayLen] = StructNew()>
																<cfset arrayProcedureRows[currentArrayLen].Remarks = "">
																<cfset arrayProcedureRows[currentArrayLen].PriorProcedureCode = "">
																<cfset arrayProcedureRows[currentArrayLen].AdjustmentGroupCode = "#trim(getProcedurePRs.ItemNameDisplay)#">			
																<cfset arrayProcedureRows[currentArrayLen].AdjustmentCode = "#trim(getAdjustmentCode.Code)#">
																<cfset arrayProcedureRows[currentArrayLen].AdjustmentDescription = "#trim(getAdjustmentCode.Description)#">
																<cfif ListFindNoCase(monetaryColumns, ListLast(numCol, "."))> 
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = evaluate(numCol)>		
																<cfelse>
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = "">		
																</cfif>																																																																																							
															</cfif>													
														</cfif>												
													</cfloop>
													
												</cfif>
												
												
												
												<!-------------------------------------------------------------------------------------->
												<!--- if the array created has no records then we add the default one in.            --->
												<!-------------------------------------------------------------------------------------->									
												<cfif ArrayLen(arrayProcedureRows) LTE 0>										
													<cfset currentArrayLen = Arraylen(arrayProcedureRows) + 1>													
													<cfset arrayProcedureRows[currentArrayLen] = StructNew()>
													<cfset arrayProcedureRows[currentArrayLen].Remarks = "">
													<cfset arrayProcedureRows[currentArrayLen].PriorProcedureCode = "">
													<cfset arrayProcedureRows[currentArrayLen].AdjustmentCode = "">
													<cfset arrayProcedureRows[currentArrayLen].AdjustmentDescription = "">													
													<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = "">
												</cfif>
												
												
												
												
												<tr>  
													<td><span class="SiteLabel">#trim(request.thisClaim.GetProviderID())#</span></td>
													<td>
														<span class="SiteLabel">												
															#DateFormat(ServiceDateFrom, "mm")##DateFormat(ServiceDateFrom, "dd")#&nbsp;#DateFormat(ServiceDateTo, "mm")##DateFormat(ServiceDateTo, "dd")##DateFormat(ServiceDateTo, "yy")#																		
														</span>
													</td>									
													<td>
														<span class="SiteLabel">
															#trim(getClaimDetails.FacilityCode)#
														</span>
													</td>
													<td align="center">
														<span class="SiteLabel">
															#trim(BilledQuantity)#
														</span>
													</td>
													
													<td>
														<span class="SiteLabel">
															<cfset thisDescription = Replace(trim(LongDescription), "'", "\'", "ALL")>
															<span style="cursor:hand; color:blue" onmouseover="doTooltip(1, this, event, '#thisDescription#');" onmouseout="hideTip(this);">#trim(HCPC)#</span>
														</span>
													</td>
													
													<!-------------------------------------------------------------------------------------->
													<!--- Query to get all the modifiers for this procedure.                             --->
													<!-------------------------------------------------------------------------------------->										
													<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
														SELECT e.Modifier, e.Description
														FROM procedure_medicare_modifier p LEFT JOIN pa_master.EOB_MEDICARE_CLAIMMODIFIERCode e ON p.ModifierCode = e.RecordID 
														WHERE p.ProcedureID = #trim(ProcedureID)#
													</cfquery>
													
													<cfset Modifier1 = "">
													<cfset Modifier2 = "">
													<cfif ListFindNoCase(firstPlaceModifiers, getModifiers.Modifier[1])>
														<cfset Modifier1 = getModifiers.Modifier[1]>						
													</cfif>
													<cfif ListFindNoCase(secondPlaceModifiers, getModifiers.Modifier[2])>
														<cfset Modifier2 = getModifiers.Modifier[2]>						
													</cfif>
																									
																																						
													<td nowrap>
														<span class="SiteLabel">
															<cfloop query="getModifiers"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(Description)#');" onmouseout="hideTip(this);">#trim(Modifier)#</span></cfloop>
														</span><!---this.style.color = 'red';--->
													</td>								
													
													<td align="right">
														<span class="SiteLabel" style="white-space: nowrap;">
															#NumberFormat(trim(BilledAmount), "___.__")#																						
														</span>
													</td>
													
													
													<!-------------------------------------------------------------------------------------->
													<!--- Query to get all the supplemental amounts for this procedure.                  --->
													<!-------------------------------------------------------------------------------------->										
													<cfquery name="getProcedureAmounts" datasource="#trim(request.datasource)#">
														SELECT SUM(p.MonetaryAmount2) AS ProcedureAmounts 
														FROM procedure_medicare_supplemental_amount p LEFT JOIN pa_master.standardlistitem s ON p.QualifierCode = s.StandardListItemID 
														WHERE p.ProcedureID = #trim(ProcedureID)# AND p.QualifierCode = 142 <!---142 is the  list id for allowed-actual--->
													</cfquery>
													
													<cfif getProcedureAmounts.Recordcount GT 0 AND IsNumeric(getProcedureAmounts.ProcedureAmounts)>
														<cfset allowedTotal = allowedTotal + getProcedureAmounts.ProcedureAmounts>
													</cfif>
													
													<cf_ei_1002_GetMedicareProcedureFee hcpc="#trim(HCPC)#" dos="#trim(ServiceDateFrom)#" state="#session.Client.getClientDefaultAddress(session.clientID).statefull#" modifier1="#trim(modifier1)#">	
																									
													<cfset tr_allowedBGColor = "white">
													<cfset tr_allowedFontColor = "000000">
													<cfset cursor = "">															
													<cfif isDefined("HCPCFee")>
														
														<cfif trim(modifier2) EQ "KJ">
															<cfset HCPCFee = HCPCFee - REQUEST.percentagev(25, HCPCFee)>
															<cfset tr_allowedBGColor = "c0c0c0">
															<cfset tr_allowedFontColor = "ffffff">	
															<cfset cursor = "hand">	
															<cfset allowedTip = "According to the Fee Schedule this code #trim(HCPC)# should be paid at #NumberFormat(HCPCFee, '0.00')# ea. including 25% reduction because of the KJ modifier totaling #NumberFormat(evaluate(PaidQuantity * HCPCFee), '0.00')# allowed. <br>#trim(PaidQuantity)# * #NumberFormat(HCPCFee, '0.00')# = #NumberFormat(evaluate(PaidQuantity * HCPCFee), '0.00')#"> 																
														</cfif>
														
														<cfset total = PaidQuantity * HCPCFee>														
														<cfif NumberFormat(total, "0.00") NEQ NumberFormat(getProcedureAmounts.ProcedureAmounts, "0.00")>														
															<cfset tr_allowedBGColor = "CC0033">
															<cfset tr_allowedFontColor = "ffffff">	
															<cfset cursor = "hand">	
															<cfset allowedTip = "According to the Fee Schedule this code #trim(HCPC)# should be paid at #NumberFormat(HCPCFee, '0.00')# ea. totaling #NumberFormat(total, '0.00')# allowed. <br>#trim(PaidQuantity)# * #NumberFormat(HCPCFee, '0.00')# = #trim(total)#"> 																
														</cfif>															
													</cfif>															
													
													<td align="right" id="tr_allowed" style="cursor:#trim(cursor)#; background-color:#trim(tr_allowedBGColor)#" <cfif IsDefined("allowedTip") AND allowedTip NEQ "">onmouseover="doTooltip(1, this, event, '#trim(allowedTip)#');" onmouseout="hideTip(this);"</cfif>>
														<span class="SiteLabel" style="white-space: nowrap;">
															<font color="#trim(tr_allowedFontColor)#"><!---[#trim(ProcedureID)#]---> #NumberFormat(trim(getProcedureAmounts.ProcedureAmounts), "___.__")#</font>
														</span>
													</td>
													
													<cfset allowedTip = "">													
						
													<cfset patientResponsibilityDeductible = "0.00">
													<cfset patientResponsibilityCoInsurance = "0.00">
													<!-------------------------------------------------------------------------------------->
													<!--- Get all the PatientResponsibilities (PR) adjustments for this procedure.       --->
													<!-------------------------------------------------------------------------------------->										
													<cfquery name="getProcedurePRs" datasource="#trim(request.datasource)#">
														SELECT s.ItemNameDisplay, p.* 
														FROM procedure_medicare_claimadjustment p INNER JOIN pa_master.standardlistitem s ON p.ClaimAdjustmentGroupCode1 = s.StandardListItemID
														WHERE p.ClaimAdjustmentGroupCode1 = 107 AND p.ProcedureID = #trim(ProcedureID)# 
													</cfquery>
													
													<cfif getProcedurePRs.RecordCount EQ 1>
														<cfloop list="#getProcedurePRs.ColumnList#" index="i_col">
															<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
																<cfset column = "getProcedurePRs.#i_col#">																										
																<cfset numCol = "getProcedurePRs.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>
																<cfif ListFindNoCase(monetaryColumns, ListLast(numCol, "."))> 
																	<cfif evaluate(column) EQ 1>
																		<cfset patientResponsibilityDeductible = patientResponsibilityDeductible + evaluate(numCol)> 	
																		<cfset deductTotal = deductTotal + evaluate(numCol)>
																	<cfelseif evaluate(column) EQ 2>																				
																		<cfset patientResponsibilityCoInsurance = patientResponsibilityCoInsurance + evaluate(numCol)>
																		<cfset coinsTotal = coinsTotal + evaluate(numCol)> 															
																	</cfif>
																</cfif>																												
															</cfif>
															
														</cfloop>	
													</cfif>
													
													<td align="right">
														<span class="SiteLabel" style="white-space: nowrap;">
															#NumberFormat(trim(patientResponsibilityDeductible), "___.__")#
														</span>
													</td>
													
													<td align="right">
														<span class="SiteLabel" style="white-space: nowrap;">
															#NumberFormat(trim(patientResponsibilityCoInsurance), "___.__")#
														</span>
													</td>
													
													
													<!---COs--->
													<td align="center">
														<span class="SiteLabel">
															<cfif Arraylen(arrayProcedureRows) GTE 1 AND arrayProcedureRows[1].AdjustmentCode NEQ "">									
																<cfset thisDescription = Replace(trim(arrayProcedureRows[1].AdjustmentDescription), "'", "\'", "ALL")>
																<span style="cursor:hand; color:blue" onmouseover="doTooltip(1, this, event, '#thisDescription#');" onmouseout="hideTip(this);">
																	#arrayProcedureRows[1].AdjustmentGroupCode#&middot;#arrayProcedureRows[1].AdjustmentCode#
																</span>	
															<cfelse>											
																&nbsp;
															</cfif>
														</span>
													</td>
													
													<td align="right">
														<span class="SiteLabel" style="white-space: nowrap;">
															<cfif Arraylen(arrayProcedureRows) GTE 1>											
																#NumberFormat(arrayProcedureRows[1].AdjustmentMonetaryAmount, "___.__")#
															<cfelse>											
																#NumberFormat(0.00, "___.__")#	
															</cfif>
														</span>
													</td>																	
												
													<td align="right">
														<span class="SiteLabel" style="white-space: nowrap;">
															#NumberFormat(trim(PaidAmount), "___.__")#
														</span>
													</td>
																																							
													<td align="center">											
														<div align="center">
															<cfset disabled = "">
															<cfset checked = "">													
															<cfif (request.thisClaim.getAssignedToUserID() NEQ session.User.getUsersID()) OR (statusOpenedOrClosed EQ 0) OR trim(HIDDEN_CloseProc) EQ 0>
																<cfset disabled = "disabled">
															</cfif>											
															<cfif statusOpenedOrClosed EQ 0>
																<cfset checked = "checked">
															</cfif>												
															
															<cfif statusOpenedOrClosed EQ 0 OR statusOpenedOrClosed EQ 1>																																			
																<cfset showNote = "<br><br><strong>NOTE:</strong> You may only mark a procedure complete if you are assigned to the claim and a note has been added to it.<br><br><strong><font color=FF0000>NOTE NOT FOUND ON THIS PROCEDURE</font></strong>">
																<cfif ListContains(session.User.getRoleIDs(), "8") OR ListContains(session.User.getRoleIDs(), "2")>
																	<cfset showNote = showNote & "<br><br>Being an administrator simply re-assign this claim to yourself and mark the procedure complete after adding a note to it.">
																</cfif> 	
																<span onmouseover="doTooltip(1, this, event, '#trim(showOpenClose)##trim(showNote)#');" onmouseout="hideTip(this);">
																	<input type="Checkbox" name="Checkbox_CloseProc_#trim(ProcedureID)#" onclick="checkComplete(#trim(ProcedureID)#, #trim(ProcedureID)#, #trim(noteID)#, #trim(noteRequired)#); allowClaimCheckComplete('#trim(proceduresList)#');" #trim(disabled)# #trim(checked)#>		
																</span>											
															<cfelse>	
																<cfset showNote = "<strong>NOTE:</strong> You may only mark a procedure complete if you are assigned to the claim and a note has been added to it.<br><br><strong><font color=FF0000>NOTE NOT FOUND ON THIS PROCEDURE</font></strong>">
																<cfif ListContains(session.User.getRoleIDs(), "8") OR ListContains(session.User.getRoleIDs(), "2")>
																	<cfset showNote = showNote & "<br><br>Being an administrator simply re-assign this claim to yourself and mark the procedure complete after adding a note to it.">
																</cfif> 	
																<span onmouseover="doTooltip(1, this, event, '#trim(showNote)#');" onmouseout="hideTip(this);">
																	<input type="Checkbox" name="Checkbox_CloseProc_#trim(ProcedureID)#" onclick="checkComplete(#trim(ProcedureID)#, #trim(ProcedureID)#, #trim(noteID)#, #trim(noteRequired)#); allowClaimCheckComplete('#trim(proceduresList)#');" #trim(disabled)# #trim(checked)#>
																</span>	
															</cfif>
														</div>
													</td>
													<td align="center">
														<span onclick="if(tr#trim(ProcedureID)#.style.display=='none') {tr#trim(ProcedureID)#.style.display='block'; showNoteIFrame(#trim(ProcedureID)#, #trim(noteID)#, #trim(noteRequired)#);} else {tr#trim(ProcedureID)#.style.display='none'};" class="SiteLabel" style="cursor: hand"><u>Note</u></span>
														<!---<span onclick="if (HIDDEN_State_#trim(ProcedureID)#.value==0) {HIDDEN_State_#trim(ProcedureID)#.value=1; showNoteIFrame(#trim(ProcedureID)#, #trim(noteID)#, #trim(noteRequired)#);} else {HIDDEN_State_#trim(ProcedureID)#.value=0; tr#trim(ProcedureID)#.style.display='none';};" class="SiteLabel" style="cursor: hand"><u>Note</u></span>--->
													</td>
												</tr>
														
												<tr id="tr#trim(ProcedureID)#" style="display: 'none';">
													<td colspan="15" id="td#trim(ProcedureID)#" style="cursor: 'hand'; border-bottom: 1px black solid;">&nbsp;</td>			
												</tr>
												
																														
												<!-------------------------------------------------------------------------------------->
												<!--- Start all rows for this procedure.                                             --->
												<!-------------------------------------------------------------------------------------->										
											
												<!-------------------------------------------------------------------------------------->
												<!--- If the procedure has any remarks go ahead and put them in the array.           --->
												<!-------------------------------------------------------------------------------------->									
												<cfset remarkIndustryCodes = "">
												<cfquery name="getRemarks" datasource="#trim(request.datasource)#">
													SELECT e.Code AS IndustryCode, e.Description AS IndustryCodeDescription
													FROM procedure_medicare_remark_code pmrc INNER JOIN pa_master.eob_medicare_remittanceadviceremarkcode e ON pmrc.IndustryCode = e.RecordID
													WHERE pmrc.ProcedureID = #trim(ProcedureID)# 								
												</cfquery>
												
												<cfif getRemarks.RecordCount GTE 1>
													<cfloop query="getRemarks">
														<cfset thisDescription = Replace(IndustryCodeDescription, "'", "\'", "ALL")>
														<cfset remarkIndustryCodes =  remarkIndustryCodes & "&nbsp;<span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '#trim(thisDescription)#');"" onmouseout=""hideTip();"">#trim(IndustryCode)#</span>">
													</cfloop>
												</cfif>
												
												<cfif remarkIndustryCodes NEQ "">
													<cfif Arraylen(arrayProcedureRows) LTE 1>																							
														<cfset arrayProcedureRows[2] = StructNew()>
														<cfset arrayProcedureRows[2].PriorProcedureCode = "">
														<cfset arrayProcedureRows[2].AdjustmentCode = "">		
														<cfset arrayProcedureRows[2].AdjustmentDescription = "">											
														<cfset arrayProcedureRows[2].AdjustmentMonetaryAmount = "">	
													</cfif>
													<cfset arrayProcedureRows[2].Remarks = "REM: #trim(remarkIndustryCodes)#">											
												</cfif>
												
												
												<cfif PriorProcedureCode NEQ "">
													<cfif Arraylen(arrayProcedureRows) LTE 1>																							
														<cfset arrayProcedureRows[2] = StructNew()>
														<cfset arrayProcedureRows[2].Remarks = "">	
														<cfset arrayProcedureRows[2].AdjustmentCode = "">	
														<cfset arrayProcedureRows[2].AdjustmentDescription = "">												
														<cfset arrayProcedureRows[2].AdjustmentMonetaryAmount = "">	
													</cfif>										
													<cfset arrayProcedureRows[2].PriorProcedureCode = "#PriorProcedureCode#">										
												</cfif>
												
												<!-------------------------------------------------------------------------------------->
												<!--- Output the next rows.                                                          --->
												<!-------------------------------------------------------------------------------------->
												<cfloop from="2" to="#Arraylen(arrayProcedureRows)#" index="groupi">
													<tr>
														<td colspan="3"><span class="SiteLabel"><cfif groupi EQ 2>#arrayProcedureRows[2].Remarks#<cfelse>&nbsp;</cfif></span></td>											
														<td align="right"><span class="SiteLabel"><cfif arrayProcedureRows[groupi].PriorProcedureCode NEQ "">[<cfelse>&nbsp;</cfif></span></td>											
														
														<cfif groupi EQ 2 AND arrayProcedureRows[2].PriorProcedureCode NEQ "">														
															<cfquery name="getPriorProcedureCodeDesc" datasource="#request.datasource#">
																SELECT HCPC, LongDescription, ShortDescription 
																FROM pa_master.eob_medicare_procedurecode 
																WHERE HCPC = '#ListGetAt(arrayProcedureRows[2].PriorProcedureCode, 2, ">")#'	
															</cfquery>																												
															<cfset thisDescription = Replace("#trim(getPriorProcedureCodeDesc.LongDescription)#", "'", "\'", "ALL")>	
														</cfif>		
																								
														<td colspan="1"><span class="SiteLabel"><cfif groupi EQ 2 AND arrayProcedureRows[2].PriorProcedureCode NEQ ""><span class="SiteLabel" style="cursor:hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(thisDescription)#');" onmouseout="hideTip(this);">#ListGetAt(arrayProcedureRows[2].PriorProcedureCode, 2, ">")#</span><cfelse>&nbsp;</cfif></span></td>
														
														<td><span class="SiteLabel"><cfif arrayProcedureRows[groupi].PriorProcedureCode NEQ "">]<cfelse>&nbsp;</cfif></span></td>
														<td align="right"><span class="SiteLabel">&nbsp;</span></td>
														<td align="right"><span class="SiteLabel">&nbsp;</span></td>
														<td align="right"><span class="SiteLabel">&nbsp;</span></td>
														<td align="right"><span class="SiteLabel">&nbsp;</span></td>
														<td align="center">
															<span class="SiteLabel">
																<cfif arrayProcedureRows[groupi].AdjustmentCode NEQ ""><span style="cursor:hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(arrayProcedureRows[groupi].AdjustmentDescription)#');" onmouseout="hideTip(this);">#arrayProcedureRows[groupi].AdjustmentGroupCode#&middot;#arrayProcedureRows[groupi].AdjustmentCode#</span><cfelse>&nbsp;</cfif>											
															</span>
														</td>
														<td align="right">
															<span class="SiteLabel" style="white-space: nowrap;">
																<cfif IsNumeric(arrayProcedureRows[groupi].AdjustmentMonetaryAmount)>#NumberFormat(arrayProcedureRows[groupi].AdjustmentMonetaryAmount, "___.__")#<cfelse>&nbsp;</cfif>													
															</span>
														</td>
														<td align="right"><span class="SiteLabel">&nbsp;</span></td>
														<td align="right"><span class="SiteLabel">&nbsp;</span></td>
														<td align="right"><span class="SiteLabel">&nbsp;</span></td>	
													</tr>
												</cfloop>
												
												
												<!---total all the procedures adjusments.--->
												<cfloop from="1" to="#Arraylen(arrayProcedureRows)#" index="provi">
													<cfif IsNumeric(arrayProcedureRows[provi].AdjustmentMonetaryAmount)>
														<cfset grprcTotal = grprcTotal + arrayProcedureRows[provi].AdjustmentMonetaryAmount>
													</cfif>
												</cfloop>
												
																							
											</cfloop>
											
											
											<!-------------------------------------------------------------------------------------->
											<!--- Start the claim totals                                                         --->
											<!-------------------------------------------------------------------------------------->																
											<tr>
												<td><span class="SiteLabel">PT&nbsp;RESP:</span></td>
												<td><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(getClaimDetails.PatientResponsibilityAmount, "___.__")#</span></td>
												<td><span class="SiteLabel">&nbsp;</span></td>
												<td><span class="SiteLabel">&nbsp;</span></td>
												<td colspan="2"><span class="SiteLabel">CLAIM&nbsp;TOTALS</span></td>
												<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(trim(getClaimProceduresTotals.ClaimTotalBilled), "___.__")#</span></td>
												<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(allowedTotal, "___.__")#</span></td>
												<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(deductTotal, "___.__")#</span></td>
												<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(coinsTotal, "___.__")#</span></td>
												<td><span class="SiteLabel">&nbsp;</span></td>
												<td><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(grprcTotal, "___.__")#</span></td>
												<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(getClaimProceduresTotals.ClaimTotalPaid, "___.__")#</span></td>
												<td align="right"><span class="SiteLabel">&nbsp;</span></td>
												<td align="right"><span class="SiteLabel">&nbsp;</span></td>
											</tr>
											
											
											
											<cfset netAmount = trim(getClaimProceduresTotals.ClaimTotalPaid) - ABS(trim(getClaimDetails.claimpreviousPaidAmount))>
											
											
											<cfset netAmount = netAmount + interestAmount>
											
											<tr>
												<td colspan="13">
			
													<table cellspacing="0" cellpadding="0" width="100%" border="0" style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
														<tr style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
														    <td style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																<span class="SiteLabel" style="white-space: nowrap;">
																	ADJ&nbsp;TO&nbsp;TOTALS:&nbsp;PREV&nbsp;PD&nbsp;&nbsp;#NumberFormat(ABS(getClaimDetails.claimpreviousPaidAmount), "___.__")#	
																</span>
															</td>
															<td style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																<span class="SiteLabel" style="white-space: nowrap;">
																	INTEREST&nbsp;&nbsp;#NumberFormat(interestAmount, "___.__")#	
																</span>	
															</td>
															<td style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																<span class="SiteLabel" style="white-space: nowrap;">
																	LATE&nbsp;FILING&nbsp;CHARGE&nbsp;&nbsp;#NumberFormat(lateFilingFee, "___.__")#
																</span>	
															</td>
														    <td align="right" style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																<span class="SiteLabel" style="white-space: nowrap;">
																	NET&nbsp;&nbsp;#NumberFormat(netAmount, "___.__")#&nbsp;		
																</span>	
															</td>												
														</tr>
													</table>
			
												</td>
												<td align="right"><span class="SiteLabel">&nbsp;</span></td>
												<td align="right"><span class="SiteLabel">&nbsp;</span></td>
											</tr>
											
											<!-------------------------------------------------------------------------------------->
											<!--- Show the croossover name if defined.                                           --->
											<!-------------------------------------------------------------------------------------->								
											<cfif getClaimDetails.CrossoverNameLastorOrganizationName3 NEQ "">
											<tr>
												<td colspan="13">
													<span class="SiteLabel" style="white-space: nowrap;">
														CLAIM&nbsp;INFORMATION&nbsp;FORWARDED&nbsp;TO:&nbsp;&nbsp;&nbsp;#trim(getClaimDetails.CrossoverNameLastorOrganizationName3)#
													</span>
												</td>
												<td align="right"><span class="SiteLabel">&nbsp;</span></td>
												<td align="right"><span class="SiteLabel">&nbsp;</span></td>
											</tr>
											</cfif>
											
											<tr>
												<td colspan="15">&nbsp;</td>
											</tr>	
											
											<cfif trim(request.thisClaim.eligibleForClosure(claimID))>
												<cfset disable = "">											
											</cfif>
											<tr>
												<td colspan="15" nowrap>
													<div align="center">
														<input type="Checkbox" #disable# name="completeCheck" onclick="markAsComplete();" <cfif ListFind("199,201,202", request.thisClaim.getStatusID())>disabled checked</cfif>><span style="color : c0c0c0;" id="markAsVerbage">&nbsp;Mark&nbsp;Claim&nbsp;As&nbsp;Completed</span>
													</div>	
												</td>
											</tr>												
											<cfif trim(request.thisClaim.eligibleForClosure(claimID))>												
												<script>
													markAsVerbage.style.color = '000000'; 
												</script>										
											</cfif>
											
											
											<!---Submit Button--->
											<cfif reset>
												<cfset closeWin = "reloadMain();">
											<cfelse>
												<cfset closeWin = "">	
											</cfif>
											<tr>
												<td colspan="15">&nbsp;</td>
											</tr>					
											<tr>
												<td align="center" colspan="15" nowrap>			
													<div align="center"><cf_gcSubmitButton value="Save&nbsp;Changes">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close&nbsp;Window" onclick="#closeWin# self.close();">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Print&nbsp;Claim" onclick="printClaim();"><!---&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Redetermination&nbsp;Request" onclick="printRedeterminationRequest();">---></div>							
												</td>
											</tr>
														
										</table>			
																	
									</td>
								</tr>				
																		
							</table>
							
						</form>
						
					</span>
		
				</td>
			</tr>
		</table>
	
		
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
	
	










