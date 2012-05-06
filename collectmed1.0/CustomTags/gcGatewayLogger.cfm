

<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>	
	<cfparam name="attributes.ipaddress" default="">
	<cfset ipaddress = attributes.ipaddress>
	
	<cfparam name="attributes.code" default="">
	<cfset code = attributes.code>	
	
	<cfparam name="attributes.logtext" default="No Message Defined">
	<cfset logtext = attributes.logtext>
	
	<cfparam name="attributes.showStack" default="yes">
	<cfset showStack = attributes.showStack>
	
	<cfparam name="attributes.datasource" default="">
	<cfset datasource = attributes.datasource>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="datasource"
		fieldnames="datasource">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- set the text to be logged.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfset cfcatchType = "No Type Specified">
	<cfset cfcatchMessage = logtext>
	<cfset cfcatchDetail = "*">		
	<cfset stackTrace = "">			
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the caller has thrown the error.                                            --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("caller.cfcatch")>
	
		<cfif caller.cfcatch.type NEQ "">
			<cfset cfcatchType = caller.cfcatch.type>
		</cfif>		
		<cfif caller.cfcatch.message NEQ "">
			<cfset cfcatchMessage = caller.cfcatch.message>
		</cfif>			
		<cfif caller.cfcatch.detail NEQ "">
			<cfset cfcatchDetail = caller.cfcatch.detail>
		</cfif>				
		
		<cfif showStack AND IsArray(caller.CFCATCH.TAGCONTEXT) AND ArrayLen(caller.CFCATCH.TAGCONTEXT) GTE 1>
			<cfloop index=i from=1 to="#ArrayLen(caller.CFCATCH.TAGCONTEXT)#">
				<cfset sCurrent = caller.CFCATCH.TAGCONTEXT[i]>
				
				<!---<cfset stackTrace = stackTrace & "<br>#i#" & sCurrent["ID"] & " (" & sCurrent["LINE"] & ", " & sCurrent["COLUMN"] & ") " & sCurrent["TEMPLATE"]>--->
							
				<cfset stackTrace = stackTrace & "<br>#i#">
				
				<cfif StructKeyExists(sCurrent,"ID")>
					<cfset stackTrace = stackTrace  & " ID:" & sCurrent["ID"]>
				</cfif>
				
				<cfif StructKeyExists(sCurrent,"LINE")>
					<cfset stackTrace = stackTrace & " LINE:" & sCurrent["LINE"]>
				</cfif>
				
				<cfif StructKeyExists(sCurrent,"COLUMN")>
					<cfset stackTrace = stackTrace & " COLUMN: " & sCurrent["COLUMN"]>
				</cfif>
				
				<cfif StructKeyExists(sCurrent,"TEMPLATE")>
					<cfset stackTrace = stackTrace & " TEMPLATE:" & sCurrent["TEMPLATE"]>
				</cfif>
				
			
			</cfloop>	
		<cfelse>
			<cfset stackTrace = "NO Stack Trace">		
		</cfif>
		
	
	</cfif>
	
	<cfset logtext =  "#cfcatchType#|#cfcatchMessage#|#cfcatchDetail#|#stackTrace#">				
	


<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this tag.                                              --->
<!-------------------------------------------------------------------------------------->
	<cfscript>	   
	   logger = structNew();	  
	   logger.code = #trim(code)#;
	   logger.ipaddress = #trim(ipaddress)#;	   
	   logger.logtext = "#trim(logtext)#";  	
	   logger.datasource = #trim(datasource)#; 
	</cfscript>			
		

	<cflog file="Testing" text="#logtext#">

		
<!---	<cfset status = SendGatewayMessage("LogEntry", logger)>--->
	
	