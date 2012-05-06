	

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
				
				var url = "#trim(request.urlReconstructed)#/ws/wsEmailAddress.cfc?method=wsEmailExists&data1=" + escape(email);				 
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
			
							
			function validateForm(){	
				
				var msg  = "";
				
				msg = msg + checkCorporateInformation();		
				
				msg = msg + checkAdministratorInformation();		
				
				//msg = msg + checkPaymentPreference();		
						
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
			
			
			function checkAdministratorInformation(){
				
				var msg  = "";				
					
				if (document.#trim(formname)#.AdministratorFName.value == ""){
					document.#trim(formname)#.AdministratorFName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the administrators first name" + "\n\n";
				}
				else{
					document.#trim(formname)#.AdministratorFName.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.AdministratorLName.value == ""){
					document.#trim(formname)#.AdministratorLName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the administrators last name" + "\n\n";
				}
				else{
					document.#trim(formname)#.AdministratorLName.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.AdministratorPhoneNumber.value == ""){
					document.#trim(formname)#.AdministratorPhoneNumber.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the administrators phone number" + "\n\n";
				}
				else{
					document.#trim(formname)#.AdministratorPhoneNumber.className = 'SiteTextbox';
				};	
								
				if (document.#trim(formname)#.AdministratorPhoneNumber.value.length < 10){
					document.#trim(formname)#.AdministratorPhoneNumber.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide a proper administrator phone number length" + "\n\n";
				}
				else{
					document.#trim(formname)#.AdministratorPhoneNumber.className = 'SiteTextbox';
				};		
								
				if (document.#trim(formname)#.AdministratorEmailAddress.value == ""){
					document.#trim(formname)#.AdministratorEmailAddress.className = 'SiteTextboxALERT'; 					
					msg = msg + "* Please provide the administrators email address" + "\n\n";
				}					
				else if(!IsValidEmailJS(document.#trim(formname)#.AdministratorEmailAddress.value)){
					document.#trim(formname)#.AdministratorEmailAddress.className = 'SiteTextboxALERT'; 
					msg = msg + "\"" + document.#trim(formname)#.AdministratorEmailAddress.value + "\" is an invalid e-mail address\n\n"; 							
				};					
				else{
					document.#trim(formname)#.AdministratorEmailAddress.className = 'SiteTextbox';
				};
																
				return msg;
				
			};
			
			function checkCorporateAddress(){
					
				var msg = "";				
					
				if (document.#trim(formname)#.AddressTypeID.value == ""){
					msg = msg + "* Please choose a company address" + "\n\n";
				};		
											
				return msg;
				
			};
									
			function checkCorporateInformation(){
				
				var msg = "";					
				
				if (document.#trim(formname)#.clientName.value == ""){
					document.#trim(formname)#.clientName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide a company name" + "\n\n";
				}
				else{
					document.#trim(formname)#.clientName.className = 'SiteTextbox';
				};	
				
				if (document.#trim(formname)#.clientMainPhoneNumber.value == ""){
					document.#trim(formname)#.clientMainPhoneNumber.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the company main phone number" + "\n\n";
				}
				else{
					document.#trim(formname)#.clientMainPhoneNumber.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.clientMainPhoneNumber.value.length < 10){
					document.#trim(formname)#.clientMainPhoneNumber.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide a proper company phone number length" + "\n\n";
				}
				else{
					document.#trim(formname)#.clientMainPhoneNumber.className = 'SiteTextbox';
				};		
				
				
								
				msg = msg + checkCorporateAddress();	
					
				return msg;
			}
			
						
		</script>	
		
	</cfoutput>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form method="post" name="#trim(formname)#" action="appCreateAccountConfirm.cfm" onsubmit="return validateForm();">		<!---formInsert(); --->	
			<input type="Hidden" name="addresses" value="">
			
			<table border="0" cellpadding="0" cellspacing="0">		
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td>
			
					<!------------------------------------------------------------------>
					<!--- Show an address on this page.                              --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company Information" tableWidth="100%">	
										
						<table border="0" cellpadding="1" cellspacing="0">															
							<tr>
								<td class="SiteRequiredLabel">		
									Name:&nbsp;															
								</td>
								<td>		
									<input type="Text" class="SiteTextbox" name="clientName" size="35" maxlength="80">			
								</td>
							</tr>
							<tr>
								<td class="SiteLabel">								
									DBA:&nbsp;															
								</td>
								<td>		
									<input type="Text" class="SiteTextbox" name="clientDBA" size="35" maxlength="80">		
								</td>
							</tr>
															
							<tr>
								<td class="SiteRequiredLabel">		
									Main Phone ##:&nbsp;														
								</td>
								<td>		
									<input type="Text" class="SiteTextbox" name="clientMainPhoneNumber" size="20" maxlength="80" onkeyup="this.value=this.value.replace(/[\W_+]/g,'');">
									<font size="1">ext.</font> <input type="Text" class="SiteTextbox" name="clientMainPhoneNumberExtension" size="5" maxlength="6" onkeyup="this.value=this.value.replace(/[\W_+]/g,'');">	
								</td>
							</tr>	
							
							<tr>
								<td class="SiteRequiredLabel">								
									Number of Concurrent Users:&nbsp;															
								</td>
								<td>		
									<input type="Text" class="SiteTextbox" name="concurrentUsers" size="5" maxlength="3">		
								</td>
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
								
					<!------------------------------------------------------------------>
					<!--- Show an address on this page.                              --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company&nbsp;Address" tableWidth="100%">	
											
						<!---start corp address--->
						<table border="0" cellpadding="1" cellspacing="0" id="corporateAddressInput" style="display:'inline';">						
							<tr>
								<td class="SiteRequiredLabel">				   			
									Address&nbsp;Type:&nbsp;							
								</td>
								<td colspan="2" valign="middle">			   			
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
									<select class="SiteSelectBox" name="AddressTypeID">											
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
						   			<input class="SiteTextbox" type="text" name="AddressLine1" size="35" maxlength="80" value="">
								</td>
							</tr>			
							<tr>
								<td class="SiteLabel">			   
						   			Address&nbsp;Line&nbsp;2:&nbsp;									
								</td>
								<td colspan="2">
						   			<input class="SiteTextbox" type="text" name="AddressLine2" size="35" maxlength="80" value="">
								</td>
							</tr>				
							<tr>
								<td class="SiteRequiredLabel">			   
						   			City,&nbsp;State&nbsp;Zip&nbsp;Code&nbsp;									
								</td>
								<td colspan="2">
						   			<input class="SiteTextbox" type="text" name="AddressCity" size="15" maxlength="50" value="">&nbsp;&nbsp;<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates"><select class="SiteSelectBox" name="AddressStateID"><option value=""><cfloop query="getAllStates"><option value="#StandardListItemID#" <cfif StandardListItemID EQ 59>SELECTED</cfif>> #ItemNameDisplay#</cfloop></select>&nbsp;<input class="SiteTextbox" type="Text" name="AddressZipCode" size="10" maxlength="25" value=""> 					
								</td>
							</tr>								
									
						</table>
						
						
						<!---end corp address--->
					</cf_gcBorderedTable>
				
				</td>
			</tr>			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>	
			<tr>
				<td>
			
					<!------------------------------------------------------------------>
					<!--- Show an Admin information on this page.                    --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Administrator Information" tableWidth="100%">	
						
						<!---start Admin information--->
						<table border="0" cellpadding="1" cellspacing="0">							
							<tr>
								<td class="SiteRequiredLabel">										
									Name:&nbsp;															
								</td>
								<td class="SiteRequiredLabel" nowrap>									
									First&nbsp;<input class="SiteTextbox" type="text" name="AdministratorFName" size="15" maxlength="50" value="">&nbsp;																	
									<font color="#trim(fontColor)#">M</font>&nbsp;<input class="SiteTextbox" type="text" name="AdministratorMName" size="3" maxlength="50" value="">&nbsp;															
									Last&nbsp;<input class="SiteTextbox" type="text" name="AdministratorLName" size="15" maxlength="50" value="">&nbsp;								
								</td>
							</tr>								
							<tr>
								<td class="SiteRequiredLabel">		
									Phone&nbsp;Number:&nbsp;															
								</td>
								<td>		
									<input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="AdministratorPhoneNumber" size="20" maxlength="80">	
									<font size="1">ext.</font> <input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="AdministratorPhoneNumberExtension" size="5" maxlength="6">	
								</td>
							</tr>
							<tr>
								<td class="SiteRequiredLabel">								
									Email&nbsp;Address:&nbsp;															
								</td>
								<td>
									<input class="SiteTextbox" type="text" name="AdministratorEmailAddress" size="35" maxlength="80" value="" onblur="if (checkEmailAddress(this.value) == 'true'){document.#trim(formname)#.AdministratorEmailAddress.value = ''; spAdministratorEmailAddress.innerHTML = '- This email address already exists. - ';} else {spAdministratorEmailAddress.innerHTML = '';};">
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td valign="top"><font size="1" face="#trim(fontFace)#" color="990000">(username / password will be emailed)</font></td>
							</tr>		
							<tr>
								<td>		
									&nbsp;						
								</td>
								<td>
									<span id="spAdministratorEmailAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span>
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
					<cf_gcSubmitButton value="Create Account">							
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
	
		
	</cfoutput>	
	
	