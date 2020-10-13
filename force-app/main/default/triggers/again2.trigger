trigger again2 on Contact (after insert,after update, after delete,after undelete ) {
    if(trigger.isupdate)
    {
        list<id> idsofchilld = new list<id>();
        for(contact con :trigger.new)
        {
            idsofchilld.add(trigger.oldmap.get(con.id).AccountId);
        }
        list<contact> acc = [select id,accountid from contact where Accountid in:idsofchilld];
        account a = new account();
        a.Id=acc[0].accountid;
        a.No_of_Childs__c = acc.size();
        list<account> accup =new list<account>();
        accup.add(a);
        update(accup);
        
    }
    else
    {
        
    }
    

}