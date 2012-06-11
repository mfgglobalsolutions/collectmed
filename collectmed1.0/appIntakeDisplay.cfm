<!---- appIntakeDisplay.cfm ---->


	
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfset intakeClearedBy = "">
	<cfset equipmentClearedBy = "">
	<cfset verifyClearedBy = "">
	<cfset physicianClearedBy = "">
	<cfset hcpcClearedBy = "">	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Include the file that WDDX needs to do it's job. Taken from the CFIDE folder.  --->
<!--------------------------------------------------------------------------------------> 		
	<cfoutput>		
		
		<script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>		
		
		<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
	    <cfelse>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
	    </cfif>
		
	</cfoutput>		
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
					
			// Utility function to fetch text from a URL
		    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
		    function _wddxSelectListGetFromURL(strURL) {
		        var objHTTP, result;
		    
		        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
		        if (window.XMLHttpRequest) {
		          objHTTP=new XMLHttpRequest();
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		    
		        // For IE browsers under Windows    
		        } else if (window.ActiveXObject) {
		          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		        }
		  
		        // Return result
		        return result;
		    }
			
			function getIntakeNote(data1){						
						
				var url = "#trim(request.urlReconstructed)#/ws/wsIntake.cfc?method=wsIntakeNotes&Data3=#trim(session.ClientID)#&Data1=" + escape(data1);			 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {						
					spIntakeNote.innerHTML = result;			
				};
									
			};
						
		</script>
		
	</cfoutput>	

	

<!-------------------------------------------------------------------------------------->
<!--- Query to get the Intakes.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getIntakes" datasource="#trim(request.datasource)#">
		SELECT i.patientXML, i.patientID, i.IntakeID, i.hidden_Step, i.hidden_UsersID, i.hidden_TimeStart, CONCAT(LEFT(e.FName, 1), ' ', LEFT(e.LName, 9)) AS patientNameTBox, a.City AS patientCityTBox, i.DateCreated,
		timestampdiff(hour, i.DateCreated, NOW()) AS hours, i.InactiveCode
		FROM Intake	i	
		LEFT JOIN Patient p ON i.PatientID = p.PatientID
		LEFT JOIN Entity e ON e.EntityID = p.EntityID
		LEFT JOIN ADDRESS a ON a.AddressID = i.patientAddressID
		WHERE i.AssignedToUserID = #session.user.getUsersID()# AND i.ClosingInvoiceNumber IS NULL AND i.Active = 1
		ORDER BY i.DateCreated						
	</cfquery>
	
	
	

<!-------------------------------------------------------------------------------------->
<!--- Set the task tab verbage.                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">
			var taskElement = document.getElementById("tabIntakeVerbage");
			if (taskElement != null){
				document.getElementById("tabIntakeVerbage").innerHTML = 'Intakes (#trim(getIntakes.RecordCount)#)';		
			};	
		</script>
	</cfoutput>		
		

		
<!-------------------------------------------------------------------------------------->
<!--- Code Needed to run the Next N records view of claims query.                    --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="startRow_Intake" default="1" type="numeric">	
	<cfif IsDefined("form.startRow_Intake") AND form.startRow_Intake NEQ "">
		<cfset startRow_Intake = form.startRow_Intake>
	<cfelseif IsDefined("url.startRow_Intake") AND url.startRow_Intake NEQ "">
		<cfset startRow_Intake = url.startRow_Intake>	
	</cfif>
	
	<cfparam name="showAll" type="boolean" default="No">
	<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
		<cfset showAll = form.showAll>
	<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
		<cfset showAll = url.showAll>	
	</cfif>			
	
	<cfif IsDefined("form.rowsPerPage_Intake") AND form.rowsPerPage_Intake NEQ "">
		<cfset session.rowsPerPage_Intake = form.rowsPerPage_Intake>
	<cfelseif IsDefined("url.rowsPerPage_Intake") AND url.rowsPerPage_Intake NEQ "">
		<cfset session.rowsPerPage_Intake = url.rowsPerPage_Intake>	
	<cfelseif IsDefined("session.rowsPerPage_Intake") AND IsNumeric(session.rowsPerPage_Intake)>
		<cfset session.rowsPerPage_Intake = session.rowsPerPage_Intake>	
	<cfelse>
		<cfset session.rowsPerPage_Intake = 10>
	</cfif>
				
	<cfset totalRows = getIntakes.recordCount>
	<cfif showAll>
		<cfset rowsPerPage = totalRows>
	</cfif>
	<cfset endRow_Intake = min(startRow_Intake + session.rowsPerPage_Intake - 1, totalRows)>
	<cfset startRowNext = endRow_Intake + 1>
	<cfset startRowBack = startRow_Intake - session.rowsPerPage_Intake>
		
	
			
			
