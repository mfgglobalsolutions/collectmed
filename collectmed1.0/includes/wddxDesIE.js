// WDDX Deserializer (see www.wddx.org) for IE4+ clients,
// utilizing Microsoft's "msxml" ActiveX DOM parser. Can be
// used instead of WddxDes.js in IE4/5 (Windows 95/98/NT only) 
// ======================================================
// Filename: WddxDesN.js
// Author:   Nate Weiss (nweiss@icesinc.com)
// Date:     Aug 3, 1999 (first attempt)
// To-do:    Timezone handling in parseDateFromString function

// Note that the IE4 version of deserialize() creates a reference to the 
// FileSystemObject included in Microsoft's "Scripting Run-Time Library", which
// is not generally on IE4 boxes, even on Win32 platforms, for security reasons.
// To ensure that a particular machine has it, you could include this on the page:
// <OBJECT WIDTH=0 HEIGHT=0 CLASSid="CLSID:0D43FE01-F093-11CF-8940-00A0C9054228" CODEBASE="http://msdn.microsoft.com/scripting/scrrun/x86/srt31en.cab#version=3,1,0,2230"></OBJECT>
// See www.microsoft.com/scripting for details.  



// **** main public function to deserialize a WDDX Packet, given a URL ***** //
function wddxDeserializer_deserializeUrlIE4(PacketUrl) {
  var data='';

  // Construct url query-strng from urlData property-object
  bAdded=false;
  if (typeof(this.urlData) == 'object') {
    for (prop in this.urlData) {
      data += (bAdded == false ? '?' : '&') + escape(prop.toString()) + '=' + escape(this.urlData[prop].toString());
      bAdded=true;
    };
  };
  
  // Instantiate Microsoft XML parser and tell it to fetch the packet
  this.xml.url=PacketUrl + data;

  // Clear the urlData property-object for next time
  this.urlData=new Object;

  // What's our default var case for struct elements?
  this.varCaseToUpper=(this.defaultVarCase.toLowerCase() != 'lower');

  // Set topLevelDatatype property to null by default
  this.topLevelDatatype=null;   

  // Calculate hours/minutes for this deserializer's timezoneOffset property
  this.timezoneOffsetHours  =Math.round(this.timezoneOffset/60);
  this.timezoneOffsetMinutes=(this.timezoneOffset % 60);

  // Assuming we indeed have a WDDX Packet, find its top-level element and deserialize 
  // that with the "AnyElement" function, which should do recursive calls until done.
  if (this.xml.root.tagName == 'WDDXPACKET') {
    var dataRoot=this.xml.root.children.item("DATA");
    var elTopLevel=dataRoot.children.item(0);
    this.topLevelDatatype=elTopLevel.tagName.toLowerCase();

    if (this.parseActualData == true)
      return this.deserializeAnyElement(elTopLevel);  
    else return null;  
  }
  else return null;  // ostensibly because we got some other kind of XML (not WDDX)
};



function wddxDeserializer_deserializeIE4(Packet) {

  // Create reference to the FileSystemObject runtime object
  fso=new ActiveXObject("Scripting.FileSystemObject");

  // Make up a temporary filename that we can write the packet to
  strFile=fso.GetSpecialFolder(2).Path + '\\' + fso.GetTempName();

  // Actually create the file, write the packet to the file, and close it
  tmpFile=fso.CreateTextFile(strFile, true);
  tmpFile.Write(Packet);
  tmpFile.Close();

  // Deserialize the packet by passing the temp filename as a URL  
  // IE will insist that "allow unsafe controls to run" be set to enabled,
  // or else an "Access Denied" message will appear. 
  result=this.deserializeUrl('file://' + strFile);

  // Now we can delete the temp file, and return the result to the caller
  fso.DeleteFile(strFile);
  return result;
};


function wddxDeserializer_deserializeUrlIE5(url) {
  var data='';

  // Construct url query-strng from urlData property-object
  bAdded=false;
  if (typeof(this.urlData) == 'object') {
    for (prop in this.urlData) {
      data += (bAdded == false ? '?' : '&') + escape(prop.toString()) + '=' + escape(this.urlData[prop].toString());
      bAdded=true;
    };
  };
      
  // Tell Microsoft XML parser to fetch the packet
  this.xml.load(url + data);

  // Clear the urlData property-object for next time
  this.urlData=new Object;

  return this.deserializeStart();
};

