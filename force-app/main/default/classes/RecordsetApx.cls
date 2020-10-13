public class RecordsetApx {
    public list<Merchandise__c> rec{set;get;}
    public RecordsetApx(ApexPages.StandardsetController controller)
    {
        rec = [select name from  merchandise__c];
    }

}