public class WizardForContact 
{
 public List<Contact> contacts{get; set;}
 public string contactName{get; set;}   
 public list<contact> selectCon{get; set;}   
 public string conId{get; set;}   
 public WizardForContact(ApexPages.StandardController std)
  {
   
     contacts=[select id, name from contact];
  }
  public PageReference go()
  {
     selectCon= new list<contact>(); 
     selectCon=[select name,Phone from contact where id = :conId];
     return Page.Wizard2;
     //return null; 
  }
    
  public pageReference save()
  {
      list <contact> newList= new list<contact>();
      for(Contact c : selectCon)
      {
          contactName=c.name;
          newList.add(new contact(id=conId, Phone=c.Phone));
      }
      update newList;
    return Page.Wizard3; 
   //return null; 
  }
    
}