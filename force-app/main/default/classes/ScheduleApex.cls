global class ScheduleApex implements Schedulable 
{
 global void execute(SchedulableContext SC) 
{
 restclloutxmlwithschedule cb = new restclloutxmlwithschedule(); 

 database.executeBatch(cb,10);
 }
}