public class MyClassDemo22 {

    list<Account> tellme1=[select Name,Type,Industry,Fax,Phone from Account where type='Prospect'];
    list<Account> tellme2 =[select Name,Type,Industry,Fax,Phone from Account where type='Customer - Direct'];
    
    public  PageReference customer() {
        return null;
    }




    public list<Account> getTellme2() {
        return tellme1;
    }


    public list<Account> getTellme1() {
        return tellme2;
    }

}