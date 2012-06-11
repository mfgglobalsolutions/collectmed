 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_CLAIMADJUSTMENTBean" />
		
		<cfset var qCreateProcedure_MEDICARE_CLAIMADJUSTMENT = "" />		
		
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localClaimAdjustmentGroupCode1 = arguments.bean.getClaimAdjustmentGroupCode1() />
		<cfset var localClaimAdjustmentReasonCode2 = arguments.bean.getClaimAdjustmentReasonCode2() />
		<cfset var localMonetaryAmount3 = arguments.bean.getMonetaryAmount3() />
		<cfset var localQuantity4 = arguments.bean.getQuantity4() />
		<cfset var localClaimAdjustmentReasonCode5 = arguments.bean.getClaimAdjustmentReasonCode5() />
		<cfset var localMonetaryAmount6 = arguments.bean.getMonetaryAmount6() />
		<cfset var localQuantity7 = arguments.bean.getQuantity7() />
		<cfset var localClaimAdjustmentReasonCode8 = arguments.bean.getClaimAdjustmentReasonCode8() />
		<cfset var localMonetaryAmount9 = arguments.bean.getMonetaryAmount9() />
		<cfset var localQuantity10 = arguments.bean.getQuantity10() />
		<cfset var localClaimAdjustmentReasonCode11 = arguments.bean.getClaimAdjustmentReasonCode11() />
		<cfset var localMonetaryAmount12 = arguments.bean.getMonetaryAmount12() />
		<cfset var localQuantity13 = arguments.bean.getQuantity13() />
		<cfset var localClaimAdjustmentReasonCode14 = arguments.bean.getClaimAdjustmentReasonCode14() />
		<cfset var localMonetaryAmount15 = arguments.bean.getMonetaryAmount15() />
		<cfset var localQuantity16 = arguments.bean.getQuantity16() />
		<cfset var localClaimAdjustmentReasonCode17 = arguments.bean.getClaimAdjustmentReasonCode17() />
		<cfset var localMonetaryAmount18 = arguments.bean.getMonetaryAmount18() />
		<cfset var localQuantity19 = arguments.bean.getQuantity19() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(arguments.ds)#">
				INSERT INTO procedure_medicare_claimadjustment (ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localClaimAdjustmentGroupCode1)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode2)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localMonetaryAmount3)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localQuantity4))>						
						<cfqueryparam value="#trim(localQuantity4)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode5))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode5)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount6))>						
						<cfqueryparam value="#trim(localMonetaryAmount6)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity7))>						
						<cfqueryparam value="#trim(localQuantity7)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localClaimAdjustmentReasonCode8) NEQ "" AND trim(localClaimAdjustmentReasonCode8) NEQ "@@" AND trim(localClaimAdjustmentReasonCode8) NEQ "NULL">						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode8)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount9))>						
						<cfqueryparam value="#trim(localMonetaryAmount9)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity10))>						
						<cfqueryparam value="#trim(localQuantity10)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode11))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode11)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount12))>						
						<cfqueryparam value="#trim(localMonetaryAmount12)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity13))>						
						<cfqueryparam value="#trim(localQuantity13)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode14))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode14)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount15))>						
						<cfqueryparam value="#trim(localMonetaryAmount15)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity16))>						
						<cfqueryparam value="#trim(localQuantity16)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode17))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode17)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMonetaryAmount18))>						
						<cfqueryparam value="#trim(localMonetaryAmount18)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localQuantity19))>						
						<cfqueryparam value="#trim(localQuantity19)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_CLAIMADJUSTMENTID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setProcedure_MEDICARE_CLAIMADJUSTMENTID(qCreateProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_CLAIMADJUSTMENTBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_CLAIMADJUSTMENT = "" />		
		
		<cfset qGetProcedure_MEDICARE_CLAIMADJUSTMENT = getProcedure_MEDICARE_CLAIMADJUSTMENT(trim(arguments.ds), trim(Procedure_MEDICARE_CLAIMADJUSTMENTID)) />
				
		<cfif qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedure_MEDICARE_CLAIMADJUSTMENT = createObject("component", "Procedure_MEDICARE_CLAIMADJUSTMENTBean").init(arguments.ds);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setProcedure_MEDICARE_CLAIMADJUSTMENTID(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setProcedureID(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ProcedureID);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentGroupCode1(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentGroupCode1);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode2(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode2);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount3(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount3);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setQuantity4(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity4);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode5(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode5);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount6(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount6);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setQuantity7(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity7);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode8(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode8);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount9(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount9);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setQuantity10(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity10);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode11(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode11);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount12(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount12);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setQuantity13(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity13);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode14(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode14);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount15(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount15);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setQuantity16(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity16);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode17(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode17);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount18(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount18);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setQuantity19(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity19);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setActive(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Active);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setInactiveCode(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.InactiveCode);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setDateCreated(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.DateCreated);
			objProcedure_MEDICARE_CLAIMADJUSTMENT.setDateModified(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.DateModified);				
			return objProcedure_MEDICARE_CLAIMADJUSTMENT;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_CLAIMADJUSTMENTBean" />
		<cfset var qUpdateProcedure_MEDICARE_CLAIMADJUSTMENT = "" />
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localClaimAdjustmentGroupCode1 = arguments.bean.getClaimAdjustmentGroupCode1() />
		<cfset var localClaimAdjustmentReasonCode2 = arguments.bean.getClaimAdjustmentReasonCode2() />
		<cfset var localMonetaryAmount3 = arguments.bean.getMonetaryAmount3() />
		<cfset var localQuantity4 = arguments.bean.getQuantity4() />
		<cfset var localClaimAdjustmentReasonCode5 = arguments.bean.getClaimAdjustmentReasonCode5() />
		<cfset var localMonetaryAmount6 = arguments.bean.getMonetaryAmount6() />
		<cfset var localQuantity7 = arguments.bean.getQuantity7() />
		<cfset var localClaimAdjustmentReasonCode8 = arguments.bean.getClaimAdjustmentReasonCode8() />
		<cfset var localMonetaryAmount9 = arguments.bean.getMonetaryAmount9() />
		<cfset var localQuantity10 = arguments.bean.getQuantity10() />
		<cfset var localClaimAdjustmentReasonCode11 = arguments.bean.getClaimAdjustmentReasonCode11() />
		<cfset var localMonetaryAmount12 = arguments.bean.getMonetaryAmount12() />
		<cfset var localQuantity13 = arguments.bean.getQuantity13() />
		<cfset var localClaimAdjustmentReasonCode14 = arguments.bean.getClaimAdjustmentReasonCode14() />
		<cfset var localMonetaryAmount15 = arguments.bean.getMonetaryAmount15() />
		<cfset var localQuantity16 = arguments.bean.getQuantity16() />
		<cfset var localClaimAdjustmentReasonCode17 = arguments.bean.getClaimAdjustmentReasonCode17() />
		<cfset var localMonetaryAmount18 = arguments.bean.getMonetaryAmount18() />
		<cfset var localQuantity19 = arguments.bean.getQuantity19() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(arguments.ds)#">
				UPDATE procedure_medicare_claimadjustment  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ClaimAdjustmentGroupCode1 =						
						<cfqueryparam value="#trim(localClaimAdjustmentGroupCode1)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ClaimAdjustmentReasonCode2 =						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode2)#" cfsqltype="CF_SQL_INTEGER" />,
					
					MonetaryAmount3 =						
						<cfqueryparam value="#trim(localMonetaryAmount3)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Quantity4 =				
					<cfif IsNumeric(trim(localQuantity4))>						
						<cfqueryparam value="#trim(localQuantity4)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode5 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode5))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode5)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount6 =				
					<cfif IsNumeric(trim(localMonetaryAmount6))>						
						<cfqueryparam value="#trim(localMonetaryAmount6)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity7 =				
					<cfif IsNumeric(trim(localQuantity7))>						
						<cfqueryparam value="#trim(localQuantity7)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode8 =	
					<cfif trim(localClaimAdjustmentReasonCode8) NEQ "" AND trim(localClaimAdjustmentReasonCode8) NEQ "@@" AND trim(localClaimAdjustmentReasonCode8) NEQ "NULL">						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode8)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MonetaryAmount9 =				
					<cfif IsNumeric(trim(localMonetaryAmount9))>						
						<cfqueryparam value="#trim(localMonetaryAmount9)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity10 =				
					<cfif IsNumeric(trim(localQuantity10))>						
						<cfqueryparam value="#trim(localQuantity10)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode11 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode11))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode11)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount12 =				
					<cfif IsNumeric(trim(localMonetaryAmount12))>						
						<cfqueryparam value="#trim(localMonetaryAmount12)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity13 =				
					<cfif IsNumeric(trim(localQuantity13))>						
						<cfqueryparam value="#trim(localQuantity13)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode14 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode14))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode14)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount15 =				
					<cfif IsNumeric(trim(localMonetaryAmount15))>						
						<cfqueryparam value="#trim(localMonetaryAmount15)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity16 =				
					<cfif IsNumeric(trim(localQuantity16))>						
						<cfqueryparam value="#trim(localQuantity16)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClaimAdjustmentReasonCode17 =				
					<cfif IsNumeric(trim(localClaimAdjustmentReasonCode17))>						
						<cfqueryparam value="#trim(localClaimAdjustmentReasonCode17)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MonetaryAmount18 =				
					<cfif IsNumeric(trim(localMonetaryAmount18))>						
						<cfqueryparam value="#trim(localMonetaryAmount18)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Quantity19 =				
					<cfif IsNumeric(trim(localQuantity19))>						
						<cfqueryparam value="#trim(localQuantity19)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
				WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = <cfqueryparam value="#trim(arguments.bean.getProcedure_MEDICARE_CLAIMADJUSTMENTID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_CLAIMADJUSTMENTBean" />
		<cfset var qDeleteProcedure_MEDICARE_CLAIMADJUSTMENT = "">

		<cfquery name="qDeleteProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM procedure_medicare_claimadjustment
			WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getProcedure_MEDICARE_CLAIMADJUSTMENTID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_CLAIMADJUSTMENT" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_CLAIMADJUSTMENT = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(arguments.ds)#">
	  		SELECT Procedure_MEDICARE_CLAIMADJUSTMENTID,ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode,DateCreated,DateModified
			FROM procedure_medicare_claimadjustment  
			WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_CLAIMADJUSTMENT>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





