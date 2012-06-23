<cfscript> 
    prop = createObject("java", "java.lang.System").getProperties(); 
    WriteDump( var=prop["user.name"], label="User.Name"); 
    WriteDump( var=prop, label="All Properties" ); 
</cfscript> 

<cfabort>






<cfset tempMySQLProcedures = application.beanFactory.getBean('mySQLProcedures')>
<cfset tempConfigBean = application.beanFactory.getBean('configBean') />

<cfset request.mainClientDB = tempConfigBean.getDSN().masterclient />
<cfset request.mySQLPath = tempConfigBean.getDatabase().mySQLPath /> 
<cfset request.mySQLIpAddress = tempConfigBean.getDatabase().mySQLIpAddress />
<cfset request.mySQLPort = tempConfigBean.getDatabase().mySQLPort /> 
<cfset request.mySQLUser = tempConfigBean.getDatabase().mySQLUser /> 
<cfset request.mySQLPass = tempConfigBean.getDatabase().mySQLPass />
<cfset request.dbBackupPath = tempConfigBean.getDatabase().dbBackupPath />



<cfset request.newClientDB = "paclient_1096">
<cfset temp = tempMySQLProcedures.createNewClientDB(request.mainClientDB, request.newClientDB, request.mySQLPath, request.mySQLIpAddress, request.mySQLPort, request.mySQLUser, request.mySQLPass)>




<cfabort>



























<cf_gcRecursiveSearchCodeReplace_UPDATE>

<cfabort>






<cfset ds = "paclient_1084">
<cfset tableList = "Address,Phone,InsuranceCompany">
<cfloop list="#tableList#" index="table">
	<!--- <cf_gcCOM_CreateDatabaseTableCFCFile tablename="#trim(table)#" ds="#trim(ds)#"> --->
	<cf_gcCOM_CreateDatabaseTableCFCFileDAO tablename="#trim(table)#" ds="#trim(ds)#"> 
	<!--- <cf_gcCOM_CreateDatabaseTableCFCFileService tablename="#trim(table)#" ds="#trim(ds)#">  --->
</cfloop>

<cfset ds = "pa_master">
<cfset tableList = "EntityKS">
<cfloop list="#tableList#" index="table">
	<!--- <cf_gcCOM_CreateDatabaseTableCFCFile tablename="#trim(table)#" ds="#trim(ds)#"> --->
	<cf_gcCOM_CreateDatabaseTableCFCFileDAO tablename="#trim(table)#" ds="#trim(ds)#"> 
	<!--- <cf_gcCOM_CreateDatabaseTableCFCFileService tablename="#trim(table)#" ds="#trim(ds)#">  --->
</cfloop>


<cf_gcCOM_CreateDatabaseTableDAOsColdSpringConfigFile>

<cfabort>



	<cfquery name="tables" datasource="pa_master">
		SELECT DISTINCT TABLE_NAME
		FROM information_schema.`COLUMNS`
		WHERE TABLE_SCHEMA = 'pa_master'		
	</cfquery>	

	<cfloop list="#valuelist(tables.TABLE_NAME)#" index="i">
		<cf_gcCreateDatabaseTableCFCFile_PA_MasterDB tablename="#i#" ds="pa_master">
		<cfoutput>#i# DONE <br></cfoutput>
	</cfloop>

	<cfquery name="tables" datasource="paclient_1084">
		SELECT DISTINCT TABLE_NAME
		FROM information_schema.`COLUMNS`
		WHERE TABLE_SCHEMA = 'paclient_1084'		
	</cfquery>	

	<cfloop list="#valuelist(tables.TABLE_NAME)#" index="i">
		<cf_gcCreateDatabaseTableCFCFile_PA_MasterDB tablename="#i#" ds="paclient_1084">
		<cfoutput>#i# DONE <br></cfoutput>
	</cfloop>

<cfabort>





