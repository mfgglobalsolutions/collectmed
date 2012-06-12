<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleIO.cfc                               --->
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->
<!--- This tag is a CFC tag tied to the EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule   --->
<!--- table in the dB.                                                               --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleTable                  --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!--- Queryname<br>                                                                  --->
<!--- fields<br>                                                                     --->
<!--- orderby<br>                                                                    --->
<!--- groupby (same as fields contents maybe different order)<br>                    --->
<!--- andclause example.... (CN1= Column Name)                                       --->
<!--- [ andclause="RTRIM(CN1)+''+RTRIM(CN2)='#Var#'" ]<br>                           --->
<!--- RecordID<br>                                                                   --->
<!--- HCPCRecordID<br>                                                               --->
<!--- CategoryID<br>                                                                 --->
<!--- MOD1<br>                                                                       --->
<!--- MOD2<br>                                                                       --->
<!--- MOD3<br>                                                                       --->
<!--- MOD4<br>                                                                       --->
<!--- Ceiling<br>                                                                    --->
<!--- Floor<br>                                                                      --->
<!--- Fee_AL_16<br>                                                                  --->
<!--- Fee_AK_17<br>                                                                  --->
<!--- Fee_AZ_18<br>                                                                  --->
<!--- Fee_AR_19<br>                                                                  --->
<!--- Fee_CA_20<br>                                                                  --->
<!--- Fee_CO_21<br>                                                                  --->
<!--- Fee_CT_22<br>                                                                  --->
<!--- Fee_DE_23<br>                                                                  --->
<!--- Fee_DC_24<br>                                                                  --->
<!--- Fee_FL_25<br>                                                                  --->
<!--- Fee_GA_26<br>                                                                  --->
<!--- Fee_HI_27<br>                                                                  --->
<!--- Fee_ID_28<br>                                                                  --->
<!--- Fee_IL_29<br>                                                                  --->
<!--- Fee_IN_30<br>                                                                  --->
<!--- Fee_IA_31<br>                                                                  --->
<!--- Fee_KS_32<br>                                                                  --->
<!--- Fee_KY_33<br>                                                                  --->
<!--- Fee_LA_34<br>                                                                  --->
<!--- Fee_ME_35<br>                                                                  --->
<!--- Fee_MD_36<br>                                                                  --->
<!--- Fee_MA_37<br>                                                                  --->
<!--- Fee_MI_38<br>                                                                  --->
<!--- Fee_MN_39<br>                                                                  --->
<!--- Fee_MS_40<br>                                                                  --->
<!--- Fee_MO_41<br>                                                                  --->
<!--- Fee_MT_42<br>                                                                  --->
<!--- Fee_NE_43<br>                                                                  --->
<!--- Fee_NV_44<br>                                                                  --->
<!--- Fee_NE_45<br>                                                                  --->
<!--- Fee_NJ_46<br>                                                                  --->
<!--- Fee_NM_47<br>                                                                  --->
<!--- Fee_NY_48<br>                                                                  --->
<!--- Fee_NC_49<br>                                                                  --->
<!--- Fee_ND_50<br>                                                                  --->
<!--- Fee_OH_51<br>                                                                  --->
<!--- Fee_OK_52<br>                                                                  --->
<!--- Fee_OR_53<br>                                                                  --->
<!--- Fee_PA_54<br>                                                                  --->
<!--- Fee_RI_55<br>                                                                  --->
<!--- Fee_SC_56<br>                                                                  --->
<!--- Fee_SD_57<br>                                                                  --->
<!--- Fee_TN_58<br>                                                                  --->
<!--- Fee_TX_59<br>                                                                  --->
<!--- Fee_UT_60<br>                                                                  --->
<!--- Fee_VT_61<br>                                                                  --->
<!--- Fee_VA_62<br>                                                                  --->
<!--- Fee_WA_63<br>                                                                  --->
<!--- Fee_WV_64<br>                                                                  --->
<!--- Fee_WI_65<br>                                                                  --->
<!--- Fee_WY_66<br>                                                                  --->
<!--- Fee_PR_229<br>                                                                 --->
<!--- Fee_VI_238<br>                                                                 --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- recordID                                                                       --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.RecordID = "NULL";
			variables.instance.HCPCRecordID = "NULL";
			variables.instance.CategoryID = "NULL";
			variables.instance.MOD1 = "NULL";
			variables.instance.MOD2 = "NULL";
			variables.instance.MOD3 = "NULL";
			variables.instance.MOD4 = "NULL";
			variables.instance.Ceiling = "NULL";
			variables.instance.Floor = "NULL";
			variables.instance.Fee_AL_16 = "NULL";
			variables.instance.Fee_AK_17 = "NULL";
			variables.instance.Fee_AZ_18 = "NULL";
			variables.instance.Fee_AR_19 = "NULL";
			variables.instance.Fee_CA_20 = "NULL";
			variables.instance.Fee_CO_21 = "NULL";
			variables.instance.Fee_CT_22 = "NULL";
			variables.instance.Fee_DE_23 = "NULL";
			variables.instance.Fee_DC_24 = "NULL";
			variables.instance.Fee_FL_25 = "NULL";
			variables.instance.Fee_GA_26 = "NULL";
			variables.instance.Fee_HI_27 = "NULL";
			variables.instance.Fee_ID_28 = "NULL";
			variables.instance.Fee_IL_29 = "NULL";
			variables.instance.Fee_IN_30 = "NULL";
			variables.instance.Fee_IA_31 = "NULL";
			variables.instance.Fee_KS_32 = "NULL";
			variables.instance.Fee_KY_33 = "NULL";
			variables.instance.Fee_LA_34 = "NULL";
			variables.instance.Fee_ME_35 = "NULL";
			variables.instance.Fee_MD_36 = "NULL";
			variables.instance.Fee_MA_37 = "NULL";
			variables.instance.Fee_MI_38 = "NULL";
			variables.instance.Fee_MN_39 = "NULL";
			variables.instance.Fee_MS_40 = "NULL";
			variables.instance.Fee_MO_41 = "NULL";
			variables.instance.Fee_MT_42 = "NULL";
			variables.instance.Fee_NE_43 = "NULL";
			variables.instance.Fee_NV_44 = "NULL";
			variables.instance.Fee_NE_45 = "NULL";
			variables.instance.Fee_NJ_46 = "NULL";
			variables.instance.Fee_NM_47 = "NULL";
			variables.instance.Fee_NY_48 = "NULL";
			variables.instance.Fee_NC_49 = "NULL";
			variables.instance.Fee_ND_50 = "NULL";
			variables.instance.Fee_OH_51 = "NULL";
			variables.instance.Fee_OK_52 = "NULL";
			variables.instance.Fee_OR_53 = "NULL";
			variables.instance.Fee_PA_54 = "NULL";
			variables.instance.Fee_RI_55 = "NULL";
			variables.instance.Fee_SC_56 = "NULL";
			variables.instance.Fee_SD_57 = "NULL";
			variables.instance.Fee_TN_58 = "NULL";
			variables.instance.Fee_TX_59 = "NULL";
			variables.instance.Fee_UT_60 = "NULL";
			variables.instance.Fee_VT_61 = "NULL";
			variables.instance.Fee_VA_62 = "NULL";
			variables.instance.Fee_WA_63 = "NULL";
			variables.instance.Fee_WV_64 = "NULL";
			variables.instance.Fee_WI_65 = "NULL";
			variables.instance.Fee_WY_66 = "NULL";
			variables.instance.Fee_PR_229 = "NULL";
			variables.instance.Fee_VI_238 = "NULL";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 66)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RECORDID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCRECORDID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_KY_33", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_LA_34", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_ME_35", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_MD_36", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_MA_37", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_MI_38", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_MN_39", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_MS_40", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_MO_41", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_MT_42", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_NE_43", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_NV_44", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_NE_45", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_NJ_46", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_NM_47", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_NY_48", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_NC_49", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_ND_50", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_OH_51", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_OK_52", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_OR_53", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_PA_54", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_RI_55", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_SC_56", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_SD_57", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_TN_58", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_TX_59", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_UT_60", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_VT_61", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_VA_62", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 32)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_WA_63", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 33)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_WV_64", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 34)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_WI_65", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 35)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_WY_66", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 36)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_PR_229", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 37)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_VI_238", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 38)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 39)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 40)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 41)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 42)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CATEGORYID", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 43)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MOD1", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 44)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MOD2", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 45)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MOD3", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 46)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MOD4", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 47)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CEILING", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 48)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FLOOR", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 49)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_AL_16", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 50)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_AK_17", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 51)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_AZ_18", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 52)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_AR_19", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 53)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_CA_20", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 54)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_CO_21", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 55)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_CT_22", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 56)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_DE_23", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 57)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_DC_24", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 58)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_FL_25", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 59)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_GA_26", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 60)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_HI_27", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 61)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_ID_28", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 62)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_IL_29", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 63)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_IN_30", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 64)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_IA_31", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 65)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FEE_KS_32", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 66)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RecordID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRecordID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RecordID>
	</cffunction>
	 
	<cffunction name="setRecordID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RecordID" required="Yes" type="String">
		
		<cfif RecordID NEQ "NULL">	
			
			<cfif arguments.RecordID EQ "@@" OR arguments.RecordID EQ "">
				
				<cfset arguments.RecordID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(RecordID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RecordID</strong> (#RecordID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RecordID = arguments.RecordID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HCPCRecordID.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHCPCRecordID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HCPCRecordID>
	</cffunction>
	 
	<cffunction name="setHCPCRecordID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HCPCRecordID" required="Yes" type="String">
		
		<cfif HCPCRecordID NEQ "NULL">	
			
			<cfif arguments.HCPCRecordID EQ "@@" OR arguments.HCPCRecordID EQ "">
				
				<cfset arguments.HCPCRecordID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(HCPCRecordID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HCPCRecordID</strong> (#HCPCRecordID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HCPCRecordID = arguments.HCPCRecordID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HCPCRecordID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CategoryID.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCategoryID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CategoryID>
	</cffunction>
	 
	<cffunction name="setCategoryID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CategoryID" required="Yes" type="String">
		
		<cfif CategoryID NEQ "NULL">	
			
			<cfif arguments.CategoryID EQ "@@" OR arguments.CategoryID EQ "">
				
				<cfset arguments.CategoryID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(CategoryID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CategoryID</strong> (#CategoryID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CategoryID = arguments.CategoryID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CategoryID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MOD1.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMOD1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MOD1>
	</cffunction>
	 
	<cffunction name="setMOD1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MOD1" required="Yes" type="String">
		
		<cfif MOD1 NEQ "NULL">	
			
			<cfif arguments.MOD1 EQ "@@" OR arguments.MOD1 EQ "">
				
				<cfset arguments.MOD1 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(MOD1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MOD1</strong> (#MOD1#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MOD1 = arguments.MOD1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MOD1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MOD2.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMOD2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MOD2>
	</cffunction>
	 
	<cffunction name="setMOD2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MOD2" required="Yes" type="String">
		
		<cfif MOD2 NEQ "NULL">	
			
			<cfif arguments.MOD2 EQ "@@" OR arguments.MOD2 EQ "">
				
				<cfset arguments.MOD2 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(MOD2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MOD2</strong> (#MOD2#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MOD2 = arguments.MOD2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MOD2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MOD3.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMOD3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MOD3>
	</cffunction>
	 
	<cffunction name="setMOD3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MOD3" required="Yes" type="String">
		
		<cfif MOD3 NEQ "NULL">	
			
			<cfif arguments.MOD3 EQ "@@" OR arguments.MOD3 EQ "">
				
				<cfset arguments.MOD3 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(MOD3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MOD3</strong> (#MOD3#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MOD3 = arguments.MOD3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MOD3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MOD4.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMOD4" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MOD4>
	</cffunction>
	 
	<cffunction name="setMOD4" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MOD4" required="Yes" type="String">
		
		<cfif MOD4 NEQ "NULL">	
			
			<cfif arguments.MOD4 EQ "@@" OR arguments.MOD4 EQ "">
				
				<cfset arguments.MOD4 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(MOD4)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MOD4</strong> (#MOD4#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MOD4 = arguments.MOD4>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MOD4")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Ceiling.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCeiling" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Ceiling>
	</cffunction>
	 
	<cffunction name="setCeiling" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Ceiling" required="Yes" type="String">
		
		<cfif Ceiling NEQ "NULL">	
			
			<cfif arguments.Ceiling EQ "@@" OR arguments.Ceiling EQ "">
				
				<cfset arguments.Ceiling = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Ceiling)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Ceiling</strong> (#Ceiling#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Ceiling = arguments.Ceiling>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Ceiling")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Floor.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFloor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Floor>
	</cffunction>
	 
	<cffunction name="setFloor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Floor" required="Yes" type="String">
		
		<cfif Floor NEQ "NULL">	
			
			<cfif arguments.Floor EQ "@@" OR arguments.Floor EQ "">
				
				<cfset arguments.Floor = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Floor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Floor</strong> (#Floor#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Floor = arguments.Floor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Floor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_AL_16.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_AL_16" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_AL_16>
	</cffunction>
	 
	<cffunction name="setFee_AL_16" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_AL_16" required="Yes" type="String">
		
		<cfif Fee_AL_16 NEQ "NULL">	
			
			<cfif arguments.Fee_AL_16 EQ "@@" OR arguments.Fee_AL_16 EQ "">
				
				<cfset arguments.Fee_AL_16 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_AL_16)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_AL_16</strong> (#Fee_AL_16#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_AL_16 = arguments.Fee_AL_16>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_AL_16")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_AK_17.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_AK_17" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_AK_17>
	</cffunction>
	 
	<cffunction name="setFee_AK_17" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_AK_17" required="Yes" type="String">
		
		<cfif Fee_AK_17 NEQ "NULL">	
			
			<cfif arguments.Fee_AK_17 EQ "@@" OR arguments.Fee_AK_17 EQ "">
				
				<cfset arguments.Fee_AK_17 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_AK_17)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_AK_17</strong> (#Fee_AK_17#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_AK_17 = arguments.Fee_AK_17>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_AK_17")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_AZ_18.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_AZ_18" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_AZ_18>
	</cffunction>
	 
	<cffunction name="setFee_AZ_18" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_AZ_18" required="Yes" type="String">
		
		<cfif Fee_AZ_18 NEQ "NULL">	
			
			<cfif arguments.Fee_AZ_18 EQ "@@" OR arguments.Fee_AZ_18 EQ "">
				
				<cfset arguments.Fee_AZ_18 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_AZ_18)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_AZ_18</strong> (#Fee_AZ_18#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_AZ_18 = arguments.Fee_AZ_18>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_AZ_18")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_AR_19.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_AR_19" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_AR_19>
	</cffunction>
	 
	<cffunction name="setFee_AR_19" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_AR_19" required="Yes" type="String">
		
		<cfif Fee_AR_19 NEQ "NULL">	
			
			<cfif arguments.Fee_AR_19 EQ "@@" OR arguments.Fee_AR_19 EQ "">
				
				<cfset arguments.Fee_AR_19 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_AR_19)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_AR_19</strong> (#Fee_AR_19#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_AR_19 = arguments.Fee_AR_19>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_AR_19")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_CA_20.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_CA_20" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_CA_20>
	</cffunction>
	 
	<cffunction name="setFee_CA_20" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_CA_20" required="Yes" type="String">
		
		<cfif Fee_CA_20 NEQ "NULL">	
			
			<cfif arguments.Fee_CA_20 EQ "@@" OR arguments.Fee_CA_20 EQ "">
				
				<cfset arguments.Fee_CA_20 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_CA_20)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_CA_20</strong> (#Fee_CA_20#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_CA_20 = arguments.Fee_CA_20>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_CA_20")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_CO_21.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_CO_21" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_CO_21>
	</cffunction>
	 
	<cffunction name="setFee_CO_21" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_CO_21" required="Yes" type="String">
		
		<cfif Fee_CO_21 NEQ "NULL">	
			
			<cfif arguments.Fee_CO_21 EQ "@@" OR arguments.Fee_CO_21 EQ "">
				
				<cfset arguments.Fee_CO_21 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_CO_21)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_CO_21</strong> (#Fee_CO_21#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_CO_21 = arguments.Fee_CO_21>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_CO_21")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_CT_22.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_CT_22" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_CT_22>
	</cffunction>
	 
	<cffunction name="setFee_CT_22" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_CT_22" required="Yes" type="String">
		
		<cfif Fee_CT_22 NEQ "NULL">	
			
			<cfif arguments.Fee_CT_22 EQ "@@" OR arguments.Fee_CT_22 EQ "">
				
				<cfset arguments.Fee_CT_22 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_CT_22)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_CT_22</strong> (#Fee_CT_22#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_CT_22 = arguments.Fee_CT_22>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_CT_22")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_DE_23.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_DE_23" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_DE_23>
	</cffunction>
	 
	<cffunction name="setFee_DE_23" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_DE_23" required="Yes" type="String">
		
		<cfif Fee_DE_23 NEQ "NULL">	
			
			<cfif arguments.Fee_DE_23 EQ "@@" OR arguments.Fee_DE_23 EQ "">
				
				<cfset arguments.Fee_DE_23 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_DE_23)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_DE_23</strong> (#Fee_DE_23#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_DE_23 = arguments.Fee_DE_23>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_DE_23")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_DC_24.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_DC_24" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_DC_24>
	</cffunction>
	 
	<cffunction name="setFee_DC_24" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_DC_24" required="Yes" type="String">
		
		<cfif Fee_DC_24 NEQ "NULL">	
			
			<cfif arguments.Fee_DC_24 EQ "@@" OR arguments.Fee_DC_24 EQ "">
				
				<cfset arguments.Fee_DC_24 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_DC_24)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_DC_24</strong> (#Fee_DC_24#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_DC_24 = arguments.Fee_DC_24>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_DC_24")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_FL_25.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_FL_25" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_FL_25>
	</cffunction>
	 
	<cffunction name="setFee_FL_25" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_FL_25" required="Yes" type="String">
		
		<cfif Fee_FL_25 NEQ "NULL">	
			
			<cfif arguments.Fee_FL_25 EQ "@@" OR arguments.Fee_FL_25 EQ "">
				
				<cfset arguments.Fee_FL_25 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_FL_25)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_FL_25</strong> (#Fee_FL_25#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_FL_25 = arguments.Fee_FL_25>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_FL_25")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_GA_26.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_GA_26" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_GA_26>
	</cffunction>
	 
	<cffunction name="setFee_GA_26" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_GA_26" required="Yes" type="String">
		
		<cfif Fee_GA_26 NEQ "NULL">	
			
			<cfif arguments.Fee_GA_26 EQ "@@" OR arguments.Fee_GA_26 EQ "">
				
				<cfset arguments.Fee_GA_26 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_GA_26)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_GA_26</strong> (#Fee_GA_26#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_GA_26 = arguments.Fee_GA_26>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_GA_26")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_HI_27.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_HI_27" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_HI_27>
	</cffunction>
	 
	<cffunction name="setFee_HI_27" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_HI_27" required="Yes" type="String">
		
		<cfif Fee_HI_27 NEQ "NULL">	
			
			<cfif arguments.Fee_HI_27 EQ "@@" OR arguments.Fee_HI_27 EQ "">
				
				<cfset arguments.Fee_HI_27 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_HI_27)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_HI_27</strong> (#Fee_HI_27#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_HI_27 = arguments.Fee_HI_27>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_HI_27")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_ID_28.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_ID_28" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_ID_28>
	</cffunction>
	 
	<cffunction name="setFee_ID_28" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_ID_28" required="Yes" type="String">
		
		<cfif Fee_ID_28 NEQ "NULL">	
			
			<cfif arguments.Fee_ID_28 EQ "@@" OR arguments.Fee_ID_28 EQ "">
				
				<cfset arguments.Fee_ID_28 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_ID_28)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_ID_28</strong> (#Fee_ID_28#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_ID_28 = arguments.Fee_ID_28>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_ID_28")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_IL_29.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_IL_29" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_IL_29>
	</cffunction>
	 
	<cffunction name="setFee_IL_29" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_IL_29" required="Yes" type="String">
		
		<cfif Fee_IL_29 NEQ "NULL">	
			
			<cfif arguments.Fee_IL_29 EQ "@@" OR arguments.Fee_IL_29 EQ "">
				
				<cfset arguments.Fee_IL_29 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_IL_29)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_IL_29</strong> (#Fee_IL_29#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_IL_29 = arguments.Fee_IL_29>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_IL_29")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_IN_30.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_IN_30" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_IN_30>
	</cffunction>
	 
	<cffunction name="setFee_IN_30" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_IN_30" required="Yes" type="String">
		
		<cfif Fee_IN_30 NEQ "NULL">	
			
			<cfif arguments.Fee_IN_30 EQ "@@" OR arguments.Fee_IN_30 EQ "">
				
				<cfset arguments.Fee_IN_30 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_IN_30)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_IN_30</strong> (#Fee_IN_30#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_IN_30 = arguments.Fee_IN_30>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_IN_30")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_IA_31.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_IA_31" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_IA_31>
	</cffunction>
	 
	<cffunction name="setFee_IA_31" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_IA_31" required="Yes" type="String">
		
		<cfif Fee_IA_31 NEQ "NULL">	
			
			<cfif arguments.Fee_IA_31 EQ "@@" OR arguments.Fee_IA_31 EQ "">
				
				<cfset arguments.Fee_IA_31 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_IA_31)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_IA_31</strong> (#Fee_IA_31#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_IA_31 = arguments.Fee_IA_31>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_IA_31")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_KS_32.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_KS_32" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_KS_32>
	</cffunction>
	 
	<cffunction name="setFee_KS_32" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_KS_32" required="Yes" type="String">
		
		<cfif Fee_KS_32 NEQ "NULL">	
			
			<cfif arguments.Fee_KS_32 EQ "@@" OR arguments.Fee_KS_32 EQ "">
				
				<cfset arguments.Fee_KS_32 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_KS_32)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_KS_32</strong> (#Fee_KS_32#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_KS_32 = arguments.Fee_KS_32>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_KS_32")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_KY_33.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_KY_33" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_KY_33>
	</cffunction>
	 
	<cffunction name="setFee_KY_33" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_KY_33" required="Yes" type="String">
		
		<cfif Fee_KY_33 NEQ "NULL">	
			
			<cfif arguments.Fee_KY_33 EQ "@@" OR arguments.Fee_KY_33 EQ "">
				
				<cfset arguments.Fee_KY_33 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_KY_33)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_KY_33</strong> (#Fee_KY_33#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_KY_33 = arguments.Fee_KY_33>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_KY_33")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_LA_34.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_LA_34" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_LA_34>
	</cffunction>
	 
	<cffunction name="setFee_LA_34" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_LA_34" required="Yes" type="String">
		
		<cfif Fee_LA_34 NEQ "NULL">	
			
			<cfif arguments.Fee_LA_34 EQ "@@" OR arguments.Fee_LA_34 EQ "">
				
				<cfset arguments.Fee_LA_34 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_LA_34)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_LA_34</strong> (#Fee_LA_34#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_LA_34 = arguments.Fee_LA_34>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_LA_34")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_ME_35.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_ME_35" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_ME_35>
	</cffunction>
	 
	<cffunction name="setFee_ME_35" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_ME_35" required="Yes" type="String">
		
		<cfif Fee_ME_35 NEQ "NULL">	
			
			<cfif arguments.Fee_ME_35 EQ "@@" OR arguments.Fee_ME_35 EQ "">
				
				<cfset arguments.Fee_ME_35 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_ME_35)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_ME_35</strong> (#Fee_ME_35#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_ME_35 = arguments.Fee_ME_35>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_ME_35")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_MD_36.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_MD_36" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_MD_36>
	</cffunction>
	 
	<cffunction name="setFee_MD_36" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_MD_36" required="Yes" type="String">
		
		<cfif Fee_MD_36 NEQ "NULL">	
			
			<cfif arguments.Fee_MD_36 EQ "@@" OR arguments.Fee_MD_36 EQ "">
				
				<cfset arguments.Fee_MD_36 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_MD_36)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_MD_36</strong> (#Fee_MD_36#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_MD_36 = arguments.Fee_MD_36>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_MD_36")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_MA_37.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_MA_37" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_MA_37>
	</cffunction>
	 
	<cffunction name="setFee_MA_37" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_MA_37" required="Yes" type="String">
		
		<cfif Fee_MA_37 NEQ "NULL">	
			
			<cfif arguments.Fee_MA_37 EQ "@@" OR arguments.Fee_MA_37 EQ "">
				
				<cfset arguments.Fee_MA_37 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_MA_37)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_MA_37</strong> (#Fee_MA_37#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_MA_37 = arguments.Fee_MA_37>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_MA_37")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_MI_38.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_MI_38" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_MI_38>
	</cffunction>
	 
	<cffunction name="setFee_MI_38" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_MI_38" required="Yes" type="String">
		
		<cfif Fee_MI_38 NEQ "NULL">	
			
			<cfif arguments.Fee_MI_38 EQ "@@" OR arguments.Fee_MI_38 EQ "">
				
				<cfset arguments.Fee_MI_38 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_MI_38)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_MI_38</strong> (#Fee_MI_38#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_MI_38 = arguments.Fee_MI_38>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_MI_38")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_MN_39.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_MN_39" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_MN_39>
	</cffunction>
	 
	<cffunction name="setFee_MN_39" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_MN_39" required="Yes" type="String">
		
		<cfif Fee_MN_39 NEQ "NULL">	
			
			<cfif arguments.Fee_MN_39 EQ "@@" OR arguments.Fee_MN_39 EQ "">
				
				<cfset arguments.Fee_MN_39 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_MN_39)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_MN_39</strong> (#Fee_MN_39#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_MN_39 = arguments.Fee_MN_39>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_MN_39")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_MS_40.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_MS_40" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_MS_40>
	</cffunction>
	 
	<cffunction name="setFee_MS_40" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_MS_40" required="Yes" type="String">
		
		<cfif Fee_MS_40 NEQ "NULL">	
			
			<cfif arguments.Fee_MS_40 EQ "@@" OR arguments.Fee_MS_40 EQ "">
				
				<cfset arguments.Fee_MS_40 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_MS_40)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_MS_40</strong> (#Fee_MS_40#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_MS_40 = arguments.Fee_MS_40>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_MS_40")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_MO_41.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_MO_41" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_MO_41>
	</cffunction>
	 
	<cffunction name="setFee_MO_41" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_MO_41" required="Yes" type="String">
		
		<cfif Fee_MO_41 NEQ "NULL">	
			
			<cfif arguments.Fee_MO_41 EQ "@@" OR arguments.Fee_MO_41 EQ "">
				
				<cfset arguments.Fee_MO_41 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_MO_41)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_MO_41</strong> (#Fee_MO_41#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_MO_41 = arguments.Fee_MO_41>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_MO_41")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_MT_42.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_MT_42" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_MT_42>
	</cffunction>
	 
	<cffunction name="setFee_MT_42" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_MT_42" required="Yes" type="String">
		
		<cfif Fee_MT_42 NEQ "NULL">	
			
			<cfif arguments.Fee_MT_42 EQ "@@" OR arguments.Fee_MT_42 EQ "">
				
				<cfset arguments.Fee_MT_42 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_MT_42)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_MT_42</strong> (#Fee_MT_42#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_MT_42 = arguments.Fee_MT_42>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_MT_42")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_NE_43.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_NE_43" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_NE_43>
	</cffunction>
	 
	<cffunction name="setFee_NE_43" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_NE_43" required="Yes" type="String">
		
		<cfif Fee_NE_43 NEQ "NULL">	
			
			<cfif arguments.Fee_NE_43 EQ "@@" OR arguments.Fee_NE_43 EQ "">
				
				<cfset arguments.Fee_NE_43 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_NE_43)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_NE_43</strong> (#Fee_NE_43#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_NE_43 = arguments.Fee_NE_43>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_NE_43")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_NV_44.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_NV_44" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_NV_44>
	</cffunction>
	 
	<cffunction name="setFee_NV_44" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_NV_44" required="Yes" type="String">
		
		<cfif Fee_NV_44 NEQ "NULL">	
			
			<cfif arguments.Fee_NV_44 EQ "@@" OR arguments.Fee_NV_44 EQ "">
				
				<cfset arguments.Fee_NV_44 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_NV_44)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_NV_44</strong> (#Fee_NV_44#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_NV_44 = arguments.Fee_NV_44>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_NV_44")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_NE_45.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_NE_45" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_NE_45>
	</cffunction>
	 
	<cffunction name="setFee_NE_45" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_NE_45" required="Yes" type="String">
		
		<cfif Fee_NE_45 NEQ "NULL">	
			
			<cfif arguments.Fee_NE_45 EQ "@@" OR arguments.Fee_NE_45 EQ "">
				
				<cfset arguments.Fee_NE_45 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_NE_45)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_NE_45</strong> (#Fee_NE_45#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_NE_45 = arguments.Fee_NE_45>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_NE_45")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_NJ_46.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_NJ_46" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_NJ_46>
	</cffunction>
	 
	<cffunction name="setFee_NJ_46" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_NJ_46" required="Yes" type="String">
		
		<cfif Fee_NJ_46 NEQ "NULL">	
			
			<cfif arguments.Fee_NJ_46 EQ "@@" OR arguments.Fee_NJ_46 EQ "">
				
				<cfset arguments.Fee_NJ_46 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_NJ_46)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_NJ_46</strong> (#Fee_NJ_46#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_NJ_46 = arguments.Fee_NJ_46>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_NJ_46")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_NM_47.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_NM_47" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_NM_47>
	</cffunction>
	 
	<cffunction name="setFee_NM_47" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_NM_47" required="Yes" type="String">
		
		<cfif Fee_NM_47 NEQ "NULL">	
			
			<cfif arguments.Fee_NM_47 EQ "@@" OR arguments.Fee_NM_47 EQ "">
				
				<cfset arguments.Fee_NM_47 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_NM_47)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_NM_47</strong> (#Fee_NM_47#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_NM_47 = arguments.Fee_NM_47>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_NM_47")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_NY_48.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_NY_48" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_NY_48>
	</cffunction>
	 
	<cffunction name="setFee_NY_48" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_NY_48" required="Yes" type="String">
		
		<cfif Fee_NY_48 NEQ "NULL">	
			
			<cfif arguments.Fee_NY_48 EQ "@@" OR arguments.Fee_NY_48 EQ "">
				
				<cfset arguments.Fee_NY_48 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_NY_48)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_NY_48</strong> (#Fee_NY_48#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_NY_48 = arguments.Fee_NY_48>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_NY_48")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_NC_49.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_NC_49" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_NC_49>
	</cffunction>
	 
	<cffunction name="setFee_NC_49" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_NC_49" required="Yes" type="String">
		
		<cfif Fee_NC_49 NEQ "NULL">	
			
			<cfif arguments.Fee_NC_49 EQ "@@" OR arguments.Fee_NC_49 EQ "">
				
				<cfset arguments.Fee_NC_49 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_NC_49)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_NC_49</strong> (#Fee_NC_49#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_NC_49 = arguments.Fee_NC_49>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_NC_49")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_ND_50.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_ND_50" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_ND_50>
	</cffunction>
	 
	<cffunction name="setFee_ND_50" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_ND_50" required="Yes" type="String">
		
		<cfif Fee_ND_50 NEQ "NULL">	
			
			<cfif arguments.Fee_ND_50 EQ "@@" OR arguments.Fee_ND_50 EQ "">
				
				<cfset arguments.Fee_ND_50 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_ND_50)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_ND_50</strong> (#Fee_ND_50#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_ND_50 = arguments.Fee_ND_50>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_ND_50")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_OH_51.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_OH_51" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_OH_51>
	</cffunction>
	 
	<cffunction name="setFee_OH_51" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_OH_51" required="Yes" type="String">
		
		<cfif Fee_OH_51 NEQ "NULL">	
			
			<cfif arguments.Fee_OH_51 EQ "@@" OR arguments.Fee_OH_51 EQ "">
				
				<cfset arguments.Fee_OH_51 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_OH_51)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_OH_51</strong> (#Fee_OH_51#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_OH_51 = arguments.Fee_OH_51>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_OH_51")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_OK_52.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_OK_52" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_OK_52>
	</cffunction>
	 
	<cffunction name="setFee_OK_52" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_OK_52" required="Yes" type="String">
		
		<cfif Fee_OK_52 NEQ "NULL">	
			
			<cfif arguments.Fee_OK_52 EQ "@@" OR arguments.Fee_OK_52 EQ "">
				
				<cfset arguments.Fee_OK_52 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_OK_52)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_OK_52</strong> (#Fee_OK_52#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_OK_52 = arguments.Fee_OK_52>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_OK_52")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_OR_53.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_OR_53" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_OR_53>
	</cffunction>
	 
	<cffunction name="setFee_OR_53" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_OR_53" required="Yes" type="String">
		
		<cfif Fee_OR_53 NEQ "NULL">	
			
			<cfif arguments.Fee_OR_53 EQ "@@" OR arguments.Fee_OR_53 EQ "">
				
				<cfset arguments.Fee_OR_53 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_OR_53)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_OR_53</strong> (#Fee_OR_53#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_OR_53 = arguments.Fee_OR_53>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_OR_53")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_PA_54.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_PA_54" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_PA_54>
	</cffunction>
	 
	<cffunction name="setFee_PA_54" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_PA_54" required="Yes" type="String">
		
		<cfif Fee_PA_54 NEQ "NULL">	
			
			<cfif arguments.Fee_PA_54 EQ "@@" OR arguments.Fee_PA_54 EQ "">
				
				<cfset arguments.Fee_PA_54 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_PA_54)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_PA_54</strong> (#Fee_PA_54#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_PA_54 = arguments.Fee_PA_54>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_PA_54")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_RI_55.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_RI_55" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_RI_55>
	</cffunction>
	 
	<cffunction name="setFee_RI_55" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_RI_55" required="Yes" type="String">
		
		<cfif Fee_RI_55 NEQ "NULL">	
			
			<cfif arguments.Fee_RI_55 EQ "@@" OR arguments.Fee_RI_55 EQ "">
				
				<cfset arguments.Fee_RI_55 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_RI_55)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_RI_55</strong> (#Fee_RI_55#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_RI_55 = arguments.Fee_RI_55>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_RI_55")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_SC_56.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_SC_56" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_SC_56>
	</cffunction>
	 
	<cffunction name="setFee_SC_56" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_SC_56" required="Yes" type="String">
		
		<cfif Fee_SC_56 NEQ "NULL">	
			
			<cfif arguments.Fee_SC_56 EQ "@@" OR arguments.Fee_SC_56 EQ "">
				
				<cfset arguments.Fee_SC_56 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_SC_56)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_SC_56</strong> (#Fee_SC_56#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_SC_56 = arguments.Fee_SC_56>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_SC_56")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_SD_57.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_SD_57" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_SD_57>
	</cffunction>
	 
	<cffunction name="setFee_SD_57" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_SD_57" required="Yes" type="String">
		
		<cfif Fee_SD_57 NEQ "NULL">	
			
			<cfif arguments.Fee_SD_57 EQ "@@" OR arguments.Fee_SD_57 EQ "">
				
				<cfset arguments.Fee_SD_57 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_SD_57)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_SD_57</strong> (#Fee_SD_57#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_SD_57 = arguments.Fee_SD_57>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_SD_57")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_TN_58.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_TN_58" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_TN_58>
	</cffunction>
	 
	<cffunction name="setFee_TN_58" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_TN_58" required="Yes" type="String">
		
		<cfif Fee_TN_58 NEQ "NULL">	
			
			<cfif arguments.Fee_TN_58 EQ "@@" OR arguments.Fee_TN_58 EQ "">
				
				<cfset arguments.Fee_TN_58 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_TN_58)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_TN_58</strong> (#Fee_TN_58#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_TN_58 = arguments.Fee_TN_58>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_TN_58")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_TX_59.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_TX_59" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_TX_59>
	</cffunction>
	 
	<cffunction name="setFee_TX_59" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_TX_59" required="Yes" type="String">
		
		<cfif Fee_TX_59 NEQ "NULL">	
			
			<cfif arguments.Fee_TX_59 EQ "@@" OR arguments.Fee_TX_59 EQ "">
				
				<cfset arguments.Fee_TX_59 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_TX_59)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_TX_59</strong> (#Fee_TX_59#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_TX_59 = arguments.Fee_TX_59>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_TX_59")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_UT_60.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_UT_60" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_UT_60>
	</cffunction>
	 
	<cffunction name="setFee_UT_60" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_UT_60" required="Yes" type="String">
		
		<cfif Fee_UT_60 NEQ "NULL">	
			
			<cfif arguments.Fee_UT_60 EQ "@@" OR arguments.Fee_UT_60 EQ "">
				
				<cfset arguments.Fee_UT_60 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_UT_60)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_UT_60</strong> (#Fee_UT_60#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_UT_60 = arguments.Fee_UT_60>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_UT_60")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_VT_61.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_VT_61" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_VT_61>
	</cffunction>
	 
	<cffunction name="setFee_VT_61" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_VT_61" required="Yes" type="String">
		
		<cfif Fee_VT_61 NEQ "NULL">	
			
			<cfif arguments.Fee_VT_61 EQ "@@" OR arguments.Fee_VT_61 EQ "">
				
				<cfset arguments.Fee_VT_61 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_VT_61)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_VT_61</strong> (#Fee_VT_61#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_VT_61 = arguments.Fee_VT_61>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_VT_61")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_VA_62.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_VA_62" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_VA_62>
	</cffunction>
	 
	<cffunction name="setFee_VA_62" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_VA_62" required="Yes" type="String">
		
		<cfif Fee_VA_62 NEQ "NULL">	
			
			<cfif arguments.Fee_VA_62 EQ "@@" OR arguments.Fee_VA_62 EQ "">
				
				<cfset arguments.Fee_VA_62 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_VA_62)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_VA_62</strong> (#Fee_VA_62#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_VA_62 = arguments.Fee_VA_62>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_VA_62")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_WA_63.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_WA_63" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_WA_63>
	</cffunction>
	 
	<cffunction name="setFee_WA_63" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_WA_63" required="Yes" type="String">
		
		<cfif Fee_WA_63 NEQ "NULL">	
			
			<cfif arguments.Fee_WA_63 EQ "@@" OR arguments.Fee_WA_63 EQ "">
				
				<cfset arguments.Fee_WA_63 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_WA_63)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_WA_63</strong> (#Fee_WA_63#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_WA_63 = arguments.Fee_WA_63>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_WA_63")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_WV_64.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_WV_64" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_WV_64>
	</cffunction>
	 
	<cffunction name="setFee_WV_64" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_WV_64" required="Yes" type="String">
		
		<cfif Fee_WV_64 NEQ "NULL">	
			
			<cfif arguments.Fee_WV_64 EQ "@@" OR arguments.Fee_WV_64 EQ "">
				
				<cfset arguments.Fee_WV_64 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_WV_64)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_WV_64</strong> (#Fee_WV_64#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_WV_64 = arguments.Fee_WV_64>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_WV_64")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_WI_65.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_WI_65" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_WI_65>
	</cffunction>
	 
	<cffunction name="setFee_WI_65" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_WI_65" required="Yes" type="String">
		
		<cfif Fee_WI_65 NEQ "NULL">	
			
			<cfif arguments.Fee_WI_65 EQ "@@" OR arguments.Fee_WI_65 EQ "">
				
				<cfset arguments.Fee_WI_65 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_WI_65)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_WI_65</strong> (#Fee_WI_65#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_WI_65 = arguments.Fee_WI_65>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_WI_65")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_WY_66.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_WY_66" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_WY_66>
	</cffunction>
	 
	<cffunction name="setFee_WY_66" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_WY_66" required="Yes" type="String">
		
		<cfif Fee_WY_66 NEQ "NULL">	
			
			<cfif arguments.Fee_WY_66 EQ "@@" OR arguments.Fee_WY_66 EQ "">
				
				<cfset arguments.Fee_WY_66 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_WY_66)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_WY_66</strong> (#Fee_WY_66#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_WY_66 = arguments.Fee_WY_66>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_WY_66")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_PR_229.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_PR_229" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_PR_229>
	</cffunction>
	 
	<cffunction name="setFee_PR_229" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_PR_229" required="Yes" type="String">
		
		<cfif Fee_PR_229 NEQ "NULL">	
			
			<cfif arguments.Fee_PR_229 EQ "@@" OR arguments.Fee_PR_229 EQ "">
				
				<cfset arguments.Fee_PR_229 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_PR_229)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_PR_229</strong> (#Fee_PR_229#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_PR_229 = arguments.Fee_PR_229>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_PR_229")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fee_VI_238.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFee_VI_238" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fee_VI_238>
	</cffunction>
	 
	<cffunction name="setFee_VI_238" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fee_VI_238" required="Yes" type="String">
		
		<cfif Fee_VI_238 NEQ "NULL">	
			
			<cfif arguments.Fee_VI_238 EQ "@@" OR arguments.Fee_VI_238 EQ "">
				
				<cfset arguments.Fee_VI_238 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(Fee_VI_238)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fee_VI_238</strong> (#Fee_VI_238#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fee_VI_238 = arguments.Fee_VI_238>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fee_VI_238")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="HCPCRecordID" required="No" type="String" default="">
		<cfargument name="CategoryID" required="No" type="String" default="">
		<cfargument name="MOD1" required="No" type="String" default="">
		<cfargument name="MOD2" required="No" type="String" default="">
		<cfargument name="MOD3" required="No" type="String" default="">
		<cfargument name="MOD4" required="No" type="String" default="">
		<cfargument name="Ceiling" required="No" type="String" default="">
		<cfargument name="Floor" required="No" type="String" default="">
		<cfargument name="Fee_AL_16" required="No" type="String" default="">
		<cfargument name="Fee_AK_17" required="No" type="String" default="">
		<cfargument name="Fee_AZ_18" required="No" type="String" default="">
		<cfargument name="Fee_AR_19" required="No" type="String" default="">
		<cfargument name="Fee_CA_20" required="No" type="String" default="">
		<cfargument name="Fee_CO_21" required="No" type="String" default="">
		<cfargument name="Fee_CT_22" required="No" type="String" default="">
		<cfargument name="Fee_DE_23" required="No" type="String" default="">
		<cfargument name="Fee_DC_24" required="No" type="String" default="">
		<cfargument name="Fee_FL_25" required="No" type="String" default="">
		<cfargument name="Fee_GA_26" required="No" type="String" default="">
		<cfargument name="Fee_HI_27" required="No" type="String" default="">
		<cfargument name="Fee_ID_28" required="No" type="String" default="">
		<cfargument name="Fee_IL_29" required="No" type="String" default="">
		<cfargument name="Fee_IN_30" required="No" type="String" default="">
		<cfargument name="Fee_IA_31" required="No" type="String" default="">
		<cfargument name="Fee_KS_32" required="No" type="String" default="">
		<cfargument name="Fee_KY_33" required="No" type="String" default="">
		<cfargument name="Fee_LA_34" required="No" type="String" default="">
		<cfargument name="Fee_ME_35" required="No" type="String" default="">
		<cfargument name="Fee_MD_36" required="No" type="String" default="">
		<cfargument name="Fee_MA_37" required="No" type="String" default="">
		<cfargument name="Fee_MI_38" required="No" type="String" default="">
		<cfargument name="Fee_MN_39" required="No" type="String" default="">
		<cfargument name="Fee_MS_40" required="No" type="String" default="">
		<cfargument name="Fee_MO_41" required="No" type="String" default="">
		<cfargument name="Fee_MT_42" required="No" type="String" default="">
		<cfargument name="Fee_NE_43" required="No" type="String" default="">
		<cfargument name="Fee_NV_44" required="No" type="String" default="">
		<cfargument name="Fee_NE_45" required="No" type="String" default="">
		<cfargument name="Fee_NJ_46" required="No" type="String" default="">
		<cfargument name="Fee_NM_47" required="No" type="String" default="">
		<cfargument name="Fee_NY_48" required="No" type="String" default="">
		<cfargument name="Fee_NC_49" required="No" type="String" default="">
		<cfargument name="Fee_ND_50" required="No" type="String" default="">
		<cfargument name="Fee_OH_51" required="No" type="String" default="">
		<cfargument name="Fee_OK_52" required="No" type="String" default="">
		<cfargument name="Fee_OR_53" required="No" type="String" default="">
		<cfargument name="Fee_PA_54" required="No" type="String" default="">
		<cfargument name="Fee_RI_55" required="No" type="String" default="">
		<cfargument name="Fee_SC_56" required="No" type="String" default="">
		<cfargument name="Fee_SD_57" required="No" type="String" default="">
		<cfargument name="Fee_TN_58" required="No" type="String" default="">
		<cfargument name="Fee_TX_59" required="No" type="String" default="">
		<cfargument name="Fee_UT_60" required="No" type="String" default="">
		<cfargument name="Fee_VT_61" required="No" type="String" default="">
		<cfargument name="Fee_VA_62" required="No" type="String" default="">
		<cfargument name="Fee_WA_63" required="No" type="String" default="">
		<cfargument name="Fee_WV_64" required="No" type="String" default="">
		<cfargument name="Fee_WI_65" required="No" type="String" default="">
		<cfargument name="Fee_WY_66" required="No" type="String" default="">
		<cfargument name="Fee_PR_229" required="No" type="String" default="">
		<cfargument name="Fee_VI_238" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.HCPCRecordID = arguments.HCPCRecordID>
		<cfset variables.instance.CategoryID = arguments.CategoryID>
		<cfset variables.instance.MOD1 = arguments.MOD1>
		<cfset variables.instance.MOD2 = arguments.MOD2>
		<cfset variables.instance.MOD3 = arguments.MOD3>
		<cfset variables.instance.MOD4 = arguments.MOD4>
		<cfset variables.instance.Ceiling = arguments.Ceiling>
		<cfset variables.instance.Floor = arguments.Floor>
		<cfset variables.instance.Fee_AL_16 = arguments.Fee_AL_16>
		<cfset variables.instance.Fee_AK_17 = arguments.Fee_AK_17>
		<cfset variables.instance.Fee_AZ_18 = arguments.Fee_AZ_18>
		<cfset variables.instance.Fee_AR_19 = arguments.Fee_AR_19>
		<cfset variables.instance.Fee_CA_20 = arguments.Fee_CA_20>
		<cfset variables.instance.Fee_CO_21 = arguments.Fee_CO_21>
		<cfset variables.instance.Fee_CT_22 = arguments.Fee_CT_22>
		<cfset variables.instance.Fee_DE_23 = arguments.Fee_DE_23>
		<cfset variables.instance.Fee_DC_24 = arguments.Fee_DC_24>
		<cfset variables.instance.Fee_FL_25 = arguments.Fee_FL_25>
		<cfset variables.instance.Fee_GA_26 = arguments.Fee_GA_26>
		<cfset variables.instance.Fee_HI_27 = arguments.Fee_HI_27>
		<cfset variables.instance.Fee_ID_28 = arguments.Fee_ID_28>
		<cfset variables.instance.Fee_IL_29 = arguments.Fee_IL_29>
		<cfset variables.instance.Fee_IN_30 = arguments.Fee_IN_30>
		<cfset variables.instance.Fee_IA_31 = arguments.Fee_IA_31>
		<cfset variables.instance.Fee_KS_32 = arguments.Fee_KS_32>
		<cfset variables.instance.Fee_KY_33 = arguments.Fee_KY_33>
		<cfset variables.instance.Fee_LA_34 = arguments.Fee_LA_34>
		<cfset variables.instance.Fee_ME_35 = arguments.Fee_ME_35>
		<cfset variables.instance.Fee_MD_36 = arguments.Fee_MD_36>
		<cfset variables.instance.Fee_MA_37 = arguments.Fee_MA_37>
		<cfset variables.instance.Fee_MI_38 = arguments.Fee_MI_38>
		<cfset variables.instance.Fee_MN_39 = arguments.Fee_MN_39>
		<cfset variables.instance.Fee_MS_40 = arguments.Fee_MS_40>
		<cfset variables.instance.Fee_MO_41 = arguments.Fee_MO_41>
		<cfset variables.instance.Fee_MT_42 = arguments.Fee_MT_42>
		<cfset variables.instance.Fee_NE_43 = arguments.Fee_NE_43>
		<cfset variables.instance.Fee_NV_44 = arguments.Fee_NV_44>
		<cfset variables.instance.Fee_NE_45 = arguments.Fee_NE_45>
		<cfset variables.instance.Fee_NJ_46 = arguments.Fee_NJ_46>
		<cfset variables.instance.Fee_NM_47 = arguments.Fee_NM_47>
		<cfset variables.instance.Fee_NY_48 = arguments.Fee_NY_48>
		<cfset variables.instance.Fee_NC_49 = arguments.Fee_NC_49>
		<cfset variables.instance.Fee_ND_50 = arguments.Fee_ND_50>
		<cfset variables.instance.Fee_OH_51 = arguments.Fee_OH_51>
		<cfset variables.instance.Fee_OK_52 = arguments.Fee_OK_52>
		<cfset variables.instance.Fee_OR_53 = arguments.Fee_OR_53>
		<cfset variables.instance.Fee_PA_54 = arguments.Fee_PA_54>
		<cfset variables.instance.Fee_RI_55 = arguments.Fee_RI_55>
		<cfset variables.instance.Fee_SC_56 = arguments.Fee_SC_56>
		<cfset variables.instance.Fee_SD_57 = arguments.Fee_SD_57>
		<cfset variables.instance.Fee_TN_58 = arguments.Fee_TN_58>
		<cfset variables.instance.Fee_TX_59 = arguments.Fee_TX_59>
		<cfset variables.instance.Fee_UT_60 = arguments.Fee_UT_60>
		<cfset variables.instance.Fee_VT_61 = arguments.Fee_VT_61>
		<cfset variables.instance.Fee_VA_62 = arguments.Fee_VA_62>
		<cfset variables.instance.Fee_WA_63 = arguments.Fee_WA_63>
		<cfset variables.instance.Fee_WV_64 = arguments.Fee_WV_64>
		<cfset variables.instance.Fee_WI_65 = arguments.Fee_WI_65>
		<cfset variables.instance.Fee_WY_66 = arguments.Fee_WY_66>
		<cfset variables.instance.Fee_PR_229 = arguments.Fee_PR_229>
		<cfset variables.instance.Fee_VI_238 = arguments.Fee_VI_238>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="EOB_MEDICARE_2002_PROCEDURECodeFeeScheduleIO" output="No">
		
		<cfargument name="RecordID" required="yes" type="numeric">		
		<cfset var qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = "">
		
		<cfset preInit(RecordID)>
	
		<cfquery name="qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" datasource="pa_master">
	  		SELECT RecordID,HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode,DateCreated,DateModified
			FROM eob_medicare_2002_procedurecodefeeschedule  
			WHERE RecordID = #trim(arguments.RecordID)# 
		</cfquery>
		
		<cfif qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.RecordID EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.RecordID EQ "NULL") 
				variables.instance.RecordID = "NULL"; 
			ELSE 
				variables.instance.RecordID = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.RecordID;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.HCPCRecordID EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.HCPCRecordID EQ "NULL") 
				variables.instance.HCPCRecordID = "NULL"; 
			ELSE 
				variables.instance.HCPCRecordID = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.HCPCRecordID;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.CategoryID EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.CategoryID EQ "NULL") 
				variables.instance.CategoryID = "NULL"; 
			ELSE 
				variables.instance.CategoryID = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.CategoryID;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD1 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD1 EQ "NULL") 
				variables.instance.MOD1 = "NULL"; 
			ELSE 
				variables.instance.MOD1 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD1;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD2 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD2 EQ "NULL") 
				variables.instance.MOD2 = "NULL"; 
			ELSE 
				variables.instance.MOD2 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD2;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD3 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD3 EQ "NULL") 
				variables.instance.MOD3 = "NULL"; 
			ELSE 
				variables.instance.MOD3 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD3;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD4 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD4 EQ "NULL") 
				variables.instance.MOD4 = "NULL"; 
			ELSE 
				variables.instance.MOD4 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.MOD4;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Ceiling EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Ceiling EQ "NULL") 
				variables.instance.Ceiling = "NULL"; 
			ELSE 
				variables.instance.Ceiling = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Ceiling;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Floor EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Floor EQ "NULL") 
				variables.instance.Floor = "NULL"; 
			ELSE 
				variables.instance.Floor = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Floor;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AL_16 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AL_16 EQ "NULL") 
				variables.instance.Fee_AL_16 = "NULL"; 
			ELSE 
				variables.instance.Fee_AL_16 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AL_16;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AK_17 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AK_17 EQ "NULL") 
				variables.instance.Fee_AK_17 = "NULL"; 
			ELSE 
				variables.instance.Fee_AK_17 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AK_17;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AZ_18 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AZ_18 EQ "NULL") 
				variables.instance.Fee_AZ_18 = "NULL"; 
			ELSE 
				variables.instance.Fee_AZ_18 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AZ_18;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AR_19 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AR_19 EQ "NULL") 
				variables.instance.Fee_AR_19 = "NULL"; 
			ELSE 
				variables.instance.Fee_AR_19 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_AR_19;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CA_20 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CA_20 EQ "NULL") 
				variables.instance.Fee_CA_20 = "NULL"; 
			ELSE 
				variables.instance.Fee_CA_20 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CA_20;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CO_21 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CO_21 EQ "NULL") 
				variables.instance.Fee_CO_21 = "NULL"; 
			ELSE 
				variables.instance.Fee_CO_21 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CO_21;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CT_22 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CT_22 EQ "NULL") 
				variables.instance.Fee_CT_22 = "NULL"; 
			ELSE 
				variables.instance.Fee_CT_22 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_CT_22;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DE_23 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DE_23 EQ "NULL") 
				variables.instance.Fee_DE_23 = "NULL"; 
			ELSE 
				variables.instance.Fee_DE_23 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DE_23;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DC_24 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DC_24 EQ "NULL") 
				variables.instance.Fee_DC_24 = "NULL"; 
			ELSE 
				variables.instance.Fee_DC_24 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_DC_24;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_FL_25 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_FL_25 EQ "NULL") 
				variables.instance.Fee_FL_25 = "NULL"; 
			ELSE 
				variables.instance.Fee_FL_25 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_FL_25;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_GA_26 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_GA_26 EQ "NULL") 
				variables.instance.Fee_GA_26 = "NULL"; 
			ELSE 
				variables.instance.Fee_GA_26 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_GA_26;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_HI_27 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_HI_27 EQ "NULL") 
				variables.instance.Fee_HI_27 = "NULL"; 
			ELSE 
				variables.instance.Fee_HI_27 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_HI_27;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ID_28 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ID_28 EQ "NULL") 
				variables.instance.Fee_ID_28 = "NULL"; 
			ELSE 
				variables.instance.Fee_ID_28 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ID_28;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IL_29 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IL_29 EQ "NULL") 
				variables.instance.Fee_IL_29 = "NULL"; 
			ELSE 
				variables.instance.Fee_IL_29 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IL_29;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IN_30 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IN_30 EQ "NULL") 
				variables.instance.Fee_IN_30 = "NULL"; 
			ELSE 
				variables.instance.Fee_IN_30 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IN_30;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IA_31 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IA_31 EQ "NULL") 
				variables.instance.Fee_IA_31 = "NULL"; 
			ELSE 
				variables.instance.Fee_IA_31 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_IA_31;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KS_32 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KS_32 EQ "NULL") 
				variables.instance.Fee_KS_32 = "NULL"; 
			ELSE 
				variables.instance.Fee_KS_32 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KS_32;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KY_33 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KY_33 EQ "NULL") 
				variables.instance.Fee_KY_33 = "NULL"; 
			ELSE 
				variables.instance.Fee_KY_33 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_KY_33;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_LA_34 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_LA_34 EQ "NULL") 
				variables.instance.Fee_LA_34 = "NULL"; 
			ELSE 
				variables.instance.Fee_LA_34 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_LA_34;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ME_35 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ME_35 EQ "NULL") 
				variables.instance.Fee_ME_35 = "NULL"; 
			ELSE 
				variables.instance.Fee_ME_35 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ME_35;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MD_36 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MD_36 EQ "NULL") 
				variables.instance.Fee_MD_36 = "NULL"; 
			ELSE 
				variables.instance.Fee_MD_36 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MD_36;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MA_37 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MA_37 EQ "NULL") 
				variables.instance.Fee_MA_37 = "NULL"; 
			ELSE 
				variables.instance.Fee_MA_37 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MA_37;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MI_38 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MI_38 EQ "NULL") 
				variables.instance.Fee_MI_38 = "NULL"; 
			ELSE 
				variables.instance.Fee_MI_38 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MI_38;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MN_39 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MN_39 EQ "NULL") 
				variables.instance.Fee_MN_39 = "NULL"; 
			ELSE 
				variables.instance.Fee_MN_39 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MN_39;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MS_40 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MS_40 EQ "NULL") 
				variables.instance.Fee_MS_40 = "NULL"; 
			ELSE 
				variables.instance.Fee_MS_40 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MS_40;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MO_41 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MO_41 EQ "NULL") 
				variables.instance.Fee_MO_41 = "NULL"; 
			ELSE 
				variables.instance.Fee_MO_41 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MO_41;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MT_42 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MT_42 EQ "NULL") 
				variables.instance.Fee_MT_42 = "NULL"; 
			ELSE 
				variables.instance.Fee_MT_42 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_MT_42;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_43 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_43 EQ "NULL") 
				variables.instance.Fee_NE_43 = "NULL"; 
			ELSE 
				variables.instance.Fee_NE_43 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_43;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NV_44 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NV_44 EQ "NULL") 
				variables.instance.Fee_NV_44 = "NULL"; 
			ELSE 
				variables.instance.Fee_NV_44 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NV_44;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_45 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_45 EQ "NULL") 
				variables.instance.Fee_NE_45 = "NULL"; 
			ELSE 
				variables.instance.Fee_NE_45 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NE_45;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NJ_46 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NJ_46 EQ "NULL") 
				variables.instance.Fee_NJ_46 = "NULL"; 
			ELSE 
				variables.instance.Fee_NJ_46 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NJ_46;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NM_47 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NM_47 EQ "NULL") 
				variables.instance.Fee_NM_47 = "NULL"; 
			ELSE 
				variables.instance.Fee_NM_47 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NM_47;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NY_48 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NY_48 EQ "NULL") 
				variables.instance.Fee_NY_48 = "NULL"; 
			ELSE 
				variables.instance.Fee_NY_48 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NY_48;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NC_49 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NC_49 EQ "NULL") 
				variables.instance.Fee_NC_49 = "NULL"; 
			ELSE 
				variables.instance.Fee_NC_49 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_NC_49;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ND_50 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ND_50 EQ "NULL") 
				variables.instance.Fee_ND_50 = "NULL"; 
			ELSE 
				variables.instance.Fee_ND_50 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_ND_50;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OH_51 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OH_51 EQ "NULL") 
				variables.instance.Fee_OH_51 = "NULL"; 
			ELSE 
				variables.instance.Fee_OH_51 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OH_51;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OK_52 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OK_52 EQ "NULL") 
				variables.instance.Fee_OK_52 = "NULL"; 
			ELSE 
				variables.instance.Fee_OK_52 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OK_52;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OR_53 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OR_53 EQ "NULL") 
				variables.instance.Fee_OR_53 = "NULL"; 
			ELSE 
				variables.instance.Fee_OR_53 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_OR_53;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PA_54 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PA_54 EQ "NULL") 
				variables.instance.Fee_PA_54 = "NULL"; 
			ELSE 
				variables.instance.Fee_PA_54 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PA_54;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_RI_55 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_RI_55 EQ "NULL") 
				variables.instance.Fee_RI_55 = "NULL"; 
			ELSE 
				variables.instance.Fee_RI_55 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_RI_55;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SC_56 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SC_56 EQ "NULL") 
				variables.instance.Fee_SC_56 = "NULL"; 
			ELSE 
				variables.instance.Fee_SC_56 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SC_56;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SD_57 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SD_57 EQ "NULL") 
				variables.instance.Fee_SD_57 = "NULL"; 
			ELSE 
				variables.instance.Fee_SD_57 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_SD_57;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TN_58 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TN_58 EQ "NULL") 
				variables.instance.Fee_TN_58 = "NULL"; 
			ELSE 
				variables.instance.Fee_TN_58 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TN_58;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TX_59 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TX_59 EQ "NULL") 
				variables.instance.Fee_TX_59 = "NULL"; 
			ELSE 
				variables.instance.Fee_TX_59 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_TX_59;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_UT_60 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_UT_60 EQ "NULL") 
				variables.instance.Fee_UT_60 = "NULL"; 
			ELSE 
				variables.instance.Fee_UT_60 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_UT_60;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VT_61 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VT_61 EQ "NULL") 
				variables.instance.Fee_VT_61 = "NULL"; 
			ELSE 
				variables.instance.Fee_VT_61 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VT_61;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VA_62 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VA_62 EQ "NULL") 
				variables.instance.Fee_VA_62 = "NULL"; 
			ELSE 
				variables.instance.Fee_VA_62 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VA_62;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WA_63 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WA_63 EQ "NULL") 
				variables.instance.Fee_WA_63 = "NULL"; 
			ELSE 
				variables.instance.Fee_WA_63 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WA_63;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WV_64 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WV_64 EQ "NULL") 
				variables.instance.Fee_WV_64 = "NULL"; 
			ELSE 
				variables.instance.Fee_WV_64 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WV_64;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WI_65 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WI_65 EQ "NULL") 
				variables.instance.Fee_WI_65 = "NULL"; 
			ELSE 
				variables.instance.Fee_WI_65 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WI_65;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WY_66 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WY_66 EQ "NULL") 
				variables.instance.Fee_WY_66 = "NULL"; 
			ELSE 
				variables.instance.Fee_WY_66 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_WY_66;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PR_229 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PR_229 EQ "NULL") 
				variables.instance.Fee_PR_229 = "NULL"; 
			ELSE 
				variables.instance.Fee_PR_229 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_PR_229;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VI_238 EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VI_238 EQ "NULL") 
				variables.instance.Fee_VI_238 = "NULL"; 
			ELSE 
				variables.instance.Fee_VI_238 = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Fee_VI_238;
							
				variables.instance.Active = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.Active;
				
			IF(qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.InactiveCode EQ "" OR qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.InactiveCode;
							
				variables.instance.DateCreated = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.DateCreated;
							
				variables.instance.DateModified = qGetEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(RecordID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.RecordID) AND variables.instance.RecordID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.RecordID = qInsertCommitEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.RecordID>
				
				<cfreturn qInsertCommitEOB_MEDICARE_2002_PROCEDURECodeFeeSchedule.RecordID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "RecordID,HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE eob_medicare_2002_procedurecodefeeschedule SET #columnsToUpdate# WHERE RecordID = #trim(variables.instance.RecordID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO eob_medicare_2002_procedurecodefeeschedule  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS RecordID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEOB_MEDICARE_2002_PROCEDURECodeFeeScheduleQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getEOB_MEDICARE_2002_PROCEDURECodeFeeScheduleQuery">						
		<cfargument name="Fields" required="No" type="String" default="RecordID,HCPCRecordID,CategoryID,MOD1,MOD2,MOD3,MOD4,Ceiling,Floor,Fee_AL_16,Fee_AK_17,Fee_AZ_18,Fee_AR_19,Fee_CA_20,Fee_CO_21,Fee_CT_22,Fee_DE_23,Fee_DC_24,Fee_FL_25,Fee_GA_26,Fee_HI_27,Fee_ID_28,Fee_IL_29,Fee_IN_30,Fee_IA_31,Fee_KS_32,Fee_KY_33,Fee_LA_34,Fee_ME_35,Fee_MD_36,Fee_MA_37,Fee_MI_38,Fee_MN_39,Fee_MS_40,Fee_MO_41,Fee_MT_42,Fee_NE_43,Fee_NV_44,Fee_NE_45,Fee_NJ_46,Fee_NM_47,Fee_NY_48,Fee_NC_49,Fee_ND_50,Fee_OH_51,Fee_OK_52,Fee_OR_53,Fee_PA_54,Fee_RI_55,Fee_SC_56,Fee_SD_57,Fee_TN_58,Fee_TX_59,Fee_UT_60,Fee_VT_61,Fee_VA_62,Fee_WA_63,Fee_WV_64,Fee_WI_65,Fee_WY_66,Fee_PR_229,Fee_VI_238,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="RecordID" required="No" type="String" default="">
		<cfargument name="RecordID_IN" required="No" type="String" default="">
		<cfargument name="RecordID_LIKE" required="No" type="String" default="">
		<cfargument name="HCPCRecordID" required="No" type="String" default="">
		<cfargument name="HCPCRecordID_IN" required="No" type="String" default="">
		<cfargument name="HCPCRecordID_LIKE" required="No" type="String" default="">
		<cfargument name="CategoryID" required="No" type="String" default="">
		<cfargument name="CategoryID_IN" required="No" type="String" default="">
		<cfargument name="CategoryID_LIKE" required="No" type="String" default="">
		<cfargument name="MOD1" required="No" type="String" default="">
		<cfargument name="MOD1_IN" required="No" type="String" default="">
		<cfargument name="MOD1_LIKE" required="No" type="String" default="">
		<cfargument name="MOD2" required="No" type="String" default="">
		<cfargument name="MOD2_IN" required="No" type="String" default="">
		<cfargument name="MOD2_LIKE" required="No" type="String" default="">
		<cfargument name="MOD3" required="No" type="String" default="">
		<cfargument name="MOD3_IN" required="No" type="String" default="">
		<cfargument name="MOD3_LIKE" required="No" type="String" default="">
		<cfargument name="MOD4" required="No" type="String" default="">
		<cfargument name="MOD4_IN" required="No" type="String" default="">
		<cfargument name="MOD4_LIKE" required="No" type="String" default="">
		<cfargument name="Ceiling" required="No" type="String" default="">
		<cfargument name="Ceiling_IN" required="No" type="String" default="">
		<cfargument name="Ceiling_LIKE" required="No" type="String" default="">
		<cfargument name="Floor" required="No" type="String" default="">
		<cfargument name="Floor_IN" required="No" type="String" default="">
		<cfargument name="Floor_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_AL_16" required="No" type="String" default="">
		<cfargument name="Fee_AL_16_IN" required="No" type="String" default="">
		<cfargument name="Fee_AL_16_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_AK_17" required="No" type="String" default="">
		<cfargument name="Fee_AK_17_IN" required="No" type="String" default="">
		<cfargument name="Fee_AK_17_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_AZ_18" required="No" type="String" default="">
		<cfargument name="Fee_AZ_18_IN" required="No" type="String" default="">
		<cfargument name="Fee_AZ_18_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_AR_19" required="No" type="String" default="">
		<cfargument name="Fee_AR_19_IN" required="No" type="String" default="">
		<cfargument name="Fee_AR_19_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_CA_20" required="No" type="String" default="">
		<cfargument name="Fee_CA_20_IN" required="No" type="String" default="">
		<cfargument name="Fee_CA_20_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_CO_21" required="No" type="String" default="">
		<cfargument name="Fee_CO_21_IN" required="No" type="String" default="">
		<cfargument name="Fee_CO_21_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_CT_22" required="No" type="String" default="">
		<cfargument name="Fee_CT_22_IN" required="No" type="String" default="">
		<cfargument name="Fee_CT_22_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_DE_23" required="No" type="String" default="">
		<cfargument name="Fee_DE_23_IN" required="No" type="String" default="">
		<cfargument name="Fee_DE_23_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_DC_24" required="No" type="String" default="">
		<cfargument name="Fee_DC_24_IN" required="No" type="String" default="">
		<cfargument name="Fee_DC_24_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_FL_25" required="No" type="String" default="">
		<cfargument name="Fee_FL_25_IN" required="No" type="String" default="">
		<cfargument name="Fee_FL_25_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_GA_26" required="No" type="String" default="">
		<cfargument name="Fee_GA_26_IN" required="No" type="String" default="">
		<cfargument name="Fee_GA_26_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_HI_27" required="No" type="String" default="">
		<cfargument name="Fee_HI_27_IN" required="No" type="String" default="">
		<cfargument name="Fee_HI_27_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_ID_28" required="No" type="String" default="">
		<cfargument name="Fee_ID_28_IN" required="No" type="String" default="">
		<cfargument name="Fee_ID_28_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_IL_29" required="No" type="String" default="">
		<cfargument name="Fee_IL_29_IN" required="No" type="String" default="">
		<cfargument name="Fee_IL_29_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_IN_30" required="No" type="String" default="">
		<cfargument name="Fee_IN_30_IN" required="No" type="String" default="">
		<cfargument name="Fee_IN_30_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_IA_31" required="No" type="String" default="">
		<cfargument name="Fee_IA_31_IN" required="No" type="String" default="">
		<cfargument name="Fee_IA_31_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_KS_32" required="No" type="String" default="">
		<cfargument name="Fee_KS_32_IN" required="No" type="String" default="">
		<cfargument name="Fee_KS_32_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_KY_33" required="No" type="String" default="">
		<cfargument name="Fee_KY_33_IN" required="No" type="String" default="">
		<cfargument name="Fee_KY_33_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_LA_34" required="No" type="String" default="">
		<cfargument name="Fee_LA_34_IN" required="No" type="String" default="">
		<cfargument name="Fee_LA_34_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_ME_35" required="No" type="String" default="">
		<cfargument name="Fee_ME_35_IN" required="No" type="String" default="">
		<cfargument name="Fee_ME_35_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_MD_36" required="No" type="String" default="">
		<cfargument name="Fee_MD_36_IN" required="No" type="String" default="">
		<cfargument name="Fee_MD_36_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_MA_37" required="No" type="String" default="">
		<cfargument name="Fee_MA_37_IN" required="No" type="String" default="">
		<cfargument name="Fee_MA_37_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_MI_38" required="No" type="String" default="">
		<cfargument name="Fee_MI_38_IN" required="No" type="String" default="">
		<cfargument name="Fee_MI_38_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_MN_39" required="No" type="String" default="">
		<cfargument name="Fee_MN_39_IN" required="No" type="String" default="">
		<cfargument name="Fee_MN_39_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_MS_40" required="No" type="String" default="">
		<cfargument name="Fee_MS_40_IN" required="No" type="String" default="">
		<cfargument name="Fee_MS_40_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_MO_41" required="No" type="String" default="">
		<cfargument name="Fee_MO_41_IN" required="No" type="String" default="">
		<cfargument name="Fee_MO_41_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_MT_42" required="No" type="String" default="">
		<cfargument name="Fee_MT_42_IN" required="No" type="String" default="">
		<cfargument name="Fee_MT_42_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_NE_43" required="No" type="String" default="">
		<cfargument name="Fee_NE_43_IN" required="No" type="String" default="">
		<cfargument name="Fee_NE_43_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_NV_44" required="No" type="String" default="">
		<cfargument name="Fee_NV_44_IN" required="No" type="String" default="">
		<cfargument name="Fee_NV_44_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_NE_45" required="No" type="String" default="">
		<cfargument name="Fee_NE_45_IN" required="No" type="String" default="">
		<cfargument name="Fee_NE_45_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_NJ_46" required="No" type="String" default="">
		<cfargument name="Fee_NJ_46_IN" required="No" type="String" default="">
		<cfargument name="Fee_NJ_46_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_NM_47" required="No" type="String" default="">
		<cfargument name="Fee_NM_47_IN" required="No" type="String" default="">
		<cfargument name="Fee_NM_47_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_NY_48" required="No" type="String" default="">
		<cfargument name="Fee_NY_48_IN" required="No" type="String" default="">
		<cfargument name="Fee_NY_48_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_NC_49" required="No" type="String" default="">
		<cfargument name="Fee_NC_49_IN" required="No" type="String" default="">
		<cfargument name="Fee_NC_49_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_ND_50" required="No" type="String" default="">
		<cfargument name="Fee_ND_50_IN" required="No" type="String" default="">
		<cfargument name="Fee_ND_50_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_OH_51" required="No" type="String" default="">
		<cfargument name="Fee_OH_51_IN" required="No" type="String" default="">
		<cfargument name="Fee_OH_51_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_OK_52" required="No" type="String" default="">
		<cfargument name="Fee_OK_52_IN" required="No" type="String" default="">
		<cfargument name="Fee_OK_52_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_OR_53" required="No" type="String" default="">
		<cfargument name="Fee_OR_53_IN" required="No" type="String" default="">
		<cfargument name="Fee_OR_53_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_PA_54" required="No" type="String" default="">
		<cfargument name="Fee_PA_54_IN" required="No" type="String" default="">
		<cfargument name="Fee_PA_54_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_RI_55" required="No" type="String" default="">
		<cfargument name="Fee_RI_55_IN" required="No" type="String" default="">
		<cfargument name="Fee_RI_55_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_SC_56" required="No" type="String" default="">
		<cfargument name="Fee_SC_56_IN" required="No" type="String" default="">
		<cfargument name="Fee_SC_56_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_SD_57" required="No" type="String" default="">
		<cfargument name="Fee_SD_57_IN" required="No" type="String" default="">
		<cfargument name="Fee_SD_57_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_TN_58" required="No" type="String" default="">
		<cfargument name="Fee_TN_58_IN" required="No" type="String" default="">
		<cfargument name="Fee_TN_58_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_TX_59" required="No" type="String" default="">
		<cfargument name="Fee_TX_59_IN" required="No" type="String" default="">
		<cfargument name="Fee_TX_59_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_UT_60" required="No" type="String" default="">
		<cfargument name="Fee_UT_60_IN" required="No" type="String" default="">
		<cfargument name="Fee_UT_60_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_VT_61" required="No" type="String" default="">
		<cfargument name="Fee_VT_61_IN" required="No" type="String" default="">
		<cfargument name="Fee_VT_61_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_VA_62" required="No" type="String" default="">
		<cfargument name="Fee_VA_62_IN" required="No" type="String" default="">
		<cfargument name="Fee_VA_62_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_WA_63" required="No" type="String" default="">
		<cfargument name="Fee_WA_63_IN" required="No" type="String" default="">
		<cfargument name="Fee_WA_63_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_WV_64" required="No" type="String" default="">
		<cfargument name="Fee_WV_64_IN" required="No" type="String" default="">
		<cfargument name="Fee_WV_64_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_WI_65" required="No" type="String" default="">
		<cfargument name="Fee_WI_65_IN" required="No" type="String" default="">
		<cfargument name="Fee_WI_65_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_WY_66" required="No" type="String" default="">
		<cfargument name="Fee_WY_66_IN" required="No" type="String" default="">
		<cfargument name="Fee_WY_66_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_PR_229" required="No" type="String" default="">
		<cfargument name="Fee_PR_229_IN" required="No" type="String" default="">
		<cfargument name="Fee_PR_229_LIKE" required="No" type="String" default="">
		<cfargument name="Fee_VI_238" required="No" type="String" default="">
		<cfargument name="Fee_VI_238_IN" required="No" type="String" default="">
		<cfargument name="Fee_VI_238_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "RecordID,RecordID_IN,RecordID_LIKE,HCPCRecordID,HCPCRecordID_IN,HCPCRecordID_LIKE,CategoryID,CategoryID_IN,CategoryID_LIKE,MOD1,MOD1_IN,MOD1_LIKE,MOD2,MOD2_IN,MOD2_LIKE,MOD3,MOD3_IN,MOD3_LIKE,MOD4,MOD4_IN,MOD4_LIKE,Ceiling,Ceiling_IN,Ceiling_LIKE,Floor,Floor_IN,Floor_LIKE,Fee_AL_16,Fee_AL_16_IN,Fee_AL_16_LIKE,Fee_AK_17,Fee_AK_17_IN,Fee_AK_17_LIKE,Fee_AZ_18,Fee_AZ_18_IN,Fee_AZ_18_LIKE,Fee_AR_19,Fee_AR_19_IN,Fee_AR_19_LIKE,Fee_CA_20,Fee_CA_20_IN,Fee_CA_20_LIKE,Fee_CO_21,Fee_CO_21_IN,Fee_CO_21_LIKE,Fee_CT_22,Fee_CT_22_IN,Fee_CT_22_LIKE,Fee_DE_23,Fee_DE_23_IN,Fee_DE_23_LIKE,Fee_DC_24,Fee_DC_24_IN,Fee_DC_24_LIKE,Fee_FL_25,Fee_FL_25_IN,Fee_FL_25_LIKE,Fee_GA_26,Fee_GA_26_IN,Fee_GA_26_LIKE,Fee_HI_27,Fee_HI_27_IN,Fee_HI_27_LIKE,Fee_ID_28,Fee_ID_28_IN,Fee_ID_28_LIKE,Fee_IL_29,Fee_IL_29_IN,Fee_IL_29_LIKE,Fee_IN_30,Fee_IN_30_IN,Fee_IN_30_LIKE,Fee_IA_31,Fee_IA_31_IN,Fee_IA_31_LIKE,Fee_KS_32,Fee_KS_32_IN,Fee_KS_32_LIKE,Fee_KY_33,Fee_KY_33_IN,Fee_KY_33_LIKE,Fee_LA_34,Fee_LA_34_IN,Fee_LA_34_LIKE,Fee_ME_35,Fee_ME_35_IN,Fee_ME_35_LIKE,Fee_MD_36,Fee_MD_36_IN,Fee_MD_36_LIKE,Fee_MA_37,Fee_MA_37_IN,Fee_MA_37_LIKE,Fee_MI_38,Fee_MI_38_IN,Fee_MI_38_LIKE,Fee_MN_39,Fee_MN_39_IN,Fee_MN_39_LIKE,Fee_MS_40,Fee_MS_40_IN,Fee_MS_40_LIKE,Fee_MO_41,Fee_MO_41_IN,Fee_MO_41_LIKE,Fee_MT_42,Fee_MT_42_IN,Fee_MT_42_LIKE,Fee_NE_43,Fee_NE_43_IN,Fee_NE_43_LIKE,Fee_NV_44,Fee_NV_44_IN,Fee_NV_44_LIKE,Fee_NE_45,Fee_NE_45_IN,Fee_NE_45_LIKE,Fee_NJ_46,Fee_NJ_46_IN,Fee_NJ_46_LIKE,Fee_NM_47,Fee_NM_47_IN,Fee_NM_47_LIKE,Fee_NY_48,Fee_NY_48_IN,Fee_NY_48_LIKE,Fee_NC_49,Fee_NC_49_IN,Fee_NC_49_LIKE,Fee_ND_50,Fee_ND_50_IN,Fee_ND_50_LIKE,Fee_OH_51,Fee_OH_51_IN,Fee_OH_51_LIKE,Fee_OK_52,Fee_OK_52_IN,Fee_OK_52_LIKE,Fee_OR_53,Fee_OR_53_IN,Fee_OR_53_LIKE,Fee_PA_54,Fee_PA_54_IN,Fee_PA_54_LIKE,Fee_RI_55,Fee_RI_55_IN,Fee_RI_55_LIKE,Fee_SC_56,Fee_SC_56_IN,Fee_SC_56_LIKE,Fee_SD_57,Fee_SD_57_IN,Fee_SD_57_LIKE,Fee_TN_58,Fee_TN_58_IN,Fee_TN_58_LIKE,Fee_TX_59,Fee_TX_59_IN,Fee_TX_59_LIKE,Fee_UT_60,Fee_UT_60_IN,Fee_UT_60_LIKE,Fee_VT_61,Fee_VT_61_IN,Fee_VT_61_LIKE,Fee_VA_62,Fee_VA_62_IN,Fee_VA_62_LIKE,Fee_WA_63,Fee_WA_63_IN,Fee_WA_63_LIKE,Fee_WV_64,Fee_WV_64_IN,Fee_WV_64_LIKE,Fee_WI_65,Fee_WI_65_IN,Fee_WI_65_LIKE,Fee_WY_66,Fee_WY_66_IN,Fee_WY_66_LIKE,Fee_PR_229,Fee_PR_229_IN,Fee_PR_229_LIKE,Fee_VI_238,Fee_VI_238_IN,Fee_VI_238_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getEOB_MEDICARE_2002_PROCEDURECodeFeeScheduleQuery" datasource="pa_master">
				SELECT #trim(Fields)#
				FROM eob_medicare_2002_procedurecodefeeschedule   
				WHERE 1=1
					<cfif RecordID NEQ "" AND IsNumeric(RecordID)>AND RecordID = #RecordID#</cfif>
					<cfif RecordID_IN NEQ "">AND RecordID IN(#trim(RecordID_IN)#)</cfif>
					<cfif RecordID_LIKE NEQ "">AND RecordID LIKE '%#trim(RecordID_LIKE)#%'</cfif>
					<cfif HCPCRecordID NEQ "" AND IsNumeric(HCPCRecordID)>AND HCPCRecordID = #HCPCRecordID#</cfif>
					<cfif HCPCRecordID_IN NEQ "">AND HCPCRecordID IN(#trim(HCPCRecordID_IN)#)</cfif>
					<cfif HCPCRecordID_LIKE NEQ "">AND HCPCRecordID LIKE '%#trim(HCPCRecordID_LIKE)#%'</cfif>
					<cfif CategoryID NEQ "" AND IsNumeric(CategoryID)>AND CategoryID = #CategoryID#</cfif>
					<cfif CategoryID_IN NEQ "">AND CategoryID IN(#trim(CategoryID_IN)#)</cfif>
					<cfif CategoryID_LIKE NEQ "">AND CategoryID LIKE '%#trim(CategoryID_LIKE)#%'</cfif>
					<cfif MOD1 NEQ "" AND IsNumeric(MOD1)>AND MOD1 = #MOD1#</cfif>
					<cfif MOD1_IN NEQ "">AND MOD1 IN(#trim(MOD1_IN)#)</cfif>
					<cfif MOD1_LIKE NEQ "">AND MOD1 LIKE '%#trim(MOD1_LIKE)#%'</cfif>
					<cfif MOD2 NEQ "" AND IsNumeric(MOD2)>AND MOD2 = #MOD2#</cfif>
					<cfif MOD2_IN NEQ "">AND MOD2 IN(#trim(MOD2_IN)#)</cfif>
					<cfif MOD2_LIKE NEQ "">AND MOD2 LIKE '%#trim(MOD2_LIKE)#%'</cfif>
					<cfif MOD3 NEQ "" AND IsNumeric(MOD3)>AND MOD3 = #MOD3#</cfif>
					<cfif MOD3_IN NEQ "">AND MOD3 IN(#trim(MOD3_IN)#)</cfif>
					<cfif MOD3_LIKE NEQ "">AND MOD3 LIKE '%#trim(MOD3_LIKE)#%'</cfif>
					<cfif MOD4 NEQ "" AND IsNumeric(MOD4)>AND MOD4 = #MOD4#</cfif>
					<cfif MOD4_IN NEQ "">AND MOD4 IN(#trim(MOD4_IN)#)</cfif>
					<cfif MOD4_LIKE NEQ "">AND MOD4 LIKE '%#trim(MOD4_LIKE)#%'</cfif>
					<cfif Ceiling NEQ "" AND IsNumeric(Ceiling)>AND Ceiling = #Ceiling#</cfif>
					<cfif Ceiling_IN NEQ "">AND Ceiling IN(#trim(Ceiling_IN)#)</cfif>
					<cfif Ceiling_LIKE NEQ "">AND Ceiling LIKE '%#trim(Ceiling_LIKE)#%'</cfif>
					<cfif Floor NEQ "" AND IsNumeric(Floor)>AND Floor = #Floor#</cfif>
					<cfif Floor_IN NEQ "">AND Floor IN(#trim(Floor_IN)#)</cfif>
					<cfif Floor_LIKE NEQ "">AND Floor LIKE '%#trim(Floor_LIKE)#%'</cfif>
					<cfif Fee_AL_16 NEQ "" AND IsNumeric(Fee_AL_16)>AND Fee_AL_16 = #Fee_AL_16#</cfif>
					<cfif Fee_AL_16_IN NEQ "">AND Fee_AL_16 IN(#trim(Fee_AL_16_IN)#)</cfif>
					<cfif Fee_AL_16_LIKE NEQ "">AND Fee_AL_16 LIKE '%#trim(Fee_AL_16_LIKE)#%'</cfif>
					<cfif Fee_AK_17 NEQ "" AND IsNumeric(Fee_AK_17)>AND Fee_AK_17 = #Fee_AK_17#</cfif>
					<cfif Fee_AK_17_IN NEQ "">AND Fee_AK_17 IN(#trim(Fee_AK_17_IN)#)</cfif>
					<cfif Fee_AK_17_LIKE NEQ "">AND Fee_AK_17 LIKE '%#trim(Fee_AK_17_LIKE)#%'</cfif>
					<cfif Fee_AZ_18 NEQ "" AND IsNumeric(Fee_AZ_18)>AND Fee_AZ_18 = #Fee_AZ_18#</cfif>
					<cfif Fee_AZ_18_IN NEQ "">AND Fee_AZ_18 IN(#trim(Fee_AZ_18_IN)#)</cfif>
					<cfif Fee_AZ_18_LIKE NEQ "">AND Fee_AZ_18 LIKE '%#trim(Fee_AZ_18_LIKE)#%'</cfif>
					<cfif Fee_AR_19 NEQ "" AND IsNumeric(Fee_AR_19)>AND Fee_AR_19 = #Fee_AR_19#</cfif>
					<cfif Fee_AR_19_IN NEQ "">AND Fee_AR_19 IN(#trim(Fee_AR_19_IN)#)</cfif>
					<cfif Fee_AR_19_LIKE NEQ "">AND Fee_AR_19 LIKE '%#trim(Fee_AR_19_LIKE)#%'</cfif>
					<cfif Fee_CA_20 NEQ "" AND IsNumeric(Fee_CA_20)>AND Fee_CA_20 = #Fee_CA_20#</cfif>
					<cfif Fee_CA_20_IN NEQ "">AND Fee_CA_20 IN(#trim(Fee_CA_20_IN)#)</cfif>
					<cfif Fee_CA_20_LIKE NEQ "">AND Fee_CA_20 LIKE '%#trim(Fee_CA_20_LIKE)#%'</cfif>
					<cfif Fee_CO_21 NEQ "" AND IsNumeric(Fee_CO_21)>AND Fee_CO_21 = #Fee_CO_21#</cfif>
					<cfif Fee_CO_21_IN NEQ "">AND Fee_CO_21 IN(#trim(Fee_CO_21_IN)#)</cfif>
					<cfif Fee_CO_21_LIKE NEQ "">AND Fee_CO_21 LIKE '%#trim(Fee_CO_21_LIKE)#%'</cfif>
					<cfif Fee_CT_22 NEQ "" AND IsNumeric(Fee_CT_22)>AND Fee_CT_22 = #Fee_CT_22#</cfif>
					<cfif Fee_CT_22_IN NEQ "">AND Fee_CT_22 IN(#trim(Fee_CT_22_IN)#)</cfif>
					<cfif Fee_CT_22_LIKE NEQ "">AND Fee_CT_22 LIKE '%#trim(Fee_CT_22_LIKE)#%'</cfif>
					<cfif Fee_DE_23 NEQ "" AND IsNumeric(Fee_DE_23)>AND Fee_DE_23 = #Fee_DE_23#</cfif>
					<cfif Fee_DE_23_IN NEQ "">AND Fee_DE_23 IN(#trim(Fee_DE_23_IN)#)</cfif>
					<cfif Fee_DE_23_LIKE NEQ "">AND Fee_DE_23 LIKE '%#trim(Fee_DE_23_LIKE)#%'</cfif>
					<cfif Fee_DC_24 NEQ "" AND IsNumeric(Fee_DC_24)>AND Fee_DC_24 = #Fee_DC_24#</cfif>
					<cfif Fee_DC_24_IN NEQ "">AND Fee_DC_24 IN(#trim(Fee_DC_24_IN)#)</cfif>
					<cfif Fee_DC_24_LIKE NEQ "">AND Fee_DC_24 LIKE '%#trim(Fee_DC_24_LIKE)#%'</cfif>
					<cfif Fee_FL_25 NEQ "" AND IsNumeric(Fee_FL_25)>AND Fee_FL_25 = #Fee_FL_25#</cfif>
					<cfif Fee_FL_25_IN NEQ "">AND Fee_FL_25 IN(#trim(Fee_FL_25_IN)#)</cfif>
					<cfif Fee_FL_25_LIKE NEQ "">AND Fee_FL_25 LIKE '%#trim(Fee_FL_25_LIKE)#%'</cfif>
					<cfif Fee_GA_26 NEQ "" AND IsNumeric(Fee_GA_26)>AND Fee_GA_26 = #Fee_GA_26#</cfif>
					<cfif Fee_GA_26_IN NEQ "">AND Fee_GA_26 IN(#trim(Fee_GA_26_IN)#)</cfif>
					<cfif Fee_GA_26_LIKE NEQ "">AND Fee_GA_26 LIKE '%#trim(Fee_GA_26_LIKE)#%'</cfif>
					<cfif Fee_HI_27 NEQ "" AND IsNumeric(Fee_HI_27)>AND Fee_HI_27 = #Fee_HI_27#</cfif>
					<cfif Fee_HI_27_IN NEQ "">AND Fee_HI_27 IN(#trim(Fee_HI_27_IN)#)</cfif>
					<cfif Fee_HI_27_LIKE NEQ "">AND Fee_HI_27 LIKE '%#trim(Fee_HI_27_LIKE)#%'</cfif>
					<cfif Fee_ID_28 NEQ "" AND IsNumeric(Fee_ID_28)>AND Fee_ID_28 = #Fee_ID_28#</cfif>
					<cfif Fee_ID_28_IN NEQ "">AND Fee_ID_28 IN(#trim(Fee_ID_28_IN)#)</cfif>
					<cfif Fee_ID_28_LIKE NEQ "">AND Fee_ID_28 LIKE '%#trim(Fee_ID_28_LIKE)#%'</cfif>
					<cfif Fee_IL_29 NEQ "" AND IsNumeric(Fee_IL_29)>AND Fee_IL_29 = #Fee_IL_29#</cfif>
					<cfif Fee_IL_29_IN NEQ "">AND Fee_IL_29 IN(#trim(Fee_IL_29_IN)#)</cfif>
					<cfif Fee_IL_29_LIKE NEQ "">AND Fee_IL_29 LIKE '%#trim(Fee_IL_29_LIKE)#%'</cfif>
					<cfif Fee_IN_30 NEQ "" AND IsNumeric(Fee_IN_30)>AND Fee_IN_30 = #Fee_IN_30#</cfif>
					<cfif Fee_IN_30_IN NEQ "">AND Fee_IN_30 IN(#trim(Fee_IN_30_IN)#)</cfif>
					<cfif Fee_IN_30_LIKE NEQ "">AND Fee_IN_30 LIKE '%#trim(Fee_IN_30_LIKE)#%'</cfif>
					<cfif Fee_IA_31 NEQ "" AND IsNumeric(Fee_IA_31)>AND Fee_IA_31 = #Fee_IA_31#</cfif>
					<cfif Fee_IA_31_IN NEQ "">AND Fee_IA_31 IN(#trim(Fee_IA_31_IN)#)</cfif>
					<cfif Fee_IA_31_LIKE NEQ "">AND Fee_IA_31 LIKE '%#trim(Fee_IA_31_LIKE)#%'</cfif>
					<cfif Fee_KS_32 NEQ "" AND IsNumeric(Fee_KS_32)>AND Fee_KS_32 = #Fee_KS_32#</cfif>
					<cfif Fee_KS_32_IN NEQ "">AND Fee_KS_32 IN(#trim(Fee_KS_32_IN)#)</cfif>
					<cfif Fee_KS_32_LIKE NEQ "">AND Fee_KS_32 LIKE '%#trim(Fee_KS_32_LIKE)#%'</cfif>
					<cfif Fee_KY_33 NEQ "" AND IsNumeric(Fee_KY_33)>AND Fee_KY_33 = #Fee_KY_33#</cfif>
					<cfif Fee_KY_33_IN NEQ "">AND Fee_KY_33 IN(#trim(Fee_KY_33_IN)#)</cfif>
					<cfif Fee_KY_33_LIKE NEQ "">AND Fee_KY_33 LIKE '%#trim(Fee_KY_33_LIKE)#%'</cfif>
					<cfif Fee_LA_34 NEQ "" AND IsNumeric(Fee_LA_34)>AND Fee_LA_34 = #Fee_LA_34#</cfif>
					<cfif Fee_LA_34_IN NEQ "">AND Fee_LA_34 IN(#trim(Fee_LA_34_IN)#)</cfif>
					<cfif Fee_LA_34_LIKE NEQ "">AND Fee_LA_34 LIKE '%#trim(Fee_LA_34_LIKE)#%'</cfif>
					<cfif Fee_ME_35 NEQ "" AND IsNumeric(Fee_ME_35)>AND Fee_ME_35 = #Fee_ME_35#</cfif>
					<cfif Fee_ME_35_IN NEQ "">AND Fee_ME_35 IN(#trim(Fee_ME_35_IN)#)</cfif>
					<cfif Fee_ME_35_LIKE NEQ "">AND Fee_ME_35 LIKE '%#trim(Fee_ME_35_LIKE)#%'</cfif>
					<cfif Fee_MD_36 NEQ "" AND IsNumeric(Fee_MD_36)>AND Fee_MD_36 = #Fee_MD_36#</cfif>
					<cfif Fee_MD_36_IN NEQ "">AND Fee_MD_36 IN(#trim(Fee_MD_36_IN)#)</cfif>
					<cfif Fee_MD_36_LIKE NEQ "">AND Fee_MD_36 LIKE '%#trim(Fee_MD_36_LIKE)#%'</cfif>
					<cfif Fee_MA_37 NEQ "" AND IsNumeric(Fee_MA_37)>AND Fee_MA_37 = #Fee_MA_37#</cfif>
					<cfif Fee_MA_37_IN NEQ "">AND Fee_MA_37 IN(#trim(Fee_MA_37_IN)#)</cfif>
					<cfif Fee_MA_37_LIKE NEQ "">AND Fee_MA_37 LIKE '%#trim(Fee_MA_37_LIKE)#%'</cfif>
					<cfif Fee_MI_38 NEQ "" AND IsNumeric(Fee_MI_38)>AND Fee_MI_38 = #Fee_MI_38#</cfif>
					<cfif Fee_MI_38_IN NEQ "">AND Fee_MI_38 IN(#trim(Fee_MI_38_IN)#)</cfif>
					<cfif Fee_MI_38_LIKE NEQ "">AND Fee_MI_38 LIKE '%#trim(Fee_MI_38_LIKE)#%'</cfif>
					<cfif Fee_MN_39 NEQ "" AND IsNumeric(Fee_MN_39)>AND Fee_MN_39 = #Fee_MN_39#</cfif>
					<cfif Fee_MN_39_IN NEQ "">AND Fee_MN_39 IN(#trim(Fee_MN_39_IN)#)</cfif>
					<cfif Fee_MN_39_LIKE NEQ "">AND Fee_MN_39 LIKE '%#trim(Fee_MN_39_LIKE)#%'</cfif>
					<cfif Fee_MS_40 NEQ "" AND IsNumeric(Fee_MS_40)>AND Fee_MS_40 = #Fee_MS_40#</cfif>
					<cfif Fee_MS_40_IN NEQ "">AND Fee_MS_40 IN(#trim(Fee_MS_40_IN)#)</cfif>
					<cfif Fee_MS_40_LIKE NEQ "">AND Fee_MS_40 LIKE '%#trim(Fee_MS_40_LIKE)#%'</cfif>
					<cfif Fee_MO_41 NEQ "" AND IsNumeric(Fee_MO_41)>AND Fee_MO_41 = #Fee_MO_41#</cfif>
					<cfif Fee_MO_41_IN NEQ "">AND Fee_MO_41 IN(#trim(Fee_MO_41_IN)#)</cfif>
					<cfif Fee_MO_41_LIKE NEQ "">AND Fee_MO_41 LIKE '%#trim(Fee_MO_41_LIKE)#%'</cfif>
					<cfif Fee_MT_42 NEQ "" AND IsNumeric(Fee_MT_42)>AND Fee_MT_42 = #Fee_MT_42#</cfif>
					<cfif Fee_MT_42_IN NEQ "">AND Fee_MT_42 IN(#trim(Fee_MT_42_IN)#)</cfif>
					<cfif Fee_MT_42_LIKE NEQ "">AND Fee_MT_42 LIKE '%#trim(Fee_MT_42_LIKE)#%'</cfif>
					<cfif Fee_NE_43 NEQ "" AND IsNumeric(Fee_NE_43)>AND Fee_NE_43 = #Fee_NE_43#</cfif>
					<cfif Fee_NE_43_IN NEQ "">AND Fee_NE_43 IN(#trim(Fee_NE_43_IN)#)</cfif>
					<cfif Fee_NE_43_LIKE NEQ "">AND Fee_NE_43 LIKE '%#trim(Fee_NE_43_LIKE)#%'</cfif>
					<cfif Fee_NV_44 NEQ "" AND IsNumeric(Fee_NV_44)>AND Fee_NV_44 = #Fee_NV_44#</cfif>
					<cfif Fee_NV_44_IN NEQ "">AND Fee_NV_44 IN(#trim(Fee_NV_44_IN)#)</cfif>
					<cfif Fee_NV_44_LIKE NEQ "">AND Fee_NV_44 LIKE '%#trim(Fee_NV_44_LIKE)#%'</cfif>
					<cfif Fee_NE_45 NEQ "" AND IsNumeric(Fee_NE_45)>AND Fee_NE_45 = #Fee_NE_45#</cfif>
					<cfif Fee_NE_45_IN NEQ "">AND Fee_NE_45 IN(#trim(Fee_NE_45_IN)#)</cfif>
					<cfif Fee_NE_45_LIKE NEQ "">AND Fee_NE_45 LIKE '%#trim(Fee_NE_45_LIKE)#%'</cfif>
					<cfif Fee_NJ_46 NEQ "" AND IsNumeric(Fee_NJ_46)>AND Fee_NJ_46 = #Fee_NJ_46#</cfif>
					<cfif Fee_NJ_46_IN NEQ "">AND Fee_NJ_46 IN(#trim(Fee_NJ_46_IN)#)</cfif>
					<cfif Fee_NJ_46_LIKE NEQ "">AND Fee_NJ_46 LIKE '%#trim(Fee_NJ_46_LIKE)#%'</cfif>
					<cfif Fee_NM_47 NEQ "" AND IsNumeric(Fee_NM_47)>AND Fee_NM_47 = #Fee_NM_47#</cfif>
					<cfif Fee_NM_47_IN NEQ "">AND Fee_NM_47 IN(#trim(Fee_NM_47_IN)#)</cfif>
					<cfif Fee_NM_47_LIKE NEQ "">AND Fee_NM_47 LIKE '%#trim(Fee_NM_47_LIKE)#%'</cfif>
					<cfif Fee_NY_48 NEQ "" AND IsNumeric(Fee_NY_48)>AND Fee_NY_48 = #Fee_NY_48#</cfif>
					<cfif Fee_NY_48_IN NEQ "">AND Fee_NY_48 IN(#trim(Fee_NY_48_IN)#)</cfif>
					<cfif Fee_NY_48_LIKE NEQ "">AND Fee_NY_48 LIKE '%#trim(Fee_NY_48_LIKE)#%'</cfif>
					<cfif Fee_NC_49 NEQ "" AND IsNumeric(Fee_NC_49)>AND Fee_NC_49 = #Fee_NC_49#</cfif>
					<cfif Fee_NC_49_IN NEQ "">AND Fee_NC_49 IN(#trim(Fee_NC_49_IN)#)</cfif>
					<cfif Fee_NC_49_LIKE NEQ "">AND Fee_NC_49 LIKE '%#trim(Fee_NC_49_LIKE)#%'</cfif>
					<cfif Fee_ND_50 NEQ "" AND IsNumeric(Fee_ND_50)>AND Fee_ND_50 = #Fee_ND_50#</cfif>
					<cfif Fee_ND_50_IN NEQ "">AND Fee_ND_50 IN(#trim(Fee_ND_50_IN)#)</cfif>
					<cfif Fee_ND_50_LIKE NEQ "">AND Fee_ND_50 LIKE '%#trim(Fee_ND_50_LIKE)#%'</cfif>
					<cfif Fee_OH_51 NEQ "" AND IsNumeric(Fee_OH_51)>AND Fee_OH_51 = #Fee_OH_51#</cfif>
					<cfif Fee_OH_51_IN NEQ "">AND Fee_OH_51 IN(#trim(Fee_OH_51_IN)#)</cfif>
					<cfif Fee_OH_51_LIKE NEQ "">AND Fee_OH_51 LIKE '%#trim(Fee_OH_51_LIKE)#%'</cfif>
					<cfif Fee_OK_52 NEQ "" AND IsNumeric(Fee_OK_52)>AND Fee_OK_52 = #Fee_OK_52#</cfif>
					<cfif Fee_OK_52_IN NEQ "">AND Fee_OK_52 IN(#trim(Fee_OK_52_IN)#)</cfif>
					<cfif Fee_OK_52_LIKE NEQ "">AND Fee_OK_52 LIKE '%#trim(Fee_OK_52_LIKE)#%'</cfif>
					<cfif Fee_OR_53 NEQ "" AND IsNumeric(Fee_OR_53)>AND Fee_OR_53 = #Fee_OR_53#</cfif>
					<cfif Fee_OR_53_IN NEQ "">AND Fee_OR_53 IN(#trim(Fee_OR_53_IN)#)</cfif>
					<cfif Fee_OR_53_LIKE NEQ "">AND Fee_OR_53 LIKE '%#trim(Fee_OR_53_LIKE)#%'</cfif>
					<cfif Fee_PA_54 NEQ "" AND IsNumeric(Fee_PA_54)>AND Fee_PA_54 = #Fee_PA_54#</cfif>
					<cfif Fee_PA_54_IN NEQ "">AND Fee_PA_54 IN(#trim(Fee_PA_54_IN)#)</cfif>
					<cfif Fee_PA_54_LIKE NEQ "">AND Fee_PA_54 LIKE '%#trim(Fee_PA_54_LIKE)#%'</cfif>
					<cfif Fee_RI_55 NEQ "" AND IsNumeric(Fee_RI_55)>AND Fee_RI_55 = #Fee_RI_55#</cfif>
					<cfif Fee_RI_55_IN NEQ "">AND Fee_RI_55 IN(#trim(Fee_RI_55_IN)#)</cfif>
					<cfif Fee_RI_55_LIKE NEQ "">AND Fee_RI_55 LIKE '%#trim(Fee_RI_55_LIKE)#%'</cfif>
					<cfif Fee_SC_56 NEQ "" AND IsNumeric(Fee_SC_56)>AND Fee_SC_56 = #Fee_SC_56#</cfif>
					<cfif Fee_SC_56_IN NEQ "">AND Fee_SC_56 IN(#trim(Fee_SC_56_IN)#)</cfif>
					<cfif Fee_SC_56_LIKE NEQ "">AND Fee_SC_56 LIKE '%#trim(Fee_SC_56_LIKE)#%'</cfif>
					<cfif Fee_SD_57 NEQ "" AND IsNumeric(Fee_SD_57)>AND Fee_SD_57 = #Fee_SD_57#</cfif>
					<cfif Fee_SD_57_IN NEQ "">AND Fee_SD_57 IN(#trim(Fee_SD_57_IN)#)</cfif>
					<cfif Fee_SD_57_LIKE NEQ "">AND Fee_SD_57 LIKE '%#trim(Fee_SD_57_LIKE)#%'</cfif>
					<cfif Fee_TN_58 NEQ "" AND IsNumeric(Fee_TN_58)>AND Fee_TN_58 = #Fee_TN_58#</cfif>
					<cfif Fee_TN_58_IN NEQ "">AND Fee_TN_58 IN(#trim(Fee_TN_58_IN)#)</cfif>
					<cfif Fee_TN_58_LIKE NEQ "">AND Fee_TN_58 LIKE '%#trim(Fee_TN_58_LIKE)#%'</cfif>
					<cfif Fee_TX_59 NEQ "" AND IsNumeric(Fee_TX_59)>AND Fee_TX_59 = #Fee_TX_59#</cfif>
					<cfif Fee_TX_59_IN NEQ "">AND Fee_TX_59 IN(#trim(Fee_TX_59_IN)#)</cfif>
					<cfif Fee_TX_59_LIKE NEQ "">AND Fee_TX_59 LIKE '%#trim(Fee_TX_59_LIKE)#%'</cfif>
					<cfif Fee_UT_60 NEQ "" AND IsNumeric(Fee_UT_60)>AND Fee_UT_60 = #Fee_UT_60#</cfif>
					<cfif Fee_UT_60_IN NEQ "">AND Fee_UT_60 IN(#trim(Fee_UT_60_IN)#)</cfif>
					<cfif Fee_UT_60_LIKE NEQ "">AND Fee_UT_60 LIKE '%#trim(Fee_UT_60_LIKE)#%'</cfif>
					<cfif Fee_VT_61 NEQ "" AND IsNumeric(Fee_VT_61)>AND Fee_VT_61 = #Fee_VT_61#</cfif>
					<cfif Fee_VT_61_IN NEQ "">AND Fee_VT_61 IN(#trim(Fee_VT_61_IN)#)</cfif>
					<cfif Fee_VT_61_LIKE NEQ "">AND Fee_VT_61 LIKE '%#trim(Fee_VT_61_LIKE)#%'</cfif>
					<cfif Fee_VA_62 NEQ "" AND IsNumeric(Fee_VA_62)>AND Fee_VA_62 = #Fee_VA_62#</cfif>
					<cfif Fee_VA_62_IN NEQ "">AND Fee_VA_62 IN(#trim(Fee_VA_62_IN)#)</cfif>
					<cfif Fee_VA_62_LIKE NEQ "">AND Fee_VA_62 LIKE '%#trim(Fee_VA_62_LIKE)#%'</cfif>
					<cfif Fee_WA_63 NEQ "" AND IsNumeric(Fee_WA_63)>AND Fee_WA_63 = #Fee_WA_63#</cfif>
					<cfif Fee_WA_63_IN NEQ "">AND Fee_WA_63 IN(#trim(Fee_WA_63_IN)#)</cfif>
					<cfif Fee_WA_63_LIKE NEQ "">AND Fee_WA_63 LIKE '%#trim(Fee_WA_63_LIKE)#%'</cfif>
					<cfif Fee_WV_64 NEQ "" AND IsNumeric(Fee_WV_64)>AND Fee_WV_64 = #Fee_WV_64#</cfif>
					<cfif Fee_WV_64_IN NEQ "">AND Fee_WV_64 IN(#trim(Fee_WV_64_IN)#)</cfif>
					<cfif Fee_WV_64_LIKE NEQ "">AND Fee_WV_64 LIKE '%#trim(Fee_WV_64_LIKE)#%'</cfif>
					<cfif Fee_WI_65 NEQ "" AND IsNumeric(Fee_WI_65)>AND Fee_WI_65 = #Fee_WI_65#</cfif>
					<cfif Fee_WI_65_IN NEQ "">AND Fee_WI_65 IN(#trim(Fee_WI_65_IN)#)</cfif>
					<cfif Fee_WI_65_LIKE NEQ "">AND Fee_WI_65 LIKE '%#trim(Fee_WI_65_LIKE)#%'</cfif>
					<cfif Fee_WY_66 NEQ "" AND IsNumeric(Fee_WY_66)>AND Fee_WY_66 = #Fee_WY_66#</cfif>
					<cfif Fee_WY_66_IN NEQ "">AND Fee_WY_66 IN(#trim(Fee_WY_66_IN)#)</cfif>
					<cfif Fee_WY_66_LIKE NEQ "">AND Fee_WY_66 LIKE '%#trim(Fee_WY_66_LIKE)#%'</cfif>
					<cfif Fee_PR_229 NEQ "" AND IsNumeric(Fee_PR_229)>AND Fee_PR_229 = #Fee_PR_229#</cfif>
					<cfif Fee_PR_229_IN NEQ "">AND Fee_PR_229 IN(#trim(Fee_PR_229_IN)#)</cfif>
					<cfif Fee_PR_229_LIKE NEQ "">AND Fee_PR_229 LIKE '%#trim(Fee_PR_229_LIKE)#%'</cfif>
					<cfif Fee_VI_238 NEQ "" AND IsNumeric(Fee_VI_238)>AND Fee_VI_238 = #Fee_VI_238#</cfif>
					<cfif Fee_VI_238_IN NEQ "">AND Fee_VI_238 IN(#trim(Fee_VI_238_IN)#)</cfif>
					<cfif Fee_VI_238_LIKE NEQ "">AND Fee_VI_238 LIKE '%#trim(Fee_VI_238_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getEOB_MEDICARE_2002_PROCEDURECodeFeeScheduleQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




