trigger conUpdate on Account (before insert) {
    list<contact> con = new list<contact>();
    
    for(account acc:trigger.new)
    {
        contact c= new contact();
        c.LastName= acc.name;
        c.AccountId=acc.id;
        
        con.add(c);
        
    }
    insert con;
    
    

}