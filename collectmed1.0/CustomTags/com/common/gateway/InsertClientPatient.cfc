
<cfcomponent>
  
   <cffunction name="onIncomingMessage" output="no">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
						
			<cf_gcCFScriptIncludes>		
			<cfset data = CFEvent.data>								
			
			<cfset count = "#trim(data.count)#">		
			<cfset siteID = "#trim(data.siteID)#">			
			<cfset clientID = "#trim(data.clientID)#">    	
			<cfset request.datasource = "#trim(data.datasource)#">
			<cfset supportEmailAddressID = "#trim(data.SupportEmailAddressID)#">  
			<cfset i = "#trim(data.dataString)#">  
				
			<cfset FirstName_1 = ListGetAt(i, 1, "|")>
			<cfset MI_2 = ListGetAt(i, 2, "|")>
			<cfset LName_3 = ListGetAt(i, 3, "|")>
			<cfset Address1_4 = ListGetAt(i, 4, "|")>
			<cfset Address2_5 = ListGetAt(i, 5, "|")>
			<cfset City_6 = ListGetAt(i, 6, "|")>
			<cfset ST_7 = ListGetAt(i, 7, "|")>
			<cfset Zip_8 = ListGetAt(i, 8, "|")>
			<cfset PhoneHome_9 = ListGetAt(i, 9, "|")>
			<cfset PhoneWork_10 = ListGetAt(i, 10, "|")>
			<cfset Ext_11 = ListGetAt(i, 11, "|")>
			<cfset Company_12 = ListGetAt(i, 12, "|")>
			<cfset DezineAcctNo_13 = ListGetAt(i, 13, "|")>
			<cfset AcctType_14 = ListGetAt(i, 14, "|")>
			<cfset SSN_15 = ListGetAt(i, 15, "|")>
			<cfset DOB_16 = ListGetAt(i, 16, "|")>
			<cfset Sex_17 = ListGetAt(i, 17, "|")>
			<cfset MarStat_18 = ListGetAt(i, 18, "|")>
			<cfset EmplStat_19 = ListGetAt(i, 19, "|")>
			<cfset StmtFormat_20 = ListGetAt(i, 20, "|")>
			<cfset CoordCare_21 = ListGetAt(i, 21, "|")>
			<cfset CustClass_22 = ListGetAt(i, 22, "|")>
			<cfset ShipTo_23 = ListGetAt(i, 23, "|")>
			<cfset ShipName_24 = ListGetAt(i, 24, "|")>
			<cfset CntFirst_25 = ListGetAt(i, 25, "|")>
			<cfset CntLast_26 = ListGetAt(i, 26, "|")>
			<cfset Address1_27 = ListGetAt(i, 27, "|")>
			<cfset Address2_28 = ListGetAt(i, 28, "|")>
			<cfset City_29 = ListGetAt(i, 29, "|")>
			<cfset State_30 = ListGetAt(i, 30, "|")>
			<cfset Zip_31 = ListGetAt(i, 31, "|")>
			<cfset Phone_32 = ListGetAt(i, 32, "|")>
			<cfset Ext_33 = ListGetAt(i, 33, "|")>
			<cfset Employer_34 = ListGetAt(i, 34, "|")>
			<cfset EmpName_35 = ListGetAt(i, 35, "|")>
			<cfset CNTFIRSTNAMEEMPINFO_36 = ListGetAt(i, 36, "|")>
			<cfset CNTLNAMEEMPINFO_37 = ListGetAt(i, 37, "|")>
			<cfset Address1_38 = ListGetAt(i, 38, "|")>
			<cfset Address2_39 = ListGetAt(i, 39, "|")>
			<cfset City_40 = ListGetAt(i, 40, "|")>
			<cfset State_41 = ListGetAt(i, 41, "|")>
			<cfset Zip_42 = ListGetAt(i, 42, "|")>
			<cfset Phone_43 = ListGetAt(i, 43, "|")>
			<cfset Ext_44 = ListGetAt(i, 44, "|")>
			
			<cfset Payor1_45 = ListGetAt(i, 45, "|")>
			<cfset PayorName1_46 = ListGetAt(i, 46, "|")>
			<cfset Deductable_47 = ListGetAt(i, 47, "|")>
			<cfset PayPercentage_48 = ListGetAt(i, 48, "|")>
			<cfset Address1_49 = ListGetAt(i, 49, "|")>
			<cfset Address2_50 = ListGetAt(i, 50, "|")>
			<cfset City_51 = ListGetAt(i, 51, "|")>
			<cfset State_52 = ListGetAt(i, 52, "|")>
			<cfset Zip_53 = ListGetAt(i, 53, "|")>
			<cfset CNTName_54 = ListGetAt(i, 54, "|")>
			<cfset PolicyNumber_55 = ListGetAt(i, 55, "|")>
			<cfset GROUPNumber_56 = ListGetAt(i, 56, "|")>
			<cfset Phone_57 = ListGetAt(i, 57, "|")>
			<cfset Ext_58 = ListGetAt(i, 58, "|")>
			<cfset Relation_59 = ListGetAt(i, 59, "|")>
			<cfset LName_60 = ListGetAt(i, 60, "|")>
			<cfset FName_61 = ListGetAt(i, 61, "|")>
			<cfset DOB_62 = ListGetAt(i, 62, "|")>
			<cfset Sex_63 = ListGetAt(i, 63, "|")>
			
			<cfset Payor2_64 = ListGetAt(i, 64, "|")>
			<cfset PayName2_65 = ListGetAt(i, 65, "|")>
			<cfset Deductablr_66 = ListGetAt(i, 66, "|")>
			<cfset PayPercentage_67 = ListGetAt(i, 67, "|")>
			<cfset Address1_68 = ListGetAt(i, 68, "|")>
			<cfset Address2_69 = ListGetAt(i, 69, "|")>
			<cfset City_70 = ListGetAt(i, 70, "|")>
			<cfset State_71 = ListGetAt(i, 71, "|")>
			<cfset Zip_72 = ListGetAt(i, 72, "|")>
			<cfset CNTName_73 = ListGetAt(i, 73, "|")>
			<cfset PolicyNumber_74 = ListGetAt(i, 74, "|")>
			<cfset GroupNumber_75 = ListGetAt(i, 75, "|")>
			<cfset Phone_76 = ListGetAt(i, 76, "|")>
			<cfset Ext_77 = ListGetAt(i, 77, "|")>
			<cfset REL_78 = ListGetAt(i, 78, "|")>
			<cfset LName_79 = ListGetAt(i, 79, "|")>
			<cfset FName_80 = ListGetAt(i, 80, "|")>
			<cfset DOB_81 = ListGetAt(i, 81, "|")>
			<cfset Sex_82 = ListGetAt(i, 82, "|")>
			
			<cfset Payor3_83 = ListGetAt(i, 83, "|")>
			<cfset PayName3_84 = ListGetAt(i, 84, "|")>
			<cfset Deductable_85 = ListGetAt(i, 85, "|")>
			<cfset PayPercentage_86 = ListGetAt(i, 86, "|")>
			<cfset Address1_87 = ListGetAt(i, 87, "|")>
			<cfset Address2_88 = ListGetAt(i, 88, "|")>
			<cfset City_89 = ListGetAt(i, 89, "|")>
			<cfset State_90 = ListGetAt(i, 90, "|")>
			<cfset Zip_91 = ListGetAt(i, 91, "|")>
			<cfset CNTName_92 = ListGetAt(i, 92, "|")>
			<cfset PolicyNumber_93 = ListGetAt(i, 93, "|")>
			<cfset GroupNumber_94 = ListGetAt(i, 94, "|")>
			<cfset Phone_95 = ListGetAt(i, 95, "|")>
			<cfset Ext_96 = ListGetAt(i, 96, "|")>
			<cfset REL_97 = ListGetAt(i, 97, "|")>
			<cfset LName_98 = ListGetAt(i, 98, "|")>
			<cfset FName_99 = ListGetAt(i, 99, "|")>
			<cfset DOB_100 = ListGetAt(i, 100, "|")>
			<cfset Sex_101 = ListGetAt(i, 101, "|")>
			
			<cfset ClaimSubmitterIdentifier_102 = ListGetAt(i, 102, "|")>
			<cfset ClaimSubmitterIdentifier_102 = NumberFormat(ClaimSubmitterIdentifier_102, "00000")>
			
			
			<cfif trim(FirstName_1) NEQ "NULL" AND trim(LName_3) NEQ "NULL" AND trim(Address1_4) NEQ "NULL" AND trim(City_6) NEQ "NULL" AND trim(ST_7) NEQ "NULL" AND trim(Zip_8) NEQ "NULL">

			
				<cfif trim(ST_7) NEQ "NULL">	
								
					<cfquery name="getStateID" datasource="PA_Master">
						SELECT StandardListItemID
						FROM StandardListItem
						WHERE ItemDescription = '#trim(ST_7)#' AND Active = 1 AND ListID = 4
					</cfquery>
					
					<cfif IsNumeric(getStateID.StandardListItemID)>
						<cfset AddressStateID = getStateID.StandardListItemID>
					<cfelse>
						<cfset AddressStateID = "NULL">	
					</cfif>	
				<cfelse>
					<cfset AddressStateID = "NULL">	
				</cfif>
					
				<cfif trim(FirstName_1) NEQ "NULL">			
					<cfset thisFName = REQUEST.capitalizeFirstLetter(trim(FirstName_1))>					
					<cfset First = "#trim(thisFName)#">
				<cfelse>
					<cfset First = "NULL">
				</cfif>
				
				<cfif trim(MI_2) NEQ "NULL">
					<cfset Middle = "#trim(MI_2)#">
				<cfelse>
					<cfset Middle = "NULL">
				</cfif>
				
				<cfif trim(LName_3) NEQ "NULL">			
					<cfset thisLName = REQUEST.capitalizeFirstLetter(trim(LName_3))>					
					<cfset Last = "#trim(thisLName)#">
				<cfelse>
					<cfset Last = "NULL">
				</cfif>
								
				<cfif LEN(DOB_16) EQ 8 AND DOB_16 NEQ "NULL">
					<cfset dobYear = MID(DOB_16, 1, 4)> 
					<cfset dobMonth = MID(DOB_16, 5, 2)> 
					<cfset dobDay = MID(DOB_16, 7, 2)>
					<cfset dobDate = CreateODBCDate(CreateDate(dobYear, dobMonth, dobDay))>		
				<cfelse>
					<cfset dobDate = "NULL">
				</cfif>
				
				<cfif trim(Sex_17) EQ "F">
					<cfset Sex = 1>
				<cfelseif trim(Sex_17) EQ "M">
					<cfset Sex = 0>
				<cfelse>
					<cfset Sex = "NULL">	
				</cfif>
						
				<cfif trim(SSN_15) NEQ "NULL" AND trim(SSN_15) NEQ "NULL">
					<cfset SSN = "#trim(SSN_15)#">				
				<cfelse>
					<cfset SSN = "NULL">	
				</cfif>
								
				<cfif trim(MarStat_18) NEQ "NULL">
					<cfif trim(MarStat_18) EQ "S">
						<cfset MaritalStatus = 231>
					<cfelseif trim(MarStat_18) EQ "M">
						<cfset MaritalStatus = 232>							
					<cfelseif trim(MarStat_18) EQ "W" AND Sex EQ 0>
						<cfset MaritalStatus = 234>
					<cfelseif trim(MarStat_18) EQ "W" AND Sex EQ 1>
						<cfset MaritalStatus = 233>	
					<cfelseif trim(MarStat_18) EQ "D">
						<cfset MaritalStatus = 235>		
					<cfelse><!---if trim(MarStat_18) EQ "O"--->
						<cfset MaritalStatus = 236>					
					</cfif>
				<cfelse>	
					<cfset MaritalStatus = "NULL">	
				</cfif>
				
				
				<cfquery name="insertEntity" datasource="#trim(request.datasource)#">
					INSERT INTO Entity 
					(SiteID, ClientID, ObjectTypeID, Fname, Mname, Lname, DOB, Sex, SSN, MaritalStatus, Languages)
					VALUES(#trim(SiteID)#, #trim(ClientID)#, 3, <cfif First EQ "NULL">NULL<cfelse>'#trim(First)#'</cfif>, <cfif Middle EQ "NULL">NULL<cfelse>'#trim(Middle)#'</cfif>, <cfif Last EQ "NULL">NULL<cfelse>'#trim(Last)#'</cfif>, #trim(dobDate)#, #trim(Sex)#, <cfif SSN EQ "NULL">NULL<cfelse>'#trim(SSN)#'</cfif>, #trim(MaritalStatus)#, 1); 
					SELECT LAST_INSERT_ID() AS EntityID 			
				</cfquery>
				
				<cfset EntityID = insertEntity.entityID>
														
				<cfquery name="insertPatient" datasource="#trim(request.datasource)#">
					INSERT INTO Patient 
					(ClaimSubmitterIdentifier, EntityID)
					VALUES('#trim(ClaimSubmitterIdentifier_102)#', #trim(EntityID)#);
					SELECT LAST_INSERT_ID() AS PatientID 			
				</cfquery>
				
				<cfset PatientID = insertPatient.PatientID>				
				
																																	
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the thisEntity Address.                                                 --->
				<!-------------------------------------------------------------------------------------->				
				<cfif trim(Address1_4) NEQ "NULL">
							
					<cfquery name="insertThisEntityAddress" datasource="#trim(request.datasource)#">
						INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)			
						VALUES(12, '#trim(Address1_4)#', <cfif Address2_5 EQ "NULL">NULL<cfelse>'#trim(Address2_5)#'</cfif>, '#trim(City_6)#', #trim(AddressStateID)#, '#trim(Zip_8)#');
						SELECT LAST_INSERT_ID() AS AddressID 		
					</cfquery>	
					<cfset thisEntityAddressID = insertThisEntityAddress.AddressID>						
					<cfquery name="insertThisEntityEntityAddress" datasource="#trim(request.datasource)#">
						INSERT INTO EntityAddress  (AddressID, EntityID, IsDefault)			
						VALUES(#trim(thisEntityAddressID)#, #trim(EntityID)#, 1)						
					</cfquery>
				
				</cfif>
				
								
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the phone for this entity.                                              --->
				<!-------------------------------------------------------------------------------------->				
				<cfif trim(PhoneHome_9) NEQ "NULL">
					
					<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneHome_9)) />
														
					<cfquery name="insertThisEntityPhone" datasource="#trim(request.datasource)#">
						INSERT INTO Phone  (PhoneTypeID, PhoneNumber, PhoneExtension)			
						VALUES(76, '#trim(PhoneNumberE)#', NULL);
						SELECT LAST_INSERT_ID() AS PhoneID 		
					</cfquery>		
					<cfset thisEntityPhoneID = insertThisEntityPhone.PhoneID>						
					<cfquery name="insertThisEntityEntityPhone" datasource="#trim(request.datasource)#">
						INSERT INTO EntityPhone  (PhoneID, EntityID, IsDefault)			
						VALUES(#trim(thisEntityPhoneID)#, #trim(EntityID)#, 1)					
					</cfquery>		
				
				</cfif>
				
				
								
				<!-------------------------------------------------------------------------------------->
				<!--- Insert  Employer id not NULL.                                                  --->
				<!-------------------------------------------------------------------------------------->			
				<cfif trim(EmpName_35) NEQ "NULL" AND trim(EmpName_35) NEQ "">
					
					<cfquery name="insertEmployerEntity" datasource="#trim(request.datasource)#">
						INSERT INTO Entity  (SiteID, ObjectTypeID)
						VALUES(#trim(SiteID)#, 8); 
						SELECT LAST_INSERT_ID() AS EntityID 			
					</cfquery>				
					<cfset EmployerEntityID = insertEmployerEntity.EntityID>				
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Employer Address.                                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Address1_38) NEQ "NULL">
						
						<cfif trim(State_41) NEQ "NULL">	
							<cfquery name="getStateID" datasource="#trim(request.datasource)#">
								SELECT StandardListItemID
								FROM StandardListItem
								WHERE ItemDescription = '#trim(State_41)#' AND Active = 1 AND ListID = 4
							</cfquery>
							
							<cfif IsNumeric(getStateID.StandardListItemID)>
								<cfset EmployerAddressStateID = getStateID.StandardListItemID>
							<cfelse>
								<cfset EmployerAddressStateID = "NULL">	
							</cfif>	
						<cfelse>
							<cfset EmployerAddressStateID = "NULL">	
						</cfif>
						<cfquery name="insertEmployerAddress" datasource="#trim(request.datasource)#">
							INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)			
							VALUES(13, '#trim(Address1_38)#', '#trim(Address2_39)#', '#trim(City_40)#', #trim(EmployerAddressStateID)#, '#trim(Zip_42)#');
							SELECT LAST_INSERT_ID() AS AddressID 			
						</cfquery>				
						<cfset employerAddressID = insertEmployerAddress.AddressID>	
						
						<cfquery name="insertEmployerEntityAddress" datasource="#trim(request.datasource)#">
							INSERT INTO EntityAddress  (AddressID, EntityID, IsDefault)			
							VALUES(#trim(employerAddressID)#, #trim(EmployerEntityID)#, 1)							
						</cfquery>	
						
						<!---<cf_db_Insert_debugTable
							referenceid="123"
							note="/EmpAddress/ /#trim(employerAddressID)#/">		--->		
					
					</cfif>
					
					<!-------------------------------------------------------------------------------------->
					<!--- Add Employer Phone                                                             --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Phone_43) NEQ "NULL">
						
						<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Phone_43)) />
						<cfif trim(Ext_44) NEQ "NULL">
							<cfset PhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Ext_44)) />
						<cfelse>
							<cfset PhoneExtensionE = "">
						</cfif>
						
						<cfquery name="insertEmployerPhone" datasource="#trim(request.datasource)#">
							INSERT INTO Phone  (PhoneTypeID, PhoneNumber, PhoneExtension)			
							VALUES(74, '#trim(PhoneNumberE)#', <cfif trim(Ext_44) EQ "NULL">NULL<cfelse>'#trim(PhoneExtensionE)#'</cfif>);
							SELECT LAST_INSERT_ID() AS PhoneID 			
						</cfquery>				
						<cfset employerPhoneID = insertEmployerPhone.PhoneID>	
						
						<cfquery name="insertEmployerEntityPhone" datasource="#trim(request.datasource)#">
							INSERT INTO EntityPhone  (PhoneID, EntityID, IsDefault)			
							VALUES(#trim(employerPhoneID)#, #trim(EmployerEntityID)#, 1)							
						</cfquery>		
						
						<!---<cf_db_Insert_debugTable
							referenceid="123"
							note="/EmpPhone/ /#trim(employerPhoneID)#/">--->
					
					</cfif>				
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Employer Record                                                     --->
					<!-------------------------------------------------------------------------------------->								
					<cfquery name="insertEmployer" datasource="#trim(request.datasource)#">
						INSERT INTO Employer 	(EmployerName, EntityID)
						VALUES('#trim(EmpName_35)#', #trim(EmployerEntityID)#); 
						SELECT LAST_INSERT_ID() AS EmployerID 			
					</cfquery>				
					<cfset employerID = insertEmployer.EmployerID>
					
					<cfquery name="insertEmployer" datasource="#trim(request.datasource)#">
						UPDATE Entity SET EmployerID = #trim(employerID)#
						WHERE EntityID = #trim(EntityID)#
					</cfquery>
					
					<!---<cf_db_Insert_debugTable
						referenceid="123"
						note="/Employer/ /#trim(employerID)#/">--->
								
				</cfif>
						
						
				
				
				
				<!--- Primary --->
				<cfif trim(PayorName1_46) NEQ "NULL" AND trim(PayorName1_46) NEQ "" AND LEN(trim(PayorName1_46)) GTE 2>
							
					<cfif trim(State_52) NEQ "NULL">	
						<cfquery name="getStateID" datasource="#trim(request.datasource)#">
							SELECT StandardListItemID
							FROM StandardListItem
							WHERE ItemDescription = '#trim(State_52)#' AND Active = 1 AND ListID = 4
						</cfquery>
						
						<cfif IsNumeric(getStateID.StandardListItemID)>
							<cfset primAddressStateID = getStateID.StandardListItemID>
						<cfelse>
							<cfset primAddressStateID = "NULL">	
						</cfif>	
					<cfelse>
						<cfset primAddressStateID = "NULL">	
					</cfif>
									
					<cfif LEN(DOB_62) EQ 8 AND DOB_62 NEQ "NULL">
						<cfset payor1dobYear = MID(DOB_62, 1, 4)> 
						<cfset payor1dobMonth = MID(DOB_62, 5, 2)> 
						<cfset payor1dobDay = MID(DOB_62, 7, 2)>
						<cfset payor1dobDate = CreateODBCDate(CreateDate(payor1dobYear, payor1dobMonth, payor1dobDay))>		
					<cfelse>
						<cfset payor1dobDate = "NULL">
					</cfif>
					
					<cfif trim(Sex_63) EQ "F">
						<cfset payor1Sex = 1>
					<cfelseif trim(Sex_63) EQ "M">
						<cfset payor1Sex = 0>
					<cfelse>
						<cfset payor1Sex = "NULL">	
					</cfif>
					
					<cfif trim(Relation_59) NEQ "" AND trim(Relation_59) NEQ "NULL">
						<cfswitch expression="#trim(Relation_59)#">
							<cfcase value="SE">
								<cfset primRelation = 203>
							</cfcase>
							<cfcase value="SP">
								<cfset primRelation = 204>
							</cfcase>
							<cfcase value="CH">
								<cfset primRelation = 205>
							</cfcase>
							<cfdefaultcase>
								<cfset primRelation = 206>
							</cfdefaultcase>
						</cfswitch>			
					<cfelse>
						<cfset primRelation = "NULL">
					</cfif> 
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the InsuranceCompany Entity                                             --->
					<!-------------------------------------------------------------------------------------->				
					<cfquery name="insertInsuranceCompanyEntity" datasource="#trim(request.datasource)#">
						INSERT INTO Entity  (SiteID, ObjectTypeID)
						VALUES(#trim(SiteID)#, 4); 
						SELECT LAST_INSERT_ID() AS EntityID 			
					</cfquery>				
					<cfset InsuranceCompanyEntityID = insertInsuranceCompanyEntity.EntityID>	
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the InsuranceCompany Address.                                           --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Address1_49) NEQ "NULL">
											
						<cfquery name="insertInsuranceCompanyAddress" datasource="#trim(request.datasource)#">
							INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)			
							VALUES(13, '#trim(Address1_49)#', '#trim(Address2_50)#', '#trim(City_51)#', #trim(primAddressStateID)#, '#trim(Zip_53)#');
							SELECT LAST_INSERT_ID() AS AddressID 			
						</cfquery>				
						<cfset InsuranceCompanyAddressID = insertInsuranceCompanyAddress.AddressID>	
						
						<cfquery name="insertInsuranceCompanyEntityAddress" datasource="#trim(request.datasource)#">
							INSERT INTO EntityAddress  (AddressID, EntityID, IsDefault)			
							VALUES(#trim(InsuranceCompanyAddressID)#, #trim(InsuranceCompanyEntityID)#, 1)							
						</cfquery>	
					
					</cfif>
									
					<!-------------------------------------------------------------------------------------->
					<!--- Add Employer Phone                                                             --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Phone_57) NEQ "NULL">
						
						<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Phone_57)) />
						<cfif trim(Ext_58) NEQ "NULL">
							<cfset PhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Ext_58)) />
						<cfelse>
							<cfset PhoneExtensionE = "">
						</cfif>
						
						<cfquery name="insertInsuranceCompanyPhone" datasource="#trim(request.datasource)#">
							INSERT INTO Phone  (PhoneTypeID, PhoneNumber, PhoneExtension)			
							VALUES(74, '#trim(PhoneNumberE)#', <cfif trim(Ext_58) EQ "NULL">NULL<cfelse>'#trim(PhoneExtensionE)#'</cfif>);
							SELECT LAST_INSERT_ID() AS PhoneID 			
						</cfquery>				
						<cfset InsuranceCompanyPhoneID = insertInsuranceCompanyPhone.PhoneID>	
						
						<cfquery name="insertInsuranceCompanyEntityPhone" datasource="#trim(request.datasource)#">
							INSERT INTO EntityPhone  (PhoneID, EntityID, IsDefault)			
							VALUES(#trim(InsuranceCompanyPhoneID)#, #trim(InsuranceCompanyEntityID)#, 1)							
						</cfquery>					
					
					</cfif>	
									
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Insurance Company Record                                            --->
					<!-------------------------------------------------------------------------------------->								
					<cfquery name="insertprimInsuranceCompany" datasource="#trim(request.datasource)#">
						INSERT INTO InsuranceCompany 	(ClientID,InsuranceCompanyName,EntityID)
						VALUES(#trim(ClientID)#, '#trim(PayorName1_46)#', #trim(InsuranceCompanyEntityID)#); 
						SELECT LAST_INSERT_ID() AS InsuranceCompanyID 			
					</cfquery>				
					<cfset primInsuranceCompanyID = insertprimInsuranceCompany.InsuranceCompanyID>				
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Patient Insurance Company Record                                    --->
					<!-------------------------------------------------------------------------------------->								
					<!---<cffile 
						action="write" 
						file="C:\temp\sql\temp468_#count#.txt" 
						output="INSERT INTO PatientInsuranceCompany  (PatientID, InsuranceCompanyID, PrimSecTer, PolicyNumber, PolicyHoldersFirstName, PolicyHoldersLastName, PolicyHoldersDOB, PolicyHoldersSex, GroupNumber, Relationship, Deductible, PayPercentage) VALUES(#trim(PatientID)#, #trim(primInsuranceCompanyID)#, 1, #trim(PolicyNumber_55)#','#REQUEST.capitalizeFirstLetter(trim(FName_61))#', '#REQUEST.capitalizeFirstLetter(trim(LName_60))#', #trim(payor1dobDate)#, #trim(payor1Sex)#, '#trim(GROUPNumber_56)#', #trim(primRelation)#, #trim(Deductable_47)#, #trim(PayPercentage_48)#)"> 
							--->			
					
					<cfquery name="insertprimInsuranceCompany" datasource="#trim(request.datasource)#">
						INSERT INTO PatientInsuranceCompany  (PatientID, InsuranceCompanyID, PrimSecTer, PolicyNumber, PolicyHoldersFirstName, PolicyHoldersLastName, PolicyHoldersDOB, PolicyHoldersSex, GroupNumber, Relationship, Deductible, PayPercentage)
						VALUES(#trim(PatientID)#, #trim(primInsuranceCompanyID)#, 1, <cfif trim(PolicyNumber_55) NEQ "NULL">'#trim(PolicyNumber_55)#'<cfelse>NULL</cfif>, <cfif trim(FName_61) NEQ "NULL">'#REQUEST.capitalizeFirstLetter(trim(FName_61))#'<cfelse>NULL</cfif>, <cfif trim(LName_60) NEQ "NULL">'#REQUEST.capitalizeFirstLetter(trim(LName_60))#'<cfelse>NULL</cfif>, #trim(payor1dobDate)#, #trim(payor1Sex)#, <cfif trim(GROUPNumber_56) NEQ "NULL">'#trim(GROUPNumber_56)#'<cfelse>NULL</cfif>, #trim(primRelation)#, <cfif trim(Deductable_47) NEQ "NULL">#trim(Deductable_47)#<cfelse>NULL</cfif>, <cfif trim(PayPercentage_48) NEQ "NULL" AND IsNumeric(trim(PayPercentage_48))>#trim(PayPercentage_48)#<cfelse>NULL</cfif>); 
						SELECT LAST_INSERT_ID() AS InsuranceCompanyID 			
					</cfquery>
					
				<!---	<cf_db_Insert_debugTable
						referenceid="123"
						note="/primPatientInsuranceCompany/ /#trim(PatientID)#,#trim(primInsuranceCompanyID)#/">--->
																		
						
				</cfif>	
				
				
				
				<!--- Secondary --->
				<cfif trim(PayName2_65) NEQ "NULL" AND trim(PayName2_65) NEQ "" AND LEN(trim(PayName2_65)) GTE 2>
									
					<cfif trim(State_71) NEQ "NULL">	
						<cfquery name="getStateID" datasource="#trim(request.datasource)#">
							SELECT StandardListItemID
							FROM StandardListItem
							WHERE ItemDescription = '#trim(State_71)#' AND Active = 1 AND ListID = 4
						</cfquery>
						<cfif IsNumeric(getStateID.StandardListItemID)>
							<cfset secAddressStateID = getStateID.StandardListItemID>
						<cfelse>
							<cfset secAddressStateID = "NULL">	
						</cfif>	
					<cfelse>
						<cfset secAddressStateID = "NULL">	
					</cfif>
									
					<cfif LEN(DOB_81) EQ 8 AND DOB_81 NEQ "NULL">
						<cfset payor2dobYear = MID(DOB_81, 1, 4)> 
						<cfset payor2dobMonth = MID(DOB_81, 5, 2)> 
						<cfset payor2dobDay = MID(DOB_81, 7, 2)>
						<cfset payor2dobDate = CreateODBCDate(CreateDate(payor2dobYear, payor2dobMonth, payor2dobDay))>		
					<cfelse>
						<cfset payor2dobDate = "NULL">
					</cfif>
					
					<cfif trim(Sex_82) EQ "F">
						<cfset payor2Sex = 1>
					<cfelseif trim(Sex_82) EQ "M">
						<cfset payor2Sex = 0>
					<cfelse>
						<cfset payor2Sex = "NULL">	
					</cfif>
					
					<cfif trim(REL_78) NEQ "" AND trim(REL_78) NEQ "NULL">
						<cfswitch expression="#trim(REL_78)#">
							<cfcase value="SE">
								<cfset secRelation = 203>
							</cfcase>
							<cfcase value="SP">
								<cfset secRelation = 204>
							</cfcase>
							<cfcase value="CH">
								<cfset secRelation = 205>
							</cfcase>
							<cfdefaultcase>
								<cfset secRelation = 206>
							</cfdefaultcase>
						</cfswitch>			
					<cfelse>
						<cfset secRelation = "NULL">
					</cfif> 
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the InsuranceCompany Entity                                             --->
					<!-------------------------------------------------------------------------------------->				
					<cfquery name="insertInsuranceCompanyEntity" datasource="#trim(request.datasource)#">
						INSERT INTO Entity  (SiteID, ObjectTypeID)
						VALUES(#trim(SiteID)#, 4); 
						SELECT LAST_INSERT_ID() AS EntityID 			
					</cfquery>				
					<cfset InsuranceCompanyEntityID = insertInsuranceCompanyEntity.EntityID>	
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the InsuranceCompany Address.                                           --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Address1_68) NEQ "NULL">
								
						
						<!---<cffile 
						action="write" 
						file="C:\temp\sql\temp_#count#.txt" 
						output="INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode) VALUES(13, '#trim(Address1_68)#', '#trim(Address2_69)#', '#trim(City_70)#', #trim(secAddressStateID)#, #trim(Zip_72)#)">			
							--->	
											
						<cfquery name="insertInsuranceCompanyAddress" datasource="#trim(request.datasource)#">
							INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)			
							VALUES(13, '#trim(Address1_68)#', '#trim(Address2_69)#', '#trim(City_70)#', #trim(secAddressStateID)#, '#trim(Zip_72)#');
							SELECT LAST_INSERT_ID() AS AddressID 			
						</cfquery>				
						<cfset InsuranceCompanyAddressID = insertInsuranceCompanyAddress.AddressID>	
						
						<cfquery name="insertInsuranceCompanyEntityAddress" datasource="#trim(request.datasource)#">
							INSERT INTO EntityAddress  (AddressID, EntityID, IsDefault)			
							VALUES(#trim(InsuranceCompanyAddressID)#, #trim(InsuranceCompanyEntityID)#, 1)							
						</cfquery>	
					
					</cfif>
									
					<!-------------------------------------------------------------------------------------->
					<!--- Add Employer Phone                                                             --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Phone_76) NEQ "NULL">
						
						<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Phone_76)) />
						<cfif trim(Ext_77) NEQ "NULL">
							<cfset PhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Ext_77)) />
						<cfelse>
							<cfset PhoneExtensionE = "">
						</cfif>
						
						<cfquery name="insertInsuranceCompanyPhone" datasource="#trim(request.datasource)#">
							INSERT INTO Phone  (PhoneTypeID, PhoneNumber, PhoneExtension)			
							VALUES(74, '#trim(PhoneNumberE)#', <cfif trim(Ext_77) EQ "NULL">NULL<cfelse>'#trim(PhoneExtensionE)#'</cfif>);
							SELECT LAST_INSERT_ID() AS PhoneID 			
						</cfquery>				
						<cfset InsuranceCompanyPhoneID = insertInsuranceCompanyPhone.PhoneID>	
						
						<cfquery name="insertInsuranceCompanyEntityPhone" datasource="#trim(request.datasource)#">
							INSERT INTO EntityPhone  (PhoneID, EntityID, IsDefault)			
							VALUES(#trim(InsuranceCompanyPhoneID)#, #trim(InsuranceCompanyEntityID)#, 1)							
						</cfquery>					
					
					</cfif>	
									
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Insurance Company Record                                            --->
					<!-------------------------------------------------------------------------------------->								
					<cfquery name="insertsecInsuranceCompany" datasource="#trim(request.datasource)#">
						INSERT INTO InsuranceCompany 	(ClientID,InsuranceCompanyName,EntityID)
						VALUES(#trim(ClientID)#, '#trim(PayName2_65)#', #trim(InsuranceCompanyEntityID)#); 
						SELECT LAST_INSERT_ID() AS InsuranceCompanyID 			
					</cfquery>				
					<cfset secInsuranceCompanyID = insertsecInsuranceCompany.InsuranceCompanyID>				
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Patient Insurance Company Record                                    --->
					<!-------------------------------------------------------------------------------------->								
					<cfquery name="insertsecInsuranceCompany" datasource="#trim(request.datasource)#">
						INSERT INTO PatientInsuranceCompany  (PatientID, InsuranceCompanyID, PrimSecTer, PolicyNumber, PolicyHoldersFirstName, PolicyHoldersLastName, PolicyHoldersDOB, PolicyHoldersSex, GroupNumber, Relationship, Deductible, PayPercentage)
						VALUES(#trim(PatientID)#, #trim(secInsuranceCompanyID)#, 2, <cfif trim(PolicyNumber_74) NEQ "NULL">'#trim(PolicyNumber_74)#'<cfelse>NULL</cfif>, <cfif trim(FName_80) NEQ "NULL">'#REQUEST.capitalizeFirstLetter(trim(FName_80))#'<cfelse>NULL</cfif>, <cfif trim(LName_79) NEQ "NULL">'#REQUEST.capitalizeFirstLetter(trim(LName_79))#'<cfelse>NULL</cfif>, #trim(payor2dobDate)#, #trim(payor2Sex)#, <cfif trim(GroupNumber_75) NEQ "NULL">'#trim(GroupNumber_75)#'<cfelse>NULL</cfif>, #trim(secRelation)#, <cfif trim(Deductablr_66) NEQ "NULL">#trim(Deductablr_66)#<cfelse>NULL</cfif>, <cfif trim(PayPercentage_67) NEQ "NULL" AND IsNumeric(trim(PayPercentage_67))>#trim(PayPercentage_67)#<cfelse>NULL</cfif>); 
						SELECT LAST_INSERT_ID() AS InsuranceCompanyID 			
					</cfquery>
					
					<!---<cf_db_Insert_debugTable
						referenceid="123"
						note="/secPatientInsuranceCompany/ /#trim(PatientID)#,#trim(secInsuranceCompanyID)#/">--->
											
				</cfif>
			
			
				
				
				<!--- Tertiary --->
				<cfif trim(PayName3_84) NEQ "NULL" AND trim(PayName3_84) NEQ "" AND LEN(trim(PayName3_84)) GTE 2>
										
					<cfif trim(State_90) NEQ "NULL">	
						<cfquery name="getStateID" datasource="#trim(request.datasource)#">
							SELECT StandardListItemID
							FROM StandardListItem
							WHERE ItemDescription = '#trim(State_90)#' AND Active = 1 AND ListID = 4
						</cfquery>
						<cfif IsNumeric(getStateID.StandardListItemID)>
							<cfset terAddressStateID = getStateID.StandardListItemID>
						<cfelse>
							<cfset terAddressStateID = "NULL">	
						</cfif>	
					<cfelse>
						<cfset terAddressStateID = "NULL">	
					</cfif>
									
					<cfif LEN(DOB_100) EQ 8 AND DOB_100 NEQ "NULL">
						<cfset payor3dobYear = MID(DOB_100, 1, 4)> 
						<cfset payor3dobMonth = MID(DOB_100, 5, 2)> 
						<cfset payor3dobDay = MID(DOB_100, 7, 2)>
						<cfset payor3dobDate = CreateODBCDate(CreateDate(payor3dobYear, payor3dobMonth, payor3dobDay))>		
					<cfelse>
						<cfset payor3dobDate = "NULL">
					</cfif>
					
					<cfif trim(Sex_101) EQ "F">
						<cfset payor3Sex = 1>
					<cfelseif trim(Sex_101) EQ "M">
						<cfset payor3Sex = 0>
					<cfelse>
						<cfset payor3Sex = "NULL">	
					</cfif>
					
					<cfif trim(REL_97) NEQ "" AND trim(REL_97) NEQ "NULL">
						<cfswitch expression="#trim(REL_97)#">
							<cfcase value="SE">
								<cfset terRelation = 203>
							</cfcase>
							<cfcase value="SP">
								<cfset terRelation = 204>
							</cfcase>
							<cfcase value="CH">
								<cfset terRelation = 205>
							</cfcase>
							<cfdefaultcase>
								<cfset terRelation = 206>
							</cfdefaultcase>
						</cfswitch>			
					<cfelse>
						<cfset terRelation = "NULL">
					</cfif> 
					
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the InsuranceCompany Entity                                             --->
					<!-------------------------------------------------------------------------------------->				
					<cfquery name="insertInsuranceCompanyEntity" datasource="#trim(request.datasource)#">
						INSERT INTO Entity  (SiteID, ObjectTypeID)
						VALUES(#trim(SiteID)#, 4); 
						SELECT LAST_INSERT_ID() AS EntityID 			
					</cfquery>				
					<cfset InsuranceCompanyEntityID = insertInsuranceCompanyEntity.EntityID>	
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the InsuranceCompany Address.                                           --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Address1_87) NEQ "NULL">
											
						<cfquery name="insertInsuranceCompanyAddress" datasource="#trim(request.datasource)#">
							INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)			
							VALUES(13, '#trim(Address1_87)#', '#trim(Address2_88)#', '#trim(City_89)#', #trim(terAddressStateID)#, '#trim(Zip_91)#');
							SELECT LAST_INSERT_ID() AS AddressID 			
						</cfquery>				
						<cfset InsuranceCompanyAddressID = insertInsuranceCompanyAddress.AddressID>	
						
						<cfquery name="insertInsuranceCompanyEntityAddress" datasource="#trim(request.datasource)#">
							INSERT INTO EntityAddress  (AddressID, EntityID, IsDefault)			
							VALUES(#trim(InsuranceCompanyAddressID)#, #trim(InsuranceCompanyEntityID)#, 1)							
						</cfquery>	
					
					</cfif>
									
					<!-------------------------------------------------------------------------------------->
					<!--- Add Employer Phone                                                             --->
					<!-------------------------------------------------------------------------------------->				
					<cfif trim(Phone_95) NEQ "NULL">
						
						<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Phone_95)) />
						<cfif trim(Ext_96) NEQ "NULL">
							<cfset PhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Ext_96)) />
						<cfelse>
							<cfset PhoneExtensionE = "">
						</cfif>
						
						<cfquery name="insertInsuranceCompanyPhone" datasource="#trim(request.datasource)#">
							INSERT INTO Phone  (PhoneTypeID, PhoneNumber, PhoneExtension)			
							VALUES(74, '#trim(PhoneNumberE)#', <cfif trim(Ext_96) EQ "NULL">NULL<cfelse>'#trim(PhoneExtensionE)#'</cfif>);
							SELECT LAST_INSERT_ID() AS PhoneID 			
						</cfquery>				
						<cfset InsuranceCompanyPhoneID = insertInsuranceCompanyPhone.PhoneID>	
						
						<cfquery name="insertInsuranceCompanyEntityPhone" datasource="#trim(request.datasource)#">
							INSERT INTO EntityPhone  (PhoneID, EntityID, IsDefault)			
							VALUES(#trim(InsuranceCompanyPhoneID)#, #trim(InsuranceCompanyEntityID)#, 1)							
						</cfquery>					
					
					</cfif>	
									
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Insurance Company Record                                            --->
					<!-------------------------------------------------------------------------------------->								
					<cfquery name="insertterInsuranceCompany" datasource="#trim(request.datasource)#">
						INSERT INTO InsuranceCompany 	(ClientID,InsuranceCompanyName,EntityID)
						VALUES(#trim(ClientID)#, '#trim(PayName3_84)#', #trim(InsuranceCompanyEntityID)#); 
						SELECT LAST_INSERT_ID() AS InsuranceCompanyID 			
					</cfquery>				
					<cfset terInsuranceCompanyID = insertterInsuranceCompany.InsuranceCompanyID>				
					
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the Patient Insurance Company Record                                    --->
					<!-------------------------------------------------------------------------------------->								
					<cfquery name="insertterInsuranceCompany" datasource="#trim(request.datasource)#">
						INSERT INTO PatientInsuranceCompany  (PatientID, InsuranceCompanyID, PrimSecTer, PolicyNumber, PolicyHoldersFirstName, PolicyHoldersLastName, PolicyHoldersDOB, PolicyHoldersSex, GroupNumber, Relationship, Deductible, PayPercentage)
						VALUES(#trim(PatientID)#, #trim(terInsuranceCompanyID)#, 3, <cfif trim(PolicyNumber_93) NEQ "NULL">'#trim(PolicyNumber_93)#'<cfelse>NULL</cfif>, <cfif trim(FName_99) NEQ "NULL">'#REQUEST.capitalizeFirstLetter(trim(FName_99))#'<cfelse>NULL</cfif>, <cfif trim(LName_98) NEQ "NULL">'#REQUEST.capitalizeFirstLetter(trim(LName_98))#'<cfelse>NULL</cfif>, #trim(payor3dobDate)#, #trim(payor3Sex)#, <cfif trim(GroupNumber_94) NEQ "NULL">'#trim(GroupNumber_94)#'<cfelse>NULL</cfif>, #trim(terRelation)#, <cfif trim(Deductable_85) NEQ "NULL">#trim(Deductable_85)#<cfelse>NULL</cfif>, <cfif trim(PayPercentage_86) NEQ "NULL" AND IsNumeric(trim(PayPercentage_86))>#trim(PayPercentage_86)#<cfelse>NULL</cfif>); 
						SELECT LAST_INSERT_ID() AS InsuranceCompanyID 			
					</cfquery>
					
					<!---<cf_db_Insert_debugTable
						referenceid="123"
						note="/terPatientInsuranceCompany/ /#trim(PatientID)#,#trim(terInsuranceCompanyID)#/">	--->				
					
									
				</cfif>
				
					
				<cfquery name="updateDebug" datasource="#trim(request.datasource)#">
					UPDATE Debug
					SET Note = 'updated_|#trim(count)#|#ClaimSubmitterIdentifier_102#|'
					Where referenceID = #trim(count)#
				</cfquery>					
			
			
			</cfif>
													
			<cfset tempClear = StructClear(Request)>				
	
			
			<cfcatch type="Any">				
				
				<cf_gcGatewayLogger showStack="no" code="#Count#">				
			
			</cfcatch>
		
		
		</cftry>
     
   </cffunction>
   
</cfcomponent>

	