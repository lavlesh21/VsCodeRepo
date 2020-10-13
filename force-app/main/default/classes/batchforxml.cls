global class batchforxml implements Database.Batchable<sObject>, Database.AllowsCallouts,Database.Stateful {
    
    global list<Rest_Record__c> start(Database.BatchableContext BC)
    {
        http htp = new http();
        httprequest req = new httprequest();
        req.setEndpoint('http://school.edusuiteondemand.us/PMS_Webservice.asmx/PMS_GETCustomerExcel');
        req.setMethod('GET');
        req.setTimeout(120000);
        httpresponse res =htp.send(req);
        dom.Document doc = res.getbodydocument();
        dom.XmlNode root = doc.getrootelement();
        list<Rest_Record__c> restobj =new list<Rest_Record__c>(); 
        for(dom.XmlNode abc:root.getChildElements())
        {
            string customername = abc.getChildElement('AccountName',null).getText();
            string CustomerNumber = abc.getChildElement('AccountNumber',null).getText();
            string address = abc.getChildElement('Address',null).getText();
            string phone = abc.getChildElement('Phone',null).getText();
            restobj.add(new Rest_Record__c(name = customername,Customer_Number__c = decimal.valueof(customerNumber),Address__c =Address,Phone__c =Phone));
            
        }
        restcalloutwithjson a = new restcalloutwithjson();
        system.debug('start'+a.fun());
        return restobj;
        
    }
    global void execute(Database.BatchableContext BC, List<Rest_Record__c> scope)
    {
        list<Rest_Record__c> restobj1 =new list<Rest_Record__c>();
        for(Rest_Record__c rec : scope)
        {
            restobj1.add(rec);
        }
       // insert restobj1;
        
      Database.SaveResult[] srList = Database.insert(restobj1, false);


for (Database.SaveResult sr : srList) {
    if (sr.isSuccess()) {
       
        System.debug('Successfully inserted account. Account ID: ' + sr.getId());
    }
    else {
                      
        for(Database.Error err : sr.getErrors()) {
            System.debug('The following error has occurred.');                    
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Account fields that affected this error: ' + err.getFields());
        }
    }
        
    }    
      restcalloutwithjson a = new restcalloutwithjson();
        system.debug('exe   '+a.fun());  
    }    
  
    global void finish(Database.BatchableContext BC)
    {
batchforxml ab = new batchforxml();
        database.executeBatch(ab);       
    }

}