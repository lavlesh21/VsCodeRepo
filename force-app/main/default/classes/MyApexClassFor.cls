public class MyApexClassFor
{
list<Account> acts;
public List<Account> getacts(){
    return acts;

}

public PageReference Customer(){

    acts=[select Name,type,Industry,Fax from Account where Type='Customer - Direct'];
    return null;
}

public PageReference Prospact(){

    acts=[select Name,type,Industry,Fax from Account where Type='prospect'];
 return null;   
}
}