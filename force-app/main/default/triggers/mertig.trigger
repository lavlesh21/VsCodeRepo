trigger mertig on Merchandise__c (after insert,after update,before insert,before update)
 {
   for(Merchandise__c a:trigger.new)  
       if(a.Merchandise_Stock__c < 100)
       {
          a.addError('stock should be 100');
       }
   
    
}