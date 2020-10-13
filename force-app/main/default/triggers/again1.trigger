trigger again1 on Account (after insert) {
 
    list <contact> conin = new list<contact>();
    contact con = new contact();
    for (account a : Trigger.new)
    {
        con.Accountid =a.id;
        con.LastName=a.Name;
        conin.add(Con);
        
    }
    upsert conin;
    
}