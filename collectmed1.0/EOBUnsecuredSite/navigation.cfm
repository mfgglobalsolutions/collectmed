


<cfoutput>
  	
	<script language="JavaScript" type="text/javascript">
						
		function launchLoginPage(linkToGoTo){	
			var rand_no = Math.floor(Math.random()*101)
			var winName = 'loginwindow_' + rand_no;  			
			f_open_window_max(linkToGoTo, winName);
		};
		
		function f_open_window_max(aURL, aWinName){
		   var wOpen;
		   var sOptions;
		    
		   
		  if(window.name.indexOf("loginwindow_") != -1){		   		
				document.location.href = 'https://secure.collectmed.net/appSiteLogin.cfm'; 
		   }	
		   else{
		   	document.location.href = 'https://secure.collectmed.net/appSiteLogin.cfm'; 
		   
			   /*sOptions = 'status=yes,hotkeys=no,menubar=no,scrollbars=yes,resizable=yes,toolbar=no';
			   sOptions = sOptions + ',width=' + (screen.availWidth - 10).toString();
			   sOptions = sOptions + ',height=' + (screen.availHeight - 122).toString();
			   sOptions = sOptions + ',screenX=0,screenY=0,left=0,top=0';
			   wOpen = window.open( '', aWinName, sOptions );
			   wOpen.location = aURL;
			   wOpen.focus();
			   wOpen.moveTo( 0, 0 );
			   wOpen.resizeTo( screen.availWidth, screen.availHeight );
			   return wOpen;*/
		   
		   };
		   
		};
		
		function hover(ref, classRef){ 
			eval(ref).className = classRef; 
		}
		
	</script>
	
  </cfoutput>


<div class="nav">
	  <a href="index.cfm">Home</a> | <a href="appAbout.cfm">About</a> | <!---<a href="appCreateAccount.cfm">Create&nbsp;Account</a> | ---><a href="appHelp.cfm">FAQs</a> | <a href="appContactUs.cfm">Contact</a>
</div> 

