trigger Triggeraccount on Account (before Delete) {
    List<Contact> conList =new list<Contact>();
    for(Account acc : Trigger.old)
    {
        contact con =new contact();
        con.LastName= acc.name;
        con.AssistantName= string.valueOf(acc.Id);
        conlist.add(con);
    }
    insert conlist;

}