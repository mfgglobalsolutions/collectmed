<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.row" default="">
	<cfset row = attributes.row>
	
	<cfparam name="attributes.header" default="">
	<cfset header = attributes.header>
	
	<cfparam name="attributes.hideContent" default="">
	<cfset hideContent = attributes.hideContent>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="row,header"
		fieldnames="Row,Header">	
	

			
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
	
		<script language="JavaScript">
			function ImageSwap_#row#(){array=document.images.PlusMinus_#row#.src.split("/");if (array[array.length-1] == 'minus.gif'){document.images.PlusMinus_#row#.src='images/plus.gif';}else{document.images.PlusMinus_#row#.src='images/minus.gif';}}
			function toggle_#row#(){if(document.all.hidden_#row#.style.display=='none') {document.all.hidden_#row#.style.display='block';}else {document.all.hidden_#row#.style.display='none';}}
		</script>	
				
		<table cellspacing="0" cellpadding="4" border="0">
			<tr>
			    <td colspan="2" class="sitelabel"><img height=9 alt="" src="images/plus.gif" name="PlusMinus_#row#" width=9 border=0 id="toggleImage_#row#" onclick="ImageSwap_#row#(),toggle_#row#()">#trim(header)#</td>
			</tr>			
			<tr style="display:none" id="hidden_#row#">
			    <td class="sitelabel">&nbsp;&nbsp;</td><td class="sitelabel">#trim(hideContent)#</td>
			</tr>			
		</table>
		
	</cfoutput>