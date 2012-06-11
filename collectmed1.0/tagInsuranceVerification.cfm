
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.number" default="">
	<cfset number = attributes.number>
		
	<cfparam name="attributes.picID" default="">
	<cfset picID = attributes.picID>
	
	<cfparam name="attributes.tabstart" default="1">
	<cfset tabstart = attributes.tabstart>

	<cfparam name="attributes.VerificationRepFName" default="">
	<cfset VerificationRepFName = attributes.VerificationRepFName>

	<cfparam name="attributes.VerificationRepLName" default="">
	<cfset VerificationRepLName = attributes.VerificationRepLName>

	<cfparam name="attributes.VerificationDate" default="">
	<cfset VerificationDate = attributes.VerificationDate>
	
	<cfparam name="attributes.VerificationTime" default="">
	<cfset VerificationTime = attributes.VerificationTime>

	<cfparam name="attributes.VerificationHaveIns" default="-1">
	<cfset VerificationHaveIns = attributes.VerificationHaveIns>
					
	<cfparam name="attributes.VerificationHaveInsFromDate" default="">
	<cfset VerificationHaveInsFromDate = attributes.VerificationHaveInsFromDate>
		
	<cfparam name="attributes.VerificationHaveInsToDate" default="">
	<cfset VerificationHaveInsToDate = attributes.VerificationHaveInsToDate>
		
	<cfparam name="attributes.VerificationHaveDMECov" default="-1">
	<cfset VerificationHaveDMECov = attributes.VerificationHaveDMECov>
	
	<cfparam name="attributes.VerificationDeductible" default="-1">
	<cfset VerificationDeductible = attributes.VerificationDeductible>	
	
	<cfparam name="attributes.VerificationDeductibleAmount" default="">
	<cfset VerificationDeductibleAmount = attributes.VerificationDeductibleAmount>
	
	<cfparam name="attributes.VerificationDeductibleAmountMet" default="">
	<cfset VerificationDeductibleAmountMet = attributes.VerificationDeductibleAmountMet>
	
	<cfparam name="attributes.VerificationPPOPolicy" default="-1">
	<cfset VerificationPPOPolicy = attributes.VerificationPPOPolicy>
	
	<cfparam name="attributes.VerificationPercentagePayAfterDeductible" default="">
	<cfset VerificationPercentagePayAfterDeductible = attributes.VerificationPercentagePayAfterDeductible>
	
	<cfparam name="attributes.VerificationPriorAuth" default="-1">
	<cfset VerificationPriorAuth = attributes.VerificationPriorAuth>
	
	<cfparam name="attributes.VerificationAuthNumber" default="">
	<cfset VerificationAuthNumber = attributes.VerificationAuthNumber>
	
	<cfparam name="attributes.VerificationLifetimeBenefitMet" default="-1">
	<cfset VerificationLifetimeBenefitMet = attributes.VerificationLifetimeBenefitMet>
	
	<cfparam name="attributes.VerificationAuthPhoneNumber" default="">
	<cfset VerificationAuthPhoneNumber = attributes.VerificationAuthPhoneNumber>
	
	<cfparam name="attributes.VerificationMedicareSupplement" default="-1">
	<cfset VerificationMedicareSupplement = attributes.VerificationMedicareSupplement>
	
	<cfparam name="attributes.VerificationCoordinateBenefits" default="-1">
	<cfset VerificationCoordinateBenefits = attributes.VerificationCoordinateBenefits>
	
	<cfparam name="attributes.VerificationPaidMedicareDeductible" default="-1">
	<cfset VerificationPaidMedicareDeductible = attributes.VerificationPaidMedicareDeductible>
	
	<cfparam name="attributes.VerificationMedicaidPlan" default="-1">
	<cfset VerificationMedicaidPlan = attributes.VerificationMedicaidPlan>
	
	<!---<cfparam name="attributes.VerificationMedicaidPlanMQMB" default="-1">
	<cfset VerificationMedicaidPlanMQMB = attributes.VerificationMedicaidPlanMQMB>
	
	<cfparam name="attributes.VerificationMedicaidPlanQMB" default="-1">
	<cfset VerificationMedicaidPlanQMB = attributes.VerificationMedicaidPlanQMB>
	
	<cfparam name="attributes.VerificationMedicaidPlanTraditional" default="-1">
	<cfset VerificationMedicaidPlanTraditional = attributes.VerificationMedicaidPlanTraditional>						--->	
	
	<cfparam name="attributes.VerificationTypeBasePlan" default="">
	<cfset VerificationTypeBasePlan = attributes.VerificationTypeBasePlan>
	
	<cfparam name="attributes.verificationID" default="">
	<cfset verificationID = attributes.verificationID>
	
	<cfparam name="attributes.showSubmit" default="true">
	<cfset showSubmit = attributes.showSubmit>
	
	<cfset VerificationDateMM = "">
	<cfset VerificationDateDD = "">
	<cfset VerificationDateYY = "">	
	<cfset VerificationHaveInsFromDateMM = "">
	<cfset VerificationHaveInsFromDateDD = "">
	<cfset VerificationHaveInsFromDateYY = "">			
	<cfset VerificationHaveInsToDateMM = "">
	<cfset VerificationHaveInsToDateDD = "">
	<cfset VerificationHaveInsToDateYY = "">	
	
	<cfset verifications = "">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<script language="JavaScript">
			
			<cfif trim(number) eq "primary">
			
				function getVerificationXML(data1,data2){				
					var url = "#trim(request.urlReconstructed)#/ws/wsVerification.cfc?method=wsGetVerificationXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
					var packet = _wddxSelectListGetFromURL(url);												
					var wddxDes = new WddxDeserializer;				
					var result = wddxDes.deserialize(packet);							
					if (result != null) {					
						return result;
					}
					else{					
						return false;
					}							
				};
			
			</cfif>			
			
			function resetVerification#trim(number)#(id){				
				
				if(id == document.all.#trim(number)#VerificationID.value){
					return true;
				};
												
				var textXML = getVerificationXML(#trim(session.clientID)#, id);	
				
				if (window.ActiveXObject){
					var doc=new ActiveXObject("Microsoft.XMLDOM");
				  	doc.async="false";
				  	doc.loadXML(textXML);
				}				
				var x=doc.documentElement;		
				
				#trim(number)#DisableVerification(0);
				clearVerification#trim(number)#();
				document.all.#trim(number)#VerificationID.value = id;
			
				$(x).find('VERIFICATION').each(function(){		
					var $VERIFICATION = $(this);
					$("input[name='#trim(number)#VerificationRepFNameTBox']").val($VERIFICATION.find('VERIFICATIONREPFNAME').text()); 
					$("input[name='#trim(number)#VerificationRepLNameTBox']").val($VERIFICATION.find('VERIFICATIONREPLNAME').text()); 
					$("input[name='#trim(number)#VerificationTimeTBox']").val($VERIFICATION.find('VERIFICATIONTIME').text()); 
					var VERIFICATIONDATE = $VERIFICATION.find('VERIFICATIONDATE').text();						
					if(VERIFICATIONDATE){						
						var date = new Date(VERIFICATIONDATE);														
						mon = new String(date.getMonth() + 1)						
						if(mon.length == 1)mon = "0" + mon;
						day = new String(date.getDate())						
						if(day.length == 1)day = "0" + day;							
						$("input[name='#trim(number)#VerificationDateMM']").val(mon);								
						$("input[name='#trim(number)#VerificationDateDD']").val(day);
						$("input[name='#trim(number)#VerificationDateYY']").val(date.getFullYear());
					};						
					#trim(number)#VerificationHaveIns($VERIFICATION.find('VERIFICATIONHAVEINS').text()); 
					var VERIFICATIONHAVEINSFROMDATE = $VERIFICATION.find('VERIFICATIONHAVEINSFROMDATE').text();						
					if(VERIFICATIONHAVEINSFROMDATE){						
						var date = new Date(VERIFICATIONHAVEINSFROMDATE);														
						mon = new String(date.getMonth() + 1)						
						if(mon.length == 1)mon = "0" + mon;
						day = new String(date.getDate())						
						if(day.length == 1)day = "0" + day;							
						$("input[name='#trim(number)#VerificationHaveInsFromMM']").val(mon);								
						$("input[name='#trim(number)#VerificationHaveInsFromDD']").val(day);
						$("input[name='#trim(number)#VerificationHaveInsFromYY']").val(date.getFullYear());
					};
					var VERIFICATIONHAVEINSTODATE = $VERIFICATION.find('VERIFICATIONHAVEINSTODATE').text();						
					if(VERIFICATIONHAVEINSTODATE){						
						var date = new Date(VERIFICATIONHAVEINSTODATE);														
						mon = new String(date.getMonth() + 1)						
						if(mon.length == 1)mon = "0" + mon;
						day = new String(date.getDate())						
						if(day.length == 1)day = "0" + day;							
						$("input[name='#trim(number)#VerificationHaveInsToMM']").val(mon);								
						$("input[name='#trim(number)#VerificationHaveInsToDD']").val(day);
						$("input[name='#trim(number)#VerificationHaveInsToYY']").val(date.getFullYear());
					};
					#trim(number)#VerificationHaveDmeCov($VERIFICATION.find('VERIFICATIONHAVEDMECOV').text()); 
					#trim(number)#VerificationDeductible($VERIFICATION.find('VERIFICATIONDEDUCTIBLE').text()); 						
					$("input[name='#trim(number)#VerificationDeductibleAmountTBox']").val($VERIFICATION.find('VERIFICATIONDEDUCTIBLEAMOUNT').text());
					$("input[name='#trim(number)#VerificationDeductibleAmountMetTBox']").val($VERIFICATION.find('VERIFICATIONDEDUCTIBLEAMOUNTMET').text());
					$("input[name='#trim(number)#VerificationPercentagePayAfterDeductibleTBox']").val($VERIFICATION.find('VERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLE').text()); 	
					$("input[name='#trim(number)#VerificationAuthNumberTBox']").val($VERIFICATION.find('VERIFICATIONAUTHNUMBER').text());
					$("input[name='#trim(number)#VerificationAuthPhoneNumberTBox']").val($VERIFICATION.find('VERIFICATIONAUTHPHONENUMBER').text());
					$("input[name='#trim(number)#VerificationTypeBasePlanTBox']").val($VERIFICATION.find('VERIFICATIONTYPEBASEPLAN').text());						
					#trim(number)#VerificationPPOPolicy($VERIFICATION.find('VERIFICATIONPPOPOLICY').text());						
					#trim(number)#VerificationPriorAuth($VERIFICATION.find('VERIFICATIONPRIORAUTH').text());						
					#trim(number)#VerificationLifetimeBenefitMet($VERIFICATION.find('VERIFICATIONLIFETIMEBENEFITMET').text());						
					#trim(number)#VerificationMedicareSupplement($VERIFICATION.find('VERIFICATIONMEDICARESUPPLEMENT').text());						
					#trim(number)#VerificationCoordinateBenefits($VERIFICATION.find('VERIFICATIONCOORDINATEBENEFITS').text());						
					#trim(number)#VerificationPaidMedicareDeductible($VERIFICATION.find('VERIFICATIONPAIDMEDICAREDEDUCTIBLE').text());						
					#trim(number)#VerificationMedicaidPlan($VERIFICATION.find('VERIFICATIONMEDICAIDPLAN').text());												
								
				});	
			
				#trim(number)#DisableVerification(1);
				#trim(number)#VerificationNotes.style.display = 'inline';
				#trim(number)#ShowIntakeID.innerHTML = 'VERIFICATION ID: ' + id;
			};
					
			function createViewVerificationNotes#trim(number)#(){							
				if(document.all.#trim(number)#VerificationID.value != ""){
					objectNote=window.open('appObjectNote.cfm?objectid=11&instanceid=' + document.all.#trim(number)#VerificationID.value, 'objectNote', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=600,height=350,left='+ newWindowGetX(600) +',top='+ newWindowGetY(350)); objectNote.focus(0);
				};	
			};
			
			function #trim(number)#DisableVerification(dis){
				if(dis == 1){endis = true}else(endis = false);				
				document.all.#trim(number)#VerificationRepFNameTBox.disabled = endis;
				document.all.#trim(number)#VerificationRepLNameTBox.disabled = endis;	
				document.all.#trim(number)#VerificationDateMM.disabled = endis;
				document.all.#trim(number)#VerificationDateDD.disabled = endis;
				document.all.#trim(number)#VerificationDateYY.disabled = endis;
				document.all.#trim(number)#VerificationTimeTBox.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsYes.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsNo.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsFromMM.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsFromDD.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsFromYY.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsToMM.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsToDD.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsToYY.disabled = endis;
				document.all.#trim(number)#VerificationHaveDMECovYes.disabled = endis;
				document.all.#trim(number)#VerificationHaveDMECovNo.disabled = endis;
				document.all.#trim(number)#VerificationDeductibleYes.disabled = endis;
				document.all.#trim(number)#VerificationDeductibleNo.disabled = endis;					   
				document.all.#trim(number)#VerificationDeductibleAmountTBox.disabled = endis;
				document.all.#trim(number)#VerificationDeductibleAmountMetTBox.disabled = endis;
				document.all.#trim(number)#VerificationPPOPolicyYes.disabled = endis;
				document.all.#trim(number)#VerificationPPOPolicyNo.disabled = endis;
				document.all.#trim(number)#VerificationPercentagePayAfterDeductibleTBox.disabled = endis;
				document.all.#trim(number)#VerificationPriorAuthYes.disabled = endis;
				document.all.#trim(number)#VerificationPriorAuthNo.disabled = endis;
				document.all.#trim(number)#VerificationAuthNumberTBox.disabled = endis;					
				document.all.#trim(number)#VerificationLifetimeBenefitMetYes.disabled = endis;
				document.all.#trim(number)#VerificationLifetimeBenefitMetNo.disabled = endis;									   
				document.all.#trim(number)#VerificationAuthPhoneNumberTBox.disabled = endis;
				document.all.#trim(number)#MedicareSupplementYes.disabled = endis;
				document.all.#trim(number)#MedicareSupplementNo.disabled = endis;
				document.all.#trim(number)#CoordinateBenefitsYes.disabled = endis;
				document.all.#trim(number)#CoordinateBenefitsNo.disabled = endis;
				document.all.#trim(number)#PaidMedicareDeductibleYes.disabled = endis;
				document.all.#trim(number)#PaidMedicareDeductibleNo.disabled = endis;		
				document.all.#trim(number)#VerificationMedicaidPlanMQMB.disabled = endis;
				document.all.#trim(number)#VerificationMedicaidPlanQMB.disabled = endis;
				document.all.#trim(number)#VerificationMedicaidPlanTraditional.disabled = endis;		
				document.all.#trim(number)#VerificationTypeBasePlanTBox.disabled = endis;				
				
				document.all.#trim(number)#VerificationHaveInsYes.disabled = endis;
				document.all.#trim(number)#VerificationHaveInsNo.disabled = endis;	
				document.all.#trim(number)#VerificationHaveDMECovYes.disabled = endis;
				document.all.#trim(number)#VerificationHaveDMECovNo.disabled = endis;	
				document.all.#trim(number)#VerificationDeductibleYes.disabled = endis;
				document.all.#trim(number)#VerificationDeductibleNo.disabled = endis;						
				document.all.#trim(number)#VerificationPPOPolicyYes.disabled = endis;
				document.all.#trim(number)#VerificationPPOPolicyNo.disabled = endis;						
				document.all.#trim(number)#VerificationPriorAuthYes.disabled = endis;
				document.all.#trim(number)#VerificationPriorAuthNo.disabled = endis;							
				document.all.#trim(number)#VerificationLifetimeBenefitMetYes.disabled = endis;
				document.all.#trim(number)#VerificationLifetimeBenefitMetNo.disabled = endis;						
				document.all.#trim(number)#MedicareSupplementYes.disabled = endis;
				document.all.#trim(number)#MedicareSupplementNo.disabled = endis;	
				document.all.#trim(number)#CoordinateBenefitsYes.disabled = endis;
				document.all.#trim(number)#CoordinateBenefitsNo.disabled = endis;
				document.all.#trim(number)#PaidMedicareDeductibleYes.disabled = endis;
				document.all.#trim(number)#PaidMedicareDeductibleNo.disabled = endis;	
				document.all.#trim(number)#VerificationMedicaidPlanMQMB.disabled = endis;
				document.all.#trim(number)#VerificationMedicaidPlanQMB.disabled = endis;
				document.all.#trim(number)#VerificationMedicaidPlanTraditional.disabled = endis;
			};
					
			function clearVerification#trim(number)#(){
				#trim(number)#ShowIntakeID.innerHTML = '';
				#trim(number)#VerificationNotes.style.display = 'none';
				document.all.#trim(number)#VerificationID.value = '';
				document.all.#trim(number)#VerificationRepFNameTBox.value = '';
				document.all.#trim(number)#VerificationRepLNameTBox.value = '';	
				document.all.#trim(number)#VerificationDateMM.value = '';
				document.all.#trim(number)#VerificationDateDD.value = '';
				document.all.#trim(number)#VerificationDateYY.value = '';
				document.all.#trim(number)#VerificationTimeTBox.value = '';
				document.all.#trim(number)#VerificationHaveInsYes.value = '';
				document.all.#trim(number)#VerificationHaveInsNo.value = '';
				document.all.#trim(number)#VerificationHaveInsFromMM.value = '';
				document.all.#trim(number)#VerificationHaveInsFromDD.value = '';
				document.all.#trim(number)#VerificationHaveInsFromYY.value = '';
				document.all.#trim(number)#VerificationHaveInsToMM.value = '';
				document.all.#trim(number)#VerificationHaveInsToDD.value = '';
				document.all.#trim(number)#VerificationHaveInsToYY.value = '';
				document.all.#trim(number)#VerificationHaveDMECovYes.value = '';
				document.all.#trim(number)#VerificationHaveDMECovNo.value = '';
				document.all.#trim(number)#VerificationDeductibleYes.value = '';
				document.all.#trim(number)#VerificationDeductibleNo.value = '';					   
				document.all.#trim(number)#VerificationDeductibleAmountTBox.value = '';
				document.all.#trim(number)#VerificationDeductibleAmountMetTBox.value = '';
				document.all.#trim(number)#VerificationPPOPolicyYes.value = '';
				document.all.#trim(number)#VerificationPPOPolicyNo.value = '';
				document.all.#trim(number)#VerificationPercentagePayAfterDeductibleTBox.value = '';
				document.all.#trim(number)#VerificationPriorAuthYes.value = '';
				document.all.#trim(number)#VerificationPriorAuthNo.value = '';
				document.all.#trim(number)#VerificationAuthNumberTBox.value = '';					
				document.all.#trim(number)#VerificationLifetimeBenefitMetYes.value = '';
				document.all.#trim(number)#VerificationLifetimeBenefitMetNo.value = '';									   
				document.all.#trim(number)#VerificationAuthPhoneNumberTBox.value = '';
				document.all.#trim(number)#MedicareSupplementYes.value = '';
				document.all.#trim(number)#MedicareSupplementNo.value = '';
				document.all.#trim(number)#CoordinateBenefitsYes.value = '';
				document.all.#trim(number)#CoordinateBenefitsNo.value = '';
				document.all.#trim(number)#PaidMedicareDeductibleYes.value = '';
				document.all.#trim(number)#PaidMedicareDeductibleNo.value = '';		
				document.all.#trim(number)#VerificationMedicaidPlanMQMB.value = '';
				document.all.#trim(number)#VerificationMedicaidPlanQMB.value = '';
				document.all.#trim(number)#VerificationMedicaidPlanTraditional.value = '';		
				document.all.#trim(number)#VerificationTypeBasePlanTBox.value = '';
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveIns', '');				
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveDMECov', '');
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationDeductible', '');				
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPPOPolicy', '');				
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPriorAuth', '');
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationLifetimeBenefitMet', '');				
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#MedicareSupplement', '');				
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CoordinateBenefits', '');				
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#PaidMedicareDeductible', '');				
				checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationMedicaidPlan', '');							
			};		
			
		</script>
	
	</cfoutput>

