 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="QuoteHCPCBean" />
		
		<cfset var qCreateQuoteHCPC = "" />		
		
		<cfset var localQuoteID = arguments.bean.getQuoteID() />
		<cfset var localhcpcCode1TBox = arguments.bean.gethcpcCode1TBox() />
		<cfset var localhcpcQty1TBox = arguments.bean.gethcpcQty1TBox() />
		<cfset var localhcpcProduct1TBox = arguments.bean.gethcpcProduct1TBox() />
		<cfset var localhcpcDX1TBox = arguments.bean.gethcpcDX1TBox() />
		<cfset var localhcpcDiagnosis1TBox = arguments.bean.gethcpcDiagnosis1TBox() />
		<cfset var localhcpcCost1TBox = arguments.bean.gethcpcCost1TBox() />
		<cfset var localhcpcLengthOfNeedYear1TBox = arguments.bean.gethcpcLengthOfNeedYear1TBox() />
		<cfset var localhcpcLengthOfNeedMonth1TBox = arguments.bean.gethcpcLengthOfNeedMonth1TBox() />
		<cfset var localhcpcCode2TBox = arguments.bean.gethcpcCode2TBox() />
		<cfset var localhcpcQty2TBox = arguments.bean.gethcpcQty2TBox() />
		<cfset var localhcpcProduct2TBox = arguments.bean.gethcpcProduct2TBox() />
		<cfset var localhcpcDX2TBox = arguments.bean.gethcpcDX2TBox() />
		<cfset var localhcpcDiagnosis2TBox = arguments.bean.gethcpcDiagnosis2TBox() />
		<cfset var localhcpcCost2TBox = arguments.bean.gethcpcCost2TBox() />
		<cfset var localhcpcLengthOfNeedYear2TBox = arguments.bean.gethcpcLengthOfNeedYear2TBox() />
		<cfset var localhcpcLengthOfNeedMonth2TBox = arguments.bean.gethcpcLengthOfNeedMonth2TBox() />
		<cfset var localhcpcCode3TBox = arguments.bean.gethcpcCode3TBox() />
		<cfset var localhcpcQty3TBox = arguments.bean.gethcpcQty3TBox() />
		<cfset var localhcpcProduct3TBox = arguments.bean.gethcpcProduct3TBox() />
		<cfset var localhcpcDX3TBox = arguments.bean.gethcpcDX3TBox() />
		<cfset var localhcpcDiagnosis3TBox = arguments.bean.gethcpcDiagnosis3TBox() />
		<cfset var localhcpcCost3TBox = arguments.bean.gethcpcCost3TBox() />
		<cfset var localhcpcLengthOfNeedYear3TBox = arguments.bean.gethcpcLengthOfNeedYear3TBox() />
		<cfset var localhcpcLengthOfNeedMonth3TBox = arguments.bean.gethcpcLengthOfNeedMonth3TBox() />
		<cfset var localhcpcCode4TBox = arguments.bean.gethcpcCode4TBox() />
		<cfset var localhcpcQty4TBox = arguments.bean.gethcpcQty4TBox() />
		<cfset var localhcpcProduct4TBox = arguments.bean.gethcpcProduct4TBox() />
		<cfset var localhcpcDX4TBox = arguments.bean.gethcpcDX4TBox() />
		<cfset var localhcpcDiagnosis4TBox = arguments.bean.gethcpcDiagnosis4TBox() />
		<cfset var localhcpcCost4TBox = arguments.bean.gethcpcCost4TBox() />
		<cfset var localhcpcLengthOfNeedYear4TBox = arguments.bean.gethcpcLengthOfNeedYear4TBox() />
		<cfset var localhcpcLengthOfNeedMonth4TBox = arguments.bean.gethcpcLengthOfNeedMonth4TBox() />
		<cfset var localhcpcCode5TBox = arguments.bean.gethcpcCode5TBox() />
		<cfset var localhcpcQty5TBox = arguments.bean.gethcpcQty5TBox() />
		<cfset var localhcpcProduct5TBox = arguments.bean.gethcpcProduct5TBox() />
		<cfset var localhcpcDX5TBox = arguments.bean.gethcpcDX5TBox() />
		<cfset var localhcpcDiagnosis5TBox = arguments.bean.gethcpcDiagnosis5TBox() />
		<cfset var localhcpcCost5TBox = arguments.bean.gethcpcCost5TBox() />
		<cfset var localhcpcLengthOfNeedYear5TBox = arguments.bean.gethcpcLengthOfNeedYear5TBox() />
		<cfset var localhcpcLengthOfNeedMonth5TBox = arguments.bean.gethcpcLengthOfNeedMonth5TBox() />
		<cfset var localhcpcCode6TBox = arguments.bean.gethcpcCode6TBox() />
		<cfset var localhcpcQty6TBox = arguments.bean.gethcpcQty6TBox() />
		<cfset var localhcpcProduct6TBox = arguments.bean.gethcpcProduct6TBox() />
		<cfset var localhcpcDX6TBox = arguments.bean.gethcpcDX6TBox() />
		<cfset var localhcpcDiagnosis6TBox = arguments.bean.gethcpcDiagnosis6TBox() />
		<cfset var localhcpcCost6TBox = arguments.bean.gethcpcCost6TBox() />
		<cfset var localhcpcLengthOfNeedYear6TBox = arguments.bean.gethcpcLengthOfNeedYear6TBox() />
		<cfset var localhcpcLengthOfNeedMonth6TBox = arguments.bean.gethcpcLengthOfNeedMonth6TBox() />
		<cfset var localhcpcCode7TBox = arguments.bean.gethcpcCode7TBox() />
		<cfset var localhcpcQty7TBox = arguments.bean.gethcpcQty7TBox() />
		<cfset var localhcpcProduct7TBox = arguments.bean.gethcpcProduct7TBox() />
		<cfset var localhcpcDX7TBox = arguments.bean.gethcpcDX7TBox() />
		<cfset var localhcpcDiagnosis7TBox = arguments.bean.gethcpcDiagnosis7TBox() />
		<cfset var localhcpcCost7TBox = arguments.bean.gethcpcCost7TBox() />
		<cfset var localhcpcLengthOfNeedYear7TBox = arguments.bean.gethcpcLengthOfNeedYear7TBox() />
		<cfset var localhcpcLengthOfNeedMonth7TBox = arguments.bean.gethcpcLengthOfNeedMonth7TBox() />
		<cfset var localhcpcCode8TBox = arguments.bean.gethcpcCode8TBox() />
		<cfset var localhcpcQty8TBox = arguments.bean.gethcpcQty8TBox() />
		<cfset var localhcpcProduct8TBox = arguments.bean.gethcpcProduct8TBox() />
		<cfset var localhcpcDX8TBox = arguments.bean.gethcpcDX8TBox() />
		<cfset var localhcpcDiagnosis8TBox = arguments.bean.gethcpcDiagnosis8TBox() />
		<cfset var localhcpcCost8TBox = arguments.bean.gethcpcCost8TBox() />
		<cfset var localhcpcLengthOfNeedYear8TBox = arguments.bean.gethcpcLengthOfNeedYear8TBox() />
		<cfset var localhcpcLengthOfNeedMonth8TBox = arguments.bean.gethcpcLengthOfNeedMonth8TBox() />
		<cfset var localhcpcCode9TBox = arguments.bean.gethcpcCode9TBox() />
		<cfset var localhcpcQty9TBox = arguments.bean.gethcpcQty9TBox() />
		<cfset var localhcpcProduct9TBox = arguments.bean.gethcpcProduct9TBox() />
		<cfset var localhcpcDX9TBox = arguments.bean.gethcpcDX9TBox() />
		<cfset var localhcpcDiagnosis9TBox = arguments.bean.gethcpcDiagnosis9TBox() />
		<cfset var localhcpcCost9TBox = arguments.bean.gethcpcCost9TBox() />
		<cfset var localhcpcLengthOfNeedYear9TBox = arguments.bean.gethcpcLengthOfNeedYear9TBox() />
		<cfset var localhcpcLengthOfNeedMonth9TBox = arguments.bean.gethcpcLengthOfNeedMonth9TBox() />
		<cfset var localhcpcCode10TBox = arguments.bean.gethcpcCode10TBox() />
		<cfset var localhcpcQty10TBox = arguments.bean.gethcpcQty10TBox() />
		<cfset var localhcpcProduct10TBox = arguments.bean.gethcpcProduct10TBox() />
		<cfset var localhcpcDX10TBox = arguments.bean.gethcpcDX10TBox() />
		<cfset var localhcpcDiagnosis10TBox = arguments.bean.gethcpcDiagnosis10TBox() />
		<cfset var localhcpcCost10TBox = arguments.bean.gethcpcCost10TBox() />
		<cfset var localhcpcLengthOfNeedYear10TBox = arguments.bean.gethcpcLengthOfNeedYear10TBox() />
		<cfset var localhcpcLengthOfNeedMonth10TBox = arguments.bean.gethcpcLengthOfNeedMonth10TBox() />
		<cfset var localhcpcCode11TBox = arguments.bean.gethcpcCode11TBox() />
		<cfset var localhcpcQty11TBox = arguments.bean.gethcpcQty11TBox() />
		<cfset var localhcpcProduct11TBox = arguments.bean.gethcpcProduct11TBox() />
		<cfset var localhcpcDX11TBox = arguments.bean.gethcpcDX11TBox() />
		<cfset var localhcpcDiagnosis11TBox = arguments.bean.gethcpcDiagnosis11TBox() />
		<cfset var localhcpcCost11TBox = arguments.bean.gethcpcCost11TBox() />
		<cfset var localhcpcLengthOfNeedYear11TBox = arguments.bean.gethcpcLengthOfNeedYear11TBox() />
		<cfset var localhcpcLengthOfNeedMonth11TBox = arguments.bean.gethcpcLengthOfNeedMonth11TBox() />
		<cfset var localhcpcCode12TBox = arguments.bean.gethcpcCode12TBox() />
		<cfset var localhcpcQty12TBox = arguments.bean.gethcpcQty12TBox() />
		<cfset var localhcpcProduct12TBox = arguments.bean.gethcpcProduct12TBox() />
		<cfset var localhcpcDX12TBox = arguments.bean.gethcpcDX12TBox() />
		<cfset var localhcpcDiagnosis12TBox = arguments.bean.gethcpcDiagnosis12TBox() />
		<cfset var localhcpcCost12TBox = arguments.bean.gethcpcCost12TBox() />
		<cfset var localhcpcLengthOfNeedYear12TBox = arguments.bean.gethcpcLengthOfNeedYear12TBox() />
		<cfset var localhcpcLengthOfNeedMonth12TBox = arguments.bean.gethcpcLengthOfNeedMonth12TBox() />
		<cfset var localhcpcCode13TBox = arguments.bean.gethcpcCode13TBox() />
		<cfset var localhcpcQty13TBox = arguments.bean.gethcpcQty13TBox() />
		<cfset var localhcpcProduct13TBox = arguments.bean.gethcpcProduct13TBox() />
		<cfset var localhcpcDX13TBox = arguments.bean.gethcpcDX13TBox() />
		<cfset var localhcpcDiagnosis13TBox = arguments.bean.gethcpcDiagnosis13TBox() />
		<cfset var localhcpcCost13TBox = arguments.bean.gethcpcCost13TBox() />
		<cfset var localhcpcLengthOfNeedYear13TBox = arguments.bean.gethcpcLengthOfNeedYear13TBox() />
		<cfset var localhcpcLengthOfNeedMonth13TBox = arguments.bean.gethcpcLengthOfNeedMonth13TBox() />
		<cfset var localhcpcCode14TBox = arguments.bean.gethcpcCode14TBox() />
		<cfset var localhcpcQty14TBox = arguments.bean.gethcpcQty14TBox() />
		<cfset var localhcpcProduct14TBox = arguments.bean.gethcpcProduct14TBox() />
		<cfset var localhcpcDX14TBox = arguments.bean.gethcpcDX14TBox() />
		<cfset var localhcpcDiagnosis14TBox = arguments.bean.gethcpcDiagnosis14TBox() />
		<cfset var localhcpcCost14TBox = arguments.bean.gethcpcCost14TBox() />
		<cfset var localhcpcLengthOfNeedYear14TBox = arguments.bean.gethcpcLengthOfNeedYear14TBox() />
		<cfset var localhcpcLengthOfNeedMonth14TBox = arguments.bean.gethcpcLengthOfNeedMonth14TBox() />
		<cfset var localhcpcCode15TBox = arguments.bean.gethcpcCode15TBox() />
		<cfset var localhcpcQty15TBox = arguments.bean.gethcpcQty15TBox() />
		<cfset var localhcpcProduct15TBox = arguments.bean.gethcpcProduct15TBox() />
		<cfset var localhcpcDX15TBox = arguments.bean.gethcpcDX15TBox() />
		<cfset var localhcpcDiagnosis15TBox = arguments.bean.gethcpcDiagnosis15TBox() />
		<cfset var localhcpcCost15TBox = arguments.bean.gethcpcCost15TBox() />
		<cfset var localhcpcLengthOfNeedYear15TBox = arguments.bean.gethcpcLengthOfNeedYear15TBox() />
		<cfset var localhcpcLengthOfNeedMonth15TBox = arguments.bean.gethcpcLengthOfNeedMonth15TBox() />
		<cfset var localhcpcCode16TBox = arguments.bean.gethcpcCode16TBox() />
		<cfset var localhcpcQty16TBox = arguments.bean.gethcpcQty16TBox() />
		<cfset var localhcpcProduct16TBox = arguments.bean.gethcpcProduct16TBox() />
		<cfset var localhcpcDX16TBox = arguments.bean.gethcpcDX16TBox() />
		<cfset var localhcpcDiagnosis16TBox = arguments.bean.gethcpcDiagnosis16TBox() />
		<cfset var localhcpcCost16TBox = arguments.bean.gethcpcCost16TBox() />
		<cfset var localhcpcLengthOfNeedYear16TBox = arguments.bean.gethcpcLengthOfNeedYear16TBox() />
		<cfset var localhcpcLengthOfNeedMonth16TBox = arguments.bean.gethcpcLengthOfNeedMonth16TBox() />
		<cfset var localhcpcCode17TBox = arguments.bean.gethcpcCode17TBox() />
		<cfset var localhcpcQty17TBox = arguments.bean.gethcpcQty17TBox() />
		<cfset var localhcpcProduct17TBox = arguments.bean.gethcpcProduct17TBox() />
		<cfset var localhcpcDX17TBox = arguments.bean.gethcpcDX17TBox() />
		<cfset var localhcpcDiagnosis17TBox = arguments.bean.gethcpcDiagnosis17TBox() />
		<cfset var localhcpcCost17TBox = arguments.bean.gethcpcCost17TBox() />
		<cfset var localhcpcLengthOfNeedYear17TBox = arguments.bean.gethcpcLengthOfNeedYear17TBox() />
		<cfset var localhcpcLengthOfNeedMonth17TBox = arguments.bean.gethcpcLengthOfNeedMonth17TBox() />
		<cfset var localhcpcCode18TBox = arguments.bean.gethcpcCode18TBox() />
		<cfset var localhcpcQty18TBox = arguments.bean.gethcpcQty18TBox() />
		<cfset var localhcpcProduct18TBox = arguments.bean.gethcpcProduct18TBox() />
		<cfset var localhcpcDX18TBox = arguments.bean.gethcpcDX18TBox() />
		<cfset var localhcpcDiagnosis18TBox = arguments.bean.gethcpcDiagnosis18TBox() />
		<cfset var localhcpcCost18TBox = arguments.bean.gethcpcCost18TBox() />
		<cfset var localhcpcLengthOfNeedYear18TBox = arguments.bean.gethcpcLengthOfNeedYear18TBox() />
		<cfset var localhcpcLengthOfNeedMonth18TBox = arguments.bean.gethcpcLengthOfNeedMonth18TBox() />
		<cfset var localhcpcCode19TBox = arguments.bean.gethcpcCode19TBox() />
		<cfset var localhcpcQty19TBox = arguments.bean.gethcpcQty19TBox() />
		<cfset var localhcpcProduct19TBox = arguments.bean.gethcpcProduct19TBox() />
		<cfset var localhcpcDX19TBox = arguments.bean.gethcpcDX19TBox() />
		<cfset var localhcpcDiagnosis19TBox = arguments.bean.gethcpcDiagnosis19TBox() />
		<cfset var localhcpcCost19TBox = arguments.bean.gethcpcCost19TBox() />
		<cfset var localhcpcLengthOfNeedYear19TBox = arguments.bean.gethcpcLengthOfNeedYear19TBox() />
		<cfset var localhcpcLengthOfNeedMonth19TBox = arguments.bean.gethcpcLengthOfNeedMonth19TBox() />
		<cfset var localhcpcCode20TBox = arguments.bean.gethcpcCode20TBox() />
		<cfset var localhcpcQty20TBox = arguments.bean.gethcpcQty20TBox() />
		<cfset var localhcpcProduct20TBox = arguments.bean.gethcpcProduct20TBox() />
		<cfset var localhcpcDX20TBox = arguments.bean.gethcpcDX20TBox() />
		<cfset var localhcpcDiagnosis20TBox = arguments.bean.gethcpcDiagnosis20TBox() />
		<cfset var localhcpcCost20TBox = arguments.bean.gethcpcCost20TBox() />
		<cfset var localhcpcLengthOfNeedYear20TBox = arguments.bean.gethcpcLengthOfNeedYear20TBox() />
		<cfset var localhcpcLengthOfNeedMonth20TBox = arguments.bean.gethcpcLengthOfNeedMonth20TBox() />
		<cfset var localhcpcCode21TBox = arguments.bean.gethcpcCode21TBox() />
		<cfset var localhcpcQty21TBox = arguments.bean.gethcpcQty21TBox() />
		<cfset var localhcpcProduct21TBox = arguments.bean.gethcpcProduct21TBox() />
		<cfset var localhcpcDX21TBox = arguments.bean.gethcpcDX21TBox() />
		<cfset var localhcpcDiagnosis21TBox = arguments.bean.gethcpcDiagnosis21TBox() />
		<cfset var localhcpcCost21TBox = arguments.bean.gethcpcCost21TBox() />
		<cfset var localhcpcLengthOfNeedYear21TBox = arguments.bean.gethcpcLengthOfNeedYear21TBox() />
		<cfset var localhcpcLengthOfNeedMonth21TBox = arguments.bean.gethcpcLengthOfNeedMonth21TBox() />
		<cfset var localhcpcCode22TBox = arguments.bean.gethcpcCode22TBox() />
		<cfset var localhcpcQty22TBox = arguments.bean.gethcpcQty22TBox() />
		<cfset var localhcpcProduct22TBox = arguments.bean.gethcpcProduct22TBox() />
		<cfset var localhcpcDX22TBox = arguments.bean.gethcpcDX22TBox() />
		<cfset var localhcpcDiagnosis22TBox = arguments.bean.gethcpcDiagnosis22TBox() />
		<cfset var localhcpcCost22TBox = arguments.bean.gethcpcCost22TBox() />
		<cfset var localhcpcLengthOfNeedYear22TBox = arguments.bean.gethcpcLengthOfNeedYear22TBox() />
		<cfset var localhcpcLengthOfNeedMonth22TBox = arguments.bean.gethcpcLengthOfNeedMonth22TBox() />
		<cfset var localhcpcCode23TBox = arguments.bean.gethcpcCode23TBox() />
		<cfset var localhcpcQty23TBox = arguments.bean.gethcpcQty23TBox() />
		<cfset var localhcpcProduct23TBox = arguments.bean.gethcpcProduct23TBox() />
		<cfset var localhcpcDX23TBox = arguments.bean.gethcpcDX23TBox() />
		<cfset var localhcpcDiagnosis23TBox = arguments.bean.gethcpcDiagnosis23TBox() />
		<cfset var localhcpcCost23TBox = arguments.bean.gethcpcCost23TBox() />
		<cfset var localhcpcLengthOfNeedYear23TBox = arguments.bean.gethcpcLengthOfNeedYear23TBox() />
		<cfset var localhcpcLengthOfNeedMonth23TBox = arguments.bean.gethcpcLengthOfNeedMonth23TBox() />
		<cfset var localhcpcCode24TBox = arguments.bean.gethcpcCode24TBox() />
		<cfset var localhcpcQty24TBox = arguments.bean.gethcpcQty24TBox() />
		<cfset var localhcpcProduct24TBox = arguments.bean.gethcpcProduct24TBox() />
		<cfset var localhcpcDX24TBox = arguments.bean.gethcpcDX24TBox() />
		<cfset var localhcpcDiagnosis24TBox = arguments.bean.gethcpcDiagnosis24TBox() />
		<cfset var localhcpcCost24TBox = arguments.bean.gethcpcCost24TBox() />
		<cfset var localhcpcLengthOfNeedYear24TBox = arguments.bean.gethcpcLengthOfNeedYear24TBox() />
		<cfset var localhcpcLengthOfNeedMonth24TBox = arguments.bean.gethcpcLengthOfNeedMonth24TBox() />
		<cfset var localhcpcCode25TBox = arguments.bean.gethcpcCode25TBox() />
		<cfset var localhcpcQty25TBox = arguments.bean.gethcpcQty25TBox() />
		<cfset var localhcpcProduct25TBox = arguments.bean.gethcpcProduct25TBox() />
		<cfset var localhcpcDX25TBox = arguments.bean.gethcpcDX25TBox() />
		<cfset var localhcpcDiagnosis25TBox = arguments.bean.gethcpcDiagnosis25TBox() />
		<cfset var localhcpcCost25TBox = arguments.bean.gethcpcCost25TBox() />
		<cfset var localhcpcLengthOfNeedYear25TBox = arguments.bean.gethcpcLengthOfNeedYear25TBox() />
		<cfset var localhcpcLengthOfNeedMonth25TBox = arguments.bean.gethcpcLengthOfNeedMonth25TBox() />
		<cfset var localhcpcCode26TBox = arguments.bean.gethcpcCode26TBox() />
		<cfset var localhcpcQty26TBox = arguments.bean.gethcpcQty26TBox() />
		<cfset var localhcpcProduct26TBox = arguments.bean.gethcpcProduct26TBox() />
		<cfset var localhcpcDX26TBox = arguments.bean.gethcpcDX26TBox() />
		<cfset var localhcpcDiagnosis26TBox = arguments.bean.gethcpcDiagnosis26TBox() />
		<cfset var localhcpcCost26TBox = arguments.bean.gethcpcCost26TBox() />
		<cfset var localhcpcLengthOfNeedYear26TBox = arguments.bean.gethcpcLengthOfNeedYear26TBox() />
		<cfset var localhcpcLengthOfNeedMonth26TBox = arguments.bean.gethcpcLengthOfNeedMonth26TBox() />
		<cfset var localhcpcCode27TBox = arguments.bean.gethcpcCode27TBox() />
		<cfset var localhcpcQty27TBox = arguments.bean.gethcpcQty27TBox() />
		<cfset var localhcpcProduct27TBox = arguments.bean.gethcpcProduct27TBox() />
		<cfset var localhcpcDX27TBox = arguments.bean.gethcpcDX27TBox() />
		<cfset var localhcpcDiagnosis27TBox = arguments.bean.gethcpcDiagnosis27TBox() />
		<cfset var localhcpcCost27TBox = arguments.bean.gethcpcCost27TBox() />
		<cfset var localhcpcLengthOfNeedYear27TBox = arguments.bean.gethcpcLengthOfNeedYear27TBox() />
		<cfset var localhcpcLengthOfNeedMonth27TBox = arguments.bean.gethcpcLengthOfNeedMonth27TBox() />
		<cfset var localhcpcCode28TBox = arguments.bean.gethcpcCode28TBox() />
		<cfset var localhcpcQty28TBox = arguments.bean.gethcpcQty28TBox() />
		<cfset var localhcpcProduct28TBox = arguments.bean.gethcpcProduct28TBox() />
		<cfset var localhcpcDX28TBox = arguments.bean.gethcpcDX28TBox() />
		<cfset var localhcpcDiagnosis28TBox = arguments.bean.gethcpcDiagnosis28TBox() />
		<cfset var localhcpcCost28TBox = arguments.bean.gethcpcCost28TBox() />
		<cfset var localhcpcLengthOfNeedYear28TBox = arguments.bean.gethcpcLengthOfNeedYear28TBox() />
		<cfset var localhcpcLengthOfNeedMonth28TBox = arguments.bean.gethcpcLengthOfNeedMonth28TBox() />
		<cfset var localhcpcCode29TBox = arguments.bean.gethcpcCode29TBox() />
		<cfset var localhcpcQty29TBox = arguments.bean.gethcpcQty29TBox() />
		<cfset var localhcpcProduct29TBox = arguments.bean.gethcpcProduct29TBox() />
		<cfset var localhcpcDX29TBox = arguments.bean.gethcpcDX29TBox() />
		<cfset var localhcpcDiagnosis29TBox = arguments.bean.gethcpcDiagnosis29TBox() />
		<cfset var localhcpcCost29TBox = arguments.bean.gethcpcCost29TBox() />
		<cfset var localhcpcLengthOfNeedYear29TBox = arguments.bean.gethcpcLengthOfNeedYear29TBox() />
		<cfset var localhcpcLengthOfNeedMonth29TBox = arguments.bean.gethcpcLengthOfNeedMonth29TBox() />
		<cfset var localhcpcCode30TBox = arguments.bean.gethcpcCode30TBox() />
		<cfset var localhcpcQty30TBox = arguments.bean.gethcpcQty30TBox() />
		<cfset var localhcpcProduct30TBox = arguments.bean.gethcpcProduct30TBox() />
		<cfset var localhcpcDX30TBox = arguments.bean.gethcpcDX30TBox() />
		<cfset var localhcpcDiagnosis30TBox = arguments.bean.gethcpcDiagnosis30TBox() />
		<cfset var localhcpcCost30TBox = arguments.bean.gethcpcCost30TBox() />
		<cfset var localhcpcLengthOfNeedYear30TBox = arguments.bean.gethcpcLengthOfNeedYear30TBox() />
		<cfset var localhcpcLengthOfNeedMonth30TBox = arguments.bean.gethcpcLengthOfNeedMonth30TBox() />
		<cfset var localhcpcCode31TBox = arguments.bean.gethcpcCode31TBox() />
		<cfset var localhcpcQty31TBox = arguments.bean.gethcpcQty31TBox() />
		<cfset var localhcpcProduct31TBox = arguments.bean.gethcpcProduct31TBox() />
		<cfset var localhcpcDX31TBox = arguments.bean.gethcpcDX31TBox() />
		<cfset var localhcpcDiagnosis31TBox = arguments.bean.gethcpcDiagnosis31TBox() />
		<cfset var localhcpcCost31TBox = arguments.bean.gethcpcCost31TBox() />
		<cfset var localhcpcLengthOfNeedYear31TBox = arguments.bean.gethcpcLengthOfNeedYear31TBox() />
		<cfset var localhcpcLengthOfNeedMonth31TBox = arguments.bean.gethcpcLengthOfNeedMonth31TBox() />
		<cfset var localhcpcCode32TBox = arguments.bean.gethcpcCode32TBox() />
		<cfset var localhcpcQty32TBox = arguments.bean.gethcpcQty32TBox() />
		<cfset var localhcpcProduct32TBox = arguments.bean.gethcpcProduct32TBox() />
		<cfset var localhcpcDX32TBox = arguments.bean.gethcpcDX32TBox() />
		<cfset var localhcpcDiagnosis32TBox = arguments.bean.gethcpcDiagnosis32TBox() />
		<cfset var localhcpcCost32TBox = arguments.bean.gethcpcCost32TBox() />
		<cfset var localhcpcLengthOfNeedYear32TBox = arguments.bean.gethcpcLengthOfNeedYear32TBox() />
		<cfset var localhcpcLengthOfNeedMonth32TBox = arguments.bean.gethcpcLengthOfNeedMonth32TBox() />
		<cfset var localhcpcCode33TBox = arguments.bean.gethcpcCode33TBox() />
		<cfset var localhcpcQty33TBox = arguments.bean.gethcpcQty33TBox() />
		<cfset var localhcpcProduct33TBox = arguments.bean.gethcpcProduct33TBox() />
		<cfset var localhcpcDX33TBox = arguments.bean.gethcpcDX33TBox() />
		<cfset var localhcpcDiagnosis33TBox = arguments.bean.gethcpcDiagnosis33TBox() />
		<cfset var localhcpcCost33TBox = arguments.bean.gethcpcCost33TBox() />
		<cfset var localhcpcLengthOfNeedYear33TBox = arguments.bean.gethcpcLengthOfNeedYear33TBox() />
		<cfset var localhcpcLengthOfNeedMonth33TBox = arguments.bean.gethcpcLengthOfNeedMonth33TBox() />
		<cfset var localhcpcCode34TBox = arguments.bean.gethcpcCode34TBox() />
		<cfset var localhcpcQty34TBox = arguments.bean.gethcpcQty34TBox() />
		<cfset var localhcpcProduct34TBox = arguments.bean.gethcpcProduct34TBox() />
		<cfset var localhcpcDX34TBox = arguments.bean.gethcpcDX34TBox() />
		<cfset var localhcpcDiagnosis34TBox = arguments.bean.gethcpcDiagnosis34TBox() />
		<cfset var localhcpcCost34TBox = arguments.bean.gethcpcCost34TBox() />
		<cfset var localhcpcLengthOfNeedYear34TBox = arguments.bean.gethcpcLengthOfNeedYear34TBox() />
		<cfset var localhcpcLengthOfNeedMonth34TBox = arguments.bean.gethcpcLengthOfNeedMonth34TBox() />
		<cfset var localhcpcCode35TBox = arguments.bean.gethcpcCode35TBox() />
		<cfset var localhcpcQty35TBox = arguments.bean.gethcpcQty35TBox() />
		<cfset var localhcpcProduct35TBox = arguments.bean.gethcpcProduct35TBox() />
		<cfset var localhcpcDX35TBox = arguments.bean.gethcpcDX35TBox() />
		<cfset var localhcpcDiagnosis35TBox = arguments.bean.gethcpcDiagnosis35TBox() />
		<cfset var localhcpcCost35TBox = arguments.bean.gethcpcCost35TBox() />
		<cfset var localhcpcLengthOfNeedYear35TBox = arguments.bean.gethcpcLengthOfNeedYear35TBox() />
		<cfset var localhcpcLengthOfNeedMonth35TBox = arguments.bean.gethcpcLengthOfNeedMonth35TBox() />
		<cfset var localhcpcCode36TBox = arguments.bean.gethcpcCode36TBox() />
		<cfset var localhcpcQty36TBox = arguments.bean.gethcpcQty36TBox() />
		<cfset var localhcpcProduct36TBox = arguments.bean.gethcpcProduct36TBox() />
		<cfset var localhcpcDX36TBox = arguments.bean.gethcpcDX36TBox() />
		<cfset var localhcpcDiagnosis36TBox = arguments.bean.gethcpcDiagnosis36TBox() />
		<cfset var localhcpcCost36TBox = arguments.bean.gethcpcCost36TBox() />
		<cfset var localhcpcLengthOfNeedYear36TBox = arguments.bean.gethcpcLengthOfNeedYear36TBox() />
		<cfset var localhcpcLengthOfNeedMonth36TBox = arguments.bean.gethcpcLengthOfNeedMonth36TBox() />
		<cfset var localhcpcCode37TBox = arguments.bean.gethcpcCode37TBox() />
		<cfset var localhcpcQty37TBox = arguments.bean.gethcpcQty37TBox() />
		<cfset var localhcpcProduct37TBox = arguments.bean.gethcpcProduct37TBox() />
		<cfset var localhcpcDX37TBox = arguments.bean.gethcpcDX37TBox() />
		<cfset var localhcpcDiagnosis37TBox = arguments.bean.gethcpcDiagnosis37TBox() />
		<cfset var localhcpcCost37TBox = arguments.bean.gethcpcCost37TBox() />
		<cfset var localhcpcLengthOfNeedYear37TBox = arguments.bean.gethcpcLengthOfNeedYear37TBox() />
		<cfset var localhcpcLengthOfNeedMonth37TBox = arguments.bean.gethcpcLengthOfNeedMonth37TBox() />
		<cfset var localhcpcCode38TBox = arguments.bean.gethcpcCode38TBox() />
		<cfset var localhcpcQty38TBox = arguments.bean.gethcpcQty38TBox() />
		<cfset var localhcpcProduct38TBox = arguments.bean.gethcpcProduct38TBox() />
		<cfset var localhcpcDX38TBox = arguments.bean.gethcpcDX38TBox() />
		<cfset var localhcpcDiagnosis38TBox = arguments.bean.gethcpcDiagnosis38TBox() />
		<cfset var localhcpcCost38TBox = arguments.bean.gethcpcCost38TBox() />
		<cfset var localhcpcLengthOfNeedYear38TBox = arguments.bean.gethcpcLengthOfNeedYear38TBox() />
		<cfset var localhcpcLengthOfNeedMonth38TBox = arguments.bean.gethcpcLengthOfNeedMonth38TBox() />
		<cfset var localhcpcCode39TBox = arguments.bean.gethcpcCode39TBox() />
		<cfset var localhcpcQty39TBox = arguments.bean.gethcpcQty39TBox() />
		<cfset var localhcpcProduct39TBox = arguments.bean.gethcpcProduct39TBox() />
		<cfset var localhcpcDX39TBox = arguments.bean.gethcpcDX39TBox() />
		<cfset var localhcpcDiagnosis39TBox = arguments.bean.gethcpcDiagnosis39TBox() />
		<cfset var localhcpcCost39TBox = arguments.bean.gethcpcCost39TBox() />
		<cfset var localhcpcLengthOfNeedYear39TBox = arguments.bean.gethcpcLengthOfNeedYear39TBox() />
		<cfset var localhcpcLengthOfNeedMonth39TBox = arguments.bean.gethcpcLengthOfNeedMonth39TBox() />
		<cfset var localhcpcCode40TBox = arguments.bean.gethcpcCode40TBox() />
		<cfset var localhcpcQty40TBox = arguments.bean.gethcpcQty40TBox() />
		<cfset var localhcpcProduct40TBox = arguments.bean.gethcpcProduct40TBox() />
		<cfset var localhcpcDX40TBox = arguments.bean.gethcpcDX40TBox() />
		<cfset var localhcpcDiagnosis40TBox = arguments.bean.gethcpcDiagnosis40TBox() />
		<cfset var localhcpcCost40TBox = arguments.bean.gethcpcCost40TBox() />
		<cfset var localhcpcLengthOfNeedYear40TBox = arguments.bean.gethcpcLengthOfNeedYear40TBox() />
		<cfset var localhcpcLengthOfNeedMonth40TBox = arguments.bean.gethcpcLengthOfNeedMonth40TBox() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateQuoteHCPC" datasource="#trim(arguments.ds)#">
				INSERT INTO quotehcpc (QuoteID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localQuoteID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localhcpcCode1TBox) NEQ "" AND trim(localhcpcCode1TBox) NEQ "@@" AND trim(localhcpcCode1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty1TBox) NEQ "" AND trim(localhcpcQty1TBox) NEQ "@@" AND trim(localhcpcQty1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct1TBox) NEQ "" AND trim(localhcpcProduct1TBox) NEQ "@@" AND trim(localhcpcProduct1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX1TBox) NEQ "" AND trim(localhcpcDX1TBox) NEQ "@@" AND trim(localhcpcDX1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis1TBox) NEQ "" AND trim(localhcpcDiagnosis1TBox) NEQ "@@" AND trim(localhcpcDiagnosis1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost1TBox) NEQ "" AND trim(localhcpcCost1TBox) NEQ "@@" AND trim(localhcpcCost1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear1TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear1TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth1TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth1TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth1TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode2TBox) NEQ "" AND trim(localhcpcCode2TBox) NEQ "@@" AND trim(localhcpcCode2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty2TBox) NEQ "" AND trim(localhcpcQty2TBox) NEQ "@@" AND trim(localhcpcQty2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct2TBox) NEQ "" AND trim(localhcpcProduct2TBox) NEQ "@@" AND trim(localhcpcProduct2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX2TBox) NEQ "" AND trim(localhcpcDX2TBox) NEQ "@@" AND trim(localhcpcDX2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis2TBox) NEQ "" AND trim(localhcpcDiagnosis2TBox) NEQ "@@" AND trim(localhcpcDiagnosis2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost2TBox) NEQ "" AND trim(localhcpcCost2TBox) NEQ "@@" AND trim(localhcpcCost2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear2TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear2TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth2TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth2TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode3TBox) NEQ "" AND trim(localhcpcCode3TBox) NEQ "@@" AND trim(localhcpcCode3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty3TBox) NEQ "" AND trim(localhcpcQty3TBox) NEQ "@@" AND trim(localhcpcQty3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct3TBox) NEQ "" AND trim(localhcpcProduct3TBox) NEQ "@@" AND trim(localhcpcProduct3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX3TBox) NEQ "" AND trim(localhcpcDX3TBox) NEQ "@@" AND trim(localhcpcDX3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis3TBox) NEQ "" AND trim(localhcpcDiagnosis3TBox) NEQ "@@" AND trim(localhcpcDiagnosis3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost3TBox) NEQ "" AND trim(localhcpcCost3TBox) NEQ "@@" AND trim(localhcpcCost3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear3TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear3TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth3TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth3TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth3TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode4TBox) NEQ "" AND trim(localhcpcCode4TBox) NEQ "@@" AND trim(localhcpcCode4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty4TBox) NEQ "" AND trim(localhcpcQty4TBox) NEQ "@@" AND trim(localhcpcQty4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct4TBox) NEQ "" AND trim(localhcpcProduct4TBox) NEQ "@@" AND trim(localhcpcProduct4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX4TBox) NEQ "" AND trim(localhcpcDX4TBox) NEQ "@@" AND trim(localhcpcDX4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis4TBox) NEQ "" AND trim(localhcpcDiagnosis4TBox) NEQ "@@" AND trim(localhcpcDiagnosis4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost4TBox) NEQ "" AND trim(localhcpcCost4TBox) NEQ "@@" AND trim(localhcpcCost4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear4TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear4TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth4TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth4TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth4TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode5TBox) NEQ "" AND trim(localhcpcCode5TBox) NEQ "@@" AND trim(localhcpcCode5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty5TBox) NEQ "" AND trim(localhcpcQty5TBox) NEQ "@@" AND trim(localhcpcQty5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct5TBox) NEQ "" AND trim(localhcpcProduct5TBox) NEQ "@@" AND trim(localhcpcProduct5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX5TBox) NEQ "" AND trim(localhcpcDX5TBox) NEQ "@@" AND trim(localhcpcDX5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis5TBox) NEQ "" AND trim(localhcpcDiagnosis5TBox) NEQ "@@" AND trim(localhcpcDiagnosis5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost5TBox) NEQ "" AND trim(localhcpcCost5TBox) NEQ "@@" AND trim(localhcpcCost5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear5TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear5TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth5TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth5TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth5TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode6TBox) NEQ "" AND trim(localhcpcCode6TBox) NEQ "@@" AND trim(localhcpcCode6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty6TBox) NEQ "" AND trim(localhcpcQty6TBox) NEQ "@@" AND trim(localhcpcQty6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct6TBox) NEQ "" AND trim(localhcpcProduct6TBox) NEQ "@@" AND trim(localhcpcProduct6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX6TBox) NEQ "" AND trim(localhcpcDX6TBox) NEQ "@@" AND trim(localhcpcDX6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis6TBox) NEQ "" AND trim(localhcpcDiagnosis6TBox) NEQ "@@" AND trim(localhcpcDiagnosis6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost6TBox) NEQ "" AND trim(localhcpcCost6TBox) NEQ "@@" AND trim(localhcpcCost6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear6TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear6TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth6TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth6TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth6TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode7TBox) NEQ "" AND trim(localhcpcCode7TBox) NEQ "@@" AND trim(localhcpcCode7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty7TBox) NEQ "" AND trim(localhcpcQty7TBox) NEQ "@@" AND trim(localhcpcQty7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct7TBox) NEQ "" AND trim(localhcpcProduct7TBox) NEQ "@@" AND trim(localhcpcProduct7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX7TBox) NEQ "" AND trim(localhcpcDX7TBox) NEQ "@@" AND trim(localhcpcDX7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis7TBox) NEQ "" AND trim(localhcpcDiagnosis7TBox) NEQ "@@" AND trim(localhcpcDiagnosis7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost7TBox) NEQ "" AND trim(localhcpcCost7TBox) NEQ "@@" AND trim(localhcpcCost7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear7TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear7TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth7TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth7TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth7TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode8TBox) NEQ "" AND trim(localhcpcCode8TBox) NEQ "@@" AND trim(localhcpcCode8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty8TBox) NEQ "" AND trim(localhcpcQty8TBox) NEQ "@@" AND trim(localhcpcQty8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct8TBox) NEQ "" AND trim(localhcpcProduct8TBox) NEQ "@@" AND trim(localhcpcProduct8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX8TBox) NEQ "" AND trim(localhcpcDX8TBox) NEQ "@@" AND trim(localhcpcDX8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis8TBox) NEQ "" AND trim(localhcpcDiagnosis8TBox) NEQ "@@" AND trim(localhcpcDiagnosis8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost8TBox) NEQ "" AND trim(localhcpcCost8TBox) NEQ "@@" AND trim(localhcpcCost8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear8TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear8TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth8TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth8TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth8TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode9TBox) NEQ "" AND trim(localhcpcCode9TBox) NEQ "@@" AND trim(localhcpcCode9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty9TBox) NEQ "" AND trim(localhcpcQty9TBox) NEQ "@@" AND trim(localhcpcQty9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct9TBox) NEQ "" AND trim(localhcpcProduct9TBox) NEQ "@@" AND trim(localhcpcProduct9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX9TBox) NEQ "" AND trim(localhcpcDX9TBox) NEQ "@@" AND trim(localhcpcDX9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis9TBox) NEQ "" AND trim(localhcpcDiagnosis9TBox) NEQ "@@" AND trim(localhcpcDiagnosis9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost9TBox) NEQ "" AND trim(localhcpcCost9TBox) NEQ "@@" AND trim(localhcpcCost9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear9TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear9TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth9TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth9TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth9TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode10TBox) NEQ "" AND trim(localhcpcCode10TBox) NEQ "@@" AND trim(localhcpcCode10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty10TBox) NEQ "" AND trim(localhcpcQty10TBox) NEQ "@@" AND trim(localhcpcQty10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct10TBox) NEQ "" AND trim(localhcpcProduct10TBox) NEQ "@@" AND trim(localhcpcProduct10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX10TBox) NEQ "" AND trim(localhcpcDX10TBox) NEQ "@@" AND trim(localhcpcDX10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis10TBox) NEQ "" AND trim(localhcpcDiagnosis10TBox) NEQ "@@" AND trim(localhcpcDiagnosis10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost10TBox) NEQ "" AND trim(localhcpcCost10TBox) NEQ "@@" AND trim(localhcpcCost10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear10TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear10TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth10TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth10TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth10TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode11TBox) NEQ "" AND trim(localhcpcCode11TBox) NEQ "@@" AND trim(localhcpcCode11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty11TBox) NEQ "" AND trim(localhcpcQty11TBox) NEQ "@@" AND trim(localhcpcQty11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct11TBox) NEQ "" AND trim(localhcpcProduct11TBox) NEQ "@@" AND trim(localhcpcProduct11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX11TBox) NEQ "" AND trim(localhcpcDX11TBox) NEQ "@@" AND trim(localhcpcDX11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis11TBox) NEQ "" AND trim(localhcpcDiagnosis11TBox) NEQ "@@" AND trim(localhcpcDiagnosis11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost11TBox) NEQ "" AND trim(localhcpcCost11TBox) NEQ "@@" AND trim(localhcpcCost11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear11TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear11TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth11TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth11TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth11TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode12TBox) NEQ "" AND trim(localhcpcCode12TBox) NEQ "@@" AND trim(localhcpcCode12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty12TBox) NEQ "" AND trim(localhcpcQty12TBox) NEQ "@@" AND trim(localhcpcQty12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct12TBox) NEQ "" AND trim(localhcpcProduct12TBox) NEQ "@@" AND trim(localhcpcProduct12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX12TBox) NEQ "" AND trim(localhcpcDX12TBox) NEQ "@@" AND trim(localhcpcDX12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis12TBox) NEQ "" AND trim(localhcpcDiagnosis12TBox) NEQ "@@" AND trim(localhcpcDiagnosis12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost12TBox) NEQ "" AND trim(localhcpcCost12TBox) NEQ "@@" AND trim(localhcpcCost12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear12TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear12TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth12TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth12TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth12TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode13TBox) NEQ "" AND trim(localhcpcCode13TBox) NEQ "@@" AND trim(localhcpcCode13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty13TBox) NEQ "" AND trim(localhcpcQty13TBox) NEQ "@@" AND trim(localhcpcQty13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct13TBox) NEQ "" AND trim(localhcpcProduct13TBox) NEQ "@@" AND trim(localhcpcProduct13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX13TBox) NEQ "" AND trim(localhcpcDX13TBox) NEQ "@@" AND trim(localhcpcDX13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis13TBox) NEQ "" AND trim(localhcpcDiagnosis13TBox) NEQ "@@" AND trim(localhcpcDiagnosis13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost13TBox) NEQ "" AND trim(localhcpcCost13TBox) NEQ "@@" AND trim(localhcpcCost13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear13TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear13TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth13TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth13TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth13TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode14TBox) NEQ "" AND trim(localhcpcCode14TBox) NEQ "@@" AND trim(localhcpcCode14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty14TBox) NEQ "" AND trim(localhcpcQty14TBox) NEQ "@@" AND trim(localhcpcQty14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct14TBox) NEQ "" AND trim(localhcpcProduct14TBox) NEQ "@@" AND trim(localhcpcProduct14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX14TBox) NEQ "" AND trim(localhcpcDX14TBox) NEQ "@@" AND trim(localhcpcDX14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis14TBox) NEQ "" AND trim(localhcpcDiagnosis14TBox) NEQ "@@" AND trim(localhcpcDiagnosis14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost14TBox) NEQ "" AND trim(localhcpcCost14TBox) NEQ "@@" AND trim(localhcpcCost14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear14TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear14TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth14TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth14TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth14TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode15TBox) NEQ "" AND trim(localhcpcCode15TBox) NEQ "@@" AND trim(localhcpcCode15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty15TBox) NEQ "" AND trim(localhcpcQty15TBox) NEQ "@@" AND trim(localhcpcQty15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct15TBox) NEQ "" AND trim(localhcpcProduct15TBox) NEQ "@@" AND trim(localhcpcProduct15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX15TBox) NEQ "" AND trim(localhcpcDX15TBox) NEQ "@@" AND trim(localhcpcDX15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis15TBox) NEQ "" AND trim(localhcpcDiagnosis15TBox) NEQ "@@" AND trim(localhcpcDiagnosis15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost15TBox) NEQ "" AND trim(localhcpcCost15TBox) NEQ "@@" AND trim(localhcpcCost15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear15TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear15TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth15TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth15TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth15TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode16TBox) NEQ "" AND trim(localhcpcCode16TBox) NEQ "@@" AND trim(localhcpcCode16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty16TBox) NEQ "" AND trim(localhcpcQty16TBox) NEQ "@@" AND trim(localhcpcQty16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct16TBox) NEQ "" AND trim(localhcpcProduct16TBox) NEQ "@@" AND trim(localhcpcProduct16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX16TBox) NEQ "" AND trim(localhcpcDX16TBox) NEQ "@@" AND trim(localhcpcDX16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis16TBox) NEQ "" AND trim(localhcpcDiagnosis16TBox) NEQ "@@" AND trim(localhcpcDiagnosis16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost16TBox) NEQ "" AND trim(localhcpcCost16TBox) NEQ "@@" AND trim(localhcpcCost16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear16TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear16TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth16TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth16TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth16TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode17TBox) NEQ "" AND trim(localhcpcCode17TBox) NEQ "@@" AND trim(localhcpcCode17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty17TBox) NEQ "" AND trim(localhcpcQty17TBox) NEQ "@@" AND trim(localhcpcQty17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct17TBox) NEQ "" AND trim(localhcpcProduct17TBox) NEQ "@@" AND trim(localhcpcProduct17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX17TBox) NEQ "" AND trim(localhcpcDX17TBox) NEQ "@@" AND trim(localhcpcDX17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis17TBox) NEQ "" AND trim(localhcpcDiagnosis17TBox) NEQ "@@" AND trim(localhcpcDiagnosis17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost17TBox) NEQ "" AND trim(localhcpcCost17TBox) NEQ "@@" AND trim(localhcpcCost17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear17TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear17TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth17TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth17TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth17TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode18TBox) NEQ "" AND trim(localhcpcCode18TBox) NEQ "@@" AND trim(localhcpcCode18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty18TBox) NEQ "" AND trim(localhcpcQty18TBox) NEQ "@@" AND trim(localhcpcQty18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct18TBox) NEQ "" AND trim(localhcpcProduct18TBox) NEQ "@@" AND trim(localhcpcProduct18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX18TBox) NEQ "" AND trim(localhcpcDX18TBox) NEQ "@@" AND trim(localhcpcDX18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis18TBox) NEQ "" AND trim(localhcpcDiagnosis18TBox) NEQ "@@" AND trim(localhcpcDiagnosis18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost18TBox) NEQ "" AND trim(localhcpcCost18TBox) NEQ "@@" AND trim(localhcpcCost18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear18TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear18TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth18TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth18TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth18TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode19TBox) NEQ "" AND trim(localhcpcCode19TBox) NEQ "@@" AND trim(localhcpcCode19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty19TBox) NEQ "" AND trim(localhcpcQty19TBox) NEQ "@@" AND trim(localhcpcQty19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct19TBox) NEQ "" AND trim(localhcpcProduct19TBox) NEQ "@@" AND trim(localhcpcProduct19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX19TBox) NEQ "" AND trim(localhcpcDX19TBox) NEQ "@@" AND trim(localhcpcDX19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis19TBox) NEQ "" AND trim(localhcpcDiagnosis19TBox) NEQ "@@" AND trim(localhcpcDiagnosis19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost19TBox) NEQ "" AND trim(localhcpcCost19TBox) NEQ "@@" AND trim(localhcpcCost19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear19TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear19TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth19TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth19TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth19TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode20TBox) NEQ "" AND trim(localhcpcCode20TBox) NEQ "@@" AND trim(localhcpcCode20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty20TBox) NEQ "" AND trim(localhcpcQty20TBox) NEQ "@@" AND trim(localhcpcQty20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct20TBox) NEQ "" AND trim(localhcpcProduct20TBox) NEQ "@@" AND trim(localhcpcProduct20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX20TBox) NEQ "" AND trim(localhcpcDX20TBox) NEQ "@@" AND trim(localhcpcDX20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis20TBox) NEQ "" AND trim(localhcpcDiagnosis20TBox) NEQ "@@" AND trim(localhcpcDiagnosis20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost20TBox) NEQ "" AND trim(localhcpcCost20TBox) NEQ "@@" AND trim(localhcpcCost20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear20TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear20TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth20TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth20TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth20TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode21TBox) NEQ "" AND trim(localhcpcCode21TBox) NEQ "@@" AND trim(localhcpcCode21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty21TBox) NEQ "" AND trim(localhcpcQty21TBox) NEQ "@@" AND trim(localhcpcQty21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct21TBox) NEQ "" AND trim(localhcpcProduct21TBox) NEQ "@@" AND trim(localhcpcProduct21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX21TBox) NEQ "" AND trim(localhcpcDX21TBox) NEQ "@@" AND trim(localhcpcDX21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis21TBox) NEQ "" AND trim(localhcpcDiagnosis21TBox) NEQ "@@" AND trim(localhcpcDiagnosis21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost21TBox) NEQ "" AND trim(localhcpcCost21TBox) NEQ "@@" AND trim(localhcpcCost21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear21TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear21TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth21TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth21TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth21TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode22TBox) NEQ "" AND trim(localhcpcCode22TBox) NEQ "@@" AND trim(localhcpcCode22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty22TBox) NEQ "" AND trim(localhcpcQty22TBox) NEQ "@@" AND trim(localhcpcQty22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct22TBox) NEQ "" AND trim(localhcpcProduct22TBox) NEQ "@@" AND trim(localhcpcProduct22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX22TBox) NEQ "" AND trim(localhcpcDX22TBox) NEQ "@@" AND trim(localhcpcDX22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis22TBox) NEQ "" AND trim(localhcpcDiagnosis22TBox) NEQ "@@" AND trim(localhcpcDiagnosis22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost22TBox) NEQ "" AND trim(localhcpcCost22TBox) NEQ "@@" AND trim(localhcpcCost22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear22TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear22TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth22TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth22TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth22TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode23TBox) NEQ "" AND trim(localhcpcCode23TBox) NEQ "@@" AND trim(localhcpcCode23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty23TBox) NEQ "" AND trim(localhcpcQty23TBox) NEQ "@@" AND trim(localhcpcQty23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct23TBox) NEQ "" AND trim(localhcpcProduct23TBox) NEQ "@@" AND trim(localhcpcProduct23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX23TBox) NEQ "" AND trim(localhcpcDX23TBox) NEQ "@@" AND trim(localhcpcDX23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis23TBox) NEQ "" AND trim(localhcpcDiagnosis23TBox) NEQ "@@" AND trim(localhcpcDiagnosis23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost23TBox) NEQ "" AND trim(localhcpcCost23TBox) NEQ "@@" AND trim(localhcpcCost23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear23TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear23TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth23TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth23TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth23TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode24TBox) NEQ "" AND trim(localhcpcCode24TBox) NEQ "@@" AND trim(localhcpcCode24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty24TBox) NEQ "" AND trim(localhcpcQty24TBox) NEQ "@@" AND trim(localhcpcQty24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct24TBox) NEQ "" AND trim(localhcpcProduct24TBox) NEQ "@@" AND trim(localhcpcProduct24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX24TBox) NEQ "" AND trim(localhcpcDX24TBox) NEQ "@@" AND trim(localhcpcDX24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis24TBox) NEQ "" AND trim(localhcpcDiagnosis24TBox) NEQ "@@" AND trim(localhcpcDiagnosis24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost24TBox) NEQ "" AND trim(localhcpcCost24TBox) NEQ "@@" AND trim(localhcpcCost24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear24TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear24TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth24TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth24TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth24TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode25TBox) NEQ "" AND trim(localhcpcCode25TBox) NEQ "@@" AND trim(localhcpcCode25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty25TBox) NEQ "" AND trim(localhcpcQty25TBox) NEQ "@@" AND trim(localhcpcQty25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct25TBox) NEQ "" AND trim(localhcpcProduct25TBox) NEQ "@@" AND trim(localhcpcProduct25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX25TBox) NEQ "" AND trim(localhcpcDX25TBox) NEQ "@@" AND trim(localhcpcDX25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis25TBox) NEQ "" AND trim(localhcpcDiagnosis25TBox) NEQ "@@" AND trim(localhcpcDiagnosis25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost25TBox) NEQ "" AND trim(localhcpcCost25TBox) NEQ "@@" AND trim(localhcpcCost25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear25TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear25TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth25TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth25TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth25TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode26TBox) NEQ "" AND trim(localhcpcCode26TBox) NEQ "@@" AND trim(localhcpcCode26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty26TBox) NEQ "" AND trim(localhcpcQty26TBox) NEQ "@@" AND trim(localhcpcQty26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct26TBox) NEQ "" AND trim(localhcpcProduct26TBox) NEQ "@@" AND trim(localhcpcProduct26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX26TBox) NEQ "" AND trim(localhcpcDX26TBox) NEQ "@@" AND trim(localhcpcDX26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis26TBox) NEQ "" AND trim(localhcpcDiagnosis26TBox) NEQ "@@" AND trim(localhcpcDiagnosis26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost26TBox) NEQ "" AND trim(localhcpcCost26TBox) NEQ "@@" AND trim(localhcpcCost26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear26TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear26TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth26TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth26TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth26TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode27TBox) NEQ "" AND trim(localhcpcCode27TBox) NEQ "@@" AND trim(localhcpcCode27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty27TBox) NEQ "" AND trim(localhcpcQty27TBox) NEQ "@@" AND trim(localhcpcQty27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct27TBox) NEQ "" AND trim(localhcpcProduct27TBox) NEQ "@@" AND trim(localhcpcProduct27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX27TBox) NEQ "" AND trim(localhcpcDX27TBox) NEQ "@@" AND trim(localhcpcDX27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis27TBox) NEQ "" AND trim(localhcpcDiagnosis27TBox) NEQ "@@" AND trim(localhcpcDiagnosis27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost27TBox) NEQ "" AND trim(localhcpcCost27TBox) NEQ "@@" AND trim(localhcpcCost27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear27TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear27TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth27TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth27TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth27TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode28TBox) NEQ "" AND trim(localhcpcCode28TBox) NEQ "@@" AND trim(localhcpcCode28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty28TBox) NEQ "" AND trim(localhcpcQty28TBox) NEQ "@@" AND trim(localhcpcQty28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct28TBox) NEQ "" AND trim(localhcpcProduct28TBox) NEQ "@@" AND trim(localhcpcProduct28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX28TBox) NEQ "" AND trim(localhcpcDX28TBox) NEQ "@@" AND trim(localhcpcDX28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis28TBox) NEQ "" AND trim(localhcpcDiagnosis28TBox) NEQ "@@" AND trim(localhcpcDiagnosis28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost28TBox) NEQ "" AND trim(localhcpcCost28TBox) NEQ "@@" AND trim(localhcpcCost28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear28TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear28TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth28TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth28TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth28TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode29TBox) NEQ "" AND trim(localhcpcCode29TBox) NEQ "@@" AND trim(localhcpcCode29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty29TBox) NEQ "" AND trim(localhcpcQty29TBox) NEQ "@@" AND trim(localhcpcQty29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct29TBox) NEQ "" AND trim(localhcpcProduct29TBox) NEQ "@@" AND trim(localhcpcProduct29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX29TBox) NEQ "" AND trim(localhcpcDX29TBox) NEQ "@@" AND trim(localhcpcDX29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis29TBox) NEQ "" AND trim(localhcpcDiagnosis29TBox) NEQ "@@" AND trim(localhcpcDiagnosis29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost29TBox) NEQ "" AND trim(localhcpcCost29TBox) NEQ "@@" AND trim(localhcpcCost29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear29TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear29TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth29TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth29TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth29TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode30TBox) NEQ "" AND trim(localhcpcCode30TBox) NEQ "@@" AND trim(localhcpcCode30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty30TBox) NEQ "" AND trim(localhcpcQty30TBox) NEQ "@@" AND trim(localhcpcQty30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct30TBox) NEQ "" AND trim(localhcpcProduct30TBox) NEQ "@@" AND trim(localhcpcProduct30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX30TBox) NEQ "" AND trim(localhcpcDX30TBox) NEQ "@@" AND trim(localhcpcDX30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis30TBox) NEQ "" AND trim(localhcpcDiagnosis30TBox) NEQ "@@" AND trim(localhcpcDiagnosis30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost30TBox) NEQ "" AND trim(localhcpcCost30TBox) NEQ "@@" AND trim(localhcpcCost30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear30TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear30TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth30TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth30TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth30TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode31TBox) NEQ "" AND trim(localhcpcCode31TBox) NEQ "@@" AND trim(localhcpcCode31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty31TBox) NEQ "" AND trim(localhcpcQty31TBox) NEQ "@@" AND trim(localhcpcQty31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct31TBox) NEQ "" AND trim(localhcpcProduct31TBox) NEQ "@@" AND trim(localhcpcProduct31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX31TBox) NEQ "" AND trim(localhcpcDX31TBox) NEQ "@@" AND trim(localhcpcDX31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis31TBox) NEQ "" AND trim(localhcpcDiagnosis31TBox) NEQ "@@" AND trim(localhcpcDiagnosis31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost31TBox) NEQ "" AND trim(localhcpcCost31TBox) NEQ "@@" AND trim(localhcpcCost31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear31TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear31TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth31TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth31TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth31TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode32TBox) NEQ "" AND trim(localhcpcCode32TBox) NEQ "@@" AND trim(localhcpcCode32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty32TBox) NEQ "" AND trim(localhcpcQty32TBox) NEQ "@@" AND trim(localhcpcQty32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct32TBox) NEQ "" AND trim(localhcpcProduct32TBox) NEQ "@@" AND trim(localhcpcProduct32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX32TBox) NEQ "" AND trim(localhcpcDX32TBox) NEQ "@@" AND trim(localhcpcDX32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis32TBox) NEQ "" AND trim(localhcpcDiagnosis32TBox) NEQ "@@" AND trim(localhcpcDiagnosis32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost32TBox) NEQ "" AND trim(localhcpcCost32TBox) NEQ "@@" AND trim(localhcpcCost32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear32TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear32TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth32TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth32TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth32TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode33TBox) NEQ "" AND trim(localhcpcCode33TBox) NEQ "@@" AND trim(localhcpcCode33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty33TBox) NEQ "" AND trim(localhcpcQty33TBox) NEQ "@@" AND trim(localhcpcQty33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct33TBox) NEQ "" AND trim(localhcpcProduct33TBox) NEQ "@@" AND trim(localhcpcProduct33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX33TBox) NEQ "" AND trim(localhcpcDX33TBox) NEQ "@@" AND trim(localhcpcDX33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis33TBox) NEQ "" AND trim(localhcpcDiagnosis33TBox) NEQ "@@" AND trim(localhcpcDiagnosis33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost33TBox) NEQ "" AND trim(localhcpcCost33TBox) NEQ "@@" AND trim(localhcpcCost33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear33TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear33TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth33TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth33TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth33TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode34TBox) NEQ "" AND trim(localhcpcCode34TBox) NEQ "@@" AND trim(localhcpcCode34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty34TBox) NEQ "" AND trim(localhcpcQty34TBox) NEQ "@@" AND trim(localhcpcQty34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct34TBox) NEQ "" AND trim(localhcpcProduct34TBox) NEQ "@@" AND trim(localhcpcProduct34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX34TBox) NEQ "" AND trim(localhcpcDX34TBox) NEQ "@@" AND trim(localhcpcDX34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis34TBox) NEQ "" AND trim(localhcpcDiagnosis34TBox) NEQ "@@" AND trim(localhcpcDiagnosis34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost34TBox) NEQ "" AND trim(localhcpcCost34TBox) NEQ "@@" AND trim(localhcpcCost34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear34TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear34TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth34TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth34TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth34TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode35TBox) NEQ "" AND trim(localhcpcCode35TBox) NEQ "@@" AND trim(localhcpcCode35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty35TBox) NEQ "" AND trim(localhcpcQty35TBox) NEQ "@@" AND trim(localhcpcQty35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct35TBox) NEQ "" AND trim(localhcpcProduct35TBox) NEQ "@@" AND trim(localhcpcProduct35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX35TBox) NEQ "" AND trim(localhcpcDX35TBox) NEQ "@@" AND trim(localhcpcDX35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis35TBox) NEQ "" AND trim(localhcpcDiagnosis35TBox) NEQ "@@" AND trim(localhcpcDiagnosis35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost35TBox) NEQ "" AND trim(localhcpcCost35TBox) NEQ "@@" AND trim(localhcpcCost35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear35TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear35TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth35TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth35TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth35TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode36TBox) NEQ "" AND trim(localhcpcCode36TBox) NEQ "@@" AND trim(localhcpcCode36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty36TBox) NEQ "" AND trim(localhcpcQty36TBox) NEQ "@@" AND trim(localhcpcQty36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct36TBox) NEQ "" AND trim(localhcpcProduct36TBox) NEQ "@@" AND trim(localhcpcProduct36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX36TBox) NEQ "" AND trim(localhcpcDX36TBox) NEQ "@@" AND trim(localhcpcDX36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis36TBox) NEQ "" AND trim(localhcpcDiagnosis36TBox) NEQ "@@" AND trim(localhcpcDiagnosis36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost36TBox) NEQ "" AND trim(localhcpcCost36TBox) NEQ "@@" AND trim(localhcpcCost36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear36TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear36TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth36TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth36TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth36TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode37TBox) NEQ "" AND trim(localhcpcCode37TBox) NEQ "@@" AND trim(localhcpcCode37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty37TBox) NEQ "" AND trim(localhcpcQty37TBox) NEQ "@@" AND trim(localhcpcQty37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct37TBox) NEQ "" AND trim(localhcpcProduct37TBox) NEQ "@@" AND trim(localhcpcProduct37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX37TBox) NEQ "" AND trim(localhcpcDX37TBox) NEQ "@@" AND trim(localhcpcDX37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis37TBox) NEQ "" AND trim(localhcpcDiagnosis37TBox) NEQ "@@" AND trim(localhcpcDiagnosis37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost37TBox) NEQ "" AND trim(localhcpcCost37TBox) NEQ "@@" AND trim(localhcpcCost37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear37TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear37TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth37TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth37TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth37TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode38TBox) NEQ "" AND trim(localhcpcCode38TBox) NEQ "@@" AND trim(localhcpcCode38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty38TBox) NEQ "" AND trim(localhcpcQty38TBox) NEQ "@@" AND trim(localhcpcQty38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct38TBox) NEQ "" AND trim(localhcpcProduct38TBox) NEQ "@@" AND trim(localhcpcProduct38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX38TBox) NEQ "" AND trim(localhcpcDX38TBox) NEQ "@@" AND trim(localhcpcDX38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis38TBox) NEQ "" AND trim(localhcpcDiagnosis38TBox) NEQ "@@" AND trim(localhcpcDiagnosis38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost38TBox) NEQ "" AND trim(localhcpcCost38TBox) NEQ "@@" AND trim(localhcpcCost38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear38TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear38TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth38TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth38TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth38TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode39TBox) NEQ "" AND trim(localhcpcCode39TBox) NEQ "@@" AND trim(localhcpcCode39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty39TBox) NEQ "" AND trim(localhcpcQty39TBox) NEQ "@@" AND trim(localhcpcQty39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct39TBox) NEQ "" AND trim(localhcpcProduct39TBox) NEQ "@@" AND trim(localhcpcProduct39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX39TBox) NEQ "" AND trim(localhcpcDX39TBox) NEQ "@@" AND trim(localhcpcDX39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis39TBox) NEQ "" AND trim(localhcpcDiagnosis39TBox) NEQ "@@" AND trim(localhcpcDiagnosis39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost39TBox) NEQ "" AND trim(localhcpcCost39TBox) NEQ "@@" AND trim(localhcpcCost39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear39TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear39TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth39TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth39TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth39TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCode40TBox) NEQ "" AND trim(localhcpcCode40TBox) NEQ "@@" AND trim(localhcpcCode40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcQty40TBox) NEQ "" AND trim(localhcpcQty40TBox) NEQ "@@" AND trim(localhcpcQty40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcProduct40TBox) NEQ "" AND trim(localhcpcProduct40TBox) NEQ "@@" AND trim(localhcpcProduct40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDX40TBox) NEQ "" AND trim(localhcpcDX40TBox) NEQ "@@" AND trim(localhcpcDX40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcDiagnosis40TBox) NEQ "" AND trim(localhcpcDiagnosis40TBox) NEQ "@@" AND trim(localhcpcDiagnosis40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcCost40TBox) NEQ "" AND trim(localhcpcCost40TBox) NEQ "@@" AND trim(localhcpcCost40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedYear40TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear40TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhcpcLengthOfNeedMonth40TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth40TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth40TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS QuoteHCPCID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setQuoteHCPCID(qCreateQuoteHCPC.QuoteHCPCID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="QuoteHCPCBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="QuoteHCPCID" required="yes" type="numeric" />		
		<cfset var qGetQuoteHCPC = "" />		
		
		<cfset qGetQuoteHCPC = getQuoteHCPC(trim(arguments.ds), trim(QuoteHCPCID)) />
				
		<cfif qGetQuoteHCPC.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objQuoteHCPC = createObject("component", "QuoteHCPCBean").init(arguments.ds);
			objQuoteHCPC.setQuoteHCPCID(qGetQuoteHCPC.QuoteHCPCID);
			objQuoteHCPC.setQuoteID(qGetQuoteHCPC.QuoteID);
			objQuoteHCPC.sethcpcCode1TBox(qGetQuoteHCPC.hcpcCode1TBox);
			objQuoteHCPC.sethcpcQty1TBox(qGetQuoteHCPC.hcpcQty1TBox);
			objQuoteHCPC.sethcpcProduct1TBox(qGetQuoteHCPC.hcpcProduct1TBox);
			objQuoteHCPC.sethcpcDX1TBox(qGetQuoteHCPC.hcpcDX1TBox);
			objQuoteHCPC.sethcpcDiagnosis1TBox(qGetQuoteHCPC.hcpcDiagnosis1TBox);
			objQuoteHCPC.sethcpcCost1TBox(qGetQuoteHCPC.hcpcCost1TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear1TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear1TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth1TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth1TBox);
			objQuoteHCPC.sethcpcCode2TBox(qGetQuoteHCPC.hcpcCode2TBox);
			objQuoteHCPC.sethcpcQty2TBox(qGetQuoteHCPC.hcpcQty2TBox);
			objQuoteHCPC.sethcpcProduct2TBox(qGetQuoteHCPC.hcpcProduct2TBox);
			objQuoteHCPC.sethcpcDX2TBox(qGetQuoteHCPC.hcpcDX2TBox);
			objQuoteHCPC.sethcpcDiagnosis2TBox(qGetQuoteHCPC.hcpcDiagnosis2TBox);
			objQuoteHCPC.sethcpcCost2TBox(qGetQuoteHCPC.hcpcCost2TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear2TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear2TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth2TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth2TBox);
			objQuoteHCPC.sethcpcCode3TBox(qGetQuoteHCPC.hcpcCode3TBox);
			objQuoteHCPC.sethcpcQty3TBox(qGetQuoteHCPC.hcpcQty3TBox);
			objQuoteHCPC.sethcpcProduct3TBox(qGetQuoteHCPC.hcpcProduct3TBox);
			objQuoteHCPC.sethcpcDX3TBox(qGetQuoteHCPC.hcpcDX3TBox);
			objQuoteHCPC.sethcpcDiagnosis3TBox(qGetQuoteHCPC.hcpcDiagnosis3TBox);
			objQuoteHCPC.sethcpcCost3TBox(qGetQuoteHCPC.hcpcCost3TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear3TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear3TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth3TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth3TBox);
			objQuoteHCPC.sethcpcCode4TBox(qGetQuoteHCPC.hcpcCode4TBox);
			objQuoteHCPC.sethcpcQty4TBox(qGetQuoteHCPC.hcpcQty4TBox);
			objQuoteHCPC.sethcpcProduct4TBox(qGetQuoteHCPC.hcpcProduct4TBox);
			objQuoteHCPC.sethcpcDX4TBox(qGetQuoteHCPC.hcpcDX4TBox);
			objQuoteHCPC.sethcpcDiagnosis4TBox(qGetQuoteHCPC.hcpcDiagnosis4TBox);
			objQuoteHCPC.sethcpcCost4TBox(qGetQuoteHCPC.hcpcCost4TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear4TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear4TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth4TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth4TBox);
			objQuoteHCPC.sethcpcCode5TBox(qGetQuoteHCPC.hcpcCode5TBox);
			objQuoteHCPC.sethcpcQty5TBox(qGetQuoteHCPC.hcpcQty5TBox);
			objQuoteHCPC.sethcpcProduct5TBox(qGetQuoteHCPC.hcpcProduct5TBox);
			objQuoteHCPC.sethcpcDX5TBox(qGetQuoteHCPC.hcpcDX5TBox);
			objQuoteHCPC.sethcpcDiagnosis5TBox(qGetQuoteHCPC.hcpcDiagnosis5TBox);
			objQuoteHCPC.sethcpcCost5TBox(qGetQuoteHCPC.hcpcCost5TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear5TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear5TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth5TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth5TBox);
			objQuoteHCPC.sethcpcCode6TBox(qGetQuoteHCPC.hcpcCode6TBox);
			objQuoteHCPC.sethcpcQty6TBox(qGetQuoteHCPC.hcpcQty6TBox);
			objQuoteHCPC.sethcpcProduct6TBox(qGetQuoteHCPC.hcpcProduct6TBox);
			objQuoteHCPC.sethcpcDX6TBox(qGetQuoteHCPC.hcpcDX6TBox);
			objQuoteHCPC.sethcpcDiagnosis6TBox(qGetQuoteHCPC.hcpcDiagnosis6TBox);
			objQuoteHCPC.sethcpcCost6TBox(qGetQuoteHCPC.hcpcCost6TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear6TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear6TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth6TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth6TBox);
			objQuoteHCPC.sethcpcCode7TBox(qGetQuoteHCPC.hcpcCode7TBox);
			objQuoteHCPC.sethcpcQty7TBox(qGetQuoteHCPC.hcpcQty7TBox);
			objQuoteHCPC.sethcpcProduct7TBox(qGetQuoteHCPC.hcpcProduct7TBox);
			objQuoteHCPC.sethcpcDX7TBox(qGetQuoteHCPC.hcpcDX7TBox);
			objQuoteHCPC.sethcpcDiagnosis7TBox(qGetQuoteHCPC.hcpcDiagnosis7TBox);
			objQuoteHCPC.sethcpcCost7TBox(qGetQuoteHCPC.hcpcCost7TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear7TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear7TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth7TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth7TBox);
			objQuoteHCPC.sethcpcCode8TBox(qGetQuoteHCPC.hcpcCode8TBox);
			objQuoteHCPC.sethcpcQty8TBox(qGetQuoteHCPC.hcpcQty8TBox);
			objQuoteHCPC.sethcpcProduct8TBox(qGetQuoteHCPC.hcpcProduct8TBox);
			objQuoteHCPC.sethcpcDX8TBox(qGetQuoteHCPC.hcpcDX8TBox);
			objQuoteHCPC.sethcpcDiagnosis8TBox(qGetQuoteHCPC.hcpcDiagnosis8TBox);
			objQuoteHCPC.sethcpcCost8TBox(qGetQuoteHCPC.hcpcCost8TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear8TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear8TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth8TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth8TBox);
			objQuoteHCPC.sethcpcCode9TBox(qGetQuoteHCPC.hcpcCode9TBox);
			objQuoteHCPC.sethcpcQty9TBox(qGetQuoteHCPC.hcpcQty9TBox);
			objQuoteHCPC.sethcpcProduct9TBox(qGetQuoteHCPC.hcpcProduct9TBox);
			objQuoteHCPC.sethcpcDX9TBox(qGetQuoteHCPC.hcpcDX9TBox);
			objQuoteHCPC.sethcpcDiagnosis9TBox(qGetQuoteHCPC.hcpcDiagnosis9TBox);
			objQuoteHCPC.sethcpcCost9TBox(qGetQuoteHCPC.hcpcCost9TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear9TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear9TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth9TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth9TBox);
			objQuoteHCPC.sethcpcCode10TBox(qGetQuoteHCPC.hcpcCode10TBox);
			objQuoteHCPC.sethcpcQty10TBox(qGetQuoteHCPC.hcpcQty10TBox);
			objQuoteHCPC.sethcpcProduct10TBox(qGetQuoteHCPC.hcpcProduct10TBox);
			objQuoteHCPC.sethcpcDX10TBox(qGetQuoteHCPC.hcpcDX10TBox);
			objQuoteHCPC.sethcpcDiagnosis10TBox(qGetQuoteHCPC.hcpcDiagnosis10TBox);
			objQuoteHCPC.sethcpcCost10TBox(qGetQuoteHCPC.hcpcCost10TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear10TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear10TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth10TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth10TBox);
			objQuoteHCPC.sethcpcCode11TBox(qGetQuoteHCPC.hcpcCode11TBox);
			objQuoteHCPC.sethcpcQty11TBox(qGetQuoteHCPC.hcpcQty11TBox);
			objQuoteHCPC.sethcpcProduct11TBox(qGetQuoteHCPC.hcpcProduct11TBox);
			objQuoteHCPC.sethcpcDX11TBox(qGetQuoteHCPC.hcpcDX11TBox);
			objQuoteHCPC.sethcpcDiagnosis11TBox(qGetQuoteHCPC.hcpcDiagnosis11TBox);
			objQuoteHCPC.sethcpcCost11TBox(qGetQuoteHCPC.hcpcCost11TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear11TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear11TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth11TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth11TBox);
			objQuoteHCPC.sethcpcCode12TBox(qGetQuoteHCPC.hcpcCode12TBox);
			objQuoteHCPC.sethcpcQty12TBox(qGetQuoteHCPC.hcpcQty12TBox);
			objQuoteHCPC.sethcpcProduct12TBox(qGetQuoteHCPC.hcpcProduct12TBox);
			objQuoteHCPC.sethcpcDX12TBox(qGetQuoteHCPC.hcpcDX12TBox);
			objQuoteHCPC.sethcpcDiagnosis12TBox(qGetQuoteHCPC.hcpcDiagnosis12TBox);
			objQuoteHCPC.sethcpcCost12TBox(qGetQuoteHCPC.hcpcCost12TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear12TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear12TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth12TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth12TBox);
			objQuoteHCPC.sethcpcCode13TBox(qGetQuoteHCPC.hcpcCode13TBox);
			objQuoteHCPC.sethcpcQty13TBox(qGetQuoteHCPC.hcpcQty13TBox);
			objQuoteHCPC.sethcpcProduct13TBox(qGetQuoteHCPC.hcpcProduct13TBox);
			objQuoteHCPC.sethcpcDX13TBox(qGetQuoteHCPC.hcpcDX13TBox);
			objQuoteHCPC.sethcpcDiagnosis13TBox(qGetQuoteHCPC.hcpcDiagnosis13TBox);
			objQuoteHCPC.sethcpcCost13TBox(qGetQuoteHCPC.hcpcCost13TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear13TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear13TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth13TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth13TBox);
			objQuoteHCPC.sethcpcCode14TBox(qGetQuoteHCPC.hcpcCode14TBox);
			objQuoteHCPC.sethcpcQty14TBox(qGetQuoteHCPC.hcpcQty14TBox);
			objQuoteHCPC.sethcpcProduct14TBox(qGetQuoteHCPC.hcpcProduct14TBox);
			objQuoteHCPC.sethcpcDX14TBox(qGetQuoteHCPC.hcpcDX14TBox);
			objQuoteHCPC.sethcpcDiagnosis14TBox(qGetQuoteHCPC.hcpcDiagnosis14TBox);
			objQuoteHCPC.sethcpcCost14TBox(qGetQuoteHCPC.hcpcCost14TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear14TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear14TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth14TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth14TBox);
			objQuoteHCPC.sethcpcCode15TBox(qGetQuoteHCPC.hcpcCode15TBox);
			objQuoteHCPC.sethcpcQty15TBox(qGetQuoteHCPC.hcpcQty15TBox);
			objQuoteHCPC.sethcpcProduct15TBox(qGetQuoteHCPC.hcpcProduct15TBox);
			objQuoteHCPC.sethcpcDX15TBox(qGetQuoteHCPC.hcpcDX15TBox);
			objQuoteHCPC.sethcpcDiagnosis15TBox(qGetQuoteHCPC.hcpcDiagnosis15TBox);
			objQuoteHCPC.sethcpcCost15TBox(qGetQuoteHCPC.hcpcCost15TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear15TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear15TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth15TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth15TBox);
			objQuoteHCPC.sethcpcCode16TBox(qGetQuoteHCPC.hcpcCode16TBox);
			objQuoteHCPC.sethcpcQty16TBox(qGetQuoteHCPC.hcpcQty16TBox);
			objQuoteHCPC.sethcpcProduct16TBox(qGetQuoteHCPC.hcpcProduct16TBox);
			objQuoteHCPC.sethcpcDX16TBox(qGetQuoteHCPC.hcpcDX16TBox);
			objQuoteHCPC.sethcpcDiagnosis16TBox(qGetQuoteHCPC.hcpcDiagnosis16TBox);
			objQuoteHCPC.sethcpcCost16TBox(qGetQuoteHCPC.hcpcCost16TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear16TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear16TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth16TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth16TBox);
			objQuoteHCPC.sethcpcCode17TBox(qGetQuoteHCPC.hcpcCode17TBox);
			objQuoteHCPC.sethcpcQty17TBox(qGetQuoteHCPC.hcpcQty17TBox);
			objQuoteHCPC.sethcpcProduct17TBox(qGetQuoteHCPC.hcpcProduct17TBox);
			objQuoteHCPC.sethcpcDX17TBox(qGetQuoteHCPC.hcpcDX17TBox);
			objQuoteHCPC.sethcpcDiagnosis17TBox(qGetQuoteHCPC.hcpcDiagnosis17TBox);
			objQuoteHCPC.sethcpcCost17TBox(qGetQuoteHCPC.hcpcCost17TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear17TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear17TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth17TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth17TBox);
			objQuoteHCPC.sethcpcCode18TBox(qGetQuoteHCPC.hcpcCode18TBox);
			objQuoteHCPC.sethcpcQty18TBox(qGetQuoteHCPC.hcpcQty18TBox);
			objQuoteHCPC.sethcpcProduct18TBox(qGetQuoteHCPC.hcpcProduct18TBox);
			objQuoteHCPC.sethcpcDX18TBox(qGetQuoteHCPC.hcpcDX18TBox);
			objQuoteHCPC.sethcpcDiagnosis18TBox(qGetQuoteHCPC.hcpcDiagnosis18TBox);
			objQuoteHCPC.sethcpcCost18TBox(qGetQuoteHCPC.hcpcCost18TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear18TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear18TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth18TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth18TBox);
			objQuoteHCPC.sethcpcCode19TBox(qGetQuoteHCPC.hcpcCode19TBox);
			objQuoteHCPC.sethcpcQty19TBox(qGetQuoteHCPC.hcpcQty19TBox);
			objQuoteHCPC.sethcpcProduct19TBox(qGetQuoteHCPC.hcpcProduct19TBox);
			objQuoteHCPC.sethcpcDX19TBox(qGetQuoteHCPC.hcpcDX19TBox);
			objQuoteHCPC.sethcpcDiagnosis19TBox(qGetQuoteHCPC.hcpcDiagnosis19TBox);
			objQuoteHCPC.sethcpcCost19TBox(qGetQuoteHCPC.hcpcCost19TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear19TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear19TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth19TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth19TBox);
			objQuoteHCPC.sethcpcCode20TBox(qGetQuoteHCPC.hcpcCode20TBox);
			objQuoteHCPC.sethcpcQty20TBox(qGetQuoteHCPC.hcpcQty20TBox);
			objQuoteHCPC.sethcpcProduct20TBox(qGetQuoteHCPC.hcpcProduct20TBox);
			objQuoteHCPC.sethcpcDX20TBox(qGetQuoteHCPC.hcpcDX20TBox);
			objQuoteHCPC.sethcpcDiagnosis20TBox(qGetQuoteHCPC.hcpcDiagnosis20TBox);
			objQuoteHCPC.sethcpcCost20TBox(qGetQuoteHCPC.hcpcCost20TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear20TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear20TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth20TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth20TBox);
			objQuoteHCPC.sethcpcCode21TBox(qGetQuoteHCPC.hcpcCode21TBox);
			objQuoteHCPC.sethcpcQty21TBox(qGetQuoteHCPC.hcpcQty21TBox);
			objQuoteHCPC.sethcpcProduct21TBox(qGetQuoteHCPC.hcpcProduct21TBox);
			objQuoteHCPC.sethcpcDX21TBox(qGetQuoteHCPC.hcpcDX21TBox);
			objQuoteHCPC.sethcpcDiagnosis21TBox(qGetQuoteHCPC.hcpcDiagnosis21TBox);
			objQuoteHCPC.sethcpcCost21TBox(qGetQuoteHCPC.hcpcCost21TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear21TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear21TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth21TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth21TBox);
			objQuoteHCPC.sethcpcCode22TBox(qGetQuoteHCPC.hcpcCode22TBox);
			objQuoteHCPC.sethcpcQty22TBox(qGetQuoteHCPC.hcpcQty22TBox);
			objQuoteHCPC.sethcpcProduct22TBox(qGetQuoteHCPC.hcpcProduct22TBox);
			objQuoteHCPC.sethcpcDX22TBox(qGetQuoteHCPC.hcpcDX22TBox);
			objQuoteHCPC.sethcpcDiagnosis22TBox(qGetQuoteHCPC.hcpcDiagnosis22TBox);
			objQuoteHCPC.sethcpcCost22TBox(qGetQuoteHCPC.hcpcCost22TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear22TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear22TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth22TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth22TBox);
			objQuoteHCPC.sethcpcCode23TBox(qGetQuoteHCPC.hcpcCode23TBox);
			objQuoteHCPC.sethcpcQty23TBox(qGetQuoteHCPC.hcpcQty23TBox);
			objQuoteHCPC.sethcpcProduct23TBox(qGetQuoteHCPC.hcpcProduct23TBox);
			objQuoteHCPC.sethcpcDX23TBox(qGetQuoteHCPC.hcpcDX23TBox);
			objQuoteHCPC.sethcpcDiagnosis23TBox(qGetQuoteHCPC.hcpcDiagnosis23TBox);
			objQuoteHCPC.sethcpcCost23TBox(qGetQuoteHCPC.hcpcCost23TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear23TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear23TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth23TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth23TBox);
			objQuoteHCPC.sethcpcCode24TBox(qGetQuoteHCPC.hcpcCode24TBox);
			objQuoteHCPC.sethcpcQty24TBox(qGetQuoteHCPC.hcpcQty24TBox);
			objQuoteHCPC.sethcpcProduct24TBox(qGetQuoteHCPC.hcpcProduct24TBox);
			objQuoteHCPC.sethcpcDX24TBox(qGetQuoteHCPC.hcpcDX24TBox);
			objQuoteHCPC.sethcpcDiagnosis24TBox(qGetQuoteHCPC.hcpcDiagnosis24TBox);
			objQuoteHCPC.sethcpcCost24TBox(qGetQuoteHCPC.hcpcCost24TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear24TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear24TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth24TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth24TBox);
			objQuoteHCPC.sethcpcCode25TBox(qGetQuoteHCPC.hcpcCode25TBox);
			objQuoteHCPC.sethcpcQty25TBox(qGetQuoteHCPC.hcpcQty25TBox);
			objQuoteHCPC.sethcpcProduct25TBox(qGetQuoteHCPC.hcpcProduct25TBox);
			objQuoteHCPC.sethcpcDX25TBox(qGetQuoteHCPC.hcpcDX25TBox);
			objQuoteHCPC.sethcpcDiagnosis25TBox(qGetQuoteHCPC.hcpcDiagnosis25TBox);
			objQuoteHCPC.sethcpcCost25TBox(qGetQuoteHCPC.hcpcCost25TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear25TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear25TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth25TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth25TBox);
			objQuoteHCPC.sethcpcCode26TBox(qGetQuoteHCPC.hcpcCode26TBox);
			objQuoteHCPC.sethcpcQty26TBox(qGetQuoteHCPC.hcpcQty26TBox);
			objQuoteHCPC.sethcpcProduct26TBox(qGetQuoteHCPC.hcpcProduct26TBox);
			objQuoteHCPC.sethcpcDX26TBox(qGetQuoteHCPC.hcpcDX26TBox);
			objQuoteHCPC.sethcpcDiagnosis26TBox(qGetQuoteHCPC.hcpcDiagnosis26TBox);
			objQuoteHCPC.sethcpcCost26TBox(qGetQuoteHCPC.hcpcCost26TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear26TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear26TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth26TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth26TBox);
			objQuoteHCPC.sethcpcCode27TBox(qGetQuoteHCPC.hcpcCode27TBox);
			objQuoteHCPC.sethcpcQty27TBox(qGetQuoteHCPC.hcpcQty27TBox);
			objQuoteHCPC.sethcpcProduct27TBox(qGetQuoteHCPC.hcpcProduct27TBox);
			objQuoteHCPC.sethcpcDX27TBox(qGetQuoteHCPC.hcpcDX27TBox);
			objQuoteHCPC.sethcpcDiagnosis27TBox(qGetQuoteHCPC.hcpcDiagnosis27TBox);
			objQuoteHCPC.sethcpcCost27TBox(qGetQuoteHCPC.hcpcCost27TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear27TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear27TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth27TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth27TBox);
			objQuoteHCPC.sethcpcCode28TBox(qGetQuoteHCPC.hcpcCode28TBox);
			objQuoteHCPC.sethcpcQty28TBox(qGetQuoteHCPC.hcpcQty28TBox);
			objQuoteHCPC.sethcpcProduct28TBox(qGetQuoteHCPC.hcpcProduct28TBox);
			objQuoteHCPC.sethcpcDX28TBox(qGetQuoteHCPC.hcpcDX28TBox);
			objQuoteHCPC.sethcpcDiagnosis28TBox(qGetQuoteHCPC.hcpcDiagnosis28TBox);
			objQuoteHCPC.sethcpcCost28TBox(qGetQuoteHCPC.hcpcCost28TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear28TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear28TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth28TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth28TBox);
			objQuoteHCPC.sethcpcCode29TBox(qGetQuoteHCPC.hcpcCode29TBox);
			objQuoteHCPC.sethcpcQty29TBox(qGetQuoteHCPC.hcpcQty29TBox);
			objQuoteHCPC.sethcpcProduct29TBox(qGetQuoteHCPC.hcpcProduct29TBox);
			objQuoteHCPC.sethcpcDX29TBox(qGetQuoteHCPC.hcpcDX29TBox);
			objQuoteHCPC.sethcpcDiagnosis29TBox(qGetQuoteHCPC.hcpcDiagnosis29TBox);
			objQuoteHCPC.sethcpcCost29TBox(qGetQuoteHCPC.hcpcCost29TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear29TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear29TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth29TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth29TBox);
			objQuoteHCPC.sethcpcCode30TBox(qGetQuoteHCPC.hcpcCode30TBox);
			objQuoteHCPC.sethcpcQty30TBox(qGetQuoteHCPC.hcpcQty30TBox);
			objQuoteHCPC.sethcpcProduct30TBox(qGetQuoteHCPC.hcpcProduct30TBox);
			objQuoteHCPC.sethcpcDX30TBox(qGetQuoteHCPC.hcpcDX30TBox);
			objQuoteHCPC.sethcpcDiagnosis30TBox(qGetQuoteHCPC.hcpcDiagnosis30TBox);
			objQuoteHCPC.sethcpcCost30TBox(qGetQuoteHCPC.hcpcCost30TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear30TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear30TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth30TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth30TBox);
			objQuoteHCPC.sethcpcCode31TBox(qGetQuoteHCPC.hcpcCode31TBox);
			objQuoteHCPC.sethcpcQty31TBox(qGetQuoteHCPC.hcpcQty31TBox);
			objQuoteHCPC.sethcpcProduct31TBox(qGetQuoteHCPC.hcpcProduct31TBox);
			objQuoteHCPC.sethcpcDX31TBox(qGetQuoteHCPC.hcpcDX31TBox);
			objQuoteHCPC.sethcpcDiagnosis31TBox(qGetQuoteHCPC.hcpcDiagnosis31TBox);
			objQuoteHCPC.sethcpcCost31TBox(qGetQuoteHCPC.hcpcCost31TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear31TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear31TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth31TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth31TBox);
			objQuoteHCPC.sethcpcCode32TBox(qGetQuoteHCPC.hcpcCode32TBox);
			objQuoteHCPC.sethcpcQty32TBox(qGetQuoteHCPC.hcpcQty32TBox);
			objQuoteHCPC.sethcpcProduct32TBox(qGetQuoteHCPC.hcpcProduct32TBox);
			objQuoteHCPC.sethcpcDX32TBox(qGetQuoteHCPC.hcpcDX32TBox);
			objQuoteHCPC.sethcpcDiagnosis32TBox(qGetQuoteHCPC.hcpcDiagnosis32TBox);
			objQuoteHCPC.sethcpcCost32TBox(qGetQuoteHCPC.hcpcCost32TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear32TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear32TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth32TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth32TBox);
			objQuoteHCPC.sethcpcCode33TBox(qGetQuoteHCPC.hcpcCode33TBox);
			objQuoteHCPC.sethcpcQty33TBox(qGetQuoteHCPC.hcpcQty33TBox);
			objQuoteHCPC.sethcpcProduct33TBox(qGetQuoteHCPC.hcpcProduct33TBox);
			objQuoteHCPC.sethcpcDX33TBox(qGetQuoteHCPC.hcpcDX33TBox);
			objQuoteHCPC.sethcpcDiagnosis33TBox(qGetQuoteHCPC.hcpcDiagnosis33TBox);
			objQuoteHCPC.sethcpcCost33TBox(qGetQuoteHCPC.hcpcCost33TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear33TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear33TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth33TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth33TBox);
			objQuoteHCPC.sethcpcCode34TBox(qGetQuoteHCPC.hcpcCode34TBox);
			objQuoteHCPC.sethcpcQty34TBox(qGetQuoteHCPC.hcpcQty34TBox);
			objQuoteHCPC.sethcpcProduct34TBox(qGetQuoteHCPC.hcpcProduct34TBox);
			objQuoteHCPC.sethcpcDX34TBox(qGetQuoteHCPC.hcpcDX34TBox);
			objQuoteHCPC.sethcpcDiagnosis34TBox(qGetQuoteHCPC.hcpcDiagnosis34TBox);
			objQuoteHCPC.sethcpcCost34TBox(qGetQuoteHCPC.hcpcCost34TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear34TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear34TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth34TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth34TBox);
			objQuoteHCPC.sethcpcCode35TBox(qGetQuoteHCPC.hcpcCode35TBox);
			objQuoteHCPC.sethcpcQty35TBox(qGetQuoteHCPC.hcpcQty35TBox);
			objQuoteHCPC.sethcpcProduct35TBox(qGetQuoteHCPC.hcpcProduct35TBox);
			objQuoteHCPC.sethcpcDX35TBox(qGetQuoteHCPC.hcpcDX35TBox);
			objQuoteHCPC.sethcpcDiagnosis35TBox(qGetQuoteHCPC.hcpcDiagnosis35TBox);
			objQuoteHCPC.sethcpcCost35TBox(qGetQuoteHCPC.hcpcCost35TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear35TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear35TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth35TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth35TBox);
			objQuoteHCPC.sethcpcCode36TBox(qGetQuoteHCPC.hcpcCode36TBox);
			objQuoteHCPC.sethcpcQty36TBox(qGetQuoteHCPC.hcpcQty36TBox);
			objQuoteHCPC.sethcpcProduct36TBox(qGetQuoteHCPC.hcpcProduct36TBox);
			objQuoteHCPC.sethcpcDX36TBox(qGetQuoteHCPC.hcpcDX36TBox);
			objQuoteHCPC.sethcpcDiagnosis36TBox(qGetQuoteHCPC.hcpcDiagnosis36TBox);
			objQuoteHCPC.sethcpcCost36TBox(qGetQuoteHCPC.hcpcCost36TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear36TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear36TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth36TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth36TBox);
			objQuoteHCPC.sethcpcCode37TBox(qGetQuoteHCPC.hcpcCode37TBox);
			objQuoteHCPC.sethcpcQty37TBox(qGetQuoteHCPC.hcpcQty37TBox);
			objQuoteHCPC.sethcpcProduct37TBox(qGetQuoteHCPC.hcpcProduct37TBox);
			objQuoteHCPC.sethcpcDX37TBox(qGetQuoteHCPC.hcpcDX37TBox);
			objQuoteHCPC.sethcpcDiagnosis37TBox(qGetQuoteHCPC.hcpcDiagnosis37TBox);
			objQuoteHCPC.sethcpcCost37TBox(qGetQuoteHCPC.hcpcCost37TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear37TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear37TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth37TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth37TBox);
			objQuoteHCPC.sethcpcCode38TBox(qGetQuoteHCPC.hcpcCode38TBox);
			objQuoteHCPC.sethcpcQty38TBox(qGetQuoteHCPC.hcpcQty38TBox);
			objQuoteHCPC.sethcpcProduct38TBox(qGetQuoteHCPC.hcpcProduct38TBox);
			objQuoteHCPC.sethcpcDX38TBox(qGetQuoteHCPC.hcpcDX38TBox);
			objQuoteHCPC.sethcpcDiagnosis38TBox(qGetQuoteHCPC.hcpcDiagnosis38TBox);
			objQuoteHCPC.sethcpcCost38TBox(qGetQuoteHCPC.hcpcCost38TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear38TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear38TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth38TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth38TBox);
			objQuoteHCPC.sethcpcCode39TBox(qGetQuoteHCPC.hcpcCode39TBox);
			objQuoteHCPC.sethcpcQty39TBox(qGetQuoteHCPC.hcpcQty39TBox);
			objQuoteHCPC.sethcpcProduct39TBox(qGetQuoteHCPC.hcpcProduct39TBox);
			objQuoteHCPC.sethcpcDX39TBox(qGetQuoteHCPC.hcpcDX39TBox);
			objQuoteHCPC.sethcpcDiagnosis39TBox(qGetQuoteHCPC.hcpcDiagnosis39TBox);
			objQuoteHCPC.sethcpcCost39TBox(qGetQuoteHCPC.hcpcCost39TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear39TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear39TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth39TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth39TBox);
			objQuoteHCPC.sethcpcCode40TBox(qGetQuoteHCPC.hcpcCode40TBox);
			objQuoteHCPC.sethcpcQty40TBox(qGetQuoteHCPC.hcpcQty40TBox);
			objQuoteHCPC.sethcpcProduct40TBox(qGetQuoteHCPC.hcpcProduct40TBox);
			objQuoteHCPC.sethcpcDX40TBox(qGetQuoteHCPC.hcpcDX40TBox);
			objQuoteHCPC.sethcpcDiagnosis40TBox(qGetQuoteHCPC.hcpcDiagnosis40TBox);
			objQuoteHCPC.sethcpcCost40TBox(qGetQuoteHCPC.hcpcCost40TBox);
			objQuoteHCPC.sethcpcLengthOfNeedYear40TBox(qGetQuoteHCPC.hcpcLengthOfNeedYear40TBox);
			objQuoteHCPC.sethcpcLengthOfNeedMonth40TBox(qGetQuoteHCPC.hcpcLengthOfNeedMonth40TBox);
			objQuoteHCPC.setActive(qGetQuoteHCPC.Active);
			objQuoteHCPC.setInactiveCode(qGetQuoteHCPC.InactiveCode);
			objQuoteHCPC.setDateCreated(qGetQuoteHCPC.DateCreated);
			objQuoteHCPC.setDateModified(qGetQuoteHCPC.DateModified);				
			return objQuoteHCPC;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="QuoteHCPCBean" />
		<cfset var qUpdateQuoteHCPC = "" />
		<cfset var localQuoteID = arguments.bean.getQuoteID() />
		<cfset var localhcpcCode1TBox = arguments.bean.gethcpcCode1TBox() />
		<cfset var localhcpcQty1TBox = arguments.bean.gethcpcQty1TBox() />
		<cfset var localhcpcProduct1TBox = arguments.bean.gethcpcProduct1TBox() />
		<cfset var localhcpcDX1TBox = arguments.bean.gethcpcDX1TBox() />
		<cfset var localhcpcDiagnosis1TBox = arguments.bean.gethcpcDiagnosis1TBox() />
		<cfset var localhcpcCost1TBox = arguments.bean.gethcpcCost1TBox() />
		<cfset var localhcpcLengthOfNeedYear1TBox = arguments.bean.gethcpcLengthOfNeedYear1TBox() />
		<cfset var localhcpcLengthOfNeedMonth1TBox = arguments.bean.gethcpcLengthOfNeedMonth1TBox() />
		<cfset var localhcpcCode2TBox = arguments.bean.gethcpcCode2TBox() />
		<cfset var localhcpcQty2TBox = arguments.bean.gethcpcQty2TBox() />
		<cfset var localhcpcProduct2TBox = arguments.bean.gethcpcProduct2TBox() />
		<cfset var localhcpcDX2TBox = arguments.bean.gethcpcDX2TBox() />
		<cfset var localhcpcDiagnosis2TBox = arguments.bean.gethcpcDiagnosis2TBox() />
		<cfset var localhcpcCost2TBox = arguments.bean.gethcpcCost2TBox() />
		<cfset var localhcpcLengthOfNeedYear2TBox = arguments.bean.gethcpcLengthOfNeedYear2TBox() />
		<cfset var localhcpcLengthOfNeedMonth2TBox = arguments.bean.gethcpcLengthOfNeedMonth2TBox() />
		<cfset var localhcpcCode3TBox = arguments.bean.gethcpcCode3TBox() />
		<cfset var localhcpcQty3TBox = arguments.bean.gethcpcQty3TBox() />
		<cfset var localhcpcProduct3TBox = arguments.bean.gethcpcProduct3TBox() />
		<cfset var localhcpcDX3TBox = arguments.bean.gethcpcDX3TBox() />
		<cfset var localhcpcDiagnosis3TBox = arguments.bean.gethcpcDiagnosis3TBox() />
		<cfset var localhcpcCost3TBox = arguments.bean.gethcpcCost3TBox() />
		<cfset var localhcpcLengthOfNeedYear3TBox = arguments.bean.gethcpcLengthOfNeedYear3TBox() />
		<cfset var localhcpcLengthOfNeedMonth3TBox = arguments.bean.gethcpcLengthOfNeedMonth3TBox() />
		<cfset var localhcpcCode4TBox = arguments.bean.gethcpcCode4TBox() />
		<cfset var localhcpcQty4TBox = arguments.bean.gethcpcQty4TBox() />
		<cfset var localhcpcProduct4TBox = arguments.bean.gethcpcProduct4TBox() />
		<cfset var localhcpcDX4TBox = arguments.bean.gethcpcDX4TBox() />
		<cfset var localhcpcDiagnosis4TBox = arguments.bean.gethcpcDiagnosis4TBox() />
		<cfset var localhcpcCost4TBox = arguments.bean.gethcpcCost4TBox() />
		<cfset var localhcpcLengthOfNeedYear4TBox = arguments.bean.gethcpcLengthOfNeedYear4TBox() />
		<cfset var localhcpcLengthOfNeedMonth4TBox = arguments.bean.gethcpcLengthOfNeedMonth4TBox() />
		<cfset var localhcpcCode5TBox = arguments.bean.gethcpcCode5TBox() />
		<cfset var localhcpcQty5TBox = arguments.bean.gethcpcQty5TBox() />
		<cfset var localhcpcProduct5TBox = arguments.bean.gethcpcProduct5TBox() />
		<cfset var localhcpcDX5TBox = arguments.bean.gethcpcDX5TBox() />
		<cfset var localhcpcDiagnosis5TBox = arguments.bean.gethcpcDiagnosis5TBox() />
		<cfset var localhcpcCost5TBox = arguments.bean.gethcpcCost5TBox() />
		<cfset var localhcpcLengthOfNeedYear5TBox = arguments.bean.gethcpcLengthOfNeedYear5TBox() />
		<cfset var localhcpcLengthOfNeedMonth5TBox = arguments.bean.gethcpcLengthOfNeedMonth5TBox() />
		<cfset var localhcpcCode6TBox = arguments.bean.gethcpcCode6TBox() />
		<cfset var localhcpcQty6TBox = arguments.bean.gethcpcQty6TBox() />
		<cfset var localhcpcProduct6TBox = arguments.bean.gethcpcProduct6TBox() />
		<cfset var localhcpcDX6TBox = arguments.bean.gethcpcDX6TBox() />
		<cfset var localhcpcDiagnosis6TBox = arguments.bean.gethcpcDiagnosis6TBox() />
		<cfset var localhcpcCost6TBox = arguments.bean.gethcpcCost6TBox() />
		<cfset var localhcpcLengthOfNeedYear6TBox = arguments.bean.gethcpcLengthOfNeedYear6TBox() />
		<cfset var localhcpcLengthOfNeedMonth6TBox = arguments.bean.gethcpcLengthOfNeedMonth6TBox() />
		<cfset var localhcpcCode7TBox = arguments.bean.gethcpcCode7TBox() />
		<cfset var localhcpcQty7TBox = arguments.bean.gethcpcQty7TBox() />
		<cfset var localhcpcProduct7TBox = arguments.bean.gethcpcProduct7TBox() />
		<cfset var localhcpcDX7TBox = arguments.bean.gethcpcDX7TBox() />
		<cfset var localhcpcDiagnosis7TBox = arguments.bean.gethcpcDiagnosis7TBox() />
		<cfset var localhcpcCost7TBox = arguments.bean.gethcpcCost7TBox() />
		<cfset var localhcpcLengthOfNeedYear7TBox = arguments.bean.gethcpcLengthOfNeedYear7TBox() />
		<cfset var localhcpcLengthOfNeedMonth7TBox = arguments.bean.gethcpcLengthOfNeedMonth7TBox() />
		<cfset var localhcpcCode8TBox = arguments.bean.gethcpcCode8TBox() />
		<cfset var localhcpcQty8TBox = arguments.bean.gethcpcQty8TBox() />
		<cfset var localhcpcProduct8TBox = arguments.bean.gethcpcProduct8TBox() />
		<cfset var localhcpcDX8TBox = arguments.bean.gethcpcDX8TBox() />
		<cfset var localhcpcDiagnosis8TBox = arguments.bean.gethcpcDiagnosis8TBox() />
		<cfset var localhcpcCost8TBox = arguments.bean.gethcpcCost8TBox() />
		<cfset var localhcpcLengthOfNeedYear8TBox = arguments.bean.gethcpcLengthOfNeedYear8TBox() />
		<cfset var localhcpcLengthOfNeedMonth8TBox = arguments.bean.gethcpcLengthOfNeedMonth8TBox() />
		<cfset var localhcpcCode9TBox = arguments.bean.gethcpcCode9TBox() />
		<cfset var localhcpcQty9TBox = arguments.bean.gethcpcQty9TBox() />
		<cfset var localhcpcProduct9TBox = arguments.bean.gethcpcProduct9TBox() />
		<cfset var localhcpcDX9TBox = arguments.bean.gethcpcDX9TBox() />
		<cfset var localhcpcDiagnosis9TBox = arguments.bean.gethcpcDiagnosis9TBox() />
		<cfset var localhcpcCost9TBox = arguments.bean.gethcpcCost9TBox() />
		<cfset var localhcpcLengthOfNeedYear9TBox = arguments.bean.gethcpcLengthOfNeedYear9TBox() />
		<cfset var localhcpcLengthOfNeedMonth9TBox = arguments.bean.gethcpcLengthOfNeedMonth9TBox() />
		<cfset var localhcpcCode10TBox = arguments.bean.gethcpcCode10TBox() />
		<cfset var localhcpcQty10TBox = arguments.bean.gethcpcQty10TBox() />
		<cfset var localhcpcProduct10TBox = arguments.bean.gethcpcProduct10TBox() />
		<cfset var localhcpcDX10TBox = arguments.bean.gethcpcDX10TBox() />
		<cfset var localhcpcDiagnosis10TBox = arguments.bean.gethcpcDiagnosis10TBox() />
		<cfset var localhcpcCost10TBox = arguments.bean.gethcpcCost10TBox() />
		<cfset var localhcpcLengthOfNeedYear10TBox = arguments.bean.gethcpcLengthOfNeedYear10TBox() />
		<cfset var localhcpcLengthOfNeedMonth10TBox = arguments.bean.gethcpcLengthOfNeedMonth10TBox() />
		<cfset var localhcpcCode11TBox = arguments.bean.gethcpcCode11TBox() />
		<cfset var localhcpcQty11TBox = arguments.bean.gethcpcQty11TBox() />
		<cfset var localhcpcProduct11TBox = arguments.bean.gethcpcProduct11TBox() />
		<cfset var localhcpcDX11TBox = arguments.bean.gethcpcDX11TBox() />
		<cfset var localhcpcDiagnosis11TBox = arguments.bean.gethcpcDiagnosis11TBox() />
		<cfset var localhcpcCost11TBox = arguments.bean.gethcpcCost11TBox() />
		<cfset var localhcpcLengthOfNeedYear11TBox = arguments.bean.gethcpcLengthOfNeedYear11TBox() />
		<cfset var localhcpcLengthOfNeedMonth11TBox = arguments.bean.gethcpcLengthOfNeedMonth11TBox() />
		<cfset var localhcpcCode12TBox = arguments.bean.gethcpcCode12TBox() />
		<cfset var localhcpcQty12TBox = arguments.bean.gethcpcQty12TBox() />
		<cfset var localhcpcProduct12TBox = arguments.bean.gethcpcProduct12TBox() />
		<cfset var localhcpcDX12TBox = arguments.bean.gethcpcDX12TBox() />
		<cfset var localhcpcDiagnosis12TBox = arguments.bean.gethcpcDiagnosis12TBox() />
		<cfset var localhcpcCost12TBox = arguments.bean.gethcpcCost12TBox() />
		<cfset var localhcpcLengthOfNeedYear12TBox = arguments.bean.gethcpcLengthOfNeedYear12TBox() />
		<cfset var localhcpcLengthOfNeedMonth12TBox = arguments.bean.gethcpcLengthOfNeedMonth12TBox() />
		<cfset var localhcpcCode13TBox = arguments.bean.gethcpcCode13TBox() />
		<cfset var localhcpcQty13TBox = arguments.bean.gethcpcQty13TBox() />
		<cfset var localhcpcProduct13TBox = arguments.bean.gethcpcProduct13TBox() />
		<cfset var localhcpcDX13TBox = arguments.bean.gethcpcDX13TBox() />
		<cfset var localhcpcDiagnosis13TBox = arguments.bean.gethcpcDiagnosis13TBox() />
		<cfset var localhcpcCost13TBox = arguments.bean.gethcpcCost13TBox() />
		<cfset var localhcpcLengthOfNeedYear13TBox = arguments.bean.gethcpcLengthOfNeedYear13TBox() />
		<cfset var localhcpcLengthOfNeedMonth13TBox = arguments.bean.gethcpcLengthOfNeedMonth13TBox() />
		<cfset var localhcpcCode14TBox = arguments.bean.gethcpcCode14TBox() />
		<cfset var localhcpcQty14TBox = arguments.bean.gethcpcQty14TBox() />
		<cfset var localhcpcProduct14TBox = arguments.bean.gethcpcProduct14TBox() />
		<cfset var localhcpcDX14TBox = arguments.bean.gethcpcDX14TBox() />
		<cfset var localhcpcDiagnosis14TBox = arguments.bean.gethcpcDiagnosis14TBox() />
		<cfset var localhcpcCost14TBox = arguments.bean.gethcpcCost14TBox() />
		<cfset var localhcpcLengthOfNeedYear14TBox = arguments.bean.gethcpcLengthOfNeedYear14TBox() />
		<cfset var localhcpcLengthOfNeedMonth14TBox = arguments.bean.gethcpcLengthOfNeedMonth14TBox() />
		<cfset var localhcpcCode15TBox = arguments.bean.gethcpcCode15TBox() />
		<cfset var localhcpcQty15TBox = arguments.bean.gethcpcQty15TBox() />
		<cfset var localhcpcProduct15TBox = arguments.bean.gethcpcProduct15TBox() />
		<cfset var localhcpcDX15TBox = arguments.bean.gethcpcDX15TBox() />
		<cfset var localhcpcDiagnosis15TBox = arguments.bean.gethcpcDiagnosis15TBox() />
		<cfset var localhcpcCost15TBox = arguments.bean.gethcpcCost15TBox() />
		<cfset var localhcpcLengthOfNeedYear15TBox = arguments.bean.gethcpcLengthOfNeedYear15TBox() />
		<cfset var localhcpcLengthOfNeedMonth15TBox = arguments.bean.gethcpcLengthOfNeedMonth15TBox() />
		<cfset var localhcpcCode16TBox = arguments.bean.gethcpcCode16TBox() />
		<cfset var localhcpcQty16TBox = arguments.bean.gethcpcQty16TBox() />
		<cfset var localhcpcProduct16TBox = arguments.bean.gethcpcProduct16TBox() />
		<cfset var localhcpcDX16TBox = arguments.bean.gethcpcDX16TBox() />
		<cfset var localhcpcDiagnosis16TBox = arguments.bean.gethcpcDiagnosis16TBox() />
		<cfset var localhcpcCost16TBox = arguments.bean.gethcpcCost16TBox() />
		<cfset var localhcpcLengthOfNeedYear16TBox = arguments.bean.gethcpcLengthOfNeedYear16TBox() />
		<cfset var localhcpcLengthOfNeedMonth16TBox = arguments.bean.gethcpcLengthOfNeedMonth16TBox() />
		<cfset var localhcpcCode17TBox = arguments.bean.gethcpcCode17TBox() />
		<cfset var localhcpcQty17TBox = arguments.bean.gethcpcQty17TBox() />
		<cfset var localhcpcProduct17TBox = arguments.bean.gethcpcProduct17TBox() />
		<cfset var localhcpcDX17TBox = arguments.bean.gethcpcDX17TBox() />
		<cfset var localhcpcDiagnosis17TBox = arguments.bean.gethcpcDiagnosis17TBox() />
		<cfset var localhcpcCost17TBox = arguments.bean.gethcpcCost17TBox() />
		<cfset var localhcpcLengthOfNeedYear17TBox = arguments.bean.gethcpcLengthOfNeedYear17TBox() />
		<cfset var localhcpcLengthOfNeedMonth17TBox = arguments.bean.gethcpcLengthOfNeedMonth17TBox() />
		<cfset var localhcpcCode18TBox = arguments.bean.gethcpcCode18TBox() />
		<cfset var localhcpcQty18TBox = arguments.bean.gethcpcQty18TBox() />
		<cfset var localhcpcProduct18TBox = arguments.bean.gethcpcProduct18TBox() />
		<cfset var localhcpcDX18TBox = arguments.bean.gethcpcDX18TBox() />
		<cfset var localhcpcDiagnosis18TBox = arguments.bean.gethcpcDiagnosis18TBox() />
		<cfset var localhcpcCost18TBox = arguments.bean.gethcpcCost18TBox() />
		<cfset var localhcpcLengthOfNeedYear18TBox = arguments.bean.gethcpcLengthOfNeedYear18TBox() />
		<cfset var localhcpcLengthOfNeedMonth18TBox = arguments.bean.gethcpcLengthOfNeedMonth18TBox() />
		<cfset var localhcpcCode19TBox = arguments.bean.gethcpcCode19TBox() />
		<cfset var localhcpcQty19TBox = arguments.bean.gethcpcQty19TBox() />
		<cfset var localhcpcProduct19TBox = arguments.bean.gethcpcProduct19TBox() />
		<cfset var localhcpcDX19TBox = arguments.bean.gethcpcDX19TBox() />
		<cfset var localhcpcDiagnosis19TBox = arguments.bean.gethcpcDiagnosis19TBox() />
		<cfset var localhcpcCost19TBox = arguments.bean.gethcpcCost19TBox() />
		<cfset var localhcpcLengthOfNeedYear19TBox = arguments.bean.gethcpcLengthOfNeedYear19TBox() />
		<cfset var localhcpcLengthOfNeedMonth19TBox = arguments.bean.gethcpcLengthOfNeedMonth19TBox() />
		<cfset var localhcpcCode20TBox = arguments.bean.gethcpcCode20TBox() />
		<cfset var localhcpcQty20TBox = arguments.bean.gethcpcQty20TBox() />
		<cfset var localhcpcProduct20TBox = arguments.bean.gethcpcProduct20TBox() />
		<cfset var localhcpcDX20TBox = arguments.bean.gethcpcDX20TBox() />
		<cfset var localhcpcDiagnosis20TBox = arguments.bean.gethcpcDiagnosis20TBox() />
		<cfset var localhcpcCost20TBox = arguments.bean.gethcpcCost20TBox() />
		<cfset var localhcpcLengthOfNeedYear20TBox = arguments.bean.gethcpcLengthOfNeedYear20TBox() />
		<cfset var localhcpcLengthOfNeedMonth20TBox = arguments.bean.gethcpcLengthOfNeedMonth20TBox() />
		<cfset var localhcpcCode21TBox = arguments.bean.gethcpcCode21TBox() />
		<cfset var localhcpcQty21TBox = arguments.bean.gethcpcQty21TBox() />
		<cfset var localhcpcProduct21TBox = arguments.bean.gethcpcProduct21TBox() />
		<cfset var localhcpcDX21TBox = arguments.bean.gethcpcDX21TBox() />
		<cfset var localhcpcDiagnosis21TBox = arguments.bean.gethcpcDiagnosis21TBox() />
		<cfset var localhcpcCost21TBox = arguments.bean.gethcpcCost21TBox() />
		<cfset var localhcpcLengthOfNeedYear21TBox = arguments.bean.gethcpcLengthOfNeedYear21TBox() />
		<cfset var localhcpcLengthOfNeedMonth21TBox = arguments.bean.gethcpcLengthOfNeedMonth21TBox() />
		<cfset var localhcpcCode22TBox = arguments.bean.gethcpcCode22TBox() />
		<cfset var localhcpcQty22TBox = arguments.bean.gethcpcQty22TBox() />
		<cfset var localhcpcProduct22TBox = arguments.bean.gethcpcProduct22TBox() />
		<cfset var localhcpcDX22TBox = arguments.bean.gethcpcDX22TBox() />
		<cfset var localhcpcDiagnosis22TBox = arguments.bean.gethcpcDiagnosis22TBox() />
		<cfset var localhcpcCost22TBox = arguments.bean.gethcpcCost22TBox() />
		<cfset var localhcpcLengthOfNeedYear22TBox = arguments.bean.gethcpcLengthOfNeedYear22TBox() />
		<cfset var localhcpcLengthOfNeedMonth22TBox = arguments.bean.gethcpcLengthOfNeedMonth22TBox() />
		<cfset var localhcpcCode23TBox = arguments.bean.gethcpcCode23TBox() />
		<cfset var localhcpcQty23TBox = arguments.bean.gethcpcQty23TBox() />
		<cfset var localhcpcProduct23TBox = arguments.bean.gethcpcProduct23TBox() />
		<cfset var localhcpcDX23TBox = arguments.bean.gethcpcDX23TBox() />
		<cfset var localhcpcDiagnosis23TBox = arguments.bean.gethcpcDiagnosis23TBox() />
		<cfset var localhcpcCost23TBox = arguments.bean.gethcpcCost23TBox() />
		<cfset var localhcpcLengthOfNeedYear23TBox = arguments.bean.gethcpcLengthOfNeedYear23TBox() />
		<cfset var localhcpcLengthOfNeedMonth23TBox = arguments.bean.gethcpcLengthOfNeedMonth23TBox() />
		<cfset var localhcpcCode24TBox = arguments.bean.gethcpcCode24TBox() />
		<cfset var localhcpcQty24TBox = arguments.bean.gethcpcQty24TBox() />
		<cfset var localhcpcProduct24TBox = arguments.bean.gethcpcProduct24TBox() />
		<cfset var localhcpcDX24TBox = arguments.bean.gethcpcDX24TBox() />
		<cfset var localhcpcDiagnosis24TBox = arguments.bean.gethcpcDiagnosis24TBox() />
		<cfset var localhcpcCost24TBox = arguments.bean.gethcpcCost24TBox() />
		<cfset var localhcpcLengthOfNeedYear24TBox = arguments.bean.gethcpcLengthOfNeedYear24TBox() />
		<cfset var localhcpcLengthOfNeedMonth24TBox = arguments.bean.gethcpcLengthOfNeedMonth24TBox() />
		<cfset var localhcpcCode25TBox = arguments.bean.gethcpcCode25TBox() />
		<cfset var localhcpcQty25TBox = arguments.bean.gethcpcQty25TBox() />
		<cfset var localhcpcProduct25TBox = arguments.bean.gethcpcProduct25TBox() />
		<cfset var localhcpcDX25TBox = arguments.bean.gethcpcDX25TBox() />
		<cfset var localhcpcDiagnosis25TBox = arguments.bean.gethcpcDiagnosis25TBox() />
		<cfset var localhcpcCost25TBox = arguments.bean.gethcpcCost25TBox() />
		<cfset var localhcpcLengthOfNeedYear25TBox = arguments.bean.gethcpcLengthOfNeedYear25TBox() />
		<cfset var localhcpcLengthOfNeedMonth25TBox = arguments.bean.gethcpcLengthOfNeedMonth25TBox() />
		<cfset var localhcpcCode26TBox = arguments.bean.gethcpcCode26TBox() />
		<cfset var localhcpcQty26TBox = arguments.bean.gethcpcQty26TBox() />
		<cfset var localhcpcProduct26TBox = arguments.bean.gethcpcProduct26TBox() />
		<cfset var localhcpcDX26TBox = arguments.bean.gethcpcDX26TBox() />
		<cfset var localhcpcDiagnosis26TBox = arguments.bean.gethcpcDiagnosis26TBox() />
		<cfset var localhcpcCost26TBox = arguments.bean.gethcpcCost26TBox() />
		<cfset var localhcpcLengthOfNeedYear26TBox = arguments.bean.gethcpcLengthOfNeedYear26TBox() />
		<cfset var localhcpcLengthOfNeedMonth26TBox = arguments.bean.gethcpcLengthOfNeedMonth26TBox() />
		<cfset var localhcpcCode27TBox = arguments.bean.gethcpcCode27TBox() />
		<cfset var localhcpcQty27TBox = arguments.bean.gethcpcQty27TBox() />
		<cfset var localhcpcProduct27TBox = arguments.bean.gethcpcProduct27TBox() />
		<cfset var localhcpcDX27TBox = arguments.bean.gethcpcDX27TBox() />
		<cfset var localhcpcDiagnosis27TBox = arguments.bean.gethcpcDiagnosis27TBox() />
		<cfset var localhcpcCost27TBox = arguments.bean.gethcpcCost27TBox() />
		<cfset var localhcpcLengthOfNeedYear27TBox = arguments.bean.gethcpcLengthOfNeedYear27TBox() />
		<cfset var localhcpcLengthOfNeedMonth27TBox = arguments.bean.gethcpcLengthOfNeedMonth27TBox() />
		<cfset var localhcpcCode28TBox = arguments.bean.gethcpcCode28TBox() />
		<cfset var localhcpcQty28TBox = arguments.bean.gethcpcQty28TBox() />
		<cfset var localhcpcProduct28TBox = arguments.bean.gethcpcProduct28TBox() />
		<cfset var localhcpcDX28TBox = arguments.bean.gethcpcDX28TBox() />
		<cfset var localhcpcDiagnosis28TBox = arguments.bean.gethcpcDiagnosis28TBox() />
		<cfset var localhcpcCost28TBox = arguments.bean.gethcpcCost28TBox() />
		<cfset var localhcpcLengthOfNeedYear28TBox = arguments.bean.gethcpcLengthOfNeedYear28TBox() />
		<cfset var localhcpcLengthOfNeedMonth28TBox = arguments.bean.gethcpcLengthOfNeedMonth28TBox() />
		<cfset var localhcpcCode29TBox = arguments.bean.gethcpcCode29TBox() />
		<cfset var localhcpcQty29TBox = arguments.bean.gethcpcQty29TBox() />
		<cfset var localhcpcProduct29TBox = arguments.bean.gethcpcProduct29TBox() />
		<cfset var localhcpcDX29TBox = arguments.bean.gethcpcDX29TBox() />
		<cfset var localhcpcDiagnosis29TBox = arguments.bean.gethcpcDiagnosis29TBox() />
		<cfset var localhcpcCost29TBox = arguments.bean.gethcpcCost29TBox() />
		<cfset var localhcpcLengthOfNeedYear29TBox = arguments.bean.gethcpcLengthOfNeedYear29TBox() />
		<cfset var localhcpcLengthOfNeedMonth29TBox = arguments.bean.gethcpcLengthOfNeedMonth29TBox() />
		<cfset var localhcpcCode30TBox = arguments.bean.gethcpcCode30TBox() />
		<cfset var localhcpcQty30TBox = arguments.bean.gethcpcQty30TBox() />
		<cfset var localhcpcProduct30TBox = arguments.bean.gethcpcProduct30TBox() />
		<cfset var localhcpcDX30TBox = arguments.bean.gethcpcDX30TBox() />
		<cfset var localhcpcDiagnosis30TBox = arguments.bean.gethcpcDiagnosis30TBox() />
		<cfset var localhcpcCost30TBox = arguments.bean.gethcpcCost30TBox() />
		<cfset var localhcpcLengthOfNeedYear30TBox = arguments.bean.gethcpcLengthOfNeedYear30TBox() />
		<cfset var localhcpcLengthOfNeedMonth30TBox = arguments.bean.gethcpcLengthOfNeedMonth30TBox() />
		<cfset var localhcpcCode31TBox = arguments.bean.gethcpcCode31TBox() />
		<cfset var localhcpcQty31TBox = arguments.bean.gethcpcQty31TBox() />
		<cfset var localhcpcProduct31TBox = arguments.bean.gethcpcProduct31TBox() />
		<cfset var localhcpcDX31TBox = arguments.bean.gethcpcDX31TBox() />
		<cfset var localhcpcDiagnosis31TBox = arguments.bean.gethcpcDiagnosis31TBox() />
		<cfset var localhcpcCost31TBox = arguments.bean.gethcpcCost31TBox() />
		<cfset var localhcpcLengthOfNeedYear31TBox = arguments.bean.gethcpcLengthOfNeedYear31TBox() />
		<cfset var localhcpcLengthOfNeedMonth31TBox = arguments.bean.gethcpcLengthOfNeedMonth31TBox() />
		<cfset var localhcpcCode32TBox = arguments.bean.gethcpcCode32TBox() />
		<cfset var localhcpcQty32TBox = arguments.bean.gethcpcQty32TBox() />
		<cfset var localhcpcProduct32TBox = arguments.bean.gethcpcProduct32TBox() />
		<cfset var localhcpcDX32TBox = arguments.bean.gethcpcDX32TBox() />
		<cfset var localhcpcDiagnosis32TBox = arguments.bean.gethcpcDiagnosis32TBox() />
		<cfset var localhcpcCost32TBox = arguments.bean.gethcpcCost32TBox() />
		<cfset var localhcpcLengthOfNeedYear32TBox = arguments.bean.gethcpcLengthOfNeedYear32TBox() />
		<cfset var localhcpcLengthOfNeedMonth32TBox = arguments.bean.gethcpcLengthOfNeedMonth32TBox() />
		<cfset var localhcpcCode33TBox = arguments.bean.gethcpcCode33TBox() />
		<cfset var localhcpcQty33TBox = arguments.bean.gethcpcQty33TBox() />
		<cfset var localhcpcProduct33TBox = arguments.bean.gethcpcProduct33TBox() />
		<cfset var localhcpcDX33TBox = arguments.bean.gethcpcDX33TBox() />
		<cfset var localhcpcDiagnosis33TBox = arguments.bean.gethcpcDiagnosis33TBox() />
		<cfset var localhcpcCost33TBox = arguments.bean.gethcpcCost33TBox() />
		<cfset var localhcpcLengthOfNeedYear33TBox = arguments.bean.gethcpcLengthOfNeedYear33TBox() />
		<cfset var localhcpcLengthOfNeedMonth33TBox = arguments.bean.gethcpcLengthOfNeedMonth33TBox() />
		<cfset var localhcpcCode34TBox = arguments.bean.gethcpcCode34TBox() />
		<cfset var localhcpcQty34TBox = arguments.bean.gethcpcQty34TBox() />
		<cfset var localhcpcProduct34TBox = arguments.bean.gethcpcProduct34TBox() />
		<cfset var localhcpcDX34TBox = arguments.bean.gethcpcDX34TBox() />
		<cfset var localhcpcDiagnosis34TBox = arguments.bean.gethcpcDiagnosis34TBox() />
		<cfset var localhcpcCost34TBox = arguments.bean.gethcpcCost34TBox() />
		<cfset var localhcpcLengthOfNeedYear34TBox = arguments.bean.gethcpcLengthOfNeedYear34TBox() />
		<cfset var localhcpcLengthOfNeedMonth34TBox = arguments.bean.gethcpcLengthOfNeedMonth34TBox() />
		<cfset var localhcpcCode35TBox = arguments.bean.gethcpcCode35TBox() />
		<cfset var localhcpcQty35TBox = arguments.bean.gethcpcQty35TBox() />
		<cfset var localhcpcProduct35TBox = arguments.bean.gethcpcProduct35TBox() />
		<cfset var localhcpcDX35TBox = arguments.bean.gethcpcDX35TBox() />
		<cfset var localhcpcDiagnosis35TBox = arguments.bean.gethcpcDiagnosis35TBox() />
		<cfset var localhcpcCost35TBox = arguments.bean.gethcpcCost35TBox() />
		<cfset var localhcpcLengthOfNeedYear35TBox = arguments.bean.gethcpcLengthOfNeedYear35TBox() />
		<cfset var localhcpcLengthOfNeedMonth35TBox = arguments.bean.gethcpcLengthOfNeedMonth35TBox() />
		<cfset var localhcpcCode36TBox = arguments.bean.gethcpcCode36TBox() />
		<cfset var localhcpcQty36TBox = arguments.bean.gethcpcQty36TBox() />
		<cfset var localhcpcProduct36TBox = arguments.bean.gethcpcProduct36TBox() />
		<cfset var localhcpcDX36TBox = arguments.bean.gethcpcDX36TBox() />
		<cfset var localhcpcDiagnosis36TBox = arguments.bean.gethcpcDiagnosis36TBox() />
		<cfset var localhcpcCost36TBox = arguments.bean.gethcpcCost36TBox() />
		<cfset var localhcpcLengthOfNeedYear36TBox = arguments.bean.gethcpcLengthOfNeedYear36TBox() />
		<cfset var localhcpcLengthOfNeedMonth36TBox = arguments.bean.gethcpcLengthOfNeedMonth36TBox() />
		<cfset var localhcpcCode37TBox = arguments.bean.gethcpcCode37TBox() />
		<cfset var localhcpcQty37TBox = arguments.bean.gethcpcQty37TBox() />
		<cfset var localhcpcProduct37TBox = arguments.bean.gethcpcProduct37TBox() />
		<cfset var localhcpcDX37TBox = arguments.bean.gethcpcDX37TBox() />
		<cfset var localhcpcDiagnosis37TBox = arguments.bean.gethcpcDiagnosis37TBox() />
		<cfset var localhcpcCost37TBox = arguments.bean.gethcpcCost37TBox() />
		<cfset var localhcpcLengthOfNeedYear37TBox = arguments.bean.gethcpcLengthOfNeedYear37TBox() />
		<cfset var localhcpcLengthOfNeedMonth37TBox = arguments.bean.gethcpcLengthOfNeedMonth37TBox() />
		<cfset var localhcpcCode38TBox = arguments.bean.gethcpcCode38TBox() />
		<cfset var localhcpcQty38TBox = arguments.bean.gethcpcQty38TBox() />
		<cfset var localhcpcProduct38TBox = arguments.bean.gethcpcProduct38TBox() />
		<cfset var localhcpcDX38TBox = arguments.bean.gethcpcDX38TBox() />
		<cfset var localhcpcDiagnosis38TBox = arguments.bean.gethcpcDiagnosis38TBox() />
		<cfset var localhcpcCost38TBox = arguments.bean.gethcpcCost38TBox() />
		<cfset var localhcpcLengthOfNeedYear38TBox = arguments.bean.gethcpcLengthOfNeedYear38TBox() />
		<cfset var localhcpcLengthOfNeedMonth38TBox = arguments.bean.gethcpcLengthOfNeedMonth38TBox() />
		<cfset var localhcpcCode39TBox = arguments.bean.gethcpcCode39TBox() />
		<cfset var localhcpcQty39TBox = arguments.bean.gethcpcQty39TBox() />
		<cfset var localhcpcProduct39TBox = arguments.bean.gethcpcProduct39TBox() />
		<cfset var localhcpcDX39TBox = arguments.bean.gethcpcDX39TBox() />
		<cfset var localhcpcDiagnosis39TBox = arguments.bean.gethcpcDiagnosis39TBox() />
		<cfset var localhcpcCost39TBox = arguments.bean.gethcpcCost39TBox() />
		<cfset var localhcpcLengthOfNeedYear39TBox = arguments.bean.gethcpcLengthOfNeedYear39TBox() />
		<cfset var localhcpcLengthOfNeedMonth39TBox = arguments.bean.gethcpcLengthOfNeedMonth39TBox() />
		<cfset var localhcpcCode40TBox = arguments.bean.gethcpcCode40TBox() />
		<cfset var localhcpcQty40TBox = arguments.bean.gethcpcQty40TBox() />
		<cfset var localhcpcProduct40TBox = arguments.bean.gethcpcProduct40TBox() />
		<cfset var localhcpcDX40TBox = arguments.bean.gethcpcDX40TBox() />
		<cfset var localhcpcDiagnosis40TBox = arguments.bean.gethcpcDiagnosis40TBox() />
		<cfset var localhcpcCost40TBox = arguments.bean.gethcpcCost40TBox() />
		<cfset var localhcpcLengthOfNeedYear40TBox = arguments.bean.gethcpcLengthOfNeedYear40TBox() />
		<cfset var localhcpcLengthOfNeedMonth40TBox = arguments.bean.gethcpcLengthOfNeedMonth40TBox() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateQuoteHCPC" datasource="#trim(arguments.ds)#">
				UPDATE quotehcpc  SET
					
					QuoteID =						
						<cfqueryparam value="#trim(localQuoteID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					hcpcCode1TBox =	
					<cfif trim(localhcpcCode1TBox) NEQ "" AND trim(localhcpcCode1TBox) NEQ "@@" AND trim(localhcpcCode1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty1TBox =	
					<cfif trim(localhcpcQty1TBox) NEQ "" AND trim(localhcpcQty1TBox) NEQ "@@" AND trim(localhcpcQty1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct1TBox =	
					<cfif trim(localhcpcProduct1TBox) NEQ "" AND trim(localhcpcProduct1TBox) NEQ "@@" AND trim(localhcpcProduct1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX1TBox =	
					<cfif trim(localhcpcDX1TBox) NEQ "" AND trim(localhcpcDX1TBox) NEQ "@@" AND trim(localhcpcDX1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis1TBox =	
					<cfif trim(localhcpcDiagnosis1TBox) NEQ "" AND trim(localhcpcDiagnosis1TBox) NEQ "@@" AND trim(localhcpcDiagnosis1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost1TBox =	
					<cfif trim(localhcpcCost1TBox) NEQ "" AND trim(localhcpcCost1TBox) NEQ "@@" AND trim(localhcpcCost1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear1TBox =	
					<cfif trim(localhcpcLengthOfNeedYear1TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear1TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth1TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth1TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth1TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth1TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth1TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode2TBox =	
					<cfif trim(localhcpcCode2TBox) NEQ "" AND trim(localhcpcCode2TBox) NEQ "@@" AND trim(localhcpcCode2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty2TBox =	
					<cfif trim(localhcpcQty2TBox) NEQ "" AND trim(localhcpcQty2TBox) NEQ "@@" AND trim(localhcpcQty2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct2TBox =	
					<cfif trim(localhcpcProduct2TBox) NEQ "" AND trim(localhcpcProduct2TBox) NEQ "@@" AND trim(localhcpcProduct2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX2TBox =	
					<cfif trim(localhcpcDX2TBox) NEQ "" AND trim(localhcpcDX2TBox) NEQ "@@" AND trim(localhcpcDX2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis2TBox =	
					<cfif trim(localhcpcDiagnosis2TBox) NEQ "" AND trim(localhcpcDiagnosis2TBox) NEQ "@@" AND trim(localhcpcDiagnosis2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost2TBox =	
					<cfif trim(localhcpcCost2TBox) NEQ "" AND trim(localhcpcCost2TBox) NEQ "@@" AND trim(localhcpcCost2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear2TBox =	
					<cfif trim(localhcpcLengthOfNeedYear2TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear2TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth2TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth2TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth2TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode3TBox =	
					<cfif trim(localhcpcCode3TBox) NEQ "" AND trim(localhcpcCode3TBox) NEQ "@@" AND trim(localhcpcCode3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty3TBox =	
					<cfif trim(localhcpcQty3TBox) NEQ "" AND trim(localhcpcQty3TBox) NEQ "@@" AND trim(localhcpcQty3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct3TBox =	
					<cfif trim(localhcpcProduct3TBox) NEQ "" AND trim(localhcpcProduct3TBox) NEQ "@@" AND trim(localhcpcProduct3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX3TBox =	
					<cfif trim(localhcpcDX3TBox) NEQ "" AND trim(localhcpcDX3TBox) NEQ "@@" AND trim(localhcpcDX3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis3TBox =	
					<cfif trim(localhcpcDiagnosis3TBox) NEQ "" AND trim(localhcpcDiagnosis3TBox) NEQ "@@" AND trim(localhcpcDiagnosis3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost3TBox =	
					<cfif trim(localhcpcCost3TBox) NEQ "" AND trim(localhcpcCost3TBox) NEQ "@@" AND trim(localhcpcCost3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear3TBox =	
					<cfif trim(localhcpcLengthOfNeedYear3TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear3TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth3TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth3TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth3TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth3TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth3TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode4TBox =	
					<cfif trim(localhcpcCode4TBox) NEQ "" AND trim(localhcpcCode4TBox) NEQ "@@" AND trim(localhcpcCode4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty4TBox =	
					<cfif trim(localhcpcQty4TBox) NEQ "" AND trim(localhcpcQty4TBox) NEQ "@@" AND trim(localhcpcQty4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct4TBox =	
					<cfif trim(localhcpcProduct4TBox) NEQ "" AND trim(localhcpcProduct4TBox) NEQ "@@" AND trim(localhcpcProduct4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX4TBox =	
					<cfif trim(localhcpcDX4TBox) NEQ "" AND trim(localhcpcDX4TBox) NEQ "@@" AND trim(localhcpcDX4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis4TBox =	
					<cfif trim(localhcpcDiagnosis4TBox) NEQ "" AND trim(localhcpcDiagnosis4TBox) NEQ "@@" AND trim(localhcpcDiagnosis4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost4TBox =	
					<cfif trim(localhcpcCost4TBox) NEQ "" AND trim(localhcpcCost4TBox) NEQ "@@" AND trim(localhcpcCost4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear4TBox =	
					<cfif trim(localhcpcLengthOfNeedYear4TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear4TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth4TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth4TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth4TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth4TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth4TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode5TBox =	
					<cfif trim(localhcpcCode5TBox) NEQ "" AND trim(localhcpcCode5TBox) NEQ "@@" AND trim(localhcpcCode5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty5TBox =	
					<cfif trim(localhcpcQty5TBox) NEQ "" AND trim(localhcpcQty5TBox) NEQ "@@" AND trim(localhcpcQty5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct5TBox =	
					<cfif trim(localhcpcProduct5TBox) NEQ "" AND trim(localhcpcProduct5TBox) NEQ "@@" AND trim(localhcpcProduct5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX5TBox =	
					<cfif trim(localhcpcDX5TBox) NEQ "" AND trim(localhcpcDX5TBox) NEQ "@@" AND trim(localhcpcDX5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis5TBox =	
					<cfif trim(localhcpcDiagnosis5TBox) NEQ "" AND trim(localhcpcDiagnosis5TBox) NEQ "@@" AND trim(localhcpcDiagnosis5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost5TBox =	
					<cfif trim(localhcpcCost5TBox) NEQ "" AND trim(localhcpcCost5TBox) NEQ "@@" AND trim(localhcpcCost5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear5TBox =	
					<cfif trim(localhcpcLengthOfNeedYear5TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear5TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth5TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth5TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth5TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth5TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth5TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode6TBox =	
					<cfif trim(localhcpcCode6TBox) NEQ "" AND trim(localhcpcCode6TBox) NEQ "@@" AND trim(localhcpcCode6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty6TBox =	
					<cfif trim(localhcpcQty6TBox) NEQ "" AND trim(localhcpcQty6TBox) NEQ "@@" AND trim(localhcpcQty6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct6TBox =	
					<cfif trim(localhcpcProduct6TBox) NEQ "" AND trim(localhcpcProduct6TBox) NEQ "@@" AND trim(localhcpcProduct6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX6TBox =	
					<cfif trim(localhcpcDX6TBox) NEQ "" AND trim(localhcpcDX6TBox) NEQ "@@" AND trim(localhcpcDX6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis6TBox =	
					<cfif trim(localhcpcDiagnosis6TBox) NEQ "" AND trim(localhcpcDiagnosis6TBox) NEQ "@@" AND trim(localhcpcDiagnosis6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost6TBox =	
					<cfif trim(localhcpcCost6TBox) NEQ "" AND trim(localhcpcCost6TBox) NEQ "@@" AND trim(localhcpcCost6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear6TBox =	
					<cfif trim(localhcpcLengthOfNeedYear6TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear6TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth6TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth6TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth6TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth6TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth6TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode7TBox =	
					<cfif trim(localhcpcCode7TBox) NEQ "" AND trim(localhcpcCode7TBox) NEQ "@@" AND trim(localhcpcCode7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty7TBox =	
					<cfif trim(localhcpcQty7TBox) NEQ "" AND trim(localhcpcQty7TBox) NEQ "@@" AND trim(localhcpcQty7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct7TBox =	
					<cfif trim(localhcpcProduct7TBox) NEQ "" AND trim(localhcpcProduct7TBox) NEQ "@@" AND trim(localhcpcProduct7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX7TBox =	
					<cfif trim(localhcpcDX7TBox) NEQ "" AND trim(localhcpcDX7TBox) NEQ "@@" AND trim(localhcpcDX7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis7TBox =	
					<cfif trim(localhcpcDiagnosis7TBox) NEQ "" AND trim(localhcpcDiagnosis7TBox) NEQ "@@" AND trim(localhcpcDiagnosis7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost7TBox =	
					<cfif trim(localhcpcCost7TBox) NEQ "" AND trim(localhcpcCost7TBox) NEQ "@@" AND trim(localhcpcCost7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear7TBox =	
					<cfif trim(localhcpcLengthOfNeedYear7TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear7TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth7TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth7TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth7TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth7TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth7TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode8TBox =	
					<cfif trim(localhcpcCode8TBox) NEQ "" AND trim(localhcpcCode8TBox) NEQ "@@" AND trim(localhcpcCode8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty8TBox =	
					<cfif trim(localhcpcQty8TBox) NEQ "" AND trim(localhcpcQty8TBox) NEQ "@@" AND trim(localhcpcQty8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct8TBox =	
					<cfif trim(localhcpcProduct8TBox) NEQ "" AND trim(localhcpcProduct8TBox) NEQ "@@" AND trim(localhcpcProduct8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX8TBox =	
					<cfif trim(localhcpcDX8TBox) NEQ "" AND trim(localhcpcDX8TBox) NEQ "@@" AND trim(localhcpcDX8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis8TBox =	
					<cfif trim(localhcpcDiagnosis8TBox) NEQ "" AND trim(localhcpcDiagnosis8TBox) NEQ "@@" AND trim(localhcpcDiagnosis8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost8TBox =	
					<cfif trim(localhcpcCost8TBox) NEQ "" AND trim(localhcpcCost8TBox) NEQ "@@" AND trim(localhcpcCost8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear8TBox =	
					<cfif trim(localhcpcLengthOfNeedYear8TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear8TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth8TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth8TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth8TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth8TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth8TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode9TBox =	
					<cfif trim(localhcpcCode9TBox) NEQ "" AND trim(localhcpcCode9TBox) NEQ "@@" AND trim(localhcpcCode9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty9TBox =	
					<cfif trim(localhcpcQty9TBox) NEQ "" AND trim(localhcpcQty9TBox) NEQ "@@" AND trim(localhcpcQty9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct9TBox =	
					<cfif trim(localhcpcProduct9TBox) NEQ "" AND trim(localhcpcProduct9TBox) NEQ "@@" AND trim(localhcpcProduct9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX9TBox =	
					<cfif trim(localhcpcDX9TBox) NEQ "" AND trim(localhcpcDX9TBox) NEQ "@@" AND trim(localhcpcDX9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis9TBox =	
					<cfif trim(localhcpcDiagnosis9TBox) NEQ "" AND trim(localhcpcDiagnosis9TBox) NEQ "@@" AND trim(localhcpcDiagnosis9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost9TBox =	
					<cfif trim(localhcpcCost9TBox) NEQ "" AND trim(localhcpcCost9TBox) NEQ "@@" AND trim(localhcpcCost9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear9TBox =	
					<cfif trim(localhcpcLengthOfNeedYear9TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear9TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth9TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth9TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth9TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth9TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth9TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode10TBox =	
					<cfif trim(localhcpcCode10TBox) NEQ "" AND trim(localhcpcCode10TBox) NEQ "@@" AND trim(localhcpcCode10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty10TBox =	
					<cfif trim(localhcpcQty10TBox) NEQ "" AND trim(localhcpcQty10TBox) NEQ "@@" AND trim(localhcpcQty10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct10TBox =	
					<cfif trim(localhcpcProduct10TBox) NEQ "" AND trim(localhcpcProduct10TBox) NEQ "@@" AND trim(localhcpcProduct10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX10TBox =	
					<cfif trim(localhcpcDX10TBox) NEQ "" AND trim(localhcpcDX10TBox) NEQ "@@" AND trim(localhcpcDX10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis10TBox =	
					<cfif trim(localhcpcDiagnosis10TBox) NEQ "" AND trim(localhcpcDiagnosis10TBox) NEQ "@@" AND trim(localhcpcDiagnosis10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost10TBox =	
					<cfif trim(localhcpcCost10TBox) NEQ "" AND trim(localhcpcCost10TBox) NEQ "@@" AND trim(localhcpcCost10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear10TBox =	
					<cfif trim(localhcpcLengthOfNeedYear10TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear10TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth10TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth10TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth10TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth10TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth10TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode11TBox =	
					<cfif trim(localhcpcCode11TBox) NEQ "" AND trim(localhcpcCode11TBox) NEQ "@@" AND trim(localhcpcCode11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty11TBox =	
					<cfif trim(localhcpcQty11TBox) NEQ "" AND trim(localhcpcQty11TBox) NEQ "@@" AND trim(localhcpcQty11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct11TBox =	
					<cfif trim(localhcpcProduct11TBox) NEQ "" AND trim(localhcpcProduct11TBox) NEQ "@@" AND trim(localhcpcProduct11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX11TBox =	
					<cfif trim(localhcpcDX11TBox) NEQ "" AND trim(localhcpcDX11TBox) NEQ "@@" AND trim(localhcpcDX11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis11TBox =	
					<cfif trim(localhcpcDiagnosis11TBox) NEQ "" AND trim(localhcpcDiagnosis11TBox) NEQ "@@" AND trim(localhcpcDiagnosis11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost11TBox =	
					<cfif trim(localhcpcCost11TBox) NEQ "" AND trim(localhcpcCost11TBox) NEQ "@@" AND trim(localhcpcCost11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear11TBox =	
					<cfif trim(localhcpcLengthOfNeedYear11TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear11TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth11TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth11TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth11TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth11TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth11TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode12TBox =	
					<cfif trim(localhcpcCode12TBox) NEQ "" AND trim(localhcpcCode12TBox) NEQ "@@" AND trim(localhcpcCode12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty12TBox =	
					<cfif trim(localhcpcQty12TBox) NEQ "" AND trim(localhcpcQty12TBox) NEQ "@@" AND trim(localhcpcQty12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct12TBox =	
					<cfif trim(localhcpcProduct12TBox) NEQ "" AND trim(localhcpcProduct12TBox) NEQ "@@" AND trim(localhcpcProduct12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX12TBox =	
					<cfif trim(localhcpcDX12TBox) NEQ "" AND trim(localhcpcDX12TBox) NEQ "@@" AND trim(localhcpcDX12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis12TBox =	
					<cfif trim(localhcpcDiagnosis12TBox) NEQ "" AND trim(localhcpcDiagnosis12TBox) NEQ "@@" AND trim(localhcpcDiagnosis12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost12TBox =	
					<cfif trim(localhcpcCost12TBox) NEQ "" AND trim(localhcpcCost12TBox) NEQ "@@" AND trim(localhcpcCost12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear12TBox =	
					<cfif trim(localhcpcLengthOfNeedYear12TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear12TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth12TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth12TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth12TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth12TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth12TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode13TBox =	
					<cfif trim(localhcpcCode13TBox) NEQ "" AND trim(localhcpcCode13TBox) NEQ "@@" AND trim(localhcpcCode13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty13TBox =	
					<cfif trim(localhcpcQty13TBox) NEQ "" AND trim(localhcpcQty13TBox) NEQ "@@" AND trim(localhcpcQty13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct13TBox =	
					<cfif trim(localhcpcProduct13TBox) NEQ "" AND trim(localhcpcProduct13TBox) NEQ "@@" AND trim(localhcpcProduct13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX13TBox =	
					<cfif trim(localhcpcDX13TBox) NEQ "" AND trim(localhcpcDX13TBox) NEQ "@@" AND trim(localhcpcDX13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis13TBox =	
					<cfif trim(localhcpcDiagnosis13TBox) NEQ "" AND trim(localhcpcDiagnosis13TBox) NEQ "@@" AND trim(localhcpcDiagnosis13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost13TBox =	
					<cfif trim(localhcpcCost13TBox) NEQ "" AND trim(localhcpcCost13TBox) NEQ "@@" AND trim(localhcpcCost13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear13TBox =	
					<cfif trim(localhcpcLengthOfNeedYear13TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear13TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth13TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth13TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth13TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth13TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth13TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode14TBox =	
					<cfif trim(localhcpcCode14TBox) NEQ "" AND trim(localhcpcCode14TBox) NEQ "@@" AND trim(localhcpcCode14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty14TBox =	
					<cfif trim(localhcpcQty14TBox) NEQ "" AND trim(localhcpcQty14TBox) NEQ "@@" AND trim(localhcpcQty14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct14TBox =	
					<cfif trim(localhcpcProduct14TBox) NEQ "" AND trim(localhcpcProduct14TBox) NEQ "@@" AND trim(localhcpcProduct14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX14TBox =	
					<cfif trim(localhcpcDX14TBox) NEQ "" AND trim(localhcpcDX14TBox) NEQ "@@" AND trim(localhcpcDX14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis14TBox =	
					<cfif trim(localhcpcDiagnosis14TBox) NEQ "" AND trim(localhcpcDiagnosis14TBox) NEQ "@@" AND trim(localhcpcDiagnosis14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost14TBox =	
					<cfif trim(localhcpcCost14TBox) NEQ "" AND trim(localhcpcCost14TBox) NEQ "@@" AND trim(localhcpcCost14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear14TBox =	
					<cfif trim(localhcpcLengthOfNeedYear14TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear14TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth14TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth14TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth14TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth14TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth14TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode15TBox =	
					<cfif trim(localhcpcCode15TBox) NEQ "" AND trim(localhcpcCode15TBox) NEQ "@@" AND trim(localhcpcCode15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty15TBox =	
					<cfif trim(localhcpcQty15TBox) NEQ "" AND trim(localhcpcQty15TBox) NEQ "@@" AND trim(localhcpcQty15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct15TBox =	
					<cfif trim(localhcpcProduct15TBox) NEQ "" AND trim(localhcpcProduct15TBox) NEQ "@@" AND trim(localhcpcProduct15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX15TBox =	
					<cfif trim(localhcpcDX15TBox) NEQ "" AND trim(localhcpcDX15TBox) NEQ "@@" AND trim(localhcpcDX15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis15TBox =	
					<cfif trim(localhcpcDiagnosis15TBox) NEQ "" AND trim(localhcpcDiagnosis15TBox) NEQ "@@" AND trim(localhcpcDiagnosis15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost15TBox =	
					<cfif trim(localhcpcCost15TBox) NEQ "" AND trim(localhcpcCost15TBox) NEQ "@@" AND trim(localhcpcCost15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear15TBox =	
					<cfif trim(localhcpcLengthOfNeedYear15TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear15TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth15TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth15TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth15TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth15TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth15TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode16TBox =	
					<cfif trim(localhcpcCode16TBox) NEQ "" AND trim(localhcpcCode16TBox) NEQ "@@" AND trim(localhcpcCode16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty16TBox =	
					<cfif trim(localhcpcQty16TBox) NEQ "" AND trim(localhcpcQty16TBox) NEQ "@@" AND trim(localhcpcQty16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct16TBox =	
					<cfif trim(localhcpcProduct16TBox) NEQ "" AND trim(localhcpcProduct16TBox) NEQ "@@" AND trim(localhcpcProduct16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX16TBox =	
					<cfif trim(localhcpcDX16TBox) NEQ "" AND trim(localhcpcDX16TBox) NEQ "@@" AND trim(localhcpcDX16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis16TBox =	
					<cfif trim(localhcpcDiagnosis16TBox) NEQ "" AND trim(localhcpcDiagnosis16TBox) NEQ "@@" AND trim(localhcpcDiagnosis16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost16TBox =	
					<cfif trim(localhcpcCost16TBox) NEQ "" AND trim(localhcpcCost16TBox) NEQ "@@" AND trim(localhcpcCost16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear16TBox =	
					<cfif trim(localhcpcLengthOfNeedYear16TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear16TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth16TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth16TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth16TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth16TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth16TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode17TBox =	
					<cfif trim(localhcpcCode17TBox) NEQ "" AND trim(localhcpcCode17TBox) NEQ "@@" AND trim(localhcpcCode17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty17TBox =	
					<cfif trim(localhcpcQty17TBox) NEQ "" AND trim(localhcpcQty17TBox) NEQ "@@" AND trim(localhcpcQty17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct17TBox =	
					<cfif trim(localhcpcProduct17TBox) NEQ "" AND trim(localhcpcProduct17TBox) NEQ "@@" AND trim(localhcpcProduct17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX17TBox =	
					<cfif trim(localhcpcDX17TBox) NEQ "" AND trim(localhcpcDX17TBox) NEQ "@@" AND trim(localhcpcDX17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis17TBox =	
					<cfif trim(localhcpcDiagnosis17TBox) NEQ "" AND trim(localhcpcDiagnosis17TBox) NEQ "@@" AND trim(localhcpcDiagnosis17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost17TBox =	
					<cfif trim(localhcpcCost17TBox) NEQ "" AND trim(localhcpcCost17TBox) NEQ "@@" AND trim(localhcpcCost17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear17TBox =	
					<cfif trim(localhcpcLengthOfNeedYear17TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear17TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth17TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth17TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth17TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth17TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth17TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode18TBox =	
					<cfif trim(localhcpcCode18TBox) NEQ "" AND trim(localhcpcCode18TBox) NEQ "@@" AND trim(localhcpcCode18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty18TBox =	
					<cfif trim(localhcpcQty18TBox) NEQ "" AND trim(localhcpcQty18TBox) NEQ "@@" AND trim(localhcpcQty18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct18TBox =	
					<cfif trim(localhcpcProduct18TBox) NEQ "" AND trim(localhcpcProduct18TBox) NEQ "@@" AND trim(localhcpcProduct18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX18TBox =	
					<cfif trim(localhcpcDX18TBox) NEQ "" AND trim(localhcpcDX18TBox) NEQ "@@" AND trim(localhcpcDX18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis18TBox =	
					<cfif trim(localhcpcDiagnosis18TBox) NEQ "" AND trim(localhcpcDiagnosis18TBox) NEQ "@@" AND trim(localhcpcDiagnosis18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost18TBox =	
					<cfif trim(localhcpcCost18TBox) NEQ "" AND trim(localhcpcCost18TBox) NEQ "@@" AND trim(localhcpcCost18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear18TBox =	
					<cfif trim(localhcpcLengthOfNeedYear18TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear18TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth18TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth18TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth18TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth18TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth18TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode19TBox =	
					<cfif trim(localhcpcCode19TBox) NEQ "" AND trim(localhcpcCode19TBox) NEQ "@@" AND trim(localhcpcCode19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty19TBox =	
					<cfif trim(localhcpcQty19TBox) NEQ "" AND trim(localhcpcQty19TBox) NEQ "@@" AND trim(localhcpcQty19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct19TBox =	
					<cfif trim(localhcpcProduct19TBox) NEQ "" AND trim(localhcpcProduct19TBox) NEQ "@@" AND trim(localhcpcProduct19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX19TBox =	
					<cfif trim(localhcpcDX19TBox) NEQ "" AND trim(localhcpcDX19TBox) NEQ "@@" AND trim(localhcpcDX19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis19TBox =	
					<cfif trim(localhcpcDiagnosis19TBox) NEQ "" AND trim(localhcpcDiagnosis19TBox) NEQ "@@" AND trim(localhcpcDiagnosis19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost19TBox =	
					<cfif trim(localhcpcCost19TBox) NEQ "" AND trim(localhcpcCost19TBox) NEQ "@@" AND trim(localhcpcCost19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear19TBox =	
					<cfif trim(localhcpcLengthOfNeedYear19TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear19TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth19TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth19TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth19TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth19TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth19TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode20TBox =	
					<cfif trim(localhcpcCode20TBox) NEQ "" AND trim(localhcpcCode20TBox) NEQ "@@" AND trim(localhcpcCode20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty20TBox =	
					<cfif trim(localhcpcQty20TBox) NEQ "" AND trim(localhcpcQty20TBox) NEQ "@@" AND trim(localhcpcQty20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct20TBox =	
					<cfif trim(localhcpcProduct20TBox) NEQ "" AND trim(localhcpcProduct20TBox) NEQ "@@" AND trim(localhcpcProduct20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX20TBox =	
					<cfif trim(localhcpcDX20TBox) NEQ "" AND trim(localhcpcDX20TBox) NEQ "@@" AND trim(localhcpcDX20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis20TBox =	
					<cfif trim(localhcpcDiagnosis20TBox) NEQ "" AND trim(localhcpcDiagnosis20TBox) NEQ "@@" AND trim(localhcpcDiagnosis20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost20TBox =	
					<cfif trim(localhcpcCost20TBox) NEQ "" AND trim(localhcpcCost20TBox) NEQ "@@" AND trim(localhcpcCost20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear20TBox =	
					<cfif trim(localhcpcLengthOfNeedYear20TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear20TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth20TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth20TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth20TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth20TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth20TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode21TBox =	
					<cfif trim(localhcpcCode21TBox) NEQ "" AND trim(localhcpcCode21TBox) NEQ "@@" AND trim(localhcpcCode21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty21TBox =	
					<cfif trim(localhcpcQty21TBox) NEQ "" AND trim(localhcpcQty21TBox) NEQ "@@" AND trim(localhcpcQty21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct21TBox =	
					<cfif trim(localhcpcProduct21TBox) NEQ "" AND trim(localhcpcProduct21TBox) NEQ "@@" AND trim(localhcpcProduct21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX21TBox =	
					<cfif trim(localhcpcDX21TBox) NEQ "" AND trim(localhcpcDX21TBox) NEQ "@@" AND trim(localhcpcDX21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis21TBox =	
					<cfif trim(localhcpcDiagnosis21TBox) NEQ "" AND trim(localhcpcDiagnosis21TBox) NEQ "@@" AND trim(localhcpcDiagnosis21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost21TBox =	
					<cfif trim(localhcpcCost21TBox) NEQ "" AND trim(localhcpcCost21TBox) NEQ "@@" AND trim(localhcpcCost21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear21TBox =	
					<cfif trim(localhcpcLengthOfNeedYear21TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear21TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth21TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth21TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth21TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth21TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth21TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode22TBox =	
					<cfif trim(localhcpcCode22TBox) NEQ "" AND trim(localhcpcCode22TBox) NEQ "@@" AND trim(localhcpcCode22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty22TBox =	
					<cfif trim(localhcpcQty22TBox) NEQ "" AND trim(localhcpcQty22TBox) NEQ "@@" AND trim(localhcpcQty22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct22TBox =	
					<cfif trim(localhcpcProduct22TBox) NEQ "" AND trim(localhcpcProduct22TBox) NEQ "@@" AND trim(localhcpcProduct22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX22TBox =	
					<cfif trim(localhcpcDX22TBox) NEQ "" AND trim(localhcpcDX22TBox) NEQ "@@" AND trim(localhcpcDX22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis22TBox =	
					<cfif trim(localhcpcDiagnosis22TBox) NEQ "" AND trim(localhcpcDiagnosis22TBox) NEQ "@@" AND trim(localhcpcDiagnosis22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost22TBox =	
					<cfif trim(localhcpcCost22TBox) NEQ "" AND trim(localhcpcCost22TBox) NEQ "@@" AND trim(localhcpcCost22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear22TBox =	
					<cfif trim(localhcpcLengthOfNeedYear22TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear22TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth22TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth22TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth22TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth22TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth22TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode23TBox =	
					<cfif trim(localhcpcCode23TBox) NEQ "" AND trim(localhcpcCode23TBox) NEQ "@@" AND trim(localhcpcCode23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty23TBox =	
					<cfif trim(localhcpcQty23TBox) NEQ "" AND trim(localhcpcQty23TBox) NEQ "@@" AND trim(localhcpcQty23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct23TBox =	
					<cfif trim(localhcpcProduct23TBox) NEQ "" AND trim(localhcpcProduct23TBox) NEQ "@@" AND trim(localhcpcProduct23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX23TBox =	
					<cfif trim(localhcpcDX23TBox) NEQ "" AND trim(localhcpcDX23TBox) NEQ "@@" AND trim(localhcpcDX23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis23TBox =	
					<cfif trim(localhcpcDiagnosis23TBox) NEQ "" AND trim(localhcpcDiagnosis23TBox) NEQ "@@" AND trim(localhcpcDiagnosis23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost23TBox =	
					<cfif trim(localhcpcCost23TBox) NEQ "" AND trim(localhcpcCost23TBox) NEQ "@@" AND trim(localhcpcCost23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear23TBox =	
					<cfif trim(localhcpcLengthOfNeedYear23TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear23TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth23TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth23TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth23TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth23TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth23TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode24TBox =	
					<cfif trim(localhcpcCode24TBox) NEQ "" AND trim(localhcpcCode24TBox) NEQ "@@" AND trim(localhcpcCode24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty24TBox =	
					<cfif trim(localhcpcQty24TBox) NEQ "" AND trim(localhcpcQty24TBox) NEQ "@@" AND trim(localhcpcQty24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct24TBox =	
					<cfif trim(localhcpcProduct24TBox) NEQ "" AND trim(localhcpcProduct24TBox) NEQ "@@" AND trim(localhcpcProduct24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX24TBox =	
					<cfif trim(localhcpcDX24TBox) NEQ "" AND trim(localhcpcDX24TBox) NEQ "@@" AND trim(localhcpcDX24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis24TBox =	
					<cfif trim(localhcpcDiagnosis24TBox) NEQ "" AND trim(localhcpcDiagnosis24TBox) NEQ "@@" AND trim(localhcpcDiagnosis24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost24TBox =	
					<cfif trim(localhcpcCost24TBox) NEQ "" AND trim(localhcpcCost24TBox) NEQ "@@" AND trim(localhcpcCost24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear24TBox =	
					<cfif trim(localhcpcLengthOfNeedYear24TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear24TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth24TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth24TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth24TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth24TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth24TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode25TBox =	
					<cfif trim(localhcpcCode25TBox) NEQ "" AND trim(localhcpcCode25TBox) NEQ "@@" AND trim(localhcpcCode25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty25TBox =	
					<cfif trim(localhcpcQty25TBox) NEQ "" AND trim(localhcpcQty25TBox) NEQ "@@" AND trim(localhcpcQty25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct25TBox =	
					<cfif trim(localhcpcProduct25TBox) NEQ "" AND trim(localhcpcProduct25TBox) NEQ "@@" AND trim(localhcpcProduct25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX25TBox =	
					<cfif trim(localhcpcDX25TBox) NEQ "" AND trim(localhcpcDX25TBox) NEQ "@@" AND trim(localhcpcDX25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis25TBox =	
					<cfif trim(localhcpcDiagnosis25TBox) NEQ "" AND trim(localhcpcDiagnosis25TBox) NEQ "@@" AND trim(localhcpcDiagnosis25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost25TBox =	
					<cfif trim(localhcpcCost25TBox) NEQ "" AND trim(localhcpcCost25TBox) NEQ "@@" AND trim(localhcpcCost25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear25TBox =	
					<cfif trim(localhcpcLengthOfNeedYear25TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear25TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth25TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth25TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth25TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth25TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth25TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode26TBox =	
					<cfif trim(localhcpcCode26TBox) NEQ "" AND trim(localhcpcCode26TBox) NEQ "@@" AND trim(localhcpcCode26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty26TBox =	
					<cfif trim(localhcpcQty26TBox) NEQ "" AND trim(localhcpcQty26TBox) NEQ "@@" AND trim(localhcpcQty26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct26TBox =	
					<cfif trim(localhcpcProduct26TBox) NEQ "" AND trim(localhcpcProduct26TBox) NEQ "@@" AND trim(localhcpcProduct26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX26TBox =	
					<cfif trim(localhcpcDX26TBox) NEQ "" AND trim(localhcpcDX26TBox) NEQ "@@" AND trim(localhcpcDX26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis26TBox =	
					<cfif trim(localhcpcDiagnosis26TBox) NEQ "" AND trim(localhcpcDiagnosis26TBox) NEQ "@@" AND trim(localhcpcDiagnosis26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost26TBox =	
					<cfif trim(localhcpcCost26TBox) NEQ "" AND trim(localhcpcCost26TBox) NEQ "@@" AND trim(localhcpcCost26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear26TBox =	
					<cfif trim(localhcpcLengthOfNeedYear26TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear26TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth26TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth26TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth26TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth26TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth26TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode27TBox =	
					<cfif trim(localhcpcCode27TBox) NEQ "" AND trim(localhcpcCode27TBox) NEQ "@@" AND trim(localhcpcCode27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty27TBox =	
					<cfif trim(localhcpcQty27TBox) NEQ "" AND trim(localhcpcQty27TBox) NEQ "@@" AND trim(localhcpcQty27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct27TBox =	
					<cfif trim(localhcpcProduct27TBox) NEQ "" AND trim(localhcpcProduct27TBox) NEQ "@@" AND trim(localhcpcProduct27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX27TBox =	
					<cfif trim(localhcpcDX27TBox) NEQ "" AND trim(localhcpcDX27TBox) NEQ "@@" AND trim(localhcpcDX27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis27TBox =	
					<cfif trim(localhcpcDiagnosis27TBox) NEQ "" AND trim(localhcpcDiagnosis27TBox) NEQ "@@" AND trim(localhcpcDiagnosis27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost27TBox =	
					<cfif trim(localhcpcCost27TBox) NEQ "" AND trim(localhcpcCost27TBox) NEQ "@@" AND trim(localhcpcCost27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear27TBox =	
					<cfif trim(localhcpcLengthOfNeedYear27TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear27TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth27TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth27TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth27TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth27TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth27TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode28TBox =	
					<cfif trim(localhcpcCode28TBox) NEQ "" AND trim(localhcpcCode28TBox) NEQ "@@" AND trim(localhcpcCode28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty28TBox =	
					<cfif trim(localhcpcQty28TBox) NEQ "" AND trim(localhcpcQty28TBox) NEQ "@@" AND trim(localhcpcQty28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct28TBox =	
					<cfif trim(localhcpcProduct28TBox) NEQ "" AND trim(localhcpcProduct28TBox) NEQ "@@" AND trim(localhcpcProduct28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX28TBox =	
					<cfif trim(localhcpcDX28TBox) NEQ "" AND trim(localhcpcDX28TBox) NEQ "@@" AND trim(localhcpcDX28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis28TBox =	
					<cfif trim(localhcpcDiagnosis28TBox) NEQ "" AND trim(localhcpcDiagnosis28TBox) NEQ "@@" AND trim(localhcpcDiagnosis28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost28TBox =	
					<cfif trim(localhcpcCost28TBox) NEQ "" AND trim(localhcpcCost28TBox) NEQ "@@" AND trim(localhcpcCost28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear28TBox =	
					<cfif trim(localhcpcLengthOfNeedYear28TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear28TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth28TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth28TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth28TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth28TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth28TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode29TBox =	
					<cfif trim(localhcpcCode29TBox) NEQ "" AND trim(localhcpcCode29TBox) NEQ "@@" AND trim(localhcpcCode29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty29TBox =	
					<cfif trim(localhcpcQty29TBox) NEQ "" AND trim(localhcpcQty29TBox) NEQ "@@" AND trim(localhcpcQty29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct29TBox =	
					<cfif trim(localhcpcProduct29TBox) NEQ "" AND trim(localhcpcProduct29TBox) NEQ "@@" AND trim(localhcpcProduct29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX29TBox =	
					<cfif trim(localhcpcDX29TBox) NEQ "" AND trim(localhcpcDX29TBox) NEQ "@@" AND trim(localhcpcDX29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis29TBox =	
					<cfif trim(localhcpcDiagnosis29TBox) NEQ "" AND trim(localhcpcDiagnosis29TBox) NEQ "@@" AND trim(localhcpcDiagnosis29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost29TBox =	
					<cfif trim(localhcpcCost29TBox) NEQ "" AND trim(localhcpcCost29TBox) NEQ "@@" AND trim(localhcpcCost29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear29TBox =	
					<cfif trim(localhcpcLengthOfNeedYear29TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear29TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth29TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth29TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth29TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth29TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth29TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode30TBox =	
					<cfif trim(localhcpcCode30TBox) NEQ "" AND trim(localhcpcCode30TBox) NEQ "@@" AND trim(localhcpcCode30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty30TBox =	
					<cfif trim(localhcpcQty30TBox) NEQ "" AND trim(localhcpcQty30TBox) NEQ "@@" AND trim(localhcpcQty30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct30TBox =	
					<cfif trim(localhcpcProduct30TBox) NEQ "" AND trim(localhcpcProduct30TBox) NEQ "@@" AND trim(localhcpcProduct30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX30TBox =	
					<cfif trim(localhcpcDX30TBox) NEQ "" AND trim(localhcpcDX30TBox) NEQ "@@" AND trim(localhcpcDX30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis30TBox =	
					<cfif trim(localhcpcDiagnosis30TBox) NEQ "" AND trim(localhcpcDiagnosis30TBox) NEQ "@@" AND trim(localhcpcDiagnosis30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost30TBox =	
					<cfif trim(localhcpcCost30TBox) NEQ "" AND trim(localhcpcCost30TBox) NEQ "@@" AND trim(localhcpcCost30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear30TBox =	
					<cfif trim(localhcpcLengthOfNeedYear30TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear30TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth30TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth30TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth30TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth30TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth30TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode31TBox =	
					<cfif trim(localhcpcCode31TBox) NEQ "" AND trim(localhcpcCode31TBox) NEQ "@@" AND trim(localhcpcCode31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty31TBox =	
					<cfif trim(localhcpcQty31TBox) NEQ "" AND trim(localhcpcQty31TBox) NEQ "@@" AND trim(localhcpcQty31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct31TBox =	
					<cfif trim(localhcpcProduct31TBox) NEQ "" AND trim(localhcpcProduct31TBox) NEQ "@@" AND trim(localhcpcProduct31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX31TBox =	
					<cfif trim(localhcpcDX31TBox) NEQ "" AND trim(localhcpcDX31TBox) NEQ "@@" AND trim(localhcpcDX31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis31TBox =	
					<cfif trim(localhcpcDiagnosis31TBox) NEQ "" AND trim(localhcpcDiagnosis31TBox) NEQ "@@" AND trim(localhcpcDiagnosis31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost31TBox =	
					<cfif trim(localhcpcCost31TBox) NEQ "" AND trim(localhcpcCost31TBox) NEQ "@@" AND trim(localhcpcCost31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear31TBox =	
					<cfif trim(localhcpcLengthOfNeedYear31TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear31TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth31TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth31TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth31TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth31TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth31TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode32TBox =	
					<cfif trim(localhcpcCode32TBox) NEQ "" AND trim(localhcpcCode32TBox) NEQ "@@" AND trim(localhcpcCode32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty32TBox =	
					<cfif trim(localhcpcQty32TBox) NEQ "" AND trim(localhcpcQty32TBox) NEQ "@@" AND trim(localhcpcQty32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct32TBox =	
					<cfif trim(localhcpcProduct32TBox) NEQ "" AND trim(localhcpcProduct32TBox) NEQ "@@" AND trim(localhcpcProduct32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX32TBox =	
					<cfif trim(localhcpcDX32TBox) NEQ "" AND trim(localhcpcDX32TBox) NEQ "@@" AND trim(localhcpcDX32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis32TBox =	
					<cfif trim(localhcpcDiagnosis32TBox) NEQ "" AND trim(localhcpcDiagnosis32TBox) NEQ "@@" AND trim(localhcpcDiagnosis32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost32TBox =	
					<cfif trim(localhcpcCost32TBox) NEQ "" AND trim(localhcpcCost32TBox) NEQ "@@" AND trim(localhcpcCost32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear32TBox =	
					<cfif trim(localhcpcLengthOfNeedYear32TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear32TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth32TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth32TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth32TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth32TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth32TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode33TBox =	
					<cfif trim(localhcpcCode33TBox) NEQ "" AND trim(localhcpcCode33TBox) NEQ "@@" AND trim(localhcpcCode33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty33TBox =	
					<cfif trim(localhcpcQty33TBox) NEQ "" AND trim(localhcpcQty33TBox) NEQ "@@" AND trim(localhcpcQty33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct33TBox =	
					<cfif trim(localhcpcProduct33TBox) NEQ "" AND trim(localhcpcProduct33TBox) NEQ "@@" AND trim(localhcpcProduct33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX33TBox =	
					<cfif trim(localhcpcDX33TBox) NEQ "" AND trim(localhcpcDX33TBox) NEQ "@@" AND trim(localhcpcDX33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis33TBox =	
					<cfif trim(localhcpcDiagnosis33TBox) NEQ "" AND trim(localhcpcDiagnosis33TBox) NEQ "@@" AND trim(localhcpcDiagnosis33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost33TBox =	
					<cfif trim(localhcpcCost33TBox) NEQ "" AND trim(localhcpcCost33TBox) NEQ "@@" AND trim(localhcpcCost33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear33TBox =	
					<cfif trim(localhcpcLengthOfNeedYear33TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear33TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth33TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth33TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth33TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth33TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth33TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode34TBox =	
					<cfif trim(localhcpcCode34TBox) NEQ "" AND trim(localhcpcCode34TBox) NEQ "@@" AND trim(localhcpcCode34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty34TBox =	
					<cfif trim(localhcpcQty34TBox) NEQ "" AND trim(localhcpcQty34TBox) NEQ "@@" AND trim(localhcpcQty34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct34TBox =	
					<cfif trim(localhcpcProduct34TBox) NEQ "" AND trim(localhcpcProduct34TBox) NEQ "@@" AND trim(localhcpcProduct34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX34TBox =	
					<cfif trim(localhcpcDX34TBox) NEQ "" AND trim(localhcpcDX34TBox) NEQ "@@" AND trim(localhcpcDX34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis34TBox =	
					<cfif trim(localhcpcDiagnosis34TBox) NEQ "" AND trim(localhcpcDiagnosis34TBox) NEQ "@@" AND trim(localhcpcDiagnosis34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost34TBox =	
					<cfif trim(localhcpcCost34TBox) NEQ "" AND trim(localhcpcCost34TBox) NEQ "@@" AND trim(localhcpcCost34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear34TBox =	
					<cfif trim(localhcpcLengthOfNeedYear34TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear34TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth34TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth34TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth34TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth34TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth34TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode35TBox =	
					<cfif trim(localhcpcCode35TBox) NEQ "" AND trim(localhcpcCode35TBox) NEQ "@@" AND trim(localhcpcCode35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty35TBox =	
					<cfif trim(localhcpcQty35TBox) NEQ "" AND trim(localhcpcQty35TBox) NEQ "@@" AND trim(localhcpcQty35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct35TBox =	
					<cfif trim(localhcpcProduct35TBox) NEQ "" AND trim(localhcpcProduct35TBox) NEQ "@@" AND trim(localhcpcProduct35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX35TBox =	
					<cfif trim(localhcpcDX35TBox) NEQ "" AND trim(localhcpcDX35TBox) NEQ "@@" AND trim(localhcpcDX35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis35TBox =	
					<cfif trim(localhcpcDiagnosis35TBox) NEQ "" AND trim(localhcpcDiagnosis35TBox) NEQ "@@" AND trim(localhcpcDiagnosis35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost35TBox =	
					<cfif trim(localhcpcCost35TBox) NEQ "" AND trim(localhcpcCost35TBox) NEQ "@@" AND trim(localhcpcCost35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear35TBox =	
					<cfif trim(localhcpcLengthOfNeedYear35TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear35TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth35TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth35TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth35TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth35TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth35TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode36TBox =	
					<cfif trim(localhcpcCode36TBox) NEQ "" AND trim(localhcpcCode36TBox) NEQ "@@" AND trim(localhcpcCode36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty36TBox =	
					<cfif trim(localhcpcQty36TBox) NEQ "" AND trim(localhcpcQty36TBox) NEQ "@@" AND trim(localhcpcQty36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct36TBox =	
					<cfif trim(localhcpcProduct36TBox) NEQ "" AND trim(localhcpcProduct36TBox) NEQ "@@" AND trim(localhcpcProduct36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX36TBox =	
					<cfif trim(localhcpcDX36TBox) NEQ "" AND trim(localhcpcDX36TBox) NEQ "@@" AND trim(localhcpcDX36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis36TBox =	
					<cfif trim(localhcpcDiagnosis36TBox) NEQ "" AND trim(localhcpcDiagnosis36TBox) NEQ "@@" AND trim(localhcpcDiagnosis36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost36TBox =	
					<cfif trim(localhcpcCost36TBox) NEQ "" AND trim(localhcpcCost36TBox) NEQ "@@" AND trim(localhcpcCost36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear36TBox =	
					<cfif trim(localhcpcLengthOfNeedYear36TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear36TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth36TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth36TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth36TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth36TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth36TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode37TBox =	
					<cfif trim(localhcpcCode37TBox) NEQ "" AND trim(localhcpcCode37TBox) NEQ "@@" AND trim(localhcpcCode37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty37TBox =	
					<cfif trim(localhcpcQty37TBox) NEQ "" AND trim(localhcpcQty37TBox) NEQ "@@" AND trim(localhcpcQty37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct37TBox =	
					<cfif trim(localhcpcProduct37TBox) NEQ "" AND trim(localhcpcProduct37TBox) NEQ "@@" AND trim(localhcpcProduct37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX37TBox =	
					<cfif trim(localhcpcDX37TBox) NEQ "" AND trim(localhcpcDX37TBox) NEQ "@@" AND trim(localhcpcDX37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis37TBox =	
					<cfif trim(localhcpcDiagnosis37TBox) NEQ "" AND trim(localhcpcDiagnosis37TBox) NEQ "@@" AND trim(localhcpcDiagnosis37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost37TBox =	
					<cfif trim(localhcpcCost37TBox) NEQ "" AND trim(localhcpcCost37TBox) NEQ "@@" AND trim(localhcpcCost37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear37TBox =	
					<cfif trim(localhcpcLengthOfNeedYear37TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear37TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth37TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth37TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth37TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth37TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth37TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode38TBox =	
					<cfif trim(localhcpcCode38TBox) NEQ "" AND trim(localhcpcCode38TBox) NEQ "@@" AND trim(localhcpcCode38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty38TBox =	
					<cfif trim(localhcpcQty38TBox) NEQ "" AND trim(localhcpcQty38TBox) NEQ "@@" AND trim(localhcpcQty38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct38TBox =	
					<cfif trim(localhcpcProduct38TBox) NEQ "" AND trim(localhcpcProduct38TBox) NEQ "@@" AND trim(localhcpcProduct38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX38TBox =	
					<cfif trim(localhcpcDX38TBox) NEQ "" AND trim(localhcpcDX38TBox) NEQ "@@" AND trim(localhcpcDX38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis38TBox =	
					<cfif trim(localhcpcDiagnosis38TBox) NEQ "" AND trim(localhcpcDiagnosis38TBox) NEQ "@@" AND trim(localhcpcDiagnosis38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost38TBox =	
					<cfif trim(localhcpcCost38TBox) NEQ "" AND trim(localhcpcCost38TBox) NEQ "@@" AND trim(localhcpcCost38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear38TBox =	
					<cfif trim(localhcpcLengthOfNeedYear38TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear38TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth38TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth38TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth38TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth38TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth38TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode39TBox =	
					<cfif trim(localhcpcCode39TBox) NEQ "" AND trim(localhcpcCode39TBox) NEQ "@@" AND trim(localhcpcCode39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty39TBox =	
					<cfif trim(localhcpcQty39TBox) NEQ "" AND trim(localhcpcQty39TBox) NEQ "@@" AND trim(localhcpcQty39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct39TBox =	
					<cfif trim(localhcpcProduct39TBox) NEQ "" AND trim(localhcpcProduct39TBox) NEQ "@@" AND trim(localhcpcProduct39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX39TBox =	
					<cfif trim(localhcpcDX39TBox) NEQ "" AND trim(localhcpcDX39TBox) NEQ "@@" AND trim(localhcpcDX39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis39TBox =	
					<cfif trim(localhcpcDiagnosis39TBox) NEQ "" AND trim(localhcpcDiagnosis39TBox) NEQ "@@" AND trim(localhcpcDiagnosis39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost39TBox =	
					<cfif trim(localhcpcCost39TBox) NEQ "" AND trim(localhcpcCost39TBox) NEQ "@@" AND trim(localhcpcCost39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear39TBox =	
					<cfif trim(localhcpcLengthOfNeedYear39TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear39TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth39TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth39TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth39TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth39TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth39TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCode40TBox =	
					<cfif trim(localhcpcCode40TBox) NEQ "" AND trim(localhcpcCode40TBox) NEQ "@@" AND trim(localhcpcCode40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCode40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcQty40TBox =	
					<cfif trim(localhcpcQty40TBox) NEQ "" AND trim(localhcpcQty40TBox) NEQ "@@" AND trim(localhcpcQty40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcQty40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcProduct40TBox =	
					<cfif trim(localhcpcProduct40TBox) NEQ "" AND trim(localhcpcProduct40TBox) NEQ "@@" AND trim(localhcpcProduct40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcProduct40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDX40TBox =	
					<cfif trim(localhcpcDX40TBox) NEQ "" AND trim(localhcpcDX40TBox) NEQ "@@" AND trim(localhcpcDX40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDX40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcDiagnosis40TBox =	
					<cfif trim(localhcpcDiagnosis40TBox) NEQ "" AND trim(localhcpcDiagnosis40TBox) NEQ "@@" AND trim(localhcpcDiagnosis40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcDiagnosis40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcCost40TBox =	
					<cfif trim(localhcpcCost40TBox) NEQ "" AND trim(localhcpcCost40TBox) NEQ "@@" AND trim(localhcpcCost40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcCost40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedYear40TBox =	
					<cfif trim(localhcpcLengthOfNeedYear40TBox) NEQ "" AND trim(localhcpcLengthOfNeedYear40TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedYear40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedYear40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hcpcLengthOfNeedMonth40TBox =	
					<cfif trim(localhcpcLengthOfNeedMonth40TBox) NEQ "" AND trim(localhcpcLengthOfNeedMonth40TBox) NEQ "@@" AND trim(localhcpcLengthOfNeedMonth40TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhcpcLengthOfNeedMonth40TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE QuoteHCPCID = <cfqueryparam value="#trim(arguments.bean.getQuoteHCPCID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="QuoteHCPCBean" />
		<cfset var qDeleteQuoteHCPC = "">

		<cfquery name="qDeleteQuoteHCPC" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM quotehcpc
			WHERE QuoteHCPCID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getQuoteHCPCID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuoteHCPC" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="QuoteHCPCID" required="yes" type="numeric" />		
		<cfset var qGetQuoteHCPC = "" />		
	
		<cfquery name="qGetQuoteHCPC" datasource="#trim(arguments.ds)#">
	  		SELECT QuoteHCPCID,QuoteID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode,DateCreated,DateModified
			FROM quotehcpc  
			WHERE QuoteHCPCID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.QuoteHCPCID)#" /> 
		</cfquery>
		
		<cfreturn qGetQuoteHCPC>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





