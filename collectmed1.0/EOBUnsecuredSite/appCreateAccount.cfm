<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">	
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 
  <head>
    <title>Collect Med</title> 

    <link rel="stylesheet" type="text/css" media="all" href="style.css" />
    <meta http-equiv="Content-Language" content="en-us" />
    <meta name="description" content="Collect Med"/>
    <meta name="keywords" content="Collect Med" />

  </head>


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
    <script type="text/javascript" language="JavaScript" src="../includes/wddx.js"></script>
	
<!-------------------------------------------------------------------------------------->
<!--- If browser is IE under windows                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
    	<script type="text/javascript" language="JavaScript" src="../wddxDesIE.js"></script>
    <cfelse>
    	<script type="text/javascript" language="JavaScript" src="../wddxDes.js"></script>
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
				
				msg = msg + checkCorporateInformation();		
				
				msg = msg + checkAdministratorInformation();		
				
				msg = msg + checkPaymentPreference();		
						
				if(msg.length >= 1){
					alert(msg);
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
					
				if (document.#trim(formname)#.corporateAddress.value == ""){
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
			
			
			function checkPaymentPreference(){
				
				var msg = "";					
				var ccType = "";
				
				for(var i=0; i < document.#trim(formname)#.PaymentPreference.length; i++){
					if(document.#trim(formname)#.PaymentPreference[i].checked){
						
						choice = document.#trim(formname)#.PaymentPreference[i].value;
						
						if(choice == 7){
							
							for(var i=0; i < document.#trim(formname)#.ccCreditCard.length; i++){
								if(document.#trim(formname)#.ccCreditCard[i].checked){
									ccType = document.#trim(formname)#.ccCreditCard[i].value;									
									break;
								};
							};
							
							if (ccType == ""){														
								msg = msg + "* Please choose a type of credit card" + "\n\n";
							};
								
							if (document.#trim(formname)#.ccCardHolderName.value == ""){	
								document.#trim(formname)#.ccCardHolderName.className = 'SiteTextboxALERT'; 														
								msg = msg + "* Please provide the name on the credit card" + "\n\n";
							}
							else{
								document.#trim(formname)#.ccCardHolderName.className = 'SiteTextbox';
							};								
							
							if (!isValidCreditCardNumber(document.#trim(formname)#.ccCardNumber.value)){														
								document.#trim(formname)#.ccCardNumber.className = 'SiteTextboxALERT'; 	
								msg = msg + "* Please provide a valid credit card number" + "\n\n";
							}
							else{
								document.#trim(formname)#.ccCardNumber.className = 'SiteTextbox';
							};	
														
							if (document.#trim(formname)#.ccCardNumber.value == ""){														
								document.#trim(formname)#.ccCardNumber.className = 'SiteTextboxALERT'; 	
								msg = msg + "* Please provide the credit card number" + "\n\n";
							}
							else{
								document.#trim(formname)#.ccCardNumber.className = 'SiteTextbox';
							};	
							
							if (document.#trim(formname)#.ccVerificationNumber.value == ""){														
								document.#trim(formname)#.ccVerificationNumber.className = 'SiteTextboxALERT'; 	
								msg = msg + "* Please provide the credit card verification number" + "\n\n";
							}
							else{
								document.#trim(formname)#.ccVerificationNumber.className = 'SiteTextbox';
							};		
							
							if (document.#trim(formname)#.ccExpirationMonth.value == ""){														
								msg = msg + "* Please provide the credit card expiration month" + "\n\n";
							};	
							
							if (document.#trim(formname)#.ccExpirationYear.value == ""){														
								msg = msg + "* Please provide the credit card expiration year" + "\n\n";
							};
						}
						
						else if(choice == 8){
							
							if (document.#trim(formname)#.BankRoutingCode.value == ""){														
								document.#trim(formname)#.BankRoutingCode.className = 'SiteTextboxALERT'; 	
								msg = msg + "* Please provide the bank routing code" + "\n\n";
							}
							else{
								document.#trim(formname)#.BankRoutingCode.className = 'SiteTextbox';
							};		
							
							if (document.#trim(formname)#.BankAccountNumber.value == ""){														
								document.#trim(formname)#.BankAccountNumber.className = 'SiteTextboxALERT'; 	
								msg = msg + "* Please provide the bank account number" + "\n\n";
							}
							else{
								document.#trim(formname)#.BankAccountNumber.className = 'SiteTextbox';
							};		
						}	
						
						else if(choice == 9){
							
							var invoiceType = "";
							
							for(var i=0; i < document.#trim(formname)#.invoicePreference.length; i++){
								if(document.#trim(formname)#.invoicePreference[i].checked){
									invoiceType = document.#trim(formname)#.invoicePreference[i].value;									
									break;
								};
							};							
														
							if (invoiceType == ""){														
								msg = msg + "* Pleae choose a type of invoicing method" + "\n\n";
							};
								
							if (invoiceType == 'email'){
								
								if (document.#trim(formname)#.InvoiceEmailAddress.value == ""){	
									document.#trim(formname)#.InvoiceEmailAddress.className = 'SiteTextboxALERT'; 														
									msg = msg + "* Please provide an email address to email invoices to" + "\n\n";
								}
								else{
									document.#trim(formname)#.InvoiceEmailAddress.className = 'SiteTextbox';
								};
								
							};
													
						}
						
						//Payment preference choice break				
						break;					 
					};	
				}	
				
				if(typeof(choice) == 'undefined'){
					msg = msg + "* Please choose an invoicing method (i.e. credit card, check, invoice)" + "\n\n";
				};		
				
				if (document.#trim(formname)#.billingAddress.value == ""){
					msg = msg + "* Please choose a billing address" + "\n\n";
				};
					
				return msg;
			}
			
			function isValidCreditCardNumber(cardNumber){
			
			  var isValid = false;
			  var ccCheckRegExp = /[^\d ]/;
			  isValid = !ccCheckRegExp.test(cardNumber);
			
			  for(var i=0; i < document.#trim(formname)#.ccCreditCard.length; i++){
			  	if(document.#trim(formname)#.ccCreditCard[i].checked){
					cardType = document.#trim(formname)#.ccCreditCard[i].value;									
					break;
				};
			  };	
			
			
			  if (isValid)
			  {
			    var cardNumbersOnly = cardNumber.replace(/ /g,"");
			    var cardNumberLength = cardNumbersOnly.length;
			    var lengthIsValid = false;
			    var prefixIsValid = false;
			    var prefixRegExp;
			
			    switch(cardType)
			    {
			      case "71":
			        lengthIsValid = (cardNumberLength == 16);
			        prefixRegExp = /^5[1-5]/;
			        break;
			
			      case "70":
			        lengthIsValid = (cardNumberLength == 16 || cardNumberLength == 13);
			        prefixRegExp = /^4/;
			        break;
			
			      case "73":
			        lengthIsValid = (cardNumberLength == 15);
			        prefixRegExp = /^3(4|7)/;
			        break;
			
			      default:
			        prefixRegExp = /^$/;
			        alert("Card type not found");
			    }
			
			    prefixIsValid = prefixRegExp.test(cardNumbersOnly);
			    isValid = prefixIsValid && lengthIsValid;
			  }
			
			  if (isValid)
			  {
			    var numberProduct;
			    var numberProductDigitIndex;
			    var checkSumTotal = 0;
			
			    for (digitCounter = cardNumberLength - 1; 
			      digitCounter >= 0; 
			      digitCounter--)
			    {
			      checkSumTotal += parseInt (cardNumbersOnly.charAt(digitCounter));
			      digitCounter--;
			      numberProduct = String((cardNumbersOnly.charAt(digitCounter) * 2));
			      for (var productDigitCounter = 0;
			        productDigitCounter < numberProduct.length; 
			        productDigitCounter++)
			      {
			        checkSumTotal += 
			          parseInt(numberProduct.charAt(productDigitCounter));
			      }
			    }
			
			    isValid = (checkSumTotal % 10 == 0);
			  }
			
			  return isValid;
			}

					
			function clearInvoicePreference(){
				for(var i=0; i < document.#trim(formname)#.invoicePreference.length; i++){
					document.#trim(formname)#.invoicePreference[i].checked = false;									
				};
			};
									
			function closePM(){
								
				for(i = 1; i <= 5; i++){

					tempTRRow = 'document.all.paymethodsTR_' + i;	
									
					if (typeof(eval(tempTRRow)) != "undefined"){															
						temp = 'document.all.paymethodsTR_' + i + '.style.display = \'none\''
						eval(temp);
					}
					else{
						break;
					}; 
				};				
			};	
			
						
			function showInvoiceAddress(){				
				
				for (i = 0; i < AddressIDs.length; i++){
					
					if(document.all.billingAddress.options[i].selected == true){	
						thisAddressID = AddressIDs[i];
						thisAddressTypeID = AddressTypeID[i];
						thisAddressLine1 = AddressLine1[i];				
						thisAddressLine2 = AddressLine2[i];
						thisAddressCity = AddressCity[i];
						thisAddressStateID = AddressStateID[i];
						thisAddressZipCode = AddressZipCode[i];			
						
						if(i == 0){
							spInvoiceAddressMessage.innerHTML = 'select a billing address';
						}
						else{
							spInvoiceAddressMessage.innerHTML = thisAddressLine1 + " " + thisAddressLine2 + " " + thisAddressCity + ", " + getState(thisAddressStateID) + " " + thisAddressZipCode;						
						};
						
						break;											
					};				
				};				
			};	
				
						
		</script>	
		
	</cfoutput>






  <body>

  <table width="707" cellpadding="0" cellspacing="0" border="0" align="center">
     <tr>
        <td class="top" colspan="2">
			 <cf_navigation>       
        </td>
     </tr>
     <tr>
        <td class="insideundertop" colspan="2" valign="top">
        
        <div class="login">
           <a onclick="launchLoginPage('https://secure.collectmed.net/appSiteLogin.cfm');" href="">Client&nbsp;Login</a>		
        </div>

        </td>
     </tr>
     <tr>
        <td class="insideleft" valign="top"><img src="images/eob_inside_pic3.jpg" alt="Collect Med" border="0"><br />
	       
		    <table width="208" cellpadding="0" cellspacing="0" border="0">
	           <tr>
	              <td valign="top" class="insidelefttitle">             
		              <div class="insidetitlefacts">
		                Quick Facts
		              </div>
	              </td>
	           </tr>
	         </table>
	         
	        <table width="208" cellpadding="0" cellspacing="0" border="0">
	           <tr>
	              <td valign="top" class="insidefactbg">
	             
	              <div class="insidefact">
	                Many doctors do not have the time to resolve claims.
	              </div>
	
	              </td>
	           </tr>
	         </table>
	        <!--If you want to add another Quick Fact to this page, just copy and paste the Quick Fact table         again below this line to make another Quick Fact post it note below this one.-->
	         
        </td>
        <td class="insidecontent" valign="top">
        				
			<cfoutput>
			
				<form method="post" name="#trim(formname)#" action="appCreateAccountConfirm.cfm" onsubmit="formInsert(); return validateForm();">			
					<input type="Hidden" name="addresses" value="">
					
					<table border="0" cellpadding="0" cellspacing="0">		
						<tr>
							<td><span class="insidetitlelight">Create&nbsp;An&nbsp;Account</span><br>Please fill out the information below.<br><br></td>
						</tr>
						
						<tr>
							<td>
					
							<!------------------------------------------------------------------>
							<!--- Show an address on this page.                              --->
							<!------------------------------------------------------------------>		
							<cf_gcBorderedTable boxLineBorderWidth="0" titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company Information" tableWidth="100%">	
												
								<table border="0" cellpadding="1" cellspacing="0">															
									<tr>
										<td align="right" class="SiteRequiredLabel">		
											Name:&nbsp;															
										</td>
										<td align="left">		
											<input type="Text" class="SiteTextbox" name="clientName" size="35" maxlength="80">			
										</td>
									</tr>
									<tr>
										<td align="right" class="SiteLabel">								
											DBA:&nbsp;															
										</td>
										<td align="left">		
											<input type="Text" class="SiteTextbox" name="clientDBA" size="35" maxlength="80">		
										</td>
									</tr>
																	
									<tr>
										<td align="right" class="SiteRequiredLabel">		
											Main Phone ##:&nbsp;														
										</td>
										<td align="left">		
											<input type="Text" class="SiteTextbox" name="clientMainPhoneNumber" size="20" maxlength="80" onkeyup="this.value=this.value.replace(/[\W_+]/g,'');">
											<font size="1">ext.</font> <input type="Text" class="SiteTextbox" name="clientMainPhoneNumberExtension" size="5" maxlength="6" onkeyup="this.value=this.value.replace(/[\W_+]/g,'');">	
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
							<cf_gcBorderedTable boxLineBorderWidth="0" titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company&nbsp;Address" tableWidth="100%">	
													
								<!---start corp address--->
								<table border="0" cellpadding="1" cellspacing="0" id="corporateAddressInput" style="display:'inline';">						
									<!---<tr>
										<td class="SiteRequiredLabel">				   			
											Address&nbsp;Type:&nbsp;							
										</td>
										<td colspan="2" valign="middle">			   			
											<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
											<select class="SiteSelectBox" name="CorporateAddressTypeID">											
												<cfloop query="getAllAddressTypes">
													<option value="#StandardListItemID#" <cfif StandardListItemID EQ 13>SELECTED</cfif>> #ItemNameDisplay#
												</cfloop>
											</select>						
										</td>
									</tr>--->			
									<tr>
										<td align="right" class="SiteRequiredLabel">			   
								   			Address&nbsp;Line&nbsp;1:&nbsp;									
										</td>
										<td align="left" colspan="2">
								   			<input class="SiteTextbox" type="text" name="CorporateAddressLine1" size="35" maxlength="80" value="">
										</td>
									</tr>			
									<tr>
										<td align="right" class="SiteLabel">			   
								   			Address&nbsp;Line&nbsp;2:&nbsp;									
										</td>
										<td align="left" colspan="2">
								   			<input class="SiteTextbox" type="text" name="CorporateAddressLine2" size="35" maxlength="80" value="">
										</td>
									</tr>				
									<tr>
										<td align="right" class="SiteRequiredLabel">			   
								   			City,&nbsp;State&nbsp;Zip&nbsp;Code:&nbsp;									
										</td>
										<td align="left" colspan="2">
								   			<input class="SiteTextbox" type="text" name="CorporateAddressCity" size="15" maxlength="50" value="">&nbsp;&nbsp;<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates"><select class="SiteSelectBox" name="CorporateAddressStateID"><option value=""><cfloop query="getAllStates"><option value="#StandardListItemID#" <cfif StandardListItemID EQ 59>SELECTED</cfif>> #ItemNameDisplay#</cfloop></select>&nbsp;<input class="SiteTextbox" type="Text" name="CorporateAddressZipCode" size="10" maxlength="25" value="" onblur="spSaveCorporateAddress.innerHTML = '- Please save this address. - ';"> 					
										</td>
									</tr>	
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>								
									<!---<tr>
										<td colspan="3" align="center" style="padding-top:1.0ex">
											<input type="Button" class="SiteSubmitbox" value="Save Address" onclick="spSaveCorporateAddress.innerHTML = ''; addAddressToCorporateArray(document.#trim(formname)#.CorporateAddressTypeID.value, document.#trim(formname)#.CorporateAddressLine1.value, document.#trim(formname)#.CorporateAddressLine2.value, document.#trim(formname)#.CorporateAddressCity.value, document.#trim(formname)#.CorporateAddressStateID.value, document.#trim(formname)#.CorporateAddressZipCode.value);">
										</td>
									</tr>
									<tr>
										<td colspan="3" align="center"><span id="spSaveCorporateAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
									</tr>	--->	
								</table>
								
								<!---<table border="0" cellpadding="0" cellspacing="0" id="corporateAddressSelect" style="display:'none';">								
									<tr>
										<td class="SiteRequiredLabel">Corporate Address:</td>
										<td class="SiteLabel"><select style="width:275px;" name="corporateAddress" class="SiteSelectBox"></select></td>
									</tr>	
									<tr>
										<td>&nbsp;</td>
										<td valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addCorporateAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="addCorporateAddress();"><u><font color="FF0000">Add&nbsp;an&nbsp;address</font></u></span><span class="med" style="display:'none'; cursor: hand; padding-top:0.0ex" id="editCorporateAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="editCorporateAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Edit&nbsp;this&nbsp;address</font></u></span><span class="med" style="display:'none'; cursor: hand; padding-top:0.0ex" id="deleteCorporateAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteCorporateAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Delete&nbsp;this&nbsp;address</font></u></span></td>
									</tr>	
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>								
								</table>--->		
								
								<!---end corp address--->
							</cf_gcBorderedTable>
						
						</td>
					</tr>			
					
					<tr>
						<td>
					
							<!------------------------------------------------------------------>
							<!--- Show an Admin information on this page.                    --->
							<!------------------------------------------------------------------>		
							<cf_gcBorderedTable boxLineBorderWidth="0" titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company&nbsp;Administrator&nbsp;Information" tableWidth="100%">	
								
								<!---start Admin information--->
								<table border="0" cellpadding="1" cellspacing="0">							
									<tr>
										<td align="right" class="SiteRequiredLabel">										
											First&nbsp;<font color="#trim(fontColor)#">M</font>&nbsp;Last:&nbsp;													
										</td>
										<td class="SiteRequiredLabel" nowrap>									
											<input class="SiteTextbox" type="text" name="AdministratorFName" size="15" maxlength="50" value="">&nbsp;&nbsp;
											<input class="SiteTextbox" type="text" name="AdministratorMName" size="3" maxlength="50" value="">&nbsp;&nbsp;															
											<input class="SiteTextbox" type="text" name="AdministratorLName" size="15" maxlength="50" value="">							
										</td>
									</tr>								
									<tr>
										<td align="right" nowrap class="SiteRequiredLabel">		
											Phone Number:&nbsp;															
										</td>
										<td align="left" nowrap>		
											<input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="AdministratorPhoneNumber" size="20" maxlength="80">	
											<font size="1">ext.</font> <input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="AdministratorPhoneNumberExtension" size="5" maxlength="6">	
										</td>
									</tr>
									<tr>
										<td align="right" class="SiteRequiredLabel">								
											Email&nbsp;Address:&nbsp;															
										</td>
										<td align="left">
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
					
							<!------------------------------------------------------------------>
							<!--- Show an Admin information on this page.                    --->
							<!------------------------------------------------------------------>		
							<cf_gcBorderedTable boxLineBorderWidth="0" titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Payment&nbsp;Preference" tableWidth="100%">	
								
								<!---start Payment information--->						
								<table border="0" cellpadding="1" cellspacing="0" align="center">														
									<tr>
										<td>										
											<span id="payoptions" class="SiteRequiredLabel">Payment&nbsp;Option:&nbsp;</span>
										</td>
										<td class="SiteLabel">
											<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="2" active="1" returnvariable="getAllPayTypes">
																				
											<cfloop query="getAllPayTypes">													
												<cfif StandardListItemID EQ 7>															
													<input type="Radio" name="PaymentPreference" value="#StandardListItemID#" onclick="closePM(); paymethodsTR_1.style.display='inline';">&nbsp;#ItemNameDisplay#																												
												<cfelseif StandardListItemID EQ 8>															
													<input type="Radio" name="PaymentPreference" value="#StandardListItemID#" onclick="closePM(); paymethodsTR_2.style.display='inline';">&nbsp;#ItemNameDisplay#																												
												<cfelseif StandardListItemID EQ 9>															
													<input type="Radio" name="PaymentPreference" value="#StandardListItemID#" onclick="closePM(); paymethodsTR_3.style.display='inline'; clearInvoicePreference();">&nbsp;#ItemNameDisplay#<!---document.all.InvoiceEmailAddress.value = document.all.AdministratorEmailAddress.value--->															
												</cfif>																																		
											</cfloop>									
										</td>								
									</tr>
																				
									<tr>
										<td align="right" class="SiteRequiredLabel">							   			
											Billing&nbsp;Address&nbsp;Line&nbsp;1:&nbsp;									
										</td>
										<td align="left" colspan="2">
								   			<input class="SiteTextbox" type="text" name="AddressLine1" size="35" maxlength="80" value="">
										</td>
									</tr>			
									<tr>
										<td align="right" class="SiteLabel">			   
								   			Billing&nbsp;Address&nbsp;Line&nbsp;2:&nbsp;													
										</td>
										<td align="left" colspan="2">
								   			<input class="SiteTextbox" type="text" name="AddressLine2" size="35" maxlength="80" value="">
										</td>
									</tr>				
									<tr>
										<td class="SiteRequiredLabel" nowrap>			   
								   			City,&nbsp;State&nbsp;Zip&nbsp;Code:&nbsp;									
										</td>
										<td colspan="2" nowrap>
								   			<input class="SiteTextbox" type="text" name="AddressCity" size="15" maxlength="50" value="">&nbsp;&nbsp;					
												<select class="SiteSelectBox" name="AddressStateID">
														<option value="">
													<cfloop query="getAllStates">
														<option value="#StandardListItemID#" <cfif StandardListItemID EQ 59>SELECTED</cfif>> #ItemNameDisplay#
													</cfloop>
												</select>
											&nbsp;<input class="SiteTextbox" type="Text" name="AddressZipCode" size="10" maxlength="25" value="" onblur="spSaveAddress.innerHTML = '- Please save this address. - ';"> 					
										</td>
									</tr>	
									<!---<tr>
										<td colspan="3" align="center" style="padding-top:1.0ex">
											<input type="Button" class="SiteSubmitbox" value="Save Address" onclick="spSaveAddress.innerHTML = ''; addAddressToBillingArray(document.#trim(formname)#.AddressTypeID.value, document.#trim(formname)#.AddressLine1.value, document.#trim(formname)#.AddressLine2.value, document.#trim(formname)#.AddressCity.value, document.#trim(formname)#.AddressStateID.value, document.#trim(formname)#.AddressZipCode.value);">
										</td>
									</tr>--->
									<tr>
										<td colspan="3" align="center"><span id="spSaveAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
									</tr>		
												
									
															
								</table>						
											
								<table border="0" cellpadding="1" cellspacing="2" align="center">		
										<cfloop query="getAllPayTypes">
										
											<cfif StandardListItemID EQ 7>													
												<tr id="paymethodsTR_1" style="display:'none';">
													<td colspan="2">
														<cf_gcBorderedTable boxLineBorderWidth="0" titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="c0c0c0" backgroundColor="c0c0c0" title="Credit&nbsp;Card&nbsp;Information" tableWidth="100%">
															<table border="0" cellpadding="4" style="margin-top:6px;">
											              		<tr>															
																	<td align="center" vAlign="middle" colSpan="2" nowrap>														
																		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="6" active="1" returnvariable="getAllCCTypes">
																		<cfloop query="getAllCCTypes">
																			<input type="radio" name="ccCreditCard" value="#StandardListItemID#" <cfif StandardListItemID EQ 70>CHECKED</cfif>><img align="absMiddle" src="images/CC_#StandardListItemID#.gif" alt="" border="0">&nbsp;&nbsp;	
																		</cfloop>
																	</td>
																</tr>													
																<tr>
											              			<td class="SiteRequiredLabel" colspan="2">
																		Name&nbsp;On&nbsp;Card:&nbsp;&nbsp;<input value="" class="SiteTextbox" maxlength="17" type="text" style="width:180px;" size="32" name="ccCardHolderName">
																	</td>	              			
											              		</tr>
																<tr>
											              			<td class="SiteRequiredLabel" width="35%">
																		Credit Card Number<br>
												              			<input value="" class="SiteTextbox" maxlength="17" type="text" style="width:180px;" size="32" name="ccCardNumber" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" onblur="if(!isValidCreditCardNumber(this.value, document.#trim(formname)#.ccCreditCard.checked)){alert('Please provide a valid credit card number'); this.focus();};">
											              			</td>
											              			<td class="SiteRequiredLabel">																
																		&nbsp;&nbsp;Expiration Date
										          			            <br>
										          			            &nbsp;&nbsp;<select style="width:70px;" name="ccExpirationMonth" class="SiteSelectBox"><option value="">Mo<option value="01">01 - Jan<option value="02">02 - Feb<option value="03">03 - Mar<option value="04">04 - Apr<option value="05">05 - May<option value="06">06 - Jun<option value="07">07 - Jul<option value="08">08 - Aug<option value="09">09 - Sep<option value="10">10 - Oct<option value="11">11 - Nov<option value="12">12 - Dec</select>
										          			            <select style="width:65px;" name="ccExpirationYear" class="SiteSelectBox"><option value="">Year<option value="2006">2006<option value="2007">2007<option value="2008">2008<option value="2009">2009<option value="2010">2010<option value="2011">2011<option value="2012">2012<option value="2013">2013<option value="2014">2014<option value="2015">2015</select>
										              				</td>
											              		</tr>
											              	</table>
											              	<table style="margin-top:6px;" border="0">
											              		<tr>
											              			<td class="SiteRequiredLabel">																
																		CID
																		<br>
											              			    <input class="SiteTextbox" value="" maxlength="4" type="text" style="width:50px;" size="4" name="ccVerificationNumber">
																	</td>
											              			<td><img src="images/CC_cidexample.gif" alt="CID Example" border="0" height="57" style="margin-right:10px;" width="116" align="middle">
											              			</td>
											              			<td class="sm">																
																		<font face="#trim(fontFace)#">
																			<strong>Visa, MC, Discover:</strong> Last 3 digits on back.
																			<br><strong>Amex:</strong> Last 4 digits on the front of card.
																			<br>
																			<a href="javascript:openHelp('1043363603359');">What's a CID?</a>
																		</font>
											              			</td>
											              		</tr>
											              	</table>
											              	
														</cf_gcBorderedTable>			
													</td>
												</tr>	
												
											<cfelseif StandardListItemID EQ 8>	
																					
												<tr id="paymethodsTR_2" style="display:'none';">
													<td colspan="2">
														<cf_gcBorderedTable boxLineBorderWidth="0" titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="c0c0c0" backgroundColor="c0c0c0" title="Check&nbsp;Debiting" tableWidth="100%">
															<table cellpadding="2" cellspacing="1">
																<tr>
																	<td bgcolor="FFFFFF" align="center" valign="top">																				
																		<table border="0" cellpadding="2" cellspacing="0" width="100%">
																			<tr>
																				<td colspan="3">
																					<img src="images/CC_checkDebitExample.gif" border="0" alt="">	
																				</td>
																			</tr>
																			<tr>
																				<td class="SiteLabel" colspan="3">
																					Enter the numbers from the bottom of your check as illustrated
																				</td>
																			</tr>																	
																			<tr>
																				<td class="SiteRequiredLabel" align="right">Routing&nbsp;Code:</td>
																				<td align="left" colspan="2">
																				   <input onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" class="SiteTextbox" type="text" size="10" maxlength="9" name="BankRoutingCode" value="">
																				</td>
																			</tr>
																			</tr>	
																				<td class="SiteRequiredLabel" align="right">Account&nbsp;Number:</td>																				
																				<td align="left" colspan="2">
																				   <input onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" class="SiteTextbox" type="text" size="17" maxlength="17" name="BankAccountNumber" value="">
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</cf_gcBorderedTable>
													</td>
												</tr>
											
											<cfelseif StandardListItemID EQ 9>	
																					
												<tr id="paymethodsTR_3" style="display:'none';">
													<td colspan="2">
														<cf_gcBorderedTable boxLineBorderWidth="0" titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="c0c0c0" backgroundColor="c0c0c0" title="Invoice" tableWidth="100%">
															<table cellpadding="2" cellspacing="1">
																<tr>
																	<td bgcolor="FFFFFF" align="center" valign="top">																				
																		<table border="0" cellpadding="1" cellspacing="0" width="100%">																	
																			<tr>
																				<td><input type="Radio" name="invoicePreference" value="email" onclick="document.#trim(formname)#.InvoiceEmailAddress.value = document.#trim(formname)#.AdministratorEmailAddress.value; spInvoiceAddressMessage.innerHTML = '';"></td>																		
																				<td class="SiteLabel">Email&nbsp;Invoice:</td>
																				<td><input class="SiteTextbox" type="text" name="InvoiceEmailAddress" size="35" maxlength="80" value="" onblur="if (checkEmailAddress(this.value) == 'true'){document.#trim(formname)#.InvoiceEmailAddress.value = ''; document.all.InvoiceEmailAddressTR.style.display = 'inline'; spInvoiceEmailAddress.innerHTML = '- This email address already exists. - ';} else {spInvoiceEmailAddress.innerHTML = ''; document.all.InvoiceEmailAddressTR.style.display = 'none';};"></td>
																			</tr>
																			<tr id="InvoiceEmailAddressTR" style="display:'none';">							
																				<td colspan="3">
																					<span id="spInvoiceEmailAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span>
																				</td>
																			</tr>		
																			</tr>																	
																				<td><input type="Radio" name="invoicePreference" value="mail" onclick="document.#trim(formname)#.InvoiceEmailAddress.value = ''; showInvoiceAddress();"></td>
																				<td class="SiteLabel">Mail&nbsp;Invoice:</td>
																				<td><font color="FF0000"><span id="spInvoiceAddressMessage" style="font-size: xx-small;">&nbsp;</span></font></td>
																			</tr>																	
																		</table>
																	</td>
																</tr>
															</table>
														</cf_gcBorderedTable>
													</td>
												</tr>	
																																			
											</cfif>		
										</cfloop>	
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
						<td align="center">			
							<cf_gcSubmitButton value="Create Account">							
						</td>
					</tr>			
				</table>		
								
				</form>	
								
			</cfoutput>
			
        </td>
     </tr>
     <tr>
        <td class="bottom" colspan="2">
        </td>
     </tr>
     <tr>
        <td class="footer" colspan="2">
			Copyright © 2012 Collect Med. All Rights Reserved. 
        </td>
     </tr>
  </table>


  </body>
</html>