function wddxDeserializer_deserializeIE5(Packet) {
  // Tell Microsoft XML parser to parse the packet
  this.xml.loadXML(Packet);
  return this.deserializeStart();
};


function wddxDeserializer_deserializeIE5_Start() {

  // What's our default var case for struct elements?
  this.varCaseToUpper=(this.defaultVarCase.toLowerCase() != 'lower');

  // Set topLevelDatatype property to null by defalt
  this.topLevelDatatype=null;   

  // Calculate hours/minutes for this deserializer's timezoneOffset property
  this.timezoneOffsetHours  =Math.round(this.timezoneOffset/60);
  this.timezoneOffsetMinutes=(this.timezoneOffset % 60);

  // Assuming we indeed have a WDDX Packet, find its top-level element and deserialize 
  // that with the "AnyElement" function, which should do recursive calls until done.
  if ( (this.xml.documentElement != null) && (this.xml.documentElement.tagName == 'wddxPacket') ) {

    var dataRoot=this.xml.documentElement.getElementsByTagName("data");

    var elTopLevel=dataRoot[0].firstChild;
    this.topLevelDatatype=elTopLevel.tagName.toLowerCase();    
    
    if (this.parseActualData == true)
      return this.deserializeAnyElement(elTopLevel);  
    else return null;  
  }
  else return null;  // because we got some other kind of XML document (not WDDX)

};


// **** private function to deserialize any element in a WDDX document tree ****
// Simply decides which of the following functions to call for the element
function wddxDeserializer_deserializeIE_anyElement(elem) {

  switch ( elem.tagName.toLowerCase() ) {
    case 'recordset' : {
      return this.deserializeRecordset(elem);
      break;   
    };

    case 'array' : {
      return this.deserializeArray(elem);
      break;   
    };

    case 'struct' : {
      return this.deserializeStruct(elem);
      break;   
    };

    case 'binary' : {  //{nmw 10/1/99}
      var Bin=new WddxBinary;
      Bin.encoding=( typeof(elem.getAttribute('encoding')) == 'string') ? elem.getAttribute('encoding') : 'base64';
      
      if (this.preserveBinaryData) {
        Bin.data=( typeof(elem.text) == 'string')  ? elem.text : '';         
      };
        
      return Bin;
      break;   
    };

    default : {
      return this.deserializeSimple(elem);
      break;
    };  
  };

};


// **** private function to deserialize a simply-typed element ****
function wddxDeserializer_deserializeIE4_simple(elem) {
  var result=null;

  switch ( elem.tagName.toLowerCase() ) {
    case 'string'  : { 
      // if the string is "simple" (no embedded <char> elements)
      if (elem.children.length <= 1) 
        result=elem.text;

      // if the string has one or more <char> elements
      else {
        var i, thisPart;
        result='';
     
        for (var i=0; i < elem.children.length; i++) {
          thisPart=elem.children.item(i);
        
          if (thisPart.type == 1)
            result=result + thisPart.text;
          else
            if (thisPart.tagName="CHAR")
              result=result + String.fromCharCode( parseInt('0x' + thisPart.getAttribute("CODE")) );
        };
      };  

      break; 
    };

    
    case 'null' : { //{nmw 10/1/99}
      result=null;
      break;
    };
    
    case 'boolean' : { 
      result=(elem.text.toLowerCase() == 'true'); 
      break; 
    };
    
    case 'number'  : { 
      result=parseFloat(elem.text);
      break; 
    };

    case 'datetime': { 
      result=this.parseDateFromString(elem.text); 
      break;
    };
  };

  return result;
};



