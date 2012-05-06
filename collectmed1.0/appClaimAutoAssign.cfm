<!---- appClaimAutoAssign.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- get all the claims that have not been assigned.                                --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getAllUnassigned" datasource="#request.datasource#">
		SELECT *
		FROM Claim  
		WHERE ClientID = 1084 AND Active = 1
		AND ClaimStatusCode NOT IN(189)	
		AND AssignedToUserID IS NULL	
	</cfquery>
	
	<cfdump var="#getAllUnassigned#" expand="no">
