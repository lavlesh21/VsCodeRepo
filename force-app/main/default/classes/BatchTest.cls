public class BatchTest {
    public id batchid{set;get;}
    public string idofatt{set;get;}
    public string idofattechment{set;get;}
    public batchTest()
    {
        string jobid = ApexPages.currentPage().getParameters().get('myId');
        system.debug('jobid===>>'+jobid);
        /*
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                          TotalJobItems, CreatedBy.Email,createdDate
                          FROM AsyncApexJob order by createdDate desc limit 1 ];
        */
        if(jobid !=null)
        {
           list<Attachment> atch = [select id,Description from Attachment where Description=:jobid];
            system.debug('idofattechment===>>'+atch);
            //system.debug('atch===>>'+atch);
        }
        
        
        //account acc =[select id,(select id,Description from Attachments where Description=:jobid order by createdDate desc) from account where id=:'0016F00003DXeyJ'];
       /* if(string.valueOf(a.id) == string.valueOf(acc.Attachments[0].Description) )
        {
            idofatt = string.valueOf(acc.Attachments[0].id);
        }
        if(batchid != null)
        {
            system.debug('idofatt===>>'+batchid);   
        }
        system.debug('a.id===>>'+a.id);
		
        if(acc.Attachments.size() >0)
        {
            idofattechment=string.valueOf(acc.Attachments[0].id);
        }
        
        */
    }
    public PageReference btn()
    {
        Batchfortest ab = new Batchfortest();
        Id batchProcessId= database.executeBatch(ab,2);
        PageReference pageRef = ApexPages.currentPage();
        pageRef.getParameters().put('myId', batchProcessId);
        pageRef.setRedirect(true);
        return pageRef;
        

    }
    public void btnvalue()
    {
        string jobid = ApexPages.currentPage().getParameters().get('myId');
        list<Attachment> atch = [select id,Description from Attachment where Description=:jobid order by createdDate desc ];
        idofattechment = atch[0].id;
    }
    
    
    
}