// **** private function to deserialize a simply-typed element ****
function wddxDeserializer_deserializeIE5_simple(elem) {
  var result=null;

  switch ( elem.tagName.toLowerCase() ) {
    case 'string'  : { 
      // if the string is "simple" (no embedded <char> elements)
      if (elem.childNodes.length <= 1) 
        result=elem.text;

      // if the string has one or more <char> elements
      else {
        var i, thisPart;
        result='';
     
        for (var i=0; i < elem.childNodes.length; i++) {
          thisPart=elem.childNodes[i];

          if (thisPart.nodeType == 3)
            result=result + thisPart.nodeValue;
          else
            if (thisPart.tagName == "char")
              result=result + String.fromCharCode( parseInt('0x' + thisPart.getAttribute("code")) );
        };
      };  

      break; 
    };

    case 'boolean' : { 
      result=(elem.text.toLowerCase() == 'true'); 
      break; 
    };
    
    case 'number'  : { 
      result=parseFloat(elem.text);
      break; 
    };

    case 'datetime': { 
      result=this.parseDateFromString(elem.text); 
      break;
    };
  };

  return result;
};




// *** Helper function that returns date object from WDDX-style <dateTime> string value
function wddxDeserializer_parseDateFromString(strDate) {
  var iHour=0, iMin=0, iSec=0;

  // Separate date string into various parts
  var arMainParts=strDate.split('T');         // general date vs time parts
  var arDateParts=arMainParts[0].split('-');  // parts of date part (year, month, day)

  // If a time part was included
  if (arMainParts.length > 1) {
    var offsetIsNegative=(arMainParts[1].indexOf('-') > -1);
    var arTimeSections=offsetIsNegative ? arMainParts[1].split('-') : arMainParts[1].split('+');  // time vs timezone parts
    var arTimeParts=arTimeSections[0].split(':');  // parts of time part (hour, min, sec)

    // Parse elements of the time part into integers (all default to 0)
    if (arTimeParts.length > 0)  iHour=parseInt(arTimeParts[0]);
    if (arTimeParts.length > 1)  iMin= parseInt(arTimeParts[1]);
    if (arTimeParts.length > 2)  iSec= parseInt(arTimeParts[2]);
  }

  // Create actual JS date object
  var NewDate=new Date( parseInt(arDateParts[0]), parseInt(arDateParts[1]) - 1, parseInt(arDateParts[2]), iHour, iMin, iSec, 0 );

  // Time zone handling 
  // note: seems like IE4's "setUTC" functions can help us here (but how?)
  if ( this.useTimezoneInfo && (arTimeSections.length > 1) ) {
    var dtTZParts=arTimeSections[1].split(':'); // hour vs. minutes parts
    var dtOffsetHours=parseInt(dtTZParts[0]);
    var dtOffsetMins= dtTZParts.length > 1 ? parseInt(dtTZParts[1]) : 0;  

    if (offsetIsNegative) {
      dtOffsetHours=this.timezoneOffsetHours - dtOffsetHours;
      dtOffsetMins =this.timezoneOffsetMinutes - dtOffsetMins;
    } else {
      dtOffsetHours=this.timezoneOffsetHours + dtOffsetHours;
      dtOffsetMins =this.timezoneOffsetMinutes + dtOffsetMins;
    }
    NewDate.setHours(NewDate.getHours() - dtOffsetHours);
    NewDate.setMinutes(NewDate.getMinutes() - dtOffsetMins);  
  };

  return NewDate;
};


// *** private function to deserialize a <recordset> element
function wddxDeserializer_deserializeIE4_recordset(elem) {
  // Local variables
  var i, j, arColNames, cltFields, iRowCount, rs, eleThisF;
  rs=new WddxRecordset;
 
  // Get field names and rowcount from element's attributes
  arColNames=elem.getAttribute("FIELDNAMES").split(',');
  iRowCount=parseInt(elem.getAttribute("ROWCOUNT"));
  
  // For each column name, add actual column to WddxRecordset
  for (i=0; i < arColNames.length; i++)
    rs.addColumn( arColNames[i].toLowerCase() );

  // Get a collection of <field> elements in this <recordset>     
  cltFields=elem.children.item("FIELD");

  // For each <field> element    
  for (i=0; i < cltFields.length; i++) {
    // Get the name of the "current" field 
    eleThisF=cltFields.item(i);
    strThisF=eleThisF.getAttribute("NAME").toLowerCase();
    
    // for each value (row) in this field (column)
    for (j=0; j < iRowCount; j++)
      rs.setField( j, strThisF, this.deserializeSimple(eleThisF.children.item(j)) );
      
  }

  // return finished recordset to calling process
  return rs;
};


