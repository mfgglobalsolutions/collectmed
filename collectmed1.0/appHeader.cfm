
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.headerMenuBGColor" default="003399">
	<cfset headerMenuBGColor = attributes.headerMenuBGColor>	
	
	<cfparam name="attributes.headerSubMenuBGColor" default="65BCFF">
	<cfset headerSubMenuBGColor = attributes.headerSubMenuBGColor>	
	
	<cfparam name="session.hlink" default="1">
		
	<cfif IsDefined("form.hlink") AND form.hlink NEQ "">
		<cfset session.hlink = form.hlink>
	<cfelseif IsDefined("url.hlink") AND url.hlink NEQ "">
		<cfset session.hlink = url.hlink>	
	</cfif>
		
	<cfparam name="session.hslink" default="0">
	
	<cfif IsDefined("form.hslink") AND form.hslink NEQ "">
		<cfset session.hslink = form.hslink>
	<cfelseif IsDefined("url.hslink") AND url.hslink NEQ "">
		<cfset session.hslink = url.hslink>	
	</cfif>
	
	
	
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
<!--- Scripts needed for this page to run the IM Chat.                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language=JavaScript>
			
			// Utility function to fetch text from a URL
		    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
		    function _wddxSelectListGetFromURL(strURL) {
		        var objHTTP, result;
		    
		        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
		        if (window.XMLHttpRequest) {
		          objHTTP=new XMLHttpRequest();
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		    
		        // For IE browsers under Windows    
		        } else if (window.ActiveXObject) {
		          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		        }
		  
		        // Return result
		        return result;
		    }	
			
			
			function getUserCurrentLoginModifiedTime(data1, data2){						
								
				var url = "#trim(request.urlReconstructed)#/ws/wsUser.cfc?method=wsUserCurrentLoginModifiedTime&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {						
					if(result != "false"){						
						
						var minutesDiff = 0;
						var difference = 0;
						var today = new Date();
						var ModifiedDate = new Date();
						
						ModifiedDate.setTime(Date.parse(result));
						difference = today - ModifiedDate;
						minutesDiff = Math.round(difference/(1000*60));
						if(minutesDiff >= <cfif ListFindNoCase("dev,sta", request.cfservername)>200<cfelse>40</cfif>){
							alert("Your Online Aura Gate session has been timed out.\n\nAs a security precaution, sessions are ended after 40 minutes of inactivity.\n\nYou can sign in again to resume working online.\n\n" + result + "\n CODE:" + minutesDiff + "\n" + today + "-" + ModifiedDate); /* */
							window.location = 'appSiteLogout.cfm';
						}

					}
					else {window.status='An error occured while retreiving last login date modified.';}	
				}
				else{						
					window.status='An error occured while retreiving last login date modified.';				
					return false;
				}	
			};
			
				  			
			
			function getIMChat(data1, data2){						
								
				var url = "#trim(request.urlReconstructed)#/ws/wsIMChat.cfc?method=wsIMChat&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {						
					if(result != "false"){
						if(document.getElementById('currentLength').value != result.length){
							mainOpen('POLYchat', 280, 195);
							document.getElementById('currentLength').value = result.length;
							IMChatVerbage.innerHTML = result;	
							window.status='';											
						}
					}
					else {window.status='No messages';}	
				}
				else{						
					window.status='An error occured while retreiving your messages.';				
					return false;
				}	
			};		
			
			
			function addIMChatEntry(data1, data2, data3, data4){						
				if(data3 != ""){
					
					if(cleanNumericStringJS(data4) != "")
						var url = "#trim(request.urlReconstructed)#/ws/wsIMChat.cfc?method=wsIMChatAddEntry&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&Data3=" + escape(data3) + "&Data4=" + escape(data4) + "&" + escape(randNum_JS());				 
					else{
						var url = "#trim(request.urlReconstructed)#/ws/wsIMChat.cfc?method=wsIMChatAddEntry&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&Data3=" + escape(data3) + "&" + escape(randNum_JS());
					};
					
					var packet = _wddxSelectListGetFromURL(url);												
					var wddxDes = new WddxDeserializer;				
					var result = wddxDes.deserialize(packet);				
					
					if (result != null) {	
						if(result != "true"){
							mainOpen('POLYchat', 280, 195);
							IMChatVerbage.innerHTML = result;	
						}					
						return result;
					}
					else{					
						return false;
					}	
				};	
			};			
				
			var slideDelay = 0;
			var domStyle = null;
			            
			function mainOpen(POLYchat, h, w){    
				domStyle = document.getElementById(POLYchat).style;				
				//alert(h + " : " + w);
				if(domStyle.top != "0px"){				
					fX = 0; cX = -h; 		
					slideMenu(cX,fX);
					if(document.getElementById('entryBox')){				
						document.getElementById('entryBox').focus();
					}	
				}	    
			}
			
			function mainClose(POLYchat, h, w){
				//alert(h + " : " + w);
				fX = -h; cX = 0;
			    slideMenu(cX,fX);			 
			}
			
			function slideMenu(cX,fX){
			    if (cX != fX){
			        if (navigator.appName == "Microsoft Internet Explorer"){
			        	if (cX > fX){
			            	cX -= 20;// speed of the dropdown.
			            }else{
			            	cX += 20;
			            }          
			        }
			        domStyle.top = cX;
			     //   alert("cx: " + cX + " - domStyle.top: " + top);
					setTimeout('slideMenu(' + cX + ',' + fX + ')', slideDelay);  
				}
			    return;
			}
								
		</script>	
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Scripts needed for this page to run the IM Chat.                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<cfif IsDefined("session.User") AND IsDefined("session.ClientID") AND IsNumeric(session.ClientID)>
			<script language=JavaScript>	
				function sendNote(){
					addIMChatEntry(#trim(session.ClientID)#, #trim(session.User.getUsersID())#, document.getElementById('entryBox').value, document.all.availableUsers.options[document.all.availableUsers.selectedIndex].value);
					document.getElementById('entryBox').value = '';
					document.all.availableUsers.options[0].selected = true; 
					document.getElementById('entryBox').focus();
				};					
				
				function exitChat(data1, data2){						
					if (confirm("Are you sure you want to exit this chat session?")){ 			
						var url = "#trim(request.urlReconstructed)#/ws/wsIMChat.cfc?method=wsExitChat&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
						var packet = _wddxSelectListGetFromURL(url);												
						var wddxDes = new WddxDeserializer;				
						var result = wddxDes.deserialize(packet);				
						
						if (result != null) {						
							mainClose('POLYchat', 280, 195);
							IMChatVerbage.innerHTML = "";						
							return result;					
						}
						else{						
							return false;
						};
					};		
				};				
			</script>	
		</cfif>
	</cfoutput>


	
<!-------------------------------------------------------------------------------------->
<!--- Needed CSS for this page.                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<style type="text/css">
		<!--
			div.scroll {
				height: 195px;	
				width: 100%;	
				overflow: auto;	
				border: 1px solid ##FFFFFF;
				background-color: ##ffffff;	
				padding: 0px;
			}
		-->
		</style>
	</cfoutput>
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create queries for the links                                                   --->
<!-------------------------------------------------------------------------------------->			
	<cfset qHeaderMenu = querynew("href, title")>
	<cfset qHeaderSubMenu = querynew("href, title, headerID")>


<!-------------------------------------------------------------------------------------->
<!--- Start header menu                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfif NOT IsDefined("session.User") AND NOT FindNoCase("secure.", trim(CGI.SERVER_NAME))>
		<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "http://www.eobmanager.net", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "Home", qHeaderMenu.getRowcount())>
	</cfif>

