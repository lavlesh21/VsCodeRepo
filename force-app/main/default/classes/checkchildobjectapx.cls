public class checkchildobjectapx {
    public list<Merchandise__c> mer;
    
    public void go()
    {
        mer =new list<Merchandise__c>();
        system.debug('hello ====>>>'+SObjectType.Merchandise__c.getChildRelationships());
        Map<Id, List<SObject>> m = new Map<Id, List<SObject>>();
        for(Merchandise__c merch :[select id,(select id from LineItems__r) from Merchandise__c])
        {
            m.put(merch.Id, merch.LineItems__r);
        }
        system.debug('account  '+m);
    }
        
}