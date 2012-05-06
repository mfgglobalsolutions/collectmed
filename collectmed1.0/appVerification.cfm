
<cfscript>
	
	variables.objVerificationFile = application.beanFactory.getBean('old_VerificationFile');
	variables.objVerificationFile.init(url.fileID);
	
	variables.VerificationFileSVC = application.beanFactory.getBean('old_VerificationFileService');	
	variables.VerificationFileSVC.read(variables.objVerificationFile);	

	variables.FileSVC = application.beanFactory.getBean('old_FileService');		
	
	//This file is the parent of the file that was sent to the insurance company
	variables.objVerificationXMLFile = application.beanFactory.getBean('old_File');
	variables.objVerificationXMLFile.init(variables.objVerificationFile.getxmlFileID());
	variables.FileSVC.read(variables.objVerificationXMLFile);
	
	variables.filterF = structNew();
	variables.filterF.ParentFIleID = trim(variables.objVerificationXMLFile.getFileID());	
	variables.filterF.OrderBy = "FileID";	
	//This query shold only return one file in this case.
	variables.parentFile = variables.FileSVC.getAllFiles(variables.filterF);	
	
	variables.filterFparent = structNew();
	variables.filterFparent.ParentFIleID = trim(variables.parentFile.FileID[1]);	
	variables.filterFparent.OrderBy = "FileID";	
	variables.allSubFiles = variables.FileSVC.getAllFiles(variables.filterFparent);			
		
	variables.AvailableExtensions = ValueList(variables.allSubFiles.ServerFileExt);

	variables.allow271 = false;	
	if(findNoCase('271', variables.AvailableExtensions)){
		variables.allow271 = true;
	}
	
</cfscript>