<style>	
	#mainContainer .blockClearBoth{		
		border: 0px dashed green;
		clear: both;
		align: left;
		text-align: left;		
	}	
	#mainContainer{
		font-family: verdana;
		font-size: 11px;		
		border: 1px solid #c0c0c0;
		width: 900px;
		margin: 2px;
	}
	#mainContainer div{
		border: 0px solid green;		
	}
	#mainContainer span{		
		padding: 2px;
	}		
	#mainContainer .mainContainerSectionLeft{
		float: left;
		border: 1px solid C0CDDC;
		margin: 2px;
	}	
	#mainContainer .mainContainerSectionRight{
		float: right;
		border: 1px solid C0CDDC;
		margin: 2px;
	}
	#mainContainer .sectionHeader{		
		color: #4b69a5;
		font-weight: bold;	
		background-color: C0CDDC;
		margin: 0px 0px 2px 0px;
		padding: 2px;
		text-align: left;
	}		
	#mainContainer .sectionLabel{
		background-color: #4b69a5;
		color: white;
		font-weight: bold;	
		width: 250px;	
		margin: 1px;
		align: left;
		text-align: left;
	}	
	#mainContainer .sectionValue{		
		border: 0px dashed red;			
		padding: 2px;
		align: left;
		background-color: White;			
		vertical-align:top;			
	}	
	#mainContainer .thirdBox{
		background-color: Yellow;			
		align: left;
	}		
	#clickme{
		border: 0px dashed red;
	}
</style>

<script language="JavaScript">
	$(document).ready(function(){
		$('#clickme').click(function(event) {
	    	$('#showHidePatient').toggle('fast', function() {
    			// Animation complete.
  			});
	   	});
	});	
</script>


<div id="mainContainer">
	
	<div class="blockClearBoth sectionHeader">
		<a href="javascript:void(0);" id="clickme">John Smith</a>
	</div>	
	
	<div id="showHidePatient">
				
		<div>
		
			<div class="mainContainerSectionLeft">
				<div class="blockClearBoth sectionHeader">
					Patient Information
				</div>	
				<div class="blockClearBoth">
					<span class="sectionLabel">Client No./Trainee SSN</span>
					<span class="sectionValue">$165.00</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">DOB</span>
					<span class="sectionValue">$246.15</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Gender</span>
					<span class="sectionValue">$31.75</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">SSN</span>
					<span class="sectionValue">$48.73</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Name</span>
					<span class="sectionValue"> This is a note.</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Address</span>
					<span class="sectionValue"> This is a note.</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">County</span>
					<span class="sectionValue"> This is a note.</span>
				</div>		
				<div class="blockClearBoth">
					<span class="sectionLabel">Medicare No.</span>
					<span class="sectionValue"> This is a note.</span>
				</div>	
				<div class="blockClearBoth">
					<span class="sectionLabel">Base Plan</span>
					<span class="sectionValue"> This is a note.</span>
				</div>						
			</div>
			
			<div class="mainContainerSectionRight">
				<div class="blockClearBoth sectionHeader">
					Inquiry Information
				</div>	
				<div class="blockClearBoth">
					<span class="sectionLabel">NPI/API</span>
					<span class="sectionValue">$565.00</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Eligibility From</span>
					<span class="sectionValue">$646.15</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Eligibility Through</span>
					<span class="sectionValue">$71.75</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Medicaid / Client No.</span>
					<span class="sectionValue">$88.73</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Social Security Number</span>
					<span class="sectionValue">$88.73</span>
				</div>	
				<div class="blockClearBoth">
					<span class="sectionLabel">Date of Birth</span>
					<span class="sectionValue">$88.73</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">Last Name</span>
					<span class="sectionValue">$88.73</span>
				</div>
				<div class="blockClearBoth">
					<span class="sectionLabel">First Name</span>
					<span class="sectionValue">$88.73</span>
				</div>									
			</div>
		
		</div>
	
		<div class="blockClearBoth thirdBox">Third box that sits below the two block level elements and will clear the block level elements.</div>
	
	</div>
	
</div>













