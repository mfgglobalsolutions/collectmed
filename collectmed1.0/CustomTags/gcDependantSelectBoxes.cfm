<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcDependantSelectBoxes.cfm                               --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   General                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---  Guillermo Cruz                                            --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- Sometimes you need to place a select box that is           --->
<!--- dependant on another select box but is dynamic. Say for    --->
<!--- instance you needed the user to choose which country       --->
<!--- they are from and then show the states dynamically         --->
<!--- based on their state choice. This tag will create those    --->
<!--- boxes for you and keep your data integrity. Study the      --->
<!--- list being sent and use the example to use this tag.       --->
<!--- Must be called inside a form.                              --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---	&lt;cf_gcDependantSelectBoxes<br>                        --->
<!---		formName="myForm"<br>                                ---> 
<!---		select1="Country"<br>                                ---> 
<!---		select1DefaultValue="1"<br>                          --->
<!---		select1Values="1,2"<br>                              --->
<!---		select1Display="USA,UK"<br>                          --->		
<!---		select2="State"<br>                                  --->		
<!---		select2DefaultValue="1"<br>                          --->		
<!---		groupToSelect1Value="1,1,1,2,2"<br>                  --->   
<!---		select2Values="1,2,3,1,2"<br>                        --->
<!---		select2Display="Ohio,Maine,Idaho,Glasgow,London"<br> --->
<!---       class="[class name]"&gt;                             --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!--- formName<br>                                               --->
<!--- select1<br>                                                --->
<!--- select1DefaultValue<br>                                    --->
<!--- select1Values<br>                                          --->
<!--- select1Display<br>                                         --->
<!--- select2<br>                                                --->
<!--- select2DefaultValue<br>                                    --->
<!--- groupToSelect1Value<br>                                    --->
<!--- select2Values<br>                                          --->
<!--- select2Display<br>                                         --->
<!--- class                                                      --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---  [None]                                                    --->  
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---  [Two select boxes]                                        --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>  


<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.formName" default="thisForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.select1" default="CreditOrExchangeSW">
	<cfset select1 = attributes.select1>
	
	<cfparam name="attributes.select2" default="CreditOrExchangeAction">
	<cfset select2 = attributes.select2>
	
	<cfparam name="attributes.select1DefaultValue" default="">
	<cfset select1DefaultValue = attributes.select1DefaultValue>
	
	<cfparam name="attributes.select2DefaultValue" default="">
	<cfset select2DefaultValue = attributes.select2DefaultValue>
	
	<cfparam name="attributes.select1Values" default="">
	<cfset select1Values = attributes.select1Values>
	
	<cfparam name="attributes.select1Display" default="">
	<cfset select1Display = attributes.select1Display>
	 
 	<cfparam name="attributes.groupToSelect1Value" default="">
	<cfset groupToSelect1Value = attributes.groupToSelect1Value> 
	
	<cfparam name="attributes.select2Values" default="">
	<cfset select2Values = attributes.select2Values>
	
	<cfparam name="attributes.select2Display" default="">
	<cfset select2Display = attributes.select2Display>
	
	<cfparam name="attributes.class" default="">
	<cfset class = attributes.class>
	
	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="formName,select1,select1DefaultValue,select1Values,select1Display,select2,select2DefaultValue,groupToSelect1Value,select2Values,select2Display"
		fieldnames="Form Name,Select 1 Name,Select 1 Default Value,Select 1 Values,Select 1 Display, Select 2 Name, Select 2 Default Value, Group To Select 1 Values, Select 2 Values, Select 2 Display">
		
		
		
<!------------------------------------------------------------------>
<!--- If the number of items in these lists do not match then    --->
<!--- the select boxes cannot be setup correctly.                --->
<!------------------------------------------------------------------>
	<cfif Listlen(trim(select2Values)) NEQ Listlen(trim(groupToSelect1Value)) OR Listlen(trim(select2Display)) NEQ Listlen(trim(groupToSelect1Value))>
		<cf_gcGeneralErrorTemplate
			back="no"
			message="<strong>The following parameters which are lists must contain the same number of items:</strong><br>groupToSelect1Value (#listLen(trim(groupToSelect1Value))#)<br>select2Display (#Listlen(trim(select2Display))#)<br>select2Values (#listlen(trim(select2Values))#)">			
	</cfif>		
  
 
