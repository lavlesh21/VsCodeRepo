public class MyApexc {

list<Account> accts1 =[select Name,Type,Industry,Fax,Phone from Account where type='Prospect'];
list<Account> accts2 =[select Name,Type,Industry,Fax,Phone from Account where type='Customer - Direct'];


    public list<Account> getAcct2() {
        return accts2;
    }


    public list<Account> getAcct1() {
        return accts1;
    }

}