
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="PhoneInformationForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.EntityID" default="">
	<cfset EntityID = attributes.EntityID>
	
	<cfparam name="attributes.forceDefault" default="yes">
	<cfset forceDefault = attributes.forceDefault>
	
	<cfparam name="attributes.tabstart" default="1">
	<cfset tabstart = attributes.tabstart>
	
	<cfparam name="attributes.title" default="Phone Information">
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
		.mainPhone{			
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
					<input type="Hidden" name="phoneID" value="0">
					<input type="Hidden" name="action" value="save">				
					<input type="Hidden" name="tab" value="phone">
					<div class="mainPhone">						
						<fieldset>
							<legend>&nbsp;Phone Edit&nbsp;</legend>
							<ol>
								<li>
									<label for="PhoneTypeID">Phone Type:</label>						
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllPhoneTypes">
									<select class="SiteSelectBox" name="PhoneTypeID">											
										<cfloop query="getAllPhoneTypes">
											<option value="#StandardListItemID#" <cfif StandardListItemID EQ 12>SELECTED</cfif>> #ItemNameDisplay#
										</cfloop>
									</select>
								</li>
								<li>
									<label for="Attention">Phone Number:</label>
									<input class="SiteTextbox" name="PhoneNumber" type="text" size="18" value="">
									ext. <input class="SiteTextbox" name="PhoneExtension" type="text" size="7" value="">
								</li>	
								<li>
									<label for="Attention"></label>
									<span class="copyBlackSmall">(xxx-xxx-xxxx)</span>
								</li>																
							</ol>
						</fieldset>							
						<input name="submit" type="submit" class="SiteSubmitbox" value="Save">
						&nbsp;&nbsp;
						<input name="submit" type="button" class="SiteSubmitbox" value="Cancel">
												
					</div>
					
				</form>						
			
			</cf_gcBorderedTable>	
				
		</div>
		
	</cfoutput>		
		
		