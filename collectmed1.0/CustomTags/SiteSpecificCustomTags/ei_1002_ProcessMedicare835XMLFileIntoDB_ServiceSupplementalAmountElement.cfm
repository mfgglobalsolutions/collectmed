

<!-------------------------------------------------------------------------------------->
<!--- This tag is dependant on the CLP XML being available along with the current    --->
<!--- iteration number. Tags that call this are:                                     --->
<!--- ei_1002_ProcessMedicare835XMLFileIntoDB_ServiceElement.cfm                     --->
<!-------------------------------------------------------------------------------------->



	<!-------------------------------------------------------------------------------------->
	<!--- First find out if the actual elment exists.                                    --->
	<!--------------------------------------------------------------------------------------> 
	<cfif StructKeyExists(ClaimXML.CLP.SVC[iii], 'AMT')>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Create the Claim Procedure Object                                              --->
		<!-------------------------------------------------------------------------------------->
		<cfset request.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT = CreateObject("component","com.common.db.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTIO")>
							
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get all Claim Procedure Qualifier Codes                                        --->
		<!-------------------------------------------------------------------------------------->
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID,ItemnameDisplay,ItemDescription" listid="18" active="1" returnvariable="getAllProcedureAmountQualifierCodes">
		<cfset amountQualifierCodes = valuelist(getAllProcedureAmountQualifierCodes.itemNameDisplay)>		
		
						
		<!-------------------------------------------------------------------------------------->
		<!--- Start the loop of the actual adjustments in the Procedure.                     --->
		<!-------------------------------------------------------------------------------------->				
		<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.SVC[iii].AMT))#" index="amti">				
			
			<cfset procedureQualifierCode = ClaimXML.CLP.SVC[iii].AMT[amti].AmountQualifierCode1.XMLText>
			
			<cfif NOT ListFindNoCase(amountQualifierCodes, procedureQualifierCode)>
				<cfthrow message="The code (#trim(procedureQualifierCode)#) cannot be found in the standard list items for amount qualifier codes.">
			</cfif>
			
			<cfquery name="getCodeID" dbtype="query">
				SELECT StandardListItemID
				FROM getAllProcedureAmountQualifierCodes
				WHERE ItemNameDisplay = '#trim(procedureQualifierCode)#' 
			</cfquery>
			
			<cfset request.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT.reset()>		
			<cfset request.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setProcedureID(ProcedureID)>
			<cfset request.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setQualifierCode(getCodeID.StandardListItemID)>
			<cfset request.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT.setMonetaryAmount2(ClaimXML.CLP.SVC[iii].AMT[amti].MonetaryAmount2.XMLText)>
			<cfset request.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT.commit()>		
									
		</cfloop>
	
					
	</cfif>



