@isTest
private class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        
        List<lead> opptys = new List<lead>();
        for (Integer i=0; i<200; i++) {
            lead o = new lead(
                LastName='testlead'+i,
                Company ='tset company',
                Status = 'Open - Not Contacted'
            );
            opptys.add(o);
        }
        insert opptys;
        
        
        Test.startTest();
        
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        
        
        Test.stopTest();
        
    }
}