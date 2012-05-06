 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeHCPCBean" />
		
		<cfset var qCreateIntakeHCPC = "" />		
		
		<cfset var localIntakeID = arguments.bean.getIntakeID() />
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
			
			<cfquery name="qCreateIntakeHCPC" datasource="#trim(arguments.ds)#">
				INSERT INTO IntakeHCPC (IntakeID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localIntakeID)#" cfsqltype="CF_SQL_INTEGER" />,	
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
				SELECT LAST_INSERT_ID() AS IntakeHCPCID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setIntakeHCPCID(qCreateIntakeHCPC.IntakeHCPCID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IntakeHCPCBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="IntakeHCPCID" required="yes" type="numeric" />		
		<cfset var qGetIntakeHCPC = "" />		
		
		<cfset qGetIntakeHCPC = getIntakeHCPC(trim(arguments.ds), trim(IntakeHCPCID)) />
				
		<cfif qGetIntakeHCPC.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objIntakeHCPC = createObject("component", "IntakeHCPCBean").init(arguments.ds);
			objIntakeHCPC.setIntakeHCPCID(qGetIntakeHCPC.IntakeHCPCID);
			objIntakeHCPC.setIntakeID(qGetIntakeHCPC.IntakeID);
			objIntakeHCPC.sethcpcCode1TBox(qGetIntakeHCPC.hcpcCode1TBox);
			objIntakeHCPC.sethcpcQty1TBox(qGetIntakeHCPC.hcpcQty1TBox);
			objIntakeHCPC.sethcpcProduct1TBox(qGetIntakeHCPC.hcpcProduct1TBox);
			objIntakeHCPC.sethcpcDX1TBox(qGetIntakeHCPC.hcpcDX1TBox);
			objIntakeHCPC.sethcpcDiagnosis1TBox(qGetIntakeHCPC.hcpcDiagnosis1TBox);
			objIntakeHCPC.sethcpcCost1TBox(qGetIntakeHCPC.hcpcCost1TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear1TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear1TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth1TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth1TBox);
			objIntakeHCPC.sethcpcCode2TBox(qGetIntakeHCPC.hcpcCode2TBox);
			objIntakeHCPC.sethcpcQty2TBox(qGetIntakeHCPC.hcpcQty2TBox);
			objIntakeHCPC.sethcpcProduct2TBox(qGetIntakeHCPC.hcpcProduct2TBox);
			objIntakeHCPC.sethcpcDX2TBox(qGetIntakeHCPC.hcpcDX2TBox);
			objIntakeHCPC.sethcpcDiagnosis2TBox(qGetIntakeHCPC.hcpcDiagnosis2TBox);
			objIntakeHCPC.sethcpcCost2TBox(qGetIntakeHCPC.hcpcCost2TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear2TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear2TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth2TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth2TBox);
			objIntakeHCPC.sethcpcCode3TBox(qGetIntakeHCPC.hcpcCode3TBox);
			objIntakeHCPC.sethcpcQty3TBox(qGetIntakeHCPC.hcpcQty3TBox);
			objIntakeHCPC.sethcpcProduct3TBox(qGetIntakeHCPC.hcpcProduct3TBox);
			objIntakeHCPC.sethcpcDX3TBox(qGetIntakeHCPC.hcpcDX3TBox);
			objIntakeHCPC.sethcpcDiagnosis3TBox(qGetIntakeHCPC.hcpcDiagnosis3TBox);
			objIntakeHCPC.sethcpcCost3TBox(qGetIntakeHCPC.hcpcCost3TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear3TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear3TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth3TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth3TBox);
			objIntakeHCPC.sethcpcCode4TBox(qGetIntakeHCPC.hcpcCode4TBox);
			objIntakeHCPC.sethcpcQty4TBox(qGetIntakeHCPC.hcpcQty4TBox);
			objIntakeHCPC.sethcpcProduct4TBox(qGetIntakeHCPC.hcpcProduct4TBox);
			objIntakeHCPC.sethcpcDX4TBox(qGetIntakeHCPC.hcpcDX4TBox);
			objIntakeHCPC.sethcpcDiagnosis4TBox(qGetIntakeHCPC.hcpcDiagnosis4TBox);
			objIntakeHCPC.sethcpcCost4TBox(qGetIntakeHCPC.hcpcCost4TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear4TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear4TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth4TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth4TBox);
			objIntakeHCPC.sethcpcCode5TBox(qGetIntakeHCPC.hcpcCode5TBox);
			objIntakeHCPC.sethcpcQty5TBox(qGetIntakeHCPC.hcpcQty5TBox);
			objIntakeHCPC.sethcpcProduct5TBox(qGetIntakeHCPC.hcpcProduct5TBox);
			objIntakeHCPC.sethcpcDX5TBox(qGetIntakeHCPC.hcpcDX5TBox);
			objIntakeHCPC.sethcpcDiagnosis5TBox(qGetIntakeHCPC.hcpcDiagnosis5TBox);
			objIntakeHCPC.sethcpcCost5TBox(qGetIntakeHCPC.hcpcCost5TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear5TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear5TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth5TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth5TBox);
			objIntakeHCPC.sethcpcCode6TBox(qGetIntakeHCPC.hcpcCode6TBox);
			objIntakeHCPC.sethcpcQty6TBox(qGetIntakeHCPC.hcpcQty6TBox);
			objIntakeHCPC.sethcpcProduct6TBox(qGetIntakeHCPC.hcpcProduct6TBox);
			objIntakeHCPC.sethcpcDX6TBox(qGetIntakeHCPC.hcpcDX6TBox);
			objIntakeHCPC.sethcpcDiagnosis6TBox(qGetIntakeHCPC.hcpcDiagnosis6TBox);
			objIntakeHCPC.sethcpcCost6TBox(qGetIntakeHCPC.hcpcCost6TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear6TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear6TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth6TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth6TBox);
			objIntakeHCPC.sethcpcCode7TBox(qGetIntakeHCPC.hcpcCode7TBox);
			objIntakeHCPC.sethcpcQty7TBox(qGetIntakeHCPC.hcpcQty7TBox);
			objIntakeHCPC.sethcpcProduct7TBox(qGetIntakeHCPC.hcpcProduct7TBox);
			objIntakeHCPC.sethcpcDX7TBox(qGetIntakeHCPC.hcpcDX7TBox);
			objIntakeHCPC.sethcpcDiagnosis7TBox(qGetIntakeHCPC.hcpcDiagnosis7TBox);
			objIntakeHCPC.sethcpcCost7TBox(qGetIntakeHCPC.hcpcCost7TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear7TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear7TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth7TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth7TBox);
			objIntakeHCPC.sethcpcCode8TBox(qGetIntakeHCPC.hcpcCode8TBox);
			objIntakeHCPC.sethcpcQty8TBox(qGetIntakeHCPC.hcpcQty8TBox);
			objIntakeHCPC.sethcpcProduct8TBox(qGetIntakeHCPC.hcpcProduct8TBox);
			objIntakeHCPC.sethcpcDX8TBox(qGetIntakeHCPC.hcpcDX8TBox);
			objIntakeHCPC.sethcpcDiagnosis8TBox(qGetIntakeHCPC.hcpcDiagnosis8TBox);
			objIntakeHCPC.sethcpcCost8TBox(qGetIntakeHCPC.hcpcCost8TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear8TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear8TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth8TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth8TBox);
			objIntakeHCPC.sethcpcCode9TBox(qGetIntakeHCPC.hcpcCode9TBox);
			objIntakeHCPC.sethcpcQty9TBox(qGetIntakeHCPC.hcpcQty9TBox);
			objIntakeHCPC.sethcpcProduct9TBox(qGetIntakeHCPC.hcpcProduct9TBox);
			objIntakeHCPC.sethcpcDX9TBox(qGetIntakeHCPC.hcpcDX9TBox);
			objIntakeHCPC.sethcpcDiagnosis9TBox(qGetIntakeHCPC.hcpcDiagnosis9TBox);
			objIntakeHCPC.sethcpcCost9TBox(qGetIntakeHCPC.hcpcCost9TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear9TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear9TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth9TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth9TBox);
			objIntakeHCPC.sethcpcCode10TBox(qGetIntakeHCPC.hcpcCode10TBox);
			objIntakeHCPC.sethcpcQty10TBox(qGetIntakeHCPC.hcpcQty10TBox);
			objIntakeHCPC.sethcpcProduct10TBox(qGetIntakeHCPC.hcpcProduct10TBox);
			objIntakeHCPC.sethcpcDX10TBox(qGetIntakeHCPC.hcpcDX10TBox);
			objIntakeHCPC.sethcpcDiagnosis10TBox(qGetIntakeHCPC.hcpcDiagnosis10TBox);
			objIntakeHCPC.sethcpcCost10TBox(qGetIntakeHCPC.hcpcCost10TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear10TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear10TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth10TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth10TBox);
			objIntakeHCPC.sethcpcCode11TBox(qGetIntakeHCPC.hcpcCode11TBox);
			objIntakeHCPC.sethcpcQty11TBox(qGetIntakeHCPC.hcpcQty11TBox);
			objIntakeHCPC.sethcpcProduct11TBox(qGetIntakeHCPC.hcpcProduct11TBox);
			objIntakeHCPC.sethcpcDX11TBox(qGetIntakeHCPC.hcpcDX11TBox);
			objIntakeHCPC.sethcpcDiagnosis11TBox(qGetIntakeHCPC.hcpcDiagnosis11TBox);
			objIntakeHCPC.sethcpcCost11TBox(qGetIntakeHCPC.hcpcCost11TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear11TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear11TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth11TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth11TBox);
			objIntakeHCPC.sethcpcCode12TBox(qGetIntakeHCPC.hcpcCode12TBox);
			objIntakeHCPC.sethcpcQty12TBox(qGetIntakeHCPC.hcpcQty12TBox);
			objIntakeHCPC.sethcpcProduct12TBox(qGetIntakeHCPC.hcpcProduct12TBox);
			objIntakeHCPC.sethcpcDX12TBox(qGetIntakeHCPC.hcpcDX12TBox);
			objIntakeHCPC.sethcpcDiagnosis12TBox(qGetIntakeHCPC.hcpcDiagnosis12TBox);
			objIntakeHCPC.sethcpcCost12TBox(qGetIntakeHCPC.hcpcCost12TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear12TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear12TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth12TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth12TBox);
			objIntakeHCPC.sethcpcCode13TBox(qGetIntakeHCPC.hcpcCode13TBox);
			objIntakeHCPC.sethcpcQty13TBox(qGetIntakeHCPC.hcpcQty13TBox);
			objIntakeHCPC.sethcpcProduct13TBox(qGetIntakeHCPC.hcpcProduct13TBox);
			objIntakeHCPC.sethcpcDX13TBox(qGetIntakeHCPC.hcpcDX13TBox);
			objIntakeHCPC.sethcpcDiagnosis13TBox(qGetIntakeHCPC.hcpcDiagnosis13TBox);
			objIntakeHCPC.sethcpcCost13TBox(qGetIntakeHCPC.hcpcCost13TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear13TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear13TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth13TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth13TBox);
			objIntakeHCPC.sethcpcCode14TBox(qGetIntakeHCPC.hcpcCode14TBox);
			objIntakeHCPC.sethcpcQty14TBox(qGetIntakeHCPC.hcpcQty14TBox);
			objIntakeHCPC.sethcpcProduct14TBox(qGetIntakeHCPC.hcpcProduct14TBox);
			objIntakeHCPC.sethcpcDX14TBox(qGetIntakeHCPC.hcpcDX14TBox);
			objIntakeHCPC.sethcpcDiagnosis14TBox(qGetIntakeHCPC.hcpcDiagnosis14TBox);
			objIntakeHCPC.sethcpcCost14TBox(qGetIntakeHCPC.hcpcCost14TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear14TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear14TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth14TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth14TBox);
			objIntakeHCPC.sethcpcCode15TBox(qGetIntakeHCPC.hcpcCode15TBox);
			objIntakeHCPC.sethcpcQty15TBox(qGetIntakeHCPC.hcpcQty15TBox);
			objIntakeHCPC.sethcpcProduct15TBox(qGetIntakeHCPC.hcpcProduct15TBox);
			objIntakeHCPC.sethcpcDX15TBox(qGetIntakeHCPC.hcpcDX15TBox);
			objIntakeHCPC.sethcpcDiagnosis15TBox(qGetIntakeHCPC.hcpcDiagnosis15TBox);
			objIntakeHCPC.sethcpcCost15TBox(qGetIntakeHCPC.hcpcCost15TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear15TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear15TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth15TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth15TBox);
			objIntakeHCPC.sethcpcCode16TBox(qGetIntakeHCPC.hcpcCode16TBox);
			objIntakeHCPC.sethcpcQty16TBox(qGetIntakeHCPC.hcpcQty16TBox);
			objIntakeHCPC.sethcpcProduct16TBox(qGetIntakeHCPC.hcpcProduct16TBox);
			objIntakeHCPC.sethcpcDX16TBox(qGetIntakeHCPC.hcpcDX16TBox);
			objIntakeHCPC.sethcpcDiagnosis16TBox(qGetIntakeHCPC.hcpcDiagnosis16TBox);
			objIntakeHCPC.sethcpcCost16TBox(qGetIntakeHCPC.hcpcCost16TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear16TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear16TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth16TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth16TBox);
			objIntakeHCPC.sethcpcCode17TBox(qGetIntakeHCPC.hcpcCode17TBox);
			objIntakeHCPC.sethcpcQty17TBox(qGetIntakeHCPC.hcpcQty17TBox);
			objIntakeHCPC.sethcpcProduct17TBox(qGetIntakeHCPC.hcpcProduct17TBox);
			objIntakeHCPC.sethcpcDX17TBox(qGetIntakeHCPC.hcpcDX17TBox);
			objIntakeHCPC.sethcpcDiagnosis17TBox(qGetIntakeHCPC.hcpcDiagnosis17TBox);
			objIntakeHCPC.sethcpcCost17TBox(qGetIntakeHCPC.hcpcCost17TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear17TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear17TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth17TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth17TBox);
			objIntakeHCPC.sethcpcCode18TBox(qGetIntakeHCPC.hcpcCode18TBox);
			objIntakeHCPC.sethcpcQty18TBox(qGetIntakeHCPC.hcpcQty18TBox);
			objIntakeHCPC.sethcpcProduct18TBox(qGetIntakeHCPC.hcpcProduct18TBox);
			objIntakeHCPC.sethcpcDX18TBox(qGetIntakeHCPC.hcpcDX18TBox);
			objIntakeHCPC.sethcpcDiagnosis18TBox(qGetIntakeHCPC.hcpcDiagnosis18TBox);
			objIntakeHCPC.sethcpcCost18TBox(qGetIntakeHCPC.hcpcCost18TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear18TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear18TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth18TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth18TBox);
			objIntakeHCPC.sethcpcCode19TBox(qGetIntakeHCPC.hcpcCode19TBox);
			objIntakeHCPC.sethcpcQty19TBox(qGetIntakeHCPC.hcpcQty19TBox);
			objIntakeHCPC.sethcpcProduct19TBox(qGetIntakeHCPC.hcpcProduct19TBox);
			objIntakeHCPC.sethcpcDX19TBox(qGetIntakeHCPC.hcpcDX19TBox);
			objIntakeHCPC.sethcpcDiagnosis19TBox(qGetIntakeHCPC.hcpcDiagnosis19TBox);
			objIntakeHCPC.sethcpcCost19TBox(qGetIntakeHCPC.hcpcCost19TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear19TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear19TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth19TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth19TBox);
			objIntakeHCPC.sethcpcCode20TBox(qGetIntakeHCPC.hcpcCode20TBox);
			objIntakeHCPC.sethcpcQty20TBox(qGetIntakeHCPC.hcpcQty20TBox);
			objIntakeHCPC.sethcpcProduct20TBox(qGetIntakeHCPC.hcpcProduct20TBox);
			objIntakeHCPC.sethcpcDX20TBox(qGetIntakeHCPC.hcpcDX20TBox);
			objIntakeHCPC.sethcpcDiagnosis20TBox(qGetIntakeHCPC.hcpcDiagnosis20TBox);
			objIntakeHCPC.sethcpcCost20TBox(qGetIntakeHCPC.hcpcCost20TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear20TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear20TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth20TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth20TBox);
			objIntakeHCPC.sethcpcCode21TBox(qGetIntakeHCPC.hcpcCode21TBox);
			objIntakeHCPC.sethcpcQty21TBox(qGetIntakeHCPC.hcpcQty21TBox);
			objIntakeHCPC.sethcpcProduct21TBox(qGetIntakeHCPC.hcpcProduct21TBox);
			objIntakeHCPC.sethcpcDX21TBox(qGetIntakeHCPC.hcpcDX21TBox);
			objIntakeHCPC.sethcpcDiagnosis21TBox(qGetIntakeHCPC.hcpcDiagnosis21TBox);
			objIntakeHCPC.sethcpcCost21TBox(qGetIntakeHCPC.hcpcCost21TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear21TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear21TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth21TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth21TBox);
			objIntakeHCPC.sethcpcCode22TBox(qGetIntakeHCPC.hcpcCode22TBox);
			objIntakeHCPC.sethcpcQty22TBox(qGetIntakeHCPC.hcpcQty22TBox);
			objIntakeHCPC.sethcpcProduct22TBox(qGetIntakeHCPC.hcpcProduct22TBox);
			objIntakeHCPC.sethcpcDX22TBox(qGetIntakeHCPC.hcpcDX22TBox);
			objIntakeHCPC.sethcpcDiagnosis22TBox(qGetIntakeHCPC.hcpcDiagnosis22TBox);
			objIntakeHCPC.sethcpcCost22TBox(qGetIntakeHCPC.hcpcCost22TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear22TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear22TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth22TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth22TBox);
			objIntakeHCPC.sethcpcCode23TBox(qGetIntakeHCPC.hcpcCode23TBox);
			objIntakeHCPC.sethcpcQty23TBox(qGetIntakeHCPC.hcpcQty23TBox);
			objIntakeHCPC.sethcpcProduct23TBox(qGetIntakeHCPC.hcpcProduct23TBox);
			objIntakeHCPC.sethcpcDX23TBox(qGetIntakeHCPC.hcpcDX23TBox);
			objIntakeHCPC.sethcpcDiagnosis23TBox(qGetIntakeHCPC.hcpcDiagnosis23TBox);
			objIntakeHCPC.sethcpcCost23TBox(qGetIntakeHCPC.hcpcCost23TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear23TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear23TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth23TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth23TBox);
			objIntakeHCPC.sethcpcCode24TBox(qGetIntakeHCPC.hcpcCode24TBox);
			objIntakeHCPC.sethcpcQty24TBox(qGetIntakeHCPC.hcpcQty24TBox);
			objIntakeHCPC.sethcpcProduct24TBox(qGetIntakeHCPC.hcpcProduct24TBox);
			objIntakeHCPC.sethcpcDX24TBox(qGetIntakeHCPC.hcpcDX24TBox);
			objIntakeHCPC.sethcpcDiagnosis24TBox(qGetIntakeHCPC.hcpcDiagnosis24TBox);
			objIntakeHCPC.sethcpcCost24TBox(qGetIntakeHCPC.hcpcCost24TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear24TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear24TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth24TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth24TBox);
			objIntakeHCPC.sethcpcCode25TBox(qGetIntakeHCPC.hcpcCode25TBox);
			objIntakeHCPC.sethcpcQty25TBox(qGetIntakeHCPC.hcpcQty25TBox);
			objIntakeHCPC.sethcpcProduct25TBox(qGetIntakeHCPC.hcpcProduct25TBox);
			objIntakeHCPC.sethcpcDX25TBox(qGetIntakeHCPC.hcpcDX25TBox);
			objIntakeHCPC.sethcpcDiagnosis25TBox(qGetIntakeHCPC.hcpcDiagnosis25TBox);
			objIntakeHCPC.sethcpcCost25TBox(qGetIntakeHCPC.hcpcCost25TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear25TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear25TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth25TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth25TBox);
			objIntakeHCPC.sethcpcCode26TBox(qGetIntakeHCPC.hcpcCode26TBox);
			objIntakeHCPC.sethcpcQty26TBox(qGetIntakeHCPC.hcpcQty26TBox);
			objIntakeHCPC.sethcpcProduct26TBox(qGetIntakeHCPC.hcpcProduct26TBox);
			objIntakeHCPC.sethcpcDX26TBox(qGetIntakeHCPC.hcpcDX26TBox);
			objIntakeHCPC.sethcpcDiagnosis26TBox(qGetIntakeHCPC.hcpcDiagnosis26TBox);
			objIntakeHCPC.sethcpcCost26TBox(qGetIntakeHCPC.hcpcCost26TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear26TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear26TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth26TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth26TBox);
			objIntakeHCPC.sethcpcCode27TBox(qGetIntakeHCPC.hcpcCode27TBox);
			objIntakeHCPC.sethcpcQty27TBox(qGetIntakeHCPC.hcpcQty27TBox);
			objIntakeHCPC.sethcpcProduct27TBox(qGetIntakeHCPC.hcpcProduct27TBox);
			objIntakeHCPC.sethcpcDX27TBox(qGetIntakeHCPC.hcpcDX27TBox);
			objIntakeHCPC.sethcpcDiagnosis27TBox(qGetIntakeHCPC.hcpcDiagnosis27TBox);
			objIntakeHCPC.sethcpcCost27TBox(qGetIntakeHCPC.hcpcCost27TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear27TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear27TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth27TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth27TBox);
			objIntakeHCPC.sethcpcCode28TBox(qGetIntakeHCPC.hcpcCode28TBox);
			objIntakeHCPC.sethcpcQty28TBox(qGetIntakeHCPC.hcpcQty28TBox);
			objIntakeHCPC.sethcpcProduct28TBox(qGetIntakeHCPC.hcpcProduct28TBox);
			objIntakeHCPC.sethcpcDX28TBox(qGetIntakeHCPC.hcpcDX28TBox);
			objIntakeHCPC.sethcpcDiagnosis28TBox(qGetIntakeHCPC.hcpcDiagnosis28TBox);
			objIntakeHCPC.sethcpcCost28TBox(qGetIntakeHCPC.hcpcCost28TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear28TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear28TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth28TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth28TBox);
			objIntakeHCPC.sethcpcCode29TBox(qGetIntakeHCPC.hcpcCode29TBox);
			objIntakeHCPC.sethcpcQty29TBox(qGetIntakeHCPC.hcpcQty29TBox);
			objIntakeHCPC.sethcpcProduct29TBox(qGetIntakeHCPC.hcpcProduct29TBox);
			objIntakeHCPC.sethcpcDX29TBox(qGetIntakeHCPC.hcpcDX29TBox);
			objIntakeHCPC.sethcpcDiagnosis29TBox(qGetIntakeHCPC.hcpcDiagnosis29TBox);
			objIntakeHCPC.sethcpcCost29TBox(qGetIntakeHCPC.hcpcCost29TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear29TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear29TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth29TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth29TBox);
			objIntakeHCPC.sethcpcCode30TBox(qGetIntakeHCPC.hcpcCode30TBox);
			objIntakeHCPC.sethcpcQty30TBox(qGetIntakeHCPC.hcpcQty30TBox);
			objIntakeHCPC.sethcpcProduct30TBox(qGetIntakeHCPC.hcpcProduct30TBox);
			objIntakeHCPC.sethcpcDX30TBox(qGetIntakeHCPC.hcpcDX30TBox);
			objIntakeHCPC.sethcpcDiagnosis30TBox(qGetIntakeHCPC.hcpcDiagnosis30TBox);
			objIntakeHCPC.sethcpcCost30TBox(qGetIntakeHCPC.hcpcCost30TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear30TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear30TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth30TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth30TBox);
			objIntakeHCPC.sethcpcCode31TBox(qGetIntakeHCPC.hcpcCode31TBox);
			objIntakeHCPC.sethcpcQty31TBox(qGetIntakeHCPC.hcpcQty31TBox);
			objIntakeHCPC.sethcpcProduct31TBox(qGetIntakeHCPC.hcpcProduct31TBox);
			objIntakeHCPC.sethcpcDX31TBox(qGetIntakeHCPC.hcpcDX31TBox);
			objIntakeHCPC.sethcpcDiagnosis31TBox(qGetIntakeHCPC.hcpcDiagnosis31TBox);
			objIntakeHCPC.sethcpcCost31TBox(qGetIntakeHCPC.hcpcCost31TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear31TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear31TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth31TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth31TBox);
			objIntakeHCPC.sethcpcCode32TBox(qGetIntakeHCPC.hcpcCode32TBox);
			objIntakeHCPC.sethcpcQty32TBox(qGetIntakeHCPC.hcpcQty32TBox);
			objIntakeHCPC.sethcpcProduct32TBox(qGetIntakeHCPC.hcpcProduct32TBox);
			objIntakeHCPC.sethcpcDX32TBox(qGetIntakeHCPC.hcpcDX32TBox);
			objIntakeHCPC.sethcpcDiagnosis32TBox(qGetIntakeHCPC.hcpcDiagnosis32TBox);
			objIntakeHCPC.sethcpcCost32TBox(qGetIntakeHCPC.hcpcCost32TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear32TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear32TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth32TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth32TBox);
			objIntakeHCPC.sethcpcCode33TBox(qGetIntakeHCPC.hcpcCode33TBox);
			objIntakeHCPC.sethcpcQty33TBox(qGetIntakeHCPC.hcpcQty33TBox);
			objIntakeHCPC.sethcpcProduct33TBox(qGetIntakeHCPC.hcpcProduct33TBox);
			objIntakeHCPC.sethcpcDX33TBox(qGetIntakeHCPC.hcpcDX33TBox);
			objIntakeHCPC.sethcpcDiagnosis33TBox(qGetIntakeHCPC.hcpcDiagnosis33TBox);
			objIntakeHCPC.sethcpcCost33TBox(qGetIntakeHCPC.hcpcCost33TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear33TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear33TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth33TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth33TBox);
			objIntakeHCPC.sethcpcCode34TBox(qGetIntakeHCPC.hcpcCode34TBox);
			objIntakeHCPC.sethcpcQty34TBox(qGetIntakeHCPC.hcpcQty34TBox);
			objIntakeHCPC.sethcpcProduct34TBox(qGetIntakeHCPC.hcpcProduct34TBox);
			objIntakeHCPC.sethcpcDX34TBox(qGetIntakeHCPC.hcpcDX34TBox);
			objIntakeHCPC.sethcpcDiagnosis34TBox(qGetIntakeHCPC.hcpcDiagnosis34TBox);
			objIntakeHCPC.sethcpcCost34TBox(qGetIntakeHCPC.hcpcCost34TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear34TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear34TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth34TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth34TBox);
			objIntakeHCPC.sethcpcCode35TBox(qGetIntakeHCPC.hcpcCode35TBox);
			objIntakeHCPC.sethcpcQty35TBox(qGetIntakeHCPC.hcpcQty35TBox);
			objIntakeHCPC.sethcpcProduct35TBox(qGetIntakeHCPC.hcpcProduct35TBox);
			objIntakeHCPC.sethcpcDX35TBox(qGetIntakeHCPC.hcpcDX35TBox);
			objIntakeHCPC.sethcpcDiagnosis35TBox(qGetIntakeHCPC.hcpcDiagnosis35TBox);
			objIntakeHCPC.sethcpcCost35TBox(qGetIntakeHCPC.hcpcCost35TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear35TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear35TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth35TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth35TBox);
			objIntakeHCPC.sethcpcCode36TBox(qGetIntakeHCPC.hcpcCode36TBox);
			objIntakeHCPC.sethcpcQty36TBox(qGetIntakeHCPC.hcpcQty36TBox);
			objIntakeHCPC.sethcpcProduct36TBox(qGetIntakeHCPC.hcpcProduct36TBox);
			objIntakeHCPC.sethcpcDX36TBox(qGetIntakeHCPC.hcpcDX36TBox);
			objIntakeHCPC.sethcpcDiagnosis36TBox(qGetIntakeHCPC.hcpcDiagnosis36TBox);
			objIntakeHCPC.sethcpcCost36TBox(qGetIntakeHCPC.hcpcCost36TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear36TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear36TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth36TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth36TBox);
			objIntakeHCPC.sethcpcCode37TBox(qGetIntakeHCPC.hcpcCode37TBox);
			objIntakeHCPC.sethcpcQty37TBox(qGetIntakeHCPC.hcpcQty37TBox);
			objIntakeHCPC.sethcpcProduct37TBox(qGetIntakeHCPC.hcpcProduct37TBox);
			objIntakeHCPC.sethcpcDX37TBox(qGetIntakeHCPC.hcpcDX37TBox);
			objIntakeHCPC.sethcpcDiagnosis37TBox(qGetIntakeHCPC.hcpcDiagnosis37TBox);
			objIntakeHCPC.sethcpcCost37TBox(qGetIntakeHCPC.hcpcCost37TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear37TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear37TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth37TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth37TBox);
			objIntakeHCPC.sethcpcCode38TBox(qGetIntakeHCPC.hcpcCode38TBox);
			objIntakeHCPC.sethcpcQty38TBox(qGetIntakeHCPC.hcpcQty38TBox);
			objIntakeHCPC.sethcpcProduct38TBox(qGetIntakeHCPC.hcpcProduct38TBox);
			objIntakeHCPC.sethcpcDX38TBox(qGetIntakeHCPC.hcpcDX38TBox);
			objIntakeHCPC.sethcpcDiagnosis38TBox(qGetIntakeHCPC.hcpcDiagnosis38TBox);
			objIntakeHCPC.sethcpcCost38TBox(qGetIntakeHCPC.hcpcCost38TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear38TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear38TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth38TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth38TBox);
			objIntakeHCPC.sethcpcCode39TBox(qGetIntakeHCPC.hcpcCode39TBox);
			objIntakeHCPC.sethcpcQty39TBox(qGetIntakeHCPC.hcpcQty39TBox);
			objIntakeHCPC.sethcpcProduct39TBox(qGetIntakeHCPC.hcpcProduct39TBox);
			objIntakeHCPC.sethcpcDX39TBox(qGetIntakeHCPC.hcpcDX39TBox);
			objIntakeHCPC.sethcpcDiagnosis39TBox(qGetIntakeHCPC.hcpcDiagnosis39TBox);
			objIntakeHCPC.sethcpcCost39TBox(qGetIntakeHCPC.hcpcCost39TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear39TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear39TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth39TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth39TBox);
			objIntakeHCPC.sethcpcCode40TBox(qGetIntakeHCPC.hcpcCode40TBox);
			objIntakeHCPC.sethcpcQty40TBox(qGetIntakeHCPC.hcpcQty40TBox);
			objIntakeHCPC.sethcpcProduct40TBox(qGetIntakeHCPC.hcpcProduct40TBox);
			objIntakeHCPC.sethcpcDX40TBox(qGetIntakeHCPC.hcpcDX40TBox);
			objIntakeHCPC.sethcpcDiagnosis40TBox(qGetIntakeHCPC.hcpcDiagnosis40TBox);
			objIntakeHCPC.sethcpcCost40TBox(qGetIntakeHCPC.hcpcCost40TBox);
			objIntakeHCPC.sethcpcLengthOfNeedYear40TBox(qGetIntakeHCPC.hcpcLengthOfNeedYear40TBox);
			objIntakeHCPC.sethcpcLengthOfNeedMonth40TBox(qGetIntakeHCPC.hcpcLengthOfNeedMonth40TBox);
			objIntakeHCPC.setActive(qGetIntakeHCPC.Active);
			objIntakeHCPC.setInactiveCode(qGetIntakeHCPC.InactiveCode);
			objIntakeHCPC.setDateCreated(qGetIntakeHCPC.DateCreated);
			objIntakeHCPC.setDateModified(qGetIntakeHCPC.DateModified);				
			return objIntakeHCPC;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeHCPCBean" />
		<cfset var qUpdateIntakeHCPC = "" />
		<cfset var localIntakeID = arguments.bean.getIntakeID() />
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
				
			<cfquery name="qUpdateIntakeHCPC" datasource="#trim(arguments.ds)#">
				UPDATE IntakeHCPC  SET
					
					IntakeID =						
						<cfqueryparam value="#trim(localIntakeID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE IntakeHCPCID = <cfqueryparam value="#trim(arguments.bean.getIntakeHCPCID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeHCPCBean" />
		<cfset var qDeleteIntakeHCPC = "">

		<cfquery name="qDeleteIntakeHCPC" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM IntakeHCPC
			WHERE IntakeHCPCID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getIntakeHCPCID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeHCPC" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="IntakeHCPCID" required="yes" type="numeric" />		
		<cfset var qGetIntakeHCPC = "" />		
	
		<cfquery name="qGetIntakeHCPC" datasource="#trim(arguments.ds)#">
	  		SELECT IntakeHCPCID,IntakeID,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcCost1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcCost2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcCost3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcCost4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcCost5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcCost6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcCost7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcCost8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcCost9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcCost10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,hcpcCode11TBox,hcpcQty11TBox,hcpcProduct11TBox,hcpcDX11TBox,hcpcDiagnosis11TBox,hcpcCost11TBox,hcpcLengthOfNeedYear11TBox,hcpcLengthOfNeedMonth11TBox,hcpcCode12TBox,hcpcQty12TBox,hcpcProduct12TBox,hcpcDX12TBox,hcpcDiagnosis12TBox,hcpcCost12TBox,hcpcLengthOfNeedYear12TBox,hcpcLengthOfNeedMonth12TBox,hcpcCode13TBox,hcpcQty13TBox,hcpcProduct13TBox,hcpcDX13TBox,hcpcDiagnosis13TBox,hcpcCost13TBox,hcpcLengthOfNeedYear13TBox,hcpcLengthOfNeedMonth13TBox,hcpcCode14TBox,hcpcQty14TBox,hcpcProduct14TBox,hcpcDX14TBox,hcpcDiagnosis14TBox,hcpcCost14TBox,hcpcLengthOfNeedYear14TBox,hcpcLengthOfNeedMonth14TBox,hcpcCode15TBox,hcpcQty15TBox,hcpcProduct15TBox,hcpcDX15TBox,hcpcDiagnosis15TBox,hcpcCost15TBox,hcpcLengthOfNeedYear15TBox,hcpcLengthOfNeedMonth15TBox,hcpcCode16TBox,hcpcQty16TBox,hcpcProduct16TBox,hcpcDX16TBox,hcpcDiagnosis16TBox,hcpcCost16TBox,hcpcLengthOfNeedYear16TBox,hcpcLengthOfNeedMonth16TBox,hcpcCode17TBox,hcpcQty17TBox,hcpcProduct17TBox,hcpcDX17TBox,hcpcDiagnosis17TBox,hcpcCost17TBox,hcpcLengthOfNeedYear17TBox,hcpcLengthOfNeedMonth17TBox,hcpcCode18TBox,hcpcQty18TBox,hcpcProduct18TBox,hcpcDX18TBox,hcpcDiagnosis18TBox,hcpcCost18TBox,hcpcLengthOfNeedYear18TBox,hcpcLengthOfNeedMonth18TBox,hcpcCode19TBox,hcpcQty19TBox,hcpcProduct19TBox,hcpcDX19TBox,hcpcDiagnosis19TBox,hcpcCost19TBox,hcpcLengthOfNeedYear19TBox,hcpcLengthOfNeedMonth19TBox,hcpcCode20TBox,hcpcQty20TBox,hcpcProduct20TBox,hcpcDX20TBox,hcpcDiagnosis20TBox,hcpcCost20TBox,hcpcLengthOfNeedYear20TBox,hcpcLengthOfNeedMonth20TBox,hcpcCode21TBox,hcpcQty21TBox,hcpcProduct21TBox,hcpcDX21TBox,hcpcDiagnosis21TBox,hcpcCost21TBox,hcpcLengthOfNeedYear21TBox,hcpcLengthOfNeedMonth21TBox,hcpcCode22TBox,hcpcQty22TBox,hcpcProduct22TBox,hcpcDX22TBox,hcpcDiagnosis22TBox,hcpcCost22TBox,hcpcLengthOfNeedYear22TBox,hcpcLengthOfNeedMonth22TBox,hcpcCode23TBox,hcpcQty23TBox,hcpcProduct23TBox,hcpcDX23TBox,hcpcDiagnosis23TBox,hcpcCost23TBox,hcpcLengthOfNeedYear23TBox,hcpcLengthOfNeedMonth23TBox,hcpcCode24TBox,hcpcQty24TBox,hcpcProduct24TBox,hcpcDX24TBox,hcpcDiagnosis24TBox,hcpcCost24TBox,hcpcLengthOfNeedYear24TBox,hcpcLengthOfNeedMonth24TBox,hcpcCode25TBox,hcpcQty25TBox,hcpcProduct25TBox,hcpcDX25TBox,hcpcDiagnosis25TBox,hcpcCost25TBox,hcpcLengthOfNeedYear25TBox,hcpcLengthOfNeedMonth25TBox,hcpcCode26TBox,hcpcQty26TBox,hcpcProduct26TBox,hcpcDX26TBox,hcpcDiagnosis26TBox,hcpcCost26TBox,hcpcLengthOfNeedYear26TBox,hcpcLengthOfNeedMonth26TBox,hcpcCode27TBox,hcpcQty27TBox,hcpcProduct27TBox,hcpcDX27TBox,hcpcDiagnosis27TBox,hcpcCost27TBox,hcpcLengthOfNeedYear27TBox,hcpcLengthOfNeedMonth27TBox,hcpcCode28TBox,hcpcQty28TBox,hcpcProduct28TBox,hcpcDX28TBox,hcpcDiagnosis28TBox,hcpcCost28TBox,hcpcLengthOfNeedYear28TBox,hcpcLengthOfNeedMonth28TBox,hcpcCode29TBox,hcpcQty29TBox,hcpcProduct29TBox,hcpcDX29TBox,hcpcDiagnosis29TBox,hcpcCost29TBox,hcpcLengthOfNeedYear29TBox,hcpcLengthOfNeedMonth29TBox,hcpcCode30TBox,hcpcQty30TBox,hcpcProduct30TBox,hcpcDX30TBox,hcpcDiagnosis30TBox,hcpcCost30TBox,hcpcLengthOfNeedYear30TBox,hcpcLengthOfNeedMonth30TBox,hcpcCode31TBox,hcpcQty31TBox,hcpcProduct31TBox,hcpcDX31TBox,hcpcDiagnosis31TBox,hcpcCost31TBox,hcpcLengthOfNeedYear31TBox,hcpcLengthOfNeedMonth31TBox,hcpcCode32TBox,hcpcQty32TBox,hcpcProduct32TBox,hcpcDX32TBox,hcpcDiagnosis32TBox,hcpcCost32TBox,hcpcLengthOfNeedYear32TBox,hcpcLengthOfNeedMonth32TBox,hcpcCode33TBox,hcpcQty33TBox,hcpcProduct33TBox,hcpcDX33TBox,hcpcDiagnosis33TBox,hcpcCost33TBox,hcpcLengthOfNeedYear33TBox,hcpcLengthOfNeedMonth33TBox,hcpcCode34TBox,hcpcQty34TBox,hcpcProduct34TBox,hcpcDX34TBox,hcpcDiagnosis34TBox,hcpcCost34TBox,hcpcLengthOfNeedYear34TBox,hcpcLengthOfNeedMonth34TBox,hcpcCode35TBox,hcpcQty35TBox,hcpcProduct35TBox,hcpcDX35TBox,hcpcDiagnosis35TBox,hcpcCost35TBox,hcpcLengthOfNeedYear35TBox,hcpcLengthOfNeedMonth35TBox,hcpcCode36TBox,hcpcQty36TBox,hcpcProduct36TBox,hcpcDX36TBox,hcpcDiagnosis36TBox,hcpcCost36TBox,hcpcLengthOfNeedYear36TBox,hcpcLengthOfNeedMonth36TBox,hcpcCode37TBox,hcpcQty37TBox,hcpcProduct37TBox,hcpcDX37TBox,hcpcDiagnosis37TBox,hcpcCost37TBox,hcpcLengthOfNeedYear37TBox,hcpcLengthOfNeedMonth37TBox,hcpcCode38TBox,hcpcQty38TBox,hcpcProduct38TBox,hcpcDX38TBox,hcpcDiagnosis38TBox,hcpcCost38TBox,hcpcLengthOfNeedYear38TBox,hcpcLengthOfNeedMonth38TBox,hcpcCode39TBox,hcpcQty39TBox,hcpcProduct39TBox,hcpcDX39TBox,hcpcDiagnosis39TBox,hcpcCost39TBox,hcpcLengthOfNeedYear39TBox,hcpcLengthOfNeedMonth39TBox,hcpcCode40TBox,hcpcQty40TBox,hcpcProduct40TBox,hcpcDX40TBox,hcpcDiagnosis40TBox,hcpcCost40TBox,hcpcLengthOfNeedYear40TBox,hcpcLengthOfNeedMonth40TBox,Active,InactiveCode,DateCreated,DateModified
			FROM IntakeHCPC  
			WHERE IntakeHCPCID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.IntakeHCPCID)#" /> 
		</cfquery>
		
		<cfreturn qGetIntakeHCPC>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


