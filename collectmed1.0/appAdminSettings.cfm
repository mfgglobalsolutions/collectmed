<!---- appAdminSettings.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.checkroleids" default="">
	<cfset checkroleids = attributes.checkroleids>
	
	<cfparam name="attributes.checkuserids" default="">
	<cfset checkuserids = attributes.checkuserids>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the users that can be tied to settings.                                    --->
<!--------------------------------------------------------------------------------------> 	
	<cfset getClientUsers = session.Client.getClientsUsers(ClientID: session.ClientID)>	

	
<!-------------------------------------------------------------------------------------->
<!--- Get the settings XML.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset getClientXML = session.Client.getClientSettingXML(ClientID: session.ClientID)>		
	
	<cfif getClientXML NEQ "" AND IsXML(getClientXML)>
		<cfset cXML = XMLParse(getClientXML)>				
		<cfset checkroleids = trim(cXML.setting.intake.datemodification.roleids.xmlText)>	
		<cfset checkuserids = trim(cXML.setting.intake.datemodification.userids.xmlText)>																												
	</cfif>		
	
	
<!-------------------------------------------------------------------------------------->
<!--- Show the Intake Modification Date setting.                                     --->
<!-------------------------------------------------------------------------------------->
	<cf_tagSettingsIntakeDAteModificationNotice>
	

