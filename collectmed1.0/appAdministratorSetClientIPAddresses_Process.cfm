<!---- appAdministratorSetClientIPAddresses_Process.cfm ---->




<!---process here--->






<cfset msg = "All records were processed.">

<Cflocation addtoken="No" url="appAdministratorSetClientIPAddresses.cfm?msg=#URLEncodedFormat(msg)#">