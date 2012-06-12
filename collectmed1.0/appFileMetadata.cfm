<!---- appFileMetadata.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileID" default="">
	<cfset fileID = attributes.fileID>
	
	<cfif IsDefined("form.fileID") AND form.fileID NEQ "">
		<cfset fileID = form.fileID>
	<cfelseif IsDefined("url.fileID") AND url.fileID NEQ "">
		<cfset fileID = url.fileID>	
	</cfif>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="fileID"
		fieldnames="File ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create a file object to use on this page.                                      --->
<!-------------------------------------------------------------------------------------->
	<cfset request.File = CreateObject("component", "com.common.File")>
	<cfset request.File.init(fileID)>
	
	<cfquery name="getUploaderName" datasource="#trim(request.datasource)#">
		SELECT FName + '&nbsp;' + LName AS Fullname 
		FROM view_useraccountparameters 
		WHERE UsersID = #trim(request.File.getUsersID())#
	</cfquery>
											
	
		
<!-------------------------------------------------------------------------------------->
<!--- Styles needed for this page.                                                   --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
				
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
		
		<script language="JavaScript">
			function createViewNotes(){
				leftVal = (screen.width - 600) / 2;
				topVal = (screen.height - 350) / 2;
				filenote=window.open('appObjectNote.cfm?objectid=7&instanceid=#trim(fileID)#', 'filenote', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=600,height=350,left='+leftVal+',top='+topVal); filenote.focus(0);
			};
		</script>		
		
	</cfoutput>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="12" standardlistitemID="#request.File.getFileType()#" active="1" returnvariable="getType">
								
		<table>
			<tr>
				<td valign="top">		
					<span width="100%" class="EOBclaimTableBody">	
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="center">	
									
									<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
										<tr><td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">File&nbsp;Details</td></tr>	
										<tr>
											<td class="sitelabel"><strong>File&nbsp;Name:</strong></td>	
											<td class="sitelabel">#request.File.getClientFileName()#.#request.File.getClientFileExt()#</td>							
										</tr>	
										<tr>
											<td class="sitelabel"><strong>File&nbsp;Type:</strong></td>	
											<td class="sitelabel">#getType.ItemNameDisplay#</td>							
										</tr>
										<tr>
											<td class="sitelabel"><strong>Uploaded By:</strong></td>	
											<td class="sitelabel">#trim(getUploaderName.Fullname)#</td>							
										</tr>
										<tr>
											<td class="sitelabel"><strong>Upload Date:</strong></td>	
											<td class="sitelabel">#DateFormat(request.File.getDateCreated(), 'MM/DD/YYYY')# #TimeFormat(request.File.getDateCreated(), 'hh:mm:ss tt')#</td>							
										</tr>
										<tr>
											<td class="sitelabel"><strong>File Size:</strong></td>	
											<td class="sitelabel">#request.File.getFileSize()#k</td>							
										</tr>					
									</table>
																															
								</td>
							</tr>									
						</table>				
					</span>
				</td>
				
				<cfset thisToolTip = trim(request.File.getFileStatusesFormatted(fileID: fileID))>
				
				<td valign="top">		
					<span width="100%" class="EOBclaimTableBody">	
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="center">									
									<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
										<tr><td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">File&nbsp;Status</td></tr>	
										<tr>
											<td class="sitelabel"><strong>File&nbsp;Status:</strong></td>	
											<td class="sitelabel"><span style="cursor:hand" onmouseover="doTooltip(1, this, event, '#thisToolTip#');" onmouseout="hideTip(this);"><u>#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</u></span></td>																		
										</tr>
										<tr>
											<td class="sitelabel"><strong>File&nbsp;Notes:</strong></td>	
											<td class="sitelabel">
												<cfinvoke component="com.common.note" method="getNumberOfNotes" clientID="#trim(session.ClientID)#" objectID="7" instanceID="#trim(fileID)#" returnvariable="numOfNotes">  
												<span class="siteLabel" style="cursor:hand" onclick="createViewNotes();">
													&nbsp;&nbsp;<u>View/Add&nbsp;File&nbsp;Notes</u> (#trim(numOfNotes)#)
												</span>											
											</td>							
										</tr>														
									</table>																															
								</td>
							</tr>									
						</table>				
					</span>
				</td>
							
			</tr>			
			
			
			<!---File Specific--->
			<tr>
				<td valign="top" colspan="2" align="center">		
					<span width="100%" class="EOBclaimTableBody">	
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="center">	
									
									<table class="EOBList" border="0" cellpadding="0" cellspacing="0">											
										<tr><td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px;">File&nbsp;Specific&nbsp;Details</td></tr>	
										
										
										<cfif request.File.getFileType() EQ 101>
											
											<!-------------------------------------------------------------------------------------->
											<!--- Javascript neede for this page.                                                --->
											<!-------------------------------------------------------------------------------------->
											<script language="JavaScript">			
												function editClaim(claimid){
													editClaim=window.open('appClaimEdit.cfm?claimid='+claimid,'editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=700,height=550'); editClaim.focus(0);
												};			
											</script>											
											
											<!-------------------------------------------------------------------------------------->
											<!--- Create an Interchange Object.                                                  --->
											<!-------------------------------------------------------------------------------------->	
											<cfset request.Interchange = CreateObject("component", "com.common.Interchange")>
											<cfset getInterchange = request.Interchange.getInterchangeQuery(FileID: trim(FileID))>			
											
											<cfquery name="getNumOfClaims" datasource="#request.datasource#">
												SELECT Count(InterchangeID) AS numOf
												FROM claim_processxmltodb
												WHERE InterchangeID = #trim(getInterchange.InterchangeID)# 
											</cfquery>
											
											<cfquery name="getBadClaims" datasource="#request.datasource#">
												SELECT *
												FROM claim_processxmltodb
												WHERE InterchangeID = #trim(getInterchange.InterchangeID)# 
												AND Active = 1
											</cfquery>											
											
											<cfquery name="getClaims" datasource="#request.datasource#">
												SELECT DISTINCT c.ClaimID, c.InterchangeClaimID, c.claimType, c.EntityID, c.InterchangeID, c.assignedToUserID, c.Active, c.InactiveCode, c.DateCreated, u.usersID, e.FName As userFName, e.LName AS userLName, patientEntity.FName AS patientFName, patientEntity.LName AS patientLName
												FROM claim c 
												LEFT JOIN pa_master.users u ON c.AssignedToUserID = u.UsersID 
												LEFT JOIN Entity e ON u.EntityID = e.EntityID
												LEFT JOIN [Procedure] cp ON c.ClaimID = cp.ClaimID
												LEFT JOIN Entity patientEntity ON c.entityID = patientEntity.EntityID				
												LEFT JOIN Patient p ON c.entityID = p.EntityID
												WHERE c.InterchangeID = #trim(getInterchange.InterchangeID)# 
											</cfquery>
											
											<cfset request.ClaimXML = CreateObject("component","com.common.db.Claim_ProcessXMLToDBIO")>		
											<cfset Active = request.ClaimXML.getClaim_ProcessXMLToDBQuery(InterchangeID: trim(getInterchange.InterchangeID), Active: 1)>			
											
											<cfset processedClaims = getNumOfClaims.numOf - Active.recordcount>
											
											<tr>
												<td class="sitelabel"><strong>File&nbsp;Number&nbsp;Of&nbsp;Claims:</strong></td>	
												<td class="sitelabel">#getNumOfClaims.numOf#</td>							
											</tr>	
											<tr>
												<td class="sitelabel"><strong>Processed&nbsp;Claims:</strong></td>	
												<td class="sitelabel">#trim(processedClaims)#</td>							
											</tr>	
											<tr>
												<td class="sitelabel"><strong>File&nbsp;Claims:</strong></td>	
												<td class="sitelabel" align="center">
													<br>
														<table align="center" border="0" cellpadding="4" cellspacing="0">														
															<thead>
																<td>Claim&nbsp;ID</td>
																<td>Patient</td>
																<td>Assigned</td>
															</thead>
															<cfloop query="getClaims">															
																<tr style="cursor:hand" onmouseover="this.style.backgroundColor='lightgrey';" onmouseout="this.style.backgroundColor='FFFFFF';" onclick="editClaim=window.open('appClaimEditMedicare.cfm?claimid=#trim(claimID)#','editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=900,height=480'); editClaim.focus(0);" style="cursor: hand;">			
																	<td class="SiteLabel" nowrap>#trim(InterchangeClaimID)#</td>																
																	<td class="SiteLabel" nowrap align="left">#patientLName#, #patientFName#</td>																																	
																	<td class="SiteLabel" nowrap align="left"><cfif trim(AssignedToUserID) EQ "">Unassigned<cfelse>#LEFT(trim(userFName), 1)#<cfif userLName NEQ "">.</cfif> #trim(userLName)#</cfif></td>
																</tr>																
															</cfloop>								
														</table>
													<br>
												</td>							
											</tr>
											
											<cfif getBadClaims.RecordCount GTE 1>											
																								
												<tr>
													<td class="sitelabel"><strong>Claims&nbsp;With&nbsp;Issues:</strong></td>	
													<td class="sitelabel" align="center">
														<br>
														<table align="center" border="0" cellpadding="4" cellspacing="0">														
															<thead>
																<td>Claim ID</td>
																<td>Patient</td>
																<td>Resolve</td>																
															</thead>															
															<script language=JavaScript>
																function editClaimXMLToDBPage(claimXMLID){
																	Claim_ProcessXMLToDB=window.open('appProcessClaimXMLToDB.cfm?Claim_ProcessXMLToDBID=' + claimXMLID, 'Claim_ProcessXMLToDB', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=780,height=450'); 
																	Claim_ProcessXMLToDB.focus(0);
																};
															</script>															
															<cfloop query="getBadClaims">																	
																<cfif PossiblePatientID NEQ "">
																	<cfset interchange835 = XMLParse(ClaimXML)>
																	<cfset CLPsElements = XMLSearch(interchange835, "CLP")>
																	<cfloop from="1" to="#trim(ArrayLen(CLPsElements))#" index="CLPi">
																		<cfinclude template="CustomTags/SiteSpecificCustomTags/ei_1002_Process835XMLFileIntoDB_NM1_Element.cfm">
																	</cfloop>
																	<tr style="cursor:hand" onmouseover="this.style.backgroundColor='lightgrey';" onmouseout="this.style.backgroundColor='FFFFFF';">			
																		<td class="SiteLabel" nowrap>#trim(interchangeClaimID)#</td>
																		<td class="SiteLabel" nowrap>#trim(patientLName)#, #trim(patientFName)# #trim(patientMiddleName)#</td>
																		<td class="SiteLabel" nowrap><a href=## onclick=editClaimXMLToDBPage(#trim(Claim_ProcessXMLToDBID)#);>Resolve&nbsp;Claim&nbsp;Issue</a></td>
																	</tr>
																</cfif>																									
															</cfloop>																					
														</table>
														<br>
													</td>							
												</tr>
											</cfif>
												
										</cfif>
																							
									</table>
																															
								</td>
							</tr>									
						</table>				
					</span>
				</td>						
			</tr>
			
			
		</table>
		
	</cfoutput>	
	
			
