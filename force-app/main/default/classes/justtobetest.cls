public class justtobetest {
    public list<FIX_SKU__c> f{set;get;}
    public string idof;
    public justtobetest()
    {
        idof =ApexPages.currentPage().getParameters().get('id');
         f =new list<FIX_SKU__c>();
        f =[select id,name,test__c, price__c from FIX_SKU__c where id=:idof];
    }
    
    public void go()
    {
      	FIX_SKU__c  fx = new FIX_SKU__c();
        fx.Name = f[0].name;
        fx.test__c = f[0].test__c;
        fx.price__c = f[0].price__c;
        fx.Id = idof;
        update fx;
    }

}