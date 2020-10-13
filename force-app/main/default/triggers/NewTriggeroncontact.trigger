trigger NewTriggeroncontact on Contact (before update) {
    for(contact con:trigger.new)
    {
        if(trigger.oldMap.get(con.Id).Lastname==con.lastName)
        {
           con.adderror('hello');
        }
    }
    
    
    

}