trigger TriggerAcc on Account (After INSERT) {
    list<Contact> acc = new  list<Contact>();
    for(Account abc :Trigger.New)
    {
        Contact con = new Contact();
        con.AccountId=abc.id;
        con.LastName = abc.Name;
        acc.add(con);   
    }
    insert acc;

}