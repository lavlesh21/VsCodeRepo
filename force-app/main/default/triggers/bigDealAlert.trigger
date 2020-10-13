trigger bigDealAlert on Opportunity (after update) {
    Set<String> UserId = new Set<String>();
    for (Opportunity oppOb : Trigger.new)
    {
        UserId.add(oppOb.OwnerId);
    }

    Map<ID,User> mapUser = new Map<ID,User>( [select id,Name,email,Manager.Name,Manager.email,UserRoleId from user where id in :UserId ] );
    
    List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
    for(Opportunity opp : Trigger.new){
        if(opp.StageName=='Closed Won' && opp.Amount>=25000){  
            string roleid =/*string.valueOf(opp.Owner.UserRoleID);*/'00E6F000001jiOM';
            string ownername =string.valueOf(opp.Owner.name);
            Utility.getParentRoleId(roleid,opp.name,opp.Amount,opp.CloseDate,ownername);
            
            
            
            
            
            /*
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            
            List<String> sendTo = new List<String>();
            
            if(mapUser.get(opp.OwnerId).email!='' || mapUser.get(opp.OwnerId).email!=null){
                sendTo.add(mapUser.get(opp.OwnerId).email);
            }
            
            if(mapUser.get(opp.OwnerId).Manager.email!='' || mapUser.get(opp.OwnerId).Manager.email!=null){
                sendTo.add(mapUser.get(opp.OwnerId).Manager.email);
            }
            
            mail.setToAddresses(sendTo);
            
            // Set email contents
            mail.setSubject('Big Deal Alert');
            String body = 'Hi All,' ;
            body += 'Great team work, we have won the order '+ opp.Name +'! \n\nHere are the details -  \n Amount: '+ opp.Amount +
                '\n Close Date: '+opp.CloseDate + '\nOwner: '+mapUser.get(opp.OwnerId).Name 	+ '\n\n Link to Opportunity - ' +	
                '\n\nRegards,' + '\n' + mapUser.get(opp.OwnerId).Name;
            
            mail.setHtmlBody(body);
            
            // Add your email to the master list
            mails.add(mail);
            */
        }
    }
    
    
}