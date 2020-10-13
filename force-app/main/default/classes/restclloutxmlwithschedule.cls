global class restclloutxmlwithschedule  implements Database.Batchable<sObject>, Database.AllowsCallouts {
    public list<Rest_Record__c> start(database.BatchableContext Bc)
    {
        http htp = new http();
        HttpRequest Req = new HttpRequest();
        req.setEndpoint('http://school.edusuiteondemand.us/PMS_Webservice.asmx/PMS_GETCustomerExcel');
        req.setMethod('GET');
        req.setTimeout(120000);
        HttpResponse res = htp.send(Req);
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
        return mer;
    }
	public void execute(database.BatchableContext Bc,List<Rest_Record__c> scope )
    {
        insert scope;
        system.debug('hello');
    }
    public void finish(Database.BatchableContext BC)
    {
        
    }
    
    
}