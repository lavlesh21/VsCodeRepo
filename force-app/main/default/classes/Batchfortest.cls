global class Batchfortest implements Database.Batchable<sobject>, Database.Stateful {
    list<string> acclist = new list<string>();
    public boolean flag= false;
    global list<account> start(Database.BatchableContext BC){
        list<account> acc = [select id,name from account];
        return acc;  
    }
    
    global void execute(Database.BatchableContext BC, List<account> scop) {
        for(account a:scop )    
        {
            acclist.add(string.valueof(a));  
        }
        database.SaveResult[] myResult=database.update(scop,false);
        for(Integer i=0; i < myResult.size(); i++) {
            if(!myResult.get(i).isSuccess()) {
                flag = true; 
            }
        }
    }
    global void finish(Database.BatchableContext BC) {
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                          TotalJobItems, CreatedBy.Email
                          FROM AsyncApexJob WHERE Id =:BC.getJobId()];
        
        if(a.Status =='Completed' && flag == false )
        {
            string abc='';
            for( string ab :acclist)
            {
                abc = abc+ab;
            }
            Blob txtBlob = Blob.valueOf(abc); 
            Attachment attach = new Attachment();
            attach.Name ='text.xml';  
            attach.Body = txtBlob;
            attach.ParentId ='0016F00003DXeyJ';    
            attach.ContentType= 'application/xml';
            attach.Description = a.id;
            insert attach;
            
        }
  
    }
    
    
}