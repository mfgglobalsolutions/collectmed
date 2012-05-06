
<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.formName" default="">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.fieldName" default="">
	<cfset fieldName = attributes.fieldName>
	
	<cfparam name="attributes.onclickverbiage" default="Choose A Date">
	<cfset onclickverbiage = attributes.onclickverbiage>
	
	<cfparam name="attributes.randRange" default="#randRange(1, 5000)#">
	<cfset randRange = attributes.randRange>
	




<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="formName,fieldName"
		fieldnames="Form Name, Field Name">





<cfoutput>

<cfif NOT IsDefined("request.calendarDefined")>

<cfset request.calendarDefined = "defined">

<style type="text/css">

	.primoris-cl-header {
		color: white;
		font-family: Verdana;
		font-size: 8pt;
		background-image: url(primoris/Header.jpg);
	}
	.primoris-cl-on-month {
		font-family: Verdana;
		font-size: 8pt;
		background-color: white;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.primoris-cl-on-month-lit {
		font-family: Verdana;
		font-size: 8pt;
		background-color: ##99CDFF;
		color: white;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.primoris-cl-off-month {
		font-family: Verdana;
		font-size: 8pt;
		background-color: gray;
		color: white;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.primoris-cl-off-month-lit {
		font-family: Verdana;
		font-size: 8pt;
		background-color: silver;
		color: white;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.primoris-cl-body {
		border: 1px solid black;
	}
	.primoris-cl-year {
		border: 1px solid black;
		background-color:white;
		border-collapse: collapse;
		font-size: 7pt;
		font-family: Verdana;
		text-align: center;
		padding-left: 5px;
		padding-right: 5px;
	}
	.primoris-cl-year-lit {
		background-color: silver;
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 7pt;
		font-family: Verdana;
		text-align: center;
		padding-left: 5px;
		padding-right: 5px;
	}
	.primoris-cl-day {
		text-align: center;
		font-size: 7pt;
		font-family: Verdana;
		padding-left: 7px;
		padding-right: 7px;
		background-image: url(primoris/days.jpg);
	}
	.primoris-cl-days 
	{
		background-image: url(primoris/days.jpg);
	}

	.basic-cl-header {
		color: white;
		font-family: Verdana;
		font-size: 8pt;
		background-color: blue;
	}
	.basic-cl-on-month {
		font-family: Verdana;
		font-size: 8pt;
		background-color: transparent;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.basic-cl-on-month-lit {
		font-family: Verdana;
		font-size: 8pt;
		background-color: blue;
		color: white;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.basic-cl-off-month {
		font-family: Verdana;
		font-size: 8pt;
		background-color: gray;
		color: white;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.basic-cl-off-month-lit {
		font-family: Verdana;
		font-size: 8pt;
		background-color: silver;
		color: white;
		text-align: center;
		border-top: 1px solid silver;
		border-left: 1px solid silver;
	}
	.basic-cl-body {
		border: 1px solid black;
	}
	.basic-cl-year {
		border: 1px solid black;
		background-color:white;
		border-collapse: collapse;
		border-spacing: 0px;
		font-size: 7pt;
		font-family: Verdana;
		text-align: center;
		padding-left: 5px;
		padding-right: 5px;
	}
	.basic-cl-year-lit {
		background-color: silver;
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 7pt;
		font-family: Verdana;
		text-align: center;
		padding-left: 5px;
		padding-right: 5px;
	}
	.basic-cl-day {
		text-align: center;
		font-size: 7pt;
		font-family: Verdana;
		padding-left: 7px;
		padding-right: 7px;
	}


	/* Not related to the calendar functioning. The following style rules
	are purely for the supporting DateClick documentation */
	.links 
	{
		color: ##0082D6;
		font-family: Verdana;
		font-size: 8pt;
	}
	.subdued 
	{
		color: ##CDCDCD;
	}
	.copyright 
	{
		color: Gray;
		font-family: Verdana;
		font-size: 7pt;
	}
</style>




<script language="JavaScript">

     function calendar(AG){	
	 this.Lr="1.2.000";this.us="Click here to quickly and easily select a date.";
	 this.va=0;
	 this.eO=0;
	 this.BM=0;
	 this.DE=new b(AG);
	 this.qf=new Date();
	 this.MQ=this.qf.getFullYear();
	 this.aO=Array(43);
	 this.aryMonths=Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	 this.aryDays=Array("S","M","T","W","T","F","S","S");
	 this.JJ=glbCalendars.length;glbCalendars[glbCalendars.length]=this;
	 this.lZ="caldiv_"+this.JJ;this.bC=false;
	 this.NJ=null;
	 this.sN=null;
	 this.UT=false;
	 this.Xt=false;
	 this.tW=0;
	 this.XO=0;
	 this.Ro={D:0,k:0,Xm:0,pl:0};
	 this.Rd={D:0,k:0,Xm:0,pl:0};
	 this.Ek={D:0,k:0,Xm:0,pl:0};
	 this.px="";
	 this.fu=false; 
	 this.wp=Array(3);
	 this.rI=""; 
	 this.sU=null;
	 this.Fn=null;
	 this.mH=null; 
	 this.Ew=this.DE.jo("FIELD")?eval(this.DE.jo("FIELD")):null;
	 
	 this.Ew2=this.DE.jo("SPANID")?this.DE.jo("SPANID"):null;
	// alert(this.Ew2);
	
	 this.Ew3=this.DE.jo("VERBIAGE")?this.DE.jo("VERBIAGE"):null;
	 //alert(this.Ew3);
	 
	 
	 this.jM=this.DE.jo("FORMAT")?this.DE.jo("FORMAT"):"0";
	 this.ax=this.DE.jo("DELIMITER")?this.DE.jo("DELIMITER"):"/";
	 this.DN=false; 
	 this.bU=bU;
	 function bU(obj){ } 
	 this.ak=true;
	 this.bp=false;
	 this.EM=true;
	 this.qj=2000;
	 this.iG=0;
	 this.Vi=null;
	 this.iD=null;
	 this.Dp=1;
	 this.lY=1;
	 this.vk=false;
	 this.Jf=true;
	 this.hU=0;
	 this.Oh="basic";
	 if(this.DE.jo("ZEROS")) this.px+="ZEROS\n";
	 if(this.DE.jo("MOUSEOVER")) this.px+="MOUSEOVER\n";
	 if(this.DE.jo("SHOWDAYS")) this.px+="SHOWDAYS\n";
	 if(this.DE.jo("DELAY")) this.px+="DELAY\n";
	 if(this.DE.jo("BEGINONMONDAY")) this.px+="BEGINONMONDAY\n";
	 if(this.DE.jo("ICONLEFT")) this.px+="ICONLEFT\n";
	 if(this.DE.jo("ICONTOP")) this.px+="ICONTOP\n";
	 if(this.DE.jo("DIR")) this.px+="DIR\n";
	 if(this.DE.jo("MONTH")) this.px+="MONTH\n";
	 if(this.DE.jo("SHADOW")) this.px+="SHADOW\n";
	 if(this.DE.jo("CLOSE")) this.px+="CLOSE\n";
	 if(this.DE.jo("YEAR")) this.px+="YEAR\n";
	 if(this.DE.jo("MOVEMODE")) this.px+="MOVEMODE\n";   
	 var E;
	 if(this.Oh){if(this.Oh.indexOf("/")>0){E=this.Oh.split("/"); this.Zw=E[E.length-1];}
	 else{this.Zw=this.Oh?this.Oh:"basic";}
	 }else{this.Zw=this.Oh?this.Oh:"basic";}
	 this.NG=NG;
	 this.qG=qG;
	 this.II=II;
	 this.Yh=Yh;
	 this.oh=oh;
	 this.vu=vu;
	 this.Lo=Lo;
	 this.oO=oO;
	 this.dI=dI;
	 this.nO=nO;
	 this.nh=nh;
	 this.Pj=Pj;
	 this.Fw=Fw;
	 this.UG=UG;
	 this.SD=SD;
	 this.PY=PY;
	 this.KF=KF;
	 this.aE=aE;
	 this.writeCalendar=writeCalendar;
	 this.mg=mg;
	 this.WZ=WZ;
	 this.ES=ES;
	 this.tx=tx;
	 this.ur=ur;
	 this.JD=JD;
	 this.cV=cV;
	 this.lr=lr;
	 this.Gw=Gw;
	 this.Pv=Pv;
	 this.tG=tG;
	 this.NX=NX;
	 this.Tb=Tb;
	 this.wQ=wQ;
	 this.Mk=Mk;r=this;
	 function __PUBLIC__(){}
	 function writeCalendar(){ 
	 	var c; c=document.all?"onClick":"onMouseDown";
		var O=(document.all&&!document.getElementById)?"width:20;":"";
		var Q=r.bp?"onMouseOver":c;
		var K;K=r.vk?"filter: progid:DXImageTransform.Microsoft.DropShadow(color=##777788,direction=135,strength=2);":"";
		var T=r.iD?"top:"+r.iD+";":"";T+=r.Vi?"left:"+r.Vi+";":"";T+=T.length>0?"position: absolute;":"";r.aE(); 
		
		//document.write("<img src='"+r.Oh+"/calendar.gif' border='0' align='top' style='"+T+"' "+Q+"='glbCalendars["+r.JJ+"].NG(event);if (window.event)window.event.cancelBubble=true;' title='"+r.us+"'>");  
		
		document.write("<span id=spanid title='Click here to select a date' style='position:reative;cursor:hand;border-bottom:1px solid blue;color:blue;"+T+"' "+Q+"='glbCalendars["+r.JJ+"].NG(event);if (window.event)window.event.cancelBubble=true;' title='"+r.us+"'>"+r.Ew3+"</span>");
		
		
		document.write("<div id='"+r.lZ+"' ");
		document.write("onMouseOut='glbCalendars["+r.JJ+"].lr();' ");
		document.write("style='"+K+O+"position:absolute;display:none;' class='"+r.Zw+"-cl-body'> "); 
		document.write(r.JD()); 
		document.write("</div>"); 
		if(r.lY){
			document.write("<div id='"+r.lZ+"_year' ");
			document.write("onMouseOut='glbCalendars["+r.JJ+"].lr();' ");
			document.write("onMouseOver='glbCalendars["+r.JJ+"].nh(this);' ");
			document.write("style='position:absolute;display:none;background-color:white;'> "); 
			document.write(r.ur()); 
			document.write("</div>");} 
		if(r.Dp){
			document.write("<div id='"+r.lZ+"_month' ");
			document.write("onMouseOut='glbCalendars["+r.JJ+"].Gw();' ");
			document.write("onMouseOver='glbCalendars["+r.JJ+"].nh(this);' ");
			document.write("style='position:absolute;display:none;background-color:white;'> "); 
			document.write(r.tx()); 
			document.write("</div>");} 
			document.write("<IFRAME style='DISPLAY: none; LEFT: 0px; POSITION: absolute; TOP: 0px' frameBorder='0' scrolling='no' id='"+r.lZ+"_ghost'></IFRAME>\n");
			document.write("<IFRAME style='DISPLAY: none; LEFT: 0px; POSITION: absolute; TOP: 0px' frameBorder='0' scrolling='no' id='"+r.lZ+"_ghost_mo'></IFRAME>\n");
			document.write("<IFRAME style='DISPLAY: none; LEFT: 0px; POSITION: absolute; TOP: 0px' frameBorder='0' scrolling='no' id='"+r.lZ+"_ghost_year'></IFRAME>\n");
		if(this.px){
			if(confirm("The following options are not available in DateClick Standard Edition:\n"+ this.px+"\nTo obtain DateClick Professional or Developer, please "+ "click 'OK' to be redirected straight to our website.")){document.location.href="http://www.primorissoftware.com/purchase.asp";}}}

function __DISPLAY__(){}
function NG(Y){var P,t,X;Y=u(Y);X=r.cV(Y);G();if(qI) r.DN=true;if(document.getElementById){P=document.getElementById(r.lZ);if(r.DN) t=document.getElementById(r.lZ+"_ghost");}else if(document.all){P=document.all[r.lZ];if(r.DN) t=document.all[r.lZ+"_ghost"];}else P=document.layers[r.lZ];r.NJ=P;r.sN=t;if(r.Xt){if(r.DN){r.Tb(t,P);t.style.display="block";}return false;}r.UG();clearInterval(r.sU);for(var f=0;f<glbCalendars.length;f++){if(glbCalendars[f]==r) glbCalendars[f].bC=true;else glbCalendars[f].bC=false;if(!glbCalendars[f].bC){glbCalendars[f].qG();}}if(P){e.style.zIndex=++Nt;if(!r.tW){r.NX(P,X);}r.bU(P );e.style.display="block";if(r.DN){r.Tb(t,P);t.style.display="block";}r.Xt=true;r.Ro=S(P);if(window.event){window.event.cancelBubble=true;window.event.returnValue=false;}}return false;}
function vu(Y){var P,o,v,t,X=r.cV(Y);if(r.UT) return false;clearInterval(r.sU);if(document.getElementById){P=document.getElementById(r.lZ);o=document.getElementById(r.lZ+"_month");if(r.DN) t=document.getElementById(r.lZ+"_ghost_mo");}else if(document.all){P=document.all[r.lZ];o=document.all[r.lZ+"_month"];if(r.DN) t=document.all[r.lZ+"_ghost_mo"];}else{P=document.layers[r.lZ];o=document.layers[r.lZ+"_month"];}r.II();if(P){o.style.display="block";o.style.zIndex=++Nt;r.wQ(P,o );r.Rd=S(o);if(r.DN){r.Tb(t,o );t.style.display="block";}}}
function oh(Y){var P,h,v,X=r.cV(Y);if(r.UT) return false;clearInterval(r.sU);if(document.getElementById){P=document.getElementById(r.lZ);h=document.getElementById(r.lZ+"_year");if(r.DN) t=document.getElementById(r.lZ+"_ghost_year");}else if(document.all){P=document.all[r.lZ];h=document.all[r.lZ+"_year"];if(r.DN) t=document.all[r.lZ+"_ghost_year"];}else{P=document.layers[r.lZ];h=document.layers[r.lZ+"_year"];}r.Yh();if(P){h.style.display="block";r.Mk(P,h );h.style.zIndex=++Nt;r.Ek=S(h);if(r.DN){r.Tb(t,h );t.style.display="block";}}}
function qG(){var P,t;if(!r.Xt) return false;if(document.getElementById){P=document.getElementById(r.lZ).style;if(r.DN) t=document.getElementById(r.lZ+"_ghost").style;}else if(document.all){P=document.all[r.lZ].style;if(r.DN) t=document.all[r.lZ+"_ghost"].style;}else{P=document.layers[r.lZ];}if(P){e.display="none";if(r.DN) t.display="none";}if(r.lY) r.II();if(r.Dp) r.Yh();r.Xt=false;clearInterval(r.sU);}
function Yh(){var o,t;if(document.getElementById){o=document.getElementById(r.lZ+"_month");if(o) o=o.style;if(r.DN) t=document.getElementById(r.lZ+"_ghost_mo").style;}else if(document.all){o=document.all[r.lZ+"_month"];if(o) o=o.style;if(r.DN) t=document.all[r.lZ+"_ghost_mo"].style;}else{o=document.layers[r.lZ+"_month"];}if(o){o.display="none";r.Rd={D:0,k:0,Xm:0,pl:0};if(r.DN) t.display="none";}}
function II(){var h,t;if(document.getElementById){h=document.getElementById(r.lZ+"_year");if(h) h=h.style;if(r.DN) t=document.getElementById(r.lZ+"_ghost_year").style;}else if(document.all){h=document.all[r.lZ+"_year"];if(h) h=h.style;if(r.DN) t=document.all[r.lZ+"_ghost_year"].style;}else{h=document.layers[r.lZ+"_year"];}if(h){h.display="none";r.Ek={D:0,k:0,Xm:0,pl:0};if(r.DN) t.display="none";}}
function __EVENTS__(){}
function nh(argCell){clearInterval(r.sU);if(argCell.className==r.Zw+"-cl-on-month") argCell.className=r.Zw+"-cl-on-month-lit";else if(argCell.className==r.Zw+"-cl-off-month") argCell.className=r.Zw+"-cl-off-month-lit";else if(argCell.className==r.Zw+"-cl-year") argCell.className=r.Zw+"-cl-year-lit";}
function Pj(argCell){if(argCell.className==r.Zw+"-cl-on-month-lit") argCell.className=r.Zw+"-cl-on-month";else if(argCell.className==r.Zw+"-cl-off-month-lit") argCell.className=r.Zw+"-cl-off-month";else if(argCell.className==r.Zw+"-cl-year-lit") argCell.className=r.Zw+"-cl-year";}
function Lo(){r.qf.setMonth(++r.eO);aE();Fw(r.lZ,JD());}
function dI(){r.MQ+=10;Fw(r.lZ+"_year",ur());}
function oO(){r.qf.setMonth(--r.eO);aE();Fw(r.lZ,JD());}
function nO(){r.MQ-=10;Fw(r.lZ+"_year",ur());}
function mg(td){var R=new Date(td.title);var d;r.wp[0]=R.getFullYear();r.wp[1]=r.tG(R.getMonth()+1);r.wp[2]=r.tG(R.getDate());switch(r.jM){case "1":d=r.wp[2]+r.ax+ r.wp[1]+r.ax+r.wp[0];break;case "2":d=r.wp[0]+r.ax+ r.wp[1]+r.ax+r.wp[2];break;default:d=r.wp[1]+r.ax+ r.wp[2]+r.ax+r.wp[0];break;}if(r.Ew) r.Ew.value=d;  var temp1 = r.Ew2 + ".innerText"; spanid.innerText=r.Ew.value; if(r.Jf) r.qG();r.rI=d;}
function ES(intYear,ob){r.qf.setFullYear(intYear);aE();Fw(r.lZ,JD());r.bC=true;r.II(); if(window.event) event.cancelBubble=true;else ob.stopPropagation();}
function WZ(intMonth,ob){r.qf.setMonth(intMonth);aE();Fw(r.lZ,JD());r.bC=true;r.Yh(); if(window.event) event.cancelBubble=true;else ob.stopPropagation();}function __INTERNAL__(){}function UG(){r.NJ.onmousedown=r.SD;if(isNaN(parseInt(r.NJ.style.left))) r.NJ.style.left="0px";if(isNaN(parseInt(r.NJ.style.top))) r.NJ.style.top="0px";r.NJ.YM=new Function();r.NJ.ek=new Function();r.NJ.TB=new Function();}
function SD(A){A=u(A);var k=parseInt(r.NJ.style.top);var D=parseInt(r.NJ.style.left);r.Yh();r.II();r.NJ.YM(D,k);r.UT=true;if(r.hU){r.tW=A.clientX;r.XO=A.clientY;r.fu=false;}document.onmousemove=r.PY;document.onmouseup=r.KF;return false;}
function PY(A){A=u(A);var M=A.clientY;var W=A.clientX;var k=parseInt(r.NJ.style.top);var D=parseInt(r.NJ.style.left);var N,Z;N=D+(W-r.tW);Z=k+(M-r.XO);if(r.hU>0){if(!r.fu){r.NJ.style.filter="progid:DXImageTransform.Microsoft.Alpha(opacity=60);";r.NJ.style.cursor="move";r.fu=true;}r.NJ.style["left"]=N+"px";r.NJ.style["top"]=Z+"px";r.tW=W;r.XO=M;if(r.sN){r.sN.style["left"]=N+"px";r.sN.style["top"]=Z+"px";}}r.NJ.TB(N,Z);return false;}
function KF(){document.onmousemove=null;document.onmouseup=null;r.NJ.ek(parseInt(r.NJ.style["left"]),parseInt(r.NJ.style["top"]));if(r.hU){r.NJ.style.filter="";r.NJ.style.cursor="arrow";r.Ro=S(r.NJ);if(r.hU>1){r.tW=0;r.XO=0;}}r.UT=false;}
function aE(){var g,V=0;var F,p;var H=r.qf;var f,a=1;r.va=H.getDate();r.eO=H.getMonth();r.BM=H.getFullYear();g=new Date(r.BM,r.eO,1);  V-=g.getDay()>0?g.getDay():g.getDay()+7;for(f=0;f<43;f++){r.aO[f]=new Date(g.getFullYear(),g.getMonth(),++V);}}
function tx(){var innerHTML="";innerHTML+="<table cellspacing=0 cellpadding=0 border=0>";innerHTML+="<tr>";for(var f=0;f<12;f++){ if(f % 6==0) innerHTML+="</tr><tr>";innerHTML+="<td class='"+r.Zw+"-cl-year' onMouseOver='glbCalendars["+r.JJ+"].nh(this);' onMouseOut='glbCalendars["+r.JJ+"].Pj(this);' style='cursor: hand; cursor: pointer;' onClick='glbCalendars["+r.JJ+"].WZ("+f+",event);'>";innerHTML+=r.aryMonths[f];innerHTML+="</td>";}innerHTML+="</tr>";innerHTML+="</table>";return innerHTML;}
function ur(){var innerHTML="";innerHTML+="<table cellspacing=0 cellpadding=0 border=0>";innerHTML+="<tr>";innerHTML+="<td class='"+r.Zw+"-cl-year' onMouseOver='glbCalendars["+r.JJ+"].nh(this);' onMouseOut='glbCalendars["+r.JJ+"].Pj(this);' style='cursor: hand; cursor: pointer;' onMouseDown='glbCalendars["+r.JJ+"].dI();' align='center' valign='center'>";innerHTML+="<img src='"+r.Oh+"/ue.gif' border='0'>";innerHTML+="</td>";innerHTML+="</tr>";for(var f=parseInt(r.MQ);f>parseInt(r.MQ)-10;f--){innerHTML+="<tr>";innerHTML+="<td class='"+r.Zw+"-cl-year' onMouseOver='glbCalendars["+r.JJ+"].nh(this);' onMouseOut='glbCalendars["+r.JJ+"].Pj(this);' style='cursor: hand; cursor: pointer;' onClick='glbCalendars["+r.JJ+"].ES("+f+",event);'>";innerHTML+=f;innerHTML+="</td>";innerHTML+="</tr>";}innerHTML+="<tr>";innerHTML+="<td class='"+r.Zw+"-cl-year' onMouseOver='glbCalendars["+r.JJ+"].nh(this);' onMouseOut='glbCalendars["+r.JJ+"].Pj(this);' style='cursor: hand; cursor: pointer;' onMouseDown='glbCalendars["+r.JJ+"].nO();' align='center' valign='center'>";innerHTML+="<img src='"+r.Oh+"/down.gif' border='0'>";innerHTML+="</td>";innerHTML+="</tr>";innerHTML+="</table>";return innerHTML;}

function JD(){var innerHTML="";var E,s,w="none",U="none"; innerHTML+="<table cellspacing=0 cellpadding=0 border=0 id='cal'>"; innerHTML+="<tr class='"+r.Oh+"-header-row'>"; innerHTML+="<td align='left' class='"+r.Zw+"-cl-header' onMouseOver='glbCalendars["+r.JJ+"].nh(this);'>"; innerHTML+="<img src='"+r.Oh+"/prev.gif' border='0' onClick='window.event.returnValue=false;return false;' onMouseDown='glbCalendars["+r.JJ+"].oO();return false;' style='cursor:hand;cursor:pointer;'>"; innerHTML+="</td>";innerHTML+="<td align='center' class='"+r.Zw+"-cl-header' onMouseOver='glbCalendars["+r.JJ+"].nh(this);'>"; if(r.Dp==2) w="onMouseOver";else if(r.Dp==1) w="onClick"; innerHTML+="<span class='"+r.Zw+"-cl-header' "+w+"='return glbCalendars["+r.JJ+"].vu(event);' "+(w=="none"?"style='cursor:default;'":"style='cursor:hand;cursor:pointer;text-decoration:underline;'")+">";innerHTML+=r.aryMonths[r.eO]; innerHTML+="</span>&nbsp;"; if(r.lY==2) U="onMouseOver";else if(r.lY==1) U="onClick"; innerHTML+="<span class='"+r.Zw+"-cl-header' "+U+"='return glbCalendars["+r.JJ+"].oh(event);' "+(U=="none"?"style='cursor:default;'":"style='cursor:hand;cursor:pointer;text-decoration:underline;'")+">";innerHTML+=r.BM;innerHTML+="</span>"; innerHTML+="</td>"; innerHTML+="<td align='right' class='"+r.Zw+"-cl-header' onMouseOver='glbCalendars["+r.JJ+"].nh(this);'>";innerHTML+="<img src='"+r.Oh+"/next.gif' border='0' onClick='window.event.returnValue=false;return false;' onMouseDown='glbCalendars["+r.JJ+"].Lo();return false;' style='cursor:hand;cursor:pointer;'>";innerHTML+="</td>"; innerHTML+="</tr>"; innerHTML+="<tr>"; innerHTML+="<td colspan=4 style='background-color:white;'>"; innerHTML+="<table cellspacing=0 cellpadding=0 border=0>"; if(r.EM){innerHTML+="<tr class='"+r.Zw+"-cl-days'>";for(var D=0;D<7;D++){innerHTML+="<td class='"+r.Zw+"-cl-day' onMouseOver='glbCalendars["+r.JJ+"].nh(this);' onMouseOut='glbCalendars["+r.JJ+"].Pj(this);'>";innerHTML+=r.aryDays[r.iG+D];innerHTML+="</td>";}innerHTML+="</tr>";} for(var f=1;f<42;){ innerHTML+="<tr>"; for(var a=0;a<7;++a,f++){s=r.aO[f-1+r.iG].toGMTString(); E=r.aO[f-1+r.iG].getMonth()==r.eO?"cl-on-month":"cl-off-month";  innerHTML+="<td class='"+r.Zw+"-"+E+"' onMouseOver='glbCalendars["+r.JJ+"].nh(this);' onMouseOut='glbCalendars["+r.JJ+"].Pj(this);' style='cursor: hand; cursor: pointer;' title='"+s+"' onClick='glbCalendars["+r.JJ+"].mg(this);'>"; innerHTML+=r.aO[f-1+r.iG].getDate(); innerHTML+="</td>";} innerHTML+="</tr>";}  innerHTML+="</table>"; innerHTML+="</td>"; innerHTML+="</tr>"; innerHTML+="</table>";return(innerHTML);}

function Fw(layerID,txt){if(document.getElementById){document.getElementById(layerID ).innerHTML=txt;r.NG();}else if(document.all){document.all[layerID].innerHTML=txt;}else if(document.layers){with(document.layers[layerID].document){open();write(txt );close();}}return null;}
function cV(A){var C=0;var L=0;if(!A) A=window.event;if(A.pageX||A.pageY){C=A.pageX;L=A.pageY;}else if(A.clientX||A.clientY){C=A.clientX+document.body.scrollLeft;L=A.clientY+document.body.scrollTop;}var rx={D:C,k:L};return rx;}
function lr(){if(r.sU){clearInterval(r.sU);r.sU=null;}r.sU=setInterval("glbCalendars["+r.JJ+"].qG()",r.qj );}
function Gw(){if(r.mH){clearInterval(r.mH);r.mH=null;}r.mH=setInterval("glbCalendars["+r.JJ+"].Yh()",4000 );r.lr();}
function Pv(){if(r.Fn){clearInterval(r.Fn);r.Fn=null;}r.Fn=setInterval("glbCalendars["+r.JJ+"].II()",4000 );r.lr();}
function tG(int_num){var rx;if(int_num<=9){rx=r.ak?"0"+int_num:int_num;}else rx=int_num;return rx;}
function NX(P,mouse_xy){var Na=S(P );var cu=I();if(Na["Xm"]+mouse_xy["D"]>cu["D"]) e.style.left=mouse_xy["D"]-Na["Xm"];else e.style.left=mouse_xy["D"];if(Na["pl"]+mouse_xy["k"]>cu["k"]) e.style.top=mouse_xy["k"]-Na["pl"];else e.style.top=mouse_xy["k"];}
function Tb(ghost,P){var Na=S(P );ghost.style.left=Na.D;ghost.style.top=Na.k;ghost.style.width=Na.Xm;ghost.style.height=Na.pl;ghost.style.zIndex=e.style.zIndex-5;ghost.style.filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';}
function wQ(P,mo){var RW=S(P );var Na=S(mo );var cu=I();var aY=RW["Xm"] / 2;var wT=Na["Xm"] / 2;var aI=RW["D"]-(wT-aY);var ub=RW["pl"]+RW["k"];mo.style.left=aI;if(ub+Na["pl"]>cu["k"]) mo.style.top=ub-Na["pl"];else mo.style.top=ub;}
function Mk(P,yr){var RW=S(P );var hH=S(yr );var cu=I();if(hH["Xm"]+RW["D"]+RW["Xm"]>cu["D"]) yr.style.left=cu["D"]-hH["Xm"];else yr.style.left=RW["D"]+RW["Xm"];if(hH["pl"]+RW["k"]>cu["k"]) yr.style.top=RW["k"];else yr.style.top=RW["k"];}var r;}
function m(){}        
function b(AG){this.ks=new Array();this.AF=new Array();this.xb=xb;this.jo=jo;xb(AG,this );
function xb(argStr,argConfig){var f,Oa;var QO,Pa;if(argStr) Oa=argStr.split(";");else return;var QO,uO,NL;for(f=0;f<Oa.length;f++){NL=Oa[f].indexOf(":");if(NL>0){QO=Oa[f].substring(0,NL).toUpperCase();Pa=Oa[f].substring(NL+1,Oa[f].length);if(Pa.toLowerCase()=="true") Pa=true;else if(Pa.toLowerCase()=="false") Pa=false;argConfig.AF[f]=QO;argConfig.ks[f]=Pa;}}}
function jo(argKey){var f;for(f=0;f<this.AF.length;f++){if(this.AF[f]==argKey){return this.ks[f];}}return null;}}
function l(Y){var rY={D:0,k:0};if(window.event){rY.D=event.clientX+document.body.scrollLeft;rY.k=event.clientY+document.body.scrollTop;}else if(Y){rY.D=Y.pageX;rY.k=Y.pageY;}for(var f=0;f<glbCalendars.length;f++){if(!B(rY,glbCalendars[f].Ro)&&!B(rY,glbCalendars[f].Rd)&&!B(rY,glbCalendars[f].Ek)){glbCalendars[f].qG();}glbCalendars[f].bC=false;}}
function B(Zn,Ro){if((Zn.D>Ro.D&&Zn.D<Ro.D+Ro.Xm)&&(Zn.k>Ro.k&&Zn.k<Ro.k+Ro.pl)) return true;return false;}
function S(js){var Wq={D:0,k:0,Xm:0,pl:0};if(js!=null){Wq.pl=js.offsetHeight;Wq.Xm=js.offsetWidth;while(js){Wq.D+=js.offsetLeft;Wq.k+=js.offsetTop;js=js.offsetParent;}return(Wq);}}
function I(){var Wq={D:0,k:0};Wq.D+=document.body.clientWidth;Wq.k+=document.body.clientHeight;return(Wq);} var OA="";if(document.getElementById&&document.all) OA="ie5";else if(document.getElementById&&!document.all) OA="ns6";else if(document.all) OA="ie4";else if(document.layers) OA="ns4";else OA="other";var Nt=9999;switch(OA){case "ie5":document.attachEvent('onclick',l );break;case "ns6":document.addEventListener('click',l,false );break;case "ns4":break;}
function u(A){if(typeof A=='undefined') A=window.event;if(typeof A.layerX=='undefined') A.layerX=A.offsetX;if(typeof A.layerY=='undefined') A.layerY=A.offsetY;return A;}
function G(){if(OA=="ie5"&&!window.opera){if(!document.getElementsByTagName("select")) qI=false;else qI=true;}else qI=false;}      
var glbCalendars=Array();var qI=Array();


</script>

</cfif>

<input name="#trim(fieldName)#" type="text">

<cfset stringName = "FIELD:document.#trim(formName)#.#trim(fieldName)#;SPANID:spanid_#trim(randRange)#;VERBIAGE:#trim(onclickVerbiage)#">

<script language="javascript">					
	var basicCal_#trim(randRange)# = new calendar("#trim(stringName)#"); 
	basicCal_#trim(randRange)#.writeCalendar();			
</script>	



</cfoutput>



