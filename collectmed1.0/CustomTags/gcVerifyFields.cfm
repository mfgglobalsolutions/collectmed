<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcVerifyFields.cfm                                       --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---    General                                                 --->
<!--- @@CATEGORY@@                                               --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---  Guillermo Cruz                                            --->
<!--- @@AUTHOR@@                                                 --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag will take in the names of the variables that      --->
<!--- the calling page needs in order to its minimum work.       --->
<!--- Say for instance you need a variables called "firstName"   --->
<!--- and "lastName" on your calling page. You simply call       --->
<!--- this tag before any other code on the page you need them   --->
<!--- on and it will make sure that the variables are            --->
<!--- populated letting your page do its work without causing    --->
<!--- an error. It gracefully reminds you that the variables     --->
<!--- are needed to process the calling page. This tag will      --->
<!--- help in the fight against robots trying to access calling  --->
<!--- pages directly and causing Cold Fusion Administrator       --->
<!--- errors. <br>                                               --->
<!--- <br> This tag also supports verifying that a parameter is  --->
<!--- of a certain datatype.<br>                                 --->
<!--- Including:<br>                                             --->
<!--- email,numeric,date,money,ssn,phone                         --->
<!--- @@DESCRIPTION@@                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!--- 	&lt;cf_gcVerifyFields                                    --->
<!---   	<br>fields="url.firstName,form.lastName"             --->
<!---    	<br>fieldNames="First Name, Last Name"&gt;           --->
<!---    <br><br>                                                --->
<!---  Calling and locating them somewhere else: <br>            --->
<!--- 	&lt;cf_gcVerifyFields                                    --->
<!---   	<br>location="../MainBody.cfm?errmsg=#msg#"          --->
<!---   	<br>fields="firstName,lastName"                      --->
<!---   	<br>fieldNames="First Name, Last Name"&gt;           --->
<!---    <br><br>                                                --->
<!--- Calling with datatype validation <br>                      --->
<!---  &lt;cf_gcVerifyFields <br>                                --->
<!--- fields="testNumeric,testEmail,testNo,testDate"  <br>       --->
<!--- fieldnames="Numeric Test,Email Test,No Test,Date Test"<br> --->
<!---    datatypes="numeric,email,*,date"> <br><br>              --->
<!--- IMPORTANT NOTE: the tag will evaluate the value of the     --->
<!--- field. If you use the datatypes parameter you must use     --->
<!--- a star(*) in the list for those fields you do NOT want     --->
<!--- to check the datatype of. <br>                             --->
<!---@@ExampleCall@@                                             --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!---   fields                                                   --->  
<!---@@RequiredParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!--- fieldnames                                                 --->
<!--- <br>datatypes                                              --->
<!--- <br>title                                                  --->
<!--- <br>subtitle                                               --->
<!--- <br>location                                               --->   
<!--- <br>message                                                --->  
<!--- <br>callingTemplateName                                    --->  
<!---@@OptionalParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!---   [None]                                                   --->  
<!---@@ReturnedParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---   &nbsp;Created 10/21/03                                   --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>	
	<cfparam name="attributes.Fields" default="">
	<cfset Fields = attributes.Fields>	
	
	<cfparam name="attributes.FieldNames" default="#trim(Fields)#">
	<cfset FieldNames = attributes.FieldNames>	
	
	<cfparam name="attributes.requiredFieldsList" default="">
	<cfset requiredFieldsList = attributes.requiredFieldsList>
	
	<cfparam name="attributes.requiredFieldNamesList" default="">
	<cfset requiredFieldNamesList = attributes.requiredFieldNamesList>

	<cfparam name="attributes.title" default="Page Error">
	<cfset title = attributes.title>

	<cfparam name="attributes.subtitle" default="There was an error in the information being processed.">
	<cfset subtitle = attributes.subtitle>
	
	<cfparam name="attributes.message" default="">
	<cfset message = attributes.message>
	
	<cfparam name="attributes.errorMessage" default="">
	<cfset errorMessage = attributes.errorMessage>
	
	<cfparam name="attributes.location" default="">
	<cfset location = attributes.location>
	
	<cfparam name="attributes.callingTemplateName" default="#GetBaseTemplatePath()#">
	<cfset callingTemplateName = attributes.callingTemplateName>
	
	<cfparam name="attributes.datatypes" default="">
	<cfset datatypes = attributes.datatypes>
	
	<cfparam name="attributes.supportedDatatypes" default="email,numeric,date,money,ssn,phone,smallint,decimal">
	<cfset supportedDatatypes = attributes.supportedDatatypes>
	
	<cfparam name="attributes.back" default="no">
	<cfset back = attributes.back>
	
	<cfparam name="attributes.sendErrorToCaller" default="no">
	<cfset sendErrorToCaller = attributes.sendErrorToCaller>
	
	
					
