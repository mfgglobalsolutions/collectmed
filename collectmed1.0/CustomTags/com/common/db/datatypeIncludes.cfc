

<cfcomponent hint="">
	
	<!------------------------------------------------------------------>
	<!--- Verify a datatype functions.                               --->
	<!------------------------------------------------------------------>
	<cfscript>	
		
		/*-----------------------------------------------------------------*/
		/*--- NUMERIC                                                   ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isNumericDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- DECIMAL                                                   ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isDecimalDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
						
						
		/*-----------------------------------------------------------------*/
		/*--- FLOAT                                                     ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isFloatDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- REAL                                                      ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isRealDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- SMALL MONEY                                               ---*/
		/*--- Althought the comma is accepted it will be truncated      ---*/
		/*--- upon insertion. Only numbers, comma, negative and         ---*/
		/*--- decimal point are allowed. Must be between                ---*/
		/*--- -214,748.3648 and +214,748.3647                           ---*/
		/*-----------------------------------------------------------------*/	
		function isSmallMoneyDataType(val) {		  
			if (len(val) EQ len(rereplace(val,"[^-,.1234567890]","","all")) AND rereplace(val,"[^-.1234567890]","","all") GTE -214748.3648 AND rereplace(val,"[^-.1234567890]","","all") LTE 214748.3647){
				return true;
			}		
			else 
				return false; 	
		}
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- MONEY                                                     ---*/
		/*--- Althought the comma is accepted it will be truncated      ---*/
		/*--- upon insertion. Only numbers, comma, negative and         ---*/
		/*--- decimal point are allowed. Must be between                ---*/
		/*--- -922,337,203,685,477.5808 and +922,337,203,685,477.5807   ---*/
		/*-----------------------------------------------------------------*/	
		function isMoneyDataType(val) {		  
			if (len(val) EQ len(rereplace(val,"[^-,.1234567890]","","all")) AND rereplace(val,"[^-.1234567890]","","all") GTE -922337203685477.5808 AND rereplace(val,"[^-.1234567890]","","all") LTE 922337203685477.5807){
				return true;
			}		
			else 
				return false; 	
		}
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- SMALLINT                                                  ---*/
		/*--- small int can only be called with commas, negative,       ---*/
		/*--- numbers and decimal point. Integer from (-32,768)         ---*/
		/*--- through 2^15 - 1 (32,767).                                ---*/
		/*-----------------------------------------------------------------*/		
		function isSmallIntDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-,.1234567890]","","all")) AND rereplace(val,"[^-.1234567890]","","all") GTE -32768 AND rereplace(val,"[^-.1234567890]","","all") LTE 32768){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- TINY INT                                                  ---*/
		/*--- Tiny Int can only accept the values from 0 to 255.        ---*/		
		/*-----------------------------------------------------------------*/ 		
		function isTinyIntDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^1234567890]","","all")) AND val GTE 0 AND val LTE 255){
				return true;
			}		
			else 
				return false; 	
		}
		
		
		
		/*-----------------------------------------------------------------*/
		/*--- INT                                                       ---*/
		/*--- int can only be called with commas, negative, numbers.    ---*/	
		/*--- Integer (whole number) from (-2,147,483,648) through      ---*/
		/*--- (2,147,483,647).                                          ---*/
		/*-----------------------------------------------------------------*/		
		function isIntDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-,1234567890]","","all")) AND rereplace(val,"[^-1234567890]","","all") GTE -2147483648 AND rereplace(val,"[^-1234567890]","","all") LTE 2147483647){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- BIG INT                                                   ---*/
		/*--- int can only be called with commas, negative, numbers.    ---*/
		/*--- Integer (whole number) from (-9223372036854775808)        ---*/
		/*--- through (9223372036854775807).	                        ---*/ 
		/*-----------------------------------------------------------------*/		
		function isBigIntDataType(val) {
			if (len(val) NEQ len(rereplace(val,"[^-,1234567890]","","all")) OR rereplace(val,"[^-1234567890]","","all") LTE -9223372036854775808 OR rereplace(val,"[^-1234567890]","","all") GTE 9223372036854775807){
				return false;
			}		
			else {
				return true; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- BIT                                                       ---*/
		/*--- int can only be called with 1 or 0.                       ---*/	
		/*-----------------------------------------------------------------*/		
		function isBitDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^10]","","all"))){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- DateTime                                                  ---*/
		/*--- Date and time data from January 1, 1753, through          ---*/
		/*--- December 31, 9999, with an accuracy of three-hundredths   ---*/
		/*--- of a second, or 3.33 milliseconds.                        ---*/	
		/*-----------------------------------------------------------------*/			
		function isDateTimeDataType(val) {
			if (IsDate(val) AND DateCompare(val, '1753-01-1 00:00:01') GTE 0 AND DateCompare(val, '9999-12-31 11:59:59') LTE 0){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- SmallDateTime                                             ---*/
		/*--- Date and time data from January 1, 1900, through          ---*/ 
		/*--- June 6, 2079, with an accuracy of one minute.             ---*/	
		/*-----------------------------------------------------------------*/			
		function isSmallDateTimeDataType(val) {
			if (IsDate(val) AND DateCompare(val, '1900-01-01 00:00:00') GTE 0 AND DateCompare(val, '2079-06-06 11:59:59') LTE 0){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- char                                                      ---*/
		/*--- length cannot exceed 8,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isCharDataType(val) {
			if (len(val) LTE 8000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
				
		/*-----------------------------------------------------------------*/
		/*--- varchar                                                   ---*/
		/*--- length cannot exceed 8,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isVarcharDataType(val) {
			if (len(val) LTE 8000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- text                                                      ---*/
		/*--- length cannot exceed 2,147,483,647 characters.            ---*/	
		/*-----------------------------------------------------------------*/			
		function isTextDataType(val) {
			if (len(val) LTE 2147483647){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- nchar                                                     ---*/
		/*--- length cannot exceed 4,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isNCharDataType(val) {
			if (len(val) LTE 4000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		
		
		/*-----------------------------------------------------------------*/
		/*--- nvarchar                                                  ---*/
		/*--- length cannot exceed 4,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isNVarcharDataType(val) {
			if (len(val) LTE 4000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
				
		
		/*-----------------------------------------------------------------*/
		/*--- ntext                                                     ---*/
		/*--- length cannot exceed 1,073,741,823 characters.            ---*/	
		/*-----------------------------------------------------------------*/			
		function isNTextDataType(val) {
			if (len(val) LTE 1073741823){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
					
		
	</cfscript>	
	

</cfcomponent>	

