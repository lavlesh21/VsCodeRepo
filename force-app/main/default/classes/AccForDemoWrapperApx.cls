public class AccForDemoWrapperApx 
{
 public Account acc;  
 public List<wrapAccount> wrapAccountList {get; set;}
 public List<wrapAccount> wrapAccountList1 {get; set;}
 public List<wrapAccount> Demofinal {get; set;}
 public List<wrapAccount> Demofinal1 {get; set;}
 public list<Account> selectedAcc{get;set;} 
 public list<Merchandise__c> selectedAcc1{get;set;}
 public list <Account> accname{get; set;} 
 public list <Merchandise__c> mername{get; set;}
 public list<Account> acTobeAdded =  new list <Account>();    
 public list<selectOption> b1;
    
 public AccForDemoWrapperApx(ApexPages.StandardSetController std)
 {
     Acc=(account)std.getRecord();
 }
    
    public list<SelectOption> getTypee()
    {
        b1=new list<SelectOption>();
        b1.add(new SelectOption('','--None--'));
        Account []t=[select name,type from account];
        for(Account t1:t)
        {
            b1.add(new SelectOption(t1.name,t1.name));
        }
        return b1;
    }
    public void go()
    {
       wrapAccountList = new list <wrapAccount>();
         wrapAccountList1 = new list <wrapAccount>();
        mername= new list<Merchandise__c>();
       accname = new list<Account>();
       accname=[select name,type from account where type= :acc.Type]; 
       
       mername =[select name from Merchandise__c];
      
       for(account records : accname)
        {            
            wrapAccountList.add(new wrapAccount(records));
                     
        }
        for(Merchandise__c records1 : mername)
        {   
            	wrapAccountList1.add(new wrapAccount(records1));
        	            
        }
        
        demoFinal1= new list<wrapAccount>();
        list<Merchandise__c> selectedAcc1= new list<Merchandise__c>();
        for(wrapAccount wamer : wrapAccountList1)
        {
            
                selectedAcc1.add(wamer.merch);
           
        }
        for(Merchandise__c ab : selectedAcc1)
        {
            demoFinal1.add(new wrapAccount(ab));
        }
    }
    
    public class wrapAccount
    {
        public list<account> accname{get;set;}
        public Merchandise__c merch{get;set;}
        public account acc {get; set;}
        public Boolean selected {get; set;}
        public Boolean selected1 {get; set;}
        public string name{get;set;}
        public string Type{get;set;}
        
        public wrapAccount(account a) 
        {
            acc = a;
            selected = false;
            this.name=a.Name;
            this.type =a.type;
            
            
        }
       public wrapAccount(Merchandise__c mer) 
        {
            merch = mer;
            this.name=mer.Name;
            this.type ='N/A';
            selected1 = false;
              
        }
        
    }
    
    public void addToList()
    {
       
        selectedAcc= new list<Account>();
        selectedAcc1= new list<Merchandise__c>();
        demoFinal= new list<wrapAccount>();
        acTobeAdded=[select name,type from account where type= :acc.Type];
        for(wrapAccount wa : wrapAccountList)
        {
            if(wa.selected==true)
            {
                selectedAcc.add(wa.acc);
            }
        }
        for(Account a : selectedAcc)
        {
            demoFinal.add(new wrapAccount(a));
        }
        
        
        for(wrapAccount wa : demoFinal1)
        {
            if(wa.selected1==true)
            {
                selectedAcc1.add(wa.merch);
            }
        }
        for(Merchandise__c a : selectedAcc1)
        {
            demoFinal.add(new wrapAccount(a));
        }
    }
    
}