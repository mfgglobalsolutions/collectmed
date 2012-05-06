
<cfcomponent>
  
   <cffunction name="onIncomingMessage" output="no">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
						
			<cf_gcCFScriptIncludes>		
			<cfset data = CFEvent.data>								
			
	<!--- ****************************** DO NOT CHANGE ABOVE *********************************** --->		
			
			
			
			
			<cfset SupportEmailAddressID = "#trim(data.SupportEmailAddressID)#"> 	
															
			<cfset message = "There is an issue with Patient Accounts table.">													
			<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
			<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
			<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" jsubject="Mulitple entries in Patient IMMEDIATE ATTENTION REQUIRED." message="<strong>User Note:</strong><br>#trim(Message)#<br><br><strong>Admin Note:</strong><br> There is an issue with more than one patient ID record with the same insuranceID.<br><br>QUERY ATTEMPTED: SELECT patientID FROM Patient   WHERE InsuranceID =">	
			<cfthrow message="#trim(message)#">	
		
	
	
	
	
	<!--- ****************************** DO NOT CHANGE BELOW *********************************** --->		
							
			<cfset tempClear = StructClear(Request)>				
	
			
			<cfcatch type="Any">				
				
				<cf_gcGatewayLogger code="115">				
			
			</cfcatch>
		
		
		</cftry>
     
   </cffunction>
   
</cfcomponent>

	