<!---- appIntakeAutoSave.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="Submitted" default="no">



<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->
	<cfif NOT IsDefined("form.Submitted")>		
			
		<cftry>	
	
			<cfoutput>
													
				<form name="autoSaveIframe" method="post">		
					<input type="Hidden" name="Submitted" value="yes">
				</form>
			
				<script language="JavaScript">			
					function addFormFields(){
					
						var theForm = window.parent.document.PatientIntakeForm;
						
						for(i=0; i < theForm.elements.length; i++){			  				
						      
							  //alert(i + " : " + theForm.elements[i].type + " : " + theForm.elements[i].name + " : " + theForm.elements[i].value);
							  
							  if(theForm.elements[i].type == "text" || theForm.elements[i].type == "textarea" || theForm.elements[i].type == "hidden"){
						      	addField('autoSaveIframe', theForm.elements[i].type, theForm.elements[i].name, theForm.elements[i].value);
						      }
						      else if(theForm.elements[i].type == "checkbox" || theForm.elements[i].type == "radio"){
						      	addField('autoSaveIframe', theForm.elements[i].type, theForm.elements[i].name, theForm.elements[i].checked);
						      }
						      
							  else if(theForm.elements[i].type == "select-one" && theForm.elements[i].options.length > 0 && theForm.elements[i].options[theForm.elements[i].selectedIndex].value != ""){
							  	addField('autoSaveIframe', theForm.elements[i].type, theForm.elements[i].name, theForm.elements[i].options[theForm.elements[i].selectedIndex].value);
						      }				  
						};
					};		
																
					function addField(formName, fieldType, fieldName, fieldValue) {			  
						
						var formElement=document.getElementById(formName);					
						newField = document.createElement("input");
						newField.type = "hidden";
						newField.name = fieldName;
						newField.value = fieldValue;					
						formElement.appendChild(newField);				
							  
					};				
					
				</script>
			</cfoutput>
			
			
			<cfcatch type="Any">					
				<cfset message="#cfcatch.type# #cfcatch.message# #cfcatch.detail#">
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(message)#">	
				<cfthrow message="#trim(message)#">
			</cfcatch>	
				
		</cftry>
		