<!--------------------------------------------------------------------------->
<!--- DELETE THE FILES THAT ALLOW THIS TEST TO RUN AND WILL RECREATE THEM --->
<!--------------------------------------------------------------------------->
<!--- 
<cfset currentDirectory = "C:\EOBManager\paFMS\1084\2011\#month(NOW())#\#Day(NOW())#\1">
<cfif DirectoryExists(currentDirectory)>
	<cfdirectory name="todaysFiles" directory="#trim(currentDirectory)#" action="LIST">		
	<cfloop query="todaysFiles">
	     <cffile action="delete" file="#directory#\#name#" />
	</cfloop>
</cfif> 
<cfquery name="delTests" datasource="PAClient_#session.Client.getClientID()#">
	DELETE FROM file where fileID > 3045
</cfquery>

<cfquery name="delTests" datasource="PAClient_#session.Client.getClientID()#">
	DELETE FROM verificationpatientinsurance
	WHERE  VerificationPatientInsuranceID > 2840
</cfquery>
<cfquery name="delTests" datasource="PAClient_#session.Client.getClientID()#">
	DELETE FROM verificationpatientinsuranceelectronic
</cfquery>
--->




<cfabort>














<!--- <cf_gcCreateDatabaseTableCFCFile tablename="RoutePatient" ds="PAClient_1084">
<cf_gcCreateDatabaseTableCFCFileDAO tablename="RoutePatient" ds="PAClient_1084"> 
<cf_gcCreateDatabaseTableCFCFileGateway tablename="RoutePatient" ds="PAClient_1084"> 
<cf_gcCreateDatabaseTableCFCFileService tablename="RoutePatient" ds="PAClient_1084">  --->


















































<!---

<script language="JavaScript">
	
	createEntityString("<ENTITTIES><ENTITY><ENTITYID>111</ENTITYID><FNAME>John</FNAME><LNAME>Smith</LNAME><SSN>111-11-1111</SSN></ENTITY><ENTITY><ENTITYID>222</ENTITYID><FNAME>Frank</FNAME><LNAME>Johnson</LNAME><SSN>222-22-2222</SSN></ENTITY><ENTITY><ENTITYID>333</ENTITYID><FNAME>Greg</FNAME><LNAME>Henderson</LNAME><SSN>333-33-3333</SSN></ENTITY><ENTITY><ENTITYID>444</ENTITYID><FNAME>Eugene</FNAME><LNAME>Keller</LNAME><SSN>444-44-4444</SSN></ENTITY></ENTITTIES>");
	
	function createEntityString(xml){			
		if (window.ActiveXObject){
			var doc=new ActiveXObject("Microsoft.XMLDOM");
		  	doc.async="false";
		  	doc.loadXML(xml);
		}				
		var x = doc.documentElement;		
		var showString = "";
		$(x).find('ENTITY').each(function(){								
			var $ENTITY = $(this);
			showString = showString + "Entity ID: " + $ENTITY.find('ENTITYID').text() + "\t Name: " + $ENTITY.find('FNAME').text() + " " + $ENTITY.find('LNAME').text() + "\t SSN: " + $ENTITY.find('SSN').text() + "\n";
		});	
		
		alert(showString);		
		
	};	
</script>
	--->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



<cfabort>








<!---





<cfset number = "primary">
<cfset InsuranceNameTBox = "">
<cfoutput>
<style>	
	##parent#trim(number)# {
		background-color: ##ffffff;
		position: relative;
		text-align: left;
		border: 1px dotted red; /*height:186px;*/ /*overflow:visible;*/
		width: 200px;
	}
	.gsJumpWrap#trim(number)# {
		border: 1px solid ##C0C0C0;
		position: absolute;
		width: 197px;
		z-index: 10; /*background:##FFFFFF none repeat scroll 0 0;*/ /*padding:3px 0;*/ /*top:23px;*/
	}
	.gsJump li.gsOver {
		background: ##3333FF none repeat scroll 0 0;
		color: ##FFFFFF;
	}
	.displayNone {
		display: none;
	}
	.displayBlock {
		display: block;
	}
	.gsJump li {
		display: block; /*line-height:19px;*/ /*padding:0;*/
	}
