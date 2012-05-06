 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SiteBean" />
		
		<cfset var qCreateSite = "" />		
		
		<cfset var localApplicationName = arguments.bean.getApplicationName() />
		<cfset var localSiteName = arguments.bean.getSiteName() />
		<cfset var localDirectory = arguments.bean.getDirectory() />
		<cfset var localURLDomains = arguments.bean.getURLDomains() />
		<cfset var localSessionTimeout = arguments.bean.getSessionTimeout() />
		<cfset var localSupportEmailAddressID = arguments.bean.getSupportEmailAddressID() />
		<cfset var localAdministratorEmailID = arguments.bean.getAdministratorEmailID() />
		<cfset var localAdministratorPhoneID = arguments.bean.getAdministratorPhoneID() />
		<cfset var localMainPhoneNumberID = arguments.bean.getMainPhoneNumberID() />
		<cfset var localCompanyLogo = arguments.bean.getCompanyLogo() />
		<cfset var localAlign = arguments.bean.getAlign() />
		<cfset var localBgColor = arguments.bean.getBgColor() />
		<cfset var localFont = arguments.bean.getFont() />
		<cfset var localFontSize = arguments.bean.getFontSize() />
		<cfset var localFontColor = arguments.bean.getFontColor() />
		<cfset var localLoginPage = arguments.bean.getLoginPage() />
		<cfset var localTextBoxBackgroundColor = arguments.bean.getTextBoxBackgroundColor() />
		<cfset var localTitleHeaderColor = arguments.bean.getTitleHeaderColor() />
		<cfset var localTitleFontColor = arguments.bean.getTitleFontColor() />
		<cfset var localFooterFileName = arguments.bean.getFooterFileName() />
		<cfset var localHeaderBackgroundColor = arguments.bean.getHeaderBackgroundColor() />
		<cfset var localHeaderBorder = arguments.bean.getHeaderBorder() />
		<cfset var localHeaderBorderColor = arguments.bean.getHeaderBorderColor() />
		<cfset var localHeaderFileName = arguments.bean.getHeaderFileName() />
		<cfset var localHeaderHeight = arguments.bean.getHeaderHeight() />
		<cfset var localLeftNavigationFontColor = arguments.bean.getLeftNavigationFontColor() />
		<cfset var localLeftNavigationFontSize = arguments.bean.getLeftNavigationFontSize() />
		<cfset var localLeftNavigationBorder = arguments.bean.getLeftNavigationBorder() />
		<cfset var localLeftTemplateFileName = arguments.bean.getLeftTemplateFileName() />
		<cfset var localLeftNavigationBorderColor = arguments.bean.getLeftNavigationBorderColor() />
		<cfset var localRightTemplateFileName = arguments.bean.getRightTemplateFileName() />
		<cfset var localRightNavigationBorder = arguments.bean.getRightNavigationBorder() />
		<cfset var localRightTableBackgroundColor = arguments.bean.getRightTableBackgroundColor() />
		<cfset var localRightNavigationBorderColor = arguments.bean.getRightNavigationBorderColor() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateSite" datasource="#trim(arguments.ds)#">
				INSERT INTO Site (ApplicationName,SiteName,Directory,URLDomains,SessionTimeout,SupportEmailAddressID,AdministratorEmailID,AdministratorPhoneID,MainPhoneNumberID,CompanyLogo,Align,BgColor,Font,FontSize,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorder,HeaderBorderColor,HeaderFileName,HeaderHeight,LeftNavigationFontColor,LeftNavigationFontSize,LeftNavigationBorder,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightNavigationBorder,RightTableBackgroundColor,RightNavigationBorderColor,Active,InactiveCode)
				VALUES (	
					<cfif trim(localApplicationName) NEQ "" AND trim(localApplicationName) NEQ "@@" AND trim(localApplicationName) NEQ "NULL">						
						<cfqueryparam value="#trim(localApplicationName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localSiteName) NEQ "" AND trim(localSiteName) NEQ "@@" AND trim(localSiteName) NEQ "NULL">						
						<cfqueryparam value="#trim(localSiteName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localDirectory) NEQ "" AND trim(localDirectory) NEQ "@@" AND trim(localDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localDirectory)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localURLDomains) NEQ "" AND trim(localURLDomains) NEQ "@@" AND trim(localURLDomains) NEQ "NULL">						
						<cfqueryparam value="#trim(localURLDomains)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localSessionTimeout))>						
						<cfqueryparam value="#trim(localSessionTimeout)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localSupportEmailAddressID))>						
						<cfqueryparam value="#trim(localSupportEmailAddressID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localAdministratorEmailID))>						
						<cfqueryparam value="#trim(localAdministratorEmailID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localAdministratorPhoneID))>						
						<cfqueryparam value="#trim(localAdministratorPhoneID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMainPhoneNumberID))>						
						<cfqueryparam value="#trim(localMainPhoneNumberID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localCompanyLogo) NEQ "" AND trim(localCompanyLogo) NEQ "@@" AND trim(localCompanyLogo) NEQ "NULL">						
						<cfqueryparam value="#trim(localCompanyLogo)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAlign) NEQ "" AND trim(localAlign) NEQ "@@" AND trim(localAlign) NEQ "NULL">						
						<cfqueryparam value="#trim(localAlign)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localBgColor) NEQ "" AND trim(localBgColor) NEQ "@@" AND trim(localBgColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localBgColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFont) NEQ "" AND trim(localFont) NEQ "@@" AND trim(localFont) NEQ "NULL">						
						<cfqueryparam value="#trim(localFont)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localFontSize))>						
						<cfqueryparam value="#trim(localFontSize)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localFontColor) NEQ "" AND trim(localFontColor) NEQ "@@" AND trim(localFontColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localFontColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLoginPage) NEQ "" AND trim(localLoginPage) NEQ "@@" AND trim(localLoginPage) NEQ "NULL">						
						<cfqueryparam value="#trim(localLoginPage)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTextBoxBackgroundColor) NEQ "" AND trim(localTextBoxBackgroundColor) NEQ "@@" AND trim(localTextBoxBackgroundColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localTextBoxBackgroundColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTitleHeaderColor) NEQ "" AND trim(localTitleHeaderColor) NEQ "@@" AND trim(localTitleHeaderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localTitleHeaderColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTitleFontColor) NEQ "" AND trim(localTitleFontColor) NEQ "@@" AND trim(localTitleFontColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localTitleFontColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFooterFileName) NEQ "" AND trim(localFooterFileName) NEQ "@@" AND trim(localFooterFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localFooterFileName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localHeaderBackgroundColor) NEQ "" AND trim(localHeaderBackgroundColor) NEQ "@@" AND trim(localHeaderBackgroundColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeaderBackgroundColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localHeaderBorder))>						
						<cfqueryparam value="#trim(localHeaderBorder)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localHeaderBorderColor) NEQ "" AND trim(localHeaderBorderColor) NEQ "@@" AND trim(localHeaderBorderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeaderBorderColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localHeaderFileName) NEQ "" AND trim(localHeaderFileName) NEQ "@@" AND trim(localHeaderFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeaderFileName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localHeaderHeight))>						
						<cfqueryparam value="#trim(localHeaderHeight)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localLeftNavigationFontColor) NEQ "" AND trim(localLeftNavigationFontColor) NEQ "@@" AND trim(localLeftNavigationFontColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftNavigationFontColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localLeftNavigationFontSize))>						
						<cfqueryparam value="#trim(localLeftNavigationFontSize)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localLeftNavigationBorder))>						
						<cfqueryparam value="#trim(localLeftNavigationBorder)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localLeftTemplateFileName) NEQ "" AND trim(localLeftTemplateFileName) NEQ "@@" AND trim(localLeftTemplateFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftTemplateFileName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLeftNavigationBorderColor) NEQ "" AND trim(localLeftNavigationBorderColor) NEQ "@@" AND trim(localLeftNavigationBorderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftNavigationBorderColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localRightTemplateFileName) NEQ "" AND trim(localRightTemplateFileName) NEQ "@@" AND trim(localRightTemplateFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightTemplateFileName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localRightNavigationBorder))>						
						<cfqueryparam value="#trim(localRightNavigationBorder)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localRightTableBackgroundColor) NEQ "" AND trim(localRightTableBackgroundColor) NEQ "@@" AND trim(localRightTableBackgroundColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightTableBackgroundColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localRightNavigationBorderColor) NEQ "" AND trim(localRightNavigationBorderColor) NEQ "@@" AND trim(localRightNavigationBorderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightNavigationBorderColor)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS SiteID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setSiteID(qCreateSite.SiteID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="SiteBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="SiteID" required="yes" type="numeric" />		
		<cfset var qGetSite = "" />		
		
		<cfset qGetSite = getSite(trim(arguments.ds), trim(SiteID)) />
				
		<cfif qGetSite.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objSite = createObject("component", "SiteBean").init(arguments.ds);
			objSite.setSiteID(qGetSite.SiteID);
			objSite.setApplicationName(qGetSite.ApplicationName);
			objSite.setSiteName(qGetSite.SiteName);
			objSite.setDirectory(qGetSite.Directory);
			objSite.setURLDomains(qGetSite.URLDomains);
			objSite.setSessionTimeout(qGetSite.SessionTimeout);
			objSite.setSupportEmailAddressID(qGetSite.SupportEmailAddressID);
			objSite.setAdministratorEmailID(qGetSite.AdministratorEmailID);
			objSite.setAdministratorPhoneID(qGetSite.AdministratorPhoneID);
			objSite.setMainPhoneNumberID(qGetSite.MainPhoneNumberID);
			objSite.setCompanyLogo(qGetSite.CompanyLogo);
			objSite.setAlign(qGetSite.Align);
			objSite.setBgColor(qGetSite.BgColor);
			objSite.setFont(qGetSite.Font);
			objSite.setFontSize(qGetSite.FontSize);
			objSite.setFontColor(qGetSite.FontColor);
			objSite.setLoginPage(qGetSite.LoginPage);
			objSite.setTextBoxBackgroundColor(qGetSite.TextBoxBackgroundColor);
			objSite.setTitleHeaderColor(qGetSite.TitleHeaderColor);
			objSite.setTitleFontColor(qGetSite.TitleFontColor);
			objSite.setFooterFileName(qGetSite.FooterFileName);
			objSite.setHeaderBackgroundColor(qGetSite.HeaderBackgroundColor);
			objSite.setHeaderBorder(qGetSite.HeaderBorder);
			objSite.setHeaderBorderColor(qGetSite.HeaderBorderColor);
			objSite.setHeaderFileName(qGetSite.HeaderFileName);
			objSite.setHeaderHeight(qGetSite.HeaderHeight);
			objSite.setLeftNavigationFontColor(qGetSite.LeftNavigationFontColor);
			objSite.setLeftNavigationFontSize(qGetSite.LeftNavigationFontSize);
			objSite.setLeftNavigationBorder(qGetSite.LeftNavigationBorder);
			objSite.setLeftTemplateFileName(qGetSite.LeftTemplateFileName);
			objSite.setLeftNavigationBorderColor(qGetSite.LeftNavigationBorderColor);
			objSite.setRightTemplateFileName(qGetSite.RightTemplateFileName);
			objSite.setRightNavigationBorder(qGetSite.RightNavigationBorder);
			objSite.setRightTableBackgroundColor(qGetSite.RightTableBackgroundColor);
			objSite.setRightNavigationBorderColor(qGetSite.RightNavigationBorderColor);
			objSite.setActive(qGetSite.Active);
			objSite.setInactiveCode(qGetSite.InactiveCode);
			objSite.setDateCreated(qGetSite.DateCreated);
			objSite.setDateModified(qGetSite.DateModified);				
			return objSite;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SiteBean" />
		<cfset var qUpdateSite = "" />
		<cfset var localApplicationName = arguments.bean.getApplicationName() />
		<cfset var localSiteName = arguments.bean.getSiteName() />
		<cfset var localDirectory = arguments.bean.getDirectory() />
		<cfset var localURLDomains = arguments.bean.getURLDomains() />
		<cfset var localSessionTimeout = arguments.bean.getSessionTimeout() />
		<cfset var localSupportEmailAddressID = arguments.bean.getSupportEmailAddressID() />
		<cfset var localAdministratorEmailID = arguments.bean.getAdministratorEmailID() />
		<cfset var localAdministratorPhoneID = arguments.bean.getAdministratorPhoneID() />
		<cfset var localMainPhoneNumberID = arguments.bean.getMainPhoneNumberID() />
		<cfset var localCompanyLogo = arguments.bean.getCompanyLogo() />
		<cfset var localAlign = arguments.bean.getAlign() />
		<cfset var localBgColor = arguments.bean.getBgColor() />
		<cfset var localFont = arguments.bean.getFont() />
		<cfset var localFontSize = arguments.bean.getFontSize() />
		<cfset var localFontColor = arguments.bean.getFontColor() />
		<cfset var localLoginPage = arguments.bean.getLoginPage() />
		<cfset var localTextBoxBackgroundColor = arguments.bean.getTextBoxBackgroundColor() />
		<cfset var localTitleHeaderColor = arguments.bean.getTitleHeaderColor() />
		<cfset var localTitleFontColor = arguments.bean.getTitleFontColor() />
		<cfset var localFooterFileName = arguments.bean.getFooterFileName() />
		<cfset var localHeaderBackgroundColor = arguments.bean.getHeaderBackgroundColor() />
		<cfset var localHeaderBorder = arguments.bean.getHeaderBorder() />
		<cfset var localHeaderBorderColor = arguments.bean.getHeaderBorderColor() />
		<cfset var localHeaderFileName = arguments.bean.getHeaderFileName() />
		<cfset var localHeaderHeight = arguments.bean.getHeaderHeight() />
		<cfset var localLeftNavigationFontColor = arguments.bean.getLeftNavigationFontColor() />
		<cfset var localLeftNavigationFontSize = arguments.bean.getLeftNavigationFontSize() />
		<cfset var localLeftNavigationBorder = arguments.bean.getLeftNavigationBorder() />
		<cfset var localLeftTemplateFileName = arguments.bean.getLeftTemplateFileName() />
		<cfset var localLeftNavigationBorderColor = arguments.bean.getLeftNavigationBorderColor() />
		<cfset var localRightTemplateFileName = arguments.bean.getRightTemplateFileName() />
		<cfset var localRightNavigationBorder = arguments.bean.getRightNavigationBorder() />
		<cfset var localRightTableBackgroundColor = arguments.bean.getRightTableBackgroundColor() />
		<cfset var localRightNavigationBorderColor = arguments.bean.getRightNavigationBorderColor() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateSite" datasource="#trim(arguments.ds)#">
				UPDATE Site  SET
					
					ApplicationName =	
					<cfif trim(localApplicationName) NEQ "" AND trim(localApplicationName) NEQ "@@" AND trim(localApplicationName) NEQ "NULL">						
						<cfqueryparam value="#trim(localApplicationName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SiteName =	
					<cfif trim(localSiteName) NEQ "" AND trim(localSiteName) NEQ "@@" AND trim(localSiteName) NEQ "NULL">						
						<cfqueryparam value="#trim(localSiteName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Directory =	
					<cfif trim(localDirectory) NEQ "" AND trim(localDirectory) NEQ "@@" AND trim(localDirectory) NEQ "NULL">						
						<cfqueryparam value="#trim(localDirectory)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					URLDomains =	
					<cfif trim(localURLDomains) NEQ "" AND trim(localURLDomains) NEQ "@@" AND trim(localURLDomains) NEQ "NULL">						
						<cfqueryparam value="#trim(localURLDomains)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SessionTimeout =				
					<cfif IsNumeric(trim(localSessionTimeout))>						
						<cfqueryparam value="#trim(localSessionTimeout)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					SupportEmailAddressID =				
					<cfif IsNumeric(trim(localSupportEmailAddressID))>						
						<cfqueryparam value="#trim(localSupportEmailAddressID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AdministratorEmailID =				
					<cfif IsNumeric(trim(localAdministratorEmailID))>						
						<cfqueryparam value="#trim(localAdministratorEmailID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AdministratorPhoneID =				
					<cfif IsNumeric(trim(localAdministratorPhoneID))>						
						<cfqueryparam value="#trim(localAdministratorPhoneID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MainPhoneNumberID =				
					<cfif IsNumeric(trim(localMainPhoneNumberID))>						
						<cfqueryparam value="#trim(localMainPhoneNumberID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					CompanyLogo =	
					<cfif trim(localCompanyLogo) NEQ "" AND trim(localCompanyLogo) NEQ "@@" AND trim(localCompanyLogo) NEQ "NULL">						
						<cfqueryparam value="#trim(localCompanyLogo)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Align =	
					<cfif trim(localAlign) NEQ "" AND trim(localAlign) NEQ "@@" AND trim(localAlign) NEQ "NULL">						
						<cfqueryparam value="#trim(localAlign)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					BgColor =	
					<cfif trim(localBgColor) NEQ "" AND trim(localBgColor) NEQ "@@" AND trim(localBgColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localBgColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Font =	
					<cfif trim(localFont) NEQ "" AND trim(localFont) NEQ "@@" AND trim(localFont) NEQ "NULL">						
						<cfqueryparam value="#trim(localFont)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FontSize =				
					<cfif IsNumeric(trim(localFontSize))>						
						<cfqueryparam value="#trim(localFontSize)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					FontColor =	
					<cfif trim(localFontColor) NEQ "" AND trim(localFontColor) NEQ "@@" AND trim(localFontColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localFontColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LoginPage =	
					<cfif trim(localLoginPage) NEQ "" AND trim(localLoginPage) NEQ "@@" AND trim(localLoginPage) NEQ "NULL">						
						<cfqueryparam value="#trim(localLoginPage)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TextBoxBackgroundColor =	
					<cfif trim(localTextBoxBackgroundColor) NEQ "" AND trim(localTextBoxBackgroundColor) NEQ "@@" AND trim(localTextBoxBackgroundColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localTextBoxBackgroundColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TitleHeaderColor =	
					<cfif trim(localTitleHeaderColor) NEQ "" AND trim(localTitleHeaderColor) NEQ "@@" AND trim(localTitleHeaderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localTitleHeaderColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TitleFontColor =	
					<cfif trim(localTitleFontColor) NEQ "" AND trim(localTitleFontColor) NEQ "@@" AND trim(localTitleFontColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localTitleFontColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FooterFileName =	
					<cfif trim(localFooterFileName) NEQ "" AND trim(localFooterFileName) NEQ "@@" AND trim(localFooterFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localFooterFileName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					HeaderBackgroundColor =	
					<cfif trim(localHeaderBackgroundColor) NEQ "" AND trim(localHeaderBackgroundColor) NEQ "@@" AND trim(localHeaderBackgroundColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeaderBackgroundColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					HeaderBorder =				
					<cfif IsNumeric(trim(localHeaderBorder))>						
						<cfqueryparam value="#trim(localHeaderBorder)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					HeaderBorderColor =	
					<cfif trim(localHeaderBorderColor) NEQ "" AND trim(localHeaderBorderColor) NEQ "@@" AND trim(localHeaderBorderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeaderBorderColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					HeaderFileName =	
					<cfif trim(localHeaderFileName) NEQ "" AND trim(localHeaderFileName) NEQ "@@" AND trim(localHeaderFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localHeaderFileName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					HeaderHeight =				
					<cfif IsNumeric(trim(localHeaderHeight))>						
						<cfqueryparam value="#trim(localHeaderHeight)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					LeftNavigationFontColor =	
					<cfif trim(localLeftNavigationFontColor) NEQ "" AND trim(localLeftNavigationFontColor) NEQ "@@" AND trim(localLeftNavigationFontColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftNavigationFontColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LeftNavigationFontSize =				
					<cfif IsNumeric(trim(localLeftNavigationFontSize))>						
						<cfqueryparam value="#trim(localLeftNavigationFontSize)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					LeftNavigationBorder =				
					<cfif IsNumeric(trim(localLeftNavigationBorder))>						
						<cfqueryparam value="#trim(localLeftNavigationBorder)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					LeftTemplateFileName =	
					<cfif trim(localLeftTemplateFileName) NEQ "" AND trim(localLeftTemplateFileName) NEQ "@@" AND trim(localLeftTemplateFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftTemplateFileName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LeftNavigationBorderColor =	
					<cfif trim(localLeftNavigationBorderColor) NEQ "" AND trim(localLeftNavigationBorderColor) NEQ "@@" AND trim(localLeftNavigationBorderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localLeftNavigationBorderColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					RightTemplateFileName =	
					<cfif trim(localRightTemplateFileName) NEQ "" AND trim(localRightTemplateFileName) NEQ "@@" AND trim(localRightTemplateFileName) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightTemplateFileName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					RightNavigationBorder =				
					<cfif IsNumeric(trim(localRightNavigationBorder))>						
						<cfqueryparam value="#trim(localRightNavigationBorder)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					RightTableBackgroundColor =	
					<cfif trim(localRightTableBackgroundColor) NEQ "" AND trim(localRightTableBackgroundColor) NEQ "@@" AND trim(localRightTableBackgroundColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightTableBackgroundColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					RightNavigationBorderColor =	
					<cfif trim(localRightNavigationBorderColor) NEQ "" AND trim(localRightNavigationBorderColor) NEQ "@@" AND trim(localRightNavigationBorderColor) NEQ "NULL">						
						<cfqueryparam value="#trim(localRightNavigationBorderColor)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE SiteID = <cfqueryparam value="#trim(arguments.bean.getSiteID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="SiteBean" />
		<cfset var qDeleteSite = "">

		<cfquery name="qDeleteSite" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Site
			WHERE SiteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getSiteID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSite" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="SiteID" required="yes" type="numeric" />		
		<cfset var qGetSite = "" />		
	
		<cfquery name="qGetSite" datasource="#trim(arguments.ds)#">
	  		SELECT SiteID,ApplicationName,SiteName,Directory,URLDomains,SessionTimeout,SupportEmailAddressID,AdministratorEmailID,AdministratorPhoneID,MainPhoneNumberID,CompanyLogo,Align,BgColor,Font,FontSize,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorder,HeaderBorderColor,HeaderFileName,HeaderHeight,LeftNavigationFontColor,LeftNavigationFontSize,LeftNavigationBorder,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightNavigationBorder,RightTableBackgroundColor,RightNavigationBorderColor,Active,InactiveCode,DateCreated,DateModified
			FROM Site  
			WHERE SiteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.SiteID)#" /> 
		</cfquery>
		
		<cfreturn qGetSite>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


