
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.EntityID") AND form.EntityID NEQ "">
		<cfset EntityID = form.EntityID>
	<cfelseif IsDefined("url.EntityID") AND url.EntityID NEQ "">
		<cfset EntityID = url.EntityID>	
	</cfif>
	
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>	
	
	<cfparam name="attributes.formName" default="ClientFrom">
	<cfset formName = attributes.formName>
	

	
<!-------------------------------------------------------------------------------------->
<!--- Query for the Entity account that holds all the phones,                        --->
<!--- email addresses, addresses etc...                                              --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getEntityID" datasource="#trim(request.datasource)#">
		SELECT EntityID
		FROM pa_master.client WHERE ClientID = #trim(session.ClientID)# AND Active = 1
	</cfquery>	
	
	<cfset EntityID = getEntityID.EntityID>
	
	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="EntityID"
		fieldnames="User ID"
		datatypes="numeric">	
	

<!-------------------------------------------------------------------------------------->
<!--- Create the Entity object based on the patientID sent in.                       --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Entity = CreateObject("component", "com.common.Entity").init(trim(EntityID))>	
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Include the page that will handle the wddxRecordSets                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcWddxRecordsetHandler>	
	
				
			
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	

		
		
		
		
		
		
		
	
<!-------------------------------------------------------------------------------------->
<!--- Get the users Payments                                                         --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getAllUsersCCs" datasource="#trim(request.datasource)#">
		SELECT EntityRSID, ColM, ColE, ColL, ColI, ColA, ColC, ColR, IsDefault 
		FROM entityrs
		WHERE EntityID = #trim(EntityID)# AND Active = 1
	</cfquery>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all CC Types                                                               --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="6" active="1" returnvariable="getAllCCTypes">
	
	

<!-------------------------------------------------------------------------------------->
<!--- Get all the Phone types                                                        --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID, ItemNameDisplay" listid="7" active="1" returnvariable="getAllPhoneTypes">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the Email Types                                                        --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="8" active="1" returnvariable="getAllEmailTypes">

	

<!-------------------------------------------------------------------------------------->
<!--- Get all the Address Types                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the Credit Card Types                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="6" active="1" returnvariable="getAllCCTypes">
			
															
			
<!-------------------------------------------------------------------------------------->
<!--- Get the Client information.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getClientInformation" datasource="#trim(request.datasource)#">	
		SELECT ClientID,ClientName,ClientDBA,EntityID,PreferredPayMethod,SupportEmailID,AdministratorEntityID,MainPhoneID,Logo 
		FROM pa_master.client  
		WHERE ClientID = #trim(session.ClientID)# AND Active = 1
	</cfquery>  		
	

				
