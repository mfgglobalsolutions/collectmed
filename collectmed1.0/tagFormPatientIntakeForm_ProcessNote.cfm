<cfset note = "<font color=FF0000>SYSTEM INPUT NOTE: INTAKE CHANGED</font><br>">

		<cfquery name="getIntake" datasource="#trim(request.datasource)#">
			SELECT i.*, ih.*
			FROM intake i INNER JOIN intakehcpc ih ON i.intakeID = ih.intakeID
			WHERE i.IntakeID = #trim(form.intakeID)#
		</cfquery>

		<cfif IsDefined("form.ALTERNATECONTACTFNAMETBOX") AND getIntake.ALTERNATECONTACTFNAMETBOX NEQ form.ALTERNATECONTACTFNAMETBOX>
			<cfset note = note & "ALTERNATE CONTACT NAME changed from <strong>[</strong>#getIntake.ALTERNATECONTACTFNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTFNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTMINITIALTBOX") AND getIntake.ALTERNATECONTACTMINITIALTBOX NEQ form.ALTERNATECONTACTMINITIALTBOX>
			<cfset note = note & "ALTERNATE CONTACT MIDDLE INITIAL changed from <strong>[</strong>#getIntake.ALTERNATECONTACTMINITIALTBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTMINITIALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTLNAMETBOX") AND getIntake.ALTERNATECONTACTLNAMETBOX NEQ form.ALTERNATECONTACTLNAMETBOX>
			<cfset note = note & "ALTERNATE CONTACT LAST NAME changed from <strong>[</strong>#getIntake.ALTERNATECONTACTLNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTLNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTPHONETBOX") AND getIntake.ALTERNATECONTACTPHONETBOX NEQ request.cleanNumericString(form.ALTERNATECONTACTPHONETBOX)>
			<cfset note = note & "ALTERNATE CONTACT PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.ALTERNATECONTACTPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTWORKPHONETBOX") AND getIntake.ALTERNATECONTACTWORKPHONETBOX NEQ request.cleanNumericString(form.ALTERNATECONTACTWORKPHONETBOX)>
			<cfset note = note & "ALTERNATE CONTACT WORK PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.ALTERNATECONTACTWORKPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTWORKPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ALTERNATECONTACTRELATIONSHIPTBOX") AND getIntake.ALTERNATECONTACTRELATIONSHIPTBOX NEQ form.ALTERNATECONTACTRELATIONSHIPTBOX>
			<cfset note = note & "ALTERNATECONTACTRELATIONSHIP changed from <strong>[</strong>#getIntake.ALTERNATECONTACTRELATIONSHIPTBOX#<strong>]</strong> to <strong>[</strong>#form.ALTERNATECONTACTRELATIONSHIPTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.BEDNUMBERTBOX") AND getIntake.BEDNUMBERTBOX NEQ form.BEDNUMBERTBOX>
			<cfset note = note & "BED NUMBER changed from <strong>[</strong>#getIntake.BEDNUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.BEDNUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERFNAMETBOX") AND getIntake.CALLERFNAMETBOX NEQ form.CALLERFNAMETBOX>
			<cfset note = note & "CALLER FIRST NAME changed from <strong>[</strong>#getIntake.CALLERFNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.CALLERFNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERMINITIALTBOX") AND getIntake.CALLERMINITIALTBOX NEQ form.CALLERMINITIALTBOX>
			<cfset note = note & "CALLER MIDDLE INITIAL changed from <strong>[</strong>#getIntake.CALLERMINITIALTBOX#<strong>]</strong> to <strong>[</strong>#form.CALLERMINITIALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERLNAMETBOX") AND getIntake.CALLERLNAMETBOX NEQ form.CALLERLNAMETBOX>
			<cfset note = note & "CALLER LAST NAME changed from <strong>[</strong>#getIntake.CALLERLNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.CALLERLNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CALLERPHONETBOX") AND getIntake.CALLERPHONETBOX NEQ request.cleanNumericString(form.CALLERPHONETBOX)>
			<cfset note = note & "CALLER PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.CALLERPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.CALLERPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CCDATEDD") AND getIntake.CCDATEDD NEQ form.CCDATEDD>
			<cfset note = note & "Credit Card DATE Day changed from <strong>[</strong>#getIntake.CCDATEDD#<strong>]</strong> to <strong>[</strong>#form.CCDATEDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CCDATEMM") AND getIntake.CCDATEMM NEQ form.CCDATEMM>
			<cfset note = note & "Credit Card DATE Month changed from <strong>[</strong>#getIntake.CCDATEMM#<strong>]</strong> to <strong>[</strong>#form.CCDATEMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CCDATEYY") AND getIntake.CCDATEYY NEQ form.CCDATEYY>
			<cfset note = note & "Credit Card DATE Year changed from <strong>[</strong>#getIntake.CCDATEYY#<strong>]</strong> to <strong>[</strong>#form.CCDATEYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CPAPSTUDYNOTE") AND getIntake.CPAPSTUDYNOTE NEQ form.CPAPSTUDYNOTE>
			<cfset note = note & "CPAP STUDY NOTE changed from <strong>[</strong>#getIntake.CPAPSTUDYNOTE#<strong>]</strong> to <strong>[</strong>#form.CPAPSTUDYNOTE#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CPAPSTUDYONFILENOTE") AND getIntake.CPAPSTUDYONFILENOTE NEQ form.CPAPSTUDYONFILENOTE>
			<cfset note = note & "CPAP STUDY ON FILE NOTE changed from <strong>[</strong>#getIntake.CPAPSTUDYONFILENOTE#<strong>]</strong> to <strong>[</strong>#form.CPAPSTUDYONFILENOTE#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CPAPSTUDYONFILE_CBOX") AND getIntake.CPAPSTUDYONFILE_CBOX NEQ form.CPAPSTUDYONFILE_CBOX>
			<cfset note = note & "CPAP STUDY ON FILE changed from <strong>[</strong>#getIntake.CPAPSTUDYONFILE_CBOX#<strong>]</strong> to <strong>[</strong>#form.CPAPSTUDYONFILE_CBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CPAPSTUDYPERFORMEDAT") AND getIntake.CPAPSTUDYPERFORMEDAT NEQ form.CPAPSTUDYPERFORMEDAT>
			<cfset note = note & "CPAP STUDY PERFORMED AT changed from <strong>[</strong>#getIntake.CPAPSTUDYPERFORMEDAT#<strong>]</strong> to <strong>[</strong>#form.CPAPSTUDYPERFORMEDAT#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CPAPSTUDYPERFORMEDAT2") AND getIntake.CPAPSTUDYPERFORMEDAT2 NEQ form.CPAPSTUDYPERFORMEDAT2>
			<cfset note = note & "CPAP STUDY PERFORMED AT 2 changed from <strong>[</strong>#getIntake.CPAPSTUDYPERFORMEDAT2#<strong>]</strong> to <strong>[</strong>#form.CPAPSTUDYPERFORMEDAT2#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CPAPSTUDYPERFORMEDAT3") AND getIntake.CPAPSTUDYPERFORMEDAT3 NEQ form.CPAPSTUDYPERFORMEDAT3>
			<cfset note = note & "CPAP STUDY PERFORMED AT 3 changed from <strong>[</strong>#getIntake.CPAPSTUDYPERFORMEDAT3#<strong>]</strong> to <strong>[</strong>#form.CPAPSTUDYPERFORMEDAT3#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CPAPSTUDY_CBOX") AND getIntake.CPAPSTUDY_CBOX NEQ form.CPAPSTUDY_CBOX>
			<cfset note = note & "CPAP STUDY changed from <strong>[</strong>#getIntake.CPAPSTUDY_CBOX#<strong>]</strong> to <strong>[</strong>#form.CPAPSTUDY_CBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CREDITCARDNUMBERTBOX") AND getIntake.CREDITCARDNUMBERTBOX NEQ form.CREDITCARDNUMBERTBOX>
			<cfset note = note & "CREDIT CARD NUMBER changed from <strong>[</strong>#getIntake.CREDITCARDNUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.CREDITCARDNUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.CREDITCARDTYPETBOX") AND getIntake.CREDITCARDTYPETBOX NEQ form.CREDITCARDTYPETBOX>
			<cfset note = note & "CREDIT CARD TYPE changed from <strong>[</strong>#getIntake.CREDITCARDTYPETBOX#<strong>]</strong> to <strong>[</strong>#form.CREDITCARDTYPETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.DISCHARGEDATEDD") AND getIntake.DISCHARGEDATEDD NEQ form.DISCHARGEDATEDD>
			<cfset note = note & "DISCHARGE DATE DAY changed from <strong>[</strong>#getIntake.DISCHARGEDATEDD#<strong>]</strong> to <strong>[</strong>#form.DISCHARGEDATEDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.DISCHARGEDATEMM") AND getIntake.DISCHARGEDATEMM NEQ form.DISCHARGEDATEMM>
			<cfset note = note & "DISCHARGE DATE MONTH changed from <strong>[</strong>#getIntake.DISCHARGEDATEMM#<strong>]</strong> to <strong>[</strong>#form.DISCHARGEDATEMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.DISCHARGEDATEYY") AND getIntake.DISCHARGEDATEYY NEQ form.DISCHARGEDATEYY>
			<cfset note = note & "DISCHARGE DATE YEAR changed from <strong>[</strong>#getIntake.DISCHARGEDATEYY#<strong>]</strong> to <strong>[</strong>#form.DISCHARGEDATEYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1FROMDD") AND getIntake.EQUIPMENT1FROMDD NEQ form.EQUIPMENT1FROMDD>
			<cfset note = note & "EQUIPMENT 1 FROM DAY changed from <strong>[</strong>#getIntake.EQUIPMENT1FROMDD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1FROMDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1FROMMM") AND getIntake.EQUIPMENT1FROMMM NEQ form.EQUIPMENT1FROMMM>
			<cfset note = note & "EQUIPMENT 1 FROM MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT1FROMMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1FROMMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1FROMYY") AND getIntake.EQUIPMENT1FROMYY NEQ form.EQUIPMENT1FROMYY>
			<cfset note = note & "EQUIPMENT 1 FROM YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT1FROMYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1FROMYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1RENTPURCHASEDSELECT") AND getIntake.EQUIPMENT1RENTPURCHASEDSELECT NEQ form.EQUIPMENT1RENTPURCHASEDSELECT>
			<cfset note = note & "EQUIPMENT 1 RENT PURCHASED SELECT changed from <strong>[</strong>#getIntake.EQUIPMENT1RENTPURCHASEDSELECT#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1RENTPURCHASEDSELECT#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1SUPPLIERNAMETBOX") AND getIntake.EQUIPMENT1SUPPLIERNAMETBOX NEQ form.EQUIPMENT1SUPPLIERNAMETBOX>
			<cfset note = note & "EQUIPMENT 1 SUPPLIER NAME changed from <strong>[</strong>#getIntake.EQUIPMENT1SUPPLIERNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1SUPPLIERNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1SUPPLIERTELEPHONETBOX") AND getIntake.EQUIPMENT1SUPPLIERTELEPHONETBOX NEQ request.cleanNumericString(form.EQUIPMENT1SUPPLIERTELEPHONETBOX)>
			<cfset note = note & "EQUIPMENT 1 SUPPLIER TELEPHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.EQUIPMENT1SUPPLIERTELEPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1SUPPLIERTELEPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1TODD") AND getIntake.EQUIPMENT1TODD NEQ form.EQUIPMENT1TODD>
			<cfset note = note & "EQUIPMENT 1 TO DAY changed from <strong>[</strong>#getIntake.EQUIPMENT1TODD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1TODD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1TOMM") AND getIntake.EQUIPMENT1TOMM NEQ form.EQUIPMENT1TOMM>
			<cfset note = note & "EQUIPMENT 1 TO MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT1TOMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1TOMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1TOYY") AND getIntake.EQUIPMENT1TOYY NEQ form.EQUIPMENT1TOYY>
			<cfset note = note & "EQUIPMENT 1 TO YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT1TOYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1TOYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1TYPETBOX") AND getIntake.EQUIPMENT1TYPETBOX NEQ form.EQUIPMENT1TYPETBOX>
			<cfset note = note & "EQUIPMENT 1 TYPE changed from <strong>[</strong>#getIntake.EQUIPMENT1TYPETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1TYPETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2FROMDD") AND getIntake.EQUIPMENT2FROMDD NEQ form.EQUIPMENT2FROMDD>
			<cfset note = note & "EQUIPMENT 2 FROM DAY changed from <strong>[</strong>#getIntake.EQUIPMENT2FROMDD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2FROMDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2FROMMM") AND getIntake.EQUIPMENT2FROMMM NEQ form.EQUIPMENT2FROMMM>
			<cfset note = note & "EQUIPMENT 2 FROM MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT2FROMMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2FROMMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2FROMYY") AND getIntake.EQUIPMENT2FROMYY NEQ form.EQUIPMENT2FROMYY>
			<cfset note = note & "EQUIPMENT 2 FROM YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT2FROMYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2FROMYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2RENTPURCHASEDSELECT") AND getIntake.EQUIPMENT2RENTPURCHASEDSELECT NEQ form.EQUIPMENT2RENTPURCHASEDSELECT>
			<cfset note = note & "EQUIPMENT 2 RENT PURCHASED SELECT changed from <strong>[</strong>#getIntake.EQUIPMENT2RENTPURCHASEDSELECT#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2RENTPURCHASEDSELECT#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2SUPPLIERNAMETBOX") AND getIntake.EQUIPMENT2SUPPLIERNAMETBOX NEQ form.EQUIPMENT2SUPPLIERNAMETBOX>
			<cfset note = note & "EQUIPMENT 2 SUPPLIER NAME changed from <strong>[</strong>#getIntake.EQUIPMENT2SUPPLIERNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2SUPPLIERNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2SUPPLIERTELEPHONETBOX") AND getIntake.EQUIPMENT2SUPPLIERTELEPHONETBOX NEQ request.cleanNumericString(form.EQUIPMENT2SUPPLIERTELEPHONETBOX)>
			<cfset note = note & "EQUIPMENT 2 SUPPLIER TELEPHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.EQUIPMENT2SUPPLIERTELEPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2SUPPLIERTELEPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2TODD") AND getIntake.EQUIPMENT2TODD NEQ form.EQUIPMENT2TODD>
			<cfset note = note & "EQUIPMENT 2 TO DAY changed from <strong>[</strong>#getIntake.EQUIPMENT2TODD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2TODD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2TOMM") AND getIntake.EQUIPMENT2TOMM NEQ form.EQUIPMENT2TOMM>
			<cfset note = note & "EQUIPMENT 2 TO MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT2TOMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2TOMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2TOYY") AND getIntake.EQUIPMENT2TOYY NEQ form.EQUIPMENT2TOYY>
			<cfset note = note & "EQUIPMENT 2 TO YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT2TOYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2TOYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2TYPETBOX") AND getIntake.EQUIPMENT2TYPETBOX NEQ form.EQUIPMENT2TYPETBOX>
			<cfset note = note & "EQUIPMENT 2 TYPE changed from <strong>[</strong>#getIntake.EQUIPMENT2TYPETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2TYPETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3FROMDD") AND getIntake.EQUIPMENT3FROMDD NEQ form.EQUIPMENT3FROMDD>
			<cfset note = note & "EQUIPMENT 3 FROM DAY changed from <strong>[</strong>#getIntake.EQUIPMENT3FROMDD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3FROMDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3FROMMM") AND getIntake.EQUIPMENT3FROMMM NEQ form.EQUIPMENT3FROMMM>
			<cfset note = note & "EQUIPMENT 3 FROM MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT3FROMMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3FROMMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3FROMYY") AND getIntake.EQUIPMENT3FROMYY NEQ form.EQUIPMENT3FROMYY>
			<cfset note = note & "EQUIPMENT 3 FROM YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT3FROMYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3FROMYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3RENTPURCHASEDSELECT") AND getIntake.EQUIPMENT3RENTPURCHASEDSELECT NEQ form.EQUIPMENT3RENTPURCHASEDSELECT>
			<cfset note = note & "EQUIPMENT 3 RENT PURCHASED SELECT changed from <strong>[</strong>#getIntake.EQUIPMENT3RENTPURCHASEDSELECT#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3RENTPURCHASEDSELECT#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3SUPPLIERNAMETBOX") AND getIntake.EQUIPMENT3SUPPLIERNAMETBOX NEQ form.EQUIPMENT3SUPPLIERNAMETBOX>
			<cfset note = note & "EQUIPMENT 3 SUPPLIER NAME changed from <strong>[</strong>#getIntake.EQUIPMENT3SUPPLIERNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3SUPPLIERNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3SUPPLIERTELEPHONETBOX") AND getIntake.EQUIPMENT3SUPPLIERTELEPHONETBOX NEQ request.cleanNumericString(form.EQUIPMENT3SUPPLIERTELEPHONETBOX)>
			<cfset note = note & "EQUIPMENT 3 SUPPLIER TELEPHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.EQUIPMENT3SUPPLIERTELEPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3SUPPLIERTELEPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3TODD") AND getIntake.EQUIPMENT3TODD NEQ form.EQUIPMENT3TODD>
			<cfset note = note & "EQUIPMENT 3 TO DAY changed from <strong>[</strong>#getIntake.EQUIPMENT3TODD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3TODD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3TOMM") AND getIntake.EQUIPMENT3TOMM NEQ form.EQUIPMENT3TOMM>
			<cfset note = note & "EQUIPMENT 3 TO MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT3TOMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3TOMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3TOYY") AND getIntake.EQUIPMENT3TOYY NEQ form.EQUIPMENT3TOYY>
			<cfset note = note & "EQUIPMENT 3 TO YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT3TOYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3TOYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3TYPETBOX") AND getIntake.EQUIPMENT3TYPETBOX NEQ form.EQUIPMENT3TYPETBOX>
			<cfset note = note & "EQUIPMENT 3 TYPE changed from <strong>[</strong>#getIntake.EQUIPMENT3TYPETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3TYPETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4FROMDD") AND getIntake.EQUIPMENT4FROMDD NEQ form.EQUIPMENT4FROMDD>
			<cfset note = note & "EQUIPMENT 4 FROM DAY changed from <strong>[</strong>#getIntake.EQUIPMENT4FROMDD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4FROMDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4FROMMM") AND getIntake.EQUIPMENT4FROMMM NEQ form.EQUIPMENT4FROMMM>
			<cfset note = note & "EQUIPMENT 4 FROM MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT4FROMMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4FROMMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4FROMYY") AND getIntake.EQUIPMENT4FROMYY NEQ form.EQUIPMENT4FROMYY>
			<cfset note = note & "EQUIPMENT 4 FROM YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT4FROMYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4FROMYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4RENTPURCHASEDSELECT") AND getIntake.EQUIPMENT4RENTPURCHASEDSELECT NEQ form.EQUIPMENT4RENTPURCHASEDSELECT>
			<cfset note = note & "EQUIPMENT 4 RENT PURCHASED SELECT changed from <strong>[</strong>#getIntake.EQUIPMENT4RENTPURCHASEDSELECT#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4RENTPURCHASEDSELECT#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4SUPPLIERNAMETBOX") AND getIntake.EQUIPMENT4SUPPLIERNAMETBOX NEQ form.EQUIPMENT4SUPPLIERNAMETBOX>
			<cfset note = note & "EQUIPMENT 4 SUPPLIER NAME changed from <strong>[</strong>#getIntake.EQUIPMENT4SUPPLIERNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4SUPPLIERNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4SUPPLIERTELEPHONETBOX") AND getIntake.EQUIPMENT4SUPPLIERTELEPHONETBOX NEQ request.cleanNumericString(form.EQUIPMENT4SUPPLIERTELEPHONETBOX)>
			<cfset note = note & "EQUIPMENT 4 SUPPLIER TELEPHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.EQUIPMENT4SUPPLIERTELEPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4SUPPLIERTELEPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4TODD") AND getIntake.EQUIPMENT4TODD NEQ form.EQUIPMENT4TODD>
			<cfset note = note & "EQUIPMENT 4 TO DAY changed from <strong>[</strong>#getIntake.EQUIPMENT4TODD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4TODD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4TOMM") AND getIntake.EQUIPMENT4TOMM NEQ form.EQUIPMENT4TOMM>
			<cfset note = note & "EQUIPMENT 4 TO MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT4TOMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4TOMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4TOYY") AND getIntake.EQUIPMENT4TOYY NEQ form.EQUIPMENT4TOYY>
			<cfset note = note & "EQUIPMENT 4 TO YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT4TOYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4TOYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4TYPETBOX") AND getIntake.EQUIPMENT4TYPETBOX NEQ form.EQUIPMENT4TYPETBOX>
			<cfset note = note & "EQUIPMENT 4 TYPE changed from <strong>[</strong>#getIntake.EQUIPMENT4TYPETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4TYPETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5FROMDD") AND getIntake.EQUIPMENT5FROMDD NEQ form.EQUIPMENT5FROMDD>
			<cfset note = note & "EQUIPMENT 5 FROM DAY changed from <strong>[</strong>#getIntake.EQUIPMENT5FROMDD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5FROMDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5FROMMM") AND getIntake.EQUIPMENT5FROMMM NEQ form.EQUIPMENT5FROMMM>
			<cfset note = note & "EQUIPMENT 5 FROM MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT5FROMMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5FROMMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5FROMYY") AND getIntake.EQUIPMENT5FROMYY NEQ form.EQUIPMENT5FROMYY>
			<cfset note = note & "EQUIPMENT 5 FROM YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT5FROMYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5FROMYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5RENTPURCHASEDSELECT") AND getIntake.EQUIPMENT5RENTPURCHASEDSELECT NEQ form.EQUIPMENT5RENTPURCHASEDSELECT>
			<cfset note = note & "EQUIPMENT 5 RENT PURCHASED SELECT changed from <strong>[</strong>#getIntake.EQUIPMENT5RENTPURCHASEDSELECT#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5RENTPURCHASEDSELECT#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5SUPPLIERNAMETBOX") AND getIntake.EQUIPMENT5SUPPLIERNAMETBOX NEQ form.EQUIPMENT5SUPPLIERNAMETBOX>
			<cfset note = note & "EQUIPMENT 5 SUPPLIER NAME changed from <strong>[</strong>#getIntake.EQUIPMENT5SUPPLIERNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5SUPPLIERNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5SUPPLIERTELEPHONETBOX") AND getIntake.EQUIPMENT5SUPPLIERTELEPHONETBOX NEQ request.cleanNumericString(form.EQUIPMENT5SUPPLIERTELEPHONETBOX)>
			<cfset note = note & "EQUIPMENT 5 SUPPLIER TELEPHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.EQUIPMENT5SUPPLIERTELEPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5SUPPLIERTELEPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5TODD") AND getIntake.EQUIPMENT5TODD NEQ form.EQUIPMENT5TODD>
			<cfset note = note & "EQUIPMENT 5 TO DAY changed from <strong>[</strong>#getIntake.EQUIPMENT5TODD#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5TODD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5TOMM") AND getIntake.EQUIPMENT5TOMM NEQ form.EQUIPMENT5TOMM>
			<cfset note = note & "EQUIPMENT 5 TO MONTH changed from <strong>[</strong>#getIntake.EQUIPMENT5TOMM#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5TOMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5TOYY") AND getIntake.EQUIPMENT5TOYY NEQ form.EQUIPMENT5TOYY>
			<cfset note = note & "EQUIPMENT 5 TO YEAR changed from <strong>[</strong>#getIntake.EQUIPMENT5TOYY#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5TOYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5TYPETBOX") AND getIntake.EQUIPMENT5TYPETBOX NEQ form.EQUIPMENT5TYPETBOX>
			<cfset note = note & "EQUIPMENT 5 TYPE changed from <strong>[</strong>#getIntake.EQUIPMENT5TYPETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5TYPETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT1NOTETBOX") AND getIntake.EQUIPMENT1NOTETBOX NEQ form.EQUIPMENT1NOTETBOX>
			<cfset note = note & "EQUIPMENT 1 NOTE changed from <strong>[</strong>#getIntake.EQUIPMENT1NOTETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT1NOTETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT2NOTETBOX") AND getIntake.EQUIPMENT2NOTETBOX NEQ form.EQUIPMENT2NOTETBOX>
			<cfset note = note & "EQUIPMENT 2 NOTE changed from <strong>[</strong>#getIntake.EQUIPMENT2NOTETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT2NOTETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT3NOTETBOX") AND getIntake.EQUIPMENT3NOTETBOX NEQ form.EQUIPMENT3NOTETBOX>
			<cfset note = note & "EQUIPMENT 3 NOTE changed from <strong>[</strong>#getIntake.EQUIPMENT3NOTETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT3NOTETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT4NOTETBOX") AND getIntake.EQUIPMENT4NOTETBOX NEQ form.EQUIPMENT4NOTETBOX>
			<cfset note = note & "EQUIPMENT 4 NOTE changed from <strong>[</strong>#getIntake.EQUIPMENT4NOTETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT4NOTETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.EQUIPMENT5NOTETBOX") AND getIntake.EQUIPMENT5NOTETBOX NEQ form.EQUIPMENT5NOTETBOX>
			<cfset note = note & "EQUIPMENT 5 NOTE changed from <strong>[</strong>#getIntake.EQUIPMENT5NOTETBOX#<strong>]</strong> to <strong>[</strong>#form.EQUIPMENT5NOTETBOX#<strong>]</strong><br>">
		</cfif>		
		<cfif IsDefined("form.HOSPICETBOX") AND getIntake.HOSPICETBOX NEQ form.HOSPICETBOX>
			<cfset note = note & "HOSPICE changed from <strong>[</strong>#getIntake.HOSPICETBOX#<strong>]</strong> to <strong>[</strong>#form.HOSPICETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HOSPITALTBOX") AND getIntake.HOSPITALTBOX NEQ form.HOSPITALTBOX>
			<cfset note = note & "HOSPITAL changed from <strong>[</strong>#getIntake.HOSPITALTBOX#<strong>]</strong> to <strong>[</strong>#form.HOSPITALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.LABTESTDATEDD") AND getIntake.LABTESTDATEDD NEQ form.LABTESTDATEDD>
			<cfset note = note & "LAB TEST DATE DAY changed from <strong>[</strong>#getIntake.LABTESTDATEDD#<strong>]</strong> to <strong>[</strong>#form.LABTESTDATEDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.LABTESTDATEMM") AND getIntake.LABTESTDATEMM NEQ form.LABTESTDATEMM>
			<cfset note = note & "LAB TEST DATE MONTH changed from <strong>[</strong>#getIntake.LABTESTDATEMM#<strong>]</strong> to <strong>[</strong>#form.LABTESTDATEMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.LABTESTDATEYY") AND getIntake.LABTESTDATEYY NEQ form.LABTESTDATEYY>
			<cfset note = note & "LAB TEST DATE YEAR changed from <strong>[</strong>#getIntake.LABTESTDATEYY#<strong>]</strong> to <strong>[</strong>#form.LABTESTDATEYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.LABTESTFACILITYTBOX") AND getIntake.LABTESTFACILITYTBOX NEQ form.LABTESTFACILITYTBOX>
			<cfset note = note & "LAB TEST FACILITY changed from <strong>[</strong>#getIntake.LABTESTFACILITYTBOX#<strong>]</strong> to <strong>[</strong>#form.LABTESTFACILITYTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_13_CBOX_PASTEQUIPMENTNO") AND getIntake.OPTION_13_CBOX_PASTEQUIPMENTNO NEQ form.OPTION_13_CBOX_PASTEQUIPMENTNO>
			<cfset note = note & "OPTION 13 PAST EQUIPMENT NO changed from <strong>[</strong>#getIntake.OPTION_13_CBOX_PASTEQUIPMENTNO#<strong>]</strong> to <strong>[</strong>#form.OPTION_13_CBOX_PASTEQUIPMENTNO#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_13_CBOX_PASTEQUIPMENTYES") AND getIntake.OPTION_13_CBOX_PASTEQUIPMENTYES NEQ form.OPTION_13_CBOX_PASTEQUIPMENTYES>
			<cfset note = note & "OPTION 13 PAST EQUIPMENT YES changed from <strong>[</strong>#getIntake.OPTION_13_CBOX_PASTEQUIPMENTYES#<strong>]</strong> to <strong>[</strong>#form.OPTION_13_CBOX_PASTEQUIPMENTYES#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_14_CBOX_OXYGENPAO2") AND getIntake.OPTION_14_CBOX_OXYGENPAO2 NEQ form.OPTION_14_CBOX_OXYGENPAO2>
			<cfset note = note & "OPTION 14 OXYGEN PAO2 changed from <strong>[</strong>#getIntake.OPTION_14_CBOX_OXYGENPAO2#<strong>]</strong> to <strong>[</strong>#form.OPTION_14_CBOX_OXYGENPAO2#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_14_CBOX_OXYGENSAO2") AND getIntake.OPTION_14_CBOX_OXYGENSAO2 NEQ form.OPTION_14_CBOX_OXYGENSAO2>
			<cfset note = note & "OPTION 14 OXYGEN SAO2 changed from <strong>[</strong>#getIntake.OPTION_14_CBOX_OXYGENSAO2#<strong>]</strong> to <strong>[</strong>#form.OPTION_14_CBOX_OXYGENSAO2#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_14_CBOX_OXYGENSPO2") AND getIntake.OPTION_14_CBOX_OXYGENSPO2 NEQ form.OPTION_14_CBOX_OXYGENSPO2>
			<cfset note = note & "OPTION 14 OXYGEN SPO2 changed from <strong>[</strong>#getIntake.OPTION_14_CBOX_OXYGENSPO2#<strong>]</strong> to <strong>[</strong>#form.OPTION_14_CBOX_OXYGENSPO2#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_1_CBOX_DELIVERY") AND getIntake.OPTION_1_CBOX_DELIVERY NEQ form.OPTION_1_CBOX_DELIVERY>
			<cfset note = note & "OPTION 1 DELIVERY changed from <strong>[</strong>#getIntake.OPTION_1_CBOX_DELIVERY#<strong>]</strong> to <strong>[</strong>#form.OPTION_1_CBOX_DELIVERY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_1_CBOX_EXISTING") AND getIntake.OPTION_1_CBOX_EXISTING NEQ form.OPTION_1_CBOX_EXISTING>
			<cfset note = note & "OPTION 1 EXISTING changed from <strong>[</strong>#getIntake.OPTION_1_CBOX_EXISTING#<strong>]</strong> to <strong>[</strong>#form.OPTION_1_CBOX_EXISTING#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_1_CBOX_PICKUP") AND getIntake.OPTION_1_CBOX_PICKUP NEQ form.OPTION_1_CBOX_PICKUP>
			<cfset note = note & "OPTION 1 PICKUP changed from <strong>[</strong>#getIntake.OPTION_1_CBOX_PICKUP#<strong>]</strong> to <strong>[</strong>#form.OPTION_1_CBOX_PICKUP#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_1_CBOX_REPAIR") AND getIntake.OPTION_1_CBOX_REPAIR NEQ form.OPTION_1_CBOX_REPAIR>
			<cfset note = note & "OPTION 1 REPAIR changed from <strong>[</strong>#getIntake.OPTION_1_CBOX_REPAIR#<strong>]</strong> to <strong>[</strong>#form.OPTION_1_CBOX_REPAIR#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_1_CBOX_SWITCH") AND getIntake.OPTION_1_CBOX_SWITCH NEQ form.OPTION_1_CBOX_SWITCH>
			<cfset note = note & "OPTION 1 SWITCH changed from <strong>[</strong>#getIntake.OPTION_1_CBOX_SWITCH#<strong>]</strong> to <strong>[</strong>#form.OPTION_1_CBOX_SWITCH#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_2_CBox_Other") AND getIntake.OPTION_2_CBox_Other NEQ form.OPTION_2_CBox_Other>
			<cfset note = note & "OPTION 2 FACILITY changed from <strong>[</strong>#getIntake.OPTION_2_CBox_Other#<strong>]</strong> to <strong>[</strong>#form.OPTION_2_CBox_Other#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_2_CBOX_HOSPICE") AND getIntake.OPTION_2_CBOX_HOSPICE NEQ form.OPTION_2_CBOX_HOSPICE>
			<cfset note = note & "OPTION 2 HOSPICE changed from <strong>[</strong>#getIntake.OPTION_2_CBOX_HOSPICE#<strong>]</strong> to <strong>[</strong>#form.OPTION_2_CBOX_HOSPICE#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_2_CBOX_HOSPITAL") AND getIntake.OPTION_2_CBOX_HOSPITAL NEQ form.OPTION_2_CBOX_HOSPITAL>
			<cfset note = note & "OPTION 2 HOSPITAL changed from <strong>[</strong>#getIntake.OPTION_2_CBOX_HOSPITAL#<strong>]</strong> to <strong>[</strong>#form.OPTION_2_CBOX_HOSPITAL#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_3_CBOX_MEDICAID") AND getIntake.OPTION_3_CBOX_MEDICAID NEQ form.OPTION_3_CBOX_MEDICAID>
			<cfset note = note & "OPTION 3 MEDICAID changed from <strong>[</strong>#getIntake.OPTION_3_CBOX_MEDICAID#<strong>]</strong> to <strong>[</strong>#form.OPTION_3_CBOX_MEDICAID#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_3_CBOX_MEDICARE") AND getIntake.OPTION_3_CBOX_MEDICARE NEQ form.OPTION_3_CBOX_MEDICARE>
			<cfset note = note & "OPTION 3 MEDICARE changed from <strong>[</strong>#getIntake.OPTION_3_CBOX_MEDICARE#<strong>]</strong> to <strong>[</strong>#form.OPTION_3_CBOX_MEDICARE#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_3_CBOX_PRIVATEINSURANCE") AND getIntake.OPTION_3_CBOX_PRIVATEINSURANCE NEQ form.OPTION_3_CBOX_PRIVATEINSURANCE>
			<cfset note = note & "OPTION 3 PRIVATE INSURANCE changed from <strong>[</strong>#getIntake.OPTION_3_CBOX_PRIVATEINSURANCE#<strong>]</strong> to <strong>[</strong>#form.OPTION_3_CBOX_PRIVATEINSURANCE#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OPTION_3_CBOX_PRIVATEPAY") AND getIntake.OPTION_3_CBOX_PRIVATEPAY NEQ form.OPTION_3_CBOX_PRIVATEPAY>
			<cfset note = note & "OPTION 3 PRIVATE PAY changed from <strong>[</strong>#getIntake.OPTION_3_CBOX_PRIVATEPAY#<strong>]</strong> to <strong>[</strong>#form.OPTION_3_CBOX_PRIVATEPAY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANADDRESSTBOX") AND getIntake.ORDERINGPHYSICIANADDRESSTBOX NEQ form.ORDERINGPHYSICIANADDRESSTBOX>
			<cfset note = note & "ORDERING PHYSICIAN ADDRESS changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANADDRESSTBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANADDRESSTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANCITYTBOX") AND getIntake.ORDERINGPHYSICIANCITYTBOX NEQ form.ORDERINGPHYSICIANCITYTBOX>
			<cfset note = note & "ORDERING PHYSICIAN CITY changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANCITYTBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANCITYTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANFAXTBOX") AND getIntake.ORDERINGPHYSICIANFAXTBOX NEQ request.cleanNumericString(form.ORDERINGPHYSICIANFAXTBOX)>
			<cfset note = note & "ORDERING PHYSICIAN FAX changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.ORDERINGPHYSICIANFAXTBOX)#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANFAXTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANFNAMETBOX") AND getIntake.ORDERINGPHYSICIANFNAMETBOX NEQ form.ORDERINGPHYSICIANFNAMETBOX>
			<cfset note = note & "ORDERING PHYSICIAN FIRST NAME changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANFNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANFNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANMINITIALTBOX") AND getIntake.ORDERINGPHYSICIANMINITIALTBOX NEQ form.ORDERINGPHYSICIANMINITIALTBOX>
			<cfset note = note & "ORDERING PHYSICIAN MIDDLE INITIAL changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANMINITIALTBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANMINITIALTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANLNAMETBOX") AND getIntake.ORDERINGPHYSICIANLNAMETBOX NEQ form.ORDERINGPHYSICIANLNAMETBOX>
			<cfset note = note & "ORDERING PHYSICIAN LAST NAME changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANLNAMETBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANLNAMETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANPHONETBOX") AND getIntake.ORDERINGPHYSICIANPHONETBOX NEQ request.cleanNumericString(form.ORDERINGPHYSICIANPHONETBOX)>
			<cfset note = note & "ORDERING PHYSICIAN PHONE changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.ORDERINGPHYSICIANPHONETBOX)#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANPHONETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANSTATETBOX") AND getIntake.ORDERINGPHYSICIANSTATETBOX NEQ form.ORDERINGPHYSICIANSTATETBOX>
			<cfset note = note & "ORDERING PHYSICIAN STATE changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANSTATETBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANSTATETBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANUPINTBOX") AND getIntake.ORDERINGPHYSICIANUPINTBOX NEQ form.ORDERINGPHYSICIANUPINTBOX>
			<cfset note = note & "ORDERING PHYSICIAN UPIN changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANUPINTBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANUPINTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ORDERINGPHYSICIANZIPTBOX") AND getIntake.ORDERINGPHYSICIANZIPTBOX NEQ form.ORDERINGPHYSICIANZIPTBOX>
			<cfset note = note & "ORDERING PHYSICIAN ZIP changed from <strong>[</strong>#getIntake.ORDERINGPHYSICIANZIPTBOX#<strong>]</strong> to <strong>[</strong>#form.ORDERINGPHYSICIANZIPTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OXYGENPAO2TBOX") AND getIntake.OXYGENPAO2TBOX NEQ form.OXYGENPAO2TBOX>
			<cfset note = note & "OXYGEN PAO2 changed from <strong>[</strong>#getIntake.OXYGENPAO2TBOX#<strong>]</strong> to <strong>[</strong>#form.OXYGENPAO2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OXYGENSAO2TBOX") AND getIntake.OXYGENSAO2TBOX NEQ form.OXYGENSAO2TBOX>
			<cfset note = note & "OXYGEN SAO2 changed from <strong>[</strong>#getIntake.OXYGENSAO2TBOX#<strong>]</strong> to <strong>[</strong>#form.OXYGENSAO2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.OXYGENSPO2TBOX") AND getIntake.OXYGENSPO2TBOX NEQ form.OXYGENSPO2TBOX>
			<cfset note = note & "OXYGEN SPO2 changed from <strong>[</strong>#getIntake.OXYGENSPO2TBOX#<strong>]</strong> to <strong>[</strong>#form.OXYGENSPO2TBOX#<strong>]</strong><br>">
		</cfif>		
		<cfif IsDefined("form.PONUMBERTBOX") AND getIntake.PONUMBERTBOX NEQ form.PONUMBERTBOX>
			<cfset note = note & "PO NUMBER changed from <strong>[</strong>#getIntake.PONUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.PONUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.ROOMNUMBERTBOX") AND getIntake.ROOMNUMBERTBOX NEQ form.ROOMNUMBERTBOX>
			<cfset note = note & "ROOM NUMBER changed from <strong>[</strong>#getIntake.ROOMNUMBERTBOX#<strong>]</strong> to <strong>[</strong>#form.ROOMNUMBERTBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.TYPEOFPAY_RADIO") AND getIntake.TYPEOFPAY_RADIO NEQ form.TYPEOFPAY_RADIO>
			<cfset note = note & "TYPE OF PAY changed from <strong>[</strong>#getIntake.TYPEOFPAY_RADIO#<strong>]</strong> to <strong>[</strong>#form.TYPEOFPAY_RADIO#<strong>]</strong><br>">
		</cfif>
		<!---<cfif IsDefined("form.primaryInsuranceNameTBox") AND getIntake.primaryInsuranceNameTBox NEQ form.primaryInsuranceNameTBox>
			<cfset note = note & "PRIMARYINSURANCENAMETBOX changed from <strong>[</strong>#getIntake.primaryInsuranceNameTBox#<strong>]</strong> to <strong>[</strong>#form.primaryInsuranceNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryPolicyNumberTBox") AND getIntake.primaryPolicyNumberTBox NEQ form.primaryPolicyNumberTBox>
			<cfset note = note & "PRIMARYPolicyNumberTBox changed from <strong>[</strong>#getIntake.primaryPolicyNumberTBox#<strong>]</strong> to <strong>[</strong>#form.primaryPolicyNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryGroupNumberTBox") AND getIntake.primaryGroupNumberTBox NEQ form.primaryGroupNumberTBox>
			<cfset note = note & "PRIMARYGroupNumberTBox changed from <strong>[</strong>#getIntake.primaryGroupNumberTBox#<strong>]</strong> to <strong>[</strong>#form.primaryGroupNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryPhoneNumberTBox") AND getIntake.primaryPhoneNumberTBox NEQ request.cleanNumericString(form.primaryPhoneNumberTBox)>
			<cfset note = note & "PRIMARYPhoneNumberTBox changed from <strong>[</strong>#getIntake.primaryPhoneNumberTBox#<strong>]</strong> to <strong>[</strong>#form.primaryPhoneNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryEffectiveDateMM") AND getIntake.primaryEffectiveDateMM NEQ form.primaryEffectiveDateMM>
			<cfset note = note & "PRIMARYEFFECTIVEDATEMM changed from <strong>[</strong>#getIntake.primaryEffectiveDateMM#<strong>]</strong> to <strong>[</strong>#form.primaryEffectiveDateMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryEffectiveDateDD") AND getIntake.primaryEffectiveDateDD NEQ form.primaryEffectiveDateDD>
			<cfset note = note & "PRIMARYEFFECTIVEDATEDD changed from <strong>[</strong>#getIntake.primaryEffectiveDateDD#<strong>]</strong> to <strong>[</strong>#form.primaryEffectiveDateDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryEffectiveDateYY") AND getIntake.primaryEffectiveDateYY NEQ form.primaryEffectiveDateYY>
			<cfset note = note & "PRIMARYEFFECTIVEDATEYY changed from <strong>[</strong>#getIntake.primaryEffectiveDateYY#<strong>]</strong> to <strong>[</strong>#form.primaryEffectiveDateYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryPolicyHolderFNameTBox") AND getIntake.primaryPolicyHolderFNameTBox NEQ form.primaryPolicyHolderFNameTBox>
			<cfset note = note & "PRIMARYPOLICYHOLDERFNAMETBOX changed from <strong>[</strong>#getIntake.primaryPolicyHolderFNameTBox#<strong>]</strong> to <strong>[</strong>#form.primaryPolicyHolderFNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryPolicyHolderMInitialTBox") AND getIntake.primaryPolicyHolderMInitialTBox NEQ form.primaryPolicyHolderMInitialTBox>
			<cfset note = note & "PRIMARYPOLICYHOLDERMINITIALTBOX changed from <strong>[</strong>#getIntake.primaryPolicyHolderMInitialTBox#<strong>]</strong> to <strong>[</strong>#form.primaryPolicyHolderMInitialTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryPolicyHolderLNameTBox") AND getIntake.primaryPolicyHolderLNameTBox NEQ form.primaryPolicyHolderLNameTBox>
			<cfset note = note & "PRIMARYPOLICYHOLDERLNAMETBOX changed from <strong>[</strong>#getIntake.primaryPolicyHolderLNameTBox#<strong>]</strong> to <strong>[</strong>#form.primaryPolicyHolderLNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryHoldersDOBMM") AND getIntake.primaryHoldersDOBMM NEQ form.primaryHoldersDOBMM>
			<cfset note = note & "PRIMARYHOLDERSDOBMM changed from <strong>[</strong>#getIntake.primaryHoldersDOBMM#<strong>]</strong> to <strong>[</strong>#form.primaryHoldersDOBMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryHoldersDOBDD") AND getIntake.primaryHoldersDOBDD NEQ form.primaryHoldersDOBDD>
			<cfset note = note & "PRIMARYHOLDERSDOBDD changed from <strong>[</strong>#getIntake.primaryHoldersDOBDD#<strong>]</strong> to <strong>[</strong>#form.primaryHoldersDOBDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryHoldersDOBYY") AND getIntake.primaryHoldersDOBYY NEQ form.primaryHoldersDOBYY>
			<cfset note = note & "PRIMARYHOLDERSDOBYY changed from <strong>[</strong>#getIntake.primaryHoldersDOBYY#<strong>]</strong> to <strong>[</strong>#form.primaryHoldersDOBYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryPolicyHolderEmployerTBox") AND getIntake.primaryPolicyHolderEmployerTBox NEQ form.primaryPolicyHolderEmployerTBox>
			<cfset note = note & "PRIMARYPOLICYHOLDEREMPLOYERTBOX changed from <strong>[</strong>#getIntake.primaryPolicyHolderEmployerTBox#<strong>]</strong> to <strong>[</strong>#form.primaryPolicyHolderEmployerTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryNoteTBox") AND getIntake.primaryNoteTBox NEQ form.primaryNoteTBox>
			<cfset note = note & "PRIMARYNOTETBOX changed from <strong>[</strong>#getIntake.primaryNoteTBox#<strong>]</strong> to <strong>[</strong>#form.primaryNoteTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationRepFNameTBox") AND getIntake.primaryVerificationRepFNameTBox NEQ form.primaryVerificationRepFNameTBox>
			<cfset note = note & "PRIMARYVERIFICATIONREPFNAMETBOX changed from <strong>[</strong>#getIntake.primaryVerificationRepFNameTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationRepFNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationRepLNameTBox") AND getIntake.primaryVerificationRepLNameTBox NEQ form.primaryVerificationRepLNameTBox>
			<cfset note = note & "PRIMARYVERIFICATIONREPLNAMETBOX changed from <strong>[</strong>#getIntake.primaryVerificationRepLNameTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationRepLNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationDateMM") AND getIntake.primaryVerificationDateMM NEQ form.primaryVerificationDateMM>
			<cfset note = note & "PRIMARYVERIFICATIONDATEMM changed from <strong>[</strong>#getIntake.primaryVerificationDateMM#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationDateMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationDateDD") AND getIntake.primaryVerificationDateDD NEQ form.primaryVerificationDateDD>
			<cfset note = note & "PRIMARYVERIFICATIONDATEDD changed from <strong>[</strong>#getIntake.primaryVerificationDateDD#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationDateDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationDateYY") AND getIntake.primaryVerificationDateYY NEQ form.primaryVerificationDateYY>
			<cfset note = note & "PRIMARYVERIFICATIONDATEYY changed from <strong>[</strong>#getIntake.primaryVerificationDateYY#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationDateYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationTimeTBox") AND getIntake.primaryVerificationTimeTBox NEQ form.primaryVerificationTimeTBox>
			<cfset note = note & "PRIMARYVERIFICATIONTIMETBOX changed from <strong>[</strong>#getIntake.primaryVerificationTimeTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationTimeTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationHaveInsFromMM") AND getIntake.primaryVerificationHaveInsFromMM NEQ form.primaryVerificationHaveInsFromMM>
			<cfset note = note & "PRIMARYVERIFICATIONHAVEINSFROMMM changed from <strong>[</strong>#getIntake.primaryVerificationHaveInsFromMM#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationHaveInsFromMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationHaveInsFromDD") AND getIntake.primaryVerificationHaveInsFromDD NEQ form.primaryVerificationHaveInsFromDD>
			<cfset note = note & "PRIMARYVERIFICATIONHAVEINSFROMDD changed from <strong>[</strong>#getIntake.primaryVerificationHaveInsFromDD#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationHaveInsFromDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationHaveInsFromYY") AND getIntake.primaryVerificationHaveInsFromYY NEQ form.primaryVerificationHaveInsFromYY>
			<cfset note = note & "PRIMARYVERIFICATIONHAVEINSFROMYY changed from <strong>[</strong>#getIntake.primaryVerificationHaveInsFromYY#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationHaveInsFromYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationHaveInsToMM") AND getIntake.primaryVerificationHaveInsToMM NEQ form.primaryVerificationHaveInsToMM>
			<cfset note = note & "PRIMARYVERIFICATIONHAVEINSTOMM changed from <strong>[</strong>#getIntake.primaryVerificationHaveInsToMM#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationHaveInsToMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationHaveInsToDD") AND getIntake.primaryVerificationHaveInsToDD NEQ form.primaryVerificationHaveInsToDD>
			<cfset note = note & "PRIMARYVERIFICATIONHAVEINSTODD changed from <strong>[</strong>#getIntake.primaryVerificationHaveInsToDD#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationHaveInsToDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationHaveInsToYY") AND getIntake.primaryVerificationHaveInsToYY NEQ form.primaryVerificationHaveInsToYY>
			<cfset note = note & "PRIMARYVERIFICATIONHAVEINSTOYY changed from <strong>[</strong>#getIntake.primaryVerificationHaveInsToYY#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationHaveInsToYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationHaveInsYes") AND getIntake.primaryCBox_VerificationHaveInsYes NEQ form.primaryCBox_VerificationHaveInsYes>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONHAVEINSYES changed from <strong>[</strong>#getIntake.primaryCBox_VerificationHaveInsYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationHaveInsYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationHaveInsNo") AND getIntake.primaryCBox_VerificationHaveInsNo NEQ form.primaryCBox_VerificationHaveInsNo>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONHAVEINSNO changed from <strong>[</strong>#getIntake.primaryCBox_VerificationHaveInsNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationHaveInsNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationHaveDMECovYes") AND getIntake.primaryCBox_VerificationHaveDMECovYes NEQ form.primaryCBox_VerificationHaveDMECovYes>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONHAVEDMECOVYES changed from <strong>[</strong>#getIntake.primaryCBox_VerificationHaveDMECovYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationHaveDMECovYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationHaveDMECovNo") AND getIntake.primaryCBox_VerificationHaveDMECovNo NEQ form.primaryCBox_VerificationHaveDMECovNo>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONHAVEDMECOVNO changed from <strong>[</strong>#getIntake.primaryCBox_VerificationHaveDMECovNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationHaveDMECovNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationDeductibleYes") AND getIntake.primaryCBox_VerificationDeductibleYes NEQ form.primaryCBox_VerificationDeductibleYes>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONDEDUCTIBLEYES changed from <strong>[</strong>#getIntake.primaryCBox_VerificationDeductibleYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationDeductibleYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationDeductibleNo") AND getIntake.primaryCBox_VerificationDeductibleNo NEQ form.primaryCBox_VerificationDeductibleNo>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONDEDUCTIBLENO changed from <strong>[</strong>#getIntake.primaryCBox_VerificationDeductibleNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationDeductibleNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationDeductibleAmountTBox") AND getIntake.primaryVerificationDeductibleAmountTBox NEQ form.primaryVerificationDeductibleAmountTBox>
			<cfset note = note & "PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX changed from <strong>[</strong>#getIntake.primaryVerificationDeductibleAmountTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationDeductibleAmountTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationDeductibleAmountMetTBox") AND getIntake.primaryVerificationDeductibleAmountMetTBox NEQ form.primaryVerificationDeductibleAmountMetTBox>
			<cfset note = note & "PRIMARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX changed from <strong>[</strong>#getIntake.primaryVerificationDeductibleAmountMetTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationDeductibleAmountMetTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationPercentagePayAfterDeductibleTBox") AND getIntake.primaryVerificationPercentagePayAfterDeductibleTBox NEQ form.primaryVerificationPercentagePayAfterDeductibleTBox>
			<cfset note = note & "PRIMARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX changed from <strong>[</strong>#getIntake.primaryVerificationPercentagePayAfterDeductibleTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationPercentagePayAfterDeductibleTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationPPOPolicyYes") AND getIntake.primaryCBox_VerificationPPOPolicyYes NEQ form.primaryCBox_VerificationPPOPolicyYes>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONPPOPOLICYYES changed from <strong>[</strong>#getIntake.primaryCBox_VerificationPPOPolicyYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationPPOPolicyYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationPPOPolicyNo") AND getIntake.primaryCBox_VerificationPPOPolicyNo NEQ form.primaryCBox_VerificationPPOPolicyNo>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONPPOPOLICYNO changed from <strong>[</strong>#getIntake.primaryCBox_VerificationPPOPolicyNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationPPOPolicyNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationAuthNumberTBox") AND getIntake.primaryVerificationAuthNumberTBox NEQ form.primaryVerificationAuthNumberTBox>
			<cfset note = note & "PRIMARYVERIFICATIONAUTHNUMBERTBOX changed from <strong>[</strong>#getIntake.primaryVerificationAuthNumberTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationAuthNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationPriorAuthYes") AND getIntake.primaryCBox_VerificationPriorAuthYes NEQ form.primaryCBox_VerificationPriorAuthYes>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONPRIORAUTHYES changed from <strong>[</strong>#getIntake.primaryCBox_VerificationPriorAuthYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationPriorAuthYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationPriorAuthNo") AND getIntake.primaryCBox_VerificationPriorAuthNo NEQ form.primaryCBox_VerificationPriorAuthNo>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONPRIORAUTHNO changed from <strong>[</strong>#getIntake.primaryCBox_VerificationPriorAuthNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationPriorAuthNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationAuthPhoneNumberTBox") AND getIntake.primaryVerificationAuthPhoneNumberTBox NEQ request.cleanNumericString(form.primaryVerificationAuthPhoneNumberTBox)>
			<cfset note = note & "PRIMARYVERIFICATIONAUTHPHONENUMBERTBOX changed from <strong>[</strong>#getIntake.primaryVerificationAuthPhoneNumberTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationAuthPhoneNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationLifetimeBenefitMetYes") AND getIntake.primaryCBox_VerificationLifetimeBenefitMetYes NEQ form.primaryCBox_VerificationLifetimeBenefitMetYes>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES changed from <strong>[</strong>#getIntake.primaryCBox_VerificationLifetimeBenefitMetYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationLifetimeBenefitMetYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationLifetimeBenefitMetNo") AND getIntake.primaryCBox_VerificationLifetimeBenefitMetNo NEQ form.primaryCBox_VerificationLifetimeBenefitMetNo>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO changed from <strong>[</strong>#getIntake.primaryCBox_VerificationLifetimeBenefitMetNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationLifetimeBenefitMetNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_MedicareSupplementYes") AND getIntake.primaryCBox_MedicareSupplementYes NEQ form.primaryCBox_MedicareSupplementYes>
			<cfset note = note & "PRIMARYCBOX_MEDICARESUPPLEMENTYES changed from <strong>[</strong>#getIntake.primaryCBox_MedicareSupplementYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_MedicareSupplementYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_MedicareSupplementNo") AND getIntake.primaryCBox_MedicareSupplementNo NEQ form.primaryCBox_MedicareSupplementNo>
			<cfset note = note & "PRIMARYCBOX_MEDICARESUPPLEMENTNO changed from <strong>[</strong>#getIntake.primaryCBox_MedicareSupplementNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_MedicareSupplementNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_CoordinateBenefitsYes") AND getIntake.primaryCBox_CoordinateBenefitsYes NEQ form.primaryCBox_CoordinateBenefitsYes>
			<cfset note = note & "PRIMARYCBOX_COORDINATEBENEFITSYES changed from <strong>[</strong>#getIntake.primaryCBox_CoordinateBenefitsYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_CoordinateBenefitsYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_CoordinateBenefitsNo") AND getIntake.primaryCBox_CoordinateBenefitsNo NEQ form.primaryCBox_CoordinateBenefitsNo>
			<cfset note = note & "PRIMARYCBOX_COORDINATEBENEFITSNO changed from <strong>[</strong>#getIntake.primaryCBox_CoordinateBenefitsNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_CoordinateBenefitsNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_PaidMedicareDeductibleYes") AND getIntake.primaryCBox_PaidMedicareDeductibleYes NEQ form.primaryCBox_PaidMedicareDeductibleYes>
			<cfset note = note & "PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLEYES changed from <strong>[</strong>#getIntake.primaryCBox_PaidMedicareDeductibleYes#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_PaidMedicareDeductibleYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_PaidMedicareDeductibleNo") AND getIntake.primaryCBox_PaidMedicareDeductibleNo NEQ form.primaryCBox_PaidMedicareDeductibleNo>
			<cfset note = note & "PRIMARYCBOX_PAIDMEDICAREDEDUCTIBLENO changed from <strong>[</strong>#getIntake.primaryCBox_PaidMedicareDeductibleNo#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_PaidMedicareDeductibleNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryVerificationTypeBasePlanTBox") AND getIntake.primaryVerificationTypeBasePlanTBox NEQ form.primaryVerificationTypeBasePlanTBox>
			<cfset note = note & "PRIMARYVERIFICATIONTYPEBASEPLANTBOX changed from <strong>[</strong>#getIntake.primaryVerificationTypeBasePlanTBox#<strong>]</strong> to <strong>[</strong>#form.primaryVerificationTypeBasePlanTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationMedicaidPlanMQMB") AND getIntake.primaryCBox_VerificationMedicaidPlanMQMB NEQ form.primaryCBox_VerificationMedicaidPlanMQMB>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONMEDICAIDPLANMQMB changed from <strong>[</strong>#getIntake.primaryCBox_VerificationMedicaidPlanMQMB#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationMedicaidPlanMQMB#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationMedicaidPlanQMB") AND getIntake.primaryCBox_VerificationMedicaidPlanQMB NEQ form.primaryCBox_VerificationMedicaidPlanQMB>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONMEDICAIDPLANQMB changed from <strong>[</strong>#getIntake.primaryCBox_VerificationMedicaidPlanQMB#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationMedicaidPlanQMB#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryCBox_VerificationMedicaidPlanTraditional") AND getIntake.primaryCBox_VerificationMedicaidPlanTraditional NEQ form.primaryCBox_VerificationMedicaidPlanTraditional>
			<cfset note = note & "PRIMARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL changed from <strong>[</strong>#getIntake.primaryCBox_VerificationMedicaidPlanTraditional#<strong>]</strong> to <strong>[</strong>#form.primaryCBox_VerificationMedicaidPlanTraditional#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryInsuranceNameTBox") AND getIntake.secondaryInsuranceNameTBox NEQ form.secondaryInsuranceNameTBox>
			<cfset note = note & "SECONDARYINSURANCENAMETBOX changed from <strong>[</strong>#getIntake.secondaryInsuranceNameTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryInsuranceNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryPolicyNumberTBox") AND getIntake.secondaryPolicyNumberTBox NEQ form.secondaryPolicyNumberTBox>
			<cfset note = note & "SECONDARYPolicyNumberTBox changed from <strong>[</strong>#getIntake.secondaryPolicyNumberTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryPolicyNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryGroupNumberTBox") AND getIntake.secondaryGroupNumberTBox NEQ form.secondaryGroupNumberTBox>
			<cfset note = note & "SECONDARYGroupNumberTBox changed from <strong>[</strong>#getIntake.secondaryGroupNumberTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryGroupNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryPhoneNumberTBox") AND getIntake.secondaryPhoneNumberTBox NEQ request.cleanNumericString(form.secondaryPhoneNumberTBox)>
			<cfset note = note & "SECONDARYPhoneNumberTBox changed from <strong>[</strong>#getIntake.secondaryPhoneNumberTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryPhoneNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryEffectiveDateMM") AND getIntake.secondaryEffectiveDateMM NEQ form.secondaryEffectiveDateMM>
			<cfset note = note & "SECONDARYEFFECTIVEDATEMM changed from <strong>[</strong>#getIntake.secondaryEffectiveDateMM#<strong>]</strong> to <strong>[</strong>#form.secondaryEffectiveDateMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryEffectiveDateDD") AND getIntake.secondaryEffectiveDateDD NEQ form.secondaryEffectiveDateDD>
			<cfset note = note & "SECONDARYEFFECTIVEDATEDD changed from <strong>[</strong>#getIntake.secondaryEffectiveDateDD#<strong>]</strong> to <strong>[</strong>#form.secondaryEffectiveDateDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryEffectiveDateYY") AND getIntake.secondaryEffectiveDateYY NEQ form.secondaryEffectiveDateYY>
			<cfset note = note & "SECONDARYEFFECTIVEDATEYY changed from <strong>[</strong>#getIntake.secondaryEffectiveDateYY#<strong>]</strong> to <strong>[</strong>#form.secondaryEffectiveDateYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryPolicyHolderFNameTBox") AND getIntake.secondaryPolicyHolderFNameTBox NEQ form.secondaryPolicyHolderFNameTBox>
			<cfset note = note & "SECONDARYPOLICYHOLDERFNAMETBOX changed from <strong>[</strong>#getIntake.secondaryPolicyHolderFNameTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryPolicyHolderFNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryPolicyHolderMInitialTBox") AND getIntake.secondaryPolicyHolderMInitialTBox NEQ form.secondaryPolicyHolderMInitialTBox>
			<cfset note = note & "SECONDARYPOLICYHOLDERMINITIALTBOX changed from <strong>[</strong>#getIntake.secondaryPolicyHolderMInitialTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryPolicyHolderMInitialTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryPolicyHolderLNameTBox") AND getIntake.secondaryPolicyHolderLNameTBox NEQ form.secondaryPolicyHolderLNameTBox>
			<cfset note = note & "SECONDARYPOLICYHOLDERLNAMETBOX changed from <strong>[</strong>#getIntake.secondaryPolicyHolderLNameTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryPolicyHolderLNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryHoldersDOBMM") AND getIntake.secondaryHoldersDOBMM NEQ form.secondaryHoldersDOBMM>
			<cfset note = note & "SECONDARYHOLDERSDOBMM changed from <strong>[</strong>#getIntake.secondaryHoldersDOBMM#<strong>]</strong> to <strong>[</strong>#form.secondaryHoldersDOBMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryHoldersDOBDD") AND getIntake.secondaryHoldersDOBDD NEQ form.secondaryHoldersDOBDD>
			<cfset note = note & "SECONDARYHOLDERSDOBDD changed from <strong>[</strong>#getIntake.secondaryHoldersDOBDD#<strong>]</strong> to <strong>[</strong>#form.secondaryHoldersDOBDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryHoldersDOBYY") AND getIntake.secondaryHoldersDOBYY NEQ form.secondaryHoldersDOBYY>
			<cfset note = note & "SECONDARYHOLDERSDOBYY changed from <strong>[</strong>#getIntake.secondaryHoldersDOBYY#<strong>]</strong> to <strong>[</strong>#form.secondaryHoldersDOBYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryPolicyHolderEmployerTBox") AND getIntake.secondaryPolicyHolderEmployerTBox NEQ form.secondaryPolicyHolderEmployerTBox>
			<cfset note = note & "SECONDARYPOLICYHOLDEREMPLOYERTBOX changed from <strong>[</strong>#getIntake.secondaryPolicyHolderEmployerTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryPolicyHolderEmployerTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryNoteTBox") AND getIntake.secondaryNoteTBox NEQ form.secondaryNoteTBox>
			<cfset note = note & "SECONDARYNOTETBOX changed from <strong>[</strong>#getIntake.secondaryNoteTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryNoteTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationRepFNameTBox") AND getIntake.secondaryVerificationRepFNameTBox NEQ form.secondaryVerificationRepFNameTBox>
			<cfset note = note & "SECONDARYVERIFICATIONREPFNAMETBOX changed from <strong>[</strong>#getIntake.secondaryVerificationRepFNameTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationRepFNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationRepLNameTBox") AND getIntake.secondaryVerificationRepLNameTBox NEQ form.secondaryVerificationRepLNameTBox>
			<cfset note = note & "SECONDARYVERIFICATIONREPLNAMETBOX changed from <strong>[</strong>#getIntake.secondaryVerificationRepLNameTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationRepLNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationDateMM") AND getIntake.secondaryVerificationDateMM NEQ form.secondaryVerificationDateMM>
			<cfset note = note & "SECONDARYVERIFICATIONDATEMM changed from <strong>[</strong>#getIntake.secondaryVerificationDateMM#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationDateMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationDateDD") AND getIntake.secondaryVerificationDateDD NEQ form.secondaryVerificationDateDD>
			<cfset note = note & "SECONDARYVERIFICATIONDATEDD changed from <strong>[</strong>#getIntake.secondaryVerificationDateDD#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationDateDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationDateYY") AND getIntake.secondaryVerificationDateYY NEQ form.secondaryVerificationDateYY>
			<cfset note = note & "SECONDARYVERIFICATIONDATEYY changed from <strong>[</strong>#getIntake.secondaryVerificationDateYY#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationDateYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationTimeTBox") AND getIntake.secondaryVerificationTimeTBox NEQ form.secondaryVerificationTimeTBox>
			<cfset note = note & "SECONDARYVERIFICATIONTIMETBOX changed from <strong>[</strong>#getIntake.secondaryVerificationTimeTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationTimeTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationHaveInsFromMM") AND getIntake.secondaryVerificationHaveInsFromMM NEQ form.secondaryVerificationHaveInsFromMM>
			<cfset note = note & "SECONDARYVERIFICATIONHAVEINSFROMMM changed from <strong>[</strong>#getIntake.secondaryVerificationHaveInsFromMM#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationHaveInsFromMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationHaveInsFromDD") AND getIntake.secondaryVerificationHaveInsFromDD NEQ form.secondaryVerificationHaveInsFromDD>
			<cfset note = note & "SECONDARYVERIFICATIONHAVEINSFROMDD changed from <strong>[</strong>#getIntake.secondaryVerificationHaveInsFromDD#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationHaveInsFromDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationHaveInsFromYY") AND getIntake.secondaryVerificationHaveInsFromYY NEQ form.secondaryVerificationHaveInsFromYY>
			<cfset note = note & "SECONDARYVERIFICATIONHAVEINSFROMYY changed from <strong>[</strong>#getIntake.secondaryVerificationHaveInsFromYY#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationHaveInsFromYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationHaveInsToMM") AND getIntake.secondaryVerificationHaveInsToMM NEQ form.secondaryVerificationHaveInsToMM>
			<cfset note = note & "SECONDARYVERIFICATIONHAVEINSTOMM changed from <strong>[</strong>#getIntake.secondaryVerificationHaveInsToMM#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationHaveInsToMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationHaveInsToDD") AND getIntake.secondaryVerificationHaveInsToDD NEQ form.secondaryVerificationHaveInsToDD>
			<cfset note = note & "SECONDARYVERIFICATIONHAVEINSTODD changed from <strong>[</strong>#getIntake.secondaryVerificationHaveInsToDD#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationHaveInsToDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationHaveInsToYY") AND getIntake.secondaryVerificationHaveInsToYY NEQ form.secondaryVerificationHaveInsToYY>
			<cfset note = note & "SECONDARYVERIFICATIONHAVEINSTOYY changed from <strong>[</strong>#getIntake.secondaryVerificationHaveInsToYY#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationHaveInsToYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationHaveInsYes") AND getIntake.secondaryCBox_VerificationHaveInsYes NEQ form.secondaryCBox_VerificationHaveInsYes>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONHAVEINSYES changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationHaveInsYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationHaveInsYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationHaveInsNo") AND getIntake.secondaryCBox_VerificationHaveInsNo NEQ form.secondaryCBox_VerificationHaveInsNo>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONHAVEINSNO changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationHaveInsNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationHaveInsNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationHaveDMECovYes") AND getIntake.secondaryCBox_VerificationHaveDMECovYes NEQ form.secondaryCBox_VerificationHaveDMECovYes>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONHAVEDMECOVYES changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationHaveDMECovYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationHaveDMECovYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationHaveDMECovNo") AND getIntake.secondaryCBox_VerificationHaveDMECovNo NEQ form.secondaryCBox_VerificationHaveDMECovNo>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONHAVEDMECOVNO changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationHaveDMECovNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationHaveDMECovNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationDeductibleYes") AND getIntake.secondaryCBox_VerificationDeductibleYes NEQ form.secondaryCBox_VerificationDeductibleYes>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONDEDUCTIBLEYES changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationDeductibleYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationDeductibleYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationDeductibleNo") AND getIntake.secondaryCBox_VerificationDeductibleNo NEQ form.secondaryCBox_VerificationDeductibleNo>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONDEDUCTIBLENO changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationDeductibleNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationDeductibleNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationDeductibleAmountTBox") AND getIntake.secondaryVerificationDeductibleAmountTBox NEQ form.secondaryVerificationDeductibleAmountTBox>
			<cfset note = note & "SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTTBOX changed from <strong>[</strong>#getIntake.secondaryVerificationDeductibleAmountTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationDeductibleAmountTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationDeductibleAmountMetTBox") AND getIntake.secondaryVerificationDeductibleAmountMetTBox NEQ form.secondaryVerificationDeductibleAmountMetTBox>
			<cfset note = note & "SECONDARYVERIFICATIONDEDUCTIBLEAMOUNTMETTBOX changed from <strong>[</strong>#getIntake.secondaryVerificationDeductibleAmountMetTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationDeductibleAmountMetTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationPercentagePayAfterDeductibleTBox") AND getIntake.secondaryVerificationPercentagePayAfterDeductibleTBox NEQ form.secondaryVerificationPercentagePayAfterDeductibleTBox>
			<cfset note = note & "SECONDARYVERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX changed from <strong>[</strong>#getIntake.secondaryVerificationPercentagePayAfterDeductibleTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationPercentagePayAfterDeductibleTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationPPOPolicyYes") AND getIntake.secondaryCBox_VerificationPPOPolicyYes NEQ form.secondaryCBox_VerificationPPOPolicyYes>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONPPOPOLICYYES changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationPPOPolicyYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationPPOPolicyYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationPPOPolicyNo") AND getIntake.secondaryCBox_VerificationPPOPolicyNo NEQ form.secondaryCBox_VerificationPPOPolicyNo>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONPPOPOLICYNO changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationPPOPolicyNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationPPOPolicyNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationAuthNumberTBox") AND getIntake.secondaryVerificationAuthNumberTBox NEQ form.secondaryVerificationAuthNumberTBox>
			<cfset note = note & "SECONDARYVERIFICATIONAUTHNUMBERTBOX changed from <strong>[</strong>#getIntake.secondaryVerificationAuthNumberTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationAuthNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationPriorAuthYes") AND getIntake.secondaryCBox_VerificationPriorAuthYes NEQ form.secondaryCBox_VerificationPriorAuthYes>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONPRIORAUTHYES changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationPriorAuthYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationPriorAuthYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationPriorAuthNo") AND getIntake.secondaryCBox_VerificationPriorAuthNo NEQ form.secondaryCBox_VerificationPriorAuthNo>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONPRIORAUTHNO changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationPriorAuthNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationPriorAuthNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationAuthPhoneNumberTBox") AND getIntake.secondaryVerificationAuthPhoneNumberTBox NEQ request.cleanNumericString(form.secondaryVerificationAuthPhoneNumberTBox)>
			<cfset note = note & "SECONDARYVERIFICATIONAUTHPHONENUMBERTBOX changed from <strong>[</strong>#getIntake.secondaryVerificationAuthPhoneNumberTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationAuthPhoneNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationLifetimeBenefitMetYes") AND getIntake.secondaryCBox_VerificationLifetimeBenefitMetYes NEQ form.secondaryCBox_VerificationLifetimeBenefitMetYes>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETYES changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationLifetimeBenefitMetYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationLifetimeBenefitMetYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationLifetimeBenefitMetNo") AND getIntake.secondaryCBox_VerificationLifetimeBenefitMetNo NEQ form.secondaryCBox_VerificationLifetimeBenefitMetNo>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONLIFETIMEBENEFITMETNO changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationLifetimeBenefitMetNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationLifetimeBenefitMetNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_MedicareSupplementYes") AND getIntake.secondaryCBox_MedicareSupplementYes NEQ form.secondaryCBox_MedicareSupplementYes>
			<cfset note = note & "SECONDARYCBOX_MEDICARESUPPLEMENTYES changed from <strong>[</strong>#getIntake.secondaryCBox_MedicareSupplementYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_MedicareSupplementYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_MedicareSupplementNo") AND getIntake.secondaryCBox_MedicareSupplementNo NEQ form.secondaryCBox_MedicareSupplementNo>
			<cfset note = note & "SECONDARYCBOX_MEDICARESUPPLEMENTNO changed from <strong>[</strong>#getIntake.secondaryCBox_MedicareSupplementNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_MedicareSupplementNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_CoordinateBenefitsYes") AND getIntake.secondaryCBox_CoordinateBenefitsYes NEQ form.secondaryCBox_CoordinateBenefitsYes>
			<cfset note = note & "SECONDARYCBOX_COORDINATEBENEFITSYES changed from <strong>[</strong>#getIntake.secondaryCBox_CoordinateBenefitsYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_CoordinateBenefitsYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_CoordinateBenefitsNo") AND getIntake.secondaryCBox_CoordinateBenefitsNo NEQ form.secondaryCBox_CoordinateBenefitsNo>
			<cfset note = note & "SECONDARYCBOX_COORDINATEBENEFITSNO changed from <strong>[</strong>#getIntake.secondaryCBox_CoordinateBenefitsNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_CoordinateBenefitsNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_PaidMedicareDeductibleYes") AND getIntake.secondaryCBox_PaidMedicareDeductibleYes NEQ form.secondaryCBox_PaidMedicareDeductibleYes>
			<cfset note = note & "SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLEYES changed from <strong>[</strong>#getIntake.secondaryCBox_PaidMedicareDeductibleYes#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_PaidMedicareDeductibleYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_PaidMedicareDeductibleNo") AND getIntake.secondaryCBox_PaidMedicareDeductibleNo NEQ form.secondaryCBox_PaidMedicareDeductibleNo>
			<cfset note = note & "SECONDARYCBOX_PAIDMEDICAREDEDUCTIBLENO changed from <strong>[</strong>#getIntake.secondaryCBox_PaidMedicareDeductibleNo#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_PaidMedicareDeductibleNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryVerificationTypeBasePlanTBox") AND getIntake.secondaryVerificationTypeBasePlanTBox NEQ form.secondaryVerificationTypeBasePlanTBox>
			<cfset note = note & "SECONDARYVERIFICATIONTYPEBASEPLANTBOX changed from <strong>[</strong>#getIntake.secondaryVerificationTypeBasePlanTBox#<strong>]</strong> to <strong>[</strong>#form.secondaryVerificationTypeBasePlanTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationMedicaidPlanMQMB") AND getIntake.secondaryCBox_VerificationMedicaidPlanMQMB NEQ form.secondaryCBox_VerificationMedicaidPlanMQMB>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONMEDICAIDPLANMQMB changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationMedicaidPlanMQMB#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationMedicaidPlanMQMB#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationMedicaidPlanQMB") AND getIntake.secondaryCBox_VerificationMedicaidPlanQMB NEQ form.secondaryCBox_VerificationMedicaidPlanQMB>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONMEDICAIDPLANQMB changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationMedicaidPlanQMB#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationMedicaidPlanQMB#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryCBox_VerificationMedicaidPlanTraditional") AND getIntake.secondaryCBox_VerificationMedicaidPlanTraditional NEQ form.secondaryCBox_VerificationMedicaidPlanTraditional>
			<cfset note = note & "SECONDARYCBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL changed from <strong>[</strong>#getIntake.secondaryCBox_VerificationMedicaidPlanTraditional#<strong>]</strong> to <strong>[</strong>#form.secondaryCBox_VerificationMedicaidPlanTraditional#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryInsuranceNameTBox") AND getIntake.tertiaryInsuranceNameTBox NEQ form.tertiaryInsuranceNameTBox>
			<cfset note = note & "TERTIARY INSURANCE NAME changed from <strong>[</strong>#getIntake.tertiaryInsuranceNameTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryInsuranceNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryPolicyNumberTBox") AND getIntake.tertiaryPolicyNumberTBox NEQ form.tertiaryPolicyNumberTBox>
			<cfset note = note & "TERTIARY POLICY NUMBER changed from <strong>[</strong>#getIntake.tertiaryPolicyNumberTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryPolicyNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryGroupNumberTBox") AND getIntake.tertiaryGroupNumberTBox NEQ form.tertiaryGroupNumberTBox>
			<cfset note = note & "TERTIARY GROUP NUMBER changed from <strong>[</strong>#getIntake.tertiaryGroupNumberTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryGroupNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryPhoneNumberTBox") AND getIntake.tertiaryPhoneNumberTBox NEQ request.cleanNumericString(form.tertiaryPhoneNumberTBox)>
			<cfset note = note & "TERTIARY PHONE NUMBER changed from <strong>[</strong>#getIntake.tertiaryPhoneNumberTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryPhoneNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryEffectiveDateMM") AND getIntake.tertiaryEffectiveDateMM NEQ form.tertiaryEffectiveDateMM>
			<cfset note = note & "TERTIARY EFFECTIVE DATE MM changed from <strong>[</strong>#getIntake.tertiaryEffectiveDateMM#<strong>]</strong> to <strong>[</strong>#form.tertiaryEffectiveDateMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryEffectiveDateDD") AND getIntake.tertiaryEffectiveDateDD NEQ form.tertiaryEffectiveDateDD>
			<cfset note = note & "TERTIARY EFFECTIVE DATE DD changed from <strong>[</strong>#getIntake.tertiaryEffectiveDateDD#<strong>]</strong> to <strong>[</strong>#form.tertiaryEffectiveDateDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryEffectiveDateYY") AND getIntake.tertiaryEffectiveDateYY NEQ form.tertiaryEffectiveDateYY>
			<cfset note = note & "TERTIARY EFFECTIVE DATE YY changed from <strong>[</strong>#getIntake.tertiaryEffectiveDateYY#<strong>]</strong> to <strong>[</strong>#form.tertiaryEffectiveDateYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryPolicyHolderFNameTBox") AND getIntake.tertiaryPolicyHolderFNameTBox NEQ form.tertiaryPolicyHolderFNameTBox>
			<cfset note = note & "TERTIARY POLICY HOLDER FNAME changed from <strong>[</strong>#getIntake.tertiaryPolicyHolderFNameTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryPolicyHolderFNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryPolicyHolderMInitialTBox") AND getIntake.tertiaryPolicyHolderMInitialTBox NEQ form.tertiaryPolicyHolderMInitialTBox>
			<cfset note = note & "TERTIARY POLICY HOLDER M INITIAL changed from <strong>[</strong>#getIntake.tertiaryPolicyHolderMInitialTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryPolicyHolderMInitialTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryPolicyHolderLNameTBox") AND getIntake.tertiaryPolicyHolderLNameTBox NEQ form.tertiaryPolicyHolderLNameTBox>
			<cfset note = note & "TERTIARY POLICY HOLDER LNAME changed from <strong>[</strong>#getIntake.tertiaryPolicyHolderLNameTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryPolicyHolderLNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryHoldersDOBMM") AND getIntake.tertiaryHoldersDOBMM NEQ form.tertiaryHoldersDOBMM>
			<cfset note = note & "TERTIARY HOLDERS DOB MM changed from <strong>[</strong>#getIntake.tertiaryHoldersDOBMM#<strong>]</strong> to <strong>[</strong>#form.tertiaryHoldersDOBMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryHoldersDOBDD") AND getIntake.tertiaryHoldersDOBDD NEQ form.tertiaryHoldersDOBDD>
			<cfset note = note & "TERTIARY HOLDERS DOB DD changed from <strong>[</strong>#getIntake.tertiaryHoldersDOBDD#<strong>]</strong> to <strong>[</strong>#form.tertiaryHoldersDOBDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryHoldersDOBYY") AND getIntake.tertiaryHoldersDOBYY NEQ form.tertiaryHoldersDOBYY>
			<cfset note = note & "TERTIARY HOLDERS DOB YY changed from <strong>[</strong>#getIntake.tertiaryHoldersDOBYY#<strong>]</strong> to <strong>[</strong>#form.tertiaryHoldersDOBYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryPolicyHolderEmployerTBox") AND getIntake.tertiaryPolicyHolderEmployerTBox NEQ form.tertiaryPolicyHolderEmployerTBox>
			<cfset note = note & "TERTIARY POLICYHOLDER EMPLOYER changed from <strong>[</strong>#getIntake.tertiaryPolicyHolderEmployerTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryPolicyHolderEmployerTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryNoteTBox") AND getIntake.tertiaryNoteTBox NEQ form.tertiaryNoteTBox>
			<cfset note = note & "TERTIARY NOTE changed from <strong>[</strong>#getIntake.tertiaryNoteTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryNoteTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationRepFNameTBox") AND getIntake.tertiaryVerificationRepFNameTBox NEQ form.tertiaryVerificationRepFNameTBox>
			<cfset note = note & "TERTIARY VERIFICATION REP FNAME changed from <strong>[</strong>#getIntake.tertiaryVerificationRepFNameTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationRepFNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationRepLNameTBox") AND getIntake.tertiaryVerificationRepLNameTBox NEQ form.tertiaryVerificationRepLNameTBox>
			<cfset note = note & "TERTIARY VERIFICATION REP LNAME changed from <strong>[</strong>#getIntake.tertiaryVerificationRepLNameTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationRepLNameTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationDateMM") AND getIntake.tertiaryVerificationDateMM NEQ form.tertiaryVerificationDateMM>
			<cfset note = note & "TERTIARY VERIFICATION DATE MM changed from <strong>[</strong>#getIntake.tertiaryVerificationDateMM#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationDateMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationDateDD") AND getIntake.tertiaryVerificationDateDD NEQ form.tertiaryVerificationDateDD>
			<cfset note = note & "TERTIARY VERIFICATION DATE DD changed from <strong>[</strong>#getIntake.tertiaryVerificationDateDD#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationDateDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationDateYY") AND getIntake.tertiaryVerificationDateYY NEQ form.tertiaryVerificationDateYY>
			<cfset note = note & "TERTIARY VERIFICATION DATE YY changed from <strong>[</strong>#getIntake.tertiaryVerificationDateYY#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationDateYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationTimeTBox") AND getIntake.tertiaryVerificationTimeTBox NEQ form.tertiaryVerificationTimeTBox>
			<cfset note = note & "TERTIARY VERIFICATION TIME changed from <strong>[</strong>#getIntake.tertiaryVerificationTimeTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationTimeTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationHaveInsFromMM") AND getIntake.tertiaryVerificationHaveInsFromMM NEQ form.tertiaryVerificationHaveInsFromMM>
			<cfset note = note & "TERTIARY VERIFICATION HAVE INS FROM MM changed from <strong>[</strong>#getIntake.tertiaryVerificationHaveInsFromMM#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationHaveInsFromMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationHaveInsFromDD") AND getIntake.tertiaryVerificationHaveInsFromDD NEQ form.tertiaryVerificationHaveInsFromDD>
			<cfset note = note & "TERTIARYVERIFICATIONHAVEINSFROMDD changed from <strong>[</strong>#getIntake.tertiaryVerificationHaveInsFromDD#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationHaveInsFromDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationHaveInsFromYY") AND getIntake.tertiaryVerificationHaveInsFromYY NEQ form.tertiaryVerificationHaveInsFromYY>
			<cfset note = note & "TERTIARY VERIFICATION HAVE INS FROM YY changed from <strong>[</strong>#getIntake.tertiaryVerificationHaveInsFromYY#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationHaveInsFromYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationHaveInsToMM") AND getIntake.tertiaryVerificationHaveInsToMM NEQ form.tertiaryVerificationHaveInsToMM>
			<cfset note = note & "TERTIARY VERIFICATION HAVE INS TO MM changed from <strong>[</strong>#getIntake.tertiaryVerificationHaveInsToMM#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationHaveInsToMM#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationHaveInsToDD") AND getIntake.tertiaryVerificationHaveInsToDD NEQ form.tertiaryVerificationHaveInsToDD>
			<cfset note = note & "TERTIARY VERIFICATION HAVE INS TO DD changed from <strong>[</strong>#getIntake.tertiaryVerificationHaveInsToDD#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationHaveInsToDD#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationHaveInsToYY") AND getIntake.tertiaryVerificationHaveInsToYY NEQ form.tertiaryVerificationHaveInsToYY>
			<cfset note = note & "TERTIARY VERIFICATION HAVE INS TO YY changed from <strong>[</strong>#getIntake.tertiaryVerificationHaveInsToYY#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationHaveInsToYY#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationHaveInsYes") AND getIntake.tertiaryCBox_VerificationHaveInsYes NEQ form.tertiaryCBox_VerificationHaveInsYes>
			<cfset note = note & "TERTIARY VERIFICATION HAVE INS YES changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationHaveInsYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationHaveInsYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationHaveInsNo") AND getIntake.tertiaryCBox_VerificationHaveInsNo NEQ form.tertiaryCBox_VerificationHaveInsNo>
			<cfset note = note & "TERTIARY VERIFICATION HAVE INS NO changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationHaveInsNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationHaveInsNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationHaveDMECovYes") AND getIntake.tertiaryCBox_VerificationHaveDMECovYes NEQ form.tertiaryCBox_VerificationHaveDMECovYes>
			<cfset note = note & "TERTIARY VERIFICATION HAVE DME COV YES changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationHaveDMECovYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationHaveDMECovYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationHaveDMECovNo") AND getIntake.tertiaryCBox_VerificationHaveDMECovNo NEQ form.tertiaryCBox_VerificationHaveDMECovNo>
			<cfset note = note & "TERTIARY VERIFICATION HAVE DME COV NO changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationHaveDMECovNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationHaveDMECovNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationDeductibleYes") AND getIntake.tertiaryCBox_VerificationDeductibleYes NEQ form.tertiaryCBox_VerificationDeductibleYes>
			<cfset note = note & "TERTIARY VERIFICATION DEDUCTIBLE YES changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationDeductibleYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationDeductibleYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationDeductibleNo") AND getIntake.tertiaryCBox_VerificationDeductibleNo NEQ form.tertiaryCBox_VerificationDeductibleNo>
			<cfset note = note & "TERTIARY VERIFICATION DEDUCTIBLE NO changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationDeductibleNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationDeductibleNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationDeductibleAmountTBox") AND getIntake.tertiaryVerificationDeductibleAmountTBox NEQ form.tertiaryVerificationDeductibleAmountTBox>
			<cfset note = note & "TERTIARY VERIFICATION DEDUCTIBLE AMOUNT changed from <strong>[</strong>#getIntake.tertiaryVerificationDeductibleAmountTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationDeductibleAmountTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationDeductibleAmountMetTBox") AND getIntake.tertiaryVerificationDeductibleAmountMetTBox NEQ form.tertiaryVerificationDeductibleAmountMetTBox>
			<cfset note = note & "TERTIARY VERIFICATION DEDUCTIBLE AMOUNT MET changed from <strong>[</strong>#getIntake.tertiaryVerificationDeductibleAmountMetTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationDeductibleAmountMetTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationPercentagePayAfterDeductibleTBox") AND getIntake.tertiaryVerificationPercentagePayAfterDeductibleTBox NEQ form.tertiaryVerificationPercentagePayAfterDeductibleTBox>
			<cfset note = note & "TERTIARY VERIFICATION PERCENTAGE PAY AFTER DEDUCTIBLE changed from <strong>[</strong>#getIntake.tertiaryVerificationPercentagePayAfterDeductibleTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationPercentagePayAfterDeductibleTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationPPOPolicyYes") AND getIntake.tertiaryCBox_VerificationPPOPolicyYes NEQ form.tertiaryCBox_VerificationPPOPolicyYes>
			<cfset note = note & "TERTIARY VERIFICATION PPO POLICY YES changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationPPOPolicyYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationPPOPolicyYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationPPOPolicyNo") AND getIntake.tertiaryCBox_VerificationPPOPolicyNo NEQ form.tertiaryCBox_VerificationPPOPolicyNo>
			<cfset note = note & "TERTIARY VERIFICATION PPO POLICY NO changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationPPOPolicyNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationPPOPolicyNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationAuthNumberTBox") AND getIntake.tertiaryVerificationAuthNumberTBox NEQ form.tertiaryVerificationAuthNumberTBox>
			<cfset note = note & "TERTIARY VERIFICATION AUTH NUMBER changed from <strong>[</strong>#getIntake.tertiaryVerificationAuthNumberTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationAuthNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationPriorAuthYes") AND getIntake.tertiaryCBox_VerificationPriorAuthYes NEQ form.tertiaryCBox_VerificationPriorAuthYes>
			<cfset note = note & "TERTIARY VERIFICATION PRIOR AUTH YES changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationPriorAuthYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationPriorAuthYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationPriorAuthNo") AND getIntake.tertiaryCBox_VerificationPriorAuthNo NEQ form.tertiaryCBox_VerificationPriorAuthNo>
			<cfset note = note & "TERTIARY VERIFICATION PRIOR AUTH NO changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationPriorAuthNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationPriorAuthNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationAuthPhoneNumberTBox") AND getIntake.tertiaryVerificationAuthPhoneNumberTBox NEQ request.cleanNumericString(form.tertiaryVerificationAuthPhoneNumberTBox)>
			<cfset note = note & "TERTIARY VERIFICATION AUTH PHONE NUMBER changed from <strong>[</strong>#getIntake.tertiaryVerificationAuthPhoneNumberTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationAuthPhoneNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationLifetimeBenefitMetYes") AND getIntake.tertiaryCBox_VerificationLifetimeBenefitMetYes NEQ form.tertiaryCBox_VerificationLifetimeBenefitMetYes>
			<cfset note = note & "TERTIARY VERIFICATION LIFETIME BENEFIT MET YES changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationLifetimeBenefitMetYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationLifetimeBenefitMetYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationLifetimeBenefitMetNo") AND getIntake.tertiaryCBox_VerificationLifetimeBenefitMetNo NEQ form.tertiaryCBox_VerificationLifetimeBenefitMetNo>
			<cfset note = note & "TERTIARY VERIFICATION LIFETIME BENEFIT MET NO changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationLifetimeBenefitMetNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationLifetimeBenefitMetNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_MedicareSupplementYes") AND getIntake.tertiaryCBox_MedicareSupplementYes NEQ form.tertiaryCBox_MedicareSupplementYes>
			<cfset note = note & "TERTIARY MEDICARE SUPPLEMENT YES changed from <strong>[</strong>#getIntake.tertiaryCBox_MedicareSupplementYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_MedicareSupplementYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_MedicareSupplementNo") AND getIntake.tertiaryCBox_MedicareSupplementNo NEQ form.tertiaryCBox_MedicareSupplementNo>
			<cfset note = note & "TERTIARY MEDICARE SUPPLEMENT NO changed from <strong>[</strong>#getIntake.tertiaryCBox_MedicareSupplementNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_MedicareSupplementNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_CoordinateBenefitsYes") AND getIntake.tertiaryCBox_CoordinateBenefitsYes NEQ form.tertiaryCBox_CoordinateBenefitsYes>
			<cfset note = note & "TERTIARY COORDINATE BENEFITS YES changed from <strong>[</strong>#getIntake.tertiaryCBox_CoordinateBenefitsYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_CoordinateBenefitsYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_CoordinateBenefitsNo") AND getIntake.tertiaryCBox_CoordinateBenefitsNo NEQ form.tertiaryCBox_CoordinateBenefitsNo>
			<cfset note = note & "TERTIARY COORDINATE BENEFITS NO changed from <strong>[</strong>#getIntake.tertiaryCBox_CoordinateBenefitsNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_CoordinateBenefitsNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_PaidMedicareDeductibleYes") AND getIntake.tertiaryCBox_PaidMedicareDeductibleYes NEQ form.tertiaryCBox_PaidMedicareDeductibleYes>
			<cfset note = note & "TERTIARY PAIDMEDICARE DEDUCTIBLE YES changed from <strong>[</strong>#getIntake.tertiaryCBox_PaidMedicareDeductibleYes#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_PaidMedicareDeductibleYes#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_PaidMedicareDeductibleNo") AND getIntake.tertiaryCBox_PaidMedicareDeductibleNo NEQ form.tertiaryCBox_PaidMedicareDeductibleNo>
			<cfset note = note & "TERTIARY PAID MEDICARE DEDUCTIBLE NO changed from <strong>[</strong>#getIntake.tertiaryCBox_PaidMedicareDeductibleNo#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_PaidMedicareDeductibleNo#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryVerificationTypeBasePlanTBox") AND getIntake.tertiaryVerificationTypeBasePlanTBox NEQ form.tertiaryVerificationTypeBasePlanTBox>
			<cfset note = note & "TERTIARY VERIFICATION TYPE BASE PLAN changed from <strong>[</strong>#getIntake.tertiaryVerificationTypeBasePlanTBox#<strong>]</strong> to <strong>[</strong>#form.tertiaryVerificationTypeBasePlanTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationMedicaidPlanMQMB") AND getIntake.tertiaryCBox_VerificationMedicaidPlanMQMB NEQ form.tertiaryCBox_VerificationMedicaidPlanMQMB>
			<cfset note = note & "TERTIARY VERIFICATION MEDICAID PLAN MQMB changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationMedicaidPlanMQMB#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationMedicaidPlanMQMB#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationMedicaidPlanQMB") AND getIntake.tertiaryCBox_VerificationMedicaidPlanQMB NEQ form.tertiaryCBox_VerificationMedicaidPlanQMB>
			<cfset note = note & "TERTIARY VERIFICATION MEDICAID PLAN QMB changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationMedicaidPlanQMB#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationMedicaidPlanQMB#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryCBox_VerificationMedicaidPlanTraditional") AND getIntake.tertiaryCBox_VerificationMedicaidPlanTraditional NEQ form.tertiaryCBox_VerificationMedicaidPlanTraditional>
			<cfset note = note & "TERTIARY VERIFICATION MEDICAID PLAN TRADITIONAL changed from <strong>[</strong>#getIntake.tertiaryCBox_VerificationMedicaidPlanTraditional#<strong>]</strong> to <strong>[</strong>#form.tertiaryCBox_VerificationMedicaidPlanTraditional#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primaryFaxNumberTBox") AND getIntake.primaryFaxNumberTBox NEQ request.cleanNumericString(form.primaryFaxNumberTBox)>
			<cfset note = note & "Primary Fax Number changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.primaryFaxNumberTBox)#<strong>]</strong> to <strong>[</strong>#form.primaryFaxNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primarySendToAddress1TBox") AND getIntake.primarySendToAddress1TBox NEQ form.primarySendToAddress1TBox>
			<cfset note = note & "Primary Send To Address 1 TBox changed from <strong>[</strong>#getIntake.primarySendToAddress1TBox#<strong>]</strong> to <strong>[</strong>#form.primarySendToAddress1TBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primarySendToAddress2TBox") AND getIntake.primarySendToAddress2TBox NEQ form.primarySendToAddress2TBox>
			<cfset note = note & "Primary Send To Address 2 TBox changed from <strong>[</strong>#getIntake.primarySendToAddress2TBox#<strong>]</strong> to <strong>[</strong>#form.primarySendToAddress2TBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primarySendToCityTBox") AND getIntake.primarySendToCityTBox NEQ form.primarySendToCityTBox>
			<cfset note = note & "Primary Send To City changed from <strong>[</strong>#getIntake.primarySendToCityTBox#<strong>]</strong> to <strong>[</strong>#form.primarySendToCityTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primarySendToStateTBox") AND getIntake.primarySendToStateTBox NEQ form.primarySendToStateTBox>
			<cfset note = note & "Primary Send To State changed from <strong>[</strong>#getIntake.primarySendToStateTBox#<strong>]</strong> to <strong>[</strong>#form.primarySendToStateTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.primarySendToZipCodeTBox") AND getIntake.primarySendToZipCodeTBox NEQ form.primarySendToZipCodeTBox>
			<cfset note = note & "Primary Send To Zip Code changed from <strong>[</strong>#getIntake.primarySendToZipCodeTBox#<strong>]</strong> to <strong>[</strong>#form.primarySendToZipCodeTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondaryFaxNumberTBox") AND getIntake.secondaryFaxNumberTBox NEQ request.cleanNumericString(form.secondaryFaxNumberTBox)>
			<cfset note = note & "Secondary Fax Number changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.secondaryFaxNumberTBox)#<strong>]</strong> to <strong>[</strong>#form.secondaryFaxNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondarySendToAddress1TBox") AND getIntake.secondarySendToAddress1TBox NEQ form.secondarySendToAddress1TBox>
			<cfset note = note & "Secondary Send To Address 1 TBox changed from <strong>[</strong>#getIntake.secondarySendToAddress1TBox#<strong>]</strong> to <strong>[</strong>#form.secondarySendToAddress1TBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondarySendToAddress2TBox") AND getIntake.secondarySendToAddress2TBox NEQ form.secondarySendToAddress2TBox>
			<cfset note = note & "Secondary Send To Address 2 TBox changed from <strong>[</strong>#getIntake.secondarySendToAddress2TBox#<strong>]</strong> to <strong>[</strong>#form.secondarySendToAddress2TBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondarySendToCityTBox") AND getIntake.secondarySendToCityTBox NEQ form.secondarySendToCityTBox>
			<cfset note = note & "Secondary Send To City changed from <strong>[</strong>#getIntake.secondarySendToCityTBox#<strong>]</strong> to <strong>[</strong>#form.secondarySendToCityTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondarySendToStateTBox") AND getIntake.secondarySendToStateTBox NEQ form.secondarySendToStateTBox>
			<cfset note = note & "Secondary Send To State changed from <strong>[</strong>#getIntake.secondarySendToStateTBox#<strong>]</strong> to <strong>[</strong>#form.secondarySendToStateTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.secondarySendToZipCodeTBox") AND getIntake.secondarySendToZipCodeTBox NEQ form.secondarySendToZipCodeTBox>
			<cfset note = note & "Secondary Send To Zip Code changed from <strong>[</strong>#getIntake.secondarySendToZipCodeTBox#<strong>]</strong> to <strong>[</strong>#form.secondarySendToZipCodeTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiaryFaxNumberTBox") AND getIntake.tertiaryFaxNumberTBox NEQ request.cleanNumericString(form.tertiaryFaxNumberTBox)>
			<cfset note = note & "Tertiary Fax Number changed from <strong>[</strong>#REQUEST.formatPhoneUS(getIntake.tertiaryFaxNumberTBox)#<strong>]</strong> to <strong>[</strong>#form.tertiaryFaxNumberTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiarySendToAddress1TBox") AND getIntake.tertiarySendToAddress1TBox NEQ form.tertiarySendToAddress1TBox>
			<cfset note = note & "Tertiary Send To Address 1 TBox changed from <strong>[</strong>#getIntake.tertiarySendToAddress1TBox#<strong>]</strong> to <strong>[</strong>#form.tertiarySendToAddress1TBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiarySendToAddress2TBox") AND getIntake.tertiarySendToAddress2TBox NEQ form.tertiarySendToAddress2TBox>
			<cfset note = note & "Tertiary Send To Address 2 TBox changed from <strong>[</strong>#getIntake.tertiarySendToAddress2TBox#<strong>]</strong> to <strong>[</strong>#form.tertiarySendToAddress2TBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiarySendToCityTBox") AND getIntake.tertiarySendToCityTBox NEQ form.tertiarySendToCityTBox>
			<cfset note = note & "Tertiary Send To City changed from <strong>[</strong>#getIntake.tertiarySendToCityTBox#<strong>]</strong> to <strong>[</strong>#form.tertiarySendToCityTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiarySendToStateTBox") AND getIntake.tertiarySendToStateTBox NEQ form.tertiarySendToStateTBox>
			<cfset note = note & "Tertiary Send To State changed from <strong>[</strong>#getIntake.tertiarySendToStateTBox#<strong>]</strong> to <strong>[</strong>#form.tertiarySendToStateTBox#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.tertiarySendToZipCodeTBox") AND getIntake.tertiarySendToZipCodeTBox NEQ form.tertiarySendToZipCodeTBox>
			<cfset note = note & "Tertiary Send To Zip Code changed from <strong>[</strong>#getIntake.tertiarySendToZipCodeTBox#<strong>]</strong> to <strong>[</strong>#form.tertiarySendToZipCodeTBox#<strong>]</strong><br>">
		</cfif>--->
		<cfif IsDefined("form.HCPCCODE1TBOX") AND getIntake.HCPCCODE1TBOX NEQ form.HCPCCODE1TBOX>
			<cfset note = note & "HCPC CODE 1 changed from <strong>[</strong>#getIntake.HCPCCODE1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS1TBOX") AND getIntake.HCPCDIAGNOSIS1TBOX NEQ form.HCPCDIAGNOSIS1TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 1 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX1TBOX") AND getIntake.HCPCDX1TBOX NEQ form.HCPCDX1TBOX>
			<cfset note = note & "HCPC DX 1 changed from <strong>[</strong>#getIntake.HCPCDX1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT1TBOX") AND getIntake.HCPCPRODUCT1TBOX NEQ form.HCPCPRODUCT1TBOX>
			<cfset note = note & "HCPC PRODUCT 1 changed from <strong>[</strong>#getIntake.HCPCPRODUCT1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY1TBOX") AND getIntake.HCPCQTY1TBOX NEQ form.HCPCQTY1TBOX>
			<cfset note = note & "HCPC QUANTITY 1 changed from <strong>[</strong>#getIntake.HCPCQTY1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST1TBOX") AND getIntake.HCPCCOST1TBOX NEQ form.HCPCCOST1TBOX>
			<cfset note = note & "HCPC COST 1 changed from <strong>[</strong>#getIntake.HCPCCOST1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH1TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH1TBOX NEQ form.HCPCLENGTHOFNEEDMONTH1TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 1 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR1TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR1TBOX NEQ form.HCPCLENGTHOFNEEDYEAR1TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 1 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR1TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR1TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE2TBOX") AND getIntake.HCPCCODE2TBOX NEQ form.HCPCCODE2TBOX>
			<cfset note = note & "HCPC CODE 2 changed from <strong>[</strong>#getIntake.HCPCCODE2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS2TBOX") AND getIntake.HCPCDIAGNOSIS2TBOX NEQ form.HCPCDIAGNOSIS2TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 2 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX2TBOX") AND getIntake.HCPCDX2TBOX NEQ form.HCPCDX2TBOX>
			<cfset note = note & "HCPC DX 2 changed from <strong>[</strong>#getIntake.HCPCDX2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT2TBOX") AND getIntake.HCPCPRODUCT2TBOX NEQ form.HCPCPRODUCT2TBOX>
			<cfset note = note & "HCPC PRODUCT 2 changed from <strong>[</strong>#getIntake.HCPCPRODUCT2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY2TBOX") AND getIntake.HCPCQTY2TBOX NEQ form.HCPCQTY2TBOX>
			<cfset note = note & "HCPC QUANTITY 2 changed from <strong>[</strong>#getIntake.HCPCQTY2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST2TBOX") AND getIntake.HCPCCOST2TBOX NEQ form.HCPCCOST2TBOX>
			<cfset note = note & "HCPC COST 2 changed from <strong>[</strong>#getIntake.HCPCCOST2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH2TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH2TBOX NEQ form.HCPCLENGTHOFNEEDMONTH2TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 2 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR2TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR2TBOX NEQ form.HCPCLENGTHOFNEEDYEAR2TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 2 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR2TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR2TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE3TBOX") AND getIntake.HCPCCODE3TBOX NEQ form.HCPCCODE3TBOX>
			<cfset note = note & "HCPC CODE 3 changed from <strong>[</strong>#getIntake.HCPCCODE3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS3TBOX") AND getIntake.HCPCDIAGNOSIS3TBOX NEQ form.HCPCDIAGNOSIS3TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 3 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX3TBOX") AND getIntake.HCPCDX3TBOX NEQ form.HCPCDX3TBOX>
			<cfset note = note & "HCPC DX 3 changed from <strong>[</strong>#getIntake.HCPCDX3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT3TBOX") AND getIntake.HCPCPRODUCT3TBOX NEQ form.HCPCPRODUCT3TBOX>
			<cfset note = note & "HCPC PRODUCT 3 changed from <strong>[</strong>#getIntake.HCPCPRODUCT3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY3TBOX") AND getIntake.HCPCQTY3TBOX NEQ form.HCPCQTY3TBOX>
			<cfset note = note & "HCPC QUANTITY 3 changed from <strong>[</strong>#getIntake.HCPCQTY3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST3TBOX") AND getIntake.HCPCCOST3TBOX NEQ form.HCPCCOST3TBOX>
			<cfset note = note & "HCPC COST 3 changed from <strong>[</strong>#getIntake.HCPCCOST3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH3TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH3TBOX NEQ form.HCPCLENGTHOFNEEDMONTH3TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 3 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR3TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR3TBOX NEQ form.HCPCLENGTHOFNEEDYEAR3TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 3 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR3TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR3TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE4TBOX") AND getIntake.HCPCCODE4TBOX NEQ form.HCPCCODE4TBOX>
			<cfset note = note & "HCPC CODE 4 changed from <strong>[</strong>#getIntake.HCPCCODE4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS4TBOX") AND getIntake.HCPCDIAGNOSIS4TBOX NEQ form.HCPCDIAGNOSIS4TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 4 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX4TBOX") AND getIntake.HCPCDX4TBOX NEQ form.HCPCDX4TBOX>
			<cfset note = note & "HCPC DX 4 changed from <strong>[</strong>#getIntake.HCPCDX4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT4TBOX") AND getIntake.HCPCPRODUCT4TBOX NEQ form.HCPCPRODUCT4TBOX>
			<cfset note = note & "HCPC PRODUCT 4 changed from <strong>[</strong>#getIntake.HCPCPRODUCT4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY4TBOX") AND getIntake.HCPCQTY4TBOX NEQ form.HCPCQTY4TBOX>
			<cfset note = note & "HCPC QUANTITY 4 changed from <strong>[</strong>#getIntake.HCPCQTY4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST4TBOX") AND getIntake.HCPCCOST4TBOX NEQ form.HCPCCOST4TBOX>
			<cfset note = note & "HCPC COST 4 changed from <strong>[</strong>#getIntake.HCPCCOST4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH4TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH4TBOX NEQ form.HCPCLENGTHOFNEEDMONTH4TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 4 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR4TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR4TBOX NEQ form.HCPCLENGTHOFNEEDYEAR4TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 4 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR4TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR4TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE5TBOX") AND getIntake.HCPCCODE5TBOX NEQ form.HCPCCODE5TBOX>
			<cfset note = note & "HCPC CODE 5 changed from <strong>[</strong>#getIntake.HCPCCODE5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS5TBOX") AND getIntake.HCPCDIAGNOSIS5TBOX NEQ form.HCPCDIAGNOSIS5TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 5 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX5TBOX") AND getIntake.HCPCDX5TBOX NEQ form.HCPCDX5TBOX>
			<cfset note = note & "HCPC DX 5 changed from <strong>[</strong>#getIntake.HCPCDX5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT5TBOX") AND getIntake.HCPCPRODUCT5TBOX NEQ form.HCPCPRODUCT5TBOX>
			<cfset note = note & "HCPC PRODUCT 5 changed from <strong>[</strong>#getIntake.HCPCPRODUCT5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY5TBOX") AND getIntake.HCPCQTY5TBOX NEQ form.HCPCQTY5TBOX>
			<cfset note = note & "HCPC QUANTITY 5 changed from <strong>[</strong>#getIntake.HCPCQTY5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST5TBOX") AND getIntake.HCPCCOST5TBOX NEQ form.HCPCCOST5TBOX>
			<cfset note = note & "HCPC COST 5 changed from <strong>[</strong>#getIntake.HCPCCOST5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH5TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH5TBOX NEQ form.HCPCLENGTHOFNEEDMONTH5TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 5 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR5TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR5TBOX NEQ form.HCPCLENGTHOFNEEDYEAR5TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 5 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR5TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR5TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE6TBOX") AND getIntake.HCPCCODE6TBOX NEQ form.HCPCCODE6TBOX>
			<cfset note = note & "HCPC CODE 6 changed from <strong>[</strong>#getIntake.HCPCCODE6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS6TBOX") AND getIntake.HCPCDIAGNOSIS6TBOX NEQ form.HCPCDIAGNOSIS6TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 6 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX6TBOX") AND getIntake.HCPCDX6TBOX NEQ form.HCPCDX6TBOX>
			<cfset note = note & "HCPC DX 6 changed from <strong>[</strong>#getIntake.HCPCDX6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT6TBOX") AND getIntake.HCPCPRODUCT6TBOX NEQ form.HCPCPRODUCT6TBOX>
			<cfset note = note & "HCPC PRODUCT 6 changed from <strong>[</strong>#getIntake.HCPCPRODUCT6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY6TBOX") AND getIntake.HCPCQTY6TBOX NEQ form.HCPCQTY6TBOX>
			<cfset note = note & "HCPC QUANTITY 6 changed from <strong>[</strong>#getIntake.HCPCQTY6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST6TBOX") AND getIntake.HCPCCOST6TBOX NEQ form.HCPCCOST6TBOX>
			<cfset note = note & "HCPC COST 6 changed from <strong>[</strong>#getIntake.HCPCCOST6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH6TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH6TBOX NEQ form.HCPCLENGTHOFNEEDMONTH6TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 6 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR6TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR6TBOX NEQ form.HCPCLENGTHOFNEEDYEAR6TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 6 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR6TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR6TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE7TBOX") AND getIntake.HCPCCODE7TBOX NEQ form.HCPCCODE7TBOX>
			<cfset note = note & "HCPC CODE 7 changed from <strong>[</strong>#getIntake.HCPCCODE7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS7TBOX") AND getIntake.HCPCDIAGNOSIS7TBOX NEQ form.HCPCDIAGNOSIS7TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 7 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX7TBOX") AND getIntake.HCPCDX7TBOX NEQ form.HCPCDX7TBOX>
			<cfset note = note & "HCPC DX 7 changed from <strong>[</strong>#getIntake.HCPCDX7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT7TBOX") AND getIntake.HCPCPRODUCT7TBOX NEQ form.HCPCPRODUCT7TBOX>
			<cfset note = note & "HCPC PRODUCT 7 changed from <strong>[</strong>#getIntake.HCPCPRODUCT7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY7TBOX") AND getIntake.HCPCQTY7TBOX NEQ form.HCPCQTY7TBOX>
			<cfset note = note & "HCPC QUANTITY 7 changed from <strong>[</strong>#getIntake.HCPCQTY7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST7TBOX") AND getIntake.HCPCCOST7TBOX NEQ form.HCPCCOST7TBOX>
			<cfset note = note & "HCPC COST 7 changed from <strong>[</strong>#getIntake.HCPCCOST7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH7TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH7TBOX NEQ form.HCPCLENGTHOFNEEDMONTH7TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 7 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR7TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR7TBOX NEQ form.HCPCLENGTHOFNEEDYEAR7TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 7 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR7TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR7TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE8TBOX") AND getIntake.HCPCCODE8TBOX NEQ form.HCPCCODE8TBOX>
			<cfset note = note & "HCPC CODE 8 changed from <strong>[</strong>#getIntake.HCPCCODE8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS8TBOX") AND getIntake.HCPCDIAGNOSIS8TBOX NEQ form.HCPCDIAGNOSIS8TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 8 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX8TBOX") AND getIntake.HCPCDX8TBOX NEQ form.HCPCDX8TBOX>
			<cfset note = note & "HCPC DX 8 changed from <strong>[</strong>#getIntake.HCPCDX8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT8TBOX") AND getIntake.HCPCPRODUCT8TBOX NEQ form.HCPCPRODUCT8TBOX>
			<cfset note = note & "HCPC PRODUCT 8 changed from <strong>[</strong>#getIntake.HCPCPRODUCT8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY8TBOX") AND getIntake.HCPCQTY8TBOX NEQ form.HCPCQTY8TBOX>
			<cfset note = note & "HCPC QUANTITY 8 changed from <strong>[</strong>#getIntake.HCPCQTY8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST8TBOX") AND getIntake.HCPCCOST8TBOX NEQ form.HCPCCOST8TBOX>
			<cfset note = note & "HCPC COST 8 changed from <strong>[</strong>#getIntake.HCPCCOST8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH8TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH8TBOX NEQ form.HCPCLENGTHOFNEEDMONTH8TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 8 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR8TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR8TBOX NEQ form.HCPCLENGTHOFNEEDYEAR8TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 8 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR8TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR8TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE9TBOX") AND getIntake.HCPCCODE9TBOX NEQ form.HCPCCODE9TBOX>
			<cfset note = note & "HCPC CODE 9 changed from <strong>[</strong>#getIntake.HCPCCODE9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS9TBOX") AND getIntake.HCPCDIAGNOSIS9TBOX NEQ form.HCPCDIAGNOSIS9TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 9 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX9TBOX") AND getIntake.HCPCDX9TBOX NEQ form.HCPCDX9TBOX>
			<cfset note = note & "HCPC DX 9 changed from <strong>[</strong>#getIntake.HCPCDX9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT9TBOX") AND getIntake.HCPCPRODUCT9TBOX NEQ form.HCPCPRODUCT9TBOX>
			<cfset note = note & "HCPC PRODUCT 9 changed from <strong>[</strong>#getIntake.HCPCPRODUCT9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY9TBOX") AND getIntake.HCPCQTY9TBOX NEQ form.HCPCQTY9TBOX>
			<cfset note = note & "HCPC QUANTITY 9 changed from <strong>[</strong>#getIntake.HCPCQTY9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST9TBOX") AND getIntake.HCPCCOST9TBOX NEQ form.HCPCCOST9TBOX>
			<cfset note = note & "HCPC COST 9 changed from <strong>[</strong>#getIntake.HCPCCOST9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH9TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH9TBOX NEQ form.HCPCLENGTHOFNEEDMONTH9TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 9 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR9TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR9TBOX NEQ form.HCPCLENGTHOFNEEDYEAR9TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 9 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR9TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR9TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE10TBOX") AND getIntake.HCPCCODE10TBOX NEQ form.HCPCCODE10TBOX>
			<cfset note = note & "HCPC CODE 10 changed from <strong>[</strong>#getIntake.HCPCCODE10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS10TBOX") AND getIntake.HCPCDIAGNOSIS10TBOX NEQ form.HCPCDIAGNOSIS10TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 10 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX10TBOX") AND getIntake.HCPCDX10TBOX NEQ form.HCPCDX10TBOX>
			<cfset note = note & "HCPC DX 10 changed from <strong>[</strong>#getIntake.HCPCDX10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT10TBOX") AND getIntake.HCPCPRODUCT10TBOX NEQ form.HCPCPRODUCT10TBOX>
			<cfset note = note & "HCPC PRODUCT 10 changed from <strong>[</strong>#getIntake.HCPCPRODUCT10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY10TBOX") AND getIntake.HCPCQTY10TBOX NEQ form.HCPCQTY10TBOX>
			<cfset note = note & "HCPC QUANTITY 10 changed from <strong>[</strong>#getIntake.HCPCQTY10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST10TBOX") AND getIntake.HCPCCOST10TBOX NEQ form.HCPCCOST10TBOX>
			<cfset note = note & "HCPC COST 10 changed from <strong>[</strong>#getIntake.HCPCCOST10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH10TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH10TBOX NEQ form.HCPCLENGTHOFNEEDMONTH10TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 10 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR10TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR10TBOX NEQ form.HCPCLENGTHOFNEEDYEAR10TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 10 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR10TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR10TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE11TBOX") AND getIntake.HCPCCODE11TBOX NEQ form.HCPCCODE11TBOX>
			<cfset note = note & "HCPC CODE 11 changed from <strong>[</strong>#getIntake.HCPCCODE11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS11TBOX") AND getIntake.HCPCDIAGNOSIS11TBOX NEQ form.HCPCDIAGNOSIS11TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 11 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX11TBOX") AND getIntake.HCPCDX11TBOX NEQ form.HCPCDX11TBOX>
			<cfset note = note & "HCPC DX 11 changed from <strong>[</strong>#getIntake.HCPCDX11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT11TBOX") AND getIntake.HCPCPRODUCT11TBOX NEQ form.HCPCPRODUCT11TBOX>
			<cfset note = note & "HCPC PRODUCT 11 changed from <strong>[</strong>#getIntake.HCPCPRODUCT11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY11TBOX") AND getIntake.HCPCQTY11TBOX NEQ form.HCPCQTY11TBOX>
			<cfset note = note & "HCPC QUANTITY 11 changed from <strong>[</strong>#getIntake.HCPCQTY11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST11TBOX") AND getIntake.HCPCCOST11TBOX NEQ form.HCPCCOST11TBOX>
			<cfset note = note & "HCPC COST 11 changed from <strong>[</strong>#getIntake.HCPCCOST11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH11TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH11TBOX NEQ form.HCPCLENGTHOFNEEDMONTH11TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 11 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR11TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR11TBOX NEQ form.HCPCLENGTHOFNEEDYEAR11TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 11 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR11TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR11TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE12TBOX") AND getIntake.HCPCCODE12TBOX NEQ form.HCPCCODE12TBOX>
			<cfset note = note & "HCPC CODE 12 changed from <strong>[</strong>#getIntake.HCPCCODE12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS12TBOX") AND getIntake.HCPCDIAGNOSIS12TBOX NEQ form.HCPCDIAGNOSIS12TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 12 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX12TBOX") AND getIntake.HCPCDX12TBOX NEQ form.HCPCDX12TBOX>
			<cfset note = note & "HCPC DX 12 changed from <strong>[</strong>#getIntake.HCPCDX12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT12TBOX") AND getIntake.HCPCPRODUCT12TBOX NEQ form.HCPCPRODUCT12TBOX>
			<cfset note = note & "HCPC PRODUCT 12 changed from <strong>[</strong>#getIntake.HCPCPRODUCT12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY12TBOX") AND getIntake.HCPCQTY12TBOX NEQ form.HCPCQTY12TBOX>
			<cfset note = note & "HCPC QUANTITY 12 changed from <strong>[</strong>#getIntake.HCPCQTY12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST12TBOX") AND getIntake.HCPCCOST12TBOX NEQ form.HCPCCOST12TBOX>
			<cfset note = note & "HCPC COST 12 changed from <strong>[</strong>#getIntake.HCPCCOST12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH12TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH12TBOX NEQ form.HCPCLENGTHOFNEEDMONTH12TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 12 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR12TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR12TBOX NEQ form.HCPCLENGTHOFNEEDYEAR12TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 12 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR12TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR12TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE13TBOX") AND getIntake.HCPCCODE13TBOX NEQ form.HCPCCODE13TBOX>
			<cfset note = note & "HCPC CODE 13 changed from <strong>[</strong>#getIntake.HCPCCODE13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS13TBOX") AND getIntake.HCPCDIAGNOSIS13TBOX NEQ form.HCPCDIAGNOSIS13TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 13 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX13TBOX") AND getIntake.HCPCDX13TBOX NEQ form.HCPCDX13TBOX>
			<cfset note = note & "HCPC DX 13 changed from <strong>[</strong>#getIntake.HCPCDX13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT13TBOX") AND getIntake.HCPCPRODUCT13TBOX NEQ form.HCPCPRODUCT13TBOX>
			<cfset note = note & "HCPC PRODUCT 13 changed from <strong>[</strong>#getIntake.HCPCPRODUCT13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY13TBOX") AND getIntake.HCPCQTY13TBOX NEQ form.HCPCQTY13TBOX>
			<cfset note = note & "HCPC QUANTITY 13 changed from <strong>[</strong>#getIntake.HCPCQTY13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST13TBOX") AND getIntake.HCPCCOST13TBOX NEQ form.HCPCCOST13TBOX>
			<cfset note = note & "HCPC COST 13 changed from <strong>[</strong>#getIntake.HCPCCOST13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH13TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH13TBOX NEQ form.HCPCLENGTHOFNEEDMONTH13TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 13 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR13TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR13TBOX NEQ form.HCPCLENGTHOFNEEDYEAR13TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 13 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR13TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR13TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE14TBOX") AND getIntake.HCPCCODE14TBOX NEQ form.HCPCCODE14TBOX>
			<cfset note = note & "HCPC CODE 14 changed from <strong>[</strong>#getIntake.HCPCCODE14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS14TBOX") AND getIntake.HCPCDIAGNOSIS14TBOX NEQ form.HCPCDIAGNOSIS14TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 14 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX14TBOX") AND getIntake.HCPCDX14TBOX NEQ form.HCPCDX14TBOX>
			<cfset note = note & "HCPC DX 14 changed from <strong>[</strong>#getIntake.HCPCDX14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT14TBOX") AND getIntake.HCPCPRODUCT14TBOX NEQ form.HCPCPRODUCT14TBOX>
			<cfset note = note & "HCPC PRODUCT 14 changed from <strong>[</strong>#getIntake.HCPCPRODUCT14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY14TBOX") AND getIntake.HCPCQTY14TBOX NEQ form.HCPCQTY14TBOX>
			<cfset note = note & "HCPC QUANTITY 14 changed from <strong>[</strong>#getIntake.HCPCQTY14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST14TBOX") AND getIntake.HCPCCOST14TBOX NEQ form.HCPCCOST14TBOX>
			<cfset note = note & "HCPC COST 14 changed from <strong>[</strong>#getIntake.HCPCCOST14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH14TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH14TBOX NEQ form.HCPCLENGTHOFNEEDMONTH14TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 14 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR14TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR14TBOX NEQ form.HCPCLENGTHOFNEEDYEAR14TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 14 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR14TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR14TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE15TBOX") AND getIntake.HCPCCODE15TBOX NEQ form.HCPCCODE15TBOX>
			<cfset note = note & "HCPC CODE 15 changed from <strong>[</strong>#getIntake.HCPCCODE15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS15TBOX") AND getIntake.HCPCDIAGNOSIS15TBOX NEQ form.HCPCDIAGNOSIS15TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 15 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX15TBOX") AND getIntake.HCPCDX15TBOX NEQ form.HCPCDX15TBOX>
			<cfset note = note & "HCPC DX 15 changed from <strong>[</strong>#getIntake.HCPCDX15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT15TBOX") AND getIntake.HCPCPRODUCT15TBOX NEQ form.HCPCPRODUCT15TBOX>
			<cfset note = note & "HCPC PRODUCT 15 changed from <strong>[</strong>#getIntake.HCPCPRODUCT15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY15TBOX") AND getIntake.HCPCQTY15TBOX NEQ form.HCPCQTY15TBOX>
			<cfset note = note & "HCPC QUANTITY 15 changed from <strong>[</strong>#getIntake.HCPCQTY15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST15TBOX") AND getIntake.HCPCCOST15TBOX NEQ form.HCPCCOST15TBOX>
			<cfset note = note & "HCPC COST 15 changed from <strong>[</strong>#getIntake.HCPCCOST15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH15TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH15TBOX NEQ form.HCPCLENGTHOFNEEDMONTH15TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 15 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR15TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR15TBOX NEQ form.HCPCLENGTHOFNEEDYEAR15TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 15 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR15TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR15TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE16TBOX") AND getIntake.HCPCCODE16TBOX NEQ form.HCPCCODE16TBOX>
			<cfset note = note & "HCPC CODE 16 changed from <strong>[</strong>#getIntake.HCPCCODE16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS16TBOX") AND getIntake.HCPCDIAGNOSIS16TBOX NEQ form.HCPCDIAGNOSIS16TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 16 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX16TBOX") AND getIntake.HCPCDX16TBOX NEQ form.HCPCDX16TBOX>
			<cfset note = note & "HCPC DX 16 changed from <strong>[</strong>#getIntake.HCPCDX16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT16TBOX") AND getIntake.HCPCPRODUCT16TBOX NEQ form.HCPCPRODUCT16TBOX>
			<cfset note = note & "HCPC PRODUCT 16 changed from <strong>[</strong>#getIntake.HCPCPRODUCT16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY16TBOX") AND getIntake.HCPCQTY16TBOX NEQ form.HCPCQTY16TBOX>
			<cfset note = note & "HCPC QUANTITY 16 changed from <strong>[</strong>#getIntake.HCPCQTY16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST16TBOX") AND getIntake.HCPCCOST16TBOX NEQ form.HCPCCOST16TBOX>
			<cfset note = note & "HCPC COST 16 changed from <strong>[</strong>#getIntake.HCPCCOST16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH16TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH16TBOX NEQ form.HCPCLENGTHOFNEEDMONTH16TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 16 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR16TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR16TBOX NEQ form.HCPCLENGTHOFNEEDYEAR16TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 16 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR16TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR16TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE17TBOX") AND getIntake.HCPCCODE17TBOX NEQ form.HCPCCODE17TBOX>
			<cfset note = note & "HCPC CODE 17 changed from <strong>[</strong>#getIntake.HCPCCODE17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS17TBOX") AND getIntake.HCPCDIAGNOSIS17TBOX NEQ form.HCPCDIAGNOSIS17TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 17 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX17TBOX") AND getIntake.HCPCDX17TBOX NEQ form.HCPCDX17TBOX>
			<cfset note = note & "HCPC DX 17 changed from <strong>[</strong>#getIntake.HCPCDX17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT17TBOX") AND getIntake.HCPCPRODUCT17TBOX NEQ form.HCPCPRODUCT17TBOX>
			<cfset note = note & "HCPC PRODUCT 17 changed from <strong>[</strong>#getIntake.HCPCPRODUCT17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY17TBOX") AND getIntake.HCPCQTY17TBOX NEQ form.HCPCQTY17TBOX>
			<cfset note = note & "HCPC QUANTITY 17 changed from <strong>[</strong>#getIntake.HCPCQTY17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST17TBOX") AND getIntake.HCPCCOST17TBOX NEQ form.HCPCCOST17TBOX>
			<cfset note = note & "HCPC COST 17 changed from <strong>[</strong>#getIntake.HCPCCOST17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH17TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH17TBOX NEQ form.HCPCLENGTHOFNEEDMONTH17TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 17 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR17TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR17TBOX NEQ form.HCPCLENGTHOFNEEDYEAR17TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 17 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR17TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR17TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE18TBOX") AND getIntake.HCPCCODE18TBOX NEQ form.HCPCCODE18TBOX>
			<cfset note = note & "HCPC CODE 18 changed from <strong>[</strong>#getIntake.HCPCCODE18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS18TBOX") AND getIntake.HCPCDIAGNOSIS18TBOX NEQ form.HCPCDIAGNOSIS18TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 18 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX18TBOX") AND getIntake.HCPCDX18TBOX NEQ form.HCPCDX18TBOX>
			<cfset note = note & "HCPC DX 18 changed from <strong>[</strong>#getIntake.HCPCDX18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT18TBOX") AND getIntake.HCPCPRODUCT18TBOX NEQ form.HCPCPRODUCT18TBOX>
			<cfset note = note & "HCPC PRODUCT 18 changed from <strong>[</strong>#getIntake.HCPCPRODUCT18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY18TBOX") AND getIntake.HCPCQTY18TBOX NEQ form.HCPCQTY18TBOX>
			<cfset note = note & "HCPC QUANTITY 18 changed from <strong>[</strong>#getIntake.HCPCQTY18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST18TBOX") AND getIntake.HCPCCOST18TBOX NEQ form.HCPCCOST18TBOX>
			<cfset note = note & "HCPC COST 18 changed from <strong>[</strong>#getIntake.HCPCCOST18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH18TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH18TBOX NEQ form.HCPCLENGTHOFNEEDMONTH18TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 18 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR18TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR18TBOX NEQ form.HCPCLENGTHOFNEEDYEAR18TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 18 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR18TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR18TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE19TBOX") AND getIntake.HCPCCODE19TBOX NEQ form.HCPCCODE19TBOX>
			<cfset note = note & "HCPC CODE 19 changed from <strong>[</strong>#getIntake.HCPCCODE19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS19TBOX") AND getIntake.HCPCDIAGNOSIS19TBOX NEQ form.HCPCDIAGNOSIS19TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 19 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX19TBOX") AND getIntake.HCPCDX19TBOX NEQ form.HCPCDX19TBOX>
			<cfset note = note & "HCPC DX 19 changed from <strong>[</strong>#getIntake.HCPCDX19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT19TBOX") AND getIntake.HCPCPRODUCT19TBOX NEQ form.HCPCPRODUCT19TBOX>
			<cfset note = note & "HCPC PRODUCT 19 changed from <strong>[</strong>#getIntake.HCPCPRODUCT19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY19TBOX") AND getIntake.HCPCQTY19TBOX NEQ form.HCPCQTY19TBOX>
			<cfset note = note & "HCPC QUANTITY 19 changed from <strong>[</strong>#getIntake.HCPCQTY19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST19TBOX") AND getIntake.HCPCCOST19TBOX NEQ form.HCPCCOST19TBOX>
			<cfset note = note & "HCPC COST 19 changed from <strong>[</strong>#getIntake.HCPCCOST19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH19TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH19TBOX NEQ form.HCPCLENGTHOFNEEDMONTH19TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 19 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR19TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR19TBOX NEQ form.HCPCLENGTHOFNEEDYEAR19TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 19 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR19TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR19TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE20TBOX") AND getIntake.HCPCCODE20TBOX NEQ form.HCPCCODE20TBOX>
			<cfset note = note & "HCPC CODE 20 changed from <strong>[</strong>#getIntake.HCPCCODE20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS20TBOX") AND getIntake.HCPCDIAGNOSIS20TBOX NEQ form.HCPCDIAGNOSIS20TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 20 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX20TBOX") AND getIntake.HCPCDX20TBOX NEQ form.HCPCDX20TBOX>
			<cfset note = note & "HCPC DX 20 changed from <strong>[</strong>#getIntake.HCPCDX20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT20TBOX") AND getIntake.HCPCPRODUCT20TBOX NEQ form.HCPCPRODUCT20TBOX>
			<cfset note = note & "HCPC PRODUCT 20 changed from <strong>[</strong>#getIntake.HCPCPRODUCT20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY20TBOX") AND getIntake.HCPCQTY20TBOX NEQ form.HCPCQTY20TBOX>
			<cfset note = note & "HCPC QUANTITY 20 changed from <strong>[</strong>#getIntake.HCPCQTY20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST20TBOX") AND getIntake.HCPCCOST20TBOX NEQ form.HCPCCOST20TBOX>
			<cfset note = note & "HCPC COST 20 changed from <strong>[</strong>#getIntake.HCPCCOST20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH20TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH20TBOX NEQ form.HCPCLENGTHOFNEEDMONTH20TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 20 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR20TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR20TBOX NEQ form.HCPCLENGTHOFNEEDYEAR20TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 20 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR20TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR20TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE21TBOX") AND getIntake.HCPCCODE21TBOX NEQ form.HCPCCODE21TBOX>
			<cfset note = note & "HCPC CODE 21 changed from <strong>[</strong>#getIntake.HCPCCODE21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS21TBOX") AND getIntake.HCPCDIAGNOSIS21TBOX NEQ form.HCPCDIAGNOSIS21TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 21 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX21TBOX") AND getIntake.HCPCDX21TBOX NEQ form.HCPCDX21TBOX>
			<cfset note = note & "HCPC DX 21 changed from <strong>[</strong>#getIntake.HCPCDX21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT21TBOX") AND getIntake.HCPCPRODUCT21TBOX NEQ form.HCPCPRODUCT21TBOX>
			<cfset note = note & "HCPC PRODUCT 21 changed from <strong>[</strong>#getIntake.HCPCPRODUCT21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY21TBOX") AND getIntake.HCPCQTY21TBOX NEQ form.HCPCQTY21TBOX>
			<cfset note = note & "HCPC QUANTITY 21 changed from <strong>[</strong>#getIntake.HCPCQTY21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST21TBOX") AND getIntake.HCPCCOST21TBOX NEQ form.HCPCCOST21TBOX>
			<cfset note = note & "HCPC COST 21 changed from <strong>[</strong>#getIntake.HCPCCOST21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH21TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH21TBOX NEQ form.HCPCLENGTHOFNEEDMONTH21TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 21 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR21TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR21TBOX NEQ form.HCPCLENGTHOFNEEDYEAR21TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 21 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR21TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR21TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE22TBOX") AND getIntake.HCPCCODE22TBOX NEQ form.HCPCCODE22TBOX>
			<cfset note = note & "HCPC CODE 22 changed from <strong>[</strong>#getIntake.HCPCCODE22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS22TBOX") AND getIntake.HCPCDIAGNOSIS22TBOX NEQ form.HCPCDIAGNOSIS22TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 22 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX22TBOX") AND getIntake.HCPCDX22TBOX NEQ form.HCPCDX22TBOX>
			<cfset note = note & "HCPC DX 22 changed from <strong>[</strong>#getIntake.HCPCDX22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT22TBOX") AND getIntake.HCPCPRODUCT22TBOX NEQ form.HCPCPRODUCT22TBOX>
			<cfset note = note & "HCPC PRODUCT 22 changed from <strong>[</strong>#getIntake.HCPCPRODUCT22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY22TBOX") AND getIntake.HCPCQTY22TBOX NEQ form.HCPCQTY22TBOX>
			<cfset note = note & "HCPC QUANTITY 22 changed from <strong>[</strong>#getIntake.HCPCQTY22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST22TBOX") AND getIntake.HCPCCOST22TBOX NEQ form.HCPCCOST22TBOX>
			<cfset note = note & "HCPC COST 22 changed from <strong>[</strong>#getIntake.HCPCCOST22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH22TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH22TBOX NEQ form.HCPCLENGTHOFNEEDMONTH22TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 22 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR22TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR22TBOX NEQ form.HCPCLENGTHOFNEEDYEAR22TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 22 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR22TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR22TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE23TBOX") AND getIntake.HCPCCODE23TBOX NEQ form.HCPCCODE23TBOX>
			<cfset note = note & "HCPC CODE 23 changed from <strong>[</strong>#getIntake.HCPCCODE23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS23TBOX") AND getIntake.HCPCDIAGNOSIS23TBOX NEQ form.HCPCDIAGNOSIS23TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 23 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX23TBOX") AND getIntake.HCPCDX23TBOX NEQ form.HCPCDX23TBOX>
			<cfset note = note & "HCPC DX 23 changed from <strong>[</strong>#getIntake.HCPCDX23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT23TBOX") AND getIntake.HCPCPRODUCT23TBOX NEQ form.HCPCPRODUCT23TBOX>
			<cfset note = note & "HCPC PRODUCT 23 changed from <strong>[</strong>#getIntake.HCPCPRODUCT23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY23TBOX") AND getIntake.HCPCQTY23TBOX NEQ form.HCPCQTY23TBOX>
			<cfset note = note & "HCPC QUANTITY 23 changed from <strong>[</strong>#getIntake.HCPCQTY23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST23TBOX") AND getIntake.HCPCCOST23TBOX NEQ form.HCPCCOST23TBOX>
			<cfset note = note & "HCPC COST 23 changed from <strong>[</strong>#getIntake.HCPCCOST23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH23TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH23TBOX NEQ form.HCPCLENGTHOFNEEDMONTH23TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 23 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR23TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR23TBOX NEQ form.HCPCLENGTHOFNEEDYEAR23TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 23 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR23TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR23TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE24TBOX") AND getIntake.HCPCCODE24TBOX NEQ form.HCPCCODE24TBOX>
			<cfset note = note & "HCPC CODE 24 changed from <strong>[</strong>#getIntake.HCPCCODE24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS24TBOX") AND getIntake.HCPCDIAGNOSIS24TBOX NEQ form.HCPCDIAGNOSIS24TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 24 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX24TBOX") AND getIntake.HCPCDX24TBOX NEQ form.HCPCDX24TBOX>
			<cfset note = note & "HCPC DX 24 changed from <strong>[</strong>#getIntake.HCPCDX24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT24TBOX") AND getIntake.HCPCPRODUCT24TBOX NEQ form.HCPCPRODUCT24TBOX>
			<cfset note = note & "HCPC PRODUCT 24 changed from <strong>[</strong>#getIntake.HCPCPRODUCT24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY24TBOX") AND getIntake.HCPCQTY24TBOX NEQ form.HCPCQTY24TBOX>
			<cfset note = note & "HCPC QUANTITY 24 changed from <strong>[</strong>#getIntake.HCPCQTY24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST24TBOX") AND getIntake.HCPCCOST24TBOX NEQ form.HCPCCOST24TBOX>
			<cfset note = note & "HCPC COST 24 changed from <strong>[</strong>#getIntake.HCPCCOST24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH24TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH24TBOX NEQ form.HCPCLENGTHOFNEEDMONTH24TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 24 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR24TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR24TBOX NEQ form.HCPCLENGTHOFNEEDYEAR24TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 24 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR24TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR24TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE25TBOX") AND getIntake.HCPCCODE25TBOX NEQ form.HCPCCODE25TBOX>
			<cfset note = note & "HCPC CODE 25 changed from <strong>[</strong>#getIntake.HCPCCODE25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS25TBOX") AND getIntake.HCPCDIAGNOSIS25TBOX NEQ form.HCPCDIAGNOSIS25TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 25 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX25TBOX") AND getIntake.HCPCDX25TBOX NEQ form.HCPCDX25TBOX>
			<cfset note = note & "HCPC DX 25 changed from <strong>[</strong>#getIntake.HCPCDX25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT25TBOX") AND getIntake.HCPCPRODUCT25TBOX NEQ form.HCPCPRODUCT25TBOX>
			<cfset note = note & "HCPC PRODUCT 25 changed from <strong>[</strong>#getIntake.HCPCPRODUCT25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY25TBOX") AND getIntake.HCPCQTY25TBOX NEQ form.HCPCQTY25TBOX>
			<cfset note = note & "HCPC QUANTITY 25 changed from <strong>[</strong>#getIntake.HCPCQTY25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST25TBOX") AND getIntake.HCPCCOST25TBOX NEQ form.HCPCCOST25TBOX>
			<cfset note = note & "HCPC COST 25 changed from <strong>[</strong>#getIntake.HCPCCOST25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH25TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH25TBOX NEQ form.HCPCLENGTHOFNEEDMONTH25TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 25 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR25TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR25TBOX NEQ form.HCPCLENGTHOFNEEDYEAR25TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 25 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR25TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR25TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE26TBOX") AND getIntake.HCPCCODE26TBOX NEQ form.HCPCCODE26TBOX>
			<cfset note = note & "HCPC CODE 26 changed from <strong>[</strong>#getIntake.HCPCCODE26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS26TBOX") AND getIntake.HCPCDIAGNOSIS26TBOX NEQ form.HCPCDIAGNOSIS26TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 26 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX26TBOX") AND getIntake.HCPCDX26TBOX NEQ form.HCPCDX26TBOX>
			<cfset note = note & "HCPC DX 26 changed from <strong>[</strong>#getIntake.HCPCDX26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT26TBOX") AND getIntake.HCPCPRODUCT26TBOX NEQ form.HCPCPRODUCT26TBOX>
			<cfset note = note & "HCPC PRODUCT 26 changed from <strong>[</strong>#getIntake.HCPCPRODUCT26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY26TBOX") AND getIntake.HCPCQTY26TBOX NEQ form.HCPCQTY26TBOX>
			<cfset note = note & "HCPC QUANTITY 26 changed from <strong>[</strong>#getIntake.HCPCQTY26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST26TBOX") AND getIntake.HCPCCOST26TBOX NEQ form.HCPCCOST26TBOX>
			<cfset note = note & "HCPC COST 26 changed from <strong>[</strong>#getIntake.HCPCCOST26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH26TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH26TBOX NEQ form.HCPCLENGTHOFNEEDMONTH26TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 26 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR26TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR26TBOX NEQ form.HCPCLENGTHOFNEEDYEAR26TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 26 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR26TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR26TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE27TBOX") AND getIntake.HCPCCODE27TBOX NEQ form.HCPCCODE27TBOX>
			<cfset note = note & "HCPC CODE 27 changed from <strong>[</strong>#getIntake.HCPCCODE27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS27TBOX") AND getIntake.HCPCDIAGNOSIS27TBOX NEQ form.HCPCDIAGNOSIS27TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 27 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX27TBOX") AND getIntake.HCPCDX27TBOX NEQ form.HCPCDX27TBOX>
			<cfset note = note & "HCPC DX 27 changed from <strong>[</strong>#getIntake.HCPCDX27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT27TBOX") AND getIntake.HCPCPRODUCT27TBOX NEQ form.HCPCPRODUCT27TBOX>
			<cfset note = note & "HCPC PRODUCT 27 changed from <strong>[</strong>#getIntake.HCPCPRODUCT27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY27TBOX") AND getIntake.HCPCQTY27TBOX NEQ form.HCPCQTY27TBOX>
			<cfset note = note & "HCPC QUANTITY 27 changed from <strong>[</strong>#getIntake.HCPCQTY27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST27TBOX") AND getIntake.HCPCCOST27TBOX NEQ form.HCPCCOST27TBOX>
			<cfset note = note & "HCPC COST 27 changed from <strong>[</strong>#getIntake.HCPCCOST27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH27TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH27TBOX NEQ form.HCPCLENGTHOFNEEDMONTH27TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 27 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR27TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR27TBOX NEQ form.HCPCLENGTHOFNEEDYEAR27TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 27 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR27TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR27TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE28TBOX") AND getIntake.HCPCCODE28TBOX NEQ form.HCPCCODE28TBOX>
			<cfset note = note & "HCPC CODE 28 changed from <strong>[</strong>#getIntake.HCPCCODE28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS28TBOX") AND getIntake.HCPCDIAGNOSIS28TBOX NEQ form.HCPCDIAGNOSIS28TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 28 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX28TBOX") AND getIntake.HCPCDX28TBOX NEQ form.HCPCDX28TBOX>
			<cfset note = note & "HCPC DX 28 changed from <strong>[</strong>#getIntake.HCPCDX28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT28TBOX") AND getIntake.HCPCPRODUCT28TBOX NEQ form.HCPCPRODUCT28TBOX>
			<cfset note = note & "HCPC PRODUCT 28 changed from <strong>[</strong>#getIntake.HCPCPRODUCT28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY28TBOX") AND getIntake.HCPCQTY28TBOX NEQ form.HCPCQTY28TBOX>
			<cfset note = note & "HCPC QUANTITY 28 changed from <strong>[</strong>#getIntake.HCPCQTY28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST28TBOX") AND getIntake.HCPCCOST28TBOX NEQ form.HCPCCOST28TBOX>
			<cfset note = note & "HCPC COST 28 changed from <strong>[</strong>#getIntake.HCPCCOST28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH28TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH28TBOX NEQ form.HCPCLENGTHOFNEEDMONTH28TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 28 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR28TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR28TBOX NEQ form.HCPCLENGTHOFNEEDYEAR28TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 28 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR28TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR28TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE29TBOX") AND getIntake.HCPCCODE29TBOX NEQ form.HCPCCODE29TBOX>
			<cfset note = note & "HCPC CODE 29 changed from <strong>[</strong>#getIntake.HCPCCODE29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS29TBOX") AND getIntake.HCPCDIAGNOSIS29TBOX NEQ form.HCPCDIAGNOSIS29TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 29 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX29TBOX") AND getIntake.HCPCDX29TBOX NEQ form.HCPCDX29TBOX>
			<cfset note = note & "HCPC DX 29 changed from <strong>[</strong>#getIntake.HCPCDX29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT29TBOX") AND getIntake.HCPCPRODUCT29TBOX NEQ form.HCPCPRODUCT29TBOX>
			<cfset note = note & "HCPC PRODUCT 29 changed from <strong>[</strong>#getIntake.HCPCPRODUCT29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY29TBOX") AND getIntake.HCPCQTY29TBOX NEQ form.HCPCQTY29TBOX>
			<cfset note = note & "HCPC QUANTITY 29 changed from <strong>[</strong>#getIntake.HCPCQTY29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST29TBOX") AND getIntake.HCPCCOST29TBOX NEQ form.HCPCCOST29TBOX>
			<cfset note = note & "HCPC COST 29 changed from <strong>[</strong>#getIntake.HCPCCOST29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH29TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH29TBOX NEQ form.HCPCLENGTHOFNEEDMONTH29TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 29 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR29TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR29TBOX NEQ form.HCPCLENGTHOFNEEDYEAR29TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 29 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR29TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR29TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE30TBOX") AND getIntake.HCPCCODE30TBOX NEQ form.HCPCCODE30TBOX>
			<cfset note = note & "HCPC CODE 30 changed from <strong>[</strong>#getIntake.HCPCCODE30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS30TBOX") AND getIntake.HCPCDIAGNOSIS30TBOX NEQ form.HCPCDIAGNOSIS30TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 30 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX30TBOX") AND getIntake.HCPCDX30TBOX NEQ form.HCPCDX30TBOX>
			<cfset note = note & "HCPC DX 30 changed from <strong>[</strong>#getIntake.HCPCDX30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT30TBOX") AND getIntake.HCPCPRODUCT30TBOX NEQ form.HCPCPRODUCT30TBOX>
			<cfset note = note & "HCPC PRODUCT 30 changed from <strong>[</strong>#getIntake.HCPCPRODUCT30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY30TBOX") AND getIntake.HCPCQTY30TBOX NEQ form.HCPCQTY30TBOX>
			<cfset note = note & "HCPC QUANTITY 30 changed from <strong>[</strong>#getIntake.HCPCQTY30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST30TBOX") AND getIntake.HCPCCOST30TBOX NEQ form.HCPCCOST30TBOX>
			<cfset note = note & "HCPC COST 30 changed from <strong>[</strong>#getIntake.HCPCCOST30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH30TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH30TBOX NEQ form.HCPCLENGTHOFNEEDMONTH30TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 30 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR30TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR30TBOX NEQ form.HCPCLENGTHOFNEEDYEAR30TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 30 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR30TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR30TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE31TBOX") AND getIntake.HCPCCODE31TBOX NEQ form.HCPCCODE31TBOX>
			<cfset note = note & "HCPC CODE 31 changed from <strong>[</strong>#getIntake.HCPCCODE31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS31TBOX") AND getIntake.HCPCDIAGNOSIS31TBOX NEQ form.HCPCDIAGNOSIS31TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 31 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX31TBOX") AND getIntake.HCPCDX31TBOX NEQ form.HCPCDX31TBOX>
			<cfset note = note & "HCPC DX 31 changed from <strong>[</strong>#getIntake.HCPCDX31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT31TBOX") AND getIntake.HCPCPRODUCT31TBOX NEQ form.HCPCPRODUCT31TBOX>
			<cfset note = note & "HCPC PRODUCT 31 changed from <strong>[</strong>#getIntake.HCPCPRODUCT31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY31TBOX") AND getIntake.HCPCQTY31TBOX NEQ form.HCPCQTY31TBOX>
			<cfset note = note & "HCPC QUANTITY 31 changed from <strong>[</strong>#getIntake.HCPCQTY31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST31TBOX") AND getIntake.HCPCCOST31TBOX NEQ form.HCPCCOST31TBOX>
			<cfset note = note & "HCPC COST 31 changed from <strong>[</strong>#getIntake.HCPCCOST31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH31TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH31TBOX NEQ form.HCPCLENGTHOFNEEDMONTH31TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 31 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR31TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR31TBOX NEQ form.HCPCLENGTHOFNEEDYEAR31TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 31 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR31TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR31TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE32TBOX") AND getIntake.HCPCCODE32TBOX NEQ form.HCPCCODE32TBOX>
			<cfset note = note & "HCPC CODE 32 changed from <strong>[</strong>#getIntake.HCPCCODE32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS32TBOX") AND getIntake.HCPCDIAGNOSIS32TBOX NEQ form.HCPCDIAGNOSIS32TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 32 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX32TBOX") AND getIntake.HCPCDX32TBOX NEQ form.HCPCDX32TBOX>
			<cfset note = note & "HCPC DX 32 changed from <strong>[</strong>#getIntake.HCPCDX32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT32TBOX") AND getIntake.HCPCPRODUCT32TBOX NEQ form.HCPCPRODUCT32TBOX>
			<cfset note = note & "HCPC PRODUCT 32 changed from <strong>[</strong>#getIntake.HCPCPRODUCT32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY32TBOX") AND getIntake.HCPCQTY32TBOX NEQ form.HCPCQTY32TBOX>
			<cfset note = note & "HCPC QUANTITY 32 changed from <strong>[</strong>#getIntake.HCPCQTY32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST32TBOX") AND getIntake.HCPCCOST32TBOX NEQ form.HCPCCOST32TBOX>
			<cfset note = note & "HCPC COST 32 changed from <strong>[</strong>#getIntake.HCPCCOST32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH32TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH32TBOX NEQ form.HCPCLENGTHOFNEEDMONTH32TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 32 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR32TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR32TBOX NEQ form.HCPCLENGTHOFNEEDYEAR32TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 32 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR32TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR32TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE33TBOX") AND getIntake.HCPCCODE33TBOX NEQ form.HCPCCODE33TBOX>
			<cfset note = note & "HCPC CODE 33 changed from <strong>[</strong>#getIntake.HCPCCODE33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS33TBOX") AND getIntake.HCPCDIAGNOSIS33TBOX NEQ form.HCPCDIAGNOSIS33TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 33 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX33TBOX") AND getIntake.HCPCDX33TBOX NEQ form.HCPCDX33TBOX>
			<cfset note = note & "HCPC DX 33 changed from <strong>[</strong>#getIntake.HCPCDX33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT33TBOX") AND getIntake.HCPCPRODUCT33TBOX NEQ form.HCPCPRODUCT33TBOX>
			<cfset note = note & "HCPC PRODUCT 33 changed from <strong>[</strong>#getIntake.HCPCPRODUCT33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY33TBOX") AND getIntake.HCPCQTY33TBOX NEQ form.HCPCQTY33TBOX>
			<cfset note = note & "HCPC QUANTITY 33 changed from <strong>[</strong>#getIntake.HCPCQTY33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST33TBOX") AND getIntake.HCPCCOST33TBOX NEQ form.HCPCCOST33TBOX>
			<cfset note = note & "HCPC COST 33 changed from <strong>[</strong>#getIntake.HCPCCOST33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH33TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH33TBOX NEQ form.HCPCLENGTHOFNEEDMONTH33TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 33 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR33TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR33TBOX NEQ form.HCPCLENGTHOFNEEDYEAR33TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 33 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR33TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR33TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE34TBOX") AND getIntake.HCPCCODE34TBOX NEQ form.HCPCCODE34TBOX>
			<cfset note = note & "HCPC CODE 34 changed from <strong>[</strong>#getIntake.HCPCCODE34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS34TBOX") AND getIntake.HCPCDIAGNOSIS34TBOX NEQ form.HCPCDIAGNOSIS34TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 34 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX34TBOX") AND getIntake.HCPCDX34TBOX NEQ form.HCPCDX34TBOX>
			<cfset note = note & "HCPC DX 34 changed from <strong>[</strong>#getIntake.HCPCDX34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT34TBOX") AND getIntake.HCPCPRODUCT34TBOX NEQ form.HCPCPRODUCT34TBOX>
			<cfset note = note & "HCPC PRODUCT 34 changed from <strong>[</strong>#getIntake.HCPCPRODUCT34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY34TBOX") AND getIntake.HCPCQTY34TBOX NEQ form.HCPCQTY34TBOX>
			<cfset note = note & "HCPC QUANTITY 34 changed from <strong>[</strong>#getIntake.HCPCQTY34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST34TBOX") AND getIntake.HCPCCOST34TBOX NEQ form.HCPCCOST34TBOX>
			<cfset note = note & "HCPC COST 34 changed from <strong>[</strong>#getIntake.HCPCCOST34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH34TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH34TBOX NEQ form.HCPCLENGTHOFNEEDMONTH34TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 34 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR34TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR34TBOX NEQ form.HCPCLENGTHOFNEEDYEAR34TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 34 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR34TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR34TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE35TBOX") AND getIntake.HCPCCODE35TBOX NEQ form.HCPCCODE35TBOX>
			<cfset note = note & "HCPC CODE 35 changed from <strong>[</strong>#getIntake.HCPCCODE35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS35TBOX") AND getIntake.HCPCDIAGNOSIS35TBOX NEQ form.HCPCDIAGNOSIS35TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 35 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX35TBOX") AND getIntake.HCPCDX35TBOX NEQ form.HCPCDX35TBOX>
			<cfset note = note & "HCPC DX 35 changed from <strong>[</strong>#getIntake.HCPCDX35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT35TBOX") AND getIntake.HCPCPRODUCT35TBOX NEQ form.HCPCPRODUCT35TBOX>
			<cfset note = note & "HCPC PRODUCT 35 changed from <strong>[</strong>#getIntake.HCPCPRODUCT35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY35TBOX") AND getIntake.HCPCQTY35TBOX NEQ form.HCPCQTY35TBOX>
			<cfset note = note & "HCPC QUANTITY 35 changed from <strong>[</strong>#getIntake.HCPCQTY35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST35TBOX") AND getIntake.HCPCCOST35TBOX NEQ form.HCPCCOST35TBOX>
			<cfset note = note & "HCPC COST 35 changed from <strong>[</strong>#getIntake.HCPCCOST35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH35TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH35TBOX NEQ form.HCPCLENGTHOFNEEDMONTH35TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 35 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR35TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR35TBOX NEQ form.HCPCLENGTHOFNEEDYEAR35TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 35 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR35TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR35TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE36TBOX") AND getIntake.HCPCCODE36TBOX NEQ form.HCPCCODE36TBOX>
			<cfset note = note & "HCPC CODE 36 changed from <strong>[</strong>#getIntake.HCPCCODE36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS36TBOX") AND getIntake.HCPCDIAGNOSIS36TBOX NEQ form.HCPCDIAGNOSIS36TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 36 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX36TBOX") AND getIntake.HCPCDX36TBOX NEQ form.HCPCDX36TBOX>
			<cfset note = note & "HCPC DX 36 changed from <strong>[</strong>#getIntake.HCPCDX36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT36TBOX") AND getIntake.HCPCPRODUCT36TBOX NEQ form.HCPCPRODUCT36TBOX>
			<cfset note = note & "HCPC PRODUCT 36 changed from <strong>[</strong>#getIntake.HCPCPRODUCT36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY36TBOX") AND getIntake.HCPCQTY36TBOX NEQ form.HCPCQTY36TBOX>
			<cfset note = note & "HCPC QUANTITY 36 changed from <strong>[</strong>#getIntake.HCPCQTY36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST36TBOX") AND getIntake.HCPCCOST36TBOX NEQ form.HCPCCOST36TBOX>
			<cfset note = note & "HCPC COST 36 changed from <strong>[</strong>#getIntake.HCPCCOST36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH36TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH36TBOX NEQ form.HCPCLENGTHOFNEEDMONTH36TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 36 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR36TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR36TBOX NEQ form.HCPCLENGTHOFNEEDYEAR36TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 36 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR36TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR36TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE37TBOX") AND getIntake.HCPCCODE37TBOX NEQ form.HCPCCODE37TBOX>
			<cfset note = note & "HCPC CODE 37 changed from <strong>[</strong>#getIntake.HCPCCODE37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS37TBOX") AND getIntake.HCPCDIAGNOSIS37TBOX NEQ form.HCPCDIAGNOSIS37TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 37 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX37TBOX") AND getIntake.HCPCDX37TBOX NEQ form.HCPCDX37TBOX>
			<cfset note = note & "HCPC DX 37 changed from <strong>[</strong>#getIntake.HCPCDX37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT37TBOX") AND getIntake.HCPCPRODUCT37TBOX NEQ form.HCPCPRODUCT37TBOX>
			<cfset note = note & "HCPC PRODUCT 37 changed from <strong>[</strong>#getIntake.HCPCPRODUCT37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY37TBOX") AND getIntake.HCPCQTY37TBOX NEQ form.HCPCQTY37TBOX>
			<cfset note = note & "HCPC QUANTITY 37 changed from <strong>[</strong>#getIntake.HCPCQTY37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST37TBOX") AND getIntake.HCPCCOST37TBOX NEQ form.HCPCCOST37TBOX>
			<cfset note = note & "HCPC COST 37 changed from <strong>[</strong>#getIntake.HCPCCOST37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH37TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH37TBOX NEQ form.HCPCLENGTHOFNEEDMONTH37TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 37 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR37TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR37TBOX NEQ form.HCPCLENGTHOFNEEDYEAR37TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 37 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR37TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR37TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE38TBOX") AND getIntake.HCPCCODE38TBOX NEQ form.HCPCCODE38TBOX>
			<cfset note = note & "HCPC CODE 38 changed from <strong>[</strong>#getIntake.HCPCCODE38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS38TBOX") AND getIntake.HCPCDIAGNOSIS38TBOX NEQ form.HCPCDIAGNOSIS38TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 38 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX38TBOX") AND getIntake.HCPCDX38TBOX NEQ form.HCPCDX38TBOX>
			<cfset note = note & "HCPC DX 38 changed from <strong>[</strong>#getIntake.HCPCDX38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT38TBOX") AND getIntake.HCPCPRODUCT38TBOX NEQ form.HCPCPRODUCT38TBOX>
			<cfset note = note & "HCPC PRODUCT 38 changed from <strong>[</strong>#getIntake.HCPCPRODUCT38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY38TBOX") AND getIntake.HCPCQTY38TBOX NEQ form.HCPCQTY38TBOX>
			<cfset note = note & "HCPC QUANTITY 38 changed from <strong>[</strong>#getIntake.HCPCQTY38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST38TBOX") AND getIntake.HCPCCOST38TBOX NEQ form.HCPCCOST38TBOX>
			<cfset note = note & "HCPC COST 38 changed from <strong>[</strong>#getIntake.HCPCCOST38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH38TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH38TBOX NEQ form.HCPCLENGTHOFNEEDMONTH38TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 38 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR38TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR38TBOX NEQ form.HCPCLENGTHOFNEEDYEAR38TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 38 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR38TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR38TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE39TBOX") AND getIntake.HCPCCODE39TBOX NEQ form.HCPCCODE39TBOX>
			<cfset note = note & "HCPC CODE 39 changed from <strong>[</strong>#getIntake.HCPCCODE39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS39TBOX") AND getIntake.HCPCDIAGNOSIS39TBOX NEQ form.HCPCDIAGNOSIS39TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 39 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX39TBOX") AND getIntake.HCPCDX39TBOX NEQ form.HCPCDX39TBOX>
			<cfset note = note & "HCPC DX 39 changed from <strong>[</strong>#getIntake.HCPCDX39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT39TBOX") AND getIntake.HCPCPRODUCT39TBOX NEQ form.HCPCPRODUCT39TBOX>
			<cfset note = note & "HCPC PRODUCT 39 changed from <strong>[</strong>#getIntake.HCPCPRODUCT39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY39TBOX") AND getIntake.HCPCQTY39TBOX NEQ form.HCPCQTY39TBOX>
			<cfset note = note & "HCPC QUANTITY 39 changed from <strong>[</strong>#getIntake.HCPCQTY39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST39TBOX") AND getIntake.HCPCCOST39TBOX NEQ form.HCPCCOST39TBOX>
			<cfset note = note & "HCPC COST 39 changed from <strong>[</strong>#getIntake.HCPCCOST39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH39TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH39TBOX NEQ form.HCPCLENGTHOFNEEDMONTH39TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 39 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR39TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR39TBOX NEQ form.HCPCLENGTHOFNEEDYEAR39TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 39 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR39TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR39TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCODE40TBOX") AND getIntake.HCPCCODE40TBOX NEQ form.HCPCCODE40TBOX>
			<cfset note = note & "HCPC CODE 40 changed from <strong>[</strong>#getIntake.HCPCCODE40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCODE40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDIAGNOSIS40TBOX") AND getIntake.HCPCDIAGNOSIS40TBOX NEQ form.HCPCDIAGNOSIS40TBOX>
			<cfset note = note & "HCPC DIAGNOSIS 40 changed from <strong>[</strong>#getIntake.HCPCDIAGNOSIS40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDIAGNOSIS40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCDX40TBOX") AND getIntake.HCPCDX40TBOX NEQ form.HCPCDX40TBOX>
			<cfset note = note & "HCPC DX 40 changed from <strong>[</strong>#getIntake.HCPCDX40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCDX40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCPRODUCT40TBOX") AND getIntake.HCPCPRODUCT40TBOX NEQ form.HCPCPRODUCT40TBOX>
			<cfset note = note & "HCPC PRODUCT 40 changed from <strong>[</strong>#getIntake.HCPCPRODUCT40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCPRODUCT40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCQTY40TBOX") AND getIntake.HCPCQTY40TBOX NEQ form.HCPCQTY40TBOX>
			<cfset note = note & "HCPC QUANTITY 40 changed from <strong>[</strong>#getIntake.HCPCQTY40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCQTY40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCCOST40TBOX") AND getIntake.HCPCCOST40TBOX NEQ form.HCPCCOST40TBOX>
			<cfset note = note & "HCPC COST 40 changed from <strong>[</strong>#getIntake.HCPCCOST40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCCOST40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH40TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH40TBOX NEQ form.HCPCLENGTHOFNEEDMONTH40TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED MONTH 40 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDMONTH40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDMONTH40TBOX#<strong>]</strong><br>">
		</cfif>
		<cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR40TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR40TBOX NEQ form.HCPCLENGTHOFNEEDYEAR40TBOX>
			<cfset note = note & "HCPC LENGTH OF NEED YEAR 40 changed from <strong>[</strong>#getIntake.HCPCLENGTHOFNEEDYEAR40TBOX#<strong>]</strong> to <strong>[</strong>#form.HCPCLENGTHOFNEEDYEAR40TBOX#<strong>]</strong><br>">
		</cfif>



		<!-------------------------------------------------------------------------------------->
		<!--- Add the new Note.                                                              --->
		<!-------------------------------------------------------------------------------------->
		<cfif note NEQ "<font color=FF0000>SYSTEM INPUT NOTE: INTAKE CHANGED</font><br>">

			<cfset request.intakeNote = CreateObject("component","com.common.Note")>

			<cfset intakeNoteID = request.intakeNote.getNoteID(objectID: 8, instanceID: trim(form.intakeID), clientID: trim(session.clientID))>

			<!-------------------------------------------------------------------------------------->
			<!--- If at this point the noteID is not available it means that the instance does   --->
			<!--- not have a note attached to it. Go ahead and create the note for this          --->
			<!--- object instance.                                                               --->
			<!-------------------------------------------------------------------------------------->
			<cfif NOT IsNumeric(intakeNoteID) AND IsNumeric(intakeID)>
				<cfset intakeNoteID = request.intakeNote.addNote(clientID: trim(session.clientID), objectID: 8, instanceID: trim(intakeID))>
			</cfif>

			<cfset request.intakeNote.addNoteEntry(clientID: trim(session.clientID), NoteID: intakeNoteID, noteEntry: '#trim(note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>

		</cfif>

