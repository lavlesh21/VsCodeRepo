public class MyClass {

    public Account getAcct2() {
        return null;
    }


    public Account getAcct1() {
        return null;
    }


    public Account tellme2 { get; set; }

    public Account tellme1 { get; set; }

list<Account> accts1 =[select Name,Type,Industry,Fax,Phone from Account where type='Prospect'];
list<Account> accts2 =[select Name,Type,Industry,Fax,Phone from Account where type='Customer - Direct'];


    


    public String Demo { get; set; }
}