global class Pricing_smartSearchapx {
    public String name{set;get;}
    public static List<String> accountlist{get;set;}
    public list<Account> records{set;get;}
    public list<Account> acc{set;get;}
    public String searchitem{set;get;}
    public list<string> accname{set;get;}
    public integer sizeoflist{set;get;}
    
    @RemoteAction
    global static String[] populateAccount(String accountname)
    {
        try
        {
            accountlist=new List<String>();
            if(String.isNotBlank(accountname))
            {
                accountname= '%'+accountname+'%';
                List<Account> acc=[Select Id,name from Account where name LIKE:accountname];
                for(Account a:acc)
                {
                    accountlist.add(a.name);
                }
            }
            return accountlist;
        }
        catch(Exception e){}
        
        return null;
    }
    public void testmethod1()
    {
        system.debug('yes');
    }
    
    public void go(){
        // String str= '%'+name+'%';
        if(name == null)
        {
            records = null;
        }
        else{
        try{
        List<List<SObject>> searchList = [FIND :name IN ALL FIELDS RETURNING Account (Id, Name)];
        records = ((List<Account>)searchList[0]);
        }
        catch(exception e){}
        //records=[select name from Account where name like:str ];
       } 
    }
    
    
    
}