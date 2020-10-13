public class CustPriceInvoiceApx {
    @AuraEnabled
    public static list<Account> accountlist()
    {
        list<account> acc = [Select id,name from Account limit 5];
        return acc;
    }
    @AuraEnabled
    public static list<contact> contactlist(string accid)
    {
        list<contact> acc = [Select id,name from contact where Accountid=:accid limit 5];
        return acc;
    }

    @AuraEnabled
    public static list<wrapclass> oldsku (string custname )
    {
        list<OLD_SKU__c> oldsku = [Select id,name,Customer__c,Price__c from OLD_SKU__c where Customer__c=:custname];
        list<Salesrep_Adj_Price__c> salesrec =[Select id,Sku__c,Price__c,End_Date__c,Start_Date__c from Salesrep_Adj_Price__c where Customer__c=:custname];
        list<FIX_SKU__c> Fixsku = [select id,name,Price__c from FIX_SKU__c];
        list<wrapclass> wraplist = new list<wrapclass>();
        for(OLD_SKU__c old:oldsku)
        {
            wraplist.add(new wrapclass(old));
        }
        for(FIX_SKU__c old:Fixsku)
        {
            wraplist.add(new wrapclass(old));
        }
        for(Salesrep_Adj_Price__c old:salesrec)
        {
            wraplist.add(new wrapclass(old));
        }
        
        return wraplist;
    }
    
    @AuraEnabled
    public static list<wrapclass> finalmethod(object wrap)
    {
        String jsonstring = JSON.serialize(wrap);
        list<wrapclass> wrplist = new List<wrapclass>();
        //String jsonstring = JSON.serialize('[{"old":{"Id":"a0N6F00000RkQCBUA3","Name":"04","Customer__c":"0016F00002UR6x4QAD","Price__c":350},"oldcheck":false},{"old":{"Id":"a0N6F00000RkQBrUAN","Name":"10","Customer__c":"0016F00002UR6x4QAD","Price__c":302},"oldcheck":false},{"old":{"Id":"a0N6F00000RkQCLUA3","Name":"11","Customer__c":"0016F00002UR6x4QAD","Price__c":560},"oldcheck":false},{"old":{"Id":"a0N6F00000RkQC1UAN","Name":"01","Customer__c":"0016F00002UR6x4QAD","Price__c":586},"oldcheck":false},{"fix":{"Id":"a0M6F00000Qp0wGUAR","Name":"11","Price__c":320},"fixcheck":false},{"fix":{"Id":"a0M6F00000Qp0wHUAR","Name":"12","Price__c":500},"fixcheck":false},{"fix":{"Id":"a0M6F00000Qp0wLUAR","Name":"13","Price__c":301},"fixcheck":false},{"fix":{"Id":"a0M6F00000Qp0wQUAR","Name":"16","Price__c":568},"fixcheck":false},{"fix":{"Id":"a0M6F00000SBIRwUAP","Name":"1","Price__c":11},"fixcheck":false},{"fix":{"Id":"a0M6F00000SBIRxUAP","Name":"2","Price__c":22},"fixcheck":false},{"fix":{"Id":"a0M6F00000SBIRyUAP","Name":"3","Price__c":33},"fixcheck":false},{"fix":{"Id":"a0M6F00000SBIRzUAP","Name":"4","Price__c":44},"fixcheck":false},{"fix":{"Id":"a0M6F00000SBIS0UAP","Name":"5","Price__c":55},"fixcheck":false},{"fix":{"Id":"a0M6F00000SBIS1UAP","Name":"6","Price__c":66},"fixcheck":false},{"fix":{"Id":"a0M6F00000SBIS2UAP","Name":"7","Price__c":77},"fixcheck":false},{"sales":{"Id":"a0L6F00001EKbdyUAD","Sku__c":"03","Price__c":520,"End_Date__c":"2018-09-01","Start_Date__c":"2018-08-26"},"salescheck":true},{"sales":{"Id":"a0L6F00001EKbe8UAD","Sku__c":"04","Price__c":530,"End_Date__c":"2018-09-11","Start_Date__c":"2018-08-19"},"salescheck":false},{"sales":{"Id":"a0L6F00001EKbdZUAT","Sku__c":"02","Price__c":510,"End_Date__c":"2018-09-04","Start_Date__c":"2018-08-09"},"salescheck":false},{"sales":{"Id":"a0L6F00001EKbdPUAT","Sku__c":"01","Price__c":500,"End_Date__c":"2018-09-14","Start_Date__c":"2018-08-01"},"salescheck":false}]');
        //String ProperJSONString = jsonstring.substring(1, jsonstring.length() - 1);
        List<wrapclass> convertedData = (List<wrapclass>)JSON.deserialize(jsonstring,List<wrapclass>.Class); 
        list<OLD_SKU__c> oldskulist = new list<OLD_SKU__c>();
        for(wrapclass w:convertedData)
        {
            if(w.oldcheck== true && w.oldcheck != null )
            {
               wrplist.add(new wrapclass(w.old)); 
               oldskulist.add(w.old); 
            }
            if(w.salescheck== true && w.salescheck != null )
            {
               wrplist.add(new wrapclass(w.sales)); 
            }
            if(w.fixcheck== true && w.fixcheck != null)
            {
               wrplist.add(new wrapclass(w.fix)); 
            }
            
            
        }

        return wrplist;
    }
    
    public class wrapclass
    {
        @AuraEnabled
        public FIX_SKU__c fix{set;get;}
        @AuraEnabled
        public Salesrep_Adj_Price__c sales{set;get;}
        @AuraEnabled
        public OLD_SKU__c old{set;get;}
        @AuraEnabled
        public boolean oldcheck{set;get;}
        @AuraEnabled
        public boolean salescheck{set;get;}
        @AuraEnabled
        public boolean  fixcheck{set;get;}
        public wrapclass(FIX_SKU__c f)
        {
            fix = f;
            fixcheck = false;
        }
        public wrapclass(OLD_SKU__c o)
        {
            old = o;
            oldcheck = false;
        }
        public wrapclass(Salesrep_Adj_Price__c s)
        {
            sales = s;
            salescheck = false;
        }
        
    }
    
}