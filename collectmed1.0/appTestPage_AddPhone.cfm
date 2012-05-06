
REMEMBER to CLEAR the template cache after you fine the EntityID of the person

SELECT     *
FROM         Entity
WHERE     (Lname = 'BROWN') AND (Fname = 'Peggy')


PUT this code in appTestPage2.cfm which is registered.
<!-------------------------------------------------------------------------------------->
<!--- Start inserting the new phone number for this user.                            --->
<!-------------------------------------------------------------------------------------->				
<cfset NewUserPhoneNumber = application.beanFactory.getBean('globalFooter').GlobalFooterE('9797034991') />

<cfoutput>

cfquery name="insertNewUserPhone" datasource="#trim(request.datasource)#">
	INSERT INTO Phone  (phoneNumber, phoneExtension, PhoneTypeID)
	VALUES('#trim(NewUserPhoneNumber)#', '', 74);
	SELECT LAST_INSERT_ID() AS phoneID 
/cfquery>

cfset newUserPhoneID = insertNewUserPhone.phoneID>	
			
cfquery name="insertNewUserEntityPhone" datasource="#trim(request.datasource)#">
	INSERT INTO EntityPhone  (EntityID, PhoneID, IsDefault)
	VALUES(146095, '#trim(newUserPhoneID)#', 1)				
/cfquery>


</cfoutput>
