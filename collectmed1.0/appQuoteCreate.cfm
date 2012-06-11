<!---- appQuoteCreate.cfm ---->


<cftry>

	<!-------------------------------------------------------------------------------------->
	<!--- Update the quote                                                               --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.quoteID") AND IsNumeric(form.quoteID)>

		<cfset note = "<font color=FF0000>SYSTEM INPUT NOTE: QUOTE CHANGED</font><br>">

		<cfquery name="getQuote" datasource="#trim(request.datasource)#">
			SELECT q.*, qh.*
			FROM quote q INNER JOIN quotehcpc qh ON q.QuoteID = qh.QuoteID
			WHERE q.QuoteID = #trim(form.quoteID)#
		</cfquery>

		<cfif IsDefined("form.ALTERNATECONTACTFNAMETBOX") AND getQuote.ALTERNATECONTACTFNAMETBOX NEQ form.ALTERNATECONTACTFNAMETBOX>
			<cfset note = note & "ALTERNATE CONTACT NAME changed from <strong>[</strong>#getQuote.ALTERNATECONTACTFNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTFNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTMINITIALTBOX") AND getQuote.ALTERNATECONTACTMINITIALTBOX NEQ form.ALTERNATECONTACTMINITIALTBOX>
			<cfset note = note & "ALTERNATE CONTACT MIDDLE INITIAL changed from <strong>[</strong>#getQuote.ALTERNATECONTACTMINITIALTBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTMINITIALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTLNAMETBOX") AND getQuote.ALTERNATECONTACTLNAMETBOX NEQ form.ALTERNATECONTACTLNAMETBOX>
			<cfset note = note & "ALTERNATE CONTACT LAST NAME changed from <strong>[</strong>#getQuote.ALTERNATECONTACTLNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTLNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTPHONETBOX") AND getQuote.ALTERNATECONTACTPHONETBOX NEQ request.cleanNumericString(form.ALTERNATECONTACTPHONETBOX)>
			<cfset note = note & "ALTERNATE CONTACT PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getQuote.ALTERNATECONTACTPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTWORKPHONETBOX") AND getQuote.ALTERNATECONTACTWORKPHONETBOX NEQ request.cleanNumericString(form.ALTERNATECONTACTWORKPHONETBOX)>
			<cfset note = note & "ALTERNATE CONTACT WORK PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getQuote.ALTERNATECONTACTWORKPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTWORKPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTRELATIONSHIPTBOX") AND getQuote.ALTERNATECONTACTRELATIONSHIPTBOX NEQ form.ALTERNATECONTACTRELATIONSHIPTBOX>
			<cfset note = note & "ALTERNATE CONTACT RELATIONSHIP changed from <strong>[</strong>#getQuote.ALTERNATECONTACTRELATIONSHIPTBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTRELATIONSHIPTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.BEDNUMBERTBOX") AND getQuote.BEDNUMBERTBOX NEQ form.BEDNUMBERTBOX>
			<cfset note = note & "BED NUMBER changed from <strong>[</strong>#getQuote.BEDNUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.BEDNUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERFNAMETBOX") AND getQuote.CALLERFNAMETBOX NEQ form.CALLERFNAMETBOX>
			<cfset note = note & "CALLER FIRST NAME changed from <strong>[</strong>#getQuote.CALLERFNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.CALLERFNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERMINITIALTBOX") AND getQuote.CALLERMINITIALTBOX NEQ form.CALLERMINITIALTBOX>
			<cfset note = note & "CALLER MIDDLE INITIAL changed from <strong>[</strong>#getQuote.CALLERMINITIALTBOX#<strong>]</strong> to <strong>[</strong>#form.CALLERMINITIALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERLNAMETBOX") AND getQuote.CALLERLNAMETBOX NEQ form.CALLERLNAMETBOX>
			<cfset note = note & "CALLER LAST NAME changed from <strong>[</strong>#getQuote.CALLERLNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.CALLERLNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERPHONETBOX") AND getQuote.CALLERPHONETBOX NEQ request.cleanNumericString(form.CALLERPHONETBOX)>
			<cfset note = note & "CALLER PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getQuote.CALLERPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.CALLERPHONETBOX#<strong>]</strong><br>">
		</cfif>		
		<cfif IsDefined("form.ORDERINGPHYSICIANFNAMETBOX") AND getQuote.ORDERINGPHYSICIANFNAMETBOX NEQ form.ORDERINGPHYSICIANFNAMETBOX>
			<cfset note = note & "ORDERING PHYSICIAN FIRST NAME changed from <strong>[</strong>#getQuote.ORDERINGPHYSICIANFNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANFNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANMINITIALTBOX") AND getQuote.ORDERINGPHYSICIANMINITIALTBOX NEQ form.ORDERINGPHYSICIANMINITIALTBOX>
			<cfset note = note & "ORDERING PHYSICIAN MIDDLE INITIAL changed from <strong>[</strong>#getQuote.ORDERINGPHYSICIANMINITIALTBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANMINITIALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANLNAMETBOX") AND getQuote.ORDERINGPHYSICIANLNAMETBOX NEQ form.ORDERINGPHYSICIANLNAMETBOX>
			<cfset note = note & "ORDERING PHYSICIAN LAST NAME changed from <strong>[</strong>#getQuote.ORDERINGPHYSICIANLNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANLNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANPHONETBOX") AND getQuote.ORDERINGPHYSICIANPHONETBOX NEQ request.cleanNumericString(form.ORDERINGPHYSICIANPHONETBOX)>
			<cfset note = note & "ORDERING PHYSICIAN PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getQuote.ORDERINGPHYSICIANPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTADDRESSTBOX") AND getQuote.PATIENTADDRESSTBOX NEQ form.PATIENTADDRESSTBOX>
			<cfset note = note & "PATIENT ADDRESS changed from <strong>[</strong>#getQuote.PATIENTADDRESSTBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTADDRESSTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTCITYTBOX") AND getQuote.PATIENTCITYTBOX NEQ form.PATIENTCITYTBOX>
			<cfset note = note & "PATIENT CITY changed from <strong>[</strong>#getQuote.PATIENTCITYTBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTCITYTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTDOBDD") AND getQuote.PATIENTDOBDD NEQ form.PATIENTDOBDD>
			<cfset note = note & "PATIENT DOB DAY changed from <strong>[</strong>#getQuote.PATIENTDOBDD#<strong>]</strong> to <strong>[</strong>#form.PATIENTDOBDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTDOBMM") AND getQuote.PATIENTDOBMM NEQ form.PATIENTDOBMM>
			<cfset note = note & "PATIENT DOB MONTH changed from <strong>[</strong>#getQuote.PATIENTDOBMM#<strong>]</strong> to <strong>[</strong>#form.PATIENTDOBMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTDOBYY") AND getQuote.PATIENTDOBYY NEQ form.PATIENTDOBYY>
			<cfset note = note & "PATIENT DOB YEAR changed from <strong>[</strong>#getQuote.PATIENTDOBYY#<strong>]</strong> to <strong>[</strong>#form.PATIENTDOBYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTHEIGHTINCHES") AND getQuote.PATIENTHEIGHTINCHES NEQ form.PATIENTHEIGHTINCHES>
			<cfset note = note & "PATIENT HEIGHT INCHES changed from <strong>[</strong>#getQuote.PATIENTHEIGHTINCHES#<strong>]</strong> to <strong>[</strong>#form.PATIENTHEIGHTINCHES#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTFNAMETBOX") AND getQuote.PATIENTFNAMETBOX NEQ form.PATIENTFNAMETBOX>
			<cfset note = note & "PATIENT FIRST NAME changed from <strong>[</strong>#getQuote.PATIENTFNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTFNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTMINITIALTBOX") AND getQuote.PATIENTMINITIALTBOX NEQ form.PATIENTMINITIALTBOX>
			<cfset note = note & "PATIENT MIDDLE INITIAL changed from <strong>[</strong>#getQuote.PATIENTMINITIALTBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTMINITIALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTLNAMETBOX") AND getQuote.PATIENTLNAMETBOX NEQ form.PATIENTLNAMETBOX>
			<cfset note = note & "PATIENT LAST NAME changed from <strong>[</strong>#getQuote.PATIENTLNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTLNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTPHONETBOX") AND getQuote.PATIENTPHONETBOX NEQ request.cleanNumericString(form.PATIENTPHONETBOX)>
			<cfset note = note & "PATIENT PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getQuote.PATIENTPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.PATIENTPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTSSNTBOX") AND getQuote.PATIENTSSNTBOX NEQ form.PATIENTSSNTBOX>
			<cfset note = note & "PATIENT SSN changed from <strong>[</strong>#getQuote.PATIENTSSNTBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTSSNTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTSTATETBOX") AND getQuote.PATIENTSTATETBOX NEQ form.PATIENTSTATETBOX>
			<cfset note = note & "PATIENT STATE changed from <strong>[</strong>#getQuote.PATIENTSTATETBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTSTATETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTWEIGHTTBOX") AND getQuote.PATIENTWEIGHTTBOX NEQ form.PATIENTWEIGHTTBOX>
			<cfset note = note & "PATIENT WEIGHT changed from <strong>[</strong>#getQuote.PATIENTWEIGHTTBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTWEIGHTTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PATIENTZIPTBOX") AND getQuote.PATIENTZIPTBOX NEQ form.PATIENTZIPTBOX>
			<cfset note = note & "PATIENT ZIP changed from <strong>[</strong>#getQuote.PATIENTZIPTBOX#<strong>]</strong> to <strong>[</strong>#form.PATIENTZIPTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PRIMARYINSURANCENAMETBOX") AND getQuote.PRIMARYINSURANCENAMETBOX NEQ form.PRIMARYINSURANCENAMETBOX>
			<cfset note = note & "PRIMARY INSURANCE NAME changed from <strong>[</strong>#getQuote.PRIMARYINSURANCENAMETBOX#<strong>]</strong> to <strong>[</strong>#form.PRIMARYINSURANCENAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.PRIMARYPOLICYNUMBERTBOX") AND getQuote.PRIMARYPOLICYNUMBERTBOX NEQ form.PRIMARYPOLICYNUMBERTBOX>
			<cfset note = note & "PRIMARY POLICY NUMBER changed from <strong>[</strong>#getQuote.PRIMARYPOLICYNUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.PRIMARYPOLICYNUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ROOMNUMBERTBOX") AND getQuote.ROOMNUMBERTBOX NEQ form.ROOMNUMBERTBOX>
			<cfset note = note & "ROOM NUMBER changed from <strong>[</strong>#getQuote.ROOMNUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.ROOMNUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.SECONDARYINSURANCENAMETBOX") AND getQuote.SECONDARYINSURANCENAMETBOX NEQ form.SECONDARYINSURANCENAMETBOX>
			<cfset note = note & "SECONDARY INSURANCE NAME changed from <strong>[</strong>#getQuote.SECONDARYINSURANCENAMETBOX#<strong>]</strong> to <strong>[</strong>#form.SECONDARYINSURANCENAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.SECONDARYPOLICYNUMBERTBOX") AND getQuote.SECONDARYPOLICYNUMBERTBOX NEQ form.SECONDARYPOLICYNUMBERTBOX>
			<cfset note = note & "SECONDARY POLICY NUMBER changed from <strong>[</strong>#getQuote.SECONDARYPOLICYNUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.SECONDARYPOLICYNUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE1TBOX") AND getQuote.HCPCCODE1TBOX NEQ form.HCPCCODE1TBOX>
			<cfset note = note & "HCPC CODE 1 changed from <strong>[</strong>#getQuote.HCPCCODE1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS1TBOX") AND getQuote.HCPCDIAGNOSIS1TBOX NEQ form.HCPCDIAGNOSIS1TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 1 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX1TBOX") AND getQuote.HCPCDX1TBOX NEQ form.HCPCDX1TBOX>
			<cfset note = note & "HCPC DX 1 changed from <strong>[</strong>#getQuote.HCPCDX1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT1TBOX") AND getQuote.HCPCPRODUCT1TBOX NEQ form.HCPCPRODUCT1TBOX>
			<cfset note = note & "HCPC PRODUCT 1 changed from <strong>[</strong>#getQuote.HCPCPRODUCT1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY1TBOX") AND getQuote.HCPCQTY1TBOX NEQ form.HCPCQTY1TBOX>
			<cfset note = note & "HCPC QUANTITY 1 changed from <strong>[</strong>#getQuote.HCPCQTY1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST1TBOX") AND getQuote.HCPCCOST1TBOX NEQ form.HCPCCOST1TBOX>
			<cfset note = note & "HCPC COST 1 changed from <strong>[</strong>#getQuote.HCPCCOST1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH1TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH1TBOX NEQ form.HCPCLENGTHOFNEEDMONTH1TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 1 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR1TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR1TBOX NEQ form.HCPCLENGTHOFNEEDYEAR1TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 1 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE2TBOX") AND getQuote.HCPCCODE2TBOX NEQ form.HCPCCODE2TBOX>
			<cfset note = note & "HCPC CODE 2 changed from <strong>[</strong>#getQuote.HCPCCODE2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS2TBOX") AND getQuote.HCPCDIAGNOSIS2TBOX NEQ form.HCPCDIAGNOSIS2TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 2 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX2TBOX") AND getQuote.HCPCDX2TBOX NEQ form.HCPCDX2TBOX>
			<cfset note = note & "HCPC DX 2 changed from <strong>[</strong>#getQuote.HCPCDX2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT2TBOX") AND getQuote.HCPCPRODUCT2TBOX NEQ form.HCPCPRODUCT2TBOX>
			<cfset note = note & "HCPC PRODUCT 2 changed from <strong>[</strong>#getQuote.HCPCPRODUCT2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY2TBOX") AND getQuote.HCPCQTY2TBOX NEQ form.HCPCQTY2TBOX>
			<cfset note = note & "HCPC QUANTITY 2 changed from <strong>[</strong>#getQuote.HCPCQTY2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST2TBOX") AND getQuote.HCPCCOST2TBOX NEQ form.HCPCCOST2TBOX>
			<cfset note = note & "HCPC COST 2 changed from <strong>[</strong>#getQuote.HCPCCOST2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH2TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH2TBOX NEQ form.HCPCLENGTHOFNEEDMONTH2TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 2 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR2TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR2TBOX NEQ form.HCPCLENGTHOFNEEDYEAR2TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 2 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE3TBOX") AND getQuote.HCPCCODE3TBOX NEQ form.HCPCCODE3TBOX>
			<cfset note = note & "HCPC CODE 3 changed from <strong>[</strong>#getQuote.HCPCCODE3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS3TBOX") AND getQuote.HCPCDIAGNOSIS3TBOX NEQ form.HCPCDIAGNOSIS3TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 3 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX3TBOX") AND getQuote.HCPCDX3TBOX NEQ form.HCPCDX3TBOX>
			<cfset note = note & "HCPC DX 3 changed from <strong>[</strong>#getQuote.HCPCDX3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT3TBOX") AND getQuote.HCPCPRODUCT3TBOX NEQ form.HCPCPRODUCT3TBOX>
			<cfset note = note & "HCPC PRODUCT 3 changed from <strong>[</strong>#getQuote.HCPCPRODUCT3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY3TBOX") AND getQuote.HCPCQTY3TBOX NEQ form.HCPCQTY3TBOX>
			<cfset note = note & "HCPC QUANTITY 3 changed from <strong>[</strong>#getQuote.HCPCQTY3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST3TBOX") AND getQuote.HCPCCOST3TBOX NEQ form.HCPCCOST3TBOX>
			<cfset note = note & "HCPC COST 3 changed from <strong>[</strong>#getQuote.HCPCCOST3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH3TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH3TBOX NEQ form.HCPCLENGTHOFNEEDMONTH3TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 3 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR3TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR3TBOX NEQ form.HCPCLENGTHOFNEEDYEAR3TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 3 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE4TBOX") AND getQuote.HCPCCODE4TBOX NEQ form.HCPCCODE4TBOX>
			<cfset note = note & "HCPC CODE 4 changed from <strong>[</strong>#getQuote.HCPCCODE4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS4TBOX") AND getQuote.HCPCDIAGNOSIS4TBOX NEQ form.HCPCDIAGNOSIS4TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 4 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX4TBOX") AND getQuote.HCPCDX4TBOX NEQ form.HCPCDX4TBOX>
			<cfset note = note & "HCPC DX 4 changed from <strong>[</strong>#getQuote.HCPCDX4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT4TBOX") AND getQuote.HCPCPRODUCT4TBOX NEQ form.HCPCPRODUCT4TBOX>
			<cfset note = note & "HCPC PRODUCT 4 changed from <strong>[</strong>#getQuote.HCPCPRODUCT4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY4TBOX") AND getQuote.HCPCQTY4TBOX NEQ form.HCPCQTY4TBOX>
			<cfset note = note & "HCPC QUANTITY 4 changed from <strong>[</strong>#getQuote.HCPCQTY4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST4TBOX") AND getQuote.HCPCCOST4TBOX NEQ form.HCPCCOST4TBOX>
			<cfset note = note & "HCPC COST 4 changed from <strong>[</strong>#getQuote.HCPCCOST4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH4TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH4TBOX NEQ form.HCPCLENGTHOFNEEDMONTH4TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 4 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR4TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR4TBOX NEQ form.HCPCLENGTHOFNEEDYEAR4TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 4 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE5TBOX") AND getQuote.HCPCCODE5TBOX NEQ form.HCPCCODE5TBOX>
			<cfset note = note & "HCPC CODE 5 changed from <strong>[</strong>#getQuote.HCPCCODE5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS5TBOX") AND getQuote.HCPCDIAGNOSIS5TBOX NEQ form.HCPCDIAGNOSIS5TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 5 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX5TBOX") AND getQuote.HCPCDX5TBOX NEQ form.HCPCDX5TBOX>
			<cfset note = note & "HCPC DX 5 changed from <strong>[</strong>#getQuote.HCPCDX5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT5TBOX") AND getQuote.HCPCPRODUCT5TBOX NEQ form.HCPCPRODUCT5TBOX>
			<cfset note = note & "HCPC PRODUCT 5 changed from <strong>[</strong>#getQuote.HCPCPRODUCT5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY5TBOX") AND getQuote.HCPCQTY5TBOX NEQ form.HCPCQTY5TBOX>
			<cfset note = note & "HCPC QUANTITY 5 changed from <strong>[</strong>#getQuote.HCPCQTY5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST5TBOX") AND getQuote.HCPCCOST5TBOX NEQ form.HCPCCOST5TBOX>
			<cfset note = note & "HCPC COST 5 changed from <strong>[</strong>#getQuote.HCPCCOST5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH5TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH5TBOX NEQ form.HCPCLENGTHOFNEEDMONTH5TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 5 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR5TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR5TBOX NEQ form.HCPCLENGTHOFNEEDYEAR5TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 5 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE6TBOX") AND getQuote.HCPCCODE6TBOX NEQ form.HCPCCODE6TBOX>
			<cfset note = note & "HCPC CODE 6 changed from <strong>[</strong>#getQuote.HCPCCODE6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS6TBOX") AND getQuote.HCPCDIAGNOSIS6TBOX NEQ form.HCPCDIAGNOSIS6TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 6 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX6TBOX") AND getQuote.HCPCDX6TBOX NEQ form.HCPCDX6TBOX>
			<cfset note = note & "HCPC DX 6 changed from <strong>[</strong>#getQuote.HCPCDX6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT6TBOX") AND getQuote.HCPCPRODUCT6TBOX NEQ form.HCPCPRODUCT6TBOX>
			<cfset note = note & "HCPC PRODUCT 6 changed from <strong>[</strong>#getQuote.HCPCPRODUCT6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY6TBOX") AND getQuote.HCPCQTY6TBOX NEQ form.HCPCQTY6TBOX>
			<cfset note = note & "HCPC QUANTITY 6 changed from <strong>[</strong>#getQuote.HCPCQTY6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST6TBOX") AND getQuote.HCPCCOST6TBOX NEQ form.HCPCCOST6TBOX>
			<cfset note = note & "HCPC COST 6 changed from <strong>[</strong>#getQuote.HCPCCOST6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH6TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH6TBOX NEQ form.HCPCLENGTHOFNEEDMONTH6TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 6 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR6TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR6TBOX NEQ form.HCPCLENGTHOFNEEDYEAR6TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 6 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE7TBOX") AND getQuote.HCPCCODE7TBOX NEQ form.HCPCCODE7TBOX>
			<cfset note = note & "HCPC CODE 7 changed from <strong>[</strong>#getQuote.HCPCCODE7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS7TBOX") AND getQuote.HCPCDIAGNOSIS7TBOX NEQ form.HCPCDIAGNOSIS7TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 7 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX7TBOX") AND getQuote.HCPCDX7TBOX NEQ form.HCPCDX7TBOX>
			<cfset note = note & "HCPC DX 7 changed from <strong>[</strong>#getQuote.HCPCDX7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT7TBOX") AND getQuote.HCPCPRODUCT7TBOX NEQ form.HCPCPRODUCT7TBOX>
			<cfset note = note & "HCPC PRODUCT 7 changed from <strong>[</strong>#getQuote.HCPCPRODUCT7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY7TBOX") AND getQuote.HCPCQTY7TBOX NEQ form.HCPCQTY7TBOX>
			<cfset note = note & "HCPC QUANTITY 7 changed from <strong>[</strong>#getQuote.HCPCQTY7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST7TBOX") AND getQuote.HCPCCOST7TBOX NEQ form.HCPCCOST7TBOX>
			<cfset note = note & "HCPC COST 7 changed from <strong>[</strong>#getQuote.HCPCCOST7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH7TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH7TBOX NEQ form.HCPCLENGTHOFNEEDMONTH7TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 7 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR7TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR7TBOX NEQ form.HCPCLENGTHOFNEEDYEAR7TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 7 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE8TBOX") AND getQuote.HCPCCODE8TBOX NEQ form.HCPCCODE8TBOX>
			<cfset note = note & "HCPC CODE 8 changed from <strong>[</strong>#getQuote.HCPCCODE8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS8TBOX") AND getQuote.HCPCDIAGNOSIS8TBOX NEQ form.HCPCDIAGNOSIS8TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 8 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX8TBOX") AND getQuote.HCPCDX8TBOX NEQ form.HCPCDX8TBOX>
			<cfset note = note & "HCPC DX 8 changed from <strong>[</strong>#getQuote.HCPCDX8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT8TBOX") AND getQuote.HCPCPRODUCT8TBOX NEQ form.HCPCPRODUCT8TBOX>
			<cfset note = note & "HCPC PRODUCT 8 changed from <strong>[</strong>#getQuote.HCPCPRODUCT8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY8TBOX") AND getQuote.HCPCQTY8TBOX NEQ form.HCPCQTY8TBOX>
			<cfset note = note & "HCPC QUANTITY 8 changed from <strong>[</strong>#getQuote.HCPCQTY8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST8TBOX") AND getQuote.HCPCCOST8TBOX NEQ form.HCPCCOST8TBOX>
			<cfset note = note & "HCPC COST 8 changed from <strong>[</strong>#getQuote.HCPCCOST8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH8TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH8TBOX NEQ form.HCPCLENGTHOFNEEDMONTH8TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 8 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR8TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR8TBOX NEQ form.HCPCLENGTHOFNEEDYEAR8TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 8 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE9TBOX") AND getQuote.HCPCCODE9TBOX NEQ form.HCPCCODE9TBOX>
			<cfset note = note & "HCPC CODE 9 changed from <strong>[</strong>#getQuote.HCPCCODE9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS9TBOX") AND getQuote.HCPCDIAGNOSIS9TBOX NEQ form.HCPCDIAGNOSIS9TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 9 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX9TBOX") AND getQuote.HCPCDX9TBOX NEQ form.HCPCDX9TBOX>
			<cfset note = note & "HCPC DX 9 changed from <strong>[</strong>#getQuote.HCPCDX9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT9TBOX") AND getQuote.HCPCPRODUCT9TBOX NEQ form.HCPCPRODUCT9TBOX>
			<cfset note = note & "HCPC PRODUCT 9 changed from <strong>[</strong>#getQuote.HCPCPRODUCT9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY9TBOX") AND getQuote.HCPCQTY9TBOX NEQ form.HCPCQTY9TBOX>
			<cfset note = note & "HCPC QUANTITY 9 changed from <strong>[</strong>#getQuote.HCPCQTY9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST9TBOX") AND getQuote.HCPCCOST9TBOX NEQ form.HCPCCOST9TBOX>
			<cfset note = note & "HCPC COST 9 changed from <strong>[</strong>#getQuote.HCPCCOST9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH9TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH9TBOX NEQ form.HCPCLENGTHOFNEEDMONTH9TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 9 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR9TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR9TBOX NEQ form.HCPCLENGTHOFNEEDYEAR9TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 9 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE10TBOX") AND getQuote.HCPCCODE10TBOX NEQ form.HCPCCODE10TBOX>
			<cfset note = note & "HCPC CODE 10 changed from <strong>[</strong>#getQuote.HCPCCODE10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS10TBOX") AND getQuote.HCPCDIAGNOSIS10TBOX NEQ form.HCPCDIAGNOSIS10TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 10 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX10TBOX") AND getQuote.HCPCDX10TBOX NEQ form.HCPCDX10TBOX>
			<cfset note = note & "HCPC DX 10 changed from <strong>[</strong>#getQuote.HCPCDX10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT10TBOX") AND getQuote.HCPCPRODUCT10TBOX NEQ form.HCPCPRODUCT10TBOX>
			<cfset note = note & "HCPC PRODUCT 10 changed from <strong>[</strong>#getQuote.HCPCPRODUCT10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY10TBOX") AND getQuote.HCPCQTY10TBOX NEQ form.HCPCQTY10TBOX>
			<cfset note = note & "HCPC QUANTITY 10 changed from <strong>[</strong>#getQuote.HCPCQTY10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST10TBOX") AND getQuote.HCPCCOST10TBOX NEQ form.HCPCCOST10TBOX>
			<cfset note = note & "HCPC COST 10 changed from <strong>[</strong>#getQuote.HCPCCOST10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH10TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH10TBOX NEQ form.HCPCLENGTHOFNEEDMONTH10TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 10 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR10TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR10TBOX NEQ form.HCPCLENGTHOFNEEDYEAR10TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 10 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE11TBOX") AND getQuote.HCPCCODE11TBOX NEQ form.HCPCCODE11TBOX>
			<cfset note = note & "HCPC CODE 11 changed from <strong>[</strong>#getQuote.HCPCCODE11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS11TBOX") AND getQuote.HCPCDIAGNOSIS11TBOX NEQ form.HCPCDIAGNOSIS11TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 11 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX11TBOX") AND getQuote.HCPCDX11TBOX NEQ form.HCPCDX11TBOX>
			<cfset note = note & "HCPC DX 11 changed from <strong>[</strong>#getQuote.HCPCDX11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT11TBOX") AND getQuote.HCPCPRODUCT11TBOX NEQ form.HCPCPRODUCT11TBOX>
			<cfset note = note & "HCPC PRODUCT 11 changed from <strong>[</strong>#getQuote.HCPCPRODUCT11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY11TBOX") AND getQuote.HCPCQTY11TBOX NEQ form.HCPCQTY11TBOX>
			<cfset note = note & "HCPC QUANTITY 11 changed from <strong>[</strong>#getQuote.HCPCQTY11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST11TBOX") AND getQuote.HCPCCOST11TBOX NEQ form.HCPCCOST11TBOX>
			<cfset note = note & "HCPC COST 11 changed from <strong>[</strong>#getQuote.HCPCCOST11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH11TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH11TBOX NEQ form.HCPCLENGTHOFNEEDMONTH11TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 11 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR11TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR11TBOX NEQ form.HCPCLENGTHOFNEEDYEAR11TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 11 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE12TBOX") AND getQuote.HCPCCODE12TBOX NEQ form.HCPCCODE12TBOX>
			<cfset note = note & "HCPC CODE 12 changed from <strong>[</strong>#getQuote.HCPCCODE12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS12TBOX") AND getQuote.HCPCDIAGNOSIS12TBOX NEQ form.HCPCDIAGNOSIS12TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 12 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX12TBOX") AND getQuote.HCPCDX12TBOX NEQ form.HCPCDX12TBOX>
			<cfset note = note & "HCPC DX 12 changed from <strong>[</strong>#getQuote.HCPCDX12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT12TBOX") AND getQuote.HCPCPRODUCT12TBOX NEQ form.HCPCPRODUCT12TBOX>
			<cfset note = note & "HCPC PRODUCT 12 changed from <strong>[</strong>#getQuote.HCPCPRODUCT12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY12TBOX") AND getQuote.HCPCQTY12TBOX NEQ form.HCPCQTY12TBOX>
			<cfset note = note & "HCPC QUANTITY 12 changed from <strong>[</strong>#getQuote.HCPCQTY12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST12TBOX") AND getQuote.HCPCCOST12TBOX NEQ form.HCPCCOST12TBOX>
			<cfset note = note & "HCPC COST 12 changed from <strong>[</strong>#getQuote.HCPCCOST12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH12TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH12TBOX NEQ form.HCPCLENGTHOFNEEDMONTH12TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 12 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR12TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR12TBOX NEQ form.HCPCLENGTHOFNEEDYEAR12TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 12 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE13TBOX") AND getQuote.HCPCCODE13TBOX NEQ form.HCPCCODE13TBOX>
			<cfset note = note & "HCPC CODE 13 changed from <strong>[</strong>#getQuote.HCPCCODE13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS13TBOX") AND getQuote.HCPCDIAGNOSIS13TBOX NEQ form.HCPCDIAGNOSIS13TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 13 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX13TBOX") AND getQuote.HCPCDX13TBOX NEQ form.HCPCDX13TBOX>
			<cfset note = note & "HCPC DX 13 changed from <strong>[</strong>#getQuote.HCPCDX13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT13TBOX") AND getQuote.HCPCPRODUCT13TBOX NEQ form.HCPCPRODUCT13TBOX>
			<cfset note = note & "HCPC PRODUCT 13 changed from <strong>[</strong>#getQuote.HCPCPRODUCT13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY13TBOX") AND getQuote.HCPCQTY13TBOX NEQ form.HCPCQTY13TBOX>
			<cfset note = note & "HCPC QUANTITY 13 changed from <strong>[</strong>#getQuote.HCPCQTY13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST13TBOX") AND getQuote.HCPCCOST13TBOX NEQ form.HCPCCOST13TBOX>
			<cfset note = note & "HCPC COST 13 changed from <strong>[</strong>#getQuote.HCPCCOST13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH13TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH13TBOX NEQ form.HCPCLENGTHOFNEEDMONTH13TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 13 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR13TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR13TBOX NEQ form.HCPCLENGTHOFNEEDYEAR13TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 13 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE14TBOX") AND getQuote.HCPCCODE14TBOX NEQ form.HCPCCODE14TBOX>
			<cfset note = note & "HCPC CODE 14 changed from <strong>[</strong>#getQuote.HCPCCODE14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS14TBOX") AND getQuote.HCPCDIAGNOSIS14TBOX NEQ form.HCPCDIAGNOSIS14TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 14 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX14TBOX") AND getQuote.HCPCDX14TBOX NEQ form.HCPCDX14TBOX>
			<cfset note = note & "HCPC DX 14 changed from <strong>[</strong>#getQuote.HCPCDX14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT14TBOX") AND getQuote.HCPCPRODUCT14TBOX NEQ form.HCPCPRODUCT14TBOX>
			<cfset note = note & "HCPC PRODUCT 14 changed from <strong>[</strong>#getQuote.HCPCPRODUCT14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY14TBOX") AND getQuote.HCPCQTY14TBOX NEQ form.HCPCQTY14TBOX>
			<cfset note = note & "HCPC QUANTITY 14 changed from <strong>[</strong>#getQuote.HCPCQTY14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST14TBOX") AND getQuote.HCPCCOST14TBOX NEQ form.HCPCCOST14TBOX>
			<cfset note = note & "HCPC COST 14 changed from <strong>[</strong>#getQuote.HCPCCOST14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH14TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH14TBOX NEQ form.HCPCLENGTHOFNEEDMONTH14TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 14 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR14TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR14TBOX NEQ form.HCPCLENGTHOFNEEDYEAR14TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 14 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE15TBOX") AND getQuote.HCPCCODE15TBOX NEQ form.HCPCCODE15TBOX>
			<cfset note = note & "HCPC CODE 15 changed from <strong>[</strong>#getQuote.HCPCCODE15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS15TBOX") AND getQuote.HCPCDIAGNOSIS15TBOX NEQ form.HCPCDIAGNOSIS15TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 15 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX15TBOX") AND getQuote.HCPCDX15TBOX NEQ form.HCPCDX15TBOX>
			<cfset note = note & "HCPC DX 15 changed from <strong>[</strong>#getQuote.HCPCDX15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT15TBOX") AND getQuote.HCPCPRODUCT15TBOX NEQ form.HCPCPRODUCT15TBOX>
			<cfset note = note & "HCPC PRODUCT 15 changed from <strong>[</strong>#getQuote.HCPCPRODUCT15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY15TBOX") AND getQuote.HCPCQTY15TBOX NEQ form.HCPCQTY15TBOX>
			<cfset note = note & "HCPC QUANTITY 15 changed from <strong>[</strong>#getQuote.HCPCQTY15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST15TBOX") AND getQuote.HCPCCOST15TBOX NEQ form.HCPCCOST15TBOX>
			<cfset note = note & "HCPC COST 15 changed from <strong>[</strong>#getQuote.HCPCCOST15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH15TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH15TBOX NEQ form.HCPCLENGTHOFNEEDMONTH15TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 15 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR15TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR15TBOX NEQ form.HCPCLENGTHOFNEEDYEAR15TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 15 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE16TBOX") AND getQuote.HCPCCODE16TBOX NEQ form.HCPCCODE16TBOX>
			<cfset note = note & "HCPC CODE 16 changed from <strong>[</strong>#getQuote.HCPCCODE16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS16TBOX") AND getQuote.HCPCDIAGNOSIS16TBOX NEQ form.HCPCDIAGNOSIS16TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 16 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX16TBOX") AND getQuote.HCPCDX16TBOX NEQ form.HCPCDX16TBOX>
			<cfset note = note & "HCPC DX 16 changed from <strong>[</strong>#getQuote.HCPCDX16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT16TBOX") AND getQuote.HCPCPRODUCT16TBOX NEQ form.HCPCPRODUCT16TBOX>
			<cfset note = note & "HCPC PRODUCT 16 changed from <strong>[</strong>#getQuote.HCPCPRODUCT16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY16TBOX") AND getQuote.HCPCQTY16TBOX NEQ form.HCPCQTY16TBOX>
			<cfset note = note & "HCPC QUANTITY 16 changed from <strong>[</strong>#getQuote.HCPCQTY16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST16TBOX") AND getQuote.HCPCCOST16TBOX NEQ form.HCPCCOST16TBOX>
			<cfset note = note & "HCPC COST 16 changed from <strong>[</strong>#getQuote.HCPCCOST16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH16TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH16TBOX NEQ form.HCPCLENGTHOFNEEDMONTH16TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 16 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR16TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR16TBOX NEQ form.HCPCLENGTHOFNEEDYEAR16TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 16 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE17TBOX") AND getQuote.HCPCCODE17TBOX NEQ form.HCPCCODE17TBOX>
			<cfset note = note & "HCPC CODE 17 changed from <strong>[</strong>#getQuote.HCPCCODE17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS17TBOX") AND getQuote.HCPCDIAGNOSIS17TBOX NEQ form.HCPCDIAGNOSIS17TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 17 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX17TBOX") AND getQuote.HCPCDX17TBOX NEQ form.HCPCDX17TBOX>
			<cfset note = note & "HCPC DX 17 changed from <strong>[</strong>#getQuote.HCPCDX17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT17TBOX") AND getQuote.HCPCPRODUCT17TBOX NEQ form.HCPCPRODUCT17TBOX>
			<cfset note = note & "HCPC PRODUCT 17 changed from <strong>[</strong>#getQuote.HCPCPRODUCT17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY17TBOX") AND getQuote.HCPCQTY17TBOX NEQ form.HCPCQTY17TBOX>
			<cfset note = note & "HCPC QUANTITY 17 changed from <strong>[</strong>#getQuote.HCPCQTY17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST17TBOX") AND getQuote.HCPCCOST17TBOX NEQ form.HCPCCOST17TBOX>
			<cfset note = note & "HCPC COST 17 changed from <strong>[</strong>#getQuote.HCPCCOST17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH17TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH17TBOX NEQ form.HCPCLENGTHOFNEEDMONTH17TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 17 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR17TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR17TBOX NEQ form.HCPCLENGTHOFNEEDYEAR17TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 17 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE18TBOX") AND getQuote.HCPCCODE18TBOX NEQ form.HCPCCODE18TBOX>
			<cfset note = note & "HCPC CODE 18 changed from <strong>[</strong>#getQuote.HCPCCODE18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS18TBOX") AND getQuote.HCPCDIAGNOSIS18TBOX NEQ form.HCPCDIAGNOSIS18TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 18 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX18TBOX") AND getQuote.HCPCDX18TBOX NEQ form.HCPCDX18TBOX>
			<cfset note = note & "HCPC DX 18 changed from <strong>[</strong>#getQuote.HCPCDX18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT18TBOX") AND getQuote.HCPCPRODUCT18TBOX NEQ form.HCPCPRODUCT18TBOX>
			<cfset note = note & "HCPC PRODUCT 18 changed from <strong>[</strong>#getQuote.HCPCPRODUCT18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY18TBOX") AND getQuote.HCPCQTY18TBOX NEQ form.HCPCQTY18TBOX>
			<cfset note = note & "HCPC QUANTITY 18 changed from <strong>[</strong>#getQuote.HCPCQTY18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST18TBOX") AND getQuote.HCPCCOST18TBOX NEQ form.HCPCCOST18TBOX>
			<cfset note = note & "HCPC COST 18 changed from <strong>[</strong>#getQuote.HCPCCOST18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH18TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH18TBOX NEQ form.HCPCLENGTHOFNEEDMONTH18TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 18 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR18TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR18TBOX NEQ form.HCPCLENGTHOFNEEDYEAR18TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 18 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE19TBOX") AND getQuote.HCPCCODE19TBOX NEQ form.HCPCCODE19TBOX>
			<cfset note = note & "HCPC CODE 19 changed from <strong>[</strong>#getQuote.HCPCCODE19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS19TBOX") AND getQuote.HCPCDIAGNOSIS19TBOX NEQ form.HCPCDIAGNOSIS19TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 19 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX19TBOX") AND getQuote.HCPCDX19TBOX NEQ form.HCPCDX19TBOX>
			<cfset note = note & "HCPC DX 19 changed from <strong>[</strong>#getQuote.HCPCDX19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT19TBOX") AND getQuote.HCPCPRODUCT19TBOX NEQ form.HCPCPRODUCT19TBOX>
			<cfset note = note & "HCPC PRODUCT 19 changed from <strong>[</strong>#getQuote.HCPCPRODUCT19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY19TBOX") AND getQuote.HCPCQTY19TBOX NEQ form.HCPCQTY19TBOX>
			<cfset note = note & "HCPC QUANTITY 19 changed from <strong>[</strong>#getQuote.HCPCQTY19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST19TBOX") AND getQuote.HCPCCOST19TBOX NEQ form.HCPCCOST19TBOX>
			<cfset note = note & "HCPC COST 19 changed from <strong>[</strong>#getQuote.HCPCCOST19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH19TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH19TBOX NEQ form.HCPCLENGTHOFNEEDMONTH19TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 19 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR19TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR19TBOX NEQ form.HCPCLENGTHOFNEEDYEAR19TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 19 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE20TBOX") AND getQuote.HCPCCODE20TBOX NEQ form.HCPCCODE20TBOX>
			<cfset note = note & "HCPC CODE 20 changed from <strong>[</strong>#getQuote.HCPCCODE20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS20TBOX") AND getQuote.HCPCDIAGNOSIS20TBOX NEQ form.HCPCDIAGNOSIS20TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 20 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX20TBOX") AND getQuote.HCPCDX20TBOX NEQ form.HCPCDX20TBOX>
			<cfset note = note & "HCPC DX 20 changed from <strong>[</strong>#getQuote.HCPCDX20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT20TBOX") AND getQuote.HCPCPRODUCT20TBOX NEQ form.HCPCPRODUCT20TBOX>
			<cfset note = note & "HCPC PRODUCT 20 changed from <strong>[</strong>#getQuote.HCPCPRODUCT20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY20TBOX") AND getQuote.HCPCQTY20TBOX NEQ form.HCPCQTY20TBOX>
			<cfset note = note & "HCPC QUANTITY 20 changed from <strong>[</strong>#getQuote.HCPCQTY20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST20TBOX") AND getQuote.HCPCCOST20TBOX NEQ form.HCPCCOST20TBOX>
			<cfset note = note & "HCPC COST 20 changed from <strong>[</strong>#getQuote.HCPCCOST20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH20TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH20TBOX NEQ form.HCPCLENGTHOFNEEDMONTH20TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 20 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR20TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR20TBOX NEQ form.HCPCLENGTHOFNEEDYEAR20TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 20 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE21TBOX") AND getQuote.HCPCCODE21TBOX NEQ form.HCPCCODE21TBOX>
			<cfset note = note & "HCPC CODE 21 changed from <strong>[</strong>#getQuote.HCPCCODE21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS21TBOX") AND getQuote.HCPCDIAGNOSIS21TBOX NEQ form.HCPCDIAGNOSIS21TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 21 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX21TBOX") AND getQuote.HCPCDX21TBOX NEQ form.HCPCDX21TBOX>
			<cfset note = note & "HCPC DX 21 changed from <strong>[</strong>#getQuote.HCPCDX21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT21TBOX") AND getQuote.HCPCPRODUCT21TBOX NEQ form.HCPCPRODUCT21TBOX>
			<cfset note = note & "HCPC PRODUCT 21 changed from <strong>[</strong>#getQuote.HCPCPRODUCT21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY21TBOX") AND getQuote.HCPCQTY21TBOX NEQ form.HCPCQTY21TBOX>
			<cfset note = note & "HCPC QUANTITY 21 changed from <strong>[</strong>#getQuote.HCPCQTY21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST21TBOX") AND getQuote.HCPCCOST21TBOX NEQ form.HCPCCOST21TBOX>
			<cfset note = note & "HCPC COST 21 changed from <strong>[</strong>#getQuote.HCPCCOST21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH21TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH21TBOX NEQ form.HCPCLENGTHOFNEEDMONTH21TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 21 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR21TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR21TBOX NEQ form.HCPCLENGTHOFNEEDYEAR21TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 21 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE22TBOX") AND getQuote.HCPCCODE22TBOX NEQ form.HCPCCODE22TBOX>
			<cfset note = note & "HCPC CODE 22 changed from <strong>[</strong>#getQuote.HCPCCODE22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS22TBOX") AND getQuote.HCPCDIAGNOSIS22TBOX NEQ form.HCPCDIAGNOSIS22TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 22 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX22TBOX") AND getQuote.HCPCDX22TBOX NEQ form.HCPCDX22TBOX>
			<cfset note = note & "HCPC DX 22 changed from <strong>[</strong>#getQuote.HCPCDX22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT22TBOX") AND getQuote.HCPCPRODUCT22TBOX NEQ form.HCPCPRODUCT22TBOX>
			<cfset note = note & "HCPC PRODUCT 22 changed from <strong>[</strong>#getQuote.HCPCPRODUCT22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY22TBOX") AND getQuote.HCPCQTY22TBOX NEQ form.HCPCQTY22TBOX>
			<cfset note = note & "HCPC QUANTITY 22 changed from <strong>[</strong>#getQuote.HCPCQTY22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST22TBOX") AND getQuote.HCPCCOST22TBOX NEQ form.HCPCCOST22TBOX>
			<cfset note = note & "HCPC COST 22 changed from <strong>[</strong>#getQuote.HCPCCOST22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH22TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH22TBOX NEQ form.HCPCLENGTHOFNEEDMONTH22TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 22 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR22TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR22TBOX NEQ form.HCPCLENGTHOFNEEDYEAR22TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 22 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE23TBOX") AND getQuote.HCPCCODE23TBOX NEQ form.HCPCCODE23TBOX>
			<cfset note = note & "HCPC CODE 23 changed from <strong>[</strong>#getQuote.HCPCCODE23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS23TBOX") AND getQuote.HCPCDIAGNOSIS23TBOX NEQ form.HCPCDIAGNOSIS23TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 23 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX23TBOX") AND getQuote.HCPCDX23TBOX NEQ form.HCPCDX23TBOX>
			<cfset note = note & "HCPC DX 23 changed from <strong>[</strong>#getQuote.HCPCDX23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT23TBOX") AND getQuote.HCPCPRODUCT23TBOX NEQ form.HCPCPRODUCT23TBOX>
			<cfset note = note & "HCPC PRODUCT 23 changed from <strong>[</strong>#getQuote.HCPCPRODUCT23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY23TBOX") AND getQuote.HCPCQTY23TBOX NEQ form.HCPCQTY23TBOX>
			<cfset note = note & "HCPC QUANTITY 23 changed from <strong>[</strong>#getQuote.HCPCQTY23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST23TBOX") AND getQuote.HCPCCOST23TBOX NEQ form.HCPCCOST23TBOX>
			<cfset note = note & "HCPC COST 23 changed from <strong>[</strong>#getQuote.HCPCCOST23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH23TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH23TBOX NEQ form.HCPCLENGTHOFNEEDMONTH23TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 23 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR23TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR23TBOX NEQ form.HCPCLENGTHOFNEEDYEAR23TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 23 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE24TBOX") AND getQuote.HCPCCODE24TBOX NEQ form.HCPCCODE24TBOX>
			<cfset note = note & "HCPC CODE 24 changed from <strong>[</strong>#getQuote.HCPCCODE24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS24TBOX") AND getQuote.HCPCDIAGNOSIS24TBOX NEQ form.HCPCDIAGNOSIS24TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 24 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX24TBOX") AND getQuote.HCPCDX24TBOX NEQ form.HCPCDX24TBOX>
			<cfset note = note & "HCPC DX 24 changed from <strong>[</strong>#getQuote.HCPCDX24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT24TBOX") AND getQuote.HCPCPRODUCT24TBOX NEQ form.HCPCPRODUCT24TBOX>
			<cfset note = note & "HCPC PRODUCT 24 changed from <strong>[</strong>#getQuote.HCPCPRODUCT24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY24TBOX") AND getQuote.HCPCQTY24TBOX NEQ form.HCPCQTY24TBOX>
			<cfset note = note & "HCPC QUANTITY 24 changed from <strong>[</strong>#getQuote.HCPCQTY24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST24TBOX") AND getQuote.HCPCCOST24TBOX NEQ form.HCPCCOST24TBOX>
			<cfset note = note & "HCPC COST 24 changed from <strong>[</strong>#getQuote.HCPCCOST24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH24TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH24TBOX NEQ form.HCPCLENGTHOFNEEDMONTH24TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 24 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR24TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR24TBOX NEQ form.HCPCLENGTHOFNEEDYEAR24TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 24 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE25TBOX") AND getQuote.HCPCCODE25TBOX NEQ form.HCPCCODE25TBOX>
			<cfset note = note & "HCPC CODE 25 changed from <strong>[</strong>#getQuote.HCPCCODE25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS25TBOX") AND getQuote.HCPCDIAGNOSIS25TBOX NEQ form.HCPCDIAGNOSIS25TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 25 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX25TBOX") AND getQuote.HCPCDX25TBOX NEQ form.HCPCDX25TBOX>
			<cfset note = note & "HCPC DX 25 changed from <strong>[</strong>#getQuote.HCPCDX25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT25TBOX") AND getQuote.HCPCPRODUCT25TBOX NEQ form.HCPCPRODUCT25TBOX>
			<cfset note = note & "HCPC PRODUCT 25 changed from <strong>[</strong>#getQuote.HCPCPRODUCT25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY25TBOX") AND getQuote.HCPCQTY25TBOX NEQ form.HCPCQTY25TBOX>
			<cfset note = note & "HCPC QUANTITY 25 changed from <strong>[</strong>#getQuote.HCPCQTY25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST25TBOX") AND getQuote.HCPCCOST25TBOX NEQ form.HCPCCOST25TBOX>
			<cfset note = note & "HCPC COST 25 changed from <strong>[</strong>#getQuote.HCPCCOST25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH25TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH25TBOX NEQ form.HCPCLENGTHOFNEEDMONTH25TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 25 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR25TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR25TBOX NEQ form.HCPCLENGTHOFNEEDYEAR25TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 25 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE26TBOX") AND getQuote.HCPCCODE26TBOX NEQ form.HCPCCODE26TBOX>
			<cfset note = note & "HCPC CODE 26 changed from <strong>[</strong>#getQuote.HCPCCODE26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS26TBOX") AND getQuote.HCPCDIAGNOSIS26TBOX NEQ form.HCPCDIAGNOSIS26TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 26 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX26TBOX") AND getQuote.HCPCDX26TBOX NEQ form.HCPCDX26TBOX>
			<cfset note = note & "HCPC DX 26 changed from <strong>[</strong>#getQuote.HCPCDX26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT26TBOX") AND getQuote.HCPCPRODUCT26TBOX NEQ form.HCPCPRODUCT26TBOX>
			<cfset note = note & "HCPC PRODUCT 26 changed from <strong>[</strong>#getQuote.HCPCPRODUCT26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY26TBOX") AND getQuote.HCPCQTY26TBOX NEQ form.HCPCQTY26TBOX>
			<cfset note = note & "HCPC QUANTITY 26 changed from <strong>[</strong>#getQuote.HCPCQTY26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST26TBOX") AND getQuote.HCPCCOST26TBOX NEQ form.HCPCCOST26TBOX>
			<cfset note = note & "HCPC COST 26 changed from <strong>[</strong>#getQuote.HCPCCOST26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH26TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH26TBOX NEQ form.HCPCLENGTHOFNEEDMONTH26TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 26 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR26TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR26TBOX NEQ form.HCPCLENGTHOFNEEDYEAR26TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 26 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE27TBOX") AND getQuote.HCPCCODE27TBOX NEQ form.HCPCCODE27TBOX>
			<cfset note = note & "HCPC CODE 27 changed from <strong>[</strong>#getQuote.HCPCCODE27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS27TBOX") AND getQuote.HCPCDIAGNOSIS27TBOX NEQ form.HCPCDIAGNOSIS27TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 27 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX27TBOX") AND getQuote.HCPCDX27TBOX NEQ form.HCPCDX27TBOX>
			<cfset note = note & "HCPC DX 27 changed from <strong>[</strong>#getQuote.HCPCDX27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT27TBOX") AND getQuote.HCPCPRODUCT27TBOX NEQ form.HCPCPRODUCT27TBOX>
			<cfset note = note & "HCPC PRODUCT 27 changed from <strong>[</strong>#getQuote.HCPCPRODUCT27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY27TBOX") AND getQuote.HCPCQTY27TBOX NEQ form.HCPCQTY27TBOX>
			<cfset note = note & "HCPC QUANTITY 27 changed from <strong>[</strong>#getQuote.HCPCQTY27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST27TBOX") AND getQuote.HCPCCOST27TBOX NEQ form.HCPCCOST27TBOX>
			<cfset note = note & "HCPC COST 27 changed from <strong>[</strong>#getQuote.HCPCCOST27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH27TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH27TBOX NEQ form.HCPCLENGTHOFNEEDMONTH27TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 27 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR27TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR27TBOX NEQ form.HCPCLENGTHOFNEEDYEAR27TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 27 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE28TBOX") AND getQuote.HCPCCODE28TBOX NEQ form.HCPCCODE28TBOX>
			<cfset note = note & "HCPC CODE 28 changed from <strong>[</strong>#getQuote.HCPCCODE28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS28TBOX") AND getQuote.HCPCDIAGNOSIS28TBOX NEQ form.HCPCDIAGNOSIS28TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 28 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX28TBOX") AND getQuote.HCPCDX28TBOX NEQ form.HCPCDX28TBOX>
			<cfset note = note & "HCPC DX 28 changed from <strong>[</strong>#getQuote.HCPCDX28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT28TBOX") AND getQuote.HCPCPRODUCT28TBOX NEQ form.HCPCPRODUCT28TBOX>
			<cfset note = note & "HCPC PRODUCT 28 changed from <strong>[</strong>#getQuote.HCPCPRODUCT28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY28TBOX") AND getQuote.HCPCQTY28TBOX NEQ form.HCPCQTY28TBOX>
			<cfset note = note & "HCPC QUANTITY 28 changed from <strong>[</strong>#getQuote.HCPCQTY28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST28TBOX") AND getQuote.HCPCCOST28TBOX NEQ form.HCPCCOST28TBOX>
			<cfset note = note & "HCPC COST 28 changed from <strong>[</strong>#getQuote.HCPCCOST28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH28TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH28TBOX NEQ form.HCPCLENGTHOFNEEDMONTH28TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 28 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR28TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR28TBOX NEQ form.HCPCLENGTHOFNEEDYEAR28TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 28 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE29TBOX") AND getQuote.HCPCCODE29TBOX NEQ form.HCPCCODE29TBOX>
			<cfset note = note & "HCPC CODE 29 changed from <strong>[</strong>#getQuote.HCPCCODE29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS29TBOX") AND getQuote.HCPCDIAGNOSIS29TBOX NEQ form.HCPCDIAGNOSIS29TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 29 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX29TBOX") AND getQuote.HCPCDX29TBOX NEQ form.HCPCDX29TBOX>
			<cfset note = note & "HCPC DX 29 changed from <strong>[</strong>#getQuote.HCPCDX29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT29TBOX") AND getQuote.HCPCPRODUCT29TBOX NEQ form.HCPCPRODUCT29TBOX>
			<cfset note = note & "HCPC PRODUCT 29 changed from <strong>[</strong>#getQuote.HCPCPRODUCT29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY29TBOX") AND getQuote.HCPCQTY29TBOX NEQ form.HCPCQTY29TBOX>
			<cfset note = note & "HCPC QUANTITY 29 changed from <strong>[</strong>#getQuote.HCPCQTY29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST29TBOX") AND getQuote.HCPCCOST29TBOX NEQ form.HCPCCOST29TBOX>
			<cfset note = note & "HCPC COST 29 changed from <strong>[</strong>#getQuote.HCPCCOST29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH29TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH29TBOX NEQ form.HCPCLENGTHOFNEEDMONTH29TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 29 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR29TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR29TBOX NEQ form.HCPCLENGTHOFNEEDYEAR29TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 29 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE30TBOX") AND getQuote.HCPCCODE30TBOX NEQ form.HCPCCODE30TBOX>
			<cfset note = note & "HCPC CODE 30 changed from <strong>[</strong>#getQuote.HCPCCODE30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS30TBOX") AND getQuote.HCPCDIAGNOSIS30TBOX NEQ form.HCPCDIAGNOSIS30TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 30 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX30TBOX") AND getQuote.HCPCDX30TBOX NEQ form.HCPCDX30TBOX>
			<cfset note = note & "HCPC DX 30 changed from <strong>[</strong>#getQuote.HCPCDX30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT30TBOX") AND getQuote.HCPCPRODUCT30TBOX NEQ form.HCPCPRODUCT30TBOX>
			<cfset note = note & "HCPC PRODUCT 30 changed from <strong>[</strong>#getQuote.HCPCPRODUCT30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY30TBOX") AND getQuote.HCPCQTY30TBOX NEQ form.HCPCQTY30TBOX>
			<cfset note = note & "HCPC QUANTITY 30 changed from <strong>[</strong>#getQuote.HCPCQTY30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST30TBOX") AND getQuote.HCPCCOST30TBOX NEQ form.HCPCCOST30TBOX>
			<cfset note = note & "HCPC COST 30 changed from <strong>[</strong>#getQuote.HCPCCOST30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH30TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH30TBOX NEQ form.HCPCLENGTHOFNEEDMONTH30TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 30 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR30TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR30TBOX NEQ form.HCPCLENGTHOFNEEDYEAR30TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 30 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE31TBOX") AND getQuote.HCPCCODE31TBOX NEQ form.HCPCCODE31TBOX>
			<cfset note = note & "HCPC CODE 31 changed from <strong>[</strong>#getQuote.HCPCCODE31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS31TBOX") AND getQuote.HCPCDIAGNOSIS31TBOX NEQ form.HCPCDIAGNOSIS31TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 31 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX31TBOX") AND getQuote.HCPCDX31TBOX NEQ form.HCPCDX31TBOX>
			<cfset note = note & "HCPC DX 31 changed from <strong>[</strong>#getQuote.HCPCDX31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT31TBOX") AND getQuote.HCPCPRODUCT31TBOX NEQ form.HCPCPRODUCT31TBOX>
			<cfset note = note & "HCPC PRODUCT 31 changed from <strong>[</strong>#getQuote.HCPCPRODUCT31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY31TBOX") AND getQuote.HCPCQTY31TBOX NEQ form.HCPCQTY31TBOX>
			<cfset note = note & "HCPC QUANTITY 31 changed from <strong>[</strong>#getQuote.HCPCQTY31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST31TBOX") AND getQuote.HCPCCOST31TBOX NEQ form.HCPCCOST31TBOX>
			<cfset note = note & "HCPC COST 31 changed from <strong>[</strong>#getQuote.HCPCCOST31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH31TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH31TBOX NEQ form.HCPCLENGTHOFNEEDMONTH31TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 31 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR31TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR31TBOX NEQ form.HCPCLENGTHOFNEEDYEAR31TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 31 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE32TBOX") AND getQuote.HCPCCODE32TBOX NEQ form.HCPCCODE32TBOX>
			<cfset note = note & "HCPC CODE 32 changed from <strong>[</strong>#getQuote.HCPCCODE32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS32TBOX") AND getQuote.HCPCDIAGNOSIS32TBOX NEQ form.HCPCDIAGNOSIS32TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 32 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX32TBOX") AND getQuote.HCPCDX32TBOX NEQ form.HCPCDX32TBOX>
			<cfset note = note & "HCPC DX 32 changed from <strong>[</strong>#getQuote.HCPCDX32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT32TBOX") AND getQuote.HCPCPRODUCT32TBOX NEQ form.HCPCPRODUCT32TBOX>
			<cfset note = note & "HCPC PRODUCT 32 changed from <strong>[</strong>#getQuote.HCPCPRODUCT32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY32TBOX") AND getQuote.HCPCQTY32TBOX NEQ form.HCPCQTY32TBOX>
			<cfset note = note & "HCPC QUANTITY 32 changed from <strong>[</strong>#getQuote.HCPCQTY32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST32TBOX") AND getQuote.HCPCCOST32TBOX NEQ form.HCPCCOST32TBOX>
			<cfset note = note & "HCPC COST 32 changed from <strong>[</strong>#getQuote.HCPCCOST32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH32TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH32TBOX NEQ form.HCPCLENGTHOFNEEDMONTH32TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 32 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR32TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR32TBOX NEQ form.HCPCLENGTHOFNEEDYEAR32TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 32 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE33TBOX") AND getQuote.HCPCCODE33TBOX NEQ form.HCPCCODE33TBOX>
			<cfset note = note & "HCPC CODE 33 changed from <strong>[</strong>#getQuote.HCPCCODE33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS33TBOX") AND getQuote.HCPCDIAGNOSIS33TBOX NEQ form.HCPCDIAGNOSIS33TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 33 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX33TBOX") AND getQuote.HCPCDX33TBOX NEQ form.HCPCDX33TBOX>
			<cfset note = note & "HCPC DX 33 changed from <strong>[</strong>#getQuote.HCPCDX33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT33TBOX") AND getQuote.HCPCPRODUCT33TBOX NEQ form.HCPCPRODUCT33TBOX>
			<cfset note = note & "HCPC PRODUCT 33 changed from <strong>[</strong>#getQuote.HCPCPRODUCT33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY33TBOX") AND getQuote.HCPCQTY33TBOX NEQ form.HCPCQTY33TBOX>
			<cfset note = note & "HCPC QUANTITY 33 changed from <strong>[</strong>#getQuote.HCPCQTY33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST33TBOX") AND getQuote.HCPCCOST33TBOX NEQ form.HCPCCOST33TBOX>
			<cfset note = note & "HCPC COST 33 changed from <strong>[</strong>#getQuote.HCPCCOST33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH33TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH33TBOX NEQ form.HCPCLENGTHOFNEEDMONTH33TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 33 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR33TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR33TBOX NEQ form.HCPCLENGTHOFNEEDYEAR33TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 33 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE34TBOX") AND getQuote.HCPCCODE34TBOX NEQ form.HCPCCODE34TBOX>
			<cfset note = note & "HCPC CODE 34 changed from <strong>[</strong>#getQuote.HCPCCODE34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS34TBOX") AND getQuote.HCPCDIAGNOSIS34TBOX NEQ form.HCPCDIAGNOSIS34TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 34 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX34TBOX") AND getQuote.HCPCDX34TBOX NEQ form.HCPCDX34TBOX>
			<cfset note = note & "HCPC DX 34 changed from <strong>[</strong>#getQuote.HCPCDX34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT34TBOX") AND getQuote.HCPCPRODUCT34TBOX NEQ form.HCPCPRODUCT34TBOX>
			<cfset note = note & "HCPC PRODUCT 34 changed from <strong>[</strong>#getQuote.HCPCPRODUCT34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY34TBOX") AND getQuote.HCPCQTY34TBOX NEQ form.HCPCQTY34TBOX>
			<cfset note = note & "HCPC QUANTITY 34 changed from <strong>[</strong>#getQuote.HCPCQTY34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST34TBOX") AND getQuote.HCPCCOST34TBOX NEQ form.HCPCCOST34TBOX>
			<cfset note = note & "HCPC COST 34 changed from <strong>[</strong>#getQuote.HCPCCOST34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH34TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH34TBOX NEQ form.HCPCLENGTHOFNEEDMONTH34TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 34 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR34TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR34TBOX NEQ form.HCPCLENGTHOFNEEDYEAR34TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 34 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE35TBOX") AND getQuote.HCPCCODE35TBOX NEQ form.HCPCCODE35TBOX>
			<cfset note = note & "HCPC CODE 35 changed from <strong>[</strong>#getQuote.HCPCCODE35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS35TBOX") AND getQuote.HCPCDIAGNOSIS35TBOX NEQ form.HCPCDIAGNOSIS35TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 35 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX35TBOX") AND getQuote.HCPCDX35TBOX NEQ form.HCPCDX35TBOX>
			<cfset note = note & "HCPC DX 35 changed from <strong>[</strong>#getQuote.HCPCDX35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT35TBOX") AND getQuote.HCPCPRODUCT35TBOX NEQ form.HCPCPRODUCT35TBOX>
			<cfset note = note & "HCPC PRODUCT 35 changed from <strong>[</strong>#getQuote.HCPCPRODUCT35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY35TBOX") AND getQuote.HCPCQTY35TBOX NEQ form.HCPCQTY35TBOX>
			<cfset note = note & "HCPC QUANTITY 35 changed from <strong>[</strong>#getQuote.HCPCQTY35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST35TBOX") AND getQuote.HCPCCOST35TBOX NEQ form.HCPCCOST35TBOX>
			<cfset note = note & "HCPC COST 35 changed from <strong>[</strong>#getQuote.HCPCCOST35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH35TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH35TBOX NEQ form.HCPCLENGTHOFNEEDMONTH35TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 35 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR35TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR35TBOX NEQ form.HCPCLENGTHOFNEEDYEAR35TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 35 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE36TBOX") AND getQuote.HCPCCODE36TBOX NEQ form.HCPCCODE36TBOX>
			<cfset note = note & "HCPC CODE 36 changed from <strong>[</strong>#getQuote.HCPCCODE36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS36TBOX") AND getQuote.HCPCDIAGNOSIS36TBOX NEQ form.HCPCDIAGNOSIS36TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 36 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX36TBOX") AND getQuote.HCPCDX36TBOX NEQ form.HCPCDX36TBOX>
			<cfset note = note & "HCPC DX 36 changed from <strong>[</strong>#getQuote.HCPCDX36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT36TBOX") AND getQuote.HCPCPRODUCT36TBOX NEQ form.HCPCPRODUCT36TBOX>
			<cfset note = note & "HCPC PRODUCT 36 changed from <strong>[</strong>#getQuote.HCPCPRODUCT36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY36TBOX") AND getQuote.HCPCQTY36TBOX NEQ form.HCPCQTY36TBOX>
			<cfset note = note & "HCPC QUANTITY 36 changed from <strong>[</strong>#getQuote.HCPCQTY36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST36TBOX") AND getQuote.HCPCCOST36TBOX NEQ form.HCPCCOST36TBOX>
			<cfset note = note & "HCPC COST 36 changed from <strong>[</strong>#getQuote.HCPCCOST36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH36TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH36TBOX NEQ form.HCPCLENGTHOFNEEDMONTH36TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 36 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR36TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR36TBOX NEQ form.HCPCLENGTHOFNEEDYEAR36TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 36 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE37TBOX") AND getQuote.HCPCCODE37TBOX NEQ form.HCPCCODE37TBOX>
			<cfset note = note & "HCPC CODE 37 changed from <strong>[</strong>#getQuote.HCPCCODE37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS37TBOX") AND getQuote.HCPCDIAGNOSIS37TBOX NEQ form.HCPCDIAGNOSIS37TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 37 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX37TBOX") AND getQuote.HCPCDX37TBOX NEQ form.HCPCDX37TBOX>
			<cfset note = note & "HCPC DX 37 changed from <strong>[</strong>#getQuote.HCPCDX37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT37TBOX") AND getQuote.HCPCPRODUCT37TBOX NEQ form.HCPCPRODUCT37TBOX>
			<cfset note = note & "HCPC PRODUCT 37 changed from <strong>[</strong>#getQuote.HCPCPRODUCT37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY37TBOX") AND getQuote.HCPCQTY37TBOX NEQ form.HCPCQTY37TBOX>
			<cfset note = note & "HCPC QUANTITY 37 changed from <strong>[</strong>#getQuote.HCPCQTY37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST37TBOX") AND getQuote.HCPCCOST37TBOX NEQ form.HCPCCOST37TBOX>
			<cfset note = note & "HCPC COST 37 changed from <strong>[</strong>#getQuote.HCPCCOST37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH37TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH37TBOX NEQ form.HCPCLENGTHOFNEEDMONTH37TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 37 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR37TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR37TBOX NEQ form.HCPCLENGTHOFNEEDYEAR37TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 37 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE38TBOX") AND getQuote.HCPCCODE38TBOX NEQ form.HCPCCODE38TBOX>
			<cfset note = note & "HCPC CODE 38 changed from <strong>[</strong>#getQuote.HCPCCODE38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS38TBOX") AND getQuote.HCPCDIAGNOSIS38TBOX NEQ form.HCPCDIAGNOSIS38TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 38 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX38TBOX") AND getQuote.HCPCDX38TBOX NEQ form.HCPCDX38TBOX>
			<cfset note = note & "HCPC DX 38 changed from <strong>[</strong>#getQuote.HCPCDX38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT38TBOX") AND getQuote.HCPCPRODUCT38TBOX NEQ form.HCPCPRODUCT38TBOX>
			<cfset note = note & "HCPC PRODUCT 38 changed from <strong>[</strong>#getQuote.HCPCPRODUCT38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY38TBOX") AND getQuote.HCPCQTY38TBOX NEQ form.HCPCQTY38TBOX>
			<cfset note = note & "HCPC QUANTITY 38 changed from <strong>[</strong>#getQuote.HCPCQTY38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST38TBOX") AND getQuote.HCPCCOST38TBOX NEQ form.HCPCCOST38TBOX>
			<cfset note = note & "HCPC COST 38 changed from <strong>[</strong>#getQuote.HCPCCOST38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH38TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH38TBOX NEQ form.HCPCLENGTHOFNEEDMONTH38TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 38 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR38TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR38TBOX NEQ form.HCPCLENGTHOFNEEDYEAR38TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 38 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE39TBOX") AND getQuote.HCPCCODE39TBOX NEQ form.HCPCCODE39TBOX>
			<cfset note = note & "HCPC CODE 39 changed from <strong>[</strong>#getQuote.HCPCCODE39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS39TBOX") AND getQuote.HCPCDIAGNOSIS39TBOX NEQ form.HCPCDIAGNOSIS39TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 39 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX39TBOX") AND getQuote.HCPCDX39TBOX NEQ form.HCPCDX39TBOX>
			<cfset note = note & "HCPC DX 39 changed from <strong>[</strong>#getQuote.HCPCDX39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT39TBOX") AND getQuote.HCPCPRODUCT39TBOX NEQ form.HCPCPRODUCT39TBOX>
			<cfset note = note & "HCPC PRODUCT 39 changed from <strong>[</strong>#getQuote.HCPCPRODUCT39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY39TBOX") AND getQuote.HCPCQTY39TBOX NEQ form.HCPCQTY39TBOX>
			<cfset note = note & "HCPC QUANTITY 39 changed from <strong>[</strong>#getQuote.HCPCQTY39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST39TBOX") AND getQuote.HCPCCOST39TBOX NEQ form.HCPCCOST39TBOX>
			<cfset note = note & "HCPC COST 39 changed from <strong>[</strong>#getQuote.HCPCCOST39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH39TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH39TBOX NEQ form.HCPCLENGTHOFNEEDMONTH39TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 39 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR39TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR39TBOX NEQ form.HCPCLENGTHOFNEEDYEAR39TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 39 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE40TBOX") AND getQuote.HCPCCODE40TBOX NEQ form.HCPCCODE40TBOX>
			<cfset note = note & "HCPC CODE 40 changed from <strong>[</strong>#getQuote.HCPCCODE40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS40TBOX") AND getQuote.HCPCDIAGNOSIS40TBOX NEQ form.HCPCDIAGNOSIS40TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 40 changed from <strong>[</strong>#getQuote.HCPCDIAGNOSIS40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX40TBOX") AND getQuote.HCPCDX40TBOX NEQ form.HCPCDX40TBOX>
			<cfset note = note & "HCPC DX 40 changed from <strong>[</strong>#getQuote.HCPCDX40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT40TBOX") AND getQuote.HCPCPRODUCT40TBOX NEQ form.HCPCPRODUCT40TBOX>
			<cfset note = note & "HCPC PRODUCT 40 changed from <strong>[</strong>#getQuote.HCPCPRODUCT40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY40TBOX") AND getQuote.HCPCQTY40TBOX NEQ form.HCPCQTY40TBOX>
			<cfset note = note & "HCPC QUANTITY 40 changed from <strong>[</strong>#getQuote.HCPCQTY40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST40TBOX") AND getQuote.HCPCCOST40TBOX NEQ form.HCPCCOST40TBOX>
			<cfset note = note & "HCPC COST 40 changed from <strong>[</strong>#getQuote.HCPCCOST40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH40TBOX") AND getQuote.HCPCLENGTHOFNEEDMONTH40TBOX NEQ form.HCPCLENGTHOFNEEDMONTH40TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 40 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDMONTH40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR40TBOX") AND getQuote.HCPCLENGTHOFNEEDYEAR40TBOX NEQ form.HCPCLENGTHOFNEEDYEAR40TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 40 changed from <strong>[</strong>#getQuote.HCPCLENGTHOFNEEDYEAR40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR40TBOX#<strong>]</strong><br>">
		</cfif>


		<!-------------------------------------------------------------------------------------->
		<!--- Add the new Note.                                                              --->
		<!-------------------------------------------------------------------------------------->
			<cfif note NEQ "<font color=FF0000>SYSTEM INPUT NOTE: QUOTE CHANGED</font><br>">

				<cfset request.quoteNote = CreateObject("component","com.common.Note")>

				<cfset quoteNoteID = request.quoteNote.getNoteID(clientid: trim(session.ClientID), objectID: 9, instanceID: trim(form.quoteID))>

				<!-------------------------------------------------------------------------------------->
				<!--- If at this point the noteID is not available it means that the instance does   --->
				<!--- not have a note attached to it. Go ahead and create the note for this          --->
				<!--- object instance.                                                               --->
				<!-------------------------------------------------------------------------------------->
				<cfif NOT IsNumeric(quoteNoteID) AND IsNumeric(quoteID)>
					<cfset quoteNoteID = request.quoteNote.addNote(clientID: trim(session.clientID), objectID: 9, instanceID: trim(quoteID))>
				</cfif>

				<cfset request.quoteNote.addNoteEntry(clientID: trim(session.clientID), NoteID: quoteNoteID, noteEntry: '#trim(note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>

			</cfif>



		<!-------------------------------------------------------------------------------------->
		<!--- UPDATE the record.                                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfsavecontent variable="sqlStatement">
			<cfoutput>
				UPDATE quote
				SET
					dateModified = now()
					<cfif IsDefined("form.callerFNameTBox")>,callerFNameTBox = <cfif form.callerFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerFNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.callerMInitialTBox")>,callerMInitialTBox = <cfif form.callerMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerMInitialTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.callerLNameTBox")>,callerLNameTBox = <cfif form.callerLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerLNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.patientFNameTBox")>,patientFNameTBox = <cfif form.patientFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientFNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.patientMInitialTBox")>,patientMInitialTBox = <cfif form.patientMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientMInitialTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.patientLNameTBox")>,patientLNameTBox = <cfif form.patientLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientLNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactFNameTBox")>,alternateContactFNameTBox = <cfif form.alternateContactFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactFNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactMInitialTBox")>,alternateContactMInitialTBox = <cfif form.alternateContactMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactMInitialTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactLNameTBox")>,alternateContactLNameTBox = <cfif form.alternateContactLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactLNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.orderingPhysicianFNameTBox")>,orderingPhysicianFNameTBox = <cfif form.orderingPhysicianFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianFNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.orderingPhysicianMInitialTBox")>,orderingPhysicianMInitialTBox = <cfif form.orderingPhysicianMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianMInitialTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.orderingPhysicianLNameTBox")>,orderingPhysicianLNameTBox = <cfif form.orderingPhysicianLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianLNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ALTERNATECONTACTRELATIONSHIPTBOX")>,ALTERNATECONTACTRELATIONSHIPTBOX = <cfif form.ALTERNATECONTACTRELATIONSHIPTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ALTERNATECONTACTRELATIONSHIPTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.BEDNUMBERTBOX")>,BEDNUMBERTBOX = <cfif form.BEDNUMBERTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.BEDNUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CALLERNAMETBOX")>,CALLERNAMETBOX = <cfif form.CALLERNAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CALLERNAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_3A_CBOX_PATIENTSEXFEMALE")>,OPTION_3A_CBOX_PATIENTSEXFEMALE = <cfif form.OPTION_3A_CBOX_PATIENTSEXFEMALE NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3A_CBOX_PATIENTSEXFEMALE))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_3A_CBOX_PATIENTSEXMALE")>,OPTION_3A_CBOX_PATIENTSEXMALE = <cfif form.OPTION_3A_CBOX_PATIENTSEXMALE NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3A_CBOX_PATIENTSEXMALE))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTADDRESSTBOX")>,PATIENTADDRESSTBOX = <cfif form.PATIENTADDRESSTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTADDRESSTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTCITYTBOX")>,PATIENTCITYTBOX = <cfif form.PATIENTCITYTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTCITYTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTDOBDD")>,PATIENTDOBDD = <cfif form.PATIENTDOBDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTDOBDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTDOBMM")>,PATIENTDOBMM = <cfif form.PATIENTDOBMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTDOBMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTDOBYY")>,PATIENTDOBYY = <cfif form.PATIENTDOBYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTDOBYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTHEIGHTINCHES")>,PATIENTHEIGHTINCHES = <cfif form.PATIENTHEIGHTINCHES NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTHEIGHTINCHES))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTSSNTBOX")>,PATIENTSSNTBOX = <cfif form.PATIENTSSNTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTSSNTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTSTATETBOX")>,PATIENTSTATETBOX = <cfif form.PATIENTSTATETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTSTATETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTWEIGHTTBOX")>,PATIENTWEIGHTTBOX = <cfif form.PATIENTWEIGHTTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTWEIGHTTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTZIPTBOX")>,PATIENTZIPTBOX = <cfif form.PATIENTZIPTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PATIENTZIPTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PRIMARYINSURANCENAMETBOX")>,PRIMARYINSURANCENAMETBOX = <cfif form.PRIMARYINSURANCENAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PRIMARYINSURANCENAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PRIMARYPOLICYNUMBERTBOX")>,PRIMARYPOLICYNUMBERTBOX = <cfif form.PRIMARYPOLICYNUMBERTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PRIMARYPOLICYNUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ROOMNUMBERTBOX")>,ROOMNUMBERTBOX = <cfif form.ROOMNUMBERTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ROOMNUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.SECONDARYINSURANCENAMETBOX")>,SECONDARYINSURANCENAMETBOX = <cfif form.SECONDARYINSURANCENAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.SECONDARYINSURANCENAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.SECONDARYPOLICYNUMBERTBOX")>,SECONDARYPOLICYNUMBERTBOX = <cfif form.SECONDARYPOLICYNUMBERTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.SECONDARYPOLICYNUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactWorkPhoneTBox")>,alternateContactWorkPhoneTBox = <cfif form.alternateContactWorkPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.alternateContactWorkPhoneTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ALTERNATECONTACTPHONETBOX")>,ALTERNATECONTACTPHONETBOX = <cfif form.ALTERNATECONTACTPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.ALTERNATECONTACTPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CALLERPHONETBOX")>,CALLERPHONETBOX = <cfif form.CALLERPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.CALLERPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANPHONETBOX")>,ORDERINGPHYSICIANPHONETBOX = <cfif form.ORDERINGPHYSICIANPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.ORDERINGPHYSICIANPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PATIENTPHONETBOX")>,PATIENTPHONETBOX = <cfif form.PATIENTPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.PATIENTPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					WHERE quoteID = #trim(form.quoteID)#
			</cfoutput>
		</cfsavecontent>

		<cfquery name="updateQuote" dataSource="#request.datasource#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
		
		
		
		<cfsavecontent variable="sqlStatementHCPC">
			<cfoutput>
				UPDATE quotehcpc
				SET
					dateModified = now()
					<cfif IsDefined("form.HCPCCODE1TBOX")>,HCPCCODE1TBOX = <cfif form.HCPCCODE1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST1TBOX")>,HCPCCOST1TBOX = <cfif form.HCPCCOST1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS1TBOX")>,HCPCDIAGNOSIS1TBOX = <cfif form.HCPCDIAGNOSIS1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX1TBOX")>,HCPCDX1TBOX = <cfif form.HCPCDX1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT1TBOX")>,HCPCPRODUCT1TBOX = <cfif form.HCPCPRODUCT1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY1TBOX")>,HCPCQTY1TBOX = <cfif form.HCPCQTY1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE2TBOX")>,HCPCCODE2TBOX = <cfif form.HCPCCODE2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST2TBOX")>,HCPCCOST2TBOX = <cfif form.HCPCCOST2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS2TBOX")>,HCPCDIAGNOSIS2TBOX = <cfif form.HCPCDIAGNOSIS2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX2TBOX")>,HCPCDX2TBOX = <cfif form.HCPCDX2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT2TBOX")>,HCPCPRODUCT2TBOX = <cfif form.HCPCPRODUCT2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY2TBOX")>,HCPCQTY2TBOX = <cfif form.HCPCQTY2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE3TBOX")>,HCPCCODE3TBOX = <cfif form.HCPCCODE3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST3TBOX")>,HCPCCOST3TBOX = <cfif form.HCPCCOST3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS3TBOX")>,HCPCDIAGNOSIS3TBOX = <cfif form.HCPCDIAGNOSIS3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX3TBOX")>,HCPCDX3TBOX = <cfif form.HCPCDX3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT3TBOX")>,HCPCPRODUCT3TBOX = <cfif form.HCPCPRODUCT3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY3TBOX")>,HCPCQTY3TBOX = <cfif form.HCPCQTY3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE4TBOX")>,HCPCCODE4TBOX = <cfif form.HCPCCODE4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST4TBOX")>,HCPCCOST4TBOX = <cfif form.HCPCCOST4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS4TBOX")>,HCPCDIAGNOSIS4TBOX = <cfif form.HCPCDIAGNOSIS4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX4TBOX")>,HCPCDX4TBOX = <cfif form.HCPCDX4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT4TBOX")>,HCPCPRODUCT4TBOX = <cfif form.HCPCPRODUCT4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY4TBOX")>,HCPCQTY4TBOX = <cfif form.HCPCQTY4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE5TBOX")>,HCPCCODE5TBOX = <cfif form.HCPCCODE5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST5TBOX")>,HCPCCOST5TBOX = <cfif form.HCPCCOST5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS5TBOX")>,HCPCDIAGNOSIS5TBOX = <cfif form.HCPCDIAGNOSIS5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX5TBOX")>,HCPCDX5TBOX = <cfif form.HCPCDX5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT5TBOX")>,HCPCPRODUCT5TBOX = <cfif form.HCPCPRODUCT5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY5TBOX")>,HCPCQTY5TBOX = <cfif form.HCPCQTY5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE6TBOX")>,HCPCCODE6TBOX = <cfif form.HCPCCODE6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST6TBOX")>,HCPCCOST6TBOX = <cfif form.HCPCCOST6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS6TBOX")>,HCPCDIAGNOSIS6TBOX = <cfif form.HCPCDIAGNOSIS6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX6TBOX")>,HCPCDX6TBOX = <cfif form.HCPCDX6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT6TBOX")>,HCPCPRODUCT6TBOX = <cfif form.HCPCPRODUCT6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY6TBOX")>,HCPCQTY6TBOX = <cfif form.HCPCQTY6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE7TBOX")>,HCPCCODE7TBOX = <cfif form.HCPCCODE7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST7TBOX")>,HCPCCOST7TBOX = <cfif form.HCPCCOST7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS7TBOX")>,HCPCDIAGNOSIS7TBOX = <cfif form.HCPCDIAGNOSIS7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX7TBOX")>,HCPCDX7TBOX = <cfif form.HCPCDX7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT7TBOX")>,HCPCPRODUCT7TBOX = <cfif form.HCPCPRODUCT7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY7TBOX")>,HCPCQTY7TBOX = <cfif form.HCPCQTY7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE8TBOX")>,HCPCCODE8TBOX = <cfif form.HCPCCODE8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST8TBOX")>,HCPCCOST8TBOX = <cfif form.HCPCCOST8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS8TBOX")>,HCPCDIAGNOSIS8TBOX = <cfif form.HCPCDIAGNOSIS8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX8TBOX")>,HCPCDX8TBOX = <cfif form.HCPCDX8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT8TBOX")>,HCPCPRODUCT8TBOX = <cfif form.HCPCPRODUCT8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY8TBOX")>,HCPCQTY8TBOX = <cfif form.HCPCQTY8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE9TBOX")>,HCPCCODE9TBOX = <cfif form.HCPCCODE9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST9TBOX")>,HCPCCOST9TBOX = <cfif form.HCPCCOST9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS9TBOX")>,HCPCDIAGNOSIS9TBOX = <cfif form.HCPCDIAGNOSIS9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX9TBOX")>,HCPCDX9TBOX = <cfif form.HCPCDX9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT9TBOX")>,HCPCPRODUCT9TBOX = <cfif form.HCPCPRODUCT9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY9TBOX")>,HCPCQTY9TBOX = <cfif form.HCPCQTY9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE10TBOX")>,HCPCCODE10TBOX = <cfif form.HCPCCODE10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST10TBOX")>,HCPCCOST10TBOX = <cfif form.HCPCCOST10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS10TBOX")>,HCPCDIAGNOSIS10TBOX = <cfif form.HCPCDIAGNOSIS10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX10TBOX")>,HCPCDX10TBOX = <cfif form.HCPCDX10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT10TBOX")>,HCPCPRODUCT10TBOX = <cfif form.HCPCPRODUCT10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY10TBOX")>,HCPCQTY10TBOX = <cfif form.HCPCQTY10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE11TBOX")>,HCPCCODE11TBOX = <cfif form.HCPCCODE11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST11TBOX")>,HCPCCOST11TBOX = <cfif form.HCPCCOST11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS11TBOX")>,HCPCDIAGNOSIS11TBOX = <cfif form.HCPCDIAGNOSIS11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX11TBOX")>,HCPCDX11TBOX = <cfif form.HCPCDX11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT11TBOX")>,HCPCPRODUCT11TBOX = <cfif form.HCPCPRODUCT11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY11TBOX")>,HCPCQTY11TBOX = <cfif form.HCPCQTY11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE12TBOX")>,HCPCCODE12TBOX = <cfif form.HCPCCODE12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST12TBOX")>,HCPCCOST12TBOX = <cfif form.HCPCCOST12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS12TBOX")>,HCPCDIAGNOSIS12TBOX = <cfif form.HCPCDIAGNOSIS12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX12TBOX")>,HCPCDX12TBOX = <cfif form.HCPCDX12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT12TBOX")>,HCPCPRODUCT12TBOX = <cfif form.HCPCPRODUCT12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY12TBOX")>,HCPCQTY12TBOX = <cfif form.HCPCQTY12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE13TBOX")>,HCPCCODE13TBOX = <cfif form.HCPCCODE13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST13TBOX")>,HCPCCOST13TBOX = <cfif form.HCPCCOST13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS13TBOX")>,HCPCDIAGNOSIS13TBOX = <cfif form.HCPCDIAGNOSIS13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX13TBOX")>,HCPCDX13TBOX = <cfif form.HCPCDX13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT13TBOX")>,HCPCPRODUCT13TBOX = <cfif form.HCPCPRODUCT13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY13TBOX")>,HCPCQTY13TBOX = <cfif form.HCPCQTY13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE14TBOX")>,HCPCCODE14TBOX = <cfif form.HCPCCODE14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST14TBOX")>,HCPCCOST14TBOX = <cfif form.HCPCCOST14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS14TBOX")>,HCPCDIAGNOSIS14TBOX = <cfif form.HCPCDIAGNOSIS14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX14TBOX")>,HCPCDX14TBOX = <cfif form.HCPCDX14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT14TBOX")>,HCPCPRODUCT14TBOX = <cfif form.HCPCPRODUCT14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY14TBOX")>,HCPCQTY14TBOX = <cfif form.HCPCQTY14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE15TBOX")>,HCPCCODE15TBOX = <cfif form.HCPCCODE15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST15TBOX")>,HCPCCOST15TBOX = <cfif form.HCPCCOST15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS15TBOX")>,HCPCDIAGNOSIS15TBOX = <cfif form.HCPCDIAGNOSIS15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX15TBOX")>,HCPCDX15TBOX = <cfif form.HCPCDX15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT15TBOX")>,HCPCPRODUCT15TBOX = <cfif form.HCPCPRODUCT15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY15TBOX")>,HCPCQTY15TBOX = <cfif form.HCPCQTY15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE16TBOX")>,HCPCCODE16TBOX = <cfif form.HCPCCODE16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST16TBOX")>,HCPCCOST16TBOX = <cfif form.HCPCCOST16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS16TBOX")>,HCPCDIAGNOSIS16TBOX = <cfif form.HCPCDIAGNOSIS16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX16TBOX")>,HCPCDX16TBOX = <cfif form.HCPCDX16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT16TBOX")>,HCPCPRODUCT16TBOX = <cfif form.HCPCPRODUCT16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY16TBOX")>,HCPCQTY16TBOX = <cfif form.HCPCQTY16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE17TBOX")>,HCPCCODE17TBOX = <cfif form.HCPCCODE17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST17TBOX")>,HCPCCOST17TBOX = <cfif form.HCPCCOST17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS17TBOX")>,HCPCDIAGNOSIS17TBOX = <cfif form.HCPCDIAGNOSIS17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX17TBOX")>,HCPCDX17TBOX = <cfif form.HCPCDX17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT17TBOX")>,HCPCPRODUCT17TBOX = <cfif form.HCPCPRODUCT17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY17TBOX")>,HCPCQTY17TBOX = <cfif form.HCPCQTY17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE18TBOX")>,HCPCCODE18TBOX = <cfif form.HCPCCODE18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST18TBOX")>,HCPCCOST18TBOX = <cfif form.HCPCCOST18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS18TBOX")>,HCPCDIAGNOSIS18TBOX = <cfif form.HCPCDIAGNOSIS18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX18TBOX")>,HCPCDX18TBOX = <cfif form.HCPCDX18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT18TBOX")>,HCPCPRODUCT18TBOX = <cfif form.HCPCPRODUCT18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY18TBOX")>,HCPCQTY18TBOX = <cfif form.HCPCQTY18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE19TBOX")>,HCPCCODE19TBOX = <cfif form.HCPCCODE19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST19TBOX")>,HCPCCOST19TBOX = <cfif form.HCPCCOST19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS19TBOX")>,HCPCDIAGNOSIS19TBOX = <cfif form.HCPCDIAGNOSIS19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX19TBOX")>,HCPCDX19TBOX = <cfif form.HCPCDX19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT19TBOX")>,HCPCPRODUCT19TBOX = <cfif form.HCPCPRODUCT19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY19TBOX")>,HCPCQTY19TBOX = <cfif form.HCPCQTY19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE20TBOX")>,HCPCCODE20TBOX = <cfif form.HCPCCODE20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST20TBOX")>,HCPCCOST20TBOX = <cfif form.HCPCCOST20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS20TBOX")>,HCPCDIAGNOSIS20TBOX = <cfif form.HCPCDIAGNOSIS20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX20TBOX")>,HCPCDX20TBOX = <cfif form.HCPCDX20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT20TBOX")>,HCPCPRODUCT20TBOX = <cfif form.HCPCPRODUCT20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY20TBOX")>,HCPCQTY20TBOX = <cfif form.HCPCQTY20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE21TBOX")>,HCPCCODE21TBOX = <cfif form.HCPCCODE21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST21TBOX")>,HCPCCOST21TBOX = <cfif form.HCPCCOST21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS21TBOX")>,HCPCDIAGNOSIS21TBOX = <cfif form.HCPCDIAGNOSIS21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX21TBOX")>,HCPCDX21TBOX = <cfif form.HCPCDX21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT21TBOX")>,HCPCPRODUCT21TBOX = <cfif form.HCPCPRODUCT21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY21TBOX")>,HCPCQTY21TBOX = <cfif form.HCPCQTY21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE22TBOX")>,HCPCCODE22TBOX = <cfif form.HCPCCODE22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST22TBOX")>,HCPCCOST22TBOX = <cfif form.HCPCCOST22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS22TBOX")>,HCPCDIAGNOSIS22TBOX = <cfif form.HCPCDIAGNOSIS22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX22TBOX")>,HCPCDX22TBOX = <cfif form.HCPCDX22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT22TBOX")>,HCPCPRODUCT22TBOX = <cfif form.HCPCPRODUCT22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY22TBOX")>,HCPCQTY22TBOX = <cfif form.HCPCQTY22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE23TBOX")>,HCPCCODE23TBOX = <cfif form.HCPCCODE23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST23TBOX")>,HCPCCOST23TBOX = <cfif form.HCPCCOST23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS23TBOX")>,HCPCDIAGNOSIS23TBOX = <cfif form.HCPCDIAGNOSIS23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX23TBOX")>,HCPCDX23TBOX = <cfif form.HCPCDX23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT23TBOX")>,HCPCPRODUCT23TBOX = <cfif form.HCPCPRODUCT23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY23TBOX")>,HCPCQTY23TBOX = <cfif form.HCPCQTY23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE24TBOX")>,HCPCCODE24TBOX = <cfif form.HCPCCODE24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST24TBOX")>,HCPCCOST24TBOX = <cfif form.HCPCCOST24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS24TBOX")>,HCPCDIAGNOSIS24TBOX = <cfif form.HCPCDIAGNOSIS24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX24TBOX")>,HCPCDX24TBOX = <cfif form.HCPCDX24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT24TBOX")>,HCPCPRODUCT24TBOX = <cfif form.HCPCPRODUCT24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY24TBOX")>,HCPCQTY24TBOX = <cfif form.HCPCQTY24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE25TBOX")>,HCPCCODE25TBOX = <cfif form.HCPCCODE25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST25TBOX")>,HCPCCOST25TBOX = <cfif form.HCPCCOST25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS25TBOX")>,HCPCDIAGNOSIS25TBOX = <cfif form.HCPCDIAGNOSIS25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX25TBOX")>,HCPCDX25TBOX = <cfif form.HCPCDX25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT25TBOX")>,HCPCPRODUCT25TBOX = <cfif form.HCPCPRODUCT25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY25TBOX")>,HCPCQTY25TBOX = <cfif form.HCPCQTY25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE26TBOX")>,HCPCCODE26TBOX = <cfif form.HCPCCODE26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST26TBOX")>,HCPCCOST26TBOX = <cfif form.HCPCCOST26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS26TBOX")>,HCPCDIAGNOSIS26TBOX = <cfif form.HCPCDIAGNOSIS26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX26TBOX")>,HCPCDX26TBOX = <cfif form.HCPCDX26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT26TBOX")>,HCPCPRODUCT26TBOX = <cfif form.HCPCPRODUCT26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY26TBOX")>,HCPCQTY26TBOX = <cfif form.HCPCQTY26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE27TBOX")>,HCPCCODE27TBOX = <cfif form.HCPCCODE27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST27TBOX")>,HCPCCOST27TBOX = <cfif form.HCPCCOST27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS27TBOX")>,HCPCDIAGNOSIS27TBOX = <cfif form.HCPCDIAGNOSIS27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX27TBOX")>,HCPCDX27TBOX = <cfif form.HCPCDX27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT27TBOX")>,HCPCPRODUCT27TBOX = <cfif form.HCPCPRODUCT27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY27TBOX")>,HCPCQTY27TBOX = <cfif form.HCPCQTY27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE28TBOX")>,HCPCCODE28TBOX = <cfif form.HCPCCODE28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST28TBOX")>,HCPCCOST28TBOX = <cfif form.HCPCCOST28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS28TBOX")>,HCPCDIAGNOSIS28TBOX = <cfif form.HCPCDIAGNOSIS28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX28TBOX")>,HCPCDX28TBOX = <cfif form.HCPCDX28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT28TBOX")>,HCPCPRODUCT28TBOX = <cfif form.HCPCPRODUCT28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY28TBOX")>,HCPCQTY28TBOX = <cfif form.HCPCQTY28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE29TBOX")>,HCPCCODE29TBOX = <cfif form.HCPCCODE29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST29TBOX")>,HCPCCOST29TBOX = <cfif form.HCPCCOST29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS29TBOX")>,HCPCDIAGNOSIS29TBOX = <cfif form.HCPCDIAGNOSIS29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX29TBOX")>,HCPCDX29TBOX = <cfif form.HCPCDX29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT29TBOX")>,HCPCPRODUCT29TBOX = <cfif form.HCPCPRODUCT29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY29TBOX")>,HCPCQTY29TBOX = <cfif form.HCPCQTY29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE30TBOX")>,HCPCCODE30TBOX = <cfif form.HCPCCODE30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST30TBOX")>,HCPCCOST30TBOX = <cfif form.HCPCCOST30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS30TBOX")>,HCPCDIAGNOSIS30TBOX = <cfif form.HCPCDIAGNOSIS30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX30TBOX")>,HCPCDX30TBOX = <cfif form.HCPCDX30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT30TBOX")>,HCPCPRODUCT30TBOX = <cfif form.HCPCPRODUCT30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY30TBOX")>,HCPCQTY30TBOX = <cfif form.HCPCQTY30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE31TBOX")>,HCPCCODE31TBOX = <cfif form.HCPCCODE31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST31TBOX")>,HCPCCOST31TBOX = <cfif form.HCPCCOST31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS31TBOX")>,HCPCDIAGNOSIS31TBOX = <cfif form.HCPCDIAGNOSIS31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX31TBOX")>,HCPCDX31TBOX = <cfif form.HCPCDX31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT31TBOX")>,HCPCPRODUCT31TBOX = <cfif form.HCPCPRODUCT31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY31TBOX")>,HCPCQTY31TBOX = <cfif form.HCPCQTY31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE32TBOX")>,HCPCCODE32TBOX = <cfif form.HCPCCODE32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST32TBOX")>,HCPCCOST32TBOX = <cfif form.HCPCCOST32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS32TBOX")>,HCPCDIAGNOSIS32TBOX = <cfif form.HCPCDIAGNOSIS32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX32TBOX")>,HCPCDX32TBOX = <cfif form.HCPCDX32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT32TBOX")>,HCPCPRODUCT32TBOX = <cfif form.HCPCPRODUCT32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY32TBOX")>,HCPCQTY32TBOX = <cfif form.HCPCQTY32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE33TBOX")>,HCPCCODE33TBOX = <cfif form.HCPCCODE33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST33TBOX")>,HCPCCOST33TBOX = <cfif form.HCPCCOST33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS33TBOX")>,HCPCDIAGNOSIS33TBOX = <cfif form.HCPCDIAGNOSIS33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX33TBOX")>,HCPCDX33TBOX = <cfif form.HCPCDX33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT33TBOX")>,HCPCPRODUCT33TBOX = <cfif form.HCPCPRODUCT33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY33TBOX")>,HCPCQTY33TBOX = <cfif form.HCPCQTY33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE34TBOX")>,HCPCCODE34TBOX = <cfif form.HCPCCODE34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST34TBOX")>,HCPCCOST34TBOX = <cfif form.HCPCCOST34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS34TBOX")>,HCPCDIAGNOSIS34TBOX = <cfif form.HCPCDIAGNOSIS34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX34TBOX")>,HCPCDX34TBOX = <cfif form.HCPCDX34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT34TBOX")>,HCPCPRODUCT34TBOX = <cfif form.HCPCPRODUCT34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY34TBOX")>,HCPCQTY34TBOX = <cfif form.HCPCQTY34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE35TBOX")>,HCPCCODE35TBOX = <cfif form.HCPCCODE35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST35TBOX")>,HCPCCOST35TBOX = <cfif form.HCPCCOST35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS35TBOX")>,HCPCDIAGNOSIS35TBOX = <cfif form.HCPCDIAGNOSIS35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX35TBOX")>,HCPCDX35TBOX = <cfif form.HCPCDX35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT35TBOX")>,HCPCPRODUCT35TBOX = <cfif form.HCPCPRODUCT35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY35TBOX")>,HCPCQTY35TBOX = <cfif form.HCPCQTY35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE36TBOX")>,HCPCCODE36TBOX = <cfif form.HCPCCODE36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST36TBOX")>,HCPCCOST36TBOX = <cfif form.HCPCCOST36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS36TBOX")>,HCPCDIAGNOSIS36TBOX = <cfif form.HCPCDIAGNOSIS36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX36TBOX")>,HCPCDX36TBOX = <cfif form.HCPCDX36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT36TBOX")>,HCPCPRODUCT36TBOX = <cfif form.HCPCPRODUCT36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY36TBOX")>,HCPCQTY36TBOX = <cfif form.HCPCQTY36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE37TBOX")>,HCPCCODE37TBOX = <cfif form.HCPCCODE37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST37TBOX")>,HCPCCOST37TBOX = <cfif form.HCPCCOST37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS37TBOX")>,HCPCDIAGNOSIS37TBOX = <cfif form.HCPCDIAGNOSIS37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX37TBOX")>,HCPCDX37TBOX = <cfif form.HCPCDX37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT37TBOX")>,HCPCPRODUCT37TBOX = <cfif form.HCPCPRODUCT37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY37TBOX")>,HCPCQTY37TBOX = <cfif form.HCPCQTY37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE38TBOX")>,HCPCCODE38TBOX = <cfif form.HCPCCODE38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST38TBOX")>,HCPCCOST38TBOX = <cfif form.HCPCCOST38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS38TBOX")>,HCPCDIAGNOSIS38TBOX = <cfif form.HCPCDIAGNOSIS38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX38TBOX")>,HCPCDX38TBOX = <cfif form.HCPCDX38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT38TBOX")>,HCPCPRODUCT38TBOX = <cfif form.HCPCPRODUCT38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY38TBOX")>,HCPCQTY38TBOX = <cfif form.HCPCQTY38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE39TBOX")>,HCPCCODE39TBOX = <cfif form.HCPCCODE39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST39TBOX")>,HCPCCOST39TBOX = <cfif form.HCPCCOST39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS39TBOX")>,HCPCDIAGNOSIS39TBOX = <cfif form.HCPCDIAGNOSIS39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX39TBOX")>,HCPCDX39TBOX = <cfif form.HCPCDX39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT39TBOX")>,HCPCPRODUCT39TBOX = <cfif form.HCPCPRODUCT39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY39TBOX")>,HCPCQTY39TBOX = <cfif form.HCPCQTY39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE40TBOX")>,HCPCCODE40TBOX = <cfif form.HCPCCODE40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST40TBOX")>,HCPCCOST40TBOX = <cfif form.HCPCCOST40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS40TBOX")>,HCPCDIAGNOSIS40TBOX = <cfif form.HCPCDIAGNOSIS40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX40TBOX")>,HCPCDX40TBOX = <cfif form.HCPCDX40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT40TBOX")>,HCPCPRODUCT40TBOX = <cfif form.HCPCPRODUCT40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY40TBOX")>,HCPCQTY40TBOX = <cfif form.HCPCQTY40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY40TBOX))#'<cfelse>NULL</cfif></cfif>
					WHERE quoteID = #trim(form.quoteID)#
			</cfoutput>
		</cfsavecontent>

		<cfquery name="updateQuoteHCPC" dataSource="#request.datasource#">
			#PreserveSingleQuotes(sqlStatementHCPC)#
		</cfquery>	
		

	 	<cfset msg = "Quote has been Updated.">

		<cflocation addtoken="No" url="appQuoteEdit.cfm?quoteID=#trim(form.quoteID)#&msg=#URLEncodedFormat(trim(msg))#">
		



	<!-------------------------------------------------------------------------------------->
	<!--- Insert the quote                                                              --->
	<!-------------------------------------------------------------------------------------->
	<cfelse>


		<cfsavecontent variable="sqlStatement">
			<cfoutput>
			INSERT INTO Quote(
		 		ClientID,
				hidden_UsersID,
				AssignedToUserID,
				<cfif IsDefined("form.callerFNameTBox") AND form.callerFNameTBox NEQ "">callerFNameTBox,</cfif>
				<cfif IsDefined("form.callerMInitialTBox") AND form.callerMInitialTBox NEQ "">callerMInitialTBox,</cfif>
				<cfif IsDefined("form.callerLNameTBox") AND form.callerLNameTBox NEQ "">callerLNameTBox,</cfif>
				<cfif IsDefined("form.patientFNameTBox") AND form.patientFNameTBox NEQ "">patientFNameTBox,</cfif>
				<cfif IsDefined("form.patientMInitialTBox") AND form.patientMInitialTBox NEQ "">patientMInitialTBox,</cfif>
				<cfif IsDefined("form.patientLNameTBox") AND form.patientLNameTBox NEQ "">patientLNameTBox,</cfif>
				<cfif IsDefined("form.alternateContactFNameTBox") AND form.alternateContactFNameTBox NEQ "">alternateContactFNameTBox,</cfif>
				<cfif IsDefined("form.alternateContactMInitialTBox") AND form.alternateContactMInitialTBox NEQ "">alternateContactMInitialTBox,</cfif>
				<cfif IsDefined("form.alternateContactLNameTBox") AND form.alternateContactLNameTBox NEQ "">alternateContactLNameTBox,</cfif>
				<cfif IsDefined("form.alternateContactWorkPhoneTBox") AND form.alternateContactWorkPhoneTBox NEQ "">alternateContactWorkPhoneTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianFNameTBox") AND form.orderingPhysicianFNameTBox NEQ "">orderingPhysicianFNameTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianMInitialTBox") AND form.orderingPhysicianMInitialTBox NEQ "">orderingPhysicianMInitialTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianLNameTBox") AND form.orderingPhysicianLNameTBox NEQ "">orderingPhysicianLNameTBox,</cfif>
				<cfif IsDefined("form.callerNameTBox") AND form.callerNameTBox NEQ "">callerNameTBox,</cfif>
				<cfif IsDefined("form.callerPhoneTBox") AND form.callerPhoneTBox NEQ "">callerPhoneTBox,</cfif>
				<cfif IsDefined("form.roomNumberTBox") AND form.roomNumberTBox NEQ "">roomNumberTBox,</cfif>
				<cfif IsDefined("form.bedNumberTBox") AND form.bedNumberTBox NEQ "">bedNumberTBox,</cfif>
				<cfif IsDefined("form.patientAddressTBox") AND form.patientAddressTBox NEQ "">patientAddressTBox,</cfif>
				<cfif IsDefined("form.patientCityTBox") AND form.patientCityTBox NEQ "">patientCityTBox,</cfif>
				<cfif IsDefined("form.patientStateTBox") AND form.patientStateTBox NEQ "">patientStateTBox,</cfif>
				<cfif IsDefined("form.patientZipTBox") AND form.patientZipTBox NEQ "">patientZipTBox,</cfif>
				<cfif IsDefined("form.patientPhoneTBox") AND form.patientPhoneTBox NEQ "">patientPhoneTBox,</cfif>
				<cfif IsDefined("form.patientDOBMM") AND form.patientDOBMM NEQ "">patientDOBMM,</cfif>
				<cfif IsDefined("form.patientDOBDD") AND form.patientDOBDD NEQ "">patientDOBDD,</cfif>
				<cfif IsDefined("form.OPTION_3a_CBox_PatientSexMale") AND form.OPTION_3a_CBox_PatientSexMale NEQ "">OPTION_3a_CBox_PatientSexMale,</cfif>
				<cfif IsDefined("form.OPTION_3a_CBox_PatientSexFemale") AND form.OPTION_3a_CBox_PatientSexFemale NEQ "">OPTION_3a_CBox_PatientSexFemale,</cfif>
				<cfif IsDefined("form.patientDOBYY") AND form.patientDOBYY NEQ "">patientDOBYY,</cfif>
				<cfif IsDefined("form.patientSSNTBox") AND form.patientSSNTBox NEQ "">patientSSNTBox,</cfif>
				<cfif IsDefined("form.patientHeightInches") AND form.patientHeightInches NEQ "">patientHeightInches,</cfif>
				<cfif IsDefined("form.patientWeightTBox") AND form.patientWeightTBox NEQ "">patientWeightTBox,</cfif>
				<cfif IsDefined("form.alternateContactRelationshipTBox") AND form.alternateContactRelationshipTBox NEQ "">alternateContactRelationshipTBox,</cfif>
				<cfif IsDefined("form.alternateContactPhoneTBox") AND form.alternateContactPhoneTBox NEQ "">alternateContactPhoneTBox,</cfif>
				<cfif IsDefined("form.primaryInsuranceNameTBox") AND form.primaryInsuranceNameTBox NEQ "">primaryInsuranceNameTBox,</cfif>
				<cfif IsDefined("form.secondaryInsuranceNameTBox") AND form.secondaryInsuranceNameTBox NEQ "">secondaryInsuranceNameTBox,</cfif>
				<cfif IsDefined("form.primaryPolicyNumberTBox") AND form.primaryPolicyNumberTBox NEQ "">primaryPolicyNumberTBox,</cfif>
				<cfif IsDefined("form.secondaryPolicyNumberTBox") AND form.secondaryPolicyNumberTBox NEQ "">secondaryPolicyNumberTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianPhoneTBox") AND form.orderingPhysicianPhoneTBox NEQ "">orderingPhysicianPhoneTBox,</cfif>
				hidden_TimeStart
		 	)
			VALUES(
				#trim(session.ClientID)#,
				'#trim(form.hidden_UsersID)#',
				'#trim(form.hidden_UsersID)#',
				<cfif IsDefined("form.callerFNameTBox") AND form.callerFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerFNameTBox))#',</cfif>
				<cfif IsDefined("form.callerMInitialTBox") AND form.callerMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerMInitialTBox))#',</cfif>
				<cfif IsDefined("form.callerLNameTBox") AND form.callerLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerLNameTBox))#',</cfif>
				<cfif IsDefined("form.patientFNameTBox") AND form.patientFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientFNameTBox))#',</cfif>
				<cfif IsDefined("form.patientMInitialTBox") AND form.patientMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientMInitialTBox))#',</cfif>
				<cfif IsDefined("form.patientLNameTBox") AND form.patientLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientLNameTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactFNameTBox") AND form.alternateContactFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactFNameTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactMInitialTBox") AND form.alternateContactMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactMInitialTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactLNameTBox") AND form.alternateContactLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactLNameTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactWorkPhoneTBox") AND form.alternateContactWorkPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.alternateContactWorkPhoneTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianFNameTBox") AND form.orderingPhysicianFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianFNameTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianMInitialTBox") AND form.orderingPhysicianMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianMInitialTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianLNameTBox") AND form.orderingPhysicianLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianLNameTBox))#',</cfif>
				<cfif IsDefined("form.callerNameTBox") AND form.callerNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerNameTBox))#',</cfif>
				<cfif IsDefined("form.callerPhoneTBox") AND form.callerPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.callerPhoneTBox))#',</cfif>
				<cfif IsDefined("form.roomNumberTBox") AND form.roomNumberTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.roomNumberTBox))#',</cfif>
				<cfif IsDefined("form.bedNumberTBox") AND form.bedNumberTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.bedNumberTBox))#',</cfif>
				<cfif IsDefined("form.patientAddressTBox") AND form.patientAddressTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientAddressTBox))#',</cfif>
				<cfif IsDefined("form.patientCityTBox") AND form.patientCityTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientCityTBox))#',</cfif>
				<cfif IsDefined("form.patientStateTBox") AND form.patientStateTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientStateTBox))#',</cfif>
				<cfif IsDefined("form.patientZipTBox") AND form.patientZipTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientZipTBox))#',</cfif>
				<cfif IsDefined("form.patientPhoneTBox") AND form.patientPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.patientPhoneTBox))#',</cfif>
				<cfif IsDefined("form.patientDOBMM") AND form.patientDOBMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientDOBMM))#',</cfif>
				<cfif IsDefined("form.patientDOBDD") AND form.patientDOBDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientDOBDD))#',</cfif>
				<cfif IsDefined("form.OPTION_3a_CBox_PatientSexMale") AND form.OPTION_3a_CBox_PatientSexMale NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(OPTION_3a_CBox_PatientSexMale))#',</cfif>
				<cfif IsDefined("form.OPTION_3a_CBox_PatientSexFemale") AND form.OPTION_3a_CBox_PatientSexFemale NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(OPTION_3a_CBox_PatientSexFemale))#',</cfif>
				<cfif IsDefined("form.patientDOBYY") AND form.patientDOBYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientDOBYY))#',</cfif>
				<cfif IsDefined("form.patientSSNTBox") AND form.patientSSNTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientSSNTBox))#',</cfif>
				<cfif IsDefined("form.patientHeightInches") AND form.patientHeightInches NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientHeightInches))#',</cfif>
				<cfif IsDefined("form.patientWeightTBox") AND form.patientWeightTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.patientWeightTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactRelationshipTBox") AND form.alternateContactRelationshipTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactRelationshipTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactPhoneTBox") AND form.alternateContactPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.alternateContactPhoneTBox))#',</cfif>
				<cfif IsDefined("form.primaryInsuranceNameTBox") AND form.primaryInsuranceNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.primaryInsuranceNameTBox))#',</cfif>
				<cfif IsDefined("form.secondaryInsuranceNameTBox") AND form.secondaryInsuranceNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.secondaryInsuranceNameTBox))#',</cfif>
				<cfif IsDefined("form.primaryPolicyNumberTBox") AND form.primaryPolicyNumberTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.primaryPolicyNumberTBox))#',</cfif>
				<cfif IsDefined("form.secondaryPolicyNumberTBox") AND form.secondaryPolicyNumberTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.secondaryPolicyNumberTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianPhoneTBox") AND form.orderingPhysicianPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.orderingPhysicianPhoneTBox))#',</cfif>
				'#trim(form.hidden_TimeStart)#'
			);
			SELECT LAST_INSERT_ID() AS quoteID 
			</cfoutput>
		</cfsavecontent>

		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="insertQuote" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
		
		
		
		
		<cfsavecontent variable="sqlStatementHCPC">
			<cfoutput>
				INSERT INTO QuoteHCPC(
			 		QuoteID					 
					<cfif IsDefined("form.hcpcCost1TBox") AND form.hcpcCost1TBox NEQ "">,hcpcCost1TBox</cfif>
					<cfif IsDefined("form.hcpcCode1TBox") AND form.hcpcCode1TBox NEQ "">,hcpcCode1TBox</cfif>
					<cfif IsDefined("form.hcpcQty1TBox") AND form.hcpcQty1TBox NEQ "">,hcpcQty1TBox</cfif>
					<cfif IsDefined("form.hcpcProduct1TBox") AND form.hcpcProduct1TBox NEQ "">,hcpcProduct1TBox</cfif>
					<cfif IsDefined("form.hcpcDX1TBox") AND form.hcpcDX1TBox NEQ "">,hcpcDX1TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis1TBox") AND form.hcpcDiagnosis1TBox NEQ "">,hcpcDiagnosis1TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear1TBox") AND form.hcpcLengthOfNeedYear1TBox NEQ "">,hcpcLengthOfNeedYear1TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth1TBox") AND form.hcpcLengthOfNeedMonth1TBox NEQ "">,hcpcLengthOfNeedMonth1TBox</cfif>
					<cfif IsDefined("form.hcpcCost2TBox") AND form.hcpcCost2TBox NEQ "">,hcpcCost2TBox</cfif>
					<cfif IsDefined("form.hcpcCode2TBox") AND form.hcpcCode2TBox NEQ "">,hcpcCode2TBox</cfif>
					<cfif IsDefined("form.hcpcQty2TBox") AND form.hcpcQty2TBox NEQ "">,hcpcQty2TBox</cfif>
					<cfif IsDefined("form.hcpcProduct2TBox") AND form.hcpcProduct2TBox NEQ "">,hcpcProduct2TBox</cfif>
					<cfif IsDefined("form.hcpcDX2TBox") AND form.hcpcDX2TBox NEQ "">,hcpcDX2TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis2TBox") AND form.hcpcDiagnosis2TBox NEQ "">,hcpcDiagnosis2TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear2TBox") AND form.hcpcLengthOfNeedYear2TBox NEQ "">,hcpcLengthOfNeedYear2TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth2TBox") AND form.hcpcLengthOfNeedMonth2TBox NEQ "">,hcpcLengthOfNeedMonth2TBox</cfif>
					<cfif IsDefined("form.hcpcCost3TBox") AND form.hcpcCost3TBox NEQ "">,hcpcCost3TBox</cfif>
					<cfif IsDefined("form.hcpcCode3TBox") AND form.hcpcCode3TBox NEQ "">,hcpcCode3TBox</cfif>
					<cfif IsDefined("form.hcpcQty3TBox") AND form.hcpcQty3TBox NEQ "">,hcpcQty3TBox</cfif>
					<cfif IsDefined("form.hcpcProduct3TBox") AND form.hcpcProduct3TBox NEQ "">,hcpcProduct3TBox</cfif>
					<cfif IsDefined("form.hcpcDX3TBox") AND form.hcpcDX3TBox NEQ "">,hcpcDX3TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis3TBox") AND form.hcpcDiagnosis3TBox NEQ "">,hcpcDiagnosis3TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear3TBox") AND form.hcpcLengthOfNeedYear3TBox NEQ "">,hcpcLengthOfNeedYear3TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth3TBox") AND form.hcpcLengthOfNeedMonth3TBox NEQ "">,hcpcLengthOfNeedMonth3TBox</cfif>
					<cfif IsDefined("form.hcpcCost4TBox") AND form.hcpcCost4TBox NEQ "">,hcpcCost4TBox</cfif>
					<cfif IsDefined("form.hcpcCode4TBox") AND form.hcpcCode4TBox NEQ "">,hcpcCode4TBox</cfif>
					<cfif IsDefined("form.hcpcQty4TBox") AND form.hcpcQty4TBox NEQ "">,hcpcQty4TBox</cfif>
					<cfif IsDefined("form.hcpcProduct4TBox") AND form.hcpcProduct4TBox NEQ "">,hcpcProduct4TBox</cfif>
					<cfif IsDefined("form.hcpcDX4TBox") AND form.hcpcDX4TBox NEQ "">,hcpcDX4TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis4TBox") AND form.hcpcDiagnosis4TBox NEQ "">,hcpcDiagnosis4TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear4TBox") AND form.hcpcLengthOfNeedYear4TBox NEQ "">,hcpcLengthOfNeedYear4TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth4TBox") AND form.hcpcLengthOfNeedMonth4TBox NEQ "">,hcpcLengthOfNeedMonth4TBox</cfif>
					<cfif IsDefined("form.hcpcCost5TBox") AND form.hcpcCost5TBox NEQ "">,hcpcCost5TBox</cfif>
					<cfif IsDefined("form.hcpcCode5TBox") AND form.hcpcCode5TBox NEQ "">,hcpcCode5TBox</cfif>
					<cfif IsDefined("form.hcpcQty5TBox") AND form.hcpcQty5TBox NEQ "">,hcpcQty5TBox</cfif>
					<cfif IsDefined("form.hcpcProduct5TBox") AND form.hcpcProduct5TBox NEQ "">,hcpcProduct5TBox</cfif>
					<cfif IsDefined("form.hcpcDX5TBox") AND form.hcpcDX5TBox NEQ "">,hcpcDX5TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis5TBox") AND form.hcpcDiagnosis5TBox NEQ "">,hcpcDiagnosis5TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear5TBox") AND form.hcpcLengthOfNeedYear5TBox NEQ "">,hcpcLengthOfNeedYear5TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth5TBox") AND form.hcpcLengthOfNeedMonth5TBox NEQ "">,hcpcLengthOfNeedMonth5TBox</cfif>
					<cfif IsDefined("form.hcpcCost6TBox") AND form.hcpcCost6TBox NEQ "">,hcpcCost6TBox</cfif>
					<cfif IsDefined("form.hcpcCode6TBox") AND form.hcpcCode6TBox NEQ "">,hcpcCode6TBox</cfif>
					<cfif IsDefined("form.hcpcQty6TBox") AND form.hcpcQty6TBox NEQ "">,hcpcQty6TBox</cfif>
					<cfif IsDefined("form.hcpcProduct6TBox") AND form.hcpcProduct6TBox NEQ "">,hcpcProduct6TBox</cfif>
					<cfif IsDefined("form.hcpcDX6TBox") AND form.hcpcDX6TBox NEQ "">,hcpcDX6TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis6TBox") AND form.hcpcDiagnosis6TBox NEQ "">,hcpcDiagnosis6TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear6TBox") AND form.hcpcLengthOfNeedYear6TBox NEQ "">,hcpcLengthOfNeedYear6TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth6TBox") AND form.hcpcLengthOfNeedMonth6TBox NEQ "">,hcpcLengthOfNeedMonth6TBox</cfif>
					<cfif IsDefined("form.hcpcCost7TBox") AND form.hcpcCost7TBox NEQ "">,hcpcCost7TBox</cfif>
					<cfif IsDefined("form.hcpcCode7TBox") AND form.hcpcCode7TBox NEQ "">,hcpcCode7TBox</cfif>
					<cfif IsDefined("form.hcpcQty7TBox") AND form.hcpcQty7TBox NEQ "">,hcpcQty7TBox</cfif>
					<cfif IsDefined("form.hcpcProduct7TBox") AND form.hcpcProduct7TBox NEQ "">,hcpcProduct7TBox</cfif>
					<cfif IsDefined("form.hcpcDX7TBox") AND form.hcpcDX7TBox NEQ "">,hcpcDX7TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis7TBox") AND form.hcpcDiagnosis7TBox NEQ "">,hcpcDiagnosis7TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear7TBox") AND form.hcpcLengthOfNeedYear7TBox NEQ "">,hcpcLengthOfNeedYear7TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth7TBox") AND form.hcpcLengthOfNeedMonth7TBox NEQ "">,hcpcLengthOfNeedMonth7TBox</cfif>
					<cfif IsDefined("form.hcpcCost8TBox") AND form.hcpcCost8TBox NEQ "">,hcpcCost8TBox</cfif>
					<cfif IsDefined("form.hcpcCode8TBox") AND form.hcpcCode8TBox NEQ "">,hcpcCode8TBox</cfif>
					<cfif IsDefined("form.hcpcQty8TBox") AND form.hcpcQty8TBox NEQ "">,hcpcQty8TBox</cfif>
					<cfif IsDefined("form.hcpcProduct8TBox") AND form.hcpcProduct8TBox NEQ "">,hcpcProduct8TBox</cfif>
					<cfif IsDefined("form.hcpcDX8TBox") AND form.hcpcDX8TBox NEQ "">,hcpcDX8TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis8TBox") AND form.hcpcDiagnosis8TBox NEQ "">,hcpcDiagnosis8TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear8TBox") AND form.hcpcLengthOfNeedYear8TBox NEQ "">,hcpcLengthOfNeedYear8TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth8TBox") AND form.hcpcLengthOfNeedMonth8TBox NEQ "">,hcpcLengthOfNeedMonth8TBox</cfif>
					<cfif IsDefined("form.hcpcCost9TBox") AND form.hcpcCost9TBox NEQ "">,hcpcCost9TBox</cfif>
					<cfif IsDefined("form.hcpcCode9TBox") AND form.hcpcCode9TBox NEQ "">,hcpcCode9TBox</cfif>
					<cfif IsDefined("form.hcpcQty9TBox") AND form.hcpcQty9TBox NEQ "">,hcpcQty9TBox</cfif>
					<cfif IsDefined("form.hcpcProduct9TBox") AND form.hcpcProduct9TBox NEQ "">,hcpcProduct9TBox</cfif>
					<cfif IsDefined("form.hcpcDX9TBox") AND form.hcpcDX9TBox NEQ "">,hcpcDX9TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis9TBox") AND form.hcpcDiagnosis9TBox NEQ "">,hcpcDiagnosis9TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear9TBox") AND form.hcpcLengthOfNeedYear9TBox NEQ "">,hcpcLengthOfNeedYear9TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth9TBox") AND form.hcpcLengthOfNeedMonth9TBox NEQ "">,hcpcLengthOfNeedMonth9TBox</cfif>
					<cfif IsDefined("form.hcpcCost10TBox") AND form.hcpcCost10TBox NEQ "">,hcpcCost10TBox</cfif>
					<cfif IsDefined("form.hcpcCode10TBox") AND form.hcpcCode10TBox NEQ "">,hcpcCode10TBox</cfif>
					<cfif IsDefined("form.hcpcQty10TBox") AND form.hcpcQty10TBox NEQ "">,hcpcQty10TBox</cfif>
					<cfif IsDefined("form.hcpcProduct10TBox") AND form.hcpcProduct10TBox NEQ "">,hcpcProduct10TBox</cfif>
					<cfif IsDefined("form.hcpcDX10TBox") AND form.hcpcDX10TBox NEQ "">,hcpcDX10TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis10TBox") AND form.hcpcDiagnosis10TBox NEQ "">,hcpcDiagnosis10TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear10TBox") AND form.hcpcLengthOfNeedYear10TBox NEQ "">,hcpcLengthOfNeedYear10TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth10TBox") AND form.hcpcLengthOfNeedMonth10TBox NEQ "">,hcpcLengthOfNeedMonth10TBox</cfif>
					<cfif IsDefined("form.hcpcCost11TBox") AND form.hcpcCost11TBox NEQ "">,hcpcCost11TBox</cfif>
					<cfif IsDefined("form.hcpcCode11TBox") AND form.hcpcCode11TBox NEQ "">,hcpcCode11TBox</cfif>
					<cfif IsDefined("form.hcpcQty11TBox") AND form.hcpcQty11TBox NEQ "">,hcpcQty11TBox</cfif>
					<cfif IsDefined("form.hcpcProduct11TBox") AND form.hcpcProduct11TBox NEQ "">,hcpcProduct11TBox</cfif>
					<cfif IsDefined("form.hcpcDX11TBox") AND form.hcpcDX11TBox NEQ "">,hcpcDX11TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis11TBox") AND form.hcpcDiagnosis11TBox NEQ "">,hcpcDiagnosis11TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear11TBox") AND form.hcpcLengthOfNeedYear11TBox NEQ "">,hcpcLengthOfNeedYear11TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth11TBox") AND form.hcpcLengthOfNeedMonth11TBox NEQ "">,hcpcLengthOfNeedMonth11TBox</cfif>
					<cfif IsDefined("form.hcpcCost12TBox") AND form.hcpcCost12TBox NEQ "">,hcpcCost12TBox</cfif>
					<cfif IsDefined("form.hcpcCode12TBox") AND form.hcpcCode12TBox NEQ "">,hcpcCode12TBox</cfif>
					<cfif IsDefined("form.hcpcQty12TBox") AND form.hcpcQty12TBox NEQ "">,hcpcQty12TBox</cfif>
					<cfif IsDefined("form.hcpcProduct12TBox") AND form.hcpcProduct12TBox NEQ "">,hcpcProduct12TBox</cfif>
					<cfif IsDefined("form.hcpcDX12TBox") AND form.hcpcDX12TBox NEQ "">,hcpcDX12TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis12TBox") AND form.hcpcDiagnosis12TBox NEQ "">,hcpcDiagnosis12TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear12TBox") AND form.hcpcLengthOfNeedYear12TBox NEQ "">,hcpcLengthOfNeedYear12TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth12TBox") AND form.hcpcLengthOfNeedMonth12TBox NEQ "">,hcpcLengthOfNeedMonth12TBox</cfif>
					<cfif IsDefined("form.hcpcCost13TBox") AND form.hcpcCost13TBox NEQ "">,hcpcCost13TBox</cfif>
					<cfif IsDefined("form.hcpcCode13TBox") AND form.hcpcCode13TBox NEQ "">,hcpcCode13TBox</cfif>
					<cfif IsDefined("form.hcpcQty13TBox") AND form.hcpcQty13TBox NEQ "">,hcpcQty13TBox</cfif>
					<cfif IsDefined("form.hcpcProduct13TBox") AND form.hcpcProduct13TBox NEQ "">,hcpcProduct13TBox</cfif>
					<cfif IsDefined("form.hcpcDX13TBox") AND form.hcpcDX13TBox NEQ "">,hcpcDX13TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis13TBox") AND form.hcpcDiagnosis13TBox NEQ "">,hcpcDiagnosis13TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear13TBox") AND form.hcpcLengthOfNeedYear13TBox NEQ "">,hcpcLengthOfNeedYear13TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth13TBox") AND form.hcpcLengthOfNeedMonth13TBox NEQ "">,hcpcLengthOfNeedMonth13TBox</cfif>
					<cfif IsDefined("form.hcpcCost14TBox") AND form.hcpcCost14TBox NEQ "">,hcpcCost14TBox</cfif>
					<cfif IsDefined("form.hcpcCode14TBox") AND form.hcpcCode14TBox NEQ "">,hcpcCode14TBox</cfif>
					<cfif IsDefined("form.hcpcQty14TBox") AND form.hcpcQty14TBox NEQ "">,hcpcQty14TBox</cfif>
					<cfif IsDefined("form.hcpcProduct14TBox") AND form.hcpcProduct14TBox NEQ "">,hcpcProduct14TBox</cfif>
					<cfif IsDefined("form.hcpcDX14TBox") AND form.hcpcDX14TBox NEQ "">,hcpcDX14TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis14TBox") AND form.hcpcDiagnosis14TBox NEQ "">,hcpcDiagnosis14TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear14TBox") AND form.hcpcLengthOfNeedYear14TBox NEQ "">,hcpcLengthOfNeedYear14TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth14TBox") AND form.hcpcLengthOfNeedMonth14TBox NEQ "">,hcpcLengthOfNeedMonth14TBox</cfif>
					<cfif IsDefined("form.hcpcCost15TBox") AND form.hcpcCost15TBox NEQ "">,hcpcCost15TBox</cfif>
					<cfif IsDefined("form.hcpcCode15TBox") AND form.hcpcCode15TBox NEQ "">,hcpcCode15TBox</cfif>
					<cfif IsDefined("form.hcpcQty15TBox") AND form.hcpcQty15TBox NEQ "">,hcpcQty15TBox</cfif>
					<cfif IsDefined("form.hcpcProduct15TBox") AND form.hcpcProduct15TBox NEQ "">,hcpcProduct15TBox</cfif>
					<cfif IsDefined("form.hcpcDX15TBox") AND form.hcpcDX15TBox NEQ "">,hcpcDX15TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis15TBox") AND form.hcpcDiagnosis15TBox NEQ "">,hcpcDiagnosis15TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear15TBox") AND form.hcpcLengthOfNeedYear15TBox NEQ "">,hcpcLengthOfNeedYear15TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth15TBox") AND form.hcpcLengthOfNeedMonth15TBox NEQ "">,hcpcLengthOfNeedMonth15TBox</cfif>
					<cfif IsDefined("form.hcpcCost16TBox") AND form.hcpcCost16TBox NEQ "">,hcpcCost16TBox</cfif>
					<cfif IsDefined("form.hcpcCode16TBox") AND form.hcpcCode16TBox NEQ "">,hcpcCode16TBox</cfif>
					<cfif IsDefined("form.hcpcQty16TBox") AND form.hcpcQty16TBox NEQ "">,hcpcQty16TBox</cfif>
					<cfif IsDefined("form.hcpcProduct16TBox") AND form.hcpcProduct16TBox NEQ "">,hcpcProduct16TBox</cfif>
					<cfif IsDefined("form.hcpcDX16TBox") AND form.hcpcDX16TBox NEQ "">,hcpcDX16TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis16TBox") AND form.hcpcDiagnosis16TBox NEQ "">,hcpcDiagnosis16TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear16TBox") AND form.hcpcLengthOfNeedYear16TBox NEQ "">,hcpcLengthOfNeedYear16TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth16TBox") AND form.hcpcLengthOfNeedMonth16TBox NEQ "">,hcpcLengthOfNeedMonth16TBox</cfif>
					<cfif IsDefined("form.hcpcCost17TBox") AND form.hcpcCost17TBox NEQ "">,hcpcCost17TBox</cfif>
					<cfif IsDefined("form.hcpcCode17TBox") AND form.hcpcCode17TBox NEQ "">,hcpcCode17TBox</cfif>
					<cfif IsDefined("form.hcpcQty17TBox") AND form.hcpcQty17TBox NEQ "">,hcpcQty17TBox</cfif>
					<cfif IsDefined("form.hcpcProduct17TBox") AND form.hcpcProduct17TBox NEQ "">,hcpcProduct17TBox</cfif>
					<cfif IsDefined("form.hcpcDX17TBox") AND form.hcpcDX17TBox NEQ "">,hcpcDX17TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis17TBox") AND form.hcpcDiagnosis17TBox NEQ "">,hcpcDiagnosis17TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear17TBox") AND form.hcpcLengthOfNeedYear17TBox NEQ "">,hcpcLengthOfNeedYear17TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth17TBox") AND form.hcpcLengthOfNeedMonth17TBox NEQ "">,hcpcLengthOfNeedMonth17TBox</cfif>
					<cfif IsDefined("form.hcpcCost18TBox") AND form.hcpcCost18TBox NEQ "">,hcpcCost18TBox</cfif>
					<cfif IsDefined("form.hcpcCode18TBox") AND form.hcpcCode18TBox NEQ "">,hcpcCode18TBox</cfif>
					<cfif IsDefined("form.hcpcQty18TBox") AND form.hcpcQty18TBox NEQ "">,hcpcQty18TBox</cfif>
					<cfif IsDefined("form.hcpcProduct18TBox") AND form.hcpcProduct18TBox NEQ "">,hcpcProduct18TBox</cfif>
					<cfif IsDefined("form.hcpcDX18TBox") AND form.hcpcDX18TBox NEQ "">,hcpcDX18TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis18TBox") AND form.hcpcDiagnosis18TBox NEQ "">,hcpcDiagnosis18TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear18TBox") AND form.hcpcLengthOfNeedYear18TBox NEQ "">,hcpcLengthOfNeedYear18TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth18TBox") AND form.hcpcLengthOfNeedMonth18TBox NEQ "">,hcpcLengthOfNeedMonth18TBox</cfif>
					<cfif IsDefined("form.hcpcCost19TBox") AND form.hcpcCost19TBox NEQ "">,hcpcCost19TBox</cfif>
					<cfif IsDefined("form.hcpcCode19TBox") AND form.hcpcCode19TBox NEQ "">,hcpcCode19TBox</cfif>
					<cfif IsDefined("form.hcpcQty19TBox") AND form.hcpcQty19TBox NEQ "">,hcpcQty19TBox</cfif>
					<cfif IsDefined("form.hcpcProduct19TBox") AND form.hcpcProduct19TBox NEQ "">,hcpcProduct19TBox</cfif>
					<cfif IsDefined("form.hcpcDX19TBox") AND form.hcpcDX19TBox NEQ "">,hcpcDX19TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis19TBox") AND form.hcpcDiagnosis19TBox NEQ "">,hcpcDiagnosis19TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear19TBox") AND form.hcpcLengthOfNeedYear19TBox NEQ "">,hcpcLengthOfNeedYear19TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth19TBox") AND form.hcpcLengthOfNeedMonth19TBox NEQ "">,hcpcLengthOfNeedMonth19TBox</cfif>
					<cfif IsDefined("form.hcpcCost20TBox") AND form.hcpcCost20TBox NEQ "">,hcpcCost20TBox</cfif>
					<cfif IsDefined("form.hcpcCode20TBox") AND form.hcpcCode20TBox NEQ "">,hcpcCode20TBox</cfif>
					<cfif IsDefined("form.hcpcQty20TBox") AND form.hcpcQty20TBox NEQ "">,hcpcQty20TBox</cfif>
					<cfif IsDefined("form.hcpcProduct20TBox") AND form.hcpcProduct20TBox NEQ "">,hcpcProduct20TBox</cfif>
					<cfif IsDefined("form.hcpcDX20TBox") AND form.hcpcDX20TBox NEQ "">,hcpcDX20TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis20TBox") AND form.hcpcDiagnosis20TBox NEQ "">,hcpcDiagnosis20TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear20TBox") AND form.hcpcLengthOfNeedYear20TBox NEQ "">,hcpcLengthOfNeedYear20TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth20TBox") AND form.hcpcLengthOfNeedMonth20TBox NEQ "">,hcpcLengthOfNeedMonth20TBox</cfif>
					<cfif IsDefined("form.hcpcCost21TBox") AND form.hcpcCost21TBox NEQ "">,hcpcCost21TBox</cfif>
					<cfif IsDefined("form.hcpcCode21TBox") AND form.hcpcCode21TBox NEQ "">,hcpcCode21TBox</cfif>
					<cfif IsDefined("form.hcpcQty21TBox") AND form.hcpcQty21TBox NEQ "">,hcpcQty21TBox</cfif>
					<cfif IsDefined("form.hcpcProduct21TBox") AND form.hcpcProduct21TBox NEQ "">,hcpcProduct21TBox</cfif>
					<cfif IsDefined("form.hcpcDX21TBox") AND form.hcpcDX21TBox NEQ "">,hcpcDX21TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis21TBox") AND form.hcpcDiagnosis21TBox NEQ "">,hcpcDiagnosis21TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear21TBox") AND form.hcpcLengthOfNeedYear21TBox NEQ "">,hcpcLengthOfNeedYear21TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth21TBox") AND form.hcpcLengthOfNeedMonth21TBox NEQ "">,hcpcLengthOfNeedMonth21TBox</cfif>
					<cfif IsDefined("form.hcpcCost22TBox") AND form.hcpcCost22TBox NEQ "">,hcpcCost22TBox</cfif>
					<cfif IsDefined("form.hcpcCode22TBox") AND form.hcpcCode22TBox NEQ "">,hcpcCode22TBox</cfif>
					<cfif IsDefined("form.hcpcQty22TBox") AND form.hcpcQty22TBox NEQ "">,hcpcQty22TBox</cfif>
					<cfif IsDefined("form.hcpcProduct22TBox") AND form.hcpcProduct22TBox NEQ "">,hcpcProduct22TBox</cfif>
					<cfif IsDefined("form.hcpcDX22TBox") AND form.hcpcDX22TBox NEQ "">,hcpcDX22TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis22TBox") AND form.hcpcDiagnosis22TBox NEQ "">,hcpcDiagnosis22TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear22TBox") AND form.hcpcLengthOfNeedYear22TBox NEQ "">,hcpcLengthOfNeedYear22TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth22TBox") AND form.hcpcLengthOfNeedMonth22TBox NEQ "">,hcpcLengthOfNeedMonth22TBox</cfif>
					<cfif IsDefined("form.hcpcCost23TBox") AND form.hcpcCost23TBox NEQ "">,hcpcCost23TBox</cfif>
					<cfif IsDefined("form.hcpcCode23TBox") AND form.hcpcCode23TBox NEQ "">,hcpcCode23TBox</cfif>
					<cfif IsDefined("form.hcpcQty23TBox") AND form.hcpcQty23TBox NEQ "">,hcpcQty23TBox</cfif>
					<cfif IsDefined("form.hcpcProduct23TBox") AND form.hcpcProduct23TBox NEQ "">,hcpcProduct23TBox</cfif>
					<cfif IsDefined("form.hcpcDX23TBox") AND form.hcpcDX23TBox NEQ "">,hcpcDX23TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis23TBox") AND form.hcpcDiagnosis23TBox NEQ "">,hcpcDiagnosis23TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear23TBox") AND form.hcpcLengthOfNeedYear23TBox NEQ "">,hcpcLengthOfNeedYear23TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth23TBox") AND form.hcpcLengthOfNeedMonth23TBox NEQ "">,hcpcLengthOfNeedMonth23TBox</cfif>
					<cfif IsDefined("form.hcpcCost24TBox") AND form.hcpcCost24TBox NEQ "">,hcpcCost24TBox</cfif>
					<cfif IsDefined("form.hcpcCode24TBox") AND form.hcpcCode24TBox NEQ "">,hcpcCode24TBox</cfif>
					<cfif IsDefined("form.hcpcQty24TBox") AND form.hcpcQty24TBox NEQ "">,hcpcQty24TBox</cfif>
					<cfif IsDefined("form.hcpcProduct24TBox") AND form.hcpcProduct24TBox NEQ "">,hcpcProduct24TBox</cfif>
					<cfif IsDefined("form.hcpcDX24TBox") AND form.hcpcDX24TBox NEQ "">,hcpcDX24TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis24TBox") AND form.hcpcDiagnosis24TBox NEQ "">,hcpcDiagnosis24TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear24TBox") AND form.hcpcLengthOfNeedYear24TBox NEQ "">,hcpcLengthOfNeedYear24TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth24TBox") AND form.hcpcLengthOfNeedMonth24TBox NEQ "">,hcpcLengthOfNeedMonth24TBox</cfif>
					<cfif IsDefined("form.hcpcCost25TBox") AND form.hcpcCost25TBox NEQ "">,hcpcCost25TBox</cfif>
					<cfif IsDefined("form.hcpcCode25TBox") AND form.hcpcCode25TBox NEQ "">,hcpcCode25TBox</cfif>
					<cfif IsDefined("form.hcpcQty25TBox") AND form.hcpcQty25TBox NEQ "">,hcpcQty25TBox</cfif>
					<cfif IsDefined("form.hcpcProduct25TBox") AND form.hcpcProduct25TBox NEQ "">,hcpcProduct25TBox</cfif>
					<cfif IsDefined("form.hcpcDX25TBox") AND form.hcpcDX25TBox NEQ "">,hcpcDX25TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis25TBox") AND form.hcpcDiagnosis25TBox NEQ "">,hcpcDiagnosis25TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear25TBox") AND form.hcpcLengthOfNeedYear25TBox NEQ "">,hcpcLengthOfNeedYear25TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth25TBox") AND form.hcpcLengthOfNeedMonth25TBox NEQ "">,hcpcLengthOfNeedMonth25TBox</cfif>
					<cfif IsDefined("form.hcpcCost26TBox") AND form.hcpcCost26TBox NEQ "">,hcpcCost26TBox</cfif>
					<cfif IsDefined("form.hcpcCode26TBox") AND form.hcpcCode26TBox NEQ "">,hcpcCode26TBox</cfif>
					<cfif IsDefined("form.hcpcQty26TBox") AND form.hcpcQty26TBox NEQ "">,hcpcQty26TBox</cfif>
					<cfif IsDefined("form.hcpcProduct26TBox") AND form.hcpcProduct26TBox NEQ "">,hcpcProduct26TBox</cfif>
					<cfif IsDefined("form.hcpcDX26TBox") AND form.hcpcDX26TBox NEQ "">,hcpcDX26TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis26TBox") AND form.hcpcDiagnosis26TBox NEQ "">,hcpcDiagnosis26TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear26TBox") AND form.hcpcLengthOfNeedYear26TBox NEQ "">,hcpcLengthOfNeedYear26TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth26TBox") AND form.hcpcLengthOfNeedMonth26TBox NEQ "">,hcpcLengthOfNeedMonth26TBox</cfif>
					<cfif IsDefined("form.hcpcCost27TBox") AND form.hcpcCost27TBox NEQ "">,hcpcCost27TBox</cfif>
					<cfif IsDefined("form.hcpcCode27TBox") AND form.hcpcCode27TBox NEQ "">,hcpcCode27TBox</cfif>
					<cfif IsDefined("form.hcpcQty27TBox") AND form.hcpcQty27TBox NEQ "">,hcpcQty27TBox</cfif>
					<cfif IsDefined("form.hcpcProduct27TBox") AND form.hcpcProduct27TBox NEQ "">,hcpcProduct27TBox</cfif>
					<cfif IsDefined("form.hcpcDX27TBox") AND form.hcpcDX27TBox NEQ "">,hcpcDX27TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis27TBox") AND form.hcpcDiagnosis27TBox NEQ "">,hcpcDiagnosis27TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear27TBox") AND form.hcpcLengthOfNeedYear27TBox NEQ "">,hcpcLengthOfNeedYear27TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth27TBox") AND form.hcpcLengthOfNeedMonth27TBox NEQ "">,hcpcLengthOfNeedMonth27TBox</cfif>
					<cfif IsDefined("form.hcpcCost28TBox") AND form.hcpcCost28TBox NEQ "">,hcpcCost28TBox</cfif>
					<cfif IsDefined("form.hcpcCode28TBox") AND form.hcpcCode28TBox NEQ "">,hcpcCode28TBox</cfif>
					<cfif IsDefined("form.hcpcQty28TBox") AND form.hcpcQty28TBox NEQ "">,hcpcQty28TBox</cfif>
					<cfif IsDefined("form.hcpcProduct28TBox") AND form.hcpcProduct28TBox NEQ "">,hcpcProduct28TBox</cfif>
					<cfif IsDefined("form.hcpcDX28TBox") AND form.hcpcDX28TBox NEQ "">,hcpcDX28TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis28TBox") AND form.hcpcDiagnosis28TBox NEQ "">,hcpcDiagnosis28TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear28TBox") AND form.hcpcLengthOfNeedYear28TBox NEQ "">,hcpcLengthOfNeedYear28TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth28TBox") AND form.hcpcLengthOfNeedMonth28TBox NEQ "">,hcpcLengthOfNeedMonth28TBox</cfif>
					<cfif IsDefined("form.hcpcCost29TBox") AND form.hcpcCost29TBox NEQ "">,hcpcCost29TBox</cfif>
					<cfif IsDefined("form.hcpcCode29TBox") AND form.hcpcCode29TBox NEQ "">,hcpcCode29TBox</cfif>
					<cfif IsDefined("form.hcpcQty29TBox") AND form.hcpcQty29TBox NEQ "">,hcpcQty29TBox</cfif>
					<cfif IsDefined("form.hcpcProduct29TBox") AND form.hcpcProduct29TBox NEQ "">,hcpcProduct29TBox</cfif>
					<cfif IsDefined("form.hcpcDX29TBox") AND form.hcpcDX29TBox NEQ "">,hcpcDX29TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis29TBox") AND form.hcpcDiagnosis29TBox NEQ "">,hcpcDiagnosis29TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear29TBox") AND form.hcpcLengthOfNeedYear29TBox NEQ "">,hcpcLengthOfNeedYear29TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth29TBox") AND form.hcpcLengthOfNeedMonth29TBox NEQ "">,hcpcLengthOfNeedMonth29TBox</cfif>
					<cfif IsDefined("form.hcpcCost30TBox") AND form.hcpcCost30TBox NEQ "">,hcpcCost30TBox</cfif>
					<cfif IsDefined("form.hcpcCode30TBox") AND form.hcpcCode30TBox NEQ "">,hcpcCode30TBox</cfif>
					<cfif IsDefined("form.hcpcQty30TBox") AND form.hcpcQty30TBox NEQ "">,hcpcQty30TBox</cfif>
					<cfif IsDefined("form.hcpcProduct30TBox") AND form.hcpcProduct30TBox NEQ "">,hcpcProduct30TBox</cfif>
					<cfif IsDefined("form.hcpcDX30TBox") AND form.hcpcDX30TBox NEQ "">,hcpcDX30TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis30TBox") AND form.hcpcDiagnosis30TBox NEQ "">,hcpcDiagnosis30TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear30TBox") AND form.hcpcLengthOfNeedYear30TBox NEQ "">,hcpcLengthOfNeedYear30TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth30TBox") AND form.hcpcLengthOfNeedMonth30TBox NEQ "">,hcpcLengthOfNeedMonth30TBox</cfif>
					<cfif IsDefined("form.hcpcCost31TBox") AND form.hcpcCost31TBox NEQ "">,hcpcCost31TBox</cfif>
					<cfif IsDefined("form.hcpcCode31TBox") AND form.hcpcCode31TBox NEQ "">,hcpcCode31TBox</cfif>
					<cfif IsDefined("form.hcpcQty31TBox") AND form.hcpcQty31TBox NEQ "">,hcpcQty31TBox</cfif>
					<cfif IsDefined("form.hcpcProduct31TBox") AND form.hcpcProduct31TBox NEQ "">,hcpcProduct31TBox</cfif>
					<cfif IsDefined("form.hcpcDX31TBox") AND form.hcpcDX31TBox NEQ "">,hcpcDX31TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis31TBox") AND form.hcpcDiagnosis31TBox NEQ "">,hcpcDiagnosis31TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear31TBox") AND form.hcpcLengthOfNeedYear31TBox NEQ "">,hcpcLengthOfNeedYear31TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth31TBox") AND form.hcpcLengthOfNeedMonth31TBox NEQ "">,hcpcLengthOfNeedMonth31TBox</cfif>
					<cfif IsDefined("form.hcpcCost32TBox") AND form.hcpcCost32TBox NEQ "">,hcpcCost32TBox</cfif>
					<cfif IsDefined("form.hcpcCode32TBox") AND form.hcpcCode32TBox NEQ "">,hcpcCode32TBox</cfif>
					<cfif IsDefined("form.hcpcQty32TBox") AND form.hcpcQty32TBox NEQ "">,hcpcQty32TBox</cfif>
					<cfif IsDefined("form.hcpcProduct32TBox") AND form.hcpcProduct32TBox NEQ "">,hcpcProduct32TBox</cfif>
					<cfif IsDefined("form.hcpcDX32TBox") AND form.hcpcDX32TBox NEQ "">,hcpcDX32TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis32TBox") AND form.hcpcDiagnosis32TBox NEQ "">,hcpcDiagnosis32TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear32TBox") AND form.hcpcLengthOfNeedYear32TBox NEQ "">,hcpcLengthOfNeedYear32TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth32TBox") AND form.hcpcLengthOfNeedMonth32TBox NEQ "">,hcpcLengthOfNeedMonth32TBox</cfif>
					<cfif IsDefined("form.hcpcCost33TBox") AND form.hcpcCost33TBox NEQ "">,hcpcCost33TBox</cfif>
					<cfif IsDefined("form.hcpcCode33TBox") AND form.hcpcCode33TBox NEQ "">,hcpcCode33TBox</cfif>
					<cfif IsDefined("form.hcpcQty33TBox") AND form.hcpcQty33TBox NEQ "">,hcpcQty33TBox</cfif>
					<cfif IsDefined("form.hcpcProduct33TBox") AND form.hcpcProduct33TBox NEQ "">,hcpcProduct33TBox</cfif>
					<cfif IsDefined("form.hcpcDX33TBox") AND form.hcpcDX33TBox NEQ "">,hcpcDX33TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis33TBox") AND form.hcpcDiagnosis33TBox NEQ "">,hcpcDiagnosis33TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear33TBox") AND form.hcpcLengthOfNeedYear33TBox NEQ "">,hcpcLengthOfNeedYear33TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth33TBox") AND form.hcpcLengthOfNeedMonth33TBox NEQ "">,hcpcLengthOfNeedMonth33TBox</cfif>
					<cfif IsDefined("form.hcpcCost34TBox") AND form.hcpcCost34TBox NEQ "">,hcpcCost34TBox</cfif>
					<cfif IsDefined("form.hcpcCode34TBox") AND form.hcpcCode34TBox NEQ "">,hcpcCode34TBox</cfif>
					<cfif IsDefined("form.hcpcQty34TBox") AND form.hcpcQty34TBox NEQ "">,hcpcQty34TBox</cfif>
					<cfif IsDefined("form.hcpcProduct34TBox") AND form.hcpcProduct34TBox NEQ "">,hcpcProduct34TBox</cfif>
					<cfif IsDefined("form.hcpcDX34TBox") AND form.hcpcDX34TBox NEQ "">,hcpcDX34TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis34TBox") AND form.hcpcDiagnosis34TBox NEQ "">,hcpcDiagnosis34TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear34TBox") AND form.hcpcLengthOfNeedYear34TBox NEQ "">,hcpcLengthOfNeedYear34TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth34TBox") AND form.hcpcLengthOfNeedMonth34TBox NEQ "">,hcpcLengthOfNeedMonth34TBox</cfif>
					<cfif IsDefined("form.hcpcCost35TBox") AND form.hcpcCost35TBox NEQ "">,hcpcCost35TBox</cfif>
					<cfif IsDefined("form.hcpcCode35TBox") AND form.hcpcCode35TBox NEQ "">,hcpcCode35TBox</cfif>
					<cfif IsDefined("form.hcpcQty35TBox") AND form.hcpcQty35TBox NEQ "">,hcpcQty35TBox</cfif>
					<cfif IsDefined("form.hcpcProduct35TBox") AND form.hcpcProduct35TBox NEQ "">,hcpcProduct35TBox</cfif>
					<cfif IsDefined("form.hcpcDX35TBox") AND form.hcpcDX35TBox NEQ "">,hcpcDX35TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis35TBox") AND form.hcpcDiagnosis35TBox NEQ "">,hcpcDiagnosis35TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear35TBox") AND form.hcpcLengthOfNeedYear35TBox NEQ "">,hcpcLengthOfNeedYear35TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth35TBox") AND form.hcpcLengthOfNeedMonth35TBox NEQ "">,hcpcLengthOfNeedMonth35TBox</cfif>
					<cfif IsDefined("form.hcpcCost36TBox") AND form.hcpcCost36TBox NEQ "">,hcpcCost36TBox</cfif>
					<cfif IsDefined("form.hcpcCode36TBox") AND form.hcpcCode36TBox NEQ "">,hcpcCode36TBox</cfif>
					<cfif IsDefined("form.hcpcQty36TBox") AND form.hcpcQty36TBox NEQ "">,hcpcQty36TBox</cfif>
					<cfif IsDefined("form.hcpcProduct36TBox") AND form.hcpcProduct36TBox NEQ "">,hcpcProduct36TBox</cfif>
					<cfif IsDefined("form.hcpcDX36TBox") AND form.hcpcDX36TBox NEQ "">,hcpcDX36TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis36TBox") AND form.hcpcDiagnosis36TBox NEQ "">,hcpcDiagnosis36TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear36TBox") AND form.hcpcLengthOfNeedYear36TBox NEQ "">,hcpcLengthOfNeedYear36TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth36TBox") AND form.hcpcLengthOfNeedMonth36TBox NEQ "">,hcpcLengthOfNeedMonth36TBox</cfif>
					<cfif IsDefined("form.hcpcCost37TBox") AND form.hcpcCost37TBox NEQ "">,hcpcCost37TBox</cfif>
					<cfif IsDefined("form.hcpcCode37TBox") AND form.hcpcCode37TBox NEQ "">,hcpcCode37TBox</cfif>
					<cfif IsDefined("form.hcpcQty37TBox") AND form.hcpcQty37TBox NEQ "">,hcpcQty37TBox</cfif>
					<cfif IsDefined("form.hcpcProduct37TBox") AND form.hcpcProduct37TBox NEQ "">,hcpcProduct37TBox</cfif>
					<cfif IsDefined("form.hcpcDX37TBox") AND form.hcpcDX37TBox NEQ "">,hcpcDX37TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis37TBox") AND form.hcpcDiagnosis37TBox NEQ "">,hcpcDiagnosis37TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear37TBox") AND form.hcpcLengthOfNeedYear37TBox NEQ "">,hcpcLengthOfNeedYear37TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth37TBox") AND form.hcpcLengthOfNeedMonth37TBox NEQ "">,hcpcLengthOfNeedMonth37TBox</cfif>
					<cfif IsDefined("form.hcpcCost38TBox") AND form.hcpcCost38TBox NEQ "">,hcpcCost38TBox</cfif>
					<cfif IsDefined("form.hcpcCode38TBox") AND form.hcpcCode38TBox NEQ "">,hcpcCode38TBox</cfif>
					<cfif IsDefined("form.hcpcQty38TBox") AND form.hcpcQty38TBox NEQ "">,hcpcQty38TBox</cfif>
					<cfif IsDefined("form.hcpcProduct38TBox") AND form.hcpcProduct38TBox NEQ "">,hcpcProduct38TBox</cfif>
					<cfif IsDefined("form.hcpcDX38TBox") AND form.hcpcDX38TBox NEQ "">,hcpcDX38TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis38TBox") AND form.hcpcDiagnosis38TBox NEQ "">,hcpcDiagnosis38TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear38TBox") AND form.hcpcLengthOfNeedYear38TBox NEQ "">,hcpcLengthOfNeedYear38TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth38TBox") AND form.hcpcLengthOfNeedMonth38TBox NEQ "">,hcpcLengthOfNeedMonth38TBox</cfif>
					<cfif IsDefined("form.hcpcCost39TBox") AND form.hcpcCost39TBox NEQ "">,hcpcCost39TBox</cfif>
					<cfif IsDefined("form.hcpcCode39TBox") AND form.hcpcCode39TBox NEQ "">,hcpcCode39TBox</cfif>
					<cfif IsDefined("form.hcpcQty39TBox") AND form.hcpcQty39TBox NEQ "">,hcpcQty39TBox</cfif>
					<cfif IsDefined("form.hcpcProduct39TBox") AND form.hcpcProduct39TBox NEQ "">,hcpcProduct39TBox</cfif>
					<cfif IsDefined("form.hcpcDX39TBox") AND form.hcpcDX39TBox NEQ "">,hcpcDX39TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis39TBox") AND form.hcpcDiagnosis39TBox NEQ "">,hcpcDiagnosis39TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear39TBox") AND form.hcpcLengthOfNeedYear39TBox NEQ "">,hcpcLengthOfNeedYear39TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth39TBox") AND form.hcpcLengthOfNeedMonth39TBox NEQ "">,hcpcLengthOfNeedMonth39TBox</cfif>
					<cfif IsDefined("form.hcpcCost40TBox") AND form.hcpcCost40TBox NEQ "">,hcpcCost40TBox</cfif>
					<cfif IsDefined("form.hcpcCode40TBox") AND form.hcpcCode40TBox NEQ "">,hcpcCode40TBox</cfif>
					<cfif IsDefined("form.hcpcQty40TBox") AND form.hcpcQty40TBox NEQ "">,hcpcQty40TBox</cfif>
					<cfif IsDefined("form.hcpcProduct40TBox") AND form.hcpcProduct40TBox NEQ "">,hcpcProduct40TBox</cfif>
					<cfif IsDefined("form.hcpcDX40TBox") AND form.hcpcDX40TBox NEQ "">,hcpcDX40TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis40TBox") AND form.hcpcDiagnosis40TBox NEQ "">,hcpcDiagnosis40TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear40TBox") AND form.hcpcLengthOfNeedYear40TBox NEQ "">,hcpcLengthOfNeedYear40TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth40TBox") AND form.hcpcLengthOfNeedMonth40TBox NEQ "">,hcpcLengthOfNeedMonth40TBox</cfif>		
			 	)
				VALUES(
					#trim(InsertQuote.QuoteID)#					 
					<cfif IsDefined("form.hcpcCost1TBox") AND form.hcpcCost1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode1TBox") AND form.hcpcCode1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty1TBox") AND form.hcpcQty1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct1TBox") AND form.hcpcProduct1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX1TBox") AND form.hcpcDX1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis1TBox") AND form.hcpcDiagnosis1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear1TBox") AND form.hcpcLengthOfNeedYear1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth1TBox") AND form.hcpcLengthOfNeedMonth1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost2TBox") AND form.hcpcCost2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode2TBox") AND form.hcpcCode2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty2TBox") AND form.hcpcQty2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct2TBox") AND form.hcpcProduct2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX2TBox") AND form.hcpcDX2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis2TBox") AND form.hcpcDiagnosis2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear2TBox") AND form.hcpcLengthOfNeedYear2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth2TBox") AND form.hcpcLengthOfNeedMonth2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost3TBox") AND form.hcpcCost3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode3TBox") AND form.hcpcCode3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty3TBox") AND form.hcpcQty3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct3TBox") AND form.hcpcProduct3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX3TBox") AND form.hcpcDX3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis3TBox") AND form.hcpcDiagnosis3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear3TBox") AND form.hcpcLengthOfNeedYear3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth3TBox") AND form.hcpcLengthOfNeedMonth3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost4TBox") AND form.hcpcCost4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode4TBox") AND form.hcpcCode4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty4TBox") AND form.hcpcQty4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct4TBox") AND form.hcpcProduct4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX4TBox") AND form.hcpcDX4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis4TBox") AND form.hcpcDiagnosis4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear4TBox") AND form.hcpcLengthOfNeedYear4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth4TBox") AND form.hcpcLengthOfNeedMonth4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost5TBox") AND form.hcpcCost5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode5TBox") AND form.hcpcCode5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty5TBox") AND form.hcpcQty5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct5TBox") AND form.hcpcProduct5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX5TBox") AND form.hcpcDX5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis5TBox") AND form.hcpcDiagnosis5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear5TBox") AND form.hcpcLengthOfNeedYear5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth5TBox") AND form.hcpcLengthOfNeedMonth5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost6TBox") AND form.hcpcCost6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode6TBox") AND form.hcpcCode6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty6TBox") AND form.hcpcQty6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct6TBox") AND form.hcpcProduct6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX6TBox") AND form.hcpcDX6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis6TBox") AND form.hcpcDiagnosis6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear6TBox") AND form.hcpcLengthOfNeedYear6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth6TBox") AND form.hcpcLengthOfNeedMonth6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost7TBox") AND form.hcpcCost7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode7TBox") AND form.hcpcCode7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty7TBox") AND form.hcpcQty7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct7TBox") AND form.hcpcProduct7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX7TBox") AND form.hcpcDX7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis7TBox") AND form.hcpcDiagnosis7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear7TBox") AND form.hcpcLengthOfNeedYear7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth7TBox") AND form.hcpcLengthOfNeedMonth7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost8TBox") AND form.hcpcCost8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode8TBox") AND form.hcpcCode8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty8TBox") AND form.hcpcQty8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct8TBox") AND form.hcpcProduct8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX8TBox") AND form.hcpcDX8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis8TBox") AND form.hcpcDiagnosis8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear8TBox") AND form.hcpcLengthOfNeedYear8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth8TBox") AND form.hcpcLengthOfNeedMonth8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost9TBox") AND form.hcpcCost9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode9TBox") AND form.hcpcCode9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty9TBox") AND form.hcpcQty9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct9TBox") AND form.hcpcProduct9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX9TBox") AND form.hcpcDX9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis9TBox") AND form.hcpcDiagnosis9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear9TBox") AND form.hcpcLengthOfNeedYear9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth9TBox") AND form.hcpcLengthOfNeedMonth9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost10TBox") AND form.hcpcCost10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode10TBox") AND form.hcpcCode10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty10TBox") AND form.hcpcQty10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct10TBox") AND form.hcpcProduct10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX10TBox") AND form.hcpcDX10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis10TBox") AND form.hcpcDiagnosis10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear10TBox") AND form.hcpcLengthOfNeedYear10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth10TBox") AND form.hcpcLengthOfNeedMonth10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost11TBox") AND form.hcpcCost11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode11TBox") AND form.hcpcCode11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty11TBox") AND form.hcpcQty11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct11TBox") AND form.hcpcProduct11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX11TBox") AND form.hcpcDX11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis11TBox") AND form.hcpcDiagnosis11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear11TBox") AND form.hcpcLengthOfNeedYear11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth11TBox") AND form.hcpcLengthOfNeedMonth11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost12TBox") AND form.hcpcCost12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode12TBox") AND form.hcpcCode12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty12TBox") AND form.hcpcQty12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct12TBox") AND form.hcpcProduct12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX12TBox") AND form.hcpcDX12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis12TBox") AND form.hcpcDiagnosis12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear12TBox") AND form.hcpcLengthOfNeedYear12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth12TBox") AND form.hcpcLengthOfNeedMonth12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost13TBox") AND form.hcpcCost13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode13TBox") AND form.hcpcCode13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty13TBox") AND form.hcpcQty13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct13TBox") AND form.hcpcProduct13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX13TBox") AND form.hcpcDX13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis13TBox") AND form.hcpcDiagnosis13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear13TBox") AND form.hcpcLengthOfNeedYear13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth13TBox") AND form.hcpcLengthOfNeedMonth13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost14TBox") AND form.hcpcCost14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode14TBox") AND form.hcpcCode14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty14TBox") AND form.hcpcQty14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct14TBox") AND form.hcpcProduct14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX14TBox") AND form.hcpcDX14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis14TBox") AND form.hcpcDiagnosis14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear14TBox") AND form.hcpcLengthOfNeedYear14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth14TBox") AND form.hcpcLengthOfNeedMonth14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost15TBox") AND form.hcpcCost15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode15TBox") AND form.hcpcCode15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty15TBox") AND form.hcpcQty15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct15TBox") AND form.hcpcProduct15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX15TBox") AND form.hcpcDX15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis15TBox") AND form.hcpcDiagnosis15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear15TBox") AND form.hcpcLengthOfNeedYear15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth15TBox") AND form.hcpcLengthOfNeedMonth15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost16TBox") AND form.hcpcCost16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode16TBox") AND form.hcpcCode16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty16TBox") AND form.hcpcQty16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct16TBox") AND form.hcpcProduct16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX16TBox") AND form.hcpcDX16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis16TBox") AND form.hcpcDiagnosis16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear16TBox") AND form.hcpcLengthOfNeedYear16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth16TBox") AND form.hcpcLengthOfNeedMonth16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost17TBox") AND form.hcpcCost17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode17TBox") AND form.hcpcCode17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty17TBox") AND form.hcpcQty17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct17TBox") AND form.hcpcProduct17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX17TBox") AND form.hcpcDX17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis17TBox") AND form.hcpcDiagnosis17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear17TBox") AND form.hcpcLengthOfNeedYear17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth17TBox") AND form.hcpcLengthOfNeedMonth17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost18TBox") AND form.hcpcCost18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode18TBox") AND form.hcpcCode18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty18TBox") AND form.hcpcQty18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct18TBox") AND form.hcpcProduct18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX18TBox") AND form.hcpcDX18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis18TBox") AND form.hcpcDiagnosis18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear18TBox") AND form.hcpcLengthOfNeedYear18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth18TBox") AND form.hcpcLengthOfNeedMonth18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost19TBox") AND form.hcpcCost19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode19TBox") AND form.hcpcCode19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty19TBox") AND form.hcpcQty19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct19TBox") AND form.hcpcProduct19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX19TBox") AND form.hcpcDX19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis19TBox") AND form.hcpcDiagnosis19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear19TBox") AND form.hcpcLengthOfNeedYear19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth19TBox") AND form.hcpcLengthOfNeedMonth19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost20TBox") AND form.hcpcCost20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode20TBox") AND form.hcpcCode20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty20TBox") AND form.hcpcQty20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct20TBox") AND form.hcpcProduct20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX20TBox") AND form.hcpcDX20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis20TBox") AND form.hcpcDiagnosis20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear20TBox") AND form.hcpcLengthOfNeedYear20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth20TBox") AND form.hcpcLengthOfNeedMonth20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost21TBox") AND form.hcpcCost21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode21TBox") AND form.hcpcCode21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty21TBox") AND form.hcpcQty21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct21TBox") AND form.hcpcProduct21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX21TBox") AND form.hcpcDX21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis21TBox") AND form.hcpcDiagnosis21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear21TBox") AND form.hcpcLengthOfNeedYear21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth21TBox") AND form.hcpcLengthOfNeedMonth21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost22TBox") AND form.hcpcCost22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode22TBox") AND form.hcpcCode22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty22TBox") AND form.hcpcQty22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct22TBox") AND form.hcpcProduct22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX22TBox") AND form.hcpcDX22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis22TBox") AND form.hcpcDiagnosis22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear22TBox") AND form.hcpcLengthOfNeedYear22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth22TBox") AND form.hcpcLengthOfNeedMonth22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost23TBox") AND form.hcpcCost23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode23TBox") AND form.hcpcCode23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty23TBox") AND form.hcpcQty23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct23TBox") AND form.hcpcProduct23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX23TBox") AND form.hcpcDX23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis23TBox") AND form.hcpcDiagnosis23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear23TBox") AND form.hcpcLengthOfNeedYear23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth23TBox") AND form.hcpcLengthOfNeedMonth23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost24TBox") AND form.hcpcCost24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode24TBox") AND form.hcpcCode24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty24TBox") AND form.hcpcQty24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct24TBox") AND form.hcpcProduct24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX24TBox") AND form.hcpcDX24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis24TBox") AND form.hcpcDiagnosis24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear24TBox") AND form.hcpcLengthOfNeedYear24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth24TBox") AND form.hcpcLengthOfNeedMonth24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost25TBox") AND form.hcpcCost25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode25TBox") AND form.hcpcCode25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty25TBox") AND form.hcpcQty25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct25TBox") AND form.hcpcProduct25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX25TBox") AND form.hcpcDX25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis25TBox") AND form.hcpcDiagnosis25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear25TBox") AND form.hcpcLengthOfNeedYear25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth25TBox") AND form.hcpcLengthOfNeedMonth25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost26TBox") AND form.hcpcCost26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode26TBox") AND form.hcpcCode26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty26TBox") AND form.hcpcQty26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct26TBox") AND form.hcpcProduct26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX26TBox") AND form.hcpcDX26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis26TBox") AND form.hcpcDiagnosis26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear26TBox") AND form.hcpcLengthOfNeedYear26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth26TBox") AND form.hcpcLengthOfNeedMonth26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost27TBox") AND form.hcpcCost27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode27TBox") AND form.hcpcCode27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty27TBox") AND form.hcpcQty27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct27TBox") AND form.hcpcProduct27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX27TBox") AND form.hcpcDX27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis27TBox") AND form.hcpcDiagnosis27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear27TBox") AND form.hcpcLengthOfNeedYear27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth27TBox") AND form.hcpcLengthOfNeedMonth27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost28TBox") AND form.hcpcCost28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode28TBox") AND form.hcpcCode28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty28TBox") AND form.hcpcQty28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct28TBox") AND form.hcpcProduct28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX28TBox") AND form.hcpcDX28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis28TBox") AND form.hcpcDiagnosis28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear28TBox") AND form.hcpcLengthOfNeedYear28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth28TBox") AND form.hcpcLengthOfNeedMonth28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost29TBox") AND form.hcpcCost29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode29TBox") AND form.hcpcCode29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty29TBox") AND form.hcpcQty29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct29TBox") AND form.hcpcProduct29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX29TBox") AND form.hcpcDX29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis29TBox") AND form.hcpcDiagnosis29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear29TBox") AND form.hcpcLengthOfNeedYear29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth29TBox") AND form.hcpcLengthOfNeedMonth29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost30TBox") AND form.hcpcCost30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode30TBox") AND form.hcpcCode30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty30TBox") AND form.hcpcQty30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct30TBox") AND form.hcpcProduct30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX30TBox") AND form.hcpcDX30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis30TBox") AND form.hcpcDiagnosis30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear30TBox") AND form.hcpcLengthOfNeedYear30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth30TBox") AND form.hcpcLengthOfNeedMonth30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost31TBox") AND form.hcpcCost31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode31TBox") AND form.hcpcCode31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty31TBox") AND form.hcpcQty31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct31TBox") AND form.hcpcProduct31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX31TBox") AND form.hcpcDX31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis31TBox") AND form.hcpcDiagnosis31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear31TBox") AND form.hcpcLengthOfNeedYear31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth31TBox") AND form.hcpcLengthOfNeedMonth31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost32TBox") AND form.hcpcCost32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode32TBox") AND form.hcpcCode32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty32TBox") AND form.hcpcQty32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct32TBox") AND form.hcpcProduct32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX32TBox") AND form.hcpcDX32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis32TBox") AND form.hcpcDiagnosis32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear32TBox") AND form.hcpcLengthOfNeedYear32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth32TBox") AND form.hcpcLengthOfNeedMonth32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost33TBox") AND form.hcpcCost33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode33TBox") AND form.hcpcCode33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty33TBox") AND form.hcpcQty33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct33TBox") AND form.hcpcProduct33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX33TBox") AND form.hcpcDX33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis33TBox") AND form.hcpcDiagnosis33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear33TBox") AND form.hcpcLengthOfNeedYear33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth33TBox") AND form.hcpcLengthOfNeedMonth33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost34TBox") AND form.hcpcCost34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode34TBox") AND form.hcpcCode34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty34TBox") AND form.hcpcQty34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct34TBox") AND form.hcpcProduct34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX34TBox") AND form.hcpcDX34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis34TBox") AND form.hcpcDiagnosis34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear34TBox") AND form.hcpcLengthOfNeedYear34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth34TBox") AND form.hcpcLengthOfNeedMonth34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost35TBox") AND form.hcpcCost35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode35TBox") AND form.hcpcCode35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty35TBox") AND form.hcpcQty35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct35TBox") AND form.hcpcProduct35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX35TBox") AND form.hcpcDX35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis35TBox") AND form.hcpcDiagnosis35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear35TBox") AND form.hcpcLengthOfNeedYear35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth35TBox") AND form.hcpcLengthOfNeedMonth35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost36TBox") AND form.hcpcCost36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode36TBox") AND form.hcpcCode36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty36TBox") AND form.hcpcQty36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct36TBox") AND form.hcpcProduct36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX36TBox") AND form.hcpcDX36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis36TBox") AND form.hcpcDiagnosis36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear36TBox") AND form.hcpcLengthOfNeedYear36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth36TBox") AND form.hcpcLengthOfNeedMonth36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost37TBox") AND form.hcpcCost37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode37TBox") AND form.hcpcCode37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty37TBox") AND form.hcpcQty37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct37TBox") AND form.hcpcProduct37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX37TBox") AND form.hcpcDX37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis37TBox") AND form.hcpcDiagnosis37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear37TBox") AND form.hcpcLengthOfNeedYear37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth37TBox") AND form.hcpcLengthOfNeedMonth37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost38TBox") AND form.hcpcCost38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode38TBox") AND form.hcpcCode38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty38TBox") AND form.hcpcQty38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct38TBox") AND form.hcpcProduct38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX38TBox") AND form.hcpcDX38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis38TBox") AND form.hcpcDiagnosis38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear38TBox") AND form.hcpcLengthOfNeedYear38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth38TBox") AND form.hcpcLengthOfNeedMonth38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost39TBox") AND form.hcpcCost39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode39TBox") AND form.hcpcCode39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty39TBox") AND form.hcpcQty39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct39TBox") AND form.hcpcProduct39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX39TBox") AND form.hcpcDX39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis39TBox") AND form.hcpcDiagnosis39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear39TBox") AND form.hcpcLengthOfNeedYear39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth39TBox") AND form.hcpcLengthOfNeedMonth39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost40TBox") AND form.hcpcCost40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode40TBox") AND form.hcpcCode40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty40TBox") AND form.hcpcQty40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct40TBox") AND form.hcpcProduct40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX40TBox") AND form.hcpcDX40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis40TBox") AND form.hcpcDiagnosis40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear40TBox") AND form.hcpcLengthOfNeedYear40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth40TBox") AND form.hcpcLengthOfNeedMonth40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth40TBox))#'</cfif>				
				);
				SELECT LAST_INSERT_ID() AS quoteHCPCID 
			</cfoutput>
		</cfsavecontent>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="insertQuoteHCPC" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatementHCPC)#
		</cfquery>
		


		<!-------------------------------------------------------------------------------------->
		<!--- Put the note in if sent in.                                                    --->
		<!-------------------------------------------------------------------------------------->
		<cfif IsDefined("form.Note") AND form.Note NEQ "">

			<cfset request.NoteXML = CreateObject("component","com.common.Note")>
			<cfset noteID = request.NoteXML.addNote(clientID: trim(session.clientID), objectID: 9, instanceID: trim(insertQuote.quoteID))>
			<cfset request.NoteXML.addNoteEntry(clientID: trim(session.clientID), NoteID: noteID, noteEntry: '#trim(form.note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>

		</cfif>


		<!-------------------------------------------------------------------------------------->
		<!--- Forward the user.                                                              --->
		<!-------------------------------------------------------------------------------------->
		<!---<cfset msg = "Quote (ID: #insertQuote.quoteID#) has been Created.">

		<cfif ListContains(session.User.getRoleIDs(), "5") OR ListContains(session.User.getRoleIDs(), "6")>
	 		<cflocation addtoken="No" url="appMyDesktop.cfm?msg=#URLEncodedFormat(trim(msg))#">
			<!---<cflocation addtoken="No" url="appPatientQuoteSearch.cfm?msg=#URLEncodedFormat(trim(msg))#">--->
		<cfelse>
	 		<cflocation addtoken="No" url="appMyDesktop.cfm?msg=#URLEncodedFormat(trim(msg))#">
		</cfif>--->
		<cflocation addtoken="No" url="appQuoteEdit.cfm?quoteID=#insertQuote.quoteID#">

	</cfif>




	<!--- CFCATCH QUERY ERRORS--->
	<cfcatch type="Any">

		<cfset message = "There was an issue processing the page. Please try your quote again. If you continue to see this message please contact your site administrator.">

		<cf_gcGatewayLogger
			datasource="#trim(request.datasource)#"
			code="115"
			logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p> #PreserveSingleQuotes(sqlStatement)#">

		<cf_gcSendEmail	from="support@eobmanager.net" to="support@eobmanager.net"
			subject="IMMEDIATE ATTENTION REQUIRED. User attempted to insert/UPDATE quote failed."
			message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p></p>">

		<cf_gcGeneralErrorTemplate
			message="#trim(message)#"
			width="75%">

		<cfabort>

	</cfcatch>


</cftry>





