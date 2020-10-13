trigger DemoTriggerforupdate on Merchandise__c (before insert) {
    list<Merchandise__c> mer1 =new list<Merchandise__c>();
    
    String mername ;
    for(Merchandise__c ab :Trigger.New)
    {
        mername =ab.name;
    }
    list<Merchandise__c> mech2 =[select name from Merchandise__c where name=:mername];
    for (Merchandise__c abcdef :mech2)
    {
    for(Merchandise__c ab :Trigger.New)
    {
        Merchandise__c abc =new Merchandise__c();
        if(mech2.size() >0)
        {
            abc.id =abcdef.id;
            abc.Name =ab.Name;
            abc.Merchandise_Price__c =ab.Merchandise_Price__c;
            update abc;
            //break;
        }
        if(ab.Name==abcdef.Name)
        {
          delete abcdef;
          // break;
        }
        
    }
    }
    
}