	
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.hcpc" default="">
	<cfset hcpc = attributes.hcpc>
	
	<cfif IsDefined("form.hcpc") AND form.hcpc NEQ "">
		<cfset hcpc = form.hcpc>
	<cfelseif IsDefined("url.hcpc") AND url.hcpc NEQ "">
		<cfset hcpc = url.hcpc>	
	</cfif>
	
	<cfparam name="attributes.Modifier1" default="">
	<cfset Modifier1 = attributes.Modifier1>
	
	<cfif IsDefined("form.Modifier1") AND form.Modifier1 NEQ "">
		<cfset Modifier1 = form.Modifier1>
	<cfelseif IsDefined("url.Modifier1") AND url.Modifier1 NEQ "">
		<cfset Modifier1 = url.Modifier1>	
	</cfif>
	
	<cfparam name="attributes.Modifier2" default="">
	<cfset Modifier2 = attributes.Modifier2>
	
	<cfif IsDefined("form.Modifier2") AND form.Modifier2 NEQ "">
		<cfset Modifier2 = form.Modifier2>
	<cfelseif IsDefined("url.Modifier2") AND url.Modifier2 NEQ "">
		<cfset Modifier2 = url.Modifier2>	
	</cfif>
	
	<cfparam name="attributes.Modifier3" default="">
	<cfset Modifier3 = attributes.Modifier3>
	
	<cfif IsDefined("form.Modifier3") AND form.Modifier3 NEQ "">
		<cfset Modifier3 = form.Modifier3>
	<cfelseif IsDefined("url.Modifier3") AND url.Modifier3 NEQ "">
		<cfset Modifier3 = url.Modifier3>	
	</cfif>
	
	<cfparam name="attributes.Modifier4" default="">
	<cfset Modifier4 = attributes.Modifier4>
	
	<cfif IsDefined("form.Modifier4") AND form.Modifier4 NEQ "">
		<cfset Modifier4 = form.Modifier4>
	<cfelseif IsDefined("url.Modifier4") AND url.Modifier4 NEQ "">
		<cfset Modifier4 = url.Modifier4>	
	</cfif>
	
	<cfparam name="attributes.dos" default="">
	<cfset dos = attributes.dos>
	
	<cfif IsDefined("form.dos") AND form.dos NEQ "">
		<cfset dos = form.dos>
	<cfelseif IsDefined("url.dos") AND url.dos NEQ "">
		<cfset dos = url.dos>	
	</cfif>	

	<cfparam name="attributes.state" default="">
	<cfset state = attributes.state>
	
	<cfif IsDefined("form.state") AND form.state NEQ "">
		<cfset state = form.state>
	<cfelseif IsDefined("url.state") AND url.state NEQ "">
		<cfset state = url.state>	
	</cfif>
	
	<cfparam name="attributes.senderrortocaller" default="no">
	<cfset senderrortocaller = attributes.senderrortocaller>
	
	<cfif IsDefined("form.senderrortocaller") AND form.senderrortocaller NEQ "">
		<cfset senderrortocaller = form.senderrortocaller>
	<cfelseif IsDefined("url.senderrortocaller") AND url.senderrortocaller NEQ "">
		<cfset senderrortocaller = url.senderrortocaller>	
	</cfif>
	
	<cfparam name="attributes.returnMessage" default="">
	<cfset returnMessage = attributes.returnMessage>



<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="hcpc,dos,state"
		fieldnames="HCPC Code,Date of Service, State"
		datatypes="*,date,*"
		senderrortocaller="#trim(senderrortocaller)#">

	<cfif senderrortocaller AND IsDefined("errorMessage") AND errorMessage NEQ "">
		<cfset caller.returnMessage = errorMessage>
		<cfexit>
	</cfif>	

	

<!-------------------------------------------------------------------------------------->
<!--- Get the Modifier1 if sent in.                                                  --->
<!-------------------------------------------------------------------------------------->		
	<cfif Modifier1 NEQ "">
				
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="26" itemnamedisplay="#trim(Modifier1)#" active="1" fields="StandardListItemID" returnvariable="getModifier1ID">
		
		<cfif getModifier1ID.RecordCount EQ 0>
			<cfset returnMessage = "The Modifier 1 Code (#trim(Modifier1)#) cannot be found.">		
		<cfelseif getModifier1ID.RecordCount GTE 2>
			<cfset returnMessage = "The was an issue searching for Modifier 1 Code (#trim(Modifier1)#). Please contact an administrator.">				
		<cfelse>
			<cfset Modifier1ID = getModifier1ID.StandardListItemID> 
		</cfif>	
		
		<cfif senderrortocaller AND returnMessage NEQ "">
			<cfset caller.returnMessage = trim(returnMessage)>
			<cfexit>
		<cfelseif returnMessage NEQ "">
			<cf_gcGeneralErrorTemplate message="#trim(returnMessage)#">	
		</cfif>
	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the Modifier2 if sent in.                                                  --->
