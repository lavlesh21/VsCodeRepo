@isTest
public class LeadProcessorTest {
@testSetup 
    static void setup() {
        List<lead> accounts = new List<lead>();
        for (Integer i=0;i<200;i++) {
            accounts.add(new lead(lastname='Account '+i,firstname='test', 
                Company='New York', Status='Open - Not Contacted'));
        }
        insert accounts;
        
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        
    }
    

}