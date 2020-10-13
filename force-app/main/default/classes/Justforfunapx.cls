public class Justforfunapx {
    public Account records{Get;set;}
    public string contactName{set;get;}
     public Justforfunapx(ApexPages.StandardController controller) {
        
        records= (Account)controller.getRecord();
         contactName=[select name from contact where accountId=:records.id limit 1 ].name;
    }
    
    

}