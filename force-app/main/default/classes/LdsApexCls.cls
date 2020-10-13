public class LdsApexCls {
   @AuraEnabled
    public static void fun1(id recid )
    {
        system.debug('recid==>>'+recid);
    }

}