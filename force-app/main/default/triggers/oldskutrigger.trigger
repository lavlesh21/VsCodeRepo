trigger oldskutrigger on OLD_SKU__c (after insert) {

    list<OLD_SKU__c> oldsku = new list<OLD_SKU__c>();
    for(OLD_SKU__c o : trigger.new)
    {
      oldsku.add(new OLD_SKU__c(id=o.id,
                               Price__c =111));  
    }
    update oldsku;
}