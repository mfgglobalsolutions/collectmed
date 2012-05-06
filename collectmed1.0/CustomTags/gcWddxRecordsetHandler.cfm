<!---gcWddxRecordsetHandler.cfm--->


<!-------------------------------------------------------------------------------------->
<!--- Include WddxRecordset support                                                  --->
<!-------------------------------------------------------------------------------------->
    <script type="text/javascript" language="JavaScript" src="../includes/wddx.js"></script>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- If browser is IE under windows                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
    	<script type="text/javascript" language="JavaScript" src="../includes/wddxDesIE.js"></script>
    <cfelse>
    	<script type="text/javascript" language="JavaScript" src="../includes/wddxDes.js"></script>
    </cfif>	
	
	<script language="JavaScript">
		// Utility function to fetch text from a URL
	    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
	    function _wddxSelectListGetFromURL(strURL) {
	        var objHTTP, result;
	    
	        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
	        if (window.XMLHttpRequest) {
	          objHTTP=new XMLHttpRequest();
	          objHTTP.open("GET", strURL, false);  
	          objHTTP.send(null);
	          result=objHTTP.responseText;
	    
	        // For IE browsers under Windows    
	        } else if (window.ActiveXObject) {
	          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
	          objHTTP.open("GET", strURL, false);  
	          objHTTP.send(null);
	          result=objHTTP.responseText;
	        }
	  
	        // Return result
	        return result;
	    };
	</script>