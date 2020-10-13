public class assignmentapx {
   public  list<contact> recordsofcontact {set;get;}
    public assignmentapx()
    {
		recordsofcontact =[select id,name,email,fax,phone,MobilePhone from contact ];        
    }
    public List<SelectOption> getidofcontact()
    {
         List<SelectOption> options = new List<SelectOption>();
        list<contact> con =[select id from contact];
        for(contact c:con)
        {
            options.add(new SelectOption(c.id,c.id));
        }
        return options;
    }

}