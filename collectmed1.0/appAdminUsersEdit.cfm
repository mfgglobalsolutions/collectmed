
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.fontFace" default="#request.Site.getFont()#">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="#request.Site.getFontSize()#">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="#request.Site.getFontColor()#">
	<cfset fontColor = attributes.fontColor>	
	
	<cfparam name="attributes.formName" default="editUser">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.EntityID" default="">
	<cfset EntityID = attributes.EntityID>
	
	<cfif IsDefined("form.EntityID") AND form.EntityID NEQ "">
		<cfset EntityID = form.EntityID>
	<cfelseif IsDefined("url.EntityID") AND url.EntityID NEQ "">
		<cfset EntityID = url.EntityID>	
	</cfif>
	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="EntityID"
		fieldnames="User ID"
		datatypes="numeric">	
		
		
		
<!------------------------------------------------------------------>
<!--- Create the objects that will be used in this page.         --->
<!------------------------------------------------------------------>		
	<cfset request.Entity = CreateobJect("component", "com.common.Entity")>	
	<cfset request.User = CreateobJect("component", "com.common.User")>
	
	
	
<!------------------------------------------------------------------>
<!--- Get the roles that this user is associated with.           --->
<!------------------------------------------------------------------>					
	<!--- <cfset UsersRoleIDs = request.User.getUserRoles(usersID: request.User.getUsersID_Temp(clientID: trim(session.clientID), entityID: trim(entityID)), clientID: trim(session.clientID))>	
		 --->
	
		
<!-------------------------------------------------------------------------------------->
<!--- Get all the addresses that the client has on record.                           --->
<!-------------------------------------------------------------------------------------->
	<cfset getUserAddresses = request.Entity.getEntityAddresses(clientID: trim(session.clientID), entityID: entityID)>
	
						
												
<!-------------------------------------------------------------------------------------->
<!--- get the users email addresses.                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfset getUserEmailAddresses = request.Entity.getEntityEmailAddresses(clientID: trim(session.clientID), entityID: entityID)>
		
	
	