<!------------------------------------------------------------------>
<!--- Start the display of this tag.                             --->
<!------------------------------------------------------------------>  
<cfoutput>
   <script language="javascript">
    var arr_select1Values = new Array();  // array of select1 object ids
    var arr_select1Display = new Array();  // array of select1 values  
    var arr_select1 = new Array();    // array of country ids by state
    var arr_select2Values = new Array();  // array of select2 values
    var arr_select2Display = new Array();  // array of select2 Display
     
     // Arrays of select1 Values and Display
   	<cfloop from="1" to="#Listlen(select1Values)#" index="i">
		<cfset thisValue = trim(listGetAt(select1Values, i))>
		<cfset thisDisplay = trim(listGetAt(select1Display, i))>		
		arr_select1Values[arr_select1Values.length] = '#trim(thisValue)#';
     	arr_select1Display[arr_select1Display.length] = "#trim(thisDisplay)#";		
	</cfloop>	   
   
     // Arrays of select2 Values and Display
	 <cfloop from="1" to="#Listlen(select2Values)#" index="i">
		
		<cfset thisValue = trim(listGetAt(select2Values, i))>
		<cfset thisDisplay = trim(listGetAt(select2Display, i))>		
		<cfset thisGroupTo = trim(ListGetAt(groupToSelect1Value, i))>
		
		<!------------------------------------------------------------------>
		<!--- Unfortunately you cannot use any of the CF functions to    --->
		<!--- stop processing this is a temporary fix.                   --->
		<!------------------------------------------------------------------>		
		<cfif ListFindNoCase(select1Values, trim(thisGroupTo)) NEQ 0>
			arr_select1[arr_select1.length] = '#trim(thisGroupTo)#';
			arr_select2Values[arr_select2Values.length] = '#trim(thisValue)#';
     		arr_select2Display[arr_select2Display.length] = "#trim(thisDisplay)#";		
		<cfelse>
			alert("This value (#trim(thisDisplay)#) has no corresponding match.");
		</cfif> 	
				
	</cfloop>	
	
		
    function initSelects(obj_select1, select1, obj_select2, select2) {      
    // init select1
     var ctr;
     ctr = obj_select1.options.length;
     for (var i = 0; i < arr_select1Display.length; i++) {
      obj_select1.options[obj_select1.options.length] = new Option(arr_select1Display[i],arr_select1Values[i]);    
	  if (arr_select1Values[i] == select1) {
       obj_select1.options[ctr].selected = true;
      };
      ctr = ctr + 1;
     };
   
    // init select2
     ctr = obj_select2.options.length;  
     for (var i = 0; i < arr_select2Values.length; i++) { 	  
      if (arr_select1[i] == select1) {     
       obj_select2.options[obj_select2.options.length] = new Option(arr_select2Display[i],arr_select2Values[i]);
       if (i == select2) {
        obj_select2.options[ctr].selected = true;
        };    
       ctr = ctr + 1;
      };
     };    
    };    
    
    /*Done after the USER has chosen a type.*/ 
    function rebuildSelect2(obj_select1, obj_select2) { 
     
     obj_select2.options.value = '';
     obj_select2.options.length = 0;
   
     for (var i = 0; i < arr_select2Values.length; i++) {
      if (arr_select1[i] == obj_select1.options.value) {    
       obj_select2.options[obj_select2.options.length] = new Option(arr_select2Display[i],arr_select2Values[i]);
      };
     }; 
    };
   
   </script>   
       
    <select name="#trim(select1)#" <cfif class NEQ "">class="#trim(class)#"</cfif> onChange="rebuildSelect2(this, document.#trim(formName)#.#trim(select2)#);"></select> 
    &nbsp;&nbsp;    
    <select name="#trim(select2)#" <cfif class NEQ "">class="#trim(class)#"</cfif>></select>
    <script language="javascript">
		initSelects(#trim(formName)#.#trim(select1)#, "#trim(select1DefaultValue)#", #trim(formName)#.#trim(select2)#, "#trim(select2DefaultValue)#");
	</script>

</cfoutput>

	
