public with sharing class DemoAppApx {
    @AuraEnabled
    public static List<Account> acclist(string NameofAccount) {
        NameofAccount= '%'+NameofAccount+'%';
        system.debug('NameofAccount===>>'+NameofAccount);
        return [SELECT Id, Name,Type  FROM account where name LIKE:NameofAccount];
    } 
}