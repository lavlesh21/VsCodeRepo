public class aaaaaaaaaaaaaaaa {
    public void testbtn()
    {
        list<invoice__c> aa=[select id,Customer_email_ID__c from Invoice__c where Customer_Contact_No__c='1111111111111111'];
    		aa[0].Customer_email_ID__c='abc@xyz.com';
        	update aa;
    }
}