</style>

<DIV id="parent#trim(number)#">	
	<div class="gsBox" onmouseover="show('gsSites#trim(number)#');" onmouseout="hide('gsSites#trim(number)#');">
		<div class="gsLink">			
			<input tabindex="352" type="Text" size="35" maxlength="45" name="#trim(number)#InsuranceNameTBox" id="#trim(number)#InsuranceNameTBox" value="#trim(InsuranceNameTBox)#" class="siteTextBox"  onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">
		</div>
	</div>
	<div class="gsJumpWrap#trim(number)# displayNone" id="gsSites#trim(number)#" onmouseover="show('gsSites#trim(number)#');" onmouseout="hide('gsSites#trim(number)#');" onclick="hide('gsSites#trim(number)#');">
		<ul class="gsJump">			
			<li id="usen">United States (English)</li>
			<li id="brbr">Brazil (Portuguese)</li>
			<li id="dede">Germany (German)</li>
			<li id="inen">India (English)</li>			
		</ul>
	</div>	
</DIV>
</cfoutput>

















<style>
.gsJump li, .gsJump li:link, .gsJump li:visited, .gsJump li:hover, .gsJump li:active {
color:#707070;
padding:0 5px;
text-decoration:none;
}
.gsJumpLink {
cursor:pointer;
}
.gsJump li:hover {
background:#3333FF none repeat scroll 0 0;
color:#FFFFFF;
}
.gsBox {
cursor:pointer;
padding-top:3px;
width:160px;
}
.gsLink {
color:#333333;
font-size:11px;
margin:0 0 0 8px;
padding:0;
}
.gsLink div {
padding:2px 0 8px 0;
}
.gsJump {
font-size:11px;*/
padding:0;
}
.gsJump p {
margin:0;
padding:3px 0;
}
</style>
<script type="text/javascript">
	function hide(myID) {
		try {
		tempClass = document.getElementById(myID).className;
		if (tempClass.indexOf(' displayBlock') != -1) {
			tempClass = tempClass.replace(' displayBlock', ' displayNone');
			document.getElementById(myID).className = tempClass;
		}
			myOutput = document.getElementById('gsOuput').innerHTML + "<br> hide:" + tempClass;
			document.getElementById('gsOuput').innerHTML = myOutput;
		} catch(Exception) {}
	}
	function show(myID) {
		try {
		tempClass = document.getElementById(myID).className;
		if (tempClass.indexOf(' displayNone') != -1) {
			tempClass = tempClass.replace(' displayNone', ' displayBlock');
			document.getElementById(myID).className = tempClass;
		}
			myOutput = document.getElementById('gsOuput').innerHTML + "<br> show:" + tempClass;
			document.getElementById('gsOuput').innerHTML = myOutput;
		} catch(Exception) {}
	}
</script>


			
			
			
			
			--->
			
			
			








<!---<cfset number = "1">
<cfoutput>

<style>
	##search#trim(number)# {
		width: 250px;
		/*border: 1px dotted blue;*/
	}
	###trim(number)#InsuranceNameTBox {
		 width: 100%;		 
	}
	##searchResults_UL#trim(number)# { 
		position: absolute;		
		width: 200px;
		background: ##fff;
		padding: 2px;
		margin: 0;
		border: 1px solid ##888;
		list-style-type: none;
		z-index: 52;
		text-align: left;		
	}
	##searchResults_UL#trim(number)# li {
		cursor: hand;		
	} 
	##searchResults_UL#trim(number)# li.selected {
		background: ##008;
	  	color: ##fff;
	}
</style>

