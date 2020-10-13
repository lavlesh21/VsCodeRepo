Trigger acctri on Account(After Insert){
    Contact c = New Contact();
    List<Contact> con = new List<Contact>();
    For(Account a:Trigger.New){
       
       c.lastname = a.name;
       c.accountid=a.id;
       con.add(c);
    }
    insert con;
}