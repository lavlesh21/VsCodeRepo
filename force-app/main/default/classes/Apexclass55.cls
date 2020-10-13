public class Apexclass55 {

list<Account>     abc=[select Name,type,Industry,Fax from Account where Type='Customer - Direct'];


    public list<Account> getActs() {

        return abc;
    }

}