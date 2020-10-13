public class AccountsController {
    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, Type,phone FROM Account ORDER BY createdDate DESC limit 10];
    }
}