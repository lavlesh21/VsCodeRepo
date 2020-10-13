global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        list<lead> led= [select id from lead where LeadSource=''];
        for(lead l :led)
        {
           l.LeadSource ='Dreamforce';
        }
        update led;
    }
    
}