<!-------------------------------------------------------------------------------------->
<!--- We want this object so we can get the verifications                            --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsNumeric(picID) OR IsNumeric(verificationID)>		
		<cfset request.VerificationPIC = CreateObject("component","com.common.VerificationPIC")>	
	</cfif>
	

<!-------------------------------------------------------------------------------------->
<!--- If a verificationID has been sent in set the variables to show.                --->
<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(verificationID)>
		<cfset request.VerificationPIC.init(verificationID)>		
		<cfset VerificationRepFName = request.VerificationPIC.getVerificationRepFName()>
		<cfset VerificationRepLName = request.VerificationPIC.getVerificationRepLName()>
		<cfset VerificationTime = request.VerificationPIC.getVerificationTime()>	
		<cfset VerificationDate = request.VerificationPIC.getVerificationDate()>		
		<cfif request.VerificationPIC.getVerificationHaveIns() NEQ ""><cfset VerificationHaveIns = request.VerificationPIC.getVerificationHaveIns()></cfif>			
		<cfset VerificationHaveInsFromDate = request.VerificationPIC.getVerificationHaveInsFromDate()>
		<cfset VerificationHaveInsToDate = request.VerificationPIC.getVerificationHaveInsToDate()>
		<cfif request.VerificationPIC.getVerificationHaveDMECov() NEQ ""><cfset VerificationHaveDMECov = request.VerificationPIC.getVerificationHaveDMECov()></cfif>
		<cfif request.VerificationPIC.getVerificationDeductible() NEQ ""><cfset VerificationDeductible = request.VerificationPIC.getVerificationDeductible()></cfif>
		<cfset VerificationDeductibleAmount = request.VerificationPIC.getVerificationDeductibleAmount()>
		<cfset VerificationDeductibleAmountMet = request.VerificationPIC.getVerificationDeductibleAmountMet()>
		<cfif request.VerificationPIC.getVerificationPPOPolicy() NEQ ""><cfset VerificationPPOPolicy = request.VerificationPIC.getVerificationPPOPolicy()></cfif>
		<cfset VerificationPercentagePayAfterDeductible = request.VerificationPIC.getVerificationPercentagePayAfterDeductible()>
		<cfif request.VerificationPIC.getVerificationPriorAuth() NEQ ""><cfset VerificationPriorAuth = request.VerificationPIC.getVerificationPriorAuth()></cfif>
		<cfset VerificationAuthNumber = request.VerificationPIC.getVerificationAuthNumber()>
		<cfif request.VerificationPIC.getVerificationLifetimeBenefitMet() NEQ ""><cfset VerificationLifetimeBenefitMet = request.VerificationPIC.getVerificationLifetimeBenefitMet()></cfif>
		<cfset VerificationAuthPhoneNumber = request.VerificationPIC.getVerificationAuthPhoneNumber()>
		<cfif request.VerificationPIC.getVerificationMedicareSupplement() NEQ ""><cfset VerificationMedicareSupplement = request.VerificationPIC.getVerificationMedicareSupplement()></cfif>
		<cfif request.VerificationPIC.getVerificationCoordinateBenefits() NEQ ""><cfset VerificationCoordinateBenefits = request.VerificationPIC.getVerificationCoordinateBenefits()></cfif>
		<cfif request.VerificationPIC.getVerificationPaidMedicareDeductible() NEQ ""><cfset VerificationPaidMedicareDeductible = request.VerificationPIC.getVerificationPaidMedicareDeductible()></cfif>
		<cfif request.VerificationPIC.getVerificationMedicaidPlan() NEQ "">
			<cfset VerificationMedicaidPlan = request.VerificationPIC.getVerificationMedicaidPlan()>			
		</cfif>	
		<cfset VerificationTypeBasePlan = request.VerificationPIC.getVerificationTypeBasePlan()>
		<cfset showSubmit = false>
	</cfif>
		
	
