global class ScheduleApexclass implements Schedulable {
    
global void execute(SchedulableContext SC) 
{
 	batchforxml cb = new batchforxml(); 
 	database.executeBatch(cb,10);
 }
}