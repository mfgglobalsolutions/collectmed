 	


<cfcomponent name="siteBean" output="false" alias="siteBean" extends="SiteDAO">

	<cfproperty name="SiteID" type="numeric" default="0" />
	<cfproperty name="ApplicationName" type="string" default="" />
	<cfproperty name="SiteName" type="string" default="" />
	<cfproperty name="Directory" type="string" default="" />
	<cfproperty name="URLDomains" type="string" default="" />
	<cfproperty name="SessionTimeout" type="numeric" default="" />
	<cfproperty name="SupportEmailAddressID" type="numeric" default="" />
	<cfproperty name="AdministratorEmailID" type="numeric" default="" />
	<cfproperty name="AdministratorPhoneID" type="numeric" default="" />
	<cfproperty name="MainPhoneNumberID" type="numeric" default="" />
	<cfproperty name="CompanyLogo" type="string" default="" />
	<cfproperty name="Align" type="string" default="" />
	<cfproperty name="BgColor" type="string" default="" />
	<cfproperty name="Font" type="string" default="" />
	<cfproperty name="FontSize" type="numeric" default="" />
	<cfproperty name="FontColor" type="string" default="" />
	<cfproperty name="LoginPage" type="string" default="" />
	<cfproperty name="TextBoxBackgroundColor" type="string" default="" />
	<cfproperty name="TitleHeaderColor" type="string" default="" />
	<cfproperty name="TitleFontColor" type="string" default="" />
	<cfproperty name="FooterFileName" type="string" default="" />
	<cfproperty name="HeaderBackgroundColor" type="string" default="" />
	<cfproperty name="HeaderBorder" type="numeric" default="" />
	<cfproperty name="HeaderBorderColor" type="string" default="" />
	<cfproperty name="HeaderFileName" type="string" default="" />
	<cfproperty name="HeaderHeight" type="numeric" default="" />
	<cfproperty name="LeftNavigationFontColor" type="string" default="" />
	<cfproperty name="LeftNavigationFontSize" type="numeric" default="" />
	<cfproperty name="LeftNavigationBorder" type="numeric" default="" />
	<cfproperty name="LeftTemplateFileName" type="string" default="" />
	<cfproperty name="LeftNavigationBorderColor" type="string" default="" />
	<cfproperty name="RightTemplateFileName" type="string" default="" />
	<cfproperty name="RightNavigationBorder" type="numeric" default="" />
	<cfproperty name="RightTableBackgroundColor" type="string" default="" />
	<cfproperty name="RightNavigationBorderColor" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.SiteID = 0;
		variables.ApplicationName = "";
		variables.SiteName = "";
		variables.Directory = "";
		variables.URLDomains = "";
		variables.SessionTimeout = "";
		variables.SupportEmailAddressID = "";
		variables.AdministratorEmailID = "";
		variables.AdministratorPhoneID = "";
		variables.MainPhoneNumberID = "";
		variables.CompanyLogo = "";
		variables.Align = "";
		variables.BgColor = "";
		variables.Font = "";
		variables.FontSize = "";
		variables.FontColor = "";
		variables.LoginPage = "";
		variables.TextBoxBackgroundColor = "";
		variables.TitleHeaderColor = "";
		variables.TitleFontColor = "";
		variables.FooterFileName = "";
		variables.HeaderBackgroundColor = "";
		variables.HeaderBorder = "";
		variables.HeaderBorderColor = "";
		variables.HeaderFileName = "";
		variables.HeaderHeight = "";
		variables.LeftNavigationFontColor = "";
		variables.LeftNavigationFontSize = "";
		variables.LeftNavigationBorder = "";
		variables.LeftTemplateFileName = "";
		variables.LeftNavigationBorderColor = "";
		variables.RightTemplateFileName = "";
		variables.RightNavigationBorder = "";
		variables.RightTableBackgroundColor = "";
		variables.RightNavigationBorderColor = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="siteBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "SiteID") AND stValues.SiteID NEQ 0>
				<cfquery name="qGetSite" datasource="#trim(arguments.ds)#">
			  		SELECT SiteID,ApplicationName,SiteName,Directory,URLDomains,SessionTimeout,SupportEmailAddressID,AdministratorEmailID,AdministratorPhoneID,MainPhoneNumberID,CompanyLogo,Align,BgColor,Font,FontSize,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorder,HeaderBorderColor,HeaderFileName,HeaderHeight,LeftNavigationFontColor,LeftNavigationFontSize,LeftNavigationBorder,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightNavigationBorder,RightTableBackgroundColor,RightNavigationBorderColor,Active,InactiveCode,DateCreated,DateModified
					FROM Site  
					WHERE SiteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.SiteID#" /> 
				</cfquery>		
				<cfif qGetSite.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ApplicationName = qGetSite.ApplicationName;
					variables.SiteName = qGetSite.SiteName;
					variables.Directory = qGetSite.Directory;
					variables.URLDomains = qGetSite.URLDomains;
					variables.SessionTimeout = qGetSite.SessionTimeout;
					variables.SupportEmailAddressID = qGetSite.SupportEmailAddressID;
					variables.AdministratorEmailID = qGetSite.AdministratorEmailID;
					variables.AdministratorPhoneID = qGetSite.AdministratorPhoneID;
					variables.MainPhoneNumberID = qGetSite.MainPhoneNumberID;
					variables.CompanyLogo = qGetSite.CompanyLogo;
					variables.Align = qGetSite.Align;
					variables.BgColor = qGetSite.BgColor;
					variables.Font = qGetSite.Font;
					variables.FontSize = qGetSite.FontSize;
					variables.FontColor = qGetSite.FontColor;
					variables.LoginPage = qGetSite.LoginPage;
					variables.TextBoxBackgroundColor = qGetSite.TextBoxBackgroundColor;
					variables.TitleHeaderColor = qGetSite.TitleHeaderColor;
					variables.TitleFontColor = qGetSite.TitleFontColor;
					variables.FooterFileName = qGetSite.FooterFileName;
					variables.HeaderBackgroundColor = qGetSite.HeaderBackgroundColor;
					variables.HeaderBorder = qGetSite.HeaderBorder;
					variables.HeaderBorderColor = qGetSite.HeaderBorderColor;
					variables.HeaderFileName = qGetSite.HeaderFileName;
					variables.HeaderHeight = qGetSite.HeaderHeight;
					variables.LeftNavigationFontColor = qGetSite.LeftNavigationFontColor;
					variables.LeftNavigationFontSize = qGetSite.LeftNavigationFontSize;
					variables.LeftNavigationBorder = qGetSite.LeftNavigationBorder;
					variables.LeftTemplateFileName = qGetSite.LeftTemplateFileName;
					variables.LeftNavigationBorderColor = qGetSite.LeftNavigationBorderColor;
					variables.RightTemplateFileName = qGetSite.RightTemplateFileName;
					variables.RightNavigationBorder = qGetSite.RightNavigationBorder;
					variables.RightTableBackgroundColor = qGetSite.RightTableBackgroundColor;
					variables.RightNavigationBorderColor = qGetSite.RightNavigationBorderColor;
					variables.Active = qGetSite.Active;
					variables.InactiveCode = qGetSite.InactiveCode;
					variables.DateModified = qGetSite.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "ApplicationName")><cfset variables.ApplicationName = stValues.ApplicationName /></cfif>
			<cfif StructKeyExists(stValues, "SiteName")><cfset variables.SiteName = stValues.SiteName /></cfif>
			<cfif StructKeyExists(stValues, "Directory")><cfset variables.Directory = stValues.Directory /></cfif>
			<cfif StructKeyExists(stValues, "URLDomains")><cfset variables.URLDomains = stValues.URLDomains /></cfif>
			<cfif StructKeyExists(stValues, "SessionTimeout")><cfset variables.SessionTimeout = stValues.SessionTimeout /></cfif>
			<cfif StructKeyExists(stValues, "SupportEmailAddressID")><cfset variables.SupportEmailAddressID = stValues.SupportEmailAddressID /></cfif>
			<cfif StructKeyExists(stValues, "AdministratorEmailID")><cfset variables.AdministratorEmailID = stValues.AdministratorEmailID /></cfif>
			<cfif StructKeyExists(stValues, "AdministratorPhoneID")><cfset variables.AdministratorPhoneID = stValues.AdministratorPhoneID /></cfif>
			<cfif StructKeyExists(stValues, "MainPhoneNumberID")><cfset variables.MainPhoneNumberID = stValues.MainPhoneNumberID /></cfif>
			<cfif StructKeyExists(stValues, "CompanyLogo")><cfset variables.CompanyLogo = stValues.CompanyLogo /></cfif>
			<cfif StructKeyExists(stValues, "Align")><cfset variables.Align = stValues.Align /></cfif>
			<cfif StructKeyExists(stValues, "BgColor")><cfset variables.BgColor = stValues.BgColor /></cfif>
			<cfif StructKeyExists(stValues, "Font")><cfset variables.Font = stValues.Font /></cfif>
			<cfif StructKeyExists(stValues, "FontSize")><cfset variables.FontSize = stValues.FontSize /></cfif>
			<cfif StructKeyExists(stValues, "FontColor")><cfset variables.FontColor = stValues.FontColor /></cfif>
			<cfif StructKeyExists(stValues, "LoginPage")><cfset variables.LoginPage = stValues.LoginPage /></cfif>
			<cfif StructKeyExists(stValues, "TextBoxBackgroundColor")><cfset variables.TextBoxBackgroundColor = stValues.TextBoxBackgroundColor /></cfif>
			<cfif StructKeyExists(stValues, "TitleHeaderColor")><cfset variables.TitleHeaderColor = stValues.TitleHeaderColor /></cfif>
			<cfif StructKeyExists(stValues, "TitleFontColor")><cfset variables.TitleFontColor = stValues.TitleFontColor /></cfif>
			<cfif StructKeyExists(stValues, "FooterFileName")><cfset variables.FooterFileName = stValues.FooterFileName /></cfif>
			<cfif StructKeyExists(stValues, "HeaderBackgroundColor")><cfset variables.HeaderBackgroundColor = stValues.HeaderBackgroundColor /></cfif>
			<cfif StructKeyExists(stValues, "HeaderBorder")><cfset variables.HeaderBorder = stValues.HeaderBorder /></cfif>
			<cfif StructKeyExists(stValues, "HeaderBorderColor")><cfset variables.HeaderBorderColor = stValues.HeaderBorderColor /></cfif>
			<cfif StructKeyExists(stValues, "HeaderFileName")><cfset variables.HeaderFileName = stValues.HeaderFileName /></cfif>
			<cfif StructKeyExists(stValues, "HeaderHeight")><cfset variables.HeaderHeight = stValues.HeaderHeight /></cfif>
			<cfif StructKeyExists(stValues, "LeftNavigationFontColor")><cfset variables.LeftNavigationFontColor = stValues.LeftNavigationFontColor /></cfif>
			<cfif StructKeyExists(stValues, "LeftNavigationFontSize")><cfset variables.LeftNavigationFontSize = stValues.LeftNavigationFontSize /></cfif>
			<cfif StructKeyExists(stValues, "LeftNavigationBorder")><cfset variables.LeftNavigationBorder = stValues.LeftNavigationBorder /></cfif>
			<cfif StructKeyExists(stValues, "LeftTemplateFileName")><cfset variables.LeftTemplateFileName = stValues.LeftTemplateFileName /></cfif>
			<cfif StructKeyExists(stValues, "LeftNavigationBorderColor")><cfset variables.LeftNavigationBorderColor = stValues.LeftNavigationBorderColor /></cfif>
			<cfif StructKeyExists(stValues, "RightTemplateFileName")><cfset variables.RightTemplateFileName = stValues.RightTemplateFileName /></cfif>
			<cfif StructKeyExists(stValues, "RightNavigationBorder")><cfset variables.RightNavigationBorder = stValues.RightNavigationBorder /></cfif>
			<cfif StructKeyExists(stValues, "RightTableBackgroundColor")><cfset variables.RightTableBackgroundColor = stValues.RightTableBackgroundColor /></cfif>
			<cfif StructKeyExists(stValues, "RightNavigationBorderColor")><cfset variables.RightNavigationBorderColor = stValues.RightNavigationBorderColor /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SiteID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSiteID" acess="public" output="false" returntype="any">
		<cfreturn variables.SiteID>
	</cffunction>
	
	<cffunction name="setSiteID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SiteID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SiteID)) OR trim(arguments.SiteID) EQ "">
			<cfset variables.SiteID = arguments.SiteID />
		<cfelse>
			<cfthrow message="SiteID (#arguments.SiteID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SiteID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ApplicationName.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getApplicationName" acess="public" output="false" returntype="any">
		<cfreturn variables.ApplicationName>
	</cffunction>
	
	<cffunction name="setApplicationName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ApplicationName" required="true" type="any" />
			
		<cfset variables.ApplicationName = arguments.ApplicationName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ApplicationName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SiteName.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSiteName" acess="public" output="false" returntype="any">
		<cfreturn variables.SiteName>
	</cffunction>
	
	<cffunction name="setSiteName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SiteName" required="true" type="any" />
			
		<cfset variables.SiteName = arguments.SiteName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SiteName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Directory.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDirectory" acess="public" output="false" returntype="any">
		<cfreturn variables.Directory>
	</cffunction>
	
	<cffunction name="setDirectory" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Directory" required="true" type="any" />
			
		<cfset variables.Directory = arguments.Directory />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Directory") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for URLDomains.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getURLDomains" acess="public" output="false" returntype="any">
		<cfreturn variables.URLDomains>
	</cffunction>
	
	<cffunction name="setURLDomains" acess="public" output="false" returntype="boolean">
		
		<cfargument name="URLDomains" required="true" type="any" />
			
		<cfset variables.URLDomains = arguments.URLDomains />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "URLDomains") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SessionTimeout.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSessionTimeout" acess="public" output="false" returntype="any">
		<cfreturn variables.SessionTimeout>
	</cffunction>
	
	<cffunction name="setSessionTimeout" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SessionTimeout" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SessionTimeout)) OR trim(arguments.SessionTimeout) EQ "">
			<cfset variables.SessionTimeout = arguments.SessionTimeout />
		<cfelse>
			<cfthrow message="SessionTimeout (#arguments.SessionTimeout#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SessionTimeout") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SupportEmailAddressID.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSupportEmailAddressID" acess="public" output="false" returntype="any">
		<cfreturn variables.SupportEmailAddressID>
	</cffunction>
	
	<cffunction name="setSupportEmailAddressID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SupportEmailAddressID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SupportEmailAddressID)) OR trim(arguments.SupportEmailAddressID) EQ "">
			<cfset variables.SupportEmailAddressID = arguments.SupportEmailAddressID />
		<cfelse>
			<cfthrow message="SupportEmailAddressID (#arguments.SupportEmailAddressID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SupportEmailAddressID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AdministratorEmailID.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAdministratorEmailID" acess="public" output="false" returntype="any">
		<cfreturn variables.AdministratorEmailID>
	</cffunction>
	
	<cffunction name="setAdministratorEmailID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AdministratorEmailID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AdministratorEmailID)) OR trim(arguments.AdministratorEmailID) EQ "">
			<cfset variables.AdministratorEmailID = arguments.AdministratorEmailID />
		<cfelse>
			<cfthrow message="AdministratorEmailID (#arguments.AdministratorEmailID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AdministratorEmailID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AdministratorPhoneID.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAdministratorPhoneID" acess="public" output="false" returntype="any">
		<cfreturn variables.AdministratorPhoneID>
	</cffunction>
	
	<cffunction name="setAdministratorPhoneID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AdministratorPhoneID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AdministratorPhoneID)) OR trim(arguments.AdministratorPhoneID) EQ "">
			<cfset variables.AdministratorPhoneID = arguments.AdministratorPhoneID />
		<cfelse>
			<cfthrow message="AdministratorPhoneID (#arguments.AdministratorPhoneID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AdministratorPhoneID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MainPhoneNumberID.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMainPhoneNumberID" acess="public" output="false" returntype="any">
		<cfreturn variables.MainPhoneNumberID>
	</cffunction>
	
	<cffunction name="setMainPhoneNumberID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MainPhoneNumberID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MainPhoneNumberID)) OR trim(arguments.MainPhoneNumberID) EQ "">
			<cfset variables.MainPhoneNumberID = arguments.MainPhoneNumberID />
		<cfelse>
			<cfthrow message="MainPhoneNumberID (#arguments.MainPhoneNumberID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MainPhoneNumberID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CompanyLogo.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCompanyLogo" acess="public" output="false" returntype="any">
		<cfreturn variables.CompanyLogo>
	</cffunction>
	
	<cffunction name="setCompanyLogo" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CompanyLogo" required="true" type="any" />
			
		<cfset variables.CompanyLogo = arguments.CompanyLogo />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CompanyLogo") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Align.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAlign" acess="public" output="false" returntype="any">
		<cfreturn variables.Align>
	</cffunction>
	
	<cffunction name="setAlign" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Align" required="true" type="any" />
			
		<cfset variables.Align = arguments.Align />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Align") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for BgColor.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBgColor" acess="public" output="false" returntype="any">
		<cfreturn variables.BgColor>
	</cffunction>
	
	<cffunction name="setBgColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BgColor" required="true" type="any" />
			
		<cfset variables.BgColor = arguments.BgColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BgColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Font.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFont" acess="public" output="false" returntype="any">
		<cfreturn variables.Font>
	</cffunction>
	
	<cffunction name="setFont" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Font" required="true" type="any" />
			
		<cfset variables.Font = arguments.Font />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Font") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FontSize.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFontSize" acess="public" output="false" returntype="any">
		<cfreturn variables.FontSize>
	</cffunction>
	
	<cffunction name="setFontSize" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FontSize" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.FontSize)) OR trim(arguments.FontSize) EQ "">
			<cfset variables.FontSize = arguments.FontSize />
		<cfelse>
			<cfthrow message="FontSize (#arguments.FontSize#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FontSize") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FontColor.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFontColor" acess="public" output="false" returntype="any">
		<cfreturn variables.FontColor>
	</cffunction>
	
	<cffunction name="setFontColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FontColor" required="true" type="any" />
			
		<cfset variables.FontColor = arguments.FontColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FontColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LoginPage.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLoginPage" acess="public" output="false" returntype="any">
		<cfreturn variables.LoginPage>
	</cffunction>
	
	<cffunction name="setLoginPage" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LoginPage" required="true" type="any" />
			
		<cfset variables.LoginPage = arguments.LoginPage />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LoginPage") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TextBoxBackgroundColor.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTextBoxBackgroundColor" acess="public" output="false" returntype="any">
		<cfreturn variables.TextBoxBackgroundColor>
	</cffunction>
	
	<cffunction name="setTextBoxBackgroundColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TextBoxBackgroundColor" required="true" type="any" />
			
		<cfset variables.TextBoxBackgroundColor = arguments.TextBoxBackgroundColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TextBoxBackgroundColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TitleHeaderColor.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTitleHeaderColor" acess="public" output="false" returntype="any">
		<cfreturn variables.TitleHeaderColor>
	</cffunction>
	
	<cffunction name="setTitleHeaderColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TitleHeaderColor" required="true" type="any" />
			
		<cfset variables.TitleHeaderColor = arguments.TitleHeaderColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TitleHeaderColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TitleFontColor.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTitleFontColor" acess="public" output="false" returntype="any">
		<cfreturn variables.TitleFontColor>
	</cffunction>
	
	<cffunction name="setTitleFontColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TitleFontColor" required="true" type="any" />
			
		<cfset variables.TitleFontColor = arguments.TitleFontColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TitleFontColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FooterFileName.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFooterFileName" acess="public" output="false" returntype="any">
		<cfreturn variables.FooterFileName>
	</cffunction>
	
	<cffunction name="setFooterFileName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FooterFileName" required="true" type="any" />
			
		<cfset variables.FooterFileName = arguments.FooterFileName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FooterFileName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HeaderBackgroundColor.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHeaderBackgroundColor" acess="public" output="false" returntype="any">
		<cfreturn variables.HeaderBackgroundColor>
	</cffunction>
	
	<cffunction name="setHeaderBackgroundColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HeaderBackgroundColor" required="true" type="any" />
			
		<cfset variables.HeaderBackgroundColor = arguments.HeaderBackgroundColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HeaderBackgroundColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HeaderBorder.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHeaderBorder" acess="public" output="false" returntype="any">
		<cfreturn variables.HeaderBorder>
	</cffunction>
	
	<cffunction name="setHeaderBorder" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HeaderBorder" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.HeaderBorder)) OR trim(arguments.HeaderBorder) EQ "">
			<cfset variables.HeaderBorder = arguments.HeaderBorder />
		<cfelse>
			<cfthrow message="HeaderBorder (#arguments.HeaderBorder#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HeaderBorder") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HeaderBorderColor.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHeaderBorderColor" acess="public" output="false" returntype="any">
		<cfreturn variables.HeaderBorderColor>
	</cffunction>
	
	<cffunction name="setHeaderBorderColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HeaderBorderColor" required="true" type="any" />
			
		<cfset variables.HeaderBorderColor = arguments.HeaderBorderColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HeaderBorderColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HeaderFileName.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHeaderFileName" acess="public" output="false" returntype="any">
		<cfreturn variables.HeaderFileName>
	</cffunction>
	
	<cffunction name="setHeaderFileName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HeaderFileName" required="true" type="any" />
			
		<cfset variables.HeaderFileName = arguments.HeaderFileName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HeaderFileName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HeaderHeight.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHeaderHeight" acess="public" output="false" returntype="any">
		<cfreturn variables.HeaderHeight>
	</cffunction>
	
	<cffunction name="setHeaderHeight" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HeaderHeight" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.HeaderHeight)) OR trim(arguments.HeaderHeight) EQ "">
			<cfset variables.HeaderHeight = arguments.HeaderHeight />
		<cfelse>
			<cfthrow message="HeaderHeight (#arguments.HeaderHeight#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HeaderHeight") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LeftNavigationFontColor.                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLeftNavigationFontColor" acess="public" output="false" returntype="any">
		<cfreturn variables.LeftNavigationFontColor>
	</cffunction>
	
	<cffunction name="setLeftNavigationFontColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LeftNavigationFontColor" required="true" type="any" />
			
		<cfset variables.LeftNavigationFontColor = arguments.LeftNavigationFontColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LeftNavigationFontColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LeftNavigationFontSize.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLeftNavigationFontSize" acess="public" output="false" returntype="any">
		<cfreturn variables.LeftNavigationFontSize>
	</cffunction>
	
	<cffunction name="setLeftNavigationFontSize" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LeftNavigationFontSize" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.LeftNavigationFontSize)) OR trim(arguments.LeftNavigationFontSize) EQ "">
			<cfset variables.LeftNavigationFontSize = arguments.LeftNavigationFontSize />
		<cfelse>
			<cfthrow message="LeftNavigationFontSize (#arguments.LeftNavigationFontSize#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LeftNavigationFontSize") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LeftNavigationBorder.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLeftNavigationBorder" acess="public" output="false" returntype="any">
		<cfreturn variables.LeftNavigationBorder>
	</cffunction>
	
	<cffunction name="setLeftNavigationBorder" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LeftNavigationBorder" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.LeftNavigationBorder)) OR trim(arguments.LeftNavigationBorder) EQ "">
			<cfset variables.LeftNavigationBorder = arguments.LeftNavigationBorder />
		<cfelse>
			<cfthrow message="LeftNavigationBorder (#arguments.LeftNavigationBorder#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LeftNavigationBorder") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LeftTemplateFileName.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLeftTemplateFileName" acess="public" output="false" returntype="any">
		<cfreturn variables.LeftTemplateFileName>
	</cffunction>
	
	<cffunction name="setLeftTemplateFileName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LeftTemplateFileName" required="true" type="any" />
			
		<cfset variables.LeftTemplateFileName = arguments.LeftTemplateFileName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LeftTemplateFileName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LeftNavigationBorderColor.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLeftNavigationBorderColor" acess="public" output="false" returntype="any">
		<cfreturn variables.LeftNavigationBorderColor>
	</cffunction>
	
	<cffunction name="setLeftNavigationBorderColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LeftNavigationBorderColor" required="true" type="any" />
			
		<cfset variables.LeftNavigationBorderColor = arguments.LeftNavigationBorderColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LeftNavigationBorderColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RightTemplateFileName.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRightTemplateFileName" acess="public" output="false" returntype="any">
		<cfreturn variables.RightTemplateFileName>
	</cffunction>
	
	<cffunction name="setRightTemplateFileName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RightTemplateFileName" required="true" type="any" />
			
		<cfset variables.RightTemplateFileName = arguments.RightTemplateFileName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RightTemplateFileName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RightNavigationBorder.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRightNavigationBorder" acess="public" output="false" returntype="any">
		<cfreturn variables.RightNavigationBorder>
	</cffunction>
	
	<cffunction name="setRightNavigationBorder" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RightNavigationBorder" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RightNavigationBorder)) OR trim(arguments.RightNavigationBorder) EQ "">
			<cfset variables.RightNavigationBorder = arguments.RightNavigationBorder />
		<cfelse>
			<cfthrow message="RightNavigationBorder (#arguments.RightNavigationBorder#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RightNavigationBorder") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RightTableBackgroundColor.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRightTableBackgroundColor" acess="public" output="false" returntype="any">
		<cfreturn variables.RightTableBackgroundColor>
	</cffunction>
	
	<cffunction name="setRightTableBackgroundColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RightTableBackgroundColor" required="true" type="any" />
			
		<cfset variables.RightTableBackgroundColor = arguments.RightTableBackgroundColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RightTableBackgroundColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RightNavigationBorderColor.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRightNavigationBorderColor" acess="public" output="false" returntype="any">
		<cfreturn variables.RightNavigationBorderColor>
	</cffunction>
	
	<cffunction name="setRightNavigationBorderColor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RightNavigationBorderColor" required="true" type="any" />
			
		<cfset variables.RightNavigationBorderColor = arguments.RightNavigationBorderColor />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RightNavigationBorderColor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