<!-------------------------------------------------------------------------------------->
<!--- Links for all                                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("session.User")>
	
		<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "appMyDesktop.cfm?hlink=#trim(qHeaderMenu.getRowcount())#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "My&nbsp;Desktop", qHeaderMenu.getRowcount())>
		
		<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appMyDesktop.cfm?view=claims&hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Claims", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
		
		<cfif ListContains(session.User.getRoleIDs(), "8") or ListContains(session.User.getRoleIDs(), "7")>		
			
			<!---<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "POLYchat", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "POLYchat", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>--->
					
			<!---<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appReportMain.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Reports", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>--->
				
			<!---<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appClaimManage.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Claims", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>--->
		
			<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appPatientSearch.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Patients", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
					
		
			<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appVerifications.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Verifications", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
			
			<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appRoutes.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Routes", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>								
		
		</cfif>	
		
		<cfif IsDefined("session.User") AND (ListContains(session.User.getRoleIDs(), "1") OR ListContains(session.User.getRoleIDs(), "8"))>	
			<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appFileManage.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Files", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
		</cfif>
		
		<!---<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "POLYchat", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "POLYchat", qHeaderMenu.getRowcount())>--->
		
	</cfif>

	<cfif IsDefined("session.User") AND (ListContains(session.User.getRoleIDs(), "1") OR ListContains(session.User.getRoleIDs(), "8"))>	
			
		<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "appAdminSiteAdministration.cfm?hlink=#trim(qHeaderMenu.getRowcount())#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "Administrator", qHeaderMenu.getRowcount())>	
	
	
		<cfif IsDefined("session.User") AND FindNoCase("secure.", trim(CGI.SERVER_NAME)) AND session.Client.getClientID() EQ 1084 AND (session.User.getusersID() EQ 55 OR session.User.getusersID() EQ 100130)>
			<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appCreateAccount.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Client Setup", qHeaderSubMenu.getRowcount())>
			<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
		</cfif>
		
	</cfif>
	
	
	<!--- Admin Settings --->	
	<cfif IsDefined("session.User") AND ListContains(session.User.getRoleIDs(), "1")>		
		<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appAdminSettings.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Settings", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>	
	</cfif>
	
	<cfif IsDefined("session.User") AND ListContains(session.User.getRoleIDs(), "8")>	
		<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appAdminClientAdministration.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Company", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
	</cfif>	
		
	<!---
	<cfif IsDefined("session.User") AND ListContains(session.User.getRoleIDs(), "8")>
		<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appAdminClientSettings.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Settings", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
	</cfif>--->
	
	<cfif IsDefined("session.User") AND ListContains(session.User.getRoleIDs(), "8")>				
		<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appAdminUsers.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Users", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
	</cfif>
	
	<cfif IsDefined("session.User") AND ListContains(session.User.getRoleIDs(), "8")>			
		<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appAdminWorkGroupsManage.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Work&nbsp;Groups", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>
	</cfif>		
	
	
	
	
	<cfif IsDefined("session.User")>
		
		<!---<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "appFormPatientIntakeForm.cfm?hlink=#trim(qHeaderMenu.getRowcount())#", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "Patient Intake", qHeaderMenu.getRowcount())>--->
		
		<!---<cfset newRow = QueryAddRow(qHeaderSubMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "href", "appPatientIntakeSearch.cfm?hlink=#qHeaderMenu.getRowcount()#&hslink=#qHeaderSubMenu.getRowcount()#", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "title", "Search&nbsp;Intakes", qHeaderSubMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderSubMenu, "headerID", qHeaderMenu.getRowcount(), qHeaderSubMenu.getRowcount())>--->
		
	</cfif>

	<cfif NOT IsDefined("session.User") AND NOT FindNoCase("secure.", trim(CGI.SERVER_NAME))>
		
		<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "appContactUs.cfm?hlink=#trim(qHeaderMenu.getRowcount())#", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "Contact Us", qHeaderMenu.getRowcount())>
		
		<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "appHelp.cfm?hlink=#trim(qHeaderMenu.getRowcount())#", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "Help", qHeaderMenu.getRowcount())>
	
	</cfif>


