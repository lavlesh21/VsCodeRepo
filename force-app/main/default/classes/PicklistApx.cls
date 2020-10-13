public class PicklistApx {
    public string TypeofAccount{Set;get;}
    public list<wraperclass> recordlist{Set;Get;}
    public list<Account> reclist{Set;Get;}
    public list<Account> Accountlist {set;get;}
    public Account records;
    public PicklistApx(ApexPages.StandardController controller) {
        
        records= (Account)controller.getRecord();
    }
    
    public class wraperclass{
        public Account acc {get;set;}
        public Boolean selected {get; set;}
        public wraperclass(Account ab) 
        	{
                acc = ab;
                selected = false;
        	}
        
    }
    public list<SelectOption> getaccountname(){ 
        list<SelectOption> acc = new list<SelectOption>();
        acc.add(new selectOption('','----Select------'));
        for(Account a:[select id,Name from Account])
        {
         acc.add(new selectOption(a.id,a.name));   
        }
     return acc;   
    }
    
    public PageReference Go(){
       TypeofAccount = records.Type;
       recordlist =new list<wraperclass>();
       Accountlist =[select id,name,type,phone from Account where Type =:TypeofAccount];
       for(Account records : Accountlist)
        {            
            recordlist.add(new wraperclass(records));            
        }
       return null;
    }
    public PageReference AddList(){
        reclist = new list<Account>(); 
        for(wraperclass abc : recordlist)
        {
            if(abc.selected == true) 
             {
                reclist.add(abc.acc);
                                
             }
        }
        
        System.debug('aaaaaaaaaa------>>>>'+reclist);
        return null;
    }
  
}