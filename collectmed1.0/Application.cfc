
<cfcomponent displayname="Application" output="false">

	<cfscript>		
		this.name = "collectmed";
		this.clientManagement = true;
		this.sessionManagement = true;
		this.setClientCookies = true;
		this.sessionTimeout=createtimespan(0,0,30,0);
		this.applicationTimeout = createTimeSpan(0,1,0,0);	
		this.defaultdatasource = "pa_master";
		
		this.addToPath = "collectmed/";
		if(findNoCase("c:", trim(CGI.path_translated))){
			this.addToPath = "";
		}			
		this.mappings["/coldspring"] = expandPath("/#this.addToPath#frameworks/coldspring");	
		this.mappings["/com"] = expandPath("/#this.addToPath#collectmed1.0/com");	
		this.mappings["/cmComponents"] = expandPath("/#this.addToPath#collectmed1.0/CustomTags");	
		this.customtagpaths = expandPath("/#this.addToPath#collectmed1.0/CustomTags"); 		
	</cfscript>

	
	<cffunction name="onApplicationStart" returnType="any" output="false">		
		
		<cfscript>				
			/*--------------------------------------------------------------------------------------*/
			/*--- Setup the correct variables for the environment you want to work on.           ---*/
			/*--------------------------------------------------------------------------------------*/		
			application.environmentFilePath = "../../../config/appVariables.xml";
			application.serverVariablesToLoad = "production";			
			if(findNoCase("c:", trim(CGI.path_translated))){
				application.serverVariablesToLoad = "development";	
			}
		</cfscript>
		
	</cffunction>
	
	
	<cffunction name="onRequestStart" returnType="boolean" output="true">

		<cfsilent>

		
			<!-------------------------------------------------------------------------------------->
			<!--- HERE ONLY FOR DEVELOPMENT PURPOSES TO RELOAD EVERY REQUEST                     --->
			<!-------------------------------------------------------------------------------------->	
			<cflock name="#application.applicationname#_reinit" type="exclusive" timeout="30">
			    <cfloop collection="#application#" item="i">
			           <cfif i NEQ "ApplicationName">
			                   <cfset structDelete(application,i) />
			           </cfif>
			    </cfloop>
			</cflock>                             
			<cfset OnApplicationStart() />
       
	
	
	
			<cfscript>
		
				try{					
					jr = CreateObject("java", "jrunx.kernel.JRun"); 
					request.cfservername = jr.getServerName();									
				}catch(any e){
					request.cfservername = ReplaceNoCase(getContextRoot(), "/", "", "ALL");
				}
							
				request.PageName = trim(CGI.SCRIPT_NAME);			
				if(FindNoCase("/", request.PageName)){		
					request.pageName = ListLast(request.PageName, "/");							
				}
								
				request.urlProtocol = "http://";
				if(CGI.SERVER_PORT EQ 443){
					request.urlProtocol = "https://";
				}
				
				request.ServerName = trim(CGI.SERVER_NAME);			
				request.validPageCall = 0;
				request.urlHost = ListGetAt(trim(request.ServerName), 1, ".");	
				request.urlDomain = ListGetAt(trim(request.ServerName), 2, ".");
				request.urlHighLevelDomain = ListGetAt(trim(request.ServerName), 3, ".");		
				request.urlReconstructed = trim(request.urlProtocol) & trim(request.urlHost) & "." & trim(request.urlDomain) & "." & trim(request.urlHighLevelDomain);	
				request.driveLetter = "C";
				request.driveLetterFMS = "C";
				request.tempDocsFolder =  "temp";
				request.fmsVirtualDirectory = "fms";
				request.applicationPathMainFolder = "CollectMed";				
				request.fmsPathMainFolder = "CollectMed";				
				request.applicationPath = expandPath("/");				
				request.filesPath = expandPath("/");			
				request.fmsPathTop = expandPath("/") & "#trim(request.fmsVirtualDirectory)#";				
				request.fmsPath = expandPath("/") & "#trim(request.fmsVirtualDirectory)#";				
				request.tempDocsURL = "#trim(request.urlProtocol)##trim(request.urlHost)#.#trim(request.urlDomain)#.#trim(request.urlHighLevelDomain)#/#trim(request.fmsVirtualDirectory)#";
				request.ediURL = "https://www.mfgedi.com";				
				request.coldspringConfig = expandPath("/") & "#this.addToPath#frameworks\coldspring\coldspring.xml"; 				
				request.masterDatasource = "pa_master";					
				
				request.Site = structNew();
				request.Site.getFont = "Tahoma";				
			
				/*--------------------------------------------------------------------------------------*/
				/*--- Initialize ColdSpring.                                                         ---*/
				/*--------------------------------------------------------------------------------------*/		
				if(structKeyExists(url,"reinit") and url.reinit eq "complete" and structKeyExists(application,"ApplicationName")){			
					lock name="#application.applicationname#_reinit" timeout="15" type="exclusive"{						
						for(key in application){
							if(key neq "ApplicationName"){
								StructDelete(application, key);
							};
						};	
						//--- OnApplicationStart(); 
						location("#cgi.script_name#", "false");
					};
				};
				
				if(structKeyExists(application,"ApplicationName")){
					if(not structKeyExists(application,"beanFactory")){
						local.environmentProperties = createObject("component","com.utility.PropertiesLoader").loadEnvironmentalVariables(application.environmentFilePath, application.serverVariablesToLoad);
						lock name="#application.applicationname#beanFactory" type="exclusive" timeout="30"{
							if(not structKeyExists(application,"beanFactory")){
								application.beanFactory = createObject("component","coldspring.beans.DefaultXmlBeanFactory").init(structNew(), local.environmentProperties);
								application.beanFactory.loadBeans(request.coldspringConfig);
							};
						};
					};
				};				
				
				
				/*-------------------------------------------------------------------------------------*/
				/*--- setup the environment                                                         ---*/
				/*-------------------------------------------------------------------------------------*/	
				session.environment = application.beanFactory.getBean('configBean').getDomain().environment;


			
												
				/*--------------------------------------------------------------------------------------*/
				/*--- Session-Tracker Code                                                           ---*/
				/*--------------------------------------------------------------------------------------*/
				if(IsDefined("session.User") AND IsDefined("session.ClientID") AND IsNumeric(session.ClientID)){
					lock name="#APPLICATION.applicationName#" type="Exclusive" timeout="20" throwontimeout="Yes"{
						
						/*--------------------------------------------------------------------------------------*/
						/*--- If Session-Tracker does not exist, generate it by using cfparam                ---*/
						/*--------------------------------------------------------------------------------------*/
					   	"APPLICATION.SessionTracker_#session.ClientID#" = StructNew();
						request.structName = "APPLICATION.SessionTracker_#session.ClientID#";		
					  	StructInsert(evaluate(request.structName), session.User.getUsersID(), Now(), true);  
					
					};
				};
		

				/*--------------------------------------------------------------------------------------*/
				/*--- If the clientID is available set the path.                                     ---*/
				/*--------------------------------------------------------------------------------------*/
				if(IsDefined("session.ClientID") AND IsNumeric(session.ClientID)){	
					request.fmsPath = request.fmsPath & "\" & trim(session.ClientID);		
					request.tempDocsURL = trim(request.tempDocsURL )& "/#trim(application.beanFactory.getBean('Client').getClientID())#/" & trim(request.tempDocsFolder);
				};


				/*--------------------------------------------------------------------------------------*/
				/*--- If the user is defined we need to make sure they are in the correct database.  ---*/
				/*--------------------------------------------------------------------------------------*/		
				if(IsDefined("session.User")){			
					request.datasource = session.user.getDatasource();
					request.ro_datasource = "ro_" & session.user.getDatasource();	
				}
				else{		
					request.datasource = "pa_master";
					request.ro_datasource = "ro_PAMaster";	
				};
				
				
				/*--------------------------------------------------------------------------------------*/
				/*--- Set the users screen width and height to use in placing bordered tables.       ---*/
				/*--------------------------------------------------------------------------------------*/
				if(NOT IsDefined("session.screenWidth") OR NOT IsDefined("session.screenHeight")){
					tk = CreateObject("java", "java.awt.Toolkit"); 
					session.screenWidth = tk.getDefaultToolkit().getScreenSize().width;
					session.screenHeight = tk.getDefaultToolkit().getScreenSize().height;
					
				}

				/*--------------------------------------------------------------------------------------*/
				/*--- Set the users Browser and OS type.                                             ---*/
				/*--------------------------------------------------------------------------------------*/				
				module name="gcTagBrowserType";			
				
				module name="gcCFScriptIncludes";	
				
				
				request.correctVersion = false;	
				if(
					FindNoCase("6.", request.BrowserVersion)
					OR FindNoCase("7.", request.BrowserVersion)
					OR FindNoCase("8.", request.BrowserVersion)
					OR FindNoCase("9.", request.BrowserVersion)
					OR FindNoCase("Firefox", request.BrowserVersion)
				){
					request.correctVersion = true;
				};
								
				if(NOT ListFindNoCase("NS,IE", request.BrowserType) OR NOT request.correctVersion){
					module name="gcGeneralErrorTemplate" message="<strong>You must use Microsoft Internet Explorer Version 6.0+ to view this site.</strong><br><br>Please go to the <a href=""http://www.microsoft.com/windows/ie/default.mspx"">Microsoft Internet Explorer</a> website to download or upgrade to the correct version." back="no";		
				};
				
				
				
				/*------------------------------------------------------------------*/
				/*--- Get the information of the page that the user has chosen   ---*/
				/*--- to view.                                                   ---*/
				/*------------------------------------------------------------------*/	
				request.Page = application.beanFactory.getBean('PageIO');	
				request.thisPageID = request.Page.getPageIDByName(trim(request.pageName));					
				if(NOT isNumeric(request.thisPageID)){		
					module name="gcGeneralErrorTemplate" message="No page exists";		
				}
				request.Page.InitPage(request.thisPageID);
				
				

				/*--------------------------------------------------------------------------------------*/
				/*--- If the page is defined we need to check their pages the Ipaddress and          ---*/ 
				/*--- insert their session visit.                                                    ---*/
				/*--------------------------------------------------------------------------------------*/	
				if(IsDefined("session.User")){	
											
					/*--------------------------------------------------------------------------------------*/
					/*--- If the user has reached their final time of the day that they can be           ---*/
					/*--- logged in log them out.                                                        ---*/
					/*--------------------------------------------------------------------------------------*/	
					if(session.User.EndLoginTime LT NOW()){			
						module name="gcLogUserOutClearScopes";
						request.message ="Your account cannot stay logged in past the current time. <br>You must contact your administrator to change your settings to be able to login at the current time.";
						location addtoken="No" url="appSiteLogin.cfm?msg=#URLEncodedFormat(request.message)#";			
					};


		
					<!-------------------------------------------------------------------------------------->
					<!--- If the user is logged in and the current IP address is not the one in the      --->
					<!--- users session record then let them know that they are logged in elsewhere.     --->
					<!-------------------------------------------------------------------------------------->
					request.SessionIPaddress = application.beanFactory.getBean('UsersSessionIO').getUsersSessionQuery(	
																														fields:"IPAddress,UsersSessionIdentification",						
																														UsersSessionIdentification:"#session.user.getUsersSessionIdentification()#",
																														active:"1"
																													 ); 
					if(request.SessionIPaddress.Recordcount GT 1){
						
						request.adminNotification = "Users account has more than one active UserSession. IMMEDIATE attention required.";
						
						request.EAQuery = application.beanFactory.getBean('EmailAddressIO').getEmailAddressQuery(fields:"Email", EmailAddressID:"#request.Site.getSupportEmailAddressID()#");
						 						
						module name="gcGatewayLogger" datasource="#trim(request.datasource)#" code="115" logtext="#trim(request.adminNotification)#";	
						module name="gcSendEmail" from="#trim(request.EAQuery.Email)#" to="#trim(request.EAQuery.Email)#" subject="IMMEDIATE attention required." message="#trim(request.adminNotification)#";
						
						request.message = "There was an issue with your account. An administrator has been notified.";					
						location url='appGeneralErrorTemplate.cfm?message=""#UrlEncodedFormat(trim(request.message))#""' addtoken="No";
						
					}
					else if(request.SessionIPaddress.Recordcount LTE 0 AND (trim(session.user.getUsersSessionIdentification()) NEQ trim(request.SessionIPaddress.UsersSessionIdentification))){
						request.message = "Your account appears to be logged in on another Session Identification.";					
						location url='appSiteLogout.cfm?msg=""#UrlEncodedFormat(trim(request.message))#""' addtoken="No";
					}	
					else if(request.SessionIPaddress.Recordcount LTE 0 AND (trim(request.SessionIPaddress.ipaddress) NEQ trim(CGI.Remote_Addr))){					
						request.message = "Your account appears to be logged in on another IP Address.";					
						location url='appSiteLogout.cfm?msg=""#UrlEncodedFormat(trim(request.message))#""' addtoken="No";
					}	
					else if(request.SessionIPaddress.Recordcount LTE 0){					 				
						request.tempvariable = StructClear(session);
						request.message = "Your session does not appear to be valid please login again.";					
						location url='appSiteLogout.cfm?msg=""#UrlEncodedFormat(trim(request.message))#""' addtoken="No";					
					}


					/*--------------------------------------------------------------------------------------*/
					/*--- Set the users pages they are able to view.                                     ---*/
					/*--------------------------------------------------------------------------------------*/		
					tempQuery = session.user.getUserPages();
					request.currentUserPages = valuelist(tempQuery.pageid);
				
					/*--------------------------------------------------------------------------------------*/
					/*--- Find out if the pagename that the user is looking for is in their list of      ---*/
					/*--- pages that they are able to view.                                              ---*/
					/*--------------------------------------------------------------------------------------*/
					if(ListFindNoCase(request.currentUserPages, request.Page.getPageID()) LTE 0){						
						request.message = "Your account is not enabled to view this page please contact a site administrator. #trim(request.Page.getPageID())#";					
						location url="appGeneralErrorTemplate.cfm?message=""#UrlEncodedFormat(trim(request.message))#""" addtoken="No";					
					}
						
					/*--------------------------------------------------------------------------------------*/
					/*--- Everytime a user enters there will be a session ID set for this visit. This    ---*/
					/*--- has to be entered for tracking purposes.                                       ---*/
					/*--------------------------------------------------------------------------------------*/			
					application.beanFactory.getBean('UserSessionInsert').Process(
																					usersID: trim(session.User.getUsersID()), 
																					UsersSessionIdentification: trim(session.User.getUsersSessionIdentification()), 
																					IPAddress: trim(CGI.REMOTE_ADDR)
																				);
																				
				};

				
			</cfscript>
					
		</cfsilent>
				
		<cfreturn true />

	</cffunction>
	
	
</cfcomponent>

