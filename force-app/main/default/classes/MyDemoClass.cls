global with sharing class MyDemoClass {

   
    public id  idofdec {set;get;}
    public Account acct;
    public PageReference save() {
    
        update acct;
        return null;
    }
    
    webservice static String getContextUserName() {
        system.debug('hello java');
        return UserInfo.getFirstName();
        
   }
    
    public MyDemoClass()
    {
       document doc = [select id from document where name ='Warehouse logo'];
        idofdec = doc.Id;
        system.debug('idofdec==>>'+idofdec);
        
    
    }
     public Account getAccount() {
        return acct;
    }

}