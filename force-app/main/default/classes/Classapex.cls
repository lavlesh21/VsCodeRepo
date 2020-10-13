public class Classapex { 
    
     public void contactFieldsConcat(){
      List<Account> lst_acc =  [SELECT Account.Name,(SELECT Contact.Name FROM contacts) FROM Account limit 2];
         system.debug('lst_acc===='+lst_acc);
	}

}