trigger Triggerforpicklist on picklist__c (after update) { 
   list<picklist__c>  a = new list<picklist__c>();
    for(picklist__c ab :trigger.new)
    {
        picklist__c abc = new picklist__c();
        abc.id = ab.Id;
       // abc.name ='111';
        //if(string.valueof(ab.value__c)== string.valueOf(trigger.oldmap.get(ab.id).value__c))
       //if(ab.Price__c == trigger.oldmap.get(ab.id).price__c)
       // {
            abc.Active__c=true;
       // }
        a.add(abc);
    }
	//update a;
}