<!-------------------------------------------------------------------------------------->		
	<cfif Modifier2 NEQ "">
		
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="26" itemnamedisplay="#trim(Modifier2)#" active="1" fields="StandardListItemID" returnvariable="getModifier2ID">
				
		<cfif getModifier2ID.RecordCount EQ 0>
			<cfset returnMessage = "The Modifier 2 Code (#trim(Modifier2)#) cannot be found.">		
		<cfelseif getModifier2ID.RecordCount GTE 2>
			<cfset returnMessage = "The was an issue searching for Modifier 2 Code (#trim(Modifier2)#). Please contact an administrator.">				
		<cfelse>
			<cfset Modifier2ID = getModifier2ID.StandardListItemID>
		</cfif>	
		
		<cfif senderrortocaller AND returnMessage NEQ "">
			<cfset caller.returnMessage = trim(returnMessage)>
			<cfexit>
		<cfelseif returnMessage NEQ "">
			<cf_gcGeneralErrorTemplate message="#trim(returnMessage)#">	
		</cfif>
	
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the Modifier3 if sent in.                                                  --->
<!-------------------------------------------------------------------------------------->		
	<cfif Modifier3 NEQ "">
		
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="26" itemnamedisplay="#trim(Modifier3)#" active="1" fields="StandardListItemID" returnvariable="getModifier3ID">
		
		<cfif getModifier3ID.RecordCount EQ 0>
			<cfset returnMessage = "The Modifier 3 Code (#trim(Modifier3)#) cannot be found.">		
		<cfelseif getModifier3ID.RecordCount GTE 2>
			<cfset returnMessage = "The was an issue searching for Modifier 3 Code (#trim(Modifier3)#). Please contact an administrator.">				
		<cfelse>
			<cfset Modifier3ID = getModifier3ID.StandardListItemID>
		</cfif>	
		
		<cfif senderrortocaller AND returnMessage NEQ "">
			<cfset caller.returnMessage = trim(returnMessage)>
			<cfexit>
		<cfelseif returnMessage NEQ "">
			<cf_gcGeneralErrorTemplate message="#trim(returnMessage)#">	
		</cfif>
	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the Modifier4 if sent in.                                                  --->
<!-------------------------------------------------------------------------------------->		
	<cfif Modifier4 NEQ "">
		
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="26" itemnamedisplay="#trim(Modifier4)#" active="1" fields="StandardListItemID" returnvariable="getModifier4ID">
		
		<cfif getModifier4ID.RecordCount EQ 0>
			<cfset returnMessage = "The Modifier 4 Code (#trim(Modifier4)#) cannot be found.">		
		<cfelseif getModifier4ID.RecordCount GTE 2>
			<cfset returnMessage = "The was an issue searching for Modifier 4 Code (#trim(Modifier4)#). Please contact an administrator.">				
		<cfelse>
			<cfset Modifier4ID = getModifier4ID.StandardListItemID>
		</cfif>	
		
		<cfif senderrortocaller AND returnMessage NEQ "">
			<cfset caller.returnMessage = trim(returnMessage)>
			<cfexit>
		<cfelseif returnMessage NEQ "">
			<cf_gcGeneralErrorTemplate message="#trim(returnMessage)#">	
		</cfif>
	
	</cfif>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the ProcedureID is sent in.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.db.EOB_MEDICARE_PROCEDURECodeIO" method="getEOB_MEDICARE_PROCEDURECodeQuery" hcpc="#trim(hcpc)#" fields="recordID" returnvariable="hcpcRecordID">

	<cfif hcpcRecordID.RecordCount EQ 0>
		<cfset returnMessage = "The HCPC Code (#trim(hcpc)#) cannot be found.">		
		<cf_gcGatewayLogger	datasource="#trim(request.datasource)#"  code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(returnMessage)#</p><strong>Admin Note:</strong>#returnMessage#. Immediate attention required<p>Error in (#GetCurrentTemplatePath()#) 209.</p>">	
	</cfif>	
		
	<cfif senderrortocaller AND returnMessage NEQ "">
		<cfset caller.returnMessage = trim(returnMessage)>
		<cfexit>
	<cfelseif returnMessage NEQ "">
		<cf_gcGeneralErrorTemplate message="#trim(returnMessage)#">	
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get the stateID of the state sent in. And then get its abbreviation used as    --->
<!--- a column in the fee schedule.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfinvoke component="com.common.State" method="getStateID" state="#trim(State)#" returnvariable="StateID">
	<cfinvoke component="com.common.State" method="getStateAbbr" stateid="#trim(StateID)#" returnvariable="StateAbbr">	
	<cfset stateCol = "Fee_#trim(StateAbbr)#_#trim(StateID)#">
	<cfset finalFeeQCol = "getFee." & "#trim(stateCol)#">
	
	
