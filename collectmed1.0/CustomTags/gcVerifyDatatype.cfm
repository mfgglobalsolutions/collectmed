<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---  gcVerifyDatatype.cfm                                      --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---  General                                                   --->
<!--- @@CATEGORY@@                                               --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---  Guillermo Cruz                                            --->
<!--- @@AUTHOR@@                                                 --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag takes in a parameter along with its datatype      --->
<!--- to validate it against and stops the user form advancing   --->
<!--- until the correct datatype is sent in.                     --->
<!--- @@DESCRIPTION@@                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!---   &lt;cf_gcVerifyDatatype                                  --->
<!---      field="[fieldvalue]"                                  --->
<!---      datatype="date"&gt;                                   --->
<!---@@ExampleCall@@                                             --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!--- field                                                      --->
<!--- <br>datatype                                               --->
<!--- <br>fieldvalue                                             --->
<!---@@RequiredParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!---  [None]                                                    --->  
<!---@@OptionalParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!---  [None]                                                    --->  
<!---@@ReturnedParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---   &nbsp;  Created 02/28/04                                 --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.field" default="">
	<cfset field = attributes.field>
	
	<cfparam name="attributes.datatype" default="">
	<cfset datatype = attributes.datatype>
	
	<cfparam name="attributes.fieldname" default="">
	<cfset fieldname = attributes.fieldname>
	
	<cfparam name="attributes.fieldvalue" default="">
	<cfset fieldvalue = attributes.fieldvalue>
	
	<cfparam name="attributes.back" default="no">
	<cfset back = attributes.back>
	
	<cfparam name="attributes.sendErrorToCaller" default="no">
	<cfset sendErrorToCaller = attributes.sendErrorToCaller>
	
	
	
<!------------------------------------------------------------------>
<!--- Make sure the variables needed for this tag are present.   --->
<!------------------------------------------------------------------>	
	<cf_gcVerifyFields
		fields="field,datatype,fieldValue"		
		callingtemplatename="gcVerifyDatatype.cfm">			
	
	

<!------------------------------------------------------------------>
<!--- Start the checking of the field against its datatype.      --->
<!------------------------------------------------------------------>
	<!---<cfif datatype EQ "numeric">			
				
		<cfif Find(",", fieldValue, 1) GTE 1>
			
			<cfloop list="#fieldValue#" index="i">			
				
				<cfif NOT IsNumeric("#i#")>
					<cfset message = "This field ""#fieldname#"" must be <b>numeric</b>.">
					<cf_gcGeneralErrorTemplate message="#message#" back="#back#">
				</cfif>	
				
			</cfloop>
			
		<cfelse>
			
			<cfif NOT IsNumeric("#fieldValue#")>
				<cfset message = "This field ""#fieldname#"" must be <b>numeric</b>.">
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">
			</cfif>	
			
		</cfif>
			
		
	<cfelseif datatype EQ "date">--->
	<cfif datatype EQ "date">	
	
		<cfif NOT IsDate("#fieldValue#")>
			
			<cfset message = "This field ""#fieldname#"" must be a <b>Date</b>.">
			
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">
			</cfif>
				
		</cfif>
		
	<cfelseif datatype EQ "email">
		
		<cf_gcIsValidEmailAddress
			email="#fieldValue#">
				
		<cfif NOT validEmail>
			
			<cfset message = "This field ""#fieldname#"" must be a correctly formatted <b>Email Address</b>.">
			
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">
			</cfif>
			
			
		</cfif>
		
	<cfelseif datatype eq "money">
		
		<cfset initialValue = fieldValue>	       
        <cfset fieldValue = replace(fieldValue, ".", "", "ALL")>
        <cfset fieldValue = replace(fieldValue, "$", "", "ALL")>		
		
		<cfif NOT IsNumeric("fieldValue")>				
			<cfset message = """#initialValue#"" This field must be <b>Numeric</b>.">
			
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">	
			</cfif>
				
				
		</cfif>
		
	<cfelseif datatype eq "ssn">		
		
		<cfset initialValue = fieldValue>	
		<cfset fieldValue = replace(fieldValue, " ", "", "ALL")>
        <cfset fieldValue = replace(fieldValue, "-", "", "ALL")>
		
		<cfif NOT IsNumeric("#fieldValue#")>
			<cfset message = """#initialValue#"" This field must be <b>Numeric</b>.">
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">	
			</cfif>
			
		<cfelseif Len("#fieldValue#") NEQ 9>
			<cfset message = """#initialValue#"" This field must be 9 numerical digits long.">
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">	
			</cfif>				
		</cfif>	
	
	<cfelseif datatype eq "phone">
		
		<cfset initialValue = fieldValue>	
		<cfset fieldValue = replace(fieldValue, " ", "", "ALL")>
        <cfset fieldValue = replace(fieldValue, "-", "", "ALL")>
        <cfset fieldValue = replace(fieldValue, "(", "", "ALL")>
        <cfset fieldValue = replace(fieldValue, ")", "", "ALL")>
		
		<cfif NOT IsNumeric("#fieldValue#")>
			<cfset message = """#initialValue#"" This field must be <b>Numeric</b>.">
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">	
			</cfif>						
		</cfif>		
		
	<!------------------------------------------------------------------>
	<!--- DECIMAL, NUMERIC                                           --->
	<!--- While you can place the following characters in the        --->
	<!--- fields [Numeric, negative, decimal point, comma] the       --->
	<!--- decimal point and comma get truncated at insertion into    --->
	<!--- the table. so we cannot except the precision. only         --->
	<!--- numerics and the negative.                                 --->
	<!------------------------------------------------------------------>		
	<cfelseif datatype eq "decimal" OR datatype eq "numeric">		
	
		<cfif (len(fieldValue) NEQ len(rereplace(fieldValue,"[^-1234567890]","","all")))>
			<cfset message = "<strong>""#fieldname#"" value (#fieldValue#):</strong> can only contain Numbers, and Negative sign.">
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">	
			</cfif>
		</cfif>		
		
			
	<!------------------------------------------------------------------>
	<!--- SMALLINT                                                   --->
	<!--- small int can only be called with commas, negative,        --->
	<!--- numbers and decimal point.                                 --->
	<!------------------------------------------------------------------>		
	<cfelseif datatype eq "smallint">				
		
		<cfif len(fieldValue) NEQ len(rereplace(fieldValue,"[^-,.1234567890]","","all")) OR rereplace(fieldValue,"[^-.1234567890]","","all") LTE -32768 OR rereplace(fieldValue,"[^-.1234567890]","","all") GTE 32768>
			<cfset message = "<strong>""#fieldname#"" value (#fieldValue#):</strong> can only contain Numbers, Comma, Decimal Point and Negative sign and must get greater than -32,768 and less than 32,768.">
			<cfif sendErrorToCaller EQ "yes">
				<cfset caller.errorMessage = message>
			<cfelse>
				<cf_gcGeneralErrorTemplate message="#message#" back="#back#">	
			</cfif>						
		</cfif>			
									
	</cfif>		
	
	
			