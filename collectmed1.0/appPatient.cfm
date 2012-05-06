<!---- appPatient.cfm ---->

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
	
	<cfparam name="attributes.patientID" default="">
	<cfset patientID = attributes.patientID>
		
	<cfif IsDefined("form.patientID") AND form.patientID NEQ "">
		<cfset patientID = form.patientID>
	<cfelseif IsDefined("url.patientID") AND url.patientID NEQ "">
		<cfset patientID = url.patientID>	
	</cfif>
		
	<cfparam name="attributes.reload" default="yes">
	<cfset reload = attributes.reload>
		
	<cfif IsDefined("form.reload") AND form.reload NEQ "">
		<cfset reload = form.reload>
	<cfelseif IsDefined("url.reload") AND url.reload NEQ "">
		<cfset reload = url.reload>	
	</cfif>
	
	<cfparam name="attributes.func" default="">
	<cfset func = attributes.func>
		
	<cfif IsDefined("form.func") AND form.func NEQ "">
		<cfset func = form.func>
	<cfelseif IsDefined("url.func") AND url.func NEQ "">
		<cfset func = url.func>	
	</cfif>
	
	<cfparam name="attributes.resetA" default="">
	<cfset resetA = attributes.resetA>
	
	<cfif IsDefined("form.resetA") AND form.resetA NEQ "">
		<cfset resetA = form.resetA>
	<cfelseif IsDefined("url.resetA") AND url.resetA NEQ "">
		<cfset resetA = url.resetA>	
	</cfif>	
	
	<cfparam name="attributes.resetP" default="">
	<cfset resetP = attributes.resetP>
	
	<cfif IsDefined("form.resetP") AND form.resetP NEQ "">
		<cfset resetP = form.resetP>
	<cfelseif IsDefined("url.resetP") AND url.resetP NEQ "">
		<cfset resetP = url.resetP>	
	</cfif>	
	
			
					
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="patientID"
		fieldnames="Patient ID"
		datatypes="numeric">
		
	
		
<!-------------------------------------------------------------------------------------->
<!--- Create the patient object.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfset request.patient = CreateObject("component", "com.common.Patient").init(patientID)>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the Entity object based on the patientID sent in.                       --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Entity = CreateObject("component", "com.common.Entity").init(trim(request.Patient.getEntityID()))>	
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- tab needed code.                                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script type="text/javascript" src="includes/tabber.js"></script>
		<link rel="stylesheet" href="styles/tabber.css" TYPE="text/css" MEDIA="screen">
		
		<script type="text/javascript">
			document.write('<style type="text/css">.tabber{display:none;}<\/style>');
		</script>
	</cfoutput>
	
	
	
<!------------------------------------------------------------------------------------------->
<!--- For some reason this table is what makes the tabs go flush left this must be fixed. --->
<!------------------------------------------------------------------------------------------->
<table align="center" cellspacing="0" cellpadding="2" border="0" width="100%">	
	<tr>
		<td>		
			<div class="tabber" style="margin-top:6px">							    										
			    <div id="tabPatientInfo" class="tabbertab">
					<h2><span id="tabPatientInfoVerbiage">Personal</span></h2>
					<cf_tagEntityPersonalInformationForm>
			    </div>									
				<div id="tabPatientAddress" class="tabbertab">
					<h2><span id="tabPatientAddressVerbiage">Addresses</span></h2>					
					<cfif IsDefined("form.addressID") AND IsNumeric(form.addressID) AND IsDefined("form.action") AND form.action EQ "edit">
						<cf_tagAddressFormEdit title="Edit Address Information" tabstart="100" entityid="#trim(request.Entity.getEntityID())#" addressid="#trim(form.addressID)#">
					<cfelseif IsDefined("form.addressID") AND IsNumeric(form.addressID) AND IsDefined("form.action") AND form.action EQ "save">
						<cf_tagAddressFormSave entityid="#trim(request.Entity.getEntityID())#">
					<cfelseif IsDefined("form.addressID") AND IsNumeric(form.addressID) AND IsDefined("form.action") AND form.action EQ "add">
						<cf_tagAddressFormAdd>
					<cfelseif IsDefined("form.addressID") AND IsNumeric(form.addressID) AND IsDefined("form.action") AND form.action EQ "delete">
						<cf_tagAddressFormDelete addressID="#trim(form.addressID)#">		
					<cfelse>
						<cf_tagEntityAddressesForm title="Patient's Address Information" tabstart="100" entityid="#trim(request.Entity.getEntityID())#">
					</cfif>
			    </div>		
				<div id="tabPatientPhone" class="tabbertab">
					<h2><span id="tabPatientPhoneVerbiage">Phones</span></h2>
					<cfif IsDefined("form.phoneID") AND IsNumeric(form.phoneID) AND IsDefined("form.action") AND form.action EQ "edit">
						<cf_tagPhoneFormEdit title="Edit Address Information" tabstart="100" entityid="#trim(request.Entity.getEntityID())#" phoneID="#trim(form.phoneID)#">
					<cfelseif IsDefined("form.phoneID") AND IsNumeric(form.phoneID) AND IsDefined("form.action") AND form.action EQ "save">
						<cf_tagPhoneFormSave entityid="#trim(request.Entity.getEntityID())#">
					<cfelseif IsDefined("form.phoneID") AND IsNumeric(form.phoneID) AND IsDefined("form.action") AND form.action EQ "add">
						<cf_tagPhoneFormAdd>
					<cfelseif IsDefined("form.phoneID") AND IsNumeric(form.phoneID) AND IsDefined("form.action") AND form.action EQ "delete">
						<cf_tagPhoneFormDelete phoneid="#trim(form.phoneID)#">	
					<cfelse>
						<cf_tagEntityPhonesForm title="Patient's Phone Information" tabstart="110" entityid="#trim(request.Entity.getEntityID())#">
					</cfif>	
			    </div>
				<div id="tabPatientInsCo" class="tabbertab">
					<h2><span id="tabPatientInsCoVerbiage">Insurance</span></h2>
					<cf_tagPatientInsuranceForm>
			    </div>																						
			</div>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- Show this tab.                                                                 --->
			<!-------------------------------------------------------------------------------------->									
			<cfoutput>				
				<cfif IsDefined("tab") AND trim(tab) EQ "address">				
					<script language="JavaScript">
						document.getElementById("tabPatientAddress").className = 'tabbertab tabbertabdefault';
					</script>				
				</cfif>			
				<cfif IsDefined("tab") AND trim(tab) EQ "phone">				
					<script language="JavaScript">
						document.getElementById("tabPatientPhone").className = 'tabbertab tabbertabdefault';
					</script>				
				</cfif>													
			</cfoutput>
			
		</td>
	</tr>							
</table>		
	
	
	
<cfif IsDefined("url.reloadProcessed") AND trim(url.reloadProcessed) EQ "yes">				
	<script language="JavaScript">	
		reloadMain();	
	</script>				
</cfif>				
	
	