<!-------------------------------------------------------------------------------------->
<!--- Start the sub header menu                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("session.User")>
		
		<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "appSiteLogout.cfm?hlink=#qHeaderMenu.getRowcount()#", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "Logout", qHeaderMenu.getRowcount())>
	
	<cfelseif NOT IsDefined("session.User") AND request.PageName NEQ "appSiteLogin.cfm"> <!--- AND trim(request.Page.getLeftNavigation()) NEQ "Y" --->	
	
		<cfset newRow = QueryAddRow(qHeaderMenu, 1)>
		
		<cfset temp = QuerySetCell(qHeaderMenu, "href", "#trim(request.urlProtocol)##trim(request.urlHost)#.#trim(request.urlDomain)#.#trim(request.urlHighLevelDomain)#/appSiteLogin.cfm?hlink=#qHeaderMenu.getRowcount()#", qHeaderMenu.getRowcount())>
		<cfset temp = QuerySetCell(qHeaderMenu, "title", "Login", qHeaderMenu.getRowcount())>
		
	</cfif>

	
	<cfoutput>
		
		<style>		
	
			body{ 
				font-family:arial, helvetica, sans-serif;
				background-color:transparent;
				color:##000000;
				margin:0px;
				padding:0px;
			} 
			
			div.masthead{
				font-family:Verdana, Geneva, Arial, Helvetica, sans-serif;
			}
			
			td.nav1{
				background:###headerMenuBGColor#; /*737373*/
			}
			
			a.nav1, a.nav1-lit, a.nav1-over, a.nav1-lit-over{
				background:###headerMenuBGColor#;
				padding:4px 14px 2px 14px;
				color:##ffffff;
				text-decoration:none;
				height:100%;
				font-size:70%;
				font-weight:bold;
			}
			
			a.nav1-lit, a.nav1-lit-over{
				background:###headerSubMenuBGColor#;
			}
			
			a.nav1:hover, a.nav1-lit:hover, a.nav1-over, a.nav1-lit-over{
				color:##cccccc ;
			}
			
			.nav-brdr2{
				background:###headerSubMenuBGColor#;
				padding:0px;
			}
			
			table.nav2{
				background:###headerSubMenuBGColor#;
			}
			
			a.nav2, a.nav2-lit, a.nav2-over , a.nav2-lit-over, a.nav2-left, a.nav2-left-over, a.nav2-left-lit, a.nav2-left-lit-over { 
				background:###headerSubMenuBGColor#;
				padding:1px 16px 2px 16px;
				color:##ffffff;
				text-decoration:none;
				height:100%;
				font-size:65%;
			}
			
			a.nav2-lit, a.nav2-left-lit, a.nav2-lit-over, a.nav2-left-lit-over{ background:##ffffff;color:##000000;}
			a.nav2-left, a.nav2-left-over { padding:1px 16px 2px 15px;}
			a.nav2-left-lit, a.nav2-left-lit-over { padding:1px 16px 4px 16px;}
			a.nav2-lit, a.nav2-lit-over { padding:1px 17px 2px 17px;}
			a.nav2:hover, a.nav2-over, a.nav2-left:hover, a.nav2-left-over { color:##000000;} /* f2b8b8 */
			a.nav2-lit:hover, a.nav2-lit-over { color:##0000ff;}
			a.nav2-left-lit:hover, a.nav2-left-lit-over { color:##0000ff;}
		
		</style>
		
	 	<cfif IsDefined("session.Entity")>
			<cfif NOT IsDefined("session.lastLogin")>	
				<cfset session.lastLogin = session.user.getUserLastLogin(session.User.getusersID())>		
			</cfif>
			<cfsavecontent variable="userinfo">
				<div class="xlg" style="margin: 0px; padding: 5px;"><strong>#session.Client.getClientName()#</strong><br>Logged in as - <strong>#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#</strong><div class=lg><!---Today is #DayofWeekAsString(DayOfWeek(NOW()))#, #DateFormat(NOW(), "mmmm d, yyyy")#---><cfif isDate(session.lastLogin)>Last signed in on #DateFormat(session.lastLogin, "mmm d, yyyy")# at #TimeFormat(session.lastLogin, "h:mm tt")# CST</cfif><br><span onclick=\"verifySealFooter();\" style=\"cursor: hand\" onmouseover=\"doTooltip(0, this, event, \'Session Secured with <strong>#trim(CGI.HTTPS_KEYSIZE)#</strong> Bit Encryption. <br><br>Click on the lock image to verify Collect Med&rsquo;s certificate. <br><br>Collect Med online application operates using the maximum level of encryption supported by your browser. Encryption is used to protect communications from eavesdropping, tampering, or message forgery over the Internet. It&rsquo;s a mathematical process that transforms a message so it&rsquo;s meaning is concealed from everyone except the intended recipient. Encryption technology is used in many online applications for such things as securely transmitting account information over the Internet.\');\" onmouseout=\"hideTip(this);\"><img border=\"0\" align=\"absmiddle\" src=\"/images/iconLock.gif\">&nbsp;This is a secure application</span></div></div>
	 			<!---<div class="xlg" style="margin: 0px; padding: 5px;"><strong>#session.Client.getClientName()#</strong> - Logged in as - <strong>#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#</strong><div class=lg>Today is #DayofWeekAsString(DayOfWeek(NOW()))#, #DateFormat(NOW(), "mmmm d, yyyy")#<cfif isDate(session.lastLogin)><br>Last signed in on #DateFormat(session.lastLogin, "mmmm d, yyyy")# at #TimeFormat(session.lastLogin, "h:mm tt")# CST</cfif><br><span onclick=\"verifySealFooter();\" style=\"cursor: hand\" onmouseover=\"doTooltip(0, this, event, \'Session Secured with <strong>#trim(CGI.HTTPS_KEYSIZE)#</strong> Bit Encryption. <br><br>Click on the lock image to verify Collect Med&rsquo;s certificate. <br><br>Collect Med online application operates using the maximum level of encryption supported by your browser. Encryption is used to protect communications from eavesdropping, tampering, or message forgery over the Internet. It&rsquo;s a mathematical process that transforms a message so it&rsquo;s meaning is concealed from everyone except the intended recipient. Encryption technology is used in many online applications for such things as securely transmitting account information over the Internet.\');\" onmouseout=\"hideTip(this);\"><img border=\"0\" align=\"absmiddle\" src=\"/images/iconLock.gif\">&nbsp;This is a secure application</span></div></div>--->
			</cfsavecontent>
		</cfif>
			
		<script language="JavaScript" type="text/javascript">
			
			<!---document.writeln('<table border=0 cellspacing=0 cellpadding=0 width=100%><tr bgcolor=ffffff><td><img src="images/EOBLogo2_GIF.gif" border="0" alt=""></td><cfif IsDefined("session.Entity")><td align="right" nowrap>#trim(userinfo)#</td></cfif></tr></table>');--->
			document.writeln('<table border=0 cellspacing=0 cellpadding=0 width=100%><tr bgcolor=ffffff><td><img src="images/CollectMedHeader.gif" border="0" alt=""></td><cfif IsDefined("session.Entity")><td align="right" nowrap>#trim(userinfo)#</td></cfif></tr></table>');
			
			function launchLoginPage(linkToGoTo){			
	
				<!-------------------------------------------------------------------------------------->
				<!--- Issue with multiple windows for login is right here. while this script will    --->
				<!--- work fine it opens another window while the is two other windows open. when    --->
				<!--- you get back to this script all windows should probably close and only the     --->
				<!--- login window stay open. Quasi fixed 3/1/06 GC                                  --->
				<!-------------------------------------------------------------------------------------->			
				
				var rand_no = Math.floor(Math.random()*101)
				var winName = 'loginwindow_' + rand_no;  			
				f_open_window_max(linkToGoTo, winName);
			};
			
			function f_open_window_max(aURL, aWinName){
			   var wOpen;
			   var sOptions;
			   		
			   sOptions = 'status=yes,hotkeys=no,menubar=no,scrollbars=yes,resizable=yes,toolbar=no';
			   sOptions = sOptions + ',width=' + (screen.availWidth - 10).toString();
			   sOptions = sOptions + ',height=' + (screen.availHeight - 122).toString();
			   sOptions = sOptions + ',screenX=0,screenY=0,left=0,top=0';
			
			   wOpen = window.open( '', aWinName, sOptions );
			   wOpen.location = aURL;
			   wOpen.focus();
			   wOpen.moveTo( 0, 0 );
			   wOpen.resizeTo( screen.availWidth, screen.availHeight );
			   return wOpen;
			}
			
			function hover(ref, classRef){ 
				eval(ref).className = classRef; //
			}
	
	   		var <cfwddx action="CFML2JS" input="#qHeaderMenu#" toplevelvariable="getHeaderMenu">
			var <cfwddx action="CFML2JS" input="#qHeaderSubMenu#" toplevelvariable="getHeaderSubMenu">
			var hlink = "#trim(session.hlink)#";
			var hslink = "#trim(session.hslink)#";
			
			document.writeln('<table cellspacing=0 cellpadding=0 width=100%><tr><td align=left nowrap class=nav1><table width=100% cellspacing=0 cellpadding=0><tr>');
		
			for(count = 0; count < getHeaderMenu.title.length; count++){
	                                                      
				THIShref = '';
	            THIStitle = '';
				
	           	THIShref = getHeaderMenu.href[count];
	            THIStitle = getHeaderMenu.title[count];
				
				THIStdClass = "nav1-cell";
				THIShrefClass = "nav1";
				THISonFocus = "nav1-over";
				THISonBlur = "nav1";
				
				if(eval(count + 1) == hlink){
					THIStdClass = "nav1-cell-lit";
					THIShrefClass = "nav1-lit";
					THISonFocus = "nav1-lit-over";
					THISonBlur = "nav1-lit";				
				};			                                                                   
	            
				/*if(THIStitle == "Login6666"){				
					document.writeln('<td class=\"' + THIStdClass + '\" nowrap><a onclick="launchLoginPage(\'' + THIShref + '\');" href=\"\" class=\"' + THIShrefClass + '\" title=\"' + THIStitle + '\" onFocus=\'javascript:hover(this, \"' + THISonFocus + '\");\' onBlur=\'javascript:hover(this, \"' + THISonBlur + '\");\'>' + THIStitle + '</a></td>');
				}
				else*/
				if(THIStitle == "POLYchat"){				
					document.writeln('<td class=\"' + THIStdClass + '\" nowrap><a onclick="javascript:mainOpen(\'POLYchat\', 280, 195);" href=\"##\" class=\"' + THIShrefClass + '\" title=\"' + THIStitle + '\" onFocus=\'javascript:hover(this, \"' + THISonFocus + '\");\' onBlur=\'javascript:hover(this, \"' + THISonBlur + '\");\'>' + THIStitle + '</a></td>');
				}
				else{   		
					document.writeln('<td class=\"' + THIStdClass + '\" nowrap><a href=\"' + THIShref + '\" class=\"' + THIShrefClass + '\" title=\"' + THIStitle + '\" onFocus=\'javascript:hover(this, \"' + THISonFocus + '\");\' onBlur=\'javascript:hover(this, \"' + THISonBlur + '\");\'>' + THIStitle + '</a></td>');
				};	
				
				
			};
			
			
			
			
			//Test Page
			<cfif (ListFindNoCase("dev,sta", request.cfservername)) AND IsDefined("session.User") AND ListFindNoCase("100191,55,56,100135", session.User.getusersID()) AND IsDefined("session.Client") AND session.Client.getClientID() EQ 1084>			
				THIStdClass = "nav1-cell";
				THIShrefClass = "nav1";
				THISonFocus = "nav1-over";
				THISonBlur = "nav1";
				//Test Page1
				document.writeln('<td onclick=\"window.open(\'appTestPage.cfm\', \'rem\', \'top=15,left=15,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=1000,height=800\');\" class=\"' + THIStdClass + '\" nowrap><a href=\"##\" class=\"' + THIShrefClass + '\" title=\"Test Page\" onFocus=\'javascript:hover(this, \"' + THISonFocus + '\");\' onBlur=\'javascript:hover(this, \"' + THISonBlur + '\");\'>Test Page</a></td>');
			//Test Page2
				document.writeln('<td onclick=\"window.open(\'appTestPage2.cfm\', \'rem\', \'top=15,left=15,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=1000,height=800\');\" class=\"' + THIStdClass + '\" nowrap><a href=\"##\" class=\"' + THIShrefClass + '\" title=\"Test Page2\" onFocus=\'javascript:hover(this, \"' + THISonFocus + '\");\' onBlur=\'javascript:hover(this, \"' + THISonBlur + '\");\'>Test Page 2</a></td>');
			</cfif>
					
					
					
					
					
			document.writeln('<td width=100% class=nav1-cell nowrap>&nbsp;</td></tr></table></td></tr><tr><td class=nav-brdr2><img src=images/clear.gif width=1 height=2></td></tr><tr><td align=left nowrap><table width=100% border=0 cellspacing=0 cellpadding=0 class=nav2><tr><td width=1% class=nav2 nowrap>&nbsp;</td>');
	   		
			for(subcount = 0; subcount < getHeaderSubMenu.title.length; subcount++){			
				if(getHeaderSubMenu.headerid[subcount] == hlink){
					THIShscount = eval(subcount);
					break;
				}
			}
			
			
						
			for(subcount = 0; subcount < getHeaderSubMenu.title.length; subcount++){
	                                                      
	        	THIShref = '';
	            THIStitle = '';
							
	           	THIShref = getHeaderSubMenu.href[subcount];
	            THIStitle = getHeaderSubMenu.title[subcount];
				THISheaderid = getHeaderSubMenu.headerid[subcount];
							
				if(THISheaderid == hlink){
					
					THIShscount = eval(THIShscount + 1);
					THIStdClass = "nav2";
					THIShrefClass = "nav2";
					THISonFocus = "nav2-over";
					THISonBlur = "nav2";
					//alert(getHeaderSubMenu.title.length + " : " + THIShscount + " : " + hslink);
					if(THIShscount == hslink){
						THIStdClass = "nav2-lit";
						THIShrefClass = "nav2-left-lit";
						THISonFocus = "nav2-left-lit-over";
						THISonBlur = "nav2-left-lit";									
					};			                                                                   
	                
					if(THIStitle == "POLYchat"){				
						document.writeln('<td class=\"' + THIStdClass + '\" style="cursor:hand; Z-INDEX: 2; TOP: 200px; valign: middle" nowrap><a onclick="javascript:mainOpen(\'POLYchat\', 280, 195);" href=\"##\" class=\"' + THIShrefClass + '\" title=\"' + THIStitle + '\" onFocus=\'javascript:hover(this, \"' + THISonFocus + '\");\' onBlur=\'javascript:hover(this, \"' + THISonBlur + '\");\'>' + THIStitle + '</a></td>');
					}				
					else{
						document.writeln('<td class=\"' + THIStdClass + '\" nowrap><a href=\"' + THIShref + '\" class=\"' + THIShrefClass + '\" title=\"' + THIStitle + '\" onFocus=\'javascript:hover(this, \"' + THISonFocus + '\");\' onBlur=\'javascript:hover(this, \"' + THISonBlur + '\");\'>' + THIStitle + '</a></td>');
					}	
				};
				
			};
			
			document.writeln('<td width=100% class=nav2 nowrap>&nbsp;</td><td class=sitelabel align=right><font color=65BCFF>#request.cfservername#</font></td></tr></table></td></tr></table>');
		
			
			function checkKey(){										
				if((event.type == "keydown" || event.type == "keypress") && event.keyCode=="13"){									
					sendNote();
					window.event.returnValue = false;						
				};									
			};
								
		
		</script> 
			
	</cfoutput>



<!-------------------------------------------------------------------------------------->
<!--- Only show Chat if user is signed in.                                           --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("session.User") AND IsDefined("session.ClientID") AND IsNumeric(session.ClientID)>
	
		<!-------------------------------------------------------------------------------------->
		<!--- this is the code to show the dropdown chat area.                               --->
		<!-------------------------------------------------------------------------------------->
		<cfoutput>
			<span id=POLYchat style="Z-INDEX: 1; POSITION: absolute; LEFT: 325; TOP: -250px;" align="center">
				<table cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
			  		<tbody>
						<tr>
							<td align=middle>      				 
						      	<table cellSpacing=0 cellPadding=0 width=789 align=center border=0>
						        	<tbody>
						        		<tr>
						          			<td onclick="javascript:mainClose('POLYchat', 280, 195);" style="cursor:hand"><IMG height=1 src="images/hd_spacer.gif" width=472 border=0></td>
						          			<td align=middle width="100%" style="cursor:hand; border: solid; border-color: 000000; border-width: 1px; border-top: 0;">
						           				<table cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
						              				<tbody>
						              					<tr>
						                					<td style="background: ##DCE3EB; margin: 0px" class="siteLabel" nowrap>													
																<table cellpadding="0" cellspacing="0" border="0" width="100%">
																	<tr>
																		<td class="siteLabel" nowrap>&nbsp;<strong>POLYchat</strong></td>
																		<td class="siteLabel" align="center"><span onclick="exitChat(#trim(session.ClientID)#, #trim(session.User.getUsersID())#);" class="siteLabel"><u>Exit&nbsp;Chat</u></span></td>
																		<td class="siteLabel" align="right">
																			available:
																			<select name="availableUsers" class="siteSelectBox">
																				<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																				<cfloop collection="#evaluate(request.structName)#" item="UsersID">																		
																					<cfif session.User.getUsersID() NEQ UsersID>																				
																						<cfset onlineSince = StructFind(evaluate(request.structName), UsersID)>      
																					    <cfset theTimeout = CreateTimespan(0,0,trim(request.Site.getSessiontimeout()),0)>																			
																						<cfif DateCompare(onlineSince + theTimeout, Now()) EQ 1>
																							<!---<cfset inactiveSinceString = ""> 				
																							<cfset inactiveSince = DateDiff("n", onlineSince, Now())>    
																							<cfif inactiveSince GT 4>
																								<cfset inactiveSinceString = "- #inactiveSince#"> 
																							</cfif>--->     
																							<cfquery name="getUsersName" datasource="#trim(request.datasource)#">
																								SELECT FName, LName 
																								FROM view_useraccountparameters 
																								WHERE UsersID = #trim(UsersID)#
																							</cfquery>							
																							<option value="#trim(UsersID)#">#LEFT(getUsersName.FName, 1)#. #getUsersName.LName# <!---#inactiveSinceString#--->																	      
																						<cfelse>		        
																							<cfset StructDelete(evaluate(request.structName), UsersID)>		      
																						</cfif>
																					</cfif>	
																				</cfloop>															
																			</select>&nbsp;
																		</td>
																	</tr>
																</table>														
															</td>
														</tr>
														<input type="Hidden" name="currentLength">
														<tr onclick="javascript:mainClose('POLYchat', 280, 195);">
						                					<td style="background: ##DCE3EB; margin: 0px"><!---align="middle" changed this on 4/23/07--->
																<span id="POLYchatLog" class="siteLabel">
																	<div class="scroll">
																		<span id="IMChatVerbage"></span>
																	</div>																																																					
																</span>																																				                  						
															</td>
														</tr>
														<tr>
						                					<td style="background: ##DCE3EB; margin: 0px" class="siteLabel" align="middle">													
																&nbsp;<input id="entryBox" type="Text" class="siteTextBox" name="entry" size="43" onkeypress="checkKey();">&nbsp;<input type="Button" name="submitButton" class="SiteSubmitBox" value="Send" onclick="sendNote();">&nbsp;<input type="Button" name="exitButton" class="SiteSubmitBox" value="Close" onclick="javascript:mainClose('POLYchat', 280, 195);">
															</td>
														</tr>
						              					
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>					
							</td>
						</tr>
					</tbody>
				</table>
			</span>			
			<div id="divPopup" style="z-index:10000;position:absolute; height:38px;width:170px;visibility:hidden;z-index:1000">
				<img src="images/layer.gif"><div id="divTextPopup" style="border:solid 1px ##000000;background:##CDDBE4;border-top:0px;padding:4px;width:177px;font-weight:normal;font-size:11px; font-family:Verdana, Arial, Helvetica, sans-serif;z-index:1000"></div>
			</div>
	
		</cfoutput>				
			
		<!-------------------------------------------------------------------------------------->
		<!--- Set the interval to check if any current message is waiting.                   --->
		<!-------------------------------------------------------------------------------------->	
		<cfoutput>		
			<script language="JavaScript">			
				var ourInterval = setInterval('getIMChat(#trim(session.ClientID)#, #trim(session.User.getUsersID())#)', 9000); /*every 9 seconds*/	
				var ourInterval = setInterval('getUserCurrentLoginModifiedTime(#trim(session.ClientID)#, #trim(session.User.getUsersID())#)', 360000); 	/*every 6 minutes*/			
			</script>				
		</cfoutput>			
		
	</cfif>
	
		