<!-------------------------------------------------------------------------------------->
<!--- What we are going to do is take the parent xml file which gets converted       --->
<!--- to (270) and the xml returned (271) and we will mash them together to create   --->
<!--- a file that can be looped over.                                                --->
<!-------------------------------------------------------------------------------------->
<cfif variables.allow271>
	
	<cfset variables.placementDirectory = "">
	<cfloop query="variables.allSubFiles">
		<cfif FindNoCase("Mash270_271", ServerFile)>
			<cfset placementDirectory = ServerDirectory & "\" & ServerFile>
			<cfbreak>
		</cfif>
	</cfloop>

	<cffile action="READ" file="#trim(variables.placementDirectory)#" variable="variables.parentXMLContents">		
		
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
			border: 0px solid #c0c0c0;
			width: 900px;
			margin: 2px;
			clear: both;
		}
		#mainContainer div{
			border: 0px solid green;		
		}
		#mainContainer span{		
			padding: 2px;
		}	
		#mainContainer .patientInformationConatiner{
			border: 0px dashed green;	
			width: 98%;	
		}		
		#mainContainer .patientSection{		
			border: 1px solid #c0c0c0;
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
			background-color: ffffff;			
			vertical-align:top;			
		}	
		#mainContainer .segmentLabel{
			background-color: #4b69a5;
			color: white;
			font-weight: bold;				
			margin: 1px;
			align: left;
			text-align: left;
		}	
		#mainContainer .thirdBox{
			border: 1px solid red;
			float: left;			
			margin: 14px;				
		}		
		#mainContainer #showHidePatientElements{
			border: 0px dashed red;
		}		

		#mainContainer .showHidePatient{
			border: 0px dashed red;
		}	
		
		#mainContainer .smallFont{			
			font-size: 9px;
		}
		
		#mainContainer #eligibilityDiv{
			margin: 8px 4px 8px 4px;
			border: 1px solid C0CDDC;
			width: 98%;
		}
		#mainContainer #eligibilityTable {
			border: 0px dashed red;
			width: 100%;
		}
		#mainContainer #eligibilityTable th {		
			color: ffffff; 
			background-color: #4b69a5;
			border-bottom: 1px solid #4b69a5;
			font-family: verdana;
			font-size: 11px;
			text-align: left;
			vertical-align: top;
		}		
		#mainContainer #eligibilityTable tbody tr td {				
			border-left: 1px solid #c0cddc;		
			font-family: verdana;
			font-size: 11px;	
			text-align: left;	
			vertical-align: top;
		}	

		#mainContainer #medicareDiv{			
			margin: 8px 4px 8px 4px;
			border: 1px solid C0CDDC;
			width: 98%;	
		}
		#mainContainer #medicareTable {
			border: 0px dashed red;
			width: 100%;			
		}
		#mainContainer #medicareTable th {		
			color: ffffff; 
			background-color: #4b69a5;
			border-bottom: 1px solid #4b69a5;
			font-family: verdana;
			font-size: 11px;
			text-align: left;
			vertical-align: top;
		}		
		#mainContainer #medicareTable tbody tr td {				
			border-top: 1px solid #c0cddc;	
			border-left: 1px solid #c0cddc;		
			font-family: verdana;
			font-size: 11px;	
			text-align: left;	
			vertical-align: top;
		}	




		#mainContainer #limitationDiv{			
			margin: 8px 4px 8px 4px;
			border: 1px solid C0CDDC;
			width: 98%;	
		}
		#mainContainer #limitationTable {
			border: 0px dashed red;
			width: 100%;			
		}
		#mainContainer #limitationTable th {		
			color: ffffff; 
			background-color: #4b69a5;
			border-bottom: 1px solid #4b69a5;
			font-family: verdana;
			font-size: 11px;
			text-align: left;
			vertical-align: top;
		}		
		#mainContainer #limitationTable tbody tr td {				
			border-top: 1px solid #c0cddc;	
			border-left: 1px solid #c0cddc;		
			font-family: verdana;
			font-size: 11px;	
			text-align: left;	
			vertical-align: top;
		}	




		
		.openCloseAllRight{
			float: right;			
			margin: 2px;
			font-family: verdana;
			font-size: 11px;
		}	



		.tblMainBorder{				
			border: 0px dashed #ff0000;
		} 
		.tblBorder{ 
			border: 1px solid #DCE3EB;
		}
		.tblCellBorder{			
			padding: 2px;
			border: 1px solid #DCE3EB;
		} 
		.tbl_trBG{
			background: #DCE3EB;
			font-weight: bold;
		}
		.tbl_dataCellBG{
			background: #F8F8F8;
		}
		.tbl_fontSize{
			font-size: 80%;
		}
		.oneHundredWidth{
			 width: '100%';
		}
		.tdPaddingTitle{
			padding: 6px 6px 6px 2px;
		}
	</style>
		
	<!-------------------------------------------------------------------------------------->
	<!--- Javascripts needed for this page.                                              --->
	<!-------------------------------------------------------------------------------------->					
	<script type="text/javascript" src="scripts/tagVerificationTXMedicaid.js"></script>
	<script language="JavaScript">
		$(document).ready(function(){	
		var data = "<cfoutput>#variables.parentXMLContents#</cfoutput>";		
			new_parseXmlBuild(data, '0', false);				
			
			$('#openAll').click(function(event) {	    	
		    	$('.showHidePatient').show();
		   	});	
	
			$('#closeAll').click(function(event) {	    	
		    	$('.showHidePatient').hide();
		   	});	
		   		   	
			$('.showHidePatientElements').click(function(event) {	    	
		    	$('.showHidePatient').hide();
		    	$('#showHidePatient_' + $(this).attr('id').split('_')[1]).show();  			 			
		   	});	

			$('#open271').click(function(event) {	    	
		parseXmlBuild(data, '0', false);			
		   	});			   	
		   			   	
		  	$('.showHidePatient').hide();    	
		  	
		});	
					
	</script>
				
	<div id="openCloseAll" class="openCloseAllRight">
		<a href="javascript:void(0);" id="openAll">+ Open All</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" id="closeAll">- Close All</a>
	</div>
	<p></p>
	<div id="mainContainer"></div>
	<div id="open271Div" class="openCloseAllRight">
		<a href="javascript:void(0);" id="open271">271 return</a>
	</div>
	<p></p>
	<div id="div1" align="left"></div>
	
		


	
</cfif>


