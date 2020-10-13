trigger forDelete on Merchandise__c (Before Delete) 
{
    contact c= new contact();
    for (merchandise__c a:Trigger.new)
    c.accountid=a.name;

}