<!-------------------------------------------------------------------------------------->
<!--- Submitted Form.                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfelse>	
			
		<cftry>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- Get the columns in the intake table.                                           --->
			<!-------------------------------------------------------------------------------------->	
			<cfquery name="getTableColumns" datasource="#request.datasource#">
				SELECT c.name ColumnName, t.name DataType, c.length ColumnLength, c.isnullable IsNullableField, c.cdefault HasDefaultValue, c.colstat IdentityField 
				FROM syscolumns c   INNER JOIN systypes t   ON c.xusertype = t.xusertype 
				WHERE id=object_id('Intake')
			</cfquery>	
			
			<cfset tableColumnsList = valuelist(getTableColumns.ColumnName)>	
			<cfset notUpdateList = "clientID,IntakeID,hidden_UsersID,HIDDEN_STEP_OLD,Note,Submitted,AutoSaveOn,IntakeAutoSaveID,hidden_TimeStart,TypeOfPay_Radio,ClearStepPhysician,ClearStepEquipment,ClearStepVerify,ClearStepHCPC,CPAPSTUDY_CBOX,CPAPSTUDYONFILE_CBOX">
			<cfset foundVar = "">
			<cfset foundVarHCPC = "">
			<cfset patientInfo = "">
			
			<cfloop list="#trim(form.fieldNames)#" index="i">
				
				<cfset param = i>		
				<cfset form_element_name = "form." & i>
				<cfset val = URLDecode(evaluate(form_element_name))>		
				
				<!---<cfquery name="tempIns" datasource="PAClient_1084">
				INSERT INTO debug(referenceID, note) VALUES(123, '#trim(i)#')
			</cfquery>--->
				
				<cfif FindNoCase("patient", trim(i))>
					<cfset patientInfo = patientInfo & "<#LCase(trim(i))#>#trim(val)#</#LCase(trim(i))#>">								
				<cfelseif LEFT(trim(i), 4) NEQ "hcpc" AND ListFindNoCase(tableColumnsList, trim(i)) AND NOT ListFindNoCase(notUpdateList, trim(i)) AND val EQ "">
					<cfset foundVar = foundVar & ", #trim(i)# = NULL">						
				<cfelseif LEFT(trim(i), 4) NEQ "hcpc" AND ListFindNoCase(tableColumnsList, trim(i)) AND NOT ListFindNoCase(notUpdateList, trim(i)) AND val NEQ "">
					<cfif FindNoCase("Phone", i) OR FindNoCase("Fax", i)>
						<cfset val = REQUEST.cleanNumericString(val)>
					</cfif>
					<cfset foundVar = foundVar & ", #trim(i)# = '#trim(val)#'">								
				</cfif>
								
			</cfloop>
			
			<cfif NOT FindNoCase("patientAddressStateID", patientInfo)>
				<cfset patientInfo = patientInfo & "<patientaddressstateid></patientaddressstateid>">			
			</cfif>
			
				
			<cfset pXML = ", patientXML = '<?xml version=""1.0"" encoding=""UTF-8""?><patient>#patientInfo#</patient>'">	
												
			<cfsavecontent variable="sqlStatement">
				<cfoutput>
					UPDATE intake SET dateModified = now()#PreserveSingleQuotes(foundVar)# #trim(pXML)# WHERE intakeID = #trim(form.intakeID)#
				</cfoutput>
			</cfsavecontent> 
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- HCPC update.                                                                   --->
			<!-------------------------------------------------------------------------------------->
			<cfloop list="#trim(form.fieldNames)#" index="i">
				
				<cfset param = i>		
				<cfset form_element_name = "form." & i>
				<cfset val = URLDecode(evaluate(form_element_name))>		
												
				<cfif LEFT(trim(i), 4) EQ "hcpc" AND FindNoCase("Tbox", trim(i)) AND val EQ "">
					<cfset foundVarHCPC = foundVarHCPC & ", #trim(i)# = NULL">						
				<cfelseif LEFT(trim(i), 4) EQ "hcpc" AND FindNoCase("Tbox", trim(i)) AND val NEQ "">					
					<cfset foundVarHCPC = foundVarHCPC & ", #trim(i)# = '#trim(val)#'">								
				</cfif>
								
			</cfloop>				
			<!---<cffile action="write" file="c:\temp\thisNOW.txt" output="#foundVarHCPC#" addnewline="no">	--->			
			<cfif trim(foundVarHCPC) NEQ "">
				<cfsavecontent variable="sqlStatementHCPC">
					<cfoutput>
						UPDATE intakehcpc SET dateModified = now()#PreserveSingleQuotes(foundVarHCPC)# WHERE intakeID = #trim(form.intakeID)#
					</cfoutput>
				</cfsavecontent> 
			</cfif>				
			<!---<cffile action="write" file="c:\temp\thisNOW2.txt" output="#sqlStatementHCPC#" addnewline="no">	--->
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- If the note is filled in then go ahead and add the note.                       --->
			<!-------------------------------------------------------------------------------------->			
			<cfif isDefined("form.note") AND form.note NEQ "" AND IsDefined("form.clientID") AND IsNumeric(form.clientID)>				
				
				<cfset request.NoteXML = application.beanFactory.getBean("Note") />					
				<cfset noteID = request.NoteXML.getNoteID(objectID: 8, instanceID: trim(form.intakeID), clientID: trim(form.clientID))>
				<cfif NOT IsNumeric(noteID) AND IsNumeric(form.intakeID)>
					<cfset noteID = request.NoteXML.addNote(clientID: trim(form.clientID), objectID: 8, instanceID: trim(form.intakeID))>						
				</cfif>
				<cfset request.NoteXML.replaceLastNoteEntry(clientID: trim(form.ClientID), NoteID: noteID, noteEntry: '#trim(form.note)#', userID: trim(session.user.getUsersID()), userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getFName())#')>
					
			</cfif>
			
				
				
			<!--- Use for debug cannot insert into debug.--->
			<!---<cffile action="write" file="c:\temp\thisNOW.txt" output="#sqlStatement#" addnewline="no">	--->
			
				
											
			<cfquery name="updateIntake" datasource="#trim(request.datasource)#">
				#PreserveSingleQuotes(sqlStatement)#
			</cfquery>	
			
			<cfquery name="updateIntakeHCPC" datasource="#trim(request.datasource)#">
				#PreserveSingleQuotes(sqlStatementHCPC)#
			</cfquery>	
										
			<cflocation addtoken="No" url="appIntakeAutoSave.cfm">	
			
			
			<cfcatch type="Any">					
				<cfset message="#cfcatch.type# #cfcatch.message# #cfcatch.detail#">
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(message)#">					
			</cfcatch>	
				
		</cftry>
		
				
				
	</cfif>			














	
	
	
	
	
	
	
<!---Original code 1/13/07 before just putting data in intake.
	
<!---- appIntakeAutoSave.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="Submitted" default="no">



