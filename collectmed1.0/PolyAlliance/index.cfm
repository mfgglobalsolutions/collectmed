


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->			
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>	
	


<!-------------------------------------------------------------------------------------->
<!--- If there is a message sent display it.                                         --->
<!-------------------------------------------------------------------------------------->
<cfif msg NEQ "">
	<cfoutput>			
		<div align="center">
			<table cellspacing="2" cellpadding="2" border="0">
				<tr>
				    <td><font face="Verdana" size="4" color="FF0000"><strong>#trim(msg)#</strong></font></td>
				</tr>
			</table>
		</div>						
	</cfoutput>
</cfif>	



	
<br><br>
&nbsp;&nbsp;&nbsp;<a href="appCreateAccount.cfm">Create New Account</a>
<br><br>
				

<cfquery name="checkExistsClient" datasource="PA_Master">
	SELECT clientID
	FROM Client  
	WHERE ClientID > 1094
</cfquery>

<Cfloop query="checkExistsClient">	
	
	<cfoutput>[#clientID#]<br></cfoutput>
	
</CFLOOP>

