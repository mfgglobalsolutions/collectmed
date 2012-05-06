 	


<cfcomponent name="eob_medicare_procedurecodeActive" output="false" alias="eob_medicare_procedurecodeActive">

	<cfproperty name="RecordID" type="numeric" default="0" />
	<cfproperty name="HCPC" type="string" default="" />
	<cfproperty name="SeqNum" type="string" default="" />
	<cfproperty name="RIC" type="string" default="" />
	<cfproperty name="LongDescription" type="string" default="" />
	<cfproperty name="ShortDescription" type="string" default="" />
	<cfproperty name="PI1" type="string" default="" />
	<cfproperty name="PI2" type="string" default="" />
	<cfproperty name="PI3" type="string" default="" />
	<cfproperty name="PI4" type="string" default="" />
	<cfproperty name="MPI" type="string" default="" />
	<cfproperty name="CIM1" type="string" default="" />
	<cfproperty name="CIM2" type="string" default="" />
	<cfproperty name="CIM3" type="string" default="" />
	<cfproperty name="MCM1" type="string" default="" />
	<cfproperty name="MCM2" type="string" default="" />
	<cfproperty name="MCM3" type="string" default="" />
	<cfproperty name="Statute" type="string" default="" />
	<cfproperty name="LabCert1" type="string" default="" />
	<cfproperty name="LabCert2" type="string" default="" />
	<cfproperty name="LabCert3" type="string" default="" />
	<cfproperty name="LabCert4" type="string" default="" />
	<cfproperty name="LabCert5" type="string" default="" />
	<cfproperty name="LabCert6" type="string" default="" />
	<cfproperty name="LabCert7" type="string" default="" />
	<cfproperty name="LabCert8" type="string" default="" />
	<cfproperty name="XRef1" type="string" default="" />
	<cfproperty name="XRef2" type="string" default="" />
	<cfproperty name="XRef3" type="string" default="" />
	<cfproperty name="XRef4" type="string" default="" />
	<cfproperty name="XRef5" type="string" default="" />
	<cfproperty name="Coverage" type="string" default="" />
	<cfproperty name="ASCPayGrp" type="string" default="" />
	<cfproperty name="ASCPayGrpEffDate" type="datetime" default="" />
	<cfproperty name="MOGPayGrp" type="string" default="" />
	<cfproperty name="MOGPayInd" type="string" default="" />
	<cfproperty name="MOGEffDate" type="datetime" default="" />
	<cfproperty name="ProcNote" type="string" default="" />
	<cfproperty name="BETOS" type="string" default="" />
	<cfproperty name="FILLER" type="string" default="" />
	<cfproperty name="TOS1" type="string" default="" />
	<cfproperty name="TOS2" type="string" default="" />
	<cfproperty name="TOS3" type="string" default="" />
	<cfproperty name="TOS4" type="string" default="" />
	<cfproperty name="TOS5" type="string" default="" />
	<cfproperty name="AnestBaseUnits" type="string" default="" />
	<cfproperty name="CodeAddDate" type="datetime" default="" />
	<cfproperty name="ActionEffDate" type="datetime" default="" />
	<cfproperty name="TermDate" type="datetime" default="" />
	<cfproperty name="ActionCode" type="string" default="" />
	<cfproperty name="Filler1" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.RecordID = 0;
		variables.HCPC = "";
		variables.SeqNum = "";
		variables.RIC = "";
		variables.LongDescription = "";
		variables.ShortDescription = "";
		variables.PI1 = "";
		variables.PI2 = "";
		variables.PI3 = "";
		variables.PI4 = "";
		variables.MPI = "";
		variables.CIM1 = "";
		variables.CIM2 = "";
		variables.CIM3 = "";
		variables.MCM1 = "";
		variables.MCM2 = "";
		variables.MCM3 = "";
		variables.Statute = "";
		variables.LabCert1 = "";
		variables.LabCert2 = "";
		variables.LabCert3 = "";
		variables.LabCert4 = "";
		variables.LabCert5 = "";
		variables.LabCert6 = "";
		variables.LabCert7 = "";
		variables.LabCert8 = "";
		variables.XRef1 = "";
		variables.XRef2 = "";
		variables.XRef3 = "";
		variables.XRef4 = "";
		variables.XRef5 = "";
		variables.Coverage = "";
		variables.ASCPayGrp = "";
		variables.ASCPayGrpEffDate = "";
		variables.MOGPayGrp = "";
		variables.MOGPayInd = "";
		variables.MOGEffDate = "";
		variables.ProcNote = "";
		variables.BETOS = "";
		variables.FILLER = "";
		variables.TOS1 = "";
		variables.TOS2 = "";
		variables.TOS3 = "";
		variables.TOS4 = "";
		variables.TOS5 = "";
		variables.AnestBaseUnits = "";
		variables.CodeAddDate = "";
		variables.ActionEffDate = "";
		variables.TermDate = "";
		variables.ActionCode = "";
		variables.Filler1 = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="eob_medicare_procedurecodeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RecordID") AND stValues.RecordID NEQ 0>
				<cfquery name="qGetEOB_MEDICARE_PROCEDURECode" datasource="#trim(variables.ds)#">
			  		SELECT RecordID,HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode,DateCreated,DateModified
					FROM EOB_MEDICARE_PROCEDURECode  
					WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RecordID#" /> 
				</cfquery>		
				<cfif qGetEOB_MEDICARE_PROCEDURECode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.HCPC = qGetEOB_MEDICARE_PROCEDURECode.HCPC;
					variables.SeqNum = qGetEOB_MEDICARE_PROCEDURECode.SeqNum;
					variables.RIC = qGetEOB_MEDICARE_PROCEDURECode.RIC;
					variables.LongDescription = qGetEOB_MEDICARE_PROCEDURECode.LongDescription;
					variables.ShortDescription = qGetEOB_MEDICARE_PROCEDURECode.ShortDescription;
					variables.PI1 = qGetEOB_MEDICARE_PROCEDURECode.PI1;
					variables.PI2 = qGetEOB_MEDICARE_PROCEDURECode.PI2;
					variables.PI3 = qGetEOB_MEDICARE_PROCEDURECode.PI3;
					variables.PI4 = qGetEOB_MEDICARE_PROCEDURECode.PI4;
					variables.MPI = qGetEOB_MEDICARE_PROCEDURECode.MPI;
					variables.CIM1 = qGetEOB_MEDICARE_PROCEDURECode.CIM1;
					variables.CIM2 = qGetEOB_MEDICARE_PROCEDURECode.CIM2;
					variables.CIM3 = qGetEOB_MEDICARE_PROCEDURECode.CIM3;
					variables.MCM1 = qGetEOB_MEDICARE_PROCEDURECode.MCM1;
					variables.MCM2 = qGetEOB_MEDICARE_PROCEDURECode.MCM2;
					variables.MCM3 = qGetEOB_MEDICARE_PROCEDURECode.MCM3;
					variables.Statute = qGetEOB_MEDICARE_PROCEDURECode.Statute;
					variables.LabCert1 = qGetEOB_MEDICARE_PROCEDURECode.LabCert1;
					variables.LabCert2 = qGetEOB_MEDICARE_PROCEDURECode.LabCert2;
					variables.LabCert3 = qGetEOB_MEDICARE_PROCEDURECode.LabCert3;
					variables.LabCert4 = qGetEOB_MEDICARE_PROCEDURECode.LabCert4;
					variables.LabCert5 = qGetEOB_MEDICARE_PROCEDURECode.LabCert5;
					variables.LabCert6 = qGetEOB_MEDICARE_PROCEDURECode.LabCert6;
					variables.LabCert7 = qGetEOB_MEDICARE_PROCEDURECode.LabCert7;
					variables.LabCert8 = qGetEOB_MEDICARE_PROCEDURECode.LabCert8;
					variables.XRef1 = qGetEOB_MEDICARE_PROCEDURECode.XRef1;
					variables.XRef2 = qGetEOB_MEDICARE_PROCEDURECode.XRef2;
					variables.XRef3 = qGetEOB_MEDICARE_PROCEDURECode.XRef3;
					variables.XRef4 = qGetEOB_MEDICARE_PROCEDURECode.XRef4;
					variables.XRef5 = qGetEOB_MEDICARE_PROCEDURECode.XRef5;
					variables.Coverage = qGetEOB_MEDICARE_PROCEDURECode.Coverage;
					variables.ASCPayGrp = qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrp;
					variables.ASCPayGrpEffDate = qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrpEffDate;
					variables.MOGPayGrp = qGetEOB_MEDICARE_PROCEDURECode.MOGPayGrp;
					variables.MOGPayInd = qGetEOB_MEDICARE_PROCEDURECode.MOGPayInd;
					variables.MOGEffDate = qGetEOB_MEDICARE_PROCEDURECode.MOGEffDate;
					variables.ProcNote = qGetEOB_MEDICARE_PROCEDURECode.ProcNote;
					variables.BETOS = qGetEOB_MEDICARE_PROCEDURECode.BETOS;
					variables.FILLER = qGetEOB_MEDICARE_PROCEDURECode.FILLER;
					variables.TOS1 = qGetEOB_MEDICARE_PROCEDURECode.TOS1;
					variables.TOS2 = qGetEOB_MEDICARE_PROCEDURECode.TOS2;
					variables.TOS3 = qGetEOB_MEDICARE_PROCEDURECode.TOS3;
					variables.TOS4 = qGetEOB_MEDICARE_PROCEDURECode.TOS4;
					variables.TOS5 = qGetEOB_MEDICARE_PROCEDURECode.TOS5;
					variables.AnestBaseUnits = qGetEOB_MEDICARE_PROCEDURECode.AnestBaseUnits;
					variables.CodeAddDate = qGetEOB_MEDICARE_PROCEDURECode.CodeAddDate;
					variables.ActionEffDate = qGetEOB_MEDICARE_PROCEDURECode.ActionEffDate;
					variables.TermDate = qGetEOB_MEDICARE_PROCEDURECode.TermDate;
					variables.ActionCode = qGetEOB_MEDICARE_PROCEDURECode.ActionCode;
					variables.Filler1 = qGetEOB_MEDICARE_PROCEDURECode.Filler1;
					variables.Active = qGetEOB_MEDICARE_PROCEDURECode.Active;
					variables.InactiveCode = qGetEOB_MEDICARE_PROCEDURECode.InactiveCode;
					variables.DateModified = qGetEOB_MEDICARE_PROCEDURECode.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RecordID")><cfset variables.RecordID = stValues.RecordID /></cfif>
			<cfif StructKeyExists(stValues, "HCPC")><cfset variables.HCPC = stValues.HCPC /></cfif>
			<cfif StructKeyExists(stValues, "SeqNum")><cfset variables.SeqNum = stValues.SeqNum /></cfif>
			<cfif StructKeyExists(stValues, "RIC")><cfset variables.RIC = stValues.RIC /></cfif>
			<cfif StructKeyExists(stValues, "LongDescription")><cfset variables.LongDescription = stValues.LongDescription /></cfif>
			<cfif StructKeyExists(stValues, "ShortDescription")><cfset variables.ShortDescription = stValues.ShortDescription /></cfif>
			<cfif StructKeyExists(stValues, "PI1")><cfset variables.PI1 = stValues.PI1 /></cfif>
			<cfif StructKeyExists(stValues, "PI2")><cfset variables.PI2 = stValues.PI2 /></cfif>
			<cfif StructKeyExists(stValues, "PI3")><cfset variables.PI3 = stValues.PI3 /></cfif>
			<cfif StructKeyExists(stValues, "PI4")><cfset variables.PI4 = stValues.PI4 /></cfif>
			<cfif StructKeyExists(stValues, "MPI")><cfset variables.MPI = stValues.MPI /></cfif>
			<cfif StructKeyExists(stValues, "CIM1")><cfset variables.CIM1 = stValues.CIM1 /></cfif>
			<cfif StructKeyExists(stValues, "CIM2")><cfset variables.CIM2 = stValues.CIM2 /></cfif>
			<cfif StructKeyExists(stValues, "CIM3")><cfset variables.CIM3 = stValues.CIM3 /></cfif>
			<cfif StructKeyExists(stValues, "MCM1")><cfset variables.MCM1 = stValues.MCM1 /></cfif>
			<cfif StructKeyExists(stValues, "MCM2")><cfset variables.MCM2 = stValues.MCM2 /></cfif>
			<cfif StructKeyExists(stValues, "MCM3")><cfset variables.MCM3 = stValues.MCM3 /></cfif>
			<cfif StructKeyExists(stValues, "Statute")><cfset variables.Statute = stValues.Statute /></cfif>
			<cfif StructKeyExists(stValues, "LabCert1")><cfset variables.LabCert1 = stValues.LabCert1 /></cfif>
			<cfif StructKeyExists(stValues, "LabCert2")><cfset variables.LabCert2 = stValues.LabCert2 /></cfif>
			<cfif StructKeyExists(stValues, "LabCert3")><cfset variables.LabCert3 = stValues.LabCert3 /></cfif>
			<cfif StructKeyExists(stValues, "LabCert4")><cfset variables.LabCert4 = stValues.LabCert4 /></cfif>
			<cfif StructKeyExists(stValues, "LabCert5")><cfset variables.LabCert5 = stValues.LabCert5 /></cfif>
			<cfif StructKeyExists(stValues, "LabCert6")><cfset variables.LabCert6 = stValues.LabCert6 /></cfif>
			<cfif StructKeyExists(stValues, "LabCert7")><cfset variables.LabCert7 = stValues.LabCert7 /></cfif>
			<cfif StructKeyExists(stValues, "LabCert8")><cfset variables.LabCert8 = stValues.LabCert8 /></cfif>
			<cfif StructKeyExists(stValues, "XRef1")><cfset variables.XRef1 = stValues.XRef1 /></cfif>
			<cfif StructKeyExists(stValues, "XRef2")><cfset variables.XRef2 = stValues.XRef2 /></cfif>
			<cfif StructKeyExists(stValues, "XRef3")><cfset variables.XRef3 = stValues.XRef3 /></cfif>
			<cfif StructKeyExists(stValues, "XRef4")><cfset variables.XRef4 = stValues.XRef4 /></cfif>
			<cfif StructKeyExists(stValues, "XRef5")><cfset variables.XRef5 = stValues.XRef5 /></cfif>
			<cfif StructKeyExists(stValues, "Coverage")><cfset variables.Coverage = stValues.Coverage /></cfif>
			<cfif StructKeyExists(stValues, "ASCPayGrp")><cfset variables.ASCPayGrp = stValues.ASCPayGrp /></cfif>
			<cfif StructKeyExists(stValues, "ASCPayGrpEffDate")><cfset variables.ASCPayGrpEffDate = stValues.ASCPayGrpEffDate /></cfif>
			<cfif StructKeyExists(stValues, "MOGPayGrp")><cfset variables.MOGPayGrp = stValues.MOGPayGrp /></cfif>
			<cfif StructKeyExists(stValues, "MOGPayInd")><cfset variables.MOGPayInd = stValues.MOGPayInd /></cfif>
			<cfif StructKeyExists(stValues, "MOGEffDate")><cfset variables.MOGEffDate = stValues.MOGEffDate /></cfif>
			<cfif StructKeyExists(stValues, "ProcNote")><cfset variables.ProcNote = stValues.ProcNote /></cfif>
			<cfif StructKeyExists(stValues, "BETOS")><cfset variables.BETOS = stValues.BETOS /></cfif>
			<cfif StructKeyExists(stValues, "FILLER")><cfset variables.FILLER = stValues.FILLER /></cfif>
			<cfif StructKeyExists(stValues, "TOS1")><cfset variables.TOS1 = stValues.TOS1 /></cfif>
			<cfif StructKeyExists(stValues, "TOS2")><cfset variables.TOS2 = stValues.TOS2 /></cfif>
			<cfif StructKeyExists(stValues, "TOS3")><cfset variables.TOS3 = stValues.TOS3 /></cfif>
			<cfif StructKeyExists(stValues, "TOS4")><cfset variables.TOS4 = stValues.TOS4 /></cfif>
			<cfif StructKeyExists(stValues, "TOS5")><cfset variables.TOS5 = stValues.TOS5 /></cfif>
			<cfif StructKeyExists(stValues, "AnestBaseUnits")><cfset variables.AnestBaseUnits = stValues.AnestBaseUnits /></cfif>
			<cfif StructKeyExists(stValues, "CodeAddDate")><cfset variables.CodeAddDate = stValues.CodeAddDate /></cfif>
			<cfif StructKeyExists(stValues, "ActionEffDate")><cfset variables.ActionEffDate = stValues.ActionEffDate /></cfif>
			<cfif StructKeyExists(stValues, "TermDate")><cfset variables.TermDate = stValues.TermDate /></cfif>
			<cfif StructKeyExists(stValues, "ActionCode")><cfset variables.ActionCode = stValues.ActionCode /></cfif>
			<cfif StructKeyExists(stValues, "Filler1")><cfset variables.Filler1 = stValues.Filler1 /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RecordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.RecordID>
	</cffunction>
	
	<cffunction name="setRecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RecordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RecordID)) OR trim(arguments.RecordID) EQ "">
			<cfset variables.RecordID = arguments.RecordID />
		<cfelse>
			<cfthrow message="RecordID (#arguments.RecordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RecordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HCPC.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHCPC" acess="public" output="false" returntype="any">
		<cfreturn variables.HCPC>
	</cffunction>
	
	<cffunction name="setHCPC" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HCPC" required="true" type="any" />
			
		<cfset variables.HCPC = arguments.HCPC />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HCPC") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SeqNum.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSeqNum" acess="public" output="false" returntype="any">
		<cfreturn variables.SeqNum>
	</cffunction>
	
	<cffunction name="setSeqNum" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SeqNum" required="true" type="any" />
			
		<cfset variables.SeqNum = arguments.SeqNum />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SeqNum") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RIC.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRIC" acess="public" output="false" returntype="any">
		<cfreturn variables.RIC>
	</cffunction>
	
	<cffunction name="setRIC" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RIC" required="true" type="any" />
			
		<cfset variables.RIC = arguments.RIC />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RIC") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LongDescription.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLongDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.LongDescription>
	</cffunction>
	
	<cffunction name="setLongDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LongDescription" required="true" type="any" />
			
		<cfset variables.LongDescription = arguments.LongDescription />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LongDescription") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ShortDescription.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getShortDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.ShortDescription>
	</cffunction>
	
	<cffunction name="setShortDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ShortDescription" required="true" type="any" />
			
		<cfset variables.ShortDescription = arguments.ShortDescription />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ShortDescription") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PI1.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPI1" acess="public" output="false" returntype="any">
		<cfreturn variables.PI1>
	</cffunction>
	
	<cffunction name="setPI1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PI1" required="true" type="any" />
			
		<cfset variables.PI1 = arguments.PI1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PI1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PI2.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPI2" acess="public" output="false" returntype="any">
		<cfreturn variables.PI2>
	</cffunction>
	
	<cffunction name="setPI2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PI2" required="true" type="any" />
			
		<cfset variables.PI2 = arguments.PI2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PI2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PI3.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPI3" acess="public" output="false" returntype="any">
		<cfreturn variables.PI3>
	</cffunction>
	
	<cffunction name="setPI3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PI3" required="true" type="any" />
			
		<cfset variables.PI3 = arguments.PI3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PI3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PI4.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPI4" acess="public" output="false" returntype="any">
		<cfreturn variables.PI4>
	</cffunction>
	
	<cffunction name="setPI4" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PI4" required="true" type="any" />
			
		<cfset variables.PI4 = arguments.PI4 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PI4") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MPI.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMPI" acess="public" output="false" returntype="any">
		<cfreturn variables.MPI>
	</cffunction>
	
	<cffunction name="setMPI" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MPI" required="true" type="any" />
			
		<cfset variables.MPI = arguments.MPI />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MPI") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CIM1.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCIM1" acess="public" output="false" returntype="any">
		<cfreturn variables.CIM1>
	</cffunction>
	
	<cffunction name="setCIM1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CIM1" required="true" type="any" />
			
		<cfset variables.CIM1 = arguments.CIM1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CIM1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CIM2.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCIM2" acess="public" output="false" returntype="any">
		<cfreturn variables.CIM2>
	</cffunction>
	
	<cffunction name="setCIM2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CIM2" required="true" type="any" />
			
		<cfset variables.CIM2 = arguments.CIM2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CIM2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CIM3.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCIM3" acess="public" output="false" returntype="any">
		<cfreturn variables.CIM3>
	</cffunction>
	
	<cffunction name="setCIM3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CIM3" required="true" type="any" />
			
		<cfset variables.CIM3 = arguments.CIM3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CIM3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MCM1.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMCM1" acess="public" output="false" returntype="any">
		<cfreturn variables.MCM1>
	</cffunction>
	
	<cffunction name="setMCM1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MCM1" required="true" type="any" />
			
		<cfset variables.MCM1 = arguments.MCM1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MCM1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MCM2.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMCM2" acess="public" output="false" returntype="any">
		<cfreturn variables.MCM2>
	</cffunction>
	
	<cffunction name="setMCM2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MCM2" required="true" type="any" />
			
		<cfset variables.MCM2 = arguments.MCM2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MCM2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MCM3.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMCM3" acess="public" output="false" returntype="any">
		<cfreturn variables.MCM3>
	</cffunction>
	
	<cffunction name="setMCM3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MCM3" required="true" type="any" />
			
		<cfset variables.MCM3 = arguments.MCM3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MCM3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Statute.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStatute" acess="public" output="false" returntype="any">
		<cfreturn variables.Statute>
	</cffunction>
	
	<cffunction name="setStatute" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Statute" required="true" type="any" />
			
		<cfset variables.Statute = arguments.Statute />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Statute") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert1.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert1" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert1>
	</cffunction>
	
	<cffunction name="setLabCert1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert1" required="true" type="any" />
			
		<cfset variables.LabCert1 = arguments.LabCert1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert2.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert2" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert2>
	</cffunction>
	
	<cffunction name="setLabCert2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert2" required="true" type="any" />
			
		<cfset variables.LabCert2 = arguments.LabCert2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert3.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert3" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert3>
	</cffunction>
	
	<cffunction name="setLabCert3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert3" required="true" type="any" />
			
		<cfset variables.LabCert3 = arguments.LabCert3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert4.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert4" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert4>
	</cffunction>
	
	<cffunction name="setLabCert4" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert4" required="true" type="any" />
			
		<cfset variables.LabCert4 = arguments.LabCert4 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert4") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert5.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert5" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert5>
	</cffunction>
	
	<cffunction name="setLabCert5" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert5" required="true" type="any" />
			
		<cfset variables.LabCert5 = arguments.LabCert5 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert5") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert6.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert6" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert6>
	</cffunction>
	
	<cffunction name="setLabCert6" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert6" required="true" type="any" />
			
		<cfset variables.LabCert6 = arguments.LabCert6 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert6") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert7.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert7" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert7>
	</cffunction>
	
	<cffunction name="setLabCert7" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert7" required="true" type="any" />
			
		<cfset variables.LabCert7 = arguments.LabCert7 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert7") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabCert8.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabCert8" acess="public" output="false" returntype="any">
		<cfreturn variables.LabCert8>
	</cffunction>
	
	<cffunction name="setLabCert8" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabCert8" required="true" type="any" />
			
		<cfset variables.LabCert8 = arguments.LabCert8 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabCert8") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for XRef1.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getXRef1" acess="public" output="false" returntype="any">
		<cfreturn variables.XRef1>
	</cffunction>
	
	<cffunction name="setXRef1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="XRef1" required="true" type="any" />
			
		<cfset variables.XRef1 = arguments.XRef1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "XRef1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for XRef2.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getXRef2" acess="public" output="false" returntype="any">
		<cfreturn variables.XRef2>
	</cffunction>
	
	<cffunction name="setXRef2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="XRef2" required="true" type="any" />
			
		<cfset variables.XRef2 = arguments.XRef2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "XRef2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for XRef3.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getXRef3" acess="public" output="false" returntype="any">
		<cfreturn variables.XRef3>
	</cffunction>
	
	<cffunction name="setXRef3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="XRef3" required="true" type="any" />
			
		<cfset variables.XRef3 = arguments.XRef3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "XRef3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for XRef4.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getXRef4" acess="public" output="false" returntype="any">
		<cfreturn variables.XRef4>
	</cffunction>
	
	<cffunction name="setXRef4" acess="public" output="false" returntype="boolean">
		
		<cfargument name="XRef4" required="true" type="any" />
			
		<cfset variables.XRef4 = arguments.XRef4 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "XRef4") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for XRef5.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getXRef5" acess="public" output="false" returntype="any">
		<cfreturn variables.XRef5>
	</cffunction>
	
	<cffunction name="setXRef5" acess="public" output="false" returntype="boolean">
		
		<cfargument name="XRef5" required="true" type="any" />
			
		<cfset variables.XRef5 = arguments.XRef5 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "XRef5") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Coverage.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCoverage" acess="public" output="false" returntype="any">
		<cfreturn variables.Coverage>
	</cffunction>
	
	<cffunction name="setCoverage" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Coverage" required="true" type="any" />
			
		<cfset variables.Coverage = arguments.Coverage />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Coverage") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ASCPayGrp.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getASCPayGrp" acess="public" output="false" returntype="any">
		<cfreturn variables.ASCPayGrp>
	</cffunction>
	
	<cffunction name="setASCPayGrp" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ASCPayGrp" required="true" type="any" />
			
		<cfset variables.ASCPayGrp = arguments.ASCPayGrp />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ASCPayGrp") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ASCPayGrpEffDate.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getASCPayGrpEffDate" acess="public" output="false" returntype="any">
		<cfreturn variables.ASCPayGrpEffDate>
	</cffunction>
	
	<cffunction name="setASCPayGrpEffDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ASCPayGrpEffDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.ASCPayGrpEffDate)) OR trim(arguments.ASCPayGrpEffDate) EQ "">
			<cfset variables.ASCPayGrpEffDate = arguments.ASCPayGrpEffDate />
		<cfelse>
			<cfthrow message="ASCPayGrpEffDate (#arguments.ASCPayGrpEffDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ASCPayGrpEffDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOGPayGrp.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOGPayGrp" acess="public" output="false" returntype="any">
		<cfreturn variables.MOGPayGrp>
	</cffunction>
	
	<cffunction name="setMOGPayGrp" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOGPayGrp" required="true" type="any" />
			
		<cfset variables.MOGPayGrp = arguments.MOGPayGrp />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOGPayGrp") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOGPayInd.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOGPayInd" acess="public" output="false" returntype="any">
		<cfreturn variables.MOGPayInd>
	</cffunction>
	
	<cffunction name="setMOGPayInd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOGPayInd" required="true" type="any" />
			
		<cfset variables.MOGPayInd = arguments.MOGPayInd />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOGPayInd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOGEffDate.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOGEffDate" acess="public" output="false" returntype="any">
		<cfreturn variables.MOGEffDate>
	</cffunction>
	
	<cffunction name="setMOGEffDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOGEffDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.MOGEffDate)) OR trim(arguments.MOGEffDate) EQ "">
			<cfset variables.MOGEffDate = arguments.MOGEffDate />
		<cfelse>
			<cfthrow message="MOGEffDate (#arguments.MOGEffDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOGEffDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProcNote.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcNote" acess="public" output="false" returntype="any">
		<cfreturn variables.ProcNote>
	</cffunction>
	
	<cffunction name="setProcNote" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProcNote" required="true" type="any" />
			
		<cfset variables.ProcNote = arguments.ProcNote />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProcNote") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for BETOS.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBETOS" acess="public" output="false" returntype="any">
		<cfreturn variables.BETOS>
	</cffunction>
	
	<cffunction name="setBETOS" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BETOS" required="true" type="any" />
			
		<cfset variables.BETOS = arguments.BETOS />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BETOS") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FILLER.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFILLER" acess="public" output="false" returntype="any">
		<cfreturn variables.FILLER>
	</cffunction>
	
	<cffunction name="setFILLER" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FILLER" required="true" type="any" />
			
		<cfset variables.FILLER = arguments.FILLER />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FILLER") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TOS1.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTOS1" acess="public" output="false" returntype="any">
		<cfreturn variables.TOS1>
	</cffunction>
	
	<cffunction name="setTOS1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TOS1" required="true" type="any" />
			
		<cfset variables.TOS1 = arguments.TOS1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TOS1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TOS2.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTOS2" acess="public" output="false" returntype="any">
		<cfreturn variables.TOS2>
	</cffunction>
	
	<cffunction name="setTOS2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TOS2" required="true" type="any" />
			
		<cfset variables.TOS2 = arguments.TOS2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TOS2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TOS3.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTOS3" acess="public" output="false" returntype="any">
		<cfreturn variables.TOS3>
	</cffunction>
	
	<cffunction name="setTOS3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TOS3" required="true" type="any" />
			
		<cfset variables.TOS3 = arguments.TOS3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TOS3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TOS4.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTOS4" acess="public" output="false" returntype="any">
		<cfreturn variables.TOS4>
	</cffunction>
	
	<cffunction name="setTOS4" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TOS4" required="true" type="any" />
			
		<cfset variables.TOS4 = arguments.TOS4 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TOS4") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TOS5.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTOS5" acess="public" output="false" returntype="any">
		<cfreturn variables.TOS5>
	</cffunction>
	
	<cffunction name="setTOS5" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TOS5" required="true" type="any" />
			
		<cfset variables.TOS5 = arguments.TOS5 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TOS5") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AnestBaseUnits.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAnestBaseUnits" acess="public" output="false" returntype="any">
		<cfreturn variables.AnestBaseUnits>
	</cffunction>
	
	<cffunction name="setAnestBaseUnits" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AnestBaseUnits" required="true" type="any" />
			
		<cfset variables.AnestBaseUnits = arguments.AnestBaseUnits />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AnestBaseUnits") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CodeAddDate.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCodeAddDate" acess="public" output="false" returntype="any">
		<cfreturn variables.CodeAddDate>
	</cffunction>
	
	<cffunction name="setCodeAddDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CodeAddDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.CodeAddDate)) OR trim(arguments.CodeAddDate) EQ "">
			<cfset variables.CodeAddDate = arguments.CodeAddDate />
		<cfelse>
			<cfthrow message="CodeAddDate (#arguments.CodeAddDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CodeAddDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ActionEffDate.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActionEffDate" acess="public" output="false" returntype="any">
		<cfreturn variables.ActionEffDate>
	</cffunction>
	
	<cffunction name="setActionEffDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ActionEffDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.ActionEffDate)) OR trim(arguments.ActionEffDate) EQ "">
			<cfset variables.ActionEffDate = arguments.ActionEffDate />
		<cfelse>
			<cfthrow message="ActionEffDate (#arguments.ActionEffDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ActionEffDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TermDate.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTermDate" acess="public" output="false" returntype="any">
		<cfreturn variables.TermDate>
	</cffunction>
	
	<cffunction name="setTermDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TermDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.TermDate)) OR trim(arguments.TermDate) EQ "">
			<cfset variables.TermDate = arguments.TermDate />
		<cfelse>
			<cfthrow message="TermDate (#arguments.TermDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TermDate") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ActionCode.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActionCode" acess="public" output="false" returntype="any">
		<cfreturn variables.ActionCode>
	</cffunction>
	
	<cffunction name="setActionCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ActionCode" required="true" type="any" />
			
		<cfset variables.ActionCode = arguments.ActionCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ActionCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Filler1.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFiller1" acess="public" output="false" returntype="any">
		<cfreturn variables.Filler1>
	</cffunction>
	
	<cffunction name="setFiller1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Filler1" required="true" type="any" />
			
		<cfset variables.Filler1 = arguments.Filler1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Filler1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getRecordID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getRecordID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_MEDICARE_PROCEDURECode" output="false" access="public" returntype="query">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_PROCEDURECode = "" />		
	
		<cfquery name="qGetEOB_MEDICARE_PROCEDURECode" datasource="#trim(variables.ds)#">
	  		SELECT RecordID,HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode,DateCreated,DateModified
			FROM EOB_MEDICARE_PROCEDURECode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_MEDICARE_PROCEDURECode>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_MEDICARE_PROCEDURECodeActive" />
		
		<cfset var qCreateEOB_MEDICARE_PROCEDURECode = "" />		
		
		<cfset var localHCPC = arguments.obj.getHCPC() />
		<cfset var localSeqNum = arguments.obj.getSeqNum() />
		<cfset var localRIC = arguments.obj.getRIC() />
		<cfset var localLongDescription = arguments.obj.getLongDescription() />
		<cfset var localShortDescription = arguments.obj.getShortDescription() />
		<cfset var localPI1 = arguments.obj.getPI1() />
		<cfset var localPI2 = arguments.obj.getPI2() />
		<cfset var localPI3 = arguments.obj.getPI3() />
		<cfset var localPI4 = arguments.obj.getPI4() />
		<cfset var localMPI = arguments.obj.getMPI() />
		<cfset var localCIM1 = arguments.obj.getCIM1() />
		<cfset var localCIM2 = arguments.obj.getCIM2() />
		<cfset var localCIM3 = arguments.obj.getCIM3() />
		<cfset var localMCM1 = arguments.obj.getMCM1() />
		<cfset var localMCM2 = arguments.obj.getMCM2() />
		<cfset var localMCM3 = arguments.obj.getMCM3() />
		<cfset var localStatute = arguments.obj.getStatute() />
		<cfset var localLabCert1 = arguments.obj.getLabCert1() />
		<cfset var localLabCert2 = arguments.obj.getLabCert2() />
		<cfset var localLabCert3 = arguments.obj.getLabCert3() />
		<cfset var localLabCert4 = arguments.obj.getLabCert4() />
		<cfset var localLabCert5 = arguments.obj.getLabCert5() />
		<cfset var localLabCert6 = arguments.obj.getLabCert6() />
		<cfset var localLabCert7 = arguments.obj.getLabCert7() />
		<cfset var localLabCert8 = arguments.obj.getLabCert8() />
		<cfset var localXRef1 = arguments.obj.getXRef1() />
		<cfset var localXRef2 = arguments.obj.getXRef2() />
		<cfset var localXRef3 = arguments.obj.getXRef3() />
		<cfset var localXRef4 = arguments.obj.getXRef4() />
		<cfset var localXRef5 = arguments.obj.getXRef5() />
		<cfset var localCoverage = arguments.obj.getCoverage() />
		<cfset var localASCPayGrp = arguments.obj.getASCPayGrp() />
		<cfset var localASCPayGrpEffDate = arguments.obj.getASCPayGrpEffDate() />
		<cfset var localMOGPayGrp = arguments.obj.getMOGPayGrp() />
		<cfset var localMOGPayInd = arguments.obj.getMOGPayInd() />
		<cfset var localMOGEffDate = arguments.obj.getMOGEffDate() />
		<cfset var localProcNote = arguments.obj.getProcNote() />
		<cfset var localBETOS = arguments.obj.getBETOS() />
		<cfset var localFILLER = arguments.obj.getFILLER() />
		<cfset var localTOS1 = arguments.obj.getTOS1() />
		<cfset var localTOS2 = arguments.obj.getTOS2() />
		<cfset var localTOS3 = arguments.obj.getTOS3() />
		<cfset var localTOS4 = arguments.obj.getTOS4() />
		<cfset var localTOS5 = arguments.obj.getTOS5() />
		<cfset var localAnestBaseUnits = arguments.obj.getAnestBaseUnits() />
		<cfset var localCodeAddDate = arguments.obj.getCodeAddDate() />
		<cfset var localActionEffDate = arguments.obj.getActionEffDate() />
		<cfset var localTermDate = arguments.obj.getTermDate() />
		<cfset var localActionCode = arguments.obj.getActionCode() />
		<cfset var localFiller1 = arguments.obj.getFiller1() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_MEDICARE_PROCEDURECode" datasource="#trim(variables.ds)#">
				INSERT INTO EOB_MEDICARE_PROCEDURECode (HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,InactiveCode)
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
			read(qCreateEOB_MEDICARE_PROCEDURECode.RecordID);
			arguments.obj.setRecordID(qCreateEOB_MEDICARE_PROCEDURECode.RecordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_MEDICARE_PROCEDURECodeActive">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_PROCEDURECode = "" />		
		
		<cfset qGetEOB_MEDICARE_PROCEDURECode = getEOB_MEDICARE_PROCEDURECode(trim(RecordID)) />
				
		<cfif qGetEOB_MEDICARE_PROCEDURECode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setRecordID(qGetEOB_MEDICARE_PROCEDURECode.RecordID);
			this.setHCPC(qGetEOB_MEDICARE_PROCEDURECode.HCPC);
			this.setSeqNum(qGetEOB_MEDICARE_PROCEDURECode.SeqNum);
			this.setRIC(qGetEOB_MEDICARE_PROCEDURECode.RIC);
			this.setLongDescription(qGetEOB_MEDICARE_PROCEDURECode.LongDescription);
			this.setShortDescription(qGetEOB_MEDICARE_PROCEDURECode.ShortDescription);
			this.setPI1(qGetEOB_MEDICARE_PROCEDURECode.PI1);
			this.setPI2(qGetEOB_MEDICARE_PROCEDURECode.PI2);
			this.setPI3(qGetEOB_MEDICARE_PROCEDURECode.PI3);
			this.setPI4(qGetEOB_MEDICARE_PROCEDURECode.PI4);
			this.setMPI(qGetEOB_MEDICARE_PROCEDURECode.MPI);
			this.setCIM1(qGetEOB_MEDICARE_PROCEDURECode.CIM1);
			this.setCIM2(qGetEOB_MEDICARE_PROCEDURECode.CIM2);
			this.setCIM3(qGetEOB_MEDICARE_PROCEDURECode.CIM3);
			this.setMCM1(qGetEOB_MEDICARE_PROCEDURECode.MCM1);
			this.setMCM2(qGetEOB_MEDICARE_PROCEDURECode.MCM2);
			this.setMCM3(qGetEOB_MEDICARE_PROCEDURECode.MCM3);
			this.setStatute(qGetEOB_MEDICARE_PROCEDURECode.Statute);
			this.setLabCert1(qGetEOB_MEDICARE_PROCEDURECode.LabCert1);
			this.setLabCert2(qGetEOB_MEDICARE_PROCEDURECode.LabCert2);
			this.setLabCert3(qGetEOB_MEDICARE_PROCEDURECode.LabCert3);
			this.setLabCert4(qGetEOB_MEDICARE_PROCEDURECode.LabCert4);
			this.setLabCert5(qGetEOB_MEDICARE_PROCEDURECode.LabCert5);
			this.setLabCert6(qGetEOB_MEDICARE_PROCEDURECode.LabCert6);
			this.setLabCert7(qGetEOB_MEDICARE_PROCEDURECode.LabCert7);
			this.setLabCert8(qGetEOB_MEDICARE_PROCEDURECode.LabCert8);
			this.setXRef1(qGetEOB_MEDICARE_PROCEDURECode.XRef1);
			this.setXRef2(qGetEOB_MEDICARE_PROCEDURECode.XRef2);
			this.setXRef3(qGetEOB_MEDICARE_PROCEDURECode.XRef3);
			this.setXRef4(qGetEOB_MEDICARE_PROCEDURECode.XRef4);
			this.setXRef5(qGetEOB_MEDICARE_PROCEDURECode.XRef5);
			this.setCoverage(qGetEOB_MEDICARE_PROCEDURECode.Coverage);
			this.setASCPayGrp(qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrp);
			this.setASCPayGrpEffDate(qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrpEffDate);
			this.setMOGPayGrp(qGetEOB_MEDICARE_PROCEDURECode.MOGPayGrp);
			this.setMOGPayInd(qGetEOB_MEDICARE_PROCEDURECode.MOGPayInd);
			this.setMOGEffDate(qGetEOB_MEDICARE_PROCEDURECode.MOGEffDate);
			this.setProcNote(qGetEOB_MEDICARE_PROCEDURECode.ProcNote);
			this.setBETOS(qGetEOB_MEDICARE_PROCEDURECode.BETOS);
			this.setFILLER(qGetEOB_MEDICARE_PROCEDURECode.FILLER);
			this.setTOS1(qGetEOB_MEDICARE_PROCEDURECode.TOS1);
			this.setTOS2(qGetEOB_MEDICARE_PROCEDURECode.TOS2);
			this.setTOS3(qGetEOB_MEDICARE_PROCEDURECode.TOS3);
			this.setTOS4(qGetEOB_MEDICARE_PROCEDURECode.TOS4);
			this.setTOS5(qGetEOB_MEDICARE_PROCEDURECode.TOS5);
			this.setAnestBaseUnits(qGetEOB_MEDICARE_PROCEDURECode.AnestBaseUnits);
			this.setCodeAddDate(qGetEOB_MEDICARE_PROCEDURECode.CodeAddDate);
			this.setActionEffDate(qGetEOB_MEDICARE_PROCEDURECode.ActionEffDate);
			this.setTermDate(qGetEOB_MEDICARE_PROCEDURECode.TermDate);
			this.setActionCode(qGetEOB_MEDICARE_PROCEDURECode.ActionCode);
			this.setFiller1(qGetEOB_MEDICARE_PROCEDURECode.Filler1);
			this.setActive(qGetEOB_MEDICARE_PROCEDURECode.Active);
			this.setInactiveCode(qGetEOB_MEDICARE_PROCEDURECode.InactiveCode);
			this.setDateCreated(qGetEOB_MEDICARE_PROCEDURECode.DateCreated);
			this.setDateModified(qGetEOB_MEDICARE_PROCEDURECode.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_MEDICARE_PROCEDURECodeActive" />
		<cfset var qUpdateEOB_MEDICARE_PROCEDURECode = "" />
		<cfset var localHCPC = arguments.obj.getHCPC() />
		<cfset var localSeqNum = arguments.obj.getSeqNum() />
		<cfset var localRIC = arguments.obj.getRIC() />
		<cfset var localLongDescription = arguments.obj.getLongDescription() />
		<cfset var localShortDescription = arguments.obj.getShortDescription() />
		<cfset var localPI1 = arguments.obj.getPI1() />
		<cfset var localPI2 = arguments.obj.getPI2() />
		<cfset var localPI3 = arguments.obj.getPI3() />
		<cfset var localPI4 = arguments.obj.getPI4() />
		<cfset var localMPI = arguments.obj.getMPI() />
		<cfset var localCIM1 = arguments.obj.getCIM1() />
		<cfset var localCIM2 = arguments.obj.getCIM2() />
		<cfset var localCIM3 = arguments.obj.getCIM3() />
		<cfset var localMCM1 = arguments.obj.getMCM1() />
		<cfset var localMCM2 = arguments.obj.getMCM2() />
		<cfset var localMCM3 = arguments.obj.getMCM3() />
		<cfset var localStatute = arguments.obj.getStatute() />
		<cfset var localLabCert1 = arguments.obj.getLabCert1() />
		<cfset var localLabCert2 = arguments.obj.getLabCert2() />
		<cfset var localLabCert3 = arguments.obj.getLabCert3() />
		<cfset var localLabCert4 = arguments.obj.getLabCert4() />
		<cfset var localLabCert5 = arguments.obj.getLabCert5() />
		<cfset var localLabCert6 = arguments.obj.getLabCert6() />
		<cfset var localLabCert7 = arguments.obj.getLabCert7() />
		<cfset var localLabCert8 = arguments.obj.getLabCert8() />
		<cfset var localXRef1 = arguments.obj.getXRef1() />
		<cfset var localXRef2 = arguments.obj.getXRef2() />
		<cfset var localXRef3 = arguments.obj.getXRef3() />
		<cfset var localXRef4 = arguments.obj.getXRef4() />
		<cfset var localXRef5 = arguments.obj.getXRef5() />
		<cfset var localCoverage = arguments.obj.getCoverage() />
		<cfset var localASCPayGrp = arguments.obj.getASCPayGrp() />
		<cfset var localASCPayGrpEffDate = arguments.obj.getASCPayGrpEffDate() />
		<cfset var localMOGPayGrp = arguments.obj.getMOGPayGrp() />
		<cfset var localMOGPayInd = arguments.obj.getMOGPayInd() />
		<cfset var localMOGEffDate = arguments.obj.getMOGEffDate() />
		<cfset var localProcNote = arguments.obj.getProcNote() />
		<cfset var localBETOS = arguments.obj.getBETOS() />
		<cfset var localFILLER = arguments.obj.getFILLER() />
		<cfset var localTOS1 = arguments.obj.getTOS1() />
		<cfset var localTOS2 = arguments.obj.getTOS2() />
		<cfset var localTOS3 = arguments.obj.getTOS3() />
		<cfset var localTOS4 = arguments.obj.getTOS4() />
		<cfset var localTOS5 = arguments.obj.getTOS5() />
		<cfset var localAnestBaseUnits = arguments.obj.getAnestBaseUnits() />
		<cfset var localCodeAddDate = arguments.obj.getCodeAddDate() />
		<cfset var localActionEffDate = arguments.obj.getActionEffDate() />
		<cfset var localTermDate = arguments.obj.getTermDate() />
		<cfset var localActionCode = arguments.obj.getActionCode() />
		<cfset var localFiller1 = arguments.obj.getFiller1() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_MEDICARE_PROCEDURECode" datasource="#trim(variables.ds)#">
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.obj.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EOB_MEDICARE_PROCEDURECodeActive" />
		<cfset var qDeleteEOB_MEDICARE_PROCEDURECode = "">

		<cfquery name="qDeleteEOB_MEDICARE_PROCEDURECode" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM EOB_MEDICARE_PROCEDURECode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getRecordID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


