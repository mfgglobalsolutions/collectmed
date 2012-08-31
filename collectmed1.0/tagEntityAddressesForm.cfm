
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="AddressInformationForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.EntityID" default="">
	<cfset EntityID = attributes.EntityID>
	
	<cfparam name="attributes.forceDefault" default="yes">
	<cfset forceDefault = attributes.forceDefault>
	
	<cfparam name="attributes.tabstart" default="1">
	<cfset tabstart = attributes.tabstart>
	
	<cfparam name="attributes.title" default="Address Information">
	<cfset title = attributes.title>
	
	<cfif IsDefined("form.title") AND form.title NEQ "">
		<cfset title = form.title>
	<cfelseif IsDefined("url.title") AND url.title NEQ "">
		<cfset title = url.title>	
	</cfif>	
	
	<cfparam name="attributes.bgcolor" default="DCE3EB">
	<cfset bgcolor = attributes.bgcolor>
	
	
				
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="EntityID"
		fieldnames="User ID"
		datatypes="numeric">



<!-------------------------------------------------------------------------------------->
<!--- Some styles for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<style>
		.mainAddress{			
			padding: 0 0 0 0;
		}
		fieldset{							
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
			padding: 2 2;
			text-align: left;
			font: normal 12px "Verdana","Arial", "Helvetica";			
			color: ##000000; 	
		}		
	</style>		
		
	<cfoutput>
		
		<script language="JavaScript">
			function setEditAddressSubmit(id){				
				document.#trim(formname)#.addressID.value = id;
				document.#trim(formname)#.action.value = 'edit'; 	
				#trim(formName)#.submit();			
			}
			function setAddAddressSubmit(){		
				document.#trim(formname)#.addressID.value = 0;			
				document.#trim(formname)#.action.value = 'add'; 	
				#trim(formName)#.submit();			
			}
			function setDeleteAddressSubmit(id){
				document.#trim(formname)#.addressID.value = id;			
				document.#trim(formname)#.action.value = 'delete'; 	
				#trim(formName)#.submit();			
			}
		</script>	
		
	</cfoutput>
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the address object to work with addresses with.                         --->
<!-------------------------------------------------------------------------------------->
	<cfset request.AddressObj = application.beanFactory.getBean("AddressService") />	
	<cfset Addresses = request.AddressObj.getAddressesByEntityId(ds: trim(request.datasource), clientID: trim(session.clientID), entityID: entityID, Active: 1)>			
			


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
		
		<div class="personalInfo" align="center">	
			
			<cf_gcBorderedTable title="#trim(title)#" tablealign="center" width="50%">	
				<span class="med" style="cursor:hand;padding-top:0.0ex;" id="addAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="setAddAddressSubmit();"><font color="FF0000"><u>Add Address</u></font></span>					
				<form name="#trim(formName)#" method="post">		
					<input type="Hidden" name="addressID" value="">
					<input type="Hidden" name="action" value="">
					<input type="Hidden" name="tab" value="address">
					<div class="main">
						<cfloop query="Addresses">
							<div class="mainAddress">
								<fieldset>
									<legend>Address #currentRow#</legend>
									<ol>
										<li><strong>Address Type:</strong> #trim(AddressType)#</li>
										<li>#trim(AddressLine1)#</li>
										<cfif trim(AddressLine2) NEQ ""><li>#trim(AddressLine2)#</li></cfif>
										<li>#trim(City)#, #trim(StateFull)# #trim(zipCode)#</li>									
										<li>&nbsp;</li>
										<li><input type="button" class="SiteSubmitbox" value="Edit Address" onclick="setEditAddressSubmit(#trim(addressID)#)">
										&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Delete address" onclick="setDeleteAddressSubmit(#trim(addressID)#)"></li>
									</ol>
								</fieldset>	
							</div>	
						</cfloop>
					</div>
					
				</form>						
			
			</cf_gcBorderedTable>	
				
		</div>
		
	</cfoutput>		
		
		