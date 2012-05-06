
<cfoutput>

	<style>						
		##addNewPatient ##mask{
		  position:absolute;
		  left:0;
		  top:0;
		  z-index:9000;
		  background-color:##c0c0c0;
		  display:none;
		}  
		##addNewPatient .window{
		  position:absolute;
		  left:0;
		  top:0;
		  display:none;
		  z-index:9999;
		  padding:20px;
		  background-color:##ffffff;
		}
		##addNewPatient ##addNewPatientContainer{
		  width:375px; 
		  height:203px;
		  padding: 0px;
		  margin: 0px;
		  border: 0px dashed red;	
		  background: ##ffffff; 		
		}
		##addNewPatient ##addNewPatientHeaderTitle{
			float: left;
			width: 100%; 
			margin: 0px;
			padding: 0px 0px 0px 0px; 		
			list-style: none;
			background: ##CBD9E9; 				
		}
		##addNewPatient ##addNewPatientTitle{
			float: left;
			margin: 0px; 			
			padding: 5px 5px; 		
			font-weight: bold; 				
			font-family: Arial, sans-serif; 
			font-size: x-small; 
			text-align: left;					
		}		
		##addNewPatient ##addNewPatientCloseImage{
			float: right;
			margin: 0px; 			
			padding: 5px 5px; 			
		}
	
		##div_errorMsgAddNewPatient{
			float: left;
			width: 100%;		
			display: none; 			
			border: 0px solid ccc889;		
			padding: 5px; 			
		}
		##sp_errorMsgAddNewPatient{			
			vertical-align: bottom; 	
			text-align: left;		
			font-weight: bold; 
			font-family: Arial, sans-serif; 
			font-size: x-small; 
			color: FF0000;
			padding: 0px 5px 0px 0px; 
			border: 0px dashed green;
			width: 100%;		
		}		
	</style>

	<script language="JavaScript">
		
		function addNewPatient(elemId){
			//Get the A tag
			var id = elemId;
		
			//Get the screen height and width
			var maskHeight = $(document).height();
			var maskWidth = $(window).width();
			
			msg = "New Patient Information.";			

			sp_errorMsgAddNewPatient.innerHTML = msg;
			div_errorMsgAddNewPatient.style.display = 'inline';
		
			//Set heigth and width to mask to fill up the whole screen
			$('##mask').css({'width':maskWidth,'height':maskHeight});
			
			//transition effect		
			$('##mask').fadeIn(500);	
			$('##mask').fadeTo("slow",0.8);	
		
			//Get the window height and width
			var winH = $(window).height();
			var winW = $(window).width();
		             
			//Set the popup window to center
			$(id).css('top',  getElementYAxisPos('mainContainer') + 20);
			$(id).css('left', winW/2-$(id).width()/2);
		
			//transition effect
			$(id).fadeIn(500); 
			
			window.scrollTo(0, getElementYAxisPos('mainContainer')); 
			
			$('##newPatientFName').focus();					
			
		}
							
		function closeMask(){
			$('##mask').hide();
			$('.window').hide();
		};
				
				
		function addNewPatientProcess(){
					
			var clientID = #trim(session.ClientID)#;			
			var userID = #trim(session.User.getUsersID())#;										
			var newPatPolNum = $('##newPatientPolicyNumber').val();
			var newPatFName = $('##newPatientFName').val();
			var newPatMName = $('##newPatientMName').val();
			var newPatLName = $('##newPatientLName').val();
			var newPatDOB = $('##newPatientDOB').val();
			var newPatSSN = $('##newPatientSSN').val();
			var newPatSex = $('##newPatientSex').val();
			var newPatObjectTypeID = 3;
								
			if(clientID == "" || userID == ""){
				sp_errorMsgAddNewPatient.innerHTML = "There is an issue where needed parameters are not being sent please notify an administrator.";			
				return false;
			}
			else if(newPatFName == "" || newPatLName == "" || newPatDOB == ""){
				sp_errorMsgAddNewPatient.innerHTML = "You must at minimum enter a First Name, Last Name and a Date of Birth.";			
				return false;
			}
			else if(isDateJS(newPatDOB) != true){
				sp_errorMsgAddNewPatient.innerHTML = "Date of Birth must have a specific format.";			
				return false;						
			}
																
			$.get("#trim(request.urlReconstructed)#/ws/wsPatient.cfc", 
				{ 
					method: "wsAddPatient",
					dataType: "xml",
					Data1: escape(clientID),
					Data2: escape(userID),
					Data3: escape(newPatFName),
					Data4: escape(newPatLName),
					Data5: escape(newPatDOB),
					Data6: escape(newPatMName),
					Data7: escape(newPatSex),
					Data8: escape(newPatSSN),
					Data9: escape(newPatObjectTypeID),
					Data10: escape(newPatPolNum),			
					Data11: #trim(InsuranceCompanyID)#,				
					rand: escape(randNum_JS()) 
				},
			   	function(data){										
					//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
					if (window.ActiveXObject){
						var doc=new ActiveXObject("Microsoft.XMLDOM");
					  	doc.async="false";
					  	doc.loadXML(data);
					}				
					
					var x = doc.documentElement;
					
					$(x).find('NEWPATIENT').each(function(){								
						var $NEWPATIENT = $(this);
						var thisPATIENTID = $NEWPATIENT.find('PATIENTID').text();																				
						if(!IsNumeric_JS(thisPATIENTID)){
							sp_errorMsgAddNewPatient.innerHTML = thisPATIENTID;									
						}
						else{
							addDynamic(thisPATIENTID);
							closeMask();									
						};								
					});	
								
			//ends the callback function.										
			});
			
		};				
				
		$(document).ready(function() {	
			
			//if close button is clicked
			$('.window .close').click(function (e) {
				//Cancel the link behavior
				e.preventDefault();			
				closeMask();
			});				
		});
								
	</script>

	<div id="addNewPatient">
	
		<div id="addNewPatientContainer" class="window">	
			<ul id="addNewPatientHeaderTitle">
				<li id="addNewPatientTitle">Add New Patient</li>
				<li id="addNewPatientCloseImage"><img class="close" src="images/hd_btn_close.gif"></li>
			</ul>		
			<div id="div_errorMsgAddNewPatient" class="mediumInput">
				<ul id="notice_UL">
					<li style="float: left;"></li>
					<li style="float: right;"><span id="sp_errorMsgAddNewPatient"></span></li>
				</ul>		
				<ul id="managersList_UL"></ul>			 
			</div>			
			<div id="editableArea2">
				<div class="inputForm">			
					<div>
						<div class="mediumInput">
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="newPatientPolicyNumber" class="siteLabel">Policy ##:</label></li>
								<li><input type="input" class="siteTextBox" maxLength="10" name="newPatientPolicyNumber" id="newPatientPolicyNumber"></li>
							</ol>										
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="newPatientFName" class="siteLabel"><span class="TextWarning">*</span>First&nbsp;Name:</label></li>
								<li><input type="input" class="siteTextBox" maxLength="15" name="newPatientFName" id="newPatientFName"></li>
							</ol>	
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="newPatientMName" class="siteLabel">Middle:</label></li>
								<li><input type="input" class="siteTextBox" maxLength="15" name="newPatientMName" id="newPatientMName"></li>
							</ol>										
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="newPatientLName" class="siteLabel"><span class="TextWarning">*</span>Last&nbsp;Name:</label></li>
								<li><input type="input" class="siteTextBox" maxLength="15" name="newPatientLName" id="newPatientLName"></li>
							</ol>					 
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="newPatientDOB" class="siteLabel"><span class="TextWarning">*</span>DOB:</label></li>
								<li><input type="input" class="siteTextBox" maxLength="10" name="newPatientDOB" id="newPatientDOB"><br><span class="copyGreySmall">xx/xx/xxxx</span></li>
							</ol>
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="newPatientSSN" class="siteLabel">SSN:</label></li>
								<li><input type="input" class="siteTextBox" maxLength="11" name="newPatientSSN" id="newPatientSSN"><br><span class="copyGreySmall">xxx-xx-xxxx</span></li>
							</ol>	
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="newPatientSex" class="siteLabel">Sex:</label></li>
								<li><select name="newPatientSex" id="newPatientSex" class="siteTextBox"><option value="0">M<option value="1">F</select></li>
							</ol>																										
						</div>				
					</div>			
					<div>
						<div class="inputButton">
							<ol style="list-style: none;">
								<li style="text-align: center;">
									<input type="Button" name="submitButton" class="SiteSubmitBox" value="Add Patient" onclick="addNewPatientProcess();">
								</li>
							</ol>					 
						</div>				
					</div>																					
				</div>
			</div>	
		</div>		
			
		<div id="mask"></div>
	
	</div>

</cfoutput>	
	