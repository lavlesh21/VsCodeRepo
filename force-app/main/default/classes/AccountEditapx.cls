public with sharing class AccountEditapx {
    @AuraEnabled
    public static list<Account> saveAccount (Account acc) {
        return [select id,Name from Account limit 5];
    }
}