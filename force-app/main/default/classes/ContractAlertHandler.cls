public class ContractAlertHandler {
    public static void validationAcc(list<Contract> cont)
    {
        list<id> accountid  = new list<id>();
        for(Contract con:cont )
        {
            accountid.add(con.AccountId);
        }
        list<account> accrec = [select id,(select id,EndDate from Contracts where Status ='Activated' order by enddate DESC  limit 1 ) from Account where id in :accountid];
        map<id,account> accmap = new map<id,account>();
        for(Account acc:accrec )
        {
            accmap.put(acc.id,acc);
        }
        for(Contract con:cont )
        {
            integer listsize = accmap.get(con.AccountId).Contracts.size();
            if(accmap != null && listsize >0&& accmap.containsKey(con.AccountId) )
            {
                date contractenddate=  accmap.get(con.AccountId).Contracts[0].enddate;
                
                if(contractenddate > system.today())
                {
                    con.addError('only one active contract can be activate at a time');   
                }
                
            } 
        }
    }
}