<!-------------------------------------------------------------------------------------->
<!--- get the users phone numbers                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset getUserPhoneNumbers = request.Entity.getEntityPhones(clientID: trim(session.clientID), entityID: entityID)>						
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the entity information                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfset getEntityInformation = request.Entity.getEntityMetadata(clientID: trim(session.clientID), entityID: entityID)>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the user account information                                               --->
<!-------------------------------------------------------------------------------------->
	<cfset getUserAccountInformation = request.User.getUserAccountInformation(clientID: trim(session.clientID), entityID: entityID)>	
	
	<cfset Username = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getUserAccountInformation.Entry)) />
	<cfset Password = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getUserAccountInformation.EntryPoint)) />
	<cfset Answer = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getUserAccountInformation.EntryResponse)) />


		
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
			
			function changeAddress(sel){				
											
				if(sel > 0){					
					
					for (i = 1; i < AddressIDs.length; i++){
						AddressIsDefault[i] = 0;					
					};			
					
					AddressIsDefault[sel] = "1";
					document.all.UsersAddress.options[sel].selected = true;													
				};		
				
			};
			
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
			
						
			function addUsersAddressToArray(typeid, line1, line2, city, stateid, zipcode){
				if(typeid != '' && line1 != '' && city != '' && stateid != '' && zipcode){
					var len = addAddressToArray(typeid, line1, line2, city, stateid, zipcode);							
					document.#trim(formname)#.UsersAddressTypeID.value = '';
					document.#trim(formname)#.UsersAddressLine1.value = ''; 
					document.#trim(formname)#.UsersAddressLine2.value = '';				
					document.#trim(formname)#.UsersAddressCity.value = ''; 
					document.#trim(formname)#.UsersAddressStateID.value = ''; 
					document.#trim(formname)#.UsersAddressZipCode.value = '';
					document.#trim(formname)#.UsersAddressDBID_HIDDEN.value = '';	
					changeAddress(len);
					spSaveUsersAddress.innerHTML = '';
					document.all.UsersAddress.options[len].selected = true;										
					UsersAddressInput.style.display='none';
					UsersAddressSelect.style.display='inline';					
				};
			};
			
			function addAddressToArray(typeid, line1, line2, city, stateid, zipcode){
								
				var newLength = eval(AddressIDs.length);
								
				AddressIDs[newLength] = newLength;
				AddressTypeID[newLength] = typeid;
				if(document.#trim(formname)#.UsersAddressDBID_HIDDEN.value != ''){
					AddressDBID[newLength] = document.#trim(formname)#.UsersAddressDBID_HIDDEN.value;
				}
				else{	
					AddressDBID[newLength] = "@@";
				};
				
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
				document.all.UsersAddress.options[newLength] = new Option(thisAddress, thisAddressID);								
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
			
			
			function validateForm(){	
				
				var msg  = "";			
				
				msg = msg + checkUserInformation();		
				
				msg = msg + checkUsersEmailAddress();	
				
				msg = msg + checkUsersPhoneNumber();					
					
				msg = msg + checkUsersAddress();		
				
				msg = msg + checkRoles();				
						
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
			
			
			function checkUserInformation(){
				
				var msg  = "";				
					
				if (document.#trim(formname)#.UserFName.value == ""){
					document.#trim(formname)#.UserFName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide the users first name" + "\n\n";
				}
				else{
					document.#trim(formname)#.UserFName.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.UserLName.value == ""){
					document.#trim(formname)#.UserLName.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide a last name" + "\n\n";
				}
				else{
					document.#trim(formname)#.UserLName.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.username.value == ""){
					document.#trim(formname)#.username.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Please provide a username" + "\n\n";
				}
				else{
					document.#trim(formname)#.username.className = 'SiteTextbox';
				};
				
				if (document.#trim(formname)#.username.value.length < 6){
					document.#trim(formname)#.username.className = 'SiteTextboxALERT'; 						
					msg = msg + "* Username must be at least 6 characters long" + "\n\n";
				}
				else{
					document.#trim(formname)#.username.className = 'SiteTextbox';
				};
					
				
				
				if(document.#trim(formname)#.password.value != document.#trim(formname)#.oldPassword.value){						
					
					if(document.#trim(formname)#.password.value != document.#trim(formname)#.passwordConfirm.value){
						document.#trim(formname)#.password.className = 'SiteTextboxALERT';
						document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT'; 						
						msg = msg + "* Password and Confirm Password must match" + "\n\n";	
					};	
					
					else if(document.#trim(formname)#.password.value == "" || document.#trim(formname)#.passwordConfirm.value == ""){
						msg = msg + "* Password and confirm password cannot be blank" + "\n\n";
				        document.#trim(formname)#.password.className = 'SiteTextboxALERT';
						document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
					} 
															
				    else if(document.#trim(formname)#.password.value != "" && document.#trim(formname)#.password.value == document.#trim(formname)#.passwordConfirm.value) {
						
						if(specialChars(document.#trim(formname)#.password.value) == true){
							msg = msg + "* Password cannot contain special characters. Only numbers, letters and @" + "\n\n";
				        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
							document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
						};
						
						if(document.#trim(formname)#.password.value.length < 6) {
				        	msg = msg + "* Password must contain at least six characters" + "\n\n";
				        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
							document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
				      	}
				      	if(document.#trim(formname)#.password.value == document.#trim(formname)#.username.value) {
				        	msg = msg + "* Password must be different from Username" + "\n\n";
				        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
							document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
				      	}
				      	re = /[0-9]/;
				      	if(!re.test(document.#trim(formname)#.password.value)) {
				        	msg = msg + "* Password must contain at least one number (0-9)" + "\n\n";
				        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
							document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
				      	}
				      	re = /[a-z]/;
				      	if(!re.test(document.#trim(formname)#.password.value)) {
				        	msg = msg + "* Password must contain at least one lowercase letter (a-z)" + "\n\n";
				        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
							document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
				      	}
				      	re = /[A-Z]/;
				      	if(!re.test(document.#trim(formname)#.password.value)) {
				        	msg = msg + "* Password must contain at least one uppercase letter (A-Z)" + "\n\n";
				        	document.#trim(formname)#.password.className = 'SiteTextboxALERT';
							document.#trim(formname)#.passwordConfirm.className = 'SiteTextboxALERT';
				      	}
						
					}				
					
				}	
				
				
				else{
					document.#trim(formname)#.password.className = 'SiteTextbox';
				};	
																									
				return msg;
				
			};					
			
			function specialChars(string){				
				var spec="!##$%^&*()-+={}[]\|;:<>?,/\"";
				var contains = false;
			    for (var i = 0; i < spec.length; i++) {					
			       if(string.indexOf(spec.charAt(i)) != -1) {
			        	contains = true;
						break; 
					};
			    };
				return contains;    
			};
						
			function addUsersAddress(){
				if(UsersAddressInput.style.display == 'none'){		
					UsersAddressSelect.style.display='none';
					UsersAddressInput.style.display='inline';
				}
				else{
					UsersAddressInput.style.display = 'none';
					UsersAddressSelect.style.display='inline';
				};			
			};
			
			function checkUsersAddress(){
				
				var msg = "";
				var addressesLength = eval(AddressIDs.length);			
				// it will be less than 2 because of select address.
				if(addressesLength < 2){				
					msg = msg + "* User must have at least one address" + "\n\n";				
				};
				
				if(document.all.UsersAddress.selectedIndex == 0){
					msg = msg + "* Please select a default address" + "\n\n";		
				};
					
				return msg;	
			};
			
			function formInsert(){
				
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
				
				
				
				//Email Addresses Section
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
				
				
				//Phone section
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
			
			
			function checkPhoneNumber(phone){									
				return true;				
			};
			
			
			function deleteUsersAddressFunction(){
				
				for (i = 1; i < AddressIDs.length; i++){
					
					if(document.all.UsersAddress.options[i].selected == true){	
												
						AddressIDs.splice(i, 1);
						AddressDBID.splice(i, 1);
						AddressTypeID.splice(i, 1);
						AddressLine1.splice(i, 1);				
						AddressLine2.splice(i, 1);
						AddressCity.splice(i, 1);
						AddressStateID.splice(i, 1);
						AddressZipCode.splice(i, 1);
						AddressIsDefault.splice(i, 1);
						
						document.all.UsersAddress.length = 0;
												
						for (j = 0; j < AddressIDs.length; j++){
							
							thisAddressDBID = AddressDBID[j];
							thisAddressID = j;
							thisAddressLine1 = AddressLine1[j];				
							thisAddressLine2 = AddressLine2[j];
							thisAddressCity = AddressCity[j];
							thisAddressStateID = AddressStateID[j];
							thisAddressZipCode = AddressZipCode[j];
							thisAddressZipCode = AddressZipCode[j];
							
							if(j == 0){
								thisAddress = thisAddressLine1;
							}
							else{
								thisAddress = thisAddressLine1 + ' ' + thisAddressLine2 + ' ' +  thisAddressCity + ', ' + getState(thisAddressStateID) + ' ' + thisAddressZipCode;
							};
													
							document.all.UsersAddress.options[j] = new Option(thisAddress, thisAddressID);			
						};
						
						break;											
					};				
				};				
			};
			
			
			function editUserAddressFunction(){
				
				for (i = 1; i < AddressIDs.length; i++){
					
					if(document.all.UsersAddress.options[i].selected == true){	
						thisAddressID = AddressIDs[i];
						thisAddressDBID = AddressDBID[i];
						thisAddressTypeID = AddressTypeID[i];
						thisAddressLine1 = AddressLine1[i];				
						thisAddressLine2 = AddressLine2[i];
						thisAddressCity = AddressCity[i];
						thisAddressStateID = AddressStateID[i];
						thisAddressZipCode = AddressZipCode[i];	
						thisAddressIsDefault = AddressIsDefault[i];		
											
						document.#trim(formname)#.UsersAddressTypeID.value = thisAddressTypeID;
						document.#trim(formname)#.UsersAddressLine1.value = thisAddressLine1;
						document.#trim(formname)#.UsersAddressLine2.value = thisAddressLine2;
						document.#trim(formname)#.UsersAddressCity.value = thisAddressCity;
						document.#trim(formname)#.UsersAddressStateID.value = thisAddressStateID;
						document.#trim(formname)#.UsersAddressZipCode.value = thisAddressZipCode;
						
						document.#trim(formname)#.UsersAddressDBID_HIDDEN.value = thisAddressDBID;
												
						AddressIDs.splice(i, 1);
						AddressDBID.splice(i, 1);
						AddressTypeID.splice(i, 1);
						AddressLine1.splice(i, 1);				
						AddressLine2.splice(i, 1);
						AddressCity.splice(i, 1);
						AddressStateID.splice(i, 1);
						AddressZipCode.splice(i, 1);
						AddressIsDefault.splice(i, 1);
						document.all.UsersAddress.length=0;
						
						for (j = 0; j < AddressIDs.length; j++){
							
							thisAddressID = AddressIDs[j];
							thisAddressLine1 = AddressLine1[j];				
							thisAddressLine2 = AddressLine2[j];
							thisAddressCity = AddressCity[j];
							thisAddressStateID = AddressStateID[j];
							thisAddressZipCode = AddressZipCode[j];
							
							if(j == 0){
								thisAddress = thisAddressLine1;
							}
							else{
								thisAddress = thisAddressLine1 + ' ' + thisAddressLine2 + ' ' +  thisAddressCity + ', ' + getState(thisAddressStateID) + ' ' + thisAddressZipCode;
							};
													
							document.all.UsersAddress.options[j] = new Option(thisAddress, thisAddressID);			
						};
						
						UsersAddressSelect.style.display='none';
						UsersAddressInput.style.display='inline';							
						
						break;											
					};				
				};
			};
			
			
			
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
			
			
			function checkUsersEmailAddress(){
				
				var msg = "";
				var emailaddressesLength = eval(emailAddressIDs.length);			
				// it will be less than 2 because of select email address.
				if(emailaddressesLength < 2){				
					msg = msg + "* User must have at least one email address" + "\n\n";				
				};
				
				for (i = 1; i < emailAddressIDs.length; i++){
					if(!IsValidEmailJS(emailAddress[i])){
						msg = msg + "* " + emailAddress[i] + " is an invalid email address" + "\n\n";				
					};					
				};
				
				if(document.all.UsersEmailAddress.selectedIndex == 0){
					msg = msg + "* Please select a default email address" + "\n\n";		
				};
					
				return msg;	
			};
			
			function changeEmailAddress(sel){				
											
				if(sel > 0){					
					
					for (i = 1; i < emailAddressIDs.length; i++){
						emailAddressIsDefault[i] = 0;					
					};			
					
					emailAddressIsDefault[sel] = "1";					
					document.all.UsersEmailAddress.options[sel].selected = true;													
				};		
				
			};
			
			function addUsersEmailAddressToArray(typeid, email){
				if(typeid != '' && email != ''){
					var len = addEmailAddressToArray(typeid, email);							
					document.#trim(formname)#.UserEmailAddressTypeID.value = '';
					document.#trim(formname)#.UserEmailAddress.value = ''; 					
					document.#trim(formname)#.UsersEmailAddressDBID_HIDDEN.value = '';	
					changeEmailAddress(len);
					spUserEmailAddress.innerHTML = '';
					document.all.UsersEmailAddress.options[len].selected = true;										
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
														
				thisEmailAddressID = emailAddressIDs[newLength];
				thisEmailAddress = emailAddress[newLength];					
						
				document.all.UsersEmailAddress.options[newLength] = new Option(thisEmailAddress, thisEmailAddressID);								
				return newLength;								
				
			};
			
			function editUserEmailAddressFunction(){
				
				for (i = 1; i < emailAddressIDs.length; i++){
					
					if(document.all.UsersEmailAddress.options[i].selected == true){	
						thisEmailAddressID = emailAddressIDs[i];
						thisEmailAddressDBID = emailAddressDBID[i];
						thisEmailAddressTypeID = emailAddressTypeID[i];						
						thisEmailAddressIsDefault = emailAddressIsDefault[i];		
						thisEmailAddress = emailAddress[i];		
											
						document.#trim(formname)#.UserEmailAddressTypeID.value = thisEmailAddressTypeID;						
						document.#trim(formname)#.UserEmailAddress.value = thisEmailAddress;		
						document.#trim(formname)#.UsersEmailAddressDBID_HIDDEN.value = thisEmailAddressDBID;
												
						emailAddressIDs.splice(i, 1);
						emailAddressDBID.splice(i, 1);
						emailAddress.splice(i, 1);
						emailAddressTypeID.splice(i, 1);						
						emailAddressIsDefault.splice(i, 1);
						document.all.UsersEmailAddress.length=0;
						
						for (j = 0; j < emailAddressIDs.length; j++){
							
							thisEmailAddressID = emailAddressIDs[j];
							thisEmailAddress = emailAddress[j];								
														
							thisEmailAddress = thisEmailAddress;
																				
							document.all.UsersEmailAddress.options[j] = new Option(thisEmailAddress, thisEmailAddressID);			
						};
						
						UsersEmailAddressSelect.style.display='none';
						UsersEmailAddressInput.style.display='inline';							
						
						break;											
					};				
				};
			};
			
			
			function deleteUsersEmailAddressFunction(){
				
				
				var delEmailAddress = confirm("Are you sure you want to delete this email address?");
				
				if(delEmailAddress){
				
					for (i = 1; i < emailAddressIDs.length; i++){
						
						if(document.all.UsersEmailAddress.options[i].selected == true){	
													
							emailAddressIDs.splice(i, 1);
							emailAddressDBID.splice(i, 1);
							emailAddressTypeID.splice(i, 1);
							emailAddress.splice(i, 1);							
							emailAddressIsDefault.splice(i, 1);
							
							document.all.UsersEmailAddress.length = 0;
													
							for (j = 0; j < emailAddressIDs.length; j++){
								
								thisEmailAddressID = j;
								thisEmailAddressDBID = emailAddressDBID[j];
								thisEmailAddress = emailAddress[j];									
														
								document.all.UsersEmailAddress.options[j] = new Option(thisEmailAddress, thisEmailAddressID);			
							};
							
							break;											
						};				
					};		
				};	
				//debugEmailAddresses();		
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
			
			function addUsersEmailAddress(){
				if(UsersEmailAddressInput.style.display == 'none'){		
					UsersEmailAddressSelect.style.display='none';
					UsersEmailAddressInput.style.display='inline';
				}
				else{
					UsersEmailAddressInput.style.display = 'none';
					UsersEmailAddressSelect.style.display='inline';
				};			
			};	
			
			
			<!---Phone JS--->
			function IsValidPhoneJS(phone) {									
							
				phone = phone.replace(/\s|\(|\-|\)|\.|x|:|\*/g, "");
				if (phone.length < 10) {										
					return false
				}
				else return true;  
				
			};	
			
			function checkUsersPhoneNumber(){
				
				var msg = "";
				var phonenumbersLength = eval(PhoneIDs.length);			
				// it will be less than 2 because of select phone address.
				if(phonenumbersLength < 2){				
					msg = msg + "* User must have at least one phone number" + "\n\n";				
				};
				
				for (i = 1; i < PhoneIDs.length; i++){
					if(!IsValidPhoneJS(phoneNumber[i])){
						msg = msg + "* " + formatPhoneUS(phoneNumber[i]) + " is an invalid phone number" + "\n\n";				
					};					
				};
				
				if(document.all.UsersPhoneNumber.selectedIndex == 0){
					msg = msg + "* Please select a default phone number" + "\n\n";		
				};
					
				return msg;	
			};
			
			function changePhoneNumber(sel){				
								
				if(sel > 0){					
					
					for (i = 1; i < PhoneIDs.length; i++){
						phoneNumberIsDefault[i] = 0;					
					};			
					
					phoneNumberIsDefault[sel] = "1";					
					document.all.UsersPhoneNumber.options[sel].selected = true;													
				};		
				
			};
			
			function addUsersPhoneNumberToArray(typeid, phone, ext){
				
				if(!IsValidPhoneJS(phone)){
					document.#trim(formname)#.UserPhoneNumber.className = 'SiteTextboxALERT';
					document.#trim(formname)#.UserPhoneNumber.focus();
					alert("Phone Number must be at least 10 characters");
					return false;
				};
				
				if(typeid != '' && phone != ''){
					var len = addPhoneNumberToArray(typeid, phone, ext);							
					document.#trim(formname)#.UserPhoneNumberTypeID.value = '';
					document.#trim(formname)#.UserPhoneNumber.value = '';
					document.#trim(formname)#.UserPhoneExtension.value = ''; 					
					document.#trim(formname)#.UsersPhoneNumberDBID_HIDDEN.value = '';	
					changePhoneNumber(len);
					spUserPhoneNumber.innerHTML = '';
					document.all.UsersPhoneNumber.options[len].selected = true;										
					UsersPhoneNumberInput.style.display='none';
					UsersPhoneNumberSelect.style.display='inline';					
				};
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
				 										
				thisPhoneID = PhoneIDs[newLength];
				thisPhoneNumber = phoneNumber[newLength];					
				thisPhoneExtension = phoneExtension[newLength];
				
				thisPhoneNumber = formatPhoneUS(thisPhoneNumber);
				
				if(thisPhoneExtension.length > 0){
					thisPhoneNumber = thisPhoneNumber + "  Ext." + thisPhoneExtension;
				};
						
				document.all.UsersPhoneNumber.options[newLength] = new Option(thisPhoneNumber, thisPhoneID);								
				return newLength;								
				
			};
			
			function editUserPhoneNumberFunction(){
				
				for (i = 1; i < PhoneIDs.length; i++){
					
					if(document.all.UsersPhoneNumber.options[i].selected == true){	
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
												
						PhoneIDs.splice(i, 1);
						phoneNumberDBID.splice(i, 1);
						phoneNumber.splice(i, 1);
						phoneExtension.splice(i, 1);
						phoneNumberTypeID.splice(i, 1);						
						phoneNumberIsDefault.splice(i, 1);
						document.all.UsersPhoneNumber.length=0;
						
						for (j = 0; j < PhoneIDs.length; j++){
							
							thisPhoneID = PhoneIDs[j];
							thisPhoneNumber = phoneNumber[j];								
							thisPhoneExtension = phoneExtension[j];							
							
							thisPhoneNumber = formatPhoneUS(thisPhoneNumber);
							
							if(thisPhoneExtension.length > 0){
								thisPhoneNumber = thisPhoneNumber + "  Ext." + thisPhoneExtension;
							};	
																				
							document.all.UsersPhoneNumber.options[j] = new Option(thisPhoneNumber, thisPhoneID);			
						};
						
						UsersPhoneNumberSelect.style.display='none';
						UsersPhoneNumberInput.style.display='inline';							
						
						break;											
					};				
				};
			};
			
			
			function deleteUsersPhoneNumberFunction(){
				
				
				var delPhoneNumber = confirm("Are you sure you want to delete this phone number?");
				
				if(delPhoneNumber){
				
					for (i = 1; i < PhoneIDs.length; i++){
						
						if(document.all.UsersPhoneNumber.options[i].selected == true){	
													
							PhoneIDs.splice(i, 1);
							phoneNumberDBID.splice(i, 1);
							phoneNumberTypeID.splice(i, 1);
							phoneNumber.splice(i, 1);	
							phoneExtension.splice(i, 1);							
							phoneNumberIsDefault.splice(i, 1);
							
							document.all.UsersPhoneNumber.length = 0;
													
							for (j = 0; j < PhoneIDs.length; j++){
								
								thisPhoneID = j;
								thisPhoneNumberDBID = phoneNumberDBID[j];
								thisPhoneNumber = phoneNumber[j];
								thisPhoneExtension = phoneExtension[j];
								
								thisPhoneNumber = formatPhoneUS(thisPhoneNumber);									
									
								if(thisPhoneExtension.length > 0){
									thisPhoneNumber = thisPhoneNumber + "  Ext." + thisPhoneExtension;
								};
													
								document.all.UsersPhoneNumber.options[j] = new Option(thisPhoneNumber, thisPhoneID);			
							};
							
							break;											
						};				
					};		
				};	
				//debugPhoneNumbers();		
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
											
					phonenumbers = phonenumbers + formatPhoneUS(thisPhoneNumber) + "  Ext." + thisPhoneExtension + "\n\n";						
					
				};
				
				alert(phonenumbers);
					
			};		
			
			function addUsersPhoneNumber(){
				if(UsersPhoneNumberInput.style.display == 'none'){		
					UsersPhoneNumberSelect.style.display='none';
					UsersPhoneNumberInput.style.display='inline';
				}
				else{
					UsersPhoneNumberInput.style.display = 'none';
					UsersPhoneNumberSelect.style.display='inline';
				};			
			};	
			
										
		</script>	
		
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form method="post" name="#trim(formname)#" action="appAdminUsersEditProcess.cfm" onsubmit="formInsert(); return validateForm();">		
			<input type="Hidden" name="EntityID" value="#trim(EntityID)#">
			<input type="Hidden" name="addresses" value="">		
			<table border="0" cellpadding="0" cellspacing="0">		
			<tr>
				<td>&nbsp;</td>
			</tr>		
			
			<tr>
				<td>
			
					<!------------------------------------------------------------------>
					<!--- Show an Admin information on this page.                    --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="User Information" tableWidth="100%">	
						
						<!---start Admin information--->
						<table border="0" cellpadding="1" cellspacing="0">							
							<tr>
								<td class="SiteRequiredLabel">										
									Name&nbsp;															
								</td>
								<td class="SiteRequiredLabel">									
									First&nbsp;<input class="SiteTextbox" type="text" name="UserFName" size="15" maxlength="50" value="#trim(getEntityInformation.FName)#">&nbsp;																	
									<font color="#trim(fontColor)#">M</font>&nbsp;<input class="SiteTextbox" type="text" name="UserMName" size="3" maxlength="50" value="#trim(getEntityInformation.MName)#">&nbsp;															
									Last&nbsp;<input class="SiteTextbox" type="text" name="UserLName" size="15" maxlength="50" value="#trim(getEntityInformation.LName)#">&nbsp;								
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
				<td align="center" colspan="2">
					
					<input type="Hidden" name="oldPassword" value="#trim(password)#">
					
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="Username / Password" Align="center" tableWidth="100%">
												
						<table>
							<cfif FindNoCase("@", trim(username)) AND FindNoCase(".", trim(username))>
								<tr>
									<td class="SiteRequiredLabel" colspan="2" align="center" style="padding-bottom: 6px" nowrap><font color="FF0000">NOTE: Do not change the username unless the email address is invalid.</font></td>
								</tr>
							</cfif>		
							<tr>
								<td align="right" class="SiteRequiredLabel">		
									Username:														
								</td>
								<td>
									<input type="Text" name="username" size="30" class="SiteTextBox" value="#trim(username)#">
								</td>
							</tr>
							<tr>
								<td align="right" class="SiteRequiredLabel">		
									Password:														
								</td>
								<td>
									<input type="Text" name="password" size="30" class="SiteTextBox" value="#trim(password)#">&nbsp;<font size="1" color="ff0000">(case sensitive)</font>
								</td>
							</tr>
							<tr>
								<td align="right" class="SiteRequiredLabel">		
									Confirm Password:														
								</td>
								<td>
									<input type="Text" name="passwordConfirm" size="30" class="SiteTextBox" value="">&nbsp;<font size="1" color="ff0000">(case sensitive)</font>
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
				<td>	
					
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="User&nbsp;Phone&nbsp;Numbers" tableWidth="100%">	
				
						<input type="Hidden" name="phonenumbers" value="">		
						<table border="0" cellpadding="0" cellspacing="0">		
							<tr>
								<td>									
									
									<table border="0" cellpadding="1" cellspacing="0" id="UsersPhoneNumberInput" style="display:'none';">							
										<input type="Hidden" name="UsersPhoneNumberDBID_HIDDEN" value="">
										
										<tr>
											<td class="SiteRequiredLabel">								
												Type:&nbsp;															
											</td>
											<td>
												<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="7" active="1" returnvariable="getAllPhoneTypes">
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
												<input type="text" class="SiteTextBox" name="UserPhoneNumber" size="25" maxlength="80" value="" onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" onblur="if (checkPhoneNumber(this.value) == 'true'){document.#trim(formname)#.UserPhoneNumber.value = ''; spUserPhoneNumber.innerHTML = '- This phone address already exists. - ';} else if(this.value != '') {spUserPhoneNumber.innerHTML = '- Please save this phone number. -';};">
												<font size="1">ext.</font> <input onkeyup="this.value=this.value.replace(/[\W_+]/g,'');" type="Text" class="SiteTextbox" name="UserPhoneExtension" size="5" maxlength="6">
											</td>
										</tr>								
										<tr>
											<td colspan="2" align="center" style="padding-top:1.0ex">
												<input type="Button" class="SiteSubmitbox" value="Save Phone Number" onclick="addUsersPhoneNumberToArray(document.#trim(formname)#.UserPhoneNumberTypeID.value, document.#trim(formname)#.UserPhoneNumber.value, document.#trim(formname)#.UserPhoneExtension.value);">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel" onclick="addUsersPhoneNumber();">
											</td>
										</tr>	
										<tr>
											<td colspan="2" align="center"><span id="spUserPhoneNumber" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
										</tr>																					                				
									</table>
									
									<table border="0" cellpadding="0" cellspacing="0" id="UsersPhoneNumberSelect" style="display:'inline';">							
										<tr>
											<td class="SiteRequiredLabel" colspan="2" style="padding-bottom: 6px">The selected phone number will be saved as default.</td>
										</tr>	
										<tr>
											<td class="SiteRequiredLabel">Phone&nbsp;Number:&nbsp;</td>
											<td class="SiteLabel">
												<select class="SiteSelectBox" style="width:275px;" name="UsersPhoneNumber" onchange="changePhoneNumber(this.selectedIndex);"></select>
											</td>	
										</tr>	
										<tr>
											<td>&nbsp;</td>
											<td valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addUserPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="addUsersPhoneNumber();"><u><font color="FF0000">Add&nbsp;phone&nbsp;number</font></u></span><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="editUserPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="editUserPhoneNumberFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Edit&nbsp;phone&nbsp;number</font></u></span><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="deleteUsersPhoneNumber" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteUsersPhoneNumberFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Delete&nbsp;phone&nbsp;number</font></u></span></td>
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
						
			<tr>
				<td>
					<input type="Hidden" name="emailaddresses" value="">
					<input type="Hidden" name="UsersEmailAddressDBID_HIDDEN" value="">
					<!------------------------------------------------------------------>
					<!--- Show an email addresses on this page.                      --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="User&nbsp;Email&nbsp;Addresses" tableWidth="100%">	
									
						<table border="0" cellpadding="1" cellspacing="0" id="UsersEmailAddressInput" style="display:'none';">														
							<tr>
								<td class="SiteRequiredLabel">								
									Type:&nbsp;															
								</td>
								<td>
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="8" active="1" returnvariable="getAllEmailTypes">
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
									<input type="text" class="SiteTextBox" name="UserEmailAddress" size="35" maxlength="80" value="" onblur="if (checkEmailAddress(this.value) == 'true'){document.#trim(formname)#.UserEmailAddress.value = ''; spUserEmailAddress.innerHTML = '- This email address already exists. - ';} else if(this.value != '') {spUserEmailAddress.innerHTML = '- Please save this email address. -';};">
								</td>
							</tr>	
							<tr>
								<td colspan="2" align="center"><span id="spUserEmailAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
							</tr>							
							<tr>
								<td colspan="2" align="center" style="padding-top:1.0ex">
									<input type="Button" class="SiteSubmitbox" value="Save Email Address" onclick="addUsersEmailAddressToArray(document.#trim(formname)#.UserEmailAddressTypeID.value, document.#trim(formname)#.UserEmailAddress.value);">
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>																											                				
						</table>
							
						<table border="0" cellpadding="0" cellspacing="0" id="UsersEmailAddressSelect" style="display:'inline';">						
							<tr>
								<td class="SiteRequiredLabel" colspan="2" style="padding-bottom: 6px">The selected email address will be saved as default.</td>
							</tr>	
							<tr>
								<td class="SiteRequiredLabel">Email&nbsp;Address:&nbsp;</td>
								<td class="SiteLabel">
									<select class="SiteSelectBox" style="width:275px;" name="UsersEmailAddress" onchange="changeEmailAddress(this.selectedIndex);"></select>
								</td>	
							</tr>	
							<tr>
								<td>&nbsp;</td>
								<td valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addUserEmailAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="addUsersEmailAddress();"><u><font color="FF0000">Add&nbsp;email&nbsp;address</font></u></span><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="editUserEmailAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="editUserEmailAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Edit&nbsp;email&nbsp;address</font></u></span><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="deleteUsersEmailAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteUsersEmailAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Delete&nbsp;email&nbsp;address</font></u></span></td>
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
					<!--- Show addresses on this page.                               --->
					<!------------------------------------------------------------------>		
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="User&nbsp;Addresses" tableWidth="100%">	

						<!-------------------------------------------------------------------------------------->
						<!--- This hidden field is used in case the user edits an address.                   --->
						<!-------------------------------------------------------------------------------------->
						<input type="Hidden" name="UsersAddressDBID_HIDDEN" value="">
																	
						<table border="0" cellpadding="1" cellspacing="0" id="UsersAddressInput" style="display:'none';">						
							<tr>
								<td class="SiteRequiredLabel">				   			
									Address&nbsp;Type:&nbsp;							
								</td>
								<td colspan="2" valign="middle">			   			
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
									<select class="SiteSelectBox" name="UsersAddressTypeID">											
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
						   			<input class="SiteTextbox" type="text" name="UsersAddressLine1" size="35" maxlength="80" value="">
								</td>
							</tr>			
							<tr>
								<td class="SiteLabel">			   
						   			Address&nbsp;Line&nbsp;2:&nbsp;									
								</td>
								<td colspan="2">
						   			<input class="SiteTextbox" type="text" name="UsersAddressLine2" size="35" maxlength="80" value="">
								</td>
							</tr>				
							<tr>
								<td class="SiteRequiredLabel">			   
						   			City,&nbsp;State&nbsp;Zip&nbsp;Code&nbsp;									
								</td>
								<td colspan="2">
						   			<input class="SiteTextbox" type="text" name="UsersAddressCity" size="15" maxlength="50" value="">&nbsp;&nbsp;					
										<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates">
										<select class="SiteSelectBox" name="UsersAddressStateID">
												<option value="">
											<cfloop query="getAllStates">
												<option value="#StandardListItemID#" <cfif StandardListItemID EQ 59>SELECTED</cfif>> #ItemNameDisplay#
											</cfloop>
										</select>
									&nbsp;<input class="SiteTextbox" type="Text" name="UsersAddressZipCode" size="10" maxlength="25" value="" onblur="spSaveUsersAddress.innerHTML = '- Please save this address. - ';"> 					
								</td>
							</tr>	
							<tr>
								<td colspan="3" align="center" style="padding-top:1.0ex">
									<input type="Button" class="SiteSubmitbox" value="Save Address" onclick="addUsersAddressToArray(document.#trim(formname)#.UsersAddressTypeID.value, document.#trim(formname)#.UsersAddressLine1.value, document.#trim(formname)#.UsersAddressLine2.value, document.#trim(formname)#.UsersAddressCity.value, document.#trim(formname)#.UsersAddressStateID.value, document.#trim(formname)#.UsersAddressZipCode.value);">
								</td>
							</tr>	
							<tr>
								<td colspan="3" align="center"><span id="spSaveUsersAddress" class="TextWarning" style="font-size: medium;">&nbsp;</span></td>								
							</tr>								
						</table>	


						<!-------------------------------------------------------------------------------------->
						<!--- Show the select box of available addresses from the corporate client account.  --->
						<!-------------------------------------------------------------------------------------->						
						<table border="0" cellpadding="0" cellspacing="0" id="UsersAddressSelect" style="display:'inline';">													
							<tr>
								<td class="SiteRequiredLabel" colspan="2" style="padding-bottom: 6px">The selected address will be saved as the default address.</td>
							</tr>	
							<tr>
								<td class="SiteRequiredLabel">Address:</td>
								<td class="SiteLabel">
									<select style="width:275px;" name="UsersAddress" onchange="changeAddress(this.selectedIndex);" class="SiteSelectBox"></select>
								</td>	
							</tr>	
							<tr>
								<td>&nbsp;</td>
								<td valign="top"><span class="med" style="cursor: hand;padding-top:0.0ex" id="addUserAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="addUsersAddress();"><u><font color="FF0000">Add&nbsp;an&nbsp;address</font></u></span><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="editUserAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="editUserAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Edit&nbsp;this&nbsp;address</font></u></span><span class="med" style="display:'inline'; cursor: hand; padding-top:0.0ex" id="deleteUsersAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="deleteUsersAddressFunction();"><font color="000000">&nbsp;|&nbsp;</font><u><font color="FF0000">Delete&nbsp;this&nbsp;address</font></u></span></td>
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
					
					<cf_gcBorderedTable titlesize="2" titleFont="#trim(fontFace)#" boxLineBorderColor="ffffff" backgroundColor="c0cddc" title="User Roles" Align="center" tableWidth="100%">
						
						<table style="border-width: thin; border-style: solid;" align="center">
							<tr>
								<td>
									<cf_tagRolesToAssociate checkRoleIDs="#UsersRoleIDs#" title="Roles to Associate to:">
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
					<cf_gcSubmitButton value="Save User Changes">							
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
					
			<cfloop query="getUserAddresses">
				
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
			
			
			<cfif getUserAddresses.recordCount LTE 0>
			 	
				<cfquery name="getCorporateAddresses" datasource="#trim(request.datasource)#">
					SELECT a.AddressID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, a.CountryID, ea.IsDefault
					FROM address a INNER JOIN entityaddress ea ON a.AddressID = ea.AddressID
					WHERE ea.EntityID = (SELECT EntityID FROM pa_master.client   WHERE ClientID = #trim(session.clientID)#) AND ea.Active = 1 AND a.Active = 1		
				</cfquery>	
	
				<cfloop query="getCorporateAddresses">
					
					<cfset count = count + 1>
					
					AddressIDs[#trim(count)#] = "#trim(count)#";		
					AddressTypeID[#trim(count)#] = "#trim(AddressTypeID)#";
					AddressLine1[#trim(count)#] = "#trim(AddressLine1)#";	
					AddressLine2[#trim(count)#] = "#trim(AddressLine2)#";	
					AddressCity[#trim(count)#] = "#trim(city)#";
					AddressStateID[#trim(count)#] = "#trim(stateID)#";		
					AddressZipCode[#trim(count)#] = "#trim(zipcode)#";	
					AddressIsDefault[#trim(count)#] = "0";
					
				</cfloop> 
				
			</cfif>
			
						
			thisAddressID = AddressIDs[0];
			thisAddressLine1 = AddressLine1[0];				
			thisAddress = thisAddressLine1;
			document.all.UsersAddress.options[0] = new Option(thisAddress, thisAddressID);		
								
			for (i = 1; i < AddressIDs.length; i++){
				thisAddressID = AddressIDs[i];
				thisAddressLine1 = AddressLine1[i];				
				thisAddressLine2 = AddressLine2[i];
				thisAddressCity = AddressCity[i];
				thisAddressStateID = AddressStateID[i];
				thisAddressZipCode = AddressZipCode[i];
				thisAddressIsDefault = AddressIsDefault[i];
												
				thisAddress = thisAddressLine1 + ' ' + thisAddressLine2 + ' ' +  thisAddressCity + ', ' + getState(thisAddressStateID) + ' ' + thisAddressZipCode;
				document.all.UsersAddress.options[i] = new Option(thisAddress, thisAddressID);
				if(thisAddressIsDefault == 1){
					document.all.UsersAddress.options[i].selected = true;		
				};			
			};	
			
			
			<!---email adresses init--->
			var emailAddressIDs = new Array();
			var emailAddressDBID = new Array();
			var emailAddressTypeID = new Array();
			var emailAddress = new Array();			
			var emailAddressIsDefault = new Array();
			
			emailAddressIDs[0] = "";		
			emailAddressDBID[0] = "";
			emailAddressTypeID[0] = "";
			emailAddress[0] = "Select Email Address";				
			emailAddressIsDefault[0] = ""; 	
			
			<cfset count = 0>
			
			<cfloop query="getUserEmailAddresses">
				
				<cfset count = count + 1>
				<cfset EmailD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(Email))>
				emailAddressIDs[#trim(count)#] = "#trim(count)#";				
				emailAddressDBID[#trim(count)#] = "#trim(EmailAddressID)#";		
				emailAddressTypeID[#trim(count)#] = "#trim(EmailTypeID)#";
				emailAddress[#trim(count)#] = "#trim(EmailD)#";				
				emailAddressIsDefault[#trim(count)#] = "#trim(IsDefault)#";
			
			</cfloop> 
						
			thisEmailAddressID = emailAddressIDs[0];
			thisEmailAddress = emailAddress[0];				
			thisEmailAddress = thisEmailAddress;
			document.all.UsersEmailAddress.options[0] = new Option(thisEmailAddress, thisEmailAddressID);		
					
			for (i = 1; i < emailAddressIDs.length; i++){
				thisEmailAddressID = emailAddressIDs[i];
				thisEmailAddress = emailAddress[i];				
				thisEmailAddressIsDefault = emailAddressIsDefault[i];
												
				thisEmailAddress = thisEmailAddress;
				document.all.UsersEmailAddress.options[i] = new Option(thisEmailAddress, thisEmailAddressID);
				if(thisEmailAddressIsDefault == 1){
					document.all.UsersEmailAddress.options[i].selected = true;		
				};			
			};	
			
			
			<!---Phone Number init--->
			var PhoneIDs = new Array();
			var phoneNumberDBID = new Array();
			var phoneNumberTypeID = new Array();
			var phoneNumber = new Array();
			var phoneExtension = new Array();					
			var phoneNumberIsDefault = new Array();
			
			PhoneIDs[0] = "";		
			phoneNumberDBID[0] = "";
			phoneNumberTypeID[0] = "";
			phoneNumber[0] = "Select Phone Address";	
			phoneExtension[0] = "";					
			phoneNumberIsDefault[0] = ""; 	
			
			<cfset count = 0>
			
			<cfloop query="getUserPhoneNumbers">
				
				<cfset count = count + 1>
				<cfset PhoneD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneNumber))>
				<cfset PhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneExtension))>
				PhoneIDs[#trim(count)#] = "#trim(count)#";				
				phoneNumberDBID[#trim(count)#] = "#trim(PhoneID)#";		
				phoneNumberTypeID[#trim(count)#] = "#trim(PhoneTypeID)#";
				phoneNumber[#trim(count)#] = "#trim(PhoneD)#";
				phoneExtension[#trim(count)#] = "#trim(PhoneExtensionD)#";					
				phoneNumberIsDefault[#trim(count)#] = "#trim(IsDefault)#";
			
			</cfloop> 
						
			thisPhoneID = PhoneIDs[0];
			thisPhoneNumber = phoneNumber[0];		
			document.all.UsersPhoneNumber.options[0] = new Option(thisPhoneNumber, thisPhoneID);		
					
			for (i = 1; i < PhoneIDs.length; i++){
				thisPhoneID = PhoneIDs[i];
				thisPhoneNumber = phoneNumber[i];
				thisPhoneExtension = phoneExtension[i];						
				thisPhoneNumberIsDefault = phoneNumberIsDefault[i];
												
				thisPhoneNumber = formatPhoneUS(thisPhoneNumber);
				
				if(thisPhoneExtension.length > 0){
					thisPhoneNumber = thisPhoneNumber + "  Ext." + thisPhoneExtension;
				};
				
				document.all.UsersPhoneNumber.options[i] = new Option(thisPhoneNumber, thisPhoneID);
				if(thisPhoneNumberIsDefault == 1){
					document.all.UsersPhoneNumber.options[i].selected = true;		
				};			
			};
			
		</script>
		
		
	</cfoutput>	
	
	