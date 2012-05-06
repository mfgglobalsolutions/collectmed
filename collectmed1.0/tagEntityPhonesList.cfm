
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="PhoneInformationList">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.EntityID" default="">
	<cfset EntityID = attributes.EntityID>
			
	<cfparam name="attributes.title" default="Phone Information">
	<cfset title = attributes.title>
	
	<cfif IsDefined("form.title") AND form.title NEQ "">
		<cfset title = form.title>
	<cfelseif IsDefined("url.title") AND url.title NEQ "">
		<cfset title = url.title>	
	</cfif>	
	
	<cfparam name="attributes.bgcolor" default="DCE3EB">
	<cfset bgcolor = attributes.bgcolor>
	
	<cfparam name="attributes.PhoneContainer" default="PhoneEditContainer">
	<cfset PhoneContainer = attributes.PhoneContainer>
	
	<cfparam name="attributes.PhoneContainerHeight" default="400">
	<cfset PhoneContainerHeight = attributes.PhoneContainerHeight>
	
	<cfparam name="attributes.PhoneContainerWidth" default="450">
	<cfset PhoneContainerWidth = attributes.PhoneContainerWidth>	

				
								
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
	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="7" active="1" returnvariable="getAllPhoneTypes">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<script language="JavaScript">
			
			function buildPhoneTable(clientID, entityID){					
				var result = null;	
				var inputPage = "";			
				xml = getPhone(clientID, entityID);					
				if (xml != null) {		
							
					if (window.ActiveXObject){
						var doc=new ActiveXObject("Microsoft.XMLDOM");
					  	doc.async="false";
					  	doc.loadXML(xml);
					}				
					var x=doc.documentElement;																		    
					
					#trim(PhoneContainer)#PhonesElementListLIOL_ol.innerHTML = "";
					
					for(var a = 0; a < x.getElementsByTagName("PHONE").length; a++){			
					
						for(var b = 0; b < x.getElementsByTagName("PHONE")[a].childNodes.length; b++){		
							if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "ACTIVE"){
								var thisActive = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONEID"){
								var thisPhoneID = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONENUMBER"){
								var thisPhoneNumber = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONEEXTENSION"){
								var thisPhoneExtension = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
								if(thisPhoneExtension == '@@'){
									thisPhoneExtension = '';
								};
							}
							else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONETYPE"){
								var thisPhoneType = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
							}
							else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONETYPEID"){
								var thisPhoneTypeID = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
							}							
							else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "ISDEFAULT"){
								var thisIsDefault = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
							}							
						};				
																
						var currentRow = eval(a + 1); 
						var rowColor = "000000";
						if(thisIsDefault == 1){
							rowColor = "FF0000";
						};		
						//alert(thisActive + " : " + thisPhoneID + " : " + thisPhoneNumber + " : " + thisPhoneExtension + " : " + thisPhoneType + " : " + thisPhoneTypeID + " : " + thisCity + " : " + thisIsDefault + " : " + thisStateAbbr + " : " + thisStateFull + " : " + thisStateID + " : " + thisZipCode);
						var thisPhoneExt = "";
						if(thisPhoneExtension != ""){
							thisPhoneExt = '  Ext: ' + thisPhoneExtension; 
						};
						inputPage = inputPage + '<li id="#trim(PhoneContainer)#PhonesElementListLIOL_li" onmouseover="this.style.backgroundColor=\'DCE3EB\';" onmouseout="this.style.backgroundColor=\'FFFFFF\';" onclick="PhoneContainerOpenClose(' + thisPhoneID + ', \'' + thisPhoneNumber + '\', \'' + thisPhoneExtension + '\', ' + thisPhoneTypeID + ', ' + thisActive + ',' + thisIsDefault + ')"><strong>' + currentRow + '.</strong><font color="' + rowColor + '">  ' + formatPhoneUSNoExt_JS(thisPhoneNumber) + thisPhoneExt + '</font></li>';
					};
						
					#trim(PhoneContainer)#PhonesElementListLIOL_ol.innerHTML = inputPage;				
												
				};		
			};
					
			function getPhone(clientID, entityID){
				var data1 = clientID;
				var data2 = entityID;
				var url = "#trim(request.urlReconstructed)#/ws/wsEntity.cfc?method=wsGetEntityPhonesXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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
			
			function editPhoneSubmitFunc(){
				
				if(checkInputElementsPhone() == false){
					return false
				};						
				
				div_errorMsgP_#trim(PhoneContainer)#.style.display = 'none';
				var data1 = #trim(session.clientID)#;
				var data2 = document.getElementById('PhoneID').value;
				var isDefaultChecked = 0;
				if(document.getElementById('isDefault').checked == true){
					isDefaultChecked = 1;
				};
				var data3 = document.getElementById('PhoneTypeID').value + '|' + document.getElementById('PhoneNumber').value + '|' + document.getElementById('PhoneExtension').value + '|' + document.getElementById('active').value + '|' + isDefaultChecked + '|' + #trim(entityID)#;		
				if(document.getElementById('PhoneID').value == 0){
					var WSFUNCTION = "wsPhoneC";
				}
				else{
					var WSFUNCTION = "wsPhoneU";
				};
				
				var url = "#trim(request.urlReconstructed)#/ws/wsPhone.cfc?method=" + WSFUNCTION + "&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&Data3=" + escape(data3) + "&" + escape(randNum_JS());				 
				var packet = wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);						
				if (result != null) {					
					PhoneContainerOpenClose('', '', '', '', '', '');
					span_updated#trim(PhoneContainer)#.style.display = 'inline';
					setTimeout('buildPhoneTable(#trim(session.clientID)#, #trim(entityID)#)', 0);  
					reloadMain();
					return result;
				};
				else{					
					return false;
				}	
						
			};
			
			function checkInputElementsPhone(){
				if(document.getElementById('PhoneNumber').value == ""){
					msg = "You must provide Phone Number.";
					sp_errorMsgP_#trim(PhoneContainer)#.innerHTML = msg;
					div_errorMsgP_#trim(PhoneContainer)#.style.display = 'inline';
					return false;						
				};				
				return true;
			};		
			
			function PhoneContainerOpenClose(PhoneID, PhoneNumber, PhoneExtension, PhoneTYPEID, ACTIVE, ISDEFAULT){				
				domStyle = document.getElementById('#trim(PhoneContainer)#').style;				
				if(domStyle.top != "0px"){				
					editPhoneInput(PhoneID, PhoneNumber, PhoneExtension, PhoneTYPEID, ACTIVE, ISDEFAULT);					
				}
				else{
					#trim(PhoneContainer)#.innerHTML = "";
					if(document.getElementById("sp_errorMsgPSearch")){sp_errorMsgPSearch.innerHTML = "";};					
				}
				//alert(getElementWidth(elementID) + ' : ' + getElementHeight(elementID));		
				mainOpenClose('#trim(PhoneContainer)#', #trim(PhoneContainerHeight)#, #trim(PhoneContainerWidth)#, 50, 0);
			};
			
			function editPhoneInput(PhoneID, PhoneNumber, PhoneExtension, PhoneTYPEID, ACTIVE, ISDEFAULT){				
					inputPage = "";
					inputPage = inputPage + '<ul id="#trim(PhoneContainer)#HeaderTitle">';
					inputPage = inputPage + '	<li id="#trim(PhoneContainer)#Title">Edit Phone</li>';
					inputPage = inputPage + '	<li id="#trim(PhoneContainer)#CloseImage"><img src="images/hd_btn_close.gif" onclick="PhoneContainerOpenClose(1);"></li>';
					inputPage = inputPage + '</ul>';		
					inputPage = inputPage + '<DIV id="div_errorMsgP_#trim(PhoneContainer)#" class="mediumInput">';
					inputPage = inputPage + '	<ul style="list-style: none;">';
					inputPage = inputPage + '		<li style="float: left;"><img src="images/alert.gif" alt="Alert" border="0" align="middle"></li>';
					inputPage = inputPage + '		<li style="float: left;"><span id="sp_errorMsgP_#trim(PhoneContainer)#"></span></li>';
					inputPage = inputPage + '	</ul>';					 
					inputPage = inputPage + '</DIV>';	
					inputPage = inputPage + '<DIV id="editableArea_#trim(PhoneContainer)#" class="editableArea_#trim(PhoneContainer)#">';
					inputPage = inputPage + '	<DIV id="inputForm_#trim(PhoneContainer)#" class="inputForm_#trim(PhoneContainer)#">';	
					inputPage = inputPage + '	<INPUT type="Hidden" name="PhoneID" value="' + PhoneID + '">';	
					inputPage = inputPage + '	<INPUT type="Hidden" name="active" value="' + ACTIVE + '">';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(PhoneContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';	
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="PhoneType" class="siteLabel">Phone&nbsp;Type:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li>';
					inputPage = inputPage + '						<select class="SiteSelectBox" name="PhoneTypeID">';											
					<cfloop query="getAllPhoneTypes">
					inputPage = inputPage + '							<option value="#StandardListItemID#"> #ItemNameDisplay#';
					</cfloop>
					inputPage = inputPage + '						</select>';
					inputPage = inputPage + '					</li>';					
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(PhoneContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="PhoneNumber" class="siteLabel">Phone&nbsp;Number:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li><INPUT class="SiteTextbox" name="PhoneNumber" type="text" size="25" value="' + formatPhoneUSNoExt_JS(PhoneNumber) + '" onkeyup="this.value=formatPhoneUSNoExt_JS(this.value);"></li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(PhoneContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 90px; text-align: right;"><LABEL for="PhoneExtension" class="siteLabel">Phone&nbsp;Ext:&nbsp;</LABEL></li>';
					inputPage = inputPage + '					<li><INPUT class="SiteTextbox" name="PhoneExtension" type="text" size="25" value="' + PhoneExtension + '"></li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';					
					inputPage = inputPage + '		</DIV>';
					inputPage = inputPage + '		<DIV>';
					inputPage = inputPage + '			<DIV class="mediumInput_#trim(PhoneContainer)#">';
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
					inputPage = inputPage + '			<DIV class="inputButton_#trim(PhoneContainer)#">';
					inputPage = inputPage + '				<ol style="list-style: none;">';
					inputPage = inputPage + '					<li style="float: left; width: 85px; text-align: right;"></li>';				
					inputPage = inputPage + '					<li style="text-align: center;">';
					inputPage = inputPage + '						<input type="Button" name="submitButton" class="SiteSubmitBox" value="Save" onclick="editPhoneSubmitFunc();">';
					inputPage = inputPage + '					</li>';
					inputPage = inputPage + '				</ol>';					 
					inputPage = inputPage + '			</DIV>';				
					inputPage = inputPage + '		</DIV>';																					
					inputPage = inputPage + '	</DIV>';
					inputPage = inputPage + '</div>';
					#trim(PhoneContainer)#.innerHTML = inputPage;	
					for(aa = 0; aa < document.getElementById('PhoneTypeID').length; aa++){
						if(document.getElementById('PhoneTypeID').options[aa].value == PhoneTYPEID){
							document.getElementById('PhoneTypeID').options[aa].selected = true;	
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
			
			##div_errorMsgP_#trim(PhoneContainer)#{
				float: left;
				width: 100%;
				background-color: ffffcc; 
				display: none; 			
				border: 1px solid ccc889;		
				padding: 5px; 			
			}
			##sp_errorMsgP_#trim(PhoneContainer)#{			
				vertical-align: bottom; 	
				text-align: left;		
				font-weight: bold; 
				font-family: Arial, sans-serif; 
				font-size: x-small; 
				color: FF0000;
				padding: 0px 5px 0px 0px; 
				border: 0px black dashed;
			}
			div.mainContainer_#trim(PhoneContainer)#{
				top: -#trim(PhoneContainerHeight)#px; 
				z-index: 100; 
				position: absolute; 
				width: #trim(PhoneContainerWidth)#px; 
				height: #trim(PhoneContainerHeight)#px; 
				background: ##fff; 
				border-top: 0px solid ##c0c0c0;			
				border-right: 2px solid ##c0c0c0; 			
				border-bottom: 2px solid ##c0c0c0;		
				border-left: 2px solid ##c0c0c0; 				
			}
			.editableArea_#trim(PhoneContainer)#{			
				overflow: auto;
				width: #evaluate(PhoneContainerWidth - 5)#px; 
				height: #evaluate(PhoneContainerHeight - 5)#px; 
				border: 0px red dashed; 		
			}	
			.inputForm_#trim(PhoneContainer)#{
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
			.inputForm_#trim(PhoneContainer)# .mediumInput{
				float: left; 
				margin-right: 1px;
				border: 0px black dashed;
			}
			.mediumInput_#trim(PhoneContainer)# INPUT{
				width: 155px;
			}
			.mediumInput_#trim(PhoneContainer)# INPUT.checks{
				width: 15px;
			}
			.inputForm_#trim(PhoneContainer)# .inputButton_#trim(PhoneContainer)#{
				float: left; 
				margin-right: 1px;
				border: 0px blue dashed;
			}		
			.inputButton_#trim(PhoneContainer)# BUTTON{
				width: 100px;			
			}		
			.smallInput_#trim(PhoneContainer)# INPUT{
				width: 35px;
			}
			###trim(PhoneContainer)#HeaderTitle{
				float: left;
				width: 100%; 
				margin: 0;
				padding: 0;
				list-style: none;
				background: ##CBD9E9; 					
			}
			###trim(PhoneContainer)#Title{
				float: left;
				margin: 0; 			
				padding: 5px 5px; 		
				font-weight: bold; 				
				font-family: Arial, sans-serif; 
				font-size: x-small; 
				text-align: left;			
			}	
			###trim(PhoneContainer)#CloseImage{
				float: right;
				margin: 0; 			
				padding: 5px 5px; 			
			}			
			div.#trim(PhoneContainer)#_PhonesElementContainer{		
				width: 425px; 
				background: ##fff; 
				border-top: 0px solid ##c0c0c0;			
				border-right: 1px solid ##c0c0c0; 			
				border-bottom: 1px solid ##c0c0c0;		
				border-left: 1px solid ##c0c0c0; 				
			}		
			###trim(PhoneContainer)#PhonesElementHeader{
				float: left;
				width: 100%; 
				margin: 0;
				padding: 0;
				list-style: none;
				background: ##CBD9E9; 					
			}
			###trim(PhoneContainer)#PhonesElementTitle{
				float: left;
				margin: 0; 			
				padding: 5px 5px; 		
				font-weight: bold; 				
				font-family: Arial, sans-serif; 
				font-size: x-small; 
				text-align: left;			
			}
			###trim(PhoneContainer)#PhonesElementTitleRight{
				float: right;
				margin: 0; 			
				padding: 5px 5px; 			
			}	
			.#trim(PhoneContainer)#PhonesElementList{			
				border: 0px red dashed; 		
			}	
			div.#trim(PhoneContainer)#PhonesElementListLIOL{						
				width: 100%; 
				padding: 0;
				align: left;					
				border: 0px blue dashed;		
			}				
			###trim(PhoneContainer)#PhonesElementListLIOL_ol{
				float: left;
				width: 100%; 
				margin: 0;
				padding: 10 0;
				list-style: none;
				border: 0px green dashed;					
			}
			###trim(PhoneContainer)#PhonesElementListLIOL_li{						
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
	
		<div id="#trim(PhoneContainer)#_PhonesElementContainer" name="#trim(PhoneContainer)#_PhonesElementContainer" class="#trim(PhoneContainer)#_PhonesElementContainer">
			<ul id="#trim(PhoneContainer)#PhonesElementHeader">
				<li id="#trim(PhoneContainer)#PhonesElementTitle">#trim(title)#</li>
				<li id="#trim(PhoneContainer)#PhonesElementTitleRight"><span class="med" style="cursor:hand;padding-top:0.0ex;" id="addPhone" onmouseover="highlight()" onmouseout="lolight()" onclick="PhoneContainerOpenClose(0, '', '', '', 13, 0, 0)"><font color="FF0000"><u>Add Phone</u></font></span></li>
			</ul>			
			<div id="#trim(PhoneContainer)#PhonesElementList" class="#trim(PhoneContainer)#PhonesElementList">
				<span id="span_updated#trim(PhoneContainer)#" style="align: center; display: 'none'; font:13px; position:relative; color:990000;">&nbsp;&nbsp;Successful Update</span>
				<div id="#trim(PhoneContainer)#PhonesElementListLIOL" class="#trim(PhoneContainer)#PhonesElementListLIOL">	
					<ol id="#trim(PhoneContainer)#PhonesElementListLIOL_ol"></ol>		
				</div>
			</div>
		</div>		
		
		<div id="#trim(PhoneContainer)#" name="#trim(PhoneContainer)#" class="mainContainer_#trim(PhoneContainer)#"></div>				
	
		<script language="JavaScript">						
			buildPhoneTable(#trim(session.clientID)#, #trim(entityID)#);			
		</script>			
	
	</cfoutput>	


