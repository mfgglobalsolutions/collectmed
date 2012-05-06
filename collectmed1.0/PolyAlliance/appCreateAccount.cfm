	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.fontFace" default="arial">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="10">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="000000">
	<cfset fontColor = attributes.fontColor>	
	
	<cfparam name="attributes.formName" default="createAccount">
	<cfset formName = attributes.formName>
	

	

<!-------------------------------------------------------------------------------------->
<!--- Some styles for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<style>
		.companyInformation{			
			padding: 0 0 0 0;
			width: 475px;
		}
		fieldset{							
			float: left;
			clear: left;
			width: 100%;
			margin: 20;
			padding: 0;
			background-color: #f5f5f5;
			position: relative;
		}
		legend{
			margin-left: 10px;
			color: #000000;			
			font: 14px "Verdana","Arial", "Helvetica";	
			font-weight: bold;
			padding: 0 0 0 0;
			position: relative;
			left: -7px;
			top: -0.75em;
		}
		fieldset ol{						
			padding: 0;
			list-style: none;			
		}
		fieldset li{
			float: left;
			clear: left;
			width: 100%;
			padding: 4 2;
			text-align: left;
			font: normal 12px "Verdana","Arial", "Helvetica";			
			color: ##000000; 	
		}	
		label{			
			float: left;
			width: 10em;
			margin-right: 1em;
		}		
	</style>		
		
			
	
<!-------------------------------------------------------------------------------------->
<!--- Create the javascript that this page will validate before submitting.          --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			
			function validateForm(){	
				
				var msg  = "";			
				
				if (document.#trim(formname)#.ClientName.value == ""){
					msg = msg + "* Please provide a company name" + "\n\n";
				};
				if (document.#trim(formname)#.concurrentUsers.value == ""){
					msg = msg + "* Please provide a number of concurrent users" + "\n\n";
				};
				if (document.#trim(formname)#.AdministratorFName.value == ""){
					msg = msg + "* Please provide an administrator first name" + "\n\n";
				};
				if (document.#trim(formname)#.AdministratorLName.value == ""){
					msg = msg + "* Please provide an administrator last name" + "\n\n";
				};
				if (document.#trim(formname)#.AdministratorPhoneNumber.value == ""){
					msg = msg + "* Please provide an administrator phone number" + "\n\n";
				};
				if (document.#trim(formname)#.AdministratorEmailAddress.value == ""){
					msg = msg + "* Please provide an administrator email address" + "\n\n";
				};
				if (document.#trim(formname)#.PhoneNumber_1.value == ""){
					msg = msg + "* Please provide atleast one phone number" + "\n\n";
				};
				if (document.#trim(formname)#.AddressLine1_1.value == ""){
					msg = msg + "* Please provide the address line 1 of Address 1 for a complete address" + "\n\n";
				};
				if (document.#trim(formname)#.City_1.value == ""){
					msg = msg + "* Please provide the city of address one" + "\n\n";
				};
				if (document.#trim(formname)#.ZipCode_1.value == ""){
					msg = msg + "* Please provide the zip code of address one" + "\n\n";
				};
								
				if(msg.length >= 1){					
					alert(msg);
					return false;
				}
				else{					
					return true;
				};	
			};	
			
		</script>
		
	</cfoutput>								
			

				

