@istest
public class testclassforpricingcustpricesubs {

    static testMethod void runPositiveTestCases()  
    {
        list<Salesrep_Adj_Price__c> sales = new list<Salesrep_Adj_Price__c>();
        for(integer i=0;i<10 ;i++)
        {
            Salesrep_Adj_Price__c salesrep = new Salesrep_Adj_Price__c(sku__c ='10'+i, price__c = 150);
            sales.add(salesrep);
        }
        
        list<OLD_SKU__c> old = new list<OLD_SKU__c>();
        for(integer i=0;i<10 ;i++)
        {
            OLD_SKU__c oldsku = new OLD_SKU__c(name ='12'+i, price__c = 180);
            old.add(oldsku);
        }
        
        list<FIX_SKU__c> fix = new list<FIX_SKU__c>();
        for(integer i=0;i<10 ;i++)
        {
            FIX_SKU__c fixsku = new FIX_SKU__c(name ='115'+i, price__c = 200);
            fix.add(fixsku);
        }
        
        Salesrep_Adj_Price__c a = new Salesrep_Adj_Price__c();
        PricingSubspricesubsapx abc = new PricingSubspricesubsapx();
        abc.nxtbtn();
        abc.Finallistbtn();
    }

}