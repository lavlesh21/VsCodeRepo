public class cc2
{

    public PageReference abc() {
        return null;
    }

list<Opportunity> opt;
 public list<Opportunity> getabc()
    {
        return opt;
    }
    public PageReference abc1() {
    list<Opportunity> opt=[select Name,Amount,StageName,CloseDate,ExpectedRevenue from Opportunity where Amount<=75000];
        return null;
    }
    public PageReference abc2() {
    list<Opportunity> opt=[select Name,Amount,StageName,CloseDate,ExpectedRevenue from Opportunity where Amount>75000];
        return null;
    }
    }