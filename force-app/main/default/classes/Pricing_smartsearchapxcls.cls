global class Pricing_smartsearchapxcls
{
	public static List<String> leadNameList{get;set;}
    public String lName{get;set;}
    public String successMessage{get;set;}
    @RemoteAction
    global static String[] populateAccount(String value)
    {
        try
        {
            leadNameList=new List<String>();
            if(String.isNotBlank(value))
            {
                value= '%'+value+'%';
                List<Account> lstLead=[Select Id,name from Account where name LIKE:value];
                for(Account l:lstLead)
                {
                    leadNameList.add(l.name);
                }
            }
            return leadNameList;
        }
        catch(Exception e){}
        
        return null;
    }
    
}