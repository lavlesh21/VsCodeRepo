public class c2
{
list<Opportunity> abc;
    public PageReference abc2() {
    list<Opportunity> abc=[select Name,Amount,StageName,CloseDate,ExpectedRevenue from Opportunity where Amount<=75000];
        return null;
    }
    public PageReference abc() {
    list<Opportunity> abc=[select Name,Amount,StageName,CloseDate,ExpectedRevenue from Opportunity where Amount>75000];
        return null;
    }
 
    public list<Opportunity> getabc()
    {
        return abc;
    } 
    public list<Opportunity> getabc1()
    {
        return abc;
    } 
}