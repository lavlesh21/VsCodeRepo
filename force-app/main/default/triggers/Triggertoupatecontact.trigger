trigger Triggertoupatecontact on Account (After update) {
    list<contact> con = new list<contact>();
    list<id> idofAccount = new list<id>();
    for(account a:trigger.new)
    {
        if(trigger.oldmap.get(a.id).phone != a.phone)
        {
            idofAccount.add(a.id);
        }
    } 
    list<contact> conlist = [select id,phone,AccountId from contact where Accountid in :idofAccount];
    for(contact c: conlist)
    {
        for(Account a:trigger.new)
        {
            contact contacts = new contact();
            if(a.id == c.AccountId)
            {
               contacts.Id =c.id;
               contacts.Phone =a.Phone;
                con.add(contacts);
            }
        }
    }
    update con;

}