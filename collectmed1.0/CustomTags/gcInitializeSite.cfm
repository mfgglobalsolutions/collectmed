<!------------------------------------------------------------------>
<!--- NAME: gcInitializeSite.cfm                                 --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>	
	<cfparam name="attributes.SiteID" default="">
	<cfset SiteID = attributes.SiteID>
	
	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="SiteID"
		fieldnames="Site ID">	
	
	
			
<!------------------------------------------------------------------>
<!--- Gather the Sites information based on the servers          --->
<!--- Script Name that came in.                                  --->
<!------------------------------------------------------------------>	
	<cfset application.Site = CreateObject("component","com.common.db.SiteIO").Init(trim(SiteID))>	
	
		
