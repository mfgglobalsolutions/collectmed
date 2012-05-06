
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50">
 	<cfset wholeNumbers = attributes.wholeNumbers>
 
	<cfparam name="attributes.numberOfItemsPerRow" default="4">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>
	
	<cfparam name="attributes.formname" default="addNoteForm">
	<cfset formname = attributes.formname>
		
	<cfparam name="attributes.id" default="">
	<cfset id = attributes.id>
	
	<cfparam name="attributes.objectID" default="">
	<cfset objectID = attributes.objectID>
	
	<cfparam name="attributes.instanceID" default="">
	<cfset instanceID = attributes.instanceID>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->		
		<cfoutput>
			<script language="JavaScript">				
				function AddNoteText#trim(id)#(pasteText){
					var sText#id# = window.frames['DHTMLEditor#id#'].document.selection.createRange();
					sText#id#.pasteHTML(pasteText);
				}								
			</script>
		</cfoutput>
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->		
	<cfoutput>
		<table cellpadding="5" cellspacing="0" border="0">				
			<tr style="display:none" id="addNoteEntry_#trim(id)#">					
				<td valign="top">			   
		  				
					<form name="AddNoteEntry_#trim(id)#" action="appPatientNoteProcess.cfm" method="post" onsubmit="document.all.note_#ID#.value = document.frames('DHTMLEditor#ID#').document.body.innerHTML;">
						<input type="Hidden" name="noteID" value="#ID#">
						<input type="Hidden" name="objectID" value="#trim(objectID)#">
						<input type="Hidden" name="instanceID" value="#trim(instanceID)#">
																	
						<table cellspacing="4" cellpadding="3" border="0">
							
							<!---Tie--->
							<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID)>																		
								
								<cfset request.instance = CreateObject("component","com.common.db.PatientIO")>
								<cfset parametersList = "PatientID,DateCreated">
								<cfset parametersListDisplay = "Patient&nbsp;ID,Date&nbsp;Created">
								<cfset request.instance.init(trim(InstanceID))>
								
								<tr id="showParameters">
									<td colspan="2" class="SiteLabel">						
										<div style="border: 1px solid; border-color: c0c0c0 c0c0c0 c0c0c0 c0c0c0; padding: 4px;">
			
											<table border="0" cellpadding="3" cellspacing="0">
									   			<tr>
												<cfset count = 1>
									    		<cfloop list="#trim(parametersList)#" index="i">    
									     			
													<cfset thisParameter = "request.instance.get" & i & "()">
													<cfif FindNoCase("Date", i)>
														<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
													</cfif>
													
													<cfset thisParameterValue = evaluate(thisParameter)>
													<cfset thisParameterDisplay = ListGetAt(parametersListDisplay, count)>
																								
													<cfif thisParameterValue NEQ "" AND thisParameterValue NEQ "NULL">
														<td class="SiteLabel"><u><span unselectable="on" style="cursor:hand;" onclick="AddNoteText#trim(id)#('#trim(thisParameterValue)#');">#trim(thisParameterDisplay)#</span></u></td>
													<cfelse>
														<td class="SiteLabel">#trim(thisParameterDisplay)#</td>
													</cfif>
										     		
													<cfif ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>
										      			</tr>     
										     		</cfif>
													
													<cfset count = count + 1>   
													      
										    	</cfloop>  
												
											</table>	
										</div>														
									</td>
								</tr>													
								
							</cfif>								
								
							<!--- Note --->
							<!---<input type="Hidden" name="parameter" value="">--->
							<tr>
								<td colspan="2">														
									<cf_gcHTMLNoteEditor form_name="AddNoteEntry_#trim(id)#" identifier="#trim(id)#" field_name="note_#ID#" verbage="" editHeight="45">						
								</td>									  
							</tr>															
							<tr>
							    <td colspan="2" align="center"><cf_gcSubmitButton value="Add&nbsp;Entry">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="if(document.all.addNoteEntry_#trim(ID)#.style.display=='none') {document.all.addNoteEntry_#trim(ID)#.style.display='block';}else {document.all.addNoteEntry_#trim(ID)#.style.display='none';};"></td>							   
							</tr>					
						</table>	
												
					</form>
									
				</td>						
			</tr>
		</table>
	
	</cfoutput>