<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- IntakeHCPCIO.cfc                                                               --->
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
<!--- This tag is a CFC tag tied to the IntakeHCPC table in the dB.                  --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_IntakeHCPCTable                                                  --->  
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
<!--- IntakeHCPCID<br>                                                               --->
<!--- IntakeID<br>                                                                   --->
<!--- hcpcCode1TBox<br>                                                              --->
<!--- hcpcQty1TBox<br>                                                               --->
<!--- hcpcProduct1TBox<br>                                                           --->
<!--- hcpcDX1TBox<br>                                                                --->
<!--- hcpcDiagnosis1TBox<br>                                                         --->
<!--- hcpcCost1TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear1TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth1TBox<br>                                                 --->
<!--- hcpcCode2TBox<br>                                                              --->
<!--- hcpcQty2TBox<br>                                                               --->
<!--- hcpcProduct2TBox<br>                                                           --->
<!--- hcpcDX2TBox<br>                                                                --->
<!--- hcpcDiagnosis2TBox<br>                                                         --->
<!--- hcpcCost2TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear2TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth2TBox<br>                                                 --->
<!--- hcpcCode3TBox<br>                                                              --->
<!--- hcpcQty3TBox<br>                                                               --->
<!--- hcpcProduct3TBox<br>                                                           --->
<!--- hcpcDX3TBox<br>                                                                --->
<!--- hcpcDiagnosis3TBox<br>                                                         --->
<!--- hcpcCost3TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear3TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth3TBox<br>                                                 --->
<!--- hcpcCode4TBox<br>                                                              --->
<!--- hcpcQty4TBox<br>                                                               --->
<!--- hcpcProduct4TBox<br>                                                           --->
<!--- hcpcDX4TBox<br>                                                                --->
<!--- hcpcDiagnosis4TBox<br>                                                         --->
<!--- hcpcCost4TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear4TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth4TBox<br>                                                 --->
<!--- hcpcCode5TBox<br>                                                              --->
<!--- hcpcQty5TBox<br>                                                               --->
<!--- hcpcProduct5TBox<br>                                                           --->
<!--- hcpcDX5TBox<br>                                                                --->
<!--- hcpcDiagnosis5TBox<br>                                                         --->
<!--- hcpcCost5TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear5TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth5TBox<br>                                                 --->
<!--- hcpcCode6TBox<br>                                                              --->
<!--- hcpcQty6TBox<br>                                                               --->
<!--- hcpcProduct6TBox<br>                                                           --->
<!--- hcpcDX6TBox<br>                                                                --->
<!--- hcpcDiagnosis6TBox<br>                                                         --->
<!--- hcpcCost6TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear6TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth6TBox<br>                                                 --->
<!--- hcpcCode7TBox<br>                                                              --->
<!--- hcpcQty7TBox<br>                                                               --->
<!--- hcpcProduct7TBox<br>                                                           --->
<!--- hcpcDX7TBox<br>                                                                --->
<!--- hcpcDiagnosis7TBox<br>                                                         --->
<!--- hcpcCost7TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear7TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth7TBox<br>                                                 --->
<!--- hcpcCode8TBox<br>                                                              --->
<!--- hcpcQty8TBox<br>                                                               --->
<!--- hcpcProduct8TBox<br>                                                           --->
<!--- hcpcDX8TBox<br>                                                                --->
<!--- hcpcDiagnosis8TBox<br>                                                         --->
<!--- hcpcCost8TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear8TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth8TBox<br>                                                 --->
<!--- hcpcCode9TBox<br>                                                              --->
<!--- hcpcQty9TBox<br>                                                               --->
<!--- hcpcProduct9TBox<br>                                                           --->
<!--- hcpcDX9TBox<br>                                                                --->
<!--- hcpcDiagnosis9TBox<br>                                                         --->
<!--- hcpcCost9TBox<br>                                                              --->
<!--- hcpcLengthOfNeedYear9TBox<br>                                                  --->
<!--- hcpcLengthOfNeedMonth9TBox<br>                                                 --->
<!--- hcpcCode10TBox<br>                                                             --->
<!--- hcpcQty10TBox<br>                                                              --->
<!--- hcpcProduct10TBox<br>                                                          --->
<!--- hcpcDX10TBox<br>                                                               --->
<!--- hcpcDiagnosis10TBox<br>                                                        --->
<!--- hcpcCost10TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear10TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth10TBox<br>                                                --->
<!--- hcpcCode11TBox<br>                                                             --->
<!--- hcpcQty11TBox<br>                                                              --->
<!--- hcpcProduct11TBox<br>                                                          --->
<!--- hcpcDX11TBox<br>                                                               --->
<!--- hcpcDiagnosis11TBox<br>                                                        --->
<!--- hcpcCost11TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear11TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth11TBox<br>                                                --->
<!--- hcpcCode12TBox<br>                                                             --->
<!--- hcpcQty12TBox<br>                                                              --->
<!--- hcpcProduct12TBox<br>                                                          --->
<!--- hcpcDX12TBox<br>                                                               --->
<!--- hcpcDiagnosis12TBox<br>                                                        --->
<!--- hcpcCost12TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear12TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth12TBox<br>                                                --->
<!--- hcpcCode13TBox<br>                                                             --->
<!--- hcpcQty13TBox<br>                                                              --->
<!--- hcpcProduct13TBox<br>                                                          --->
<!--- hcpcDX13TBox<br>                                                               --->
<!--- hcpcDiagnosis13TBox<br>                                                        --->
<!--- hcpcCost13TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear13TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth13TBox<br>                                                --->
<!--- hcpcCode14TBox<br>                                                             --->
<!--- hcpcQty14TBox<br>                                                              --->
<!--- hcpcProduct14TBox<br>                                                          --->
<!--- hcpcDX14TBox<br>                                                               --->
<!--- hcpcDiagnosis14TBox<br>                                                        --->
<!--- hcpcCost14TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear14TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth14TBox<br>                                                --->
<!--- hcpcCode15TBox<br>                                                             --->
<!--- hcpcQty15TBox<br>                                                              --->
<!--- hcpcProduct15TBox<br>                                                          --->
<!--- hcpcDX15TBox<br>                                                               --->
<!--- hcpcDiagnosis15TBox<br>                                                        --->
<!--- hcpcCost15TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear15TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth15TBox<br>                                                --->
<!--- hcpcCode16TBox<br>                                                             --->
<!--- hcpcQty16TBox<br>                                                              --->
<!--- hcpcProduct16TBox<br>                                                          --->
<!--- hcpcDX16TBox<br>                                                               --->
<!--- hcpcDiagnosis16TBox<br>                                                        --->
<!--- hcpcCost16TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear16TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth16TBox<br>                                                --->
<!--- hcpcCode17TBox<br>                                                             --->
<!--- hcpcQty17TBox<br>                                                              --->
<!--- hcpcProduct17TBox<br>                                                          --->
<!--- hcpcDX17TBox<br>                                                               --->
<!--- hcpcDiagnosis17TBox<br>                                                        --->
<!--- hcpcCost17TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear17TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth17TBox<br>                                                --->
<!--- hcpcCode18TBox<br>                                                             --->
<!--- hcpcQty18TBox<br>                                                              --->
<!--- hcpcProduct18TBox<br>                                                          --->
<!--- hcpcDX18TBox<br>                                                               --->
<!--- hcpcDiagnosis18TBox<br>                                                        --->
<!--- hcpcCost18TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear18TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth18TBox<br>                                                --->
<!--- hcpcCode19TBox<br>                                                             --->
<!--- hcpcQty19TBox<br>                                                              --->
<!--- hcpcProduct19TBox<br>                                                          --->
<!--- hcpcDX19TBox<br>                                                               --->
<!--- hcpcDiagnosis19TBox<br>                                                        --->
<!--- hcpcCost19TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear19TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth19TBox<br>                                                --->
<!--- hcpcCode20TBox<br>                                                             --->
<!--- hcpcQty20TBox<br>                                                              --->
<!--- hcpcProduct20TBox<br>                                                          --->
<!--- hcpcDX20TBox<br>                                                               --->
<!--- hcpcDiagnosis20TBox<br>                                                        --->
<!--- hcpcCost20TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear20TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth20TBox<br>                                                --->
<!--- hcpcCode21TBox<br>                                                             --->
<!--- hcpcQty21TBox<br>                                                              --->
<!--- hcpcProduct21TBox<br>                                                          --->
<!--- hcpcDX21TBox<br>                                                               --->
<!--- hcpcDiagnosis21TBox<br>                                                        --->
<!--- hcpcCost21TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear21TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth21TBox<br>                                                --->
<!--- hcpcCode22TBox<br>                                                             --->
<!--- hcpcQty22TBox<br>                                                              --->
<!--- hcpcProduct22TBox<br>                                                          --->
<!--- hcpcDX22TBox<br>                                                               --->
<!--- hcpcDiagnosis22TBox<br>                                                        --->
<!--- hcpcCost22TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear22TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth22TBox<br>                                                --->
<!--- hcpcCode23TBox<br>                                                             --->
<!--- hcpcQty23TBox<br>                                                              --->
<!--- hcpcProduct23TBox<br>                                                          --->
<!--- hcpcDX23TBox<br>                                                               --->
<!--- hcpcDiagnosis23TBox<br>                                                        --->
<!--- hcpcCost23TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear23TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth23TBox<br>                                                --->
<!--- hcpcCode24TBox<br>                                                             --->
<!--- hcpcQty24TBox<br>                                                              --->
<!--- hcpcProduct24TBox<br>                                                          --->
<!--- hcpcDX24TBox<br>                                                               --->
<!--- hcpcDiagnosis24TBox<br>                                                        --->
<!--- hcpcCost24TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear24TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth24TBox<br>                                                --->
<!--- hcpcCode25TBox<br>                                                             --->
<!--- hcpcQty25TBox<br>                                                              --->
<!--- hcpcProduct25TBox<br>                                                          --->
<!--- hcpcDX25TBox<br>                                                               --->
<!--- hcpcDiagnosis25TBox<br>                                                        --->
<!--- hcpcCost25TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear25TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth25TBox<br>                                                --->
<!--- hcpcCode26TBox<br>                                                             --->
<!--- hcpcQty26TBox<br>                                                              --->
<!--- hcpcProduct26TBox<br>                                                          --->
<!--- hcpcDX26TBox<br>                                                               --->
<!--- hcpcDiagnosis26TBox<br>                                                        --->
<!--- hcpcCost26TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear26TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth26TBox<br>                                                --->
<!--- hcpcCode27TBox<br>                                                             --->
<!--- hcpcQty27TBox<br>                                                              --->
<!--- hcpcProduct27TBox<br>                                                          --->
<!--- hcpcDX27TBox<br>                                                               --->
<!--- hcpcDiagnosis27TBox<br>                                                        --->
<!--- hcpcCost27TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear27TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth27TBox<br>                                                --->
<!--- hcpcCode28TBox<br>                                                             --->
<!--- hcpcQty28TBox<br>                                                              --->
<!--- hcpcProduct28TBox<br>                                                          --->
<!--- hcpcDX28TBox<br>                                                               --->
<!--- hcpcDiagnosis28TBox<br>                                                        --->
<!--- hcpcCost28TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear28TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth28TBox<br>                                                --->
<!--- hcpcCode29TBox<br>                                                             --->
<!--- hcpcQty29TBox<br>                                                              --->
<!--- hcpcProduct29TBox<br>                                                          --->
<!--- hcpcDX29TBox<br>                                                               --->
<!--- hcpcDiagnosis29TBox<br>                                                        --->
<!--- hcpcCost29TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear29TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth29TBox<br>                                                --->
<!--- hcpcCode30TBox<br>                                                             --->
<!--- hcpcQty30TBox<br>                                                              --->
<!--- hcpcProduct30TBox<br>                                                          --->
<!--- hcpcDX30TBox<br>                                                               --->
<!--- hcpcDiagnosis30TBox<br>                                                        --->
<!--- hcpcCost30TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear30TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth30TBox<br>                                                --->
<!--- hcpcCode31TBox<br>                                                             --->
<!--- hcpcQty31TBox<br>                                                              --->
<!--- hcpcProduct31TBox<br>                                                          --->
<!--- hcpcDX31TBox<br>                                                               --->
<!--- hcpcDiagnosis31TBox<br>                                                        --->
<!--- hcpcCost31TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear31TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth31TBox<br>                                                --->
<!--- hcpcCode32TBox<br>                                                             --->
<!--- hcpcQty32TBox<br>                                                              --->
<!--- hcpcProduct32TBox<br>                                                          --->
<!--- hcpcDX32TBox<br>                                                               --->
<!--- hcpcDiagnosis32TBox<br>                                                        --->
<!--- hcpcCost32TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear32TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth32TBox<br>                                                --->
<!--- hcpcCode33TBox<br>                                                             --->
<!--- hcpcQty33TBox<br>                                                              --->
<!--- hcpcProduct33TBox<br>                                                          --->
<!--- hcpcDX33TBox<br>                                                               --->
<!--- hcpcDiagnosis33TBox<br>                                                        --->
<!--- hcpcCost33TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear33TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth33TBox<br>                                                --->
<!--- hcpcCode34TBox<br>                                                             --->
<!--- hcpcQty34TBox<br>                                                              --->
<!--- hcpcProduct34TBox<br>                                                          --->
<!--- hcpcDX34TBox<br>                                                               --->
<!--- hcpcDiagnosis34TBox<br>                                                        --->
<!--- hcpcCost34TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear34TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth34TBox<br>                                                --->
<!--- hcpcCode35TBox<br>                                                             --->
<!--- hcpcQty35TBox<br>                                                              --->
<!--- hcpcProduct35TBox<br>                                                          --->
<!--- hcpcDX35TBox<br>                                                               --->
<!--- hcpcDiagnosis35TBox<br>                                                        --->
<!--- hcpcCost35TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear35TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth35TBox<br>                                                --->
<!--- hcpcCode36TBox<br>                                                             --->
<!--- hcpcQty36TBox<br>                                                              --->
<!--- hcpcProduct36TBox<br>                                                          --->
<!--- hcpcDX36TBox<br>                                                               --->
<!--- hcpcDiagnosis36TBox<br>                                                        --->
<!--- hcpcCost36TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear36TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth36TBox<br>                                                --->
<!--- hcpcCode37TBox<br>                                                             --->
<!--- hcpcQty37TBox<br>                                                              --->
<!--- hcpcProduct37TBox<br>                                                          --->
<!--- hcpcDX37TBox<br>                                                               --->
<!--- hcpcDiagnosis37TBox<br>                                                        --->
<!--- hcpcCost37TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear37TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth37TBox<br>                                                --->
<!--- hcpcCode38TBox<br>                                                             --->
<!--- hcpcQty38TBox<br>                                                              --->
<!--- hcpcProduct38TBox<br>                                                          --->
<!--- hcpcDX38TBox<br>                                                               --->
<!--- hcpcDiagnosis38TBox<br>                                                        --->
<!--- hcpcCost38TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear38TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth38TBox<br>                                                --->
<!--- hcpcCode39TBox<br>                                                             --->
<!--- hcpcQty39TBox<br>                                                              --->
<!--- hcpcProduct39TBox<br>                                                          --->
<!--- hcpcDX39TBox<br>                                                               --->
<!--- hcpcDiagnosis39TBox<br>                                                        --->
<!--- hcpcCost39TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear39TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth39TBox<br>                                                --->
<!--- hcpcCode40TBox<br>                                                             --->
<!--- hcpcQty40TBox<br>                                                              --->
<!--- hcpcProduct40TBox<br>                                                          --->
<!--- hcpcDX40TBox<br>                                                               --->
<!--- hcpcDiagnosis40TBox<br>                                                        --->
<!--- hcpcCost40TBox<br>                                                             --->
<!--- hcpcLengthOfNeedYear40TBox<br>                                                 --->
<!--- hcpcLengthOfNeedMonth40TBox<br>                                                --->
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


<cfcomponent name="IntakeHCPCIO">

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
			variables.instance.IntakeHCPCID = "NULL";
			variables.instance.IntakeID = "NULL";
			variables.instance.hcpcCode1TBox = "";
			variables.instance.hcpcQty1TBox = "";
			variables.instance.hcpcProduct1TBox = "";
			variables.instance.hcpcDX1TBox = "";
			variables.instance.hcpcDiagnosis1TBox = "";
			variables.instance.hcpcCost1TBox = "";
			variables.instance.hcpcLengthOfNeedYear1TBox = "";
			variables.instance.hcpcLengthOfNeedMonth1TBox = "";
			variables.instance.hcpcCode2TBox = "";
			variables.instance.hcpcQty2TBox = "";
			variables.instance.hcpcProduct2TBox = "";
			variables.instance.hcpcDX2TBox = "";
			variables.instance.hcpcDiagnosis2TBox = "";
			variables.instance.hcpcCost2TBox = "";
			variables.instance.hcpcLengthOfNeedYear2TBox = "";
			variables.instance.hcpcLengthOfNeedMonth2TBox = "";
			variables.instance.hcpcCode3TBox = "";
			variables.instance.hcpcQty3TBox = "";
			variables.instance.hcpcProduct3TBox = "";
			variables.instance.hcpcDX3TBox = "";
			variables.instance.hcpcDiagnosis3TBox = "";
			variables.instance.hcpcCost3TBox = "";
			variables.instance.hcpcLengthOfNeedYear3TBox = "";
			variables.instance.hcpcLengthOfNeedMonth3TBox = "";
			variables.instance.hcpcCode4TBox = "";
			variables.instance.hcpcQty4TBox = "";
			variables.instance.hcpcProduct4TBox = "";
			variables.instance.hcpcDX4TBox = "";
			variables.instance.hcpcDiagnosis4TBox = "";
			variables.instance.hcpcCost4TBox = "";
			variables.instance.hcpcLengthOfNeedYear4TBox = "";
			variables.instance.hcpcLengthOfNeedMonth4TBox = "";
			variables.instance.hcpcCode5TBox = "";
			variables.instance.hcpcQty5TBox = "";
			variables.instance.hcpcProduct5TBox = "";
			variables.instance.hcpcDX5TBox = "";
			variables.instance.hcpcDiagnosis5TBox = "";
			variables.instance.hcpcCost5TBox = "";
			variables.instance.hcpcLengthOfNeedYear5TBox = "";
			variables.instance.hcpcLengthOfNeedMonth5TBox = "";
			variables.instance.hcpcCode6TBox = "";
			variables.instance.hcpcQty6TBox = "";
			variables.instance.hcpcProduct6TBox = "";
			variables.instance.hcpcDX6TBox = "";
			variables.instance.hcpcDiagnosis6TBox = "";
			variables.instance.hcpcCost6TBox = "";
			variables.instance.hcpcLengthOfNeedYear6TBox = "";
			variables.instance.hcpcLengthOfNeedMonth6TBox = "";
			variables.instance.hcpcCode7TBox = "";
			variables.instance.hcpcQty7TBox = "";
			variables.instance.hcpcProduct7TBox = "";
			variables.instance.hcpcDX7TBox = "";
			variables.instance.hcpcDiagnosis7TBox = "";
			variables.instance.hcpcCost7TBox = "";
			variables.instance.hcpcLengthOfNeedYear7TBox = "";
			variables.instance.hcpcLengthOfNeedMonth7TBox = "";
			variables.instance.hcpcCode8TBox = "";
			variables.instance.hcpcQty8TBox = "";
			variables.instance.hcpcProduct8TBox = "";
			variables.instance.hcpcDX8TBox = "";
			variables.instance.hcpcDiagnosis8TBox = "";
			variables.instance.hcpcCost8TBox = "";
			variables.instance.hcpcLengthOfNeedYear8TBox = "";
			variables.instance.hcpcLengthOfNeedMonth8TBox = "";
			variables.instance.hcpcCode9TBox = "";
			variables.instance.hcpcQty9TBox = "";
			variables.instance.hcpcProduct9TBox = "";
			variables.instance.hcpcDX9TBox = "";
			variables.instance.hcpcDiagnosis9TBox = "";
			variables.instance.hcpcCost9TBox = "";
			variables.instance.hcpcLengthOfNeedYear9TBox = "";
			variables.instance.hcpcLengthOfNeedMonth9TBox = "";
			variables.instance.hcpcCode10TBox = "";
			variables.instance.hcpcQty10TBox = "";
			variables.instance.hcpcProduct10TBox = "";
			variables.instance.hcpcDX10TBox = "";
			variables.instance.hcpcDiagnosis10TBox = "";
			variables.instance.hcpcCost10TBox = "";
			variables.instance.hcpcLengthOfNeedYear10TBox = "";
			variables.instance.hcpcLengthOfNeedMonth10TBox = "";
			variables.instance.hcpcCode11TBox = "";
			variables.instance.hcpcQty11TBox = "";
			variables.instance.hcpcProduct11TBox = "";
			variables.instance.hcpcDX11TBox = "";
			variables.instance.hcpcDiagnosis11TBox = "";
			variables.instance.hcpcCost11TBox = "";
			variables.instance.hcpcLengthOfNeedYear11TBox = "";
			variables.instance.hcpcLengthOfNeedMonth11TBox = "";
			variables.instance.hcpcCode12TBox = "";
			variables.instance.hcpcQty12TBox = "";
			variables.instance.hcpcProduct12TBox = "";
			variables.instance.hcpcDX12TBox = "";
			variables.instance.hcpcDiagnosis12TBox = "";
			variables.instance.hcpcCost12TBox = "";
			variables.instance.hcpcLengthOfNeedYear12TBox = "";
			variables.instance.hcpcLengthOfNeedMonth12TBox = "";
			variables.instance.hcpcCode13TBox = "";
			variables.instance.hcpcQty13TBox = "";
			variables.instance.hcpcProduct13TBox = "";
			variables.instance.hcpcDX13TBox = "";
			variables.instance.hcpcDiagnosis13TBox = "";
			variables.instance.hcpcCost13TBox = "";
			variables.instance.hcpcLengthOfNeedYear13TBox = "";
			variables.instance.hcpcLengthOfNeedMonth13TBox = "";
			variables.instance.hcpcCode14TBox = "";
			variables.instance.hcpcQty14TBox = "";
			variables.instance.hcpcProduct14TBox = "";
			variables.instance.hcpcDX14TBox = "";
			variables.instance.hcpcDiagnosis14TBox = "";
			variables.instance.hcpcCost14TBox = "";
			variables.instance.hcpcLengthOfNeedYear14TBox = "";
			variables.instance.hcpcLengthOfNeedMonth14TBox = "";
			variables.instance.hcpcCode15TBox = "";
			variables.instance.hcpcQty15TBox = "";
			variables.instance.hcpcProduct15TBox = "";
			variables.instance.hcpcDX15TBox = "";
			variables.instance.hcpcDiagnosis15TBox = "";
			variables.instance.hcpcCost15TBox = "";
			variables.instance.hcpcLengthOfNeedYear15TBox = "";
			variables.instance.hcpcLengthOfNeedMonth15TBox = "";
			variables.instance.hcpcCode16TBox = "";
			variables.instance.hcpcQty16TBox = "";
			variables.instance.hcpcProduct16TBox = "";
			variables.instance.hcpcDX16TBox = "";
			variables.instance.hcpcDiagnosis16TBox = "";
			variables.instance.hcpcCost16TBox = "";
			variables.instance.hcpcLengthOfNeedYear16TBox = "";
			variables.instance.hcpcLengthOfNeedMonth16TBox = "";
			variables.instance.hcpcCode17TBox = "";
			variables.instance.hcpcQty17TBox = "";
			variables.instance.hcpcProduct17TBox = "";
			variables.instance.hcpcDX17TBox = "";
			variables.instance.hcpcDiagnosis17TBox = "";
			variables.instance.hcpcCost17TBox = "";
			variables.instance.hcpcLengthOfNeedYear17TBox = "";
			variables.instance.hcpcLengthOfNeedMonth17TBox = "";
			variables.instance.hcpcCode18TBox = "";
			variables.instance.hcpcQty18TBox = "";
			variables.instance.hcpcProduct18TBox = "";
			variables.instance.hcpcDX18TBox = "";
			variables.instance.hcpcDiagnosis18TBox = "";
			variables.instance.hcpcCost18TBox = "";
			variables.instance.hcpcLengthOfNeedYear18TBox = "";
			variables.instance.hcpcLengthOfNeedMonth18TBox = "";
			variables.instance.hcpcCode19TBox = "";
			variables.instance.hcpcQty19TBox = "";
			variables.instance.hcpcProduct19TBox = "";
			variables.instance.hcpcDX19TBox = "";
			variables.instance.hcpcDiagnosis19TBox = "";
			variables.instance.hcpcCost19TBox = "";
			variables.instance.hcpcLengthOfNeedYear19TBox = "";
			variables.instance.hcpcLengthOfNeedMonth19TBox = "";
			variables.instance.hcpcCode20TBox = "";
			variables.instance.hcpcQty20TBox = "";
			variables.instance.hcpcProduct20TBox = "";
			variables.instance.hcpcDX20TBox = "";
			variables.instance.hcpcDiagnosis20TBox = "";
			variables.instance.hcpcCost20TBox = "";
			variables.instance.hcpcLengthOfNeedYear20TBox = "";
			variables.instance.hcpcLengthOfNeedMonth20TBox = "";
			variables.instance.hcpcCode21TBox = "";
			variables.instance.hcpcQty21TBox = "";
			variables.instance.hcpcProduct21TBox = "";
			variables.instance.hcpcDX21TBox = "";
			variables.instance.hcpcDiagnosis21TBox = "";
			variables.instance.hcpcCost21TBox = "";
			variables.instance.hcpcLengthOfNeedYear21TBox = "";
			variables.instance.hcpcLengthOfNeedMonth21TBox = "";
			variables.instance.hcpcCode22TBox = "";
			variables.instance.hcpcQty22TBox = "";
			variables.instance.hcpcProduct22TBox = "";
			variables.instance.hcpcDX22TBox = "";
			variables.instance.hcpcDiagnosis22TBox = "";
			variables.instance.hcpcCost22TBox = "";
			variables.instance.hcpcLengthOfNeedYear22TBox = "";
			variables.instance.hcpcLengthOfNeedMonth22TBox = "";
			variables.instance.hcpcCode23TBox = "";
			variables.instance.hcpcQty23TBox = "";
			variables.instance.hcpcProduct23TBox = "";
			variables.instance.hcpcDX23TBox = "";
			variables.instance.hcpcDiagnosis23TBox = "";
			variables.instance.hcpcCost23TBox = "";
			variables.instance.hcpcLengthOfNeedYear23TBox = "";
			variables.instance.hcpcLengthOfNeedMonth23TBox = "";
			variables.instance.hcpcCode24TBox = "";
			variables.instance.hcpcQty24TBox = "";
			variables.instance.hcpcProduct24TBox = "";
			variables.instance.hcpcDX24TBox = "";
			variables.instance.hcpcDiagnosis24TBox = "";
			variables.instance.hcpcCost24TBox = "";
			variables.instance.hcpcLengthOfNeedYear24TBox = "";
			variables.instance.hcpcLengthOfNeedMonth24TBox = "";
			variables.instance.hcpcCode25TBox = "";
			variables.instance.hcpcQty25TBox = "";
			variables.instance.hcpcProduct25TBox = "";
			variables.instance.hcpcDX25TBox = "";
			variables.instance.hcpcDiagnosis25TBox = "";
			variables.instance.hcpcCost25TBox = "";
			variables.instance.hcpcLengthOfNeedYear25TBox = "";
			variables.instance.hcpcLengthOfNeedMonth25TBox = "";
			variables.instance.hcpcCode26TBox = "";
			variables.instance.hcpcQty26TBox = "";
			variables.instance.hcpcProduct26TBox = "";
			variables.instance.hcpcDX26TBox = "";
			variables.instance.hcpcDiagnosis26TBox = "";
			variables.instance.hcpcCost26TBox = "";
			variables.instance.hcpcLengthOfNeedYear26TBox = "";
			variables.instance.hcpcLengthOfNeedMonth26TBox = "";
			variables.instance.hcpcCode27TBox = "";
			variables.instance.hcpcQty27TBox = "";
			variables.instance.hcpcProduct27TBox = "";
			variables.instance.hcpcDX27TBox = "";
			variables.instance.hcpcDiagnosis27TBox = "";
			variables.instance.hcpcCost27TBox = "";
			variables.instance.hcpcLengthOfNeedYear27TBox = "";
			variables.instance.hcpcLengthOfNeedMonth27TBox = "";
			variables.instance.hcpcCode28TBox = "";
			variables.instance.hcpcQty28TBox = "";
			variables.instance.hcpcProduct28TBox = "";
			variables.instance.hcpcDX28TBox = "";
			variables.instance.hcpcDiagnosis28TBox = "";
			variables.instance.hcpcCost28TBox = "";
			variables.instance.hcpcLengthOfNeedYear28TBox = "";
			variables.instance.hcpcLengthOfNeedMonth28TBox = "";
			variables.instance.hcpcCode29TBox = "";
			variables.instance.hcpcQty29TBox = "";
			variables.instance.hcpcProduct29TBox = "";
			variables.instance.hcpcDX29TBox = "";
			variables.instance.hcpcDiagnosis29TBox = "";
			variables.instance.hcpcCost29TBox = "";
			variables.instance.hcpcLengthOfNeedYear29TBox = "";
			variables.instance.hcpcLengthOfNeedMonth29TBox = "";
			variables.instance.hcpcCode30TBox = "";
			variables.instance.hcpcQty30TBox = "";
			variables.instance.hcpcProduct30TBox = "";
			variables.instance.hcpcDX30TBox = "";
			variables.instance.hcpcDiagnosis30TBox = "";
			variables.instance.hcpcCost30TBox = "";
			variables.instance.hcpcLengthOfNeedYear30TBox = "";
			variables.instance.hcpcLengthOfNeedMonth30TBox = "";
			variables.instance.hcpcCode31TBox = "";
			variables.instance.hcpcQty31TBox = "";
			variables.instance.hcpcProduct31TBox = "";
			variables.instance.hcpcDX31TBox = "";
			variables.instance.hcpcDiagnosis31TBox = "";
			variables.instance.hcpcCost31TBox = "";
			variables.instance.hcpcLengthOfNeedYear31TBox = "";
			variables.instance.hcpcLengthOfNeedMonth31TBox = "";
			variables.instance.hcpcCode32TBox = "";
			variables.instance.hcpcQty32TBox = "";
			variables.instance.hcpcProduct32TBox = "";
			variables.instance.hcpcDX32TBox = "";
			variables.instance.hcpcDiagnosis32TBox = "";
			variables.instance.hcpcCost32TBox = "";
			variables.instance.hcpcLengthOfNeedYear32TBox = "";
			variables.instance.hcpcLengthOfNeedMonth32TBox = "";
			variables.instance.hcpcCode33TBox = "";
			variables.instance.hcpcQty33TBox = "";
			variables.instance.hcpcProduct33TBox = "";
			variables.instance.hcpcDX33TBox = "";
			variables.instance.hcpcDiagnosis33TBox = "";
			variables.instance.hcpcCost33TBox = "";
			variables.instance.hcpcLengthOfNeedYear33TBox = "";
			variables.instance.hcpcLengthOfNeedMonth33TBox = "";
			variables.instance.hcpcCode34TBox = "";
			variables.instance.hcpcQty34TBox = "";
			variables.instance.hcpcProduct34TBox = "";
			variables.instance.hcpcDX34TBox = "";
			variables.instance.hcpcDiagnosis34TBox = "";
			variables.instance.hcpcCost34TBox = "";
			variables.instance.hcpcLengthOfNeedYear34TBox = "";
			variables.instance.hcpcLengthOfNeedMonth34TBox = "";
			variables.instance.hcpcCode35TBox = "";
			variables.instance.hcpcQty35TBox = "";
			variables.instance.hcpcProduct35TBox = "";
			variables.instance.hcpcDX35TBox = "";
			variables.instance.hcpcDiagnosis35TBox = "";
			variables.instance.hcpcCost35TBox = "";
			variables.instance.hcpcLengthOfNeedYear35TBox = "";
			variables.instance.hcpcLengthOfNeedMonth35TBox = "";
			variables.instance.hcpcCode36TBox = "";
			variables.instance.hcpcQty36TBox = "";
			variables.instance.hcpcProduct36TBox = "";
			variables.instance.hcpcDX36TBox = "";
			variables.instance.hcpcDiagnosis36TBox = "";
			variables.instance.hcpcCost36TBox = "";
			variables.instance.hcpcLengthOfNeedYear36TBox = "";
			variables.instance.hcpcLengthOfNeedMonth36TBox = "";
			variables.instance.hcpcCode37TBox = "";
			variables.instance.hcpcQty37TBox = "";
			variables.instance.hcpcProduct37TBox = "";
			variables.instance.hcpcDX37TBox = "";
			variables.instance.hcpcDiagnosis37TBox = "";
			variables.instance.hcpcCost37TBox = "";
			variables.instance.hcpcLengthOfNeedYear37TBox = "";
			variables.instance.hcpcLengthOfNeedMonth37TBox = "";
			variables.instance.hcpcCode38TBox = "";
			variables.instance.hcpcQty38TBox = "";
			variables.instance.hcpcProduct38TBox = "";
			variables.instance.hcpcDX38TBox = "";
			variables.instance.hcpcDiagnosis38TBox = "";
			variables.instance.hcpcCost38TBox = "";
			variables.instance.hcpcLengthOfNeedYear38TBox = "";
			variables.instance.hcpcLengthOfNeedMonth38TBox = "";
			variables.instance.hcpcCode39TBox = "";
			variables.instance.hcpcQty39TBox = "";
			variables.instance.hcpcProduct39TBox = "";
			variables.instance.hcpcDX39TBox = "";
			variables.instance.hcpcDiagnosis39TBox = "";
			variables.instance.hcpcCost39TBox = "";
			variables.instance.hcpcLengthOfNeedYear39TBox = "";
			variables.instance.hcpcLengthOfNeedMonth39TBox = "";
			variables.instance.hcpcCode40TBox = "";
			variables.instance.hcpcQty40TBox = "";
			variables.instance.hcpcProduct40TBox = "";
			variables.instance.hcpcDX40TBox = "";
			variables.instance.hcpcDiagnosis40TBox = "";
			variables.instance.hcpcCost40TBox = "";
			variables.instance.hcpcLengthOfNeedYear40TBox = "";
			variables.instance.hcpcLengthOfNeedMonth40TBox = "";
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
	<cfset temp = QueryAddRow(defaultsQuery, 326)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTAKEHCPCID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTAKEID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE4TBOX", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY4TBOX", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT4TBOX", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX4TBOX", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS4TBOX", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST4TBOX", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR4TBOX", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH4TBOX", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE5TBOX", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY5TBOX", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT5TBOX", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX5TBOX", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS5TBOX", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST5TBOX", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR5TBOX", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH5TBOX", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE6TBOX", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY6TBOX", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT6TBOX", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX6TBOX", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS6TBOX", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST6TBOX", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR6TBOX", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH6TBOX", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE7TBOX", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY7TBOX", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT7TBOX", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX7TBOX", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS7TBOX", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST7TBOX", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 32)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR7TBOX", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 33)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH7TBOX", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 34)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE8TBOX", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 35)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY8TBOX", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 36)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT8TBOX", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 37)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX8TBOX", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 38)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS8TBOX", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 39)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST8TBOX", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 40)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR8TBOX", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 41)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH8TBOX", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 42)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE9TBOX", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 43)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY9TBOX", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 44)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT9TBOX", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 45)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX9TBOX", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 46)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS9TBOX", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 47)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST9TBOX", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 48)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR9TBOX", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 49)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH9TBOX", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 50)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE10TBOX", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 51)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY10TBOX", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 52)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT10TBOX", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 53)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX10TBOX", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 54)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS10TBOX", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 55)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST10TBOX", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 56)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR10TBOX", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 57)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH10TBOX", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 58)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE11TBOX", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 59)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY11TBOX", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 60)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT11TBOX", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 61)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX11TBOX", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 62)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS11TBOX", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 63)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST11TBOX", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 64)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR11TBOX", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 65)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH11TBOX", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 66)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE12TBOX", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 67)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY12TBOX", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 68)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT12TBOX", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 69)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX12TBOX", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 70)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS12TBOX", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 71)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST12TBOX", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 72)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR12TBOX", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 73)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH12TBOX", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 74)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE13TBOX", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 75)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY13TBOX", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 76)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT13TBOX", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 77)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX13TBOX", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 78)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS13TBOX", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 79)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST13TBOX", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 80)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR13TBOX", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 81)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH13TBOX", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 82)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE14TBOX", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 83)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY14TBOX", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 84)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT14TBOX", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 85)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX14TBOX", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 86)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS14TBOX", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 87)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST14TBOX", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 88)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR14TBOX", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 89)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH14TBOX", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 90)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE15TBOX", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 91)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY15TBOX", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 92)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT15TBOX", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 93)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX15TBOX", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 94)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS15TBOX", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 95)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST15TBOX", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 96)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR15TBOX", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 97)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH15TBOX", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 98)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE16TBOX", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 99)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY16TBOX", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 100)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT16TBOX", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 101)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX16TBOX", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 102)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS16TBOX", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 103)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST16TBOX", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 104)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR16TBOX", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 105)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH16TBOX", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 106)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE17TBOX", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 107)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY17TBOX", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 108)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT17TBOX", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 109)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX17TBOX", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 110)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS17TBOX", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 111)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST17TBOX", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 112)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR17TBOX", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 113)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH17TBOX", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 114)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE18TBOX", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 115)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY18TBOX", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 116)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT18TBOX", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 117)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX18TBOX", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 118)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS18TBOX", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 119)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST18TBOX", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 120)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR18TBOX", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 121)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH18TBOX", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 122)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE19TBOX", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 123)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY19TBOX", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 124)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT19TBOX", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 125)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX19TBOX", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 126)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS19TBOX", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 127)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST19TBOX", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 128)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR19TBOX", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 129)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH19TBOX", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 130)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE20TBOX", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 131)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY20TBOX", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 132)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT20TBOX", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 133)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX20TBOX", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 134)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS20TBOX", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 135)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST20TBOX", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 136)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR20TBOX", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 137)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH20TBOX", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 138)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE21TBOX", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 139)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY21TBOX", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 140)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT21TBOX", 141)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 141)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 141)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 141)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX21TBOX", 142)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 142)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 142)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 142)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS21TBOX", 143)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 143)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 143)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 143)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST21TBOX", 144)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 144)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 144)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 144)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR21TBOX", 145)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 145)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 145)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 145)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH21TBOX", 146)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 146)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 146)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 146)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE22TBOX", 147)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 147)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 147)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 147)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY22TBOX", 148)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 148)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 148)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 148)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT22TBOX", 149)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 149)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 149)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 149)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX22TBOX", 150)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 150)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 150)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 150)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS22TBOX", 151)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 151)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 151)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 151)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST22TBOX", 152)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 152)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 152)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 152)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR22TBOX", 153)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 153)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 153)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 153)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH22TBOX", 154)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 154)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 154)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 154)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE23TBOX", 155)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 155)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 155)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 155)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY23TBOX", 156)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 156)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 156)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 156)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT23TBOX", 157)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 157)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 157)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 157)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX23TBOX", 158)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 158)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 158)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 158)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS23TBOX", 159)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 159)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 159)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 159)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST23TBOX", 160)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 160)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 160)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 160)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR23TBOX", 161)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 161)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 161)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 161)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH23TBOX", 162)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 162)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 162)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 162)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE24TBOX", 163)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 163)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 163)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 163)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY24TBOX", 164)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 164)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 164)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 164)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT24TBOX", 165)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 165)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 165)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 165)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX24TBOX", 166)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 166)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 166)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 166)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS24TBOX", 167)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 167)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 167)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 167)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST24TBOX", 168)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 168)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 168)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 168)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR24TBOX", 169)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 169)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 169)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 169)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH24TBOX", 170)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 170)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 170)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 170)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE25TBOX", 171)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 171)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 171)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 171)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY25TBOX", 172)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 172)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 172)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 172)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT25TBOX", 173)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 173)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 173)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 173)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX25TBOX", 174)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 174)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 174)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 174)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS25TBOX", 175)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 175)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 175)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 175)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST25TBOX", 176)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 176)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 176)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 176)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR25TBOX", 177)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 177)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 177)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 177)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH25TBOX", 178)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 178)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 178)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 178)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE26TBOX", 179)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 179)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 179)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 179)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY26TBOX", 180)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 180)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 180)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 180)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT26TBOX", 181)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 181)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 181)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 181)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX26TBOX", 182)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 182)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 182)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 182)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS26TBOX", 183)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 183)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 183)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 183)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST26TBOX", 184)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 184)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 184)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 184)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR26TBOX", 185)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 185)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 185)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 185)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH26TBOX", 186)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 186)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 186)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 186)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE27TBOX", 187)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 187)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 187)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 187)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY27TBOX", 188)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 188)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 188)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 188)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT27TBOX", 189)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 189)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 189)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 189)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX27TBOX", 190)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 190)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 190)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 190)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS27TBOX", 191)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 191)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 191)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 191)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST27TBOX", 192)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 192)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 192)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 192)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR27TBOX", 193)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 193)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 193)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 193)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH27TBOX", 194)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 194)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 194)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 194)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE28TBOX", 195)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 195)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 195)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 195)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY28TBOX", 196)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 196)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 196)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 196)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT28TBOX", 197)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 197)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 197)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 197)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX28TBOX", 198)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 198)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 198)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 198)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS28TBOX", 199)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 199)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 199)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 199)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST28TBOX", 200)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 200)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 200)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 200)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR28TBOX", 201)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 201)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 201)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 201)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH28TBOX", 202)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 202)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 202)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 202)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE29TBOX", 203)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 203)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 203)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 203)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY29TBOX", 204)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 204)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 204)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 204)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT29TBOX", 205)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 205)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 205)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 205)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX29TBOX", 206)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 206)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 206)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 206)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS29TBOX", 207)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 207)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 207)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 207)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST29TBOX", 208)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 208)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 208)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 208)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR29TBOX", 209)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 209)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 209)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 209)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH29TBOX", 210)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 210)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 210)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 210)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE30TBOX", 211)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 211)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 211)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 211)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY30TBOX", 212)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 212)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 212)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 212)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT30TBOX", 213)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 213)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 213)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 213)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX30TBOX", 214)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 214)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 214)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 214)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS30TBOX", 215)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 215)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 215)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 215)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST30TBOX", 216)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 216)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 216)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 216)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR30TBOX", 217)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 217)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 217)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 217)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH30TBOX", 218)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 218)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 218)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 218)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE31TBOX", 219)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 219)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 219)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 219)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY31TBOX", 220)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 220)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 220)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 220)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT31TBOX", 221)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 221)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 221)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 221)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX31TBOX", 222)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 222)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 222)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 222)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS31TBOX", 223)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 223)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 223)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 223)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST31TBOX", 224)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 224)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 224)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 224)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR31TBOX", 225)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 225)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 225)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 225)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH31TBOX", 226)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 226)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 226)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 226)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE32TBOX", 227)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 227)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 227)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 227)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY32TBOX", 228)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 228)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 228)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 228)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT32TBOX", 229)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 229)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 229)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 229)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX32TBOX", 230)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 230)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 230)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 230)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS32TBOX", 231)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 231)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 231)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 231)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST32TBOX", 232)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 232)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 232)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 232)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR32TBOX", 233)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 233)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 233)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 233)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH32TBOX", 234)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 234)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 234)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 234)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE33TBOX", 235)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 235)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 235)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 235)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY33TBOX", 236)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 236)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 236)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 236)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT33TBOX", 237)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 237)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 237)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 237)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX33TBOX", 238)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 238)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 238)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 238)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS33TBOX", 239)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 239)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 239)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 239)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST33TBOX", 240)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 240)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 240)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 240)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR33TBOX", 241)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 241)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 241)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 241)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH33TBOX", 242)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 242)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 242)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 242)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE34TBOX", 243)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 243)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 243)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 243)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY34TBOX", 244)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 244)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 244)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 244)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT34TBOX", 245)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 245)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 245)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 245)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX34TBOX", 246)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 246)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 246)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 246)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS34TBOX", 247)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 247)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 247)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 247)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST34TBOX", 248)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 248)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 248)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 248)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR34TBOX", 249)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 249)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 249)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 249)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH34TBOX", 250)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 250)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 250)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 250)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE35TBOX", 251)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 251)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 251)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 251)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY35TBOX", 252)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 252)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 252)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 252)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT35TBOX", 253)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 253)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 253)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 253)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX35TBOX", 254)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 254)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 254)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 254)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS35TBOX", 255)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 255)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 255)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 255)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST35TBOX", 256)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 256)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 256)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 256)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR35TBOX", 257)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 257)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 257)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 257)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH35TBOX", 258)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 258)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 258)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 258)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE36TBOX", 259)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 259)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 259)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 259)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY36TBOX", 260)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 260)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 260)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 260)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT36TBOX", 261)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 261)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 261)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 261)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX36TBOX", 262)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 262)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 262)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 262)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS36TBOX", 263)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 263)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 263)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 263)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST36TBOX", 264)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 264)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 264)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 264)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR36TBOX", 265)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 265)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 265)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 265)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH36TBOX", 266)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 266)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 266)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 266)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE37TBOX", 267)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 267)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 267)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 267)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY37TBOX", 268)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 268)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 268)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 268)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT37TBOX", 269)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 269)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 269)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 269)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX37TBOX", 270)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 270)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 270)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 270)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS37TBOX", 271)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 271)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 271)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 271)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST37TBOX", 272)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 272)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 272)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 272)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR37TBOX", 273)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 273)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 273)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 273)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH37TBOX", 274)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 274)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 274)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 274)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE38TBOX", 275)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 275)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 275)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 275)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY38TBOX", 276)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 276)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 276)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 276)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT38TBOX", 277)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 277)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 277)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 277)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX38TBOX", 278)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 278)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 278)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 278)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS38TBOX", 279)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 279)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 279)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 279)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST38TBOX", 280)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 280)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 280)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 280)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR38TBOX", 281)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 281)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 281)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 281)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH38TBOX", 282)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 282)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 282)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 282)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE39TBOX", 283)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 283)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 283)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 283)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY39TBOX", 284)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 284)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 284)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 284)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT39TBOX", 285)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 285)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 285)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 285)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX39TBOX", 286)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 286)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 286)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 286)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS39TBOX", 287)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 287)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 287)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 287)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST39TBOX", 288)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 288)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 288)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 288)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR39TBOX", 289)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 289)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 289)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 289)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH39TBOX", 290)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 290)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 290)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 290)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE40TBOX", 291)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 291)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 291)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 291)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY40TBOX", 292)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 292)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 292)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 292)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT40TBOX", 293)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 293)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 293)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 293)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX40TBOX", 294)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 294)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 294)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 294)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS40TBOX", 295)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 295)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 295)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 295)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST40TBOX", 296)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 296)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 296)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 296)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR40TBOX", 297)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 297)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 297)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 297)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH40TBOX", 298)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 298)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 298)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 298)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 299)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 299)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 299)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 299)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 300)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 300)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 300)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 300)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 301)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 301)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 301)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 301)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 302)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 302)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 302)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 302)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE1TBOX", 303)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 303)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 303)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 303)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY1TBOX", 304)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 304)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 304)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 304)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT1TBOX", 305)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 305)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 305)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 305)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX1TBOX", 306)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 306)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 306)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 306)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS1TBOX", 307)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 307)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 307)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 307)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST1TBOX", 308)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 308)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 308)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 308)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR1TBOX", 309)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 309)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 309)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 309)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH1TBOX", 310)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 310)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 310)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 310)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE2TBOX", 311)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 311)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 311)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 311)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY2TBOX", 312)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 312)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 312)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 312)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT2TBOX", 313)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 313)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 313)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 313)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX2TBOX", 314)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 314)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 314)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 314)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS2TBOX", 315)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 315)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 315)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 315)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST2TBOX", 316)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 316)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 316)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 316)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR2TBOX", 317)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 317)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 317)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 317)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH2TBOX", 318)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 318)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 318)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 318)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE3TBOX", 319)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 319)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 319)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 319)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY3TBOX", 320)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 320)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 320)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 320)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT3TBOX", 321)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 321)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 321)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 321)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX3TBOX", 322)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 322)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 322)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 322)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS3TBOX", 323)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 323)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 323)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 323)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCOST3TBOX", 324)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 324)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 324)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 324)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR3TBOX", 325)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 325)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 325)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 325)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH3TBOX", 326)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 326)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 326)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 326)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for IntakeHCPCID.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeHCPCID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IntakeHCPCID>
	</cffunction>
	 
	<cffunction name="setIntakeHCPCID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="IntakeHCPCID" required="Yes" type="String">
		
		<cfif IntakeHCPCID NEQ "NULL">	
			
			<cfif arguments.IntakeHCPCID EQ "@@" OR arguments.IntakeHCPCID EQ "">
				
				<cfset arguments.IntakeHCPCID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(IntakeHCPCID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>IntakeHCPCID</strong> (#IntakeHCPCID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.IntakeHCPCID = arguments.IntakeHCPCID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for IntakeID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IntakeID>
	</cffunction>
	 
	<cffunction name="setIntakeID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="IntakeID" required="Yes" type="String">
		
		<cfif IntakeID NEQ "NULL">	
			
			<cfif arguments.IntakeID EQ "@@" OR arguments.IntakeID EQ "">
				
				<cfset arguments.IntakeID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(IntakeID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>IntakeID</strong> (#IntakeID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.IntakeID = arguments.IntakeID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "IntakeID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode1TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode1TBox" required="Yes" type="String">
		
		<cfif HcpcCode1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode1TBox EQ "@@" OR arguments.hcpcCode1TBox EQ "">
				
				<cfset arguments.hcpcCode1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode1TBox</strong> (#HcpcCode1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode1TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode1TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode1TBox = arguments.HcpcCode1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty1TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty1TBox" required="Yes" type="String">
		
		<cfif HcpcQty1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty1TBox EQ "@@" OR arguments.hcpcQty1TBox EQ "">
				
				<cfset arguments.hcpcQty1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty1TBox</strong> (#HcpcQty1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty1TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty1TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty1TBox = arguments.HcpcQty1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct1TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct1TBox" required="Yes" type="String">
		
		<cfif HcpcProduct1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct1TBox EQ "@@" OR arguments.hcpcProduct1TBox EQ "">
				
				<cfset arguments.hcpcProduct1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct1TBox</strong> (#HcpcProduct1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct1TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct1TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct1TBox = arguments.HcpcProduct1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX1TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX1TBox" required="Yes" type="String">
		
		<cfif HcpcDX1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX1TBox EQ "@@" OR arguments.hcpcDX1TBox EQ "">
				
				<cfset arguments.hcpcDX1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX1TBox</strong> (#HcpcDX1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX1TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX1TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX1TBox = arguments.HcpcDX1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis1TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis1TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis1TBox EQ "@@" OR arguments.hcpcDiagnosis1TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis1TBox</strong> (#HcpcDiagnosis1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis1TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis1TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis1TBox = arguments.HcpcDiagnosis1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost1TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost1TBox" required="Yes" type="String">
		
		<cfif HcpcCost1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost1TBox EQ "@@" OR arguments.hcpcCost1TBox EQ "">
				
				<cfset arguments.hcpcCost1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost1TBox</strong> (#HcpcCost1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost1TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost1TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost1TBox = arguments.HcpcCost1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear1TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear1TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear1TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear1TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear1TBox</strong> (#HcpcLengthOfNeedYear1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear1TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear1TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear1TBox = arguments.HcpcLengthOfNeedYear1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth1TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth1TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth1TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth1TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth1TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth1TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth1TBox</strong> (#HcpcLengthOfNeedMonth1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth1TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth1TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth1TBox = arguments.HcpcLengthOfNeedMonth1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode2TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode2TBox" required="Yes" type="String">
		
		<cfif HcpcCode2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode2TBox EQ "@@" OR arguments.hcpcCode2TBox EQ "">
				
				<cfset arguments.hcpcCode2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode2TBox</strong> (#HcpcCode2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode2TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode2TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode2TBox = arguments.HcpcCode2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty2TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty2TBox" required="Yes" type="String">
		
		<cfif HcpcQty2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty2TBox EQ "@@" OR arguments.hcpcQty2TBox EQ "">
				
				<cfset arguments.hcpcQty2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty2TBox</strong> (#HcpcQty2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty2TBox = arguments.HcpcQty2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct2TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct2TBox" required="Yes" type="String">
		
		<cfif HcpcProduct2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct2TBox EQ "@@" OR arguments.hcpcProduct2TBox EQ "">
				
				<cfset arguments.hcpcProduct2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct2TBox</strong> (#HcpcProduct2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct2TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct2TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct2TBox = arguments.HcpcProduct2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX2TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX2TBox" required="Yes" type="String">
		
		<cfif HcpcDX2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX2TBox EQ "@@" OR arguments.hcpcDX2TBox EQ "">
				
				<cfset arguments.hcpcDX2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX2TBox</strong> (#HcpcDX2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX2TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX2TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX2TBox = arguments.HcpcDX2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis2TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis2TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis2TBox EQ "@@" OR arguments.hcpcDiagnosis2TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis2TBox</strong> (#HcpcDiagnosis2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis2TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis2TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis2TBox = arguments.HcpcDiagnosis2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost2TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost2TBox" required="Yes" type="String">
		
		<cfif HcpcCost2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost2TBox EQ "@@" OR arguments.hcpcCost2TBox EQ "">
				
				<cfset arguments.hcpcCost2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost2TBox</strong> (#HcpcCost2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost2TBox = arguments.HcpcCost2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear2TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear2TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear2TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear2TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear2TBox</strong> (#HcpcLengthOfNeedYear2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear2TBox = arguments.HcpcLengthOfNeedYear2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth2TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth2TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth2TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth2TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth2TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth2TBox</strong> (#HcpcLengthOfNeedMonth2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth2TBox = arguments.HcpcLengthOfNeedMonth2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode3TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode3TBox" required="Yes" type="String">
		
		<cfif HcpcCode3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode3TBox EQ "@@" OR arguments.hcpcCode3TBox EQ "">
				
				<cfset arguments.hcpcCode3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode3TBox</strong> (#HcpcCode3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode3TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode3TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode3TBox = arguments.HcpcCode3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty3TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty3TBox" required="Yes" type="String">
		
		<cfif HcpcQty3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty3TBox EQ "@@" OR arguments.hcpcQty3TBox EQ "">
				
				<cfset arguments.hcpcQty3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty3TBox</strong> (#HcpcQty3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty3TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty3TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty3TBox = arguments.HcpcQty3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct3TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct3TBox" required="Yes" type="String">
		
		<cfif HcpcProduct3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct3TBox EQ "@@" OR arguments.hcpcProduct3TBox EQ "">
				
				<cfset arguments.hcpcProduct3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct3TBox</strong> (#HcpcProduct3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct3TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct3TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct3TBox = arguments.HcpcProduct3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX3TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX3TBox" required="Yes" type="String">
		
		<cfif HcpcDX3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX3TBox EQ "@@" OR arguments.hcpcDX3TBox EQ "">
				
				<cfset arguments.hcpcDX3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX3TBox</strong> (#HcpcDX3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX3TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX3TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX3TBox = arguments.HcpcDX3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis3TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis3TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis3TBox EQ "@@" OR arguments.hcpcDiagnosis3TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis3TBox</strong> (#HcpcDiagnosis3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis3TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis3TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis3TBox = arguments.HcpcDiagnosis3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost3TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost3TBox" required="Yes" type="String">
		
		<cfif HcpcCost3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost3TBox EQ "@@" OR arguments.hcpcCost3TBox EQ "">
				
				<cfset arguments.hcpcCost3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost3TBox</strong> (#HcpcCost3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost3TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost3TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost3TBox = arguments.HcpcCost3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear3TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear3TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear3TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear3TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear3TBox</strong> (#HcpcLengthOfNeedYear3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear3TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear3TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear3TBox = arguments.HcpcLengthOfNeedYear3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth3TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth3TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth3TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth3TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth3TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth3TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth3TBox</strong> (#HcpcLengthOfNeedMonth3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth3TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth3TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth3TBox = arguments.HcpcLengthOfNeedMonth3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode4TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode4TBox" required="Yes" type="String">
		
		<cfif HcpcCode4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode4TBox EQ "@@" OR arguments.hcpcCode4TBox EQ "">
				
				<cfset arguments.hcpcCode4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode4TBox</strong> (#HcpcCode4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode4TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode4TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode4TBox = arguments.HcpcCode4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty4TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty4TBox" required="Yes" type="String">
		
		<cfif HcpcQty4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty4TBox EQ "@@" OR arguments.hcpcQty4TBox EQ "">
				
				<cfset arguments.hcpcQty4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty4TBox</strong> (#HcpcQty4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty4TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty4TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty4TBox = arguments.HcpcQty4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct4TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct4TBox" required="Yes" type="String">
		
		<cfif HcpcProduct4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct4TBox EQ "@@" OR arguments.hcpcProduct4TBox EQ "">
				
				<cfset arguments.hcpcProduct4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct4TBox</strong> (#HcpcProduct4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct4TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct4TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct4TBox = arguments.HcpcProduct4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX4TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX4TBox" required="Yes" type="String">
		
		<cfif HcpcDX4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX4TBox EQ "@@" OR arguments.hcpcDX4TBox EQ "">
				
				<cfset arguments.hcpcDX4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX4TBox</strong> (#HcpcDX4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX4TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX4TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX4TBox = arguments.HcpcDX4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis4TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis4TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis4TBox EQ "@@" OR arguments.hcpcDiagnosis4TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis4TBox</strong> (#HcpcDiagnosis4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis4TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis4TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis4TBox = arguments.HcpcDiagnosis4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost4TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost4TBox" required="Yes" type="String">
		
		<cfif HcpcCost4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost4TBox EQ "@@" OR arguments.hcpcCost4TBox EQ "">
				
				<cfset arguments.hcpcCost4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost4TBox</strong> (#HcpcCost4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost4TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost4TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost4TBox = arguments.HcpcCost4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear4TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear4TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear4TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear4TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear4TBox</strong> (#HcpcLengthOfNeedYear4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear4TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear4TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear4TBox = arguments.HcpcLengthOfNeedYear4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth4TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth4TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth4TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth4TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth4TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth4TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth4TBox</strong> (#HcpcLengthOfNeedMonth4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth4TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth4TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth4TBox = arguments.HcpcLengthOfNeedMonth4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode5TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode5TBox" required="Yes" type="String">
		
		<cfif HcpcCode5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode5TBox EQ "@@" OR arguments.hcpcCode5TBox EQ "">
				
				<cfset arguments.hcpcCode5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode5TBox</strong> (#HcpcCode5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode5TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode5TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode5TBox = arguments.HcpcCode5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty5TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty5TBox" required="Yes" type="String">
		
		<cfif HcpcQty5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty5TBox EQ "@@" OR arguments.hcpcQty5TBox EQ "">
				
				<cfset arguments.hcpcQty5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty5TBox</strong> (#HcpcQty5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty5TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty5TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty5TBox = arguments.HcpcQty5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct5TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct5TBox" required="Yes" type="String">
		
		<cfif HcpcProduct5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct5TBox EQ "@@" OR arguments.hcpcProduct5TBox EQ "">
				
				<cfset arguments.hcpcProduct5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct5TBox</strong> (#HcpcProduct5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct5TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct5TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct5TBox = arguments.HcpcProduct5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX5TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX5TBox" required="Yes" type="String">
		
		<cfif HcpcDX5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX5TBox EQ "@@" OR arguments.hcpcDX5TBox EQ "">
				
				<cfset arguments.hcpcDX5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX5TBox</strong> (#HcpcDX5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX5TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX5TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX5TBox = arguments.HcpcDX5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis5TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis5TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis5TBox EQ "@@" OR arguments.hcpcDiagnosis5TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis5TBox</strong> (#HcpcDiagnosis5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis5TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis5TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis5TBox = arguments.HcpcDiagnosis5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost5TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost5TBox" required="Yes" type="String">
		
		<cfif HcpcCost5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost5TBox EQ "@@" OR arguments.hcpcCost5TBox EQ "">
				
				<cfset arguments.hcpcCost5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost5TBox</strong> (#HcpcCost5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost5TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost5TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost5TBox = arguments.HcpcCost5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear5TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear5TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear5TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear5TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear5TBox</strong> (#HcpcLengthOfNeedYear5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear5TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear5TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear5TBox = arguments.HcpcLengthOfNeedYear5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth5TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth5TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth5TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth5TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth5TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth5TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth5TBox</strong> (#HcpcLengthOfNeedMonth5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth5TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth5TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth5TBox = arguments.HcpcLengthOfNeedMonth5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode6TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode6TBox" required="Yes" type="String">
		
		<cfif HcpcCode6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode6TBox EQ "@@" OR arguments.hcpcCode6TBox EQ "">
				
				<cfset arguments.hcpcCode6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode6TBox</strong> (#HcpcCode6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode6TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode6TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode6TBox = arguments.HcpcCode6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty6TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty6TBox" required="Yes" type="String">
		
		<cfif HcpcQty6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty6TBox EQ "@@" OR arguments.hcpcQty6TBox EQ "">
				
				<cfset arguments.hcpcQty6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty6TBox</strong> (#HcpcQty6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty6TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty6TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty6TBox = arguments.HcpcQty6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct6TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct6TBox" required="Yes" type="String">
		
		<cfif HcpcProduct6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct6TBox EQ "@@" OR arguments.hcpcProduct6TBox EQ "">
				
				<cfset arguments.hcpcProduct6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct6TBox</strong> (#HcpcProduct6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct6TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct6TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct6TBox = arguments.HcpcProduct6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX6TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX6TBox" required="Yes" type="String">
		
		<cfif HcpcDX6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX6TBox EQ "@@" OR arguments.hcpcDX6TBox EQ "">
				
				<cfset arguments.hcpcDX6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX6TBox</strong> (#HcpcDX6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX6TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX6TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX6TBox = arguments.HcpcDX6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis6TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis6TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis6TBox EQ "@@" OR arguments.hcpcDiagnosis6TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis6TBox</strong> (#HcpcDiagnosis6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis6TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis6TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis6TBox = arguments.HcpcDiagnosis6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost6TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost6TBox" required="Yes" type="String">
		
		<cfif HcpcCost6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost6TBox EQ "@@" OR arguments.hcpcCost6TBox EQ "">
				
				<cfset arguments.hcpcCost6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost6TBox</strong> (#HcpcCost6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost6TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost6TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost6TBox = arguments.HcpcCost6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear6TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear6TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear6TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear6TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear6TBox</strong> (#HcpcLengthOfNeedYear6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear6TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear6TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear6TBox = arguments.HcpcLengthOfNeedYear6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth6TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth6TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth6TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth6TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth6TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth6TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth6TBox</strong> (#HcpcLengthOfNeedMonth6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth6TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth6TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth6TBox = arguments.HcpcLengthOfNeedMonth6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode7TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode7TBox" required="Yes" type="String">
		
		<cfif HcpcCode7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode7TBox EQ "@@" OR arguments.hcpcCode7TBox EQ "">
				
				<cfset arguments.hcpcCode7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode7TBox</strong> (#HcpcCode7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode7TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode7TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode7TBox = arguments.HcpcCode7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty7TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty7TBox" required="Yes" type="String">
		
		<cfif HcpcQty7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty7TBox EQ "@@" OR arguments.hcpcQty7TBox EQ "">
				
				<cfset arguments.hcpcQty7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty7TBox</strong> (#HcpcQty7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty7TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty7TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty7TBox = arguments.HcpcQty7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct7TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct7TBox" required="Yes" type="String">
		
		<cfif HcpcProduct7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct7TBox EQ "@@" OR arguments.hcpcProduct7TBox EQ "">
				
				<cfset arguments.hcpcProduct7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct7TBox</strong> (#HcpcProduct7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct7TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct7TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct7TBox = arguments.HcpcProduct7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX7TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX7TBox" required="Yes" type="String">
		
		<cfif HcpcDX7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX7TBox EQ "@@" OR arguments.hcpcDX7TBox EQ "">
				
				<cfset arguments.hcpcDX7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX7TBox</strong> (#HcpcDX7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX7TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX7TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX7TBox = arguments.HcpcDX7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis7TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis7TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis7TBox EQ "@@" OR arguments.hcpcDiagnosis7TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis7TBox</strong> (#HcpcDiagnosis7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis7TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis7TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis7TBox = arguments.HcpcDiagnosis7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost7TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost7TBox" required="Yes" type="String">
		
		<cfif HcpcCost7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost7TBox EQ "@@" OR arguments.hcpcCost7TBox EQ "">
				
				<cfset arguments.hcpcCost7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost7TBox</strong> (#HcpcCost7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost7TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost7TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost7TBox = arguments.HcpcCost7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear7TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear7TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear7TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear7TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear7TBox</strong> (#HcpcLengthOfNeedYear7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear7TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear7TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear7TBox = arguments.HcpcLengthOfNeedYear7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth7TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth7TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth7TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth7TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth7TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth7TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth7TBox</strong> (#HcpcLengthOfNeedMonth7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth7TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth7TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth7TBox = arguments.HcpcLengthOfNeedMonth7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode8TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode8TBox" required="Yes" type="String">
		
		<cfif HcpcCode8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode8TBox EQ "@@" OR arguments.hcpcCode8TBox EQ "">
				
				<cfset arguments.hcpcCode8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode8TBox</strong> (#HcpcCode8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode8TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode8TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode8TBox = arguments.HcpcCode8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty8TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty8TBox" required="Yes" type="String">
		
		<cfif HcpcQty8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty8TBox EQ "@@" OR arguments.hcpcQty8TBox EQ "">
				
				<cfset arguments.hcpcQty8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty8TBox</strong> (#HcpcQty8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty8TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty8TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty8TBox = arguments.HcpcQty8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct8TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct8TBox" required="Yes" type="String">
		
		<cfif HcpcProduct8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct8TBox EQ "@@" OR arguments.hcpcProduct8TBox EQ "">
				
				<cfset arguments.hcpcProduct8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct8TBox</strong> (#HcpcProduct8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct8TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct8TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct8TBox = arguments.HcpcProduct8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX8TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX8TBox" required="Yes" type="String">
		
		<cfif HcpcDX8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX8TBox EQ "@@" OR arguments.hcpcDX8TBox EQ "">
				
				<cfset arguments.hcpcDX8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX8TBox</strong> (#HcpcDX8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX8TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX8TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX8TBox = arguments.HcpcDX8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis8TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis8TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis8TBox EQ "@@" OR arguments.hcpcDiagnosis8TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis8TBox</strong> (#HcpcDiagnosis8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis8TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis8TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis8TBox = arguments.HcpcDiagnosis8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost8TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost8TBox" required="Yes" type="String">
		
		<cfif HcpcCost8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost8TBox EQ "@@" OR arguments.hcpcCost8TBox EQ "">
				
				<cfset arguments.hcpcCost8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost8TBox</strong> (#HcpcCost8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost8TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost8TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost8TBox = arguments.HcpcCost8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear8TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear8TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear8TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear8TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear8TBox</strong> (#HcpcLengthOfNeedYear8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear8TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear8TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear8TBox = arguments.HcpcLengthOfNeedYear8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth8TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth8TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth8TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth8TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth8TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth8TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth8TBox</strong> (#HcpcLengthOfNeedMonth8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth8TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth8TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth8TBox = arguments.HcpcLengthOfNeedMonth8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode9TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode9TBox" required="Yes" type="String">
		
		<cfif HcpcCode9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode9TBox EQ "@@" OR arguments.hcpcCode9TBox EQ "">
				
				<cfset arguments.hcpcCode9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode9TBox</strong> (#HcpcCode9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode9TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode9TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode9TBox = arguments.HcpcCode9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty9TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty9TBox" required="Yes" type="String">
		
		<cfif HcpcQty9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty9TBox EQ "@@" OR arguments.hcpcQty9TBox EQ "">
				
				<cfset arguments.hcpcQty9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty9TBox</strong> (#HcpcQty9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty9TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty9TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty9TBox = arguments.HcpcQty9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct9TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct9TBox" required="Yes" type="String">
		
		<cfif HcpcProduct9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct9TBox EQ "@@" OR arguments.hcpcProduct9TBox EQ "">
				
				<cfset arguments.hcpcProduct9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct9TBox</strong> (#HcpcProduct9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct9TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct9TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct9TBox = arguments.HcpcProduct9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX9TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX9TBox" required="Yes" type="String">
		
		<cfif HcpcDX9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX9TBox EQ "@@" OR arguments.hcpcDX9TBox EQ "">
				
				<cfset arguments.hcpcDX9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX9TBox</strong> (#HcpcDX9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX9TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX9TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX9TBox = arguments.HcpcDX9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis9TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis9TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis9TBox EQ "@@" OR arguments.hcpcDiagnosis9TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis9TBox</strong> (#HcpcDiagnosis9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis9TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis9TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis9TBox = arguments.HcpcDiagnosis9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost9TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost9TBox" required="Yes" type="String">
		
		<cfif HcpcCost9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost9TBox EQ "@@" OR arguments.hcpcCost9TBox EQ "">
				
				<cfset arguments.hcpcCost9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost9TBox</strong> (#HcpcCost9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost9TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost9TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost9TBox = arguments.HcpcCost9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear9TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear9TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear9TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear9TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear9TBox</strong> (#HcpcLengthOfNeedYear9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear9TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear9TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear9TBox = arguments.HcpcLengthOfNeedYear9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth9TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth9TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth9TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth9TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth9TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth9TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth9TBox</strong> (#HcpcLengthOfNeedMonth9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth9TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth9TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth9TBox = arguments.HcpcLengthOfNeedMonth9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode10TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode10TBox" required="Yes" type="String">
		
		<cfif HcpcCode10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode10TBox EQ "@@" OR arguments.hcpcCode10TBox EQ "">
				
				<cfset arguments.hcpcCode10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode10TBox</strong> (#HcpcCode10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode10TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode10TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode10TBox = arguments.HcpcCode10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty10TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty10TBox" required="Yes" type="String">
		
		<cfif HcpcQty10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty10TBox EQ "@@" OR arguments.hcpcQty10TBox EQ "">
				
				<cfset arguments.hcpcQty10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty10TBox</strong> (#HcpcQty10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty10TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty10TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty10TBox = arguments.HcpcQty10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct10TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct10TBox" required="Yes" type="String">
		
		<cfif HcpcProduct10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct10TBox EQ "@@" OR arguments.hcpcProduct10TBox EQ "">
				
				<cfset arguments.hcpcProduct10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct10TBox</strong> (#HcpcProduct10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct10TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct10TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct10TBox = arguments.HcpcProduct10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX10TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX10TBox" required="Yes" type="String">
		
		<cfif HcpcDX10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX10TBox EQ "@@" OR arguments.hcpcDX10TBox EQ "">
				
				<cfset arguments.hcpcDX10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX10TBox</strong> (#HcpcDX10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX10TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX10TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX10TBox = arguments.HcpcDX10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis10TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis10TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis10TBox EQ "@@" OR arguments.hcpcDiagnosis10TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis10TBox</strong> (#HcpcDiagnosis10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis10TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis10TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis10TBox = arguments.HcpcDiagnosis10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost10TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost10TBox" required="Yes" type="String">
		
		<cfif HcpcCost10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost10TBox EQ "@@" OR arguments.hcpcCost10TBox EQ "">
				
				<cfset arguments.hcpcCost10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost10TBox</strong> (#HcpcCost10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost10TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost10TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost10TBox = arguments.HcpcCost10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear10TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear10TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear10TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear10TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear10TBox</strong> (#HcpcLengthOfNeedYear10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear10TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear10TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear10TBox = arguments.HcpcLengthOfNeedYear10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth10TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth10TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth10TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth10TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth10TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth10TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth10TBox</strong> (#HcpcLengthOfNeedMonth10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth10TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth10TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth10TBox = arguments.HcpcLengthOfNeedMonth10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode11TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode11TBox" required="Yes" type="String">
		
		<cfif HcpcCode11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode11TBox EQ "@@" OR arguments.hcpcCode11TBox EQ "">
				
				<cfset arguments.hcpcCode11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode11TBox</strong> (#HcpcCode11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode11TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode11TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode11TBox = arguments.HcpcCode11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty11TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty11TBox" required="Yes" type="String">
		
		<cfif HcpcQty11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty11TBox EQ "@@" OR arguments.hcpcQty11TBox EQ "">
				
				<cfset arguments.hcpcQty11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty11TBox</strong> (#HcpcQty11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty11TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty11TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty11TBox = arguments.HcpcQty11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct11TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct11TBox" required="Yes" type="String">
		
		<cfif HcpcProduct11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct11TBox EQ "@@" OR arguments.hcpcProduct11TBox EQ "">
				
				<cfset arguments.hcpcProduct11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct11TBox</strong> (#HcpcProduct11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct11TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct11TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct11TBox = arguments.HcpcProduct11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX11TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX11TBox" required="Yes" type="String">
		
		<cfif HcpcDX11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX11TBox EQ "@@" OR arguments.hcpcDX11TBox EQ "">
				
				<cfset arguments.hcpcDX11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX11TBox</strong> (#HcpcDX11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX11TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX11TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX11TBox = arguments.HcpcDX11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis11TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis11TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis11TBox EQ "@@" OR arguments.hcpcDiagnosis11TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis11TBox</strong> (#HcpcDiagnosis11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis11TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis11TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis11TBox = arguments.HcpcDiagnosis11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost11TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost11TBox" required="Yes" type="String">
		
		<cfif HcpcCost11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost11TBox EQ "@@" OR arguments.hcpcCost11TBox EQ "">
				
				<cfset arguments.hcpcCost11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost11TBox</strong> (#HcpcCost11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost11TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost11TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost11TBox = arguments.HcpcCost11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear11TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear11TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear11TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear11TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear11TBox</strong> (#HcpcLengthOfNeedYear11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear11TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear11TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear11TBox = arguments.HcpcLengthOfNeedYear11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth11TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth11TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth11TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth11TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth11TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth11TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth11TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth11TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth11TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth11TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth11TBox</strong> (#HcpcLengthOfNeedMonth11TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth11TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth11TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth11TBox = arguments.HcpcLengthOfNeedMonth11TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth11TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode12TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode12TBox" required="Yes" type="String">
		
		<cfif HcpcCode12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode12TBox EQ "@@" OR arguments.hcpcCode12TBox EQ "">
				
				<cfset arguments.hcpcCode12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode12TBox</strong> (#HcpcCode12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode12TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode12TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode12TBox = arguments.HcpcCode12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty12TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty12TBox" required="Yes" type="String">
		
		<cfif HcpcQty12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty12TBox EQ "@@" OR arguments.hcpcQty12TBox EQ "">
				
				<cfset arguments.hcpcQty12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty12TBox</strong> (#HcpcQty12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty12TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty12TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty12TBox = arguments.HcpcQty12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct12TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct12TBox" required="Yes" type="String">
		
		<cfif HcpcProduct12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct12TBox EQ "@@" OR arguments.hcpcProduct12TBox EQ "">
				
				<cfset arguments.hcpcProduct12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct12TBox</strong> (#HcpcProduct12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct12TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct12TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct12TBox = arguments.HcpcProduct12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX12TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX12TBox" required="Yes" type="String">
		
		<cfif HcpcDX12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX12TBox EQ "@@" OR arguments.hcpcDX12TBox EQ "">
				
				<cfset arguments.hcpcDX12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX12TBox</strong> (#HcpcDX12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX12TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX12TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX12TBox = arguments.HcpcDX12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis12TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis12TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis12TBox EQ "@@" OR arguments.hcpcDiagnosis12TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis12TBox</strong> (#HcpcDiagnosis12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis12TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis12TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis12TBox = arguments.HcpcDiagnosis12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost12TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost12TBox" required="Yes" type="String">
		
		<cfif HcpcCost12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost12TBox EQ "@@" OR arguments.hcpcCost12TBox EQ "">
				
				<cfset arguments.hcpcCost12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost12TBox</strong> (#HcpcCost12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost12TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost12TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost12TBox = arguments.HcpcCost12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear12TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear12TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear12TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear12TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear12TBox</strong> (#HcpcLengthOfNeedYear12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear12TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear12TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear12TBox = arguments.HcpcLengthOfNeedYear12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth12TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth12TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth12TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth12TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth12TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth12TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth12TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth12TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth12TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth12TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth12TBox</strong> (#HcpcLengthOfNeedMonth12TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth12TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth12TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth12TBox = arguments.HcpcLengthOfNeedMonth12TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth12TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode13TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode13TBox" required="Yes" type="String">
		
		<cfif HcpcCode13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode13TBox EQ "@@" OR arguments.hcpcCode13TBox EQ "">
				
				<cfset arguments.hcpcCode13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode13TBox</strong> (#HcpcCode13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode13TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode13TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode13TBox = arguments.HcpcCode13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty13TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty13TBox" required="Yes" type="String">
		
		<cfif HcpcQty13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty13TBox EQ "@@" OR arguments.hcpcQty13TBox EQ "">
				
				<cfset arguments.hcpcQty13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty13TBox</strong> (#HcpcQty13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty13TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty13TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty13TBox = arguments.HcpcQty13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct13TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct13TBox" required="Yes" type="String">
		
		<cfif HcpcProduct13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct13TBox EQ "@@" OR arguments.hcpcProduct13TBox EQ "">
				
				<cfset arguments.hcpcProduct13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct13TBox</strong> (#HcpcProduct13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct13TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct13TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct13TBox = arguments.HcpcProduct13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX13TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX13TBox" required="Yes" type="String">
		
		<cfif HcpcDX13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX13TBox EQ "@@" OR arguments.hcpcDX13TBox EQ "">
				
				<cfset arguments.hcpcDX13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX13TBox</strong> (#HcpcDX13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX13TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX13TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX13TBox = arguments.HcpcDX13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis13TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis13TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis13TBox EQ "@@" OR arguments.hcpcDiagnosis13TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis13TBox</strong> (#HcpcDiagnosis13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis13TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis13TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis13TBox = arguments.HcpcDiagnosis13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost13TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost13TBox" required="Yes" type="String">
		
		<cfif HcpcCost13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost13TBox EQ "@@" OR arguments.hcpcCost13TBox EQ "">
				
				<cfset arguments.hcpcCost13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost13TBox</strong> (#HcpcCost13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost13TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost13TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost13TBox = arguments.HcpcCost13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear13TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear13TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear13TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear13TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear13TBox</strong> (#HcpcLengthOfNeedYear13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear13TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear13TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear13TBox = arguments.HcpcLengthOfNeedYear13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth13TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth13TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth13TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth13TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth13TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth13TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth13TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth13TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth13TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth13TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth13TBox</strong> (#HcpcLengthOfNeedMonth13TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth13TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth13TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth13TBox = arguments.HcpcLengthOfNeedMonth13TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth13TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode14TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode14TBox" required="Yes" type="String">
		
		<cfif HcpcCode14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode14TBox EQ "@@" OR arguments.hcpcCode14TBox EQ "">
				
				<cfset arguments.hcpcCode14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode14TBox</strong> (#HcpcCode14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode14TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode14TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode14TBox = arguments.HcpcCode14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty14TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty14TBox" required="Yes" type="String">
		
		<cfif HcpcQty14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty14TBox EQ "@@" OR arguments.hcpcQty14TBox EQ "">
				
				<cfset arguments.hcpcQty14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty14TBox</strong> (#HcpcQty14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty14TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty14TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty14TBox = arguments.HcpcQty14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct14TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct14TBox" required="Yes" type="String">
		
		<cfif HcpcProduct14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct14TBox EQ "@@" OR arguments.hcpcProduct14TBox EQ "">
				
				<cfset arguments.hcpcProduct14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct14TBox</strong> (#HcpcProduct14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct14TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct14TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct14TBox = arguments.HcpcProduct14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX14TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX14TBox" required="Yes" type="String">
		
		<cfif HcpcDX14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX14TBox EQ "@@" OR arguments.hcpcDX14TBox EQ "">
				
				<cfset arguments.hcpcDX14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX14TBox</strong> (#HcpcDX14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX14TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX14TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX14TBox = arguments.HcpcDX14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis14TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis14TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis14TBox EQ "@@" OR arguments.hcpcDiagnosis14TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis14TBox</strong> (#HcpcDiagnosis14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis14TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis14TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis14TBox = arguments.HcpcDiagnosis14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost14TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost14TBox" required="Yes" type="String">
		
		<cfif HcpcCost14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost14TBox EQ "@@" OR arguments.hcpcCost14TBox EQ "">
				
				<cfset arguments.hcpcCost14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost14TBox</strong> (#HcpcCost14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost14TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost14TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost14TBox = arguments.HcpcCost14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear14TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear14TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear14TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear14TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear14TBox</strong> (#HcpcLengthOfNeedYear14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear14TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear14TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear14TBox = arguments.HcpcLengthOfNeedYear14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth14TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth14TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth14TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth14TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth14TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth14TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth14TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth14TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth14TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth14TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth14TBox</strong> (#HcpcLengthOfNeedMonth14TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth14TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth14TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth14TBox = arguments.HcpcLengthOfNeedMonth14TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth14TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode15TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode15TBox" required="Yes" type="String">
		
		<cfif HcpcCode15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode15TBox EQ "@@" OR arguments.hcpcCode15TBox EQ "">
				
				<cfset arguments.hcpcCode15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode15TBox</strong> (#HcpcCode15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode15TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode15TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode15TBox = arguments.HcpcCode15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty15TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty15TBox" required="Yes" type="String">
		
		<cfif HcpcQty15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty15TBox EQ "@@" OR arguments.hcpcQty15TBox EQ "">
				
				<cfset arguments.hcpcQty15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty15TBox</strong> (#HcpcQty15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty15TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty15TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty15TBox = arguments.HcpcQty15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct15TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct15TBox" required="Yes" type="String">
		
		<cfif HcpcProduct15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct15TBox EQ "@@" OR arguments.hcpcProduct15TBox EQ "">
				
				<cfset arguments.hcpcProduct15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct15TBox</strong> (#HcpcProduct15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct15TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct15TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct15TBox = arguments.HcpcProduct15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX15TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX15TBox" required="Yes" type="String">
		
		<cfif HcpcDX15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX15TBox EQ "@@" OR arguments.hcpcDX15TBox EQ "">
				
				<cfset arguments.hcpcDX15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX15TBox</strong> (#HcpcDX15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX15TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX15TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX15TBox = arguments.HcpcDX15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis15TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis15TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis15TBox EQ "@@" OR arguments.hcpcDiagnosis15TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis15TBox</strong> (#HcpcDiagnosis15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis15TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis15TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis15TBox = arguments.HcpcDiagnosis15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost15TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost15TBox" required="Yes" type="String">
		
		<cfif HcpcCost15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost15TBox EQ "@@" OR arguments.hcpcCost15TBox EQ "">
				
				<cfset arguments.hcpcCost15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost15TBox</strong> (#HcpcCost15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost15TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost15TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost15TBox = arguments.HcpcCost15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear15TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear15TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear15TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear15TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear15TBox</strong> (#HcpcLengthOfNeedYear15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear15TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear15TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear15TBox = arguments.HcpcLengthOfNeedYear15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth15TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth15TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth15TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth15TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth15TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth15TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth15TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth15TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth15TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth15TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth15TBox</strong> (#HcpcLengthOfNeedMonth15TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth15TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth15TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth15TBox = arguments.HcpcLengthOfNeedMonth15TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth15TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode16TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode16TBox" required="Yes" type="String">
		
		<cfif HcpcCode16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode16TBox EQ "@@" OR arguments.hcpcCode16TBox EQ "">
				
				<cfset arguments.hcpcCode16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode16TBox</strong> (#HcpcCode16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode16TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode16TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode16TBox = arguments.HcpcCode16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty16TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty16TBox" required="Yes" type="String">
		
		<cfif HcpcQty16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty16TBox EQ "@@" OR arguments.hcpcQty16TBox EQ "">
				
				<cfset arguments.hcpcQty16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty16TBox</strong> (#HcpcQty16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty16TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty16TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty16TBox = arguments.HcpcQty16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct16TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct16TBox" required="Yes" type="String">
		
		<cfif HcpcProduct16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct16TBox EQ "@@" OR arguments.hcpcProduct16TBox EQ "">
				
				<cfset arguments.hcpcProduct16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct16TBox</strong> (#HcpcProduct16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct16TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct16TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct16TBox = arguments.HcpcProduct16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX16TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX16TBox" required="Yes" type="String">
		
		<cfif HcpcDX16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX16TBox EQ "@@" OR arguments.hcpcDX16TBox EQ "">
				
				<cfset arguments.hcpcDX16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX16TBox</strong> (#HcpcDX16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX16TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX16TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX16TBox = arguments.HcpcDX16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis16TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis16TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis16TBox EQ "@@" OR arguments.hcpcDiagnosis16TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis16TBox</strong> (#HcpcDiagnosis16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis16TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis16TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis16TBox = arguments.HcpcDiagnosis16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost16TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost16TBox" required="Yes" type="String">
		
		<cfif HcpcCost16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost16TBox EQ "@@" OR arguments.hcpcCost16TBox EQ "">
				
				<cfset arguments.hcpcCost16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost16TBox</strong> (#HcpcCost16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost16TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost16TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost16TBox = arguments.HcpcCost16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear16TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear16TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear16TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear16TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear16TBox</strong> (#HcpcLengthOfNeedYear16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear16TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear16TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear16TBox = arguments.HcpcLengthOfNeedYear16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth16TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth16TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth16TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth16TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth16TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth16TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth16TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth16TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth16TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth16TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth16TBox</strong> (#HcpcLengthOfNeedMonth16TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth16TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth16TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth16TBox = arguments.HcpcLengthOfNeedMonth16TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth16TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode17TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode17TBox" required="Yes" type="String">
		
		<cfif HcpcCode17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode17TBox EQ "@@" OR arguments.hcpcCode17TBox EQ "">
				
				<cfset arguments.hcpcCode17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode17TBox</strong> (#HcpcCode17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode17TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode17TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode17TBox = arguments.HcpcCode17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty17TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty17TBox" required="Yes" type="String">
		
		<cfif HcpcQty17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty17TBox EQ "@@" OR arguments.hcpcQty17TBox EQ "">
				
				<cfset arguments.hcpcQty17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty17TBox</strong> (#HcpcQty17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty17TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty17TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty17TBox = arguments.HcpcQty17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct17TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct17TBox" required="Yes" type="String">
		
		<cfif HcpcProduct17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct17TBox EQ "@@" OR arguments.hcpcProduct17TBox EQ "">
				
				<cfset arguments.hcpcProduct17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct17TBox</strong> (#HcpcProduct17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct17TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct17TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct17TBox = arguments.HcpcProduct17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX17TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX17TBox" required="Yes" type="String">
		
		<cfif HcpcDX17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX17TBox EQ "@@" OR arguments.hcpcDX17TBox EQ "">
				
				<cfset arguments.hcpcDX17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX17TBox</strong> (#HcpcDX17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX17TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX17TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX17TBox = arguments.HcpcDX17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis17TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis17TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis17TBox EQ "@@" OR arguments.hcpcDiagnosis17TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis17TBox</strong> (#HcpcDiagnosis17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis17TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis17TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis17TBox = arguments.HcpcDiagnosis17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost17TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost17TBox" required="Yes" type="String">
		
		<cfif HcpcCost17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost17TBox EQ "@@" OR arguments.hcpcCost17TBox EQ "">
				
				<cfset arguments.hcpcCost17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost17TBox</strong> (#HcpcCost17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost17TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost17TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost17TBox = arguments.HcpcCost17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear17TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear17TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear17TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear17TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear17TBox</strong> (#HcpcLengthOfNeedYear17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear17TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear17TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear17TBox = arguments.HcpcLengthOfNeedYear17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth17TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth17TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth17TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth17TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth17TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth17TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth17TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth17TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth17TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth17TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth17TBox</strong> (#HcpcLengthOfNeedMonth17TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth17TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth17TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth17TBox = arguments.HcpcLengthOfNeedMonth17TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth17TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode18TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode18TBox" required="Yes" type="String">
		
		<cfif HcpcCode18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode18TBox EQ "@@" OR arguments.hcpcCode18TBox EQ "">
				
				<cfset arguments.hcpcCode18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode18TBox</strong> (#HcpcCode18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode18TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode18TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode18TBox = arguments.HcpcCode18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty18TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty18TBox" required="Yes" type="String">
		
		<cfif HcpcQty18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty18TBox EQ "@@" OR arguments.hcpcQty18TBox EQ "">
				
				<cfset arguments.hcpcQty18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty18TBox</strong> (#HcpcQty18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty18TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty18TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty18TBox = arguments.HcpcQty18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct18TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct18TBox" required="Yes" type="String">
		
		<cfif HcpcProduct18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct18TBox EQ "@@" OR arguments.hcpcProduct18TBox EQ "">
				
				<cfset arguments.hcpcProduct18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct18TBox</strong> (#HcpcProduct18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct18TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct18TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct18TBox = arguments.HcpcProduct18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX18TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX18TBox" required="Yes" type="String">
		
		<cfif HcpcDX18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX18TBox EQ "@@" OR arguments.hcpcDX18TBox EQ "">
				
				<cfset arguments.hcpcDX18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX18TBox</strong> (#HcpcDX18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX18TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX18TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX18TBox = arguments.HcpcDX18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis18TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis18TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis18TBox EQ "@@" OR arguments.hcpcDiagnosis18TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis18TBox</strong> (#HcpcDiagnosis18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis18TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis18TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis18TBox = arguments.HcpcDiagnosis18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost18TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost18TBox" required="Yes" type="String">
		
		<cfif HcpcCost18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost18TBox EQ "@@" OR arguments.hcpcCost18TBox EQ "">
				
				<cfset arguments.hcpcCost18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost18TBox</strong> (#HcpcCost18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost18TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost18TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost18TBox = arguments.HcpcCost18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear18TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear18TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear18TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear18TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear18TBox</strong> (#HcpcLengthOfNeedYear18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear18TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear18TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear18TBox = arguments.HcpcLengthOfNeedYear18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth18TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth18TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth18TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth18TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth18TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth18TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth18TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth18TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth18TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth18TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth18TBox</strong> (#HcpcLengthOfNeedMonth18TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth18TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth18TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth18TBox = arguments.HcpcLengthOfNeedMonth18TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth18TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode19TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode19TBox" required="Yes" type="String">
		
		<cfif HcpcCode19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode19TBox EQ "@@" OR arguments.hcpcCode19TBox EQ "">
				
				<cfset arguments.hcpcCode19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode19TBox</strong> (#HcpcCode19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode19TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode19TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode19TBox = arguments.HcpcCode19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty19TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty19TBox" required="Yes" type="String">
		
		<cfif HcpcQty19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty19TBox EQ "@@" OR arguments.hcpcQty19TBox EQ "">
				
				<cfset arguments.hcpcQty19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty19TBox</strong> (#HcpcQty19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty19TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty19TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty19TBox = arguments.HcpcQty19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct19TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct19TBox" required="Yes" type="String">
		
		<cfif HcpcProduct19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct19TBox EQ "@@" OR arguments.hcpcProduct19TBox EQ "">
				
				<cfset arguments.hcpcProduct19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct19TBox</strong> (#HcpcProduct19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct19TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct19TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct19TBox = arguments.HcpcProduct19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX19TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX19TBox" required="Yes" type="String">
		
		<cfif HcpcDX19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX19TBox EQ "@@" OR arguments.hcpcDX19TBox EQ "">
				
				<cfset arguments.hcpcDX19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX19TBox</strong> (#HcpcDX19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX19TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX19TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX19TBox = arguments.HcpcDX19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis19TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis19TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis19TBox EQ "@@" OR arguments.hcpcDiagnosis19TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis19TBox</strong> (#HcpcDiagnosis19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis19TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis19TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis19TBox = arguments.HcpcDiagnosis19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost19TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost19TBox" required="Yes" type="String">
		
		<cfif HcpcCost19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost19TBox EQ "@@" OR arguments.hcpcCost19TBox EQ "">
				
				<cfset arguments.hcpcCost19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost19TBox</strong> (#HcpcCost19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost19TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost19TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost19TBox = arguments.HcpcCost19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear19TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear19TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear19TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear19TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear19TBox</strong> (#HcpcLengthOfNeedYear19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear19TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear19TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear19TBox = arguments.HcpcLengthOfNeedYear19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth19TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth19TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth19TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth19TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth19TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth19TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth19TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth19TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth19TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth19TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth19TBox</strong> (#HcpcLengthOfNeedMonth19TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth19TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth19TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth19TBox = arguments.HcpcLengthOfNeedMonth19TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth19TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode20TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode20TBox" required="Yes" type="String">
		
		<cfif HcpcCode20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode20TBox EQ "@@" OR arguments.hcpcCode20TBox EQ "">
				
				<cfset arguments.hcpcCode20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode20TBox</strong> (#HcpcCode20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode20TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode20TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode20TBox = arguments.HcpcCode20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty20TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty20TBox" required="Yes" type="String">
		
		<cfif HcpcQty20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty20TBox EQ "@@" OR arguments.hcpcQty20TBox EQ "">
				
				<cfset arguments.hcpcQty20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty20TBox</strong> (#HcpcQty20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty20TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty20TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty20TBox = arguments.HcpcQty20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct20TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct20TBox" required="Yes" type="String">
		
		<cfif HcpcProduct20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct20TBox EQ "@@" OR arguments.hcpcProduct20TBox EQ "">
				
				<cfset arguments.hcpcProduct20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct20TBox</strong> (#HcpcProduct20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct20TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct20TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct20TBox = arguments.HcpcProduct20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX20TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX20TBox" required="Yes" type="String">
		
		<cfif HcpcDX20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX20TBox EQ "@@" OR arguments.hcpcDX20TBox EQ "">
				
				<cfset arguments.hcpcDX20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX20TBox</strong> (#HcpcDX20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX20TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX20TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX20TBox = arguments.HcpcDX20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis20TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis20TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis20TBox EQ "@@" OR arguments.hcpcDiagnosis20TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis20TBox</strong> (#HcpcDiagnosis20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis20TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis20TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis20TBox = arguments.HcpcDiagnosis20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost20TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost20TBox" required="Yes" type="String">
		
		<cfif HcpcCost20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost20TBox EQ "@@" OR arguments.hcpcCost20TBox EQ "">
				
				<cfset arguments.hcpcCost20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost20TBox</strong> (#HcpcCost20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost20TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost20TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost20TBox = arguments.HcpcCost20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear20TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear20TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear20TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear20TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear20TBox</strong> (#HcpcLengthOfNeedYear20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear20TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear20TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear20TBox = arguments.HcpcLengthOfNeedYear20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth20TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth20TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth20TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth20TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth20TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth20TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth20TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth20TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth20TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth20TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth20TBox</strong> (#HcpcLengthOfNeedMonth20TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth20TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth20TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth20TBox = arguments.HcpcLengthOfNeedMonth20TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth20TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode21TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode21TBox" required="Yes" type="String">
		
		<cfif HcpcCode21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode21TBox EQ "@@" OR arguments.hcpcCode21TBox EQ "">
				
				<cfset arguments.hcpcCode21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode21TBox</strong> (#HcpcCode21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode21TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode21TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode21TBox = arguments.HcpcCode21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty21TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty21TBox" required="Yes" type="String">
		
		<cfif HcpcQty21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty21TBox EQ "@@" OR arguments.hcpcQty21TBox EQ "">
				
				<cfset arguments.hcpcQty21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty21TBox</strong> (#HcpcQty21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty21TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty21TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty21TBox = arguments.HcpcQty21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct21TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct21TBox" required="Yes" type="String">
		
		<cfif HcpcProduct21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct21TBox EQ "@@" OR arguments.hcpcProduct21TBox EQ "">
				
				<cfset arguments.hcpcProduct21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct21TBox</strong> (#HcpcProduct21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct21TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct21TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct21TBox = arguments.HcpcProduct21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX21TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX21TBox" required="Yes" type="String">
		
		<cfif HcpcDX21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX21TBox EQ "@@" OR arguments.hcpcDX21TBox EQ "">
				
				<cfset arguments.hcpcDX21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX21TBox</strong> (#HcpcDX21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX21TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX21TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX21TBox = arguments.HcpcDX21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis21TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis21TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis21TBox EQ "@@" OR arguments.hcpcDiagnosis21TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis21TBox</strong> (#HcpcDiagnosis21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis21TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis21TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis21TBox = arguments.HcpcDiagnosis21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost21TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost21TBox" required="Yes" type="String">
		
		<cfif HcpcCost21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost21TBox EQ "@@" OR arguments.hcpcCost21TBox EQ "">
				
				<cfset arguments.hcpcCost21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost21TBox</strong> (#HcpcCost21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost21TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost21TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost21TBox = arguments.HcpcCost21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear21TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear21TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear21TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear21TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear21TBox</strong> (#HcpcLengthOfNeedYear21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear21TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear21TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear21TBox = arguments.HcpcLengthOfNeedYear21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth21TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth21TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth21TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth21TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth21TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth21TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth21TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth21TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth21TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth21TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth21TBox</strong> (#HcpcLengthOfNeedMonth21TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth21TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth21TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth21TBox = arguments.HcpcLengthOfNeedMonth21TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth21TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode22TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode22TBox" required="Yes" type="String">
		
		<cfif HcpcCode22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode22TBox EQ "@@" OR arguments.hcpcCode22TBox EQ "">
				
				<cfset arguments.hcpcCode22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode22TBox</strong> (#HcpcCode22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode22TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode22TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode22TBox = arguments.HcpcCode22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty22TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty22TBox" required="Yes" type="String">
		
		<cfif HcpcQty22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty22TBox EQ "@@" OR arguments.hcpcQty22TBox EQ "">
				
				<cfset arguments.hcpcQty22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty22TBox</strong> (#HcpcQty22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty22TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty22TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty22TBox = arguments.HcpcQty22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct22TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct22TBox" required="Yes" type="String">
		
		<cfif HcpcProduct22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct22TBox EQ "@@" OR arguments.hcpcProduct22TBox EQ "">
				
				<cfset arguments.hcpcProduct22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct22TBox</strong> (#HcpcProduct22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct22TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct22TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct22TBox = arguments.HcpcProduct22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX22TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX22TBox" required="Yes" type="String">
		
		<cfif HcpcDX22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX22TBox EQ "@@" OR arguments.hcpcDX22TBox EQ "">
				
				<cfset arguments.hcpcDX22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX22TBox</strong> (#HcpcDX22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX22TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX22TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX22TBox = arguments.HcpcDX22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis22TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis22TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis22TBox EQ "@@" OR arguments.hcpcDiagnosis22TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis22TBox</strong> (#HcpcDiagnosis22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis22TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis22TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis22TBox = arguments.HcpcDiagnosis22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost22TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost22TBox" required="Yes" type="String">
		
		<cfif HcpcCost22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost22TBox EQ "@@" OR arguments.hcpcCost22TBox EQ "">
				
				<cfset arguments.hcpcCost22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost22TBox</strong> (#HcpcCost22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost22TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost22TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost22TBox = arguments.HcpcCost22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear22TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear22TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear22TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear22TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear22TBox</strong> (#HcpcLengthOfNeedYear22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear22TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear22TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear22TBox = arguments.HcpcLengthOfNeedYear22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth22TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth22TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth22TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth22TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth22TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth22TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth22TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth22TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth22TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth22TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth22TBox</strong> (#HcpcLengthOfNeedMonth22TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth22TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth22TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth22TBox = arguments.HcpcLengthOfNeedMonth22TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth22TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode23TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode23TBox" required="Yes" type="String">
		
		<cfif HcpcCode23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode23TBox EQ "@@" OR arguments.hcpcCode23TBox EQ "">
				
				<cfset arguments.hcpcCode23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode23TBox</strong> (#HcpcCode23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode23TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode23TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode23TBox = arguments.HcpcCode23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty23TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty23TBox" required="Yes" type="String">
		
		<cfif HcpcQty23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty23TBox EQ "@@" OR arguments.hcpcQty23TBox EQ "">
				
				<cfset arguments.hcpcQty23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty23TBox</strong> (#HcpcQty23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty23TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty23TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty23TBox = arguments.HcpcQty23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct23TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct23TBox" required="Yes" type="String">
		
		<cfif HcpcProduct23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct23TBox EQ "@@" OR arguments.hcpcProduct23TBox EQ "">
				
				<cfset arguments.hcpcProduct23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct23TBox</strong> (#HcpcProduct23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct23TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct23TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct23TBox = arguments.HcpcProduct23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX23TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX23TBox" required="Yes" type="String">
		
		<cfif HcpcDX23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX23TBox EQ "@@" OR arguments.hcpcDX23TBox EQ "">
				
				<cfset arguments.hcpcDX23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX23TBox</strong> (#HcpcDX23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX23TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX23TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX23TBox = arguments.HcpcDX23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis23TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis23TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis23TBox EQ "@@" OR arguments.hcpcDiagnosis23TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis23TBox</strong> (#HcpcDiagnosis23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis23TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis23TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis23TBox = arguments.HcpcDiagnosis23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost23TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost23TBox" required="Yes" type="String">
		
		<cfif HcpcCost23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost23TBox EQ "@@" OR arguments.hcpcCost23TBox EQ "">
				
				<cfset arguments.hcpcCost23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost23TBox</strong> (#HcpcCost23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost23TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost23TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost23TBox = arguments.HcpcCost23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear23TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear23TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear23TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear23TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear23TBox</strong> (#HcpcLengthOfNeedYear23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear23TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear23TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear23TBox = arguments.HcpcLengthOfNeedYear23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth23TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth23TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth23TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth23TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth23TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth23TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth23TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth23TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth23TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth23TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth23TBox</strong> (#HcpcLengthOfNeedMonth23TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth23TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth23TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth23TBox = arguments.HcpcLengthOfNeedMonth23TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth23TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode24TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode24TBox" required="Yes" type="String">
		
		<cfif HcpcCode24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode24TBox EQ "@@" OR arguments.hcpcCode24TBox EQ "">
				
				<cfset arguments.hcpcCode24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode24TBox</strong> (#HcpcCode24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode24TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode24TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode24TBox = arguments.HcpcCode24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty24TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty24TBox" required="Yes" type="String">
		
		<cfif HcpcQty24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty24TBox EQ "@@" OR arguments.hcpcQty24TBox EQ "">
				
				<cfset arguments.hcpcQty24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty24TBox</strong> (#HcpcQty24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty24TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty24TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty24TBox = arguments.HcpcQty24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct24TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct24TBox" required="Yes" type="String">
		
		<cfif HcpcProduct24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct24TBox EQ "@@" OR arguments.hcpcProduct24TBox EQ "">
				
				<cfset arguments.hcpcProduct24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct24TBox</strong> (#HcpcProduct24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct24TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct24TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct24TBox = arguments.HcpcProduct24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX24TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX24TBox" required="Yes" type="String">
		
		<cfif HcpcDX24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX24TBox EQ "@@" OR arguments.hcpcDX24TBox EQ "">
				
				<cfset arguments.hcpcDX24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX24TBox</strong> (#HcpcDX24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX24TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX24TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX24TBox = arguments.HcpcDX24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis24TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis24TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis24TBox EQ "@@" OR arguments.hcpcDiagnosis24TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis24TBox</strong> (#HcpcDiagnosis24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis24TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis24TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis24TBox = arguments.HcpcDiagnosis24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost24TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost24TBox" required="Yes" type="String">
		
		<cfif HcpcCost24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost24TBox EQ "@@" OR arguments.hcpcCost24TBox EQ "">
				
				<cfset arguments.hcpcCost24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost24TBox</strong> (#HcpcCost24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost24TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost24TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost24TBox = arguments.HcpcCost24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear24TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear24TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear24TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear24TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear24TBox</strong> (#HcpcLengthOfNeedYear24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear24TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear24TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear24TBox = arguments.HcpcLengthOfNeedYear24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth24TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth24TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth24TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth24TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth24TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth24TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth24TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth24TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth24TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth24TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth24TBox</strong> (#HcpcLengthOfNeedMonth24TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth24TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth24TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth24TBox = arguments.HcpcLengthOfNeedMonth24TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth24TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode25TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode25TBox" required="Yes" type="String">
		
		<cfif HcpcCode25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode25TBox EQ "@@" OR arguments.hcpcCode25TBox EQ "">
				
				<cfset arguments.hcpcCode25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode25TBox</strong> (#HcpcCode25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode25TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode25TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode25TBox = arguments.HcpcCode25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty25TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty25TBox" required="Yes" type="String">
		
		<cfif HcpcQty25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty25TBox EQ "@@" OR arguments.hcpcQty25TBox EQ "">
				
				<cfset arguments.hcpcQty25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty25TBox</strong> (#HcpcQty25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty25TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty25TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty25TBox = arguments.HcpcQty25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct25TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct25TBox" required="Yes" type="String">
		
		<cfif HcpcProduct25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct25TBox EQ "@@" OR arguments.hcpcProduct25TBox EQ "">
				
				<cfset arguments.hcpcProduct25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct25TBox</strong> (#HcpcProduct25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct25TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct25TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct25TBox = arguments.HcpcProduct25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX25TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX25TBox" required="Yes" type="String">
		
		<cfif HcpcDX25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX25TBox EQ "@@" OR arguments.hcpcDX25TBox EQ "">
				
				<cfset arguments.hcpcDX25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX25TBox</strong> (#HcpcDX25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX25TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX25TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX25TBox = arguments.HcpcDX25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis25TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis25TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis25TBox EQ "@@" OR arguments.hcpcDiagnosis25TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis25TBox</strong> (#HcpcDiagnosis25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis25TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis25TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis25TBox = arguments.HcpcDiagnosis25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost25TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost25TBox" required="Yes" type="String">
		
		<cfif HcpcCost25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost25TBox EQ "@@" OR arguments.hcpcCost25TBox EQ "">
				
				<cfset arguments.hcpcCost25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost25TBox</strong> (#HcpcCost25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost25TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost25TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost25TBox = arguments.HcpcCost25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear25TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear25TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear25TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear25TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear25TBox</strong> (#HcpcLengthOfNeedYear25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear25TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear25TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear25TBox = arguments.HcpcLengthOfNeedYear25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth25TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth25TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth25TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth25TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth25TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth25TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth25TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth25TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth25TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth25TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth25TBox</strong> (#HcpcLengthOfNeedMonth25TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth25TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth25TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth25TBox = arguments.HcpcLengthOfNeedMonth25TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth25TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode26TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode26TBox" required="Yes" type="String">
		
		<cfif HcpcCode26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode26TBox EQ "@@" OR arguments.hcpcCode26TBox EQ "">
				
				<cfset arguments.hcpcCode26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode26TBox</strong> (#HcpcCode26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode26TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode26TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode26TBox = arguments.HcpcCode26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty26TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty26TBox" required="Yes" type="String">
		
		<cfif HcpcQty26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty26TBox EQ "@@" OR arguments.hcpcQty26TBox EQ "">
				
				<cfset arguments.hcpcQty26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty26TBox</strong> (#HcpcQty26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty26TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty26TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty26TBox = arguments.HcpcQty26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct26TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct26TBox" required="Yes" type="String">
		
		<cfif HcpcProduct26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct26TBox EQ "@@" OR arguments.hcpcProduct26TBox EQ "">
				
				<cfset arguments.hcpcProduct26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct26TBox</strong> (#HcpcProduct26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct26TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct26TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct26TBox = arguments.HcpcProduct26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX26TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX26TBox" required="Yes" type="String">
		
		<cfif HcpcDX26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX26TBox EQ "@@" OR arguments.hcpcDX26TBox EQ "">
				
				<cfset arguments.hcpcDX26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX26TBox</strong> (#HcpcDX26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX26TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX26TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX26TBox = arguments.HcpcDX26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis26TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis26TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis26TBox EQ "@@" OR arguments.hcpcDiagnosis26TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis26TBox</strong> (#HcpcDiagnosis26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis26TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis26TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis26TBox = arguments.HcpcDiagnosis26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost26TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost26TBox" required="Yes" type="String">
		
		<cfif HcpcCost26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost26TBox EQ "@@" OR arguments.hcpcCost26TBox EQ "">
				
				<cfset arguments.hcpcCost26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost26TBox</strong> (#HcpcCost26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost26TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost26TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost26TBox = arguments.HcpcCost26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear26TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear26TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear26TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear26TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear26TBox</strong> (#HcpcLengthOfNeedYear26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear26TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear26TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear26TBox = arguments.HcpcLengthOfNeedYear26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth26TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth26TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth26TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth26TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth26TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth26TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth26TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth26TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth26TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth26TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth26TBox</strong> (#HcpcLengthOfNeedMonth26TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth26TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth26TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth26TBox = arguments.HcpcLengthOfNeedMonth26TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth26TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode27TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode27TBox" required="Yes" type="String">
		
		<cfif HcpcCode27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode27TBox EQ "@@" OR arguments.hcpcCode27TBox EQ "">
				
				<cfset arguments.hcpcCode27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode27TBox</strong> (#HcpcCode27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode27TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode27TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode27TBox = arguments.HcpcCode27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty27TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty27TBox" required="Yes" type="String">
		
		<cfif HcpcQty27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty27TBox EQ "@@" OR arguments.hcpcQty27TBox EQ "">
				
				<cfset arguments.hcpcQty27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty27TBox</strong> (#HcpcQty27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty27TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty27TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty27TBox = arguments.HcpcQty27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct27TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct27TBox" required="Yes" type="String">
		
		<cfif HcpcProduct27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct27TBox EQ "@@" OR arguments.hcpcProduct27TBox EQ "">
				
				<cfset arguments.hcpcProduct27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct27TBox</strong> (#HcpcProduct27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct27TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct27TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct27TBox = arguments.HcpcProduct27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX27TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX27TBox" required="Yes" type="String">
		
		<cfif HcpcDX27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX27TBox EQ "@@" OR arguments.hcpcDX27TBox EQ "">
				
				<cfset arguments.hcpcDX27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX27TBox</strong> (#HcpcDX27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX27TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX27TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX27TBox = arguments.HcpcDX27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis27TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis27TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis27TBox EQ "@@" OR arguments.hcpcDiagnosis27TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis27TBox</strong> (#HcpcDiagnosis27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis27TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis27TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis27TBox = arguments.HcpcDiagnosis27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost27TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost27TBox" required="Yes" type="String">
		
		<cfif HcpcCost27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost27TBox EQ "@@" OR arguments.hcpcCost27TBox EQ "">
				
				<cfset arguments.hcpcCost27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost27TBox</strong> (#HcpcCost27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost27TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost27TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost27TBox = arguments.HcpcCost27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear27TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear27TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear27TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear27TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear27TBox</strong> (#HcpcLengthOfNeedYear27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear27TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear27TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear27TBox = arguments.HcpcLengthOfNeedYear27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth27TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth27TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth27TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth27TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth27TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth27TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth27TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth27TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth27TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth27TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth27TBox</strong> (#HcpcLengthOfNeedMonth27TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth27TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth27TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth27TBox = arguments.HcpcLengthOfNeedMonth27TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth27TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode28TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode28TBox" required="Yes" type="String">
		
		<cfif HcpcCode28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode28TBox EQ "@@" OR arguments.hcpcCode28TBox EQ "">
				
				<cfset arguments.hcpcCode28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode28TBox</strong> (#HcpcCode28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode28TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode28TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode28TBox = arguments.HcpcCode28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty28TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty28TBox" required="Yes" type="String">
		
		<cfif HcpcQty28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty28TBox EQ "@@" OR arguments.hcpcQty28TBox EQ "">
				
				<cfset arguments.hcpcQty28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty28TBox</strong> (#HcpcQty28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty28TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty28TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty28TBox = arguments.HcpcQty28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct28TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct28TBox" required="Yes" type="String">
		
		<cfif HcpcProduct28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct28TBox EQ "@@" OR arguments.hcpcProduct28TBox EQ "">
				
				<cfset arguments.hcpcProduct28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct28TBox</strong> (#HcpcProduct28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct28TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct28TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct28TBox = arguments.HcpcProduct28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX28TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX28TBox" required="Yes" type="String">
		
		<cfif HcpcDX28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX28TBox EQ "@@" OR arguments.hcpcDX28TBox EQ "">
				
				<cfset arguments.hcpcDX28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX28TBox</strong> (#HcpcDX28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX28TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX28TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX28TBox = arguments.HcpcDX28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis28TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis28TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis28TBox EQ "@@" OR arguments.hcpcDiagnosis28TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis28TBox</strong> (#HcpcDiagnosis28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis28TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis28TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis28TBox = arguments.HcpcDiagnosis28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost28TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost28TBox" required="Yes" type="String">
		
		<cfif HcpcCost28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost28TBox EQ "@@" OR arguments.hcpcCost28TBox EQ "">
				
				<cfset arguments.hcpcCost28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost28TBox</strong> (#HcpcCost28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost28TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost28TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost28TBox = arguments.HcpcCost28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear28TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear28TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear28TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear28TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear28TBox</strong> (#HcpcLengthOfNeedYear28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear28TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear28TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear28TBox = arguments.HcpcLengthOfNeedYear28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth28TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth28TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth28TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth28TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth28TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth28TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth28TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth28TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth28TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth28TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth28TBox</strong> (#HcpcLengthOfNeedMonth28TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth28TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth28TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth28TBox = arguments.HcpcLengthOfNeedMonth28TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth28TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode29TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode29TBox" required="Yes" type="String">
		
		<cfif HcpcCode29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode29TBox EQ "@@" OR arguments.hcpcCode29TBox EQ "">
				
				<cfset arguments.hcpcCode29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode29TBox</strong> (#HcpcCode29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode29TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode29TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode29TBox = arguments.HcpcCode29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty29TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty29TBox" required="Yes" type="String">
		
		<cfif HcpcQty29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty29TBox EQ "@@" OR arguments.hcpcQty29TBox EQ "">
				
				<cfset arguments.hcpcQty29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty29TBox</strong> (#HcpcQty29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty29TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty29TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty29TBox = arguments.HcpcQty29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct29TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct29TBox" required="Yes" type="String">
		
		<cfif HcpcProduct29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct29TBox EQ "@@" OR arguments.hcpcProduct29TBox EQ "">
				
				<cfset arguments.hcpcProduct29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct29TBox</strong> (#HcpcProduct29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct29TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct29TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct29TBox = arguments.HcpcProduct29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX29TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX29TBox" required="Yes" type="String">
		
		<cfif HcpcDX29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX29TBox EQ "@@" OR arguments.hcpcDX29TBox EQ "">
				
				<cfset arguments.hcpcDX29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX29TBox</strong> (#HcpcDX29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX29TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX29TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX29TBox = arguments.HcpcDX29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis29TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis29TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis29TBox EQ "@@" OR arguments.hcpcDiagnosis29TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis29TBox</strong> (#HcpcDiagnosis29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis29TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis29TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis29TBox = arguments.HcpcDiagnosis29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost29TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost29TBox" required="Yes" type="String">
		
		<cfif HcpcCost29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost29TBox EQ "@@" OR arguments.hcpcCost29TBox EQ "">
				
				<cfset arguments.hcpcCost29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost29TBox</strong> (#HcpcCost29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost29TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost29TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost29TBox = arguments.HcpcCost29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear29TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear29TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear29TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear29TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear29TBox</strong> (#HcpcLengthOfNeedYear29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear29TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear29TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear29TBox = arguments.HcpcLengthOfNeedYear29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth29TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth29TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth29TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth29TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth29TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth29TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth29TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth29TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth29TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth29TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth29TBox</strong> (#HcpcLengthOfNeedMonth29TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth29TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth29TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth29TBox = arguments.HcpcLengthOfNeedMonth29TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth29TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode30TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode30TBox" required="Yes" type="String">
		
		<cfif HcpcCode30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode30TBox EQ "@@" OR arguments.hcpcCode30TBox EQ "">
				
				<cfset arguments.hcpcCode30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode30TBox</strong> (#HcpcCode30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode30TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode30TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode30TBox = arguments.HcpcCode30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty30TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty30TBox" required="Yes" type="String">
		
		<cfif HcpcQty30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty30TBox EQ "@@" OR arguments.hcpcQty30TBox EQ "">
				
				<cfset arguments.hcpcQty30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty30TBox</strong> (#HcpcQty30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty30TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty30TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty30TBox = arguments.HcpcQty30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct30TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct30TBox" required="Yes" type="String">
		
		<cfif HcpcProduct30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct30TBox EQ "@@" OR arguments.hcpcProduct30TBox EQ "">
				
				<cfset arguments.hcpcProduct30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct30TBox</strong> (#HcpcProduct30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct30TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct30TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct30TBox = arguments.HcpcProduct30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX30TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX30TBox" required="Yes" type="String">
		
		<cfif HcpcDX30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX30TBox EQ "@@" OR arguments.hcpcDX30TBox EQ "">
				
				<cfset arguments.hcpcDX30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX30TBox</strong> (#HcpcDX30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX30TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX30TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX30TBox = arguments.HcpcDX30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis30TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis30TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis30TBox EQ "@@" OR arguments.hcpcDiagnosis30TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis30TBox</strong> (#HcpcDiagnosis30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis30TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis30TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis30TBox = arguments.HcpcDiagnosis30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost30TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost30TBox" required="Yes" type="String">
		
		<cfif HcpcCost30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost30TBox EQ "@@" OR arguments.hcpcCost30TBox EQ "">
				
				<cfset arguments.hcpcCost30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost30TBox</strong> (#HcpcCost30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost30TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost30TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost30TBox = arguments.HcpcCost30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear30TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear30TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear30TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear30TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear30TBox</strong> (#HcpcLengthOfNeedYear30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear30TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear30TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear30TBox = arguments.HcpcLengthOfNeedYear30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth30TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth30TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth30TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth30TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth30TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth30TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth30TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth30TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth30TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth30TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth30TBox</strong> (#HcpcLengthOfNeedMonth30TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth30TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth30TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth30TBox = arguments.HcpcLengthOfNeedMonth30TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth30TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode31TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode31TBox" required="Yes" type="String">
		
		<cfif HcpcCode31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode31TBox EQ "@@" OR arguments.hcpcCode31TBox EQ "">
				
				<cfset arguments.hcpcCode31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode31TBox</strong> (#HcpcCode31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode31TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode31TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode31TBox = arguments.HcpcCode31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty31TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty31TBox" required="Yes" type="String">
		
		<cfif HcpcQty31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty31TBox EQ "@@" OR arguments.hcpcQty31TBox EQ "">
				
				<cfset arguments.hcpcQty31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty31TBox</strong> (#HcpcQty31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty31TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty31TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty31TBox = arguments.HcpcQty31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct31TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct31TBox" required="Yes" type="String">
		
		<cfif HcpcProduct31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct31TBox EQ "@@" OR arguments.hcpcProduct31TBox EQ "">
				
				<cfset arguments.hcpcProduct31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct31TBox</strong> (#HcpcProduct31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct31TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct31TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct31TBox = arguments.HcpcProduct31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX31TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX31TBox" required="Yes" type="String">
		
		<cfif HcpcDX31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX31TBox EQ "@@" OR arguments.hcpcDX31TBox EQ "">
				
				<cfset arguments.hcpcDX31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX31TBox</strong> (#HcpcDX31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX31TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX31TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX31TBox = arguments.HcpcDX31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis31TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis31TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis31TBox EQ "@@" OR arguments.hcpcDiagnosis31TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis31TBox</strong> (#HcpcDiagnosis31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis31TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis31TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis31TBox = arguments.HcpcDiagnosis31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost31TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost31TBox" required="Yes" type="String">
		
		<cfif HcpcCost31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost31TBox EQ "@@" OR arguments.hcpcCost31TBox EQ "">
				
				<cfset arguments.hcpcCost31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost31TBox</strong> (#HcpcCost31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost31TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost31TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost31TBox = arguments.HcpcCost31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear31TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear31TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear31TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear31TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear31TBox</strong> (#HcpcLengthOfNeedYear31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear31TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear31TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear31TBox = arguments.HcpcLengthOfNeedYear31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth31TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth31TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth31TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth31TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth31TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth31TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth31TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth31TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth31TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth31TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth31TBox</strong> (#HcpcLengthOfNeedMonth31TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth31TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth31TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth31TBox = arguments.HcpcLengthOfNeedMonth31TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth31TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode32TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode32TBox" required="Yes" type="String">
		
		<cfif HcpcCode32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode32TBox EQ "@@" OR arguments.hcpcCode32TBox EQ "">
				
				<cfset arguments.hcpcCode32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode32TBox</strong> (#HcpcCode32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode32TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode32TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode32TBox = arguments.HcpcCode32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty32TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty32TBox" required="Yes" type="String">
		
		<cfif HcpcQty32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty32TBox EQ "@@" OR arguments.hcpcQty32TBox EQ "">
				
				<cfset arguments.hcpcQty32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty32TBox</strong> (#HcpcQty32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty32TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty32TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty32TBox = arguments.HcpcQty32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct32TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct32TBox" required="Yes" type="String">
		
		<cfif HcpcProduct32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct32TBox EQ "@@" OR arguments.hcpcProduct32TBox EQ "">
				
				<cfset arguments.hcpcProduct32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct32TBox</strong> (#HcpcProduct32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct32TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct32TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct32TBox = arguments.HcpcProduct32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX32TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX32TBox" required="Yes" type="String">
		
		<cfif HcpcDX32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX32TBox EQ "@@" OR arguments.hcpcDX32TBox EQ "">
				
				<cfset arguments.hcpcDX32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX32TBox</strong> (#HcpcDX32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX32TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX32TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX32TBox = arguments.HcpcDX32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis32TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis32TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis32TBox EQ "@@" OR arguments.hcpcDiagnosis32TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis32TBox</strong> (#HcpcDiagnosis32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis32TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis32TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis32TBox = arguments.HcpcDiagnosis32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost32TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost32TBox" required="Yes" type="String">
		
		<cfif HcpcCost32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost32TBox EQ "@@" OR arguments.hcpcCost32TBox EQ "">
				
				<cfset arguments.hcpcCost32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost32TBox</strong> (#HcpcCost32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost32TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost32TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost32TBox = arguments.HcpcCost32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear32TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear32TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear32TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear32TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear32TBox</strong> (#HcpcLengthOfNeedYear32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear32TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear32TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear32TBox = arguments.HcpcLengthOfNeedYear32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth32TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth32TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth32TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth32TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth32TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth32TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth32TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth32TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth32TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth32TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth32TBox</strong> (#HcpcLengthOfNeedMonth32TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth32TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth32TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth32TBox = arguments.HcpcLengthOfNeedMonth32TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth32TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode33TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode33TBox" required="Yes" type="String">
		
		<cfif HcpcCode33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode33TBox EQ "@@" OR arguments.hcpcCode33TBox EQ "">
				
				<cfset arguments.hcpcCode33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode33TBox</strong> (#HcpcCode33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode33TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode33TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode33TBox = arguments.HcpcCode33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty33TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty33TBox" required="Yes" type="String">
		
		<cfif HcpcQty33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty33TBox EQ "@@" OR arguments.hcpcQty33TBox EQ "">
				
				<cfset arguments.hcpcQty33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty33TBox</strong> (#HcpcQty33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty33TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty33TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty33TBox = arguments.HcpcQty33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct33TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct33TBox" required="Yes" type="String">
		
		<cfif HcpcProduct33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct33TBox EQ "@@" OR arguments.hcpcProduct33TBox EQ "">
				
				<cfset arguments.hcpcProduct33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct33TBox</strong> (#HcpcProduct33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct33TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct33TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct33TBox = arguments.HcpcProduct33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX33TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX33TBox" required="Yes" type="String">
		
		<cfif HcpcDX33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX33TBox EQ "@@" OR arguments.hcpcDX33TBox EQ "">
				
				<cfset arguments.hcpcDX33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX33TBox</strong> (#HcpcDX33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX33TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX33TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX33TBox = arguments.HcpcDX33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis33TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis33TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis33TBox EQ "@@" OR arguments.hcpcDiagnosis33TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis33TBox</strong> (#HcpcDiagnosis33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis33TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis33TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis33TBox = arguments.HcpcDiagnosis33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost33TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost33TBox" required="Yes" type="String">
		
		<cfif HcpcCost33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost33TBox EQ "@@" OR arguments.hcpcCost33TBox EQ "">
				
				<cfset arguments.hcpcCost33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost33TBox</strong> (#HcpcCost33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost33TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost33TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost33TBox = arguments.HcpcCost33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear33TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear33TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear33TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear33TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear33TBox</strong> (#HcpcLengthOfNeedYear33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear33TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear33TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear33TBox = arguments.HcpcLengthOfNeedYear33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth33TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth33TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth33TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth33TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth33TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth33TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth33TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth33TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth33TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth33TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth33TBox</strong> (#HcpcLengthOfNeedMonth33TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth33TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth33TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth33TBox = arguments.HcpcLengthOfNeedMonth33TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth33TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode34TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode34TBox" required="Yes" type="String">
		
		<cfif HcpcCode34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode34TBox EQ "@@" OR arguments.hcpcCode34TBox EQ "">
				
				<cfset arguments.hcpcCode34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode34TBox</strong> (#HcpcCode34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode34TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode34TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode34TBox = arguments.HcpcCode34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty34TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty34TBox" required="Yes" type="String">
		
		<cfif HcpcQty34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty34TBox EQ "@@" OR arguments.hcpcQty34TBox EQ "">
				
				<cfset arguments.hcpcQty34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty34TBox</strong> (#HcpcQty34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty34TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty34TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty34TBox = arguments.HcpcQty34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct34TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct34TBox" required="Yes" type="String">
		
		<cfif HcpcProduct34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct34TBox EQ "@@" OR arguments.hcpcProduct34TBox EQ "">
				
				<cfset arguments.hcpcProduct34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct34TBox</strong> (#HcpcProduct34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct34TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct34TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct34TBox = arguments.HcpcProduct34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX34TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX34TBox" required="Yes" type="String">
		
		<cfif HcpcDX34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX34TBox EQ "@@" OR arguments.hcpcDX34TBox EQ "">
				
				<cfset arguments.hcpcDX34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX34TBox</strong> (#HcpcDX34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX34TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX34TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX34TBox = arguments.HcpcDX34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis34TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis34TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis34TBox EQ "@@" OR arguments.hcpcDiagnosis34TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis34TBox</strong> (#HcpcDiagnosis34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis34TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis34TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis34TBox = arguments.HcpcDiagnosis34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost34TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost34TBox" required="Yes" type="String">
		
		<cfif HcpcCost34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost34TBox EQ "@@" OR arguments.hcpcCost34TBox EQ "">
				
				<cfset arguments.hcpcCost34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost34TBox</strong> (#HcpcCost34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost34TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost34TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost34TBox = arguments.HcpcCost34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear34TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear34TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear34TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear34TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear34TBox</strong> (#HcpcLengthOfNeedYear34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear34TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear34TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear34TBox = arguments.HcpcLengthOfNeedYear34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth34TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth34TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth34TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth34TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth34TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth34TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth34TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth34TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth34TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth34TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth34TBox</strong> (#HcpcLengthOfNeedMonth34TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth34TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth34TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth34TBox = arguments.HcpcLengthOfNeedMonth34TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth34TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode35TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode35TBox" required="Yes" type="String">
		
		<cfif HcpcCode35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode35TBox EQ "@@" OR arguments.hcpcCode35TBox EQ "">
				
				<cfset arguments.hcpcCode35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode35TBox</strong> (#HcpcCode35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode35TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode35TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode35TBox = arguments.HcpcCode35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty35TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty35TBox" required="Yes" type="String">
		
		<cfif HcpcQty35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty35TBox EQ "@@" OR arguments.hcpcQty35TBox EQ "">
				
				<cfset arguments.hcpcQty35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty35TBox</strong> (#HcpcQty35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty35TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty35TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty35TBox = arguments.HcpcQty35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct35TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct35TBox" required="Yes" type="String">
		
		<cfif HcpcProduct35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct35TBox EQ "@@" OR arguments.hcpcProduct35TBox EQ "">
				
				<cfset arguments.hcpcProduct35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct35TBox</strong> (#HcpcProduct35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct35TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct35TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct35TBox = arguments.HcpcProduct35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX35TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX35TBox" required="Yes" type="String">
		
		<cfif HcpcDX35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX35TBox EQ "@@" OR arguments.hcpcDX35TBox EQ "">
				
				<cfset arguments.hcpcDX35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX35TBox</strong> (#HcpcDX35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX35TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX35TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX35TBox = arguments.HcpcDX35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis35TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis35TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis35TBox EQ "@@" OR arguments.hcpcDiagnosis35TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis35TBox</strong> (#HcpcDiagnosis35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis35TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis35TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis35TBox = arguments.HcpcDiagnosis35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost35TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost35TBox" required="Yes" type="String">
		
		<cfif HcpcCost35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost35TBox EQ "@@" OR arguments.hcpcCost35TBox EQ "">
				
				<cfset arguments.hcpcCost35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost35TBox</strong> (#HcpcCost35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost35TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost35TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost35TBox = arguments.HcpcCost35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear35TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear35TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear35TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear35TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear35TBox</strong> (#HcpcLengthOfNeedYear35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear35TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear35TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear35TBox = arguments.HcpcLengthOfNeedYear35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth35TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth35TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth35TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth35TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth35TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth35TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth35TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth35TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth35TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth35TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth35TBox</strong> (#HcpcLengthOfNeedMonth35TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth35TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth35TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth35TBox = arguments.HcpcLengthOfNeedMonth35TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth35TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode36TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode36TBox" required="Yes" type="String">
		
		<cfif HcpcCode36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode36TBox EQ "@@" OR arguments.hcpcCode36TBox EQ "">
				
				<cfset arguments.hcpcCode36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode36TBox</strong> (#HcpcCode36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode36TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode36TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode36TBox = arguments.HcpcCode36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty36TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty36TBox" required="Yes" type="String">
		
		<cfif HcpcQty36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty36TBox EQ "@@" OR arguments.hcpcQty36TBox EQ "">
				
				<cfset arguments.hcpcQty36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty36TBox</strong> (#HcpcQty36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty36TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty36TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty36TBox = arguments.HcpcQty36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct36TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct36TBox" required="Yes" type="String">
		
		<cfif HcpcProduct36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct36TBox EQ "@@" OR arguments.hcpcProduct36TBox EQ "">
				
				<cfset arguments.hcpcProduct36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct36TBox</strong> (#HcpcProduct36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct36TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct36TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct36TBox = arguments.HcpcProduct36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX36TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX36TBox" required="Yes" type="String">
		
		<cfif HcpcDX36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX36TBox EQ "@@" OR arguments.hcpcDX36TBox EQ "">
				
				<cfset arguments.hcpcDX36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX36TBox</strong> (#HcpcDX36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX36TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX36TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX36TBox = arguments.HcpcDX36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis36TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis36TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis36TBox EQ "@@" OR arguments.hcpcDiagnosis36TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis36TBox</strong> (#HcpcDiagnosis36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis36TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis36TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis36TBox = arguments.HcpcDiagnosis36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost36TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost36TBox" required="Yes" type="String">
		
		<cfif HcpcCost36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost36TBox EQ "@@" OR arguments.hcpcCost36TBox EQ "">
				
				<cfset arguments.hcpcCost36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost36TBox</strong> (#HcpcCost36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost36TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost36TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost36TBox = arguments.HcpcCost36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear36TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear36TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear36TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear36TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear36TBox</strong> (#HcpcLengthOfNeedYear36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear36TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear36TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear36TBox = arguments.HcpcLengthOfNeedYear36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth36TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth36TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth36TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth36TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth36TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth36TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth36TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth36TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth36TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth36TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth36TBox</strong> (#HcpcLengthOfNeedMonth36TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth36TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth36TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth36TBox = arguments.HcpcLengthOfNeedMonth36TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth36TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode37TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode37TBox" required="Yes" type="String">
		
		<cfif HcpcCode37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode37TBox EQ "@@" OR arguments.hcpcCode37TBox EQ "">
				
				<cfset arguments.hcpcCode37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode37TBox</strong> (#HcpcCode37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode37TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode37TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode37TBox = arguments.HcpcCode37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty37TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty37TBox" required="Yes" type="String">
		
		<cfif HcpcQty37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty37TBox EQ "@@" OR arguments.hcpcQty37TBox EQ "">
				
				<cfset arguments.hcpcQty37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty37TBox</strong> (#HcpcQty37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty37TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty37TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty37TBox = arguments.HcpcQty37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct37TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct37TBox" required="Yes" type="String">
		
		<cfif HcpcProduct37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct37TBox EQ "@@" OR arguments.hcpcProduct37TBox EQ "">
				
				<cfset arguments.hcpcProduct37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct37TBox</strong> (#HcpcProduct37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct37TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct37TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct37TBox = arguments.HcpcProduct37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX37TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX37TBox" required="Yes" type="String">
		
		<cfif HcpcDX37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX37TBox EQ "@@" OR arguments.hcpcDX37TBox EQ "">
				
				<cfset arguments.hcpcDX37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX37TBox</strong> (#HcpcDX37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX37TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX37TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX37TBox = arguments.HcpcDX37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis37TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis37TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis37TBox EQ "@@" OR arguments.hcpcDiagnosis37TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis37TBox</strong> (#HcpcDiagnosis37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis37TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis37TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis37TBox = arguments.HcpcDiagnosis37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost37TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost37TBox" required="Yes" type="String">
		
		<cfif HcpcCost37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost37TBox EQ "@@" OR arguments.hcpcCost37TBox EQ "">
				
				<cfset arguments.hcpcCost37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost37TBox</strong> (#HcpcCost37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost37TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost37TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost37TBox = arguments.HcpcCost37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear37TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear37TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear37TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear37TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear37TBox</strong> (#HcpcLengthOfNeedYear37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear37TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear37TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear37TBox = arguments.HcpcLengthOfNeedYear37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth37TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth37TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth37TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth37TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth37TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth37TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth37TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth37TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth37TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth37TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth37TBox</strong> (#HcpcLengthOfNeedMonth37TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth37TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth37TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth37TBox = arguments.HcpcLengthOfNeedMonth37TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth37TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode38TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode38TBox" required="Yes" type="String">
		
		<cfif HcpcCode38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode38TBox EQ "@@" OR arguments.hcpcCode38TBox EQ "">
				
				<cfset arguments.hcpcCode38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode38TBox</strong> (#HcpcCode38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode38TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode38TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode38TBox = arguments.HcpcCode38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty38TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty38TBox" required="Yes" type="String">
		
		<cfif HcpcQty38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty38TBox EQ "@@" OR arguments.hcpcQty38TBox EQ "">
				
				<cfset arguments.hcpcQty38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty38TBox</strong> (#HcpcQty38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty38TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty38TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty38TBox = arguments.HcpcQty38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct38TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct38TBox" required="Yes" type="String">
		
		<cfif HcpcProduct38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct38TBox EQ "@@" OR arguments.hcpcProduct38TBox EQ "">
				
				<cfset arguments.hcpcProduct38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct38TBox</strong> (#HcpcProduct38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct38TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct38TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct38TBox = arguments.HcpcProduct38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX38TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX38TBox" required="Yes" type="String">
		
		<cfif HcpcDX38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX38TBox EQ "@@" OR arguments.hcpcDX38TBox EQ "">
				
				<cfset arguments.hcpcDX38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX38TBox</strong> (#HcpcDX38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX38TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX38TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX38TBox = arguments.HcpcDX38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis38TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis38TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis38TBox EQ "@@" OR arguments.hcpcDiagnosis38TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis38TBox</strong> (#HcpcDiagnosis38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis38TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis38TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis38TBox = arguments.HcpcDiagnosis38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost38TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost38TBox" required="Yes" type="String">
		
		<cfif HcpcCost38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost38TBox EQ "@@" OR arguments.hcpcCost38TBox EQ "">
				
				<cfset arguments.hcpcCost38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost38TBox</strong> (#HcpcCost38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost38TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost38TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost38TBox = arguments.HcpcCost38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear38TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear38TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear38TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear38TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear38TBox</strong> (#HcpcLengthOfNeedYear38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear38TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear38TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear38TBox = arguments.HcpcLengthOfNeedYear38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth38TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth38TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth38TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth38TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth38TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth38TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth38TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth38TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth38TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth38TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth38TBox</strong> (#HcpcLengthOfNeedMonth38TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth38TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth38TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth38TBox = arguments.HcpcLengthOfNeedMonth38TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth38TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode39TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode39TBox" required="Yes" type="String">
		
		<cfif HcpcCode39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode39TBox EQ "@@" OR arguments.hcpcCode39TBox EQ "">
				
				<cfset arguments.hcpcCode39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode39TBox</strong> (#HcpcCode39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode39TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode39TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode39TBox = arguments.HcpcCode39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty39TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty39TBox" required="Yes" type="String">
		
		<cfif HcpcQty39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty39TBox EQ "@@" OR arguments.hcpcQty39TBox EQ "">
				
				<cfset arguments.hcpcQty39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty39TBox</strong> (#HcpcQty39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty39TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty39TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty39TBox = arguments.HcpcQty39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct39TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct39TBox" required="Yes" type="String">
		
		<cfif HcpcProduct39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct39TBox EQ "@@" OR arguments.hcpcProduct39TBox EQ "">
				
				<cfset arguments.hcpcProduct39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct39TBox</strong> (#HcpcProduct39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct39TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct39TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct39TBox = arguments.HcpcProduct39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX39TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX39TBox" required="Yes" type="String">
		
		<cfif HcpcDX39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX39TBox EQ "@@" OR arguments.hcpcDX39TBox EQ "">
				
				<cfset arguments.hcpcDX39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX39TBox</strong> (#HcpcDX39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX39TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX39TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX39TBox = arguments.HcpcDX39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis39TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis39TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis39TBox EQ "@@" OR arguments.hcpcDiagnosis39TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis39TBox</strong> (#HcpcDiagnosis39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis39TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis39TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis39TBox = arguments.HcpcDiagnosis39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost39TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost39TBox" required="Yes" type="String">
		
		<cfif HcpcCost39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost39TBox EQ "@@" OR arguments.hcpcCost39TBox EQ "">
				
				<cfset arguments.hcpcCost39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost39TBox</strong> (#HcpcCost39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost39TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost39TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost39TBox = arguments.HcpcCost39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear39TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear39TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear39TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear39TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear39TBox</strong> (#HcpcLengthOfNeedYear39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear39TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear39TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear39TBox = arguments.HcpcLengthOfNeedYear39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth39TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth39TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth39TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth39TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth39TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth39TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth39TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth39TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth39TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth39TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth39TBox</strong> (#HcpcLengthOfNeedMonth39TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth39TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth39TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth39TBox = arguments.HcpcLengthOfNeedMonth39TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth39TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode40TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode40TBox" required="Yes" type="String">
		
		<cfif HcpcCode40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCode40TBox EQ "@@" OR arguments.hcpcCode40TBox EQ "">
				
				<cfset arguments.hcpcCode40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCode40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode40TBox</strong> (#HcpcCode40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode40TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode40TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCode40TBox = arguments.HcpcCode40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode40TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty40TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty40TBox" required="Yes" type="String">
		
		<cfif HcpcQty40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcQty40TBox EQ "@@" OR arguments.hcpcQty40TBox EQ "">
				
				<cfset arguments.hcpcQty40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcQty40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty40TBox</strong> (#HcpcQty40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty40TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty40TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcQty40TBox = arguments.HcpcQty40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty40TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct40TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct40TBox" required="Yes" type="String">
		
		<cfif HcpcProduct40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcProduct40TBox EQ "@@" OR arguments.hcpcProduct40TBox EQ "">
				
				<cfset arguments.hcpcProduct40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcProduct40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct40TBox</strong> (#HcpcProduct40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct40TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct40TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct40TBox = arguments.HcpcProduct40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct40TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX40TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX40TBox" required="Yes" type="String">
		
		<cfif HcpcDX40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDX40TBox EQ "@@" OR arguments.hcpcDX40TBox EQ "">
				
				<cfset arguments.hcpcDX40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDX40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX40TBox</strong> (#HcpcDX40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX40TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX40TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDX40TBox = arguments.HcpcDX40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX40TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis40TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis40TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcDiagnosis40TBox EQ "@@" OR arguments.hcpcDiagnosis40TBox EQ "">
				
				<cfset arguments.hcpcDiagnosis40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcDiagnosis40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis40TBox</strong> (#HcpcDiagnosis40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis40TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis40TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis40TBox = arguments.HcpcDiagnosis40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis40TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCost40TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCost40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCost40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCost40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCost40TBox" required="Yes" type="String">
		
		<cfif HcpcCost40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcCost40TBox EQ "@@" OR arguments.hcpcCost40TBox EQ "">
				
				<cfset arguments.hcpcCost40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcCost40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCost40TBox</strong> (#HcpcCost40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCost40TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCost40TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcCost40TBox = arguments.HcpcCost40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCost40TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear40TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear40TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedYear40TBox EQ "@@" OR arguments.hcpcLengthOfNeedYear40TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedYear40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear40TBox</strong> (#HcpcLengthOfNeedYear40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear40TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear40TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear40TBox = arguments.HcpcLengthOfNeedYear40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear40TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth40TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth40TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth40TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth40TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth40TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth40TBox NEQ "NULL">	
			
			<cfif arguments.hcpcLengthOfNeedMonth40TBox EQ "@@" OR arguments.hcpcLengthOfNeedMonth40TBox EQ "">
				
				<cfset arguments.hcpcLengthOfNeedMonth40TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth40TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth40TBox</strong> (#HcpcLengthOfNeedMonth40TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth40TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth40TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth40TBox = arguments.HcpcLengthOfNeedMonth40TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth40TBox")>			
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

		<cfargument name="IntakeID" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode11TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty11TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct11TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX11TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis11TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost11TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear11TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth11TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode12TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty12TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct12TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX12TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis12TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost12TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear12TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth12TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode13TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty13TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct13TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX13TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis13TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost13TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear13TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth13TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode14TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty14TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct14TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX14TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis14TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost14TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear14TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth14TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode15TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty15TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct15TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX15TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis15TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost15TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear15TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth15TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode16TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty16TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct16TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX16TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis16TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost16TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear16TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth16TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode17TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty17TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct17TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX17TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis17TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost17TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear17TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth17TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode18TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty18TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct18TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX18TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis18TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost18TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear18TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth18TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode19TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty19TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct19TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX19TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis19TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost19TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear19TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth19TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode20TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty20TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct20TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX20TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis20TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost20TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear20TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth20TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode21TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty21TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct21TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX21TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis21TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost21TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear21TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth21TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode22TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty22TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct22TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX22TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis22TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost22TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear22TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth22TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode23TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty23TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct23TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX23TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis23TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost23TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear23TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth23TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode24TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty24TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct24TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX24TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis24TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost24TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear24TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth24TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode25TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty25TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct25TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX25TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis25TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost25TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear25TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth25TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode26TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty26TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct26TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX26TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis26TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost26TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear26TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth26TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode27TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty27TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct27TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX27TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis27TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost27TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear27TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth27TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode28TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty28TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct28TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX28TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis28TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost28TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear28TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth28TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode29TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty29TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct29TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX29TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis29TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost29TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear29TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth29TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode30TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty30TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct30TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX30TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis30TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost30TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear30TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth30TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode31TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty31TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct31TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX31TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis31TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost31TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear31TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth31TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode32TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty32TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct32TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX32TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis32TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost32TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear32TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth32TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode33TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty33TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct33TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX33TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis33TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost33TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear33TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth33TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode34TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty34TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct34TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX34TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis34TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost34TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear34TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth34TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode35TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty35TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct35TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX35TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis35TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost35TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear35TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth35TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode36TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty36TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct36TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX36TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis36TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost36TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear36TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth36TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode37TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty37TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct37TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX37TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis37TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost37TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear37TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth37TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode38TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty38TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct38TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX38TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis38TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost38TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear38TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth38TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode39TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty39TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct39TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX39TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis39TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost39TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear39TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth39TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode40TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty40TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct40TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX40TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis40TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost40TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear40TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth40TBox" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.IntakeID = arguments.IntakeID>
		<cfset variables.instance.hcpcCode1TBox = arguments.hcpcCode1TBox>
		<cfset variables.instance.hcpcQty1TBox = arguments.hcpcQty1TBox>
		<cfset variables.instance.hcpcProduct1TBox = arguments.hcpcProduct1TBox>
		<cfset variables.instance.hcpcDX1TBox = arguments.hcpcDX1TBox>
		<cfset variables.instance.hcpcDiagnosis1TBox = arguments.hcpcDiagnosis1TBox>
		<cfset variables.instance.hcpcCost1TBox = arguments.hcpcCost1TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear1TBox = arguments.hcpcLengthOfNeedYear1TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth1TBox = arguments.hcpcLengthOfNeedMonth1TBox>
		<cfset variables.instance.hcpcCode2TBox = arguments.hcpcCode2TBox>
		<cfset variables.instance.hcpcQty2TBox = arguments.hcpcQty2TBox>
		<cfset variables.instance.hcpcProduct2TBox = arguments.hcpcProduct2TBox>
		<cfset variables.instance.hcpcDX2TBox = arguments.hcpcDX2TBox>
		<cfset variables.instance.hcpcDiagnosis2TBox = arguments.hcpcDiagnosis2TBox>
		<cfset variables.instance.hcpcCost2TBox = arguments.hcpcCost2TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear2TBox = arguments.hcpcLengthOfNeedYear2TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth2TBox = arguments.hcpcLengthOfNeedMonth2TBox>
		<cfset variables.instance.hcpcCode3TBox = arguments.hcpcCode3TBox>
		<cfset variables.instance.hcpcQty3TBox = arguments.hcpcQty3TBox>
		<cfset variables.instance.hcpcProduct3TBox = arguments.hcpcProduct3TBox>
		<cfset variables.instance.hcpcDX3TBox = arguments.hcpcDX3TBox>
		<cfset variables.instance.hcpcDiagnosis3TBox = arguments.hcpcDiagnosis3TBox>
		<cfset variables.instance.hcpcCost3TBox = arguments.hcpcCost3TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear3TBox = arguments.hcpcLengthOfNeedYear3TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth3TBox = arguments.hcpcLengthOfNeedMonth3TBox>
		<cfset variables.instance.hcpcCode4TBox = arguments.hcpcCode4TBox>
		<cfset variables.instance.hcpcQty4TBox = arguments.hcpcQty4TBox>
		<cfset variables.instance.hcpcProduct4TBox = arguments.hcpcProduct4TBox>
		<cfset variables.instance.hcpcDX4TBox = arguments.hcpcDX4TBox>
		<cfset variables.instance.hcpcDiagnosis4TBox = arguments.hcpcDiagnosis4TBox>
		<cfset variables.instance.hcpcCost4TBox = arguments.hcpcCost4TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear4TBox = arguments.hcpcLengthOfNeedYear4TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth4TBox = arguments.hcpcLengthOfNeedMonth4TBox>
		<cfset variables.instance.hcpcCode5TBox = arguments.hcpcCode5TBox>
		<cfset variables.instance.hcpcQty5TBox = arguments.hcpcQty5TBox>
		<cfset variables.instance.hcpcProduct5TBox = arguments.hcpcProduct5TBox>
		<cfset variables.instance.hcpcDX5TBox = arguments.hcpcDX5TBox>
		<cfset variables.instance.hcpcDiagnosis5TBox = arguments.hcpcDiagnosis5TBox>
		<cfset variables.instance.hcpcCost5TBox = arguments.hcpcCost5TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear5TBox = arguments.hcpcLengthOfNeedYear5TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth5TBox = arguments.hcpcLengthOfNeedMonth5TBox>
		<cfset variables.instance.hcpcCode6TBox = arguments.hcpcCode6TBox>
		<cfset variables.instance.hcpcQty6TBox = arguments.hcpcQty6TBox>
		<cfset variables.instance.hcpcProduct6TBox = arguments.hcpcProduct6TBox>
		<cfset variables.instance.hcpcDX6TBox = arguments.hcpcDX6TBox>
		<cfset variables.instance.hcpcDiagnosis6TBox = arguments.hcpcDiagnosis6TBox>
		<cfset variables.instance.hcpcCost6TBox = arguments.hcpcCost6TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear6TBox = arguments.hcpcLengthOfNeedYear6TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth6TBox = arguments.hcpcLengthOfNeedMonth6TBox>
		<cfset variables.instance.hcpcCode7TBox = arguments.hcpcCode7TBox>
		<cfset variables.instance.hcpcQty7TBox = arguments.hcpcQty7TBox>
		<cfset variables.instance.hcpcProduct7TBox = arguments.hcpcProduct7TBox>
		<cfset variables.instance.hcpcDX7TBox = arguments.hcpcDX7TBox>
		<cfset variables.instance.hcpcDiagnosis7TBox = arguments.hcpcDiagnosis7TBox>
		<cfset variables.instance.hcpcCost7TBox = arguments.hcpcCost7TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear7TBox = arguments.hcpcLengthOfNeedYear7TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth7TBox = arguments.hcpcLengthOfNeedMonth7TBox>
		<cfset variables.instance.hcpcCode8TBox = arguments.hcpcCode8TBox>
		<cfset variables.instance.hcpcQty8TBox = arguments.hcpcQty8TBox>
		<cfset variables.instance.hcpcProduct8TBox = arguments.hcpcProduct8TBox>
		<cfset variables.instance.hcpcDX8TBox = arguments.hcpcDX8TBox>
		<cfset variables.instance.hcpcDiagnosis8TBox = arguments.hcpcDiagnosis8TBox>
		<cfset variables.instance.hcpcCost8TBox = arguments.hcpcCost8TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear8TBox = arguments.hcpcLengthOfNeedYear8TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth8TBox = arguments.hcpcLengthOfNeedMonth8TBox>
		<cfset variables.instance.hcpcCode9TBox = arguments.hcpcCode9TBox>
		<cfset variables.instance.hcpcQty9TBox = arguments.hcpcQty9TBox>
		<cfset variables.instance.hcpcProduct9TBox = arguments.hcpcProduct9TBox>
		<cfset variables.instance.hcpcDX9TBox = arguments.hcpcDX9TBox>
		<cfset variables.instance.hcpcDiagnosis9TBox = arguments.hcpcDiagnosis9TBox>
		<cfset variables.instance.hcpcCost9TBox = arguments.hcpcCost9TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear9TBox = arguments.hcpcLengthOfNeedYear9TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth9TBox = arguments.hcpcLengthOfNeedMonth9TBox>
		<cfset variables.instance.hcpcCode10TBox = arguments.hcpcCode10TBox>
		<cfset variables.instance.hcpcQty10TBox = arguments.hcpcQty10TBox>
		<cfset variables.instance.hcpcProduct10TBox = arguments.hcpcProduct10TBox>
		<cfset variables.instance.hcpcDX10TBox = arguments.hcpcDX10TBox>
		<cfset variables.instance.hcpcDiagnosis10TBox = arguments.hcpcDiagnosis10TBox>
		<cfset variables.instance.hcpcCost10TBox = arguments.hcpcCost10TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear10TBox = arguments.hcpcLengthOfNeedYear10TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth10TBox = arguments.hcpcLengthOfNeedMonth10TBox>
		<cfset variables.instance.hcpcCode11TBox = arguments.hcpcCode11TBox>
		<cfset variables.instance.hcpcQty11TBox = arguments.hcpcQty11TBox>
		<cfset variables.instance.hcpcProduct11TBox = arguments.hcpcProduct11TBox>
		<cfset variables.instance.hcpcDX11TBox = arguments.hcpcDX11TBox>
		<cfset variables.instance.hcpcDiagnosis11TBox = arguments.hcpcDiagnosis11TBox>
		<cfset variables.instance.hcpcCost11TBox = arguments.hcpcCost11TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear11TBox = arguments.hcpcLengthOfNeedYear11TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth11TBox = arguments.hcpcLengthOfNeedMonth11TBox>
		<cfset variables.instance.hcpcCode12TBox = arguments.hcpcCode12TBox>
		<cfset variables.instance.hcpcQty12TBox = arguments.hcpcQty12TBox>
		<cfset variables.instance.hcpcProduct12TBox = arguments.hcpcProduct12TBox>
		<cfset variables.instance.hcpcDX12TBox = arguments.hcpcDX12TBox>
		<cfset variables.instance.hcpcDiagnosis12TBox = arguments.hcpcDiagnosis12TBox>
		<cfset variables.instance.hcpcCost12TBox = arguments.hcpcCost12TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear12TBox = arguments.hcpcLengthOfNeedYear12TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth12TBox = arguments.hcpcLengthOfNeedMonth12TBox>
		<cfset variables.instance.hcpcCode13TBox = arguments.hcpcCode13TBox>
		<cfset variables.instance.hcpcQty13TBox = arguments.hcpcQty13TBox>
		<cfset variables.instance.hcpcProduct13TBox = arguments.hcpcProduct13TBox>
		<cfset variables.instance.hcpcDX13TBox = arguments.hcpcDX13TBox>
		<cfset variables.instance.hcpcDiagnosis13TBox = arguments.hcpcDiagnosis13TBox>
		<cfset variables.instance.hcpcCost13TBox = arguments.hcpcCost13TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear13TBox = arguments.hcpcLengthOfNeedYear13TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth13TBox = arguments.hcpcLengthOfNeedMonth13TBox>
		<cfset variables.instance.hcpcCode14TBox = arguments.hcpcCode14TBox>
		<cfset variables.instance.hcpcQty14TBox = arguments.hcpcQty14TBox>
		<cfset variables.instance.hcpcProduct14TBox = arguments.hcpcProduct14TBox>
		<cfset variables.instance.hcpcDX14TBox = arguments.hcpcDX14TBox>
		<cfset variables.instance.hcpcDiagnosis14TBox = arguments.hcpcDiagnosis14TBox>
		<cfset variables.instance.hcpcCost14TBox = arguments.hcpcCost14TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear14TBox = arguments.hcpcLengthOfNeedYear14TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth14TBox = arguments.hcpcLengthOfNeedMonth14TBox>
		<cfset variables.instance.hcpcCode15TBox = arguments.hcpcCode15TBox>
		<cfset variables.instance.hcpcQty15TBox = arguments.hcpcQty15TBox>
		<cfset variables.instance.hcpcProduct15TBox = arguments.hcpcProduct15TBox>
		<cfset variables.instance.hcpcDX15TBox = arguments.hcpcDX15TBox>
		<cfset variables.instance.hcpcDiagnosis15TBox = arguments.hcpcDiagnosis15TBox>
		<cfset variables.instance.hcpcCost15TBox = arguments.hcpcCost15TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear15TBox = arguments.hcpcLengthOfNeedYear15TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth15TBox = arguments.hcpcLengthOfNeedMonth15TBox>
		<cfset variables.instance.hcpcCode16TBox = arguments.hcpcCode16TBox>
		<cfset variables.instance.hcpcQty16TBox = arguments.hcpcQty16TBox>
		<cfset variables.instance.hcpcProduct16TBox = arguments.hcpcProduct16TBox>
		<cfset variables.instance.hcpcDX16TBox = arguments.hcpcDX16TBox>
		<cfset variables.instance.hcpcDiagnosis16TBox = arguments.hcpcDiagnosis16TBox>
		<cfset variables.instance.hcpcCost16TBox = arguments.hcpcCost16TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear16TBox = arguments.hcpcLengthOfNeedYear16TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth16TBox = arguments.hcpcLengthOfNeedMonth16TBox>
		<cfset variables.instance.hcpcCode17TBox = arguments.hcpcCode17TBox>
		<cfset variables.instance.hcpcQty17TBox = arguments.hcpcQty17TBox>
		<cfset variables.instance.hcpcProduct17TBox = arguments.hcpcProduct17TBox>
		<cfset variables.instance.hcpcDX17TBox = arguments.hcpcDX17TBox>
		<cfset variables.instance.hcpcDiagnosis17TBox = arguments.hcpcDiagnosis17TBox>
		<cfset variables.instance.hcpcCost17TBox = arguments.hcpcCost17TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear17TBox = arguments.hcpcLengthOfNeedYear17TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth17TBox = arguments.hcpcLengthOfNeedMonth17TBox>
		<cfset variables.instance.hcpcCode18TBox = arguments.hcpcCode18TBox>
		<cfset variables.instance.hcpcQty18TBox = arguments.hcpcQty18TBox>
		<cfset variables.instance.hcpcProduct18TBox = arguments.hcpcProduct18TBox>
		<cfset variables.instance.hcpcDX18TBox = arguments.hcpcDX18TBox>
		<cfset variables.instance.hcpcDiagnosis18TBox = arguments.hcpcDiagnosis18TBox>
		<cfset variables.instance.hcpcCost18TBox = arguments.hcpcCost18TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear18TBox = arguments.hcpcLengthOfNeedYear18TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth18TBox = arguments.hcpcLengthOfNeedMonth18TBox>
		<cfset variables.instance.hcpcCode19TBox = arguments.hcpcCode19TBox>
		<cfset variables.instance.hcpcQty19TBox = arguments.hcpcQty19TBox>
		<cfset variables.instance.hcpcProduct19TBox = arguments.hcpcProduct19TBox>
		<cfset variables.instance.hcpcDX19TBox = arguments.hcpcDX19TBox>
		<cfset variables.instance.hcpcDiagnosis19TBox = arguments.hcpcDiagnosis19TBox>
		<cfset variables.instance.hcpcCost19TBox = arguments.hcpcCost19TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear19TBox = arguments.hcpcLengthOfNeedYear19TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth19TBox = arguments.hcpcLengthOfNeedMonth19TBox>
		<cfset variables.instance.hcpcCode20TBox = arguments.hcpcCode20TBox>
		<cfset variables.instance.hcpcQty20TBox = arguments.hcpcQty20TBox>
		<cfset variables.instance.hcpcProduct20TBox = arguments.hcpcProduct20TBox>
		<cfset variables.instance.hcpcDX20TBox = arguments.hcpcDX20TBox>
		<cfset variables.instance.hcpcDiagnosis20TBox = arguments.hcpcDiagnosis20TBox>
		<cfset variables.instance.hcpcCost20TBox = arguments.hcpcCost20TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear20TBox = arguments.hcpcLengthOfNeedYear20TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth20TBox = arguments.hcpcLengthOfNeedMonth20TBox>
		<cfset variables.instance.hcpcCode21TBox = arguments.hcpcCode21TBox>
		<cfset variables.instance.hcpcQty21TBox = arguments.hcpcQty21TBox>
		<cfset variables.instance.hcpcProduct21TBox = arguments.hcpcProduct21TBox>
		<cfset variables.instance.hcpcDX21TBox = arguments.hcpcDX21TBox>
		<cfset variables.instance.hcpcDiagnosis21TBox = arguments.hcpcDiagnosis21TBox>
		<cfset variables.instance.hcpcCost21TBox = arguments.hcpcCost21TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear21TBox = arguments.hcpcLengthOfNeedYear21TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth21TBox = arguments.hcpcLengthOfNeedMonth21TBox>
		<cfset variables.instance.hcpcCode22TBox = arguments.hcpcCode22TBox>
		<cfset variables.instance.hcpcQty22TBox = arguments.hcpcQty22TBox>
		<cfset variables.instance.hcpcProduct22TBox = arguments.hcpcProduct22TBox>
		<cfset variables.instance.hcpcDX22TBox = arguments.hcpcDX22TBox>
		<cfset variables.instance.hcpcDiagnosis22TBox = arguments.hcpcDiagnosis22TBox>
		<cfset variables.instance.hcpcCost22TBox = arguments.hcpcCost22TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear22TBox = arguments.hcpcLengthOfNeedYear22TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth22TBox = arguments.hcpcLengthOfNeedMonth22TBox>
		<cfset variables.instance.hcpcCode23TBox = arguments.hcpcCode23TBox>
		<cfset variables.instance.hcpcQty23TBox = arguments.hcpcQty23TBox>
		<cfset variables.instance.hcpcProduct23TBox = arguments.hcpcProduct23TBox>
		<cfset variables.instance.hcpcDX23TBox = arguments.hcpcDX23TBox>
		<cfset variables.instance.hcpcDiagnosis23TBox = arguments.hcpcDiagnosis23TBox>
		<cfset variables.instance.hcpcCost23TBox = arguments.hcpcCost23TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear23TBox = arguments.hcpcLengthOfNeedYear23TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth23TBox = arguments.hcpcLengthOfNeedMonth23TBox>
		<cfset variables.instance.hcpcCode24TBox = arguments.hcpcCode24TBox>
		<cfset variables.instance.hcpcQty24TBox = arguments.hcpcQty24TBox>
		<cfset variables.instance.hcpcProduct24TBox = arguments.hcpcProduct24TBox>
		<cfset variables.instance.hcpcDX24TBox = arguments.hcpcDX24TBox>
		<cfset variables.instance.hcpcDiagnosis24TBox = arguments.hcpcDiagnosis24TBox>
		<cfset variables.instance.hcpcCost24TBox = arguments.hcpcCost24TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear24TBox = arguments.hcpcLengthOfNeedYear24TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth24TBox = arguments.hcpcLengthOfNeedMonth24TBox>
		<cfset variables.instance.hcpcCode25TBox = arguments.hcpcCode25TBox>
		<cfset variables.instance.hcpcQty25TBox = arguments.hcpcQty25TBox>
		<cfset variables.instance.hcpcProduct25TBox = arguments.hcpcProduct25TBox>
		<cfset variables.instance.hcpcDX25TBox = arguments.hcpcDX25TBox>
		<cfset variables.instance.hcpcDiagnosis25TBox = arguments.hcpcDiagnosis25TBox>
		<cfset variables.instance.hcpcCost25TBox = arguments.hcpcCost25TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear25TBox = arguments.hcpcLengthOfNeedYear25TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth25TBox = arguments.hcpcLengthOfNeedMonth25TBox>
		<cfset variables.instance.hcpcCode26TBox = arguments.hcpcCode26TBox>
		<cfset variables.instance.hcpcQty26TBox = arguments.hcpcQty26TBox>
		<cfset variables.instance.hcpcProduct26TBox = arguments.hcpcProduct26TBox>
		<cfset variables.instance.hcpcDX26TBox = arguments.hcpcDX26TBox>
		<cfset variables.instance.hcpcDiagnosis26TBox = arguments.hcpcDiagnosis26TBox>
		<cfset variables.instance.hcpcCost26TBox = arguments.hcpcCost26TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear26TBox = arguments.hcpcLengthOfNeedYear26TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth26TBox = arguments.hcpcLengthOfNeedMonth26TBox>
		<cfset variables.instance.hcpcCode27TBox = arguments.hcpcCode27TBox>
		<cfset variables.instance.hcpcQty27TBox = arguments.hcpcQty27TBox>
		<cfset variables.instance.hcpcProduct27TBox = arguments.hcpcProduct27TBox>
		<cfset variables.instance.hcpcDX27TBox = arguments.hcpcDX27TBox>
		<cfset variables.instance.hcpcDiagnosis27TBox = arguments.hcpcDiagnosis27TBox>
		<cfset variables.instance.hcpcCost27TBox = arguments.hcpcCost27TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear27TBox = arguments.hcpcLengthOfNeedYear27TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth27TBox = arguments.hcpcLengthOfNeedMonth27TBox>
		<cfset variables.instance.hcpcCode28TBox = arguments.hcpcCode28TBox>
		<cfset variables.instance.hcpcQty28TBox = arguments.hcpcQty28TBox>
		<cfset variables.instance.hcpcProduct28TBox = arguments.hcpcProduct28TBox>
		<cfset variables.instance.hcpcDX28TBox = arguments.hcpcDX28TBox>
		<cfset variables.instance.hcpcDiagnosis28TBox = arguments.hcpcDiagnosis28TBox>
		<cfset variables.instance.hcpcCost28TBox = arguments.hcpcCost28TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear28TBox = arguments.hcpcLengthOfNeedYear28TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth28TBox = arguments.hcpcLengthOfNeedMonth28TBox>
		<cfset variables.instance.hcpcCode29TBox = arguments.hcpcCode29TBox>
		<cfset variables.instance.hcpcQty29TBox = arguments.hcpcQty29TBox>
		<cfset variables.instance.hcpcProduct29TBox = arguments.hcpcProduct29TBox>
		<cfset variables.instance.hcpcDX29TBox = arguments.hcpcDX29TBox>
		<cfset variables.instance.hcpcDiagnosis29TBox = arguments.hcpcDiagnosis29TBox>
		<cfset variables.instance.hcpcCost29TBox = arguments.hcpcCost29TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear29TBox = arguments.hcpcLengthOfNeedYear29TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth29TBox = arguments.hcpcLengthOfNeedMonth29TBox>
		<cfset variables.instance.hcpcCode30TBox = arguments.hcpcCode30TBox>
		<cfset variables.instance.hcpcQty30TBox = arguments.hcpcQty30TBox>
		<cfset variables.instance.hcpcProduct30TBox = arguments.hcpcProduct30TBox>
		<cfset variables.instance.hcpcDX30TBox = arguments.hcpcDX30TBox>
		<cfset variables.instance.hcpcDiagnosis30TBox = arguments.hcpcDiagnosis30TBox>
		<cfset variables.instance.hcpcCost30TBox = arguments.hcpcCost30TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear30TBox = arguments.hcpcLengthOfNeedYear30TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth30TBox = arguments.hcpcLengthOfNeedMonth30TBox>
		<cfset variables.instance.hcpcCode31TBox = arguments.hcpcCode31TBox>
		<cfset variables.instance.hcpcQty31TBox = arguments.hcpcQty31TBox>
		<cfset variables.instance.hcpcProduct31TBox = arguments.hcpcProduct31TBox>
		<cfset variables.instance.hcpcDX31TBox = arguments.hcpcDX31TBox>
		<cfset variables.instance.hcpcDiagnosis31TBox = arguments.hcpcDiagnosis31TBox>
		<cfset variables.instance.hcpcCost31TBox = arguments.hcpcCost31TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear31TBox = arguments.hcpcLengthOfNeedYear31TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth31TBox = arguments.hcpcLengthOfNeedMonth31TBox>
		<cfset variables.instance.hcpcCode32TBox = arguments.hcpcCode32TBox>
		<cfset variables.instance.hcpcQty32TBox = arguments.hcpcQty32TBox>
		<cfset variables.instance.hcpcProduct32TBox = arguments.hcpcProduct32TBox>
		<cfset variables.instance.hcpcDX32TBox = arguments.hcpcDX32TBox>
		<cfset variables.instance.hcpcDiagnosis32TBox = arguments.hcpcDiagnosis32TBox>
		<cfset variables.instance.hcpcCost32TBox = arguments.hcpcCost32TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear32TBox = arguments.hcpcLengthOfNeedYear32TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth32TBox = arguments.hcpcLengthOfNeedMonth32TBox>
		<cfset variables.instance.hcpcCode33TBox = arguments.hcpcCode33TBox>
		<cfset variables.instance.hcpcQty33TBox = arguments.hcpcQty33TBox>
		<cfset variables.instance.hcpcProduct33TBox = arguments.hcpcProduct33TBox>
		<cfset variables.instance.hcpcDX33TBox = arguments.hcpcDX33TBox>
		<cfset variables.instance.hcpcDiagnosis33TBox = arguments.hcpcDiagnosis33TBox>
		<cfset variables.instance.hcpcCost33TBox = arguments.hcpcCost33TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear33TBox = arguments.hcpcLengthOfNeedYear33TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth33TBox = arguments.hcpcLengthOfNeedMonth33TBox>
		<cfset variables.instance.hcpcCode34TBox = arguments.hcpcCode34TBox>
		<cfset variables.instance.hcpcQty34TBox = arguments.hcpcQty34TBox>
		<cfset variables.instance.hcpcProduct34TBox = arguments.hcpcProduct34TBox>
		<cfset variables.instance.hcpcDX34TBox = arguments.hcpcDX34TBox>
		<cfset variables.instance.hcpcDiagnosis34TBox = arguments.hcpcDiagnosis34TBox>
		<cfset variables.instance.hcpcCost34TBox = arguments.hcpcCost34TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear34TBox = arguments.hcpcLengthOfNeedYear34TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth34TBox = arguments.hcpcLengthOfNeedMonth34TBox>
		<cfset variables.instance.hcpcCode35TBox = arguments.hcpcCode35TBox>
		<cfset variables.instance.hcpcQty35TBox = arguments.hcpcQty35TBox>
		<cfset variables.instance.hcpcProduct35TBox = arguments.hcpcProduct35TBox>
		<cfset variables.instance.hcpcDX35TBox = arguments.hcpcDX35TBox>
		<cfset variables.instance.hcpcDiagnosis35TBox = arguments.hcpcDiagnosis35TBox>
		<cfset variables.instance.hcpcCost35TBox = arguments.hcpcCost35TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear35TBox = arguments.hcpcLengthOfNeedYear35TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth35TBox = arguments.hcpcLengthOfNeedMonth35TBox>
		<cfset variables.instance.hcpcCode36TBox = arguments.hcpcCode36TBox>
		<cfset variables.instance.hcpcQty36TBox = arguments.hcpcQty36TBox>
		<cfset variables.instance.hcpcProduct36TBox = arguments.hcpcProduct36TBox>
		<cfset variables.instance.hcpcDX36TBox = arguments.hcpcDX36TBox>
		<cfset variables.instance.hcpcDiagnosis36TBox = arguments.hcpcDiagnosis36TBox>
		<cfset variables.instance.hcpcCost36TBox = arguments.hcpcCost36TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear36TBox = arguments.hcpcLengthOfNeedYear36TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth36TBox = arguments.hcpcLengthOfNeedMonth36TBox>
		<cfset variables.instance.hcpcCode37TBox = arguments.hcpcCode37TBox>
		<cfset variables.instance.hcpcQty37TBox = arguments.hcpcQty37TBox>
		<cfset variables.instance.hcpcProduct37TBox = arguments.hcpcProduct37TBox>
		<cfset variables.instance.hcpcDX37TBox = arguments.hcpcDX37TBox>
		<cfset variables.instance.hcpcDiagnosis37TBox = arguments.hcpcDiagnosis37TBox>
		<cfset variables.instance.hcpcCost37TBox = arguments.hcpcCost37TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear37TBox = arguments.hcpcLengthOfNeedYear37TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth37TBox = arguments.hcpcLengthOfNeedMonth37TBox>
		<cfset variables.instance.hcpcCode38TBox = arguments.hcpcCode38TBox>
		<cfset variables.instance.hcpcQty38TBox = arguments.hcpcQty38TBox>
		<cfset variables.instance.hcpcProduct38TBox = arguments.hcpcProduct38TBox>
		<cfset variables.instance.hcpcDX38TBox = arguments.hcpcDX38TBox>
		<cfset variables.instance.hcpcDiagnosis38TBox = arguments.hcpcDiagnosis38TBox>
		<cfset variables.instance.hcpcCost38TBox = arguments.hcpcCost38TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear38TBox = arguments.hcpcLengthOfNeedYear38TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth38TBox = arguments.hcpcLengthOfNeedMonth38TBox>
		<cfset variables.instance.hcpcCode39TBox = arguments.hcpcCode39TBox>
		<cfset variables.instance.hcpcQty39TBox = arguments.hcpcQty39TBox>
		<cfset variables.instance.hcpcProduct39TBox = arguments.hcpcProduct39TBox>
		<cfset variables.instance.hcpcDX39TBox = arguments.hcpcDX39TBox>
		<cfset variables.instance.hcpcDiagnosis39TBox = arguments.hcpcDiagnosis39TBox>
		<cfset variables.instance.hcpcCost39TBox = arguments.hcpcCost39TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear39TBox = arguments.hcpcLengthOfNeedYear39TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth39TBox = arguments.hcpcLengthOfNeedMonth39TBox>
		<cfset variables.instance.hcpcCode40TBox = arguments.hcpcCode40TBox>
		<cfset variables.instance.hcpcQty40TBox = arguments.hcpcQty40TBox>
		<cfset variables.instance.hcpcProduct40TBox = arguments.hcpcProduct40TBox>
		<cfset variables.instance.hcpcDX40TBox = arguments.hcpcDX40TBox>
		<cfset variables.instance.hcpcDiagnosis40TBox = arguments.hcpcDiagnosis40TBox>
		<cfset variables.instance.hcpcCost40TBox = arguments.hcpcCost40TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear40TBox = arguments.hcpcLengthOfNeedYear40TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth40TBox = arguments.hcpcLengthOfNeedMonth40TBox>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="IntakeHCPCIO" output="No">
		
		<cfargument name="IntakeHCPCID" required="yes" type="numeric">		
		<cfset var qGetIntakeHCPC = "">
		
		<cfset preInit(IntakeHCPCID)>
	
		<cfquery name="qGetIntakeHCPC" datasource="#trim(request.datasource)#">
	  		SELECT IntakeHCPCID,IntakeID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode,DateCreated,DateModified
			FROM intakehcpc  
			WHERE IntakeHCPCID = #trim(arguments.IntakeHCPCID)# 
		</cfquery>
		
		<cfif qGetIntakeHCPC.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetIntakeHCPC.IntakeHCPCID EQ "" OR qGetIntakeHCPC.IntakeHCPCID EQ "NULL") 
				variables.instance.IntakeHCPCID = "NULL"; 
			ELSE 
				variables.instance.IntakeHCPCID = qGetIntakeHCPC.IntakeHCPCID;
				
			IF(qGetIntakeHCPC.IntakeID EQ "" OR qGetIntakeHCPC.IntakeID EQ "NULL") 
				variables.instance.IntakeID = "NULL"; 
			ELSE 
				variables.instance.IntakeID = qGetIntakeHCPC.IntakeID;
							
				variables.instance.hcpcCode1TBox = qGetIntakeHCPC.hcpcCode1TBox;
							
				variables.instance.hcpcQty1TBox = qGetIntakeHCPC.hcpcQty1TBox;
							
				variables.instance.hcpcProduct1TBox = qGetIntakeHCPC.hcpcProduct1TBox;
							
				variables.instance.hcpcDX1TBox = qGetIntakeHCPC.hcpcDX1TBox;
							
				variables.instance.hcpcDiagnosis1TBox = qGetIntakeHCPC.hcpcDiagnosis1TBox;
							
				variables.instance.hcpcCost1TBox = qGetIntakeHCPC.hcpcCost1TBox;
							
				variables.instance.hcpcLengthOfNeedYear1TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear1TBox;
							
				variables.instance.hcpcLengthOfNeedMonth1TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth1TBox;
							
				variables.instance.hcpcCode2TBox = qGetIntakeHCPC.hcpcCode2TBox;
							
				variables.instance.hcpcQty2TBox = qGetIntakeHCPC.hcpcQty2TBox;
							
				variables.instance.hcpcProduct2TBox = qGetIntakeHCPC.hcpcProduct2TBox;
							
				variables.instance.hcpcDX2TBox = qGetIntakeHCPC.hcpcDX2TBox;
							
				variables.instance.hcpcDiagnosis2TBox = qGetIntakeHCPC.hcpcDiagnosis2TBox;
							
				variables.instance.hcpcCost2TBox = qGetIntakeHCPC.hcpcCost2TBox;
							
				variables.instance.hcpcLengthOfNeedYear2TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear2TBox;
							
				variables.instance.hcpcLengthOfNeedMonth2TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth2TBox;
							
				variables.instance.hcpcCode3TBox = qGetIntakeHCPC.hcpcCode3TBox;
							
				variables.instance.hcpcQty3TBox = qGetIntakeHCPC.hcpcQty3TBox;
							
				variables.instance.hcpcProduct3TBox = qGetIntakeHCPC.hcpcProduct3TBox;
							
				variables.instance.hcpcDX3TBox = qGetIntakeHCPC.hcpcDX3TBox;
							
				variables.instance.hcpcDiagnosis3TBox = qGetIntakeHCPC.hcpcDiagnosis3TBox;
							
				variables.instance.hcpcCost3TBox = qGetIntakeHCPC.hcpcCost3TBox;
							
				variables.instance.hcpcLengthOfNeedYear3TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear3TBox;
							
				variables.instance.hcpcLengthOfNeedMonth3TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth3TBox;
							
				variables.instance.hcpcCode4TBox = qGetIntakeHCPC.hcpcCode4TBox;
							
				variables.instance.hcpcQty4TBox = qGetIntakeHCPC.hcpcQty4TBox;
							
				variables.instance.hcpcProduct4TBox = qGetIntakeHCPC.hcpcProduct4TBox;
							
				variables.instance.hcpcDX4TBox = qGetIntakeHCPC.hcpcDX4TBox;
							
				variables.instance.hcpcDiagnosis4TBox = qGetIntakeHCPC.hcpcDiagnosis4TBox;
							
				variables.instance.hcpcCost4TBox = qGetIntakeHCPC.hcpcCost4TBox;
							
				variables.instance.hcpcLengthOfNeedYear4TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear4TBox;
							
				variables.instance.hcpcLengthOfNeedMonth4TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth4TBox;
							
				variables.instance.hcpcCode5TBox = qGetIntakeHCPC.hcpcCode5TBox;
							
				variables.instance.hcpcQty5TBox = qGetIntakeHCPC.hcpcQty5TBox;
							
				variables.instance.hcpcProduct5TBox = qGetIntakeHCPC.hcpcProduct5TBox;
							
				variables.instance.hcpcDX5TBox = qGetIntakeHCPC.hcpcDX5TBox;
							
				variables.instance.hcpcDiagnosis5TBox = qGetIntakeHCPC.hcpcDiagnosis5TBox;
							
				variables.instance.hcpcCost5TBox = qGetIntakeHCPC.hcpcCost5TBox;
							
				variables.instance.hcpcLengthOfNeedYear5TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear5TBox;
							
				variables.instance.hcpcLengthOfNeedMonth5TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth5TBox;
							
				variables.instance.hcpcCode6TBox = qGetIntakeHCPC.hcpcCode6TBox;
							
				variables.instance.hcpcQty6TBox = qGetIntakeHCPC.hcpcQty6TBox;
							
				variables.instance.hcpcProduct6TBox = qGetIntakeHCPC.hcpcProduct6TBox;
							
				variables.instance.hcpcDX6TBox = qGetIntakeHCPC.hcpcDX6TBox;
							
				variables.instance.hcpcDiagnosis6TBox = qGetIntakeHCPC.hcpcDiagnosis6TBox;
							
				variables.instance.hcpcCost6TBox = qGetIntakeHCPC.hcpcCost6TBox;
							
				variables.instance.hcpcLengthOfNeedYear6TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear6TBox;
							
				variables.instance.hcpcLengthOfNeedMonth6TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth6TBox;
							
				variables.instance.hcpcCode7TBox = qGetIntakeHCPC.hcpcCode7TBox;
							
				variables.instance.hcpcQty7TBox = qGetIntakeHCPC.hcpcQty7TBox;
							
				variables.instance.hcpcProduct7TBox = qGetIntakeHCPC.hcpcProduct7TBox;
							
				variables.instance.hcpcDX7TBox = qGetIntakeHCPC.hcpcDX7TBox;
							
				variables.instance.hcpcDiagnosis7TBox = qGetIntakeHCPC.hcpcDiagnosis7TBox;
							
				variables.instance.hcpcCost7TBox = qGetIntakeHCPC.hcpcCost7TBox;
							
				variables.instance.hcpcLengthOfNeedYear7TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear7TBox;
							
				variables.instance.hcpcLengthOfNeedMonth7TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth7TBox;
							
				variables.instance.hcpcCode8TBox = qGetIntakeHCPC.hcpcCode8TBox;
							
				variables.instance.hcpcQty8TBox = qGetIntakeHCPC.hcpcQty8TBox;
							
				variables.instance.hcpcProduct8TBox = qGetIntakeHCPC.hcpcProduct8TBox;
							
				variables.instance.hcpcDX8TBox = qGetIntakeHCPC.hcpcDX8TBox;
							
				variables.instance.hcpcDiagnosis8TBox = qGetIntakeHCPC.hcpcDiagnosis8TBox;
							
				variables.instance.hcpcCost8TBox = qGetIntakeHCPC.hcpcCost8TBox;
							
				variables.instance.hcpcLengthOfNeedYear8TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear8TBox;
							
				variables.instance.hcpcLengthOfNeedMonth8TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth8TBox;
							
				variables.instance.hcpcCode9TBox = qGetIntakeHCPC.hcpcCode9TBox;
							
				variables.instance.hcpcQty9TBox = qGetIntakeHCPC.hcpcQty9TBox;
							
				variables.instance.hcpcProduct9TBox = qGetIntakeHCPC.hcpcProduct9TBox;
							
				variables.instance.hcpcDX9TBox = qGetIntakeHCPC.hcpcDX9TBox;
							
				variables.instance.hcpcDiagnosis9TBox = qGetIntakeHCPC.hcpcDiagnosis9TBox;
							
				variables.instance.hcpcCost9TBox = qGetIntakeHCPC.hcpcCost9TBox;
							
				variables.instance.hcpcLengthOfNeedYear9TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear9TBox;
							
				variables.instance.hcpcLengthOfNeedMonth9TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth9TBox;
							
				variables.instance.hcpcCode10TBox = qGetIntakeHCPC.hcpcCode10TBox;
							
				variables.instance.hcpcQty10TBox = qGetIntakeHCPC.hcpcQty10TBox;
							
				variables.instance.hcpcProduct10TBox = qGetIntakeHCPC.hcpcProduct10TBox;
							
				variables.instance.hcpcDX10TBox = qGetIntakeHCPC.hcpcDX10TBox;
							
				variables.instance.hcpcDiagnosis10TBox = qGetIntakeHCPC.hcpcDiagnosis10TBox;
							
				variables.instance.hcpcCost10TBox = qGetIntakeHCPC.hcpcCost10TBox;
							
				variables.instance.hcpcLengthOfNeedYear10TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear10TBox;
							
				variables.instance.hcpcLengthOfNeedMonth10TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth10TBox;
							
				variables.instance.hcpcCode11TBox = qGetIntakeHCPC.hcpcCode11TBox;
							
				variables.instance.hcpcQty11TBox = qGetIntakeHCPC.hcpcQty11TBox;
							
				variables.instance.hcpcProduct11TBox = qGetIntakeHCPC.hcpcProduct11TBox;
							
				variables.instance.hcpcDX11TBox = qGetIntakeHCPC.hcpcDX11TBox;
							
				variables.instance.hcpcDiagnosis11TBox = qGetIntakeHCPC.hcpcDiagnosis11TBox;
							
				variables.instance.hcpcCost11TBox = qGetIntakeHCPC.hcpcCost11TBox;
							
				variables.instance.hcpcLengthOfNeedYear11TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear11TBox;
							
				variables.instance.hcpcLengthOfNeedMonth11TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth11TBox;
							
				variables.instance.hcpcCode12TBox = qGetIntakeHCPC.hcpcCode12TBox;
							
				variables.instance.hcpcQty12TBox = qGetIntakeHCPC.hcpcQty12TBox;
							
				variables.instance.hcpcProduct12TBox = qGetIntakeHCPC.hcpcProduct12TBox;
							
				variables.instance.hcpcDX12TBox = qGetIntakeHCPC.hcpcDX12TBox;
							
				variables.instance.hcpcDiagnosis12TBox = qGetIntakeHCPC.hcpcDiagnosis12TBox;
							
				variables.instance.hcpcCost12TBox = qGetIntakeHCPC.hcpcCost12TBox;
							
				variables.instance.hcpcLengthOfNeedYear12TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear12TBox;
							
				variables.instance.hcpcLengthOfNeedMonth12TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth12TBox;
							
				variables.instance.hcpcCode13TBox = qGetIntakeHCPC.hcpcCode13TBox;
							
				variables.instance.hcpcQty13TBox = qGetIntakeHCPC.hcpcQty13TBox;
							
				variables.instance.hcpcProduct13TBox = qGetIntakeHCPC.hcpcProduct13TBox;
							
				variables.instance.hcpcDX13TBox = qGetIntakeHCPC.hcpcDX13TBox;
							
				variables.instance.hcpcDiagnosis13TBox = qGetIntakeHCPC.hcpcDiagnosis13TBox;
							
				variables.instance.hcpcCost13TBox = qGetIntakeHCPC.hcpcCost13TBox;
							
				variables.instance.hcpcLengthOfNeedYear13TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear13TBox;
							
				variables.instance.hcpcLengthOfNeedMonth13TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth13TBox;
							
				variables.instance.hcpcCode14TBox = qGetIntakeHCPC.hcpcCode14TBox;
							
				variables.instance.hcpcQty14TBox = qGetIntakeHCPC.hcpcQty14TBox;
							
				variables.instance.hcpcProduct14TBox = qGetIntakeHCPC.hcpcProduct14TBox;
							
				variables.instance.hcpcDX14TBox = qGetIntakeHCPC.hcpcDX14TBox;
							
				variables.instance.hcpcDiagnosis14TBox = qGetIntakeHCPC.hcpcDiagnosis14TBox;
							
				variables.instance.hcpcCost14TBox = qGetIntakeHCPC.hcpcCost14TBox;
							
				variables.instance.hcpcLengthOfNeedYear14TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear14TBox;
							
				variables.instance.hcpcLengthOfNeedMonth14TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth14TBox;
							
				variables.instance.hcpcCode15TBox = qGetIntakeHCPC.hcpcCode15TBox;
							
				variables.instance.hcpcQty15TBox = qGetIntakeHCPC.hcpcQty15TBox;
							
				variables.instance.hcpcProduct15TBox = qGetIntakeHCPC.hcpcProduct15TBox;
							
				variables.instance.hcpcDX15TBox = qGetIntakeHCPC.hcpcDX15TBox;
							
				variables.instance.hcpcDiagnosis15TBox = qGetIntakeHCPC.hcpcDiagnosis15TBox;
							
				variables.instance.hcpcCost15TBox = qGetIntakeHCPC.hcpcCost15TBox;
							
				variables.instance.hcpcLengthOfNeedYear15TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear15TBox;
							
				variables.instance.hcpcLengthOfNeedMonth15TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth15TBox;
							
				variables.instance.hcpcCode16TBox = qGetIntakeHCPC.hcpcCode16TBox;
							
				variables.instance.hcpcQty16TBox = qGetIntakeHCPC.hcpcQty16TBox;
							
				variables.instance.hcpcProduct16TBox = qGetIntakeHCPC.hcpcProduct16TBox;
							
				variables.instance.hcpcDX16TBox = qGetIntakeHCPC.hcpcDX16TBox;
							
				variables.instance.hcpcDiagnosis16TBox = qGetIntakeHCPC.hcpcDiagnosis16TBox;
							
				variables.instance.hcpcCost16TBox = qGetIntakeHCPC.hcpcCost16TBox;
							
				variables.instance.hcpcLengthOfNeedYear16TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear16TBox;
							
				variables.instance.hcpcLengthOfNeedMonth16TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth16TBox;
							
				variables.instance.hcpcCode17TBox = qGetIntakeHCPC.hcpcCode17TBox;
							
				variables.instance.hcpcQty17TBox = qGetIntakeHCPC.hcpcQty17TBox;
							
				variables.instance.hcpcProduct17TBox = qGetIntakeHCPC.hcpcProduct17TBox;
							
				variables.instance.hcpcDX17TBox = qGetIntakeHCPC.hcpcDX17TBox;
							
				variables.instance.hcpcDiagnosis17TBox = qGetIntakeHCPC.hcpcDiagnosis17TBox;
							
				variables.instance.hcpcCost17TBox = qGetIntakeHCPC.hcpcCost17TBox;
							
				variables.instance.hcpcLengthOfNeedYear17TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear17TBox;
							
				variables.instance.hcpcLengthOfNeedMonth17TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth17TBox;
							
				variables.instance.hcpcCode18TBox = qGetIntakeHCPC.hcpcCode18TBox;
							
				variables.instance.hcpcQty18TBox = qGetIntakeHCPC.hcpcQty18TBox;
							
				variables.instance.hcpcProduct18TBox = qGetIntakeHCPC.hcpcProduct18TBox;
							
				variables.instance.hcpcDX18TBox = qGetIntakeHCPC.hcpcDX18TBox;
							
				variables.instance.hcpcDiagnosis18TBox = qGetIntakeHCPC.hcpcDiagnosis18TBox;
							
				variables.instance.hcpcCost18TBox = qGetIntakeHCPC.hcpcCost18TBox;
							
				variables.instance.hcpcLengthOfNeedYear18TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear18TBox;
							
				variables.instance.hcpcLengthOfNeedMonth18TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth18TBox;
							
				variables.instance.hcpcCode19TBox = qGetIntakeHCPC.hcpcCode19TBox;
							
				variables.instance.hcpcQty19TBox = qGetIntakeHCPC.hcpcQty19TBox;
							
				variables.instance.hcpcProduct19TBox = qGetIntakeHCPC.hcpcProduct19TBox;
							
				variables.instance.hcpcDX19TBox = qGetIntakeHCPC.hcpcDX19TBox;
							
				variables.instance.hcpcDiagnosis19TBox = qGetIntakeHCPC.hcpcDiagnosis19TBox;
							
				variables.instance.hcpcCost19TBox = qGetIntakeHCPC.hcpcCost19TBox;
							
				variables.instance.hcpcLengthOfNeedYear19TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear19TBox;
							
				variables.instance.hcpcLengthOfNeedMonth19TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth19TBox;
							
				variables.instance.hcpcCode20TBox = qGetIntakeHCPC.hcpcCode20TBox;
							
				variables.instance.hcpcQty20TBox = qGetIntakeHCPC.hcpcQty20TBox;
							
				variables.instance.hcpcProduct20TBox = qGetIntakeHCPC.hcpcProduct20TBox;
							
				variables.instance.hcpcDX20TBox = qGetIntakeHCPC.hcpcDX20TBox;
							
				variables.instance.hcpcDiagnosis20TBox = qGetIntakeHCPC.hcpcDiagnosis20TBox;
							
				variables.instance.hcpcCost20TBox = qGetIntakeHCPC.hcpcCost20TBox;
							
				variables.instance.hcpcLengthOfNeedYear20TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear20TBox;
							
				variables.instance.hcpcLengthOfNeedMonth20TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth20TBox;
							
				variables.instance.hcpcCode21TBox = qGetIntakeHCPC.hcpcCode21TBox;
							
				variables.instance.hcpcQty21TBox = qGetIntakeHCPC.hcpcQty21TBox;
							
				variables.instance.hcpcProduct21TBox = qGetIntakeHCPC.hcpcProduct21TBox;
							
				variables.instance.hcpcDX21TBox = qGetIntakeHCPC.hcpcDX21TBox;
							
				variables.instance.hcpcDiagnosis21TBox = qGetIntakeHCPC.hcpcDiagnosis21TBox;
							
				variables.instance.hcpcCost21TBox = qGetIntakeHCPC.hcpcCost21TBox;
							
				variables.instance.hcpcLengthOfNeedYear21TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear21TBox;
							
				variables.instance.hcpcLengthOfNeedMonth21TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth21TBox;
							
				variables.instance.hcpcCode22TBox = qGetIntakeHCPC.hcpcCode22TBox;
							
				variables.instance.hcpcQty22TBox = qGetIntakeHCPC.hcpcQty22TBox;
							
				variables.instance.hcpcProduct22TBox = qGetIntakeHCPC.hcpcProduct22TBox;
							
				variables.instance.hcpcDX22TBox = qGetIntakeHCPC.hcpcDX22TBox;
							
				variables.instance.hcpcDiagnosis22TBox = qGetIntakeHCPC.hcpcDiagnosis22TBox;
							
				variables.instance.hcpcCost22TBox = qGetIntakeHCPC.hcpcCost22TBox;
							
				variables.instance.hcpcLengthOfNeedYear22TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear22TBox;
							
				variables.instance.hcpcLengthOfNeedMonth22TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth22TBox;
							
				variables.instance.hcpcCode23TBox = qGetIntakeHCPC.hcpcCode23TBox;
							
				variables.instance.hcpcQty23TBox = qGetIntakeHCPC.hcpcQty23TBox;
							
				variables.instance.hcpcProduct23TBox = qGetIntakeHCPC.hcpcProduct23TBox;
							
				variables.instance.hcpcDX23TBox = qGetIntakeHCPC.hcpcDX23TBox;
							
				variables.instance.hcpcDiagnosis23TBox = qGetIntakeHCPC.hcpcDiagnosis23TBox;
							
				variables.instance.hcpcCost23TBox = qGetIntakeHCPC.hcpcCost23TBox;
							
				variables.instance.hcpcLengthOfNeedYear23TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear23TBox;
							
				variables.instance.hcpcLengthOfNeedMonth23TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth23TBox;
							
				variables.instance.hcpcCode24TBox = qGetIntakeHCPC.hcpcCode24TBox;
							
				variables.instance.hcpcQty24TBox = qGetIntakeHCPC.hcpcQty24TBox;
							
				variables.instance.hcpcProduct24TBox = qGetIntakeHCPC.hcpcProduct24TBox;
							
				variables.instance.hcpcDX24TBox = qGetIntakeHCPC.hcpcDX24TBox;
							
				variables.instance.hcpcDiagnosis24TBox = qGetIntakeHCPC.hcpcDiagnosis24TBox;
							
				variables.instance.hcpcCost24TBox = qGetIntakeHCPC.hcpcCost24TBox;
							
				variables.instance.hcpcLengthOfNeedYear24TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear24TBox;
							
				variables.instance.hcpcLengthOfNeedMonth24TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth24TBox;
							
				variables.instance.hcpcCode25TBox = qGetIntakeHCPC.hcpcCode25TBox;
							
				variables.instance.hcpcQty25TBox = qGetIntakeHCPC.hcpcQty25TBox;
							
				variables.instance.hcpcProduct25TBox = qGetIntakeHCPC.hcpcProduct25TBox;
							
				variables.instance.hcpcDX25TBox = qGetIntakeHCPC.hcpcDX25TBox;
							
				variables.instance.hcpcDiagnosis25TBox = qGetIntakeHCPC.hcpcDiagnosis25TBox;
							
				variables.instance.hcpcCost25TBox = qGetIntakeHCPC.hcpcCost25TBox;
							
				variables.instance.hcpcLengthOfNeedYear25TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear25TBox;
							
				variables.instance.hcpcLengthOfNeedMonth25TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth25TBox;
							
				variables.instance.hcpcCode26TBox = qGetIntakeHCPC.hcpcCode26TBox;
							
				variables.instance.hcpcQty26TBox = qGetIntakeHCPC.hcpcQty26TBox;
							
				variables.instance.hcpcProduct26TBox = qGetIntakeHCPC.hcpcProduct26TBox;
							
				variables.instance.hcpcDX26TBox = qGetIntakeHCPC.hcpcDX26TBox;
							
				variables.instance.hcpcDiagnosis26TBox = qGetIntakeHCPC.hcpcDiagnosis26TBox;
							
				variables.instance.hcpcCost26TBox = qGetIntakeHCPC.hcpcCost26TBox;
							
				variables.instance.hcpcLengthOfNeedYear26TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear26TBox;
							
				variables.instance.hcpcLengthOfNeedMonth26TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth26TBox;
							
				variables.instance.hcpcCode27TBox = qGetIntakeHCPC.hcpcCode27TBox;
							
				variables.instance.hcpcQty27TBox = qGetIntakeHCPC.hcpcQty27TBox;
							
				variables.instance.hcpcProduct27TBox = qGetIntakeHCPC.hcpcProduct27TBox;
							
				variables.instance.hcpcDX27TBox = qGetIntakeHCPC.hcpcDX27TBox;
							
				variables.instance.hcpcDiagnosis27TBox = qGetIntakeHCPC.hcpcDiagnosis27TBox;
							
				variables.instance.hcpcCost27TBox = qGetIntakeHCPC.hcpcCost27TBox;
							
				variables.instance.hcpcLengthOfNeedYear27TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear27TBox;
							
				variables.instance.hcpcLengthOfNeedMonth27TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth27TBox;
							
				variables.instance.hcpcCode28TBox = qGetIntakeHCPC.hcpcCode28TBox;
							
				variables.instance.hcpcQty28TBox = qGetIntakeHCPC.hcpcQty28TBox;
							
				variables.instance.hcpcProduct28TBox = qGetIntakeHCPC.hcpcProduct28TBox;
							
				variables.instance.hcpcDX28TBox = qGetIntakeHCPC.hcpcDX28TBox;
							
				variables.instance.hcpcDiagnosis28TBox = qGetIntakeHCPC.hcpcDiagnosis28TBox;
							
				variables.instance.hcpcCost28TBox = qGetIntakeHCPC.hcpcCost28TBox;
							
				variables.instance.hcpcLengthOfNeedYear28TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear28TBox;
							
				variables.instance.hcpcLengthOfNeedMonth28TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth28TBox;
							
				variables.instance.hcpcCode29TBox = qGetIntakeHCPC.hcpcCode29TBox;
							
				variables.instance.hcpcQty29TBox = qGetIntakeHCPC.hcpcQty29TBox;
							
				variables.instance.hcpcProduct29TBox = qGetIntakeHCPC.hcpcProduct29TBox;
							
				variables.instance.hcpcDX29TBox = qGetIntakeHCPC.hcpcDX29TBox;
							
				variables.instance.hcpcDiagnosis29TBox = qGetIntakeHCPC.hcpcDiagnosis29TBox;
							
				variables.instance.hcpcCost29TBox = qGetIntakeHCPC.hcpcCost29TBox;
							
				variables.instance.hcpcLengthOfNeedYear29TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear29TBox;
							
				variables.instance.hcpcLengthOfNeedMonth29TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth29TBox;
							
				variables.instance.hcpcCode30TBox = qGetIntakeHCPC.hcpcCode30TBox;
							
				variables.instance.hcpcQty30TBox = qGetIntakeHCPC.hcpcQty30TBox;
							
				variables.instance.hcpcProduct30TBox = qGetIntakeHCPC.hcpcProduct30TBox;
							
				variables.instance.hcpcDX30TBox = qGetIntakeHCPC.hcpcDX30TBox;
							
				variables.instance.hcpcDiagnosis30TBox = qGetIntakeHCPC.hcpcDiagnosis30TBox;
							
				variables.instance.hcpcCost30TBox = qGetIntakeHCPC.hcpcCost30TBox;
							
				variables.instance.hcpcLengthOfNeedYear30TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear30TBox;
							
				variables.instance.hcpcLengthOfNeedMonth30TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth30TBox;
							
				variables.instance.hcpcCode31TBox = qGetIntakeHCPC.hcpcCode31TBox;
							
				variables.instance.hcpcQty31TBox = qGetIntakeHCPC.hcpcQty31TBox;
							
				variables.instance.hcpcProduct31TBox = qGetIntakeHCPC.hcpcProduct31TBox;
							
				variables.instance.hcpcDX31TBox = qGetIntakeHCPC.hcpcDX31TBox;
							
				variables.instance.hcpcDiagnosis31TBox = qGetIntakeHCPC.hcpcDiagnosis31TBox;
							
				variables.instance.hcpcCost31TBox = qGetIntakeHCPC.hcpcCost31TBox;
							
				variables.instance.hcpcLengthOfNeedYear31TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear31TBox;
							
				variables.instance.hcpcLengthOfNeedMonth31TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth31TBox;
							
				variables.instance.hcpcCode32TBox = qGetIntakeHCPC.hcpcCode32TBox;
							
				variables.instance.hcpcQty32TBox = qGetIntakeHCPC.hcpcQty32TBox;
							
				variables.instance.hcpcProduct32TBox = qGetIntakeHCPC.hcpcProduct32TBox;
							
				variables.instance.hcpcDX32TBox = qGetIntakeHCPC.hcpcDX32TBox;
							
				variables.instance.hcpcDiagnosis32TBox = qGetIntakeHCPC.hcpcDiagnosis32TBox;
							
				variables.instance.hcpcCost32TBox = qGetIntakeHCPC.hcpcCost32TBox;
							
				variables.instance.hcpcLengthOfNeedYear32TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear32TBox;
							
				variables.instance.hcpcLengthOfNeedMonth32TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth32TBox;
							
				variables.instance.hcpcCode33TBox = qGetIntakeHCPC.hcpcCode33TBox;
							
				variables.instance.hcpcQty33TBox = qGetIntakeHCPC.hcpcQty33TBox;
							
				variables.instance.hcpcProduct33TBox = qGetIntakeHCPC.hcpcProduct33TBox;
							
				variables.instance.hcpcDX33TBox = qGetIntakeHCPC.hcpcDX33TBox;
							
				variables.instance.hcpcDiagnosis33TBox = qGetIntakeHCPC.hcpcDiagnosis33TBox;
							
				variables.instance.hcpcCost33TBox = qGetIntakeHCPC.hcpcCost33TBox;
							
				variables.instance.hcpcLengthOfNeedYear33TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear33TBox;
							
				variables.instance.hcpcLengthOfNeedMonth33TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth33TBox;
							
				variables.instance.hcpcCode34TBox = qGetIntakeHCPC.hcpcCode34TBox;
							
				variables.instance.hcpcQty34TBox = qGetIntakeHCPC.hcpcQty34TBox;
							
				variables.instance.hcpcProduct34TBox = qGetIntakeHCPC.hcpcProduct34TBox;
							
				variables.instance.hcpcDX34TBox = qGetIntakeHCPC.hcpcDX34TBox;
							
				variables.instance.hcpcDiagnosis34TBox = qGetIntakeHCPC.hcpcDiagnosis34TBox;
							
				variables.instance.hcpcCost34TBox = qGetIntakeHCPC.hcpcCost34TBox;
							
				variables.instance.hcpcLengthOfNeedYear34TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear34TBox;
							
				variables.instance.hcpcLengthOfNeedMonth34TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth34TBox;
							
				variables.instance.hcpcCode35TBox = qGetIntakeHCPC.hcpcCode35TBox;
							
				variables.instance.hcpcQty35TBox = qGetIntakeHCPC.hcpcQty35TBox;
							
				variables.instance.hcpcProduct35TBox = qGetIntakeHCPC.hcpcProduct35TBox;
							
				variables.instance.hcpcDX35TBox = qGetIntakeHCPC.hcpcDX35TBox;
							
				variables.instance.hcpcDiagnosis35TBox = qGetIntakeHCPC.hcpcDiagnosis35TBox;
							
				variables.instance.hcpcCost35TBox = qGetIntakeHCPC.hcpcCost35TBox;
							
				variables.instance.hcpcLengthOfNeedYear35TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear35TBox;
							
				variables.instance.hcpcLengthOfNeedMonth35TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth35TBox;
							
				variables.instance.hcpcCode36TBox = qGetIntakeHCPC.hcpcCode36TBox;
							
				variables.instance.hcpcQty36TBox = qGetIntakeHCPC.hcpcQty36TBox;
							
				variables.instance.hcpcProduct36TBox = qGetIntakeHCPC.hcpcProduct36TBox;
							
				variables.instance.hcpcDX36TBox = qGetIntakeHCPC.hcpcDX36TBox;
							
				variables.instance.hcpcDiagnosis36TBox = qGetIntakeHCPC.hcpcDiagnosis36TBox;
							
				variables.instance.hcpcCost36TBox = qGetIntakeHCPC.hcpcCost36TBox;
							
				variables.instance.hcpcLengthOfNeedYear36TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear36TBox;
							
				variables.instance.hcpcLengthOfNeedMonth36TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth36TBox;
							
				variables.instance.hcpcCode37TBox = qGetIntakeHCPC.hcpcCode37TBox;
							
				variables.instance.hcpcQty37TBox = qGetIntakeHCPC.hcpcQty37TBox;
							
				variables.instance.hcpcProduct37TBox = qGetIntakeHCPC.hcpcProduct37TBox;
							
				variables.instance.hcpcDX37TBox = qGetIntakeHCPC.hcpcDX37TBox;
							
				variables.instance.hcpcDiagnosis37TBox = qGetIntakeHCPC.hcpcDiagnosis37TBox;
							
				variables.instance.hcpcCost37TBox = qGetIntakeHCPC.hcpcCost37TBox;
							
				variables.instance.hcpcLengthOfNeedYear37TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear37TBox;
							
				variables.instance.hcpcLengthOfNeedMonth37TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth37TBox;
							
				variables.instance.hcpcCode38TBox = qGetIntakeHCPC.hcpcCode38TBox;
							
				variables.instance.hcpcQty38TBox = qGetIntakeHCPC.hcpcQty38TBox;
							
				variables.instance.hcpcProduct38TBox = qGetIntakeHCPC.hcpcProduct38TBox;
							
				variables.instance.hcpcDX38TBox = qGetIntakeHCPC.hcpcDX38TBox;
							
				variables.instance.hcpcDiagnosis38TBox = qGetIntakeHCPC.hcpcDiagnosis38TBox;
							
				variables.instance.hcpcCost38TBox = qGetIntakeHCPC.hcpcCost38TBox;
							
				variables.instance.hcpcLengthOfNeedYear38TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear38TBox;
							
				variables.instance.hcpcLengthOfNeedMonth38TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth38TBox;
							
				variables.instance.hcpcCode39TBox = qGetIntakeHCPC.hcpcCode39TBox;
							
				variables.instance.hcpcQty39TBox = qGetIntakeHCPC.hcpcQty39TBox;
							
				variables.instance.hcpcProduct39TBox = qGetIntakeHCPC.hcpcProduct39TBox;
							
				variables.instance.hcpcDX39TBox = qGetIntakeHCPC.hcpcDX39TBox;
							
				variables.instance.hcpcDiagnosis39TBox = qGetIntakeHCPC.hcpcDiagnosis39TBox;
							
				variables.instance.hcpcCost39TBox = qGetIntakeHCPC.hcpcCost39TBox;
							
				variables.instance.hcpcLengthOfNeedYear39TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear39TBox;
							
				variables.instance.hcpcLengthOfNeedMonth39TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth39TBox;
							
				variables.instance.hcpcCode40TBox = qGetIntakeHCPC.hcpcCode40TBox;
							
				variables.instance.hcpcQty40TBox = qGetIntakeHCPC.hcpcQty40TBox;
							
				variables.instance.hcpcProduct40TBox = qGetIntakeHCPC.hcpcProduct40TBox;
							
				variables.instance.hcpcDX40TBox = qGetIntakeHCPC.hcpcDX40TBox;
							
				variables.instance.hcpcDiagnosis40TBox = qGetIntakeHCPC.hcpcDiagnosis40TBox;
							
				variables.instance.hcpcCost40TBox = qGetIntakeHCPC.hcpcCost40TBox;
							
				variables.instance.hcpcLengthOfNeedYear40TBox = qGetIntakeHCPC.hcpcLengthOfNeedYear40TBox;
							
				variables.instance.hcpcLengthOfNeedMonth40TBox = qGetIntakeHCPC.hcpcLengthOfNeedMonth40TBox;
							
				variables.instance.Active = qGetIntakeHCPC.Active;
				
			IF(qGetIntakeHCPC.InactiveCode EQ "" OR qGetIntakeHCPC.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetIntakeHCPC.InactiveCode;
							
				variables.instance.DateCreated = qGetIntakeHCPC.DateCreated;
							
				variables.instance.DateModified = qGetIntakeHCPC.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(IntakeHCPCID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitIntakeHCPC = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.IntakeHCPCID) AND variables.instance.IntakeHCPCID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitIntakeHCPC" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitIntakeHCPC" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.IntakeHCPCID = qInsertCommitIntakeHCPC.IntakeHCPCID>
				
				<cfreturn qInsertCommitIntakeHCPC.IntakeHCPCID>
			
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
			<cfset tableColumns = "IntakeHCPCID,IntakeID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active">	
			
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
				<cfset sqlStatement = "UPDATE intakehcpc  SET #columnsToUpdate# WHERE IntakeHCPCID = #trim(variables.instance.IntakeHCPCID)#">
				
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
			<cfset stringTableColumns = "hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active">	
			
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
			<cfloop list="IntakeID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO intakehcpc  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS IntakeHCPCID ">
				
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
	<cffunction name="getIntakeHCPCQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getIntakeHCPCQuery">						
		<cfargument name="Fields" required="No" type="String" default="IntakeHCPCID,IntakeID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="IntakeHCPCID" required="No" type="String" default="">
		<cfargument name="IntakeHCPCID_IN" required="No" type="String" default="">
		<cfargument name="IntakeHCPCID_LIKE" required="No" type="String" default="">
		<cfargument name="IntakeID" required="No" type="String" default="">
		<cfargument name="IntakeID_IN" required="No" type="String" default="">
		<cfargument name="IntakeID_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost1TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost2TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost3TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost4TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost5TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost6TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost7TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost8TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost9TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost10TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode11TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty11TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct11TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX11TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis11TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost11TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear11TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth11TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth11TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth11TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode12TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty12TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct12TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX12TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis12TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost12TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear12TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth12TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth12TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth12TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode13TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty13TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct13TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX13TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis13TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost13TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear13TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth13TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth13TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth13TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode14TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty14TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct14TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX14TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis14TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost14TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear14TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth14TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth14TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth14TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode15TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty15TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct15TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX15TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis15TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost15TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear15TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth15TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth15TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth15TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode16TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty16TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct16TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX16TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis16TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost16TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear16TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth16TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth16TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth16TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode17TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty17TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct17TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX17TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis17TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost17TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear17TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth17TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth17TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth17TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode18TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty18TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct18TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX18TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis18TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost18TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear18TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth18TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth18TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth18TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode19TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty19TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct19TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX19TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis19TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost19TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear19TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth19TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth19TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth19TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode20TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty20TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct20TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX20TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis20TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost20TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear20TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth20TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth20TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth20TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode21TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty21TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct21TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX21TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis21TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost21TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear21TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth21TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth21TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth21TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode22TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty22TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct22TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX22TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis22TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost22TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear22TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth22TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth22TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth22TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode23TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty23TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct23TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX23TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis23TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost23TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear23TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth23TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth23TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth23TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode24TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty24TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct24TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX24TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis24TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost24TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear24TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth24TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth24TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth24TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode25TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty25TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct25TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX25TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis25TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost25TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear25TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth25TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth25TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth25TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode26TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty26TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct26TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX26TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis26TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost26TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear26TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth26TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth26TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth26TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode27TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty27TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct27TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX27TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis27TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost27TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear27TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth27TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth27TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth27TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode28TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty28TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct28TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX28TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis28TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost28TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear28TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth28TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth28TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth28TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode29TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty29TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct29TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX29TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis29TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost29TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear29TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth29TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth29TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth29TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode30TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty30TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct30TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX30TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis30TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost30TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear30TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth30TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth30TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth30TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode31TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty31TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct31TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX31TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis31TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost31TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear31TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth31TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth31TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth31TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode32TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty32TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct32TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX32TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis32TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost32TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear32TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth32TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth32TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth32TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode33TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty33TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct33TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX33TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis33TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost33TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear33TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth33TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth33TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth33TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode34TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty34TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct34TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX34TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis34TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost34TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear34TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth34TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth34TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth34TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode35TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty35TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct35TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX35TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis35TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost35TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear35TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth35TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth35TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth35TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode36TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty36TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct36TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX36TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis36TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost36TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear36TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth36TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth36TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth36TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode37TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty37TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct37TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX37TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis37TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost37TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear37TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth37TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth37TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth37TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode38TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty38TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct38TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX38TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis38TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost38TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear38TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth38TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth38TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth38TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode39TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty39TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct39TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX39TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis39TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost39TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear39TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth39TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth39TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth39TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode40TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode40TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty40TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty40TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct40TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct40TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX40TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX40TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis40TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis40TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCost40TBox" required="No" type="String" default="">
		<cfargument name="hcpcCost40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCost40TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear40TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear40TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth40TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth40TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth40TBox_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "IntakeHCPCID,IntakeHCPCID_IN,IntakeHCPCID_LIKE,IntakeID,IntakeID_IN,IntakeID_LIKE,hcpcCode1TBox,hcpcCode1TBox_IN,hcpcCode1TBox_LIKE,hcpcQty1TBox,hcpcQty1TBox_IN,hcpcQty1TBox_LIKE,hcpcProduct1TBox,hcpcProduct1TBox_IN,hcpcProduct1TBox_LIKE,hcpcDX1TBox,hcpcDX1TBox_IN,hcpcDX1TBox_LIKE,hcpcDiagnosis1TBox,hcpcDiagnosis1TBox_IN,hcpcDiagnosis1TBox_LIKE,hcpcCost1TBox,hcpcCost1TBox_IN,hcpcCost1TBox_LIKE,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedYear1TBox_IN,hcpcLengthOfNeedYear1TBox_LIKE,hcpcLengthOfNeedMonth1TBox,hcpcLengthOfNeedMonth1TBox_IN,hcpcLengthOfNeedMonth1TBox_LIKE,hcpcCode2TBox,hcpcCode2TBox_IN,hcpcCode2TBox_LIKE,hcpcQty2TBox,hcpcQty2TBox_IN,hcpcQty2TBox_LIKE,hcpcProduct2TBox,hcpcProduct2TBox_IN,hcpcProduct2TBox_LIKE,hcpcDX2TBox,hcpcDX2TBox_IN,hcpcDX2TBox_LIKE,hcpcDiagnosis2TBox,hcpcDiagnosis2TBox_IN,hcpcDiagnosis2TBox_LIKE,hcpcCost2TBox,hcpcCost2TBox_IN,hcpcCost2TBox_LIKE,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedYear2TBox_IN,hcpcLengthOfNeedYear2TBox_LIKE,hcpcLengthOfNeedMonth2TBox,hcpcLengthOfNeedMonth2TBox_IN,hcpcLengthOfNeedMonth2TBox_LIKE,hcpcCode3TBox,hcpcCode3TBox_IN,hcpcCode3TBox_LIKE,hcpcQty3TBox,hcpcQty3TBox_IN,hcpcQty3TBox_LIKE,hcpcProduct3TBox,hcpcProduct3TBox_IN,hcpcProduct3TBox_LIKE,hcpcDX3TBox,hcpcDX3TBox_IN,hcpcDX3TBox_LIKE,hcpcDiagnosis3TBox,hcpcDiagnosis3TBox_IN,hcpcDiagnosis3TBox_LIKE,hcpcCost3TBox,hcpcCost3TBox_IN,hcpcCost3TBox_LIKE,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedYear3TBox_IN,hcpcLengthOfNeedYear3TBox_LIKE,hcpcLengthOfNeedMonth3TBox,hcpcLengthOfNeedMonth3TBox_IN,hcpcLengthOfNeedMonth3TBox_LIKE,hcpcCode4TBox,hcpcCode4TBox_IN,hcpcCode4TBox_LIKE,hcpcQty4TBox,hcpcQty4TBox_IN,hcpcQty4TBox_LIKE,hcpcProduct4TBox,hcpcProduct4TBox_IN,hcpcProduct4TBox_LIKE,hcpcDX4TBox,hcpcDX4TBox_IN,hcpcDX4TBox_LIKE,hcpcDiagnosis4TBox,hcpcDiagnosis4TBox_IN,hcpcDiagnosis4TBox_LIKE,hcpcCost4TBox,hcpcCost4TBox_IN,hcpcCost4TBox_LIKE,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedYear4TBox_IN,hcpcLengthOfNeedYear4TBox_LIKE,hcpcLengthOfNeedMonth4TBox,hcpcLengthOfNeedMonth4TBox_IN,hcpcLengthOfNeedMonth4TBox_LIKE,hcpcCode5TBox,hcpcCode5TBox_IN,hcpcCode5TBox_LIKE,hcpcQty5TBox,hcpcQty5TBox_IN,hcpcQty5TBox_LIKE,hcpcProduct5TBox,hcpcProduct5TBox_IN,hcpcProduct5TBox_LIKE,hcpcDX5TBox,hcpcDX5TBox_IN,hcpcDX5TBox_LIKE,hcpcDiagnosis5TBox,hcpcDiagnosis5TBox_IN,hcpcDiagnosis5TBox_LIKE,hcpcCost5TBox,hcpcCost5TBox_IN,hcpcCost5TBox_LIKE,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedYear5TBox_IN,hcpcLengthOfNeedYear5TBox_LIKE,hcpcLengthOfNeedMonth5TBox,hcpcLengthOfNeedMonth5TBox_IN,hcpcLengthOfNeedMonth5TBox_LIKE,hcpcCode6TBox,hcpcCode6TBox_IN,hcpcCode6TBox_LIKE,hcpcQty6TBox,hcpcQty6TBox_IN,hcpcQty6TBox_LIKE,hcpcProduct6TBox,hcpcProduct6TBox_IN,hcpcProduct6TBox_LIKE,hcpcDX6TBox,hcpcDX6TBox_IN,hcpcDX6TBox_LIKE,hcpcDiagnosis6TBox,hcpcDiagnosis6TBox_IN,hcpcDiagnosis6TBox_LIKE,hcpcCost6TBox,hcpcCost6TBox_IN,hcpcCost6TBox_LIKE,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedYear6TBox_IN,hcpcLengthOfNeedYear6TBox_LIKE,hcpcLengthOfNeedMonth6TBox,hcpcLengthOfNeedMonth6TBox_IN,hcpcLengthOfNeedMonth6TBox_LIKE,hcpcCode7TBox,hcpcCode7TBox_IN,hcpcCode7TBox_LIKE,hcpcQty7TBox,hcpcQty7TBox_IN,hcpcQty7TBox_LIKE,hcpcProduct7TBox,hcpcProduct7TBox_IN,hcpcProduct7TBox_LIKE,hcpcDX7TBox,hcpcDX7TBox_IN,hcpcDX7TBox_LIKE,hcpcDiagnosis7TBox,hcpcDiagnosis7TBox_IN,hcpcDiagnosis7TBox_LIKE,hcpcCost7TBox,hcpcCost7TBox_IN,hcpcCost7TBox_LIKE,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedYear7TBox_IN,hcpcLengthOfNeedYear7TBox_LIKE,hcpcLengthOfNeedMonth7TBox,hcpcLengthOfNeedMonth7TBox_IN,hcpcLengthOfNeedMonth7TBox_LIKE,hcpcCode8TBox,hcpcCode8TBox_IN,hcpcCode8TBox_LIKE,hcpcQty8TBox,hcpcQty8TBox_IN,hcpcQty8TBox_LIKE,hcpcProduct8TBox,hcpcProduct8TBox_IN,hcpcProduct8TBox_LIKE,hcpcDX8TBox,hcpcDX8TBox_IN,hcpcDX8TBox_LIKE,hcpcDiagnosis8TBox,hcpcDiagnosis8TBox_IN,hcpcDiagnosis8TBox_LIKE,hcpcCost8TBox,hcpcCost8TBox_IN,hcpcCost8TBox_LIKE,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedYear8TBox_IN,hcpcLengthOfNeedYear8TBox_LIKE,hcpcLengthOfNeedMonth8TBox,hcpcLengthOfNeedMonth8TBox_IN,hcpcLengthOfNeedMonth8TBox_LIKE,hcpcCode9TBox,hcpcCode9TBox_IN,hcpcCode9TBox_LIKE,hcpcQty9TBox,hcpcQty9TBox_IN,hcpcQty9TBox_LIKE,hcpcProduct9TBox,hcpcProduct9TBox_IN,hcpcProduct9TBox_LIKE,hcpcDX9TBox,hcpcDX9TBox_IN,hcpcDX9TBox_LIKE,hcpcDiagnosis9TBox,hcpcDiagnosis9TBox_IN,hcpcDiagnosis9TBox_LIKE,hcpcCost9TBox,hcpcCost9TBox_IN,hcpcCost9TBox_LIKE,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedYear9TBox_IN,hcpcLengthOfNeedYear9TBox_LIKE,hcpcLengthOfNeedMonth9TBox,hcpcLengthOfNeedMonth9TBox_IN,hcpcLengthOfNeedMonth9TBox_LIKE,hcpcCode10TBox,hcpcCode10TBox_IN,hcpcCode10TBox_LIKE,hcpcQty10TBox,hcpcQty10TBox_IN,hcpcQty10TBox_LIKE,hcpcProduct10TBox,hcpcProduct10TBox_IN,hcpcProduct10TBox_LIKE,hcpcDX10TBox,hcpcDX10TBox_IN,hcpcDX10TBox_LIKE,hcpcDiagnosis10TBox,hcpcDiagnosis10TBox_IN,hcpcDiagnosis10TBox_LIKE,hcpcCost10TBox,hcpcCost10TBox_IN,hcpcCost10TBox_LIKE,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedYear10TBox_IN,hcpcLengthOfNeedYear10TBox_LIKE,hcpcLengthOfNeedMonth10TBox,hcpcLengthOfNeedMonth10TBox_IN,hcpcLengthOfNeedMonth10TBox_LIKE,hcpcCode11TBox,hcpcCode11TBox_IN,hcpcCode11TBox_LIKE,hcpcQty11TBox,hcpcQty11TBox_IN,hcpcQty11TBox_LIKE,hcpcProduct11TBox,hcpcProduct11TBox_IN,hcpcProduct11TBox_LIKE,hcpcDX11TBox,hcpcDX11TBox_IN,hcpcDX11TBox_LIKE,hcpcDiagnosis11TBox,hcpcDiagnosis11TBox_IN,hcpcDiagnosis11TBox_LIKE,hcpcCost11TBox,hcpcCost11TBox_IN,hcpcCost11TBox_LIKE,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedYear11TBox_IN,hcpcLengthOfNeedYear11TBox_LIKE,hcpcLengthOfNeedMonth11TBox,hcpcLengthOfNeedMonth11TBox_IN,hcpcLengthOfNeedMonth11TBox_LIKE,hcpcCode12TBox,hcpcCode12TBox_IN,hcpcCode12TBox_LIKE,hcpcQty12TBox,hcpcQty12TBox_IN,hcpcQty12TBox_LIKE,hcpcProduct12TBox,hcpcProduct12TBox_IN,hcpcProduct12TBox_LIKE,hcpcDX12TBox,hcpcDX12TBox_IN,hcpcDX12TBox_LIKE,hcpcDiagnosis12TBox,hcpcDiagnosis12TBox_IN,hcpcDiagnosis12TBox_LIKE,hcpcCost12TBox,hcpcCost12TBox_IN,hcpcCost12TBox_LIKE,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedYear12TBox_IN,hcpcLengthOfNeedYear12TBox_LIKE,hcpcLengthOfNeedMonth12TBox,hcpcLengthOfNeedMonth12TBox_IN,hcpcLengthOfNeedMonth12TBox_LIKE,hcpcCode13TBox,hcpcCode13TBox_IN,hcpcCode13TBox_LIKE,hcpcQty13TBox,hcpcQty13TBox_IN,hcpcQty13TBox_LIKE,hcpcProduct13TBox,hcpcProduct13TBox_IN,hcpcProduct13TBox_LIKE,hcpcDX13TBox,hcpcDX13TBox_IN,hcpcDX13TBox_LIKE,hcpcDiagnosis13TBox,hcpcDiagnosis13TBox_IN,hcpcDiagnosis13TBox_LIKE,hcpcCost13TBox,hcpcCost13TBox_IN,hcpcCost13TBox_LIKE,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedYear13TBox_IN,hcpcLengthOfNeedYear13TBox_LIKE,hcpcLengthOfNeedMonth13TBox,hcpcLengthOfNeedMonth13TBox_IN,hcpcLengthOfNeedMonth13TBox_LIKE,hcpcCode14TBox,hcpcCode14TBox_IN,hcpcCode14TBox_LIKE,hcpcQty14TBox,hcpcQty14TBox_IN,hcpcQty14TBox_LIKE,hcpcProduct14TBox,hcpcProduct14TBox_IN,hcpcProduct14TBox_LIKE,hcpcDX14TBox,hcpcDX14TBox_IN,hcpcDX14TBox_LIKE,hcpcDiagnosis14TBox,hcpcDiagnosis14TBox_IN,hcpcDiagnosis14TBox_LIKE,hcpcCost14TBox,hcpcCost14TBox_IN,hcpcCost14TBox_LIKE,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedYear14TBox_IN,hcpcLengthOfNeedYear14TBox_LIKE,hcpcLengthOfNeedMonth14TBox,hcpcLengthOfNeedMonth14TBox_IN,hcpcLengthOfNeedMonth14TBox_LIKE,hcpcCode15TBox,hcpcCode15TBox_IN,hcpcCode15TBox_LIKE,hcpcQty15TBox,hcpcQty15TBox_IN,hcpcQty15TBox_LIKE,hcpcProduct15TBox,hcpcProduct15TBox_IN,hcpcProduct15TBox_LIKE,hcpcDX15TBox,hcpcDX15TBox_IN,hcpcDX15TBox_LIKE,hcpcDiagnosis15TBox,hcpcDiagnosis15TBox_IN,hcpcDiagnosis15TBox_LIKE,hcpcCost15TBox,hcpcCost15TBox_IN,hcpcCost15TBox_LIKE,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedYear15TBox_IN,hcpcLengthOfNeedYear15TBox_LIKE,hcpcLengthOfNeedMonth15TBox,hcpcLengthOfNeedMonth15TBox_IN,hcpcLengthOfNeedMonth15TBox_LIKE,hcpcCode16TBox,hcpcCode16TBox_IN,hcpcCode16TBox_LIKE,hcpcQty16TBox,hcpcQty16TBox_IN,hcpcQty16TBox_LIKE,hcpcProduct16TBox,hcpcProduct16TBox_IN,hcpcProduct16TBox_LIKE,hcpcDX16TBox,hcpcDX16TBox_IN,hcpcDX16TBox_LIKE,hcpcDiagnosis16TBox,hcpcDiagnosis16TBox_IN,hcpcDiagnosis16TBox_LIKE,hcpcCost16TBox,hcpcCost16TBox_IN,hcpcCost16TBox_LIKE,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedYear16TBox_IN,hcpcLengthOfNeedYear16TBox_LIKE,hcpcLengthOfNeedMonth16TBox,hcpcLengthOfNeedMonth16TBox_IN,hcpcLengthOfNeedMonth16TBox_LIKE,hcpcCode17TBox,hcpcCode17TBox_IN,hcpcCode17TBox_LIKE,hcpcQty17TBox,hcpcQty17TBox_IN,hcpcQty17TBox_LIKE,hcpcProduct17TBox,hcpcProduct17TBox_IN,hcpcProduct17TBox_LIKE,hcpcDX17TBox,hcpcDX17TBox_IN,hcpcDX17TBox_LIKE,hcpcDiagnosis17TBox,hcpcDiagnosis17TBox_IN,hcpcDiagnosis17TBox_LIKE,hcpcCost17TBox,hcpcCost17TBox_IN,hcpcCost17TBox_LIKE,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedYear17TBox_IN,hcpcLengthOfNeedYear17TBox_LIKE,hcpcLengthOfNeedMonth17TBox,hcpcLengthOfNeedMonth17TBox_IN,hcpcLengthOfNeedMonth17TBox_LIKE,hcpcCode18TBox,hcpcCode18TBox_IN,hcpcCode18TBox_LIKE,hcpcQty18TBox,hcpcQty18TBox_IN,hcpcQty18TBox_LIKE,hcpcProduct18TBox,hcpcProduct18TBox_IN,hcpcProduct18TBox_LIKE,hcpcDX18TBox,hcpcDX18TBox_IN,hcpcDX18TBox_LIKE,hcpcDiagnosis18TBox,hcpcDiagnosis18TBox_IN,hcpcDiagnosis18TBox_LIKE,hcpcCost18TBox,hcpcCost18TBox_IN,hcpcCost18TBox_LIKE,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedYear18TBox_IN,hcpcLengthOfNeedYear18TBox_LIKE,hcpcLengthOfNeedMonth18TBox,hcpcLengthOfNeedMonth18TBox_IN,hcpcLengthOfNeedMonth18TBox_LIKE,hcpcCode19TBox,hcpcCode19TBox_IN,hcpcCode19TBox_LIKE,hcpcQty19TBox,hcpcQty19TBox_IN,hcpcQty19TBox_LIKE,hcpcProduct19TBox,hcpcProduct19TBox_IN,hcpcProduct19TBox_LIKE,hcpcDX19TBox,hcpcDX19TBox_IN,hcpcDX19TBox_LIKE,hcpcDiagnosis19TBox,hcpcDiagnosis19TBox_IN,hcpcDiagnosis19TBox_LIKE,hcpcCost19TBox,hcpcCost19TBox_IN,hcpcCost19TBox_LIKE,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedYear19TBox_IN,hcpcLengthOfNeedYear19TBox_LIKE,hcpcLengthOfNeedMonth19TBox,hcpcLengthOfNeedMonth19TBox_IN,hcpcLengthOfNeedMonth19TBox_LIKE,hcpcCode20TBox,hcpcCode20TBox_IN,hcpcCode20TBox_LIKE,hcpcQty20TBox,hcpcQty20TBox_IN,hcpcQty20TBox_LIKE,hcpcProduct20TBox,hcpcProduct20TBox_IN,hcpcProduct20TBox_LIKE,hcpcDX20TBox,hcpcDX20TBox_IN,hcpcDX20TBox_LIKE,hcpcDiagnosis20TBox,hcpcDiagnosis20TBox_IN,hcpcDiagnosis20TBox_LIKE,hcpcCost20TBox,hcpcCost20TBox_IN,hcpcCost20TBox_LIKE,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedYear20TBox_IN,hcpcLengthOfNeedYear20TBox_LIKE,hcpcLengthOfNeedMonth20TBox,hcpcLengthOfNeedMonth20TBox_IN,hcpcLengthOfNeedMonth20TBox_LIKE,hcpcCode21TBox,hcpcCode21TBox_IN,hcpcCode21TBox_LIKE,hcpcQty21TBox,hcpcQty21TBox_IN,hcpcQty21TBox_LIKE,hcpcProduct21TBox,hcpcProduct21TBox_IN,hcpcProduct21TBox_LIKE,hcpcDX21TBox,hcpcDX21TBox_IN,hcpcDX21TBox_LIKE,hcpcDiagnosis21TBox,hcpcDiagnosis21TBox_IN,hcpcDiagnosis21TBox_LIKE,hcpcCost21TBox,hcpcCost21TBox_IN,hcpcCost21TBox_LIKE,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedYear21TBox_IN,hcpcLengthOfNeedYear21TBox_LIKE,hcpcLengthOfNeedMonth21TBox,hcpcLengthOfNeedMonth21TBox_IN,hcpcLengthOfNeedMonth21TBox_LIKE,hcpcCode22TBox,hcpcCode22TBox_IN,hcpcCode22TBox_LIKE,hcpcQty22TBox,hcpcQty22TBox_IN,hcpcQty22TBox_LIKE,hcpcProduct22TBox,hcpcProduct22TBox_IN,hcpcProduct22TBox_LIKE,hcpcDX22TBox,hcpcDX22TBox_IN,hcpcDX22TBox_LIKE,hcpcDiagnosis22TBox,hcpcDiagnosis22TBox_IN,hcpcDiagnosis22TBox_LIKE,hcpcCost22TBox,hcpcCost22TBox_IN,hcpcCost22TBox_LIKE,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedYear22TBox_IN,hcpcLengthOfNeedYear22TBox_LIKE,hcpcLengthOfNeedMonth22TBox,hcpcLengthOfNeedMonth22TBox_IN,hcpcLengthOfNeedMonth22TBox_LIKE,hcpcCode23TBox,hcpcCode23TBox_IN,hcpcCode23TBox_LIKE,hcpcQty23TBox,hcpcQty23TBox_IN,hcpcQty23TBox_LIKE,hcpcProduct23TBox,hcpcProduct23TBox_IN,hcpcProduct23TBox_LIKE,hcpcDX23TBox,hcpcDX23TBox_IN,hcpcDX23TBox_LIKE,hcpcDiagnosis23TBox,hcpcDiagnosis23TBox_IN,hcpcDiagnosis23TBox_LIKE,hcpcCost23TBox,hcpcCost23TBox_IN,hcpcCost23TBox_LIKE,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedYear23TBox_IN,hcpcLengthOfNeedYear23TBox_LIKE,hcpcLengthOfNeedMonth23TBox,hcpcLengthOfNeedMonth23TBox_IN,hcpcLengthOfNeedMonth23TBox_LIKE,hcpcCode24TBox,hcpcCode24TBox_IN,hcpcCode24TBox_LIKE,hcpcQty24TBox,hcpcQty24TBox_IN,hcpcQty24TBox_LIKE,hcpcProduct24TBox,hcpcProduct24TBox_IN,hcpcProduct24TBox_LIKE,hcpcDX24TBox,hcpcDX24TBox_IN,hcpcDX24TBox_LIKE,hcpcDiagnosis24TBox,hcpcDiagnosis24TBox_IN,hcpcDiagnosis24TBox_LIKE,hcpcCost24TBox,hcpcCost24TBox_IN,hcpcCost24TBox_LIKE,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedYear24TBox_IN,hcpcLengthOfNeedYear24TBox_LIKE,hcpcLengthOfNeedMonth24TBox,hcpcLengthOfNeedMonth24TBox_IN,hcpcLengthOfNeedMonth24TBox_LIKE,hcpcCode25TBox,hcpcCode25TBox_IN,hcpcCode25TBox_LIKE,hcpcQty25TBox,hcpcQty25TBox_IN,hcpcQty25TBox_LIKE,hcpcProduct25TBox,hcpcProduct25TBox_IN,hcpcProduct25TBox_LIKE,hcpcDX25TBox,hcpcDX25TBox_IN,hcpcDX25TBox_LIKE,hcpcDiagnosis25TBox,hcpcDiagnosis25TBox_IN,hcpcDiagnosis25TBox_LIKE,hcpcCost25TBox,hcpcCost25TBox_IN,hcpcCost25TBox_LIKE,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedYear25TBox_IN,hcpcLengthOfNeedYear25TBox_LIKE,hcpcLengthOfNeedMonth25TBox,hcpcLengthOfNeedMonth25TBox_IN,hcpcLengthOfNeedMonth25TBox_LIKE,hcpcCode26TBox,hcpcCode26TBox_IN,hcpcCode26TBox_LIKE,hcpcQty26TBox,hcpcQty26TBox_IN,hcpcQty26TBox_LIKE,hcpcProduct26TBox,hcpcProduct26TBox_IN,hcpcProduct26TBox_LIKE,hcpcDX26TBox,hcpcDX26TBox_IN,hcpcDX26TBox_LIKE,hcpcDiagnosis26TBox,hcpcDiagnosis26TBox_IN,hcpcDiagnosis26TBox_LIKE,hcpcCost26TBox,hcpcCost26TBox_IN,hcpcCost26TBox_LIKE,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedYear26TBox_IN,hcpcLengthOfNeedYear26TBox_LIKE,hcpcLengthOfNeedMonth26TBox,hcpcLengthOfNeedMonth26TBox_IN,hcpcLengthOfNeedMonth26TBox_LIKE,hcpcCode27TBox,hcpcCode27TBox_IN,hcpcCode27TBox_LIKE,hcpcQty27TBox,hcpcQty27TBox_IN,hcpcQty27TBox_LIKE,hcpcProduct27TBox,hcpcProduct27TBox_IN,hcpcProduct27TBox_LIKE,hcpcDX27TBox,hcpcDX27TBox_IN,hcpcDX27TBox_LIKE,hcpcDiagnosis27TBox,hcpcDiagnosis27TBox_IN,hcpcDiagnosis27TBox_LIKE,hcpcCost27TBox,hcpcCost27TBox_IN,hcpcCost27TBox_LIKE,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedYear27TBox_IN,hcpcLengthOfNeedYear27TBox_LIKE,hcpcLengthOfNeedMonth27TBox,hcpcLengthOfNeedMonth27TBox_IN,hcpcLengthOfNeedMonth27TBox_LIKE,hcpcCode28TBox,hcpcCode28TBox_IN,hcpcCode28TBox_LIKE,hcpcQty28TBox,hcpcQty28TBox_IN,hcpcQty28TBox_LIKE,hcpcProduct28TBox,hcpcProduct28TBox_IN,hcpcProduct28TBox_LIKE,hcpcDX28TBox,hcpcDX28TBox_IN,hcpcDX28TBox_LIKE,hcpcDiagnosis28TBox,hcpcDiagnosis28TBox_IN,hcpcDiagnosis28TBox_LIKE,hcpcCost28TBox,hcpcCost28TBox_IN,hcpcCost28TBox_LIKE,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedYear28TBox_IN,hcpcLengthOfNeedYear28TBox_LIKE,hcpcLengthOfNeedMonth28TBox,hcpcLengthOfNeedMonth28TBox_IN,hcpcLengthOfNeedMonth28TBox_LIKE,hcpcCode29TBox,hcpcCode29TBox_IN,hcpcCode29TBox_LIKE,hcpcQty29TBox,hcpcQty29TBox_IN,hcpcQty29TBox_LIKE,hcpcProduct29TBox,hcpcProduct29TBox_IN,hcpcProduct29TBox_LIKE,hcpcDX29TBox,hcpcDX29TBox_IN,hcpcDX29TBox_LIKE,hcpcDiagnosis29TBox,hcpcDiagnosis29TBox_IN,hcpcDiagnosis29TBox_LIKE,hcpcCost29TBox,hcpcCost29TBox_IN,hcpcCost29TBox_LIKE,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedYear29TBox_IN,hcpcLengthOfNeedYear29TBox_LIKE,hcpcLengthOfNeedMonth29TBox,hcpcLengthOfNeedMonth29TBox_IN,hcpcLengthOfNeedMonth29TBox_LIKE,hcpcCode30TBox,hcpcCode30TBox_IN,hcpcCode30TBox_LIKE,hcpcQty30TBox,hcpcQty30TBox_IN,hcpcQty30TBox_LIKE,hcpcProduct30TBox,hcpcProduct30TBox_IN,hcpcProduct30TBox_LIKE,hcpcDX30TBox,hcpcDX30TBox_IN,hcpcDX30TBox_LIKE,hcpcDiagnosis30TBox,hcpcDiagnosis30TBox_IN,hcpcDiagnosis30TBox_LIKE,hcpcCost30TBox,hcpcCost30TBox_IN,hcpcCost30TBox_LIKE,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedYear30TBox_IN,hcpcLengthOfNeedYear30TBox_LIKE,hcpcLengthOfNeedMonth30TBox,hcpcLengthOfNeedMonth30TBox_IN,hcpcLengthOfNeedMonth30TBox_LIKE,hcpcCode31TBox,hcpcCode31TBox_IN,hcpcCode31TBox_LIKE,hcpcQty31TBox,hcpcQty31TBox_IN,hcpcQty31TBox_LIKE,hcpcProduct31TBox,hcpcProduct31TBox_IN,hcpcProduct31TBox_LIKE,hcpcDX31TBox,hcpcDX31TBox_IN,hcpcDX31TBox_LIKE,hcpcDiagnosis31TBox,hcpcDiagnosis31TBox_IN,hcpcDiagnosis31TBox_LIKE,hcpcCost31TBox,hcpcCost31TBox_IN,hcpcCost31TBox_LIKE,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedYear31TBox_IN,hcpcLengthOfNeedYear31TBox_LIKE,hcpcLengthOfNeedMonth31TBox,hcpcLengthOfNeedMonth31TBox_IN,hcpcLengthOfNeedMonth31TBox_LIKE,hcpcCode32TBox,hcpcCode32TBox_IN,hcpcCode32TBox_LIKE,hcpcQty32TBox,hcpcQty32TBox_IN,hcpcQty32TBox_LIKE,hcpcProduct32TBox,hcpcProduct32TBox_IN,hcpcProduct32TBox_LIKE,hcpcDX32TBox,hcpcDX32TBox_IN,hcpcDX32TBox_LIKE,hcpcDiagnosis32TBox,hcpcDiagnosis32TBox_IN,hcpcDiagnosis32TBox_LIKE,hcpcCost32TBox,hcpcCost32TBox_IN,hcpcCost32TBox_LIKE,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedYear32TBox_IN,hcpcLengthOfNeedYear32TBox_LIKE,hcpcLengthOfNeedMonth32TBox,hcpcLengthOfNeedMonth32TBox_IN,hcpcLengthOfNeedMonth32TBox_LIKE,hcpcCode33TBox,hcpcCode33TBox_IN,hcpcCode33TBox_LIKE,hcpcQty33TBox,hcpcQty33TBox_IN,hcpcQty33TBox_LIKE,hcpcProduct33TBox,hcpcProduct33TBox_IN,hcpcProduct33TBox_LIKE,hcpcDX33TBox,hcpcDX33TBox_IN,hcpcDX33TBox_LIKE,hcpcDiagnosis33TBox,hcpcDiagnosis33TBox_IN,hcpcDiagnosis33TBox_LIKE,hcpcCost33TBox,hcpcCost33TBox_IN,hcpcCost33TBox_LIKE,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedYear33TBox_IN,hcpcLengthOfNeedYear33TBox_LIKE,hcpcLengthOfNeedMonth33TBox,hcpcLengthOfNeedMonth33TBox_IN,hcpcLengthOfNeedMonth33TBox_LIKE,hcpcCode34TBox,hcpcCode34TBox_IN,hcpcCode34TBox_LIKE,hcpcQty34TBox,hcpcQty34TBox_IN,hcpcQty34TBox_LIKE,hcpcProduct34TBox,hcpcProduct34TBox_IN,hcpcProduct34TBox_LIKE,hcpcDX34TBox,hcpcDX34TBox_IN,hcpcDX34TBox_LIKE,hcpcDiagnosis34TBox,hcpcDiagnosis34TBox_IN,hcpcDiagnosis34TBox_LIKE,hcpcCost34TBox,hcpcCost34TBox_IN,hcpcCost34TBox_LIKE,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedYear34TBox_IN,hcpcLengthOfNeedYear34TBox_LIKE,hcpcLengthOfNeedMonth34TBox,hcpcLengthOfNeedMonth34TBox_IN,hcpcLengthOfNeedMonth34TBox_LIKE,hcpcCode35TBox,hcpcCode35TBox_IN,hcpcCode35TBox_LIKE,hcpcQty35TBox,hcpcQty35TBox_IN,hcpcQty35TBox_LIKE,hcpcProduct35TBox,hcpcProduct35TBox_IN,hcpcProduct35TBox_LIKE,hcpcDX35TBox,hcpcDX35TBox_IN,hcpcDX35TBox_LIKE,hcpcDiagnosis35TBox,hcpcDiagnosis35TBox_IN,hcpcDiagnosis35TBox_LIKE,hcpcCost35TBox,hcpcCost35TBox_IN,hcpcCost35TBox_LIKE,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedYear35TBox_IN,hcpcLengthOfNeedYear35TBox_LIKE,hcpcLengthOfNeedMonth35TBox,hcpcLengthOfNeedMonth35TBox_IN,hcpcLengthOfNeedMonth35TBox_LIKE,hcpcCode36TBox,hcpcCode36TBox_IN,hcpcCode36TBox_LIKE,hcpcQty36TBox,hcpcQty36TBox_IN,hcpcQty36TBox_LIKE,hcpcProduct36TBox,hcpcProduct36TBox_IN,hcpcProduct36TBox_LIKE,hcpcDX36TBox,hcpcDX36TBox_IN,hcpcDX36TBox_LIKE,hcpcDiagnosis36TBox,hcpcDiagnosis36TBox_IN,hcpcDiagnosis36TBox_LIKE,hcpcCost36TBox,hcpcCost36TBox_IN,hcpcCost36TBox_LIKE,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedYear36TBox_IN,hcpcLengthOfNeedYear36TBox_LIKE,hcpcLengthOfNeedMonth36TBox,hcpcLengthOfNeedMonth36TBox_IN,hcpcLengthOfNeedMonth36TBox_LIKE,hcpcCode37TBox,hcpcCode37TBox_IN,hcpcCode37TBox_LIKE,hcpcQty37TBox,hcpcQty37TBox_IN,hcpcQty37TBox_LIKE,hcpcProduct37TBox,hcpcProduct37TBox_IN,hcpcProduct37TBox_LIKE,hcpcDX37TBox,hcpcDX37TBox_IN,hcpcDX37TBox_LIKE,hcpcDiagnosis37TBox,hcpcDiagnosis37TBox_IN,hcpcDiagnosis37TBox_LIKE,hcpcCost37TBox,hcpcCost37TBox_IN,hcpcCost37TBox_LIKE,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedYear37TBox_IN,hcpcLengthOfNeedYear37TBox_LIKE,hcpcLengthOfNeedMonth37TBox,hcpcLengthOfNeedMonth37TBox_IN,hcpcLengthOfNeedMonth37TBox_LIKE,hcpcCode38TBox,hcpcCode38TBox_IN,hcpcCode38TBox_LIKE,hcpcQty38TBox,hcpcQty38TBox_IN,hcpcQty38TBox_LIKE,hcpcProduct38TBox,hcpcProduct38TBox_IN,hcpcProduct38TBox_LIKE,hcpcDX38TBox,hcpcDX38TBox_IN,hcpcDX38TBox_LIKE,hcpcDiagnosis38TBox,hcpcDiagnosis38TBox_IN,hcpcDiagnosis38TBox_LIKE,hcpcCost38TBox,hcpcCost38TBox_IN,hcpcCost38TBox_LIKE,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedYear38TBox_IN,hcpcLengthOfNeedYear38TBox_LIKE,hcpcLengthOfNeedMonth38TBox,hcpcLengthOfNeedMonth38TBox_IN,hcpcLengthOfNeedMonth38TBox_LIKE,hcpcCode39TBox,hcpcCode39TBox_IN,hcpcCode39TBox_LIKE,hcpcQty39TBox,hcpcQty39TBox_IN,hcpcQty39TBox_LIKE,hcpcProduct39TBox,hcpcProduct39TBox_IN,hcpcProduct39TBox_LIKE,hcpcDX39TBox,hcpcDX39TBox_IN,hcpcDX39TBox_LIKE,hcpcDiagnosis39TBox,hcpcDiagnosis39TBox_IN,hcpcDiagnosis39TBox_LIKE,hcpcCost39TBox,hcpcCost39TBox_IN,hcpcCost39TBox_LIKE,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedYear39TBox_IN,hcpcLengthOfNeedYear39TBox_LIKE,hcpcLengthOfNeedMonth39TBox,hcpcLengthOfNeedMonth39TBox_IN,hcpcLengthOfNeedMonth39TBox_LIKE,hcpcCode40TBox,hcpcCode40TBox_IN,hcpcCode40TBox_LIKE,hcpcQty40TBox,hcpcQty40TBox_IN,hcpcQty40TBox_LIKE,hcpcProduct40TBox,hcpcProduct40TBox_IN,hcpcProduct40TBox_LIKE,hcpcDX40TBox,hcpcDX40TBox_IN,hcpcDX40TBox_LIKE,hcpcDiagnosis40TBox,hcpcDiagnosis40TBox_IN,hcpcDiagnosis40TBox_LIKE,hcpcCost40TBox,hcpcCost40TBox_IN,hcpcCost40TBox_LIKE,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedYear40TBox_IN,hcpcLengthOfNeedYear40TBox_LIKE,hcpcLengthOfNeedMonth40TBox,hcpcLengthOfNeedMonth40TBox_IN,hcpcLengthOfNeedMonth40TBox_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="IntakeHCPC"
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
			<cfquery Name="getIntakeHCPCQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM intakehcpc   
				WHERE 1=1
					<cfif IntakeHCPCID NEQ "" AND IsNumeric(IntakeHCPCID)>AND IntakeHCPCID = #IntakeHCPCID#</cfif>
					<cfif IntakeHCPCID_IN NEQ "">AND IntakeHCPCID IN(#trim(IntakeHCPCID_IN)#)</cfif>
					<cfif IntakeHCPCID_LIKE NEQ "">AND IntakeHCPCID LIKE '%#trim(IntakeHCPCID_LIKE)#%'</cfif>
					<cfif IntakeID NEQ "" AND IsNumeric(IntakeID)>AND IntakeID = #IntakeID#</cfif>
					<cfif IntakeID_IN NEQ "">AND IntakeID IN(#trim(IntakeID_IN)#)</cfif>
					<cfif IntakeID_LIKE NEQ "">AND IntakeID LIKE '%#trim(IntakeID_LIKE)#%'</cfif>
					<cfif hcpcCode1TBox NEQ "">AND hcpcCode1TBox = '#hcpcCode1TBox#'</cfif>
					<cfif hcpcCode1TBox_IN NEQ "">AND hcpcCode1TBox IN(#trim(hcpcCode1TBox_IN)#)</cfif>
					<cfif hcpcCode1TBox_LIKE NEQ "">AND hcpcCode1TBox LIKE '%#trim(hcpcCode1TBox_LIKE)#%'</cfif>
					<cfif hcpcQty1TBox NEQ "">AND hcpcQty1TBox = '#hcpcQty1TBox#'</cfif>
					<cfif hcpcQty1TBox_IN NEQ "">AND hcpcQty1TBox IN(#trim(hcpcQty1TBox_IN)#)</cfif>
					<cfif hcpcQty1TBox_LIKE NEQ "">AND hcpcQty1TBox LIKE '%#trim(hcpcQty1TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct1TBox NEQ "">AND hcpcProduct1TBox = '#hcpcProduct1TBox#'</cfif>
					<cfif hcpcProduct1TBox_IN NEQ "">AND hcpcProduct1TBox IN(#trim(hcpcProduct1TBox_IN)#)</cfif>
					<cfif hcpcProduct1TBox_LIKE NEQ "">AND hcpcProduct1TBox LIKE '%#trim(hcpcProduct1TBox_LIKE)#%'</cfif>
					<cfif hcpcDX1TBox NEQ "">AND hcpcDX1TBox = '#hcpcDX1TBox#'</cfif>
					<cfif hcpcDX1TBox_IN NEQ "">AND hcpcDX1TBox IN(#trim(hcpcDX1TBox_IN)#)</cfif>
					<cfif hcpcDX1TBox_LIKE NEQ "">AND hcpcDX1TBox LIKE '%#trim(hcpcDX1TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis1TBox NEQ "">AND hcpcDiagnosis1TBox = '#hcpcDiagnosis1TBox#'</cfif>
					<cfif hcpcDiagnosis1TBox_IN NEQ "">AND hcpcDiagnosis1TBox IN(#trim(hcpcDiagnosis1TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis1TBox_LIKE NEQ "">AND hcpcDiagnosis1TBox LIKE '%#trim(hcpcDiagnosis1TBox_LIKE)#%'</cfif>
					<cfif hcpcCost1TBox NEQ "">AND hcpcCost1TBox = '#hcpcCost1TBox#'</cfif>
					<cfif hcpcCost1TBox_IN NEQ "">AND hcpcCost1TBox IN(#trim(hcpcCost1TBox_IN)#)</cfif>
					<cfif hcpcCost1TBox_LIKE NEQ "">AND hcpcCost1TBox LIKE '%#trim(hcpcCost1TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear1TBox NEQ "">AND hcpcLengthOfNeedYear1TBox = '#hcpcLengthOfNeedYear1TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear1TBox_IN NEQ "">AND hcpcLengthOfNeedYear1TBox IN(#trim(hcpcLengthOfNeedYear1TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear1TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear1TBox LIKE '%#trim(hcpcLengthOfNeedYear1TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth1TBox NEQ "">AND hcpcLengthOfNeedMonth1TBox = '#hcpcLengthOfNeedMonth1TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth1TBox_IN NEQ "">AND hcpcLengthOfNeedMonth1TBox IN(#trim(hcpcLengthOfNeedMonth1TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth1TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth1TBox LIKE '%#trim(hcpcLengthOfNeedMonth1TBox_LIKE)#%'</cfif>
					<cfif hcpcCode2TBox NEQ "">AND hcpcCode2TBox = '#hcpcCode2TBox#'</cfif>
					<cfif hcpcCode2TBox_IN NEQ "">AND hcpcCode2TBox IN(#trim(hcpcCode2TBox_IN)#)</cfif>
					<cfif hcpcCode2TBox_LIKE NEQ "">AND hcpcCode2TBox LIKE '%#trim(hcpcCode2TBox_LIKE)#%'</cfif>
					<cfif hcpcQty2TBox NEQ "">AND hcpcQty2TBox = '#hcpcQty2TBox#'</cfif>
					<cfif hcpcQty2TBox_IN NEQ "">AND hcpcQty2TBox IN(#trim(hcpcQty2TBox_IN)#)</cfif>
					<cfif hcpcQty2TBox_LIKE NEQ "">AND hcpcQty2TBox LIKE '%#trim(hcpcQty2TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct2TBox NEQ "">AND hcpcProduct2TBox = '#hcpcProduct2TBox#'</cfif>
					<cfif hcpcProduct2TBox_IN NEQ "">AND hcpcProduct2TBox IN(#trim(hcpcProduct2TBox_IN)#)</cfif>
					<cfif hcpcProduct2TBox_LIKE NEQ "">AND hcpcProduct2TBox LIKE '%#trim(hcpcProduct2TBox_LIKE)#%'</cfif>
					<cfif hcpcDX2TBox NEQ "">AND hcpcDX2TBox = '#hcpcDX2TBox#'</cfif>
					<cfif hcpcDX2TBox_IN NEQ "">AND hcpcDX2TBox IN(#trim(hcpcDX2TBox_IN)#)</cfif>
					<cfif hcpcDX2TBox_LIKE NEQ "">AND hcpcDX2TBox LIKE '%#trim(hcpcDX2TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis2TBox NEQ "">AND hcpcDiagnosis2TBox = '#hcpcDiagnosis2TBox#'</cfif>
					<cfif hcpcDiagnosis2TBox_IN NEQ "">AND hcpcDiagnosis2TBox IN(#trim(hcpcDiagnosis2TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis2TBox_LIKE NEQ "">AND hcpcDiagnosis2TBox LIKE '%#trim(hcpcDiagnosis2TBox_LIKE)#%'</cfif>
					<cfif hcpcCost2TBox NEQ "">AND hcpcCost2TBox = '#hcpcCost2TBox#'</cfif>
					<cfif hcpcCost2TBox_IN NEQ "">AND hcpcCost2TBox IN(#trim(hcpcCost2TBox_IN)#)</cfif>
					<cfif hcpcCost2TBox_LIKE NEQ "">AND hcpcCost2TBox LIKE '%#trim(hcpcCost2TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear2TBox NEQ "">AND hcpcLengthOfNeedYear2TBox = '#hcpcLengthOfNeedYear2TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear2TBox_IN NEQ "">AND hcpcLengthOfNeedYear2TBox IN(#trim(hcpcLengthOfNeedYear2TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear2TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear2TBox LIKE '%#trim(hcpcLengthOfNeedYear2TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth2TBox NEQ "">AND hcpcLengthOfNeedMonth2TBox = '#hcpcLengthOfNeedMonth2TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth2TBox_IN NEQ "">AND hcpcLengthOfNeedMonth2TBox IN(#trim(hcpcLengthOfNeedMonth2TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth2TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth2TBox LIKE '%#trim(hcpcLengthOfNeedMonth2TBox_LIKE)#%'</cfif>
					<cfif hcpcCode3TBox NEQ "">AND hcpcCode3TBox = '#hcpcCode3TBox#'</cfif>
					<cfif hcpcCode3TBox_IN NEQ "">AND hcpcCode3TBox IN(#trim(hcpcCode3TBox_IN)#)</cfif>
					<cfif hcpcCode3TBox_LIKE NEQ "">AND hcpcCode3TBox LIKE '%#trim(hcpcCode3TBox_LIKE)#%'</cfif>
					<cfif hcpcQty3TBox NEQ "">AND hcpcQty3TBox = '#hcpcQty3TBox#'</cfif>
					<cfif hcpcQty3TBox_IN NEQ "">AND hcpcQty3TBox IN(#trim(hcpcQty3TBox_IN)#)</cfif>
					<cfif hcpcQty3TBox_LIKE NEQ "">AND hcpcQty3TBox LIKE '%#trim(hcpcQty3TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct3TBox NEQ "">AND hcpcProduct3TBox = '#hcpcProduct3TBox#'</cfif>
					<cfif hcpcProduct3TBox_IN NEQ "">AND hcpcProduct3TBox IN(#trim(hcpcProduct3TBox_IN)#)</cfif>
					<cfif hcpcProduct3TBox_LIKE NEQ "">AND hcpcProduct3TBox LIKE '%#trim(hcpcProduct3TBox_LIKE)#%'</cfif>
					<cfif hcpcDX3TBox NEQ "">AND hcpcDX3TBox = '#hcpcDX3TBox#'</cfif>
					<cfif hcpcDX3TBox_IN NEQ "">AND hcpcDX3TBox IN(#trim(hcpcDX3TBox_IN)#)</cfif>
					<cfif hcpcDX3TBox_LIKE NEQ "">AND hcpcDX3TBox LIKE '%#trim(hcpcDX3TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis3TBox NEQ "">AND hcpcDiagnosis3TBox = '#hcpcDiagnosis3TBox#'</cfif>
					<cfif hcpcDiagnosis3TBox_IN NEQ "">AND hcpcDiagnosis3TBox IN(#trim(hcpcDiagnosis3TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis3TBox_LIKE NEQ "">AND hcpcDiagnosis3TBox LIKE '%#trim(hcpcDiagnosis3TBox_LIKE)#%'</cfif>
					<cfif hcpcCost3TBox NEQ "">AND hcpcCost3TBox = '#hcpcCost3TBox#'</cfif>
					<cfif hcpcCost3TBox_IN NEQ "">AND hcpcCost3TBox IN(#trim(hcpcCost3TBox_IN)#)</cfif>
					<cfif hcpcCost3TBox_LIKE NEQ "">AND hcpcCost3TBox LIKE '%#trim(hcpcCost3TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear3TBox NEQ "">AND hcpcLengthOfNeedYear3TBox = '#hcpcLengthOfNeedYear3TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear3TBox_IN NEQ "">AND hcpcLengthOfNeedYear3TBox IN(#trim(hcpcLengthOfNeedYear3TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear3TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear3TBox LIKE '%#trim(hcpcLengthOfNeedYear3TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth3TBox NEQ "">AND hcpcLengthOfNeedMonth3TBox = '#hcpcLengthOfNeedMonth3TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth3TBox_IN NEQ "">AND hcpcLengthOfNeedMonth3TBox IN(#trim(hcpcLengthOfNeedMonth3TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth3TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth3TBox LIKE '%#trim(hcpcLengthOfNeedMonth3TBox_LIKE)#%'</cfif>
					<cfif hcpcCode4TBox NEQ "">AND hcpcCode4TBox = '#hcpcCode4TBox#'</cfif>
					<cfif hcpcCode4TBox_IN NEQ "">AND hcpcCode4TBox IN(#trim(hcpcCode4TBox_IN)#)</cfif>
					<cfif hcpcCode4TBox_LIKE NEQ "">AND hcpcCode4TBox LIKE '%#trim(hcpcCode4TBox_LIKE)#%'</cfif>
					<cfif hcpcQty4TBox NEQ "">AND hcpcQty4TBox = '#hcpcQty4TBox#'</cfif>
					<cfif hcpcQty4TBox_IN NEQ "">AND hcpcQty4TBox IN(#trim(hcpcQty4TBox_IN)#)</cfif>
					<cfif hcpcQty4TBox_LIKE NEQ "">AND hcpcQty4TBox LIKE '%#trim(hcpcQty4TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct4TBox NEQ "">AND hcpcProduct4TBox = '#hcpcProduct4TBox#'</cfif>
					<cfif hcpcProduct4TBox_IN NEQ "">AND hcpcProduct4TBox IN(#trim(hcpcProduct4TBox_IN)#)</cfif>
					<cfif hcpcProduct4TBox_LIKE NEQ "">AND hcpcProduct4TBox LIKE '%#trim(hcpcProduct4TBox_LIKE)#%'</cfif>
					<cfif hcpcDX4TBox NEQ "">AND hcpcDX4TBox = '#hcpcDX4TBox#'</cfif>
					<cfif hcpcDX4TBox_IN NEQ "">AND hcpcDX4TBox IN(#trim(hcpcDX4TBox_IN)#)</cfif>
					<cfif hcpcDX4TBox_LIKE NEQ "">AND hcpcDX4TBox LIKE '%#trim(hcpcDX4TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis4TBox NEQ "">AND hcpcDiagnosis4TBox = '#hcpcDiagnosis4TBox#'</cfif>
					<cfif hcpcDiagnosis4TBox_IN NEQ "">AND hcpcDiagnosis4TBox IN(#trim(hcpcDiagnosis4TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis4TBox_LIKE NEQ "">AND hcpcDiagnosis4TBox LIKE '%#trim(hcpcDiagnosis4TBox_LIKE)#%'</cfif>
					<cfif hcpcCost4TBox NEQ "">AND hcpcCost4TBox = '#hcpcCost4TBox#'</cfif>
					<cfif hcpcCost4TBox_IN NEQ "">AND hcpcCost4TBox IN(#trim(hcpcCost4TBox_IN)#)</cfif>
					<cfif hcpcCost4TBox_LIKE NEQ "">AND hcpcCost4TBox LIKE '%#trim(hcpcCost4TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear4TBox NEQ "">AND hcpcLengthOfNeedYear4TBox = '#hcpcLengthOfNeedYear4TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear4TBox_IN NEQ "">AND hcpcLengthOfNeedYear4TBox IN(#trim(hcpcLengthOfNeedYear4TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear4TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear4TBox LIKE '%#trim(hcpcLengthOfNeedYear4TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth4TBox NEQ "">AND hcpcLengthOfNeedMonth4TBox = '#hcpcLengthOfNeedMonth4TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth4TBox_IN NEQ "">AND hcpcLengthOfNeedMonth4TBox IN(#trim(hcpcLengthOfNeedMonth4TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth4TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth4TBox LIKE '%#trim(hcpcLengthOfNeedMonth4TBox_LIKE)#%'</cfif>
					<cfif hcpcCode5TBox NEQ "">AND hcpcCode5TBox = '#hcpcCode5TBox#'</cfif>
					<cfif hcpcCode5TBox_IN NEQ "">AND hcpcCode5TBox IN(#trim(hcpcCode5TBox_IN)#)</cfif>
					<cfif hcpcCode5TBox_LIKE NEQ "">AND hcpcCode5TBox LIKE '%#trim(hcpcCode5TBox_LIKE)#%'</cfif>
					<cfif hcpcQty5TBox NEQ "">AND hcpcQty5TBox = '#hcpcQty5TBox#'</cfif>
					<cfif hcpcQty5TBox_IN NEQ "">AND hcpcQty5TBox IN(#trim(hcpcQty5TBox_IN)#)</cfif>
					<cfif hcpcQty5TBox_LIKE NEQ "">AND hcpcQty5TBox LIKE '%#trim(hcpcQty5TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct5TBox NEQ "">AND hcpcProduct5TBox = '#hcpcProduct5TBox#'</cfif>
					<cfif hcpcProduct5TBox_IN NEQ "">AND hcpcProduct5TBox IN(#trim(hcpcProduct5TBox_IN)#)</cfif>
					<cfif hcpcProduct5TBox_LIKE NEQ "">AND hcpcProduct5TBox LIKE '%#trim(hcpcProduct5TBox_LIKE)#%'</cfif>
					<cfif hcpcDX5TBox NEQ "">AND hcpcDX5TBox = '#hcpcDX5TBox#'</cfif>
					<cfif hcpcDX5TBox_IN NEQ "">AND hcpcDX5TBox IN(#trim(hcpcDX5TBox_IN)#)</cfif>
					<cfif hcpcDX5TBox_LIKE NEQ "">AND hcpcDX5TBox LIKE '%#trim(hcpcDX5TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis5TBox NEQ "">AND hcpcDiagnosis5TBox = '#hcpcDiagnosis5TBox#'</cfif>
					<cfif hcpcDiagnosis5TBox_IN NEQ "">AND hcpcDiagnosis5TBox IN(#trim(hcpcDiagnosis5TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis5TBox_LIKE NEQ "">AND hcpcDiagnosis5TBox LIKE '%#trim(hcpcDiagnosis5TBox_LIKE)#%'</cfif>
					<cfif hcpcCost5TBox NEQ "">AND hcpcCost5TBox = '#hcpcCost5TBox#'</cfif>
					<cfif hcpcCost5TBox_IN NEQ "">AND hcpcCost5TBox IN(#trim(hcpcCost5TBox_IN)#)</cfif>
					<cfif hcpcCost5TBox_LIKE NEQ "">AND hcpcCost5TBox LIKE '%#trim(hcpcCost5TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear5TBox NEQ "">AND hcpcLengthOfNeedYear5TBox = '#hcpcLengthOfNeedYear5TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear5TBox_IN NEQ "">AND hcpcLengthOfNeedYear5TBox IN(#trim(hcpcLengthOfNeedYear5TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear5TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear5TBox LIKE '%#trim(hcpcLengthOfNeedYear5TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth5TBox NEQ "">AND hcpcLengthOfNeedMonth5TBox = '#hcpcLengthOfNeedMonth5TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth5TBox_IN NEQ "">AND hcpcLengthOfNeedMonth5TBox IN(#trim(hcpcLengthOfNeedMonth5TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth5TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth5TBox LIKE '%#trim(hcpcLengthOfNeedMonth5TBox_LIKE)#%'</cfif>
					<cfif hcpcCode6TBox NEQ "">AND hcpcCode6TBox = '#hcpcCode6TBox#'</cfif>
					<cfif hcpcCode6TBox_IN NEQ "">AND hcpcCode6TBox IN(#trim(hcpcCode6TBox_IN)#)</cfif>
					<cfif hcpcCode6TBox_LIKE NEQ "">AND hcpcCode6TBox LIKE '%#trim(hcpcCode6TBox_LIKE)#%'</cfif>
					<cfif hcpcQty6TBox NEQ "">AND hcpcQty6TBox = '#hcpcQty6TBox#'</cfif>
					<cfif hcpcQty6TBox_IN NEQ "">AND hcpcQty6TBox IN(#trim(hcpcQty6TBox_IN)#)</cfif>
					<cfif hcpcQty6TBox_LIKE NEQ "">AND hcpcQty6TBox LIKE '%#trim(hcpcQty6TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct6TBox NEQ "">AND hcpcProduct6TBox = '#hcpcProduct6TBox#'</cfif>
					<cfif hcpcProduct6TBox_IN NEQ "">AND hcpcProduct6TBox IN(#trim(hcpcProduct6TBox_IN)#)</cfif>
					<cfif hcpcProduct6TBox_LIKE NEQ "">AND hcpcProduct6TBox LIKE '%#trim(hcpcProduct6TBox_LIKE)#%'</cfif>
					<cfif hcpcDX6TBox NEQ "">AND hcpcDX6TBox = '#hcpcDX6TBox#'</cfif>
					<cfif hcpcDX6TBox_IN NEQ "">AND hcpcDX6TBox IN(#trim(hcpcDX6TBox_IN)#)</cfif>
					<cfif hcpcDX6TBox_LIKE NEQ "">AND hcpcDX6TBox LIKE '%#trim(hcpcDX6TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis6TBox NEQ "">AND hcpcDiagnosis6TBox = '#hcpcDiagnosis6TBox#'</cfif>
					<cfif hcpcDiagnosis6TBox_IN NEQ "">AND hcpcDiagnosis6TBox IN(#trim(hcpcDiagnosis6TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis6TBox_LIKE NEQ "">AND hcpcDiagnosis6TBox LIKE '%#trim(hcpcDiagnosis6TBox_LIKE)#%'</cfif>
					<cfif hcpcCost6TBox NEQ "">AND hcpcCost6TBox = '#hcpcCost6TBox#'</cfif>
					<cfif hcpcCost6TBox_IN NEQ "">AND hcpcCost6TBox IN(#trim(hcpcCost6TBox_IN)#)</cfif>
					<cfif hcpcCost6TBox_LIKE NEQ "">AND hcpcCost6TBox LIKE '%#trim(hcpcCost6TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear6TBox NEQ "">AND hcpcLengthOfNeedYear6TBox = '#hcpcLengthOfNeedYear6TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear6TBox_IN NEQ "">AND hcpcLengthOfNeedYear6TBox IN(#trim(hcpcLengthOfNeedYear6TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear6TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear6TBox LIKE '%#trim(hcpcLengthOfNeedYear6TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth6TBox NEQ "">AND hcpcLengthOfNeedMonth6TBox = '#hcpcLengthOfNeedMonth6TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth6TBox_IN NEQ "">AND hcpcLengthOfNeedMonth6TBox IN(#trim(hcpcLengthOfNeedMonth6TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth6TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth6TBox LIKE '%#trim(hcpcLengthOfNeedMonth6TBox_LIKE)#%'</cfif>
					<cfif hcpcCode7TBox NEQ "">AND hcpcCode7TBox = '#hcpcCode7TBox#'</cfif>
					<cfif hcpcCode7TBox_IN NEQ "">AND hcpcCode7TBox IN(#trim(hcpcCode7TBox_IN)#)</cfif>
					<cfif hcpcCode7TBox_LIKE NEQ "">AND hcpcCode7TBox LIKE '%#trim(hcpcCode7TBox_LIKE)#%'</cfif>
					<cfif hcpcQty7TBox NEQ "">AND hcpcQty7TBox = '#hcpcQty7TBox#'</cfif>
					<cfif hcpcQty7TBox_IN NEQ "">AND hcpcQty7TBox IN(#trim(hcpcQty7TBox_IN)#)</cfif>
					<cfif hcpcQty7TBox_LIKE NEQ "">AND hcpcQty7TBox LIKE '%#trim(hcpcQty7TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct7TBox NEQ "">AND hcpcProduct7TBox = '#hcpcProduct7TBox#'</cfif>
					<cfif hcpcProduct7TBox_IN NEQ "">AND hcpcProduct7TBox IN(#trim(hcpcProduct7TBox_IN)#)</cfif>
					<cfif hcpcProduct7TBox_LIKE NEQ "">AND hcpcProduct7TBox LIKE '%#trim(hcpcProduct7TBox_LIKE)#%'</cfif>
					<cfif hcpcDX7TBox NEQ "">AND hcpcDX7TBox = '#hcpcDX7TBox#'</cfif>
					<cfif hcpcDX7TBox_IN NEQ "">AND hcpcDX7TBox IN(#trim(hcpcDX7TBox_IN)#)</cfif>
					<cfif hcpcDX7TBox_LIKE NEQ "">AND hcpcDX7TBox LIKE '%#trim(hcpcDX7TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis7TBox NEQ "">AND hcpcDiagnosis7TBox = '#hcpcDiagnosis7TBox#'</cfif>
					<cfif hcpcDiagnosis7TBox_IN NEQ "">AND hcpcDiagnosis7TBox IN(#trim(hcpcDiagnosis7TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis7TBox_LIKE NEQ "">AND hcpcDiagnosis7TBox LIKE '%#trim(hcpcDiagnosis7TBox_LIKE)#%'</cfif>
					<cfif hcpcCost7TBox NEQ "">AND hcpcCost7TBox = '#hcpcCost7TBox#'</cfif>
					<cfif hcpcCost7TBox_IN NEQ "">AND hcpcCost7TBox IN(#trim(hcpcCost7TBox_IN)#)</cfif>
					<cfif hcpcCost7TBox_LIKE NEQ "">AND hcpcCost7TBox LIKE '%#trim(hcpcCost7TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear7TBox NEQ "">AND hcpcLengthOfNeedYear7TBox = '#hcpcLengthOfNeedYear7TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear7TBox_IN NEQ "">AND hcpcLengthOfNeedYear7TBox IN(#trim(hcpcLengthOfNeedYear7TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear7TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear7TBox LIKE '%#trim(hcpcLengthOfNeedYear7TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth7TBox NEQ "">AND hcpcLengthOfNeedMonth7TBox = '#hcpcLengthOfNeedMonth7TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth7TBox_IN NEQ "">AND hcpcLengthOfNeedMonth7TBox IN(#trim(hcpcLengthOfNeedMonth7TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth7TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth7TBox LIKE '%#trim(hcpcLengthOfNeedMonth7TBox_LIKE)#%'</cfif>
					<cfif hcpcCode8TBox NEQ "">AND hcpcCode8TBox = '#hcpcCode8TBox#'</cfif>
					<cfif hcpcCode8TBox_IN NEQ "">AND hcpcCode8TBox IN(#trim(hcpcCode8TBox_IN)#)</cfif>
					<cfif hcpcCode8TBox_LIKE NEQ "">AND hcpcCode8TBox LIKE '%#trim(hcpcCode8TBox_LIKE)#%'</cfif>
					<cfif hcpcQty8TBox NEQ "">AND hcpcQty8TBox = '#hcpcQty8TBox#'</cfif>
					<cfif hcpcQty8TBox_IN NEQ "">AND hcpcQty8TBox IN(#trim(hcpcQty8TBox_IN)#)</cfif>
					<cfif hcpcQty8TBox_LIKE NEQ "">AND hcpcQty8TBox LIKE '%#trim(hcpcQty8TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct8TBox NEQ "">AND hcpcProduct8TBox = '#hcpcProduct8TBox#'</cfif>
					<cfif hcpcProduct8TBox_IN NEQ "">AND hcpcProduct8TBox IN(#trim(hcpcProduct8TBox_IN)#)</cfif>
					<cfif hcpcProduct8TBox_LIKE NEQ "">AND hcpcProduct8TBox LIKE '%#trim(hcpcProduct8TBox_LIKE)#%'</cfif>
					<cfif hcpcDX8TBox NEQ "">AND hcpcDX8TBox = '#hcpcDX8TBox#'</cfif>
					<cfif hcpcDX8TBox_IN NEQ "">AND hcpcDX8TBox IN(#trim(hcpcDX8TBox_IN)#)</cfif>
					<cfif hcpcDX8TBox_LIKE NEQ "">AND hcpcDX8TBox LIKE '%#trim(hcpcDX8TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis8TBox NEQ "">AND hcpcDiagnosis8TBox = '#hcpcDiagnosis8TBox#'</cfif>
					<cfif hcpcDiagnosis8TBox_IN NEQ "">AND hcpcDiagnosis8TBox IN(#trim(hcpcDiagnosis8TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis8TBox_LIKE NEQ "">AND hcpcDiagnosis8TBox LIKE '%#trim(hcpcDiagnosis8TBox_LIKE)#%'</cfif>
					<cfif hcpcCost8TBox NEQ "">AND hcpcCost8TBox = '#hcpcCost8TBox#'</cfif>
					<cfif hcpcCost8TBox_IN NEQ "">AND hcpcCost8TBox IN(#trim(hcpcCost8TBox_IN)#)</cfif>
					<cfif hcpcCost8TBox_LIKE NEQ "">AND hcpcCost8TBox LIKE '%#trim(hcpcCost8TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear8TBox NEQ "">AND hcpcLengthOfNeedYear8TBox = '#hcpcLengthOfNeedYear8TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear8TBox_IN NEQ "">AND hcpcLengthOfNeedYear8TBox IN(#trim(hcpcLengthOfNeedYear8TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear8TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear8TBox LIKE '%#trim(hcpcLengthOfNeedYear8TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth8TBox NEQ "">AND hcpcLengthOfNeedMonth8TBox = '#hcpcLengthOfNeedMonth8TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth8TBox_IN NEQ "">AND hcpcLengthOfNeedMonth8TBox IN(#trim(hcpcLengthOfNeedMonth8TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth8TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth8TBox LIKE '%#trim(hcpcLengthOfNeedMonth8TBox_LIKE)#%'</cfif>
					<cfif hcpcCode9TBox NEQ "">AND hcpcCode9TBox = '#hcpcCode9TBox#'</cfif>
					<cfif hcpcCode9TBox_IN NEQ "">AND hcpcCode9TBox IN(#trim(hcpcCode9TBox_IN)#)</cfif>
					<cfif hcpcCode9TBox_LIKE NEQ "">AND hcpcCode9TBox LIKE '%#trim(hcpcCode9TBox_LIKE)#%'</cfif>
					<cfif hcpcQty9TBox NEQ "">AND hcpcQty9TBox = '#hcpcQty9TBox#'</cfif>
					<cfif hcpcQty9TBox_IN NEQ "">AND hcpcQty9TBox IN(#trim(hcpcQty9TBox_IN)#)</cfif>
					<cfif hcpcQty9TBox_LIKE NEQ "">AND hcpcQty9TBox LIKE '%#trim(hcpcQty9TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct9TBox NEQ "">AND hcpcProduct9TBox = '#hcpcProduct9TBox#'</cfif>
					<cfif hcpcProduct9TBox_IN NEQ "">AND hcpcProduct9TBox IN(#trim(hcpcProduct9TBox_IN)#)</cfif>
					<cfif hcpcProduct9TBox_LIKE NEQ "">AND hcpcProduct9TBox LIKE '%#trim(hcpcProduct9TBox_LIKE)#%'</cfif>
					<cfif hcpcDX9TBox NEQ "">AND hcpcDX9TBox = '#hcpcDX9TBox#'</cfif>
					<cfif hcpcDX9TBox_IN NEQ "">AND hcpcDX9TBox IN(#trim(hcpcDX9TBox_IN)#)</cfif>
					<cfif hcpcDX9TBox_LIKE NEQ "">AND hcpcDX9TBox LIKE '%#trim(hcpcDX9TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis9TBox NEQ "">AND hcpcDiagnosis9TBox = '#hcpcDiagnosis9TBox#'</cfif>
					<cfif hcpcDiagnosis9TBox_IN NEQ "">AND hcpcDiagnosis9TBox IN(#trim(hcpcDiagnosis9TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis9TBox_LIKE NEQ "">AND hcpcDiagnosis9TBox LIKE '%#trim(hcpcDiagnosis9TBox_LIKE)#%'</cfif>
					<cfif hcpcCost9TBox NEQ "">AND hcpcCost9TBox = '#hcpcCost9TBox#'</cfif>
					<cfif hcpcCost9TBox_IN NEQ "">AND hcpcCost9TBox IN(#trim(hcpcCost9TBox_IN)#)</cfif>
					<cfif hcpcCost9TBox_LIKE NEQ "">AND hcpcCost9TBox LIKE '%#trim(hcpcCost9TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear9TBox NEQ "">AND hcpcLengthOfNeedYear9TBox = '#hcpcLengthOfNeedYear9TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear9TBox_IN NEQ "">AND hcpcLengthOfNeedYear9TBox IN(#trim(hcpcLengthOfNeedYear9TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear9TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear9TBox LIKE '%#trim(hcpcLengthOfNeedYear9TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth9TBox NEQ "">AND hcpcLengthOfNeedMonth9TBox = '#hcpcLengthOfNeedMonth9TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth9TBox_IN NEQ "">AND hcpcLengthOfNeedMonth9TBox IN(#trim(hcpcLengthOfNeedMonth9TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth9TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth9TBox LIKE '%#trim(hcpcLengthOfNeedMonth9TBox_LIKE)#%'</cfif>
					<cfif hcpcCode10TBox NEQ "">AND hcpcCode10TBox = '#hcpcCode10TBox#'</cfif>
					<cfif hcpcCode10TBox_IN NEQ "">AND hcpcCode10TBox IN(#trim(hcpcCode10TBox_IN)#)</cfif>
					<cfif hcpcCode10TBox_LIKE NEQ "">AND hcpcCode10TBox LIKE '%#trim(hcpcCode10TBox_LIKE)#%'</cfif>
					<cfif hcpcQty10TBox NEQ "">AND hcpcQty10TBox = '#hcpcQty10TBox#'</cfif>
					<cfif hcpcQty10TBox_IN NEQ "">AND hcpcQty10TBox IN(#trim(hcpcQty10TBox_IN)#)</cfif>
					<cfif hcpcQty10TBox_LIKE NEQ "">AND hcpcQty10TBox LIKE '%#trim(hcpcQty10TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct10TBox NEQ "">AND hcpcProduct10TBox = '#hcpcProduct10TBox#'</cfif>
					<cfif hcpcProduct10TBox_IN NEQ "">AND hcpcProduct10TBox IN(#trim(hcpcProduct10TBox_IN)#)</cfif>
					<cfif hcpcProduct10TBox_LIKE NEQ "">AND hcpcProduct10TBox LIKE '%#trim(hcpcProduct10TBox_LIKE)#%'</cfif>
					<cfif hcpcDX10TBox NEQ "">AND hcpcDX10TBox = '#hcpcDX10TBox#'</cfif>
					<cfif hcpcDX10TBox_IN NEQ "">AND hcpcDX10TBox IN(#trim(hcpcDX10TBox_IN)#)</cfif>
					<cfif hcpcDX10TBox_LIKE NEQ "">AND hcpcDX10TBox LIKE '%#trim(hcpcDX10TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis10TBox NEQ "">AND hcpcDiagnosis10TBox = '#hcpcDiagnosis10TBox#'</cfif>
					<cfif hcpcDiagnosis10TBox_IN NEQ "">AND hcpcDiagnosis10TBox IN(#trim(hcpcDiagnosis10TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis10TBox_LIKE NEQ "">AND hcpcDiagnosis10TBox LIKE '%#trim(hcpcDiagnosis10TBox_LIKE)#%'</cfif>
					<cfif hcpcCost10TBox NEQ "">AND hcpcCost10TBox = '#hcpcCost10TBox#'</cfif>
					<cfif hcpcCost10TBox_IN NEQ "">AND hcpcCost10TBox IN(#trim(hcpcCost10TBox_IN)#)</cfif>
					<cfif hcpcCost10TBox_LIKE NEQ "">AND hcpcCost10TBox LIKE '%#trim(hcpcCost10TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear10TBox NEQ "">AND hcpcLengthOfNeedYear10TBox = '#hcpcLengthOfNeedYear10TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear10TBox_IN NEQ "">AND hcpcLengthOfNeedYear10TBox IN(#trim(hcpcLengthOfNeedYear10TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear10TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear10TBox LIKE '%#trim(hcpcLengthOfNeedYear10TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth10TBox NEQ "">AND hcpcLengthOfNeedMonth10TBox = '#hcpcLengthOfNeedMonth10TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth10TBox_IN NEQ "">AND hcpcLengthOfNeedMonth10TBox IN(#trim(hcpcLengthOfNeedMonth10TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth10TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth10TBox LIKE '%#trim(hcpcLengthOfNeedMonth10TBox_LIKE)#%'</cfif>
					<cfif hcpcCode11TBox NEQ "">AND hcpcCode11TBox = '#hcpcCode11TBox#'</cfif>
					<cfif hcpcCode11TBox_IN NEQ "">AND hcpcCode11TBox IN(#trim(hcpcCode11TBox_IN)#)</cfif>
					<cfif hcpcCode11TBox_LIKE NEQ "">AND hcpcCode11TBox LIKE '%#trim(hcpcCode11TBox_LIKE)#%'</cfif>
					<cfif hcpcQty11TBox NEQ "">AND hcpcQty11TBox = '#hcpcQty11TBox#'</cfif>
					<cfif hcpcQty11TBox_IN NEQ "">AND hcpcQty11TBox IN(#trim(hcpcQty11TBox_IN)#)</cfif>
					<cfif hcpcQty11TBox_LIKE NEQ "">AND hcpcQty11TBox LIKE '%#trim(hcpcQty11TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct11TBox NEQ "">AND hcpcProduct11TBox = '#hcpcProduct11TBox#'</cfif>
					<cfif hcpcProduct11TBox_IN NEQ "">AND hcpcProduct11TBox IN(#trim(hcpcProduct11TBox_IN)#)</cfif>
					<cfif hcpcProduct11TBox_LIKE NEQ "">AND hcpcProduct11TBox LIKE '%#trim(hcpcProduct11TBox_LIKE)#%'</cfif>
					<cfif hcpcDX11TBox NEQ "">AND hcpcDX11TBox = '#hcpcDX11TBox#'</cfif>
					<cfif hcpcDX11TBox_IN NEQ "">AND hcpcDX11TBox IN(#trim(hcpcDX11TBox_IN)#)</cfif>
					<cfif hcpcDX11TBox_LIKE NEQ "">AND hcpcDX11TBox LIKE '%#trim(hcpcDX11TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis11TBox NEQ "">AND hcpcDiagnosis11TBox = '#hcpcDiagnosis11TBox#'</cfif>
					<cfif hcpcDiagnosis11TBox_IN NEQ "">AND hcpcDiagnosis11TBox IN(#trim(hcpcDiagnosis11TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis11TBox_LIKE NEQ "">AND hcpcDiagnosis11TBox LIKE '%#trim(hcpcDiagnosis11TBox_LIKE)#%'</cfif>
					<cfif hcpcCost11TBox NEQ "">AND hcpcCost11TBox = '#hcpcCost11TBox#'</cfif>
					<cfif hcpcCost11TBox_IN NEQ "">AND hcpcCost11TBox IN(#trim(hcpcCost11TBox_IN)#)</cfif>
					<cfif hcpcCost11TBox_LIKE NEQ "">AND hcpcCost11TBox LIKE '%#trim(hcpcCost11TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear11TBox NEQ "">AND hcpcLengthOfNeedYear11TBox = '#hcpcLengthOfNeedYear11TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear11TBox_IN NEQ "">AND hcpcLengthOfNeedYear11TBox IN(#trim(hcpcLengthOfNeedYear11TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear11TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear11TBox LIKE '%#trim(hcpcLengthOfNeedYear11TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth11TBox NEQ "">AND hcpcLengthOfNeedMonth11TBox = '#hcpcLengthOfNeedMonth11TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth11TBox_IN NEQ "">AND hcpcLengthOfNeedMonth11TBox IN(#trim(hcpcLengthOfNeedMonth11TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth11TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth11TBox LIKE '%#trim(hcpcLengthOfNeedMonth11TBox_LIKE)#%'</cfif>
					<cfif hcpcCode12TBox NEQ "">AND hcpcCode12TBox = '#hcpcCode12TBox#'</cfif>
					<cfif hcpcCode12TBox_IN NEQ "">AND hcpcCode12TBox IN(#trim(hcpcCode12TBox_IN)#)</cfif>
					<cfif hcpcCode12TBox_LIKE NEQ "">AND hcpcCode12TBox LIKE '%#trim(hcpcCode12TBox_LIKE)#%'</cfif>
					<cfif hcpcQty12TBox NEQ "">AND hcpcQty12TBox = '#hcpcQty12TBox#'</cfif>
					<cfif hcpcQty12TBox_IN NEQ "">AND hcpcQty12TBox IN(#trim(hcpcQty12TBox_IN)#)</cfif>
					<cfif hcpcQty12TBox_LIKE NEQ "">AND hcpcQty12TBox LIKE '%#trim(hcpcQty12TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct12TBox NEQ "">AND hcpcProduct12TBox = '#hcpcProduct12TBox#'</cfif>
					<cfif hcpcProduct12TBox_IN NEQ "">AND hcpcProduct12TBox IN(#trim(hcpcProduct12TBox_IN)#)</cfif>
					<cfif hcpcProduct12TBox_LIKE NEQ "">AND hcpcProduct12TBox LIKE '%#trim(hcpcProduct12TBox_LIKE)#%'</cfif>
					<cfif hcpcDX12TBox NEQ "">AND hcpcDX12TBox = '#hcpcDX12TBox#'</cfif>
					<cfif hcpcDX12TBox_IN NEQ "">AND hcpcDX12TBox IN(#trim(hcpcDX12TBox_IN)#)</cfif>
					<cfif hcpcDX12TBox_LIKE NEQ "">AND hcpcDX12TBox LIKE '%#trim(hcpcDX12TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis12TBox NEQ "">AND hcpcDiagnosis12TBox = '#hcpcDiagnosis12TBox#'</cfif>
					<cfif hcpcDiagnosis12TBox_IN NEQ "">AND hcpcDiagnosis12TBox IN(#trim(hcpcDiagnosis12TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis12TBox_LIKE NEQ "">AND hcpcDiagnosis12TBox LIKE '%#trim(hcpcDiagnosis12TBox_LIKE)#%'</cfif>
					<cfif hcpcCost12TBox NEQ "">AND hcpcCost12TBox = '#hcpcCost12TBox#'</cfif>
					<cfif hcpcCost12TBox_IN NEQ "">AND hcpcCost12TBox IN(#trim(hcpcCost12TBox_IN)#)</cfif>
					<cfif hcpcCost12TBox_LIKE NEQ "">AND hcpcCost12TBox LIKE '%#trim(hcpcCost12TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear12TBox NEQ "">AND hcpcLengthOfNeedYear12TBox = '#hcpcLengthOfNeedYear12TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear12TBox_IN NEQ "">AND hcpcLengthOfNeedYear12TBox IN(#trim(hcpcLengthOfNeedYear12TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear12TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear12TBox LIKE '%#trim(hcpcLengthOfNeedYear12TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth12TBox NEQ "">AND hcpcLengthOfNeedMonth12TBox = '#hcpcLengthOfNeedMonth12TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth12TBox_IN NEQ "">AND hcpcLengthOfNeedMonth12TBox IN(#trim(hcpcLengthOfNeedMonth12TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth12TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth12TBox LIKE '%#trim(hcpcLengthOfNeedMonth12TBox_LIKE)#%'</cfif>
					<cfif hcpcCode13TBox NEQ "">AND hcpcCode13TBox = '#hcpcCode13TBox#'</cfif>
					<cfif hcpcCode13TBox_IN NEQ "">AND hcpcCode13TBox IN(#trim(hcpcCode13TBox_IN)#)</cfif>
					<cfif hcpcCode13TBox_LIKE NEQ "">AND hcpcCode13TBox LIKE '%#trim(hcpcCode13TBox_LIKE)#%'</cfif>
					<cfif hcpcQty13TBox NEQ "">AND hcpcQty13TBox = '#hcpcQty13TBox#'</cfif>
					<cfif hcpcQty13TBox_IN NEQ "">AND hcpcQty13TBox IN(#trim(hcpcQty13TBox_IN)#)</cfif>
					<cfif hcpcQty13TBox_LIKE NEQ "">AND hcpcQty13TBox LIKE '%#trim(hcpcQty13TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct13TBox NEQ "">AND hcpcProduct13TBox = '#hcpcProduct13TBox#'</cfif>
					<cfif hcpcProduct13TBox_IN NEQ "">AND hcpcProduct13TBox IN(#trim(hcpcProduct13TBox_IN)#)</cfif>
					<cfif hcpcProduct13TBox_LIKE NEQ "">AND hcpcProduct13TBox LIKE '%#trim(hcpcProduct13TBox_LIKE)#%'</cfif>
					<cfif hcpcDX13TBox NEQ "">AND hcpcDX13TBox = '#hcpcDX13TBox#'</cfif>
					<cfif hcpcDX13TBox_IN NEQ "">AND hcpcDX13TBox IN(#trim(hcpcDX13TBox_IN)#)</cfif>
					<cfif hcpcDX13TBox_LIKE NEQ "">AND hcpcDX13TBox LIKE '%#trim(hcpcDX13TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis13TBox NEQ "">AND hcpcDiagnosis13TBox = '#hcpcDiagnosis13TBox#'</cfif>
					<cfif hcpcDiagnosis13TBox_IN NEQ "">AND hcpcDiagnosis13TBox IN(#trim(hcpcDiagnosis13TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis13TBox_LIKE NEQ "">AND hcpcDiagnosis13TBox LIKE '%#trim(hcpcDiagnosis13TBox_LIKE)#%'</cfif>
					<cfif hcpcCost13TBox NEQ "">AND hcpcCost13TBox = '#hcpcCost13TBox#'</cfif>
					<cfif hcpcCost13TBox_IN NEQ "">AND hcpcCost13TBox IN(#trim(hcpcCost13TBox_IN)#)</cfif>
					<cfif hcpcCost13TBox_LIKE NEQ "">AND hcpcCost13TBox LIKE '%#trim(hcpcCost13TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear13TBox NEQ "">AND hcpcLengthOfNeedYear13TBox = '#hcpcLengthOfNeedYear13TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear13TBox_IN NEQ "">AND hcpcLengthOfNeedYear13TBox IN(#trim(hcpcLengthOfNeedYear13TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear13TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear13TBox LIKE '%#trim(hcpcLengthOfNeedYear13TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth13TBox NEQ "">AND hcpcLengthOfNeedMonth13TBox = '#hcpcLengthOfNeedMonth13TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth13TBox_IN NEQ "">AND hcpcLengthOfNeedMonth13TBox IN(#trim(hcpcLengthOfNeedMonth13TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth13TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth13TBox LIKE '%#trim(hcpcLengthOfNeedMonth13TBox_LIKE)#%'</cfif>
					<cfif hcpcCode14TBox NEQ "">AND hcpcCode14TBox = '#hcpcCode14TBox#'</cfif>
					<cfif hcpcCode14TBox_IN NEQ "">AND hcpcCode14TBox IN(#trim(hcpcCode14TBox_IN)#)</cfif>
					<cfif hcpcCode14TBox_LIKE NEQ "">AND hcpcCode14TBox LIKE '%#trim(hcpcCode14TBox_LIKE)#%'</cfif>
					<cfif hcpcQty14TBox NEQ "">AND hcpcQty14TBox = '#hcpcQty14TBox#'</cfif>
					<cfif hcpcQty14TBox_IN NEQ "">AND hcpcQty14TBox IN(#trim(hcpcQty14TBox_IN)#)</cfif>
					<cfif hcpcQty14TBox_LIKE NEQ "">AND hcpcQty14TBox LIKE '%#trim(hcpcQty14TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct14TBox NEQ "">AND hcpcProduct14TBox = '#hcpcProduct14TBox#'</cfif>
					<cfif hcpcProduct14TBox_IN NEQ "">AND hcpcProduct14TBox IN(#trim(hcpcProduct14TBox_IN)#)</cfif>
					<cfif hcpcProduct14TBox_LIKE NEQ "">AND hcpcProduct14TBox LIKE '%#trim(hcpcProduct14TBox_LIKE)#%'</cfif>
					<cfif hcpcDX14TBox NEQ "">AND hcpcDX14TBox = '#hcpcDX14TBox#'</cfif>
					<cfif hcpcDX14TBox_IN NEQ "">AND hcpcDX14TBox IN(#trim(hcpcDX14TBox_IN)#)</cfif>
					<cfif hcpcDX14TBox_LIKE NEQ "">AND hcpcDX14TBox LIKE '%#trim(hcpcDX14TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis14TBox NEQ "">AND hcpcDiagnosis14TBox = '#hcpcDiagnosis14TBox#'</cfif>
					<cfif hcpcDiagnosis14TBox_IN NEQ "">AND hcpcDiagnosis14TBox IN(#trim(hcpcDiagnosis14TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis14TBox_LIKE NEQ "">AND hcpcDiagnosis14TBox LIKE '%#trim(hcpcDiagnosis14TBox_LIKE)#%'</cfif>
					<cfif hcpcCost14TBox NEQ "">AND hcpcCost14TBox = '#hcpcCost14TBox#'</cfif>
					<cfif hcpcCost14TBox_IN NEQ "">AND hcpcCost14TBox IN(#trim(hcpcCost14TBox_IN)#)</cfif>
					<cfif hcpcCost14TBox_LIKE NEQ "">AND hcpcCost14TBox LIKE '%#trim(hcpcCost14TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear14TBox NEQ "">AND hcpcLengthOfNeedYear14TBox = '#hcpcLengthOfNeedYear14TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear14TBox_IN NEQ "">AND hcpcLengthOfNeedYear14TBox IN(#trim(hcpcLengthOfNeedYear14TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear14TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear14TBox LIKE '%#trim(hcpcLengthOfNeedYear14TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth14TBox NEQ "">AND hcpcLengthOfNeedMonth14TBox = '#hcpcLengthOfNeedMonth14TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth14TBox_IN NEQ "">AND hcpcLengthOfNeedMonth14TBox IN(#trim(hcpcLengthOfNeedMonth14TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth14TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth14TBox LIKE '%#trim(hcpcLengthOfNeedMonth14TBox_LIKE)#%'</cfif>
					<cfif hcpcCode15TBox NEQ "">AND hcpcCode15TBox = '#hcpcCode15TBox#'</cfif>
					<cfif hcpcCode15TBox_IN NEQ "">AND hcpcCode15TBox IN(#trim(hcpcCode15TBox_IN)#)</cfif>
					<cfif hcpcCode15TBox_LIKE NEQ "">AND hcpcCode15TBox LIKE '%#trim(hcpcCode15TBox_LIKE)#%'</cfif>
					<cfif hcpcQty15TBox NEQ "">AND hcpcQty15TBox = '#hcpcQty15TBox#'</cfif>
					<cfif hcpcQty15TBox_IN NEQ "">AND hcpcQty15TBox IN(#trim(hcpcQty15TBox_IN)#)</cfif>
					<cfif hcpcQty15TBox_LIKE NEQ "">AND hcpcQty15TBox LIKE '%#trim(hcpcQty15TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct15TBox NEQ "">AND hcpcProduct15TBox = '#hcpcProduct15TBox#'</cfif>
					<cfif hcpcProduct15TBox_IN NEQ "">AND hcpcProduct15TBox IN(#trim(hcpcProduct15TBox_IN)#)</cfif>
					<cfif hcpcProduct15TBox_LIKE NEQ "">AND hcpcProduct15TBox LIKE '%#trim(hcpcProduct15TBox_LIKE)#%'</cfif>
					<cfif hcpcDX15TBox NEQ "">AND hcpcDX15TBox = '#hcpcDX15TBox#'</cfif>
					<cfif hcpcDX15TBox_IN NEQ "">AND hcpcDX15TBox IN(#trim(hcpcDX15TBox_IN)#)</cfif>
					<cfif hcpcDX15TBox_LIKE NEQ "">AND hcpcDX15TBox LIKE '%#trim(hcpcDX15TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis15TBox NEQ "">AND hcpcDiagnosis15TBox = '#hcpcDiagnosis15TBox#'</cfif>
					<cfif hcpcDiagnosis15TBox_IN NEQ "">AND hcpcDiagnosis15TBox IN(#trim(hcpcDiagnosis15TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis15TBox_LIKE NEQ "">AND hcpcDiagnosis15TBox LIKE '%#trim(hcpcDiagnosis15TBox_LIKE)#%'</cfif>
					<cfif hcpcCost15TBox NEQ "">AND hcpcCost15TBox = '#hcpcCost15TBox#'</cfif>
					<cfif hcpcCost15TBox_IN NEQ "">AND hcpcCost15TBox IN(#trim(hcpcCost15TBox_IN)#)</cfif>
					<cfif hcpcCost15TBox_LIKE NEQ "">AND hcpcCost15TBox LIKE '%#trim(hcpcCost15TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear15TBox NEQ "">AND hcpcLengthOfNeedYear15TBox = '#hcpcLengthOfNeedYear15TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear15TBox_IN NEQ "">AND hcpcLengthOfNeedYear15TBox IN(#trim(hcpcLengthOfNeedYear15TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear15TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear15TBox LIKE '%#trim(hcpcLengthOfNeedYear15TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth15TBox NEQ "">AND hcpcLengthOfNeedMonth15TBox = '#hcpcLengthOfNeedMonth15TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth15TBox_IN NEQ "">AND hcpcLengthOfNeedMonth15TBox IN(#trim(hcpcLengthOfNeedMonth15TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth15TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth15TBox LIKE '%#trim(hcpcLengthOfNeedMonth15TBox_LIKE)#%'</cfif>
					<cfif hcpcCode16TBox NEQ "">AND hcpcCode16TBox = '#hcpcCode16TBox#'</cfif>
					<cfif hcpcCode16TBox_IN NEQ "">AND hcpcCode16TBox IN(#trim(hcpcCode16TBox_IN)#)</cfif>
					<cfif hcpcCode16TBox_LIKE NEQ "">AND hcpcCode16TBox LIKE '%#trim(hcpcCode16TBox_LIKE)#%'</cfif>
					<cfif hcpcQty16TBox NEQ "">AND hcpcQty16TBox = '#hcpcQty16TBox#'</cfif>
					<cfif hcpcQty16TBox_IN NEQ "">AND hcpcQty16TBox IN(#trim(hcpcQty16TBox_IN)#)</cfif>
					<cfif hcpcQty16TBox_LIKE NEQ "">AND hcpcQty16TBox LIKE '%#trim(hcpcQty16TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct16TBox NEQ "">AND hcpcProduct16TBox = '#hcpcProduct16TBox#'</cfif>
					<cfif hcpcProduct16TBox_IN NEQ "">AND hcpcProduct16TBox IN(#trim(hcpcProduct16TBox_IN)#)</cfif>
					<cfif hcpcProduct16TBox_LIKE NEQ "">AND hcpcProduct16TBox LIKE '%#trim(hcpcProduct16TBox_LIKE)#%'</cfif>
					<cfif hcpcDX16TBox NEQ "">AND hcpcDX16TBox = '#hcpcDX16TBox#'</cfif>
					<cfif hcpcDX16TBox_IN NEQ "">AND hcpcDX16TBox IN(#trim(hcpcDX16TBox_IN)#)</cfif>
					<cfif hcpcDX16TBox_LIKE NEQ "">AND hcpcDX16TBox LIKE '%#trim(hcpcDX16TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis16TBox NEQ "">AND hcpcDiagnosis16TBox = '#hcpcDiagnosis16TBox#'</cfif>
					<cfif hcpcDiagnosis16TBox_IN NEQ "">AND hcpcDiagnosis16TBox IN(#trim(hcpcDiagnosis16TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis16TBox_LIKE NEQ "">AND hcpcDiagnosis16TBox LIKE '%#trim(hcpcDiagnosis16TBox_LIKE)#%'</cfif>
					<cfif hcpcCost16TBox NEQ "">AND hcpcCost16TBox = '#hcpcCost16TBox#'</cfif>
					<cfif hcpcCost16TBox_IN NEQ "">AND hcpcCost16TBox IN(#trim(hcpcCost16TBox_IN)#)</cfif>
					<cfif hcpcCost16TBox_LIKE NEQ "">AND hcpcCost16TBox LIKE '%#trim(hcpcCost16TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear16TBox NEQ "">AND hcpcLengthOfNeedYear16TBox = '#hcpcLengthOfNeedYear16TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear16TBox_IN NEQ "">AND hcpcLengthOfNeedYear16TBox IN(#trim(hcpcLengthOfNeedYear16TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear16TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear16TBox LIKE '%#trim(hcpcLengthOfNeedYear16TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth16TBox NEQ "">AND hcpcLengthOfNeedMonth16TBox = '#hcpcLengthOfNeedMonth16TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth16TBox_IN NEQ "">AND hcpcLengthOfNeedMonth16TBox IN(#trim(hcpcLengthOfNeedMonth16TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth16TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth16TBox LIKE '%#trim(hcpcLengthOfNeedMonth16TBox_LIKE)#%'</cfif>
					<cfif hcpcCode17TBox NEQ "">AND hcpcCode17TBox = '#hcpcCode17TBox#'</cfif>
					<cfif hcpcCode17TBox_IN NEQ "">AND hcpcCode17TBox IN(#trim(hcpcCode17TBox_IN)#)</cfif>
					<cfif hcpcCode17TBox_LIKE NEQ "">AND hcpcCode17TBox LIKE '%#trim(hcpcCode17TBox_LIKE)#%'</cfif>
					<cfif hcpcQty17TBox NEQ "">AND hcpcQty17TBox = '#hcpcQty17TBox#'</cfif>
					<cfif hcpcQty17TBox_IN NEQ "">AND hcpcQty17TBox IN(#trim(hcpcQty17TBox_IN)#)</cfif>
					<cfif hcpcQty17TBox_LIKE NEQ "">AND hcpcQty17TBox LIKE '%#trim(hcpcQty17TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct17TBox NEQ "">AND hcpcProduct17TBox = '#hcpcProduct17TBox#'</cfif>
					<cfif hcpcProduct17TBox_IN NEQ "">AND hcpcProduct17TBox IN(#trim(hcpcProduct17TBox_IN)#)</cfif>
					<cfif hcpcProduct17TBox_LIKE NEQ "">AND hcpcProduct17TBox LIKE '%#trim(hcpcProduct17TBox_LIKE)#%'</cfif>
					<cfif hcpcDX17TBox NEQ "">AND hcpcDX17TBox = '#hcpcDX17TBox#'</cfif>
					<cfif hcpcDX17TBox_IN NEQ "">AND hcpcDX17TBox IN(#trim(hcpcDX17TBox_IN)#)</cfif>
					<cfif hcpcDX17TBox_LIKE NEQ "">AND hcpcDX17TBox LIKE '%#trim(hcpcDX17TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis17TBox NEQ "">AND hcpcDiagnosis17TBox = '#hcpcDiagnosis17TBox#'</cfif>
					<cfif hcpcDiagnosis17TBox_IN NEQ "">AND hcpcDiagnosis17TBox IN(#trim(hcpcDiagnosis17TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis17TBox_LIKE NEQ "">AND hcpcDiagnosis17TBox LIKE '%#trim(hcpcDiagnosis17TBox_LIKE)#%'</cfif>
					<cfif hcpcCost17TBox NEQ "">AND hcpcCost17TBox = '#hcpcCost17TBox#'</cfif>
					<cfif hcpcCost17TBox_IN NEQ "">AND hcpcCost17TBox IN(#trim(hcpcCost17TBox_IN)#)</cfif>
					<cfif hcpcCost17TBox_LIKE NEQ "">AND hcpcCost17TBox LIKE '%#trim(hcpcCost17TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear17TBox NEQ "">AND hcpcLengthOfNeedYear17TBox = '#hcpcLengthOfNeedYear17TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear17TBox_IN NEQ "">AND hcpcLengthOfNeedYear17TBox IN(#trim(hcpcLengthOfNeedYear17TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear17TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear17TBox LIKE '%#trim(hcpcLengthOfNeedYear17TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth17TBox NEQ "">AND hcpcLengthOfNeedMonth17TBox = '#hcpcLengthOfNeedMonth17TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth17TBox_IN NEQ "">AND hcpcLengthOfNeedMonth17TBox IN(#trim(hcpcLengthOfNeedMonth17TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth17TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth17TBox LIKE '%#trim(hcpcLengthOfNeedMonth17TBox_LIKE)#%'</cfif>
					<cfif hcpcCode18TBox NEQ "">AND hcpcCode18TBox = '#hcpcCode18TBox#'</cfif>
					<cfif hcpcCode18TBox_IN NEQ "">AND hcpcCode18TBox IN(#trim(hcpcCode18TBox_IN)#)</cfif>
					<cfif hcpcCode18TBox_LIKE NEQ "">AND hcpcCode18TBox LIKE '%#trim(hcpcCode18TBox_LIKE)#%'</cfif>
					<cfif hcpcQty18TBox NEQ "">AND hcpcQty18TBox = '#hcpcQty18TBox#'</cfif>
					<cfif hcpcQty18TBox_IN NEQ "">AND hcpcQty18TBox IN(#trim(hcpcQty18TBox_IN)#)</cfif>
					<cfif hcpcQty18TBox_LIKE NEQ "">AND hcpcQty18TBox LIKE '%#trim(hcpcQty18TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct18TBox NEQ "">AND hcpcProduct18TBox = '#hcpcProduct18TBox#'</cfif>
					<cfif hcpcProduct18TBox_IN NEQ "">AND hcpcProduct18TBox IN(#trim(hcpcProduct18TBox_IN)#)</cfif>
					<cfif hcpcProduct18TBox_LIKE NEQ "">AND hcpcProduct18TBox LIKE '%#trim(hcpcProduct18TBox_LIKE)#%'</cfif>
					<cfif hcpcDX18TBox NEQ "">AND hcpcDX18TBox = '#hcpcDX18TBox#'</cfif>
					<cfif hcpcDX18TBox_IN NEQ "">AND hcpcDX18TBox IN(#trim(hcpcDX18TBox_IN)#)</cfif>
					<cfif hcpcDX18TBox_LIKE NEQ "">AND hcpcDX18TBox LIKE '%#trim(hcpcDX18TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis18TBox NEQ "">AND hcpcDiagnosis18TBox = '#hcpcDiagnosis18TBox#'</cfif>
					<cfif hcpcDiagnosis18TBox_IN NEQ "">AND hcpcDiagnosis18TBox IN(#trim(hcpcDiagnosis18TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis18TBox_LIKE NEQ "">AND hcpcDiagnosis18TBox LIKE '%#trim(hcpcDiagnosis18TBox_LIKE)#%'</cfif>
					<cfif hcpcCost18TBox NEQ "">AND hcpcCost18TBox = '#hcpcCost18TBox#'</cfif>
					<cfif hcpcCost18TBox_IN NEQ "">AND hcpcCost18TBox IN(#trim(hcpcCost18TBox_IN)#)</cfif>
					<cfif hcpcCost18TBox_LIKE NEQ "">AND hcpcCost18TBox LIKE '%#trim(hcpcCost18TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear18TBox NEQ "">AND hcpcLengthOfNeedYear18TBox = '#hcpcLengthOfNeedYear18TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear18TBox_IN NEQ "">AND hcpcLengthOfNeedYear18TBox IN(#trim(hcpcLengthOfNeedYear18TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear18TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear18TBox LIKE '%#trim(hcpcLengthOfNeedYear18TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth18TBox NEQ "">AND hcpcLengthOfNeedMonth18TBox = '#hcpcLengthOfNeedMonth18TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth18TBox_IN NEQ "">AND hcpcLengthOfNeedMonth18TBox IN(#trim(hcpcLengthOfNeedMonth18TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth18TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth18TBox LIKE '%#trim(hcpcLengthOfNeedMonth18TBox_LIKE)#%'</cfif>
					<cfif hcpcCode19TBox NEQ "">AND hcpcCode19TBox = '#hcpcCode19TBox#'</cfif>
					<cfif hcpcCode19TBox_IN NEQ "">AND hcpcCode19TBox IN(#trim(hcpcCode19TBox_IN)#)</cfif>
					<cfif hcpcCode19TBox_LIKE NEQ "">AND hcpcCode19TBox LIKE '%#trim(hcpcCode19TBox_LIKE)#%'</cfif>
					<cfif hcpcQty19TBox NEQ "">AND hcpcQty19TBox = '#hcpcQty19TBox#'</cfif>
					<cfif hcpcQty19TBox_IN NEQ "">AND hcpcQty19TBox IN(#trim(hcpcQty19TBox_IN)#)</cfif>
					<cfif hcpcQty19TBox_LIKE NEQ "">AND hcpcQty19TBox LIKE '%#trim(hcpcQty19TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct19TBox NEQ "">AND hcpcProduct19TBox = '#hcpcProduct19TBox#'</cfif>
					<cfif hcpcProduct19TBox_IN NEQ "">AND hcpcProduct19TBox IN(#trim(hcpcProduct19TBox_IN)#)</cfif>
					<cfif hcpcProduct19TBox_LIKE NEQ "">AND hcpcProduct19TBox LIKE '%#trim(hcpcProduct19TBox_LIKE)#%'</cfif>
					<cfif hcpcDX19TBox NEQ "">AND hcpcDX19TBox = '#hcpcDX19TBox#'</cfif>
					<cfif hcpcDX19TBox_IN NEQ "">AND hcpcDX19TBox IN(#trim(hcpcDX19TBox_IN)#)</cfif>
					<cfif hcpcDX19TBox_LIKE NEQ "">AND hcpcDX19TBox LIKE '%#trim(hcpcDX19TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis19TBox NEQ "">AND hcpcDiagnosis19TBox = '#hcpcDiagnosis19TBox#'</cfif>
					<cfif hcpcDiagnosis19TBox_IN NEQ "">AND hcpcDiagnosis19TBox IN(#trim(hcpcDiagnosis19TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis19TBox_LIKE NEQ "">AND hcpcDiagnosis19TBox LIKE '%#trim(hcpcDiagnosis19TBox_LIKE)#%'</cfif>
					<cfif hcpcCost19TBox NEQ "">AND hcpcCost19TBox = '#hcpcCost19TBox#'</cfif>
					<cfif hcpcCost19TBox_IN NEQ "">AND hcpcCost19TBox IN(#trim(hcpcCost19TBox_IN)#)</cfif>
					<cfif hcpcCost19TBox_LIKE NEQ "">AND hcpcCost19TBox LIKE '%#trim(hcpcCost19TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear19TBox NEQ "">AND hcpcLengthOfNeedYear19TBox = '#hcpcLengthOfNeedYear19TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear19TBox_IN NEQ "">AND hcpcLengthOfNeedYear19TBox IN(#trim(hcpcLengthOfNeedYear19TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear19TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear19TBox LIKE '%#trim(hcpcLengthOfNeedYear19TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth19TBox NEQ "">AND hcpcLengthOfNeedMonth19TBox = '#hcpcLengthOfNeedMonth19TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth19TBox_IN NEQ "">AND hcpcLengthOfNeedMonth19TBox IN(#trim(hcpcLengthOfNeedMonth19TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth19TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth19TBox LIKE '%#trim(hcpcLengthOfNeedMonth19TBox_LIKE)#%'</cfif>
					<cfif hcpcCode20TBox NEQ "">AND hcpcCode20TBox = '#hcpcCode20TBox#'</cfif>
					<cfif hcpcCode20TBox_IN NEQ "">AND hcpcCode20TBox IN(#trim(hcpcCode20TBox_IN)#)</cfif>
					<cfif hcpcCode20TBox_LIKE NEQ "">AND hcpcCode20TBox LIKE '%#trim(hcpcCode20TBox_LIKE)#%'</cfif>
					<cfif hcpcQty20TBox NEQ "">AND hcpcQty20TBox = '#hcpcQty20TBox#'</cfif>
					<cfif hcpcQty20TBox_IN NEQ "">AND hcpcQty20TBox IN(#trim(hcpcQty20TBox_IN)#)</cfif>
					<cfif hcpcQty20TBox_LIKE NEQ "">AND hcpcQty20TBox LIKE '%#trim(hcpcQty20TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct20TBox NEQ "">AND hcpcProduct20TBox = '#hcpcProduct20TBox#'</cfif>
					<cfif hcpcProduct20TBox_IN NEQ "">AND hcpcProduct20TBox IN(#trim(hcpcProduct20TBox_IN)#)</cfif>
					<cfif hcpcProduct20TBox_LIKE NEQ "">AND hcpcProduct20TBox LIKE '%#trim(hcpcProduct20TBox_LIKE)#%'</cfif>
					<cfif hcpcDX20TBox NEQ "">AND hcpcDX20TBox = '#hcpcDX20TBox#'</cfif>
					<cfif hcpcDX20TBox_IN NEQ "">AND hcpcDX20TBox IN(#trim(hcpcDX20TBox_IN)#)</cfif>
					<cfif hcpcDX20TBox_LIKE NEQ "">AND hcpcDX20TBox LIKE '%#trim(hcpcDX20TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis20TBox NEQ "">AND hcpcDiagnosis20TBox = '#hcpcDiagnosis20TBox#'</cfif>
					<cfif hcpcDiagnosis20TBox_IN NEQ "">AND hcpcDiagnosis20TBox IN(#trim(hcpcDiagnosis20TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis20TBox_LIKE NEQ "">AND hcpcDiagnosis20TBox LIKE '%#trim(hcpcDiagnosis20TBox_LIKE)#%'</cfif>
					<cfif hcpcCost20TBox NEQ "">AND hcpcCost20TBox = '#hcpcCost20TBox#'</cfif>
					<cfif hcpcCost20TBox_IN NEQ "">AND hcpcCost20TBox IN(#trim(hcpcCost20TBox_IN)#)</cfif>
					<cfif hcpcCost20TBox_LIKE NEQ "">AND hcpcCost20TBox LIKE '%#trim(hcpcCost20TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear20TBox NEQ "">AND hcpcLengthOfNeedYear20TBox = '#hcpcLengthOfNeedYear20TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear20TBox_IN NEQ "">AND hcpcLengthOfNeedYear20TBox IN(#trim(hcpcLengthOfNeedYear20TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear20TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear20TBox LIKE '%#trim(hcpcLengthOfNeedYear20TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth20TBox NEQ "">AND hcpcLengthOfNeedMonth20TBox = '#hcpcLengthOfNeedMonth20TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth20TBox_IN NEQ "">AND hcpcLengthOfNeedMonth20TBox IN(#trim(hcpcLengthOfNeedMonth20TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth20TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth20TBox LIKE '%#trim(hcpcLengthOfNeedMonth20TBox_LIKE)#%'</cfif>
					<cfif hcpcCode21TBox NEQ "">AND hcpcCode21TBox = '#hcpcCode21TBox#'</cfif>
					<cfif hcpcCode21TBox_IN NEQ "">AND hcpcCode21TBox IN(#trim(hcpcCode21TBox_IN)#)</cfif>
					<cfif hcpcCode21TBox_LIKE NEQ "">AND hcpcCode21TBox LIKE '%#trim(hcpcCode21TBox_LIKE)#%'</cfif>
					<cfif hcpcQty21TBox NEQ "">AND hcpcQty21TBox = '#hcpcQty21TBox#'</cfif>
					<cfif hcpcQty21TBox_IN NEQ "">AND hcpcQty21TBox IN(#trim(hcpcQty21TBox_IN)#)</cfif>
					<cfif hcpcQty21TBox_LIKE NEQ "">AND hcpcQty21TBox LIKE '%#trim(hcpcQty21TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct21TBox NEQ "">AND hcpcProduct21TBox = '#hcpcProduct21TBox#'</cfif>
					<cfif hcpcProduct21TBox_IN NEQ "">AND hcpcProduct21TBox IN(#trim(hcpcProduct21TBox_IN)#)</cfif>
					<cfif hcpcProduct21TBox_LIKE NEQ "">AND hcpcProduct21TBox LIKE '%#trim(hcpcProduct21TBox_LIKE)#%'</cfif>
					<cfif hcpcDX21TBox NEQ "">AND hcpcDX21TBox = '#hcpcDX21TBox#'</cfif>
					<cfif hcpcDX21TBox_IN NEQ "">AND hcpcDX21TBox IN(#trim(hcpcDX21TBox_IN)#)</cfif>
					<cfif hcpcDX21TBox_LIKE NEQ "">AND hcpcDX21TBox LIKE '%#trim(hcpcDX21TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis21TBox NEQ "">AND hcpcDiagnosis21TBox = '#hcpcDiagnosis21TBox#'</cfif>
					<cfif hcpcDiagnosis21TBox_IN NEQ "">AND hcpcDiagnosis21TBox IN(#trim(hcpcDiagnosis21TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis21TBox_LIKE NEQ "">AND hcpcDiagnosis21TBox LIKE '%#trim(hcpcDiagnosis21TBox_LIKE)#%'</cfif>
					<cfif hcpcCost21TBox NEQ "">AND hcpcCost21TBox = '#hcpcCost21TBox#'</cfif>
					<cfif hcpcCost21TBox_IN NEQ "">AND hcpcCost21TBox IN(#trim(hcpcCost21TBox_IN)#)</cfif>
					<cfif hcpcCost21TBox_LIKE NEQ "">AND hcpcCost21TBox LIKE '%#trim(hcpcCost21TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear21TBox NEQ "">AND hcpcLengthOfNeedYear21TBox = '#hcpcLengthOfNeedYear21TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear21TBox_IN NEQ "">AND hcpcLengthOfNeedYear21TBox IN(#trim(hcpcLengthOfNeedYear21TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear21TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear21TBox LIKE '%#trim(hcpcLengthOfNeedYear21TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth21TBox NEQ "">AND hcpcLengthOfNeedMonth21TBox = '#hcpcLengthOfNeedMonth21TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth21TBox_IN NEQ "">AND hcpcLengthOfNeedMonth21TBox IN(#trim(hcpcLengthOfNeedMonth21TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth21TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth21TBox LIKE '%#trim(hcpcLengthOfNeedMonth21TBox_LIKE)#%'</cfif>
					<cfif hcpcCode22TBox NEQ "">AND hcpcCode22TBox = '#hcpcCode22TBox#'</cfif>
					<cfif hcpcCode22TBox_IN NEQ "">AND hcpcCode22TBox IN(#trim(hcpcCode22TBox_IN)#)</cfif>
					<cfif hcpcCode22TBox_LIKE NEQ "">AND hcpcCode22TBox LIKE '%#trim(hcpcCode22TBox_LIKE)#%'</cfif>
					<cfif hcpcQty22TBox NEQ "">AND hcpcQty22TBox = '#hcpcQty22TBox#'</cfif>
					<cfif hcpcQty22TBox_IN NEQ "">AND hcpcQty22TBox IN(#trim(hcpcQty22TBox_IN)#)</cfif>
					<cfif hcpcQty22TBox_LIKE NEQ "">AND hcpcQty22TBox LIKE '%#trim(hcpcQty22TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct22TBox NEQ "">AND hcpcProduct22TBox = '#hcpcProduct22TBox#'</cfif>
					<cfif hcpcProduct22TBox_IN NEQ "">AND hcpcProduct22TBox IN(#trim(hcpcProduct22TBox_IN)#)</cfif>
					<cfif hcpcProduct22TBox_LIKE NEQ "">AND hcpcProduct22TBox LIKE '%#trim(hcpcProduct22TBox_LIKE)#%'</cfif>
					<cfif hcpcDX22TBox NEQ "">AND hcpcDX22TBox = '#hcpcDX22TBox#'</cfif>
					<cfif hcpcDX22TBox_IN NEQ "">AND hcpcDX22TBox IN(#trim(hcpcDX22TBox_IN)#)</cfif>
					<cfif hcpcDX22TBox_LIKE NEQ "">AND hcpcDX22TBox LIKE '%#trim(hcpcDX22TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis22TBox NEQ "">AND hcpcDiagnosis22TBox = '#hcpcDiagnosis22TBox#'</cfif>
					<cfif hcpcDiagnosis22TBox_IN NEQ "">AND hcpcDiagnosis22TBox IN(#trim(hcpcDiagnosis22TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis22TBox_LIKE NEQ "">AND hcpcDiagnosis22TBox LIKE '%#trim(hcpcDiagnosis22TBox_LIKE)#%'</cfif>
					<cfif hcpcCost22TBox NEQ "">AND hcpcCost22TBox = '#hcpcCost22TBox#'</cfif>
					<cfif hcpcCost22TBox_IN NEQ "">AND hcpcCost22TBox IN(#trim(hcpcCost22TBox_IN)#)</cfif>
					<cfif hcpcCost22TBox_LIKE NEQ "">AND hcpcCost22TBox LIKE '%#trim(hcpcCost22TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear22TBox NEQ "">AND hcpcLengthOfNeedYear22TBox = '#hcpcLengthOfNeedYear22TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear22TBox_IN NEQ "">AND hcpcLengthOfNeedYear22TBox IN(#trim(hcpcLengthOfNeedYear22TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear22TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear22TBox LIKE '%#trim(hcpcLengthOfNeedYear22TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth22TBox NEQ "">AND hcpcLengthOfNeedMonth22TBox = '#hcpcLengthOfNeedMonth22TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth22TBox_IN NEQ "">AND hcpcLengthOfNeedMonth22TBox IN(#trim(hcpcLengthOfNeedMonth22TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth22TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth22TBox LIKE '%#trim(hcpcLengthOfNeedMonth22TBox_LIKE)#%'</cfif>
					<cfif hcpcCode23TBox NEQ "">AND hcpcCode23TBox = '#hcpcCode23TBox#'</cfif>
					<cfif hcpcCode23TBox_IN NEQ "">AND hcpcCode23TBox IN(#trim(hcpcCode23TBox_IN)#)</cfif>
					<cfif hcpcCode23TBox_LIKE NEQ "">AND hcpcCode23TBox LIKE '%#trim(hcpcCode23TBox_LIKE)#%'</cfif>
					<cfif hcpcQty23TBox NEQ "">AND hcpcQty23TBox = '#hcpcQty23TBox#'</cfif>
					<cfif hcpcQty23TBox_IN NEQ "">AND hcpcQty23TBox IN(#trim(hcpcQty23TBox_IN)#)</cfif>
					<cfif hcpcQty23TBox_LIKE NEQ "">AND hcpcQty23TBox LIKE '%#trim(hcpcQty23TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct23TBox NEQ "">AND hcpcProduct23TBox = '#hcpcProduct23TBox#'</cfif>
					<cfif hcpcProduct23TBox_IN NEQ "">AND hcpcProduct23TBox IN(#trim(hcpcProduct23TBox_IN)#)</cfif>
					<cfif hcpcProduct23TBox_LIKE NEQ "">AND hcpcProduct23TBox LIKE '%#trim(hcpcProduct23TBox_LIKE)#%'</cfif>
					<cfif hcpcDX23TBox NEQ "">AND hcpcDX23TBox = '#hcpcDX23TBox#'</cfif>
					<cfif hcpcDX23TBox_IN NEQ "">AND hcpcDX23TBox IN(#trim(hcpcDX23TBox_IN)#)</cfif>
					<cfif hcpcDX23TBox_LIKE NEQ "">AND hcpcDX23TBox LIKE '%#trim(hcpcDX23TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis23TBox NEQ "">AND hcpcDiagnosis23TBox = '#hcpcDiagnosis23TBox#'</cfif>
					<cfif hcpcDiagnosis23TBox_IN NEQ "">AND hcpcDiagnosis23TBox IN(#trim(hcpcDiagnosis23TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis23TBox_LIKE NEQ "">AND hcpcDiagnosis23TBox LIKE '%#trim(hcpcDiagnosis23TBox_LIKE)#%'</cfif>
					<cfif hcpcCost23TBox NEQ "">AND hcpcCost23TBox = '#hcpcCost23TBox#'</cfif>
					<cfif hcpcCost23TBox_IN NEQ "">AND hcpcCost23TBox IN(#trim(hcpcCost23TBox_IN)#)</cfif>
					<cfif hcpcCost23TBox_LIKE NEQ "">AND hcpcCost23TBox LIKE '%#trim(hcpcCost23TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear23TBox NEQ "">AND hcpcLengthOfNeedYear23TBox = '#hcpcLengthOfNeedYear23TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear23TBox_IN NEQ "">AND hcpcLengthOfNeedYear23TBox IN(#trim(hcpcLengthOfNeedYear23TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear23TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear23TBox LIKE '%#trim(hcpcLengthOfNeedYear23TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth23TBox NEQ "">AND hcpcLengthOfNeedMonth23TBox = '#hcpcLengthOfNeedMonth23TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth23TBox_IN NEQ "">AND hcpcLengthOfNeedMonth23TBox IN(#trim(hcpcLengthOfNeedMonth23TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth23TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth23TBox LIKE '%#trim(hcpcLengthOfNeedMonth23TBox_LIKE)#%'</cfif>
					<cfif hcpcCode24TBox NEQ "">AND hcpcCode24TBox = '#hcpcCode24TBox#'</cfif>
					<cfif hcpcCode24TBox_IN NEQ "">AND hcpcCode24TBox IN(#trim(hcpcCode24TBox_IN)#)</cfif>
					<cfif hcpcCode24TBox_LIKE NEQ "">AND hcpcCode24TBox LIKE '%#trim(hcpcCode24TBox_LIKE)#%'</cfif>
					<cfif hcpcQty24TBox NEQ "">AND hcpcQty24TBox = '#hcpcQty24TBox#'</cfif>
					<cfif hcpcQty24TBox_IN NEQ "">AND hcpcQty24TBox IN(#trim(hcpcQty24TBox_IN)#)</cfif>
					<cfif hcpcQty24TBox_LIKE NEQ "">AND hcpcQty24TBox LIKE '%#trim(hcpcQty24TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct24TBox NEQ "">AND hcpcProduct24TBox = '#hcpcProduct24TBox#'</cfif>
					<cfif hcpcProduct24TBox_IN NEQ "">AND hcpcProduct24TBox IN(#trim(hcpcProduct24TBox_IN)#)</cfif>
					<cfif hcpcProduct24TBox_LIKE NEQ "">AND hcpcProduct24TBox LIKE '%#trim(hcpcProduct24TBox_LIKE)#%'</cfif>
					<cfif hcpcDX24TBox NEQ "">AND hcpcDX24TBox = '#hcpcDX24TBox#'</cfif>
					<cfif hcpcDX24TBox_IN NEQ "">AND hcpcDX24TBox IN(#trim(hcpcDX24TBox_IN)#)</cfif>
					<cfif hcpcDX24TBox_LIKE NEQ "">AND hcpcDX24TBox LIKE '%#trim(hcpcDX24TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis24TBox NEQ "">AND hcpcDiagnosis24TBox = '#hcpcDiagnosis24TBox#'</cfif>
					<cfif hcpcDiagnosis24TBox_IN NEQ "">AND hcpcDiagnosis24TBox IN(#trim(hcpcDiagnosis24TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis24TBox_LIKE NEQ "">AND hcpcDiagnosis24TBox LIKE '%#trim(hcpcDiagnosis24TBox_LIKE)#%'</cfif>
					<cfif hcpcCost24TBox NEQ "">AND hcpcCost24TBox = '#hcpcCost24TBox#'</cfif>
					<cfif hcpcCost24TBox_IN NEQ "">AND hcpcCost24TBox IN(#trim(hcpcCost24TBox_IN)#)</cfif>
					<cfif hcpcCost24TBox_LIKE NEQ "">AND hcpcCost24TBox LIKE '%#trim(hcpcCost24TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear24TBox NEQ "">AND hcpcLengthOfNeedYear24TBox = '#hcpcLengthOfNeedYear24TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear24TBox_IN NEQ "">AND hcpcLengthOfNeedYear24TBox IN(#trim(hcpcLengthOfNeedYear24TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear24TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear24TBox LIKE '%#trim(hcpcLengthOfNeedYear24TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth24TBox NEQ "">AND hcpcLengthOfNeedMonth24TBox = '#hcpcLengthOfNeedMonth24TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth24TBox_IN NEQ "">AND hcpcLengthOfNeedMonth24TBox IN(#trim(hcpcLengthOfNeedMonth24TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth24TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth24TBox LIKE '%#trim(hcpcLengthOfNeedMonth24TBox_LIKE)#%'</cfif>
					<cfif hcpcCode25TBox NEQ "">AND hcpcCode25TBox = '#hcpcCode25TBox#'</cfif>
					<cfif hcpcCode25TBox_IN NEQ "">AND hcpcCode25TBox IN(#trim(hcpcCode25TBox_IN)#)</cfif>
					<cfif hcpcCode25TBox_LIKE NEQ "">AND hcpcCode25TBox LIKE '%#trim(hcpcCode25TBox_LIKE)#%'</cfif>
					<cfif hcpcQty25TBox NEQ "">AND hcpcQty25TBox = '#hcpcQty25TBox#'</cfif>
					<cfif hcpcQty25TBox_IN NEQ "">AND hcpcQty25TBox IN(#trim(hcpcQty25TBox_IN)#)</cfif>
					<cfif hcpcQty25TBox_LIKE NEQ "">AND hcpcQty25TBox LIKE '%#trim(hcpcQty25TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct25TBox NEQ "">AND hcpcProduct25TBox = '#hcpcProduct25TBox#'</cfif>
					<cfif hcpcProduct25TBox_IN NEQ "">AND hcpcProduct25TBox IN(#trim(hcpcProduct25TBox_IN)#)</cfif>
					<cfif hcpcProduct25TBox_LIKE NEQ "">AND hcpcProduct25TBox LIKE '%#trim(hcpcProduct25TBox_LIKE)#%'</cfif>
					<cfif hcpcDX25TBox NEQ "">AND hcpcDX25TBox = '#hcpcDX25TBox#'</cfif>
					<cfif hcpcDX25TBox_IN NEQ "">AND hcpcDX25TBox IN(#trim(hcpcDX25TBox_IN)#)</cfif>
					<cfif hcpcDX25TBox_LIKE NEQ "">AND hcpcDX25TBox LIKE '%#trim(hcpcDX25TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis25TBox NEQ "">AND hcpcDiagnosis25TBox = '#hcpcDiagnosis25TBox#'</cfif>
					<cfif hcpcDiagnosis25TBox_IN NEQ "">AND hcpcDiagnosis25TBox IN(#trim(hcpcDiagnosis25TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis25TBox_LIKE NEQ "">AND hcpcDiagnosis25TBox LIKE '%#trim(hcpcDiagnosis25TBox_LIKE)#%'</cfif>
					<cfif hcpcCost25TBox NEQ "">AND hcpcCost25TBox = '#hcpcCost25TBox#'</cfif>
					<cfif hcpcCost25TBox_IN NEQ "">AND hcpcCost25TBox IN(#trim(hcpcCost25TBox_IN)#)</cfif>
					<cfif hcpcCost25TBox_LIKE NEQ "">AND hcpcCost25TBox LIKE '%#trim(hcpcCost25TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear25TBox NEQ "">AND hcpcLengthOfNeedYear25TBox = '#hcpcLengthOfNeedYear25TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear25TBox_IN NEQ "">AND hcpcLengthOfNeedYear25TBox IN(#trim(hcpcLengthOfNeedYear25TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear25TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear25TBox LIKE '%#trim(hcpcLengthOfNeedYear25TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth25TBox NEQ "">AND hcpcLengthOfNeedMonth25TBox = '#hcpcLengthOfNeedMonth25TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth25TBox_IN NEQ "">AND hcpcLengthOfNeedMonth25TBox IN(#trim(hcpcLengthOfNeedMonth25TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth25TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth25TBox LIKE '%#trim(hcpcLengthOfNeedMonth25TBox_LIKE)#%'</cfif>
					<cfif hcpcCode26TBox NEQ "">AND hcpcCode26TBox = '#hcpcCode26TBox#'</cfif>
					<cfif hcpcCode26TBox_IN NEQ "">AND hcpcCode26TBox IN(#trim(hcpcCode26TBox_IN)#)</cfif>
					<cfif hcpcCode26TBox_LIKE NEQ "">AND hcpcCode26TBox LIKE '%#trim(hcpcCode26TBox_LIKE)#%'</cfif>
					<cfif hcpcQty26TBox NEQ "">AND hcpcQty26TBox = '#hcpcQty26TBox#'</cfif>
					<cfif hcpcQty26TBox_IN NEQ "">AND hcpcQty26TBox IN(#trim(hcpcQty26TBox_IN)#)</cfif>
					<cfif hcpcQty26TBox_LIKE NEQ "">AND hcpcQty26TBox LIKE '%#trim(hcpcQty26TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct26TBox NEQ "">AND hcpcProduct26TBox = '#hcpcProduct26TBox#'</cfif>
					<cfif hcpcProduct26TBox_IN NEQ "">AND hcpcProduct26TBox IN(#trim(hcpcProduct26TBox_IN)#)</cfif>
					<cfif hcpcProduct26TBox_LIKE NEQ "">AND hcpcProduct26TBox LIKE '%#trim(hcpcProduct26TBox_LIKE)#%'</cfif>
					<cfif hcpcDX26TBox NEQ "">AND hcpcDX26TBox = '#hcpcDX26TBox#'</cfif>
					<cfif hcpcDX26TBox_IN NEQ "">AND hcpcDX26TBox IN(#trim(hcpcDX26TBox_IN)#)</cfif>
					<cfif hcpcDX26TBox_LIKE NEQ "">AND hcpcDX26TBox LIKE '%#trim(hcpcDX26TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis26TBox NEQ "">AND hcpcDiagnosis26TBox = '#hcpcDiagnosis26TBox#'</cfif>
					<cfif hcpcDiagnosis26TBox_IN NEQ "">AND hcpcDiagnosis26TBox IN(#trim(hcpcDiagnosis26TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis26TBox_LIKE NEQ "">AND hcpcDiagnosis26TBox LIKE '%#trim(hcpcDiagnosis26TBox_LIKE)#%'</cfif>
					<cfif hcpcCost26TBox NEQ "">AND hcpcCost26TBox = '#hcpcCost26TBox#'</cfif>
					<cfif hcpcCost26TBox_IN NEQ "">AND hcpcCost26TBox IN(#trim(hcpcCost26TBox_IN)#)</cfif>
					<cfif hcpcCost26TBox_LIKE NEQ "">AND hcpcCost26TBox LIKE '%#trim(hcpcCost26TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear26TBox NEQ "">AND hcpcLengthOfNeedYear26TBox = '#hcpcLengthOfNeedYear26TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear26TBox_IN NEQ "">AND hcpcLengthOfNeedYear26TBox IN(#trim(hcpcLengthOfNeedYear26TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear26TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear26TBox LIKE '%#trim(hcpcLengthOfNeedYear26TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth26TBox NEQ "">AND hcpcLengthOfNeedMonth26TBox = '#hcpcLengthOfNeedMonth26TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth26TBox_IN NEQ "">AND hcpcLengthOfNeedMonth26TBox IN(#trim(hcpcLengthOfNeedMonth26TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth26TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth26TBox LIKE '%#trim(hcpcLengthOfNeedMonth26TBox_LIKE)#%'</cfif>
					<cfif hcpcCode27TBox NEQ "">AND hcpcCode27TBox = '#hcpcCode27TBox#'</cfif>
					<cfif hcpcCode27TBox_IN NEQ "">AND hcpcCode27TBox IN(#trim(hcpcCode27TBox_IN)#)</cfif>
					<cfif hcpcCode27TBox_LIKE NEQ "">AND hcpcCode27TBox LIKE '%#trim(hcpcCode27TBox_LIKE)#%'</cfif>
					<cfif hcpcQty27TBox NEQ "">AND hcpcQty27TBox = '#hcpcQty27TBox#'</cfif>
					<cfif hcpcQty27TBox_IN NEQ "">AND hcpcQty27TBox IN(#trim(hcpcQty27TBox_IN)#)</cfif>
					<cfif hcpcQty27TBox_LIKE NEQ "">AND hcpcQty27TBox LIKE '%#trim(hcpcQty27TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct27TBox NEQ "">AND hcpcProduct27TBox = '#hcpcProduct27TBox#'</cfif>
					<cfif hcpcProduct27TBox_IN NEQ "">AND hcpcProduct27TBox IN(#trim(hcpcProduct27TBox_IN)#)</cfif>
					<cfif hcpcProduct27TBox_LIKE NEQ "">AND hcpcProduct27TBox LIKE '%#trim(hcpcProduct27TBox_LIKE)#%'</cfif>
					<cfif hcpcDX27TBox NEQ "">AND hcpcDX27TBox = '#hcpcDX27TBox#'</cfif>
					<cfif hcpcDX27TBox_IN NEQ "">AND hcpcDX27TBox IN(#trim(hcpcDX27TBox_IN)#)</cfif>
					<cfif hcpcDX27TBox_LIKE NEQ "">AND hcpcDX27TBox LIKE '%#trim(hcpcDX27TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis27TBox NEQ "">AND hcpcDiagnosis27TBox = '#hcpcDiagnosis27TBox#'</cfif>
					<cfif hcpcDiagnosis27TBox_IN NEQ "">AND hcpcDiagnosis27TBox IN(#trim(hcpcDiagnosis27TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis27TBox_LIKE NEQ "">AND hcpcDiagnosis27TBox LIKE '%#trim(hcpcDiagnosis27TBox_LIKE)#%'</cfif>
					<cfif hcpcCost27TBox NEQ "">AND hcpcCost27TBox = '#hcpcCost27TBox#'</cfif>
					<cfif hcpcCost27TBox_IN NEQ "">AND hcpcCost27TBox IN(#trim(hcpcCost27TBox_IN)#)</cfif>
					<cfif hcpcCost27TBox_LIKE NEQ "">AND hcpcCost27TBox LIKE '%#trim(hcpcCost27TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear27TBox NEQ "">AND hcpcLengthOfNeedYear27TBox = '#hcpcLengthOfNeedYear27TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear27TBox_IN NEQ "">AND hcpcLengthOfNeedYear27TBox IN(#trim(hcpcLengthOfNeedYear27TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear27TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear27TBox LIKE '%#trim(hcpcLengthOfNeedYear27TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth27TBox NEQ "">AND hcpcLengthOfNeedMonth27TBox = '#hcpcLengthOfNeedMonth27TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth27TBox_IN NEQ "">AND hcpcLengthOfNeedMonth27TBox IN(#trim(hcpcLengthOfNeedMonth27TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth27TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth27TBox LIKE '%#trim(hcpcLengthOfNeedMonth27TBox_LIKE)#%'</cfif>
					<cfif hcpcCode28TBox NEQ "">AND hcpcCode28TBox = '#hcpcCode28TBox#'</cfif>
					<cfif hcpcCode28TBox_IN NEQ "">AND hcpcCode28TBox IN(#trim(hcpcCode28TBox_IN)#)</cfif>
					<cfif hcpcCode28TBox_LIKE NEQ "">AND hcpcCode28TBox LIKE '%#trim(hcpcCode28TBox_LIKE)#%'</cfif>
					<cfif hcpcQty28TBox NEQ "">AND hcpcQty28TBox = '#hcpcQty28TBox#'</cfif>
					<cfif hcpcQty28TBox_IN NEQ "">AND hcpcQty28TBox IN(#trim(hcpcQty28TBox_IN)#)</cfif>
					<cfif hcpcQty28TBox_LIKE NEQ "">AND hcpcQty28TBox LIKE '%#trim(hcpcQty28TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct28TBox NEQ "">AND hcpcProduct28TBox = '#hcpcProduct28TBox#'</cfif>
					<cfif hcpcProduct28TBox_IN NEQ "">AND hcpcProduct28TBox IN(#trim(hcpcProduct28TBox_IN)#)</cfif>
					<cfif hcpcProduct28TBox_LIKE NEQ "">AND hcpcProduct28TBox LIKE '%#trim(hcpcProduct28TBox_LIKE)#%'</cfif>
					<cfif hcpcDX28TBox NEQ "">AND hcpcDX28TBox = '#hcpcDX28TBox#'</cfif>
					<cfif hcpcDX28TBox_IN NEQ "">AND hcpcDX28TBox IN(#trim(hcpcDX28TBox_IN)#)</cfif>
					<cfif hcpcDX28TBox_LIKE NEQ "">AND hcpcDX28TBox LIKE '%#trim(hcpcDX28TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis28TBox NEQ "">AND hcpcDiagnosis28TBox = '#hcpcDiagnosis28TBox#'</cfif>
					<cfif hcpcDiagnosis28TBox_IN NEQ "">AND hcpcDiagnosis28TBox IN(#trim(hcpcDiagnosis28TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis28TBox_LIKE NEQ "">AND hcpcDiagnosis28TBox LIKE '%#trim(hcpcDiagnosis28TBox_LIKE)#%'</cfif>
					<cfif hcpcCost28TBox NEQ "">AND hcpcCost28TBox = '#hcpcCost28TBox#'</cfif>
					<cfif hcpcCost28TBox_IN NEQ "">AND hcpcCost28TBox IN(#trim(hcpcCost28TBox_IN)#)</cfif>
					<cfif hcpcCost28TBox_LIKE NEQ "">AND hcpcCost28TBox LIKE '%#trim(hcpcCost28TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear28TBox NEQ "">AND hcpcLengthOfNeedYear28TBox = '#hcpcLengthOfNeedYear28TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear28TBox_IN NEQ "">AND hcpcLengthOfNeedYear28TBox IN(#trim(hcpcLengthOfNeedYear28TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear28TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear28TBox LIKE '%#trim(hcpcLengthOfNeedYear28TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth28TBox NEQ "">AND hcpcLengthOfNeedMonth28TBox = '#hcpcLengthOfNeedMonth28TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth28TBox_IN NEQ "">AND hcpcLengthOfNeedMonth28TBox IN(#trim(hcpcLengthOfNeedMonth28TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth28TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth28TBox LIKE '%#trim(hcpcLengthOfNeedMonth28TBox_LIKE)#%'</cfif>
					<cfif hcpcCode29TBox NEQ "">AND hcpcCode29TBox = '#hcpcCode29TBox#'</cfif>
					<cfif hcpcCode29TBox_IN NEQ "">AND hcpcCode29TBox IN(#trim(hcpcCode29TBox_IN)#)</cfif>
					<cfif hcpcCode29TBox_LIKE NEQ "">AND hcpcCode29TBox LIKE '%#trim(hcpcCode29TBox_LIKE)#%'</cfif>
					<cfif hcpcQty29TBox NEQ "">AND hcpcQty29TBox = '#hcpcQty29TBox#'</cfif>
					<cfif hcpcQty29TBox_IN NEQ "">AND hcpcQty29TBox IN(#trim(hcpcQty29TBox_IN)#)</cfif>
					<cfif hcpcQty29TBox_LIKE NEQ "">AND hcpcQty29TBox LIKE '%#trim(hcpcQty29TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct29TBox NEQ "">AND hcpcProduct29TBox = '#hcpcProduct29TBox#'</cfif>
					<cfif hcpcProduct29TBox_IN NEQ "">AND hcpcProduct29TBox IN(#trim(hcpcProduct29TBox_IN)#)</cfif>
					<cfif hcpcProduct29TBox_LIKE NEQ "">AND hcpcProduct29TBox LIKE '%#trim(hcpcProduct29TBox_LIKE)#%'</cfif>
					<cfif hcpcDX29TBox NEQ "">AND hcpcDX29TBox = '#hcpcDX29TBox#'</cfif>
					<cfif hcpcDX29TBox_IN NEQ "">AND hcpcDX29TBox IN(#trim(hcpcDX29TBox_IN)#)</cfif>
					<cfif hcpcDX29TBox_LIKE NEQ "">AND hcpcDX29TBox LIKE '%#trim(hcpcDX29TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis29TBox NEQ "">AND hcpcDiagnosis29TBox = '#hcpcDiagnosis29TBox#'</cfif>
					<cfif hcpcDiagnosis29TBox_IN NEQ "">AND hcpcDiagnosis29TBox IN(#trim(hcpcDiagnosis29TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis29TBox_LIKE NEQ "">AND hcpcDiagnosis29TBox LIKE '%#trim(hcpcDiagnosis29TBox_LIKE)#%'</cfif>
					<cfif hcpcCost29TBox NEQ "">AND hcpcCost29TBox = '#hcpcCost29TBox#'</cfif>
					<cfif hcpcCost29TBox_IN NEQ "">AND hcpcCost29TBox IN(#trim(hcpcCost29TBox_IN)#)</cfif>
					<cfif hcpcCost29TBox_LIKE NEQ "">AND hcpcCost29TBox LIKE '%#trim(hcpcCost29TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear29TBox NEQ "">AND hcpcLengthOfNeedYear29TBox = '#hcpcLengthOfNeedYear29TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear29TBox_IN NEQ "">AND hcpcLengthOfNeedYear29TBox IN(#trim(hcpcLengthOfNeedYear29TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear29TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear29TBox LIKE '%#trim(hcpcLengthOfNeedYear29TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth29TBox NEQ "">AND hcpcLengthOfNeedMonth29TBox = '#hcpcLengthOfNeedMonth29TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth29TBox_IN NEQ "">AND hcpcLengthOfNeedMonth29TBox IN(#trim(hcpcLengthOfNeedMonth29TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth29TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth29TBox LIKE '%#trim(hcpcLengthOfNeedMonth29TBox_LIKE)#%'</cfif>
					<cfif hcpcCode30TBox NEQ "">AND hcpcCode30TBox = '#hcpcCode30TBox#'</cfif>
					<cfif hcpcCode30TBox_IN NEQ "">AND hcpcCode30TBox IN(#trim(hcpcCode30TBox_IN)#)</cfif>
					<cfif hcpcCode30TBox_LIKE NEQ "">AND hcpcCode30TBox LIKE '%#trim(hcpcCode30TBox_LIKE)#%'</cfif>
					<cfif hcpcQty30TBox NEQ "">AND hcpcQty30TBox = '#hcpcQty30TBox#'</cfif>
					<cfif hcpcQty30TBox_IN NEQ "">AND hcpcQty30TBox IN(#trim(hcpcQty30TBox_IN)#)</cfif>
					<cfif hcpcQty30TBox_LIKE NEQ "">AND hcpcQty30TBox LIKE '%#trim(hcpcQty30TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct30TBox NEQ "">AND hcpcProduct30TBox = '#hcpcProduct30TBox#'</cfif>
					<cfif hcpcProduct30TBox_IN NEQ "">AND hcpcProduct30TBox IN(#trim(hcpcProduct30TBox_IN)#)</cfif>
					<cfif hcpcProduct30TBox_LIKE NEQ "">AND hcpcProduct30TBox LIKE '%#trim(hcpcProduct30TBox_LIKE)#%'</cfif>
					<cfif hcpcDX30TBox NEQ "">AND hcpcDX30TBox = '#hcpcDX30TBox#'</cfif>
					<cfif hcpcDX30TBox_IN NEQ "">AND hcpcDX30TBox IN(#trim(hcpcDX30TBox_IN)#)</cfif>
					<cfif hcpcDX30TBox_LIKE NEQ "">AND hcpcDX30TBox LIKE '%#trim(hcpcDX30TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis30TBox NEQ "">AND hcpcDiagnosis30TBox = '#hcpcDiagnosis30TBox#'</cfif>
					<cfif hcpcDiagnosis30TBox_IN NEQ "">AND hcpcDiagnosis30TBox IN(#trim(hcpcDiagnosis30TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis30TBox_LIKE NEQ "">AND hcpcDiagnosis30TBox LIKE '%#trim(hcpcDiagnosis30TBox_LIKE)#%'</cfif>
					<cfif hcpcCost30TBox NEQ "">AND hcpcCost30TBox = '#hcpcCost30TBox#'</cfif>
					<cfif hcpcCost30TBox_IN NEQ "">AND hcpcCost30TBox IN(#trim(hcpcCost30TBox_IN)#)</cfif>
					<cfif hcpcCost30TBox_LIKE NEQ "">AND hcpcCost30TBox LIKE '%#trim(hcpcCost30TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear30TBox NEQ "">AND hcpcLengthOfNeedYear30TBox = '#hcpcLengthOfNeedYear30TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear30TBox_IN NEQ "">AND hcpcLengthOfNeedYear30TBox IN(#trim(hcpcLengthOfNeedYear30TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear30TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear30TBox LIKE '%#trim(hcpcLengthOfNeedYear30TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth30TBox NEQ "">AND hcpcLengthOfNeedMonth30TBox = '#hcpcLengthOfNeedMonth30TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth30TBox_IN NEQ "">AND hcpcLengthOfNeedMonth30TBox IN(#trim(hcpcLengthOfNeedMonth30TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth30TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth30TBox LIKE '%#trim(hcpcLengthOfNeedMonth30TBox_LIKE)#%'</cfif>
					<cfif hcpcCode31TBox NEQ "">AND hcpcCode31TBox = '#hcpcCode31TBox#'</cfif>
					<cfif hcpcCode31TBox_IN NEQ "">AND hcpcCode31TBox IN(#trim(hcpcCode31TBox_IN)#)</cfif>
					<cfif hcpcCode31TBox_LIKE NEQ "">AND hcpcCode31TBox LIKE '%#trim(hcpcCode31TBox_LIKE)#%'</cfif>
					<cfif hcpcQty31TBox NEQ "">AND hcpcQty31TBox = '#hcpcQty31TBox#'</cfif>
					<cfif hcpcQty31TBox_IN NEQ "">AND hcpcQty31TBox IN(#trim(hcpcQty31TBox_IN)#)</cfif>
					<cfif hcpcQty31TBox_LIKE NEQ "">AND hcpcQty31TBox LIKE '%#trim(hcpcQty31TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct31TBox NEQ "">AND hcpcProduct31TBox = '#hcpcProduct31TBox#'</cfif>
					<cfif hcpcProduct31TBox_IN NEQ "">AND hcpcProduct31TBox IN(#trim(hcpcProduct31TBox_IN)#)</cfif>
					<cfif hcpcProduct31TBox_LIKE NEQ "">AND hcpcProduct31TBox LIKE '%#trim(hcpcProduct31TBox_LIKE)#%'</cfif>
					<cfif hcpcDX31TBox NEQ "">AND hcpcDX31TBox = '#hcpcDX31TBox#'</cfif>
					<cfif hcpcDX31TBox_IN NEQ "">AND hcpcDX31TBox IN(#trim(hcpcDX31TBox_IN)#)</cfif>
					<cfif hcpcDX31TBox_LIKE NEQ "">AND hcpcDX31TBox LIKE '%#trim(hcpcDX31TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis31TBox NEQ "">AND hcpcDiagnosis31TBox = '#hcpcDiagnosis31TBox#'</cfif>
					<cfif hcpcDiagnosis31TBox_IN NEQ "">AND hcpcDiagnosis31TBox IN(#trim(hcpcDiagnosis31TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis31TBox_LIKE NEQ "">AND hcpcDiagnosis31TBox LIKE '%#trim(hcpcDiagnosis31TBox_LIKE)#%'</cfif>
					<cfif hcpcCost31TBox NEQ "">AND hcpcCost31TBox = '#hcpcCost31TBox#'</cfif>
					<cfif hcpcCost31TBox_IN NEQ "">AND hcpcCost31TBox IN(#trim(hcpcCost31TBox_IN)#)</cfif>
					<cfif hcpcCost31TBox_LIKE NEQ "">AND hcpcCost31TBox LIKE '%#trim(hcpcCost31TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear31TBox NEQ "">AND hcpcLengthOfNeedYear31TBox = '#hcpcLengthOfNeedYear31TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear31TBox_IN NEQ "">AND hcpcLengthOfNeedYear31TBox IN(#trim(hcpcLengthOfNeedYear31TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear31TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear31TBox LIKE '%#trim(hcpcLengthOfNeedYear31TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth31TBox NEQ "">AND hcpcLengthOfNeedMonth31TBox = '#hcpcLengthOfNeedMonth31TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth31TBox_IN NEQ "">AND hcpcLengthOfNeedMonth31TBox IN(#trim(hcpcLengthOfNeedMonth31TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth31TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth31TBox LIKE '%#trim(hcpcLengthOfNeedMonth31TBox_LIKE)#%'</cfif>
					<cfif hcpcCode32TBox NEQ "">AND hcpcCode32TBox = '#hcpcCode32TBox#'</cfif>
					<cfif hcpcCode32TBox_IN NEQ "">AND hcpcCode32TBox IN(#trim(hcpcCode32TBox_IN)#)</cfif>
					<cfif hcpcCode32TBox_LIKE NEQ "">AND hcpcCode32TBox LIKE '%#trim(hcpcCode32TBox_LIKE)#%'</cfif>
					<cfif hcpcQty32TBox NEQ "">AND hcpcQty32TBox = '#hcpcQty32TBox#'</cfif>
					<cfif hcpcQty32TBox_IN NEQ "">AND hcpcQty32TBox IN(#trim(hcpcQty32TBox_IN)#)</cfif>
					<cfif hcpcQty32TBox_LIKE NEQ "">AND hcpcQty32TBox LIKE '%#trim(hcpcQty32TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct32TBox NEQ "">AND hcpcProduct32TBox = '#hcpcProduct32TBox#'</cfif>
					<cfif hcpcProduct32TBox_IN NEQ "">AND hcpcProduct32TBox IN(#trim(hcpcProduct32TBox_IN)#)</cfif>
					<cfif hcpcProduct32TBox_LIKE NEQ "">AND hcpcProduct32TBox LIKE '%#trim(hcpcProduct32TBox_LIKE)#%'</cfif>
					<cfif hcpcDX32TBox NEQ "">AND hcpcDX32TBox = '#hcpcDX32TBox#'</cfif>
					<cfif hcpcDX32TBox_IN NEQ "">AND hcpcDX32TBox IN(#trim(hcpcDX32TBox_IN)#)</cfif>
					<cfif hcpcDX32TBox_LIKE NEQ "">AND hcpcDX32TBox LIKE '%#trim(hcpcDX32TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis32TBox NEQ "">AND hcpcDiagnosis32TBox = '#hcpcDiagnosis32TBox#'</cfif>
					<cfif hcpcDiagnosis32TBox_IN NEQ "">AND hcpcDiagnosis32TBox IN(#trim(hcpcDiagnosis32TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis32TBox_LIKE NEQ "">AND hcpcDiagnosis32TBox LIKE '%#trim(hcpcDiagnosis32TBox_LIKE)#%'</cfif>
					<cfif hcpcCost32TBox NEQ "">AND hcpcCost32TBox = '#hcpcCost32TBox#'</cfif>
					<cfif hcpcCost32TBox_IN NEQ "">AND hcpcCost32TBox IN(#trim(hcpcCost32TBox_IN)#)</cfif>
					<cfif hcpcCost32TBox_LIKE NEQ "">AND hcpcCost32TBox LIKE '%#trim(hcpcCost32TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear32TBox NEQ "">AND hcpcLengthOfNeedYear32TBox = '#hcpcLengthOfNeedYear32TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear32TBox_IN NEQ "">AND hcpcLengthOfNeedYear32TBox IN(#trim(hcpcLengthOfNeedYear32TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear32TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear32TBox LIKE '%#trim(hcpcLengthOfNeedYear32TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth32TBox NEQ "">AND hcpcLengthOfNeedMonth32TBox = '#hcpcLengthOfNeedMonth32TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth32TBox_IN NEQ "">AND hcpcLengthOfNeedMonth32TBox IN(#trim(hcpcLengthOfNeedMonth32TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth32TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth32TBox LIKE '%#trim(hcpcLengthOfNeedMonth32TBox_LIKE)#%'</cfif>
					<cfif hcpcCode33TBox NEQ "">AND hcpcCode33TBox = '#hcpcCode33TBox#'</cfif>
					<cfif hcpcCode33TBox_IN NEQ "">AND hcpcCode33TBox IN(#trim(hcpcCode33TBox_IN)#)</cfif>
					<cfif hcpcCode33TBox_LIKE NEQ "">AND hcpcCode33TBox LIKE '%#trim(hcpcCode33TBox_LIKE)#%'</cfif>
					<cfif hcpcQty33TBox NEQ "">AND hcpcQty33TBox = '#hcpcQty33TBox#'</cfif>
					<cfif hcpcQty33TBox_IN NEQ "">AND hcpcQty33TBox IN(#trim(hcpcQty33TBox_IN)#)</cfif>
					<cfif hcpcQty33TBox_LIKE NEQ "">AND hcpcQty33TBox LIKE '%#trim(hcpcQty33TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct33TBox NEQ "">AND hcpcProduct33TBox = '#hcpcProduct33TBox#'</cfif>
					<cfif hcpcProduct33TBox_IN NEQ "">AND hcpcProduct33TBox IN(#trim(hcpcProduct33TBox_IN)#)</cfif>
					<cfif hcpcProduct33TBox_LIKE NEQ "">AND hcpcProduct33TBox LIKE '%#trim(hcpcProduct33TBox_LIKE)#%'</cfif>
					<cfif hcpcDX33TBox NEQ "">AND hcpcDX33TBox = '#hcpcDX33TBox#'</cfif>
					<cfif hcpcDX33TBox_IN NEQ "">AND hcpcDX33TBox IN(#trim(hcpcDX33TBox_IN)#)</cfif>
					<cfif hcpcDX33TBox_LIKE NEQ "">AND hcpcDX33TBox LIKE '%#trim(hcpcDX33TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis33TBox NEQ "">AND hcpcDiagnosis33TBox = '#hcpcDiagnosis33TBox#'</cfif>
					<cfif hcpcDiagnosis33TBox_IN NEQ "">AND hcpcDiagnosis33TBox IN(#trim(hcpcDiagnosis33TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis33TBox_LIKE NEQ "">AND hcpcDiagnosis33TBox LIKE '%#trim(hcpcDiagnosis33TBox_LIKE)#%'</cfif>
					<cfif hcpcCost33TBox NEQ "">AND hcpcCost33TBox = '#hcpcCost33TBox#'</cfif>
					<cfif hcpcCost33TBox_IN NEQ "">AND hcpcCost33TBox IN(#trim(hcpcCost33TBox_IN)#)</cfif>
					<cfif hcpcCost33TBox_LIKE NEQ "">AND hcpcCost33TBox LIKE '%#trim(hcpcCost33TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear33TBox NEQ "">AND hcpcLengthOfNeedYear33TBox = '#hcpcLengthOfNeedYear33TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear33TBox_IN NEQ "">AND hcpcLengthOfNeedYear33TBox IN(#trim(hcpcLengthOfNeedYear33TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear33TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear33TBox LIKE '%#trim(hcpcLengthOfNeedYear33TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth33TBox NEQ "">AND hcpcLengthOfNeedMonth33TBox = '#hcpcLengthOfNeedMonth33TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth33TBox_IN NEQ "">AND hcpcLengthOfNeedMonth33TBox IN(#trim(hcpcLengthOfNeedMonth33TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth33TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth33TBox LIKE '%#trim(hcpcLengthOfNeedMonth33TBox_LIKE)#%'</cfif>
					<cfif hcpcCode34TBox NEQ "">AND hcpcCode34TBox = '#hcpcCode34TBox#'</cfif>
					<cfif hcpcCode34TBox_IN NEQ "">AND hcpcCode34TBox IN(#trim(hcpcCode34TBox_IN)#)</cfif>
					<cfif hcpcCode34TBox_LIKE NEQ "">AND hcpcCode34TBox LIKE '%#trim(hcpcCode34TBox_LIKE)#%'</cfif>
					<cfif hcpcQty34TBox NEQ "">AND hcpcQty34TBox = '#hcpcQty34TBox#'</cfif>
					<cfif hcpcQty34TBox_IN NEQ "">AND hcpcQty34TBox IN(#trim(hcpcQty34TBox_IN)#)</cfif>
					<cfif hcpcQty34TBox_LIKE NEQ "">AND hcpcQty34TBox LIKE '%#trim(hcpcQty34TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct34TBox NEQ "">AND hcpcProduct34TBox = '#hcpcProduct34TBox#'</cfif>
					<cfif hcpcProduct34TBox_IN NEQ "">AND hcpcProduct34TBox IN(#trim(hcpcProduct34TBox_IN)#)</cfif>
					<cfif hcpcProduct34TBox_LIKE NEQ "">AND hcpcProduct34TBox LIKE '%#trim(hcpcProduct34TBox_LIKE)#%'</cfif>
					<cfif hcpcDX34TBox NEQ "">AND hcpcDX34TBox = '#hcpcDX34TBox#'</cfif>
					<cfif hcpcDX34TBox_IN NEQ "">AND hcpcDX34TBox IN(#trim(hcpcDX34TBox_IN)#)</cfif>
					<cfif hcpcDX34TBox_LIKE NEQ "">AND hcpcDX34TBox LIKE '%#trim(hcpcDX34TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis34TBox NEQ "">AND hcpcDiagnosis34TBox = '#hcpcDiagnosis34TBox#'</cfif>
					<cfif hcpcDiagnosis34TBox_IN NEQ "">AND hcpcDiagnosis34TBox IN(#trim(hcpcDiagnosis34TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis34TBox_LIKE NEQ "">AND hcpcDiagnosis34TBox LIKE '%#trim(hcpcDiagnosis34TBox_LIKE)#%'</cfif>
					<cfif hcpcCost34TBox NEQ "">AND hcpcCost34TBox = '#hcpcCost34TBox#'</cfif>
					<cfif hcpcCost34TBox_IN NEQ "">AND hcpcCost34TBox IN(#trim(hcpcCost34TBox_IN)#)</cfif>
					<cfif hcpcCost34TBox_LIKE NEQ "">AND hcpcCost34TBox LIKE '%#trim(hcpcCost34TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear34TBox NEQ "">AND hcpcLengthOfNeedYear34TBox = '#hcpcLengthOfNeedYear34TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear34TBox_IN NEQ "">AND hcpcLengthOfNeedYear34TBox IN(#trim(hcpcLengthOfNeedYear34TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear34TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear34TBox LIKE '%#trim(hcpcLengthOfNeedYear34TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth34TBox NEQ "">AND hcpcLengthOfNeedMonth34TBox = '#hcpcLengthOfNeedMonth34TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth34TBox_IN NEQ "">AND hcpcLengthOfNeedMonth34TBox IN(#trim(hcpcLengthOfNeedMonth34TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth34TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth34TBox LIKE '%#trim(hcpcLengthOfNeedMonth34TBox_LIKE)#%'</cfif>
					<cfif hcpcCode35TBox NEQ "">AND hcpcCode35TBox = '#hcpcCode35TBox#'</cfif>
					<cfif hcpcCode35TBox_IN NEQ "">AND hcpcCode35TBox IN(#trim(hcpcCode35TBox_IN)#)</cfif>
					<cfif hcpcCode35TBox_LIKE NEQ "">AND hcpcCode35TBox LIKE '%#trim(hcpcCode35TBox_LIKE)#%'</cfif>
					<cfif hcpcQty35TBox NEQ "">AND hcpcQty35TBox = '#hcpcQty35TBox#'</cfif>
					<cfif hcpcQty35TBox_IN NEQ "">AND hcpcQty35TBox IN(#trim(hcpcQty35TBox_IN)#)</cfif>
					<cfif hcpcQty35TBox_LIKE NEQ "">AND hcpcQty35TBox LIKE '%#trim(hcpcQty35TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct35TBox NEQ "">AND hcpcProduct35TBox = '#hcpcProduct35TBox#'</cfif>
					<cfif hcpcProduct35TBox_IN NEQ "">AND hcpcProduct35TBox IN(#trim(hcpcProduct35TBox_IN)#)</cfif>
					<cfif hcpcProduct35TBox_LIKE NEQ "">AND hcpcProduct35TBox LIKE '%#trim(hcpcProduct35TBox_LIKE)#%'</cfif>
					<cfif hcpcDX35TBox NEQ "">AND hcpcDX35TBox = '#hcpcDX35TBox#'</cfif>
					<cfif hcpcDX35TBox_IN NEQ "">AND hcpcDX35TBox IN(#trim(hcpcDX35TBox_IN)#)</cfif>
					<cfif hcpcDX35TBox_LIKE NEQ "">AND hcpcDX35TBox LIKE '%#trim(hcpcDX35TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis35TBox NEQ "">AND hcpcDiagnosis35TBox = '#hcpcDiagnosis35TBox#'</cfif>
					<cfif hcpcDiagnosis35TBox_IN NEQ "">AND hcpcDiagnosis35TBox IN(#trim(hcpcDiagnosis35TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis35TBox_LIKE NEQ "">AND hcpcDiagnosis35TBox LIKE '%#trim(hcpcDiagnosis35TBox_LIKE)#%'</cfif>
					<cfif hcpcCost35TBox NEQ "">AND hcpcCost35TBox = '#hcpcCost35TBox#'</cfif>
					<cfif hcpcCost35TBox_IN NEQ "">AND hcpcCost35TBox IN(#trim(hcpcCost35TBox_IN)#)</cfif>
					<cfif hcpcCost35TBox_LIKE NEQ "">AND hcpcCost35TBox LIKE '%#trim(hcpcCost35TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear35TBox NEQ "">AND hcpcLengthOfNeedYear35TBox = '#hcpcLengthOfNeedYear35TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear35TBox_IN NEQ "">AND hcpcLengthOfNeedYear35TBox IN(#trim(hcpcLengthOfNeedYear35TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear35TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear35TBox LIKE '%#trim(hcpcLengthOfNeedYear35TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth35TBox NEQ "">AND hcpcLengthOfNeedMonth35TBox = '#hcpcLengthOfNeedMonth35TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth35TBox_IN NEQ "">AND hcpcLengthOfNeedMonth35TBox IN(#trim(hcpcLengthOfNeedMonth35TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth35TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth35TBox LIKE '%#trim(hcpcLengthOfNeedMonth35TBox_LIKE)#%'</cfif>
					<cfif hcpcCode36TBox NEQ "">AND hcpcCode36TBox = '#hcpcCode36TBox#'</cfif>
					<cfif hcpcCode36TBox_IN NEQ "">AND hcpcCode36TBox IN(#trim(hcpcCode36TBox_IN)#)</cfif>
					<cfif hcpcCode36TBox_LIKE NEQ "">AND hcpcCode36TBox LIKE '%#trim(hcpcCode36TBox_LIKE)#%'</cfif>
					<cfif hcpcQty36TBox NEQ "">AND hcpcQty36TBox = '#hcpcQty36TBox#'</cfif>
					<cfif hcpcQty36TBox_IN NEQ "">AND hcpcQty36TBox IN(#trim(hcpcQty36TBox_IN)#)</cfif>
					<cfif hcpcQty36TBox_LIKE NEQ "">AND hcpcQty36TBox LIKE '%#trim(hcpcQty36TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct36TBox NEQ "">AND hcpcProduct36TBox = '#hcpcProduct36TBox#'</cfif>
					<cfif hcpcProduct36TBox_IN NEQ "">AND hcpcProduct36TBox IN(#trim(hcpcProduct36TBox_IN)#)</cfif>
					<cfif hcpcProduct36TBox_LIKE NEQ "">AND hcpcProduct36TBox LIKE '%#trim(hcpcProduct36TBox_LIKE)#%'</cfif>
					<cfif hcpcDX36TBox NEQ "">AND hcpcDX36TBox = '#hcpcDX36TBox#'</cfif>
					<cfif hcpcDX36TBox_IN NEQ "">AND hcpcDX36TBox IN(#trim(hcpcDX36TBox_IN)#)</cfif>
					<cfif hcpcDX36TBox_LIKE NEQ "">AND hcpcDX36TBox LIKE '%#trim(hcpcDX36TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis36TBox NEQ "">AND hcpcDiagnosis36TBox = '#hcpcDiagnosis36TBox#'</cfif>
					<cfif hcpcDiagnosis36TBox_IN NEQ "">AND hcpcDiagnosis36TBox IN(#trim(hcpcDiagnosis36TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis36TBox_LIKE NEQ "">AND hcpcDiagnosis36TBox LIKE '%#trim(hcpcDiagnosis36TBox_LIKE)#%'</cfif>
					<cfif hcpcCost36TBox NEQ "">AND hcpcCost36TBox = '#hcpcCost36TBox#'</cfif>
					<cfif hcpcCost36TBox_IN NEQ "">AND hcpcCost36TBox IN(#trim(hcpcCost36TBox_IN)#)</cfif>
					<cfif hcpcCost36TBox_LIKE NEQ "">AND hcpcCost36TBox LIKE '%#trim(hcpcCost36TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear36TBox NEQ "">AND hcpcLengthOfNeedYear36TBox = '#hcpcLengthOfNeedYear36TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear36TBox_IN NEQ "">AND hcpcLengthOfNeedYear36TBox IN(#trim(hcpcLengthOfNeedYear36TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear36TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear36TBox LIKE '%#trim(hcpcLengthOfNeedYear36TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth36TBox NEQ "">AND hcpcLengthOfNeedMonth36TBox = '#hcpcLengthOfNeedMonth36TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth36TBox_IN NEQ "">AND hcpcLengthOfNeedMonth36TBox IN(#trim(hcpcLengthOfNeedMonth36TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth36TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth36TBox LIKE '%#trim(hcpcLengthOfNeedMonth36TBox_LIKE)#%'</cfif>
					<cfif hcpcCode37TBox NEQ "">AND hcpcCode37TBox = '#hcpcCode37TBox#'</cfif>
					<cfif hcpcCode37TBox_IN NEQ "">AND hcpcCode37TBox IN(#trim(hcpcCode37TBox_IN)#)</cfif>
					<cfif hcpcCode37TBox_LIKE NEQ "">AND hcpcCode37TBox LIKE '%#trim(hcpcCode37TBox_LIKE)#%'</cfif>
					<cfif hcpcQty37TBox NEQ "">AND hcpcQty37TBox = '#hcpcQty37TBox#'</cfif>
					<cfif hcpcQty37TBox_IN NEQ "">AND hcpcQty37TBox IN(#trim(hcpcQty37TBox_IN)#)</cfif>
					<cfif hcpcQty37TBox_LIKE NEQ "">AND hcpcQty37TBox LIKE '%#trim(hcpcQty37TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct37TBox NEQ "">AND hcpcProduct37TBox = '#hcpcProduct37TBox#'</cfif>
					<cfif hcpcProduct37TBox_IN NEQ "">AND hcpcProduct37TBox IN(#trim(hcpcProduct37TBox_IN)#)</cfif>
					<cfif hcpcProduct37TBox_LIKE NEQ "">AND hcpcProduct37TBox LIKE '%#trim(hcpcProduct37TBox_LIKE)#%'</cfif>
					<cfif hcpcDX37TBox NEQ "">AND hcpcDX37TBox = '#hcpcDX37TBox#'</cfif>
					<cfif hcpcDX37TBox_IN NEQ "">AND hcpcDX37TBox IN(#trim(hcpcDX37TBox_IN)#)</cfif>
					<cfif hcpcDX37TBox_LIKE NEQ "">AND hcpcDX37TBox LIKE '%#trim(hcpcDX37TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis37TBox NEQ "">AND hcpcDiagnosis37TBox = '#hcpcDiagnosis37TBox#'</cfif>
					<cfif hcpcDiagnosis37TBox_IN NEQ "">AND hcpcDiagnosis37TBox IN(#trim(hcpcDiagnosis37TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis37TBox_LIKE NEQ "">AND hcpcDiagnosis37TBox LIKE '%#trim(hcpcDiagnosis37TBox_LIKE)#%'</cfif>
					<cfif hcpcCost37TBox NEQ "">AND hcpcCost37TBox = '#hcpcCost37TBox#'</cfif>
					<cfif hcpcCost37TBox_IN NEQ "">AND hcpcCost37TBox IN(#trim(hcpcCost37TBox_IN)#)</cfif>
					<cfif hcpcCost37TBox_LIKE NEQ "">AND hcpcCost37TBox LIKE '%#trim(hcpcCost37TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear37TBox NEQ "">AND hcpcLengthOfNeedYear37TBox = '#hcpcLengthOfNeedYear37TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear37TBox_IN NEQ "">AND hcpcLengthOfNeedYear37TBox IN(#trim(hcpcLengthOfNeedYear37TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear37TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear37TBox LIKE '%#trim(hcpcLengthOfNeedYear37TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth37TBox NEQ "">AND hcpcLengthOfNeedMonth37TBox = '#hcpcLengthOfNeedMonth37TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth37TBox_IN NEQ "">AND hcpcLengthOfNeedMonth37TBox IN(#trim(hcpcLengthOfNeedMonth37TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth37TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth37TBox LIKE '%#trim(hcpcLengthOfNeedMonth37TBox_LIKE)#%'</cfif>
					<cfif hcpcCode38TBox NEQ "">AND hcpcCode38TBox = '#hcpcCode38TBox#'</cfif>
					<cfif hcpcCode38TBox_IN NEQ "">AND hcpcCode38TBox IN(#trim(hcpcCode38TBox_IN)#)</cfif>
					<cfif hcpcCode38TBox_LIKE NEQ "">AND hcpcCode38TBox LIKE '%#trim(hcpcCode38TBox_LIKE)#%'</cfif>
					<cfif hcpcQty38TBox NEQ "">AND hcpcQty38TBox = '#hcpcQty38TBox#'</cfif>
					<cfif hcpcQty38TBox_IN NEQ "">AND hcpcQty38TBox IN(#trim(hcpcQty38TBox_IN)#)</cfif>
					<cfif hcpcQty38TBox_LIKE NEQ "">AND hcpcQty38TBox LIKE '%#trim(hcpcQty38TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct38TBox NEQ "">AND hcpcProduct38TBox = '#hcpcProduct38TBox#'</cfif>
					<cfif hcpcProduct38TBox_IN NEQ "">AND hcpcProduct38TBox IN(#trim(hcpcProduct38TBox_IN)#)</cfif>
					<cfif hcpcProduct38TBox_LIKE NEQ "">AND hcpcProduct38TBox LIKE '%#trim(hcpcProduct38TBox_LIKE)#%'</cfif>
					<cfif hcpcDX38TBox NEQ "">AND hcpcDX38TBox = '#hcpcDX38TBox#'</cfif>
					<cfif hcpcDX38TBox_IN NEQ "">AND hcpcDX38TBox IN(#trim(hcpcDX38TBox_IN)#)</cfif>
					<cfif hcpcDX38TBox_LIKE NEQ "">AND hcpcDX38TBox LIKE '%#trim(hcpcDX38TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis38TBox NEQ "">AND hcpcDiagnosis38TBox = '#hcpcDiagnosis38TBox#'</cfif>
					<cfif hcpcDiagnosis38TBox_IN NEQ "">AND hcpcDiagnosis38TBox IN(#trim(hcpcDiagnosis38TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis38TBox_LIKE NEQ "">AND hcpcDiagnosis38TBox LIKE '%#trim(hcpcDiagnosis38TBox_LIKE)#%'</cfif>
					<cfif hcpcCost38TBox NEQ "">AND hcpcCost38TBox = '#hcpcCost38TBox#'</cfif>
					<cfif hcpcCost38TBox_IN NEQ "">AND hcpcCost38TBox IN(#trim(hcpcCost38TBox_IN)#)</cfif>
					<cfif hcpcCost38TBox_LIKE NEQ "">AND hcpcCost38TBox LIKE '%#trim(hcpcCost38TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear38TBox NEQ "">AND hcpcLengthOfNeedYear38TBox = '#hcpcLengthOfNeedYear38TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear38TBox_IN NEQ "">AND hcpcLengthOfNeedYear38TBox IN(#trim(hcpcLengthOfNeedYear38TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear38TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear38TBox LIKE '%#trim(hcpcLengthOfNeedYear38TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth38TBox NEQ "">AND hcpcLengthOfNeedMonth38TBox = '#hcpcLengthOfNeedMonth38TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth38TBox_IN NEQ "">AND hcpcLengthOfNeedMonth38TBox IN(#trim(hcpcLengthOfNeedMonth38TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth38TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth38TBox LIKE '%#trim(hcpcLengthOfNeedMonth38TBox_LIKE)#%'</cfif>
					<cfif hcpcCode39TBox NEQ "">AND hcpcCode39TBox = '#hcpcCode39TBox#'</cfif>
					<cfif hcpcCode39TBox_IN NEQ "">AND hcpcCode39TBox IN(#trim(hcpcCode39TBox_IN)#)</cfif>
					<cfif hcpcCode39TBox_LIKE NEQ "">AND hcpcCode39TBox LIKE '%#trim(hcpcCode39TBox_LIKE)#%'</cfif>
					<cfif hcpcQty39TBox NEQ "">AND hcpcQty39TBox = '#hcpcQty39TBox#'</cfif>
					<cfif hcpcQty39TBox_IN NEQ "">AND hcpcQty39TBox IN(#trim(hcpcQty39TBox_IN)#)</cfif>
					<cfif hcpcQty39TBox_LIKE NEQ "">AND hcpcQty39TBox LIKE '%#trim(hcpcQty39TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct39TBox NEQ "">AND hcpcProduct39TBox = '#hcpcProduct39TBox#'</cfif>
					<cfif hcpcProduct39TBox_IN NEQ "">AND hcpcProduct39TBox IN(#trim(hcpcProduct39TBox_IN)#)</cfif>
					<cfif hcpcProduct39TBox_LIKE NEQ "">AND hcpcProduct39TBox LIKE '%#trim(hcpcProduct39TBox_LIKE)#%'</cfif>
					<cfif hcpcDX39TBox NEQ "">AND hcpcDX39TBox = '#hcpcDX39TBox#'</cfif>
					<cfif hcpcDX39TBox_IN NEQ "">AND hcpcDX39TBox IN(#trim(hcpcDX39TBox_IN)#)</cfif>
					<cfif hcpcDX39TBox_LIKE NEQ "">AND hcpcDX39TBox LIKE '%#trim(hcpcDX39TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis39TBox NEQ "">AND hcpcDiagnosis39TBox = '#hcpcDiagnosis39TBox#'</cfif>
					<cfif hcpcDiagnosis39TBox_IN NEQ "">AND hcpcDiagnosis39TBox IN(#trim(hcpcDiagnosis39TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis39TBox_LIKE NEQ "">AND hcpcDiagnosis39TBox LIKE '%#trim(hcpcDiagnosis39TBox_LIKE)#%'</cfif>
					<cfif hcpcCost39TBox NEQ "">AND hcpcCost39TBox = '#hcpcCost39TBox#'</cfif>
					<cfif hcpcCost39TBox_IN NEQ "">AND hcpcCost39TBox IN(#trim(hcpcCost39TBox_IN)#)</cfif>
					<cfif hcpcCost39TBox_LIKE NEQ "">AND hcpcCost39TBox LIKE '%#trim(hcpcCost39TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear39TBox NEQ "">AND hcpcLengthOfNeedYear39TBox = '#hcpcLengthOfNeedYear39TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear39TBox_IN NEQ "">AND hcpcLengthOfNeedYear39TBox IN(#trim(hcpcLengthOfNeedYear39TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear39TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear39TBox LIKE '%#trim(hcpcLengthOfNeedYear39TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth39TBox NEQ "">AND hcpcLengthOfNeedMonth39TBox = '#hcpcLengthOfNeedMonth39TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth39TBox_IN NEQ "">AND hcpcLengthOfNeedMonth39TBox IN(#trim(hcpcLengthOfNeedMonth39TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth39TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth39TBox LIKE '%#trim(hcpcLengthOfNeedMonth39TBox_LIKE)#%'</cfif>
					<cfif hcpcCode40TBox NEQ "">AND hcpcCode40TBox = '#hcpcCode40TBox#'</cfif>
					<cfif hcpcCode40TBox_IN NEQ "">AND hcpcCode40TBox IN(#trim(hcpcCode40TBox_IN)#)</cfif>
					<cfif hcpcCode40TBox_LIKE NEQ "">AND hcpcCode40TBox LIKE '%#trim(hcpcCode40TBox_LIKE)#%'</cfif>
					<cfif hcpcQty40TBox NEQ "">AND hcpcQty40TBox = '#hcpcQty40TBox#'</cfif>
					<cfif hcpcQty40TBox_IN NEQ "">AND hcpcQty40TBox IN(#trim(hcpcQty40TBox_IN)#)</cfif>
					<cfif hcpcQty40TBox_LIKE NEQ "">AND hcpcQty40TBox LIKE '%#trim(hcpcQty40TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct40TBox NEQ "">AND hcpcProduct40TBox = '#hcpcProduct40TBox#'</cfif>
					<cfif hcpcProduct40TBox_IN NEQ "">AND hcpcProduct40TBox IN(#trim(hcpcProduct40TBox_IN)#)</cfif>
					<cfif hcpcProduct40TBox_LIKE NEQ "">AND hcpcProduct40TBox LIKE '%#trim(hcpcProduct40TBox_LIKE)#%'</cfif>
					<cfif hcpcDX40TBox NEQ "">AND hcpcDX40TBox = '#hcpcDX40TBox#'</cfif>
					<cfif hcpcDX40TBox_IN NEQ "">AND hcpcDX40TBox IN(#trim(hcpcDX40TBox_IN)#)</cfif>
					<cfif hcpcDX40TBox_LIKE NEQ "">AND hcpcDX40TBox LIKE '%#trim(hcpcDX40TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis40TBox NEQ "">AND hcpcDiagnosis40TBox = '#hcpcDiagnosis40TBox#'</cfif>
					<cfif hcpcDiagnosis40TBox_IN NEQ "">AND hcpcDiagnosis40TBox IN(#trim(hcpcDiagnosis40TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis40TBox_LIKE NEQ "">AND hcpcDiagnosis40TBox LIKE '%#trim(hcpcDiagnosis40TBox_LIKE)#%'</cfif>
					<cfif hcpcCost40TBox NEQ "">AND hcpcCost40TBox = '#hcpcCost40TBox#'</cfif>
					<cfif hcpcCost40TBox_IN NEQ "">AND hcpcCost40TBox IN(#trim(hcpcCost40TBox_IN)#)</cfif>
					<cfif hcpcCost40TBox_LIKE NEQ "">AND hcpcCost40TBox LIKE '%#trim(hcpcCost40TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear40TBox NEQ "">AND hcpcLengthOfNeedYear40TBox = '#hcpcLengthOfNeedYear40TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear40TBox_IN NEQ "">AND hcpcLengthOfNeedYear40TBox IN(#trim(hcpcLengthOfNeedYear40TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear40TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear40TBox LIKE '%#trim(hcpcLengthOfNeedYear40TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth40TBox NEQ "">AND hcpcLengthOfNeedMonth40TBox = '#hcpcLengthOfNeedMonth40TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth40TBox_IN NEQ "">AND hcpcLengthOfNeedMonth40TBox IN(#trim(hcpcLengthOfNeedMonth40TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth40TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth40TBox LIKE '%#trim(hcpcLengthOfNeedMonth40TBox_LIKE)#%'</cfif>
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
			
			<cfreturn getIntakeHCPCQuery>
		
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




