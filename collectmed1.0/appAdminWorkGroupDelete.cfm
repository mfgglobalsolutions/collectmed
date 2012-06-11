<!---- appAdminWorkGroupDelete.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.workGroupID" default="">
	<cfset workGroupID = attributes.workGroupID>
	
	<cfif IsDefined("form.workGroupID") AND form.workGroupID NEQ "">
		<cfset workGroupID = form.workGroupID>
	<cfelseif IsDefined("url.workGroupID") AND url.workGroupID NEQ "">
		<cfset workGroupID = url.workGroupID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="workGroupID"
		fieldnames="Work Group ID"
		datatypes="numeric">	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Check that the work group exists and that there are no users attached.         --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getWorkGroup" datasource="#trim(request.datasource)#">
		SELECT COUNT(uwg.WorkGroupID) as NumOfUsers, wg.WorkGroupID, wg.WorkGroupName
		FROM workgroup AS wg LEFT JOIN UsersWorkGroup AS uwg ON wg.WorkGroupID = uwg.WorkGroupID
		WHERE wg.WorkGroupID = #trim(WorkGroupID)#
		GROUP BY uwg.WorkGroupID, wg.WorkGroupID, wg.WorkGroupName		
	</cfquery>
	
	<cfif getWorkGroup.RecordCount NEQ 1>
		<cf_gcGeneralErrorTemplate				
			message="The Work Group ID sent in does not exist.">
	<cfelseif getWorkGroup.NumOfUsers GT 0>
		<cf_gcGeneralErrorTemplate				
			message="The Work Group you are attempting to delete has users attached to it. This work group cannot be deleted until all users are detached from it.">		
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Delete the Work Group                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="delWorkGroup" datasource="#trim(request.datasource)#">
		DELETE FROM workgroup
		WHERE WorkGroupID = #trim(WorkGroupID)#
	</cfquery>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- relocate back to the work groups                                               --->
<!-------------------------------------------------------------------------------------->
	<cflocation addtoken="No" url="appAdminWorkGroupsManage.cfm">
	
	
