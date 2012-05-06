<!---- appAdminUsersWorkGroup.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50">
 	<cfset wholeNumbers = attributes.wholeNumbers>
 
	<cfparam name="attributes.numberOfItemsPerRow" default="2">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>
	
	<cfparam name="attributes.workGroupID" default="">
	<cfset workGroupID = attributes.workGroupID>
	
	<cfif IsDefined("form.workGroupID") AND form.workGroupID NEQ "">
		<cfset workGroupID = form.workGroupID>
	<cfelseif IsDefined("url.workGroupID") AND url.workGroupID NEQ "">
		<cfset workGroupID = url.workGroupID>	
	</cfif>
	
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Query for the users of this client. Except for Client Account                  --->
<!-------------------------------------------------------------------------------------->	
	<!---<cfquery name="getClientUsers" datasource="#trim(request.datasource)#">
		SELECT u.usersID, e.FName + ' '  + e.LName AS Fullname, u.Active  
		FROM Entity AS e   LEFT JOIN pa_master.Users AS u   ON e.EntityID = u.EntityID
		WHERE e.ClientID = #trim(session.ClientID)# AND e.ObjectTypeID = 2
		ORDER BY u.Active DESC				
	</cfquery>--->
	<cfset getClientUsers = session.Client.getClientsUsers(ClientID: session.ClientID)>
	<cfif getClientUsers.RecordCount LT 1>
		<cf_gcGeneralErrorTemplate				
			message="The Client has no users specified.">
	</cfif>	
	

	
<!-------------------------------------------------------------------------------------->
<!--- Show message if any.                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			<br><br><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font><br>	
		</cfoutput>
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Decide what the user will see.                                                 --->
<!-------------------------------------------------------------------------------------->	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If the workGroupID is Defined the user wants to see the users in this group.   --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(workGroupID)>
		
		<cf_tagAdminUsersWorkGroupShow workgroupID="#trim(workGroupID)#">
	
	<!-------------------------------------------------------------------------------------->
	<!--- The user has requested the page show all groups.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cfelse>
		
		<cfquery name="getAllGroups" datasource="#trim(request.datasource)#">
			SELECT WorkGroupID
			FROM WorkGroup
		</cfquery>
			
		<cfoutput>
			<table border="0" cellpadding="5" cellspacing="0" width="75%">
		   		<tr>
					<cfset count = 1>
		    		<cfloop list="#trim(valuelist(getAllGroups.WorkGroupID))#" index="i">    
		     			<td valign="top">
		      				<cf_tagAdminUsersWorkGroupShow workgroupID="#trim(i)#" view="all">
		     			</td>
		     		<cfif ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>
		      			</tr>     
		     		</cfif>
					<cfset count = count + 1>         
		    	</cfloop>  
			</table>				
		</cfoutput>
		
		
		
		
	</cfif>
	
	