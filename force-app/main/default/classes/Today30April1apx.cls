public class Today30April1apx {
    public list<LineItem__c> merchandise {set;get;}
    public list<Wrapper> wrap {set;get;}
    public Today30April1apx()
    {
       		wrap =new list<Wrapper> ();
            merchandise =[select name,id,Merchendise__r.name from LineItem__c ];
        for(LineItem__c line:merchandise)
        {
            wrap.add(new Wrapper(line));
        }
    }
    public class Wrapper
    {
        public  LineItem__c line1{set;get;}
        public boolean selectRadio{set;get;}
        public Wrapper(LineItem__c li)
        {
            line1 =li;
            selectRadio=false;
        }
    }
    
    public list<SelectOption> getaccountname()
    {
        list<SelectOption> records= new list<SelectOption>();
        list<Account> acc=[select name,id from Account];
        records.add(new selectOption('','----select-----'));
        for(Account A:acc)
        {
            records.add(new selectOption(a.id,a.name));
        }
        return records;
    }
    public Static list<Messaging.SingleEmailMessage> mail = new List<Messaging.SingleEmailMessage>();
    public void inputofajd()
    {
        
    }
    

}