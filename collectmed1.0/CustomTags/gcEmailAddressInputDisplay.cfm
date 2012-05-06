<!-------------------------------------------------------------------------------------->
<!--- NOTE: PLACE ALL TAG INFO YOU WANT DISPLAYED BETWEEN THE DOUBLE @@ SYMBOLS.     --->
<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@NAME@@                                                                       --->
<!---  gcEmailAddressInputDisplay.cfm                                                --->
<!--- @@NAME@@                                                                       --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!---   General                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!---   Guillermo Cruz                                                               --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   --->      
<!--- @@DESCRIPTION@@                                                                --->
<!---  This tag will show the email address form on a page.                          --->
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@EXAMPLECALL@@                                                                --->
<!--- &&lt;cf_gcEmailAddressInputDisplay<br>                                         --->
<!---    formname="#trim(formName)#"<br>                                             --->
<!---    functionname="checkEmailAddress1"<br>                                       --->
<!--- @@EXAMPLECALL@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@REQUIREDPARAMETERS@@                                                         --->
<!---  [none]                                                                        --->  
<!--- @@REQUIREDPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OPTIONALPARAMETERS@@                                                         --->
<!--- @@OPTIONALPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@RETURNEDPARAMETERS@@                                                         --->
<!---   [none]                                                                       --->  
<!--- @@RETURNEDPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    --->
<!---   Created 10/11/05                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->      
<!-------------------------------------------------------------------------------------->  



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.fontFace" default="arial">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="2">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="000000">
	<cfset fontColor = attributes.fontColor>	
	
	<cfparam name="attributes.randRange" default="#randRange(1, 5000)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.formName" default="">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.functionname" default="">
	<cfset functionname = attributes.functionname>
	
	<cfparam name="attributes.required" default="EmailAddressElement">
	<cfset required = attributes.required>
	
	<cfparam name="attributes.requiredMessages" default="You must provide an Email Address">
	<cfset requiredMessages = attributes.requiredMessages>
	
	<cfparam name="attributes.requiredType" default="Email">
	<cfset requiredType = attributes.requiredType>
	
	<cfparam name="attributes.visible" default="EmailAddressElement">
	<cfset visible = attributes.visible>
	
	<cfparam name="attributes.hidden" default="">
	<cfset hidden = attributes.hidden>
	
	<cfparam name="attributes.hiddenList" default="">
	<cfset hiddenList = attributes.hiddenList>
	
	<cfparam name="attributes.hiddenValues" default="">
	<cfset hiddenValues = attributes.hiddenValues>
	
	<cfparam name="attributes.EmailAddressElement" default="EmailAddress">
	<cfset EmailAddressElement = attributes.EmailAddressElement>
		
	<cfparam name="attributes.SiteIDElement" default="SiteID">
	<cfset SiteIDElement = attributes.SiteIDElement>
	
	<cfparam name="attributes.UsersIDElement" default="UsersID">
	<cfset UsersIDElement = attributes.UsersIDElement>
	
	<cfparam name="attributes.IsDefaultElement" default="IsDefault">
	<cfset IsDefaultElement = attributes.IsDefaultElement>
	
	<cfparam name="attributes.ActiveElement" default="Active">
	<cfset ActiveElement = attributes.ActiveElement>
	
	<cfparam name="attributes.InactiveCodeElement" default="Inactive">
	<cfset InactiveCodeElement = attributes.InactiveCodeElement>
	
	<cfparam name="attributes.EmailAddressElementValue" default="">
	<cfset EmailAddressElementValue = attributes.EmailAddressElementValue>
		
	<cfparam name="attributes.SiteIDElementValue" default="">
	<cfset SiteIDElementValue = attributes.SiteIDElementValue>
	
	<cfparam name="attributes.UsersIDElementValue" default="">
	<cfset UsersIDElementValue = attributes.UsersIDElementValue>
	
	<cfparam name="attributes.IsDefaultElementValue" default="">
	<cfset IsDefaultElementValue = attributes.IsDefaultElementValue>
	
	<cfparam name="attributes.ActiveElementValue" default="1">
	<cfset ActiveElementValue = attributes.ActiveElementValue>
	
	<cfparam name="attributes.InactiveCodeElementValue" default="">
	<cfset InactiveCodeElementValue = attributes.InactiveCodeElementValue>	
	
	<cfparam name="attributes.EmailAddressElementDisplay" default="">
	<cfset EmailAddressElementDisplay = attributes.EmailAddressElementDisplay>
		
	<cfparam name="attributes.SiteIDElementDisplay" default="">
	<cfset SiteIDElementDisplay = attributes.SiteIDElementDisplay>
	
	<cfparam name="attributes.UsersIDElementDisplay" default="">
	<cfset UsersIDElementDisplay = attributes.UsersIDElementDisplay>
	
	<cfparam name="attributes.IsDefaultElementDisplay" default="">
	<cfset IsDefaultElementDisplay = attributes.IsDefaultElementDisplay>
	
	<cfparam name="attributes.ActiveElementDisplay" default="">
	<cfset ActiveElementDisplay = attributes.ActiveElementDisplay>
	
	<cfparam name="attributes.InactiveCodeElementDisplay" default="">
	<cfset InactiveCodeElementDisplay = attributes.InactiveCodeElementDisplay>
	
	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="formname,functionname"
		fieldnames="Form Name,Check Function Name">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Check to make sure the elements sent are valid to this page.                   --->
