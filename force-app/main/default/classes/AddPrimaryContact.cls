public class AddPrimaryContact implements Queueable {
    public contact conrec;
    public string accountstate;
    public AddPrimaryContact(contact con,string state)
    {
        conrec= con;
        accountstate =state;
    }
    public void execute(QueueableContext context) {
        list<Account> acc = [select id,name from Account where BillingState=:accountstate];
        list<contact> conrectoupdate = new list<contact>();
        for(Account a : acc)
        {
            contact accCloneCopy  = conrec.clone(false, false, false, false);
            accCloneCopy.AccountId = a.id;
            accCloneCopy.Lastname='abcdef'+a.id;
            conrectoupdate.add(accCloneCopy);
        }
        insert conrectoupdate;
        
    }
    
}