<!-------------------------------------------------------------------------------------->
<!--- Show the intakes.                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
					
			<cfif getIntakes.RecordCount LTE 0>
				<cfset title = "No&nbsp;Intakes&nbsp;Found">			
			<cfelseif getIntakes.RecordCount GTE 2>
				<cfset title = getIntakes.recordcount & "&nbsp;Intakes&nbsp;Found">
			<cfelse>
				<cfset title = getIntakes.recordcount & "&nbsp;Intake&nbsp;Found">
			</cfif> 
			
			<!---<cfif ListContains(session.User.getRoleIDs(), "5") OR ListContains(session.User.getRoleIDs(), "6")>--->
				<cfset titleRight = "<span style=cursor:hand class=siteLabel onclick=""location.href='appFormPatientIntakeForm.cfm'""><u>New&nbsp;Intake</u></span>&nbsp;<span class=siteLabel>|</span>&nbsp;<span style=cursor:hand class=siteLabel onclick=""location.href='appPatientIntakeSearch.cfm?clear=1'""><u>Search&nbsp;Intakes</u></span>">
			<!---<cfelse>
				<cfset titleRight = "">
			</cfif>--->
			
			<!---<cf_gcBorderedTable	title="#title#" tableWidth="100%" tablealign="left" titleRight="#trim(titleRight)#">--->	
			<table border="0" cellspacing="1" cellpadding="2" width="98%">
				<tr>
					<td valign="bottom">
						<font color="003399" face="arial" size="2"><strong>#trim(title)#</strong></font>								
					</td>
					<td align="right" valign="middle">
						&nbsp;&nbsp;&nbsp;&nbsp;#trim(titleRight)#
					</td>
				</tr>		
								
				<cfif getIntakes.Recordcount GTE 1>
					
					<tr><td colspan="2">
					
					<cf_gcNextNRecords type="Intake">
						
						<cf_gcTableScrollFixedHeader headers="ID,Date&nbsp;Created,Input&nbsp;By,Patient,City" mainwidth="420">
							<cfset Priority = 1>											
							<cfloop query="getIntakes" startRow="#trim(startRow_Intake)#" endRow="#trim(endRow_Intake)#">							
									
								<!-------------------------------------------------------------------------------------->
								<!--- If the intakeID exists we have to check to see if the patientXML is available. --->
								<!-------------------------------------------------------------------------------------->
								<cfif patientID EQ "" AND patientXML NEQ "" AND IsXML(patientXML)>
									<cfset pXML = XMLParse(patientXML)>				
									<cfset patientid = trim(pXML.Patient.patientid.xmlText)>
									<cfset patientaddressid = trim(pXML.Patient.patientaddressid.xmlText)>									
									<cfset patientfnametbox = LEFT(trim(pXML.Patient.patientfnametbox.xmlText), 1)>									
									<cfset patientlnametbox = trim(pXML.Patient.patientlnametbox.xmlText)>									
									<cfset patientcitytbox = trim(pXML.Patient.patientcitytbox.xmlText)>	
									<cfset patientNameTBox2 = "#trim(patientfnametbox)# #trim(patientlnametbox)#"> 																															
								</cfif>												
								
								<cfquery name="getCreatorName" datasource="#trim(request.datasource)#">
									SELECT FName, LName 
									FROM view_useraccountparameters 
									WHERE UsersID = #trim(hidden_UsersID)#
								</cfquery>
								
								<cfloop list="#trim(hidden_Step)#" index="i" delimiters="~">
								
									<cfset stepNumber = ListGetAt(i, 1, "|")>								
									
									<cfif stepNumber EQ 1>
										<cfset intakeClearedBy = "<strong>Intake Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
									<cfelseif stepNumber EQ 2>
										<cfset equipmentClearedBy = "<strong>Equipment Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
									<cfelseif stepNumber EQ 3>
										<cfset verifyClearedBy = "<strong>Insurance Verification Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
									<cfelseif stepNumber EQ 4>
										<cfset physicianClearedBy = "<strong>Physician Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
									<cfelseif stepNumber EQ 5>									
										<cfset hcpcClearedBy = "<strong>HCPC Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
									</cfif>							
									
								</cfloop>
								
								<cfset popNote = "#intakeClearedBy#<br><br>" & "#equipmentClearedBy#<br><br>" & "#verifyClearedBy#<br><br>" & "#physicianClearedBy#<br><br>" & "#hcpcClearedBy#">
								<cfset displayPending = "FF0000">
								<cfif hours GT 96>
									<cfset rowColor = "ff6666">
									<cfset displayPending = "000000">
								<cfelseif hours GT 48 AND hours LTE 96>
									<cfset rowColor = "FFFF66">
								<cfelseif hours GT 24 AND hours LTE 48>
									<cfset rowColor = "CCFFCC">
								<cfelse>
									<cfif currentrow MOD 2 EQ 0> 
										<cfset rowColor = "f9f9f9">
									<cfelse>
										<cfset rowColor = "FFFFFF">	
									</cfif>							
								</cfif>								
								<cfif patientNameTBox NEQ "">
									<cfset patientNameTBox2 = patientNameTBox> 
								<cfelse>
									<cfset patientNameTBox2 = "">
								</cfif>														
								<tr bgcolor=#trim(rowColor)# style="cursor:hand" onclick="location.href='appPatientIntakeEdit.cfm?IntakeID=#trim(IntakeID)#'" style="cursor: hand;">			
									<td class="SiteLabel" nowrap align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '<span style=cursor:hand onmouseover=getIntakeNote(#trim(intakeID)#);><u><strong>View Intake Notes</strong></u></span><p><span id=spIntakeNote>&nbsp;</span>');" onmouseout="hideTip(this);">#intakeID#</span></td>
									<td class="SiteLabel" nowrap onmouseover="parentElement.style.backgroundColor='lightgrey'; doTooltip(0, this, event, '#trim(popNote)#');" onmouseout="parentElement.style.backgroundColor='#trim(rowColor)#'; hideTip(this);">#DateFormat(DateCreated, "m/dd/yy")# #TimeFormat(DateCreated, "hh:mm ttt")#</td>									
									<td class="SiteLabel" nowrap onmouseover="parentElement.style.backgroundColor='lightgrey'; doTooltip(0, this, event, '#trim(popNote)#');" onmouseout="parentElement.style.backgroundColor='#trim(rowColor)#'; hideTip(this);">#UCASE(LEFT(trim(getCreatorName.FName),1))#. #REQUEST.capitalizeEveryFirstLetter(trim(getCreatorName.LName))#</td>		
									<td class="SiteLabel" nowrap onmouseover="parentElement.style.backgroundColor='lightgrey'; doTooltip(0, this, event, '#trim(popNote)#');" onmouseout="parentElement.style.backgroundColor='#trim(rowColor)#'; hideTip(this);">#REQUEST.capitalizeEveryFirstLetter(trim(patientNameTBox2))#</td>			
									<td class="SiteLabel" nowrap onmouseover="parentElement.style.backgroundColor='lightgrey'; doTooltip(0, this, event, '#trim(popNote)#');" onmouseout="parentElement.style.backgroundColor='#trim(rowColor)#'; hideTip(this);"><cfif InactiveCode NEQ 298>#REQUEST.capitalizeEveryFirstLetter(trim(patientCityTBox))#<cfelse><font color="#trim(displayPending)#">[Pending]</font></cfif></td>									
								</tr>
												
								<tr>
								    <td bgcolor="000000" colspan="5" style="height: 1px; border: 0px solid FF0000; padding: 0px 0px 0px 0px;"></td>
								</tr>							
								<cfset patientNameTBox2 = ""> 
							</cfloop>
					
						</cf_gcTableScrollFixedHeader>	
						
						<table cellspacing="0" cellpadding="0" border="0">														
							<tr>
							    <td bgcolor="FFFFFF" colspan="11" style="height: 4px; border: 0px solid FFFFFF; padding: 0px 0px 0px 0px;"></td>
							</tr>	
							<tr style="cursor:hand">	   
								<td class="sitelabel" bgcolor="FF0000" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FF0000">m</font></td>
								<td class="sitelabel" onmouseover="doTooltip(1, this, event, 'Over 96 hours in queue');" onmouseout="hideTip(this);">&nbsp;Urgent</td>
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="FFFF66" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FFFF66">m</font></td>
								<td class="sitelabel" onmouseover="doTooltip(1, this, event, 'Over 48 hours in queue');" onmouseout="hideTip(this);">&nbsp;High</td>   	
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="CCFFCC" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="CCFFCC">m</font></td>
								<td class="sitelabel" onmouseover="doTooltip(1, this, event, 'Over 24 hours in queue');" onmouseout="hideTip(this);">&nbsp;Medium</td>   	
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="FFFFFF" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FFFFFF">m</font></td>
								<td class="sitelabel">&nbsp;Low</td>   	    
							</tr>
						</table>																		
									
					</cf_gcNextNrecords>
					
					</td></tr>
				
				<cfelse>
					
					<tr><td colspan="2">
					
						<table align="left" cellpadding="5" cellspacing="0" border="0">				
							<tr>
								<td class="SiteLabel" valign="top">
									There are no intakes to show.
								</td>															
							</tr>
						</table>
					
					</td></tr>	
						
				</cfif>					
							
				<!---</cf_gcBorderedTable>--->
				</table>
				
			
			<!--- CFCATCH QUERY ERRORS--->			
			<cfcatch type="Any">
				
				<cfoutput>
					
					<p>Caught an exception, type = #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>	 		      
	
				</cfoutput>
				<cfexit>
				
			</cfcatch>
			
		</cftry>
		
	</cfoutput>
		
		
