trigger triggertorestricted on Contact (before insert) {
    string idofaccount; 
    for(contact con :trigger.new)
    {
         idofaccount =con.AccountId;
    }
    if(idofaccount != null)
    {
      list<contact>  c =[select id from contact where accountid =:idofaccount]; 
       if(c.size() !=0)
       {
      for(contact con :trigger.new)
        {
         con.AccountId.adderror('hello you can not add multiple contact for this account ' );
        }
       }
    }

}