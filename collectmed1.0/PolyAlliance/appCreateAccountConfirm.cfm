
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.fontFace" default="arial">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="10">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="000000">
	<cfset fontColor = attributes.fontColor>
	
	<cfparam name="attributes.allowNext" default="true">
	<cfset allowNext = attributes.allowNext>
	
	

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
			
	

				

	<cfoutput>			
		<form method="post" name="creatAccount" action="appCreateAccountProcess.cfm">				
			
			<div align="center">	
					
				<cf_gcBorderedTable title="New Customer Information" tablealign="center" width="75%">						
					<br>
					<font size="3" face="#trim(fontFace)#" color="FF0000">
						<strong>#UCASE('Please confirm all the submitted information')#</strong>
					</font>
												
					<div class="companyInformation">						
						<fieldset>
							<legend>&nbsp;Company Information&nbsp;</legend>
							<ol>
								<li>
									<label for="Name">Name:</label>						
									<font face="#trim(fontFace)#" color="990000">#form.ClientName#</font>
								</li>
								<li>
									<label for="dba">DBA:</label>
									<font face="#trim(fontFace)#" color="990000">#form.dba#</font>
								</li>
								<li>
									<label for="concurrentUsers">Concurrent Users:</label>
									<font face="#trim(fontFace)#" color="990000">#form.concurrentUsers#</font>
								</li>													
							</ol>
						</fieldset>				
											
						<fieldset>
							<legend>&nbsp;Administrator Information&nbsp;</legend>
							<ol>
								<li>
									<label for="Name">Admin Name:</label>						
									First:&nbsp;<font face="#trim(fontFace)#" color="990000">#form.AdministratorFName#</font>&nbsp;&nbsp;&nbsp;
									M:&nbsp;<font face="#trim(fontFace)#" color="990000">#form.AdministratorMName#</font>&nbsp;&nbsp;&nbsp;
									Last:&nbsp;<font face="#trim(fontFace)#" color="990000">#form.AdministratorLName#</font>
								</li>
								<li>
									<label for="AdminPhone">Admin Phone:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AdministratorPhoneNumber#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.AdministratorPhoneExtension#</font>&nbsp;	
								</li>	
								<li>
									<label for="concurrentUsers">Admin Email:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AdministratorEmailAddress#</font>
								</li>	
								<li><label for="email"></label><font size="1" face="#trim(fontFace)#" color="000000">(username / password will be emailed)</font></li>													
							</ol>
						</fieldset>								
												
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllPhoneTypes">										
						<fieldset>
							<legend>&nbsp;Company Phone Information&nbsp;</legend>
							
							<ol>							
								<li>
									<label for="Attention">Phone 1:</label>
									<font face="#trim(fontFace)#" color="990000">#form.PhoneNumber_1#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.PhoneExtension_1#</font>&nbsp;&nbsp;													
									<cfloop query="getAllPhoneTypes">
										<cfif StandardListItemID EQ form.PhoneTypeID_1><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>								
								</li>		
								<li>
									<label for="Attention">Phone 2:</label>
									<font face="#trim(fontFace)#" color="990000">#form.PhoneNumber_2#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.PhoneExtension_2#</font>&nbsp;&nbsp;													
									<cfloop query="getAllPhoneTypes">
										<cfif StandardListItemID EQ form.PhoneTypeID_2><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>								
								</li>		
								<li>
									<label for="Attention">Phone 3:</label>
									<font face="#trim(fontFace)#" color="990000">#form.PhoneNumber_3#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.PhoneExtension_3#</font>&nbsp;&nbsp;													
									<cfloop query="getAllPhoneTypes">
										<cfif StandardListItemID EQ form.PhoneTypeID_3><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>								
								</li>																														
							</ol>
							
						</fieldset>								
						
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates">
						<fieldset>
							<legend>&nbsp;Company Address Information&nbsp;</legend>
							
							<ol>									
								
								<li>
									<label for="address"><font color="FF0000">Address 1</font><br><hr></label>										
								</li>
								<li>
									<label for="Attention_1">Address Type:</label>										
									<cfloop query="getAllAddressTypes">
										<cfif StandardListItemID EQ form.AddressTypeID_1><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
								</li>
								<li>
									<label for="Attention_1">Attention:</label>
									<font face="#trim(fontFace)#" color="990000">#form.Attention_1#</font>					
								</li>
								<li>
									<label for="AddressLine1_1">Address Line 1:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine1_1#</font>
								</li>
								<li>
									<label for="AddressLine2_1">Address Line 2:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine2_1#</font>
								</li>
								<li>
									<label for="City_1">City, State Zip:</label>
									<font face="#trim(fontFace)#" color="990000">#form.City_1#</font>,&nbsp;
									<cfloop query="getAllStates">
										<cfif StandardListItemID eq form.StateID_1><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
									&nbsp;<font face="#trim(fontFace)#" color="990000">#form.ZipCode_1#</font>				
								</li>
								
								<li>
									<label for="address"><font color="FF0000">Address 2</font><br><hr></label>										
								</li>
								<li>
									<label for="Attention_2">Address Type:</label>										
									<cfif form.AddressLine1_2 NEQ "">
									<cfloop query="getAllAddressTypes">
										<cfif StandardListItemID EQ form.AddressTypeID_2><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
									</cfif>		
								</li>
								<li>
									<label for="Attention_2">Attention:</label>
									<font face="#trim(fontFace)#" color="990000">#form.Attention_2#</font>						
								</li>
								<li>
									<label for="AddressLine1_2">Address Line 1:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine1_2#</font>
								</li>
								<li>
									<label for="AddressLine2_2">Address Line 2:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine2_2#</font>
								</li>
								<li>
									<label for="City_2">City, State Zip:</label>
									<font face="#trim(fontFace)#" color="990000">#form.City_2#</font>,&nbsp;
									<cfif form.AddressLine1_2 NEQ "">
									<cfloop query="getAllStates">
										<cfif StandardListItemID eq form.StateID_2><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
									</cfif>		
									&nbsp;<font face="#trim(fontFace)#" color="990000">#form.ZipCode_2#</font>				
								</li>	
								
								<li>
										<label for="address"><font color="FF0000">Address 3</font><br><hr></label>										
									</li>
									<li>
										<label for="Attention_3">Address Type:</label>										
										<cfif form.AddressLine1_3 NEQ "">
										<cfloop query="getAllAddressTypes">
											<cfif StandardListItemID EQ form.AddressTypeID_3><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
										</cfloop>									
										</cfif>								
									</li>
									<li>
										<label for="Attention_3">Attention:</label>
										<font face="#trim(fontFace)#" color="990000">#form.Attention_3#</font>						
									</li>
									<li>
										<label for="AddressLine1_3">Address Line 1:</label>
										<font face="#trim(fontFace)#" color="990000">#form.AddressLine1_3#</font>
									</li>
									<li>
										<label for="AddressLine2_3">Address Line 2:</label>
										<font face="#trim(fontFace)#" color="990000">#form.AddressLine2_3#</font>
									</li>
									<li>
										<label for="City_3">City, State Zip:</label>
										<font face="#trim(fontFace)#" color="990000">#form.City_3#</font>,&nbsp;
										<cfif form.AddressLine1_3 NEQ "">
										<cfloop query="getAllStates">
											<cfif StandardListItemID eq form.StateID_3><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
										</cfloop>									
										</cfif>									
										&nbsp;<font face="#trim(fontFace)#" color="990000">#form.ZipCode_3#</font>				
									</li>
																																		
							</ol>
							
						</fieldset>		
						
						<input type="button" value="Previous Screen" onClick="history.go(-1)" class="SiteSubmitbox">&nbsp;&nbsp;
						<cfif allowNext EQ true><cf_gcSubmitButton value="Confirmed / Create Account"></cfif>	
						<br><br>				
																
					</div>					
								
				</cf_gcBorderedTable>					
					
			</div>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- Take form fields and reembed them as hiddne fields to move to the next page.   --->
			<!-------------------------------------------------------------------------------------->			
			<cf_gcEmbedFields>  
					
		</form>
		
	</cfoutput>	
	
	
	