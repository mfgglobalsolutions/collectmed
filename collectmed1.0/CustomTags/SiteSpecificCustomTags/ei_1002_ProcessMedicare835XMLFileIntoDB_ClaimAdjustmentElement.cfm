<!-------------------------------------------------------------------------------------->
<!--- This tag is dependant on the CLP XML being available along with the current    --->
<!--- iteration number. Tags that call this are:                                     --->
<!--- ei_1002_ProcessMedicare835XMLFileIntoDB_ServiceElement.cfm                     --->
<!-------------------------------------------------------------------------------------->



	<!-------------------------------------------------------------------------------------->
	<!--- First find out if the actual elment exists that has the claim adjustments.     --->
	<!--------------------------------------------------------------------------------------> 
	<cfif StructKeyExists(ClaimXML.CLP.SVC[iii], 'CAS')>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Create the Claim Adjustment Object                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT = CreateObject("component","com.common.db.Procedure_MEDICARE_CLAIMADJUSTMENTIO")>
							
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get all Claim Adjustment Group Codes                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID,ItemnameDisplay,ItemDescription" listid="13" active="1" returnvariable="getAllProcedureAdjustmentCodes">
		<cfset adjustmentCodes = valuelist(getAllProcedureAdjustmentCodes.itemNameDisplay)>		
		
						
		<!-------------------------------------------------------------------------------------->
		<!--- Start the loop of the actual adjustments in the claim.                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.SVC[iii].CAS))#" index="iiii">				
			
			<cfset procedureAdjustmentGroupCode = ClaimXML.CLP.SVC[iii].CAS[iiii].ClaimAdjustmentGroupCode1.XMLText>
			
			<cfif NOT ListFindNoCase(adjustmentCodes, procedureAdjustmentGroupCode)>
				<cfthrow message="The group code (#trim(procedureAdjustmentGroupCode)#) cannot be found in the standard list items for adjustment group codes.">
			</cfif>
			
			<cfquery name="getGroupCodeID" dbtype="query">
				SELECT StandardListItemID
				FROM getAllProcedureAdjustmentCodes
				WHERE ItemNameDisplay = '#trim(procedureAdjustmentGroupCode)#' 
			</cfquery>
			
			<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.reset()>		
			<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setProcedureID(ProcedureID)>
			<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentGroupCode1(getGroupCodeID.StandardListItemID)>
						
			
			<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" Code="#trim(ClaimXML.CLP.SVC[iii].CAS[iiii].ClaimAdjustmentReasonCode2.XMLText)#" active="1" returnvariable="getReasonCodeID2">
			<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode2(getReasonCodeID2.RecordID)>
			<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount3(ClaimXML.CLP.SVC[iii].CAS[iiii].MonetaryAmount3.XMLText)>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'Quantity4')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setQuantity4(ClaimXML.CLP.SVC[iii].CAS[iiii].Quantity4.XMLText)>
			</cfif>
			 			 
			 
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'ClaimAdjustmentReasonCode5')>
				<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" Code="#trim(ClaimXML.CLP.SVC[iii].CAS[iiii].ClaimAdjustmentReasonCode5.XMLText)#" active="1" returnvariable="getReasonCodeID5">
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode5(getReasonCodeID5.RecordID)>  
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'MonetaryAmount6')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount6(ClaimXML.CLP.SVC[iii].CAS[iiii].MonetaryAmount6.XMLText)> 
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'Quantity7')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setQuantity7(ClaimXML.CLP.SVC[iii].CAS[iiii].Quantity7.XMLText)>
			</cfif>
			 
			 
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'ClaimAdjustmentReasonCode8')> 
				<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" Code="#trim(ClaimXML.CLP.SVC[iii].CAS[iiii].ClaimAdjustmentReasonCode8.XMLText)#" active="1" returnvariable="getReasonCodeID8">
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode8(getReasonCodeID8.RecordID)>  
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'MonetaryAmount9')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount9(ClaimXML.CLP.SVC[iii].CAS[iiii].MonetaryAmount9.XMLText)> 
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'Quantity10')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setQuantity10(ClaimXML.CLP.SVC[iii].CAS[iiii].Quantity10.XMLText)>
			</cfif>
			
			
			
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'ClaimAdjustmentReasonCode11')>
				<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" Code="#trim(ClaimXML.CLP.SVC[iii].CAS[iiii].ClaimAdjustmentReasonCode11.XMLText)#" active="1" returnvariable="getReasonCodeID11">
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode11(getReasonCodeID11.RecordID)>
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'MonetaryAmount12')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount12(ClaimXML.CLP.SVC[iii].CAS[iiii].MonetaryAmount12.XMLText)> 
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'Quantity13')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setQuantity13(ClaimXML.CLP.SVC[iii].CAS[iiii].Quantity13.XMLText)>
			</cfif>
			
			
			
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'ClaimAdjustmentReasonCode14')>
				<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" Code="#trim(ClaimXML.CLP.SVC[iii].CAS[iiii].ClaimAdjustmentReasonCode14.XMLText)#" active="1" returnvariable="getReasonCodeID14">
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode14(getReasonCodeID14.RecordID)>  
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'MonetaryAmount15')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount15(ClaimXML.CLP.SVC[iii].CAS[iiii].MonetaryAmount15.XMLText)> 
			</cfif>
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'Quantity16')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setQuantity16(ClaimXML.CLP.SVC[iii].CAS[iiii].Quantity16.XMLText)>
			</cfif>
			
			
			
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'ClaimAdjustmentReasonCode17')>
				<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" Code="#trim(ClaimXML.CLP.SVC[iii].CAS[iiii].ClaimAdjustmentReasonCode17.XMLText)#" active="1" returnvariable="getReasonCodeID17">
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setClaimAdjustmentReasonCode17(getReasonCodeID17.RecordID)>  
			</cfif>	
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'MonetaryAmount18')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setMonetaryAmount18(ClaimXML.CLP.SVC[iii].CAS[iiii].MonetaryAmount18.XMLText)> 
			</cfif>	
			<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].CAS[iiii], 'Quantity19')>
				<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.setQuantity19(ClaimXML.CLP.SVC[iii].CAS[iiii].Quantity19.XMLText)>
			</cfif>	
			
			
			<cfset request.Procedure_MEDICARE_CLAIMADJUSTMENT.commit()>		
					
			
		</cfloop>
			
	
	</cfif>


