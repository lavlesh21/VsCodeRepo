trigger countcon on Contact (after insert,after update, after delete, after undelete) {

    if (trigger.isupdate)
    {
        list<id> ids2= new list<id>();
        
        for(contact cont:trigger.old)
        {
        
            ids2.add(trigger.oldmap.get(cont.id).accountid);
        }
        list<contact> acc = [select id from contact where Accountid in :ids2];
        list<Account> account = new list<Account>();
        account.add(new Account(No_of_Childs__c =acc.size(),id= ids2[0]));
        update account;
        
    }
    else
    {
        if(trigger.isdelete)
        {
            list<id> ids = new list<id>();
        for(contact co : trigger.old)
        {
         ids.add(co.accountId);   
        }
        list<contact> acc =[select id,accountid from contact where accountid in :ids ];
        Account ac = new Account();
        ac.No_of_Childs__c = acc.size();
        ac.id =ids[0];
        update ac;
        }
        else
        {
            list<id> ids = new list<id>();
        for(contact co : trigger.new)
        {
         ids.add(co.accountId);   
        }
        list<contact> acc =[select id,accountid from contact where accountid in :ids ];
        Account ac = new Account();
        ac.No_of_Childs__c = acc.size();
        ac.id =acc[0].accountid;
        update ac;
        }
    }

}