// *** private function to deserialize an <array> element
function wddxDeserializer_deserializeIE4_array(elem) {

  // Local variables
  var i;
  var ar=new Array;
  
  // For each <var> element, deserialize its first child
  for (i=0; i < elem.children.length; i++)
    ar[i]=this.deserializeAnyElement( elem.children.item(i) );

  return ar;
}


// *** private function to deserialize a <struct> element
function wddxDeserializer_deserializeIE4_struct(elem) {

  // Local variables
  var i, eleThisProp, strThisProp;
  var obj=new Object;
  
  for (i=0; i < elem.children.length; i++) {
    eleThisProp=elem.children.item(i);
    strThisProp=(this.preserveVarCase == true) ? eleThisProp.getAttribute("NAME") : (this.varCaseToUpper == true) ? eleThisProp.getAttribute("NAME").toUpperCase() : eleThisProp.getAttribute("NAME").toLowerCase();
    
    obj[ strThisProp ]=this.deserializeAnyElement( eleThisProp.children.item(0) );
  }  
    
  return obj;
}





// *** private function to deserialize a <recordset> element
function wddxDeserializer_deserializeIE5_recordset(elem) {
  // Local variables
  var i, j, arColNames, cltFields, iRowCount, rs, eleThisF;
  rs=new WddxRecordset;
  
  // Get field names and rowcount from element's attributes
  arColNames=elem.getAttribute("fieldNames").split(',');
  iRowCount=parseInt(elem.getAttribute("rowCount"));
  
  // For each column name, add actual column to WddxRecordset
  for (i=0; i < arColNames.length; i++)
    rs.addColumn( arColNames[i].toLowerCase() );

  // Get a collection of <field> elements in this <recordset>     
  cltFields=elem.getElementsByTagName("field");

  // For each <field> element    
  for (i=0; i < cltFields.length; i++) {
    // Get the name of the "current" field 
    eleThisF=cltFields[i];
    strThisF=eleThisF.getAttribute("name").toLowerCase();
    
    // for each value (row) in this field (column)
    for (j=0; j < iRowCount; j++)
      rs.setField( j, strThisF, this.deserializeSimple(eleThisF.childNodes[j]) );
      
  }

  // return finished recordset to calling process
  return rs;
};


// *** private function to deserialize an <array> element
function wddxDeserializer_deserializeIE5_array(elem) {

  // Local variables
  var i;
  var ar=new Array;
  
  // For each child element in array, deserialize it
  for (i=0; i < elem.childNodes.length; i++)
    ar[i]=this.deserializeAnyElement( elem.childNodes[i] );

  return ar;
}


// *** private function to deserialize a <struct> element
function wddxDeserializer_deserializeIE5_struct(elem) {

  // Local variables
  var i, eleThisProp, strThisProp;
  var obj=new Object;

  var nlVars=elem.getElementsByTagName('var');
  
  for (i=0; i < nlVars.length; i++) {
    eleThisProp=nlVars[i];
    strThisProp=(this.preserveVarCase == true) ? eleThisProp.getAttribute("name") : (this.varCaseToUpper == true) ? eleThisProp.getAttribute("name").toUpperCase() :  eleThisProp.getAttribute("name").toLowerCase();

    obj[ strThisProp ]=this.deserializeAnyElement( eleThisProp.firstChild );
  }  
    
  return obj;
}






// return Microsoft Internet Explorer (major) version number, or 0 for others.
function msieversion() {
  var ua=window.navigator.userAgent
  var msie=ua.indexOf ( "MSIE " )
  if ( msie > 0 )  return parseInt ( ua.substring ( msie+5, ua.indexOf ( ".", msie ) ) )
  else return 0          
};


function returnNull() {
  return null;
};


