public class testclassforpicklist {

    public void fun()
    {
        Schema.DescribeFieldResult F = Account.Industry.getDescribe();
		List<Schema.PicklistEntry> P = F.getPicklistValues();
        for(Schema.PicklistEntry a:P)
        {
           if(a.isActive())
        {
            system.debug('yes');
        }
        else
        {
           system.debug('no');
        } 
        }
        
        
    }
  


}