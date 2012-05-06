 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleBean" />
		
		<cfset var qCreateEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = "" />		
		
		<cfset var localHCPCRecordID = arguments.bean.getHCPCRecordID() />
		<cfset var localCategoryID = arguments.bean.getCategoryID() />
		<cfset var localMOD1 = arguments.bean.getMOD1() />
		<cfset var localMOD2 = arguments.bean.getMOD2() />
		<cfset var localMOD3 = arguments.bean.getMOD3() />
		<cfset var localMOD4 = arguments.bean.getMOD4() />
		<cfset var localCeiling = arguments.bean.getCeiling() />
		<cfset var localFloor = arguments.bean.getFloor() />
		<cfset var localFee_AL_16 = arguments.bean.getFee_AL_16() />
		<cfset var localFee_AK_17 = arguments.bean.getFee_AK_17() />
		<cfset var localFee_AZ_18 = arguments.bean.getFee_AZ_18() />
		<cfset var localFee_AR_19 = arguments.bean.getFee_AR_19() />
		<cfset var localFee_CA_20 = arguments.bean.getFee_CA_20() />
		<cfset var localFee_CO_21 = arguments.bean.getFee_CO_21() />
		<cfset var localFee_CT_22 = arguments.bean.getFee_CT_22() />
		<cfset var localFee_DE_23 = arguments.bean.getFee_DE_23() />
		<cfset var localFee_DC_24 = arguments.bean.getFee_DC_24() />
		<cfset var localFee_FL_25 = arguments.bean.getFee_FL_25() />
		<cfset var localFee_GA_26 = arguments.bean.getFee_GA_26() />
		<cfset var localFee_HI_27 = arguments.bean.getFee_HI_27() />
		<cfset var localFee_ID_28 = arguments.bean.getFee_ID_28() />
		<cfset var localFee_IL_29 = arguments.bean.getFee_IL_29() />
		<cfset var localFee_IN_30 = arguments.bean.getFee_IN_30() />
		<cfset var localFee_IA_31 = arguments.bean.getFee_IA_31() />
		<cfset var localFee_KS_32 = arguments.bean.getFee_KS_32() />
		<cfset var localFee_KY_33 = arguments.bean.getFee_KY_33() />
		<cfset var localFee_LA_34 = arguments.bean.getFee_LA_34() />
		<cfset var localFee_ME_35 = arguments.bean.getFee_ME_35() />
		<cfset var localFee_MD_36 = arguments.bean.getFee_MD_36() />
		<cfset var localFee_MA_37 = arguments.bean.getFee_MA_37() />
		<cfset var localFee_MI_38 = arguments.bean.getFee_MI_38() />
		<cfset var localFee_MN_39 = arguments.bean.getFee_MN_39() />
		<cfset var localFee_MS_40 = arguments.bean.getFee_MS_40() />
		<cfset var localFee_MO_41 = arguments.bean.getFee_MO_41() />
		<cfset var localFee_MT_42 = arguments.bean.getFee_MT_42() />
		<cfset var localFee_NE_43 = arguments.bean.getFee_NE_43() />
		<cfset var localFee_NV_44 = arguments.bean.getFee_NV_44() />
		<cfset var localFee_NE_45 = arguments.bean.getFee_NE_45() />
		<cfset var localFee_NJ_46 = arguments.bean.getFee_NJ_46() />
		<cfset var localFee_NM_47 = arguments.bean.getFee_NM_47() />
		<cfset var localFee_NY_48 = arguments.bean.getFee_NY_48() />
		<cfset var localFee_NC_49 = arguments.bean.getFee_NC_49() />
		<cfset var localFee_ND_50 = arguments.bean.getFee_ND_50() />
		<cfset var localFee_OH_51 = arguments.bean.getFee_OH_51() />
		<cfset var localFee_OK_52 = arguments.bean.getFee_OK_52() />
		<cfset var localFee_OR_53 = arguments.bean.getFee_OR_53() />
		<cfset var localFee_PA_54 = arguments.bean.getFee_PA_54() />
		<cfset var localFee_RI_55 = arguments.bean.getFee_RI_55() />
		<cfset var localFee_SC_56 = arguments.bean.getFee_SC_56() />
		<cfset var localFee_SD_57 = arguments.bean.getFee_SD_57() />
		<cfset var localFee_TN_58 = arguments.bean.getFee_TN_58() />
		<cfset var localFee_TX_59 = arguments.bean.getFee_TX_59() />
		<cfset var localFee_UT_60 = arguments.bean.getFee_UT_60() />
		<cfset var localFee_VT_61 = arguments.bean.getFee_VT_61() />
		<cfset var localFee_VA_62 = arguments.bean.getFee_VA_62() />
		<cfset var localFee_WA_63 = arguments.bean.getFee_WA_63() />
		<cfset var localFee_WV_64 = arguments.bean.getFee_WV_64() />
		<cfset var localFee_WI_65 = arguments.bean.getFee_WI_65() />
		<cfset var localFee_WY_66 = arguments.bean.getFee_WY_66() />
		<cfset var localFee_PR_229 = arguments.bean.getFee_PR_229() />
		<cfset var localFee_VI_238 = arguments.bean.getFee_VI_238() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" datasource="#trim(arguments.ds)#">
				INSERT INTO EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule (HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localHCPCRecordID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localCategoryID))>						
						<cfqueryparam value="#trim(localCategoryID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMOD1))>						
						<cfqueryparam value="#trim(localMOD1)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMOD2))>						
						<cfqueryparam value="#trim(localMOD2)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMOD3))>						
						<cfqueryparam value="#trim(localMOD3)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localMOD4))>						
						<cfqueryparam value="#trim(localMOD4)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localCeiling))>						
						<cfqueryparam value="#trim(localCeiling)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFloor))>						
						<cfqueryparam value="#trim(localFloor)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_AL_16))>						
						<cfqueryparam value="#trim(localFee_AL_16)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_AK_17))>						
						<cfqueryparam value="#trim(localFee_AK_17)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_AZ_18))>						
						<cfqueryparam value="#trim(localFee_AZ_18)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_AR_19))>						
						<cfqueryparam value="#trim(localFee_AR_19)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_CA_20))>						
						<cfqueryparam value="#trim(localFee_CA_20)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_CO_21))>						
						<cfqueryparam value="#trim(localFee_CO_21)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_CT_22))>						
						<cfqueryparam value="#trim(localFee_CT_22)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_DE_23))>						
						<cfqueryparam value="#trim(localFee_DE_23)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_DC_24))>						
						<cfqueryparam value="#trim(localFee_DC_24)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_FL_25))>						
						<cfqueryparam value="#trim(localFee_FL_25)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_GA_26))>						
						<cfqueryparam value="#trim(localFee_GA_26)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_HI_27))>						
						<cfqueryparam value="#trim(localFee_HI_27)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_ID_28))>						
						<cfqueryparam value="#trim(localFee_ID_28)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_IL_29))>						
						<cfqueryparam value="#trim(localFee_IL_29)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_IN_30))>						
						<cfqueryparam value="#trim(localFee_IN_30)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_IA_31))>						
						<cfqueryparam value="#trim(localFee_IA_31)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_KS_32))>						
						<cfqueryparam value="#trim(localFee_KS_32)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_KY_33))>						
						<cfqueryparam value="#trim(localFee_KY_33)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_LA_34))>						
						<cfqueryparam value="#trim(localFee_LA_34)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_ME_35))>						
						<cfqueryparam value="#trim(localFee_ME_35)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_MD_36))>						
						<cfqueryparam value="#trim(localFee_MD_36)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_MA_37))>						
						<cfqueryparam value="#trim(localFee_MA_37)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_MI_38))>						
						<cfqueryparam value="#trim(localFee_MI_38)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_MN_39))>						
						<cfqueryparam value="#trim(localFee_MN_39)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_MS_40))>						
						<cfqueryparam value="#trim(localFee_MS_40)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_MO_41))>						
						<cfqueryparam value="#trim(localFee_MO_41)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_MT_42))>						
						<cfqueryparam value="#trim(localFee_MT_42)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_NE_43))>						
						<cfqueryparam value="#trim(localFee_NE_43)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_NV_44))>						
						<cfqueryparam value="#trim(localFee_NV_44)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_NE_45))>						
						<cfqueryparam value="#trim(localFee_NE_45)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_NJ_46))>						
						<cfqueryparam value="#trim(localFee_NJ_46)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_NM_47))>						
						<cfqueryparam value="#trim(localFee_NM_47)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_NY_48))>						
						<cfqueryparam value="#trim(localFee_NY_48)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_NC_49))>						
						<cfqueryparam value="#trim(localFee_NC_49)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_ND_50))>						
						<cfqueryparam value="#trim(localFee_ND_50)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_OH_51))>						
						<cfqueryparam value="#trim(localFee_OH_51)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_OK_52))>						
						<cfqueryparam value="#trim(localFee_OK_52)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_OR_53))>						
						<cfqueryparam value="#trim(localFee_OR_53)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_PA_54))>						
						<cfqueryparam value="#trim(localFee_PA_54)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_RI_55))>						
						<cfqueryparam value="#trim(localFee_RI_55)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_SC_56))>						
						<cfqueryparam value="#trim(localFee_SC_56)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_SD_57))>						
						<cfqueryparam value="#trim(localFee_SD_57)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_TN_58))>						
						<cfqueryparam value="#trim(localFee_TN_58)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_TX_59))>						
						<cfqueryparam value="#trim(localFee_TX_59)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_UT_60))>						
						<cfqueryparam value="#trim(localFee_UT_60)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_VT_61))>						
						<cfqueryparam value="#trim(localFee_VT_61)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_VA_62))>						
						<cfqueryparam value="#trim(localFee_VA_62)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_WA_63))>						
						<cfqueryparam value="#trim(localFee_WA_63)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_WV_64))>						
						<cfqueryparam value="#trim(localFee_WV_64)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_WI_65))>						
						<cfqueryparam value="#trim(localFee_WI_65)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_WY_66))>						
						<cfqueryparam value="#trim(localFee_WY_66)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_PR_229))>						
						<cfqueryparam value="#trim(localFee_PR_229)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localFee_VI_238))>						
						<cfqueryparam value="#trim(localFee_VI_238)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
			arguments.bean.setRecordID(qCreateEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = "" />		
		
		<cfset qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = getEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule(trim(arguments.ds), trim(EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleID)) />
				
		<cfif qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = createObject("component", "EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleBean").init(arguments.ds);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setRecordID(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.RecordID);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setHCPCRecordID(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.HCPCRecordID);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setCategoryID(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.CategoryID);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setMOD1(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD1);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setMOD2(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD2);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setMOD3(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD3);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setMOD4(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD4);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setCeiling(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Ceiling);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFloor(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Floor);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_AL_16(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AL_16);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_AK_17(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AK_17);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_AZ_18(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AZ_18);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_AR_19(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AR_19);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_CA_20(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CA_20);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_CO_21(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CO_21);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_CT_22(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CT_22);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_DE_23(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DE_23);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_DC_24(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DC_24);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_FL_25(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_FL_25);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_GA_26(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_GA_26);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_HI_27(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_HI_27);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_ID_28(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ID_28);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_IL_29(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IL_29);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_IN_30(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IN_30);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_IA_31(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IA_31);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_KS_32(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KS_32);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_KY_33(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KY_33);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_LA_34(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_LA_34);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_ME_35(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ME_35);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_MD_36(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MD_36);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_MA_37(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MA_37);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_MI_38(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MI_38);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_MN_39(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MN_39);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_MS_40(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MS_40);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_MO_41(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MO_41);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_MT_42(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MT_42);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_NE_43(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_43);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_NV_44(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NV_44);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_NE_45(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_45);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_NJ_46(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NJ_46);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_NM_47(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NM_47);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_NY_48(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NY_48);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_NC_49(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NC_49);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_ND_50(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ND_50);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_OH_51(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OH_51);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_OK_52(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OK_52);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_OR_53(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OR_53);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_PA_54(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PA_54);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_RI_55(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_RI_55);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_SC_56(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SC_56);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_SD_57(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SD_57);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_TN_58(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TN_58);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_TX_59(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TX_59);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_UT_60(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_UT_60);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_VT_61(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VT_61);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_VA_62(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VA_62);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_WA_63(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WA_63);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_WV_64(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WV_64);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_WI_65(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WI_65);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_WY_66(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WY_66);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_PR_229(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PR_229);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setFee_VI_238(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VI_238);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setActive(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Active);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setInactiveCode(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.InactiveCode);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setDateCreated(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.DateCreated);
			objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.setDateModified(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.DateModified);				
			return objEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleBean" />
		<cfset var qUpdateEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = "" />
		<cfset var localHCPCRecordID = arguments.bean.getHCPCRecordID() />
		<cfset var localCategoryID = arguments.bean.getCategoryID() />
		<cfset var localMOD1 = arguments.bean.getMOD1() />
		<cfset var localMOD2 = arguments.bean.getMOD2() />
		<cfset var localMOD3 = arguments.bean.getMOD3() />
		<cfset var localMOD4 = arguments.bean.getMOD4() />
		<cfset var localCeiling = arguments.bean.getCeiling() />
		<cfset var localFloor = arguments.bean.getFloor() />
		<cfset var localFee_AL_16 = arguments.bean.getFee_AL_16() />
		<cfset var localFee_AK_17 = arguments.bean.getFee_AK_17() />
		<cfset var localFee_AZ_18 = arguments.bean.getFee_AZ_18() />
		<cfset var localFee_AR_19 = arguments.bean.getFee_AR_19() />
		<cfset var localFee_CA_20 = arguments.bean.getFee_CA_20() />
		<cfset var localFee_CO_21 = arguments.bean.getFee_CO_21() />
		<cfset var localFee_CT_22 = arguments.bean.getFee_CT_22() />
		<cfset var localFee_DE_23 = arguments.bean.getFee_DE_23() />
		<cfset var localFee_DC_24 = arguments.bean.getFee_DC_24() />
		<cfset var localFee_FL_25 = arguments.bean.getFee_FL_25() />
		<cfset var localFee_GA_26 = arguments.bean.getFee_GA_26() />
		<cfset var localFee_HI_27 = arguments.bean.getFee_HI_27() />
		<cfset var localFee_ID_28 = arguments.bean.getFee_ID_28() />
		<cfset var localFee_IL_29 = arguments.bean.getFee_IL_29() />
		<cfset var localFee_IN_30 = arguments.bean.getFee_IN_30() />
		<cfset var localFee_IA_31 = arguments.bean.getFee_IA_31() />
		<cfset var localFee_KS_32 = arguments.bean.getFee_KS_32() />
		<cfset var localFee_KY_33 = arguments.bean.getFee_KY_33() />
		<cfset var localFee_LA_34 = arguments.bean.getFee_LA_34() />
		<cfset var localFee_ME_35 = arguments.bean.getFee_ME_35() />
		<cfset var localFee_MD_36 = arguments.bean.getFee_MD_36() />
		<cfset var localFee_MA_37 = arguments.bean.getFee_MA_37() />
		<cfset var localFee_MI_38 = arguments.bean.getFee_MI_38() />
		<cfset var localFee_MN_39 = arguments.bean.getFee_MN_39() />
		<cfset var localFee_MS_40 = arguments.bean.getFee_MS_40() />
		<cfset var localFee_MO_41 = arguments.bean.getFee_MO_41() />
		<cfset var localFee_MT_42 = arguments.bean.getFee_MT_42() />
		<cfset var localFee_NE_43 = arguments.bean.getFee_NE_43() />
		<cfset var localFee_NV_44 = arguments.bean.getFee_NV_44() />
		<cfset var localFee_NE_45 = arguments.bean.getFee_NE_45() />
		<cfset var localFee_NJ_46 = arguments.bean.getFee_NJ_46() />
		<cfset var localFee_NM_47 = arguments.bean.getFee_NM_47() />
		<cfset var localFee_NY_48 = arguments.bean.getFee_NY_48() />
		<cfset var localFee_NC_49 = arguments.bean.getFee_NC_49() />
		<cfset var localFee_ND_50 = arguments.bean.getFee_ND_50() />
		<cfset var localFee_OH_51 = arguments.bean.getFee_OH_51() />
		<cfset var localFee_OK_52 = arguments.bean.getFee_OK_52() />
		<cfset var localFee_OR_53 = arguments.bean.getFee_OR_53() />
		<cfset var localFee_PA_54 = arguments.bean.getFee_PA_54() />
		<cfset var localFee_RI_55 = arguments.bean.getFee_RI_55() />
		<cfset var localFee_SC_56 = arguments.bean.getFee_SC_56() />
		<cfset var localFee_SD_57 = arguments.bean.getFee_SD_57() />
		<cfset var localFee_TN_58 = arguments.bean.getFee_TN_58() />
		<cfset var localFee_TX_59 = arguments.bean.getFee_TX_59() />
		<cfset var localFee_UT_60 = arguments.bean.getFee_UT_60() />
		<cfset var localFee_VT_61 = arguments.bean.getFee_VT_61() />
		<cfset var localFee_VA_62 = arguments.bean.getFee_VA_62() />
		<cfset var localFee_WA_63 = arguments.bean.getFee_WA_63() />
		<cfset var localFee_WV_64 = arguments.bean.getFee_WV_64() />
		<cfset var localFee_WI_65 = arguments.bean.getFee_WI_65() />
		<cfset var localFee_WY_66 = arguments.bean.getFee_WY_66() />
		<cfset var localFee_PR_229 = arguments.bean.getFee_PR_229() />
		<cfset var localFee_VI_238 = arguments.bean.getFee_VI_238() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" datasource="#trim(arguments.ds)#">
				UPDATE EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule  SET
					
					HCPCRecordID =						
						<cfqueryparam value="#trim(localHCPCRecordID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					CategoryID =				
					<cfif IsNumeric(trim(localCategoryID))>						
						<cfqueryparam value="#trim(localCategoryID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MOD1 =				
					<cfif IsNumeric(trim(localMOD1))>						
						<cfqueryparam value="#trim(localMOD1)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MOD2 =				
					<cfif IsNumeric(trim(localMOD2))>						
						<cfqueryparam value="#trim(localMOD2)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MOD3 =				
					<cfif IsNumeric(trim(localMOD3))>						
						<cfqueryparam value="#trim(localMOD3)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					MOD4 =				
					<cfif IsNumeric(trim(localMOD4))>						
						<cfqueryparam value="#trim(localMOD4)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Ceiling =				
					<cfif IsNumeric(trim(localCeiling))>						
						<cfqueryparam value="#trim(localCeiling)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Floor =				
					<cfif IsNumeric(trim(localFloor))>						
						<cfqueryparam value="#trim(localFloor)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_AL_16 =				
					<cfif IsNumeric(trim(localFee_AL_16))>						
						<cfqueryparam value="#trim(localFee_AL_16)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_AK_17 =				
					<cfif IsNumeric(trim(localFee_AK_17))>						
						<cfqueryparam value="#trim(localFee_AK_17)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_AZ_18 =				
					<cfif IsNumeric(trim(localFee_AZ_18))>						
						<cfqueryparam value="#trim(localFee_AZ_18)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_AR_19 =				
					<cfif IsNumeric(trim(localFee_AR_19))>						
						<cfqueryparam value="#trim(localFee_AR_19)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_CA_20 =				
					<cfif IsNumeric(trim(localFee_CA_20))>						
						<cfqueryparam value="#trim(localFee_CA_20)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_CO_21 =				
					<cfif IsNumeric(trim(localFee_CO_21))>						
						<cfqueryparam value="#trim(localFee_CO_21)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_CT_22 =				
					<cfif IsNumeric(trim(localFee_CT_22))>						
						<cfqueryparam value="#trim(localFee_CT_22)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_DE_23 =				
					<cfif IsNumeric(trim(localFee_DE_23))>						
						<cfqueryparam value="#trim(localFee_DE_23)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_DC_24 =				
					<cfif IsNumeric(trim(localFee_DC_24))>						
						<cfqueryparam value="#trim(localFee_DC_24)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_FL_25 =				
					<cfif IsNumeric(trim(localFee_FL_25))>						
						<cfqueryparam value="#trim(localFee_FL_25)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_GA_26 =				
					<cfif IsNumeric(trim(localFee_GA_26))>						
						<cfqueryparam value="#trim(localFee_GA_26)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_HI_27 =				
					<cfif IsNumeric(trim(localFee_HI_27))>						
						<cfqueryparam value="#trim(localFee_HI_27)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_ID_28 =				
					<cfif IsNumeric(trim(localFee_ID_28))>						
						<cfqueryparam value="#trim(localFee_ID_28)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_IL_29 =				
					<cfif IsNumeric(trim(localFee_IL_29))>						
						<cfqueryparam value="#trim(localFee_IL_29)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_IN_30 =				
					<cfif IsNumeric(trim(localFee_IN_30))>						
						<cfqueryparam value="#trim(localFee_IN_30)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_IA_31 =				
					<cfif IsNumeric(trim(localFee_IA_31))>						
						<cfqueryparam value="#trim(localFee_IA_31)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_KS_32 =				
					<cfif IsNumeric(trim(localFee_KS_32))>						
						<cfqueryparam value="#trim(localFee_KS_32)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_KY_33 =				
					<cfif IsNumeric(trim(localFee_KY_33))>						
						<cfqueryparam value="#trim(localFee_KY_33)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_LA_34 =				
					<cfif IsNumeric(trim(localFee_LA_34))>						
						<cfqueryparam value="#trim(localFee_LA_34)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_ME_35 =				
					<cfif IsNumeric(trim(localFee_ME_35))>						
						<cfqueryparam value="#trim(localFee_ME_35)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_MD_36 =				
					<cfif IsNumeric(trim(localFee_MD_36))>						
						<cfqueryparam value="#trim(localFee_MD_36)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_MA_37 =				
					<cfif IsNumeric(trim(localFee_MA_37))>						
						<cfqueryparam value="#trim(localFee_MA_37)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_MI_38 =				
					<cfif IsNumeric(trim(localFee_MI_38))>						
						<cfqueryparam value="#trim(localFee_MI_38)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_MN_39 =				
					<cfif IsNumeric(trim(localFee_MN_39))>						
						<cfqueryparam value="#trim(localFee_MN_39)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_MS_40 =				
					<cfif IsNumeric(trim(localFee_MS_40))>						
						<cfqueryparam value="#trim(localFee_MS_40)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_MO_41 =				
					<cfif IsNumeric(trim(localFee_MO_41))>						
						<cfqueryparam value="#trim(localFee_MO_41)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_MT_42 =				
					<cfif IsNumeric(trim(localFee_MT_42))>						
						<cfqueryparam value="#trim(localFee_MT_42)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_NE_43 =				
					<cfif IsNumeric(trim(localFee_NE_43))>						
						<cfqueryparam value="#trim(localFee_NE_43)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_NV_44 =				
					<cfif IsNumeric(trim(localFee_NV_44))>						
						<cfqueryparam value="#trim(localFee_NV_44)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_NE_45 =				
					<cfif IsNumeric(trim(localFee_NE_45))>						
						<cfqueryparam value="#trim(localFee_NE_45)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_NJ_46 =				
					<cfif IsNumeric(trim(localFee_NJ_46))>						
						<cfqueryparam value="#trim(localFee_NJ_46)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_NM_47 =				
					<cfif IsNumeric(trim(localFee_NM_47))>						
						<cfqueryparam value="#trim(localFee_NM_47)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_NY_48 =				
					<cfif IsNumeric(trim(localFee_NY_48))>						
						<cfqueryparam value="#trim(localFee_NY_48)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_NC_49 =				
					<cfif IsNumeric(trim(localFee_NC_49))>						
						<cfqueryparam value="#trim(localFee_NC_49)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_ND_50 =				
					<cfif IsNumeric(trim(localFee_ND_50))>						
						<cfqueryparam value="#trim(localFee_ND_50)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_OH_51 =				
					<cfif IsNumeric(trim(localFee_OH_51))>						
						<cfqueryparam value="#trim(localFee_OH_51)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_OK_52 =				
					<cfif IsNumeric(trim(localFee_OK_52))>						
						<cfqueryparam value="#trim(localFee_OK_52)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_OR_53 =				
					<cfif IsNumeric(trim(localFee_OR_53))>						
						<cfqueryparam value="#trim(localFee_OR_53)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_PA_54 =				
					<cfif IsNumeric(trim(localFee_PA_54))>						
						<cfqueryparam value="#trim(localFee_PA_54)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_RI_55 =				
					<cfif IsNumeric(trim(localFee_RI_55))>						
						<cfqueryparam value="#trim(localFee_RI_55)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_SC_56 =				
					<cfif IsNumeric(trim(localFee_SC_56))>						
						<cfqueryparam value="#trim(localFee_SC_56)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_SD_57 =				
					<cfif IsNumeric(trim(localFee_SD_57))>						
						<cfqueryparam value="#trim(localFee_SD_57)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_TN_58 =				
					<cfif IsNumeric(trim(localFee_TN_58))>						
						<cfqueryparam value="#trim(localFee_TN_58)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_TX_59 =				
					<cfif IsNumeric(trim(localFee_TX_59))>						
						<cfqueryparam value="#trim(localFee_TX_59)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_UT_60 =				
					<cfif IsNumeric(trim(localFee_UT_60))>						
						<cfqueryparam value="#trim(localFee_UT_60)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_VT_61 =				
					<cfif IsNumeric(trim(localFee_VT_61))>						
						<cfqueryparam value="#trim(localFee_VT_61)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_VA_62 =				
					<cfif IsNumeric(trim(localFee_VA_62))>						
						<cfqueryparam value="#trim(localFee_VA_62)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_WA_63 =				
					<cfif IsNumeric(trim(localFee_WA_63))>						
						<cfqueryparam value="#trim(localFee_WA_63)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_WV_64 =				
					<cfif IsNumeric(trim(localFee_WV_64))>						
						<cfqueryparam value="#trim(localFee_WV_64)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_WI_65 =				
					<cfif IsNumeric(trim(localFee_WI_65))>						
						<cfqueryparam value="#trim(localFee_WI_65)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_WY_66 =				
					<cfif IsNumeric(trim(localFee_WY_66))>						
						<cfqueryparam value="#trim(localFee_WY_66)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_PR_229 =				
					<cfif IsNumeric(trim(localFee_PR_229))>						
						<cfqueryparam value="#trim(localFee_PR_229)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Fee_VI_238 =				
					<cfif IsNumeric(trim(localFee_VI_238))>						
						<cfqueryparam value="#trim(localFee_VI_238)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
		<cfargument name="bean" required="true" type="EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleBean" />
		<cfset var qDeleteEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = "">

		<cfquery name="qDeleteEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = "" />		
	
		<cfquery name="qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode,DateCreated,DateModified
			FROM EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


