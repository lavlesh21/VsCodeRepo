trigger triggertocount on Contact (After insert,after delete, after update, after undelete) {
    if(trigger.isupdate)
    {
       list<id> idofcontact = new list<id>();
        for(contact con : trigger.new)
        {
            idofcontact.add(trigger.oldmap.get(con.id).Accountid);
        }
    }
    else
    {
        list<id> idofcontact = new list<id>(); 
        for(contact con : trigger.new)
            {
                idofcontact.add(con.AccountId);
            }
    }
   

}