<script language="JavaScript">
$(document).ready(function() {
  var $autocomplete#trim(number)# = $("<ul id=searchResults_UL#trim(number)#></ul>")
  .hide()
  .insertAfter("###trim(number)#InsuranceNameTBox");
  var selectedItem = null;

  var setSelectedItem#trim(number)# = function(item) {
    selectedItem = item;

    if (selectedItem === null) {
      $autocomplete#trim(number)#.hide();
      return;
    }

    if (selectedItem < 0) {
      selectedItem = 0;
    }
    if (selectedItem >= $autocomplete#trim(number)#.find('li').length) {
      selectedItem = $autocomplete#trim(number)#.find('li').length - 1;
    }
    $autocomplete#trim(number)#.find('li').removeClass('selected')
      .eq(selectedItem).addClass('selected');
    $autocomplete#trim(number)#.show();
  };

  var populateSearchField = function() {
    $('###trim(number)#InsuranceNameTBox').val($autocomplete#trim(number)#.find('li').eq(selectedItem).text());
    setSelectedItem#trim(number)#(null);
  };

  $('###trim(number)#InsuranceNameTBox')
  .attr('autocomplete#trim(number)#', 'off')
  .keyup(function(event) {
  	  	
    if (event.keyCode > 40 || event.keyCode == 8) {
    // Keys with codes 40 and below are special (enter, arrow keys, escape, etc.). Key code 8 is backspace.	
		
		var clientID = #trim(session.ClientID)#;	
	
		$.get("#trim(request.urlReconstructed)#/ws/wsInsuranceCompany.cfc", 
			{ 
				method: "wsInsuranceCompaniesAutoSuggestXML",
				dataType: "xml",
				Data1: escape(clientID), 
				Data2: escape($('###trim(number)#InsuranceNameTBox').val()),
				rand: escape(randNum_JS()) 
			},
		   	function(data){					
				
				//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
				if (window.ActiveXObject){
					var doc=new ActiveXObject("Microsoft.XMLDOM");
				  	doc.async="false";
				  	doc.loadXML(data);
				}				
				var x=doc.documentElement;			
				$autocomplete#trim(number)#.empty();											
				$(x).find('INSURANCECOMPANY').each(function(index){								
					var $INSURANCECOMPANY = $(this);
					var InsuranceCompanyID = $INSURANCECOMPANY.find('INSURANCECOMPANYID').text();	
					var InsuranceCompanyName = $INSURANCECOMPANY.find('INSURANCECOMPANYNAME').text();					
					$("<li class=siteLabel></li>").text(InsuranceCompanyName).appendTo($autocomplete#trim(number)#).mouseover(function() {
	                	setSelectedItem#trim(number)#(index);
	              	}).click(populateSearchField);								
				});	
				$autocomplete#trim(number)#.show();									
		//ends the callback function.										
		});   
      
    }
    else if (event.keyCode == 38 && selectedItem !== null) {
      // User pressed up arrow.
      setSelectedItem#trim(number)#(selectedItem - 1);
      event.preventDefault();
    }
    else if (event.keyCode == 40 && selectedItem !== null) {
      // User pressed down arrow.
      setSelectedItem#trim(number)#(selectedItem + 1);
      event.preventDefault();
    }    
    else if (event.keyCode == 27 && selectedItem !== null) {
      // User pressed escape key.
      setSelectedItem#trim(number)#(null);
    }
  }).keypress(function(event) {
    if (event.keyCode == 13 && selectedItem !== null) {
      // User pressed enter key.
      populateSearchField();
      event.preventDefault();
    }
  }).blur(function(event) {
    setTimeout(function() {
      setSelectedItem#trim(number)#(null);
    }, 250);
  });
});				
</script>


	<table cellspacing="2" cellpadding="2" border="1">
		<tr>
		    <td>11111</td>
		    <td>22222</td>
		    <td>
				<span id="search#trim(number)#">
					<input type="Text" id="#trim(number)#InsuranceNameTBox" class="siteTextBox">	
				</span>		
			</td>
		</tr>
		<tr>
		    <td>44444</td>
		    <td>55555</td>
		    <td>66666</td>
		</tr>
	</table>				
</cfoutput>--->

	




<cfset temp1 = application.beanFactory.getBean('old_Datasource')>
<cfdump label="BEFORE" var="#temp1.getMemento()#">
<cfset temp1.setPassword('NewPass')>
<cfdump label="AFTER" var="#temp1.getMemento()#">