<!------------------------------------------------------------------>
<!--- If the tag sends in Fields and FieldNames not              --->
<!--- matching in length then cancel and throw error.            --->
<!------------------------------------------------------------------>		
<cfif ListLen(Fields) NEQ ListLen(FieldNames)>
	<cfset errorMessage="The elements in the Fields and the FieldNames attributes does match please check the variables.">
</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the user has sent in any kind of datatypes the list must match the length   --->
<!--- of the fields parameter.                                                       --->
<!-------------------------------------------------------------------------------------->
<cfif datatypes NEQ "">
	<cfif ListLen(Fields) neq ListLen(datatypes)>
		<cfset errorMessage="The elements in the Fields and the datatypes attributes does match please check the variables.">
	</cfif>
</cfif>

	
	
<!-------------------------------------------------------------------------------------->
<!--- If at this time the errorMessage is not filled go ahead and process the        --->
<!--- individual fields.                                                             --->
<!-------------------------------------------------------------------------------------->	
<cfif errorMessage EQ "">
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Loop through the fields and find out if the field is actually defined.         --->
	<!-------------------------------------------------------------------------------------->		
	<cfset count = 1>
	
	<cfloop list="#trim(fields)#" index="field">
	
		<cfset fieldValue = "caller.#trim(field)#">		
	
		<cfif NOT IsDefined("caller.#trim(field)#") OR trim(evaluate(fieldValue)) EQ "">
			<cfset requiredFieldsList = ListAppend(requiredFieldsList,field)>
			<cfset requiredFieldNamesList = ListAppend(requiredFieldNamesList,ListGetAt(FieldNames,count))>			
		</cfif>
		
						
		<!------------------------------------------------------------------>
		<!--- Check against the datatype that was sent in.               --->
		<!------------------------------------------------------------------>
		<cfif datatypes NEQ "">
			
			<cfset datatype = ListGetAt(datatypes,ListFindNoCase(fields,field))>
									
			<cfif datatype NEQ "*" AND ListFindNoCase(supportedDatatypes,datatype) NEQ 0 AND IsDefined("caller.#trim(field)#") AND trim(evaluate(fieldValue)) NEQ "">
				
				<cfset fieldValue = trim(evaluate(fieldValue))>
				<cfset fieldname = ListGetAt(fieldnames,ListFindNoCase(fields,field))>
				
				<cf_gcVerifyDatatype 
					field="#trim(field)#" 
					fieldvalue="#trim(fieldValue)#" 
					fieldname="#trim(fieldname)#" 
					datatype="#trim(datatype)#"
					back="#trim(back)#"
					sendErrorToCaller="#trim(sendErrorToCaller)#">
				
				<cfif IsDefined("errorMessage") AND errorMessage NEQ "">
					<cfset caller.errorMessage = errorMessage>
					<cfexit>
				</cfif>	
					
			<cfelseif datatype NEQ "*" AND ListFindNoCase(supportedDatatypes,datatype) EQ 0>
			  	<cfset errorMessage="""<strong>#datatype#</strong>"" is not a supported datatype.">
				<cfbreak>
			</cfif>
					
		</cfif>
		
		<cfset count = count + 1>
			
	</cfloop>
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- If no errors to this point                                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cfif errorMessage EQ "" AND ListLen(requiredFieldsList) GTE 1>
	
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the fields and add them to the errormessage to be viewed.                 --->
		<!-------------------------------------------------------------------------------------->	
		<cfloop list="#trim(requiredFieldNamesList)#" index="i">					
			<cfset add = "<li><strong>#trim(i)#</strong></li>">					
			<cfset message = ListAppend(message,add)>						
		</cfloop>
		
		<cfset errorMessage = "<br>&nbsp;&nbsp;These fields are required:<ul>" & message & "</ul>">
	
	</cfif>
	
	
</cfif>


		
<!-------------------------------------------------------------------------------------->
<!--- If the page has a location defined send them where the location states.        --->
<!-------------------------------------------------------------------------------------->			
<cfif location EQ "" AND sendErrorToCaller EQ "yes">					 	
	
	<cfset caller.errorMessage = errorMessage>
		
<!-------------------------------------------------------------------------------------->
<!--- Show the error locally on the page.                                            --->
<!-------------------------------------------------------------------------------------->						
<cfelseif errorMessage NEQ "" AND location EQ "">	
				
	<cf_gcGeneralErrorTemplate message="#trim(errorMessage)#">			
				
<!-------------------------------------------------------------------------------------->
<!--- If the page has a location defined send them where the location states.        --->
<!-------------------------------------------------------------------------------------->	
<cfelseif errorMessage NEQ "" AND trim(location) NEQ "">					 	
	
	<cfif FindNoCase("?", location)>
		<cflocation addtoken="No" url="#trim(location)#&errorMessage=#URLEncodedFormat(errorMessage)#">
	<cfelse>
		<cflocation addtoken="No" url="#trim(location)#?errorMessage=#URLEncodedFormat(errorMessage)#">	
	</cfif>
	
</cfif>

		