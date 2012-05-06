
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="AddressInformationList">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.EntityID" default="">
	<cfset EntityID = attributes.EntityID>
			
	<cfparam name="attributes.title" default="Address Information">
	<cfset title = attributes.title>
	
	<cfif IsDefined("form.title") AND form.title NEQ "">
		<cfset title = form.title>
	<cfelseif IsDefined("url.title") AND url.title NEQ "">
		<cfset title = url.title>	
	</cfif>	
	
	<cfparam name="attributes.bgcolor" default="DCE3EB">
	<cfset bgcolor = attributes.bgcolor>
	
	<cfparam name="attributes.addressContainer" default="addressEditContainer">
	<cfset addressContainer = attributes.addressContainer>
	
	<cfparam name="attributes.addressContainerHeight" default="400">
	<cfset addressContainerHeight = attributes.addressContainerHeight>
	
	<cfparam name="attributes.addressContainerWidth" default="450">
	<cfset addressContainerWidth = attributes.addressContainerWidth>	

				
								
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="EntityID"
		fieldnames="Entity ID"
		datatypes="numeric">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Include the file that WDDX needs to do it's job. Taken from the CFIDE folder.  --->
<!--------------------------------------------------------------------------------------> 		
	<cfoutput>		
		
		<script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>		
		
		<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
	    <cfelse>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
	    </cfif>
		
	</cfoutput>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Queries needed for this page to work.                                          --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates">				


	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<script language="JavaScript">
			
			function buildAddressTable(clientID, entityID){					
				var result = null;	
				var inputPage = "";			
				xml = getAddress(clientID, entityID);					
				if (xml != null) {		
							
					if (window.ActiveXObject){
						var doc=new ActiveXObject("Microsoft.XMLDOM");
					  	doc.async="false";
					  	doc.loadXML(xml);
					}				
					var x=doc.documentElement;																		    
					
					#trim(addressContainer)#AddressesElementListLIOL_ol.innerHTML = "";
					
					for(var a = 0; a < x.getElementsByTagName("ADDRESS").length; a++){			
					
						for(var b = 0; b < x.getElementsByTagName("ADDRESS")[a].childNodes.length; b++){		
							if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ACTIVE"){
								var thisActive = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSID"){
								var thisAddressID = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSLINE1"){
								var thisAddressLine1 = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSLINE2"){
								var thisAddressLine2 = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
								if(thisAddressLine2 == '@@'){
									thisAddressLine2 = '';
								};
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSTYPE"){
								var thisAddressType = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSTYPEID"){
								var thisAddressTypeID = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "CITY"){
								var thisCity = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ISDEFAULT"){
								var thisIsDefault = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "STATEABBR"){
								var thisStateAbbr = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "STATEFULL"){
								var thisStateFull = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "STATEID"){
								var thisStateID = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ZIPCODE"){
								var thisZipCode = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ATTENTION"){
								var thisAttention = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
								if(thisAttention == '@@'){
									thisAttention = '';
								};
							}
						};				
																
						var currentRow = eval(a + 1); 
						var rowColor = "000000";
						if(thisIsDefault == 1){
							rowColor = "FF0000";
						};		
						//alert(thisActive + " : " + thisAddressID + " : " + thisAddressLine1 + " : " + thisAddressLine2 + " : " + thisAddressType + " : " + thisAddressTypeID + " : " + thisCity + " : " + thisIsDefault + " : " + thisStateAbbr + " : " + thisStateFull + " : " + thisStateID + " : " + thisZipCode);
						inputPage = inputPage + '<li id="#trim(addressContainer)#AddressesElementListLIOL_li" onmouseover="this.style.backgroundColor=\'DCE3EB\';" onmouseout="this.style.backgroundColor=\'FFFFFF\';" onclick="addressContainerOpenClose(' + thisAddressID + ', ' + '\'' + thisAttention + '\', \'' + thisAddressLine1 + '\', \'' + thisAddressLine2 + '\', ' + thisAddressTypeID + ', \'' + thisCity + '\', ' + thisStateID + ', \'' + thisZipCode + '\', ' + thisActive + ', + ' + thisIsDefault + ')"><strong>' + currentRow + '.</strong><font color="' + rowColor + '">  ' + thisAddressLine1 + ' ' + thisAddressLine2 + ' ' + thisCity + ', ' + thisStateFull + ' ' + thisZipCode + '</font></li>';
					
					};
						
					#trim(addressContainer)#AddressesElementListLIOL_ol.innerHTML = inputPage;				
												
				};		
			};
					
			function getAddress(clientID, entityID){
				var data1 = clientID;
				var data2 = entityID;
				var url = "#trim(request.urlReconstructed)#/ws/wsEntity.cfc?method=wsGetEntityAddressesXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
				var packet = wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);						
				if (result != null) {					
					return result;
				};
				else{					
					return false;
				}	
				
			};		
			
			function editAddressSubmitFunc(){
				
				if(checkInputElementsAddress() == false){
					return false
				};						
				
				div_errorMsgP_#trim(addressContainer)#.style.display = 'none';
				var data1 = #trim(session.clientID)#;
				var data2 = document.getElementById('addressID').value;
				var isDefaultChecked = 0;
				if(document.getElementById('isDefault').checked == true){
					isDefaultChecked = 1;
				};
				var data3 = document.getElementById('AddressTypeID').value + '|' + document.getElementById('AddressLine1').value + '|' + document.getElementById('AddressLine2').value + '|' + document.getElementById('City').value + '|' + document.getElementById('StateID').value + '|' + document.getElementById('ZipCode').value + '|' + document.getElementById('active').value + '|' + document.getElementById('attention').value + '|' + isDefaultChecked + '|' + #trim(entityID)#;		
				if(document.getElementById('addressID').value == 0){
					var WSFUNCTION = "wsAddressC";
				}
				else{
					var WSFUNCTION = "wsAddressU";
				};
				
				var url = "#trim(request.urlReconstructed)#/ws/wsAddress.cfc?method=" + WSFUNCTION + "&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&Data3=" + escape(data3) + "&" + escape(randNum_JS());				 
				var packet = wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);						
				if (result != null) {					
					addressContainerOpenClose('', '', '', '', '', '', '', '', '');
					span_updated.style.display = 'inline';
					setTimeout('buildAddressTable(#trim(session.clientID)#, #trim(entityID)#)', 0);  
					reloadMain();
					return result;
				};
				else{					
					return false;
				}	
						
			};
			
			function checkInputElementsAddress(){
				if(document.getElementById('AddressLine1').value == ""){
					msg = "You must provide address line 1.";
					sp_errorMsgP_#trim(addressContainer)#.innerHTML = msg;
					div_errorMsgP_#trim(addressContainer)#.style.display = 'inline';
					return false;						
				};
				if(document.getElementById('City').value == ""){
					msg = "You must provide a City.";
					sp_errorMsgP_#trim(addressContainer)#.innerHTML = msg;
					div_errorMsgP_#trim(addressContainer)#.style.display = 'inline';
					return false;						
				};
				if(document.getElementById('StateID').value == ""){
					msg = "You must select a state.";
					sp_errorMsgP_#trim(addressContainer)#.innerHTML = msg;
					div_errorMsgP_#trim(addressContainer)#.style.display = 'inline';
					return false;						
				};
				if(document.getElementById('ZipCode').value == ""){
					msg = "You must provide a zip code.";
					sp_errorMsgP_#trim(addressContainer)#.innerHTML = msg;
					div_errorMsgP_#trim(addressContainer)#.style.display = 'inline';
					return false;						
				};
				return true;
			};		
			
			function addressContainerOpenClose(ADDRESSID, ATTENTION, ADDRESSLINE1, ADDRESSLINE2, ADDRESSTYPEID, CITY, STATEID, ZIPCODE, ACTIVE, ISDEFAULT){				
				domStyle = document.getElementById('#trim(addressContainer)#').style;				
				if(domStyle.top != "0px"){				
					editAddressInput(ADDRESSID, ATTENTION, ADDRESSLINE1, ADDRESSLINE2, ADDRESSTYPEID, CITY, STATEID, ZIPCODE, ACTIVE, ISDEFAULT);					
				}
				else{
					#trim(addressContainer)#.innerHTML = "";
					if(document.getElementById("sp_errorMsgPSearch")){sp_errorMsgPSearch.innerHTML = "";};					
				}
				//alert(getElementWidth(elementID) + ' : ' + getElementHeight(elementID));		
				mainOpenClose('#trim(addressContainer)#', #trim(addressContainerHeight)#, #trim(addressContainerWidth)#, 50, 0);
			};
			
			function editAddressInput(ADDRESSID, ATTENTION, ADDRESSLINE1, ADDRESSLINE2, ADDRESSTYPEID, CITY, STATEID, ZIPCODE, ACTIVE, ISDEFAULT){				
					inputPage = "";
					inputPage = inputPage + '<ul id="#trim(addressContainer)#HeaderTitle">';
					inputPage = inputPage + '	<li id="#trim(addressContainer)#Title">Edit Address</li>';
					inputPage = inputPage + '	<li id="#trim(addressContainer)#CloseImage"><img src="images/hd_btn_close.gif" onclick="addressContainerOpenClose(1);"></li>';
					inputPage = inputPage + '</ul>';		
					inputPage = inputPage + '<DIV id="div_errorMsgP_#trim(addressContainer)#" class="mediumInput">';
					inputPage = inputPage + '	<ul style="list-style: none;">';
					inputPage = inputPage + '		<li style="float: left;"><img src="images/alert.gif" alt="Alert" border="0" align="middle"></li>';
					inputPage = inputPage + '		<li style="float: left;"><span id="sp_errorMsgP_#trim(addressContainer)#"></span></li>';
					inputPage = inputPage + '	</ul>';					 
					inputPage = inputPage + '</DIV>';	
					inputPage = inputPage + '<DIV id="editableArea_#trim(addressContainer)#" class="editableArea_#trim(addressContainer)#">';
					inputPage = inputPage + '	<DIV id="inputForm_#trim(addressContainer)#" class="inputForm_#trim(addressContainer)#">';	
					inputPage = inputPage + '	<INPUT type="Hidden" name="addressID" value="' + ADDRESSID + '">';	
					inputPage = inputPage + '	<INPUT type="Hidden" name="active" value="' + ACTIVE + '">';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';	
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="addressType" class="siteLabel">Address&nbsp;Type:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li>';
					inputPage = inputPage + '						<select class="SiteSelectBox" name="AddressTypeID">';											
					<cfloop query="getAllAddressTypes">
					inputPage = inputPage + '							<option value="#StandardListItemID#"> #ItemNameDisplay#';
					</cfloop>
					inputPage = inputPage + '						</select>';
					inputPage = inputPage + '					</li>';					
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="attention" class="siteLabel">Attention:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li><INPUT class="siteTextBox" maxLength="30" name="attention" value="' + ATTENTION + '"></li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="AddressLine1" class="siteLabel">Address&nbsp;Line&nbsp;1:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li><INPUT class="SiteTextbox" name="AddressLine1" type="text" size="25" value="' + ADDRESSLINE1 + '"></li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="AddressLine2" class="siteLabel">Address&nbsp;Line&nbsp;2:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li><INPUT class="SiteTextbox" name="AddressLine2" type="text" size="25" value="' + ADDRESSLINE2 + '"></li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';	
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="City" class="siteLabel">City:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li><INPUT class="SiteTextbox" name="City" type="text" size="15" value="' + CITY + '"></li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';	
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="StateID" class="siteLabel">State:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li>';
					inputPage = inputPage + '						<select class="SiteSelectBox" name="StateID">';											
					<cfloop query="getAllStates">
					inputPage = inputPage + '							<option value="#StandardListItemID#" <cfif StandardListItemID EQ 12>SELECTED</cfif>> #ItemNameDisplay#';
					</cfloop>
					inputPage = inputPage + '						</select>';
					inputPage = inputPage + '					</li>';					
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';						
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="ZipCode" class="siteLabel">Zip Code:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li><INPUT class="SiteTextbox" name="ZipCode" type="text" size="15" value="' + ZIPCODE + '"></li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="IsDefault" class="siteLabel">Set as Default:&nbsp;</LABEL></li>';
					if(ISDEFAULT == 1){ 
					inputPage = inputPage + '					<li><INPUT class="checks" name="isDefault" type="checkbox" CHECKED></li>';
					}
					else{
					inputPage = inputPage + '					<li><INPUT class="checks" name="isDefault" type="checkbox"></li>';	
					}
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';											
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="inputButton_#trim(addressContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 85px; text-align: right;"></li>';				
					inputPage = inputPage + '					<li style="text-align: center;">';
					inputPage = inputPage + '						<input type="Button" name="submitButton" class="SiteSubmitBox" value="Save" onclick="editAddressSubmitFunc();">';
					inputPage = inputPage + '					</li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';																					
					inputPage = inputPage + '	</DIV>';
					inputPage = inputPage + '</div>';
					#trim(addressContainer)#.innerHTML = inputPage;	
					for(aa = 0; aa < document.getElementById('AddressTypeID').length; aa++){
						if(document.getElementById('AddressTypeID').options[aa].value == ADDRESSTYPEID){
							document.getElementById('AddressTypeID').options[aa].selected = true;	
							break;
						}
					}
					for(aa = 0; aa < document.getElementById('StateID').length; aa++){
						if(document.getElementById('StateID').options[aa].value == STATEID){
							document.getElementById('StateID').options[aa].selected = true;	
							break;
						}
					}
				};
			
		</script>	
		
	</cfoutput>
	

<!-------------------------------------------------------------------------------------->
<!--- Some styles for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<style type="text/css">	
			
			##div_errorMsgP_#trim(addressContainer)#{
				float: left;
				width: 100%;
				background-color: ffffcc; 
				display: none; 			
				border: 1px solid ccc889;		
				padding: 5px; 			
			}
			##sp_errorMsgP_#trim(addressContainer)#{			
				vertical-align: bottom; 	
				text-align: left;		
				font-weight: bold; 
				font-family: Arial, sans-serif; 
				font-size: x-small; 
				color: FF0000;
				padding: 0px 5px 0px 0px; 
				border: 0px black dashed;
			}
			div.mainContainer_#trim(addressContainer)#{
				top: -#trim(addressContainerHeight)#px; 
				z-index: 100; 
				position: absolute; 
				width: #trim(addressContainerWidth)#px; 
				height: #trim(addressContainerHeight)#px; 
				background: ##fff; 
				border-top: 0px solid ##c0c0c0;			
				border-right: 2px solid ##c0c0c0; 			
				border-bottom: 2px solid ##c0c0c0;		
				border-left: 2px solid ##c0c0c0; 				
			}
			.editableArea_#trim(addressContainer)#{			
				overflow: auto;
				width: #evaluate(addressContainerWidth - 5)#px; 
				height: #evaluate(addressContainerHeight - 5)#px; 
				border: 0px red dashed; 		
			}	
			.inputForm_#trim(addressContainer)#{
				float: left; 
				width: 350px; 			
				padding: 10px; 
				font-size: 11px; 
				color: ##666; 
				font-family: Arial,Helvetica,Sans-serif; 	
				margin-left: auto;
				margin-right: auto;
				border: 0px green dotted;
			}
			.inputForm_#trim(addressContainer)# .mediumInput{
				float: left; 
				margin-right: 1px;
				border: 0px black dashed;
			}
			.mediumInput_#trim(addressContainer)# INPUT{
				width: 155px;
			}
			.mediumInput_#trim(addressContainer)# INPUT.checks{
				width: 15px;
			}
			.inputForm_#trim(addressContainer)# .inputButton_#trim(addressContainer)#{
				float: left; 
				margin-right: 1px;
				border: 0px blue dashed;
			}		
			.inputButton_#trim(addressContainer)# BUTTON{
				width: 100px;			
			}		
			.smallInput_#trim(addressContainer)# INPUT{
				width: 35px;
			}
			###trim(addressContainer)#HeaderTitle{
				float: left;
				width: 100%; 
				margin: 0;
				padding: 0;
				list-style: none;
				background: ##CBD9E9; 					
			}
			###trim(addressContainer)#Title{
				float: left;
				margin: 0; 			
				padding: 5px 5px; 		
				font-weight: bold; 				
				font-family: Arial, sans-serif; 
				font-size: x-small; 
				text-align: left;			
			}	
			###trim(addressContainer)#CloseImage{
				float: right;
				margin: 0; 			
				padding: 5px 5px; 			
			}			
			div.#trim(addressContainer)#_AddressesElementContainer{		
				width: 425px; 
				background: ##fff; 
				border-top: 0px solid ##c0c0c0;			
				border-right: 1px solid ##c0c0c0; 			
				border-bottom: 1px solid ##c0c0c0;		
				border-left: 1px solid ##c0c0c0; 				
			}		
			###trim(addressContainer)#AddressesElementHeader{
				float: left;
				width: 100%; 
				margin: 0;
				padding: 0;
				list-style: none;
				background: ##CBD9E9; 					
			}
			###trim(addressContainer)#AddressesElementTitle{
				float: left;
				margin: 0; 			
				padding: 5px 5px; 		
				font-weight: bold; 				
				font-family: Arial, sans-serif; 
				font-size: x-small; 
				text-align: left;			
			}
			###trim(addressContainer)#AddressesElementTitleRight{
				float: right;
				margin: 0; 			
				padding: 5px 5px; 			
			}	
			.#trim(addressContainer)#AddressesElementList{			
				border: 0px red dashed; 		
			}	
			div.#trim(addressContainer)#AddressesElementListLIOL{						
				width: 100%; 
				padding: 0;
				align: left;					
				border: 0px blue dashed;		
			}				
			###trim(addressContainer)#AddressesElementListLIOL_ol{
				float: left;
				width: 100%; 
				margin: 0;
				padding: 10 0;
				list-style: none;
				border: 0px green dashed;					
			}
			###trim(addressContainer)#AddressesElementListLIOL_li{						
				padding: 5 10 5 10;							
				width: 100%; 
				border: 0px red dashed;
				cursor: pointer;		
			}
		</style>		
	
	</cfoutput>		
		


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
	
		<div id="#trim(addressContainer)#_AddressesElementContainer" name="#trim(addressContainer)#_AddressesElementContainer" class="#trim(addressContainer)#_AddressesElementContainer">
			<ul id="#trim(addressContainer)#AddressesElementHeader">
				<li id="#trim(addressContainer)#AddressesElementTitle">#trim(title)#</li>
				<li id="#trim(addressContainer)#AddressesElementTitleRight"><span class="med" style="cursor:hand;padding-top:0.0ex;" id="addAddress" onmouseover="highlight()" onmouseout="lolight()" onclick="addressContainerOpenClose(0, '', '', '', 13, '', 59, '', 0, 0)"><font color="FF0000"><u>Add Address</u></font></span></li>
			</ul>			
			<div id="#trim(addressContainer)#AddressesElementList" class="#trim(addressContainer)#AddressesElementList">
				<span id="span_updated" style="align: center; display: 'none'; font:13px; position:relative; color:990000;">&nbsp;&nbsp;Successful Update</span>
				<div id="#trim(addressContainer)#AddressesElementListLIOL" class="#trim(addressContainer)#AddressesElementListLIOL">	
					<ol id="#trim(addressContainer)#AddressesElementListLIOL_ol"></ol>		
				</div>
			</div>
		</div>		
		
		<div id="#trim(addressContainer)#" name="#trim(addressContainer)#" class="mainContainer_#trim(addressContainer)#"></div>				
	
		<script language="JavaScript">						
			buildAddressTable(#trim(session.clientID)#, #trim(entityID)#);			
		</script>			
	
	</cfoutput>	


