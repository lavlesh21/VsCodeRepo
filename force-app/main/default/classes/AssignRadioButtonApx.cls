public class AssignRadioButtonApx 
{
 public List<Contact> contacts{get; set;}   
 public list<contact> selectCon{get; set;}   
 public string conId{get; set;}   
 public AssignRadioButtonApx(ApexPages.StandardController std)
  {
   
     contacts=[select id, name from contact];
  }
  public PageReference go()
  {
     selectCon= new list<contact>(); 
     selectCon=[select name,Phone from contact where id = :conId];
     return Page.AssignRadiovf2;
     //return null; 
  }
    
  public pageReference Next()
  {
      list <contact> conlist= new list<contact>();
      for(Contact c : selectCon)
      {
         
          conlist.add(new contact(id=conId, Phone=c.Phone));
      }
      update conlist;
    return Page.AssignRadiovf3; 
   //return null; 
  }
    
}