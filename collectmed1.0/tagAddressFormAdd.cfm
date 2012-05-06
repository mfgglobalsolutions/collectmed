
	

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
	
	

<!-------------------------------------------------------------------------------------->
<!--- Some styles for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<style>
		.mainAddress{			
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
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
		
		<div class="personalInfo" align="center">	
			
			<cf_gcBorderedTable title="#trim(title)#" tablealign="center" width="75%">	
					
				<form name="#trim(formName)#" method="post">		
					<input type="Hidden" name="addressID" value="0">
					<input type="Hidden" name="action" value="save">				
					<input type="Hidden" name="tab" value="address">
					<div class="mainAddress">						
						<fieldset>
							<legend>&nbsp;Add Address&nbsp;</legend>
							<ol>
								<li>
									<label for="AddressTypeID">Address Type:</label>						
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
									<select class="SiteSelectBox" name="AddressTypeID">											
										<cfloop query="getAllAddressTypes">
											<option value="#StandardListItemID#" <cfif StandardListItemID EQ 12>SELECTED</cfif>> #ItemNameDisplay#
										</cfloop>
									</select>
								</li>
								<li>
									<label for="Attention">Attention:</label>
									<input class="SiteTextbox" name="Attention" type="text" size="25" value="">
								</li>
								<li>
									<label for="AddressLine1">Address Line 1:</label>
									<input class="SiteTextbox" name="AddressLine1" type="text" size="25" value="">
								</li>
								<li>
									<label for="AddressLine2">Address Line 2:</label>
									<input class="SiteTextbox" name="AddressLine2" type="text" size="25" value="">
								</li>
								<li>
									<label for="City">City, State Zip:</label>
									<input class="SiteTextbox" type="text" name="City" size="15" maxlength="50" value="" onChange="capitalizeMe(this)">,
									&nbsp;&nbsp;
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates">
									<select class="SiteSelectBox" name="StateID">
										<cfloop query="getAllStates">
											<option value="#StandardListItemID#"> #ItemNameDisplay#
										</cfloop>
									</select>
									&nbsp;<input class="SiteTextbox" type="Text" name="ZipCode" size="13" maxlength="25" value=""> 					
								</li>									
							</ol>
						</fieldset>							
						<input name="submit" type="submit" class="SiteSubmitbox" value="Add Address">
						&nbsp;&nbsp;
						<input name="submit" type="button" class="SiteSubmitbox" value="Cancel">
												
					</div>
					
				</form>						
			
			</cf_gcBorderedTable>	
				
		</div>
		
	</cfoutput>		
		
		