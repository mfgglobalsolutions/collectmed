<!--- appFormPatientIntakeForm.cfm --->





<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationTop.cfm";
</cfscript>





<!-------------------------------------------------------------------------------------->
<!--- Call the custom tag to show the form and send it with an initial entry.        --->
<!-------------------------------------------------------------------------------------->
	<cf_tagFormPatientIntakeForm
		hidden_step="1|#DateFormat(NOW(), 'mm/dd/yyyy')#|#TimeFormat(NOW(), 'hh:mm:ss tt')#|#trim(session.User.getUsersID())#|#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#~">


	
	


<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationBottom.cfm";
</cfscript>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Do not show debug.                                                             --->
<!-------------------------------------------------------------------------------------->	
	<!---<cfsetting showdebugoutput="No">--->

	