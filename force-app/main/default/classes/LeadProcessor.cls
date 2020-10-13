global class LeadProcessor implements 
    Database.Batchable<sObject> {
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, name from lead'
        );
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(lead l: scope)
        {
            l.LeadSource ='Dreamforce';
        }
        update scope;
    }    
    global void finish(Database.BatchableContext bc){
        
    }    
}