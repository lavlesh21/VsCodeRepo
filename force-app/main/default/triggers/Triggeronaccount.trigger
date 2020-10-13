trigger Triggeronaccount on Account (After update) {
    list<contact> con = new list<contact>();
    contact c= new contact();
    list<id> idofAccount = new list<id>(); 
   for(Account Acc:trigger.new)
   {
       idofAccount.add(acc.Id);
   }
    list<contact> conlist = [select id ,name,Phone,AccountId from Contact where Accountid in :idofAccount];
    for(contact co :conlist)
    {
        for(Account aa:trigger.new)
        {
            if(aa.id==co.AccountId)
            {
                if(trigger.oldmap.get(aa.id).Phone != aa.phone)
                {
                    c.Phone =aa.Phone;
                    c.id=co.id;
                    con.add(c);
                }
                else{
                    aa.adderror('you can not update this record');
                }
                
                
            }
           
            
        }
    }
update con;
}