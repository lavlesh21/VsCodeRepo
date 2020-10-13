public class againapx {
    public list<Account> Acc {set;get;}
    public id idofacc{set;get;}
    public string Accountname{set;get;}
    public string Accountphone{set;get;}
    public string Accounttype{set;get;}
    public list<wrap> wraplist {set;get;}
    public againapx()
    {
        acc =new list<Account>();
        acc=[select id,name,phone,type from Account limit 10];
        wraplist = new list<wrap>();
        for(account a : acc)
        {
        	wraplist.add(new wrap(a));  
        }
        
        
    }
    public  class  wrap
    {
       public boolean flag{set;get;}
       public Account acc{set;get;}
       public wrap(account a )
       {
           acc =a;
           flag = false;
       }
    }
    public PageReference editlink()
    {
        system.debug('id of Account for edit :::'+idofacc);
        list<Account> a = [select name,type,phone from Account where id=:idofacc];
        Accountname = a[0].name;
        Accountphone = a[0].phone;
        Accounttype = a[0].type;
        return null;
    }
    public PageReference deletelink()
    {
        list<Account> a = [select id  from Account where id=:idofacc];
        delete a;
        return null;
    }
     public PageReference updatebtn()
     {
         
         list<Account> ac = new list<account>();
         account a= new account();
         a.name= Accountname;
         a.phone =Accountphone;
         a.type =Accounttype;
         a.id =idofacc;
         ac.add(a);
         update ac;
         return null;
     }

}