<!-------------------------------------------------------------------------------------->
<!--- Get all the addresses that the client has on record.                           --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getClientAddresses" datasource="#trim(request.datasource)#">
		SELECT a.AddressID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, a.CountryID, ea.IsDefault
		FROM address a INNER JOIN entityaddress ea ON a.AddressID = ea.AddressID
		WHERE ea.EntityID = #trim(EntityID)# AND ea.Active = 1 AND a.Active = 1
	</cfquery>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the addresses that are from this client. Except for the Company        --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getAllClientEmailAddresses" datasource="#trim(request.datasource)#">
		SELECT e.FName, e.LName, ea.emailAddressID, ea.email, ea.emailTypeID, ea.IsDefault
		FROM entity e INNER JOIN emailaddress ea ON e.EntityID = ea.EntityID 
		WHERE e.EntityID IN (SELECT EntityID FROM entity WHERE Active = 1 AND ClientID = #trim(session.clientID)#) AND e.EntityID != #trim(EntityID)# AND e.Active = 1 AND ea.Active = 1
	</cfquery>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- get the users email addresses.                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getCompanyEmailAddresses" datasource="#trim(request.datasource)#">
		SELECT e.FName, e.LName, ea.emailAddressID, ea.email, ea.emailTypeID, ea.IsDefault
		FROM entity e INNER JOIN emailaddress ea ON e.EntityID = ea.EntityID 
		WHERE e.EntityID = #trim(EntityID)# AND e.Active = 1 AND ea.Active = 1
	</cfquery>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- get the users phone numbers                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getCompanyPhoneNumbers"  datasource="#trim(request.datasource)#">
		SELECT p.PhoneID, p.PhoneTypeID, p.PhoneNumber, p.PhoneExtension, ep.IsDefault, s.ItemNameDisplay
		FROM phone p 
		INNER JOIN entityphone ep ON p.Phoneid = ep.PhoneID
		LEFT OUTER JOIN pa_master.standardlistitem s ON p.PhoneTypeID = s.StandardListItemID
		WHERE ep.EntityID = #trim(EntityID)# AND p.Active = 1 AND ep.Active = 1 AND s.Active = 1
	</cfquery>			
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the entity information                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getEntityInformation" datasource="#trim(request.datasource)#">
		SELECT EntityID, SiteID, ClientID, ObjectTypeID, Fname, Mname, Lname, DOB
		FROM entity  
		WHERE EntityID = #trim(EntityID)# AND Active = 1
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
			
			var numberOfCCs = #trim(getAllUsersCCs.RecordCount)#;
				
			<!-------------------------------------------------------------------------------------->
			<!--- This line will create the JS arrays needed for ththe Phone types.              --->
			<!-------------------------------------------------------------------------------------->						
			var <cfwddx action="CFML2JS" input="#getAllPhoneTypes#" toplevelvariable="getAllPhoneTypes_JS">					
			
			function getPhoneTypeDisplay(typeid){
								
				for(countpt = 0; countpt < getAllPhoneTypes_JS.standardlistitemid.length; countpt++){
				
					if(getAllPhoneTypes_JS.standardlistitemid[countpt] == typeid){
						return getAllPhoneTypes_JS.itemnamedisplay[countpt];	
						break;
					};			
				};				
			};
				
			<!-------------------------------------------------------------------------------------->
			<!--- This line will create the JS arrays needed for ththe Email types.              --->
			<!-------------------------------------------------------------------------------------->						
			var <cfwddx action="CFML2JS" input="#getAllEmailTypes#" toplevelvariable="getAllEmailTypes_JS">				
			
			function getEmailAddressTypeDisplay(typeid){
								
				for(countet = 0; countet < getAllEmailTypes_JS.standardlistitemid.length; countet++){
				
					if(getAllEmailTypes_JS.standardlistitemid[countet] == typeid){
						return getAllEmailTypes_JS.itemnamedisplay[countet];	
						break;
					};			
				};				
			};
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- This line will create the JS arrays needed for ththe Address types.            --->
			<!-------------------------------------------------------------------------------------->						
			var <cfwddx action="CFML2JS" input="#getAllAddressTypes#" toplevelvariable="getAllAddressTypes_JS">				
			
			function getAddressTypeDisplay(typeid){
								
				for(countat = 0; countat < getAllAddressTypes_JS.standardlistitemid.length; countat++){
				
					if(getAllAddressTypes_JS.standardlistitemid[countat] == typeid){
						return getAllAddressTypes_JS.itemnamedisplay[countat];	
						break;
					};			
				};				
			};
			
							
			<!-------------------------------------------------------------------------------------->
			<!--- This line will create the JS arrays needed for the Credit Card types.          --->
			<!-------------------------------------------------------------------------------------->						
			var <cfwddx action="CFML2JS" input="#getAllCCTypes#" toplevelvariable="getAllCCTypes_JS">					
			
			function getCCTypeDisplay(typeid){
								
				for(countcct = 0; countcct < getAllCCTypes_JS.standardlistitemid.length; countcct++){
				
					if(getAllCCTypes_JS.standardlistitemid[countcct] == typeid){
						return getAllCCTypes_JS.itemnamedisplay[countcct];	
						break;
					};			
				};				
			};
			
				
				
				
					
			function validateForm(){	
				
				var msg  = "";			
				
				msg = msg + checkSubmitCompanyInformation();	
				
				msg = msg + checkSubmitCompanyPhoneNumbers();		
				
				msg = msg + checkEmailAddresses();	
									
				msg = msg + checkAddresses();		
				
				//msg = msg + checkPaymentPreference();					
				
				if(msg.length >= 1){
					toggleSubmit();
					alert(msg);
					return false;
				}
				else{
					formInsert();
					return true;
				};	
			};			
		
			function formInsert(){
				
				formInsertAddresses(); 
				formInsertEmailAddresses();			
				formInsertPhones();
				//formInsertCCards();			
					
			};
			
			function checkPaymentPreference(){
				
				var msg = "";					
				var ccType = "";
				var choice = "";
				
				for(var i=0; i < document.#trim(formname)#.PaymentPreference.length; i++){
					
					if(document.#trim(formname)#.PaymentPreference[i].checked){						
						choice = document.#trim(formname)#.PaymentPreference[i].value;
						break;
					};	
				};	
					
				<!--- cc --->
				if(choice == 7){
					
					<!---at least one credit card--->
					if(ccIDs.length < 2){
						msg = msg + "* You must have at least one credit card defined";									
					};
					
					<!--- choose default card to bill to--->
					for (ic = 1; ic < ccIDs.length; ic++){
					
						var found = false;
						
						if(ccIsDefault[ic] == 1){
								found = true;
								break;
						};					
					};
					
					if(!found){
						msg = msg + "* Please choose a default credit card" + "\n\n";
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
					
					if (document.#trim(formname)#.checkBillingAddressID.value == ""){
						msg = msg + "* Please choose a billing address" + "\n\n";
					}
					else{								
						var addressID = resetJSAddressID(document.#trim(formname)#.checkBillingAddressID.value);						
						for (ic = 1; ic < document.#trim(formname)#.checkBillingAddressID.length; ic++){
							if(resetJSAddressID(document.#trim(formname)#.checkBillingAddressID.options[ic].value) == addressID){
								document.#trim(formname)#.checkBillingAddressID_Hidden.value = resetJSAddressID(document.#trim(formname)#.checkBillingAddressID.options[ic].value);								
							};
						};						
						
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
					
					if (invoiceType == 'mail'){
						if (document.#trim(formname)#.invoiceBillingAddressID.value == ""){
							msg = msg + "* Please choose an invoicing address" + "\n\n";
						}
					};	
										
				}								
								
				if(typeof(choice) == 'undefined'){
					msg = msg + "* Please choose a payment preference (i.e. credit card, check, invoice)" + "\n\n";
				};		
													
				return msg;
			}
			
			
			function checkSubmitCompanyInformation(){
				
				var msg = "";					
				
				if (document.#trim(formname)#.clientName.value == ""){
					document.#trim(formname)#.clientName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide a company name" + "\n\n";
				}
				else{
					document.#trim(formname)#.clientName.className = 'SiteTextbox';
				};	
								
				return msg;
			}
			
			
			function checkSubmitCompanyPhoneNumbers(){
				
				var msg = "";
				var phonenumbersLength = eval(PhoneIDs.length);			
				// it will be less than 2 because of "select phone".
				if(phonenumbersLength < 2){				
					msg = msg + "* User must have at least one phone number" + "\n\n";				
				};
				
				for (i = 1; i < PhoneIDs.length; i++){
					if(!IsValidPhoneJS(phoneNumber[i])){
						msg = msg + "* " + formatPhoneUS(phoneNumber[i]) + " is an invalid phone number" + "\n\n";				
					};					
				};
				
				var selected = false;				
				for (i = 1; i < PhoneIDs.length; i++){					
					if(phoneNumberIsDefault[i] == 1){
						selected = true;						
					};
				};					
			
				if(!selected){
					msg = msg + "* Please select a default phone number" + "\n\n";		
				};
					
				return msg;	
			};
			
			
			
			
			
			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Start Phone Section                                                            --->
		<!-------------------------------------------------------------------------------------->	
			function toggleUserPhoneNumberInput(){				
				if(UsersPhoneNumberInput.style.display == 'none'){							
					UsersPhoneNumberSelect.style.display='none';
					UsersPhoneNumberInput.style.display='inline';
				}
				else{					
					document.#trim(formname)#.UserPhoneNumber.className = 'SiteTextbox';
					UsersPhoneNumberInput.style.display = 'none';
					UsersPhoneNumberSelect.style.display='inline';					
				};	
				clearPhoneInput();				
			};
			
			
			function addUsersPhoneNumberToArray(typeid, phone, ext){
				
				if(!IsValidPhoneJS(phone)){
					document.#trim(formname)#.UserPhoneNumber.className = 'SiteTextboxALERT';
					document.#trim(formname)#.UserPhoneNumber.focus();
					alert("* Phone Number must be at least 10 characters");
					return false;
				};
				
				if(typeid != '' && phone != ''){
					var len = addPhoneNumberToArray(typeid, phone, ext);							
					clearPhoneInput();
					changePhoneNumber(len);
					spUserPhoneNumber.innerHTML = '';											
					UsersPhoneNumberInput.style.display='none';
					UsersPhoneNumberSelect.style.display='inline';					
				};
			};
			
			
			function clearPhoneInput(){
				document.#trim(formname)#.UserPhoneNumberTypeID.value = '';
				document.#trim(formname)#.UserPhoneNumber.value = '';
				document.#trim(formname)#.UserPhoneExtension.value = ''; 					
				document.#trim(formname)#.UsersPhoneNumberDBID_HIDDEN.value = '';
				document.#trim(formname)#.UsersPhoneNumberJSID_HIDDEN.value = '';		
			};
			
			
			function addPhoneNumberToArray(typeid, phone, ext){
								
				var newLength = eval(PhoneIDs.length);
								
				PhoneIDs[newLength] = newLength;
				phoneNumberTypeID[newLength] = typeid;
				if(document.#trim(formname)#.UsersPhoneNumberDBID_HIDDEN.value != ''){
					phoneNumberDBID[newLength] = document.#trim(formname)#.UsersPhoneNumberDBID_HIDDEN.value;
				}
				else{	
					phoneNumberDBID[newLength] = "@@";
				};
				
				phoneNumber[newLength] = phone; 				
				phoneExtension[newLength] = ext;
				phoneNumberIsDefault[newLength] = 0;
				 										
				thisPhoneID = PhoneIDs[newLength];
				thisPhoneNumber = phoneNumber[newLength];					
				thisPhoneExtension = phoneExtension[newLength];
				
				thisPhoneNumber = formatPhoneUS(thisPhoneNumber);
				
				if(thisPhoneExtension.length > 0){
					thisPhoneNumber = thisPhoneNumber + "  Ext." + thisPhoneExtension;
				};
						
				thisPhoneNumber = thisPhoneNumber + "  - " + getPhoneTypeDisplay(typeid);	
						
				document.#trim(formname)#.UsersPhoneNumber.options[newLength] = new Option(thisPhoneNumber, thisPhoneID);								
				return newLength;								
				
			};
			
			
			function loadPhoneNumberArrayDisplay(){				
				
				for (i = 0; i < PhoneIDs.length; i++){
					thisPhoneID = PhoneIDs[i];
					thisPhoneNumber = phoneNumber[i];
					thisPhoneExtension = phoneExtension[i];						
					thisPhoneNumberIsDefault = phoneNumberIsDefault[i];
					thisPhoneNumberTypeID = phoneNumberTypeID[i];													
					
					if(i > 0){
						thisPhoneNumber = formatPhoneUS(thisPhoneNumber);
					
						if(thisPhoneExtension.length > 0){
							thisPhoneNumber = thisPhoneNumber + "  Ext." + thisPhoneExtension;
						};
						
						thisPhoneNumber = thisPhoneNumber + "  -  " + getPhoneTypeDisplay(thisPhoneNumberTypeID);
						
						if(thisPhoneNumberIsDefault == 1){
							thisPhoneNumber = thisPhoneNumber + "    * default";
						};
						
					}
					else{
						thisPhoneNumber = "Select Phone Number"
					};					
					
					document.#trim(formname)#.UsersPhoneNumber.options[i] = new Option(thisPhoneNumber, thisPhoneID);
							
				};		
				
			};
			
			
			function changePhoneNumber(sel){				
				document.#trim(formname)#.UsersPhoneNumber.options[sel].selected = true;													
			};
			
			function editUserPhoneNumberFunction(){
				
				for (i = 1; i < PhoneIDs.length; i++){
					
					if(document.#trim(formname)#.UsersPhoneNumber.options[i].selected == true){	
						thisPhoneID = PhoneIDs[i];
						thisPhoneNumberDBID = phoneNumberDBID[i];
						thisPhoneNumberTypeID = phoneNumberTypeID[i];						
						thisPhoneNumberIsDefault = phoneNumberIsDefault[i];		
						thisPhoneNumber = phoneNumber[i];		
						thisPhoneExtension = phoneExtension[i];	
											
						document.#trim(formname)#.UserPhoneNumberTypeID.value = thisPhoneNumberTypeID;						
						document.#trim(formname)#.UserPhoneNumber.value = thisPhoneNumber;
						document.#trim(formname)#.UserPhoneExtension.value = thisPhoneExtension;				
						document.#trim(formname)#.UsersPhoneNumberDBID_HIDDEN.value = thisPhoneNumberDBID;
						document.#trim(formname)#.UsersPhoneNumberJSID_HIDDEN.value = i;
											
						UsersPhoneNumberSelect.style.display='none';
						UsersPhoneNumberInput.style.display='inline';							
						
						break;											
					};				
				};
			};
			
			
			function defaultUserPhoneNumberFunction(){
				var selected = '';
				
				if(document.#trim(formname)#.UsersPhoneNumber.options[0].selected != true){
					
					for (i = 1; i < PhoneIDs.length; i++){
						
						if(document.#trim(formname)#.UsersPhoneNumber.options[i].selected == true){
							selected = i;
							phoneNumberIsDefault[i] = 1;
						}
						else{
							phoneNumberIsDefault[i] = 0;
						};
					};
					
					loadPhoneNumberArrayDisplay();	
					changePhoneNumber(selected);
						
				};	
			};
							
			function UpdateAddPhoneFunction(){
				
				if(document.#trim(formname)#.UsersPhoneNumberJSID_HIDDEN.value != ""){
					updateUsersPhoneNumber(document.#trim(formname)#.UsersPhoneNumberJSID_HIDDEN.value, document.#trim(formname)#.UserPhoneNumberTypeID.value, document.#trim(formname)#.UserPhoneNumber.value, document.#trim(formname)#.UserPhoneExtension.value);
				}
				else{
					addUsersPhoneNumberToArray(document.#trim(formname)#.UserPhoneNumberTypeID.value, document.#trim(formname)#.UserPhoneNumber.value, document.#trim(formname)#.UserPhoneExtension.value);
				};
				
			};
			
			function updateUsersPhoneNumber(id, typeid, phone, ext){
				
				if(!IsValidPhoneJS(phone)){
					document.#trim(formname)#.UserPhoneNumber.className = 'SiteTextboxALERT';
					document.#trim(formname)#.UserPhoneNumber.focus();
					alert("* Phone Number must be at least 10 characters");
					return false;
				};	
											
				phoneNumberTypeID[id] = typeid;						
				phoneNumber[id] = phone;		
				phoneExtension[id] = ext;
				loadPhoneNumberArrayDisplay();			
				toggleUserPhoneNumberInput();		
				changePhoneNumber(id);
				//debugPhoneNumbers();
				
			};			
			
			function deleteUsersPhoneNumberFunction(){				
								
				for (i = 1; i < PhoneIDs.length; i++){
					
					if(document.#trim(formname)#.UsersPhoneNumber.options[i].selected == true){	
							
						var delPhoneNumber = confirm("Are you sure you want to delete this phone number?");
			
						if(delPhoneNumber){	
											
							PhoneIDs.splice(i, 1);
							phoneNumberDBID.splice(i, 1);
							phoneNumberTypeID.splice(i, 1);
							phoneNumber.splice(i, 1);	
							phoneExtension.splice(i, 1);							
							phoneNumberIsDefault.splice(i, 1);
							
							document.#trim(formname)#.UsersPhoneNumber.length = 0;		
							
							loadPhoneNumberArrayDisplay();	
				
						};					
						
						break;											
					};				
				};			
								
			};
			
			
			function formInsertPhones(){
				
				var phonenumbers = "";
				
				for (i = 1; i < PhoneIDs.length; i++){
					thisPhoneID = PhoneIDs[i];
					thisPhoneNumberTypeID = phoneNumberTypeID[i];
					thisPhoneNumberDBID = phoneNumberDBID[i];
					thisPhoneNumber = phoneNumber[i];
					thisPhoneExtension = phoneExtension[i];					
					thisPhoneNumberIsDefault = phoneNumberIsDefault[i];
										
					phonenumbers = phonenumbers + thisPhoneID + "|" + thisPhoneNumberDBID + "|" + thisPhoneNumberTypeID + "|" + thisPhoneNumberIsDefault + "|" + thisPhoneNumber + "|" + thisPhoneExtension;
					
					if(i != eval(PhoneIDs.length - 1)){ 
						phonenumbers = phonenumbers + ",";
					};						
										
				};				
				document.#trim(formname)#.phonenumbers.value = phonenumbers;	
				
			};
			
							
		<!--- End Phone Section --->
			
			
			
			
			
			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Start Email Addresses Section                                                  --->
		<!-------------------------------------------------------------------------------------->		
						
			function loadEmailAddressesArrayDisplay(){				
				
				for (i = 0; i < emailAddressIDs.length; i++){
					thisEmailAddressID = emailAddressIDs[i];
					thisEmailAddress = emailAddress[i];				
					thisEmailAddressIsDefault = emailAddressIsDefault[i];
					thisEmailAddressTypeID = emailAddressTypeID[i];													
					
					if(i > 0){
						
						
						if(typeof(firstName[i]) != "undefined" && typeof(lastName[i]) != "undefined" && firstName[i] != ''){
							thisEmailAddress = thisEmailAddress + " - " + firstName[i] + " " + lastName[i];
						};
										
						thisEmailAddress = thisEmailAddress + "  -  " + getEmailAddressTypeDisplay(thisEmailAddressTypeID);
											
					}
					else{
						thisEmailAddress = "Select Email Address"
					};					
					
					//document.#trim(formname)#.InvoiceEmailAddress.options[i] = new Option(thisEmailAddress, thisEmailAddressID);
					
					if(i > 0 && thisEmailAddressIsDefault == 1){
						thisEmailAddress = thisEmailAddress + "    * default";
					};
					document.#trim(formname)#.UsersEmailAddress.options[i] = new Option(thisEmailAddress, thisEmailAddressID);
										
					if(emailAddressDBID[i] == #trim(getClientInformation.SupportEmailID)#){
						document.#trim(formname)#.UsersEmailAddress.options[i].selected = true;		
					};
							
				};		
				
			};
			
			function toggleUserEmailAddressInput(){				
				if(UsersEmailAddressInput.style.display == 'none'){							
					UsersEmailAddressSelect.style.display='none';
					UsersEmailAddressInput.style.display='inline';
				}
				else{					
					document.#trim(formname)#.UsersEmailAddress.className = 'SiteTextbox';
					UsersEmailAddressInput.style.display = 'none';
					UsersEmailAddressSelect.style.display='inline';					
				};	
				clearEmailAddressInput();				
			};
			
			function clearEmailAddressInput(){
				document.#trim(formname)#.UserEmailAddressTypeID.value = '';
				document.#trim(formname)#.UserEmailAddress.value = '';									
				document.#trim(formname)#.UsersEmailAddressDBID_HIDDEN.value = '';
				document.#trim(formname)#.UsersEmailAddressJSID_HIDDEN.value = '';		
				spUserEmailAddress.innerHTML = '';
			};
												
			function UpdateAddEmailAddressFunction(){
				
				if(document.#trim(formname)#.UsersEmailAddressJSID_HIDDEN.value != ""){
					updateUsersEmailAddress(document.#trim(formname)#.UsersEmailAddressJSID_HIDDEN.value, document.#trim(formname)#.UserEmailAddressTypeID.value, document.#trim(formname)#.UserEmailAddress.value);
				}
				else{
					addUsersEmailAddressToArray(document.#trim(formname)#.UserEmailAddressTypeID.value, document.#trim(formname)#.UserEmailAddress.value);
				};
				
			};	
			
			function updateUsersEmailAddress(id, typeid, email){
				
				if(!IsValidEmailJS(email)){					
					document.#trim(formname)#.UserEmailAddress.className = 'SiteTextboxALERT';
					document.#trim(formname)#.UserEmailAddress.focus();
					alert("* The email address (" + email + ") is not valid");
					return false;
				};	
															
				emailAddressTypeID[id] = typeid;						
				emailAddress[id] = email;				
				loadEmailAddressesArrayDisplay();
				toggleUserEmailAddressInput();		
				changeEmailAddress(id);
				//debugEmailAddresses();
				
			};					
						
			function changeEmailAddress(sel){				
				document.#trim(formname)#.UsersEmailAddress.options[sel].selected = true;													
			};			 
						 
			function addUsersEmailAddressToArray(typeid, email){
				
				if(!IsValidEmailJS(email)){		
					document.#trim(formname)#.UserEmailAddress.className = 'SiteTextboxALERT';
					document.#trim(formname)#.UserEmailAddress.focus();
					alert("* The email address (" + email + ") is not valid");
					return false;
				};
				
				if(typeid == ''){							
					alert("* Please choose an email type");
					return false;
				};
				
				if(typeid != '' && email != ''){
					var len = addEmailAddressToArray(typeid, email);							
					clearEmailAddressInput();
					changeEmailAddress(len);
					spUserEmailAddress.innerHTML = '';																
					UsersEmailAddressInput.style.display='none';
					UsersEmailAddressSelect.style.display='inline';					
				};
			};	
				
			function addEmailAddressToArray(typeid, email){
								
				var newLength = eval(emailAddressIDs.length);
								
				emailAddressIDs[newLength] = newLength;
				emailAddressTypeID[newLength] = typeid;
				if(document.#trim(formname)#.UsersEmailAddressDBID_HIDDEN.value != ''){
					emailAddressDBID[newLength] = document.#trim(formname)#.UsersEmailAddressDBID_HIDDEN.value;
				}
				else{	
					emailAddressDBID[newLength] = "@@";
				};
				
				emailAddress[newLength] = email; 				
				emailAddressIsDefault[newLength] = 0;
				 										
				thisEmailAddressID = emailAddressIDs[newLength];
				thisEmailAddress = emailAddress[newLength];					
									
				thisEmailAddress = thisEmailAddress + "  - " + getEmailAddressTypeDisplay(typeid);	
						
				document.#trim(formname)#.UsersEmailAddress.options[newLength] = new Option(thisEmailAddress, thisEmailAddressID);								
				return newLength;								
				
			};
			
			function editUserEmailAddressFunction(){
				
				for (i = 1; i < emailAddressIDs.length; i++){
					
					if(document.#trim(formname)#.UsersEmailAddress.options[i].selected == true){	
						thisEmailAddressID = emailAddressIDs[i];
						thisEmailAddressDBID = emailAddressDBID[i];
						thisEmailAddressTypeID = emailAddressTypeID[i];						
						thisEmailAddressIsDefault = emailAddressIsDefault[i];		
						thisEmailAddress = emailAddress[i];	
											
						document.#trim(formname)#.UserEmailAddressTypeID.value = thisEmailAddressTypeID;						
						document.#trim(formname)#.UserEmailAddress.value = thisEmailAddress;			
						document.#trim(formname)#.UsersEmailAddressDBID_HIDDEN.value = thisEmailAddressDBID;
						document.#trim(formname)#.UsersEmailAddressJSID_HIDDEN.value = i;
											
						UsersEmailAddressSelect.style.display='none';
						UsersEmailAddressInput.style.display='inline';							
						
						break;											
					};				
				};
			};
			
			
			function deleteUsersEmailAddressFunction(){				
							
				for (i = 1; i < emailAddressIDs.length; i++){
					
					if(document.#trim(formname)#.UsersEmailAddress.options[i].selected == true){	
						
						var delEmailAddress = confirm("Are you sure you want to delete this email address?");
			
							if(delEmailAddress){
											
								emailAddressIDs.splice(i, 1);
								emailAddressDBID.splice(i, 1);
								emailAddressTypeID.splice(i, 1);
								emailAddress.splice(i, 1);	
								emailAddressIsDefault.splice(i, 1);
								
								document.#trim(formname)#.UsersEmailAddress.length = 0;				
								loadEmailAddressesArrayDisplay();
				
							};
							
						break;											
					};				
				};	
															
			};
			
			
			function defaultUserEmailAddressFunction(){
				var selected = '';
				
				if(document.#trim(formname)#.UsersEmailAddress.options[0].selected != true){
					
					for (i = 1; i < emailAddressIDs.length; i++){
						
						if(document.#trim(formname)#.UsersEmailAddress.options[i].selected == true){
							selected = i;
							emailAddressIsDefault[i] = 1;
						}
						else{
							emailAddressIsDefault[i] = 0;
						};
					};
					
					loadEmailAddressesArrayDisplay();			
					changeEmailAddress(selected);
						
				};	
			};
			
			function checkEmailAddresses(){
				
				var msg = "";
				//var emailaddressesLength = eval(emailAddressIDs.length);			
				// it will be less than 2 because of select email address.
				if(emailAddressIDs.length < 2){				
					msg = msg + "* User must have at least one email address" + "\n\n";				
				};
				
				for (i = 1; i < emailAddressIDs.length; i++){
					if(!IsValidEmailJS(emailAddress[i])){
						msg = msg + "* " + emailAddress[i] + " is an invalid email address" + "\n\n";				
					};					
				};
				
				var selected = false;				
				for (i = 1; i < emailAddressIDs.length; i++){					
					if(emailAddressIsDefault[i] == 1){
						selected = true;						
					};
				};
				
				if(!selected){
					msg = msg + "* Please select a default email address" + "\n\n";		
				};
												
				return msg;	
			};
			
			
			function formInsertEmailAddresses(){
				
				var emailaddresses = "";
				
				for (i = 1; i < emailAddressIDs.length; i++){
					thisEmailAddressID = emailAddressIDs[i];
					thisEmailAddressTypeID = emailAddressTypeID[i];
					thisEmailAddressDBID = emailAddressDBID[i];
					thisEmailAddress = emailAddress[i];					
					thisEmailAddressIsDefault = emailAddressIsDefault[i];
										
					emailaddresses = emailaddresses + thisEmailAddressID + "|" + thisEmailAddressDBID + "|" + thisEmailAddressTypeID + "|" + thisEmailAddressIsDefault + "|" + thisEmailAddress;
					
					if(i != eval(emailAddressIDs.length - 1)){ 
						emailaddresses = emailaddresses + ",";
					};						
										
				};				
				document.#trim(formname)#.emailaddresses.value = emailaddresses;
				
			};	
				
			
			<!---End Email address--->	
				
				
				
				
				
						 	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Start Address Section                                                          --->
			<!-------------------------------------------------------------------------------------->	
			function changeAddress(sel){
				document.#trim(formname)#.AddressTypeID.options[sel].selected = true;													
			};	
			
			function changeShowAddress(sel){								
				document.#trim(formname)#.UsersAddress.options[sel].selected = true;													
			};
			
			function changeShowBillingAddress(sel){								
				document.#trim(formname)#.ccBillingAddressID.options[sel].selected = true;													
			};
			
			function checkAddresses(){
				
				var msg = "";
				
				// it will be less than 2 because of select address.
				if(AddressIDs.length < 2){				
					msg = msg + "* User must have at least one address" + "\n\n";				
				};
				
				/*CODE FOR MISSING ADDRESS PARAMETERS
				for (i = 1; i < AddressIDs.length; i++){
					if(!IsValidEmailJS(emailAddress[i])){
						msg = msg + "* " + emailAddress[i] + " is an invalid email address" + "\n\n";				
					};					
				};*/
				
				var selected = false;				
				for (i = 1; i < AddressIDs.length; i++){					
					if(AddressIsDefault[i] == 1){
						selected = true;						
					};
				};
				
				if(!selected){
					msg = msg + "* Please select a default address" + "\n\n";		
				};
												
				return msg;	
			};
			
			function toggleAddressInput(typeid){				
				if(UsersAddressInput.style.display == 'none'){						
					UsersAddressSelect.style.display='none';
					UsersAddressInput.style.display='inline';
					
					for (i = 0; i < document.#trim(formname)#.AddressTypeID.length; i++){
						
						if(document.#trim(formname)#.AddressTypeID.options[i].value == typeid){							
							changeAddress(i);
						};
					};							
										
				}
				else{					
					document.#trim(formname)#.UsersAddress.className = 'SiteTextbox';
					UsersAddressInput.style.display = 'none';
					UsersAddressSelect.style.display='inline';					
				};	
				clearAddressInput();				
			};
			
			function clearAddressInput(){				
				document.#trim(formname)#.AddressLine1.value = ''; 
				document.#trim(formname)#.AddressLine2.value = '';				
				document.#trim(formname)#.AddressCity.value = ''; 
				document.#trim(formname)#.AddressStateID.value = ''; 
				document.#trim(formname)#.AddressZipCode.value = '';					
				document.#trim(formname)#.UsersAddressDBID_HIDDEN.value = '';
				document.#trim(formname)#.AddressJSID_HIDDEN.value = '';		
				spSaveAddress.innerHTML = '';
			};
			
			
			function loadAddressArrayDisplay(){
												
				for (i = 0; i < AddressIDs.length; i++){
					
					if(i > 0){
							
						thisAddressID = AddressIDs[i];
						thisAddressTypeID = AddressTypeID[i];
						thisAddressLine1 = AddressLine1[i];				
						thisAddressLine2 = AddressLine2[i];
						thisAddressCity = AddressCity[i];
						thisAddressStateID = AddressStateID[i];
						thisAddressZipCode = AddressZipCode[i];
						thisAddressIsDefault = AddressIsDefault[i];
																											
						thisAddress = thisAddressLine1 + ' ' + thisAddressLine2 + ' ' +  thisAddressCity + ', ' + getState(thisAddressStateID) + ' ' + thisAddressZipCode + '  -  ' + getAddressTypeDisplay(thisAddressTypeID);
																	
					}
					else{
						thisAddress = "Select Address"
						thisAddressID = ""
					};		
					
					//document.#trim(formname)#.ccBillingAddressID.options[i] = new Option(thisAddress, thisAddressID);
					//document.#trim(formname)#.checkBillingAddressID.options[i] = new Option(thisAddress, thisAddressID);
					//document.#trim(formname)#.invoiceBillingAddressID.options[i] = new Option(thisAddress, thisAddressID);
										
					if(i > 0 && thisAddressIsDefault == 1){
						thisAddress = thisAddress + "    * default";
					};
					
					document.#trim(formname)#.UsersAddress.options[i] = new Option(thisAddress, thisAddressID);
					
					if(i > 0 && thisAddressIsDefault == 1){						
						document.#trim(formname)#.UsersAddress.options[i].selected = true;		
					};						
					
											
				};	
				
			};
			
			
			function UpdateAddAddressFunction(){
				
				if(document.#trim(formname)#.AddressJSID_HIDDEN.value != ""){
					updateAddress(document.#trim(formname)#.AddressJSID_HIDDEN.value, document.#trim(formname)#.AddressTypeID.value, document.#trim(formname)#.AddressLine1.value, document.#trim(formname)#.AddressLine2.value, document.#trim(formname)#.AddressCity.value, document.#trim(formname)#.AddressStateID.value, document.#trim(formname)#.AddressZipCode.value);
				}
				else{
					addAddressToArray(document.#trim(formname)#.AddressTypeID.value, document.#trim(formname)#.AddressLine1.value, document.#trim(formname)#.AddressLine2.value, document.#trim(formname)#.AddressCity.value, document.#trim(formname)#.AddressStateID.value, document.#trim(formname)#.AddressZipCode.value);
				};
				
			};
			
			function updateAddress(id, typeid, addressline1, addressline2, addresscity, addressstateid, addresszipcode){
				if(typeid != '' && addressline1 != '' && addresscity != '' && addressstateid != '' && addresszipcode != ''){																	
					AddressTypeID[id] = typeid;						
					AddressLine1[id] = addressline1;
					AddressLine2[id] = addressline2;
					AddressCity[id] = addresscity;
					AddressStateID[id] = addressstateid;
					AddressZipCode[id] = addresszipcode;				
					loadAddressArrayDisplay();
					toggleAddressInput();		
					changeAddress(id);
					//debugAddresses();
				};
			};
			
			function addAddressToArray(typeid, addressline1, addressline2, addresscity, addressstateid, addresszipcode){
				if(typeid != '' && addressline1 != '' && addresscity != '' && addressstateid != '' && addresszipcode != ''){
					var len = insertAddressToArray(typeid, addressline1, addressline2, addresscity, addressstateid, addresszipcode);							
					loadAddressArrayDisplay();
					clearAddressInput();
					changeShowAddress(len);		
					if(typeid == 11){
						changeShowBillingAddress(len);
					};			
					spSaveAddress.innerHTML = '';
					UsersAddressInput.style.display='none';
					UsersAddressSelect.style.display='inline';					
				};
			};
			
			function insertAddressToArray(typeid, addressline1, addressline2, addresscity, addressstateid, addresszipcode){
								
				var newLength = eval(AddressIDs.length);
								
				AddressIDs[newLength] = newLength;
				AddressTypeID[newLength] = typeid;
				if(document.#trim(formname)#.UsersAddressDBID_HIDDEN.value != ''){
					AddressDBID[newLength] = document.#trim(formname)#.UsersAddressDBID_HIDDEN.value;
				}
				else{	
					AddressDBID[newLength] = "@@";
				};
											
				AddressTypeID[newLength] = typeid;
				AddressLine1[newLength] = addressline1;
				AddressLine2[newLength] = addressline2;
				AddressCity[newLength] = addresscity;
				AddressStateID[newLength] = addressstateid;
				AddressZipCode[newLength] = addresszipcode;
				AddressIsDefault[newLength] = 0;
															
				return newLength;								
				
			};
			
			
			function formInsertAddresses(){
				
				var addresses = "";
				
				for (i = 1; i < AddressIDs.length; i++){
					thisAddressID = AddressIDs[i];
					thisAddressTypeID = AddressTypeID[i];
					thisAddressDBID = AddressDBID[i];
					thisAddressLine1 = AddressLine1[i];				
					thisAddressLine2 = AddressLine2[i];
					thisAddressCity = AddressCity[i];
					thisAddressStateID = AddressStateID[i];
					thisAddressZipCode = AddressZipCode[i];
					thisAddressIsDefault = AddressIsDefault[i];
					
					if(thisAddressLine2 == ''){
						thisAddressLine2= "@@";
					};
					
					thisAddress =  thisAddressID + "|" + thisAddressDBID + "|" + thisAddressTypeID + "|" + thisAddressIsDefault + "|" + thisAddressLine1 + "|" + thisAddressLine2 + "|" + thisAddressCity + "|" + thisAddressStateID + "|" + thisAddressZipCode;						
									
					if(i == (AddressIDs.length - 1)){
						addresses = addresses + thisAddress;	
					}
					else{
						addresses = addresses + thisAddress + ",";					
					};
					
				};				
				document.#trim(formname)#.addresses.value = addresses;
			
			};	
						
			function editAddressFunction(){
				
				for (i = 1; i < AddressIDs.length; i++){
					
					if(document.#trim(formname)#.UsersAddress.options[i].selected == true){	
						thisAddressID = AddressIDs[i];
						thisAddressTypeID = AddressTypeID[i];
						thisAddressDBID = AddressDBID[i];
						thisAddressLine1 = AddressLine1[i];				
						thisAddressLine2 = AddressLine2[i];
						thisAddressCity = AddressCity[i];
						thisAddressStateID = AddressStateID[i];
						thisAddressZipCode = AddressZipCode[i];
						thisAddressIsDefault = AddressIsDefault[i];							
						
						for (i = 0; i < document.#trim(formname)#.AddressTypeID.length; i++){						
							if(document.#trim(formname)#.AddressTypeID.options[i].value == thisAddressTypeID){							
								document.#trim(formname)#.AddressTypeID.options[i].selected = true;
							};							
						};							
						
						document.#trim(formname)#.AddressLine1.value = thisAddressLine1; 
						document.#trim(formname)#.AddressLine2.value = thisAddressLine2;				
						document.#trim(formname)#.AddressCity.value = thisAddressCity; 
						document.#trim(formname)#.AddressStateID.value = thisAddressStateID; 
						document.#trim(formname)#.AddressZipCode.value = thisAddressZipCode;					
						document.#trim(formname)#.UsersAddressDBID_HIDDEN.value = thisAddressDBID;
						document.#trim(formname)#.AddressJSID_HIDDEN.value = i;
																	
						UsersAddressSelect.style.display='none';
						UsersAddressInput.style.display='inline';							
						
						break;											
					};				
				};
			};
				
			function deleteAddressFunction(){		
				
				for (i = 1; i < AddressIDs.length; i++){
					
					if(document.#trim(formname)#.UsersAddress.options[i].selected == true){	
						
						var delAddress = confirm("Are you sure you want to delete this address?");
			
						if(delAddress){
									
							AddressIDs.splice(i, 1);
							AddressDBID.splice(i, 1);
							AddressTypeID.splice(i, 1);
							AddressLine1.splice(i, 1);
							AddressLine2.splice(i, 1);
							AddressCity.splice(i, 1);
							AddressStateID.splice(i, 1);
							AddressZipCode.splice(i, 1);	
							AddressIsDefault.splice(i, 1);
							
							document.#trim(formname)#.UsersAddress.length = 0;				
							//document.#trim(formname)#.ccBillingAddressID.length = 0;
							
							loadAddressArrayDisplay();
			
						};
						
						break;											
					};				
				};			
				
			};
						
			function defaultAddressFunction(){
				var selected = '';
				
				if(document.#trim(formname)#.UsersAddress.options[0].selected != true){
					
					for (i = 1; i < AddressIDs.length; i++){
						
						if(document.#trim(formname)#.UsersAddress.options[i].selected == true){
							selected = i;
							AddressIsDefault[i] = 1;
						}
						else{
							AddressIsDefault[i] = 0;
						};
					};
					
					loadAddressArrayDisplay();			
					changeShowAddress(selected);
											
				};	
			};
			
									
			<!---End Address Section--->				
			
			
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Start Credit Card section                                                      --->
			<!-------------------------------------------------------------------------------------->				
			function changeShowCreditCard(sel){								
				document.#trim(formname)#.CreditCardID.options[sel].selected = true;													
			};
			
			
			function resetCCBillingAddressID(){				
				for (i = 1; i < ccIDs.length; i++){					
					ccBillingAddressID[i] = resetJSAddressID(ccBillingAddressID[i]);						
				};							
			};
			
			
			function resetJSAddressID(jsid){				
				var ret = AddressDBID[jsid]; 				
				return ret;					
			};
			
			
			function formInsertCCards(){
				
				var ccards = "";
				
				for (i = 1; i < ccIDs.length; i++){
					thisccID = ccIDs[i];
					thisccDBID = ccDBID[i];
					thisccCreditCardTypeID = ccCreditCardTypeID[i];
					thisccCardHolderName = ccCardHolderName[i];
					thisccCardNumber = ccCardNumber[i];
					thisccExpirationMonth = ccExpirationMonth[i];
					thisccExpirationYear = ccExpirationYear[i];	
					thisccVerificationNumber = ccVerificationNumber[i];
									
					thisbillID = ccBillingAddressID[i];					
					thisccBillingAddressID = AddressDBID[thisbillID];					
					if(thisccBillingAddressID == "@@"){
						thisccBillingAddressID = "@@_" + ccBillingAddressID[i];
					};
										
					thisccIsDefault = ccIsDefault[i];
									
					thisCreditCard =  thisccID + "|" + thisccDBID + "|" + thisccCreditCardTypeID + "|" + thisccCardHolderName + "|" + thisccCardNumber + "|" + thisccExpirationMonth + "|" + thisccExpirationYear + "|" + thisccVerificationNumber + "|" + thisccBillingAddressID + "|" + thisccIsDefault;						
									
					if(i == (ccIDs.length - 1)){
						ccards = ccards + thisCreditCard;	
					}
					else{
						ccards = ccards + thisCreditCard + ",";					
					};
					
				};				
				
				document.#trim(formname)#.ccards.value = ccards;
			
			};
			
			function loadCreditCardArrayDisplay(){				
				
				for (i = 0; i < ccIDs.length; i++){
					var thiscc = '';
					thisccID = ccIDs[i];
					thisccCardNumber = ccCardNumber[i];				
					thisccIsDefault = ccIsDefault[i];
					thisccCreditCardTypeID = ccCreditCardTypeID[i];													
					thisccExpirationMonth = ccExpirationMonth[i];
					thisccExpirationYear = ccExpirationYear[i];									
					
					if(i > 0){
										
						thiscc = getCCTypeDisplay(thisccCreditCardTypeID) + " - " + thisccCardNumber + " - " + thisccExpirationMonth + "/" + thisccExpirationYear;
												
						if(thisccIsDefault == 1){
							thiscc = thiscc + "    * default";
						};
						
					}
					else{
						thiscc = "Select Credit Card"
					};					
					
					document.#trim(formname)#.CreditCardID.options[i] = new Option(thiscc, thisccID);
											
				};		
				
			};			
			
			function toggleCreditCardInput(){				
				clearCreditCardInput();				
				if(CCInput.style.display == 'none'){							
					CCSelect.style.display='none';
					CCInput.style.display='inline';
				}
				else{					
					document.#trim(formname)#.UsersEmailAddress.className = 'SiteTextbox';
					CCInput.style.display = 'none';
					CCSelect.style.display='inline';					
				};					
			};
			
			
			function clearCreditCardInput(){								
				document.#trim(formname)#.CreditCardJSID_HIDDEN.value = ''; 
				document.#trim(formname)#.CreditCardDBID_HIDDEN.value = ''; 
				document.#trim(formname)#.ccCreditCard.value = ''; 
				document.#trim(formname)#.ccCardHolderName.value = ''; 
				document.#trim(formname)#.ccCardNumber.value = ''; 
				document.#trim(formname)#.ccExpirationMonth.value = ''; 
				document.#trim(formname)#.ccExpirationYear.value = ''; 
				document.#trim(formname)#.ccVerificationNumber.value = ''; 
			};
			
			function UpdateAddCreditCardFunction(){
				
				if(document.#trim(formname)#.CreditCardJSID_HIDDEN.value != ""){
					updateCreditCard(document.#trim(formname)#.CreditCardJSID_HIDDEN.value, getRadioValue('ccCreditCard'), document.#trim(formname)#.ccCardHolderName.value, document.#trim(formname)#.ccCardNumber.value, document.#trim(formname)#.ccExpirationMonth.value, document.#trim(formname)#.ccExpirationYear.value, document.#trim(formname)#.ccVerificationNumber.value, document.#trim(formname)#.ccBillingAddressID.value);
				}
				else{					
					addCreditCardToArray(getRadioValue('ccCreditCard'), document.#trim(formname)#.ccCardHolderName.value, document.#trim(formname)#.ccCardNumber.value, document.#trim(formname)#.ccExpirationMonth.value, document.#trim(formname)#.ccExpirationYear.value, document.#trim(formname)#.ccVerificationNumber.value, document.#trim(formname)#.ccBillingAddressID.value);
				};
				
			};			
			
			function updateCreditCard(id, cccreditcardtypeid, cccardholdername, cccardnumber, ccexpirationmonth, ccexpirationyear, ccverificationnumber, ccbillingaddressid){
				if(cccreditcardtypeid != '' && cccardholdername != '' && cccardnumber != '' && ccexpirationmonth != '' && ccexpirationyear != '' && ccverificationnumber != '' && ccbillingaddressid != ''){																	
								
					ccCreditCardTypeID[id] = cccreditcardtypeid; 
					ccCardHolderName[id] = cccardholdername; 
					ccCardNumber[id] = cccardnumber; 
					ccExpirationMonth[id] = ccexpirationmonth;
					ccExpirationYear[id] = ccexpirationyear;
					ccVerificationNumber[id] = ccverificationnumber;
					ccBillingAddressID[id] = ccbillingaddressid;							
					loadCreditCardArrayDisplay();
					toggleCreditCardInput();		
					changeShowCreditCard(id);
					
				};
			};
			
			function addCreditCardToArray(cccreditcardtypeid, cccardholdername, cccardnumber, ccexpirationmonth, ccexpirationyear, ccverificationnumber, ccbillingaddressid){
				if(cccreditcardtypeid != '' && cccardholdername != '' && cccardnumber != '' && ccexpirationmonth != '' && ccexpirationyear != '' && ccverificationnumber != '' && ccbillingaddressid != ''){
					
					for (i = 0; i < ccIDs.length; i++){									
						if(cccardnumber == ccCardNumber[i]){
							alert("The Credit Card number entered already exists.\n\nClick \"Cancel\" and choose that credit card to edit it otherwise enter a new number.");
							return false;
						};	
					};	
												
					var len = insertCreditCardToArray(cccreditcardtypeid, cccardholdername, cccardnumber, ccexpirationmonth, ccexpirationyear, ccverificationnumber, ccbillingaddressid);							
					loadCreditCardArrayDisplay();
					clearCreditCardInput();
					changeShowCreditCard(len);														
					CCInput.style.display='none';
					CCSelect.style.display='inline';					
				};
			};
			 	
			function insertCreditCardToArray(cccreditcardtypeid, cccardholdername, cccardnumber, ccexpirationmonth, ccexpirationyear, ccverificationnumber, ccbillingaddressid){
								
				var newLength = eval(ccIDs.length);
				ccIDs[newLength] = newLength;
					
				if(document.#trim(formname)#.CreditCardDBID_HIDDEN.value != ''){
					ccDBID[newLength] = document.#trim(formname)#.CreditCardDBID_HIDDEN.value;
				}
				else{	
					ccDBID[newLength] = "@@";
				};
								
				ccCreditCardTypeID[newLength] = cccreditcardtypeid; 
				ccCardHolderName[newLength] = cccardholdername; 
				ccCardNumber[newLength] = cccardnumber; 
				ccExpirationMonth[newLength] = ccexpirationmonth;
				ccExpirationYear[newLength] = ccexpirationyear;
				ccVerificationNumber[newLength] = ccverificationnumber;
				ccBillingAddressID[newLength] = ccbillingaddressid;		
				ccIsDefault[newLength] = 0;										
				return newLength;								
				
			};			
			
			function editCreditCardFunction(){
				
				for (var i = 1; i < ccIDs.length; i++){
					
					if(document.#trim(formname)#.CreditCardID.options[i].selected == true){	
						thisccID = ccIDs[i];
						thisccDBID= ccDBID[i];
						thisccCreditCardTypeID = ccCreditCardTypeID[i];
						thisccCardHolderName = ccCardHolderName[i];
						thisccCardNumber = ccCardNumber[i];
						thisccExpirationMonth = ccExpirationMonth[i];
						thisccExpirationYear = ccExpirationYear[i];	
						thisccVerificationNumber = ccVerificationNumber[i];
						thisccBillingAddressID = ccBillingAddressID[i];
						thisccIsDefault= ccIsDefault[i];
						alert(thisccBillingAddressID);
						for(var i=0; i < document.#trim(formname)#.ccCreditCard.length; i++){
						  	if(thisccCreditCardTypeID == document.#trim(formname)#.ccCreditCard[i].value){
								document.#trim(formname)#.ccCreditCard[i].checked = true;									
								break;
							};
						  };
						
						document.#trim(formname)#.ccCardHolderName.value = thisccCardHolderName;
						document.#trim(formname)#.ccCardNumber.value = thisccCardNumber;
						document.#trim(formname)#.ccExpirationMonth.value = thisccExpirationMonth;
						document.#trim(formname)#.ccExpirationYear.value = thisccExpirationYear
						document.#trim(formname)#.ccVerificationNumber.value = thisccVerificationNumber;	
						
						for (var i = 1; i < document.#trim(formname)#.ccBillingAddressID.length; i++){
							
							var found = 0;					
							
							if(i == thisccBillingAddressID){
								found = 1;
								changeShowBillingAddress(i);								
								break;
							}
							
							if(!found){
								changeShowBillingAddress(0);		
							};
							
						};	
										
						document.#trim(formname)#.CreditCardDBID_HIDDEN.value = thisccDBID;
						document.#trim(formname)#.CreditCardJSID_HIDDEN.value = thisccID;
																	
						CCSelect.style.display='none';
						CCInput.style.display='inline';							
						
						break;											
					};				
				};
			};
			
			function deleteCreditCardFunction(){		
				
				for (i = 1; i < ccIDs.length; i++){
					
					if(document.#trim(formname)#.CreditCardID.options[i].selected == true){	
						
						var delCreditCard = confirm("Are you sure you want to delete this Credit Card?");
			
						if(delCreditCard){
									
							ccIDs.splice(i, 1);
							ccDBID.splice(i, 1);
							ccCreditCardTypeID.splice(i, 1);
							ccCardHolderName.splice(i, 1);
							ccCardNumber.splice(i, 1);
							ccExpirationMonth.splice(i, 1);
							ccExpirationYear.splice(i, 1);
							ccVerificationNumber.splice(i, 1);	
							ccBillingAddressID.splice(i, 1);
							ccIsDefault.splice(i, 1);
							
							document.#trim(formname)#.CreditCardID.length = 0;				
														
							loadCreditCardArrayDisplay();
			
						};
						
						break;											
					};				
				};			
				debugCreditCards();
			};
			
			function defaultCreditCardFunction(){
				var selected = '';
				
				if(document.#trim(formname)#.CreditCardID.options[0].selected != true){
					
					for (i = 1; i < ccIDs.length; i++){
						
						if(document.#trim(formname)#.CreditCardID.options[i].selected == true){
							selected = i;
							ccIsDefault[i] = 1;
						}
						else{
							ccIsDefault[i] = 0;
						};
					};
					
					loadCreditCardArrayDisplay();			
					changeShowCreditCard(selected);
											
				};	
			};
			
			
			<!---End Credit Card Section--->
			
			
			
			
			
			
			function clearInvoicePreference(){
				for(var i=0; i < document.#trim(formname)#.invoicePreference.length; i++){
					document.#trim(formname)#.invoicePreference[i].checked = false;									
				};
			};		
							
			function closePM(){
								
				for(i = 1; i <= document.#formname#.PaymentPreference.length; i++){

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
			
			
			function toggleSubmit(){
				if(document.#trim(formname)#.submitButton.style.display == 'inline'){							
					document.#trim(formname)#.submitButton.style.display='none'; 
					spProcess.style.display='inline';
				}
				else{					
					document.#trim(formname)#.submitButton.style.display='inline'; 
					spProcess.style.display='none';				
				};		
			};
			
			
			/**********************************************************************/
			/* javascript utility functions                                       */
			/**********************************************************************/		
			<!---get radio value--->			
			function getRadioValue2(elementName){
				
				var value;
				var a = 'document.#trim(formname)#.' + elementName + '.length';
				
				for(var i = 0; i < eval(a); i++){
					
					var b = 'document.#trim(formname)#.' + elementName + '[' + i + '].checked';
					
					if(eval(b)){
						var c = 'document.#trim(formname)#.' + elementName + '[' + i + '].value';
						value = eval(c);
						return value;
					};
				}
				
			};
			
			
			<!---Phone JS--->
			function IsValidPhoneJS(phone) {									
							
				phone = phone.replace(/\s|\(|\-|\)|\.|x|:|\*/g, "");
				if (phone.length < 10) {										
					return false
				}
				else return true;  
				
			};	
			
			function IsValidEmailJS(str) {									
							
				var regEx = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; 
				if (!regEx.test(str)) {										
					return false
				}
				else return true;  
				
			};	
			
			function checkEmailAddress(email){						
				
				var url = "#trim(request.urlReconstructed)#/ws/wsEmailAddress.cfc?method=wsEmailExists&Data1=" + escape(email) + "&Data2=#trim(EntityID)#";				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				//alert(url + result);
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
		    };
			
			
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
			
			
			
			function debugAddresses(){
				
				var addresses = "";
				
				for (i = 1; i < AddressIDs.length; i++){
					thisAddressID = AddressIDs[i];
					thisAddressTypeID = AddressTypeID[i];
					thisAddressDBID = AddressDBID[i];
					thisAddressLine1 = AddressLine1[i];				
					thisAddressLine2 = AddressLine2[i];
					thisAddressCity = AddressCity[i];
					thisAddressStateID = AddressStateID[i];
					thisAddressZipCode = AddressZipCode[i];
					thisAddressIsDefault = AddressIsDefault[i];
					
					if(thisAddressLine2 == ''){
						thisAddressLine2= "@@";
					};
					
					thisAddress =  thisAddressID + "|" + thisAddressDBID + "|" + thisAddressTypeID + "|" + thisAddressIsDefault + "|" + thisAddressLine1 + "|" + thisAddressLine2 + "|" + thisAddressCity + "|" + thisAddressStateID + "|" + thisAddressZipCode;						
											
					addresses = addresses + thisAddress + "\n\n";	
										
				};
				
				alert(addresses);
					
			};	
						
			function debugEmailAddresses(){
				
				var emailaddresses = "";
				
				for (i = 1; i < emailAddressIDs.length; i++){
					thisEmailAddressID = emailAddressIDs[i];
					thisEmailAddressTypeID = emailAddressTypeID[i];
					thisEmailAddressDBID = emailAddressDBID[i];
					thisEmailAddress = emailAddress[i];					
					thisEmailAddressIsDefault = emailAddressIsDefault[i];				
											
					emailaddresses = emailaddresses + thisEmailAddress + "\n\n";						
					
				};
				
				alert(emailaddresses);
					
			};		
			
			function debugPhoneNumbers(){
				
				var phonenumbers = "";
				
				for (i = 1; i < PhoneIDs.length; i++){
					thisPhoneID = PhoneIDs[i];
					thisPhoneNumberTypeID = phoneNumberTypeID[i];
					thisPhoneNumberDBID = phoneNumberDBID[i];
					thisPhoneNumber = phoneNumber[i];	
					thisPhoneExtension = phoneExtension[i];					
					thisPhoneNumberIsDefault = phoneNumberIsDefault[i];				
											
					phonenumbers = phonenumbers + "[" + thisPhoneID + " : " + thisPhoneNumberTypeID + " : " + thisPhoneNumberDBID + "] " + formatPhoneUS(thisPhoneNumber) + "  Ext." + thisPhoneExtension + "\n\n";						
					
				};
				
				alert(phonenumbers);
					
			};		
			
			function debugCreditCards(){
				
				var creditcards = "";
				
				for (i = 0; i < ccIDs.length; i++){
					thisCCID = ccIDs[i];
					thisccCreditCardTypeID = ccCreditCardTypeID[i];
					thisccCardHolderName = ccCardHolderName[i]; 
					thisccCardNumber = ccCardNumber[i];			
					thisccExpirationMonth = ccExpirationMonth[i]; 			
					thisccExpirationYear = ccExpirationYear[i]; 
					thisccVerificationNumber = ccVerificationNumber[i];
					thisccBillingAddressID = ccBillingAddressID[i];
											
					creditcards = creditcards + thisCCID + " : " + thisccCreditCardTypeID + " : " + thisccCardHolderName + " : " + thisccCardNumber + " : " + thisccExpirationMonth + " : " + thisccExpirationYear + " : " + thisccVerificationNumber + " : " + thisccBillingAddressID + "\n\n";						
					
				};
				
				alert(creditcards);
					
			};
			
		</script>
		
	</cfoutput>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If there is a message sent display it.                                         --->
<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			&nbsp;<br>#trim(msg)#</br>			
		</cfoutput>
	</cfif>	
		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form method="post" name="#trim(formname)#" action="appAdminClientAdministrationProcess.cfm" onsubmit="return validateForm();">		
			
			<input type="Hidden" name="EntityID" value="#trim(EntityID)#">
				
			<table border="0" cellpadding="0" cellspacing="0">		
				<tr>
					<td>&nbsp;</td>
				</tr>			
				
				<!-------------------------------------------------------------------------------------->
				<!--- Company Information Section                                                    --->
				<!-------------------------------------------------------------------------------------->				
				<tr>
					<td>
									
						<cf_gcBorderedTable titlesize="2" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company Information" tableWidth="100%">	
											
							<table border="0" cellpadding="1" cellspacing="0">															
								<tr>
									<td class="SiteRequiredLabel">		
										Name:&nbsp;															
									</td>
									<td>		
										<input type="Text" class="SiteTextbox" name="clientName" value="#trim(getClientInformation.ClientName)#" size="45" maxlength="80">			
									</td>
								</tr>
								<tr>
									<td class="SiteLabel">								
										DBA:&nbsp;															
									</td>
									<td>		
										<input type="Text" class="SiteTextbox" name="clientDBA" value="#trim(getClientInformation.ClientDBA)#" size="45" maxlength="80">		
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
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Company Phone Numbers Section                                                  --->
				<!-------------------------------------------------------------------------------------->				
				<tr>				
					<td>	
						
						<cf_gcBorderedTable titlesize="2" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company&nbsp;Phone&nbsp;Numbers" tableWidth="100%">	
					
							<input type="Hidden" name="phonenumbers" value="">		
							<table border="0" cellpadding="0" cellspacing="0">		
								<tr>
									<td>									
										
										<table border="0" cellpadding="1" cellspacing="0" id="UsersPhoneNumberInput" style="display:'none';">							
											<input type="Hidden" name="UsersPhoneNumberDBID_HIDDEN" value="">
											<input type="Hidden" name="UsersPhoneNumberJSID_HIDDEN" value="">
											<tr>
												<td class="SiteRequiredLabel">								
													Type:&nbsp;															
												</td>
												<td>													
													<select class="SiteSelectBox" name="UserPhoneNumberTypeID">											
														<cfloop query="getAllPhoneTypes">
															<option value="#StandardListItemID#"> #ItemNameDisplay#
														</cfloop>
													</select>														
												</td>
											</tr>							
											
											<tr>
												<td class="SiteRequiredLabel">								
													Phone&nbsp;Number:&nbsp;															
												</td>
												<td>
													<input type="text" class="SiteTextBox" name="UserPhoneNumber" size="25" maxlength="80" value="" onkeyup="this.value=this.value.replace(/[\W_+]/g,'');">&nbsp;<font size="1">ext.</font>&nbsp;<input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="UserPhoneExtension" size="5" maxlength="6">
												</td>
											</tr>								
											<tr>
												<td colspan="2" align="center" style="padding-top:1.0ex">
													<input type="Button" class="SiteSubmitbox" value="Save Phone Number" onclick="UpdateAddPhoneFunction();">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel" onclick="toggleUserPhoneNumberInput();">
												</td>
											</tr>	
											<tr>
												<td colspan="2" align="center"><span id="spUserPhoneNumber" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
											</tr>																					                				
										</table>
										
										<table border="0" cellpadding="0" cellspacing="0" id="UsersPhoneNumberSelect" style="display:'inline';">											
											<tr>
												<td class="SiteRequiredLabel">Phone&nbsp;Number:&nbsp;</td>
												<td class="SiteLabel">
													<select class="SiteSelectBox" style="width:325px;" name="UsersPhoneNumber"></select>
												</td>	
											</tr>	
											<tr>
												<td>&nbsp;</td>
												<td valign="top" align="center"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addUserPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="toggleUserPhoneNumberInput();"><font color="FF0000"><u>Add&nbsp;Phone</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="editUserPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="editUserPhoneNumberFunction();"><font color="FF0000"><u>Edit&nbsp;Phone</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="deleteUsersPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteUsersPhoneNumberFunction();"><font color="FF0000"><u>Delete&nbsp;Phone</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="defaultUsersPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="defaultUserPhoneNumberFunction();"><font color="FF0000"><u>Set&nbsp;as&nbsp;Default</u></font></span></td>
											</tr>		
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>								
										</table>			
								
									</td>
								</tr>					
							</table>
							
						</cf_gcBorderedTable>			
					
					</td>
				</tr>				
				
								
				<!-------------------------------------------------------------------------------------->
				<!--- Start the display of the email addresses.                                      --->
				<!-------------------------------------------------------------------------------------->				
				<tr>
					<td>
						<input type="Hidden" name="emailaddresses" value="">
						<input type="Hidden" name="UsersEmailAddressDBID_HIDDEN" value="">
						<input type="Hidden" name="UsersEmailAddressJSID_HIDDEN" value="">
						<!------------------------------------------------------------------>
						<!--- Show an email addresses on this page.                      --->
						<!------------------------------------------------------------------>		
						<cf_gcBorderedTable titlesize="2" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company&nbsp;Support&nbsp;Email&nbsp;Address" tableWidth="100%">	
										
							<table border="0" cellpadding="1" cellspacing="0" id="UsersEmailAddressInput" style="display:'none';">														
								<tr>
									<td class="SiteRequiredLabel">								
										Type:&nbsp;															
									</td>
									<td>
										<select class="SiteSelectBox" name="UserEmailAddressTypeID">											
											<cfloop query="getAllEmailTypes">
												<option value="#StandardListItemID#"> #ItemNameDisplay#
											</cfloop>
										</select>									
									</td>
								</tr>							
								
								<tr>
									<td class="SiteRequiredLabel">								
										Email&nbsp;Address:&nbsp;															
									</td>
									<td>
										<input type="text" class="SiteTextBox" name="UserEmailAddress" size="35" maxlength="80" value=""><!--- onblur="if (checkEmailAddress(this.value) == 'true'){spUserEmailAddress.innerHTML = '- This email address already exists. - '; document.#trim(formname)#.UserEmailAddress.value = ''; return false;} else if(this.value != '') {spUserEmailAddress.innerHTML = '- Please save this email address. -';};"--->
									</td>
								</tr>	
								<tr>
									<td colspan="2" align="center"><span id="spUserEmailAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
								</tr>							
								<tr>
									<td colspan="2" align="center" style="padding-top:1.0ex">
										<input type="Button" class="SiteSubmitbox" value="Save Email Address" onclick="if (checkEmailAddress(UserEmailAddress.value) == 'true'){document.#trim(formname)#.UserEmailAddress.value = ''; spUserEmailAddress.innerHTML = '- This email address already exists. - ';} else {UpdateAddEmailAddressFunction();};">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel" onclick="toggleUserEmailAddressInput();">
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>																											                				
							</table>
								
							<table border="0" cellpadding="0" cellspacing="0" id="UsersEmailAddressSelect" style="display:'inline';">								
								<tr>
									<td class="SiteRequiredLabel">Email&nbsp;Address:&nbsp;</td>
									<td class="SiteLabel">
										<select class="SiteSelectBox" style="width:325px;" name="UsersEmailAddress" onchange="changeEmailAddress(this.selectedIndex);"></select>
									</td>	
								</tr>	
								<tr>
									<td>&nbsp;</td>
									<td valign="top" align="center"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addUserEmailAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="toggleUserEmailAddressInput();"><font color="FF0000"><u>Add&nbsp;Email</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="editUserEmailAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="editUserEmailAddressFunction();"><font color="FF0000"><u>Edit&nbsp;Email</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="deleteUsersEmailAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteUsersEmailAddressFunction();"><font color="FF0000"><u>Delete&nbsp;Email</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="defaultUsersPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="defaultUserEmailAddressFunction();"><font color="FF0000"><u>Set&nbsp;as&nbsp;Default</u></font></span></td>
								</tr>		
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>								
							</table>	
								
						</cf_gcBorderedTable>
						
					</td>
				</tr>
				
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Start the address section                                                      --->
				<!-------------------------------------------------------------------------------------->				
				<tr>
					<td>
									
						<cf_gcBorderedTable titlesize="2" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Company&nbsp;Addresses" tableWidth="100%">	
	
							<!-------------------------------------------------------------------------------------->
							<!--- This hidden field is used in case the user edits an address.                   --->
							<!-------------------------------------------------------------------------------------->
							<input type="Hidden" name="UsersAddressDBID_HIDDEN" value="">
							<input type="Hidden" name="AddressJSID_HIDDEN" value="">
							<input type="Hidden" name="addresses" value="">	
																		
							<table border="0" cellpadding="1" cellspacing="0" id="UsersAddressInput" style="display:'none';">						
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
							   			<input class="SiteTextbox" type="text" name="AddressCity" size="15" maxlength="50" value="">&nbsp;&nbsp;<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates"><select class="SiteSelectBox" name="AddressStateID"><option value=""><cfloop query="getAllStates"><option value="#StandardListItemID#" <cfif StandardListItemID EQ 59>SELECTED</cfif>> #ItemNameDisplay#</cfloop></select>&nbsp;<input class="SiteTextbox" type="Text" name="AddressZipCode" size="10" maxlength="25" value="" onblur="spSaveAddress.innerHTML = '- Please save this address. - ';"> 					
									</td>
								</tr>	
								<tr>
									<td colspan="3" align="center" style="padding-top:1.0ex">
										<input type="Button" class="SiteSubmitbox" value="Save Address" onclick="UpdateAddAddressFunction();">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel" onclick="toggleAddressInput(13);">
									</td>
								</tr>	
								<tr>
									<td colspan="3" align="center"><span id="spSaveAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
								</tr>								
							</table>	
	
	
							<!-------------------------------------------------------------------------------------->
							<!--- Show the select box of available addresses from the corporate client account.  --->
							<!-------------------------------------------------------------------------------------->						
							<table border="0" cellpadding="0" cellspacing="0" id="UsersAddressSelect" style="display:'inline';">													
								<tr>
									<td class="SiteRequiredLabel">Address:&nbsp;</td>									
								</tr>	
								<tr>									
									<td class="SiteLabel">
										<select style="width:400px;" name="UsersAddress" onchange="changeAddress(this.selectedIndex);" class="SiteSelectBox"></select>
									</td>	
								</tr>	
								<tr>									
									<td valign="top" align="center"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="toggleAddressInput(13);"><font color="FF0000"><u>Add&nbsp;Address</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="editAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="editAddressFunction();"><font color="FF0000"><u>Edit&nbsp;Address</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="deleteUsersAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteAddressFunction();"><font color="FF0000"><u>Delete&nbsp;Address</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="defaultUsersAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="defaultAddressFunction();"><font color="FF0000"><u>Set&nbsp;as&nbsp;Default</u></font></span></td>
								</tr>									
								<tr>
									<td colspan="1">&nbsp;</td>
								</tr>								
							</table>							
							
						</cf_gcBorderedTable>
					
					</td>
				</tr>
				
				
				
				
				
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Start the payment preference                                                   --->
				<!-------------------------------------------------------------------------------------->				
				<!---<tr>
					<td>
									
						<cf_gcBorderedTable titlesize="2" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Payment&nbsp;Preference" tableWidth="100%">	
							
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
												<input type="Radio" name="PaymentPreference" value="#StandardListItemID#" <cfif trim(getClientInformation.PreferredPayMethod) EQ 7> CHECKED</cfif> onclick="closePM(); paymethodsTR_1.style.display='inline';">																											
											<cfelseif StandardListItemID EQ 8>															
												<input type="Radio" name="PaymentPreference" value="#StandardListItemID#" <cfif trim(getClientInformation.PreferredPayMethod) EQ 8> CHECKED</cfif> onclick="closePM(); paymethodsTR_2.style.display='inline';">																											
											<cfelseif StandardListItemID EQ 9>															
												<input type="Radio" name="PaymentPreference" value="#StandardListItemID#" <cfif trim(getClientInformation.PreferredPayMethod) EQ 9> CHECKED</cfif> onclick="closePM(); paymethodsTR_3.style.display='inline'; clearInvoicePreference();"><!---document.#trim(formname)#.InvoiceEmailAddress.value = document.#trim(formname)#.AdministratorEmailAddress.value--->															
											<cfelse>
												<input type="Radio" name="PaymentPreference" value="#StandardListItemID#" onclick="closePM();">		
											</cfif>#ItemNameDisplay#																																			
										</cfloop>									
									</td>								
								</tr>
							</table>
													
							<table border="0" cellpadding="1" cellspacing="2" align="center" width="75%">		
									<br><cfloop query="getAllPayTypes">
										
										<cfset display = "none">		
										
										<!-------------------------------------------------------------------------------------->
										<!--- Credit Card Section                                                            --->
										<!-------------------------------------------------------------------------------------->										
										<cfif StandardListItemID EQ 7>													
											
											<input type="Hidden" name="CreditCardDBID_HIDDEN" value="">
											<input type="Hidden" name="CreditCardJSID_HIDDEN" value="">
											<input type="Hidden" name="ccards" value="">	
											
											<cfif trim(getClientInformation.PreferredPayMethod) EQ 7>
												<cfset display = "inline">
											</cfif>
											
											<tr id="paymethodsTR_1" style="display:'#trim(display)#';">
												<td colspan="2">
													<cf_gcBorderedTable titlesize="2" boxLineBorderColor="c0c0c0" title="Credit&nbsp;Card&nbsp;Information" tableWidth="100%">
													
													<cfif trim(getAllUsersCCs.RecordCount) GTE 1>
														<cfset CCSelect = "inline">
														<cfset CCInput = "none">
													<cfelse>
														<cfset CCSelect = "none">
														<cfset CCInput = "inline">	
													</cfif>
														
														<!---Show current Credit Cards--->																												
														<table style="margin-top:6px;" border="0" id="CCSelect" style="display:'#trim(CCSelect)#';">
										              		<tr>															
																<td align="center" vAlign="middle" nowrap>														
																	<select style="width:325px;" class="SiteSelectBox" name="CreditCardID"></select>	
																</td>
															</tr>
															<tr>																
																<td valign="top" align="center"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addCreditCard" onmouseover="highlight()" onmouseout="lolight()" onclick="toggleCreditCardInput();"><font color="FF0000"><u>Add&nbsp;Card</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="editCreditCard" onmouseover="highlight()" onmouseout="lolight()" onclick="editCreditCardFunction();"><font color="FF0000"><u>Edit&nbsp;Card</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="deleteCreditCard" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteCreditCardFunction();"><font color="FF0000"><u>Delete&nbsp;Card</u></font></span><font class="med" color="000000">&nbsp;&nbsp;|&nbsp;&nbsp;</font><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="defaultCreditCard" onmouseover="highlight()" onmouseout="lolight()" onclick="defaultCreditCardFunction();"><font color="FF0000"><u>Set&nbsp;as&nbsp;Default</u></font></span></td>
															</tr>																
														</table>
														
															
														<!---Show Credit Card input--->
														<table style="margin-top:6px;" border="0" id="CCInput" style="display:'#trim(CCInput)#';">
										              		<tr>															
																<td align="center" vAlign="middle" colSpan="2" nowrap>												
																	<cfloop query="getAllCCTypes">
																		<input onclick="document.#trim(formname)#.ccCardNumber.value = '';" type="radio" name="ccCreditCard" value="#StandardListItemID#" <cfif StandardListItemID EQ 70>CHECKED</cfif>><img align="absMiddle" src="images/CC_#StandardListItemID#.gif" alt="" border="0">&nbsp;&nbsp;	
																	</cfloop>
																</td>
															</tr>													
															<tr>
										              			<td class="SiteRequiredLabel" colspan="2">
																	Name&nbsp;as&nbsp;it&nbsp;appears&nbsp;on&nbsp;card:<br>
											              			<input value="" class="SiteTextbox" maxlength="17" type="text" style="width:180px;" size="32" name="ccCardHolderName">
																</td>	              			
										              		</tr>
															<tr>
										              			<td class="SiteRequiredLabel" width="35%">
																	Credit&nbsp;Card&nbsp;Number<br>
											              			<input value="" class="SiteTextbox" maxlength="17" type="text" style="width:180px;" size="32" name="ccCardNumber" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" onblur="if(!isValidCreditCardNumber(this.value)){alert('Please provide a valid credit card number'); this.focus();};">
										              			</td>
										              			<td class="SiteRequiredLabel">																
																	&nbsp;&nbsp;Expiration Date
									          			            <br>
									          			            &nbsp;&nbsp;<select style="width:70px;" name="ccExpirationMonth" class="SiteSelectBox"><option value="">Mo<option value="01">01 - Jan<option value="02">02 - Feb<option value="03">03 - Mar<option value="04">04 - Apr<option value="05">05 - May<option value="06">06 - Jun<option value="07">07 - Jul<option value="08">08 - Aug<option value="09">09 - Sep<option value="10">10 - Oct<option value="11">11 - Nov<option value="12">12 - Dec</select>
									          			            <select style="width:65px;" name="ccExpirationYear" class="SiteSelectBox"><option value="">Year<option value="2006">2006<option value="2007">2007<option value="2008">2008<option value="2009">2009<option value="2010">2010<option value="2011">2011<option value="2012">2012<option value="2013">2013<option value="2014">2014<option value="2015">2015</select>
									              				</td>
										              		</tr>
															<tr>
										              			<td colspan="2">
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
																				<font>
																					<strong>Visa, MC, Discover:</strong> Last 3 digits on back of card.
																					<br><strong>Amex:</strong> Last 4 digits on the front of card.
																					<br>
																					<a href="javascript:openHelp('1043363603359');">What's a CID?</a>
																				</font>
													              			</td>
													              		</tr>
													              	</table>
																</td>
										              		</tr>
															
															<!---Show Credit Card Address--->
															<tr>
																<td colspan="2" class="SiteRequiredLabel"><div style="padding-top:2.0ex">Credit&nbsp;Card&nbsp;Billing&nbsp;Address:&nbsp;&nbsp;</div></td>
															</tr>
															<tr>
																<td colspan="2" class="SiteLabel"><select style="width:400px;" name="ccBillingAddressID" class="SiteSelectBox"></select></td>
															</tr>
															<tr>
																<td colspan="2" valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addAnAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="toggleAddressInput(11);"><u><font color="FF0000">Add&nbsp;address</font></u></span></td>
															</tr>								
															
															<tr>
																<td colspan="2" valign="top">&nbsp;</td>
															</tr>	
															<tr>
																<td colspan="2" align="center" style="padding-top:1.0ex">
																	<input type="Button" class="SiteSubmitbox" value="Save Credit Card" onclick="UpdateAddCreditCardFunction();">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel" onclick="toggleCreditCardInput();">
																</td>
															</tr>	
										              	</table>														
														
										              	
													</cf_gcBorderedTable>			
												</td>
											</tr>	
											
										<cfelseif StandardListItemID EQ 8>	
											
											<cfset BankRoutingCode = "">
											<cfset BankAccountNumber = "">
											<cfset checkBillingAddressIDselected = "0">
											
											<cfif trim(getClientInformation.PreferredPayMethod) EQ 8>
												<cfset display = "inline">
											</cfif>
											
											<cfquery name="getSS" datasource="#trim(request.datasource)#">
												SELECT EntityID, ColM, ColE, ColR, IsDefault
												FROM entityss
												WHERE EntityID = #trim(EntityID)# AND Active = 1
											</cfquery>
											
											<cfif getSS.RecordCount EQ 1>
												
												<cfset SS = application.beanFactory.getBean('globalFooter').GlobalFooterListD(trim(getSS.ColM)#|#trim(getSS.ColE)#|#trim(getSS.ColR)) />
												<cfset BankRoutingCode = ListGetAt(SS, 1, "|")>
												<cfset BankAccountNumber = ListGetAt(SS, 2, "|")>
												<cfset checkBillingAddressIDselected = ListGetAt(SS, 3, "|")>
												
											</cfif>
											
																				
											<tr id="paymethodsTR_2" style="display:'#trim(display)#';">
												<td colspan="2">
													<cf_gcBorderedTable titlesize="2" boxLineBorderColor="c0c0c0" title="Check&nbsp;Debiting" tableWidth="100%">
														<table cellpadding="2" cellspacing="1" border="0">
															<tr>
																<td bgcolor="FFFFFF" align="center" valign="top">																				
																	<table border="0" cellpadding="2" cellspacing="0" width="100%">
																		<tr>
																			<td colspan="3" align="center" valign="bottom">
																				<img src="images/CC_checkDebitExample.gif" border="0" alt="">	
																			</td>
																		</tr>
																		<tr>
																			<td class="SiteLabel" colspan="3" align="center" valign="top">
																				Enter the numbers from the bottom of your check as illustrated
																			</td>
																		</tr>
																		<tr>
																			<td class="SiteLabel" colspan="3" align="center" valign="top">
																				&nbsp;
																			</td>
																		</tr>																	
																		<tr>
																			<td class="SiteRequiredLabel" align="right">Bank&nbsp;Routing&nbsp;Code:</td>
																			<td colspan="2">
																			   <input onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" class="SiteTextbox" type="text" size="10" maxlength="9" name="BankRoutingCode" value="#trim(BankRoutingCode)#">
																			</td>
																		</tr>
																		</tr>	
																			<td class="SiteRequiredLabel" align="right">Bank&nbsp;Account&nbsp;Number:</td>
																			<td colspan="2">
																			   <input onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" class="SiteTextbox" type="text" size="17" maxlength="17" name="BankAccountNumber" value="#trim(BankAccountNumber)#">
																			</td>
																		</tr>
																		
																		
																		<!---Show Check Debiting Address--->
																		<input type="Hidden" name="checkBillingAddressID_Hidden" value="">
																		<tr>
																			<td colspan="3" class="SiteRequiredLabel"><div style="padding-top:2.0ex">Billing&nbsp;Address:</div></td>
																		</tr>
																		<tr>
																			<td colspan="3" class="SiteLabel" valign="bottom"><select style="width:400px;" name="checkBillingAddressID" class="SiteSelectBox"></select></td>
																		</tr>
																																				
																		<tr>
																			<td colspan="3" valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addAnAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="toggleAddressInput(11);"><u><font color="FF0000">Add&nbsp;address</font></u></span></td>
																		</tr>								
																		
																		<tr>
																			<td colspan="3" valign="top">&nbsp;</td>
																		</tr>
																		
															
																	</table>
																</td>
															</tr>
														</table>
													</cf_gcBorderedTable>
												</td>
											</tr>
										
										<cfelseif StandardListItemID EQ 9>	
											
											<cfif trim(getClientInformation.PreferredPayMethod) EQ 9>
												<cfset display = "inline">
											</cfif>
											
											<cfquery name="getTS" datasource="#trim(request.datasource)#">
												SELECT EntityID, ColM, ColR, IsDefault
												FROM entityts
												WHERE EntityID = #trim(EntityID)# AND Active = 1
											</cfquery>
											
											<cfset ColR = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getTS.ColR)) />
											
											<cfif getTS.ColM EQ 0>					
												<cfquery name="getInvoiceEmailID" datasource="#trim(request.datasource)#">
													SELECT EmailAddressID
													FROM emailaddress
													WHERE EmailAddressID = #trim(ColR)# AND Active = 1
												</cfquery>																																	
											<cfelse>
												<cfset 	getInvoiceEmailID.EmailAddressID = 00>																															
											</cfif>
												
											<cfif getTS.ColM EQ 1>											
												<cfquery name="getInvoiceAddressID" datasource="#trim(request.datasource)#">
													SELECT a.AddressID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, s.ItemNameDisplay AS State
													FROM address a LEFT OUTER JOIN pa_master.standardlistitem s ON a.StateID = s.StandardListItemID
													WHERE a.AddressID = #trim(ColR)# AND a.Active = 1 AND s.Active = 1
												</cfquery>	
												<cfif getInvoiceAddressID.RecordCount EQ 1>
													<cfset getInvoiceAddressID_AddressID = getInvoiceAddressID.AddressID>
												</cfif>																							
											</cfif>	
																														
											<tr id="paymethodsTR_3" style="display:'#trim(display)#';">
												<td colspan="2">
													<cf_gcBorderedTable titlesize="2" boxLineBorderColor="c0c0c0" title="Invoice" tableWidth="100%">
														<table cellpadding="2" cellspacing="1" border="0" width="100%">
															<tr>
																<td bgcolor="FFFFFF"  valign="top">																				
																	<table border="0" cellpadding="1" cellspacing="0">																	
																		<tr>
																			<td><input type="Radio" name="invoicePreference" value="email" <cfif getTS.ColM EQ 0> checked</cfif> onclick="invoiceAddressSelect.style.display = 'none'; invoiceEmailAddressSelect.style.display = 'inline';"></td>																		
																			<td class="SiteLabel">Email&nbsp;Invoice:</td>
																			<td>
																				<select class="SiteSelectBox" name="InvoiceEmailAddress" style="display: 'none';" id="invoiceEmailAddressSelect">
																					<cfloop query="getAllClientEmailAddresses">
																						<cfset emailD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(email)) />
																						<option value="#trim(emailAddressID)#" <cfif trim(getInvoiceEmailID.EmailAddressID) EQ trim(emailAddressID)>SELECTED</cfif>>#trim(emailD)# <cfif FName NEQ "">-</cfif> #trim(FName)# #trim(LName)#
																					</cfloop>																			  
																				</select>																				
																			</td>
																		</tr>
																		<tr id="InvoiceEmailAddressTR" style="display:'none';">							
																			<td colspan="3">
																				<span id="spInvoiceEmailAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span>
																			</td>
																		</tr>		
																		<tr>																	
																			<td><input type="Radio" name="invoicePreference" value="mail" <cfif getTS.ColM EQ 1> checked</cfif> onclick="document.#trim(formname)#.InvoiceEmailAddress.value = ''; invoiceAddressSelect.style.display = 'inline'; invoiceEmailAddressSelect.style.display = 'none';"></td>
																			<td class="SiteLabel">Mail&nbsp;Invoice:</td>
																			<td><font color="FF0000"><span id="spInvoiceAddressMessage" style="font-size: xx-small;">&nbsp;</span></font></td>
																		</tr>																																	
																	</table>
																	
																	<table id="invoiceAddressSelect" style="display: 'none';" border="0" cellpadding="1" cellspacing="0" width="100%">
																		<tr>
																			<td class="SiteRequiredLabel"><div style="padding-top:2.0ex">Invoicing&nbsp;Address:</div></td>
																		</tr>
																		<tr>
																			<td class="SiteLabel" valign="bottom"><select style="width:400px;" name="invoiceBillingAddressID" class="SiteSelectBox"></select></td>
																		</tr>
																		<tr>
																			<td valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addAnAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="toggleAddressInput(11);"><u><font color="FF0000">Add&nbsp;address</font></u></span></td>
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
				</tr>--->
				
				
				
				
				
				
				
				
				
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>		
				
				<tr>
					<td align="center">			
						<input id="submitButton" type="Submit" value="Save Changes" style="display: 'inline';" class="SiteSubmitbox" onclick="toggleSubmit();">				
						<span id=spProcess style="display: 'none';" class="TextWarning">Processing...</span>												
					</td>
				</tr>			
			</table>			
						
		</form>
	
	</cfoutput>	
	
	
	
	
	
	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the javascript to be run at runtime.                                     --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<!-------------------------------------------------------------------------------------->
		<!--- This Javascript code must remain below the form so that the scripts            --->
		<!--- initialize correctly.                                                          --->
		<!-------------------------------------------------------------------------------------->		
		<script language="JavaScript">						
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Phone Number section                                                           --->
			<!-------------------------------------------------------------------------------------->
			var PhoneIDs = new Array();
			var phoneNumberDBID = new Array();
			var phoneNumberTypeID = new Array();			
			var phoneNumber = new Array();
			var phoneExtension = new Array();					
			var phoneNumberIsDefault = new Array();
			
			PhoneIDs[0] = "";		
			phoneNumberDBID[0] = "";
			phoneNumberTypeID[0] = "";
			phoneNumber[0] = "Select Phone Number";	
			phoneExtension[0] = "";					
			phoneNumberIsDefault[0] = ""; 	
			
			<cfset count = 0>
			
			<cfloop query="getCompanyPhoneNumbers">
				
				<cfset count = count + 1>
				<cfset PhoneD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneNumber)) />
				<cfset PhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneExtension)) />
				PhoneIDs[#trim(count)#] = "#trim(count)#";				
				phoneNumberDBID[#trim(count)#] = "#trim(PhoneID)#";		
				phoneNumberTypeID[#trim(count)#] = "#trim(PhoneTypeID)#";
				phoneNumber[#trim(count)#] = "#trim(PhoneD)#";
				phoneExtension[#trim(count)#] = "#trim(PhoneExtensionD)#";					
				phoneNumberIsDefault[#trim(count)#] = "#trim(IsDefault)#";
				
				<cfif trim(IsDefault)>
					<cfset defaultPhoneID = #trim(count)#>
				</cfif>
				
			</cfloop> 
							
			loadPhoneNumberArrayDisplay();			
			
			<cfif IsDefined("defaultPhoneID") AND IsNumeric(defaultPhoneID)>
				document.#trim(formname)#.UsersPhoneNumber.options[#trim(defaultPhoneID)#].selected = true;
			</cfif>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Email Addresses Section                                                        --->
			<!-------------------------------------------------------------------------------------->			
			var emailAddressIDs = new Array();
			var emailAddressDBID = new Array();
			var emailAddressTypeID = new Array();
			var emailAddress = new Array();			
			var emailAddressIsDefault = new Array();
			var firstName = new Array();
			var lastName = new Array();
						
			emailAddressIDs[0] = "";		
			emailAddressDBID[0] = "";
			emailAddressTypeID[0] = "";
			emailAddress[0] = "Select Email Address";				
			emailAddressIsDefault[0] = ""; 	
			firstName[0] = ""; 	
			lastName[0] = ""; 
			
			<cfset count = 0>
			
			<cfloop query="getCompanyEmailAddresses">
				
				<cfset count = count + 1>
				<cfset EmailD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(Email)) />
				emailAddressIDs[#trim(count)#] = "#trim(count)#";				
				emailAddressDBID[#trim(count)#] = "#trim(EmailAddressID)#";		
				emailAddressTypeID[#trim(count)#] = "#trim(EmailTypeID)#";
				emailAddress[#trim(count)#] = "#trim(EmailD)#";				
				
				<cfif trim(EmailAddressID) EQ trim(getClientInformation.SupportEmailID)>
					emailAddressIsDefault[#trim(count)#] = "1";
				<cfelse>	
					emailAddressIsDefault[#trim(count)#] = "0";
				</cfif>				
				
				firstName[#trim(count)#] = "#trim(FName)#";
				lastName[#trim(count)#] = "#trim(LName)#";
				
				<cfif trim(IsDefault)>
					<cfset defaultEmailID = #trim(count)#>
				</cfif>
				
			</cfloop> 
			
			<cfloop query="getAllClientEmailAddresses">
				
				<cfset count = count + 1>
				<cfset Emai2D = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(Email)) />
				emailAddressIDs[#trim(count)#] = "#trim(count)#";				
				emailAddressDBID[#trim(count)#] = "#trim(EmailAddressID)#";		
				emailAddressTypeID[#trim(count)#] = "#trim(EmailTypeID)#";
				emailAddress[#trim(count)#] = "#trim(Emai2D)#";				
				
				<cfif trim(EmailAddressID) EQ trim(getClientInformation.SupportEmailID)>
					emailAddressIsDefault[#trim(count)#] = "1";
				<cfelse>	
					emailAddressIsDefault[#trim(count)#] = "0";
				</cfif>
				
				firstName[#trim(count)#] = "#trim(FName)#";
				lastName[#trim(count)#] = "#trim(LName)#";
							
			</cfloop>
			
			thisEmailAddressID = emailAddressIDs[0];
			thisEmailAddress = emailAddress[0];				
			document.#trim(formname)#.UsersEmailAddress.options[0] = new Option(thisEmailAddress, thisEmailAddressID);
			
			loadEmailAddressesArrayDisplay();			
			
			
			


			<!-------------------------------------------------------------------------------------->
			<!--- Address section                                                                --->
			<!-------------------------------------------------------------------------------------->
			var AddressIDs = new Array();
			var AddressDBID = new Array();
			var AddressTypeID = new Array();
			var AddressLine1 = new Array();
			var AddressLine2 = new Array();
			var AddressCity = new Array();
			var AddressStateID = new Array();
			var AddressZipCode = new Array();
			var AddressIsDefault = new Array();
			
			AddressIDs[0] = "";		
			AddressDBID[0] = "";
			AddressTypeID[0] = "";
			AddressLine1[0] = "Select Address";	
			AddressLine2[0] = "";	
			AddressCity[0] = "";
			AddressStateID[0] = "";		
			AddressZipCode[0] = "";
			AddressIsDefault[0] = ""; 	
			
			<cfset count = 0>
					
			<cfloop query="getClientAddresses">
				
				<cfset count = count + 1>
				
				AddressIDs[#trim(count)#] = "#trim(count)#";
				AddressDBID[#trim(count)#] = "#trim(AddressID)#";		
				AddressTypeID[#trim(count)#] = "#trim(AddressTypeID)#";
				AddressLine1[#trim(count)#] = "#trim(AddressLine1)#";	
				AddressLine2[#trim(count)#] = "#trim(AddressLine2)#";	
				AddressCity[#trim(count)#] = "#trim(city)#";
				AddressStateID[#trim(count)#] = "#trim(stateID)#";		
				AddressZipCode[#trim(count)#] = "#trim(zipcode)#";	
				AddressIsDefault[#trim(count)#] = "#trim(IsDefault)#";
			
			</cfloop> 			
				
			
			loadAddressArrayDisplay();			
			
			/*<!---<cfif IsDefined("getInvoiceAddressID_AddressID") AND IsNumeric(getInvoiceAddressID_AddressID)>			
				for (k = 1; k < AddressIDs.length; k++){
					if(AddressDBID[k] == #trim(getInvoiceAddressID_AddressID)#){
						document.#trim(formname)#.ccBillingAddressID.options[k].selected = true;		
					};	
				};	
				
				showInvoiceAddress();
				
			</cfif>--->*/
			
			
			/*
			<!-------------------------------------------------------------------------------------->
			<!--- Credit Card Section                                                            --->
			<!-------------------------------------------------------------------------------------->			
			<!---CC Area--->
			<!---var ccIDs = new Array();
			var ccDBID = new Array();
			var ccCreditCardTypeID = new Array();
			var ccCardHolderName = new Array();
			var ccCardNumber = new Array();
			var ccExpirationMonth = new Array();
			var ccExpirationYear = new Array();				
			var ccVerificationNumber = new Array();
			var ccBillingAddressID = new Array();			
			var ccIsDefault = new Array();
			
			ccIDs[0] = "";
			ccDBID[0] = "";
			ccCreditCardTypeID[0] = "";
			ccCardHolderName[0] = "";
			ccCardNumber[0] = "";
			ccExpirationMonth[0] = "";
			ccExpirationYear[0] = "";				
			ccVerificationNumber[0] = "";
			ccBillingAddressID[0] = "";			
			ccIsDefault[0] = "";
						
			<cfset count = 0>
			
			<cfloop query="getAllUsersCCs">
				
				<cfset Entry1 = application.beanFactory.getBean('globalFooter').GlobalFooterlistD('#trim(ColM)#|#trim(ColE)#|#trim(ColL)#|#trim(ColI)#|#trim(ColA)#|#trim(ColC)#|#trim(ColR)#') />
				
				<cfset count = count + 1>
								
				<cfset ccCreditCardTypeID = ListGetAt(Entry1, 1, "|")>					
				<cfset ccCardHolderName = ListGetAt(Entry1, 2, "|")>		
				<cfset ccCardNumber = ListGetAt(Entry1, 3, "|")>					
				<cfset ccExpirationMonth = ListGetAt(Entry1, 4, "|")>
				<cfset ccExpirationYear = ListGetAt(Entry1, 5, "|")>				
				<cfset ccVerificationNumber = ListGetAt(Entry1, 6, "|")>
				<cfset ccBillingAddressID = ListGetAt(Entry1, 7, "|")>								
				
				ccIDs[#trim(count)#] = "#trim(count)#";
				ccDBID[#trim(count)#] = "#trim(EntityRSID)#";
				ccCreditCardTypeID[#trim(count)#] = "#trim(ccCreditCardTypeID)#";	
				ccCardHolderName[#trim(count)#] = "#trim(ccCardHolderName)#";
				ccCardNumber[#trim(count)#] = "#trim(ccCardNumber)#";				
				ccExpirationMonth[#trim(count)#] = "#trim(ccExpirationMonth)#";
				ccExpirationYear[#trim(count)#] = "#trim(ccExpirationYear)#";				
				ccVerificationNumber[#trim(count)#] = "#trim(ccVerificationNumber)#";			
				ccBillingAddressID[#trim(count)#] = "#trim(count)#"; 				
				ccIsDefault[#trim(count)#] = "#trim(IsDefault)#";							
				
			</cfloop>
			//resetCCBillingAddressID();
			loadCreditCardArrayDisplay();
			//debugCreditCards();
			
			
			
			
			<cfif IsDefined("checkBillingAddressIDselected") AND checkBillingAddressIDselected GT 0>			
				for (i = 0; i < document.#trim(formname)#.checkBillingAddressID.length; i++){								
					if(resetJSAddressID(document.#trim(formname)#.checkBillingAddressID.options[i].value) == #trim(checkBillingAddressIDselected)#){
						document.#trim(formname)#.checkBillingAddressID.options[i].selected = true;								
					};
				};	
			</cfif>--->
			
			
			*/
			
			
		</script>		
		
	</cfoutput>	
	
	