<!-------------------------------------------------------------------------------------->	
	<cfset attributesList = ListSort(StructKeyList(attributes), "text")> 
	
	<cfloop list="#trim(visible)#" index="i" delimiters="|">		
		<cfif ListFindNoCase(attributesList, i) LTE 0>
	  		<cf_gcGeneralErrorTemplate message="The element ""#i#"" does not exist. Please Check your code.">
		</cfif>
	</cfloop> 		
	
	<cfloop list="#trim(hidden)#" index="i" delimiters="|">		
		<cfif ListFindNoCase(attributesList, ListGetAt(i, 1, "="), "|") LTE 0>
			<cf_gcGeneralErrorTemplate message="The hidden element ""#ListGetAt(i, 1, "=")#"" does not exist. Please Check your code.">
		<cfelseif ListFindNoCase(visible, ListGetAt(i, 1, "="), "|") GTE 1>
			<cf_gcGeneralErrorTemplate message="The hidden element ""#ListGetAt(i, 1, "=")#"" is also in the visible list. Please Check your code.">
		<cfelse>
			<cfset hiddenList = ListAppend(hiddenList, ListGetAt(i, 1, "="), "|")>
			<cfset hiddenValues = ListAppend(hiddenValues, ListGetAt(i, 2, "="), "|")>
		</cfif>
	</cfloop> 
	
	<cfif listlen(required, "|") NEQ listlen(requiredMessages, "|")>
		<cf_gcGeneralErrorTemplate back="no" message="The ""required""(#listlen(required, "|")#) and ""requiredMessages""(#listlen(requiredMessages, "|")#) lists are not of equal values. Please Check your code.">
	</cfif>			
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Setup the javascript function that will be checked by the form submission.     --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			/*
			<!---
			function checkUserID_#trim(randRange)#(id){
				onblur="checkUserID_#trim(randRange)#(this.value);" 
				var packetURL = "http://dev.eobmanager.net/ws/wsUser.cfc?method=wsCheckUserIDValid&userid=" + id;
				
				var packet = "<wddxPacket version='1.0'><header/><data><number>0.0</number></data></wddxPacket>";//httpGetFromURL(packetURL);	
				
				var wddxDes = new WddxDeserializer;
				var rsFilms = wddxDes.deserialize(packet);			
				alert(rsFilms);
			}
			--->
			*/
			
			
			function IsValidEmailJS_#randRange#(str) {									
				
				var regEx = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; 
				if (!regEx.test(str)) {										
					return false
				}
				else return true;  
				
			}
			
			function #functionname#(){
				
				var msg  = "";
				
				<cfloop from="1" to="#listlen(required, "|")#" index="i">
					
					<cfset element = listGetAt(required, i, "|")>					
					<cfset elementAlert = listGetAt(requiredMessages, i, "|")>	
					<cfset elementType = listGetAt(requiredType, i, "|")>	
					
					if (document.#trim(formname)#.#evaluate(element)#.value == ""){
						document.#trim(formname)#.#evaluate(element)#.className = 'SiteTextboxALERT'; 
						//document.#trim(formname)#.Display_#element#_span.className = 'SiteTextboxALERT'; 
						msg = msg + "* #elementAlert#" + "\n\n";
					}
					
					<cfif elementType EQ "Email">
						else if(!IsValidEmailJS_#randRange#(document.#trim(formname)#.#evaluate(element)#.value)){
							document.#trim(formname)#.#evaluate(element)#.className = 'SiteTextboxALERT'; 
							msg = msg + "\"" + document.#trim(formname)#.#evaluate(element)#.value + "\" is an invalid e-mail!\n\n"; 							
						};					
					</cfif> 
					
					else{
						document.#trim(formname)#.#evaluate(element)#.className = 'SiteTextbox';
					};
				</cfloop>
								
				return msg;
				
			};			
		</script>
		
	</cfoutput>		
		

				
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>			
		<table border="0" cellpadding="0" cellspacing="0">				
			<cfif ListFindNoCase(visible, "SiteIDElement", "|")>
				<cfinvoke component="com.common.db.SiteIO" method="getSiteQuery" fields="siteid,sitename" active="1" returnvariable="getAllSites">
				<tr>
					<cfif SiteIDElementDisplay NEQ "">
						<td>							
				   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
								#SiteIDElementDisplay#
							</font>						
						</td>
					</cfif>
					<td<cfif SiteIDElementDisplay EQ ""> colspan="2"</cfif>>
			   			<select class="SiteSelectBox" name="#trim(SiteIDElement)#">
								<option value="">
							<cfloop query="getAllSites">
								<option value="#SiteID#" <cfif SiteID EQ SiteIDElementValue>SELECTED</cfif>> #SiteName#
							</cfloop>
						</select><cfif ListFindNoCase(required, "SiteIDElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>							
					</td>
				</tr>				
			<cfelseif ListFindNoCase(hiddenList, "SiteIDElement", "|") AND trim(SiteIDElement) NEQ "">
				<input type="Hidden" name="#trim(SiteIDElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "SiteIDElement", "|"), "|")#">
			</cfif>
			<cfif ListFindNoCase(visible, "UsersIDElement", "|")>
				<tr>
					<cfif UsersIDElementDisplay NEQ "">
						<td>					   			
							<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
								#UsersIDElementDisplay#
							</font>					
						</td>
					</cfif>	
					<td<cfif UsersIDElementDisplay EQ ""> colspan="2"</cfif>>
			   			<input class="SiteTextbox" type="text" name="#trim(UsersIDElement)#" size="35" maxlength="50" value="#UsersIDElementValue#"><cfif ListFindNoCase(required, "UsersIDElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>
					</td>
				</tr>				
			<cfelseif ListFindNoCase(hiddenList, "UsersIDElement", "|") AND trim(UsersIDElement) NEQ "">
				<input type="Hidden" name="#trim(UsersIDElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "UsersIDElement", "|"), "|")#">
			</cfif>
			<cfif ListFindNoCase(visible, "EmailAddressElement", "|")>
				<tr>
					<cfif EmailAddressElementDisplay NEQ "">
						<td>									   
					   		<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
								#EmailAddressElementDisplay# 
							</font>						
						</td>
					</cfif>
					<td<cfif EmailAddressElementDisplay EQ ""> colspan="2"</cfif>>
			   			<input class="SiteTextbox" type="text" name="#trim(EmailAddressElement)#" size="35" maxlength="50" value="#EmailAddressElementValue#"><cfif ListFindNoCase(required, "EmailAddressElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>
						<!---onblur="if(!IsValidEmailJS_#randRange#(this.value)){alert('\'' + this.value + '\' is an invalid 99e-mail!');};"--->
					</td>
				</tr>				
			<cfelseif ListFindNoCase(hiddenList, "EmailAddressElement", "|") AND trim(EmailAddressElement) NEQ "">
				<input type="Hidden" name="#trim(EmailAddressElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "EmailAddressElement", "|"), "|")#">
			</cfif>			
			<cfif ListFindNoCase(visible, "IsDefaultElement", "|")>
				<tr>
					<cfif IsDefaultElementDisplay NEQ "">
						<td>					
				   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
								#IsDefaultElementDisplay#
							</font>						
						</td>
					</cfif>
					<td<cfif IsDefaultElementDisplay EQ ""> colspan="2"</cfif>>
			   			<input  type="Checkbox" name="#trim(IsDefaultElement)#" <cfif IsDefaultElementValue EQ 1>CHECKED</cfif>><cfif ListFindNoCase(required, "IsDefaultElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>
					</td>
				</tr>				
			<cfelseif ListFindNoCase(hiddenList, "IsDefaultElement", "|") AND trim(IsDefaultElement) NEQ "">
				<input type="Hidden" name="#trim(IsDefaultElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "IsDefaultElement", "|"), "|")#">
			</cfif>
			<cfif ListFindNoCase(visible, "ActiveElement", "|")>
				<tr>
					<cfif ActiveElementDisplay NEQ "">
						<td>							
				   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
								#ActiveElementDisplay#
							</font>						
						</td>
					</cfif>
					<td<cfif ActiveElementDisplay EQ ""> colspan="2"</cfif>>
			   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
							<input type="Radio" value="1" name="#trim(ActiveElement)#" <cfif ActiveElementValue EQ 1>CHECKED</cfif>>&nbsp;yes&nbsp;<input type="Radio" value="0" name="#trim(ActiveElement)#" <cfif ActiveElementValue EQ 0>CHECKED</cfif>>&nbsp;no<cfif ListFindNoCase(required, "ActiveElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>
						</font>
					</td>
				</tr>				
			<cfelseif ListFindNoCase(hiddenList, "ActiveElement", "|") AND trim(ActiveElement) NEQ "">
				<input type="Hidden" name="#trim(ActiveElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "ActiveElement", "|"), "|")#">
			</cfif>
			<cfif ListFindNoCase(visible, "InActiveCodeElement", "|")>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="5" active="1" returnvariable="getAllInactiveCodes">
				<tr>
					<cfif InactiveCodeElementDisplay NEQ "">
						<td>			   
				   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
								#InactiveCodeElementDisplay#
							</font>
						</td>
					</cfif>
					<td<cfif InactiveCodeElementDisplay EQ ""> colspan="2"</cfif>>
			   			<select class="SiteSelectBox" name="#trim(InActiveCodeElement)#">
								<option value="">
							<cfloop query="getAllInactiveCodes">
								<option value="#StandardListItemID#" <cfif StandardListItemID EQ InActiveCodeElementValue>SELECTED</cfif>> #ItemNameDisplay#
							</cfloop>
						</select><cfif ListFindNoCase(required, "InActiveCodeElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>						
					</td>
				</tr>				
			<cfelseif ListFindNoCase(hiddenList, "InActiveCodeElement", "|") AND trim(InActiveCodeElement) NEQ "">
				<input type="Hidden" name="#trim(InActiveCodeElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "InActiveCodeElement", "|"), "|")#">
			</cfif>											
		</table>								
	</cfoutput>

	