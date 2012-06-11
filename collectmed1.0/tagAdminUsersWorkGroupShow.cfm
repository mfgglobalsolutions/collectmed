
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80">
 	<cfset wholeNumbers = attributes.wholeNumbers>
 
	<cfparam name="attributes.numberOfItemsPerRow" default="2">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>
	
	<cfparam name="attributes.workGroupID" default="">
	<cfset workGroupID = attributes.workGroupID>
	
	<cfparam name="attributes.view" default="">
	<cfset view = attributes.view>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="workGroupID"
		fieldnames="Work Group ID"
		datatypes="numeric">


<!-------------------------------------------------------------------------------------->
<!--- query for the workGroup record.                                                --->
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
	</cfif>

<!-------------------------------------------------------------------------------------->
<!--- Get the userss of this group.                                                  --->
<!-------------------------------------------------------------------------------------->		
	<cfquery name="getWorkGroups" datasource="#trim(request.datasource)#">
		SELECT UsersID
		FROM usersworkgroup  
		WHERE WorkGroupID = #trim(WorkGroupID)# 		
	</cfquery>
	
	<cfset groupUsers = valueList(getWorkGroups.UsersID)>
	
	
	<cfoutput>
			
		<br><br>
		<cf_gcBorderedTable	title="Edit&nbsp;""#trim(getWorkGroup.WorkGroupName)#""&nbsp;Group&nbsp;Users" tablealign="center">			
			<form method="post" action="appAdminUsersWorkGroupUpdate.cfm">
				<input type="Hidden" name="WorkGroupID" value="#trim(WorkGroupID)#">
				<input type="Hidden" name="view" value="#trim(view)#">
				<table border="0" cellpadding="2" cellspacing="2" align="center">
					<tr>
						<td class="SiteLabel" nowrap>		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								<strong>Users available to this group:</strong>									
							</font>								
						</td>							
					</tr>	
					<tr>
						<td>		
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								<table>								
									<tr>
									<cfset count = 1>
									<cfloop query="caller.getClientUsers">										
										<cfif Active NEQ 0>
											<td class="SiteLabel" nowrap>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="Checkbox" <cfif Active EQ 0>DISABLED</cfif> <cfif ListFind(groupUsers, trim(UsersID))> CHECKED</cfif> value="#trim(UsersID)#" name="UserCheckbox_#trim(UsersID)#">&nbsp;<cfif Active EQ 0><font color="c0c0c0">#trim(FullName)#&nbsp;(Inactive)</font><cfelse>#trim(FullName)#</cfif>
											</td>
											<cfif ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>
		      								</tr>     
		     								</cfif>
											<cfset count = count + 1>
										</cfif>         
									</cfloop>
								</table>
							</font>								
						</td>							
					</tr>	
																
					<tr>
						<td align="center" colspan="2">	<br><br>	
							<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
								<cf_gcSubmitButton value="Update">
								<input type="hidden" name="Submitted" value="yes">									
							</font>		
						</td>
					</tr>														
				</table>
			</form>	
		</cf_gcBorderedTable>
		
	</cfoutput>
	
	
<!---<cfoutput>
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
		</cfoutput>--->

