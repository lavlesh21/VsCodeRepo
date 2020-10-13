public class PricingAppapx {
    public string customer{set;get;}
	public Salesrep_Adj_Price__c std;
    public list<wrap> oldsuklist{set;get;}
    public list<Wrap> selesrec {get;set;}
    public PricingAppapx(ApexPages.StandardController controller)
    {
        std =(Salesrep_Adj_Price__c) controller.getRecord();
    }
    public list<selectoption> getallcustomer()
    {
       List<SelectOption> Cust= new List<SelectOption>();
        Cust.add( new SelectOption('','--Select--'));
        for( account acc : [select id, name from account order by createdDate DESC] ) {
            Cust.add( new SelectOption(acc.id,acc.name));
        }
          
        return Cust;
    }
    public class Wrap
    {
        public Salesrep_Adj_Price__c acc{set;get;}
        public wrap(Salesrep_Adj_Price__c a) 
       {
         acc = a;  
       }
    }
    
    public void savebtn()
    {
        selesrec = new list<Wrap>();
        list<Salesrep_Adj_Price__c> rec1 = [select name,id,Customer__c,Price__c,Sku__c,Start_Date__c,End_Date__c from Salesrep_Adj_Price__c where Customer__c=:customer ];
    	for( Salesrep_Adj_Price__c a :rec1)
        {
            selesrec.add(new wrap(a));
        }
        oldsuklist = new list<Wrap>();
        list<OLD_SKU__c> oldsku = [select id,name,Customer__c,price__c from OLD_SKU__c where customer__C=:Customer];
        map<string,id > mapforold =  new map<string,id>();
        for(OLD_SKU__c old :oldsku)
        {
            mapforold.put(old.name,old.id);
        }
    }
}