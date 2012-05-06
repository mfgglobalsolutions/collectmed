<!---- appClaimMyDisplay.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.OrderBy" default="DueDate">	
	<cfset OrderBy = attributes.OrderBy>
	
	<cfparam name="attributes.Order" default="ASC">		
	<cfset Order = attributes.Order>
	
	<cfset runOnRequestEnd = "no">
			
<!-------------------------------------------------------------------------------------->
<!--- Javascript neede for this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			
			function submitReprocess(field, order){
				document.SearchReProcessASCDESC.orderby.value = field; 
				document.SearchReProcessASCDESC.order.value = order; 
				SearchReProcessASCDESC.submit();
			};
			
			function searchClaims(claimid,reassign){
				parent.location = "appClaimSearch.cfm?hlink=2&hslink=2";				
			};
			
			function editClaim(claimid){
				leftVal = (screen.width - 700) / 2;
				topVal = (screen.height - 550) / 2;			
				editClaim=window.open('appClaimEdit.cfm?claimid='+claimid,'editClaim','dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=700,height=550,left='+leftVal+',top='+topVal); editClaim.focus(0);
			};
			
		</script>
		
	</cfoutput>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Form needed for ordering.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form name="SearchReProcessASCDESC" method="post">
			<input type="Hidden" name="orderby" value="">
			<input type="Hidden" name="order" value="">
			<cf_gcEmbedFields except="orderby,order">
		</form>
	</cfoutput>	 	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Build the query based on the parameters sent in.                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>
			
			
			<cfsavecontent variable="sqlStatement">			
				SELECT DISTINCT c.ClaimID, c.InterchangeClaimID, c.claimType, c.EntityID, c.InterchangeID, c.assignedToUserID, 
				c.Active, c.InactiveCode, c.DateCreated, c.DueDate, u.usersID, e.FName As userFName, e.LName AS userLName, 
				TIMESTAMPDIFF(day, c.DateCreated, now()) AS days, patientEntity.FName AS patientFName, 
				patientEntity.LName AS patientLName, p.PatientID
				FROM Claim c 
				LEFT JOIN pa_master.Users u ON c.AssignedToUserID = u.UsersID 
				LEFT JOIN Entity e ON u.EntityID = e.EntityID
				LEFT JOIN [Procedure] cp ON c.ClaimID = cp.ClaimID
				LEFT JOIN Entity patientEntity ON c.entityID = patientEntity.EntityID				
				LEFT JOIN Patient p ON c.entityID = p.EntityID			
				
				WHERE c.ClientID = #trim(session.clientID)#	AND c.Active = 1 AND c.AssignedToUserID = #session.user.getUsersID()#			
				<!---This cancels out the nagatives it is ClaimStausCode 22 which is a reversal but the agents should not see it.--->
				AND c.ClaimStatusCode NOT IN(189)	
				AND (c.StatusID NOT IN(199,201,202) OR c.statusID IS NULL)				
								
				ORDER BY #trim(OrderBy)# #trim(Order)#						
			</cfsavecontent>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Run the query that was just built.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getClaims" datasource="#trim(request.datasource)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>
				


			<!-------------------------------------------------------------------------------------->
			<!--- Code Needed to run the Next N records view of claims query.                    --->
			<!-------------------------------------------------------------------------------------->
			<cfparam name="startRow_Claim" default="1" type="numeric">	
			<cfif IsDefined("form.startRow_Claim") AND form.startRow_Claim NEQ "">
				<cfset startRow_Claim = form.startRow_Claim>
			<cfelseif IsDefined("url.startRow_Claim") AND url.startRow_Claim NEQ "">
				<cfset startRow_Claim = url.startRow_Claim>	
			</cfif>
			
			<cfparam name="showAll" type="boolean" default="No">
			<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
				<cfset showAll = form.showAll>
			<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
				<cfset showAll = url.showAll>	
			</cfif>			
			
			<cfif IsDefined("form.rowsPerPage_Claim") AND form.rowsPerPage_Claim NEQ "">
				<cfset session.rowsPerPage_Claim = form.rowsPerPage_Claim>
			<cfelseif IsDefined("url.rowsPerPage_Claim") AND url.rowsPerPage_Claim NEQ "">
				<cfset session.rowsPerPage_Claim = url.rowsPerPage_Claim>	
			<cfelseif IsDefined("session.rowsPerPage_Claim") AND IsNumeric(session.rowsPerPage_Claim)>
				<cfset session.rowsPerPage_Claim = session.rowsPerPage_Claim>	
			<cfelse>
				<cfset session.rowsPerPage_Claim = session.Client.getRecordsPerPage()>
			</cfif>
						
			<cfset totalRows = getClaims.recordCount>
			<cfif showAll>
				<cfset rowsPerPage = totalRows>
			</cfif>
			<cfset endRow_Claim = min(startRow_Claim + session.rowsPerPage_Claim - 1, totalRows)>
			<cfset startRowNext = endRow_Claim + 1>
			<cfset startRowBack = startRow_Claim - session.rowsPerPage_Claim>		
			
									
									
			<!-------------------------------------------------------------------------------------->
			<!--- Start the display of this page.                                                --->
			<!-------------------------------------------------------------------------------------->					
			<cfif getClaims.RecordCount GTE 2>
				<cfset title = getClaims.recordcount & "&nbsp;Claims&nbsp;Found">
			<cfelseif getClaims.RecordCount EQ 1>
				<cfset title = getClaims.recordcount & "&nbsp;Claim&nbsp;Found">
			<cfelse>
				<cfset title = "No&nbsp;Claims&nbsp;Found">	
			</cfif> 
			
			<cf_gcBorderedTable	title="#title#" titleRight="<span  class=siteLabel style=""cursor: hand;"" onclick=""searchClaims();""><u>Search&nbsp;Claims</u></span>">	
				
				<cfif getClaims.Recordcount GTE 1>
				
					<cf_gcNextNRecords type="Claim">					
					
						<cf_gcTableScrollFixedHeader headers="Claim&nbsp;ID,Patient,Due" mainwidth="325" mainheight="475">	
															
							<cfset request.thisClaim = CreateObject("component","com.common.Claim")>	
													
							<cfloop query="getClaims" startRow="#trim(startRow_Claim)#" endRow="#trim(endRow_Claim)#">					
										
								<cfset boldThis = 0>										
								
								<!-------------------------------------------------------------------------------------->
								<!--- Initialize the object with this iteration                                      --->
								<!-------------------------------------------------------------------------------------->							
								<cfset request.thisClaim.Init(trim(claimID))>								
								
								
								<!-------------------------------------------------------------------------------------->
								<!--- Find out if this user has viewed this Claim if not add the record that they    --->
								<!--- have opened it.                                                                --->
								<!-------------------------------------------------------------------------------------->															
								<cfset viewed = request.thisClaim.ClaimHasBeenViewed(usersID: trim(session.User.getUsersID()), claimID: trim(claimID))>
															
								<cfif viewed LTE 0>	
									<cfset boldThis = 1>																					
								</cfif>
								
								<cfif session.User.getLastOpenedClaimID() EQ claimID>
									<cfset rowColor = "DCE3EB">
								<cfelseif DateDiff("d",NOW(), DueDate) LT 8>
									<cfset rowColor = "ff6666">
								<cfelseif DateDiff("d",NOW(), DueDate) LTE 14>
									<cfset rowColor = "FFFF66">
								<cfelse>
									<cfif currentrow MOD 2 EQ 0> 
										<cfset rowColor = "f9f9f9">
									<cfelse>
										<cfset rowColor = "FFFFFF">	
									</cfif>
								</cfif>
																
								<cfif ClaimType EQ 109>
									<cfset top = (session.screenHeight - 480) / 2>
									<cfset left = (session.screenWidth - 850) / 2>
									<cfset onclick = "editClaim=window.open('appClaimEdit.cfm?claimid=#trim(claimID)#','editClaim','top=#top#,left=#left#,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=850,height=480'); editClaim.focus(0);"> 
									<cfset onmouseover = "doTooltip(1, this, event, 'Claim ID: <a href=https://secure.tmhp.com/Claim%20Status%20Inquiry/default.aspx?pn=ClaimView&src=RS&icn=#InterchangeClaimID# target=_blank>#InterchangeClaimID#</a> click on the Claim ID to go to the TMHP website.');">
								<cfelseif ClaimType EQ 108>
									<cfset top = (session.screenHeight - 480) / 2>
									<cfset left = (session.screenWidth - 950) / 2>
									<cfset onclick = "editClaim=window.open('appClaimEditMedicare.cfm?claimid=#trim(claimID)#','editClaim','top=#top#,left=#left#,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=950,height=480'); editClaim.focus(0);"> 
									<cfset onmouseover = "">										
								</cfif>			
								
								<!---<cfset patientOnclick = "editPatient=window.open('appPatient.cfm?patientid=#trim(patientID)#','editPatient','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=900,height=480'); editPatient.focus(0);"> --->
																	
								<tr bgcolor=#trim(rowColor)# style="cursor: hand;" onmouseover="this.style.backgroundColor='lightgrey'; #onmouseover#" onmouseout="this.style.backgroundColor='#trim(rowColor)#'; hideTip();">			
									<!---<td class="SiteLabel" nowrap><cfif boldThis><strong></cfif>#trim(InterchangeClaimID)#<cfif boldThis></strong></cfif></td>																			
									<td class="sitelabel" align="center"><cfif boldThis><strong></cfif>#request.thisClaim.getClaimProcduresOpenCloseString(claimID)#<cfif boldThis></strong></cfif></td>											
									--->
									<td class="SiteLabel" onclick="#onclick#" nowrap title="#claimID#"><cfif boldThis><strong></cfif>#trim(InterchangeClaimID)# -#request.thisClaim.getClaimProcduresOpenCloseString(claimID)#<cfif boldThis></strong></cfif></td>																			
									<td class="SiteLabel" onclick="#onclick#" nowrap align="left"><cfif boldThis><strong></cfif>#REQUEST.capitalizeEveryFirstLetter(patientLName)#, #REQUEST.capitalizeEveryFirstLetter(patientFName)#<cfif boldThis></strong></cfif></td>							
									<td class="SiteLabel" onclick="#onclick#" nowrap title="#DateFormat(trim(DueDate), "mm/dd/yy")#"><cfif boldThis><strong></cfif>#DateFormat(trim(DueDate), "m/d")#<cfif boldThis></strong></cfif></td>																	
								</tr>							
								
								<tr>
								    <td bgcolor="000000" colspan="5" style="height: 1px; border: 0px solid FF0000; padding: 0px 0px 0px 0px;"></td>
								</tr>
									
							</cfloop>
								
						</cf_gcTableScrollFixedHeader>	
							
						<table cellspacing="0" cellpadding="0" border="0">														
							<tr>
							    <td bgcolor="FFFFFF" colspan="11" style="height: 4px; border: 0px solid FFFFFF; padding: 0px 0px 0px 0px;"></td>
							</tr>	
							<tr>	   
								<td class="sitelabel" bgcolor="FF0000" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FF0000">m</font></td>
								<td class="sitelabel">&nbsp;7&nbsp;days</td>
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="FFFF66" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FFFF66">m</font></td>
								<td class="sitelabel">&nbsp;14&nbsp;days</td>   	
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="DCE3EB" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="DCE3EB">m</font></td>
								<td class="sitelabel">&nbsp;Last&nbsp;Viewed</td> 						 
							</tr>
						</table>	
							
							
							
					</cf_gcNextNrecords>	
							
				
				<cfelse>
					
					<table align="left" cellpadding="5" cellspacing="0" border="0">				
						<tr>
							<td class="SiteLabel" valign="top">
								You have no assigned claims.
							</td>															
						</tr>
					</table>
						
				</cfif>			
											
			
			</cf_gcBorderedTable>			
							
			
			<cfcatch type="Any">
				
				<cfoutput>						
					<p>Caught an exception, type = #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>	 			
				</cfoutput>
				<cfexit>
				
			</cfcatch>

		</cftry>
	
	</cfoutput>

	