trigger DemoTrigger on Account (before delete) {
    
  id abc;
    account con =new Account();
    
  for(Account deletedAcc : trigger.old)
  {
   abc = deletedAcc.Id;
   }
    
      list<Contact> acc = [SELECT AccountId, Name FROM Contact where AccountId=:abc];
      
for(Account deletedAcc : trigger.old)
  {      
      if(Trigger.isdelete && acc.size() > 0){
      deletedAcc.adderror('---------You can not Delete This Account------- ');
    }
  }
   
   
}