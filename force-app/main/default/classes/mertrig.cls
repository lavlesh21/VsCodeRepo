public class mertrig {
    public static void insertmerchandiseArch(list<merchandise__c> m)
    {
        merchandise_Arc__c ma=new merchandise_Arc__c();
        ma.name=m[0].name;
        insert ma;
    }

}