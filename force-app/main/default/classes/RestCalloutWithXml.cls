global class RestCalloutWithXml {

    global void fun()
    {
        http htp =new http();
        httpRequest req = new httpRequest();
        req.setEndpoint('http://school.edusuiteondemand.us/PMS_Webservice.asmx/PMS_GETCustomerExcel');
        req.setMethod('GET');
        req.setTimeout(120000);
        HttpResponse res = htp.send(req);
        //system.debug(res);
        dom.Document doc = res.getbodyDocument();   
		dom.XmlNode Root = doc.getRootElement(); 
        list<Rest_Record__c> mer = new list<Rest_Record__c>(); 
        for(dom.XmlNode subchild : root.getChildElements())
        {
            string customername = subchild.getChildElement('AccountName',null).getText();
            Decimal CustomerNumber = Decimal.valueOf(subchild.getChildElement('AccountNumber',null).getText());
            string Address = subchild.getChildElement('Address',null).getText();
            string Phoneno = (subchild.getChildElement('Phone', null).getText());
            mer.add(new Rest_Record__c(name = customername,Customer_Number__c = CustomerNumber,Address__c =Address,Phone__c =Phoneno));
        }
       insert mer;
    }
}