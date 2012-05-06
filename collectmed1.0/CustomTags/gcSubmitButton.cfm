

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.randRange" default="#randRange(1001, 2252)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.value" default="Save">
	<cfset value = attributes.value>
	
	<cfparam name="attributes.message" default="Processing">
	<cfset message = attributes.message>
	
	<cfparam name="attributes.onclick" default="">
	<cfset onclick = attributes.onclick>
	
	<cfparam name="attributes.tabindex" default="">
	<cfset tabindex = attributes.tabindex>
	
	<cfparam name="attributes.disabled" default="false">
	<cfset disabled = attributes.disabled>
	
	<cfparam name="attributes.display" default="inline">
	<cfset display = attributes.display>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif disabled>
		<cfset disabled = "disabled">
	<cfelse>
		<cfset disabled = "">	
	</cfif>
	
	<cfoutput>
	
		<script language="JavaScript">
			function indicator#trim(randRange)#(){
				var indicatorVar#trim(randRange)# = 'document.getElementById(\"spSubmitButton#trim(randRange)#\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
				eval(indicatorVar#trim(randRange)#);
			};
		</script>
	
		<input #trim(disabled)# tabindex="#trim(tabindex)#" type="submit" id="SubmitButton#trim(randRange)#" class="SiteSubmitbox" style="display: '#trim(display)#';" value="#trim(value)#" onclick="<cfif onclick NEQ "">#trim(onclick)# </cfif>this.style.display='none'; indicator#trim(randRange)#();"><span id="spSubmitButton#trim(randRange)#" class="TextWarning" style="font-size: x-small;"></span><!---spSubmitButton#trim(randRange)#.innerText='#trim(message)#...';--->
	
	</cfoutput>
	
	<cfset caller.submitButtonID = trim(randRange)>
	

