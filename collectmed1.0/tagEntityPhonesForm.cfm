
	

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
		.mainPhone{			
			width: 300px;
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
			function setEditPhoneSubmit(id){				
				document.#trim(formname)#.phoneID.value = id;
				document.#trim(formname)#.action.value = 'edit'; 	
				#trim(formName)#.submit();			
			}
			function setAddPhoneSubmit(){		
				document.#trim(formname)#.phoneID.value = 0;			
				document.#trim(formname)#.action.value = 'add'; 	
				#trim(formName)#.submit();			
			}
			function setDeletePhoneSubmit(id){
				document.#trim(formname)#.phoneID.value = id;			
				document.#trim(formname)#.action.value = 'delete'; 	
				#trim(formName)#.submit();			
			}
		</script>	
		
	</cfoutput>
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the phone object to work with phonees with.                         --->
<!-------------------------------------------------------------------------------------->
	<cfset request.PhoneObj = CreateObject("component", "PhoneDAO")>	
	<cfset Phones = request.PhoneObj.getPhonesByEntityId(ds: trim(request.datasource), clientID: trim(session.clientID), entityID: entityID, Active: 1)>			
			


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
		
		<div class="personalInfo" align="center">				
			<cf_gcBorderedTable title="#trim(title)#" tablealign="center" width="50%">	
				<span class="med" style="cursor:hand;padding-top:0.0ex;" id="addAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="setAddPhoneSubmit();"><font color="FF0000"><u>Add Phone</u></font></span>					
				<form name="#trim(formName)#" method="post">		
					<input type="Hidden" name="phoneID" value="">
					<input type="Hidden" name="action" value="">
					<input type="Hidden" name="tab" value="phone">
					<div class="main">
						<cfloop query="Phones">																
							<div class="mainPhone">
								<fieldset>
									<legend>Phone #currentRow#</legend>
									<ol>
										<li><strong>Phone Type:</strong> #trim(PhoneType)#</li>
										<li>#request.formatPhoneUS(trim(application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneNumber))))#
										<cfif trim(PhoneExtension) NEQ "">											
											ext. #trim(application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneExtension)))#
										</cfif>
										</li>																	
										<li>&nbsp;</li>
										<li><input type="button" class="SiteSubmitbox" value="Edit Phone" onclick="setEditPhoneSubmit(#trim(phoneID)#)">
										&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Delete phone" onclick="setDeletePhoneSubmit(#trim(phoneID)#)"></li>
									</ol>
								</fieldset>	
							</div>	
						</cfloop>
					</div>					
				</form>				
			</cf_gcBorderedTable>					
		</div>
		
	</cfoutput>		
		
		