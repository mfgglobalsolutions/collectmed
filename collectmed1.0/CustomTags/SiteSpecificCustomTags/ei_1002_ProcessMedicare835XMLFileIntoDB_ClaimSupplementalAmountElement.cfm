

<!-------------------------------------------------------------------------------------->
<!--- This tag is dependant on the CLP XML being available along with the current    --->
<!--- iteration number. Tags that call this are:                                     --->
<!--- ei_1002_ProcessMedicare835XMLFileIntoDB_ServiceElement.cfm                     --->
<!-------------------------------------------------------------------------------------->



	<!-------------------------------------------------------------------------------------->
	<!--- First find out if the actual elment exists.                                    --->
	<!--------------------------------------------------------------------------------------> 
	<cfif StructKeyExists(ClaimXML.CLP, 'AMT')>
				
		<!-------------------------------------------------------------------------------------->
		<!--- Create the Claim Object                                                        --->
		<!-------------------------------------------------------------------------------------->
		<cfset request.Claim_MEDICARE_SUPPLEMENTAL_AMOUNT = CreateObject("component","com.common.db.Claim_MEDICARE_SUPPLEMENTAL_AMOUNTIO")>
							
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get all Claim Qualifier Codes                                                  --->
		<!-------------------------------------------------------------------------------------->
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID,ItemnameDisplay,ItemDescription" listid="19" active="1" returnvariable="getAllClaimAmountQualifierCodes">
		<cfset amountQualifierCodes = valuelist(getAllClaimAmountQualifierCodes.itemNameDisplay)>		
		
						
		<!-------------------------------------------------------------------------------------->
		<!--- Start the loop of the actual adjustments in the Claim.                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.AMT))#" index="amti">				
			
			<cfset claimQualifierCode = ClaimXML.CLP.AMT[amti].AmountQualifierCode1.XMLText>
			
			<cfif NOT ListFindNoCase(amountQualifierCodes, claimQualifierCode)>
				<cfthrow message="The code (#trim(claimQualifierCode)#) cannot be found in the standard list items for amount qualifier codes.">
			</cfif>
			
			<cfquery name="getCodeID" dbtype="query">
				SELECT StandardListItemID
				FROM getAllClaimAmountQualifierCodes
				WHERE ItemNameDisplay = '#trim(claimQualifierCode)#' 
			</cfquery>
			
			<cfset request.Claim_MEDICARE_SUPPLEMENTAL_AMOUNT.reset()>		
			<cfset request.Claim_MEDICARE_SUPPLEMENTAL_AMOUNT.setClaimID(ClaimID)>
			<cfset request.Claim_MEDICARE_SUPPLEMENTAL_AMOUNT.setQualifierCode(getCodeID.StandardListItemID)>
			<cfset request.Claim_MEDICARE_SUPPLEMENTAL_AMOUNT.setMonetaryAmount2(ClaimXML.CLP.AMT[amti].MonetaryAmount2.XMLText)>
			<cfset request.Claim_MEDICARE_SUPPLEMENTAL_AMOUNT.commit()>		
							
		</cfloop>
					
	</cfif>