<!-------------------------------------------------------------------------------------->
<!--- Find out if this record has any verifications to show in history               --->
<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(picID)>		
		<cfset verifications = request.VerificationPIC.getVerificationPatientInsuranceQuery(picID: picID, fields: "VerificationHaveInsFromDate, VerificationHaveInsToDate, UsersID, VerificationRepFName, VerificationRepLName, VerificationTime, VerificationDate, DateCreated, VerificationPatientInsuranceID")>	
	<cfelse>
		
		<cfset verifications = querynew("VerificationHaveInsFromDate")><!---, VerificationHaveInsToDate, UsersID, VerificationRepFName, VerificationRepLName, VerificationTime, VerificationDate, DateCreated, VerificationPatientInsuranceID--->
							
	</cfif>			
	
		
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<input type="Hidden" name="#trim(number)#VerificationID" value="#verificationID#">
		<tr>
			<td colspan="6">
				
				<table cellpadding="4" cellspacing="0" id="tbl_verificationNew#trim(number)#" style="display: 'inline';" align="center">	  
					
					<tr>
					    <td bgcolor="DCE3EB" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td>
										&nbsp;<strong><font face="Arial" size="2"><span id="#trim(number)#ShowIntakeID"></span></font></strong>
									</td>
									<td align="center">							
										<font face="Arial" size="2"><strong>#UCase(trim(number))#&nbsp;INSURANCE&nbsp;VERIFICATION(S)</strong></font>
										<cfif IsQuery(verifications)>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span onclick="clearVerification#trim(number)#();#trim(number)#DisableVerification(0);" class="siteLabel" style="cursor:hand"><u>New&nbsp;Verification</u></span>&nbsp;&nbsp;<span id="#trim(number)#VerificationNotes" class=sitelabel style=cursor:hand onclick=createViewVerificationNotes#trim(number)#();><u>View/Add&nbsp;Notes</u></span></cfif>
									</td>
								</tr>
							</table>
						</td>								
					</tr>	
					<cfif IsDate(VerificationDate)>
						<cfset VerificationDateMM = NumberFormat(Month(VerificationDate), "00")>
						<cfset VerificationDateDD = NumberFormat(Day(VerificationDate), "00")>
						<cfset VerificationDateYY = Year(VerificationDate)>			
					</cfif>
					<tr>
						<td nowrap id="td_#trim(number)#VerificationRepNameTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
							REP&nbsp;FIRST:<input tabindex="372" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="#trim(number)#VerificationRepFNameTBox" value="#trim(VerificationRepFName)#" class="siteTextBox">
							&nbsp;LAST:<input tabindex="372" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="#trim(number)#VerificationRepLNameTBox" value="#trim(VerificationRepLName)#" class="siteTextBox">
						</td>
			 				<td id="td_#trim(number)#VerificationDate" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;DATE:&nbsp;<input tabindex="372" type="Text" name="#trim(number)#VerificationDateMM" onblur="checkMonth_JS(this);" value="#trim(VerificationDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="372" type="Text" name="#trim(number)#VerificationDateDD" onblur="checkDay_JS(this);" value="#trim(VerificationDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="372" type="Text" name="#trim(number)#VerificationDateYY" onblur="checkYear_JS(this);" value="#trim(VerificationDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
						<td id="td_#trim(number)#VerificationTimeTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;TIME:&nbsp;<input tabindex="372" type="Text" size="10" maxlength="10" name="#trim(number)#VerificationTimeTBox" value="#trim(VerificationTime)#" class="siteTextBox">&nbsp;<span class="copyGreySmall">(ex. 09:46 PM)</span></td>
					</tr>
					
					<input type="Hidden" name="#trim(number)#VerificationHaveInsYes" value="">
					<input type="Hidden" name="#trim(number)#VerificationHaveInsNo" value="">	
					<script language="JavaScript">						
						function checkHasInsurance(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationHaveIns', number + 'VerificationHaveInsYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationHaveIns', number + 'VerificationHaveInsNo');}	
								window.event.returnValue = false;						
							};									
						};
					</script>
					<cfif IsDate(VerificationHaveInsFromDate)>
						<cfset VerificationHaveInsFromDateMM = NumberFormat(Month(VerificationHaveInsFromDate), "00")>
						<cfset VerificationHaveInsFromDateDD = NumberFormat(Day(VerificationHaveInsFromDate), "00")>
						<cfset VerificationHaveInsFromDateYY = Year(VerificationHaveInsFromDate)>			
					</cfif>
					<cfif IsDate(VerificationHaveInsToDate)>
						<cfset VerificationHaveInsToDateMM = NumberFormat(Month(VerificationHaveInsToDate), "00")>
						<cfset VerificationHaveInsToDateDD = NumberFormat(Day(VerificationHaveInsToDate), "00")>
						<cfset VerificationHaveInsToDateYY = Year(VerificationHaveInsToDate)>			
					</cfif>		
					<tr>														   
			 				<td id="td_#trim(number)#VerificationHaveIns" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
							&nbsp;DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;INSURANCE&nbsp;WITH&nbsp;YOU?:&nbsp;&nbsp;&nbsp;<img 			onkeypress="checkHasInsurance('#number#',1);" tabindex="372" src="images/Checkbox1.gif" 			name="CheckUncheckPic_#trim(number)#VerificationHaveIns" alt="#trim(number)#VerificationHaveInsYes" onclick="checkBoxRadio('', 			'CheckUncheckPic_#trim(number)#VerificationHaveIns', 			'#trim(number)#VerificationHaveInsYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img onkeypress="checkHasInsurance('#number#',2);" 			tabindex="372" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationHaveIns" 			alt="#trim(number)#VerificationHaveInsNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveIns', 			'#trim(number)#VerificationHaveInsNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;EFFECTIVE&nbsp;DATES&nbsp;OF&nbsp;INSURANCE:&nbsp;&nbsp;FROM:&nbsp;<input tabindex="372" type="Text" name="#trim(number)#VerificationHaveInsFromMM" onblur="checkMonth_JS(this);" 			value="#trim(VerificationHaveInsFromDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" 			class="siteTextBox">&nbsp;/&nbsp;<input tabindex="372" type="Text" name="#trim(number)#VerificationHaveInsFromDD" 			onblur="checkDay_JS(this);" value="#trim(VerificationHaveInsFromDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" 			size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="372" type="Text" 			name="#trim(number)#VerificationHaveInsFromYY" onblur="checkYear_JS(this);" value="#trim(VerificationHaveInsFromDateYY)#" 			onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;&nbsp;TO:&nbsp;<input 			tabindex="372" type="Text" name="#trim(number)#VerificationHaveInsToMM" onblur="checkMonth_JS(this);" 			value="#trim(VerificationHaveInsToDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" 			class="siteTextBox">&nbsp;/&nbsp;<input tabindex="372" type="Text" name="#trim(number)#VerificationHaveInsToDD" 			onblur="checkDay_JS(this);" value="#trim(verificationHaveInsToDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" 		size="2" 	maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="372" type="Text" 		name="#trim(number)#VerificationHaveInsToYY" 	onblur="checkYear_JS(this);" value="#trim(verificationHaveInsToDateYY)#" 		onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" 	size="4" maxlength="4" class="siteTextBox">
						</td>
					</tr>
					
					<script language="JavaScript">	
						
						function #trim(number)#VerificationHaveIns(YesNo){							
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveIns', '#trim(number)#VerificationHaveInsYes')}				
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveIns', '#trim(number)#VerificationHaveInsNo')}
						}; 
						#trim(number)#VerificationHaveIns(#VerificationHaveIns#);
						
						function checkHaveDMECov(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationHaveDMECov', number + 'VerificationHaveDMECovYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationHaveDMECov', number + 'VerificationHaveDMECovNo');}	
								window.event.returnValue = false;						
							};									
						};
						function checkDeductible(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationDeductible', number + 'VerificationDeductibleYes')}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationDeductible', number + 'VerificationDeductibleNo')}	
								window.event.returnValue = false;						
							};									
						};
					</script>
					<input type="Hidden" name="#trim(number)#VerificationHaveDMECovYes" value="">
					<input type="Hidden" name="#trim(number)#VerificationHaveDMECovNo" value="">	
					<input type="Hidden" name="#trim(number)#VerificationDeductibleYes" value="">
					<input type="Hidden" name="#trim(number)#VerificationDeductibleNo" value="">	
					<tr>														   
						<td id="td_#trim(number)#VerificationHaveDMECov" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;DME&nbsp;COVERAGE?:&nbsp;&nbsp;&nbsp;<img tabindex="372" src="images/Checkbox1.gif" onkeypress="checkHaveDMECov('#number#', 1);" name="CheckUncheckPic_#trim(number)#VerificationHaveDMECov" alt="#trim(number)#VerificationHaveDMECovYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveDMECov', '#trim(number)#VerificationHaveDMECovYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkHaveDMECov('#number#', 2);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationHaveDMECov" alt="#trim(number)#VerificationHaveDMECovNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveDMECov', '#trim(number)#VerificationHaveDMECovNo')">&nbsp;NO</td>
						<td id="td_#trim(number)#VerificationDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;IS&nbsp;THERE&nbsp;A&nbsp;DEDUCTIBLE?:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkDeductible('#number#', 1);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationDeductible" alt="#trim(number)#VerificationDeductibleYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationDeductible', '#trim(number)#VerificationDeductibleYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkDeductible('#number#', 2);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationDeductible" alt="#trim(number)#VerificationDeductibleNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationDeductible', '#trim(number)#VerificationDeductibleNo')">&nbsp;NO</td>
					</tr>										
							
					<script language="JavaScript">	
						function #trim(number)#VerificationHaveDmeCov(YesNo){				
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveDMECov', '#trim(number)#VerificationHaveDMECovYes')}				
				   			else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationHaveDMECov', '#trim(number)#VerificationHaveDMECovNo')}
						};
						#trim(number)#VerificationHaveDmeCov(#trim(VerificationHaveDMECov)#);
						
						function #trim(number)#VerificationDeductible(YesNo){				
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationDeductible', '#trim(number)#VerificationDeductibleYes')}
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationDeductible', '#trim(number)#VerificationDeductibleNo')}
						};
						#trim(number)#VerificationDeductible(#trim(VerificationDeductible)#);
					</script>		
					<tr>														   
						<td id="td_#trim(number)#VerificationDeductibleAmountTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;AMOUNT&nbsp;OF&nbsp;DEDUCTIBLE:&nbsp;<input tabindex="372" type="Text" size="10" maxlength="10" name="#trim(number)#VerificationDeductibleAmountTBox" value="#trim(VerificationDeductibleAmount)#" class="siteTextBox"></td>
						<td id="td_#trim(number)#VerificationDeductibleAmountMetTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;HOW&nbsp;MUCH&nbsp;OF&nbsp;DEDUCTIBLE&nbsp;HAS&nbsp;BEEN&nbsp;MET?:&nbsp;<input tabindex="372" type="Text" size="10" maxlength="10" name="#trim(number)#VerificationDeductibleAmountMetTBox" value="#trim(VerificationDeductibleAmountMet)#" class="siteTextBox"></td>
					</tr>
					
					<script language="JavaScript">						
						function checkPPOPolicy(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationPPOPolicy', number + 'VerificationPPOPolicyYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationPPOPolicy', number + 'VerificationPPOPolicyNo');}	
								window.event.returnValue = false;						
							};									
						};				
					</script>
					<input type="Hidden" name="#trim(number)#VerificationPPOPolicyYes" value="">
					<input type="Hidden" name="#trim(number)#VerificationPPOPolicyNo" value="">	
					<tr>														   
						<td id="td_#trim(number)#VerificationPercentagePayAfterDeductibleTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;%&nbsp;OF&nbsp;PAY&nbsp;AFTER&nbsp;DEDUCTABLE:&nbsp;<input tabindex="372" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" size="5" maxlength="3" name="#trim(number)#VerificationPercentagePayAfterDeductibleTBox" value="#trim(VerificationPercentagePayAfterDeductible)#" class="siteTextBox"></td>
					  	<td id="td_#trim(number)#VerificationPPOPolicy" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;IS&nbsp;THIS&nbsp;A&nbsp;PPO/HMO&nbsp;POLICY?:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkPPOPolicy('#number#',1);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationPPOPolicy" alt="#trim(number)#VerificationPPOPolicyYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPPOPolicy', '#trim(number)#VerificationPPOPolicyYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkPPOPolicy('#number#',2);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationPPOPolicy" alt="#trim(number)#VerificationPPOPolicyNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPPOPolicy', '#trim(number)#VerificationPPOPolicyNo')">&nbsp;NO</td>
					</tr>
					
					<script language="JavaScript">	
						function #trim(number)#VerificationPPOPolicy(YesNo){									
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPPOPolicy', '#trim(number)#VerificationPPOPolicyYes')}				
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPPOPolicy', '#trim(number)#VerificationPPOPolicyNo')}
						}; 
						#trim(number)#VerificationPPOPolicy(#VerificationPPOPolicy#);						
						
						function checkPriorAuth(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationPriorAuth', number + 'VerificationPriorAuthYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationPriorAuth', number + 'VerificationPriorAuthNo');}	
								window.event.returnValue = false;						
							};									
						};				
					</script>
					
					<input type="Hidden" name="#trim(number)#VerificationPriorAuthYes" value="">
					<input type="Hidden" name="#trim(number)#VerificationPriorAuthNo" value="">	
					<tr>														   
						<td id="td_#trim(number)#VerificationPriorAuthorization" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;IS&nbsp;PRIOR&nbsp;AUTHORIZATION&nbsp;NECESSARY?:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkPriorAuth('#number#',1);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationPriorAuth" alt="#trim(number)#VerificationPriorAuthYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPriorAuth', '#trim(number)#VerificationPriorAuthYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkPriorAuth('#number#',2);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationPriorAuth" alt="#trim(number)#VerificationPriorAuthNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPriorAuth', '#trim(number)#VerificationPriorAuthNo')">&nbsp;NO</td>
						<td id="td_#trim(number)#VerificationAuthNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;Auth&nbsp;##:&nbsp;<input tabindex="372" type="Text" size="20" maxlength="20" name="#trim(number)#VerificationAuthNumberTBox" value="#trim(VerificationAuthNumber)#" class="siteTextBox"></td>
					</tr>
				
					<script language="JavaScript">	
						function #trim(number)#VerificationPriorAuth(YesNo){									
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPriorAuth', '#trim(number)#VerificationPriorAuthYes')}				
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationPriorAuth', '#trim(number)#VerificationPriorAuthNo')}
						}; 
						#trim(number)#VerificationPriorAuth(#VerificationPriorAuth#);
						
						function checkBenefitMet(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationLifetimeBenefitMet', number + 'VerificationLifetimeBenefitMetYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationLifetimeBenefitMet', number + 'VerificationLifetimeBenefitMetNo');}	
								window.event.returnValue = false;						
							};									
						};				
					</script>
						
					<input type="Hidden" name="#trim(number)#VerificationLifetimeBenefitMetYes" value="">
					<input type="Hidden" name="#trim(number)#VerificationLifetimeBenefitMetNo" value="">	
					<tr>														   
					 	<td id="td_#trim(number)#VerificationAuthPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;CONTACT&nbsp;NUMBER&nbsp;FOR&nbsp;AUTH:&nbsp;<input tabindex="372" type="Text" size="25" maxlength="24" name="#trim(number)#VerificationAuthPhoneNumberTBox" value="#REQUEST.formatPhoneUS(trim(VerificationAuthPhoneNumber))#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
					 	<td id="td_#trim(number)#VerificationLifetimeBenefitMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;HAS&nbsp;LIFETIME&nbsp;BENEFIT&nbsp;BEEN&nbsp;MET?:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkBenefitMet('#number#', 1);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationLifetimeBenefitMet" alt="#trim(number)#VerificationLifetimeBenefitMetYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationLifetimeBenefitMet', '#trim(number)#VerificationLifetimeBenefitMetYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkBenefitMet('#number#', 2);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationLifetimeBenefitMet" alt="#trim(number)#VerificationLifetimeBenefitMetNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationLifetimeBenefitMet', '#trim(number)#VerificationLifetimeBenefitMetNo')">&nbsp;NO</td>
					</tr>
					<script language="JavaScript">	
						function #trim(number)#VerificationLifetimeBenefitMet(YesNo){									
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationLifetimeBenefitMet', '#trim(number)#VerificationLifetimeBenefitMetYes')}				
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationLifetimeBenefitMet', '#trim(number)#VerificationLifetimeBenefitMetNo')}
						}; 
						#trim(number)#VerificationLifetimeBenefitMet(#VerificationLifetimeBenefitMet#);
															
						function checkMedicareSupplement(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'MedicareSupplement', number + 'MedicareSupplementYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'MedicareSupplement', number + 'MedicareSupplementNo');}	
								window.event.returnValue = false;						
							};									
						};
						function checkCoordinateBenefits(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'CoordinateBenefits', number + 'CoordinateBenefitsYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'CoordinateBenefits', number + 'CoordinateBenefitsNo');}	
								window.event.returnValue = false;						
							};									
						};	
						function checkPaidMedicareDeductible(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'PaidMedicareDeductible', number + 'PaidMedicareDeductibleYes');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'PaidMedicareDeductible', number + 'PaidMedicareDeductibleNo');}	
								window.event.returnValue = false;						
							};									
						};					
					</script>
					<input type="Hidden" name="#trim(number)#MedicareSupplementYes" value="">
					<input type="Hidden" name="#trim(number)#MedicareSupplementNo" value="">	
					<input type="Hidden" name="#trim(number)#CoordinateBenefitsYes" value="">
					<input type="Hidden" name="#trim(number)#CoordinateBenefitsNo" value="">
					<input type="Hidden" name="#trim(number)#PaidMedicareDeductibleYes" value="">
					<input type="Hidden" name="#trim(number)#PaidMedicareDeductibleNo" value="">	
					<tr>														   
						<td id="td_#trim(number)#MedicareSupplement" colspan="6" class="siteLabel" style="border-Top: 0px solid; 		border-right: 	1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 			000000;">&nbsp;MEDICARE&nbsp;SUPPLEMENT:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkMedicareSupplement('#number#',1);" 			src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#MedicareSupplement" alt="#trim(number)#MedicareSupplementYes" 			onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#MedicareSupplement', 			'#trim(number)#MedicareSupplementYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" 			onkeypress="checkMedicareSupplement('#number#',2);" src="images/Checkbox1.gif" 			name="CheckUncheckPic_#trim(number)#MedicareSupplement" alt="#trim(number)#MedicareSupplementNo" onclick="checkBoxRadio('', 			'CheckUncheckPic_#trim(number)#MedicareSupplement', 			'#trim(number)#MedicareSupplementNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COORDINATE&nbsp;BENEFITS			:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkCoordinateBenefits('#number#', 1);" src="images/Checkbox1.gif" 			name="CheckUncheckPic_#trim(number)#CoordinateBenefits" alt="#trim(number)#CoordinateBenefitsYes" onclick="checkBoxRadio('', 			'CheckUncheckPic_#trim(number)#CoordinateBenefits', 			'#trim(number)#CoordinateBenefitsYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" 			onkeypress="checkCoordinateBenefits('#number#', 2);" src="images/Checkbox1.gif" 			name="CheckUncheckPic_#trim(number)#CoordinateBenefits" alt="#trim(number)#CoordinateBenefitsNo" onclick="checkBoxRadio('', 			'CheckUncheckPic_#trim(number)#CoordinateBenefits', 			'#trim(number)#CoordinateBenefitsNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAID&nbsp;MEDICARE&nbsp;			DEDUCTIBLE:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkPaidMedicareDeductible('#number#', 1);" 			src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#PaidMedicareDeductible" 			alt="#trim(number)#PaidMedicareDeductibleYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#number#PaidMedicareDeductible', 			'#trim(number)#PaidMedicareDeductibleYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" 			onkeypress="checkPaidMedicareDeductible('#number#', 2);" src="images/Checkbox1.gif" 			name="CheckUncheckPic_#trim(number)#PaidMedicareDeductible" alt="#trim(number)#PaidMedicareDeductibleNo" onclick="checkBoxRadio('', 			'CheckUncheckPic_#trim(number)#PaidMedicareDeductible', '#trim(number)#PaidMedicareDeductibleNo')">&nbsp;NO								
						</td>
					</tr>
																
					<script language="JavaScript">	
						function #trim(number)#VerificationMedicareSupplement(YesNo){									
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#MedicareSupplement', '#trim(number)#MedicareSupplementYes')}				
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#MedicareSupplement', '#trim(number)#MedicareSupplementNo')};
						}; 
						#trim(number)#VerificationMedicareSupplement(#VerificationMedicareSupplement#);
						
						function #trim(number)#VerificationCoordinateBenefits(YesNo){									
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CoordinateBenefits', '#trim(number)#CoordinateBenefitsYes')}				
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CoordinateBenefits', '#trim(number)#CoordinateBenefitsNo')};
						}; 
						#trim(number)#VerificationCoordinateBenefits(#VerificationCoordinateBenefits#);
												
						function #trim(number)#VerificationPaidMedicareDeductible(YesNo){									
							if(YesNo == 0){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#PaidMedicareDeductible', '#trim(number)#PaidMedicareDeductibleYes')}				
							else if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#PaidMedicareDeductible', '#trim(number)#PaidMedicareDeductibleNo')}
						}; 
						#trim(number)#VerificationPaidMedicareDeductible(#VerificationPaidMedicareDeductible#);
						
						function checkMedicaidPlan(number, sel){					
							if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
								if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationMedicaidPlan', number + 'VerificationMedicaidPlanMQMB');}
								else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationMedicaidPlan', number + 'VerificationMedicaidPlanQMB');}	
								else if(sel == 3){checkBoxRadio('', 'CheckUncheckPic_' + number + 'VerificationMedicaidPlan', number + 'VerificationMedicaidPlanTraditional');}	
								window.event.returnValue = false;						
							};									
						};							
					</script>					
					<input type="Hidden" name="#trim(number)#VerificationMedicaidPlanMQMB" value="">
					<input type="Hidden" name="#trim(number)#VerificationMedicaidPlanQMB" value="">
					<input type="Hidden" name="#trim(number)#VerificationMedicaidPlanTraditional" value="">							
					<tr>														   
						<td id="td_#trim(number)#VerificationTypeBasePlanTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;MEDICAID&nbsp;PLAN:&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkMedicaidPlan('#number#', 1);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationMedicaidPlan" alt="#trim(number)#VerificationMedicaidPlanMQMB" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationMedicaidPlan', '#trim(number)#VerificationMedicaidPlanMQMB')">&nbsp;MQMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkMedicaidPlan('#number#', 2);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationMedicaidPlan" alt="#trim(number)#VerificationMedicaidPlanQMB" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationMedicaidPlan', '#trim(number)#VerificationMedicaidPlanQMB')">&nbsp;QMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="372" onkeypress="checkMedicaidPlan('#number#', 3);" src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#VerificationMedicaidPlan" alt="#trim(number)#VerificationMedicaidPlanTraditional" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationMedicaidPlan', '#trim(number)#VerificationMedicaidPlanTraditional')">&nbsp;TRADITIONAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;TYPE&nbsp;OF&nbsp;BASE&nbsp;PLAN:&nbsp;<input tabindex="372" type="Text" name="#trim(number)#VerificationTypeBasePlanTBox" value="#trim(VerificationTypeBasePlan)#" class="siteTextBox" size="35" maxlength="49"></td>
					</tr>	
					
					<script language="JavaScript">	
						function #trim(number)#VerificationMedicaidPlan(YesNo){									
							if(YesNo == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationMedicaidPlan', '#trim(number)#VerificationMedicaidPlanMQMB')}				
							else if(YesNo == 2){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationMedicaidPlan', '#trim(number)#VerificationMedicaidPlanQMB')}
							else if(YesNo == 3){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#VerificationMedicaidPlan', '#trim(number)#VerificationMedicaidPlanTraditional')}
						}; 
						
						#trim(number)#VerificationMedicaidPlan(#VerificationMedicaidPlan#);
					</script>	
				
				</table>
		
			</td>
		</tr>	
		
		<cfif IsNumeric(verificationID)>
			<script language="JavaScript">
				#trim(number)#DisableVerification(1);
			</script>	
		</cfif>	
		
		<!---<cfif IsQuery(verifications) AND verifications.RecordCount GTE 1>		--->
			<tr>
				<td colspan="6">
					<table width="100%" id="tbl_verificationHistory#trim(number)#" style="display: 'inline';" align="center" cellpadding="2" cellspacing="0">
						<tr>			   	
						    <td colspan="6" bgcolor="DCE3EB" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
								<font face="Arial" size="2"><strong>INSURANCE&nbsp;VERIFICATION&nbsp;HISTORY</strong></font>
							</td>											
						</tr>
						<!---<cfif IsQuery(verifications)>--->
							<tr>			   	
							    <td colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									<table align="center" cellpadding="6" cellspacing="0" border="0" id="#number#VerificationsTable">
										<tr id="headerRow" style="background-color:ffffcc">					
											<td class="siteLabel" align="center"><strong>ID</strong></td>
											<td class="siteLabel" align="center"><strong>Date Verified</strong></td>
											<td class="siteLabel" align="center"><strong>Time Verified</strong></td>
											<td class="siteLabel" align="center"><strong>Verified By</strong></td>
											<td class="siteLabel" align="center"><strong>Rep Name</strong></td>
											<td class="siteLabel" align="center"><strong>Effective Date From</strong></td>
											<td class="siteLabel" align="center"><strong>Effective Date To</strong></td>
										</tr>
										<cfloop query="verifications">
											<cfif currentrow MOD 2 EQ 0> 
												<cfset rowColor = "F4F2F2">
											<cfelse>
												<cfset rowColor = "FFFFFF">	
											</cfif>
											<cfquery name="getUsersName" datasource="#trim(request.datasource)#">
												SELECT CONCAT(FName, ' ', LName) AS Fullname FROM view_useraccountparameters WHERE UsersID = #trim(UsersID)#
											</cfquery>									
											<tr bgcolor="#trim(rowColor)#" id="row_#trim(VerificationPatientInsuranceID)#" onclick="resetVerification#trim(number)#(#trim(VerificationPatientInsuranceID)#);" style="cursor:hand" onmouseover="this.style.backgroundColor='DCE3EB'" onmouseout="this.style.backgroundColor='FFFFFF'">
												<td class="siteLabel">#trim(VerificationPatientInsuranceID)#</td>
												<td class="siteLabel">#DateFormat(VerificationDate, "MM/DD/YYYY")#</td>
												<td class="siteLabel" align="center">#trim(VerificationTime)#</td>
												<td class="siteLabel">#getUsersName.Fullname#</td>
												<td class="siteLabel">#VerificationRepFName# #VerificationRepLName#</td>	
												<td class="siteLabel" align="center"><cfif IsDate(VerificationHaveInsFromDate)>#DateFormat(VerificationHaveInsFromDate, "MM/DD/YYYY")#</cfif></td>
												<td class="siteLabel" align="center"><cfif IsDate(VerificationHaveInsToDate)>#DateFormat(VerificationHaveInsToDate, "MM/DD/YYYY")#</cfif></td>							
											</tr>	
										</cfloop>
									</table>
								</td>
							</tr>	
						<!---</cfif>--->						
						
					</table>	
			
				</td>
				
			</tr>	
			
		<!---</cfif>--->
				
			
	</cfoutput>		
		
















<!---<cfoutput>
			<script language="JavaScript">
				function swapTables#trim(number)#(){				
					if(tbl_verificationNew#trim(number)#.style.display == "none"){				
						tbl_verificationNew#trim(number)#.style.display = "inline";
						tbl_verificationHistory#trim(number)#.style.display = "none";
					}
					else{
						tbl_verificationNew#trim(number)#.style.display = "none";
						tbl_verificationHistory#trim(number)#.style.display = "inline";
					};				
				};		
			</script>
		</cfoutput>--->

			
