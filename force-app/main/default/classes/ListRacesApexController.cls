public with sharing class  ListRacesApexController {
   @AuraEnabled
	public static list<Race__c> getRacesDB()
    {
        return [select id,name,type__c,Attended__c,DateTime__c,Result__c from Race__c];
    }
}