public class Utility {
    
   
    public static void getParentRoleId(string roleIds,string OPPname,decimal Amount,date closeddate,string ownername) {
        map<id,UserRole> userrolemap= new map<id,userrole>();
        list<userRole> userrolerec =[select id,ParentRoleId,(select id,name,email from users) from UserRole];
        boolean tempflag = false;
        string parantrecid =roleIds ;
        list<string> emaillist = new list<string>();
        list<id> parentroleid = new list<id>();
        while(!tempflag)
        {
            decimal i=0;
            for(userRole u:userrolerec)
            {
                if(u.id==parantrecid)
                {
                    if(parantrecid != roleIds)
                    {
                        for(user ur:u.users)
                        {
                            emaillist.add(ur.email); 
                        }
                    }
                    
                    if(u.ParentRoleId != null) 
                    {
                        parantrecid = u.ParentRoleId;
                        parentroleid.add(u.ParentRoleId);
                        i++;
                    }
                    
                }  
            }
            if(i==0)
            {
                tempflag = true;
            }
        }
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            
           
            mail.setSubject('Big Deal Alert');
       	    mail.setToAddresses(emaillist);
            String body = 'Hi All,' ;
            body += 'Great team work, we have won the order '+ OPPname +'! \n\nHere are the details -  \n Amount: '+ Amount +
                '\n Close Date: '+closeddate + '\nOwner: '+ ownername	+ '\n\n Link to Opportunity - ' +	
                '\n\nRegards,' + '\n' +ownername;
            
            mail.setHtmlBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
            
        
    }
    
    
    public static set<string>  getRoleSubordinateUsers(Id roleId) {
    Set<Id> allSubRoleIds = getAllSubRoleIds(new Set<ID>{roleId});
    set<string> useremail = new set<string>();
    list<User> users = [Select Id, Name,email From User where
      					UserRoleId IN :allSubRoleIds];
        for(user u :users)
        {
            useremail.add(u.email);
        }
        system.debug('useremail->'+useremail);
        return useremail;

  }

  private static Set<ID> getAllSubRoleIds(Set<ID> roleIds) {
    Set<ID> currentRoleIds = new Set<ID>();
    for(UserRole userRole :[select Id from UserRole where ParentRoleId
      IN :roleIds AND ParentRoleID != null])
    currentRoleIds.add(userRole.Id);
    if(currentRoleIds.size() > 0)
      currentRoleIds.addAll(getAllSubRoleIds(currentRoleIds));

    return currentRoleIds;

  }
    
    
    public static selectOption[] populateAvailUsers(Set<ID> roleIDs){

        SelectOption[] alias = New SelectOption[]{};
        Map<String,ID> mUsers = New Map<String,ID>();
       // Set<ID> roleIDs = New Set<ID>{userInfo.getUserRoleID()};
        Integer MAX = 10;
        String[] uNames = New String[]{};

        String qry = 'Select ID, Name, UserRoleID,userrole.name from User Where isActive = true';

            qry += ' AND UserRole.parentRoleID IN :roleIDs'; 
		list<string> rolename = new list<string>();
        
        for(Integer x=0 ; x<MAX;x++){
            for(user u : database.query(qry)){
                mUsers.put(u.name,u.id); //Stores the results
                roleIDs.add(u.UserRoleID); //Keeps track of the roles needing to query for child roles
                rolename.add(u.userrole.name);
                
            }
        }
        system.debug('hh-->>'+rolename);
        


        uNames.addAll(mUsers.keySet()); //Sort names alpha
        uNames.sort();
		system.debug('uNames-->'+uNames);
        for(String s : uNames)  //Create select options  
            alias.add(New SelectOption(mUsers.get(s),s));
        system.debug('alias-->'+alias);

        return alias;


}
}