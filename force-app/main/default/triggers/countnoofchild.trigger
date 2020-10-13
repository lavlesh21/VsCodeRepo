trigger countnoofchild on Contact (after insert,after update,after delete,after undelete) {
    if(trigger.isupdate)
    {
        list<id> idofacc = new list<id>();
       for(contact c: trigger.new)
       {
           idofacc.add(trigger.oldmap.get(c.id).AccountId);
       }
    }
    else
    {
        if(trigger.isdelete)
        {
        list<id> idsofchilld = new list<id>();
        for(contact con :trigger.old)
        {
            idsofchilld.add(con.Accountid);
        }
        
        list<contact> acc = [select id from contact where Accountid in :idsofchilld];
        list<Account> account = new list<Account>();
        account.add(new Account(No_of_Childs__c =acc.size(),id= idsofchilld[0]));
        update account;
        }
        else
        {
            list<id> idsofchilld = new list<id>();
        for(contact con :trigger.new)
        {
            idsofchilld.add(con.Accountid);
        }
        
        list<contact> acc = [select id from contact where Accountid in :idsofchilld];
        list<Account> account = new list<Account>();
        account.add(new Account(No_of_Childs__c =acc.size(),id= idsofchilld[0]));
        update account;
            
        }
        
    }

}