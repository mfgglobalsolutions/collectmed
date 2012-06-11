 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="QuoteBean" />
		
		<cfset var qCreateQuote = "" />		
		
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localhidden_UsersID = arguments.bean.gethidden_UsersID() />
		<cfset var localhidden_TimeStart = arguments.bean.gethidden_TimeStart() />
		<cfset var localcallerFNameTBox = arguments.bean.getcallerFNameTBox() />
		<cfset var localcallerMInitialTBox = arguments.bean.getcallerMInitialTBox() />
		<cfset var localcallerLNameTBox = arguments.bean.getcallerLNameTBox() />
		<cfset var localcallerPhoneTBox = arguments.bean.getcallerPhoneTBox() />
		<cfset var localpatientFNameTBox = arguments.bean.getpatientFNameTBox() />
		<cfset var localpatientMInitialTBox = arguments.bean.getpatientMInitialTBox() />
		<cfset var localpatientLNameTBox = arguments.bean.getpatientLNameTBox() />
		<cfset var localroomNumberTBox = arguments.bean.getroomNumberTBox() />
		<cfset var localbedNumberTBox = arguments.bean.getbedNumberTBox() />
		<cfset var localpatientAddressTBox = arguments.bean.getpatientAddressTBox() />
		<cfset var localpatientCityTBox = arguments.bean.getpatientCityTBox() />
		<cfset var localpatientStateTBox = arguments.bean.getpatientStateTBox() />
		<cfset var localpatientZipTBox = arguments.bean.getpatientZipTBox() />
		<cfset var localpatientPhoneTBox = arguments.bean.getpatientPhoneTBox() />
		<cfset var localpatientDOBMM = arguments.bean.getpatientDOBMM() />
		<cfset var localpatientDOBDD = arguments.bean.getpatientDOBDD() />
		<cfset var localpatientDOBYY = arguments.bean.getpatientDOBYY() />
		<cfset var localOPTION_3a_CBox_PatientSexMale = arguments.bean.getOPTION_3a_CBox_PatientSexMale() />
		<cfset var localOPTION_3a_CBox_PatientSexFemale = arguments.bean.getOPTION_3a_CBox_PatientSexFemale() />
		<cfset var localpatientSSNTBox = arguments.bean.getpatientSSNTBox() />
		<cfset var localpatientHeightFeet = arguments.bean.getpatientHeightFeet() />
		<cfset var localpatientHeightInches = arguments.bean.getpatientHeightInches() />
		<cfset var localpatientWeightTBox = arguments.bean.getpatientWeightTBox() />
		<cfset var localalternateContactFNameTBox = arguments.bean.getalternateContactFNameTBox() />
		<cfset var localalternateContactMInitialTBox = arguments.bean.getalternateContactMInitialTBox() />
		<cfset var localalternateContactLNameTBox = arguments.bean.getalternateContactLNameTBox() />
		<cfset var localalternateContactRelationshipTBox = arguments.bean.getalternateContactRelationshipTBox() />
		<cfset var localalternateContactPhoneTBox = arguments.bean.getalternateContactPhoneTBox() />
		<cfset var localalternateContactWorkPhoneTBox = arguments.bean.getalternateContactWorkPhoneTBox() />
		<cfset var localprimaryInsuranceNameTBox = arguments.bean.getprimaryInsuranceNameTBox() />
		<cfset var localsecondaryInsuranceNameTBox = arguments.bean.getsecondaryInsuranceNameTBox() />
		<cfset var localprimaryPolicyNumberTBox = arguments.bean.getprimaryPolicyNumberTBox() />
		<cfset var localsecondaryPolicyNumberTBox = arguments.bean.getsecondaryPolicyNumberTBox() />
		<cfset var localorderingPhysicianFNameTBox = arguments.bean.getorderingPhysicianFNameTBox() />
		<cfset var localorderingPhysicianMInitialTBox = arguments.bean.getorderingPhysicianMInitialTBox() />
		<cfset var localorderingPhysicianLNameTBox = arguments.bean.getorderingPhysicianLNameTBox() />
		<cfset var localorderingPhysicianPhoneTBox = arguments.bean.getorderingPhysicianPhoneTBox() />
		<cfset var localprinted = arguments.bean.getprinted() />
		<cfset var localCancelled = arguments.bean.getCancelled() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateQuote" datasource="#trim(arguments.ds)#">
				INSERT INTO quote (ClientID,AssignedToUserID,hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localhidden_UsersID) NEQ "" AND trim(localhidden_UsersID) NEQ "@@" AND trim(localhidden_UsersID) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_UsersID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhidden_TimeStart) NEQ "" AND trim(localhidden_TimeStart) NEQ "@@" AND trim(localhidden_TimeStart) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_TimeStart)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerFNameTBox) NEQ "" AND trim(localcallerFNameTBox) NEQ "@@" AND trim(localcallerFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerMInitialTBox) NEQ "" AND trim(localcallerMInitialTBox) NEQ "@@" AND trim(localcallerMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerLNameTBox) NEQ "" AND trim(localcallerLNameTBox) NEQ "@@" AND trim(localcallerLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerPhoneTBox) NEQ "" AND trim(localcallerPhoneTBox) NEQ "@@" AND trim(localcallerPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientFNameTBox) NEQ "" AND trim(localpatientFNameTBox) NEQ "@@" AND trim(localpatientFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientMInitialTBox) NEQ "" AND trim(localpatientMInitialTBox) NEQ "@@" AND trim(localpatientMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientLNameTBox) NEQ "" AND trim(localpatientLNameTBox) NEQ "@@" AND trim(localpatientLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localroomNumberTBox) NEQ "" AND trim(localroomNumberTBox) NEQ "@@" AND trim(localroomNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localroomNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localbedNumberTBox) NEQ "" AND trim(localbedNumberTBox) NEQ "@@" AND trim(localbedNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localbedNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientAddressTBox) NEQ "" AND trim(localpatientAddressTBox) NEQ "@@" AND trim(localpatientAddressTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientAddressTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientCityTBox) NEQ "" AND trim(localpatientCityTBox) NEQ "@@" AND trim(localpatientCityTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientCityTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientStateTBox) NEQ "" AND trim(localpatientStateTBox) NEQ "@@" AND trim(localpatientStateTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientStateTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientZipTBox) NEQ "" AND trim(localpatientZipTBox) NEQ "@@" AND trim(localpatientZipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientZipTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientPhoneTBox) NEQ "" AND trim(localpatientPhoneTBox) NEQ "@@" AND trim(localpatientPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientDOBMM) NEQ "" AND trim(localpatientDOBMM) NEQ "@@" AND trim(localpatientDOBMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientDOBMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientDOBDD) NEQ "" AND trim(localpatientDOBDD) NEQ "@@" AND trim(localpatientDOBDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientDOBDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientDOBYY) NEQ "" AND trim(localpatientDOBYY) NEQ "@@" AND trim(localpatientDOBYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientDOBYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_3a_CBox_PatientSexMale) NEQ "" AND trim(localOPTION_3a_CBox_PatientSexMale) NEQ "@@" AND trim(localOPTION_3a_CBox_PatientSexMale) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3a_CBox_PatientSexMale)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_3a_CBox_PatientSexFemale) NEQ "" AND trim(localOPTION_3a_CBox_PatientSexFemale) NEQ "@@" AND trim(localOPTION_3a_CBox_PatientSexFemale) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3a_CBox_PatientSexFemale)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientSSNTBox) NEQ "" AND trim(localpatientSSNTBox) NEQ "@@" AND trim(localpatientSSNTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientSSNTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientHeightFeet) NEQ "" AND trim(localpatientHeightFeet) NEQ "@@" AND trim(localpatientHeightFeet) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientHeightFeet)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientHeightInches) NEQ "" AND trim(localpatientHeightInches) NEQ "@@" AND trim(localpatientHeightInches) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientHeightInches)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientWeightTBox) NEQ "" AND trim(localpatientWeightTBox) NEQ "@@" AND trim(localpatientWeightTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientWeightTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactFNameTBox) NEQ "" AND trim(localalternateContactFNameTBox) NEQ "@@" AND trim(localalternateContactFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactMInitialTBox) NEQ "" AND trim(localalternateContactMInitialTBox) NEQ "@@" AND trim(localalternateContactMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactLNameTBox) NEQ "" AND trim(localalternateContactLNameTBox) NEQ "@@" AND trim(localalternateContactLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactRelationshipTBox) NEQ "" AND trim(localalternateContactRelationshipTBox) NEQ "@@" AND trim(localalternateContactRelationshipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactRelationshipTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactPhoneTBox) NEQ "" AND trim(localalternateContactPhoneTBox) NEQ "@@" AND trim(localalternateContactPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactWorkPhoneTBox) NEQ "" AND trim(localalternateContactWorkPhoneTBox) NEQ "@@" AND trim(localalternateContactWorkPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactWorkPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localprimaryInsuranceNameTBox) NEQ "" AND trim(localprimaryInsuranceNameTBox) NEQ "@@" AND trim(localprimaryInsuranceNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localprimaryInsuranceNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localsecondaryInsuranceNameTBox) NEQ "" AND trim(localsecondaryInsuranceNameTBox) NEQ "@@" AND trim(localsecondaryInsuranceNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localsecondaryInsuranceNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localprimaryPolicyNumberTBox) NEQ "" AND trim(localprimaryPolicyNumberTBox) NEQ "@@" AND trim(localprimaryPolicyNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localprimaryPolicyNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localsecondaryPolicyNumberTBox) NEQ "" AND trim(localsecondaryPolicyNumberTBox) NEQ "@@" AND trim(localsecondaryPolicyNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localsecondaryPolicyNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianFNameTBox) NEQ "" AND trim(localorderingPhysicianFNameTBox) NEQ "@@" AND trim(localorderingPhysicianFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianMInitialTBox) NEQ "" AND trim(localorderingPhysicianMInitialTBox) NEQ "@@" AND trim(localorderingPhysicianMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianLNameTBox) NEQ "" AND trim(localorderingPhysicianLNameTBox) NEQ "@@" AND trim(localorderingPhysicianLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianPhoneTBox) NEQ "" AND trim(localorderingPhysicianPhoneTBox) NEQ "@@" AND trim(localorderingPhysicianPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localprinted) NEQ "" AND trim(localprinted) NEQ "@@" AND trim(localprinted) NEQ "NULL">						
						<cfqueryparam value="#trim(localprinted)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCancelled) NEQ "" AND trim(localCancelled) NEQ "@@" AND trim(localCancelled) NEQ "NULL">						
						<cfqueryparam value="#trim(localCancelled)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS QuoteID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setQuoteID(qCreateQuote.QuoteID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="QuoteBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="QuoteID" required="yes" type="numeric" />		
		<cfset var qGetQuote = "" />		
		
		<cfset qGetQuote = getQuote(trim(arguments.ds), trim(QuoteID)) />
				
		<cfif qGetQuote.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objQuote = createObject("component", "QuoteBean").init(arguments.ds);
			objQuote.setQuoteID(qGetQuote.QuoteID);
			objQuote.setClientID(qGetQuote.ClientID);
			objQuote.setAssignedToUserID(qGetQuote.AssignedToUserID);
			objQuote.sethidden_UsersID(qGetQuote.hidden_UsersID);
			objQuote.sethidden_TimeStart(qGetQuote.hidden_TimeStart);
			objQuote.setcallerFNameTBox(qGetQuote.callerFNameTBox);
			objQuote.setcallerMInitialTBox(qGetQuote.callerMInitialTBox);
			objQuote.setcallerLNameTBox(qGetQuote.callerLNameTBox);
			objQuote.setcallerPhoneTBox(qGetQuote.callerPhoneTBox);
			objQuote.setpatientFNameTBox(qGetQuote.patientFNameTBox);
			objQuote.setpatientMInitialTBox(qGetQuote.patientMInitialTBox);
			objQuote.setpatientLNameTBox(qGetQuote.patientLNameTBox);
			objQuote.setroomNumberTBox(qGetQuote.roomNumberTBox);
			objQuote.setbedNumberTBox(qGetQuote.bedNumberTBox);
			objQuote.setpatientAddressTBox(qGetQuote.patientAddressTBox);
			objQuote.setpatientCityTBox(qGetQuote.patientCityTBox);
			objQuote.setpatientStateTBox(qGetQuote.patientStateTBox);
			objQuote.setpatientZipTBox(qGetQuote.patientZipTBox);
			objQuote.setpatientPhoneTBox(qGetQuote.patientPhoneTBox);
			objQuote.setpatientDOBMM(qGetQuote.patientDOBMM);
			objQuote.setpatientDOBDD(qGetQuote.patientDOBDD);
			objQuote.setpatientDOBYY(qGetQuote.patientDOBYY);
			objQuote.setOPTION_3a_CBox_PatientSexMale(qGetQuote.OPTION_3a_CBox_PatientSexMale);
			objQuote.setOPTION_3a_CBox_PatientSexFemale(qGetQuote.OPTION_3a_CBox_PatientSexFemale);
			objQuote.setpatientSSNTBox(qGetQuote.patientSSNTBox);
			objQuote.setpatientHeightFeet(qGetQuote.patientHeightFeet);
			objQuote.setpatientHeightInches(qGetQuote.patientHeightInches);
			objQuote.setpatientWeightTBox(qGetQuote.patientWeightTBox);
			objQuote.setalternateContactFNameTBox(qGetQuote.alternateContactFNameTBox);
			objQuote.setalternateContactMInitialTBox(qGetQuote.alternateContactMInitialTBox);
			objQuote.setalternateContactLNameTBox(qGetQuote.alternateContactLNameTBox);
			objQuote.setalternateContactRelationshipTBox(qGetQuote.alternateContactRelationshipTBox);
			objQuote.setalternateContactPhoneTBox(qGetQuote.alternateContactPhoneTBox);
			objQuote.setalternateContactWorkPhoneTBox(qGetQuote.alternateContactWorkPhoneTBox);
			objQuote.setprimaryInsuranceNameTBox(qGetQuote.primaryInsuranceNameTBox);
			objQuote.setsecondaryInsuranceNameTBox(qGetQuote.secondaryInsuranceNameTBox);
			objQuote.setprimaryPolicyNumberTBox(qGetQuote.primaryPolicyNumberTBox);
			objQuote.setsecondaryPolicyNumberTBox(qGetQuote.secondaryPolicyNumberTBox);
			objQuote.setorderingPhysicianFNameTBox(qGetQuote.orderingPhysicianFNameTBox);
			objQuote.setorderingPhysicianMInitialTBox(qGetQuote.orderingPhysicianMInitialTBox);
			objQuote.setorderingPhysicianLNameTBox(qGetQuote.orderingPhysicianLNameTBox);
			objQuote.setorderingPhysicianPhoneTBox(qGetQuote.orderingPhysicianPhoneTBox);
			objQuote.setprinted(qGetQuote.printed);
			objQuote.setCancelled(qGetQuote.Cancelled);
			objQuote.setActive(qGetQuote.Active);
			objQuote.setInactiveCode(qGetQuote.InactiveCode);
			objQuote.setDateCreated(qGetQuote.DateCreated);
			objQuote.setDateModified(qGetQuote.DateModified);				
			return objQuote;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="QuoteBean" />
		<cfset var qUpdateQuote = "" />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localhidden_UsersID = arguments.bean.gethidden_UsersID() />
		<cfset var localhidden_TimeStart = arguments.bean.gethidden_TimeStart() />
		<cfset var localcallerFNameTBox = arguments.bean.getcallerFNameTBox() />
		<cfset var localcallerMInitialTBox = arguments.bean.getcallerMInitialTBox() />
		<cfset var localcallerLNameTBox = arguments.bean.getcallerLNameTBox() />
		<cfset var localcallerPhoneTBox = arguments.bean.getcallerPhoneTBox() />
		<cfset var localpatientFNameTBox = arguments.bean.getpatientFNameTBox() />
		<cfset var localpatientMInitialTBox = arguments.bean.getpatientMInitialTBox() />
		<cfset var localpatientLNameTBox = arguments.bean.getpatientLNameTBox() />
		<cfset var localroomNumberTBox = arguments.bean.getroomNumberTBox() />
		<cfset var localbedNumberTBox = arguments.bean.getbedNumberTBox() />
		<cfset var localpatientAddressTBox = arguments.bean.getpatientAddressTBox() />
		<cfset var localpatientCityTBox = arguments.bean.getpatientCityTBox() />
		<cfset var localpatientStateTBox = arguments.bean.getpatientStateTBox() />
		<cfset var localpatientZipTBox = arguments.bean.getpatientZipTBox() />
		<cfset var localpatientPhoneTBox = arguments.bean.getpatientPhoneTBox() />
		<cfset var localpatientDOBMM = arguments.bean.getpatientDOBMM() />
		<cfset var localpatientDOBDD = arguments.bean.getpatientDOBDD() />
		<cfset var localpatientDOBYY = arguments.bean.getpatientDOBYY() />
		<cfset var localOPTION_3a_CBox_PatientSexMale = arguments.bean.getOPTION_3a_CBox_PatientSexMale() />
		<cfset var localOPTION_3a_CBox_PatientSexFemale = arguments.bean.getOPTION_3a_CBox_PatientSexFemale() />
		<cfset var localpatientSSNTBox = arguments.bean.getpatientSSNTBox() />
		<cfset var localpatientHeightFeet = arguments.bean.getpatientHeightFeet() />
		<cfset var localpatientHeightInches = arguments.bean.getpatientHeightInches() />
		<cfset var localpatientWeightTBox = arguments.bean.getpatientWeightTBox() />
		<cfset var localalternateContactFNameTBox = arguments.bean.getalternateContactFNameTBox() />
		<cfset var localalternateContactMInitialTBox = arguments.bean.getalternateContactMInitialTBox() />
		<cfset var localalternateContactLNameTBox = arguments.bean.getalternateContactLNameTBox() />
		<cfset var localalternateContactRelationshipTBox = arguments.bean.getalternateContactRelationshipTBox() />
		<cfset var localalternateContactPhoneTBox = arguments.bean.getalternateContactPhoneTBox() />
		<cfset var localalternateContactWorkPhoneTBox = arguments.bean.getalternateContactWorkPhoneTBox() />
		<cfset var localprimaryInsuranceNameTBox = arguments.bean.getprimaryInsuranceNameTBox() />
		<cfset var localsecondaryInsuranceNameTBox = arguments.bean.getsecondaryInsuranceNameTBox() />
		<cfset var localprimaryPolicyNumberTBox = arguments.bean.getprimaryPolicyNumberTBox() />
		<cfset var localsecondaryPolicyNumberTBox = arguments.bean.getsecondaryPolicyNumberTBox() />
		<cfset var localorderingPhysicianFNameTBox = arguments.bean.getorderingPhysicianFNameTBox() />
		<cfset var localorderingPhysicianMInitialTBox = arguments.bean.getorderingPhysicianMInitialTBox() />
		<cfset var localorderingPhysicianLNameTBox = arguments.bean.getorderingPhysicianLNameTBox() />
		<cfset var localorderingPhysicianPhoneTBox = arguments.bean.getorderingPhysicianPhoneTBox() />
		<cfset var localprinted = arguments.bean.getprinted() />
		<cfset var localCancelled = arguments.bean.getCancelled() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateQuote" datasource="#trim(arguments.ds)#">
				UPDATE quote  SET
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					AssignedToUserID =				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					hidden_UsersID =	
					<cfif trim(localhidden_UsersID) NEQ "" AND trim(localhidden_UsersID) NEQ "@@" AND trim(localhidden_UsersID) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_UsersID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hidden_TimeStart =	
					<cfif trim(localhidden_TimeStart) NEQ "" AND trim(localhidden_TimeStart) NEQ "@@" AND trim(localhidden_TimeStart) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_TimeStart)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerFNameTBox =	
					<cfif trim(localcallerFNameTBox) NEQ "" AND trim(localcallerFNameTBox) NEQ "@@" AND trim(localcallerFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerMInitialTBox =	
					<cfif trim(localcallerMInitialTBox) NEQ "" AND trim(localcallerMInitialTBox) NEQ "@@" AND trim(localcallerMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerLNameTBox =	
					<cfif trim(localcallerLNameTBox) NEQ "" AND trim(localcallerLNameTBox) NEQ "@@" AND trim(localcallerLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerPhoneTBox =	
					<cfif trim(localcallerPhoneTBox) NEQ "" AND trim(localcallerPhoneTBox) NEQ "@@" AND trim(localcallerPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientFNameTBox =	
					<cfif trim(localpatientFNameTBox) NEQ "" AND trim(localpatientFNameTBox) NEQ "@@" AND trim(localpatientFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientMInitialTBox =	
					<cfif trim(localpatientMInitialTBox) NEQ "" AND trim(localpatientMInitialTBox) NEQ "@@" AND trim(localpatientMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientLNameTBox =	
					<cfif trim(localpatientLNameTBox) NEQ "" AND trim(localpatientLNameTBox) NEQ "@@" AND trim(localpatientLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					roomNumberTBox =	
					<cfif trim(localroomNumberTBox) NEQ "" AND trim(localroomNumberTBox) NEQ "@@" AND trim(localroomNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localroomNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					bedNumberTBox =	
					<cfif trim(localbedNumberTBox) NEQ "" AND trim(localbedNumberTBox) NEQ "@@" AND trim(localbedNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localbedNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientAddressTBox =	
					<cfif trim(localpatientAddressTBox) NEQ "" AND trim(localpatientAddressTBox) NEQ "@@" AND trim(localpatientAddressTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientAddressTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientCityTBox =	
					<cfif trim(localpatientCityTBox) NEQ "" AND trim(localpatientCityTBox) NEQ "@@" AND trim(localpatientCityTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientCityTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientStateTBox =	
					<cfif trim(localpatientStateTBox) NEQ "" AND trim(localpatientStateTBox) NEQ "@@" AND trim(localpatientStateTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientStateTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientZipTBox =	
					<cfif trim(localpatientZipTBox) NEQ "" AND trim(localpatientZipTBox) NEQ "@@" AND trim(localpatientZipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientZipTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientPhoneTBox =	
					<cfif trim(localpatientPhoneTBox) NEQ "" AND trim(localpatientPhoneTBox) NEQ "@@" AND trim(localpatientPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientDOBMM =	
					<cfif trim(localpatientDOBMM) NEQ "" AND trim(localpatientDOBMM) NEQ "@@" AND trim(localpatientDOBMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientDOBMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientDOBDD =	
					<cfif trim(localpatientDOBDD) NEQ "" AND trim(localpatientDOBDD) NEQ "@@" AND trim(localpatientDOBDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientDOBDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientDOBYY =	
					<cfif trim(localpatientDOBYY) NEQ "" AND trim(localpatientDOBYY) NEQ "@@" AND trim(localpatientDOBYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientDOBYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_3a_CBox_PatientSexMale =	
					<cfif trim(localOPTION_3a_CBox_PatientSexMale) NEQ "" AND trim(localOPTION_3a_CBox_PatientSexMale) NEQ "@@" AND trim(localOPTION_3a_CBox_PatientSexMale) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3a_CBox_PatientSexMale)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_3a_CBox_PatientSexFemale =	
					<cfif trim(localOPTION_3a_CBox_PatientSexFemale) NEQ "" AND trim(localOPTION_3a_CBox_PatientSexFemale) NEQ "@@" AND trim(localOPTION_3a_CBox_PatientSexFemale) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3a_CBox_PatientSexFemale)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientSSNTBox =	
					<cfif trim(localpatientSSNTBox) NEQ "" AND trim(localpatientSSNTBox) NEQ "@@" AND trim(localpatientSSNTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientSSNTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientHeightFeet =	
					<cfif trim(localpatientHeightFeet) NEQ "" AND trim(localpatientHeightFeet) NEQ "@@" AND trim(localpatientHeightFeet) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientHeightFeet)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientHeightInches =	
					<cfif trim(localpatientHeightInches) NEQ "" AND trim(localpatientHeightInches) NEQ "@@" AND trim(localpatientHeightInches) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientHeightInches)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientWeightTBox =	
					<cfif trim(localpatientWeightTBox) NEQ "" AND trim(localpatientWeightTBox) NEQ "@@" AND trim(localpatientWeightTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientWeightTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactFNameTBox =	
					<cfif trim(localalternateContactFNameTBox) NEQ "" AND trim(localalternateContactFNameTBox) NEQ "@@" AND trim(localalternateContactFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactMInitialTBox =	
					<cfif trim(localalternateContactMInitialTBox) NEQ "" AND trim(localalternateContactMInitialTBox) NEQ "@@" AND trim(localalternateContactMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactLNameTBox =	
					<cfif trim(localalternateContactLNameTBox) NEQ "" AND trim(localalternateContactLNameTBox) NEQ "@@" AND trim(localalternateContactLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactRelationshipTBox =	
					<cfif trim(localalternateContactRelationshipTBox) NEQ "" AND trim(localalternateContactRelationshipTBox) NEQ "@@" AND trim(localalternateContactRelationshipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactRelationshipTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactPhoneTBox =	
					<cfif trim(localalternateContactPhoneTBox) NEQ "" AND trim(localalternateContactPhoneTBox) NEQ "@@" AND trim(localalternateContactPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactWorkPhoneTBox =	
					<cfif trim(localalternateContactWorkPhoneTBox) NEQ "" AND trim(localalternateContactWorkPhoneTBox) NEQ "@@" AND trim(localalternateContactWorkPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactWorkPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					primaryInsuranceNameTBox =	
					<cfif trim(localprimaryInsuranceNameTBox) NEQ "" AND trim(localprimaryInsuranceNameTBox) NEQ "@@" AND trim(localprimaryInsuranceNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localprimaryInsuranceNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					secondaryInsuranceNameTBox =	
					<cfif trim(localsecondaryInsuranceNameTBox) NEQ "" AND trim(localsecondaryInsuranceNameTBox) NEQ "@@" AND trim(localsecondaryInsuranceNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localsecondaryInsuranceNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					primaryPolicyNumberTBox =	
					<cfif trim(localprimaryPolicyNumberTBox) NEQ "" AND trim(localprimaryPolicyNumberTBox) NEQ "@@" AND trim(localprimaryPolicyNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localprimaryPolicyNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					secondaryPolicyNumberTBox =	
					<cfif trim(localsecondaryPolicyNumberTBox) NEQ "" AND trim(localsecondaryPolicyNumberTBox) NEQ "@@" AND trim(localsecondaryPolicyNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localsecondaryPolicyNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianFNameTBox =	
					<cfif trim(localorderingPhysicianFNameTBox) NEQ "" AND trim(localorderingPhysicianFNameTBox) NEQ "@@" AND trim(localorderingPhysicianFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianMInitialTBox =	
					<cfif trim(localorderingPhysicianMInitialTBox) NEQ "" AND trim(localorderingPhysicianMInitialTBox) NEQ "@@" AND trim(localorderingPhysicianMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianLNameTBox =	
					<cfif trim(localorderingPhysicianLNameTBox) NEQ "" AND trim(localorderingPhysicianLNameTBox) NEQ "@@" AND trim(localorderingPhysicianLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianPhoneTBox =	
					<cfif trim(localorderingPhysicianPhoneTBox) NEQ "" AND trim(localorderingPhysicianPhoneTBox) NEQ "@@" AND trim(localorderingPhysicianPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					printed =	
					<cfif trim(localprinted) NEQ "" AND trim(localprinted) NEQ "@@" AND trim(localprinted) NEQ "NULL">						
						<cfqueryparam value="#trim(localprinted)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Cancelled =	
					<cfif trim(localCancelled) NEQ "" AND trim(localCancelled) NEQ "@@" AND trim(localCancelled) NEQ "NULL">						
						<cfqueryparam value="#trim(localCancelled)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE QuoteID = <cfqueryparam value="#trim(arguments.bean.getQuoteID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="QuoteBean" />
		<cfset var qDeleteQuote = "">

		<cfquery name="qDeleteQuote" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM quote
			WHERE QuoteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getQuoteID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuote" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="QuoteID" required="yes" type="numeric" />		
		<cfset var qGetQuote = "" />		
	
		<cfquery name="qGetQuote" datasource="#trim(arguments.ds)#">
	  		SELECT QuoteID,ClientID,AssignedToUserID,hidden_UsersID,hidden_TimeStart,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientFNameTBox,patientMInitialTBox,patientLNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,printed,Cancelled,Active,InactiveCode,DateCreated,DateModified
			FROM quote  
			WHERE QuoteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.QuoteID)#" /> 
		</cfquery>
		
		<cfreturn qGetQuote>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