// *** Now that all functions have been declared, we can assemble our object
// This function becomes WddxDeserializer's constructor
function WddxDeserializerForIE() {

  // By default, do not preserve case of "name" 
  // attributes in <var> tags
  this.preserveVarCase=false;
  this.defaultVarCase ='upper';
  
  // By default, don't get the DATA from <binary> elements 
  this.preserveBinaryData=true;
  
  // By default, ignore timezone info
  this.useTimezoneInfo=false;

  // Use current timezone as default when deserializing  
  // (relevant only if useTimezoneInfo gets set to true)  
  var TempDate=new Date;
  this.timezoneOffset=TempDate.getTimezoneOffset();
  
  // Set topLevelDatatype property to null by default
  this.topLevelDatatype=null;
  this.parseActualData =true;  

  this.urlData=new Object;


  // Make sure IE is being used, and get the major version number (4 or 5)
  var ieVer=msieversion();
  if (ieVer >= 4 && window.navigator.platform == 'Win32') {

    // Decide whether to use IE5 version of the XML parser throughout
    var isIE5=arguments.length > 0 ? (arguments[0] == true) : (ieVer >= 5);

    // *** USE IE5 VERSION OF PARSER
    if (isIE5) {

      // Instantiate Microsoft XML parser
      this.xml=new ActiveXObject("Microsoft.XMLDOM");
      this.xml.async=false;

      // Hook up IE5-specific routines to object
      this.deserialize=wddxDeserializer_deserializeIE5;
      this.deserializeUrl=wddxDeserializer_deserializeUrlIE5;
      this.deserializeStart=wddxDeserializer_deserializeIE5_Start;
      this.deserializeSimple=wddxDeserializer_deserializeIE5_simple;
      this.deserializeRecordset=wddxDeserializer_deserializeIE5_recordset;
      this.deserializeArray=wddxDeserializer_deserializeIE5_array;
      this.deserializeStruct=wddxDeserializer_deserializeIE5_struct;
      
      // Set implementation flag      
      this.implementation='IE 5';

      // Discard IE4-specific stuff from memory
      wddxDeserializer_deserializeIE4=null;
      wddxDeserializer_deserializeUrlIE4=null;
      wddxDeserializer_deserializeIE4_simple=null;
      wddxDeserializer_deserializeIE4_recordset=null;
      wddxDeserializer_deserializeIE4_array=null;
      wddxDeserializer_deserializeIE4_struct=null;

      
    // *** USE IE4 VERSION OF PARSER
    } else {
    
      // Instantiate Microsoft XML parser 
      this.xml=new ActiveXObject("msxml");
    
      // Hook up IE4-specific routines to object
      this.deserialize=wddxDeserializer_deserializeIE4;
      this.deserializeUrl=wddxDeserializer_deserializeUrlIE4;
      this.deserializeSimple=wddxDeserializer_deserializeIE4_simple;
      this.deserializeRecordset=wddxDeserializer_deserializeIE4_recordset;
      this.deserializeArray=wddxDeserializer_deserializeIE4_array;
      this.deserializeStruct=wddxDeserializer_deserializeIE4_struct;

      // Set implementation flag      
      this.implementation='IE 4';

      // Discard IE5-specific stuff from memory
      wddxDeserializer_deserializeIE5=null;
      wddxDeserializer_deserializeUrlIE5=null;
      wddxDeserializer_deserializeIE5_simple=null;
      wddxDeserializer_deserializeIE5_recordset=null;
      wddxDeserializer_deserializeIE5_array=null;
      wddxDeserializer_deserializeIE5_struct=null;

    };

    // Hook up common routines to object
    this.deserializeAnyElement=wddxDeserializer_deserializeIE_anyElement;
    this.parseDateFromString=wddxDeserializer_parseDateFromString;
  
  
  } else {
    this.deserialize=returnNull;
    this.deserializeUrl=returnNull;
  
  };
};

  // Make sure IE is being used, and get the major version number (4 or 5)
  var ieVer=msieversion();
  if (ieVer >= 4 && window.navigator.platform == 'Win32')
    WddxDeserializer=WddxDeserializerForIE;