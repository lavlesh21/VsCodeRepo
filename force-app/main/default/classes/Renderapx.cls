public class Renderapx {
     public List<Group> GroupNameList  = new List<Group>(); 
// public ContactUs__c contact;
 public String subject {set;get;}
 public string body {set;get;}
    public string queueName{set;get;} 
    public string subqueue1{set;get;}
    public string options{set;get;}


    // Create a constructor that populates the Account object
    public Renderapx () {}
    public List<SelectOption> QueueList 
    {
        get
        {
            GroupNameList  = [select  g.Email,g.Name from Group g where Type = 'Queue' and DeveloperName like 'HA_%'];

            QueueList = new List<SelectOption>();

            for(Group temp : GroupNameList)
            {
                QueueList.add(new SelectOption(temp.Email, temp.Name));
            }
                         return QueueList;
        }
        set;


    } 


    public Attachment attachment 
    {
        get
        {
            if (attachment == null)
            attachment = new Attachment();
            return attachment;
        }
        set;
    }


    public PageReference save() {

        system.debug('queueName### '+queueName);
        system.debug('subqueue### '+subqueue1);



        if(queueName == '100')
        {
            queueName = subqueue1;
        }


        boolean isAttachment = false;
        if(attachment!=null && attachment.Name!=null)
        {
            isAttachment = true;
        }


        if(isAttachment){
         //contact= new ContactUs__c(name = attachment.Name, subject__C = subject, body__C = body);
        //insert contact;
       // attachment.OwnerId = UserInfo.getUserId();
        //attachment.ParentId = contact.Id;
        //attachment.IsPrivate = false;

       // insert attachment;   
        }


        //Start: Send Email with Attachment
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[]{queueName, subqueue1};


            mail.setToAddresses(toAddresses);
            mail.setSubject(subject);
            mail.setPlainTextBody(body);

          if(isAttachment){
                 //Set email file attachments
            List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();

            // Add to attachment file list

            Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
            efa.setFileName(attachment.Name);
            efa.setBody(attachment.Body);
            fileAttachments.add(efa);


            mail.setFileAttachments(fileAttachments);

          }

            //Send email
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Created Successfully.Thank you!'));    
           // ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'Error: Unable to upload the attachment.'));

            return null;
}
}