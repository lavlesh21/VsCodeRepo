public class CustPriceSubspax {
    public string Customer{set;get;}
    public list<wrap> salesrec{set;get;}
    public list<wrap> oldsuklist{set;get;}
    public list<wrap> fixskulist{set;get;}
    public list<wrap> finallist {set;get;}
    public boolean secblock{set;get;}
    public  Salesrep_Adj_Price__c rec;
    public date  date2{set;get;}
    
    public CustPriceSubspax(ApexPages.StandardController controller)
    {
        secblock  =false;
        this.rec = (Salesrep_Adj_Price__c) controller.getRecord();
        system.debug('two');
    }
    
    
    public class wrap
    {
      public Salesrep_Adj_Price__c acc{set;get;} 
      public OLD_SKU__c old{set;get;}
      public fix_sku__c fix{set;get;}  
      public boolean salescheck{set;get;} 
      public boolean oldcheck{set;get;}  
      public boolean fixcheck{set;get;} 
      public string sku{set;get;}  
      public wrap(Salesrep_Adj_Price__c a)
      {
          acc =a;
          sku= a.sku__c;
          salescheck= false;
      }
      public wrap(OLD_SKU__c o)
      {
        old =o; 
        sku= o.Name;
        oldcheck=false;
      }
      public wrap(Fix_SKU__c f)
      {
        fixcheck = false;
        sku =f.name;  
        fix =f;  
      }  
        
    }
    
    
    public list<SelectOption> getAccountCustomer() {    
        List<SelectOption> Cust= new List<SelectOption>();
        Cust.add( new SelectOption('','--Select--'));
        for( account acc : [select id, name from account order by createdDate DESC] ) {
            Cust.add( new SelectOption(acc.id,acc.name));
        }
          
        return Cust;
    }
    public void  go()
    {
        system.debug('rec-->'+ rec.Start_Date__c);
        secblock= true;
    	salesrec = new list<wrap>();
        list<string> sku1 = new list<string>(); 
    	list<Salesrep_Adj_Price__c> rec =[select sku__c,name,price__c,Customer__c,Start_date__c,End_date__c from Salesrep_Adj_Price__c where customer__c =:Customer 
                                          ];
     	for(Salesrep_Adj_Price__c abc: rec) 
     	{
        	 salesrec.add(new wrap(abc));
             sku1.add(abc.sku__c);
     	}
        
        oldsuklist = new list<Wrap>();
        list<string> oldsku2 =new list<string>();
        list<OLD_SKU__c> oldsku = [select id,name,Customer__c,price__c from OLD_SKU__c where customer__C=:Customer]; 
        Map<String,id> maplist1 = new map<string,id>();
        for(OLD_SKU__c ol:oldsku)
        {
           maplist1.put(ol.name,ol.id); 
        }
        list<OLD_SKU__c> oldskulist =[select name,Customer__c,price__c from OLD_SKU__c where customer__C=:Customer and id in:maplist1.values()  and name not in:sku1 ];
        for(OLD_SKU__c o : oldskulist)
        {
           oldsuklist.add(new wrap(o));
            oldsku2.add(o.Name);
        }
        
        fixskulist = new list<wrap>();
        list<FIX_SKU__c> fixsku =[select id,name,price__C from FIX_SKU__c ];
        map<string,id> map2= new map<string,id>();
        for(FIX_SKU__c m : fixsku)
        {
            map2.put(m.Name,m.id);
        }
        list<FIX_SKU__c> fixsku2 = [select name,price__c from FIX_SKU__c where id in:map2.values() and name not in:oldsku2 ];
        for(FIX_SKU__c f :fixsku2)
        {
            fixskulist.add(new wrap(f));
        }
       
    }
    public void addtolistbtn()
    {
        finallist = new list<wrap>();
        for(wrap a:salesrec)
        {
            if(a.salescheck == true)
            {
               finallist.add(a); 
            }
        }
        for(wrap a:oldsuklist)
        {
            if(a.oldcheck == true)
            {
               finallist.add(a); 
            }
        }
        for(wrap a:fixskulist)
        {
            if(a.fixcheck == true)
            {
               finallist.add(a); 
            }
        }
        
    }
    

}