<cfset temp2 = application.beanFactory.getBean('old_Datasource')>
<cfdump label="BEFORE TEMP 2" var="#temp2.getMemento()#">
<cfset temp2.setPassword('Second PAss')>
<cfdump label="AFTERTEMP 2" var="#temp2.getMemento()#">

<cfdump label="WAY AFTER TEMP 1" var="#temp1.getMemento()#">



<cfabort>	














<!--- 
SELECT pat.PatientID AS Expr1, pic.*
FROM patient pat 
INNER JOIN patientinsurancecompany pic ON pat.PatientID = pic.PatientID 
INNER JOIN intake inta ON pic.PatientID = inta.patientID
INNER JOIN verificationpatientinsurance vpi ON vpi.picID = pic.recordID
WHERE pic.InsuranceCompanyID = 44584
ORDER BY pat.DateCreated DESC

 --->





<!--- <cfscript>
    // Login is always required.
   adminObj = createObject("component","cfide.adminapi.eventgateway");
</cfscript>
<cfset arrCFCPaths = arrayNew(1)>
<cfset arrCFCPaths[1] = 'C:\collectmed\collectmed1.0\CustomTags\com\common\gateway\InsuranceCompanyFileRetrievalMedicaid_Texas.cfc'>
<cfset adminObj.setGatewayInstance(gatewayid: 'ICFileRetrievalMedicaid_Texas', type:'CFML', cfcPaths: arrCFCPaths, configurationpath: '', mode:'AUTO')>
<cfdump var="#arrCFCPaths#">
<cfdump var="#adminObj.getGatewayInstances()#"> 
<cfabort> --->

<!---  
<cfscript>
    // Login is always required.
   adminObj = createObject("component","cfide.adminapi.eventgateway");
</cfscript>
1: <cfdump label="getJRunRootDir()" var="#adminObj.getJRunRootDir()#"><br>
<cfset adminObj.startGatewayService()>
2: <cfdump label="getGatewayServiceStatus()" var="#adminObj.getGatewayServiceStatus()#"><br>
<!--- 3: <cfdump label="startGatewayInstance(ICFileRetrievalMedicaid_Texas)" var="#adminObj.startGatewayInstance('ICFileRetrievalMedicaid_Texas')#"><br> --->
4: <cfdump label="getGatewayInstanceStatus()" var="#adminObj.getGatewayInstanceStatus('ICFileRetrievalMedicaid_Texas')#"><br>
<cfabort>
restartGatewayInstance --->



<!--- 

<!--- Create ColdFusion service factory instance. --->
<cfset objFactory = CreateObject( "java", "coldfusion.server.ServiceFactory" ) />
 
<!--- Get the debugging service from the service factory. --->
<cfset objDebugging = objFactory.GetDebuggingService() />
 <cfmail from="support@eobmanager.net" to="support@eobmanager.net" type="html" subject="objDebugging.GetDebugger().hashCode() gateway">
	<cfdump var="#objDebugging.GetDebugger().hashCode()#" />
</cfmail>   
<!---	Get the events table. This includes all events	that have taken place, not just template executions.	This is returned as a query.--->
<cfset qEvents = objDebugging.GetDebugger().GetData() />
 <cfmail from="support@eobmanager.net" to="support@eobmanager.net" type="html" subject="qEvents gateway">
	<cfdump var="#qEvents#" />
</cfmail>  
<!---	Now that we have all the events in query format, do a	query of queries to get only events that were template	executions event.--->
<cfquery name="qTemplates" dbtype="query">
	SELECT line,parent,template,endtime,starttime
	FROM	qEvents
	WHERE	type = 'Template'
	ORDER BY template ASC
</cfquery>


<cfmail from="support@eobmanager.net" to="support@eobmanager.net" type="html" subject="when cfc">
	<cfdump var="#qTemplates#" />
</cfmail>

<cfabort> --->

 --->







