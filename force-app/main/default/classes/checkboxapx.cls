public class checkboxapx {
    public list<wrapclass> wraplist{set;get;}
    public list<wrapclass> fianllist{set;get;}
    public checkboxapx()
    {
        wraplist =new list<wrapclass>();
       list<Account> account=[select name from Account];
        for(account ab :account)
        {
            wraplist.add(new wrapclass(ab));
        }
        
        
    }
    
    public class wrapclass{
        public boolean flag{set;get;}
        public Account acc{set;get;}
        public string nam {set;get;} 
        public wrapclass(Account a)
        {
            acc =a;
            nam=a.name;
            flag=false;
        }
    }
    
    public void go()
    {
        fianllist =new list<wrapclass>();
        for(wrapclass wr:wraplist)
        {
            if(wr.flag ==true)
            {
                
               fianllist.add(wr); 
                
                
            }
        }
    }
}