<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->
	<cfif NOT IsDefined("form.Submitted")>		
			
		<cftry>	
	
			<cfoutput>
			
			<form name="autoSaveIframe" method="post">		
				<input type="Hidden" name="Submitted" value="yes">
			</form>
			
				<script language="JavaScript">			
					function addFormFields(){
					
						var theForm = window.parent.document.PatientIntakeForm;
						
						for(i=0; i < theForm.elements.length; i++){			  				
						      if((theForm.elements[i].type == "text" || theForm.elements[i].type == "textarea" || theForm.elements[i].type == "hidden") && theForm.elements[i].value != ""){
						      	addField('autoSaveIframe', theForm.elements[i].type, theForm.elements[i].name, theForm.elements[i].value);
						      }
						      else if((theForm.elements[i].type == "checkbox" || theForm.elements[i].type == "radio") && theForm.elements[i].checked != ""){
						      	addField('autoSaveIframe', theForm.elements[i].type, theForm.elements[i].name, theForm.elements[i].checked);
						      }
						      else if(theForm.elements[i].type == "select-one" && theForm.elements[i].options[theForm.elements[i].selectedIndex].text != ""){
							  	addField('autoSaveIframe', theForm.elements[i].type, theForm.elements[i].name, theForm.elements[i].options[theForm.elements[i].selectedIndex].text);
						      }				  
						};
					};		
																
					function addField(formName, fieldType, fieldName, fieldValue) {			  
						
						var formElement=document.getElementById(formName);					
						newField = document.createElement("input");
						newField.type = "hidden";
						newField.name = fieldName;
						newField.value = fieldValue;					
						formElement.appendChild(newField);				
							  
					};				
					
				</script>
			</cfoutput>
			
			
			<cfcatch type="Any">					
				<cfset message="#cfcatch.type# #cfcatch.message# #cfcatch.detail#">
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(message)#">	
				<cfthrow message="#trim(message)#">
			</cfcatch>	
				
		</cftry>
		
<!-------------------------------------------------------------------------------------->
<!--- Submitted Form.                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfelse>	
			
		<cftry>		
				
			<cfset intakeStruct = structNew()>
		
			<cfloop list="#trim(form.fieldNames)#" index="i">
				
				<cfset param = i>		
				<cfset form_element_name = "form." & i>
				<cfset val = URLDecode(evaluate(form_element_name))>		
				<cfset "intakeStruct.#param#" = val>
				
				<cfif i EQ "patientFNameTBox">
					<cfset PatientFName = val>
				<cfelseif i EQ "patientLNameTBox">
					<cfset PatientLName = val>	
				<cfelseif i EQ "hidden_UsersID">
					<cfset hidden_UsersID = val>	
				</cfif>
				
			</cfloop>
			
			<cfinvoke component="com.common.toXML" method="structToXML" data="#intakeStruct#" rootelement="Intakes" itemelement="Intake" returnvariable="xmlStruct">
			
			<cfset request.IntakeAutoSave = CreateObject("component","com.common.db.IntakeAutoSaveIO")>	
			<cfset checkAutoSave = request.IntakeAutoSave.getIntakeAutoSaveQuery(fields: 'RecordID', UsersID: trim(hidden_UsersID), PatientFName: '#trim(patientFNameTBox)#', PatientLName: '#trim(patientLNameTBox)#')>		
		
			<!---<cfquery name="checkAutoSave" datasource="#trim(request.datasource)#">
				SELECT RecordID
				FROM intakeautosave
				WHERE UsersID = #trim(hidden_UsersID)# AND PatientFName = '#trim(patientFNameTBox)#' AND PatientLName = '#trim(patientLNameTBox)#'
			</cfquery>		--->	
			
			<cfif checkAutoSave.RecordCount GTE 1>	
			
				<cfquery name="updateAutoSave" datasource="#trim(request.datasource)#">
					UPDATE intakeautosave
					SET IntakeXML = '#trim(xmlStruct)#', dateModified = now()
					WHERE RecordID = #trim(checkAutoSave.RecordID)#
				</cfquery>			
			
			<cfelse>
			
				<cfquery name="insertAutoSave" datasource="#trim(request.datasource)#">
					INSERT INTO intakeautosave(UsersID,PatientFName,PatientLName,IntakeXML) 
					VALUES(#trim(hidden_UsersID)#, '#trim(patientFNameTBox)#', '#trim(patientLNameTBox)#', '#trim(xmlStruct)#')
				</cfquery>	
			
			</cfif>
								
			<cflocation addtoken="No" url="appIntakeAutoSave.cfm">	
			
			
			<cfcatch type="Any">					
				<cfset message="#cfcatch.type# #cfcatch.message# #cfcatch.detail#">
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="#trim(message)#">	
				<cfthrow message="#trim(message)#">
			</cfcatch>	
				
		</cftry>
		
				
				
	</cfif>			


	--->



