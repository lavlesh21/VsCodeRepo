public class MyApexclass {
list<Account> accts;
   
    public PageReference abc() {
    accts =[select Name,Type,Industry,Fax,Phone from Account where type='Prospect'];
    
        return null;
    }



list<Account> accts1 =[select Name,Type,Industry,Fax,Phone from Account where type='Prospect'];
list<Account> accts2 =[select Name,Type,Industry,Fax,Phone from Account where type='Customer - Direct'];


    public list<Account> getAcct2() {
        return accts2;
    }


    public list<account> getAcct1() {
        return accts1;
    }

}