<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
		
		<form name="#trim(formName)#" method="post" action="appCreateAccountConfirm.cfm" onsubmit="return validateForm();">		
		
			<div align="center">	
				
				<cf_gcBorderedTable title="New Customer Information" tablealign="center" width="75%">						
					
					<div class="companyInformation">						
						<fieldset>
							<legend>&nbsp;Company Information&nbsp;</legend>
							<ol>
								<li>
									<label for="Name"><font color="FF0000">Name:</font></label>						
									<input class="SiteTextbox" name="ClientName" type="text" size="25" value="">
								</li>
								<li>
									<label for="dba">DBA:</label>
									<input class="SiteTextbox" name="dba" type="text" size="25" value="">
								</li>
								<li>
									<label for="concurrentUsers"><font color="FF0000">Concurrent Users:</font></label>
									<input class="SiteTextbox" name="concurrentUsers" type="text" size="3" value="">
								</li>													
							</ol>
						</fieldset>				
											
						<fieldset>
							<legend>&nbsp;Administrator Information&nbsp;</legend>
							<ol>
								<li>
									<label for="Name"><font color="FF0000">Admin Name:</font></label>						
									<font color="FF0000">First:</font>&nbsp;<input class="SiteTextbox" name="AdministratorFName" type="text" size="8" value="">
									M:&nbsp;<input class="SiteTextbox" name="AdministratorMName" type="text" size="1" value="">
									<font color="FF0000">Last:</font>&nbsp;<input class="SiteTextbox" name="AdministratorLName" type="text" size="8" value="">
								</li>
								<li>
									<label for="AdminPhone"><font color="FF0000">Admin Phone:</font></label>
									<input class="SiteTextbox" name="AdministratorPhoneNumber" type="text" size="10" value="">
									ext. <input class="SiteTextbox" name="AdministratorPhoneExtension" type="text" size="2" value="">&nbsp;<span class="copyBlackSmall">(xxx-xxx-xxxx)</span>	
								</li>	
								<li>
									<label for="concurrentUsers"><font color="FF0000">Admin Email:</font></label>
									<input class="SiteTextbox" name="AdministratorEmailAddress" type="text" size="20" value="">
								</li>	
								<li><label for="email"></label><font size="1" face="#trim(fontFace)#" color="990000">(username / password will be emailed)</font></li>													
							</ol>
						</fieldset>								
												
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllPhoneTypes">										
						<fieldset>
							<legend>&nbsp;Company Phone Information&nbsp;</legend>
							
							<ol>									
								<cfloop from="1" to="3" index="pi">
									<li>
										<label for="Attention"><cfif pi eq 1><font color="FF0000"></cfif>Phone #pi#:<cfif pi eq 1></font></cfif></label>
										<input class="SiteTextbox" name="PhoneNumber_#trim(pi)#" type="text" size="10" value="">
										ext. <input class="SiteTextbox" name="PhoneExtension_#trim(pi)#" type="text" size="2" value="">	&nbsp;&nbsp;													
										<select class="SiteSelectBox" name="PhoneTypeID_#trim(pi)#">											
											<cfloop query="getAllPhoneTypes">
												<option value="#StandardListItemID#" <cfif StandardListItemID EQ 13>SELECTED</cfif>> #ItemNameDisplay#
											</cfloop>
										</select>
									</li>	
								</cfloop>								
								<li><label for="PhoneFormat"></label><span class="copyBlackSmall">(xxx-xxx-xxxx)</span></li>																						
							</ol>
							
						</fieldset>								
						
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates">
						<fieldset>
							<legend>&nbsp;Company Address Information&nbsp;</legend>
							
							<ol>									
								<cfloop from="1" to="3" index="ai">
									<li>
										<label for="address"><cfif ai neq 1><br></cfif><font color="gray">Address #trim(ai)#</font><br><hr></label>										
									</li>
									<li>
										<label for="Attention_#trim(ai)#"><cfif ai eq 1><font color="FF0000"></cfif>Address Type:<cfif ai eq 1></font></cfif></label>										
										<select class="SiteSelectBox" name="AddressTypeID_#trim(ai)#">											
											<cfloop query="getAllAddressTypes">
												<option value="#StandardListItemID#" <cfif StandardListItemID EQ 13>SELECTED</cfif>> #ItemNameDisplay#
											</cfloop>
										</select>
									</li>
									<li>
										<label for="Attention_#trim(ai)#">Attention:</label>
										<input class="SiteTextbox" name="Attention_#trim(ai)#" type="text" size="25" value="">										
									</li>
									<li>
										<label for="AddressLine1_#trim(ai)#"><cfif ai eq 1><font color="FF0000"></cfif>Address Line 1:<cfif ai eq 1></font></cfif></label>
										<input class="SiteTextbox" name="AddressLine1_#trim(ai)#" type="text" size="25" value="">
									</li>
									<li>
										<label for="AddressLine2_#trim(ai)#">Address Line 2:</label>
										<input class="SiteTextbox" name="AddressLine2_#trim(ai)#" type="text" size="25" value="">
									</li>
									<li>
										<label for="City_#trim(ai)#"><cfif ai eq 1><font color="FF0000"></cfif>City, State Zip:<cfif ai eq 1></font></cfif></label>
										<input class="SiteTextbox" type="text" name="City_#trim(ai)#" size="6" maxlength="50" value="">,
										&nbsp;&nbsp;
										<select class="SiteSelectBox" name="StateID_#trim(ai)#">
											<cfloop query="getAllStates">
												<option value="#StandardListItemID#"> #ItemNameDisplay#
											</cfloop>
										</select>
										&nbsp;<input class="SiteTextbox" type="Text" name="ZipCode_#trim(ai)#" size="5" maxlength="25" value=""> 					
									</li>	
								</cfloop>																											
							</ol>
							
						</fieldset>		
						
						<input name="submit" type="submit" class="SiteSubmitbox" value="Save New Customer">
						&nbsp;&nbsp;
						<input name="submit" type="button" class="SiteSubmitbox" value="Cancel"><br><br>				
																
					</div>					
								
				</cf_gcBorderedTable>					
					
			</div>
			
		</form>				
		
	</cfoutput>		
		
			
	
<cfif CGI.REMOTE_ADDR EQ "192.168.1.1" OR CGI.REMOTE_ADDR EQ "127.0.0.1" OR CGI.REMOTE_ADDR EQ "192.168.1.100" OR CGI.REMOTE_ADDR EQ "192.168.1.101" OR CGI.REMOTE_ADDR EQ "24.155.83.122">	