<!-------------------------------------------------------------------------------------->
<!--- Fee schedules are made in Quarters so we need to gett the quarter the DOS was  --->
<!--- on and look at that table for the fee for the service.                         --->
<!-------------------------------------------------------------------------------------->
<cfif trim(Year(dos)) GTE 2008> 	
	
	<cfswitch expression="#trim(Quarter(dos))#">
		<cfcase value="1">
			<cfset letterQuarter = "A">
		</cfcase>
		<cfcase value="2">
			<cfset letterQuarter = "B">
		</cfcase>
		<cfcase value="3">
			<cfset letterQuarter = "C">
		</cfcase>
		<cfcase value="4">
			<cfset letterQuarter = "D">
		</cfcase>
	</cfswitch>
	
	<cfset feeTableName = "EOB_MEDICARE_#trim(Year(dos))#_#trim(letterQuarter)#_PROCEDURECodeFeeSchedule">	
	
<cfelse>	
	<cfset feeTableName = "EOB_MEDICARE_#trim(Year(dos))#_PROCEDURECodeFeeSchedule">
</cfif>	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the SQL that will be used.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfsavecontent variable="sqlStatement">
		<cfoutput>
			SELECT #trim(stateCol)#
			FROM pa_master.#trim(feeTableName)#
			WHERE HCPCRecordID = #trim(hcpcRecordID.recordID)#
			<cfif IsDefined("Modifier1ID") AND IsNumeric(Modifier1ID)> AND MOD1 = #trim(Modifier1ID)#</cfif>
			<cfif IsDefined("Modifier2ID") AND IsNumeric(Modifier2ID)> AND MOD2 = #trim(Modifier2ID)#</cfif>
			<cfif IsDefined("Modifier3ID") AND IsNumeric(Modifier3ID)> AND MOD3 = #trim(Modifier3ID)#</cfif>
			<cfif IsDefined("Modifier4ID") AND IsNumeric(Modifier4ID)> AND MOD4 = #trim(Modifier4ID)#</cfif>
		</cfoutput>
	</cfsavecontent>

	
	<!---<cfoutput>#sqlStatement#</cfoutput>--->
<!-------------------------------------------------------------------------------------->
<!--- Query for the fee based on the state and the HCPC code.                        --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getFee" datasource="#request.datasource#">
		#PreserveSingleQuotes(sqlStatement)#
	</cfquery>
	
	<cfif getFee.RecordCount EQ 0>
		<cfset returnMessage = "The Fee cannot be found.">			
		<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(returnMessage)#</p><strong>Admin Note:</strong>#returnMessage#. Immediate attention required<p>Query Attempted: #PreserveSingleQuotes(sqlStatement)#</p><p>Error in (#GetCurrentTemplatePath()#) 247.</p>">	
	</cfif>	
	
	<cfif senderrortocaller AND returnMessage NEQ "">
		<cfset caller.returnMessage = trim(returnMessage)>
		<cfexit>
	<cfelseif returnMessage NEQ "">
		<cf_gcGeneralErrorTemplate message="#trim(returnMessage)#">	
	</cfif>	
	
	<cfif senderrortocaller AND getFee.RecordCount EQ 1>
		<cfset caller.returnMessage = evaluate(finalFeeQCol)>
		<cfexit>
	<cfelseif getFee.RecordCount EQ 1>	
		<cfset caller.HCPCFee = evaluate(finalFeeQCol)>
	</cfif> 
	
	




