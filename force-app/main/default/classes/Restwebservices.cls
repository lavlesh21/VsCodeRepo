global  class Restwebservices {
    
    public void fun()
    {
        http htp = new http();
        httprequest req = new httprequest();
        req.setEndpoint('http://school.edusuiteondemand.us/PMS_Webservice.asmx/PMS_GETCustomerExcel');
        req.setMethod('GET');
        
        req.setTimeout(120000);
        httpresponse res = htp.send(req);
        dom.Document doc = res.getbodyDocument();   
		dom.XmlNode Root = doc.getRootElement();
        system.debug('RootRoot'+Root);
    }
    

}