public class ContactWithRadioController {
     public Contact contact{get;set;}
     public Id contactId{get;set;}
     public List<ContactWrapper> contactList {get; set;}
	 public Id paramforradio{get;set;}
     public ContactWithRadioController(ApexPages.StandardController controller) {
        list<contact> con =[SELECT Id,Name,Accountid,Account.Name,MobilePhone,Email FROM Contact ORDER BY createdDate DESC];
        contactList =new list<ContactWrapper>();
        for(contact records : con)
        {            
            contactList.add(new ContactWrapper(records));
                     
        } 
     }
       
        
/*        
          public PageReference getSelected() {
            
              contactId = ApexPages.currentPage().getParameters().get('id');
               contact = [SELECT Id,Name,Accountid,Account.Name,MobilePhone,Email FROM Contact WHERE id = :contactId]; 
              return null;
          }
*/          
        
          public void savingContact() {
              //UPSERT contact;
             // return null;
            //system.debug('ass'+selected);
          }
         
         public class ContactWrapper {
             public Contact con{get; set;}
             public Boolean selected{get; set;}
             public ContactWrapper(Contact c) {
                con = c;
                selected = false;
             }
         }
    
    public void show()
    {
        system.debug('paramforradio   '+paramforradio);
    }
           
  }