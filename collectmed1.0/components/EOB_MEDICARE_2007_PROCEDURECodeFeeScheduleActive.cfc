 	


<cfcomponent name="eob_medicare_2007_procedurecodefeescheduleActive" output="false" alias="eob_medicare_2007_procedurecodefeescheduleActive">

	<cfproperty name="RecordID" type="numeric" default="0" />
	<cfproperty name="HCPCRecordID" type="numeric" default="" />
	<cfproperty name="CategoryID" type="numeric" default="" />
	<cfproperty name="MOD1" type="numeric" default="" />
	<cfproperty name="MOD2" type="numeric" default="" />
	<cfproperty name="MOD3" type="numeric" default="" />
	<cfproperty name="MOD4" type="numeric" default="" />
	<cfproperty name="Ceiling" type="numeric" default="" />
	<cfproperty name="Floor" type="numeric" default="" />
	<cfproperty name="Fee_AL_16" type="numeric" default="" />
	<cfproperty name="Fee_AK_17" type="numeric" default="" />
	<cfproperty name="Fee_AZ_18" type="numeric" default="" />
	<cfproperty name="Fee_AR_19" type="numeric" default="" />
	<cfproperty name="Fee_CA_20" type="numeric" default="" />
	<cfproperty name="Fee_CO_21" type="numeric" default="" />
	<cfproperty name="Fee_CT_22" type="numeric" default="" />
	<cfproperty name="Fee_DE_23" type="numeric" default="" />
	<cfproperty name="Fee_DC_24" type="numeric" default="" />
	<cfproperty name="Fee_FL_25" type="numeric" default="" />
	<cfproperty name="Fee_GA_26" type="numeric" default="" />
	<cfproperty name="Fee_HI_27" type="numeric" default="" />
	<cfproperty name="Fee_ID_28" type="numeric" default="" />
	<cfproperty name="Fee_IL_29" type="numeric" default="" />
	<cfproperty name="Fee_IN_30" type="numeric" default="" />
	<cfproperty name="Fee_IA_31" type="numeric" default="" />
	<cfproperty name="Fee_KS_32" type="numeric" default="" />
	<cfproperty name="Fee_KY_33" type="numeric" default="" />
	<cfproperty name="Fee_LA_34" type="numeric" default="" />
	<cfproperty name="Fee_ME_35" type="numeric" default="" />
	<cfproperty name="Fee_MD_36" type="numeric" default="" />
	<cfproperty name="Fee_MA_37" type="numeric" default="" />
	<cfproperty name="Fee_MI_38" type="numeric" default="" />
	<cfproperty name="Fee_MN_39" type="numeric" default="" />
	<cfproperty name="Fee_MS_40" type="numeric" default="" />
	<cfproperty name="Fee_MO_41" type="numeric" default="" />
	<cfproperty name="Fee_MT_42" type="numeric" default="" />
	<cfproperty name="Fee_NE_43" type="numeric" default="" />
	<cfproperty name="Fee_NV_44" type="numeric" default="" />
	<cfproperty name="Fee_NE_45" type="numeric" default="" />
	<cfproperty name="Fee_NJ_46" type="numeric" default="" />
	<cfproperty name="Fee_NM_47" type="numeric" default="" />
	<cfproperty name="Fee_NY_48" type="numeric" default="" />
	<cfproperty name="Fee_NC_49" type="numeric" default="" />
	<cfproperty name="Fee_ND_50" type="numeric" default="" />
	<cfproperty name="Fee_OH_51" type="numeric" default="" />
	<cfproperty name="Fee_OK_52" type="numeric" default="" />
	<cfproperty name="Fee_OR_53" type="numeric" default="" />
	<cfproperty name="Fee_PA_54" type="numeric" default="" />
	<cfproperty name="Fee_RI_55" type="numeric" default="" />
	<cfproperty name="Fee_SC_56" type="numeric" default="" />
	<cfproperty name="Fee_SD_57" type="numeric" default="" />
	<cfproperty name="Fee_TN_58" type="numeric" default="" />
	<cfproperty name="Fee_TX_59" type="numeric" default="" />
	<cfproperty name="Fee_UT_60" type="numeric" default="" />
	<cfproperty name="Fee_VT_61" type="numeric" default="" />
	<cfproperty name="Fee_VA_62" type="numeric" default="" />
	<cfproperty name="Fee_WA_63" type="numeric" default="" />
	<cfproperty name="Fee_WV_64" type="numeric" default="" />
	<cfproperty name="Fee_WI_65" type="numeric" default="" />
	<cfproperty name="Fee_WY_66" type="numeric" default="" />
	<cfproperty name="Fee_PR_229" type="numeric" default="" />
	<cfproperty name="Fee_VI_238" type="numeric" default="" />
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
		variables.HCPCRecordID = "";
		variables.CategoryID = "";
		variables.MOD1 = "";
		variables.MOD2 = "";
		variables.MOD3 = "";
		variables.MOD4 = "";
		variables.Ceiling = "";
		variables.Floor = "";
		variables.Fee_AL_16 = "";
		variables.Fee_AK_17 = "";
		variables.Fee_AZ_18 = "";
		variables.Fee_AR_19 = "";
		variables.Fee_CA_20 = "";
		variables.Fee_CO_21 = "";
		variables.Fee_CT_22 = "";
		variables.Fee_DE_23 = "";
		variables.Fee_DC_24 = "";
		variables.Fee_FL_25 = "";
		variables.Fee_GA_26 = "";
		variables.Fee_HI_27 = "";
		variables.Fee_ID_28 = "";
		variables.Fee_IL_29 = "";
		variables.Fee_IN_30 = "";
		variables.Fee_IA_31 = "";
		variables.Fee_KS_32 = "";
		variables.Fee_KY_33 = "";
		variables.Fee_LA_34 = "";
		variables.Fee_ME_35 = "";
		variables.Fee_MD_36 = "";
		variables.Fee_MA_37 = "";
		variables.Fee_MI_38 = "";
		variables.Fee_MN_39 = "";
		variables.Fee_MS_40 = "";
		variables.Fee_MO_41 = "";
		variables.Fee_MT_42 = "";
		variables.Fee_NE_43 = "";
		variables.Fee_NV_44 = "";
		variables.Fee_NE_45 = "";
		variables.Fee_NJ_46 = "";
		variables.Fee_NM_47 = "";
		variables.Fee_NY_48 = "";
		variables.Fee_NC_49 = "";
		variables.Fee_ND_50 = "";
		variables.Fee_OH_51 = "";
		variables.Fee_OK_52 = "";
		variables.Fee_OR_53 = "";
		variables.Fee_PA_54 = "";
		variables.Fee_RI_55 = "";
		variables.Fee_SC_56 = "";
		variables.Fee_SD_57 = "";
		variables.Fee_TN_58 = "";
		variables.Fee_TX_59 = "";
		variables.Fee_UT_60 = "";
		variables.Fee_VT_61 = "";
		variables.Fee_VA_62 = "";
		variables.Fee_WA_63 = "";
		variables.Fee_WV_64 = "";
		variables.Fee_WI_65 = "";
		variables.Fee_WY_66 = "";
		variables.Fee_PR_229 = "";
		variables.Fee_VI_238 = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="eob_medicare_2007_procedurecodefeescheduleActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RecordID") AND stValues.RecordID NEQ 0>
				<cfquery name="qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule" datasource="#trim(variables.ds)#">
			  		SELECT RecordID,HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode,DateCreated,DateModified
					FROM eob_medicare_2007_procedurecodefeeschedule  
					WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RecordID#" /> 
				</cfquery>		
				<cfif qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.HCPCRecordID = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.HCPCRecordID;
					variables.CategoryID = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.CategoryID;
					variables.MOD1 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD1;
					variables.MOD2 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD2;
					variables.MOD3 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD3;
					variables.MOD4 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD4;
					variables.Ceiling = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Ceiling;
					variables.Floor = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Floor;
					variables.Fee_AL_16 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AL_16;
					variables.Fee_AK_17 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AK_17;
					variables.Fee_AZ_18 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AZ_18;
					variables.Fee_AR_19 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AR_19;
					variables.Fee_CA_20 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_CA_20;
					variables.Fee_CO_21 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_CO_21;
					variables.Fee_CT_22 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_CT_22;
					variables.Fee_DE_23 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_DE_23;
					variables.Fee_DC_24 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_DC_24;
					variables.Fee_FL_25 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_FL_25;
					variables.Fee_GA_26 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_GA_26;
					variables.Fee_HI_27 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_HI_27;
					variables.Fee_ID_28 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_ID_28;
					variables.Fee_IL_29 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_IL_29;
					variables.Fee_IN_30 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_IN_30;
					variables.Fee_IA_31 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_IA_31;
					variables.Fee_KS_32 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_KS_32;
					variables.Fee_KY_33 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_KY_33;
					variables.Fee_LA_34 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_LA_34;
					variables.Fee_ME_35 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_ME_35;
					variables.Fee_MD_36 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MD_36;
					variables.Fee_MA_37 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MA_37;
					variables.Fee_MI_38 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MI_38;
					variables.Fee_MN_39 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MN_39;
					variables.Fee_MS_40 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MS_40;
					variables.Fee_MO_41 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MO_41;
					variables.Fee_MT_42 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MT_42;
					variables.Fee_NE_43 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NE_43;
					variables.Fee_NV_44 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NV_44;
					variables.Fee_NE_45 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NE_45;
					variables.Fee_NJ_46 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NJ_46;
					variables.Fee_NM_47 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NM_47;
					variables.Fee_NY_48 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NY_48;
					variables.Fee_NC_49 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NC_49;
					variables.Fee_ND_50 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_ND_50;
					variables.Fee_OH_51 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_OH_51;
					variables.Fee_OK_52 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_OK_52;
					variables.Fee_OR_53 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_OR_53;
					variables.Fee_PA_54 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_PA_54;
					variables.Fee_RI_55 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_RI_55;
					variables.Fee_SC_56 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_SC_56;
					variables.Fee_SD_57 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_SD_57;
					variables.Fee_TN_58 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_TN_58;
					variables.Fee_TX_59 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_TX_59;
					variables.Fee_UT_60 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_UT_60;
					variables.Fee_VT_61 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_VT_61;
					variables.Fee_VA_62 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_VA_62;
					variables.Fee_WA_63 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WA_63;
					variables.Fee_WV_64 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WV_64;
					variables.Fee_WI_65 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WI_65;
					variables.Fee_WY_66 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WY_66;
					variables.Fee_PR_229 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_PR_229;
					variables.Fee_VI_238 = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_VI_238;
					variables.Active = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Active;
					variables.InactiveCode = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.InactiveCode;
					variables.DateModified = qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RecordID")><cfset variables.RecordID = stValues.RecordID /></cfif>
			<cfif StructKeyExists(stValues, "HCPCRecordID")><cfset variables.HCPCRecordID = stValues.HCPCRecordID /></cfif>
			<cfif StructKeyExists(stValues, "CategoryID")><cfset variables.CategoryID = stValues.CategoryID /></cfif>
			<cfif StructKeyExists(stValues, "MOD1")><cfset variables.MOD1 = stValues.MOD1 /></cfif>
			<cfif StructKeyExists(stValues, "MOD2")><cfset variables.MOD2 = stValues.MOD2 /></cfif>
			<cfif StructKeyExists(stValues, "MOD3")><cfset variables.MOD3 = stValues.MOD3 /></cfif>
			<cfif StructKeyExists(stValues, "MOD4")><cfset variables.MOD4 = stValues.MOD4 /></cfif>
			<cfif StructKeyExists(stValues, "Ceiling")><cfset variables.Ceiling = stValues.Ceiling /></cfif>
			<cfif StructKeyExists(stValues, "Floor")><cfset variables.Floor = stValues.Floor /></cfif>
			<cfif StructKeyExists(stValues, "Fee_AL_16")><cfset variables.Fee_AL_16 = stValues.Fee_AL_16 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_AK_17")><cfset variables.Fee_AK_17 = stValues.Fee_AK_17 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_AZ_18")><cfset variables.Fee_AZ_18 = stValues.Fee_AZ_18 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_AR_19")><cfset variables.Fee_AR_19 = stValues.Fee_AR_19 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_CA_20")><cfset variables.Fee_CA_20 = stValues.Fee_CA_20 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_CO_21")><cfset variables.Fee_CO_21 = stValues.Fee_CO_21 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_CT_22")><cfset variables.Fee_CT_22 = stValues.Fee_CT_22 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_DE_23")><cfset variables.Fee_DE_23 = stValues.Fee_DE_23 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_DC_24")><cfset variables.Fee_DC_24 = stValues.Fee_DC_24 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_FL_25")><cfset variables.Fee_FL_25 = stValues.Fee_FL_25 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_GA_26")><cfset variables.Fee_GA_26 = stValues.Fee_GA_26 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_HI_27")><cfset variables.Fee_HI_27 = stValues.Fee_HI_27 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_ID_28")><cfset variables.Fee_ID_28 = stValues.Fee_ID_28 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_IL_29")><cfset variables.Fee_IL_29 = stValues.Fee_IL_29 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_IN_30")><cfset variables.Fee_IN_30 = stValues.Fee_IN_30 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_IA_31")><cfset variables.Fee_IA_31 = stValues.Fee_IA_31 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_KS_32")><cfset variables.Fee_KS_32 = stValues.Fee_KS_32 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_KY_33")><cfset variables.Fee_KY_33 = stValues.Fee_KY_33 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_LA_34")><cfset variables.Fee_LA_34 = stValues.Fee_LA_34 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_ME_35")><cfset variables.Fee_ME_35 = stValues.Fee_ME_35 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_MD_36")><cfset variables.Fee_MD_36 = stValues.Fee_MD_36 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_MA_37")><cfset variables.Fee_MA_37 = stValues.Fee_MA_37 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_MI_38")><cfset variables.Fee_MI_38 = stValues.Fee_MI_38 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_MN_39")><cfset variables.Fee_MN_39 = stValues.Fee_MN_39 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_MS_40")><cfset variables.Fee_MS_40 = stValues.Fee_MS_40 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_MO_41")><cfset variables.Fee_MO_41 = stValues.Fee_MO_41 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_MT_42")><cfset variables.Fee_MT_42 = stValues.Fee_MT_42 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_NE_43")><cfset variables.Fee_NE_43 = stValues.Fee_NE_43 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_NV_44")><cfset variables.Fee_NV_44 = stValues.Fee_NV_44 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_NE_45")><cfset variables.Fee_NE_45 = stValues.Fee_NE_45 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_NJ_46")><cfset variables.Fee_NJ_46 = stValues.Fee_NJ_46 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_NM_47")><cfset variables.Fee_NM_47 = stValues.Fee_NM_47 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_NY_48")><cfset variables.Fee_NY_48 = stValues.Fee_NY_48 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_NC_49")><cfset variables.Fee_NC_49 = stValues.Fee_NC_49 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_ND_50")><cfset variables.Fee_ND_50 = stValues.Fee_ND_50 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_OH_51")><cfset variables.Fee_OH_51 = stValues.Fee_OH_51 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_OK_52")><cfset variables.Fee_OK_52 = stValues.Fee_OK_52 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_OR_53")><cfset variables.Fee_OR_53 = stValues.Fee_OR_53 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_PA_54")><cfset variables.Fee_PA_54 = stValues.Fee_PA_54 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_RI_55")><cfset variables.Fee_RI_55 = stValues.Fee_RI_55 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_SC_56")><cfset variables.Fee_SC_56 = stValues.Fee_SC_56 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_SD_57")><cfset variables.Fee_SD_57 = stValues.Fee_SD_57 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_TN_58")><cfset variables.Fee_TN_58 = stValues.Fee_TN_58 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_TX_59")><cfset variables.Fee_TX_59 = stValues.Fee_TX_59 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_UT_60")><cfset variables.Fee_UT_60 = stValues.Fee_UT_60 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_VT_61")><cfset variables.Fee_VT_61 = stValues.Fee_VT_61 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_VA_62")><cfset variables.Fee_VA_62 = stValues.Fee_VA_62 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_WA_63")><cfset variables.Fee_WA_63 = stValues.Fee_WA_63 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_WV_64")><cfset variables.Fee_WV_64 = stValues.Fee_WV_64 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_WI_65")><cfset variables.Fee_WI_65 = stValues.Fee_WI_65 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_WY_66")><cfset variables.Fee_WY_66 = stValues.Fee_WY_66 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_PR_229")><cfset variables.Fee_PR_229 = stValues.Fee_PR_229 /></cfif>
			<cfif StructKeyExists(stValues, "Fee_VI_238")><cfset variables.Fee_VI_238 = stValues.Fee_VI_238 /></cfif>
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
	<!--- GET and SET methods for HCPCRecordID.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHCPCRecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.HCPCRecordID>
	</cffunction>
	
	<cffunction name="setHCPCRecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HCPCRecordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.HCPCRecordID)) OR trim(arguments.HCPCRecordID) EQ "">
			<cfset variables.HCPCRecordID = arguments.HCPCRecordID />
		<cfelse>
			<cfthrow message="HCPCRecordID (#arguments.HCPCRecordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HCPCRecordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CategoryID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCategoryID" acess="public" output="false" returntype="any">
		<cfreturn variables.CategoryID>
	</cffunction>
	
	<cffunction name="setCategoryID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CategoryID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.CategoryID)) OR trim(arguments.CategoryID) EQ "">
			<cfset variables.CategoryID = arguments.CategoryID />
		<cfelse>
			<cfthrow message="CategoryID (#arguments.CategoryID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CategoryID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOD1.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOD1" acess="public" output="false" returntype="any">
		<cfreturn variables.MOD1>
	</cffunction>
	
	<cffunction name="setMOD1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOD1" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MOD1)) OR trim(arguments.MOD1) EQ "">
			<cfset variables.MOD1 = arguments.MOD1 />
		<cfelse>
			<cfthrow message="MOD1 (#arguments.MOD1#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOD1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOD2.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOD2" acess="public" output="false" returntype="any">
		<cfreturn variables.MOD2>
	</cffunction>
	
	<cffunction name="setMOD2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOD2" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MOD2)) OR trim(arguments.MOD2) EQ "">
			<cfset variables.MOD2 = arguments.MOD2 />
		<cfelse>
			<cfthrow message="MOD2 (#arguments.MOD2#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOD2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOD3.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOD3" acess="public" output="false" returntype="any">
		<cfreturn variables.MOD3>
	</cffunction>
	
	<cffunction name="setMOD3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOD3" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MOD3)) OR trim(arguments.MOD3) EQ "">
			<cfset variables.MOD3 = arguments.MOD3 />
		<cfelse>
			<cfthrow message="MOD3 (#arguments.MOD3#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOD3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MOD4.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMOD4" acess="public" output="false" returntype="any">
		<cfreturn variables.MOD4>
	</cffunction>
	
	<cffunction name="setMOD4" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MOD4" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MOD4)) OR trim(arguments.MOD4) EQ "">
			<cfset variables.MOD4 = arguments.MOD4 />
		<cfelse>
			<cfthrow message="MOD4 (#arguments.MOD4#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MOD4") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Ceiling.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCeiling" acess="public" output="false" returntype="any">
		<cfreturn variables.Ceiling>
	</cffunction>
	
	<cffunction name="setCeiling" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Ceiling" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Ceiling)) OR trim(arguments.Ceiling) EQ "">
			<cfset variables.Ceiling = arguments.Ceiling />
		<cfelse>
			<cfthrow message="Ceiling (#arguments.Ceiling#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Ceiling") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Floor.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFloor" acess="public" output="false" returntype="any">
		<cfreturn variables.Floor>
	</cffunction>
	
	<cffunction name="setFloor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Floor" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Floor)) OR trim(arguments.Floor) EQ "">
			<cfset variables.Floor = arguments.Floor />
		<cfelse>
			<cfthrow message="Floor (#arguments.Floor#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Floor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_AL_16.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_AL_16" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_AL_16>
	</cffunction>
	
	<cffunction name="setFee_AL_16" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_AL_16" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_AL_16)) OR trim(arguments.Fee_AL_16) EQ "">
			<cfset variables.Fee_AL_16 = arguments.Fee_AL_16 />
		<cfelse>
			<cfthrow message="Fee_AL_16 (#arguments.Fee_AL_16#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_AL_16") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_AK_17.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_AK_17" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_AK_17>
	</cffunction>
	
	<cffunction name="setFee_AK_17" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_AK_17" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_AK_17)) OR trim(arguments.Fee_AK_17) EQ "">
			<cfset variables.Fee_AK_17 = arguments.Fee_AK_17 />
		<cfelse>
			<cfthrow message="Fee_AK_17 (#arguments.Fee_AK_17#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_AK_17") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_AZ_18.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_AZ_18" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_AZ_18>
	</cffunction>
	
	<cffunction name="setFee_AZ_18" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_AZ_18" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_AZ_18)) OR trim(arguments.Fee_AZ_18) EQ "">
			<cfset variables.Fee_AZ_18 = arguments.Fee_AZ_18 />
		<cfelse>
			<cfthrow message="Fee_AZ_18 (#arguments.Fee_AZ_18#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_AZ_18") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_AR_19.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_AR_19" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_AR_19>
	</cffunction>
	
	<cffunction name="setFee_AR_19" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_AR_19" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_AR_19)) OR trim(arguments.Fee_AR_19) EQ "">
			<cfset variables.Fee_AR_19 = arguments.Fee_AR_19 />
		<cfelse>
			<cfthrow message="Fee_AR_19 (#arguments.Fee_AR_19#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_AR_19") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_CA_20.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_CA_20" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_CA_20>
	</cffunction>
	
	<cffunction name="setFee_CA_20" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_CA_20" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_CA_20)) OR trim(arguments.Fee_CA_20) EQ "">
			<cfset variables.Fee_CA_20 = arguments.Fee_CA_20 />
		<cfelse>
			<cfthrow message="Fee_CA_20 (#arguments.Fee_CA_20#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_CA_20") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_CO_21.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_CO_21" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_CO_21>
	</cffunction>
	
	<cffunction name="setFee_CO_21" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_CO_21" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_CO_21)) OR trim(arguments.Fee_CO_21) EQ "">
			<cfset variables.Fee_CO_21 = arguments.Fee_CO_21 />
		<cfelse>
			<cfthrow message="Fee_CO_21 (#arguments.Fee_CO_21#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_CO_21") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_CT_22.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_CT_22" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_CT_22>
	</cffunction>
	
	<cffunction name="setFee_CT_22" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_CT_22" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_CT_22)) OR trim(arguments.Fee_CT_22) EQ "">
			<cfset variables.Fee_CT_22 = arguments.Fee_CT_22 />
		<cfelse>
			<cfthrow message="Fee_CT_22 (#arguments.Fee_CT_22#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_CT_22") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_DE_23.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_DE_23" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_DE_23>
	</cffunction>
	
	<cffunction name="setFee_DE_23" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_DE_23" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_DE_23)) OR trim(arguments.Fee_DE_23) EQ "">
			<cfset variables.Fee_DE_23 = arguments.Fee_DE_23 />
		<cfelse>
			<cfthrow message="Fee_DE_23 (#arguments.Fee_DE_23#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_DE_23") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_DC_24.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_DC_24" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_DC_24>
	</cffunction>
	
	<cffunction name="setFee_DC_24" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_DC_24" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_DC_24)) OR trim(arguments.Fee_DC_24) EQ "">
			<cfset variables.Fee_DC_24 = arguments.Fee_DC_24 />
		<cfelse>
			<cfthrow message="Fee_DC_24 (#arguments.Fee_DC_24#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_DC_24") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_FL_25.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_FL_25" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_FL_25>
	</cffunction>
	
	<cffunction name="setFee_FL_25" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_FL_25" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_FL_25)) OR trim(arguments.Fee_FL_25) EQ "">
			<cfset variables.Fee_FL_25 = arguments.Fee_FL_25 />
		<cfelse>
			<cfthrow message="Fee_FL_25 (#arguments.Fee_FL_25#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_FL_25") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_GA_26.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_GA_26" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_GA_26>
	</cffunction>
	
	<cffunction name="setFee_GA_26" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_GA_26" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_GA_26)) OR trim(arguments.Fee_GA_26) EQ "">
			<cfset variables.Fee_GA_26 = arguments.Fee_GA_26 />
		<cfelse>
			<cfthrow message="Fee_GA_26 (#arguments.Fee_GA_26#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_GA_26") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_HI_27.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_HI_27" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_HI_27>
	</cffunction>
	
	<cffunction name="setFee_HI_27" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_HI_27" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_HI_27)) OR trim(arguments.Fee_HI_27) EQ "">
			<cfset variables.Fee_HI_27 = arguments.Fee_HI_27 />
		<cfelse>
			<cfthrow message="Fee_HI_27 (#arguments.Fee_HI_27#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_HI_27") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_ID_28.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_ID_28" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_ID_28>
	</cffunction>
	
	<cffunction name="setFee_ID_28" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_ID_28" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_ID_28)) OR trim(arguments.Fee_ID_28) EQ "">
			<cfset variables.Fee_ID_28 = arguments.Fee_ID_28 />
		<cfelse>
			<cfthrow message="Fee_ID_28 (#arguments.Fee_ID_28#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_ID_28") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_IL_29.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_IL_29" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_IL_29>
	</cffunction>
	
	<cffunction name="setFee_IL_29" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_IL_29" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_IL_29)) OR trim(arguments.Fee_IL_29) EQ "">
			<cfset variables.Fee_IL_29 = arguments.Fee_IL_29 />
		<cfelse>
			<cfthrow message="Fee_IL_29 (#arguments.Fee_IL_29#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_IL_29") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_IN_30.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_IN_30" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_IN_30>
	</cffunction>
	
	<cffunction name="setFee_IN_30" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_IN_30" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_IN_30)) OR trim(arguments.Fee_IN_30) EQ "">
			<cfset variables.Fee_IN_30 = arguments.Fee_IN_30 />
		<cfelse>
			<cfthrow message="Fee_IN_30 (#arguments.Fee_IN_30#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_IN_30") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_IA_31.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_IA_31" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_IA_31>
	</cffunction>
	
	<cffunction name="setFee_IA_31" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_IA_31" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_IA_31)) OR trim(arguments.Fee_IA_31) EQ "">
			<cfset variables.Fee_IA_31 = arguments.Fee_IA_31 />
		<cfelse>
			<cfthrow message="Fee_IA_31 (#arguments.Fee_IA_31#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_IA_31") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_KS_32.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_KS_32" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_KS_32>
	</cffunction>
	
	<cffunction name="setFee_KS_32" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_KS_32" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_KS_32)) OR trim(arguments.Fee_KS_32) EQ "">
			<cfset variables.Fee_KS_32 = arguments.Fee_KS_32 />
		<cfelse>
			<cfthrow message="Fee_KS_32 (#arguments.Fee_KS_32#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_KS_32") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_KY_33.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_KY_33" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_KY_33>
	</cffunction>
	
	<cffunction name="setFee_KY_33" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_KY_33" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_KY_33)) OR trim(arguments.Fee_KY_33) EQ "">
			<cfset variables.Fee_KY_33 = arguments.Fee_KY_33 />
		<cfelse>
			<cfthrow message="Fee_KY_33 (#arguments.Fee_KY_33#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_KY_33") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_LA_34.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_LA_34" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_LA_34>
	</cffunction>
	
	<cffunction name="setFee_LA_34" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_LA_34" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_LA_34)) OR trim(arguments.Fee_LA_34) EQ "">
			<cfset variables.Fee_LA_34 = arguments.Fee_LA_34 />
		<cfelse>
			<cfthrow message="Fee_LA_34 (#arguments.Fee_LA_34#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_LA_34") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_ME_35.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_ME_35" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_ME_35>
	</cffunction>
	
	<cffunction name="setFee_ME_35" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_ME_35" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_ME_35)) OR trim(arguments.Fee_ME_35) EQ "">
			<cfset variables.Fee_ME_35 = arguments.Fee_ME_35 />
		<cfelse>
			<cfthrow message="Fee_ME_35 (#arguments.Fee_ME_35#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_ME_35") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_MD_36.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_MD_36" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_MD_36>
	</cffunction>
	
	<cffunction name="setFee_MD_36" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_MD_36" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_MD_36)) OR trim(arguments.Fee_MD_36) EQ "">
			<cfset variables.Fee_MD_36 = arguments.Fee_MD_36 />
		<cfelse>
			<cfthrow message="Fee_MD_36 (#arguments.Fee_MD_36#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_MD_36") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_MA_37.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_MA_37" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_MA_37>
	</cffunction>
	
	<cffunction name="setFee_MA_37" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_MA_37" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_MA_37)) OR trim(arguments.Fee_MA_37) EQ "">
			<cfset variables.Fee_MA_37 = arguments.Fee_MA_37 />
		<cfelse>
			<cfthrow message="Fee_MA_37 (#arguments.Fee_MA_37#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_MA_37") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_MI_38.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_MI_38" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_MI_38>
	</cffunction>
	
	<cffunction name="setFee_MI_38" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_MI_38" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_MI_38)) OR trim(arguments.Fee_MI_38) EQ "">
			<cfset variables.Fee_MI_38 = arguments.Fee_MI_38 />
		<cfelse>
			<cfthrow message="Fee_MI_38 (#arguments.Fee_MI_38#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_MI_38") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_MN_39.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_MN_39" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_MN_39>
	</cffunction>
	
	<cffunction name="setFee_MN_39" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_MN_39" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_MN_39)) OR trim(arguments.Fee_MN_39) EQ "">
			<cfset variables.Fee_MN_39 = arguments.Fee_MN_39 />
		<cfelse>
			<cfthrow message="Fee_MN_39 (#arguments.Fee_MN_39#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_MN_39") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_MS_40.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_MS_40" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_MS_40>
	</cffunction>
	
	<cffunction name="setFee_MS_40" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_MS_40" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_MS_40)) OR trim(arguments.Fee_MS_40) EQ "">
			<cfset variables.Fee_MS_40 = arguments.Fee_MS_40 />
		<cfelse>
			<cfthrow message="Fee_MS_40 (#arguments.Fee_MS_40#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_MS_40") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_MO_41.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_MO_41" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_MO_41>
	</cffunction>
	
	<cffunction name="setFee_MO_41" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_MO_41" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_MO_41)) OR trim(arguments.Fee_MO_41) EQ "">
			<cfset variables.Fee_MO_41 = arguments.Fee_MO_41 />
		<cfelse>
			<cfthrow message="Fee_MO_41 (#arguments.Fee_MO_41#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_MO_41") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_MT_42.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_MT_42" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_MT_42>
	</cffunction>
	
	<cffunction name="setFee_MT_42" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_MT_42" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_MT_42)) OR trim(arguments.Fee_MT_42) EQ "">
			<cfset variables.Fee_MT_42 = arguments.Fee_MT_42 />
		<cfelse>
			<cfthrow message="Fee_MT_42 (#arguments.Fee_MT_42#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_MT_42") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_NE_43.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_NE_43" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_NE_43>
	</cffunction>
	
	<cffunction name="setFee_NE_43" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_NE_43" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_NE_43)) OR trim(arguments.Fee_NE_43) EQ "">
			<cfset variables.Fee_NE_43 = arguments.Fee_NE_43 />
		<cfelse>
			<cfthrow message="Fee_NE_43 (#arguments.Fee_NE_43#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_NE_43") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_NV_44.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_NV_44" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_NV_44>
	</cffunction>
	
	<cffunction name="setFee_NV_44" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_NV_44" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_NV_44)) OR trim(arguments.Fee_NV_44) EQ "">
			<cfset variables.Fee_NV_44 = arguments.Fee_NV_44 />
		<cfelse>
			<cfthrow message="Fee_NV_44 (#arguments.Fee_NV_44#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_NV_44") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_NE_45.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_NE_45" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_NE_45>
	</cffunction>
	
	<cffunction name="setFee_NE_45" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_NE_45" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_NE_45)) OR trim(arguments.Fee_NE_45) EQ "">
			<cfset variables.Fee_NE_45 = arguments.Fee_NE_45 />
		<cfelse>
			<cfthrow message="Fee_NE_45 (#arguments.Fee_NE_45#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_NE_45") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_NJ_46.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_NJ_46" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_NJ_46>
	</cffunction>
	
	<cffunction name="setFee_NJ_46" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_NJ_46" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_NJ_46)) OR trim(arguments.Fee_NJ_46) EQ "">
			<cfset variables.Fee_NJ_46 = arguments.Fee_NJ_46 />
		<cfelse>
			<cfthrow message="Fee_NJ_46 (#arguments.Fee_NJ_46#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_NJ_46") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_NM_47.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_NM_47" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_NM_47>
	</cffunction>
	
	<cffunction name="setFee_NM_47" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_NM_47" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_NM_47)) OR trim(arguments.Fee_NM_47) EQ "">
			<cfset variables.Fee_NM_47 = arguments.Fee_NM_47 />
		<cfelse>
			<cfthrow message="Fee_NM_47 (#arguments.Fee_NM_47#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_NM_47") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_NY_48.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_NY_48" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_NY_48>
	</cffunction>
	
	<cffunction name="setFee_NY_48" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_NY_48" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_NY_48)) OR trim(arguments.Fee_NY_48) EQ "">
			<cfset variables.Fee_NY_48 = arguments.Fee_NY_48 />
		<cfelse>
			<cfthrow message="Fee_NY_48 (#arguments.Fee_NY_48#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_NY_48") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_NC_49.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_NC_49" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_NC_49>
	</cffunction>
	
	<cffunction name="setFee_NC_49" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_NC_49" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_NC_49)) OR trim(arguments.Fee_NC_49) EQ "">
			<cfset variables.Fee_NC_49 = arguments.Fee_NC_49 />
		<cfelse>
			<cfthrow message="Fee_NC_49 (#arguments.Fee_NC_49#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_NC_49") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_ND_50.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_ND_50" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_ND_50>
	</cffunction>
	
	<cffunction name="setFee_ND_50" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_ND_50" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_ND_50)) OR trim(arguments.Fee_ND_50) EQ "">
			<cfset variables.Fee_ND_50 = arguments.Fee_ND_50 />
		<cfelse>
			<cfthrow message="Fee_ND_50 (#arguments.Fee_ND_50#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_ND_50") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_OH_51.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_OH_51" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_OH_51>
	</cffunction>
	
	<cffunction name="setFee_OH_51" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_OH_51" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_OH_51)) OR trim(arguments.Fee_OH_51) EQ "">
			<cfset variables.Fee_OH_51 = arguments.Fee_OH_51 />
		<cfelse>
			<cfthrow message="Fee_OH_51 (#arguments.Fee_OH_51#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_OH_51") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_OK_52.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_OK_52" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_OK_52>
	</cffunction>
	
	<cffunction name="setFee_OK_52" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_OK_52" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_OK_52)) OR trim(arguments.Fee_OK_52) EQ "">
			<cfset variables.Fee_OK_52 = arguments.Fee_OK_52 />
		<cfelse>
			<cfthrow message="Fee_OK_52 (#arguments.Fee_OK_52#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_OK_52") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_OR_53.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_OR_53" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_OR_53>
	</cffunction>
	
	<cffunction name="setFee_OR_53" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_OR_53" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_OR_53)) OR trim(arguments.Fee_OR_53) EQ "">
			<cfset variables.Fee_OR_53 = arguments.Fee_OR_53 />
		<cfelse>
			<cfthrow message="Fee_OR_53 (#arguments.Fee_OR_53#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_OR_53") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_PA_54.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_PA_54" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_PA_54>
	</cffunction>
	
	<cffunction name="setFee_PA_54" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_PA_54" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_PA_54)) OR trim(arguments.Fee_PA_54) EQ "">
			<cfset variables.Fee_PA_54 = arguments.Fee_PA_54 />
		<cfelse>
			<cfthrow message="Fee_PA_54 (#arguments.Fee_PA_54#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_PA_54") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_RI_55.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_RI_55" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_RI_55>
	</cffunction>
	
	<cffunction name="setFee_RI_55" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_RI_55" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_RI_55)) OR trim(arguments.Fee_RI_55) EQ "">
			<cfset variables.Fee_RI_55 = arguments.Fee_RI_55 />
		<cfelse>
			<cfthrow message="Fee_RI_55 (#arguments.Fee_RI_55#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_RI_55") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_SC_56.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_SC_56" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_SC_56>
	</cffunction>
	
	<cffunction name="setFee_SC_56" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_SC_56" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_SC_56)) OR trim(arguments.Fee_SC_56) EQ "">
			<cfset variables.Fee_SC_56 = arguments.Fee_SC_56 />
		<cfelse>
			<cfthrow message="Fee_SC_56 (#arguments.Fee_SC_56#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_SC_56") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_SD_57.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_SD_57" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_SD_57>
	</cffunction>
	
	<cffunction name="setFee_SD_57" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_SD_57" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_SD_57)) OR trim(arguments.Fee_SD_57) EQ "">
			<cfset variables.Fee_SD_57 = arguments.Fee_SD_57 />
		<cfelse>
			<cfthrow message="Fee_SD_57 (#arguments.Fee_SD_57#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_SD_57") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_TN_58.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_TN_58" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_TN_58>
	</cffunction>
	
	<cffunction name="setFee_TN_58" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_TN_58" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_TN_58)) OR trim(arguments.Fee_TN_58) EQ "">
			<cfset variables.Fee_TN_58 = arguments.Fee_TN_58 />
		<cfelse>
			<cfthrow message="Fee_TN_58 (#arguments.Fee_TN_58#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_TN_58") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_TX_59.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_TX_59" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_TX_59>
	</cffunction>
	
	<cffunction name="setFee_TX_59" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_TX_59" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_TX_59)) OR trim(arguments.Fee_TX_59) EQ "">
			<cfset variables.Fee_TX_59 = arguments.Fee_TX_59 />
		<cfelse>
			<cfthrow message="Fee_TX_59 (#arguments.Fee_TX_59#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_TX_59") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_UT_60.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_UT_60" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_UT_60>
	</cffunction>
	
	<cffunction name="setFee_UT_60" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_UT_60" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_UT_60)) OR trim(arguments.Fee_UT_60) EQ "">
			<cfset variables.Fee_UT_60 = arguments.Fee_UT_60 />
		<cfelse>
			<cfthrow message="Fee_UT_60 (#arguments.Fee_UT_60#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_UT_60") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_VT_61.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_VT_61" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_VT_61>
	</cffunction>
	
	<cffunction name="setFee_VT_61" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_VT_61" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_VT_61)) OR trim(arguments.Fee_VT_61) EQ "">
			<cfset variables.Fee_VT_61 = arguments.Fee_VT_61 />
		<cfelse>
			<cfthrow message="Fee_VT_61 (#arguments.Fee_VT_61#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_VT_61") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_VA_62.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_VA_62" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_VA_62>
	</cffunction>
	
	<cffunction name="setFee_VA_62" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_VA_62" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_VA_62)) OR trim(arguments.Fee_VA_62) EQ "">
			<cfset variables.Fee_VA_62 = arguments.Fee_VA_62 />
		<cfelse>
			<cfthrow message="Fee_VA_62 (#arguments.Fee_VA_62#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_VA_62") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_WA_63.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_WA_63" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_WA_63>
	</cffunction>
	
	<cffunction name="setFee_WA_63" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_WA_63" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_WA_63)) OR trim(arguments.Fee_WA_63) EQ "">
			<cfset variables.Fee_WA_63 = arguments.Fee_WA_63 />
		<cfelse>
			<cfthrow message="Fee_WA_63 (#arguments.Fee_WA_63#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_WA_63") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_WV_64.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_WV_64" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_WV_64>
	</cffunction>
	
	<cffunction name="setFee_WV_64" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_WV_64" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_WV_64)) OR trim(arguments.Fee_WV_64) EQ "">
			<cfset variables.Fee_WV_64 = arguments.Fee_WV_64 />
		<cfelse>
			<cfthrow message="Fee_WV_64 (#arguments.Fee_WV_64#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_WV_64") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_WI_65.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_WI_65" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_WI_65>
	</cffunction>
	
	<cffunction name="setFee_WI_65" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_WI_65" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_WI_65)) OR trim(arguments.Fee_WI_65) EQ "">
			<cfset variables.Fee_WI_65 = arguments.Fee_WI_65 />
		<cfelse>
			<cfthrow message="Fee_WI_65 (#arguments.Fee_WI_65#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_WI_65") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_WY_66.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_WY_66" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_WY_66>
	</cffunction>
	
	<cffunction name="setFee_WY_66" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_WY_66" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_WY_66)) OR trim(arguments.Fee_WY_66) EQ "">
			<cfset variables.Fee_WY_66 = arguments.Fee_WY_66 />
		<cfelse>
			<cfthrow message="Fee_WY_66 (#arguments.Fee_WY_66#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_WY_66") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_PR_229.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_PR_229" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_PR_229>
	</cffunction>
	
	<cffunction name="setFee_PR_229" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_PR_229" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_PR_229)) OR trim(arguments.Fee_PR_229) EQ "">
			<cfset variables.Fee_PR_229 = arguments.Fee_PR_229 />
		<cfelse>
			<cfthrow message="Fee_PR_229 (#arguments.Fee_PR_229#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_PR_229") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fee_VI_238.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFee_VI_238" acess="public" output="false" returntype="any">
		<cfreturn variables.Fee_VI_238>
	</cffunction>
	
	<cffunction name="setFee_VI_238" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fee_VI_238" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Fee_VI_238)) OR trim(arguments.Fee_VI_238) EQ "">
			<cfset variables.Fee_VI_238 = arguments.Fee_VI_238 />
		<cfelse>
			<cfthrow message="Fee_VI_238 (#arguments.Fee_VI_238#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fee_VI_238") />		
		
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
	<cffunction name="getEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule" output="false" access="public" returntype="query">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule = "" />		
	
		<cfquery name="qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule" datasource="#trim(variables.ds)#">
	  		SELECT RecordID,HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode,DateCreated,DateModified
			FROM eob_medicare_2007_procedurecodefeeschedule  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_MEDICARE_2007_PROCEDURECodeFeeScheduleActive" />
		
		<cfset var qCreateEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule = "" />		
		
		<cfset var localHCPCRecordID = arguments.obj.getHCPCRecordID() />
		<cfset var localCategoryID = arguments.obj.getCategoryID() />
		<cfset var localMOD1 = arguments.obj.getMOD1() />
		<cfset var localMOD2 = arguments.obj.getMOD2() />
		<cfset var localMOD3 = arguments.obj.getMOD3() />
		<cfset var localMOD4 = arguments.obj.getMOD4() />
		<cfset var localCeiling = arguments.obj.getCeiling() />
		<cfset var localFloor = arguments.obj.getFloor() />
		<cfset var localFee_AL_16 = arguments.obj.getFee_AL_16() />
		<cfset var localFee_AK_17 = arguments.obj.getFee_AK_17() />
		<cfset var localFee_AZ_18 = arguments.obj.getFee_AZ_18() />
		<cfset var localFee_AR_19 = arguments.obj.getFee_AR_19() />
		<cfset var localFee_CA_20 = arguments.obj.getFee_CA_20() />
		<cfset var localFee_CO_21 = arguments.obj.getFee_CO_21() />
		<cfset var localFee_CT_22 = arguments.obj.getFee_CT_22() />
		<cfset var localFee_DE_23 = arguments.obj.getFee_DE_23() />
		<cfset var localFee_DC_24 = arguments.obj.getFee_DC_24() />
		<cfset var localFee_FL_25 = arguments.obj.getFee_FL_25() />
		<cfset var localFee_GA_26 = arguments.obj.getFee_GA_26() />
		<cfset var localFee_HI_27 = arguments.obj.getFee_HI_27() />
		<cfset var localFee_ID_28 = arguments.obj.getFee_ID_28() />
		<cfset var localFee_IL_29 = arguments.obj.getFee_IL_29() />
		<cfset var localFee_IN_30 = arguments.obj.getFee_IN_30() />
		<cfset var localFee_IA_31 = arguments.obj.getFee_IA_31() />
		<cfset var localFee_KS_32 = arguments.obj.getFee_KS_32() />
		<cfset var localFee_KY_33 = arguments.obj.getFee_KY_33() />
		<cfset var localFee_LA_34 = arguments.obj.getFee_LA_34() />
		<cfset var localFee_ME_35 = arguments.obj.getFee_ME_35() />
		<cfset var localFee_MD_36 = arguments.obj.getFee_MD_36() />
		<cfset var localFee_MA_37 = arguments.obj.getFee_MA_37() />
		<cfset var localFee_MI_38 = arguments.obj.getFee_MI_38() />
		<cfset var localFee_MN_39 = arguments.obj.getFee_MN_39() />
		<cfset var localFee_MS_40 = arguments.obj.getFee_MS_40() />
		<cfset var localFee_MO_41 = arguments.obj.getFee_MO_41() />
		<cfset var localFee_MT_42 = arguments.obj.getFee_MT_42() />
		<cfset var localFee_NE_43 = arguments.obj.getFee_NE_43() />
		<cfset var localFee_NV_44 = arguments.obj.getFee_NV_44() />
		<cfset var localFee_NE_45 = arguments.obj.getFee_NE_45() />
		<cfset var localFee_NJ_46 = arguments.obj.getFee_NJ_46() />
		<cfset var localFee_NM_47 = arguments.obj.getFee_NM_47() />
		<cfset var localFee_NY_48 = arguments.obj.getFee_NY_48() />
		<cfset var localFee_NC_49 = arguments.obj.getFee_NC_49() />
		<cfset var localFee_ND_50 = arguments.obj.getFee_ND_50() />
		<cfset var localFee_OH_51 = arguments.obj.getFee_OH_51() />
		<cfset var localFee_OK_52 = arguments.obj.getFee_OK_52() />
		<cfset var localFee_OR_53 = arguments.obj.getFee_OR_53() />
		<cfset var localFee_PA_54 = arguments.obj.getFee_PA_54() />
		<cfset var localFee_RI_55 = arguments.obj.getFee_RI_55() />
		<cfset var localFee_SC_56 = arguments.obj.getFee_SC_56() />
		<cfset var localFee_SD_57 = arguments.obj.getFee_SD_57() />
		<cfset var localFee_TN_58 = arguments.obj.getFee_TN_58() />
		<cfset var localFee_TX_59 = arguments.obj.getFee_TX_59() />
		<cfset var localFee_UT_60 = arguments.obj.getFee_UT_60() />
		<cfset var localFee_VT_61 = arguments.obj.getFee_VT_61() />
		<cfset var localFee_VA_62 = arguments.obj.getFee_VA_62() />
		<cfset var localFee_WA_63 = arguments.obj.getFee_WA_63() />
		<cfset var localFee_WV_64 = arguments.obj.getFee_WV_64() />
		<cfset var localFee_WI_65 = arguments.obj.getFee_WI_65() />
		<cfset var localFee_WY_66 = arguments.obj.getFee_WY_66() />
		<cfset var localFee_PR_229 = arguments.obj.getFee_PR_229() />
		<cfset var localFee_VI_238 = arguments.obj.getFee_VI_238() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule" datasource="#trim(variables.ds)#">
				INSERT INTO eob_medicare_2007_procedurecodefeeschedule (HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,InactiveCode)
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
			read(qCreateEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.RecordID);
			arguments.obj.setRecordID(qCreateEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.RecordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_MEDICARE_2007_PROCEDURECodeFeeScheduleActive">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule = "" />		
		
		<cfset qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule = getEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule(trim(RecordID)) />
				
		<cfif qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setRecordID(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.RecordID);
			this.setHCPCRecordID(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.HCPCRecordID);
			this.setCategoryID(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.CategoryID);
			this.setMOD1(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD1);
			this.setMOD2(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD2);
			this.setMOD3(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD3);
			this.setMOD4(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.MOD4);
			this.setCeiling(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Ceiling);
			this.setFloor(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Floor);
			this.setFee_AL_16(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AL_16);
			this.setFee_AK_17(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AK_17);
			this.setFee_AZ_18(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AZ_18);
			this.setFee_AR_19(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_AR_19);
			this.setFee_CA_20(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_CA_20);
			this.setFee_CO_21(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_CO_21);
			this.setFee_CT_22(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_CT_22);
			this.setFee_DE_23(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_DE_23);
			this.setFee_DC_24(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_DC_24);
			this.setFee_FL_25(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_FL_25);
			this.setFee_GA_26(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_GA_26);
			this.setFee_HI_27(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_HI_27);
			this.setFee_ID_28(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_ID_28);
			this.setFee_IL_29(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_IL_29);
			this.setFee_IN_30(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_IN_30);
			this.setFee_IA_31(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_IA_31);
			this.setFee_KS_32(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_KS_32);
			this.setFee_KY_33(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_KY_33);
			this.setFee_LA_34(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_LA_34);
			this.setFee_ME_35(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_ME_35);
			this.setFee_MD_36(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MD_36);
			this.setFee_MA_37(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MA_37);
			this.setFee_MI_38(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MI_38);
			this.setFee_MN_39(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MN_39);
			this.setFee_MS_40(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MS_40);
			this.setFee_MO_41(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MO_41);
			this.setFee_MT_42(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_MT_42);
			this.setFee_NE_43(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NE_43);
			this.setFee_NV_44(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NV_44);
			this.setFee_NE_45(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NE_45);
			this.setFee_NJ_46(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NJ_46);
			this.setFee_NM_47(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NM_47);
			this.setFee_NY_48(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NY_48);
			this.setFee_NC_49(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_NC_49);
			this.setFee_ND_50(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_ND_50);
			this.setFee_OH_51(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_OH_51);
			this.setFee_OK_52(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_OK_52);
			this.setFee_OR_53(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_OR_53);
			this.setFee_PA_54(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_PA_54);
			this.setFee_RI_55(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_RI_55);
			this.setFee_SC_56(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_SC_56);
			this.setFee_SD_57(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_SD_57);
			this.setFee_TN_58(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_TN_58);
			this.setFee_TX_59(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_TX_59);
			this.setFee_UT_60(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_UT_60);
			this.setFee_VT_61(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_VT_61);
			this.setFee_VA_62(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_VA_62);
			this.setFee_WA_63(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WA_63);
			this.setFee_WV_64(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WV_64);
			this.setFee_WI_65(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WI_65);
			this.setFee_WY_66(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_WY_66);
			this.setFee_PR_229(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_PR_229);
			this.setFee_VI_238(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Fee_VI_238);
			this.setActive(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.Active);
			this.setInactiveCode(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.InactiveCode);
			this.setDateCreated(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.DateCreated);
			this.setDateModified(qGetEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_MEDICARE_2007_PROCEDURECodeFeeScheduleActive" />
		<cfset var qUpdateEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule = "" />
		<cfset var localHCPCRecordID = arguments.obj.getHCPCRecordID() />
		<cfset var localCategoryID = arguments.obj.getCategoryID() />
		<cfset var localMOD1 = arguments.obj.getMOD1() />
		<cfset var localMOD2 = arguments.obj.getMOD2() />
		<cfset var localMOD3 = arguments.obj.getMOD3() />
		<cfset var localMOD4 = arguments.obj.getMOD4() />
		<cfset var localCeiling = arguments.obj.getCeiling() />
		<cfset var localFloor = arguments.obj.getFloor() />
		<cfset var localFee_AL_16 = arguments.obj.getFee_AL_16() />
		<cfset var localFee_AK_17 = arguments.obj.getFee_AK_17() />
		<cfset var localFee_AZ_18 = arguments.obj.getFee_AZ_18() />
		<cfset var localFee_AR_19 = arguments.obj.getFee_AR_19() />
		<cfset var localFee_CA_20 = arguments.obj.getFee_CA_20() />
		<cfset var localFee_CO_21 = arguments.obj.getFee_CO_21() />
		<cfset var localFee_CT_22 = arguments.obj.getFee_CT_22() />
		<cfset var localFee_DE_23 = arguments.obj.getFee_DE_23() />
		<cfset var localFee_DC_24 = arguments.obj.getFee_DC_24() />
		<cfset var localFee_FL_25 = arguments.obj.getFee_FL_25() />
		<cfset var localFee_GA_26 = arguments.obj.getFee_GA_26() />
		<cfset var localFee_HI_27 = arguments.obj.getFee_HI_27() />
		<cfset var localFee_ID_28 = arguments.obj.getFee_ID_28() />
		<cfset var localFee_IL_29 = arguments.obj.getFee_IL_29() />
		<cfset var localFee_IN_30 = arguments.obj.getFee_IN_30() />
		<cfset var localFee_IA_31 = arguments.obj.getFee_IA_31() />
		<cfset var localFee_KS_32 = arguments.obj.getFee_KS_32() />
		<cfset var localFee_KY_33 = arguments.obj.getFee_KY_33() />
		<cfset var localFee_LA_34 = arguments.obj.getFee_LA_34() />
		<cfset var localFee_ME_35 = arguments.obj.getFee_ME_35() />
		<cfset var localFee_MD_36 = arguments.obj.getFee_MD_36() />
		<cfset var localFee_MA_37 = arguments.obj.getFee_MA_37() />
		<cfset var localFee_MI_38 = arguments.obj.getFee_MI_38() />
		<cfset var localFee_MN_39 = arguments.obj.getFee_MN_39() />
		<cfset var localFee_MS_40 = arguments.obj.getFee_MS_40() />
		<cfset var localFee_MO_41 = arguments.obj.getFee_MO_41() />
		<cfset var localFee_MT_42 = arguments.obj.getFee_MT_42() />
		<cfset var localFee_NE_43 = arguments.obj.getFee_NE_43() />
		<cfset var localFee_NV_44 = arguments.obj.getFee_NV_44() />
		<cfset var localFee_NE_45 = arguments.obj.getFee_NE_45() />
		<cfset var localFee_NJ_46 = arguments.obj.getFee_NJ_46() />
		<cfset var localFee_NM_47 = arguments.obj.getFee_NM_47() />
		<cfset var localFee_NY_48 = arguments.obj.getFee_NY_48() />
		<cfset var localFee_NC_49 = arguments.obj.getFee_NC_49() />
		<cfset var localFee_ND_50 = arguments.obj.getFee_ND_50() />
		<cfset var localFee_OH_51 = arguments.obj.getFee_OH_51() />
		<cfset var localFee_OK_52 = arguments.obj.getFee_OK_52() />
		<cfset var localFee_OR_53 = arguments.obj.getFee_OR_53() />
		<cfset var localFee_PA_54 = arguments.obj.getFee_PA_54() />
		<cfset var localFee_RI_55 = arguments.obj.getFee_RI_55() />
		<cfset var localFee_SC_56 = arguments.obj.getFee_SC_56() />
		<cfset var localFee_SD_57 = arguments.obj.getFee_SD_57() />
		<cfset var localFee_TN_58 = arguments.obj.getFee_TN_58() />
		<cfset var localFee_TX_59 = arguments.obj.getFee_TX_59() />
		<cfset var localFee_UT_60 = arguments.obj.getFee_UT_60() />
		<cfset var localFee_VT_61 = arguments.obj.getFee_VT_61() />
		<cfset var localFee_VA_62 = arguments.obj.getFee_VA_62() />
		<cfset var localFee_WA_63 = arguments.obj.getFee_WA_63() />
		<cfset var localFee_WV_64 = arguments.obj.getFee_WV_64() />
		<cfset var localFee_WI_65 = arguments.obj.getFee_WI_65() />
		<cfset var localFee_WY_66 = arguments.obj.getFee_WY_66() />
		<cfset var localFee_PR_229 = arguments.obj.getFee_PR_229() />
		<cfset var localFee_VI_238 = arguments.obj.getFee_VI_238() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule" datasource="#trim(variables.ds)#">
				UPDATE eob_medicare_2007_procedurecodefeeschedule  SET
					
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.obj.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EOB_MEDICARE_2007_PROCEDURECodeFeeScheduleActive" />
		<cfset var qDeleteEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule = "">

		<cfquery name="qDeleteEOB_MEDICARE_2007_PROCEDURECodeFeeSchedule" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM eob_medicare_2007_procedurecodefeeschedule
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





