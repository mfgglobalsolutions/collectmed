
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import javax.xml.transform.stream.*;

public class xsltTransformer {

	public String xsltTransform(String xmlFile, String xsltFile) throws Exception{
		
		/*System.setProperty("javax.xml.transform.TransformerFactory", "net.sf.saxon.TransformerFactoryImpl");*/
        StreamSource styleSource = new StreamSource(new StringReader(xsltFile), "file:///C:/collectmed/collectmed1.0/");
        javax.xml.transform.TransformerFactory trans = javax.xml.transform.TransformerFactory.newInstance();
        javax.xml.transform.Transformer xformer = trans.newTransformer(styleSource);
        Writer outWriter = new StringWriter();
        xformer.transform(new StreamSource( new StringReader(xmlFile)), new StreamResult(outWriter));
        return outWriter.toString();
        
	}

}
