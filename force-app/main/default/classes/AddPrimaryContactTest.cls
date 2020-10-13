@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            accounts.add(new Account(name='Test Account'+i,BillingState='test date'));
        }
        insert accounts;
       
        
    }
    static testmethod void testQueueable() {
        Contact con = new Contact(LastName='test');
        insert con;
        AddPrimaryContact acc = new AddPrimaryContact(con,'test date');
        Test.startTest();        
        System.enqueueJob(acc);
        Test.stopTest();
    }
}