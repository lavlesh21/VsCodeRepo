public class RaceTrackerApx {
    @AuraEnabled
    public static list<Race__c> racelist()
    {
        return [select name,type__c,Attended__c,DateTime__c,Result__c from Race__c ];
    }
    @AuraEnabled
    public static void racelisttoinsert(Race__c race)
    {
        insert race;
    }
}