public class accounttest 
{

	public List<String> SerchAlpabet{get;set;}
	public String SearchVar{get;set;}
	public list<contact> con{set;get;}
	public list<contact> ShowCon{set;get;}
	public integer sizee{get;set;}

	public accounttest(ApexPages.StandardSetController controller)
	{ 
		SerchAlpabet=new List<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
		con=new List<Contact>();
		con=[SELECT id,name,email,MobilePhone,Birthdate from contact order by Name];
		SearchVar='All';
		ShowCon=new List<Contact>();
		for(Contact c:con)
		{
			if(SearchVar.equals('All'))
				ShowCon.add(c);
			else 
				if(c.Name.startsWith(SearchVar.toLowerCase())||c.Name.startsWith(SearchVar))
				ShowCon.add(c);
		}
		sizee=ShowCon.size(); 
		
	}

	public PageReference display() 
	{
		
		ShowCon.clear();
		for(Contact c:con)
		{
			if(SearchVar.equals('All'))
				ShowCon.add(c);
			else
				if(c.Name.startsWith(SearchVar.toLowerCase())||c.Name.startsWith(SearchVar))
				{
				   ShowCon.add(c);
				  
				}   
		   
		}
		sizee=ShowCon.size(); 
		return null;
	}
    public List<selectoption> getcustomerlist()
    {
        list<selectoption> acc =new list<selectoption>();
        acc.add(new selectoption ('','-----select----'));
        list<account> a = [select id, name from Account];
        for(account ac:a)
        {
            acc.add(new selectoption(ac.id,ac.name));
        }
        return acc;
    }
}