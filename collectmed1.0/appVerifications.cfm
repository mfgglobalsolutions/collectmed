





<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationTop.cfm";
</cfscript>

	
	


<cfscript>
	variables.filterVF = structNew();
	variables.filterVF.UsersID = trim(session.user.getUsersID());
	variables.filterVF.Active = 1;
	variables.filterVF.OrderBy = "InsuranceCompanyID";
	variables.VerificationFileSVC = application.beanFactory.getBean('old_VerificationFileService');	
	variables.allVerifications = variables.VerificationFileSVC.getAllVerificationFiles(variables.filterVF);
	
	variables.allInsuranceCompanies = "";
	if(variables.allVerifications.recordCount GTE 1){
		variables.filterInsuranceCompany = structNew();
		variables.filterInsuranceCompany.InsuranceCompanyID = ValueList(variables.allVerifications.InsuranceCompanyID);
		variables.filterInsuranceCompany.Active = 1;	
		variables.InsuranceCompanySVC = application.beanFactory.getBean('old_InsuranceCompanyService');	
		variables.allInsuranceCompanies = variables.InsuranceCompanySVC.getAllInsuranceCompanys(variables.filterInsuranceCompany);	
	};
</cfscript>


<style type="text/css">
	td{
		font-size: 12px;
	}
</style>

<cfoutput>
	<br>	
	<table cellspacing="4" cellpadding="2" border="0" align="center">	
		<tr>		   
			<td align="left" valign="top">				
				<table cellspacing="0" cellpadding="10" border="0">
					<tr>
						<td valign="top">
							<cf_gcBorderedTable	title="Create Verification File" tableWidth="100%">	
								<table>
									<tr>
										<td>											
											<a href="appVerificationCreate.cfm">TX Medicaid Verifications</a>
										</td>										
									</tr>
								</table>
							</cf_gcBorderedTable>	
						</td>
						<td valign="top">
							<cf_gcBorderedTable	title="My Verifications" tableWidth="100%">	
								<table>
								<cfif IsQuery(variables.allVerifications)>
									<cfloop query="variables.allVerifications">
										<cfquery name="getThisICName" dbtype="query">
											SELECT InsuranceCompanyName
											FROM variables.allInsuranceCompanies
											WHERE InsuranceCompanyID = #InsuranceCompanyID#
										</cfquery>
										<tr><td><a href="appVerification.cfm?fileID=#trim(verificationFileID)#">#getThisICName.InsuranceCompanyName# - #DateFormat(DateCreated, 'MM/DD/YY')# #TimeFormat(DateCreated, 'long')#</a></td><td><a href="appVerificationCreate.cfm?icid=#InsuranceCompanyID#&fileID=#trim(verificationFileID)#">Copy to New</a></td></tr>
									</cfloop>
								</table>									
								<cfelse>
									<tr><td>No Verifications Found</td></tr>	
								</cfif>											
							</cf_gcBorderedTable>	
						</td>
					</tr>						
				</table>				
			</td>
		</tr>			
	</table>
	<br><br>
</cfoutput>






<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationBottom.cfm";
</cfscript>





