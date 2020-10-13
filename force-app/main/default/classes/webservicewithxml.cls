global class webservicewithxml {
    global void restweb()
    {
        Http htp = new http();
        httprequest req = new httprequest();
        req.setEndpoint('http://school.edusuiteondemand.us/PMS_Webservice.asmx/PMS_GETCustomerExcel');
        req.setMethod('GET');
        req.setTimeout(120000);
        HttpResponse res = htp.send(req);
        dom.Document doc = res.getbodydocument();
        dom.XmlNode root =doc.getrootelement();
        list<Rest_Record__c> restobj =new list<Rest_Record__c>(); 
        for(dom.XmlNode abc:root.getChildElements())
        {
            string customername = abc.getChildElement('AccountName',null).getText();
            string CustomerNumber = abc.getChildElement('AccountNumber',null).getText();
            string address = abc.getChildElement('Address',null).getText();
            string phone = abc.getChildElement('Phone',null).getText();
            restobj.add(new Rest_Record__c(name = customername,Customer_Number__c = decimal.valueof(customerNumber),Address__c =Address,Phone__c =Phone));
            
        }
        insert restobj;
        
        
    }

}