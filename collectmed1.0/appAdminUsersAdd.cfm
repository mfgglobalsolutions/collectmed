	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.fontFace" default="#request.Site.getFont()#">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="#request.Site.getFontSize()#">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="#request.Site.getFontColor()#">
	<cfset fontColor = attributes.fontColor>	
	
	<cfparam name="attributes.formName" default="createAccount">
	<cfset formName = attributes.formName>
	
	
	
<!------------------------------------------------------------------>
<!--- Get all the Roles available for this site.                 --->
<!------------------------------------------------------------------>	
	<cfset request.Role = CreateObject("component","com.common.Role")>			
	<cfset getRoles = request.Role.getRoles(clientID: trim(session.clientID), groupByEditable: true)>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the WorkGroups available for this site.                                --->
<!-------------------------------------------------------------------------------------->			
	<cfset request.WorkGroup = CreateObject("component","com.common.WorkGroup")>	
	<cfset getWorkGroups = request.WorkGroup.getWorkGroups(clientID: trim(session.clientID))>	
	
		
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the addresses that the client has on record.                           --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getCorporateAddresses" datasource="#trim(request.datasource)#">
		SELECT a.AddressID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, ea.IsDefault
		FROM address AS a   INNER JOIN entityaddress AS ea ON a.AddressID = ea.AddressID
		WHERE ea.EntityID = (SELECT EntityID FROM pa_master.client   WHERE ClientID = #trim(session.clientID)#)
	</cfquery>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Include WddxRecordset support                                                  --->
<!-------------------------------------------------------------------------------------->
    <script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>
	
		
<!-------------------------------------------------------------------------------------->
<!--- If browser is IE under windows                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
    <cfelse>
    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
    </cfif>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the javascript that this page will validate before submitting.          --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">
			
			function checkRoles(){
				
				var result = false;
				var msg = "";
				
				for (var counter = 0; counter < document.#trim(formname)#.RolesToAssociate.length; counter++){
					if (document.#trim(formname)#.RolesToAssociate[counter].checked){
						result = true;
						break;
					};	
				};
				
				if(!result){				
					msg = msg + "* Please select at least on role to associate to" + "\n\n";
				};
					
				return msg;	
				
			};
			
			
			function checkWorkGroups(){
				
				var result = false;
				var msg = "";				
				var WorkGroupsIDs = new Array();			
			
				<cfset count = 0>
				<cfloop query="getWorkGroups">				
					<cfset count = count + 1>				
					WorkGroupsIDs[#trim(count)#] = "#trim(WorkGroupID)#";				
				</cfloop> 
						
				for (i = 1; i < WorkGroupsIDs.length; i++){			            	
					if(eval('document.getElementById(\"GroupCheckbox_' + WorkGroupsIDs[i] + '\").checked')){
						result = true;
					  	break;
					};   
				};                                                                      
	        
			
				if(!result){				
					msg = msg + "* Please select at least on Work Group to associate to" + "\n\n";
				};
					
				return msg;	
				
			};
			
			function changeAddress(sel){				
				if(sel > -1){
					document.#trim(formname)#.NewUsersHiddenAddressTypeID.value = AddressTypeID[sel];
					document.#trim(formname)#.NewUsersHiddenAddressLine1.value = AddressLine1[sel];
					document.#trim(formname)#.NewUsersHiddenAddressLine2.value = AddressLine2[sel];
					document.#trim(formname)#.NewUsersHiddenAddressCity.value = AddressCity[sel]; 
					document.#trim(formname)#.NewUsersHiddenAddressStateID.value = AddressStateID[sel];
					document.#trim(formname)#.NewUsersHiddenAddressZipCode.value = AddressZipCode[sel];						
				};
			};
			
			function addNewUserAddressToArray(typeid, line1, line2, city, stateid, zipcode){
				if(typeid != '' && line1 != '' && city != '' && stateid != '' && zipcode){
					var len = addAddressToArray(typeid, line1, line2, city, stateid, zipcode);							
					document.#trim(formname)#.NewUsersAddressTypeID.value = '';
					document.#trim(formname)#.NewUsersAddressLine1.value = ''; 
					document.#trim(formname)#.NewUsersAddressLine2.value = '';				
					document.#trim(formname)#.NewUsersAddressCity.value = ''; 
					document.#trim(formname)#.NewUsersAddressStateID.value = ''; 
					document.#trim(formname)#.NewUsersAddressZipCode.value = '';	
					changeAddress(len);
					document.all.NewUsersAddress.options[len].selected = true;										
					NewUsersAddressInput.style.display='none';
					NewUsersAddressSelect.style.display='inline';					
				};
			};
			
			function addAddressToArray(typeid, line1, line2, city, stateid, zipcode){
								
				var newLength = eval(AddressIDs.length);
								
				AddressIDs[newLength] = newLength;
				AddressTypeID[newLength] = typeid;
				AddressLine1[newLength] = line1; 
				AddressLine2[newLength] = line2;				
				AddressCity[newLength] = city; 
				AddressStateID[newLength] = stateid; 
				AddressZipCode[newLength] = zipcode;	
														
				thisAddressID = AddressIDs[newLength];
				thisAddressLine1 = AddressLine1[newLength];
				thisAddressLine2 = AddressLine2[newLength];
				thisAddressCity = AddressCity[newLength];
				thisAddressStateID = AddressStateID[newLength];
				thisAddressZipCode = AddressZipCode[newLength];			
				thisAddress = thisAddressLine1 + " " + thisAddressLine2 + " " + thisAddressCity + ", " + getState(thisAddressStateID) + " " + thisAddressZipCode;			
				document.all.NewUsersAddress.options[newLength] = new Option(thisAddress, thisAddressID);								
				return newLength;									
				
			};
			
								
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
	  			
			function checkEmailAddress(email){						
				
				var url = "#trim(request.urlReconstructed)#/ws/wsEmailAddress.cfc?method=wsEmailExists&Data1=" + escape(email);				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {					
					return result;
				};
				else{					
					return false;
				}	
			};
			
			
			function getState(id){						
				
				var url = "#trim(request.urlReconstructed)#/ws/wsState.cfc?method=wsGetState&id=" + escape(id);				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {					
					return result;
				};
				else{					
					return id;
				}	
			};
			
			
			function validateForm(){	
				
				var msg  = "";			
				
				msg = msg + checkNewUserInformation();						
					
				msg = msg + checkNewUsersAddress();		
				
				msg = msg + checkRoles();				
				
				msg = msg + checkWorkGroups();				
						
				if(msg.length >= 1){
					alert(msg);
					resetSubmitButtons();
					return false;
				}
				else{
					return true;
				};	
			};			
			
									
			function IsValidEmailJS(str) {									
							
				var regEx = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; 
				if (!regEx.test(str)) {										
					return false
				}
				else return true;  
				
			}	
			
			
			function checkNewUserInformation(){
				
				var msg  = "";				
					
				if (document.#trim(formname)#.NewUserFName.value == ""){
					document.#trim(formname)#.NewUserFName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the users first name" + "\n\n";
				}
				else{
					document.#trim(formname)#.NewUserFName.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.NewUserLName.value == ""){
					document.#trim(formname)#.NewUserLName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the users last name" + "\n\n";
				}
				else{
					document.#trim(formname)#.NewUserLName.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.NewUserPhoneNumber.value == ""){
					document.#trim(formname)#.NewUserPhoneNumber.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the users phone number" + "\n\n";
				}
				else{
					document.#trim(formname)#.NewUserPhoneNumber.className = 'SiteTextbox';
				};		
				
				if (document.#trim(formname)#.NewUserPhoneNumber.value.length < 10){
					document.#trim(formname)#.NewUserPhoneNumber.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide a proper phone number length" + "\n\n";
				}
				else{
					document.#trim(formname)#.NewUserPhoneNumber.className = 'SiteTextbox';
				};		
				
				
				if (document.#trim(formname)#.NewUserEmailAddress.value == ""){
					document.#trim(formname)#.NewUserEmailAddress.className = 'SiteTextboxALERT'; 					
					msg = msg + "* Please provide the users email address" + "\n\n";
				}					
				else if(!IsValidEmailJS(document.#trim(formname)#.NewUserEmailAddress.value)){
					document.#trim(formname)#.NewUserEmailAddress.className = 'SiteTextboxALERT'; 
					msg = msg + "\"" + document.#trim(formname)#.NewUserEmailAddress.value + "\" is an invalid e-mail address\n\n"; 							
				};					
				else{					
					document.#trim(formname)#.NewUserEmailAddress.className = 'SiteTextbox';
				};
																
				return msg;
				
			};					
						
			function addNewUsersAddress(){
				if(NewUsersAddressInput.style.display == 'none'){		
					NewUsersAddressSelect.style.display='none';
					NewUsersAddressInput.style.display='inline';
				}
				else{
					NewUsersAddressInput.style.display = 'none';
					NewUsersAddressSelect.style.display='inline';
				};			
			};
			
			function checkNewUsersAddress(){
				
				var msg = "";				
				var a = "";
				
				if(document.#trim(formname)#.NewUsersHiddenAddressTypeID.value == ""){						
					a = 1;
				};
				if(document.#trim(formname)#.NewUsersHiddenAddressLine1.value == ""){						
					a = 1;
				};
				if(document.#trim(formname)#.NewUsersHiddenAddressCity.value == ""){						
					a = 1;
				};
				if(document.#trim(formname)#.NewUsersHiddenAddressStateID.value == ""){						
					a = 1;
				};
				if(document.#trim(formname)#.NewUsersHiddenAddressZipCode.value == ""){						
					a = 1;
				};
				
				if(a == 1){				
					msg = msg + "* Please select an address" + "\n\n";
				};
					
				return msg;	
			};
							
		</script>	
		
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form method="post" name="#trim(formname)#" action="appAdminUsersAddProcess.cfm" onsubmit="return validateForm();">		
			
			<input type="Hidden" name="NewUsersHiddenAddressTypeID" value="">
			<input type="Hidden" name="NewUsersHiddenAddressLine1" value="">
			<input type="Hidden" name="NewUsersHiddenAddressLine2" value="">				
			<input type="Hidden" name="NewUsersHiddenAddressCity" value="">
			<input type="Hidden" name="NewUsersHiddenAddressStateID" value="">
			<input type="Hidden" name="NewUsersHiddenAddressZipCode" value="">
						
			
			<table border="0" cellpadding="0" cellspacing="0">		
			<tr>
				<td>&nbsp;</td>
			</tr>		
			
			<tr>
				<td>
			
					<!------------------------------------------------------------------>
					<!--- Show an Admin information on this page.                    --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="New User Information" tableWidth="100%">	
						
						<!---start Admin information--->
						<table border="0" cellpadding="1" cellspacing="0">							
							<tr>
								<td class="SiteRequiredLabel">										
									Name&nbsp;															
								</td>
								<td class="SiteRequiredLabel">									
									First&nbsp;<input class="SiteTextbox" type="text" name="NewUserFName" size="15" maxlength="50" value="">&nbsp;&nbsp;<font color="#trim(fontColor)#">M</font>&nbsp;<input class="SiteTextbox" type="text" name="NewUserMName" size="3" maxlength="50" value="">&nbsp;&nbsp;Last&nbsp;<input class="SiteTextbox" type="text" name="NewUserLName" size="15" maxlength="50" value="">&nbsp;								
								</td>
							</tr>								
							<tr>
								<td class="SiteRequiredLabel">		
									Phone&nbsp;Number:&nbsp;															
								</td>
								<td>		
									<input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="NewUserPhoneNumber" size="20" maxlength="80">	
									<font size="1">ext.</font> <input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="NewUserPhoneNumberExtension" size="5" maxlength="6">	
								</td>
							</tr>
							<tr>
								<td class="SiteRequiredLabel">								
									Email&nbsp;Address:&nbsp;															
								</td>
								<td>
									<input class="SiteTextbox" type="text" name="NewUserEmailAddress" size="35" maxlength="80" value="" onblur="if (checkEmailAddress(this.value) == 'true'){document.#trim(formname)#.NewUserEmailAddress.value = ''; spNewUserEmailAddress.innerHTML = '-&nbsp;This&nbsp;email&nbsp;address&nbsp;already&nbsp;exists.&nbsp;-';} else {spNewUserEmailAddress.innerHTML = '';};">
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td valign="top"><font size="1" face="#trim(fontFace)#" color="990000">(username / password will be emailed)</font></td>
							</tr>		
							<tr>								
								<td colspan="2" align="center">
									<span id="spNewUserEmailAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span>
								</td>
							</tr>														                				
						</table>
							
					</cf_gcBorderedTable>
			
				</td>
			</tr>
			
						
			<tr>
				<td>
								
					<!------------------------------------------------------------------>
					<!--- Show an address on this page.                              --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="New&nbsp;User&nbsp;Address" tableWidth="100%">	
											
						<table border="0" cellpadding="1" cellspacing="0" id="NewUsersAddressInput" style="display:'none';">						
							<tr>
								<td class="SiteRequiredLabel">				   			
									Address&nbsp;Type:&nbsp;							
								</td>
								<td colspan="2" valign="middle">									
									<cfset getAllAddressTypes = application.beanFactory.getBean('StandardListItemIO').getStandardListItemQuery(listid: '3', active: '1') />
																		
									<select class="SiteSelectBox" name="NewUsersAddressTypeID">											
										<cfloop query="getAllAddressTypes">
											<option value="#StandardListItemID#" <cfif StandardListItemID EQ 13>SELECTED</cfif>> #ItemNameDisplay#
										</cfloop>
									</select>						
								</td>
							</tr>			
							<tr>
								<td class="SiteRequiredLabel">			   
						   			Address&nbsp;Line&nbsp;1:&nbsp;									
								</td>
								<td colspan="2">
						   			<input class="SiteTextbox" type="text" name="NewUsersAddressLine1" size="35" maxlength="80" value="">
								</td>
							</tr>			
							<tr>
								<td class="SiteLabel">			   
						   			Address&nbsp;Line&nbsp;2:&nbsp;									
								</td>
								<td colspan="2">
						   			<input class="SiteTextbox" type="text" name="NewUsersAddressLine2" size="35" maxlength="80" value="">
								</td>
							</tr>				
							<tr>
								<td class="SiteRequiredLabel">			   
						   			City,&nbsp;State&nbsp;Zip&nbsp;Code&nbsp;									
								</td>
								<td colspan="2">
						   			<input class="SiteTextbox" type="text" name="NewUsersAddressCity" size="15" maxlength="50" value="">&nbsp;&nbsp;<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates"><select class="SiteSelectBox" name="NewUsersAddressStateID"><option value=""><cfloop query="getAllStates"><option value="#StandardListItemID#" <cfif StandardListItemID EQ 59>SELECTED</cfif>> #ItemNameDisplay#</cfloop></select>&nbsp;<input class="SiteTextbox" type="Text" name="NewUsersAddressZipCode" size="10" maxlength="25" value="" onblur="spSaveNewUsersAddress.innerHTML = '- Please save this address. - ';"> 					
								</td>
							</tr>	
							<tr>
								<td colspan="3" align="center" style="padding-top:1.0ex">
									<input type="Button" class="SiteSubmitbox" value="Save Address" onclick="addNewUserAddressToArray(document.#trim(formname)#.NewUsersAddressTypeID.value, document.#trim(formname)#.NewUsersAddressLine1.value, document.#trim(formname)#.NewUsersAddressLine2.value, document.#trim(formname)#.NewUsersAddressCity.value, document.#trim(formname)#.NewUsersAddressStateID.value, document.#trim(formname)#.NewUsersAddressZipCode.value);">
								</td>
							</tr>	
							<tr>
								<td colspan="3" align="center"><span id="spSaveNewUsersAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
							</tr>								
						</table>	


						<!-------------------------------------------------------------------------------------->
						<!--- Show the select box of available addresses from the corporate client account.  --->
						<!-------------------------------------------------------------------------------------->						
						<table border="0" cellpadding="0" cellspacing="0" id="NewUsersAddressSelect" style="display:'inline';">								
							<tr>
								<td class="SiteRequiredLabel" colspan="2" align="center" style="padding-bottom: 6px">Only the selected address will be saved.</td>
							</tr>								
							<tr>
								<td class="SiteRequiredLabel">Address:</td>
								<td class="SiteLabel">
									<select style="width:275px;" name="NewUsersAddress" onchange="changeAddress(this.selectedIndex);" class="SiteSelectBox"></select>
								</td>	
							</tr>	
							<tr>
								<td>&nbsp;</td>
								<td valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addNewUsersAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="addNewUsersAddress();"><u><font color="FF0000">Add&nbsp;an&nbsp;address</font></u></span><span class="med" style="display:'none'; cursor: hand; padding-top:0.0ex" id="editNewUsersAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="editNewUsersAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Edit&nbsp;this&nbsp;address</font></u></span><span class="med" style="display:'none'; cursor: hand; padding-top:0.0ex" id="deleteNewUsersAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteNewUsersAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Delete&nbsp;this&nbsp;address</font></u></span></td>
							</tr>	
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>								
						</table>							
						
					</cf_gcBorderedTable>
				
				</td>
			</tr>				
			
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
					
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="New User Roles" Align="center" tableWidth="100%">
						
						<table style="border-width: thin; border-style: solid;" align="center">
							<tr>
								<td>
									<table>
										<tr>
											<td align="right" nowrap>		
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
													Roles to associate to:								
												</font>		
											</td>
											<td nowrap>
												<cfset currentHeader = "no show">
												<cfloop query="getRoles">
													<cfif currentHeader NEQ Editable>
														<cfset currentHeader = "#Editable#">
														<cfif currentHeader EQ 0>
															<span style="background-color: c0c0c0;"><strong><li>Application Roles</li></strong></span><br>
														<cfelseif currentHeader EQ 1>
															<span style="background-color: c0c0c0;"><strong><li>Custom Roles</li></strong></span><br>	
														</cfif>
													</cfif>	
													<input type="Checkbox" name="RolesToAssociate" value="#RoleID#"> 
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
														#RoleName#<cfif Active NEQ 1><font face="#request.Site.getFont#" size="1" color="red"> (currently not active)</font></cfif><br>								
													</font>	
												</cfloop>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						
					</cf_gcBorderedTable>	
					
				</td>
			</tr>

			
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			
	
			<!--- User Workgroups --->
			<tr>
				<td align="center" colspan="2">
					
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="New User Groups" Align="center" tableWidth="100%">
						
						<table style="border-width: thin; border-style: solid;" border="0" cellpadding="2" cellspacing="2" align="center" width="100%">
							<tr>
								<td class="SiteLabel" align="right" nowrap>		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
										Groups Available:
									</font>										
								</td>							
								<td class="SiteLabel">		
									<table>								
										<cfloop query="getWorkGroups">
											<tr><td class="SiteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="Checkbox" value="#trim(WorkGroupID)#" name="GroupCheckbox_#trim(WorkGroupID)#"><font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">&nbsp;#trim(WorkGroupName)#</font></td></tr>
										</cfloop>
									</table>													
								</td>							
							</tr>																				
						</table>
						
					</cf_gcBorderedTable>	
					
				</td>
			</tr>
			
	
	
	
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center">			
					<cf_gcSubmitButton value="Create&nbsp;User">						
				</td>
			</tr>			
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
		
			
		<!-------------------------------------------------------------------------------------->
		<!--- This Javascript code must remain below the form so that the scripts            --->
		<!--- initialize correctly.                                                          --->
		<!-------------------------------------------------------------------------------------->		
		<script language="JavaScript">	
	
			var AddressIDs = new Array();
			var AddressTypeID = new Array();
			var AddressLine1 = new Array();
			var AddressLine2 = new Array();
			var AddressCity = new Array();
			var AddressStateID = new Array();
			var AddressZipCode = new Array();
			
			AddressIDs[0] = "";		
			AddressTypeID[0] = "";
			AddressLine1[0] = "Select Address";	
			AddressLine2[0] = "";	
			AddressCity[0] = "";
			AddressStateID[0] = "";		
			AddressZipCode[0] = "";	
			
			<cfset count = 0>
			
			<cfloop query="getCorporateAddresses">
				
				<cfset count = count + 1>
				
				AddressIDs[#trim(count)#] = "#trim(count)#";		
				AddressTypeID[#trim(count)#] = "#trim(AddressTypeID)#";
				AddressLine1[#trim(count)#] = "#trim(AddressLine1)#";	
				AddressLine2[#trim(count)#] = "#trim(AddressLine2)#";	
				AddressCity[#trim(count)#] = "#trim(city)#";
				AddressStateID[#trim(count)#] = "#trim(stateID)#";		
				AddressZipCode[#trim(count)#] = "#trim(zipcode)#";	
			
			</cfloop> 
						
			thisAddressID = AddressIDs[0];
			thisAddressLine1 = AddressLine1[0];				
			thisAddress = thisAddressLine1;
			document.all.NewUsersAddress.options[0] = new Option(thisAddress, thisAddressID);		
								
			for (i = 1; i < AddressIDs.length; i++){
				thisAddressID = AddressIDs[i];
				thisAddressLine1 = AddressLine1[i];				
				thisAddressLine2 = AddressLine2[i];
				thisAddressCity = AddressCity[i];
				thisAddressStateID = AddressStateID[i];
				thisAddressZipCode = AddressZipCode[i];
												
				thisAddress = thisAddressLine1 + ' ' + thisAddressLine2 + ' ' +  thisAddressCity + ', ' + getState(thisAddressStateID) + ' ' + thisAddressZipCode;
				document.all.NewUsersAddress.options[i] = new Option(thisAddress, thisAddressID);			
			};	
		</script>
		
		
	</cfoutput>	
	
	