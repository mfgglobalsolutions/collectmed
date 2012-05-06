<!-------------------------------------------------------------------------------------->
<!--- NOTE: PLACE ALL TAG INFO YOU WANT DISPLAYED BETWEEN THE DOUBLE @@ SYMBOLS.     --->
<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@NAME@@                                                                       --->
<!---  gcAddressInputDisplay.cfm                                                     --->
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
<!---  This tag will show the address form on a page.                                --->
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@EXAMPLECALL@@                                                                --->
<!--- &&lt;cf_gcAddressInputDisplay<br>                                              --->
<!---    formname="#trim(formName)#"<br>                                             --->
<!---    functionname="checkAddress1"<br>                                            --->
<!---    addresstypeid="13"<br>                                                      --->
<!---    addresstypeIDelement="AddressType"<br>                                      --->
<!---    addressline1element="AddressLine1"<br>                                      --->
<!---    addressline2element="AddressLine2"<br>                                      --->
<!---    cityelement="City"<br>                                                      --->
<!---    stateIDelement="StateID"<br>                                                --->
<!---    zipcodeelement="ZipCode"<br>                                                --->
<!---    visible="addresstypeIDelement|addressline1element|addressline2element|      --->
<!---    stateidelement|cityElement|zipcodeelement"<br>                              --->
<!---    required="addresstypeIDelement|addressline1element|addressline2element"     --->
<!---    requiredMessages="You must provide the address type.|                       --->
<!---    You must provide an address line 1.| Address line 2 must be filled in."&gt; --->
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
<!--- visible <strong>show on page</strong><br>                                      --->
<!--- hidden <strong>hidden form elelments</strong><br>                              --->
<!--- required <strong>default: AddressLine1Element|CityElement|</strong>            --->
<!--- <strong>StateIDElement|ZipCodeElement</strong><br>                             --->
<!--- AddressTypeIDElement <strong>default: AddressTypeID</strong><br>               --->
<!--- AddressLine1Element <strong>default: AddressLine1</strong><br>                 --->
<!--- AddressLine2Element <strong>default: AddressLine2</strong><br>                 --->
<!--- CityElement <strong>default: City</strong><br>                                 --->
<!--- StateIDElement <strong>default: StateID</strong><br>                           --->
<!--- ZipCodeElement <strong>default: ZipCode</strong><br>                           --->
<!--- AddressTypeID [value]<br>                                                      --->
<!--- AddressLine1 [value]<br>                                                       --->
<!--- AddressLine2 [value]<br>                                                       --->
<!--- City [value]<br>                                                               --->
<!--- StateID [value]<br>                                                            --->
<!--- ZipCode [value]                                                                --->  
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
	
	<cfparam name="attributes.formName" default="">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.required" default="AddressLine1Element|CityElement|StateIDElement|ZipCodeElement">
	<cfset required = attributes.required>
	
	<cfparam name="attributes.requiredMessages" default="Address Line 1|City|State ID|Zip Code">
	<cfset requiredMessages = attributes.requiredMessages>
	
	<cfparam name="attributes.visible" default="">
	<cfset visible = attributes.visible>
	
	<cfparam name="attributes.hidden" default="">
	<cfset hidden = attributes.hidden>
	
	<cfparam name="attributes.hiddenList" default="">
	<cfset hiddenList = attributes.hiddenList>
	
	<cfparam name="attributes.hiddenValues" default="">
	<cfset hiddenValues = attributes.hiddenValues>
	
	<cfparam name="attributes.AddressTypeIDElement" default="AddressTypeID">
	<cfset AddressTypeIDElement = attributes.AddressTypeIDElement>
	
	<cfparam name="attributes.AddressLine1Element" default="AddressLine1">
	<cfset AddressLine1Element = attributes.AddressLine1Element>
	
	<cfparam name="attributes.AddressLine2Element" default="AddressLine2">
	<cfset AddressLine2Element = attributes.AddressLine2Element>
	
	<cfparam name="attributes.CityElement" default="City">
	<cfset CityElement = attributes.CityElement>
	
	<cfparam name="attributes.StateIDElement" default="StateID">
	<cfset StateIDElement = attributes.StateIDElement>
	
	<cfparam name="attributes.ZipCodeElement" default="ZipCode">
	<cfset ZipCodeElement = attributes.ZipCodeElement>
				
	<cfparam name="attributes.AddressTypeIDElementValue" default="">
	<cfset AddressTypeIDElementValue = attributes.AddressTypeIDElementValue>
	
	<cfparam name="attributes.AddressLine1ElementValue" default="">
	<cfset AddressLine1ElementValue = attributes.AddressLine1ElementValue>
	
	<cfparam name="attributes.AddressLine2ElementValue" default="">
	<cfset AddressLine2ElementValue = attributes.AddressLine2ElementValue>
	
	<cfparam name="attributes.CityElementValue" default="">
	<cfset CityElementValue = attributes.CityElementValue>
	
	<cfparam name="attributes.StateIDElementValue" default="">
	<cfset StateIDElementValue = attributes.StateIDElementValue>
	
	<cfparam name="attributes.ZipCodeElementValue" default="">
	<cfset ZipCodeElementValue = attributes.ZipCodeElementValue>
	
	<cfparam name="attributes.AddressTypeIDElementDisplay" default="Address&nbsp;&nbsp;Type:">
	<cfset AddressTypeIDElementDisplay = attributes.AddressTypeIDElementDisplay>
	
	<cfparam name="attributes.AddressLine1ElementDisplay" default="Address&nbsp;Line&nbsp;1:">
	<cfset AddressLine1ElementDisplay = attributes.AddressLine1ElementDisplay>
	
	<cfparam name="attributes.AddressLine2ElementDisplay" default="Address&nbsp;Line&nbsp;2:">
	<cfset AddressLine2ElementDisplay = attributes.AddressLine2ElementDisplay>
	
	<cfparam name="attributes.CityElementDisplay" default="City,&nbsp;">
	<cfset CityElementDisplay = attributes.CityElementDisplay>
	
	<cfparam name="attributes.StateIDElementDisplay" default="State&nbsp;">
	<cfset StateIDElementDisplay = attributes.StateIDElementDisplay>
	
	<cfparam name="attributes.ZipCodeElementDisplay" default="Zip&nbsp;">
	<cfset ZipCodeElementDisplay = attributes.ZipCodeElementDisplay>
	
	<cfparam name="attributes.functionname" default="">
	<cfset functionname = attributes.functionname>
	
	
	
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
			function #functionname#(){
				
				var msg  = "";
				
				<cfloop from="1" to="#listlen(required, "|")#" index="i">
					
					<cfset element = listGetAt(required, i, "|")>					
					<cfset elementAlert = listGetAt(requiredMessages, i, "|")>	
					
					if (document.#trim(formname)#.#evaluate(element)#.value == ""){
						document.#trim(formname)#.#evaluate(element)#.className = 'SiteTextboxALERT'; 
						
						msg = msg + "* #elementAlert#" + "\n\n";
					}
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
		<table border="0" cellpadding="2" cellspacing="0">								
			<cfif ListFindNoCase(visible, "AddressTypeIDElement", "|")>
				<tr>
					<td width="20%">			   
			   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
							#AddressTypeIDElementDisplay#
						</font>
					</td>
					<td width="80%" colspan="2" valign="middle">			   			
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
						<select class="SiteSelectBox" name="#trim(AddressTypeIDElement)#">
								<option value=""> Choose One
							<cfloop query="getAllAddressTypes">
								<option value="#StandardListItemID#" <cfif StandardListItemID EQ AddressTypeIDElementValue>SELECTED</cfif>> #ItemNameDisplay#
							</cfloop>
						</select><cfif ListFindNoCase(required, "AddressTypeIDElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>							
					</td>
				</tr>			
			<cfelseif ListFindNoCase(hiddenList, "AddressTypeIDElement", "|") AND trim(AddressTypeIDElement) NEQ "">
				<input type="Hidden" name="#trim(AddressTypeIDElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "AddressTypeIDElement", "|"), "|")#">
			</cfif>
			<cfif ListFindNoCase(visible, "AddressLine1Element", "|")>
				<tr>
					<td width="20%">			   
			   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
							#AddressLine1ElementDisplay#
						</font>
					</td>
					<td width="80%" colspan="2">
			   			<input class="SiteTextbox" type="text" name="#trim(AddressLine1Element)#" size="35" maxlength="50" value="#AddressLine1ElementValue#"><cfif ListFindNoCase(required, "AddressLine1Element", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>
					</td>
				</tr>				
			<cfelseif ListFindNoCase(hiddenList, "AddressLine1Element", "|") AND trim(AddressLine1Element) NEQ "">
				<input type="Hidden" name="#trim(AddressLine1Element)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "AddressLine1Element", "|"), "|")#">
			</cfif>			
			<cfif ListFindNoCase(visible, "AddressLine2Element", "|")>
				<tr>
					<td width="20%">			   
			   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
							#AddressLine2ElementDisplay#
						</font>
					</td>
					<td width="80%" colspan="2">
			   			<input class="SiteTextbox" type="text" name="#trim(AddressLine2Element)#" size="35" maxlength="50" value="#AddressLine2ElementValue#"><cfif ListFindNoCase(required, "AddressLine2Element", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>
					</td>
				</tr>
			<cfelseif ListFindNoCase(hiddenList, "AddressLine2Element", "|") AND trim(AddressLine2Element) NEQ "">			
				<input type="Hidden" name="#trim(AddressLine2Element)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "AddressLine2Element", "|"), "|")#">			
			</cfif>			
			<tr>
				<td>			   
		   			<font face="#trim(fontFace)#" size="#trim(fontSize)#" color="#trim(fontColor)#">
						<cfif ListFindNoCase(visible, "CityElement", "|")>#CityElementDisplay#</cfif><cfif ListFindNoCase(required, "CityElement", "|") GT 0></cfif><cfif ListFindNoCase(visible, "StateIDElement", "|")>#StateIDElementDisplay#</cfif><cfif ListFindNoCase(visible, "ZipCodeElement", "|")>#ZipCodeElementDisplay#</cfif>
					</font>
				</td>
				<td colspan="2">
		   			<cfif ListFindNoCase(visible, "CityElement", "|")><input class="SiteTextbox" type="text" name="#trim(CityElement)#" size="15" maxlength="50" value="#CityElementValue#"><font size="2" color="FF0000">&nbsp;*</font>&nbsp;&nbsp;<cfelseif ListFindNoCase(hiddenList, "CityElement", "|") AND trim(CityElement) NEQ ""><input type="Hidden" name="#trim(CityElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "CityElement", "|"), "|")#"></cfif>					
					<cfif ListFindNoCase(visible, "StateIDElement", "|")>
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates">
						<select class="SiteSelectBox" name="#trim(StateIDElement)#">
								<option value="">
							<cfloop query="getAllStates">
								<option value="#StandardListItemID#" <cfif StandardListItemID EQ StateIDElementValue>SELECTED</cfif>> #ItemNameDisplay#
							</cfloop>
						</select><cfif ListFindNoCase(required, "StateIDElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif>
					<cfelseif ListFindNoCase(hiddenList, "StateIDElement", "|") AND trim(StateIDElement) NEQ "">
						<input type="Hidden" name="#trim(StateIDElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "StateIDElement", "|"), "|")#">&nbsp;</cfif><cfif ListFindNoCase(visible, "ZipCodeElement", "|")><input class="SiteTextbox" type="Text" name="#trim(ZipCodeElement)#" size="10" maxlength="5" value="#ZipCodeElementValue#"><cfif ListFindNoCase(required, "ZipCodeElement", "|") GT 0><font size="2" color="FF0000">&nbsp;*</font></cfif> 
					<cfelseif ListFindNoCase(hiddenList, "ZipCodeElement", "|") AND trim(ZipCodeElement) NEQ "">
						<input type="Hidden" name="#trim(ZipCodeElement)#" value="#ListGetAt(hiddenValues, ListFindNoCase(hiddenList, "ZipCodeElement", "|"), "|")#">	
					</cfif>
				</td>
			</tr>						
		</table>								
	</cfoutput>

	