<cfoutput>
	<cfset randRange = "#randRange(1001, 2252)#">	
	<script type="text/javascript">
		window.onload=function(){			
			if(document.getElementById("ClientName") && document.getElementById("ClientName").value == "") document.getElementById("ClientName").value = "ABC Medical #trim(randRange)#";
			if(document.getElementById("dba") && document.getElementById("dba").value == "") document.getElementById("dba").value = "dba #trim(randRange)#";
			if(document.getElementById("concurrentUsers") && document.getElementById("concurrentUsers").value == "") document.getElementById("concurrentUsers").value = "10";
			if(document.getElementById("AdministratorFName") && document.getElementById("AdministratorFName").value == "") document.getElementById("AdministratorFName").value = "First#trim(randRange)#";
			if(document.getElementById("AdministratorMName") && document.getElementById("AdministratorMName").value == "") document.getElementById("AdministratorMName").value = "A";
			if(document.getElementById("AdministratorLName") && document.getElementById("AdministratorLName").value == "") document.getElementById("AdministratorLName").value = "Last#trim(randRange)#";
			if(document.getElementById("AdministratorPhoneNumber") && document.getElementById("AdministratorPhoneNumber").value == "") document.getElementById("AdministratorPhoneNumber").value = "972-508-#trim(randRange)#";
			if(document.getElementById("AdministratorPhoneExtension") && document.getElementById("AdministratorPhoneExtension").value == "") document.getElementById("AdministratorPhoneExtension").value = "#trim(randRange)#";
			if(document.getElementById("AdministratorEmailAddress") && document.getElementById("AdministratorEmailAddress").value == "") document.getElementById("AdministratorEmailAddress").value = "test#trim(randRange)#@test.com";
			if(document.getElementById("PhoneNumber_1") && document.getElementById("PhoneNumber_1").value == "") document.getElementById("PhoneNumber_1").value = "111-508-#trim(randRange)#";
			if(document.getElementById("PhoneExtension_1") && document.getElementById("PhoneExtension_1").value == "") document.getElementById("PhoneExtension_1").value = "1123";
			if(document.getElementById("PhoneNumber_2") && document.getElementById("PhoneNumber_2").value == "") document.getElementById("PhoneNumber_2").value = "222-508-#trim(randRange)#";
			if(document.getElementById("PhoneExtension_2") && document.getElementById("PhoneExtension_2").value == "") document.getElementById("PhoneExtension_2").value = "2123";
			if(document.getElementById("PhoneNumber_3") && document.getElementById("PhoneNumber_3").value == "") document.getElementById("PhoneNumber_3").value = "333-508-#trim(randRange)#";
			if(document.getElementById("PhoneExtension_3") && document.getElementById("PhoneExtension_3").value == "") document.getElementById("PhoneExtension_3").value = "3123";
			if(document.getElementById("Attention_1") && document.getElementById("Attention_1").value == "") document.getElementById("Attention_1").value = "Attn1 #trim(randRange)#";
			if(document.getElementById("AddressLine1_1") && document.getElementById("AddressLine1_1").value == "") document.getElementById("AddressLine1_1").value = "Line1 1";
			if(document.getElementById("AddressLine2_1") && document.getElementById("AddressLine2_1").value == "") document.getElementById("AddressLine2_1").value = "Line1 2";
			if(document.getElementById("City_1") && document.getElementById("City_1").value == "") document.getElementById("City_1").value = "City1 ";
			if(document.getElementById("ZipCode_1") && document.getElementById("ZipCode_1").value == "") document.getElementById("ZipCode_1").value = "Zip1";
			if(document.getElementById("Attention_2") && document.getElementById("Attention_2").value == "") document.getElementById("Attention_2").value = "Attn2";
			if(document.getElementById("AddressLine1_2") && document.getElementById("AddressLine1_2").value == "") document.getElementById("AddressLine1_2").value = "Line2 1";
			if(document.getElementById("AddressLine2_2") && document.getElementById("AddressLine2_2").value == "") document.getElementById("AddressLine2_2").value = "Line2 2";
			if(document.getElementById("City_2") && document.getElementById("City_2").value == "") document.getElementById("City_2").value = "City2";
			if(document.getElementById("ZipCode_2") && document.getElementById("ZipCode_2").value == "") document.getElementById("ZipCode_2").value = "Zip2";
			if(document.getElementById("Attention_3") && document.getElementById("Attention_3").value == "") document.getElementById("Attention_3").value = "Attn3";
			if(document.getElementById("AddressLine1_3") && document.getElementById("AddressLine1_3").value == "") document.getElementById("AddressLine1_3").value = "Line3 1";
			if(document.getElementById("AddressLine2_3") && document.getElementById("AddressLine2_3").value == "") document.getElementById("AddressLine2_3").value = "Line3 2";
			if(document.getElementById("City_3") && document.getElementById("City_3").value == "") document.getElementById("City_3").value = "City3";
			if(document.getElementById("ZipCode_3") && document.getElementById("ZipCode_3").value == "") document.getElementById("ZipCode_3").value = "Zip3";		
		}
	</script>	
</cfoutput>

</cfif>


