public class oppComp1Apx {
    @AuraEnabled
    public static void savebtns(integer amnt,id idofrec)
    {
        list<Opportunity> opp = new list<Opportunity>();
        opp.add(new Opportunity(amount=amnt,id=idofrec));
        update opp;
    }

	@AuraEnabled
   public static integer btnvalue(id idofrec)
   {
       Opportunity op = [select amount from Opportunity where id=:idofrec];
       system.debug('op.amount==>>'+op.amount);
       return integer.valueOf(op.amount);
       
   }

}