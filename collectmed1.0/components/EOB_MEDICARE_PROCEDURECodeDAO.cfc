 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_PROCEDURECodeBean" />
		
		<cfset var qCreateEOB_MEDICARE_PROCEDURECode = "" />		
		
		<cfset var localHCPC = arguments.bean.getHCPC() />
		<cfset var localSeqNum = arguments.bean.getSeqNum() />
		<cfset var localRIC = arguments.bean.getRIC() />
		<cfset var localLongDescription = arguments.bean.getLongDescription() />
		<cfset var localShortDescription = arguments.bean.getShortDescription() />
		<cfset var localPI1 = arguments.bean.getPI1() />
		<cfset var localPI2 = arguments.bean.getPI2() />
		<cfset var localPI3 = arguments.bean.getPI3() />
		<cfset var localPI4 = arguments.bean.getPI4() />
		<cfset var localMPI = arguments.bean.getMPI() />
		<cfset var localCIM1 = arguments.bean.getCIM1() />
		<cfset var localCIM2 = arguments.bean.getCIM2() />
		<cfset var localCIM3 = arguments.bean.getCIM3() />
		<cfset var localMCM1 = arguments.bean.getMCM1() />
		<cfset var localMCM2 = arguments.bean.getMCM2() />
		<cfset var localMCM3 = arguments.bean.getMCM3() />
		<cfset var localStatute = arguments.bean.getStatute() />
		<cfset var localLabCert1 = arguments.bean.getLabCert1() />
		<cfset var localLabCert2 = arguments.bean.getLabCert2() />
		<cfset var localLabCert3 = arguments.bean.getLabCert3() />
		<cfset var localLabCert4 = arguments.bean.getLabCert4() />
		<cfset var localLabCert5 = arguments.bean.getLabCert5() />
		<cfset var localLabCert6 = arguments.bean.getLabCert6() />
		<cfset var localLabCert7 = arguments.bean.getLabCert7() />
		<cfset var localLabCert8 = arguments.bean.getLabCert8() />
		<cfset var localXRef1 = arguments.bean.getXRef1() />
		<cfset var localXRef2 = arguments.bean.getXRef2() />
		<cfset var localXRef3 = arguments.bean.getXRef3() />
		<cfset var localXRef4 = arguments.bean.getXRef4() />
		<cfset var localXRef5 = arguments.bean.getXRef5() />
		<cfset var localCoverage = arguments.bean.getCoverage() />
		<cfset var localASCPayGrp = arguments.bean.getASCPayGrp() />
		<cfset var localASCPayGrpEffDate = arguments.bean.getASCPayGrpEffDate() />
		<cfset var localMOGPayGrp = arguments.bean.getMOGPayGrp() />
		<cfset var localMOGPayInd = arguments.bean.getMOGPayInd() />
		<cfset var localMOGEffDate = arguments.bean.getMOGEffDate() />
		<cfset var localProcNote = arguments.bean.getProcNote() />
		<cfset var localBETOS = arguments.bean.getBETOS() />
		<cfset var localFILLER = arguments.bean.getFILLER() />
		<cfset var localTOS1 = arguments.bean.getTOS1() />
		<cfset var localTOS2 = arguments.bean.getTOS2() />
		<cfset var localTOS3 = arguments.bean.getTOS3() />
		<cfset var localTOS4 = arguments.bean.getTOS4() />
		<cfset var localTOS5 = arguments.bean.getTOS5() />
		<cfset var localAnestBaseUnits = arguments.bean.getAnestBaseUnits() />
		<cfset var localCodeAddDate = arguments.bean.getCodeAddDate() />
		<cfset var localActionEffDate = arguments.bean.getActionEffDate() />
		<cfset var localTermDate = arguments.bean.getTermDate() />
		<cfset var localActionCode = arguments.bean.getActionCode() />
		<cfset var localFiller1 = arguments.bean.getFiller1() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_MEDICARE_PROCEDURECode" datasource="#trim(arguments.ds)#">
				INSERT INTO EOB_MEDICARE_PROCEDURECode (HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localHCPC)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localSeqNum) NEQ "" AND trim(localSeqNum) NEQ "@@" AND trim(localSeqNum) NEQ "NULL">						
						<cfqueryparam value="#trim(localSeqNum)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localRIC) NEQ "" AND trim(localRIC) NEQ "@@" AND trim(localRIC) NEQ "NULL">						
						<cfqueryparam value="#trim(localRIC)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLongDescription) NEQ "" AND trim(localLongDescription) NEQ "@@" AND trim(localLongDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localLongDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localShortDescription) NEQ "" AND trim(localShortDescription) NEQ "@@" AND trim(localShortDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localShortDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPI1) NEQ "" AND trim(localPI1) NEQ "@@" AND trim(localPI1) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPI2) NEQ "" AND trim(localPI2) NEQ "@@" AND trim(localPI2) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPI3) NEQ "" AND trim(localPI3) NEQ "@@" AND trim(localPI3) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPI4) NEQ "" AND trim(localPI4) NEQ "@@" AND trim(localPI4) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI4)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMPI) NEQ "" AND trim(localMPI) NEQ "@@" AND trim(localMPI) NEQ "NULL">						
						<cfqueryparam value="#trim(localMPI)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCIM1) NEQ "" AND trim(localCIM1) NEQ "@@" AND trim(localCIM1) NEQ "NULL">						
						<cfqueryparam value="#trim(localCIM1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCIM2) NEQ "" AND trim(localCIM2) NEQ "@@" AND trim(localCIM2) NEQ "NULL">						
						<cfqueryparam value="#trim(localCIM2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCIM3) NEQ "" AND trim(localCIM3) NEQ "@@" AND trim(localCIM3) NEQ "NULL">						
						<cfqueryparam value="#trim(localCIM3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMCM1) NEQ "" AND trim(localMCM1) NEQ "@@" AND trim(localMCM1) NEQ "NULL">						
						<cfqueryparam value="#trim(localMCM1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMCM2) NEQ "" AND trim(localMCM2) NEQ "@@" AND trim(localMCM2) NEQ "NULL">						
						<cfqueryparam value="#trim(localMCM2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMCM3) NEQ "" AND trim(localMCM3) NEQ "@@" AND trim(localMCM3) NEQ "NULL">						
						<cfqueryparam value="#trim(localMCM3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localStatute) NEQ "" AND trim(localStatute) NEQ "@@" AND trim(localStatute) NEQ "NULL">						
						<cfqueryparam value="#trim(localStatute)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert1) NEQ "" AND trim(localLabCert1) NEQ "@@" AND trim(localLabCert1) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert2) NEQ "" AND trim(localLabCert2) NEQ "@@" AND trim(localLabCert2) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert3) NEQ "" AND trim(localLabCert3) NEQ "@@" AND trim(localLabCert3) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert4) NEQ "" AND trim(localLabCert4) NEQ "@@" AND trim(localLabCert4) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert4)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert5) NEQ "" AND trim(localLabCert5) NEQ "@@" AND trim(localLabCert5) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert5)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert6) NEQ "" AND trim(localLabCert6) NEQ "@@" AND trim(localLabCert6) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert6)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert7) NEQ "" AND trim(localLabCert7) NEQ "@@" AND trim(localLabCert7) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert7)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabCert8) NEQ "" AND trim(localLabCert8) NEQ "@@" AND trim(localLabCert8) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert8)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localXRef1) NEQ "" AND trim(localXRef1) NEQ "@@" AND trim(localXRef1) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localXRef2) NEQ "" AND trim(localXRef2) NEQ "@@" AND trim(localXRef2) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localXRef3) NEQ "" AND trim(localXRef3) NEQ "@@" AND trim(localXRef3) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localXRef4) NEQ "" AND trim(localXRef4) NEQ "@@" AND trim(localXRef4) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef4)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localXRef5) NEQ "" AND trim(localXRef5) NEQ "@@" AND trim(localXRef5) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef5)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCoverage) NEQ "" AND trim(localCoverage) NEQ "@@" AND trim(localCoverage) NEQ "NULL">						
						<cfqueryparam value="#trim(localCoverage)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localASCPayGrp) NEQ "" AND trim(localASCPayGrp) NEQ "@@" AND trim(localASCPayGrp) NEQ "NULL">						
						<cfqueryparam value="#trim(localASCPayGrp)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localASCPayGrpEffDate))>						
						<cfqueryparam value="#trim(localASCPayGrpEffDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localMOGPayGrp) NEQ "" AND trim(localMOGPayGrp) NEQ "@@" AND trim(localMOGPayGrp) NEQ "NULL">						
						<cfqueryparam value="#trim(localMOGPayGrp)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMOGPayInd) NEQ "" AND trim(localMOGPayInd) NEQ "@@" AND trim(localMOGPayInd) NEQ "NULL">						
						<cfqueryparam value="#trim(localMOGPayInd)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localMOGEffDate))>						
						<cfqueryparam value="#trim(localMOGEffDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localProcNote) NEQ "" AND trim(localProcNote) NEQ "@@" AND trim(localProcNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localProcNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localBETOS) NEQ "" AND trim(localBETOS) NEQ "@@" AND trim(localBETOS) NEQ "NULL">						
						<cfqueryparam value="#trim(localBETOS)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFILLER) NEQ "" AND trim(localFILLER) NEQ "@@" AND trim(localFILLER) NEQ "NULL">						
						<cfqueryparam value="#trim(localFILLER)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTOS1) NEQ "" AND trim(localTOS1) NEQ "@@" AND trim(localTOS1) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTOS2) NEQ "" AND trim(localTOS2) NEQ "@@" AND trim(localTOS2) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTOS3) NEQ "" AND trim(localTOS3) NEQ "@@" AND trim(localTOS3) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTOS4) NEQ "" AND trim(localTOS4) NEQ "@@" AND trim(localTOS4) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS4)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localTOS5) NEQ "" AND trim(localTOS5) NEQ "@@" AND trim(localTOS5) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS5)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAnestBaseUnits) NEQ "" AND trim(localAnestBaseUnits) NEQ "@@" AND trim(localAnestBaseUnits) NEQ "NULL">						
						<cfqueryparam value="#trim(localAnestBaseUnits)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localCodeAddDate))>						
						<cfqueryparam value="#trim(localCodeAddDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localActionEffDate))>						
						<cfqueryparam value="#trim(localActionEffDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localTermDate))>						
						<cfqueryparam value="#trim(localTermDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif trim(localActionCode) NEQ "" AND trim(localActionCode) NEQ "@@" AND trim(localActionCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localActionCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFiller1) NEQ "" AND trim(localFiller1) NEQ "@@" AND trim(localFiller1) NEQ "NULL">						
						<cfqueryparam value="#trim(localFiller1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS RecordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setRecordID(qCreateEOB_MEDICARE_PROCEDURECode.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_MEDICARE_PROCEDURECodeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_PROCEDURECode = "" />		
		
		<cfset qGetEOB_MEDICARE_PROCEDURECode = getEOB_MEDICARE_PROCEDURECode(trim(arguments.ds), trim(EOB_MEDICARE_PROCEDURECodeID)) />
				
		<cfif qGetEOB_MEDICARE_PROCEDURECode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEOB_MEDICARE_PROCEDURECode = createObject("component", "EOB_MEDICARE_PROCEDURECodeBean").init(arguments.ds);
			objEOB_MEDICARE_PROCEDURECode.setRecordID(qGetEOB_MEDICARE_PROCEDURECode.RecordID);
			objEOB_MEDICARE_PROCEDURECode.setHCPC(qGetEOB_MEDICARE_PROCEDURECode.HCPC);
			objEOB_MEDICARE_PROCEDURECode.setSeqNum(qGetEOB_MEDICARE_PROCEDURECode.SeqNum);
			objEOB_MEDICARE_PROCEDURECode.setRIC(qGetEOB_MEDICARE_PROCEDURECode.RIC);
			objEOB_MEDICARE_PROCEDURECode.setLongDescription(qGetEOB_MEDICARE_PROCEDURECode.LongDescription);
			objEOB_MEDICARE_PROCEDURECode.setShortDescription(qGetEOB_MEDICARE_PROCEDURECode.ShortDescription);
			objEOB_MEDICARE_PROCEDURECode.setPI1(qGetEOB_MEDICARE_PROCEDURECode.PI1);
			objEOB_MEDICARE_PROCEDURECode.setPI2(qGetEOB_MEDICARE_PROCEDURECode.PI2);
			objEOB_MEDICARE_PROCEDURECode.setPI3(qGetEOB_MEDICARE_PROCEDURECode.PI3);
			objEOB_MEDICARE_PROCEDURECode.setPI4(qGetEOB_MEDICARE_PROCEDURECode.PI4);
			objEOB_MEDICARE_PROCEDURECode.setMPI(qGetEOB_MEDICARE_PROCEDURECode.MPI);
			objEOB_MEDICARE_PROCEDURECode.setCIM1(qGetEOB_MEDICARE_PROCEDURECode.CIM1);
			objEOB_MEDICARE_PROCEDURECode.setCIM2(qGetEOB_MEDICARE_PROCEDURECode.CIM2);
			objEOB_MEDICARE_PROCEDURECode.setCIM3(qGetEOB_MEDICARE_PROCEDURECode.CIM3);
			objEOB_MEDICARE_PROCEDURECode.setMCM1(qGetEOB_MEDICARE_PROCEDURECode.MCM1);
			objEOB_MEDICARE_PROCEDURECode.setMCM2(qGetEOB_MEDICARE_PROCEDURECode.MCM2);
			objEOB_MEDICARE_PROCEDURECode.setMCM3(qGetEOB_MEDICARE_PROCEDURECode.MCM3);
			objEOB_MEDICARE_PROCEDURECode.setStatute(qGetEOB_MEDICARE_PROCEDURECode.Statute);
			objEOB_MEDICARE_PROCEDURECode.setLabCert1(qGetEOB_MEDICARE_PROCEDURECode.LabCert1);
			objEOB_MEDICARE_PROCEDURECode.setLabCert2(qGetEOB_MEDICARE_PROCEDURECode.LabCert2);
			objEOB_MEDICARE_PROCEDURECode.setLabCert3(qGetEOB_MEDICARE_PROCEDURECode.LabCert3);
			objEOB_MEDICARE_PROCEDURECode.setLabCert4(qGetEOB_MEDICARE_PROCEDURECode.LabCert4);
			objEOB_MEDICARE_PROCEDURECode.setLabCert5(qGetEOB_MEDICARE_PROCEDURECode.LabCert5);
			objEOB_MEDICARE_PROCEDURECode.setLabCert6(qGetEOB_MEDICARE_PROCEDURECode.LabCert6);
			objEOB_MEDICARE_PROCEDURECode.setLabCert7(qGetEOB_MEDICARE_PROCEDURECode.LabCert7);
			objEOB_MEDICARE_PROCEDURECode.setLabCert8(qGetEOB_MEDICARE_PROCEDURECode.LabCert8);
			objEOB_MEDICARE_PROCEDURECode.setXRef1(qGetEOB_MEDICARE_PROCEDURECode.XRef1);
			objEOB_MEDICARE_PROCEDURECode.setXRef2(qGetEOB_MEDICARE_PROCEDURECode.XRef2);
			objEOB_MEDICARE_PROCEDURECode.setXRef3(qGetEOB_MEDICARE_PROCEDURECode.XRef3);
			objEOB_MEDICARE_PROCEDURECode.setXRef4(qGetEOB_MEDICARE_PROCEDURECode.XRef4);
			objEOB_MEDICARE_PROCEDURECode.setXRef5(qGetEOB_MEDICARE_PROCEDURECode.XRef5);
			objEOB_MEDICARE_PROCEDURECode.setCoverage(qGetEOB_MEDICARE_PROCEDURECode.Coverage);
			objEOB_MEDICARE_PROCEDURECode.setASCPayGrp(qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrp);
			objEOB_MEDICARE_PROCEDURECode.setASCPayGrpEffDate(qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrpEffDate);
			objEOB_MEDICARE_PROCEDURECode.setMOGPayGrp(qGetEOB_MEDICARE_PROCEDURECode.MOGPayGrp);
			objEOB_MEDICARE_PROCEDURECode.setMOGPayInd(qGetEOB_MEDICARE_PROCEDURECode.MOGPayInd);
			objEOB_MEDICARE_PROCEDURECode.setMOGEffDate(qGetEOB_MEDICARE_PROCEDURECode.MOGEffDate);
			objEOB_MEDICARE_PROCEDURECode.setProcNote(qGetEOB_MEDICARE_PROCEDURECode.ProcNote);
			objEOB_MEDICARE_PROCEDURECode.setBETOS(qGetEOB_MEDICARE_PROCEDURECode.BETOS);
			objEOB_MEDICARE_PROCEDURECode.setFILLER(qGetEOB_MEDICARE_PROCEDURECode.FILLER);
			objEOB_MEDICARE_PROCEDURECode.setTOS1(qGetEOB_MEDICARE_PROCEDURECode.TOS1);
			objEOB_MEDICARE_PROCEDURECode.setTOS2(qGetEOB_MEDICARE_PROCEDURECode.TOS2);
			objEOB_MEDICARE_PROCEDURECode.setTOS3(qGetEOB_MEDICARE_PROCEDURECode.TOS3);
			objEOB_MEDICARE_PROCEDURECode.setTOS4(qGetEOB_MEDICARE_PROCEDURECode.TOS4);
			objEOB_MEDICARE_PROCEDURECode.setTOS5(qGetEOB_MEDICARE_PROCEDURECode.TOS5);
			objEOB_MEDICARE_PROCEDURECode.setAnestBaseUnits(qGetEOB_MEDICARE_PROCEDURECode.AnestBaseUnits);
			objEOB_MEDICARE_PROCEDURECode.setCodeAddDate(qGetEOB_MEDICARE_PROCEDURECode.CodeAddDate);
			objEOB_MEDICARE_PROCEDURECode.setActionEffDate(qGetEOB_MEDICARE_PROCEDURECode.ActionEffDate);
			objEOB_MEDICARE_PROCEDURECode.setTermDate(qGetEOB_MEDICARE_PROCEDURECode.TermDate);
			objEOB_MEDICARE_PROCEDURECode.setActionCode(qGetEOB_MEDICARE_PROCEDURECode.ActionCode);
			objEOB_MEDICARE_PROCEDURECode.setFiller1(qGetEOB_MEDICARE_PROCEDURECode.Filler1);
			objEOB_MEDICARE_PROCEDURECode.setActive(qGetEOB_MEDICARE_PROCEDURECode.Active);
			objEOB_MEDICARE_PROCEDURECode.setInactiveCode(qGetEOB_MEDICARE_PROCEDURECode.InactiveCode);
			objEOB_MEDICARE_PROCEDURECode.setDateCreated(qGetEOB_MEDICARE_PROCEDURECode.DateCreated);
			objEOB_MEDICARE_PROCEDURECode.setDateModified(qGetEOB_MEDICARE_PROCEDURECode.DateModified);				
			return objEOB_MEDICARE_PROCEDURECode;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_PROCEDURECodeBean" />
		<cfset var qUpdateEOB_MEDICARE_PROCEDURECode = "" />
		<cfset var localHCPC = arguments.bean.getHCPC() />
		<cfset var localSeqNum = arguments.bean.getSeqNum() />
		<cfset var localRIC = arguments.bean.getRIC() />
		<cfset var localLongDescription = arguments.bean.getLongDescription() />
		<cfset var localShortDescription = arguments.bean.getShortDescription() />
		<cfset var localPI1 = arguments.bean.getPI1() />
		<cfset var localPI2 = arguments.bean.getPI2() />
		<cfset var localPI3 = arguments.bean.getPI3() />
		<cfset var localPI4 = arguments.bean.getPI4() />
		<cfset var localMPI = arguments.bean.getMPI() />
		<cfset var localCIM1 = arguments.bean.getCIM1() />
		<cfset var localCIM2 = arguments.bean.getCIM2() />
		<cfset var localCIM3 = arguments.bean.getCIM3() />
		<cfset var localMCM1 = arguments.bean.getMCM1() />
		<cfset var localMCM2 = arguments.bean.getMCM2() />
		<cfset var localMCM3 = arguments.bean.getMCM3() />
		<cfset var localStatute = arguments.bean.getStatute() />
		<cfset var localLabCert1 = arguments.bean.getLabCert1() />
		<cfset var localLabCert2 = arguments.bean.getLabCert2() />
		<cfset var localLabCert3 = arguments.bean.getLabCert3() />
		<cfset var localLabCert4 = arguments.bean.getLabCert4() />
		<cfset var localLabCert5 = arguments.bean.getLabCert5() />
		<cfset var localLabCert6 = arguments.bean.getLabCert6() />
		<cfset var localLabCert7 = arguments.bean.getLabCert7() />
		<cfset var localLabCert8 = arguments.bean.getLabCert8() />
		<cfset var localXRef1 = arguments.bean.getXRef1() />
		<cfset var localXRef2 = arguments.bean.getXRef2() />
		<cfset var localXRef3 = arguments.bean.getXRef3() />
		<cfset var localXRef4 = arguments.bean.getXRef4() />
		<cfset var localXRef5 = arguments.bean.getXRef5() />
		<cfset var localCoverage = arguments.bean.getCoverage() />
		<cfset var localASCPayGrp = arguments.bean.getASCPayGrp() />
		<cfset var localASCPayGrpEffDate = arguments.bean.getASCPayGrpEffDate() />
		<cfset var localMOGPayGrp = arguments.bean.getMOGPayGrp() />
		<cfset var localMOGPayInd = arguments.bean.getMOGPayInd() />
		<cfset var localMOGEffDate = arguments.bean.getMOGEffDate() />
		<cfset var localProcNote = arguments.bean.getProcNote() />
		<cfset var localBETOS = arguments.bean.getBETOS() />
		<cfset var localFILLER = arguments.bean.getFILLER() />
		<cfset var localTOS1 = arguments.bean.getTOS1() />
		<cfset var localTOS2 = arguments.bean.getTOS2() />
		<cfset var localTOS3 = arguments.bean.getTOS3() />
		<cfset var localTOS4 = arguments.bean.getTOS4() />
		<cfset var localTOS5 = arguments.bean.getTOS5() />
		<cfset var localAnestBaseUnits = arguments.bean.getAnestBaseUnits() />
		<cfset var localCodeAddDate = arguments.bean.getCodeAddDate() />
		<cfset var localActionEffDate = arguments.bean.getActionEffDate() />
		<cfset var localTermDate = arguments.bean.getTermDate() />
		<cfset var localActionCode = arguments.bean.getActionCode() />
		<cfset var localFiller1 = arguments.bean.getFiller1() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_MEDICARE_PROCEDURECode" datasource="#trim(arguments.ds)#">
				UPDATE EOB_MEDICARE_PROCEDURECode  SET
					
					HCPC =						
						<cfqueryparam value="#trim(localHCPC)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					SeqNum =	
					<cfif trim(localSeqNum) NEQ "" AND trim(localSeqNum) NEQ "@@" AND trim(localSeqNum) NEQ "NULL">						
						<cfqueryparam value="#trim(localSeqNum)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					RIC =	
					<cfif trim(localRIC) NEQ "" AND trim(localRIC) NEQ "@@" AND trim(localRIC) NEQ "NULL">						
						<cfqueryparam value="#trim(localRIC)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LongDescription =	
					<cfif trim(localLongDescription) NEQ "" AND trim(localLongDescription) NEQ "@@" AND trim(localLongDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localLongDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ShortDescription =	
					<cfif trim(localShortDescription) NEQ "" AND trim(localShortDescription) NEQ "@@" AND trim(localShortDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localShortDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PI1 =	
					<cfif trim(localPI1) NEQ "" AND trim(localPI1) NEQ "@@" AND trim(localPI1) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PI2 =	
					<cfif trim(localPI2) NEQ "" AND trim(localPI2) NEQ "@@" AND trim(localPI2) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PI3 =	
					<cfif trim(localPI3) NEQ "" AND trim(localPI3) NEQ "@@" AND trim(localPI3) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PI4 =	
					<cfif trim(localPI4) NEQ "" AND trim(localPI4) NEQ "@@" AND trim(localPI4) NEQ "NULL">						
						<cfqueryparam value="#trim(localPI4)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MPI =	
					<cfif trim(localMPI) NEQ "" AND trim(localMPI) NEQ "@@" AND trim(localMPI) NEQ "NULL">						
						<cfqueryparam value="#trim(localMPI)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CIM1 =	
					<cfif trim(localCIM1) NEQ "" AND trim(localCIM1) NEQ "@@" AND trim(localCIM1) NEQ "NULL">						
						<cfqueryparam value="#trim(localCIM1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CIM2 =	
					<cfif trim(localCIM2) NEQ "" AND trim(localCIM2) NEQ "@@" AND trim(localCIM2) NEQ "NULL">						
						<cfqueryparam value="#trim(localCIM2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CIM3 =	
					<cfif trim(localCIM3) NEQ "" AND trim(localCIM3) NEQ "@@" AND trim(localCIM3) NEQ "NULL">						
						<cfqueryparam value="#trim(localCIM3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MCM1 =	
					<cfif trim(localMCM1) NEQ "" AND trim(localMCM1) NEQ "@@" AND trim(localMCM1) NEQ "NULL">						
						<cfqueryparam value="#trim(localMCM1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MCM2 =	
					<cfif trim(localMCM2) NEQ "" AND trim(localMCM2) NEQ "@@" AND trim(localMCM2) NEQ "NULL">						
						<cfqueryparam value="#trim(localMCM2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MCM3 =	
					<cfif trim(localMCM3) NEQ "" AND trim(localMCM3) NEQ "@@" AND trim(localMCM3) NEQ "NULL">						
						<cfqueryparam value="#trim(localMCM3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Statute =	
					<cfif trim(localStatute) NEQ "" AND trim(localStatute) NEQ "@@" AND trim(localStatute) NEQ "NULL">						
						<cfqueryparam value="#trim(localStatute)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert1 =	
					<cfif trim(localLabCert1) NEQ "" AND trim(localLabCert1) NEQ "@@" AND trim(localLabCert1) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert2 =	
					<cfif trim(localLabCert2) NEQ "" AND trim(localLabCert2) NEQ "@@" AND trim(localLabCert2) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert3 =	
					<cfif trim(localLabCert3) NEQ "" AND trim(localLabCert3) NEQ "@@" AND trim(localLabCert3) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert4 =	
					<cfif trim(localLabCert4) NEQ "" AND trim(localLabCert4) NEQ "@@" AND trim(localLabCert4) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert4)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert5 =	
					<cfif trim(localLabCert5) NEQ "" AND trim(localLabCert5) NEQ "@@" AND trim(localLabCert5) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert5)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert6 =	
					<cfif trim(localLabCert6) NEQ "" AND trim(localLabCert6) NEQ "@@" AND trim(localLabCert6) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert6)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert7 =	
					<cfif trim(localLabCert7) NEQ "" AND trim(localLabCert7) NEQ "@@" AND trim(localLabCert7) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert7)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabCert8 =	
					<cfif trim(localLabCert8) NEQ "" AND trim(localLabCert8) NEQ "@@" AND trim(localLabCert8) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabCert8)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					XRef1 =	
					<cfif trim(localXRef1) NEQ "" AND trim(localXRef1) NEQ "@@" AND trim(localXRef1) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					XRef2 =	
					<cfif trim(localXRef2) NEQ "" AND trim(localXRef2) NEQ "@@" AND trim(localXRef2) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					XRef3 =	
					<cfif trim(localXRef3) NEQ "" AND trim(localXRef3) NEQ "@@" AND trim(localXRef3) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					XRef4 =	
					<cfif trim(localXRef4) NEQ "" AND trim(localXRef4) NEQ "@@" AND trim(localXRef4) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef4)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					XRef5 =	
					<cfif trim(localXRef5) NEQ "" AND trim(localXRef5) NEQ "@@" AND trim(localXRef5) NEQ "NULL">						
						<cfqueryparam value="#trim(localXRef5)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Coverage =	
					<cfif trim(localCoverage) NEQ "" AND trim(localCoverage) NEQ "@@" AND trim(localCoverage) NEQ "NULL">						
						<cfqueryparam value="#trim(localCoverage)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ASCPayGrp =	
					<cfif trim(localASCPayGrp) NEQ "" AND trim(localASCPayGrp) NEQ "@@" AND trim(localASCPayGrp) NEQ "NULL">						
						<cfqueryparam value="#trim(localASCPayGrp)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ASCPayGrpEffDate =	
					<cfif IsDate(trim(localASCPayGrpEffDate))>						
						<cfqueryparam value="#trim(localASCPayGrpEffDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					MOGPayGrp =	
					<cfif trim(localMOGPayGrp) NEQ "" AND trim(localMOGPayGrp) NEQ "@@" AND trim(localMOGPayGrp) NEQ "NULL">						
						<cfqueryparam value="#trim(localMOGPayGrp)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MOGPayInd =	
					<cfif trim(localMOGPayInd) NEQ "" AND trim(localMOGPayInd) NEQ "@@" AND trim(localMOGPayInd) NEQ "NULL">						
						<cfqueryparam value="#trim(localMOGPayInd)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MOGEffDate =	
					<cfif IsDate(trim(localMOGEffDate))>						
						<cfqueryparam value="#trim(localMOGEffDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					ProcNote =	
					<cfif trim(localProcNote) NEQ "" AND trim(localProcNote) NEQ "@@" AND trim(localProcNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localProcNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					BETOS =	
					<cfif trim(localBETOS) NEQ "" AND trim(localBETOS) NEQ "@@" AND trim(localBETOS) NEQ "NULL">						
						<cfqueryparam value="#trim(localBETOS)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					FILLER =	
					<cfif trim(localFILLER) NEQ "" AND trim(localFILLER) NEQ "@@" AND trim(localFILLER) NEQ "NULL">						
						<cfqueryparam value="#trim(localFILLER)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TOS1 =	
					<cfif trim(localTOS1) NEQ "" AND trim(localTOS1) NEQ "@@" AND trim(localTOS1) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TOS2 =	
					<cfif trim(localTOS2) NEQ "" AND trim(localTOS2) NEQ "@@" AND trim(localTOS2) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TOS3 =	
					<cfif trim(localTOS3) NEQ "" AND trim(localTOS3) NEQ "@@" AND trim(localTOS3) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TOS4 =	
					<cfif trim(localTOS4) NEQ "" AND trim(localTOS4) NEQ "@@" AND trim(localTOS4) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS4)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TOS5 =	
					<cfif trim(localTOS5) NEQ "" AND trim(localTOS5) NEQ "@@" AND trim(localTOS5) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOS5)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AnestBaseUnits =	
					<cfif trim(localAnestBaseUnits) NEQ "" AND trim(localAnestBaseUnits) NEQ "@@" AND trim(localAnestBaseUnits) NEQ "NULL">						
						<cfqueryparam value="#trim(localAnestBaseUnits)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CodeAddDate =	
					<cfif IsDate(trim(localCodeAddDate))>						
						<cfqueryparam value="#trim(localCodeAddDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					ActionEffDate =	
					<cfif IsDate(trim(localActionEffDate))>						
						<cfqueryparam value="#trim(localActionEffDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					TermDate =	
					<cfif IsDate(trim(localTermDate))>						
						<cfqueryparam value="#trim(localTermDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					ActionCode =	
					<cfif trim(localActionCode) NEQ "" AND trim(localActionCode) NEQ "@@" AND trim(localActionCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localActionCode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Filler1 =	
					<cfif trim(localFiller1) NEQ "" AND trim(localFiller1) NEQ "@@" AND trim(localFiller1) NEQ "NULL">						
						<cfqueryparam value="#trim(localFiller1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE RecordID = <cfqueryparam value="#trim(arguments.bean.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_PROCEDURECodeBean" />
		<cfset var qDeleteEOB_MEDICARE_PROCEDURECode = "">

		<cfquery name="qDeleteEOB_MEDICARE_PROCEDURECode" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EOB_MEDICARE_PROCEDURECode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_MEDICARE_PROCEDURECode" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EOB_MEDICARE_PROCEDURECodeID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_PROCEDURECode = "" />		
	
		<cfquery name="qGetEOB_MEDICARE_PROCEDURECode" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode,DateCreated,DateModified
			FROM EOB_MEDICARE_PROCEDURECode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_MEDICARE_PROCEDURECode>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


