public class PricingSubspricesubsapx {
    public string customer{set;get;}
    public list<wrap> wraplist{set;get;}
    public list<wrap> oldskulist{set;get;}
    Public list<wrap> fixskulist{set;get;}
    public list<wrap> finalList{Set;get;}
    
public PricingSubspricesubsapx( ApexPages.StandardController controller)
{
    
}
    public PricingSubspricesubsapx()
    {}
    public class wrap
    {
       public Salesrep_Adj_Price__c salesrep {get;set;}
        public boolean salesrepcheck{set;get;}
        public boolean oldcheck{set;get;}
        public boolean fixcheck{set;get;}
        public OLD_SKU__c oldsku {set;get;}
        public FIX_SKU__c fixsku {set;get;}
        
        public string name {set;get;}
        public string price {set;get;}
        
        public wrap(Salesrep_Adj_Price__c rep)
        {
           salesrep = rep; 
           salesrepcheck =false;
           name = rep.Sku__c;
            price = string.valueOf(rep.Price__c) ;
        }
        public wrap(OLD_SKU__c old)
        {
            oldsku = old;
            oldcheck =false;
            name = old.name;
            price =string.valueOf(old.Price__c) ;
        }
        public wrap(FIX_SKU__c fix)
        {
            fixsku = fix;
            fixcheck =false;
            name = fix.name;
            price = string.valueOf(fix.price__c);
        }
    }
    
    public List<selectoption> getcustomerlist()
    {
        list<selectoption> acc =new list<selectoption>();
        acc.add(new selectoption ('','-----select----'));
        list<account> a = [select id, name from Account];
        for(account ac:a)
        {
            acc.add(new selectoption(ac.id,ac.name));
        }
        return acc;
    }
    public void nxtbtn()
    {
       wraplist = new list<Wrap>();
        list <string> skulistforsalesrep =new list<string>();
		 list<Salesrep_Adj_Price__c> rec =[select sku__c,name,price__c,Customer__c,Start_date__c,End_date__c from Salesrep_Adj_Price__c 
                                          where customer__c =:Customer   ];
		for(Salesrep_Adj_Price__c ab :rec)
        {
           wraplist.add(new wrap(ab));
            skulistforsalesrep.add(ab.Sku__c);
        }
        
        oldskulist = new list<wrap>();
        list<OLD_SKU__c> oldsku = [select id,name,Customer__c,price__c from OLD_SKU__c where customer__C=:Customer];
        map<string,id> map1 = new map<string,id>();
        for(OLD_SKU__c ol:oldsku)
        {
            map1.put(ol.name,ol.id);
        }
        list<OLD_SKU__c> oldskulistrec =[select id,name,Customer__c,price__c from OLD_SKU__c where customer__C=:Customer
                                     and id in :map1.values() and name not in :skulistforsalesrep];
        list<string> oldsku2 = new list<string>();
        for(OLD_SKU__c ab :oldskulistrec)
        {
           oldskulist.add(new wrap(ab));
            oldsku2.add(ab.name);
        }
        fixskulist = new list<wrap>();
        list<FIX_SKU__c> fixsku2 = [select name,price__c from FIX_SKU__c where name not in:oldsku2 ];
        for(FIX_SKU__c f :fixsku2)
        {
            fixskulist.add(new wrap(f));
        }
        
    }
    
    public void Finallistbtn()
    {
       finalList = new list<wrap>();
       for(wrap fix: fixskulist)
       {
           if(fix.fixcheck == true)
           {
               finalList.add(fix);
           }
       }
        for(wrap fix: oldskulist)
       {
           if(fix.oldcheck == true)
           {
               finalList.add(fix);
           }
       }
        
        for(wrap fix: wraplist)
       {
           if(fix.Salesrepcheck == true)
           {
               finalList.add(fix);
           }
       }
    }
}