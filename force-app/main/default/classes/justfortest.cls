public class justfortest {
    public list<Wrap> wraplist{set;get;}
    public string abc {set;get;}
    public justfortest()
    {
		abc ='123536356536536' ;        
    }
    public void go()
    {
        list<OLD_SKU__c> oldsku = [select id,name,Customer__c,price__c,CreatedDate  from OLD_SKU__c ];
        list<FIX_SKU__c> fixsku =[select id,name,price__C,CreatedDate  from FIX_SKU__c ];
        wraplist = new list<Wrap>();
        for(OLD_SKU__c o :oldsku)
        {
            wraplist.add(new wrap(o));
        }
        for(FIX_SKU__c f :fixsku)
        {
            wraplist.add(new wrap(f));
        }
        system.debug('list====>>'+wraplist);
    }
    
    public class wrap
    {
        public string Name;
        public Decimal price;
        public date crdate;
        public wrap(OLD_SKU__c o)
        {
            Name = o.name;
            price =o.Price__c;
            crdate =date.valueOf(o.CreatedDate);
        }
        public wrap(FIX_SKU__c f)
        {
			Name = f.name;
			price =f.price__c;   
            crdate =date.valueOf(f.CreatedDate);
        }
    }

}